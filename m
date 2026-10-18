Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 184A91684B0
	for <linux-usb@vger.kernel.org>; Sun, 18 Oct 2026 06:26:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792304791; cv=none; b=Si+D/j6umunR8LP9tpwC//iBSkKsNVQ9B1aHIq0loWgjXbhKvBQlGQFp+0WNAUlQTOYVQdJ/RoSVZ49zgfi91/un4IGjrwnqGc3a21pbT6/lfMmBcjq+8tkugQdgg7ZN3eEniNfUD4ksAQFz1pE4z/cTzjwLAGCYdhGVd0/h4C4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792304791; c=relaxed/simple;
	bh=vRc1ATCvydNrYqxNwPXZQnBZmZCAhScDwmXf35hTkfk=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=bIm9LicSS0WihCH3G/01Kwo++HBEFQQXebje3bvh7os4/Fj+PuXjhTi/D6Px60ei+iziVd2GpxzJf2z5PFQ/8cqwUsjf7oBJTOvZJPMWTlQYi6uKlxPQDI1H51Sy+5ZKoijZqMj1pXr8x2Haf3YSuuBeSR4ijcSnHPy4b5GTeE0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=f3JMPdav; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="f3JMPdav"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D1C1F1F000C5;
	Sun, 18 Oct 2026 06:26:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792304790;
	bh=OanzI+yf2NDzIAjGrYaO7efZOwrEuS4KGgVY0TwYdqY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=f3JMPdavesX+CRDFzAyt2YuJBpdetSvUvSr3bNs1cCqwvX0Gt/p3kkCIACIlWgPc4
	 6r86uibj8BGShNJed4+wH/jt0OFCGC4Nmku4SPSUipq6AvqE2ZX0qHxkYZGPRlks3A
	 l+h8N0zlmqZCUhABi/K/tcs4Yx8Rrd7FzWQlRj36mX8Tmg7iIwUGhC8gz+6N2wzUiL
	 YHf/MYT5DtKGo/AHUqJ2c91K8KQPGamEHHI8IR/+Kp/eA4nxXV4TVYkW9Yb2oDg53Y
	 3r/Vk6ClBrm08wEN/f0OzEuN4ijqJqR5QsS2a9v3AhiO+icZCM7PUsp2kFsDT8w4qL
	 sAUUqV/nnjsmA==
Message-ID: <sashiko-outbox-175989@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net v3 2/2] net: usb: lan78xx: reject short register and
 statistics reads
Reply-To: sashiko-reviews@lists.linux.dev
To: "Wei Jie Law" <law.wei.jie@gt.tech.gov.sg>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261018062419.21921-3-law.wei.jie@gt.tech.gov.sg>
References: <20261018062419.21921-1-law.wei.jie@gt.tech.gov.sg>
 <20261018062419.21921-3-law.wei.jie@gt.tech.gov.sg>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 18 Oct 2026 06:26:29 +0000
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

> lan78xx_read_reg() and lan78xx_read_stats() read from the device into
> a freshly kmalloc()ed buffer, but only treat a negative return value
> from usb_control_msg() as an error. A device that answers with fewer
> bytes than requested leaves part or all of the buffer uninitialized,
> and those bytes are then used as the register value or the counters.
>=20
> With an emulated device on a kernel booted with init_on_alloc=3D0:
>=20
> - A reply to the statistics request that is shorter than the 188 byte
>   counter block leaves the rest of the kmalloc-192 buffer stale, and
>   ethtool -S, which needs no privileges, reports it. Before the
>   previous patch, a zero-length reply was enough: one counter pair read
>   back as 0xffffffff8a427800, the address of
>   usb_api_blocking_completion(), next to several direct map pointers.
>   With the previous patch a zero-length reply is already harmless, but
> [ ... ]
>=20
> Fixes: 55d7de9de6c3 ("Microchip's LAN7800 family USB 2/3 to 10/100/1000 E=
thernet device driver")
> Cc: stable@vger.kernel.org
> Assisted-by: LLM
> Signed-off-by: Wei Jie Law <law.wei.jie@gt.tech.gov.sg>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261018062419.2192=
1-1-law.wei.jie@gt.tech.gov.sg?part=3D2


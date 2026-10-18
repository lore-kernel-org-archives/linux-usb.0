Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2408E35F184
	for <linux-usb@vger.kernel.org>; Sun, 18 Oct 2026 06:20:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792304452; cv=none; b=Qym3JO1094hVSXeFBnC/G9rCw84j/Slso0QUkoFP096y8yAu4DWZhXmtIiQN4omqEKJYMhh+RJ49sillaTInDWviA8lhvyi7DYtR4l81JvQJbR1XNwSeavrsCm1Nj5QUT8iZbXNe2sHZIU4OS5qsAcv2EZlnWWXWdVChUJxxeYE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792304452; c=relaxed/simple;
	bh=ES4C2zlhqNHMiNFQBFLsWXNn7URqPippVLZmruJ6Wto=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=c5yZWSRjFUH68hFW+6NElj6AsVH5+lw0mvlL067YlazNzKsh4hRs7+u1THfle9HaLge4YXjQTOjiKKe4t3fnEYjaL6CTqcaFp6AyZ7aa/pbiW+d40OZll0b/Oqmp6G5+iODRAGwoSvtuimWrRraTLp6WW7+ceE1lL4QXd38Qu2g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kyZ/8k6N; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kyZ/8k6N"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DD66F1F000C5;
	Sun, 18 Oct 2026 06:20:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792304451;
	bh=LdYzHVzy8aQ302SxlwOw9vmaWPz8lhp5p97bIEmPIR8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=kyZ/8k6Ncj5ZwD/4vNPz9qdUuE8pttJ8Xo0kwJsSd+otEzhHh3+WZWaFb8S0uLMsD
	 4AluVqW+mPGkQlBpOKC3oj9k+FeBbr2OUBTh6cBV75czJtfkHoLnPLPsbP4HgtKg6H
	 oavWUvBxx0LKNNVHCl0Un9/ASQUgIKIxUvArKFYuf4VwRdT+1fgz3rv9E7MEFNazCA
	 lVn97riZGBEnKiCw07haWFzs8BZqZueK+LwumsG192pOPbXyuV19l66CqBnQSui0ME
	 IwLXFncD4pt8pVXGFYpPIknc2xdkscMsLQa5SZ2KX3Vi8kRbHY0kCY7+OtoHGhcJ/P
	 Saod3CO6Vt7yQ==
Message-ID: <sashiko-outbox-175985@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net v2 2/2] net: usb: lan78xx: reject short register and
 statistics reads
Reply-To: sashiko-reviews@lists.linux.dev
To: "Wei Jie Law" <law.wei.jie@gt.tech.gov.sg>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261018061734.19488-3-law.wei.jie@gt.tech.gov.sg>
References: <20261018061734.19488-1-law.wei.jie@gt.tech.gov.sg>
 <20261018061734.19488-3-law.wei.jie@gt.tech.gov.sg>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 18 Oct 2026 06:20:50 +0000
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

> From: Wei Jie Law <98lawweijie@gmail.com>
>=20
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
> [ ... ]
> emulated USB device (raw-gadget + dummy_hcd).
>=20
> Fixes: 55d7de9de6c3 ("Microchip's LAN7800 family USB 2/3 to 10/100/1000 E=
thernet device driver")
> Cc: stable@vger.kernel.org
> Assisted-by: LLM

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261018061734.1948=
8-1-law.wei.jie@gt.tech.gov.sg?part=3D2


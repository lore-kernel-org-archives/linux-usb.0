Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C4F13B71BB
	for <linux-usb@vger.kernel.org>; Wed, 14 Oct 2026 03:04:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791947086; cv=none; b=ig0nsEbuEmaNITxw3kW6N+6U/I0drqBdaAnrTenVrQceAiZBnKcl10YLiCygFHfYQL+fbfWW2mwKlRFCAalXPd1Tl5qBMhpuEk8rRpa45rUuyoiOKXF0Gd51jbwWPkNfdrhIK45xMiG2RSc8bbOV3D8CjlJaiWnMUGE9Fp5O98s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791947086; c=relaxed/simple;
	bh=107Fqs+Dh7aNaDWQjx/RdvuLKFRuK2abLY3xDMiwCTA=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=nWBbo5+X3MqFGGWt0aLXUeRT4Egkzr8Vb0ltopbOr3usXhVN26NqbO+l1EJGoe6U0qTCgMYkdEhQkdlXOaKBr0MDlqpR2XwjR0ua/k2jZ3taQYlR+jszkkYM5Rtn+SeI4vn91H2rq5Qe6HtqSmU06JDBeIDJE4kUzJ+BfGiq3Fc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AAq0dn4f; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AAq0dn4f"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 022CF1F00893;
	Wed, 14 Oct 2026 03:04:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791947085;
	bh=a3RV1xowPOFQhqozq6xfJvxhdB6gzbexrt+Ta4Y+Jqg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=AAq0dn4fb0kKdmLkEt/rLoG93uwLt4OnwcQu8qSO9Amb3Rltnx5HkP18N2+0AushA
	 Rw0wGyOkDvSHrLaqraRgX0XK7jd4eACqwKyuDerrN3NIOxnvzzU3J73R8KQ4rTUkZf
	 LwuB2aI0gw9IjsS3ATzyp30weMUFpIN9tnPcu+qAmu0Ia8+bor/k89bGiCiqWOJLcX
	 SULL/y2mxLQKylO5Nl+LpCnO3OO1wGXnNh97JTLdt3BlR9UVUihLj/wvqHZ1EyaCW9
	 lhoazzamGs4W5yoIbg4dhTZRkFqDvvDZr4TFgC9JUFdBIo2LtdIQyQY6kkeX/TlYAs
	 wOnnUzpJx1CiA==
Message-ID: <sashiko-outbox-170753@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net 2/2] net: usb: lan78xx: reject short register and
 statistics reads
Reply-To: sashiko-reviews@lists.linux.dev
To: "Wei Jie Law" <law.wei.jie@gt.tech.gov.sg>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261014025602.26334-3-law.wei.jie@gt.tech.gov.sg>
References: <20261014025602.26334-1-law.wei.jie@gt.tech.gov.sg>
 <20261014025602.26334-3-law.wei.jie@gt.tech.gov.sg>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 14 Oct 2026 03:04:44 +0000
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
> - A zero-length reply to the statistics request makes ethtool -S, which
>   needs no privileges, report the stale contents of the kmalloc-192
>   buffer. One counter pair read back as 0xffffffff8a427800, the
>   address of usb_api_blocking_completion(), next to several direct
>   map pointers.
>=20
> - A zero-length reply to the RX_ADDRL/RX_ADDRH reads in
> [ ... ]
>=20
> Fixes: 55d7de9de6c3 ("Microchip's LAN7800 family USB 2/3 to 10/100/1000 E=
thernet device driver")
> Cc: stable@vger.kernel.org
> Assisted-by: LLM
> Signed-off-by: Wei Jie Law <law.wei.jie@gt.tech.gov.sg>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261014025602.2633=
4-1-law.wei.jie@gt.tech.gov.sg?part=3D2


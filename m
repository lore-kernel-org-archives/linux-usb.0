Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 032D23D7A01
	for <linux-usb@vger.kernel.org>; Fri,  9 Oct 2026 08:17:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791533844; cv=none; b=MKIsX0wcTROsdl1iDWBEG6QqVgYwMCcuhkJz0BcLC0IbylvQ2B1YffmEUnkM2oMVbYhTzEyAj+9oji9DuPBc9PRKpvca5kMwxYCdjkLp98YWs6fkx6Q2UogpBLLTX/GB/kAslWCc5vV8rUV0GFcgJBdBgPb8QMli1J+mTAEfCQ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791533844; c=relaxed/simple;
	bh=E3X6i+dBRxJwSYW1Tr8jUee6S80GLbyDaahoozEC6M8=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=rBWWXX3YdBSGStx22ZwlQuj2caWPDFrSVgUZJpIiSeMbDIMhr3eH3phhhM5AKrf4xt/AHk+C1YcNJl2Seg9wJP4JlSHMpa87O/Ic5IxRO8FaXHVnSnSWrmH5gHnEqTy5SJ01x38zAAwCaf4lRHNn1NrnFT/vooxwilNuGpSNbzU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NRYZS8/3; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NRYZS8/3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BEB701F000FF;
	Fri,  9 Oct 2026 08:17:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791533842;
	bh=E3X6i+dBRxJwSYW1Tr8jUee6S80GLbyDaahoozEC6M8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=NRYZS8/3zC2Oyxek1QdT0RAD6IgGf1hxIo6hCW0j6mJOtl30CJW1oIJ1E0scRDfH9
	 amoRX0Arq2ACuUHb8oBgAuFJAqHwO7NlCmreS3WV0aQ6jYZQOBIgMZBLZYtVONNSVz
	 g+gqbsibNOeLz3lCI2ltyFnVma3zTdm2dZd/LQDoxTQ4RF3Ab6mBsILPAvCIVgYgxq
	 qFMhR2+RVbb9S9hQhcLVbLjdACGAqIZci0CaqZUu1eXuXrLuZ7dBOfARxVXpuXZUOh
	 5Dzkt2MWkcqxsHQQUDkrPqxixz3XRl/NMl46MRlEie64FN8Wa84H3IAsKZUn+aDXHX
	 TfFbZVfFs80Rg==
Message-ID: <sashiko-outbox-165067@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v6 03/10] r8152: split RTL_VER_17 into QFN68
 and QFN100 package variants
Reply-To: sashiko-reviews@lists.linux.dev
To: "Chih Kai Hsu" <hsu.chih.kai@realtek.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261008081556.47901-4-nic_swsd@realtek.com>
References: <20261008081556.47901-1-nic_swsd@realtek.com>
 <20261008081556.47901-4-nic_swsd@realtek.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 09 Oct 2026 08:17:22 +0000
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

> RTL8159 is sold in QFN68 and QFN100 packages, and only QFN68 needs
> the u2phy backup-restore patch and enables UPS (in a later patch).
> There was previously no way to tell the two apart at runtime, since
> both used the same RTL_VER_17.
>=20
> Split RTL_VER_17 into RTL_VER_17_QFN68 and RTL_VER_17_QFN100 and
> update every switch/case on RTL_VER_17 in the driver to handle both.
> Detect the package by reading the new PLA_PKG_DET register
> (0xdc48, masked with PKG_MASK =3D 0x1e) via a new __rtl_get_pkg_det()
> helper, called from __rtl_get_hw_ver() when the chip ID is 0x2020:
> pkg_det value 0x1e/0x1c selects QFN68, 0x18/0x1a selects QFN100, and
> any other value logs "Unknown package" and falls back to
> RTL_VER_UNKNOWN.
>=20
> r8159_init() gains a QFN68-only write ("Enable u2phy backup restore
> patch", 0xb99c BIT(0)) that does not apply to QFN100.
>=20
> Signed-off-by: Chih Kai Hsu <hsu.chih.kai@realtek.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261008081556.4790=
1-1-nic_swsd@realtek.com?part=3D3


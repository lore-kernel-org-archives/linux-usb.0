Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB3833D16EF
	for <linux-usb@vger.kernel.org>; Fri,  9 Oct 2026 08:17:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791533842; cv=none; b=NwnlBmEbGOzeLfV71JNoQOh08XudAKyD9vMchmDWjAnYFyK9APFn2uyZW9sT3eKnwiqwfUuT5Wuzal6nuDigFTnrlDfoZHLhyAYuauQCNIHgpbuW3gYdBAwgKUIpEzaCX8mGCVZ9nsMeLnPa2dFDMBVwyLjrJEtnUsi3uYZWlnA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791533842; c=relaxed/simple;
	bh=Bd8kChnBksNbzwpu49I62z2x3KLlTDVp+mJY6idQQec=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=XQ8/8KReOs+3Grym9oiD36aERR6B+83gKOxRYEw//7AViaFATZApI6SEz4g6It3OW+lCfq5RsYpSL8Qjk1qi2MN+a4xC58jyu8HLG/zL6rUAsBBouM/74wgoJy/QbYQijR4YiEPauJPniuYR99anAhA3+SAu0VYvFZOSclv5TIM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HmtEGBRc; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HmtEGBRc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7360D1F00893;
	Fri,  9 Oct 2026 08:17:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791533841;
	bh=SLKbbfx6ohAIWtN/RPDClGoOOaKWGMHtlLF0HQWucsc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=HmtEGBRc7+PFnBTJS+Q+bG2SbPNDXJKj3V//XvdxKUIH6r7OZawQ2gjTze5lW0Yed
	 yT/EUqlCZEi7G1M5qAvZcYcqpnZLoz7Ntcw7lV0yoQu8PesOJVpW5RRwTnEeHGuUgO
	 Aa0K1B3hV6IcFz069OqTOIXfxRinlkEILVIn676WKayyjCq5EVcAJq+GGxznpKDENC
	 kt1oCwYdOg5N0o97zzhyIOyDGXm0S7mqDgIUqsZLAmowsZV5zeTVt9vTzx9T8npZYu
	 3UmgmdocI/DnZkSZxIO54hkwioA2iIyw7bQOXJECohbrTwEmy1O2Fqpes35xgaXKO3
	 oQwIP0Xy3msIQ==
Message-ID: <sashiko-outbox-165065@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v6 06/10] r8152: split r8157_hw_phy_cfg into
 RTL8157 and RTL8159 variants
Reply-To: sashiko-reviews@lists.linux.dev
To: "Chih Kai Hsu" <hsu.chih.kai@realtek.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261008081556.47901-7-nic_swsd@realtek.com>
References: <20261008081556.47901-1-nic_swsd@realtek.com>
 <20261008081556.47901-7-nic_swsd@realtek.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 09 Oct 2026 08:17:21 +0000
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

> r8157_hw_phy_cfg() served both RTL8157 (VER_16) and RTL8159
> (VER_17_QFN68/QFN100) via a tp->version switch inside a single
> function, but per the datasheet RTL8159's PHY tuning differs from
> RTL8157's in more than the per-version blocks already captured.
>=20
> Split it into r8157_hw_phy_cfg() (VER_16 only) and a new
> r8159_hw_phy_cfg() (VER_17_QFN68/QFN100), each with its own copy of
> the shared prologue/epilogue. rtl_ops_init() assigns each one to its
> own chips only. Per the datasheet, RTL8159 diverges from RTL8157 in
> this split in several ways:
>=20
> - RTL8159 doesn't need EEE disabled before reprogramming PHY
>   parameters, so r8159_hw_phy_cfg() drops the rtl_eee_enable(tp,
>   false) call that r8157_hw_phy_cfg() keeps.
> - Since EEE isn't forced off up front, r8159_hw_phy_cfg() ends with
> [ ... ]
> mirroring the existing sram_set_bits()/sram_clr_bits(), and use the
> named OCP_POWER_CFG/EN_10M_PLLOFF/EN_ALDPS_PLLOFF macros in place of
> the raw "ocp_reg_set_bits(tp, 0xa430, BIT(0) | BIT(1))".
>=20
> Signed-off-by: Chih Kai Hsu <hsu.chih.kai@realtek.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261008081556.4790=
1-1-nic_swsd@realtek.com?part=3D6


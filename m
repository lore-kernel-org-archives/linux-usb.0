Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793336018;
	b=14IxBiMOK0YDINH8KvyMZGrvRC8L1/fwWvPPa7adccgm2fpL7Pa+IMma3xP4tCjvjtOL
	 VJGAyEYoaTNfj7ixO5RrByq2Rug5YgX8z61VaQ7m644dRWR0SNV0wzGGrG352Pg2+d5/7
	 j4v8OFaAlp6CcY10xnD3nKfGnANtDy1STvcn2kPvOPf5OSUF24rLGyo06d/iqhCbCbOFs
	 uqToskmm+Y4Idrfd8WYMCWTdmNDS13I+XacOh0GUw4EF2jjWWbcw2yGLz4O4TXUkBnGFy
	 jmJxlvYG8jcmhbpl+PPprQWWCNsdjg/LNnh+MBivfiUZENtAeLRgEI6zoJdIPBDhHBg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793336018;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=WpzQNBkCAVISQlxXiABdwlF8iGp1Tb6aINbTEZ2FiE8=;
	b=KubQhBhFRSENuHq9yFNEFNDyuhFilunNC027L/HR/YM2jJXOryv8vJ0MRshSEfpV55Rz
	 xClRnXUq5/z5sIk34neeGqQz/lEfqbFJ6rChU3Xxz9Olu51W29TZD2LSjb2kA3ldTpGtH
	 TWRNVPaTG5zBH5iZQ5d0tTUCvPBT2/2/5BDOI3c1ccDaLk3UHm42QAY/ejzF4TLUMI/mY
	 3yOrKgW6trWNOQnUegiqRs0tAeUNjh0Oxg+F7m/WNMDBOQvHZQTdADuwA1cZWOQHnPq/p
	 SdvZoMnrfF1vo3Slt4EVtLyIgxfTu592eM4CI0xlcNoxwNNvNGy/zFyj8gO+H5aMKuA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=G4wPBeg1;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4231606A31C
	for <linux-usb@vger.kernel.org>; Fri, 30 Oct 2026 04:53:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=G4wPBeg1
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 70BF11F000C1;
	Fri, 30 Oct 2026 04:53:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793336017;
	bh=WpzQNBkCAVISQlxXiABdwlF8iGp1Tb6aINbTEZ2FiE8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=G4wPBeg1umilWgLza0cd/y7E3mXa5hKcM/J6ZWzmSoh7N6tV911m77FMIOZyuqarp
	 B4pU4k+DB+zNhSPqX1wgwFwPFK/Mf3q8P0MFqAt/Fxm8CDQbbKWJFGiBpeQm63lWJ1
	 C5PxBMX58WN8Y+NPF8FCs3x6GiCGV+j8xhYnWDJfZW/jNB6vAhFtGZU/z2MkihPJii
	 uH2axqoV8mtvYDV/HK53KpnNTG6hpjDZNrKR16grlDefdeB13tjr8GhOs4TYSDG3Rd
	 A2vXl0bfIOgrNKLPrn2DGqrdmQxWKG26BA/B3GVR2FC7vBPYzLfJi1YXYvPu40qt+A
	 pQ4A4BFMk0hkw==
Message-ID: <sashiko-outbox-190327@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next 1/4] r8152: Add support for 10Gbit Link Speeds
 and EEE
Reply-To: sashiko-reviews@lists.linux.dev
To: "Birger Koblitz" <mail@birger-koblitz.de>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20260428-rtl8159_net_next-v1-1-52d03927b46f@birger-koblitz.de>
References: <20260428-rtl8159_net_next-v1-1-52d03927b46f@birger-koblitz.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 30 Oct 2026 04:53:37 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] 10G EEE advertisement incorrectly clears bit 3 in ADV2 register in=
stead of configuring ADV1.
- [High] Missing `NWAY_10000M_FULL` switch case in `r8156_ups_flags()` caus=
es incorrect firmware speed configuration.
--

commit 888cb24a1bd62bd09199a0e72a5e959941c2af81
Author: Birger Koblitz <mail@birger-koblitz.de>

r8152: Add support for 10Gbit Link Speeds and EEE

This commit adds support for 10Gbit Link speeds and 10Gbit EEE for the
RTL8159. It updates the setup routines and ethtool getters/setters.

> diff --git a/drivers/net/usb/r8152.c b/drivers/net/usb/r8152.c
> index 7337bf1b7d6a..01e65d845f87 100644
> --- a/drivers/net/usb/r8152.c
> +++ b/drivers/net/usb/r8152.c
> @@ -621,6 +621,7 @@ enum spd_duplex {
>  	FORCE_1000M_FULL,
>  	NWAY_2500M_FULL,
>  	NWAY_5000M_FULL,
> +	NWAY_10000M_FULL,
>  };

When updating link power states, r8156_ups_flags() maps the speed to USB UPS
flags using a switch statement on tp->ups_info.speed_duplex.

Since this patch introduces NWAY_10000M_FULL but does not add a correspondi=
ng
case in r8156_ups_flags(), will the 10G speed fall through to the default
case?

If it falls through, it appears the speed bits in ups_flags remain 0, which
corresponds to FORCE_10M_HALF. Could this configure the firmware and power
state for 10Mbps Half Duplex while the link is actually operating at 10Gbps?

[ ... ]

> @@ -5773,6 +5779,11 @@ static void r8156_eee_en(struct r8152 *tp, bool en=
able)
>  	else
>  		config &=3D ~MDIO_EEE_5GT;
> =20
> +	if (enable && (tp->eee_adv2 & MDIO_EEE_10GT))
> +		config |=3D MDIO_EEE_10GT;
> +	else
> +		config &=3D ~MDIO_EEE_10GT;
> +
>  	ocp_reg_write(tp, OCP_EEE_ADV2, config);
>  }

Is MDIO_EEE_10GT correctly placed in OCP_EEE_ADV2? The 10GBASE-T EEE
capability is normally defined in EEE Advertisement 1 (Register 7.60),
rather than Advertisement 2 (Register 7.62).

Also, since tp->eee_adv2 is populated using linkmode_to_mii_eee_cap2_t(),
which ignores the 10G bit, tp->eee_adv2 & MDIO_EEE_10GT might always
evaluate to false.

Does this cause the else branch to execute unconditionally and unintentiona=
lly
clear bit 3 of OCP_EEE_ADV2?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260428-rtl8159_ne=
t_next-v1-0-52d03927b46f@birger-koblitz.de?part=3D1

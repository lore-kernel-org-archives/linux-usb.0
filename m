Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 703D83A0E97;
	Wed, 14 Oct 2026 21:38:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792013886; cv=none; b=s91Bm6Xqu8fXnOasYy97aXtWLCGxxk2cD0Gw9TF9Pj/wAtnYpQ5bmaTd3lbQuqjDjoG6oQaLixajhB9X1gAjHHMq49TQeHoY/zHt1xgT+tWqgxnT9i3mTAt6mluma3B1if80GZ8XRt+zW9dGEqJgPBxNt9lVXCnhx5tgswBr6OI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792013886; c=relaxed/simple;
	bh=KuK9dGCF0RamPA98FG488F0NRaHh8l29jYwY3KysXX8=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=J+QDYXy7t43zCREs38QkB8AJmJV6dI9FS8w8k5tige0VwQ5pRAWsqcP4C3g7v0M6AuuMHOThDY2cVUTwrJo2n+9iJQ2kwznDnksz3J505ggBmMPx9g4WsXg+3lXIsZevRXcZiXBQW4rCjYqNzXBeJPCC1+uPf0peWud21aHz7tw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=S8Pxmi2h; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="S8Pxmi2h"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 40C341F000C4;
	Wed, 14 Oct 2026 21:38:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792013884;
	bh=G8mBS2W5gjfkZl3dEnxQZ2lYiAOVU9Dx05Nfvq+R5E4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=S8Pxmi2hqa5BdQLOTaWoGvkjK8yoeY9gWMO/r7gb+0AJL28odrpFfs3GNXt8YhlZt
	 GYGohhDyyzaXZ+45D26XC70IIMaEKA7VaqvHW+0keN9dWvaJ+QEm5uv1iQMNhywVhc
	 8+ULJyZ8QVUqLOALzdpdzFopTWur2tNVt6BXFeo6fOyemqcqDuPFaFtbjhS7vvG0Hv
	 2PbCBg6EsDOzcJ7XGVV9IztNvJvXwb/4KseeIePSp/CpNi9XOswt0q0DSz5QUdyZPK
	 EdEkAMO3YfttTzBBysv9FmUJvmKOt0/E4H+jofUxk3pvxHRAmH/JOlwGuo3wW8/CEm
	 pSKECB2eK8jWQ==
Message-ID: <sashiko-outbox-171930@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 3/4] arm64: dts: mediatek: Use DP AltMode defines
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sebastian Reichel" <sre@kernel.org>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261014-dp-altmode-dt-defines-v1-3-b657c9b6e4c3@collabora.com>
References: <20261014-dp-altmode-dt-defines-v1-0-b657c9b6e4c3@collabora.com>
 <20261014-dp-altmode-dt-defines-v1-3-b657c9b6e4c3@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 14 Oct 2026 21:38:03 +0000
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] dts: Build failure due to undefined macro USB_DISPLAYPORT_SVID
--

commit 7a56cd1e07f3feb11fcda2188bbcfaa9db984f17
Author: Sebastian Reichel <sebastian.reichel@collabora.com>

arm64: dts: mediatek: Use DP AltMode defines
   =20
Use the new USB-C DP AltMode defines for the SVID and the capabilities
VDO to make the DTs more readable. This also fixes up mt8390 Genio
platform incorrectly announcing UFP_D (upwards facing) support.

> diff --git a/arch/arm64/boot/dts/mediatek/mt8390-genio-common.dtsi b/arch=
/arm64/boot/dts/mediatek/mt8390-genio-common.dtsi
> index 669eaec662f33..02f8b33d64ac7 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8390-genio-common.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8390-genio-common.dtsi
> @@ -527,8 +527,12 @@ PDO_FIXED_DUAL_ROLE |
> =20
>  			altmodes {
>  				displayport {
> -					svid =3D /bits/ 16 <0xff01>;
> -					vdo =3D <0x001c1c47>;
> +					svid =3D /bits/ 16 <USB_DISPLAYPORT_SVID>;

[Severity: Low]
Is USB_DISPLAYPORT_SVID defined anywhere in the tree?

It appears this macro is undeclared, which will cause a build failure when
the Device Tree Compiler (dtc) attempts to process this file since the
preprocessor will leave the undeclared macro as a string literal.

Was the intended macro USB_SVID_DP_ALTMODE from include/dt-bindings/usb/pd.=
h?

> +					vdo =3D <VDO_DP(DP_CAP_DPAM_V2_0, DP_CAP_CABLE_TYPE_PASSIVE,
> +						      DP_CAP_UHBR_13_5_UNSUPPORTED,
> +						      DP_PIN_UFP_NONE, DP_PIN_DFP_C_D_E,
> +						      DP_CAP_USB2_USED, DP_CAP_RECEPTACLE,
> +						      DP_CAP_SIGNALLING_HBR3, DP_CAP_DFP_D)>;
>  				};
>  			};
> =20
> diff --git a/arch/arm64/boot/dts/mediatek/mt8395-genio-common.dtsi b/arch=
/arm64/boot/dts/mediatek/mt8395-genio-common.dtsi
> index aef908df530ec..3f7d57dfcf939 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8395-genio-common.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8395-genio-common.dtsi
> @@ -597,8 +597,14 @@ PDO_FIXED_DUAL_ROLE |
> =20
>  				altmodes {
>  					displayport {
> -						svid =3D /bits/ 16 <0xff01>;
> -						vdo =3D <0x00001c46>;
> +						svid =3D /bits/ 16 <USB_DISPLAYPORT_SVID>;

[Severity: Low]
Does this also need to be updated to USB_SVID_DP_ALTMODE to avoid breaking
the build for the mt8395 platform?

> +						vdo =3D <VDO_DP(DP_CAP_DPAM_V2_0,
> +							      DP_CAP_CABLE_TYPE_PASSIVE,
> +							      DP_CAP_UHBR_13_5_UNSUPPORTED,
> +							      DP_PIN_UFP_NONE, DP_PIN_DFP_C_D_E,
> +							      DP_CAP_USB2_USED, DP_CAP_RECEPTACLE,
> +							      DP_CAP_SIGNALLING_HBR3,
> +							      DP_CAP_DFP_D)>;
>  					};
>  				};
>

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261014-dp-altmode=
-dt-defines-v1-0-b657c9b6e4c3@collabora.com?part=3D3

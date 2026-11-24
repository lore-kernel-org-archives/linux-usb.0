Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795540802;
	b=wnT7KD8UtylWMUlLcNvoSRa7PINs5+HYBQxTghdry0nwWr5QWQof4q/NqQHatk5dNWwP
	 RltKLA1dcB+9GfZKMZXKs1hE22o7LOivz4VWGa0KUkT4JPo0H/FJNnVQH5F1iCf839XHS
	 VYQvENiPW8gpJM7ANU/+6GvAge/C2QqIOZqqRliVp/lQtgjnWrrp2dgApuI8Z4xKm+9cE
	 puiRZ1rkZxDf4trOzvwbr+QMl9lG6RPte3YJ3g7T1AeSXVDKLEGPAJOFYWUIPJ2eM67u1
	 w5uzocqvhy+OtDeAkjNDGlTV+soIILw9GjFIC6oNclPFdeEx9RiS7nOIGnD7n5Dhw/g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795540802;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=yJXaOTLPADS0eHWQhkP2EKhKD6OL+acnlix42B9TF2o=;
	b=KOwNaqS3DSDLpEfiFPXBiveEfLM6vC50Lv1JNLdw+Gz5MSgjVfYIEMZu8A+bXyEiKNP2
	 rbNUwIq7YuOJCYownqF6qB3tGr3byL2nW33TYx7E9VGa1nB5behjS4oAgrwpiS2ee4UQJ
	 aa6MJ/LVbcDBLQvDU5/hDJw3n47By8WYCOfMh2qQKvLEaj2hctHESeQZDQGpdEqRoWb8x
	 H99iyYa1FIMAF3YsC5AKJjBIAgvmHvMub10a3/h2cUuP6lnS2TBZ+rNZCVKW2kBfpfnr7
	 a87YAacrCV3Di08/6TXTxi7RJFeGnAZB23ygavvB73QFjoj+pMpEkHHqX5IiIRljPDQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=X4JOfDNB;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B025606A33F;
	Tue, 24 Nov 2026 17:20:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=X4JOfDNB
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C824F1F000CF;
	Tue, 24 Nov 2026 17:20:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795540801;
	bh=yJXaOTLPADS0eHWQhkP2EKhKD6OL+acnlix42B9TF2o=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=X4JOfDNB1H27N6Mt7lKKxUI3ebOzh/iGospMnEIkX0luEqvDHXdTunpGrieWu4C4F
	 wvqFzqM/V4zVBP4NRZSpVdFjO5I1owRODUbTlkzTAzGKGK6TtMhz0F0JrGygMh61+7
	 i20hdscuJiohYi905ZGFBmaCka4GqXK078P3r4I+A8Nfm+53qRIskX1Ii0ybLCY4VL
	 Av/RKrThl8K2SP0DfDP0H4lWG9XqOng3Qos6KB2/907UvQmAq66nYl4iUT7jdsmaLg
	 pYGH8jsMqfq0Z9tIkmXu5TTE0RXI0KicE0JH1D6GrgiqnOeh7V97Dv5mNTeZu956+/
	 7BRV+YxK/F9Ig==
Message-ID: <sashiko-outbox-231687@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 1/2] arm64: dts: exynos: exynos7885-gta3xllte: Enable
 USB support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Umer Uddin" <umer.uddin@mentallysanemainliners.org>
Cc: linux-phy@lists.infradead.org, devicetree@vger.kernel.org, linux-usb@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, vkoul@kernel.org, neil.armstrong@linaro.org, olteanv@gmail.com
In-Reply-To: <20261124-gta3xllte-usb-battery-v2-1-80bdcb1753bb@mentallysanemainliners.org>
References: <20261124-gta3xllte-usb-battery-v2-0-80bdcb1753bb@mentallysanemainliners.org>
 <20261124-gta3xllte-usb-battery-v2-1-80bdcb1753bb@mentallysanemainliners.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 24 Nov 2026 17:20:00 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [High] arm64: dts: exynos: undefined usbdrd labels break
  exynos7885-gta3xllte.dtb build
--

commit 24934dd2a8cdf511d5db081b71441ee2a295b40b
Author: Umer Uddin <umer.uddin@mentallysanemainliners.org>

arm64: dts: exynos: exynos7885-gta3xllte: Enable USB support

This commit adds a fixed dummy regulator and enables the USB controller and
PHY in peripheral mode for the Samsung Galaxy Tab A 10.1 (2019).

> diff --git a/arch/arm64/boot/dts/exynos/exynos7885-gta3xllte.dts b/arch/a=
rm64/boot/dts/exynos/exynos7885-gta3xllte.dts
> index 03476f8b1200b..57df878cb5633 100644
> --- a/arch/arm64/boot/dts/exynos/exynos7885-gta3xllte.dts
> +++ b/arch/arm64/boot/dts/exynos/exynos7885-gta3xllte.dts
[ ... ]
> @@ -127,3 +133,19 @@ key_volup: key-volup-pins {
>  		samsung,pin-drv =3D <EXYNOS5420_PIN_DRV_LV1>;
>  	};
>  };
> +
> +&usbdrd {
> +	vdd10-supply =3D <&reg_dummy>;
> +	vdd33-supply =3D <&reg_dummy>;
> +
> +	status =3D "okay";
> +};
> +
> +&usbdrd_dwc3 {
> +	/* Force to peripheral until we have Type-C working */
> +	dr_mode =3D "peripheral";
> +};
> +
> +&usbdrd_phy {
> +	status =3D "okay";
> +};

[Severity: High]
Are the usbdrd, usbdrd_dwc3, and usbdrd_phy labels defined in
arch/arm64/boot/dts/exynos/exynos7885.dtsi?  Neither exynos7885.dtsi nor
the files it includes define these nodes, so building
exynos7885-gta3xllte.dtb with CONFIG_ARCH_EXYNOS enabled fails in dtc with
missing label errors.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261124-gta3xllte-=
usb-battery-v2-0-80bdcb1753bb@mentallysanemainliners.org?part=3D1

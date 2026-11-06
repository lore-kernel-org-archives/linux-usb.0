Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794006708;
	b=OGAXyD4dWA/OTpBYu9jYvc+hpMuHPPZIgzV0Y0HpBQp/yiH2lniJPOnIs2RMKcF7uXq+
	 Jd9x11Ra9SU3QawpH/dPyqH9TmtaqYxeIk3MPVZvk4cwR9asb0PwtWO+esRHMTPdrySIZ
	 sOFcPQHFxMBZtUoX69difRujyqHI92jeuFpLwxt1uppqGVN/3A3iAs1COHxWQt4VUNboY
	 aYWhgMy7bKCvgwGONLSr8EWMQwxP4jy0ZHefeHn1JF1lvorgvlxaBDrMgboFJ/Vn9uoVC
	 SA7nNGieK8IxOoIZXMm4TW/lIZxor22jF4lWZ2FQ3T/VQx1bPpbDkMvpv3XiSu6/Mhw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794006708;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=5emAULrIuLdeLPvKOFL5TUtSEWV3P+7abWnG1Y2F2F8=;
	b=uMYsOadZlDxgrldl4+c/G8W4EJxxVh0MAQ3T16COINLybJAWTZD6FC4Guy9MVmg2m2zh
	 Xz4aTtQMOmgpQbByvM4u2VdfZGsNTh2tUTerV0LNWCW/KImVzCE1RQTzZCrDX1NTpVL1/
	 NDGRY05knU2o9AnKqsNd4PoQREKkyhOwz3icSaIvtxhCEorzc90kz6zdiJQGtcUzwrJtg
	 SlHx6JM3g5noyI+/RdxwM3VmmbmAbvQMA1l9JVh1n5Yl9it9Ne552p7sqOdNtR6XineDa
	 etfUB45aUgnw5cr4Zvjl5yJWRmfH4tUImg+06Fup4cVYgv6JtYA+kA5FwCEq6WHIb2Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DGHoFoqG;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E9F2606A326
	for <linux-usb@vger.kernel.org>; Fri,  6 Nov 2026 23:11:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DGHoFoqG
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A4FFB1F0089F;
	Fri,  6 Nov 2026 23:11:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794006707;
	bh=5emAULrIuLdeLPvKOFL5TUtSEWV3P+7abWnG1Y2F2F8=;
	h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
	b=DGHoFoqGP4UVwKd50inOHwxqgWX9kFq5oH1VJljNe9pbo6XCqP3aBYTjE19HiRS7N
	 7SZkiElizLeT38E4TET8Npa2o+iStXwKvAXwYbLzGLIQeGLDnCUgD9bNwsAE8yxXGQ
	 YubUihOzfQlsAJPJVT0IUiAShZ9pp4+oMORGDR/XA4WoBZx9LkOHS7XTW+O+rroTf7
	 yi50ikAYA4OUbMSsVjTMrbZWnU+mk7hYQILRKmu1DbcQq27v7klOaa/hlwIYaMOFP9
	 QRJOGnBcUnT/oIhUpmlkEZw0GiAjgkOGD9047Rwv65YIRR35UPCqVTA2RlnldR+P1f
	 6mJGrAyYxH5PA==
Message-ID: <sashiko-outbox-202359@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] USB: visor add vendor/device IDs for PalmSource devices
 from the PalmUSBD.inf file in Palm Desktop 6.2
Reply-To: sashiko-reviews@lists.linux.dev
To: "Adam Simonelli" <adamsimonelli@gmail.com>, linux-usb@vger.kernel.org
In-Reply-To: <20261106230755.2652311-1-adamsimonelli@gmail.com>
References: <20261106230755.2652311-1-adamsimonelli@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 06 Nov 2026 23:11:47 +0000
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
- [High] USB: visor: build failure from PALMSOURCE_DEVICES_*_ID macro
  name mismatch
--

commit d0c97779f759102eedae826693bbb99e9485b9f6
Author: Adam Simonelli <adamsimonelli@gmail.com>

USB: visor add vendor/device IDs for PalmSource devices from the PalmUSBD.i=
nf file in Palm Desktop 6.2

This commit adds USB vendor and product IDs for two PalmSource devices to
the visor driver.

> diff --git a/drivers/usb/serial/visor.c b/drivers/usb/serial/visor.c
> index 4412834db21c5..badc1af72b569 100644
> --- a/drivers/usb/serial/visor.c
> +++ b/drivers/usb/serial/visor.c
> @@ -79,6 +79,10 @@ static const struct usb_device_id id_table[] =3D {
>  		.driver_info =3D (kernel_ulong_t)&palm_os_4_probe },
>  	{ USB_DEVICE(PALM_VENDOR_ID, PALM_ZIRE_ID),
>  		.driver_info =3D (kernel_ulong_t)&palm_os_4_probe },
> +	{ USB_DEVICE(PALMSOURCE_VENDOR_ID, PALMSOURCE_DEVICES_1_ID),
> +		.driver_info =3D (kernel_ulong_t)&palm_os_4_probe },
> +	{ USB_DEVICE(PALMSOURCE_VENDOR_ID, PALMSOURCE_DEVICES_2_ID),
> +		.driver_info =3D (kernel_ulong_t)&palm_os_4_probe },
>  	{ USB_DEVICE(SONY_VENDOR_ID, SONY_CLIE_4_0_ID),
>  		.driver_info =3D (kernel_ulong_t)&palm_os_4_probe },
>  	{ USB_DEVICE(SONY_VENDOR_ID, SONY_CLIE_S360_ID),
> @@ -137,6 +141,8 @@ static const struct usb_device_id id_table_combined[]=
 =3D {
>  	{ USB_DEVICE(PALM_VENDOR_ID, PALM_TREO_650) },
>  	{ USB_DEVICE(PALM_VENDOR_ID, PALM_TUNGSTEN_Z_ID) },
>  	{ USB_DEVICE(PALM_VENDOR_ID, PALM_ZIRE_ID) },
> +	{ USB_DEVICE(PALMSOURCE_VENDOR_ID, PALMSOURCE_DEVICES_1_ID) },
> +	{ USB_DEVICE(PALMSOURCE_VENDOR_ID, PALMSOURCE_DEVICES_2_ID) },
>  	{ USB_DEVICE(SONY_VENDOR_ID, SONY_CLIE_3_5_ID) },
>  	{ USB_DEVICE(SONY_VENDOR_ID, SONY_CLIE_4_0_ID) },
>  	{ USB_DEVICE(SONY_VENDOR_ID, SONY_CLIE_S360_ID) },
> diff --git a/drivers/usb/serial/visor.h b/drivers/usb/serial/visor.h
> index 622d639ce74e0..0f86bd06c4fe4 100644
> --- a/drivers/usb/serial/visor.h
> +++ b/drivers/usb/serial/visor.h
> @@ -32,6 +32,10 @@
>  #define PALM_ZIRE_ID			0x0070
>  #define PALM_M100_ID			0x0080
> =20
> +#define PALMSOURCE_VENDOR_ID		0x13e8
> +#define PALMSOURCE_DEVICE_1_ID		0x0600
> +#define PALMSOURCE_DEVICE_2_ID		0xff00
> +
>  #define GSPDA_VENDOR_ID		0x115e
>  #define GSPDA_XPLORE_M68_ID		0xf100

[Severity: High]
Does this break the build when CONFIG_USB_SERIAL_VISOR is enabled?
visor.h defines PALMSOURCE_DEVICE_1_ID and PALMSOURCE_DEVICE_2_ID, while
id_table and id_table_combined in visor.c reference the undeclared plural
names PALMSOURCE_DEVICES_1_ID and PALMSOURCE_DEVICES_2_ID.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261106230755.2652=
311-1-adamsimonelli@gmail.com?part=3D1

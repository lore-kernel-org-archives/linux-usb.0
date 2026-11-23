Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795415602;
	b=XLM3EbqYPjfwhl37sV3Xc32iAohYvbJrDQXDxQP62zKf0Gbo+2BM+T4mY99UKnrbV9+v
	 lrs6eD6nyBFgKYSA4mGzgot7XAOiAvfbwJ/y+ankYvpvsEFiGizisWKAfVZrD3IITZHbT
	 V66J38Pp0XL3HutGJylc/O7WOljULTdx3V/z1bCMDvQ25YzU1uf38EyV9jCFaXAyef1+R
	 CaouADfe03jAfw2QECjpjNFZ+Mtsxze7EiLfONDRlJowIQuhBi3+CR20QBQxxBLWDCUAm
	 5vOFCkYIz8+HAYe96zLolPN6ej1kTUNAdMoOKci23qLVIrUy7sPiM3+w+q8Wqex065g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795415602;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=+OBz0ODhE2zbUC8OLZdMLaJ4kJv/yd5h1d0znmbxMbo=;
	b=e46/oSJnzY8L8SXoY7x+qgrli4YL5Sa43u9iBX4AsWH22BaVWYGgkHtEV9QqDcMVyPpl
	 Rw6A87ibO7FNlfivzpi9sxwKXoSTJS6qTslDz8KSEivORtAxI6FSx+9XMyITaF9zbSuL6
	 RHhYfiFaCXDl3RpbBaS5FxHK4opAg1qKJSwVKHo6+kFupUISOXfCokJ4tOzvVMKkOIyWH
	 FIdCCiPwDom5Q6tSr60uVvIckDtX8fHvjdpy+zvgBlvinNmExEzLOE3AzFj4YqPjJ7g+0
	 08IbiTQV8MEeHbRtCWSU0tEqkvLjlcLruVweTJ4lTDVkwOIVd6fFWrqi9iB0XGBAYXA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=f+Y5PRRe;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDF4C606A31A
	for <linux-usb@vger.kernel.org>; Mon, 23 Nov 2026 06:33:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=f+Y5PRRe
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 31BFB1F000C4;
	Mon, 23 Nov 2026 06:33:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795415602;
	bh=+OBz0ODhE2zbUC8OLZdMLaJ4kJv/yd5h1d0znmbxMbo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=f+Y5PRReq3X2gTsN+GEen3dL2vqesQnBMRsdPeknkwIlRH3/zEMVSSQT99D3i/O3E
	 EbkIdOGnMIg2g0nfZ2zdpOZesPI6t2JtcngftIlP7Uf9oj6M4U+kBUt8qDHIkXsCMB
	 Jit3HpmkNsLbZrQ6cTTaphcZ2wtaA8JT8as2DndfVfCWT8IJ82BVeUGYoShyk8ktfS
	 AKqmlRBi6SUuNA8BS8ycrCkpAFVUqB7XMOtA78GzNj+vKy1VRe2ZsatedKfqheYPR0
	 A6mZqO3y3xrTTc9RJ7TE/qcFIN2/CAZ6SbtyDDgrPwzsFjgo2VODLfE4MG+W9XpvI2
	 R5KXpbNJUCPJw==
Message-ID: <sashiko-outbox-228767@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2] usb: acpi: Get correct location data for Apple macs
Reply-To: sashiko-reviews@lists.linux.dev
To: "Atharva Tiwari" <atharvatiwarilinuxdev@gmail.com>
Cc: =?utf-8?b?b3BlbiBsaXN0OlVTQiBTVUJTWVNURU0=?= <linux-usb@vger.kernel.org>
In-Reply-To: <20261123062519.11531-1-atharvatiwarilinuxdev@gmail.com>
References: <20261123062519.11531-1-atharvatiwarilinuxdev@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 23 Nov 2026 06:33:21 +0000
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
- [Low] usb: acpi: unnecessary static is_apple_location in
  usb_acpi_register()
--

commit e06f84629b0b4d6fa8b40243e2606ac6c367b974
Author: Atharva Tiwari <atharvatiwarilinuxdev@gmail.com>

usb: acpi: Get correct location data for Apple macs

This commit overrides the ACPI _PLD port location on x86 Apple Macs whose
internal XHC1 controller exposes an SSP method, using SSP for USB 2.0 ports
and _ADR for USB 3.x ports.

> diff --git a/drivers/usb/core/usb-acpi.c b/drivers/usb/core/usb-acpi.c
> index 489dbdc96f94a..403c2ff44e86a 100644
> --- a/drivers/usb/core/usb-acpi.c
> +++ b/drivers/usb/core/usb-acpi.c

[ ... ]

> @@ -199,6 +200,69 @@ static int usb_acpi_add_usb4_devlink(struct usb_devi=
ce *udev)
>   */
>  #define USB_ACPI_LOCATION_VALID (1 << 31)
> =20
> +/*
> + * Set at registration time on x86 Apple Macs whose internal XHC1 contro=
ller
> + * has ports exposing an SSP object. Apple reports the port location thr=
ough
> + * SSP (USB 2.0) and _ADR (USB 3.x) instead of _PLD.
> + */
> +static bool is_apple_location;

[ ... ]

> @@ -289,6 +353,10 @@ usb_acpi_find_companion_for_port(struct usb_port *po=
rt_dev)
> =20
>  	usb_acpi_get_connect_type(port_dev, adev->handle);
> =20
> +	/* Apple's location overrides the _PLD derived one */
> +	if (is_apple_location)
> +		usb_acpi_apple_get_location(port_dev, adev);
> +
>  	return adev;
>  }
> =20
> @@ -377,6 +445,12 @@ static struct acpi_bus_type usb_acpi_bus =3D {
> =20
>  int usb_acpi_register(void)
>  {
> +	acpi_handle xhc1;
> +
> +	if (x86_apple_machine &&
> +	    ACPI_SUCCESS(acpi_get_handle(NULL, "\\_SB.PCI0.XHC1", &xhc1)))
> +		usb_acpi_apple_detect_ssp(xhc1);
> +
>  	return register_acpi_bus_type(&usb_acpi_bus);
>  }

[Severity: Low]
As reported by Greg Kroah-Hartman on v1 [1], can the static
is_apple_location variable and the registration-time lookup in
usb_acpi_register() be dropped by performing the check directly at the call
site?

usb_acpi_apple_get_location() already resolves the host controller ACPI
device via hc =3D ACPI_COMPANION(hdev->bus->sysdev) and checks that its bus
ID is XHC1.  Because all child port objects and SSP methods under
hc->handle exist in the ACPI namespace before any USB 2.0 or USB 3.0 port
is enumerated, checking x86_apple_machine and scanning hc->handle in
usb_acpi_apple_get_location() does not depend on port enumeration order and
avoids hardcoding \_SB.PCI0.XHC1 in usb_acpi_register().

[1] https://lore.kernel.org/r/2026112338-pummel-hyperlink-2957@gregkh

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261123062519.1153=
1-1-atharvatiwarilinuxdev@gmail.com?part=3D1

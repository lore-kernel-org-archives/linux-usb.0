Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795413192;
	b=y4lV93JOv2CtJ0W3lfO0JM9nKmFAagW7SKQH3nwmjw8pLHLKd0cXNvEGbXO56UP9YfbJ
	 aWthCIw3CZZLvV60KCozZHlfHPhn+uHttJPsophY+Yuip8jIbtUZt35ZL1RLXEDZ7reIU
	 3QziaCSVCqO9Cuvcdh0wIkzuxtoacRif5DA03zfl9uElJYGIO2ljujeBdW9104xy6arhJ
	 hWgq7xi62J8gF8p80zjBjhuIUV9YjrXmS/YUZDRNQcTyhl6jHVawXFhn0kNndlVCxJ555
	 SYN5mTgQ8c6Sultk21S0xmNKwGQOS4Mv8/kHVz8/HP9RmpmFuLEKTUjLELus78sCXjQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795413192;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=xY5AOBc8BULJDDSVvmNgfLQMubgNQZY+d2W1AceSMOg=;
	b=QOJrVfiVDLa7xsj58nu8y7LSWKIyV0z0/al0I13BbjD/EJb/BW8zTmCrFZUIcyr3aL1b
	 biFalgu0tv2XFGnD8aAl5Qe7mCBZRGadtAK/f6ORNGwRCh6AK6sB4xguD6qPBKbQTkZvh
	 JpPtZmczSSZhDUgjmbIMiGqrAn/yvPrB0JpGOQPNALuqqQfiCUjD7NHIsCZu9rbOIa2qz
	 NeWTuWgA5zNrrsYgVBGCGZAk7fh+irFN5ksSDMv969CAntE4U6+WqhFdI9FyomdcLLxZL
	 hn2Lz7/+vMnrB5PbkOAHUY+gnQOL4xlCkM+ehCnwfQftcTPsqxtP+9lXb1Sr8RtEh0Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="js5pCpx/";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BD0D606A31A
	for <linux-usb@vger.kernel.org>; Mon, 23 Nov 2026 05:53:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=js5pCpx/
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 15E4D1F000C4;
	Mon, 23 Nov 2026 05:53:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795413192;
	bh=xY5AOBc8BULJDDSVvmNgfLQMubgNQZY+d2W1AceSMOg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=js5pCpx/lMXYKe1Uww96Y08Ar9feKePP1Ejv7QsN8VNhegqCylS1fLufSPaUp11rU
	 lMdWTTsJgtru43mYz+Zh/dOFnX+eYohukH8btd7hjVstcNodJTo8YLR9oMmaRVpLNu
	 80N7y1oUUsZaJnQ/BNoNX1w/GhnTCaYaJz3NoqefCIkj3SisxXlTBwvLkeS3Zzrzha
	 FCOZOiG1UfsWjZ5bGD7Rx78Dflqg/bNYnp9TMSwqC8FeHs1iJe08FCy+FxhIkN7F2S
	 YBP7upZMXXR91sL7Nlg4NN4IEMdmNAjX1dJ+oZrEiiIiLmTlYVpL+46HCFG61CVJbz
	 WsRlW2BxpSKcw==
Message-ID: <sashiko-outbox-228742@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] usb: acpi: Get correct location data for Apple macs
Reply-To: sashiko-reviews@lists.linux.dev
To: "Atharva Tiwari" <atharvatiwarilinuxdev@gmail.com>
Cc: =?utf-8?b?b3BlbiBsaXN0OlVTQiBTVUJTWVNURU0=?= <linux-usb@vger.kernel.org>
In-Reply-To: <20261123053911.9856-1-atharvatiwarilinuxdev@gmail.com>
References: <20261123053911.9856-1-atharvatiwarilinuxdev@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 23 Nov 2026 05:53:11 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 2 potential
issues to consider:
- [Medium] usb: acpi: stale _PLD location left on XHC1 USB2 ports in
  usb_acpi_apple_get_location()
- [Low] usb: acpi: commit message refers to ACPI method SSD instead of
  SSP
--

commit 092f7ae240ffb60b57f520dfbc02f53417ace8ae
Author: Atharva Tiwari <atharvatiwarilinuxdev@gmail.com>

usb: acpi: Get correct location data for Apple macs

This commit overrides the _PLD-derived USB port location on x86 Apple Macs
by reading Apple's SSP ACPI object for USB 2.0 ports and _ADR for USB 3.x
ports on the internal XHC1 controller.

> To fix this we use Apple's own location methods called SSD
> for USB2.0, and they use _ADR for USB3.0.
[ ... ]
> NOTE: All USB controller has bad _PLD values but SSD is only available
>       on internal USB controller, and even only new intel macs has SSD
>       method, so we check for SSD and XHC1 before using apple's methods.

[Severity: Low]
The commit message refers to the ACPI method as "SSD", whereas the code
checks for and evaluates "SSP".

> diff --git a/drivers/usb/core/usb-acpi.c b/drivers/usb/core/usb-acpi.c
> index 489dbdc96f94a..b5c61a2eae2bc 100644
> --- a/drivers/usb/core/usb-acpi.c
> +++ b/drivers/usb/core/usb-acpi.c
[ ... ]
> @@ -199,6 +200,66 @@ static int usb_acpi_add_usb4_devlink(struct usb_devi=
ce *udev)
[ ... ]
> +static void
> +usb_acpi_apple_get_location(struct usb_port *port_dev, struct acpi_devic=
e *adev)
> +{
> +	struct usb_device *hdev =3D to_usb_device(port_dev->dev.parent->parent);
> +	struct acpi_device *hc =3D ACPI_COMPANION(hdev->bus->sysdev);
> +	struct acpi_buffer buffer =3D { ACPI_ALLOCATE_BUFFER, NULL };
> +	union acpi_object *ssp;
> +	acpi_status status;
> +
> +	/* Only applies to the CPU's internal XHCI controller. */
> +	if (!hc || strncmp(acpi_device_bid(hc), "XHC1", ACPI_NAMESEG_SIZE))
> +		return;
> +
> +	/* USB 3.x ports use _ADR as the location. */
> +	if (hdev->speed >=3D USB_SPEED_SUPER) {
> +		port_dev->location =3D USB_ACPI_LOCATION_VALID |
> +				     adev->pnp.bus_address;
> +		return;
> +	}
> +
> +	/* USB 2.0 ports: SSP =3D { "XHCn", <companion SuperSpeed port> } */
> +	status =3D acpi_evaluate_object_typed(adev->handle, "SSP", NULL, &buffe=
r,
> +					    ACPI_TYPE_PACKAGE);
> +	if (ACPI_FAILURE(status))
> +		return;
> +
> +	ssp =3D buffer.pointer;
> +	if (ssp->package.count >=3D 2 &&
> +	    ssp->package.elements[1].type =3D=3D ACPI_TYPE_INTEGER)
> +		port_dev->location =3D USB_ACPI_LOCATION_VALID |
> +				     ssp->package.elements[1].integer.value;
> +	kfree(buffer.pointer);
> +}

[Severity: Medium]
Does returning here without clearing port_dev->location leave the garbage
_PLD location on XHC1 USB 2.0 ports that do not have an SSP method?

usb_acpi_get_connect_type() runs before usb_acpi_apple_get_location() and
sets port_dev->location from _PLD:

drivers/usb/core/usb-acpi.c:usb_acpi_get_connect_type() {
	if (acpi_get_physical_device_location(handle, &pld) && pld)
		port_dev->location =3D USB_ACPI_LOCATION_VALID |
			pld->group_token << 8 | pld->group_position;

On USB 2.0-only ports on XHC1 that lack a SuperSpeed companion (and thus
have no SSP object), acpi_evaluate_object_typed() fails and leaves that
_PLD value in port_dev->location, mixing raw _PLD values into the same
location namespace as USB 3.x _ADR values where they can falsely match in
find_and_link_peer().  Resetting port_dev->location =3D 0 right after
confirming the controller is XHC1 would clear the stale _PLD data even when
SSP is absent.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261123053911.9856=
-1-atharvatiwarilinuxdev@gmail.com?part=3D1

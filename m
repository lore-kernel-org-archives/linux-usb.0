Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795409833;
	b=Ro6ae20bULoX0897FUe9IZYF/+NMH7mCuHCZhjarD5lh1/dwHrwFHf1+lAwAJE1vI12G
	 yeBoo/O62y2FvZB8YDK7dr8PkpyHUy3BI1LldAnyeQGjkXvDpr6Kdnso0OOq3HPaOormv
	 oeUezjR/syJPpzpNqkIkFQcO1WqZ6i4XPuJPh52NN4Vbd2s75i7cOS3nunYBso9Ey6tRv
	 S8X6TU9fM2P8VfT7PmdKQBJMxcGtybJitOvwZTjq+QiwRihINsdu8wZjShPNG1/lN66I2
	 T6cB8WBI6/ZAaoIbglt1ZxOVz4OYyjt2b/awQLWkwWFHJ37Bs5ZovklENZBsfhrHGiQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795409833;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=4HOR7YrZtK8bkijvt6wMynw77g04ltBbc67MD/CabZ4=;
	b=jXVwwS5vw3gZ/92/+NoRNlsoNfUkCXe+xPaeQkoqQB9zjotJDSf6Vn2noTjZja/JGP54
	 SE0QGdwtUdUQ0UfuVpclmSjKzTxSyRISC68q5Dy2eYy+DMeLE7xzIFpYnHaSPHqW0mgTi
	 xxdCe7ZlXbX0E159x6RmGMTyudds3mrG7c8KI1BJU/TgB7tF3WCGHvmA/IkcMnPdsFTXP
	 g5idO6/UJZeRCHZuzGvp+iRbsqVdSVlrcoXPUeDCb+Ch4rS3THKI8oQr9HxafPYWD8Pky
	 aOAr7ZQd0gN1UBWO559zuvlOK8w8IFbW/h95AxWdAg7+wd8SHdEVptPbWcvlBkIVtbg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nHZUZeY2;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50A88606A31A
	for <linux-usb@vger.kernel.org>; Mon, 23 Nov 2026 04:57:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nHZUZeY2
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BDC731F000C0;
	Mon, 23 Nov 2026 04:57:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795409832;
	bh=4HOR7YrZtK8bkijvt6wMynw77g04ltBbc67MD/CabZ4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=nHZUZeY2KEly1Xp+UAwQ0/FNJaNyeidYUCZ47yEtJzopoGbayFAbImvvV4Mi57oX6
	 7MN3GDsORDkjWp3fhi7nDiLbLAeYah865HzxN/7J66B0f9M6ZWUs7ctgsZCrBsw6xf
	 sE0NrEzKQOFNCU9tZC0NuI9J4BC1HhluttiWjQv82dv5XkRe3tpyEHk1ZKbcmlULzN
	 5sFJ4H//DhmFldHF7tCcS56+kMI7EbejC2KsgAlxBFl0e/pc2AaJKIO1NA9Z9VJrkL
	 t9CpiaK4EF2hScD+lGUWac8APfsWsBvtdOiWF7KJiS0icdaNr1RynlcEiyzCVwP+OK
	 Xvqyj/njPev/g==
Message-ID: <sashiko-outbox-228682@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RESEND v2] usb: xhci-pci: Add Power handling for Card
 readers on Apple systems
Reply-To: sashiko-reviews@lists.linux.dev
To: "Atharva Tiwari" <atharvatiwarilinuxdev@gmail.com>
Cc: =?utf-8?b?b3BlbiBsaXN0OlVTQiBTVUJTWVNURU0=?= <linux-usb@vger.kernel.org>
In-Reply-To: <20261123044412.8721-1-atharvatiwarilinuxdev@gmail.com>
References: <20261123044412.8721-1-atharvatiwarilinuxdev@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 23 Nov 2026 04:57:12 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 6 potential
issues to consider:
- [Medium] usb: acpi: unvalidated SSP package access in
  usb_acpi_apple_get_location()
- [Medium] usb: acpi: broken port peering in
  usb_acpi_apple_get_location()
- [Medium] usb: xhci-pci: xhci_pci_suspend() powers off Apple card
  reader in runtime PM
- [Medium] usb: xhci-pci: missing xhci_apple_card_reader_power() off on
  teardown
- [Low] usb: acpi: undocumented usb-acpi.c change and SSD comment
  mismatch
- [Low] usb: xhci-pci: duplicate SPWR call and early power-on in
  xhci_pci_quirks()
--

commit ff305eafd156778a9e4b723a3c6ba3da48ac220c
Author: Atharva Tiwari <atharvatiwarilinuxdev@gmail.com>

usb: xhci-pci: Add Power handling for Card readers on Apple systems

This commit adds ACPI SPWR power management for internal card readers on
x86 Apple systems in xhci-pci and adds ACPI port location lookup for XHC1
ports in usb-acpi.

> diff --git a/drivers/usb/core/usb-acpi.c b/drivers/usb/core/usb-acpi.c
> index 489dbdc96f94a..69f86b2b65cb0 100644
> --- a/drivers/usb/core/usb-acpi.c
> +++ b/drivers/usb/core/usb-acpi.c
[ ... ]
> @@ -199,6 +200,34 @@ static int usb_acpi_add_usb4_devlink(struct usb_devi=
ce *udev)
>   */
>  #define USB_ACPI_LOCATION_VALID (1 << 31)
> =20
> +static void
> +usb_acpi_apple_get_location(struct usb_port *port_dev, acpi_handle handl=
e)
> +{
> +	struct usb_device *hdev =3D to_usb_device(port_dev->dev.parent->parent);
> +	struct acpi_buffer buffer =3D { ACPI_ALLOCATE_BUFFER, NULL } ;
> +	acpi_status status;
> +
> +	/* The function only applies to CPU's internal XHCI controller. */
> +	if (strncmp(acpi_device_bid(ACPI_COMPANION(to_usb_device(
> +					port_dev->dev.parent->parent)->bus->sysdev)),
> +					"XHC1", ACPI_NAMESEG_SIZE))
> +		return;
> +
> +	if (hdev->speed >=3D USB_SPEED_SUPER) {
> +		port_dev->location =3D USB_ACPI_LOCATION_VALID |
> +				acpi_fetch_acpi_dev(handle)->pnp.bus_address;
> +		return;
> +	}

[Severity: Medium]
Can this break port peering in find_and_link_peer() on SuperSpeed hubs on
the XHC1 bus?

hdev->bus->sysdev points to the host controller for every hub on the bus,
not only the root hub (!hdev->parent).  On any SuperSpeed port where
hdev->speed >=3D USB_SPEED_SUPER, this unconditionally overwrites
port_dev->location with the port's _ADR even if _PLD already set a
location, if hdev is a downstream hub, or if the companion USB 2.0 ports do
not implement SSP.  Because find_and_link_peer() skips default peering
whenever port_dev->location is non-zero, those SuperSpeed ports will fail
to match their USB 2.0 companion ports.

> +
> +	status =3D acpi_evaluate_object_typed(handle, "SSP", NULL, &buffer, ACP=
I_TYPE_PACKAGE);
> +	if (ACPI_FAILURE(status))
> +		return;
> +
> +	port_dev->location =3D USB_ACPI_LOCATION_VALID |
> +		((union acpi_object *)buffer.pointer)->package.elements[1].integer.val=
ue;
> +	kfree(buffer.pointer);
> +}

[Severity: Medium]
Can indexing package.elements[1].integer.value read out of bounds or read
a non-integer union member?

acpi_evaluate_object_typed() only verifies that the top-level object is
ACPI_TYPE_PACKAGE; it does not check package.count or element types.  If
SSP returns a package with fewer than two elements or elements[1] is not
ACPI_TYPE_INTEGER, this reads past the allocated elements array or mixes
union fields into port_dev->location (exposed via sysfs).

> +
>  static void
>  usb_acpi_get_connect_type(struct usb_port *port_dev, acpi_handle *handle)
>  {
> @@ -221,6 +250,11 @@ usb_acpi_get_connect_type(struct usb_port *port_dev,=
 acpi_handle *handle)
>  		port_dev->location =3D USB_ACPI_LOCATION_VALID |
>  			pld->group_token << 8 | pld->group_position;
> =20
> +	/* On x86 apple macs, Apple exposes location via SSD method
> +	 * instead of _PLD On USB 2.0, and on USB 3.0 it uses _ADR
> +	 */
> +	if (x86_apple_machine)
> +		usb_acpi_apple_get_location(port_dev, handle);

[Severity: Low]
This isn't a bug, but the usb-acpi.c port location changes are not
mentioned in the commit message, the comment here refers to an "SSD"
method while usb_acpi_apple_get_location() evaluates "SSP", and
usb_acpi_apple_get_location() recomputes
to_usb_device(port_dev->dev.parent->parent) instead of using hdev.

> diff --git a/drivers/usb/host/xhci-pci.c b/drivers/usb/host/xhci-pci.c
> index e278db940a583..31961de9761f8 100644
> --- a/drivers/usb/host/xhci-pci.c
> +++ b/drivers/usb/host/xhci-pci.c
[ ... ]
> @@ -517,6 +518,18 @@ static void xhci_pci_quirks(struct device *dev, stru=
ct xhci_hcd *xhci)
>  	if (xhci->hci_version >=3D 0x120)
>  		xhci->quirks |=3D XHCI_DEFAULT_PM_RUNTIME_ALLOW;
> =20
> +#ifdef CONFIG_ACPI
> +	/* On Apple Machine with Card readers, we have to use SPWR(0/1) to turn
> +	 * off/on the card reader, And on boot the card reader is off, so we tu=
rn
> +	 * it on.
> +	 */
> +	if (x86_apple_machine && ACPI_HANDLE(&pdev->dev) &&
> +			acpi_has_method(ACPI_HANDLE(&pdev->dev), "SPWR")) {
> +		acpi_execute_simple_method(ACPI_HANDLE(&pdev->dev), "SPWR", 1);
> +		xhci->quirks |=3D XHCI_APPLE_CARD_READER_POWER;
> +	}
> +#endif /* CONFIG_ACPI */

[Severity: Low]
This isn't a bug, but xhci_pci_quirks() runs inside xhci_gen_setup() before
the controller is halted and reset, and this open-codes
acpi_execute_simple_method() under a separate #ifdef CONFIG_ACPI block
instead of using xhci_apple_card_reader_power().  Since ACPI_HANDLE() and
acpi_has_method() already have !CONFIG_ACPI stubs, could xhci_pci_quirks()
just set XHCI_APPLE_CARD_READER_POWER and let xhci_pci_setup() call
xhci_apple_card_reader_power(pdev, 1), matching XHCI_PME_STUCK_QUIRK and
xhci_pme_acpi_rtd3_enable()?

[Severity: Medium]
Does the card reader stay powered on if probe fails later, when the driver
is unbound in xhci_pci_remove(), or on system shutdown in
xhci_pci_shutdown()?  None of the probe error, removal, or shutdown paths
call xhci_apple_card_reader_power(pdev, 0).

[ ... ]
> @@ -853,6 +870,9 @@ static int xhci_pci_suspend(struct usb_hcd *hcd, bool=
 do_wakeup)
>  	/* synchronize irq when using MSI-X */
>  	xhci_msix_sync_irqs(xhci);
> =20
> +	if (!ret && (xhci->quirks & XHCI_APPLE_CARD_READER_POWER))
> +		xhci_apple_card_reader_power(pdev, 0);
> +

[Severity: Medium]
Does calling xhci_apple_card_reader_power(pdev, 0) here power off the card
reader during runtime suspend as well as system sleep?

hcd_pci_runtime_suspend() calls suspend_common(dev, PMSG_AUTO_SUSPEND) ->
xhci_pci_suspend(hcd, true), and controllers with hci_version >=3D 0x120
enable runtime PM by default via XHCI_DEFAULT_PM_RUNTIME_ALLOW.  Cutting
card reader power during runtime suspend prevents the reader from detecting
card insertion while the system is running, and removing power after
xhci_suspend() while PORT_WKDISC_E is armed on a connected port can
trigger a disconnect wake event or drop the device across suspend without
notifying USB core via usb_root_hub_lost_power().

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261123044412.8721=
-1-atharvatiwarilinuxdev@gmail.com?part=3D1

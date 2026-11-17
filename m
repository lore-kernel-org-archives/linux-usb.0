Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794875505;
	b=hpn1z0CxdrICC/01M/ArffXoDMvQG6m0/gbt+aG6biwNL8l9L3rOKJMHgQ8QMFy6G0zY
	 /mSDA4y6QQwJ6kszultl/DtmMjsOJfsyDfCePXJ28C6kW85NX1USeUo94Hax/UgLzGQ2P
	 xpntOHeq+woCbodzsWLhryMaChbpxK2BIa0TEKYe0Tk39igF6RiJni9H1gXLPPJFzu2U5
	 qlPaunZch7qwulVNVsbzkdQZ1j+w8+kvh5fYwt4HN7GRO+tXoSQ3C7SvOWr5zm3M+bDwM
	 S8Mr7JepoCYSYAyuj2FWl3/VzuFFrCpMsdih8NmgGXBv5MWnJEuGo2IlW2TqCLQwXBw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794875505;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=loRHwr0xWDXujzgzr544Z4fRyj4jQBgQ4ITx+kO+cUY=;
	b=K05LeGdD839w7zJnAmogWixn68wwlWuRhm6F5hoyQVA5zzY3EJqrmYB6UMoYPeCeLOwz
	 gOnFJxrxcau0sbT56eREIVCQ2+kDlzJB37P1IkzmZWayR8nfw8TYab7WmP/x9GGk8Fxxg
	 qaWcT62sh1OGU7wsmLx/qfufXUeqHzoCyK5TgJfXvaCb6wKJ/Y49Vd4M7xggRbeBBrVFD
	 HHp2jpIqTiH1HesckcQA6wUYDhMLn5XvdJ5mKOxfHoEDZU5a7xhycsml7rqM8M4ORYl2j
	 XYgx4geKQp7htsKy/A7n6BgTwLf2aXAJIPkr30ua+evxzqYFw1zPk+XE/x3fNWcvGZw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UyhqurRR;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9277F606A323
	for <linux-usb@vger.kernel.org>; Tue, 17 Nov 2026 00:31:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UyhqurRR
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 113DD1F000C7;
	Tue, 17 Nov 2026 00:31:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794875505;
	bh=loRHwr0xWDXujzgzr544Z4fRyj4jQBgQ4ITx+kO+cUY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=UyhqurRREcfOpkAL9W2UljEUHuNj8YcP1Nuh1RsRmAe4ak3iODF3hD6AwXZl6QVSE
	 529qFeAogbpxOoEzLI4zVDTTmbEslUeaIqTNsR0yCusqSyv4ShtBGzPwOPzkkJFjjf
	 n0fn1a1zeL4w8aGxqOGPBZnWYdzyYAfN2gSXKZvgilFYKZ0+CuRSQC5Gh6+by0za0C
	 OdTkLVQ5GWK+UBcj9IT5vOdpT0MbWRo9pGxNfXkEcIQNybgjguWpTvv449am6K9iYx
	 +CzOP170/OC7ezjWF6aI7jA3RlXW2I4rIS6ag0VpuQZZniQ1DNuqP8SJ++bHxxho7D
	 n4EauCZEHuCaw==
Message-ID: <sashiko-outbox-218004@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2] usb: xhci-pci: Add Power handling for Card readers
 on Apple systems
Reply-To: sashiko-reviews@lists.linux.dev
To: "Atharva Tiwari" <atharvatiwarilinuxdev@gmail.com>
Cc: =?utf-8?b?b3BlbiBsaXN0OlVTQiBYSENJIERSSVZFUg==?= <linux-usb@vger.kernel.org>
In-Reply-To: <20261117000034.7641-1-atharvatiwarilinuxdev@gmail.com>
References: <20261117000034.7641-1-atharvatiwarilinuxdev@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 17 Nov 2026 00:31:44 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 3 potential
issues to consider:
- [Medium] usb: xhci-pci: xhci_pci_suspend() powers off Apple card
  reader in runtime PM
- [Medium] usb: xhci-pci: missing xhci_apple_card_reader_power() off on
  teardown
- [Low] usb: xhci-pci: duplicate SPWR call and early power-on in
  xhci_pci_quirks()
--

commit 9d162606edd929676ba53f7638bfed5c72201d2d
Author: Atharva Tiwari <atharvatiwarilinuxdev@gmail.com>

usb: xhci-pci: Add Power handling for Card readers on Apple systems

This commit adds an XHCI_APPLE_CARD_READER_POWER quirk on x86 Apple
machines to toggle card reader power via the ACPI SPWR method during
probe, suspend, and resume.

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
> +
>  	if (xhci->quirks & XHCI_RESET_ON_RESUME)
>  		xhci_dbg_trace(xhci, trace_xhci_dbg_quirks,
>  				"QUIRK: Resetting on resume");

[Severity: Medium]
Does this leave the card reader powered on if probe fails later in
xhci_gen_setup() or xhci_pci_common_probe(), or when the driver is unbound
or the system shuts down?

Neither the probe error paths, xhci_pci_remove(), nor xhci_pci_shutdown()
call xhci_apple_card_reader_power(pdev, 0), and pci_device_remove() wakes
the controller via pm_runtime_get_sync() -> xhci_pci_resume() before
calling xhci_pci_remove(), turning SPWR(1) back on before the HCD is
stopped.

> @@ -562,10 +575,14 @@ static void xhci_find_lpm_incapable_ports(struct us=
b_hcd *hcd, struct usb_device
>  		}
>  	}
>  }
> -
> +static void xhci_apple_card_reader_power(struct pci_dev *pdev, u64 on)
> +{
> +	acpi_execute_simple_method(ACPI_HANDLE(&pdev->dev), "SPWR", on);
> +}
>  #else
>  static void xhci_pme_acpi_rtd3_enable(struct pci_dev *dev) { }
>  static void xhci_find_lpm_incapable_ports(struct usb_hcd *hcd, struct us=
b_device *hdev) { }
> +static void xhci_apple_card_reader_power(struct pci_dev *pdev, u64 on) {=
 }
>  #endif /* CONFIG_ACPI */

[Severity: Low]
This isn't a bug, but xhci_pci_quirks() adds a separate #ifdef CONFIG_ACPI
block and open-codes acpi_execute_simple_method() instead of using
xhci_apple_card_reader_power(), and it powers on the device before
xhci_gen_setup() halts and resets the controller.

Since ACPI_HANDLE() and acpi_has_method() already have !CONFIG_ACPI stubs,
xhci_pci_quirks() could just set XHCI_APPLE_CARD_READER_POWER and let
xhci_pci_setup() call xhci_apple_card_reader_power(pdev, 1) after
xhci_gen_setup() succeeds, matching XHCI_PME_STUCK_QUIRK and
xhci_pme_acpi_rtd3_enable().

> @@ -853,6 +870,9 @@ static int xhci_pci_suspend(struct usb_hcd *hcd, bool=
 do_wakeup)
>  	/* synchronize irq when using MSI-X */
>  	xhci_msix_sync_irqs(xhci);
> =20
> +	if (!ret && (xhci->quirks & XHCI_APPLE_CARD_READER_POWER))
> +		xhci_apple_card_reader_power(pdev, 0);
> +
>  	if (ret && (xhci->quirks & XHCI_SSIC_PORT_UNUSED))
>  		xhci_ssic_port_unused_quirk(hcd, false);

[Severity: Medium]
Does calling xhci_apple_card_reader_power(pdev, 0) unconditionally in
xhci_pci_suspend() break runtime PM and wake-on-disconnect on the card
reader port?

hcd_pci_runtime_suspend() also calls suspend_common() ->
xhci_pci_suspend() (and controllers with hci_version >=3D 0x120 enable
runtime PM by default via XHCI_DEFAULT_PM_RUNTIME_ALLOW), so cutting power
with SPWR(0) during runtime suspend prevents the card reader from
detecting card insertion or signaling remote wakeup while the controller
is idle.

Furthermore, when do_wakeup is true, xhci_bus_suspend() arms PORT_WKDISC_E
on connected ports and xhci_suspend() -> xhci_disable_hub_port_wake()
preserves PORT_WAKE_BITS; cutting power to an attached USB card reader
after xhci_suspend() causes a disconnect on the port that can trigger a
spurious wake event and drops the device's power session without notifying
USB core via usb_root_hub_lost_power() on resume.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261117000034.7641=
-1-atharvatiwarilinuxdev@gmail.com?part=3D1

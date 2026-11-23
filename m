Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795411512;
	b=jrO6mt0omPBaFSv8q6IhlgTejV4bSpKpDCM5vq4VtAaGhIz8fXVhlfcvUKUIFB1Dd5Y+
	 uVLVkoLpvLwl9ggTh6GSgLKGoQ+xhDqB9x+NruPEwp2Lm6QRC6Gm1coCyHDkFC2ZyHLKO
	 heAO/TrY38eKbuZeJhsI6SwQUi3BlkWcCYJ6+EnhwU6f8VTTD+zXaNUPkFySknWnzb+42
	 MnXUs3VeKgrQG545MqpzZMhYovkbHW7JGojZokvuFh9EdgWG4E8M9iYvzmofOL2VSDQIb
	 KIvvmVN5AFtwHPOWMkP8tgxtbhdO7YXgxqTqtkD1dbt8OtGuNzpaWdKdrIe/969xNww==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795411512;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=QU6sSpMXLmoonpm8ZBlddANaoHlFssmJKlPEeH7oIDI=;
	b=oWwoDnbC/OtkAc6Wxa2gdj2ytc2z6WZ78c13ZVq9evE9OJPMnwbzahwRwnxGJ+kt4XoH
	 moH2X+hZORBk3EHItrFBA3Iou3Q971AF55N7a6QlLlbWDtQyq7Ua+/ZhbkrYA1pBBJrL+
	 1tKwuUTUyAbVU/HIN2nQOMynqBAqS/avn0CFeFbyRLsM0YpzWuCmryJ1VCPbeneNfIv9q
	 6pSZkEo3U1TaADQUM9KZidx/lexIuLe3y3Uipga5VZhteYte3FoWtgDbUiwruHOlBFsmU
	 fCJImoQf2eXGMBTXJGcW8ZKmdLcgMKkbOcv6XK8bCz5D6HOlp2Wx2V7iKk3YCIjzI/g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Fg3tGDp+;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79180606A31A
	for <linux-usb@vger.kernel.org>; Mon, 23 Nov 2026 05:25:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Fg3tGDp+
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6767F1F000CF;
	Mon, 23 Nov 2026 05:25:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795411511;
	bh=QU6sSpMXLmoonpm8ZBlddANaoHlFssmJKlPEeH7oIDI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Fg3tGDp+/105i1Aiz5qxyrKS62D8T8wkNfgBIGX0Uvfva8vi0tqHryEwDjyfuy1dn
	 NAyZz2NtS63OTEYpcIr6mHmkx2bdOkf27RXRpXPIrKdZLJiIpOF0Xnr4fZknihEqqH
	 sMHJpFQdAmm/GjW7eqS5RnI629CKKBvyWnWRMKjNk/8CosYe4uzjfxecgcen65HXD1
	 Vi62bUVmMky+aQIHZtVV3t77t1oOgFTlSrVCQCJYJQrXG1F3MYZvelrnWpeauP744G
	 2Du7t4+ikdNYiERLgEWTn1Aj5Z4IExBn23AXwMvpAQWdUy48a4PrdGUC8wK/LV7FTu
	 TWYhGGN0Rk0mg==
Message-ID: <sashiko-outbox-228716@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3] usb: xhci-pci: Add Power handling for Card readers
 on Apple systems
Reply-To: sashiko-reviews@lists.linux.dev
To: "Atharva Tiwari" <atharvatiwarilinuxdev@gmail.com>
Cc: =?utf-8?b?b3BlbiBsaXN0OlVTQiBYSENJIERSSVZFUg==?= <linux-usb@vger.kernel.org>
In-Reply-To: <20261123051459.9581-1-atharvatiwarilinuxdev@gmail.com>
References: <20261123051459.9581-1-atharvatiwarilinuxdev@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 23 Nov 2026 05:25:10 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 4 potential
issues to consider:
- [Medium] usb: xhci-pci: xhci_pci_suspend() powers off card reader in
  runtime PM
- [Medium] usb: xhci-pci: missing xhci_apple_card_reader_power() off on
  teardown
- [Low] usb: xhci-pci: duplicate SPWR call and early power-on in
  xhci_pci_quirks()
- [Low] usb: xhci-pci: commit message does not explain why SPWR is
  needed
--

commit d1a936841fa988f7b77ee73f457b5d9b5e354c4c
Author: Atharva Tiwari <atharvatiwarilinuxdev@gmail.com>

> usb: xhci-pci: Add Power handling for Card readers on Apple systems
>
> Add Power handling for Card readers on Apple systems using SPWR
> ACPI method, SPWR(1) turns on the card reader, SPWR(0) turns off
> the card reader, on newer systems SPWR just writes a variable in EC.
> On previous systems it writes to GPIO pins.
>
> Its also used by the macOS driver with the function
> AppleUSB30XHCICardReaderPort::setDevicePower in AppleUSBXHCIPCI.kext.
>
> (This should fix https://bugzilla.kernel.org/show_bug.cgi?id=3D111201
>  But thats not confirmed)
>
> (Tested on iMac20,1)
>
> Signed-off-by: Atharva Tiwari <atharvatiwarilinuxdev@gmail.com>

[Severity: Low]
This isn't a bug, but the commit message describes what the SPWR ACPI
method does without explaining the problem that occurs without this change.
Could the changelog mention that the internal card reader is powered off at
boot and fails to enumerate on the USB bus unless SPWR(1) is evaluated?

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

[Severity: Medium]
Does this leave the card reader powered on after probe failures, driver
unbind, or system shutdown?

Evaluating SPWR(1) in xhci_pci_quirks() turns on the card reader during
xhci_gen_setup(), before xhci_halt(), xhci_reset(), xhci_mem_init(), and
shared USB3 HCD registration complete, and neither the probe error paths
nor xhci_pci_remove(), xhci_pci_stop(), or xhci_pci_shutdown() call
xhci_apple_card_reader_power(pdev, 0) to power it back off when the host
controller is stopped.

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
This isn't a bug, but xhci_pci_quirks() open-codes
acpi_execute_simple_method(ACPI_HANDLE(&pdev->dev), "SPWR", 1) inside a
separate #ifdef CONFIG_ACPI block instead of using
xhci_apple_card_reader_power(pdev, 1), and powers on the device before
xhci_gen_setup() halts and resets the host controller.

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
Won't calling xhci_apple_card_reader_power(pdev, 0) unconditionally in
xhci_pci_suspend() cut power to the card reader during runtime suspend and
while port wake bits are armed?

hcd_pci_runtime_suspend() calls suspend_common(dev, PMSG_AUTO_SUSPEND),
which invokes xhci_pci_suspend() with do_wakeup =3D true.  On controllers
with hci_version >=3D 0x120 (such as iMac20,1),
XHCI_DEFAULT_PM_RUNTIME_ALLOW enables runtime PM by default, so whenever
the xHCI controller enters runtime suspend in S0, SPWR(0) powers off the
card reader and prevents it from detecting SD card insertions or signaling
remote wakeup.

In addition, when the card reader is connected and wakeup is enabled,
xhci_bus_suspend() arms PORT_WKDISC_E on the root-hub port and
xhci_suspend() preserves PORT_WAKE_BITS.  Cutting power to the card reader
after xhci_suspend() causes the device to drop off the bus while
wake-on-disconnect is armed, which can trigger an immediate disconnect wake
event or force an unexpected disconnect and re-enumeration on resume.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261123051459.9581=
-1-atharvatiwarilinuxdev@gmail.com?part=3D1

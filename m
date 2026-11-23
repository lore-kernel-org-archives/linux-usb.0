Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795473607;
	b=fy/Tx0DHIiaqILN2TXy3HUhzSEEMXFSw72SxgNfiAxeqeDy2adNgSRrN3eNPlzhYkJ2H
	 BF5NHsOh+4fm/WdGV9JEOLf5qCeRjxYkiApKkW/5haVsLjlOHD/SKCwt9NTsga90PljHg
	 rThoxIJLSK08++7vCaGQk4TW2ELa+G6eRc7xyhmECNsKB69nPb86ls0M13uGqSOJgI/x6
	 hXMJhv7Sje1SpoZR6XegrAwsFXHoiFngfzGuOercw+BGAnp7QODN1WyH6btRmsUO708A3
	 cwhrNMNXz5FpglYWCMDWhlSHhOoICGdUjli4O/w0yUt95PCHOPSpq/t3UzFpx3e8RFg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795473607;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=hStV27JZ5WGsV5cAqqx/FdIqxotEu5NQjZgJoNMCvn0=;
	b=iFMsqWZW/u9REHfD5X7+PGkSJnTW/MoKH0qcqxNu2ExbhTMS+wSUxHDAH5ji2S/y+ok/
	 gHjJBUuzxqJ8njYNErb9UZyPNxi9pMtACr8GgM6UOi5fRU+1Jxuv6FiUjyEiX+KMpS9gm
	 W9IgwBrdGLD4iEFZLMqBWkQyOcOlgNS8gxuS75SvZg7TqthwNtmSDMjW6AjBXDt5X1PW9
	 HzUgdXSK/pv6MFiLtjVjqH0f6BeZQTdhRmTNGk4Yk7b73B2W0XCPKKLTBTmLl4kHBPvkw
	 vXRj2xxQDSguJjI3XJHqivQQNCGGnoaRicbcIz0MuTkeKmlSnK6A2+ZJ/ncBS+PGuvg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RmPRaGfd;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BB99606A321
	for <linux-usb@vger.kernel.org>; Mon, 23 Nov 2026 22:40:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RmPRaGfd
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D9EA71F000CA;
	Mon, 23 Nov 2026 22:40:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795473607;
	bh=hStV27JZ5WGsV5cAqqx/FdIqxotEu5NQjZgJoNMCvn0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=RmPRaGfd2CwplVcYEjlnj2N2HddF08c+TaU2PvN2m4wS14LoykUsh0c78LS4DRA33
	 Lt/kTkBvcO7i2cXLPPxyNb8I7BI/oltQtzeNwgktIrCp5eq/gY7heofMppd63n2jnC
	 YrO1AsuV8YJpe9AFkX4sRBwk/2mm8ZBPC9auUQsFAdlRvT9Yvyy/K1klosLcSDNr4H
	 H36zU0k6pHNO6yiZcSWMSQPhaSs9xnHYqyVlBLUImJG0JYCw4myemVQm3B3tOaA06/
	 SQYhBHLVg7MqW9PADTUoe0HWJz1Gf3/sWIJMItY0CYfuLktXPB3pfCoRvLikPeoWQI
	 dXxAcq6tJF9qQ==
Message-ID: <sashiko-outbox-230154@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4] usb: xhci-pci: Add Power handling for Card readers
 on Apple systems
Reply-To: sashiko-reviews@lists.linux.dev
To: "Atharva Tiwari" <atharvatiwarilinuxdev@gmail.com>
Cc: =?utf-8?b?b3BlbiBsaXN0OlVTQiBYSENJIERSSVZFUg==?= <linux-usb@vger.kernel.org>
In-Reply-To: <20261123223138.1165-1-atharvatiwarilinuxdev@gmail.com>
References: <20261123223138.1165-1-atharvatiwarilinuxdev@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 23 Nov 2026 22:40:06 +0000
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
- [High] usb: xhci-pci: use-after-free of xhci in xhci_pci_remove()
- [Medium] usb: xhci-pci: card reader left powered on after probe
  failure or shutdown
- [Low] usb: xhci-pci: duplicate SPWR call and early power-on in
  xhci_pci_quirks()
- [Low] usb: xhci-pci: commit message does not explain why SPWR is
  needed
--

commit d69011e93a3dca622d8ee15905ffc3ff76202bd1
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
This isn't a bug, but the commit message describes what SPWR(1) and
SPWR(0) do without explaining why the driver must call them.  As the code
comment notes, the card reader starts powered off at boot on these Apple
machines and fails to enumerate unless SPWR(1) is evaluated.

> diff --git a/drivers/usb/host/xhci-pci.c b/drivers/usb/host/xhci-pci.c
> index e278db940a583..b89dd83ec0e04 100644
> --- a/drivers/usb/host/xhci-pci.c
> +++ b/drivers/usb/host/xhci-pci.c
[ ... ]
> @@ -517,6 +518,19 @@ static void xhci_pci_quirks(struct device *dev, stru=
ct xhci_hcd *xhci)
>  	if (xhci->hci_version >=3D 0x120)
>  		xhci->quirks |=3D XHCI_DEFAULT_PM_RUNTIME_ALLOW;
> =20
> +#ifdef CONFIG_ACPI
> +	/*
> +	 * On Apple machines with a card reader, the reader is powered
> +	 * off at boot. Evaluate SPWR(1) to turn it on, so it works at
> +	 * boot. SPWR(0) turns it off again.
> +	 */
> +	if (x86_apple_machine && ACPI_HANDLE(&pdev->dev) &&
> +			acpi_has_method(ACPI_HANDLE(&pdev->dev), "SPWR")) {
> +		acpi_execute_simple_method(ACPI_HANDLE(&pdev->dev), "SPWR", 1);
> +		xhci->quirks |=3D XHCI_APPLE_CARD_READER_POWER;
> +	}
> +#endif /* CONFIG_ACPI */

[Severity: Low]
As reported by Greg Kroah-Hartman on v3 [1], this adds an #ifdef
CONFIG_ACPI block in xhci_pci_quirks() and open-codes
acpi_execute_simple_method() instead of using the
xhci_apple_card_reader_power() helper defined below.

xhci_pci_quirks() also runs inside xhci_gen_setup() before xhci_halt()
and xhci_reset() reset the controller.  Since ACPI_HANDLE() and
acpi_has_method() already have !CONFIG_ACPI stubs, xhci_pci_quirks() can
just set XHCI_APPLE_CARD_READER_POWER without the #ifdef, and
xhci_pci_setup() can call xhci_apple_card_reader_power(pdev, 1) after
xhci_gen_setup() finishes, matching XHCI_PME_STUCK_QUIRK and
xhci_pme_acpi_rtd3_enable().

[ ... ]

> @@ -750,6 +769,9 @@ void xhci_pci_remove(struct pci_dev *dev)
> =20
>  	usb_hcd_pci_remove(dev);
> =20
> +	if (xhci->quirks & XHCI_APPLE_CARD_READER_POWER)
> +		xhci_apple_card_reader_power(dev, 0);
> +
>  	/* Workaround for spurious wakeups at shutdown with HSW */
>  	if (set_power_d3)
>  		pci_set_power_state(dev, PCI_D3hot);

[Severity: High]
Does checking xhci->quirks after usb_hcd_pci_remove(dev) cause a
use-after-free of xhci?

xhci points into primary_hcd->hcd_priv, and usb_hcd_pci_remove() drops
the final reference on the primary struct usb_hcd via usb_put_hcd(hcd) ->
hcd_release() -> kfree(hcd).  Notice how set_power_d3 caches
xhci->quirks & XHCI_SPURIOUS_WAKEUP into a local bool at the top of
xhci_pci_remove() before usb_hcd_pci_remove() frees xhci.

[Severity: Medium]
Can the card reader be left powered on after a probe failure or system
shutdown?

If probe fails after SPWR(1) has been evaluated (for example later in
xhci_gen_setup(), usb_add_hcd(), or xhci_pci_common_probe(), which
unwinds via usb_hcd_pci_remove() rather than xhci_pci_remove()), or when
xhci_pci_shutdown() halts the controller on system shutdown,
xhci_apple_card_reader_power(dev, 0) is never called.

[1] https://lore.kernel.org/r/2026112342-engorge-polymer-0717@gregkh

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261123223138.1165=
-1-atharvatiwarilinuxdev@gmail.com?part=3D1

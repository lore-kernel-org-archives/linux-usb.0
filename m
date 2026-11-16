Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794872087;
	b=at4QuM/tYcrE5msF7g/AsbLdbC6dQKoVf8xJzm04f90GreTZ5NDDQ+OxS2rbYrCCXtTB
	 5KjqJED8r0w45qmEmRs8Ve2gz4iHCs8Zn1uAJbvS0fNkExvW1IEqSCDHBWwMlVbFHbZdU
	 ugw3eBNEMhwH7c/g0H5khmU7JHpdK6eOHnT0Fz90ZpXU+hP6Cd7R+8DjHFF1lDQmG1oq0
	 uRlWf4Pv9PCGkiRLr/ONuEdQRN5QpXzqXHpqFI8H4/na2UTHTwrANm/gPCrynGDiMDrzp
	 lTsiBcsCttN91y/7gEOeHPYxIy+wE7AK6Zd0U+TxOTJmqgzvAP/F7qKKUgeLWJNW9cQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794872087;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=CdHrVo2bGrBOljQin4uFnf98UjRmR/GWZ8V3mMv7yI8=;
	b=2f2HH3L9B08f+b+VZ68FgdTcjMCpZBiuRKnMKFYg6Qeqw27np46O3Uuk2mY0xyoU1zRB
	 DAbsgml5zqZspxdm/vZLtU9i+PIFWhMWjRBDpH3Te61ImYhuqRer0jA7aRsRxmFYoddcp
	 9ze7iHDf43WP0aqzgLid3j2gHaFhwHhojEqWcwIZVZ8PBXqeB4Dt+aAaDzubRvWVznQ09
	 aI0ZhXDRFBgYkmvc/Eo31wPUmCTymhcMcFobTOjlgBCVqicEIEbDqKNuJi2P0cZZlDv2p
	 Vu/KvtzuKdDQfA2iJYmuawGlv2TW5qEc8zsJqpOo2Mt8sfkHUo2JO49U3cCeFLclOkQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CtUSSKdA;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68823606A31C
	for <linux-usb@vger.kernel.org>; Mon, 16 Nov 2026 23:34:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CtUSSKdA
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE53F1F000C4;
	Mon, 16 Nov 2026 23:34:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794872087;
	bh=CdHrVo2bGrBOljQin4uFnf98UjRmR/GWZ8V3mMv7yI8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=CtUSSKdAIfeCeYsIj5nsejzfrX74mqI782jscMzqHP8NoUvjEJ5+p+gml6EzP4G3Q
	 Ok7ZbamptLFhblesK7hioa5fbXCrGAnwkLnPabz1dmzwYp2BRLQ+QMOrJYSCCaWLLl
	 nul/EddIkY01y0rWGlQvuWLAEUcg33hC7JkVCGUseSCd0QLoNjY4LwouZoLLm9KDKQ
	 eOXvJVn5VZaDn+hHaJgUJ8gmJin95GoUcbMy2gGQL86OVle29ElP966zaXlYpiTH2w
	 QppxyYwZZItolZRDihYsyldHAFwXHOVDFNpFDPpPACIYCt5aSCPvHhFpHzH7tUcSwT
	 Ufn1zo8sAe4VA==
Message-ID: <sashiko-outbox-217899@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] usb: xhci-pci: Add Power handling for Card readers on
 Apple systems
Reply-To: sashiko-reviews@lists.linux.dev
To: "Atharva Tiwari" <atharvatiwarilinuxdev@gmail.com>
Cc: =?utf-8?b?b3BlbiBsaXN0OlVTQiBYSENJIERSSVZFUg==?= <linux-usb@vger.kernel.org>
In-Reply-To: <20261116231926.5891-1-atharvatiwarilinuxdev@gmail.com>
References: <20261116231926.5891-1-atharvatiwarilinuxdev@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 16 Nov 2026 23:34:46 +0000
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
- [High] usb: xhci-pci: build failure when CONFIG_ACPI is disabled
- [Medium] usb: xhci-pci: xhci_pci_suspend() powers off card reader when
  suspend fails
--

commit 6b73237773664917a89fc903fc5b335cb19cc8a0
Author: Atharva Tiwari <atharvatiwarilinuxdev@gmail.com>

usb: xhci-pci: Add Power handling for Card readers on Apple systems

This commit adds power handling for card readers on x86 Apple systems by
evaluating the SPWR ACPI method during xhci-pci probe, suspend, and
resume.

> diff --git a/drivers/usb/host/xhci-pci.c b/drivers/usb/host/xhci-pci.c
> index e278db940a583..0cbecbbbb21b2 100644
> --- a/drivers/usb/host/xhci-pci.c
> +++ b/drivers/usb/host/xhci-pci.c
[ ... ]
> @@ -517,6 +518,16 @@ static void xhci_pci_quirks(struct device *dev, stru=
ct xhci_hcd *xhci)
>  	if (xhci->hci_version >=3D 0x120)
>  		xhci->quirks |=3D XHCI_DEFAULT_PM_RUNTIME_ALLOW;
> =20
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

[Severity: High]
Does calling acpi_execute_simple_method() here and in xhci_pci_suspend()
and xhci_pci_resume() break the build when CONFIG_ACPI is disabled?

include/acpi/acpi_bus.h declares acpi_execute_simple_method() only inside
#ifdef CONFIG_ACPI and provides no stub for !CONFIG_ACPI, whereas
CONFIG_USB_XHCI_PCI does not depend on CONFIG_ACPI.

> @@ -853,6 +864,9 @@ static int xhci_pci_suspend(struct usb_hcd *hcd, bool=
 do_wakeup)
>  	/* synchronize irq when using MSI-X */
>  	xhci_msix_sync_irqs(xhci);
> =20
> +	if (xhci->quirks & XHCI_APPLE_CARD_READER_POWER)
> +		acpi_execute_simple_method(ACPI_HANDLE(&pdev->dev), "SPWR", 0);
> +
>  	if (ret && (xhci->quirks & XHCI_SSIC_PORT_UNUSED))
>  		xhci_ssic_port_unused_quirk(hcd, false);

[Severity: Medium]
Should SPWR(0) be skipped when xhci_suspend() returns an error in ret?

If xhci_suspend() fails, suspend_common() aborts the suspend without
calling xhci_pci_resume(), leaving the card reader powered off while the
host controller remains active.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261116231926.5891=
-1-atharvatiwarilinuxdev@gmail.com?part=3D1

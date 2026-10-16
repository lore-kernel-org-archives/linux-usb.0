Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32B532E282B
	for <linux-usb@vger.kernel.org>; Fri, 16 Oct 2026 01:22:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792113764; cv=none; b=oqbQrLrxKt/CfkO3Q/muIEU2aXo0PfvALnlTgiUkdL9x6nUkb7kxv2BiYZgFLHlblYJHjIYaa7UgnlswI2S3j6zS8tdUSj0oBmrA4U3lQGzCc0lsvaXQtkns4IxspEEHsmW4jrlvY5uDMmDjHfwZIaejRzoa6FkUykVHG7DTjmU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792113764; c=relaxed/simple;
	bh=U40qQ0bDy7U8c1j5rBN6jq3E9OgVQJkaQxsyp+Qb4vY=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=EM1gMcFnsDnPOc6tPb7Oyoh+UkVABCnSXXXz1hxkuL3qwklO3qxj2tOjhjJKyJTqPC88mduM21NThi1MTxcOiZ3AveuPyS/v2pvgAj1+svxQN0iJBZG2qwdJZNunUCNcVYhYA81bOD65xGRRjacZQtJ+7vtmQXrX2MM0/qe27Gk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FCy5K4Fr; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FCy5K4Fr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A2D451F000C4;
	Fri, 16 Oct 2026 01:22:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792113762;
	bh=yQ1qiyg6DyDR9suDfrcvhn14zrk1ojKFLjwXwV9qW70=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=FCy5K4FrqZlq0R1P40ZUS8AkB/TlYOINBOJV7bp2IHjtV0+J8LiDpEspQdEgGOv6z
	 LJ3I7ymhq6pgPGDNVXbpny1g/Fvz2wm1bDYr7/u+Lkavt932ONsFlzrTHVc8/TJLhd
	 ClXR3yJnjDgKCyJY5F3N5NSWMRAVkEsGMmQo5j3MviLFBz21XQlFonk9OLwYO3eky+
	 J1rxPkDHnlsVi3LcexoxufwHQQaiT6nRNPLYRReYqH/FlFLECrNdiQEA8e64aHIWJ5
	 DFYrYDknSy+8MDGMdAMY2aOjAf41qVT+IRA2vtezAVw8l3wHcxTZG5IXtGhFlfop4r
	 qAqPHqBjJBl0Q==
Message-ID: <sashiko-outbox-173543@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] usb: ehci-pci: Set has_hostpc for TDI EHCI on Intel
 CE5300/CE2600
Reply-To: sashiko-reviews@lists.linux.dev
To: "Joseph Telaak" <joseph@telaak.dev>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261015-ehci-ce5300-hostpc-v1-1-3cae67c11946@telaak.dev>
References: <20261015-ehci-ce5300-hostpc-v1-1-3cae67c11946@telaak.dev>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 16 Oct 2026 01:22:42 +0000
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] usb: ehci: tdi_in_host_mode() fails to check USBMODE_EX
--

commit 493a630291d0b5961a888e40fa36840fea16fbf5
Author: Joseph Telaak <joseph@telaak.dev>
    usb: ehci-pci: Set has_hostpc for TDI EHCI on Intel CE5300/CE2600

The TransDimension EHCI core in the Intel CE5300 and CE2600 SoCs
(192e:0101, revision >=3D 6) has the Moorestown-style register extensions:
host mode is selected in USBMODE_EX rather than USBMODE. This commit sets
has_hostpc so that USBMODE_EX reads back 0x23 and devices enumerate.

> diff --git a/drivers/usb/host/ehci-pci.c b/drivers/usb/host/ehci-pci.c
> index bd3a635555942..8c71c3de3082e 100644
> --- a/drivers/usb/host/ehci-pci.c
> +++ b/drivers/usb/host/ehci-pci.c
> @@ -145,8 +145,16 @@ static int ehci_pci_setup(struct usb_hcd *hcd)
>  			hcd->has_tt =3D 1;
>  		break;
>  	case PCI_VENDOR_ID_TDI:
> -		if (pdev->device =3D=3D PCI_DEVICE_ID_TDI_EHCI)
> +		if (pdev->device =3D=3D PCI_DEVICE_ID_TDI_EHCI) {
>  			hcd->has_tt =3D 1;
> +			/*
> +			 * The TDI core in the Intel CE5300/CE2600 (rev >=3D 6)
> +			 * selects host mode in USBMODE_EX and reports port
> +			 * speed in HOSTPC, as on Moorestown.
> +			 */
> +			if (pdev->revision >=3D 0x6)
> +				ehci->has_hostpc =3D 1;
> +		}

[Severity: High]
Since this hardware selects host mode via USBMODE_EX (offset 0xc8), the
standard USBMODE register (offset 0x68) may read as 0. If it does, will
tdi_in_host_mode() falsely return 0?

drivers/usb/host/ehci-hcd.c:tdi_in_host_mode() {
    ...
    tmp =3D ehci_readl(ehci, &ehci->regs->usbmode);
    return (tmp & 3) =3D=3D USBMODE_CM_HC;
}

During driver unbind or system suspend, ehci_halt() relies on
tdi_in_host_mode(). A false 0 return causes ehci_halt() to exit
immediately and completely bypass the teardown sequence (clearing
CMD_RUN and waiting for STS_HALT):

drivers/usb/host/ehci-hcd.c:ehci_halt() {
    ...
    if (ehci_is_TDI(ehci) && !ehci->no_tdi_mode &&
        !tdi_in_host_mode(ehci)) {
        spin_unlock_irq(&ehci->lock);
        return 0;
    }
    ...
}

Can this bypassed teardown sequence leave DMA and IRQs active on the
newly enabled core, potentially leading to memory corruption or a system
panic? Does tdi_in_host_mode() need to check USBMODE_EX if has_hostpc
is set?

>  		break;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261015-ehci-ce530=
0-hostpc-v1-1-3cae67c11946@telaak.dev?part=3D1

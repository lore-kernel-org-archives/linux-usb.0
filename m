Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A47B947142D;
	Thu, 15 Oct 2026 07:24:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792049095; cv=none; b=gk2I5WUUhbGpV+M7EZz+vMcfBrBiLqVMTAgcy1jrtJ9WNhpbZ1PZrIETVddVcwjZVrYjPqF4c50ZNe3J+q1EkeCMmD55W3HoGbIsIoqj/A5Sfzd4a/E3QYlUBVKyfCyOZbKReLXa736PN9pkvJLF25lR7jzT1iNTOn/jO7NusHQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792049095; c=relaxed/simple;
	bh=jtJQxYQ+G7jJqP3EKdl+yxGADKqrsE3UTF+ry7DPn5U=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=TuHtXDi5qZwW5GNQJlp7GPBnQKXrh/o4kYYvr1FmL3R8BadHGdoAp9GUYxMbXOvCUqfWJ2XEL4vN5nijrChg7X5NppHknRiAyfu6z9CaNGCywU8jVihtgskA4pif66k5W5qmW/zjSjzSsT9B2pgZ6hU8L/P6eBOTu72LBXHwqk4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TYb0geWe; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TYb0geWe"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BF5911F000CA;
	Thu, 15 Oct 2026 07:24:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792049083;
	bh=UPUo3QRk7Vj/+Unc3rUo+6IPEGCZvhlS2SBoAr9llgo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=TYb0geWe+nPLRgXlSrHqQoCngMxxguw/nztXmST7VGWG2cfQXqOuEUQGUI9Bq9YRR
	 WXSnlivA0asFipekovupoXAQjiI1cQEvOBNp4jdp8NzMSiXvxqUUxnf5RBN3ogEKY+
	 SjKz/rnbHSdvNmhgyG6QJ/SVT2XQAPWQyDvH3rgTdfngNTv/BEn48NnFEVgkWMdZ9G
	 lkEV8drIhxL8Kkd0fjG49zQCDg05hu22Uy/o6/BCEGNyThgRWMOWu/epD0pTfaMmnj
	 585ym6RKhhcKD6INFd6SO/e04OF+6+PSiDEjBDmghoBzc+wyqcXZu/LYXqL8xc/agr
	 OxISG3dgZljWg==
Message-ID: <sashiko-outbox-172415@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 21/24] dt-bindings: usb: Add ZTE ZX279128S DWC3
 controller
Reply-To: sashiko-reviews@lists.linux.dev
To: "Navid Ghahremani" <ghahramani.navid@gmail.com>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261014072109.1759502-22-ghahramani.navid@gmail.com>
References: <20261014072109.1759502-1-ghahramani.navid@gmail.com>
 <20261014072109.1759502-22-ghahramani.navid@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 15 Oct 2026 07:24:42 +0000
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] dt-bindings: usb: missing reset header and incorrect macros in exam=
ple
--

commit 4b49967364799b06d338b499b3fff468b97de327
Author: Navid Ghahremani <ghahramani.navid@gmail.com>

dt-bindings: usb: Add ZTE ZX279128S DWC3 controller

Describe the USB host integration with three CRM clocks and four reset
bits.

> diff --git a/Documentation/devicetree/bindings/usb/zte,zx279128s-dwc3.yam=
l b/Documentation/devicetree/bindings/usb/zte,zx279128s-dwc3.yaml
> new file mode 100644
> index 0000000000000..2fd9fe0cc74bd
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/usb/zte,zx279128s-dwc3.yaml

[ ... ]

> +examples:
> +  - |
> +    #include <dt-bindings/clock/zte,zx279128s-crm.h>
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +
> +    usb@9100000 {
> +        compatible =3D "zte,zx279128s-dwc3";
> +        reg =3D <0x09100000 0x100000>;
> +        interrupts =3D <GIC_SPI 50 IRQ_TYPE_LEVEL_HIGH>;
> +        clocks =3D <&topcrm ZX279128S_TOP_USB_REF>,
> +                 <&topcrm ZX279128S_TOP_USB_ACLK>,
> +                 <&topcrm ZX279128S_TOP_USB_SUSPEND>;
> +        clock-names =3D "ref", "bus_early", "suspend";
> +        resets =3D <&topcrm ZX279128S_TOP_RST_USB_B11>,
> +                 <&topcrm ZX279128S_TOP_RST_USB_B14>,
> +                 <&topcrm ZX279128S_TOP_RST_USB_B9>,
> +                 <&topcrm ZX279128S_TOP_RST_USB_B10>;

[Severity: Low]
Will this example pass make dt_binding_check?

The example is missing an include for <dt-bindings/reset/zte,zx279128s-rese=
t.h>.

Additionally, the macros used here (e.g., ZX279128S_TOP_RST_USB_B11) appear
to be misspelled. The actual macros defined in the reset header are prefixed
with ZX279128S_RESET_ (e.g., ZX279128S_RESET_USB_B11).

This discrepancy will result in a build failure when validating the schema.

> +        dr_mode =3D "host";
> +    };

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261014072109.1759=
502-1-ghahramani.navid@gmail.com?part=3D21

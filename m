Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794450751;
	b=ciwzDNlG46GNs5Z0TWxnA6B6dBKMBQeolDtexHIKjeOvE7lE+ooOvCwuObuiFTWuFqFM
	 00mtlnUPH+hkNRRb0R0xSNPkmMHTykvoGc/5lkd/Iug4nZ/ORZCoAKJBh4MXlq+IYZ9pa
	 T055rYaWSGNh5OqGfRil2WIh+BMB4B7E9LNHpIojYNDxAtIZnctDqQuk4DopmNDqmjYjO
	 y7GUOH3ovx6r3+GqrKJcLcr9FYvrM+xIurQrMXlUryhTgRiyOMWNkKIBMW8eSFJkzJgjU
	 NNXO0Er5sLgMrUMgiwG8wda+d6SIAy3pC0ouBprureWRZIC+McTmGkAQmGnmAxDDhtw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794450751;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=wBxk5xLgpfcQ76E/THpJsjWsVW6B5SeCLAnVtxMOeAc=;
	b=McS4qmlToqSt0A3O4eKcqntzjhlP1ubaTTjeuhez0SSEHQDnWMHJ17JQ3uUWg97LYQgl
	 pOsPjNCqEtPvUfyyir20mrJol5+P+fGIaAKaIdQppyD+byjlhe2ikBNh9nrAwkWLOFkuI
	 7RtWsM4iTjaq5X5brxSDvFtbCEQUWt7RE/pojWBc3WQG5lOEtxYLeTWRTOI8UARSXm/ZL
	 GYv+u6LupmqSh5rJfSnxsC0hrkHiSToKn7PM1nUM0KAf5h3V9RXb1gvA8OQ9+HwZFgtN4
	 QDi+/gYI95RRMAyT+XMTtvNrDATdzlk+czIpcgQ7ZUQu34P4aMIU+/82skLkzkYk9EA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FX+edeB4;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5BBF606A881;
	Thu, 12 Nov 2026 02:32:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FX+edeB4
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0D1F01F00A06;
	Thu, 12 Nov 2026 02:32:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794450751;
	bh=wBxk5xLgpfcQ76E/THpJsjWsVW6B5SeCLAnVtxMOeAc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=FX+edeB4PSxYFmyBd6vOsEQG7/N+hW44ID4xl8Xf6p3QFq48D6KWwTw65Y765XNoO
	 lN7yLRQTCq8id8lTc8QkKSYHuug4BlrjXtyvOHnPWE6nBjlm0W5h6eKFpIJjw/KwdA
	 SB+pumuwAlCIDo4+tgMlvk83w0DZYemIkxO3qA/bp1ZDOLKoQs85Ckr2EXsSotdkIb
	 hOICPDCeSNaeBozmqRz3nbQlgjEvzucixdqOrYnM/mVpuhEkP1oCuISxbk6ydIyZC8
	 N/77AVXhLUc9fIzXUQi1QAzPgtC0ccaxbkPxmsrBfHP98Vu/R3rSXIP0ymN9sSw+L/
	 VzKSd3oCXyoHw==
Message-ID: <sashiko-outbox-210199@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v8 1/2] dt-bindings: usb: Add CIX Sky1 USBSSP controller
Reply-To: sashiko-reviews@lists.linux.dev
To: "Hongliang Yang" <hongliang.yang@cixtech.com>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261112022141.4136099-2-hongliang.yang@cixtech.com>
References: <20261112022141.4136099-1-hongliang.yang@cixtech.com>
 <20261112022141.4136099-2-hongliang.yang@cixtech.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 12 Nov 2026 02:32:30 +0000
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
- [Medium] dt-bindings: usb: cix,sky1-usbssp: overlapping reg windows in
  RCSU block
- [Medium] dt-bindings: usb: cix,sky1-usbssp: redundant disable
  properties
--

commit e68eb2e5dd3e2c328c5e798e76df60be2d4b127a
Author: Hongliang Yang <hongliang.yang@cixtech.com>

dt-bindings: usb: Add CIX Sky1 USBSSP controller

This commit adds the Device Tree binding schema for the Cadence USBSSP DRD
controller wrapper on the CIX Sky1 SoC.

> diff --git a/Documentation/devicetree/bindings/usb/cix,sky1-usbssp.yaml b=
/Documentation/devicetree/bindings/usb/cix,sky1-usbssp.yaml
> new file mode 100644
> index 0000000000000..994c805d30da2
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/usb/cix,sky1-usbssp.yaml
> @@ -0,0 +1,163 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/usb/cix,sky1-usbssp.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: CIX Sky1 Cadence USBSSP Controller
> +
> +maintainers:
> +  - Hongliang Yang <hongliang.yang@cixtech.com>
> +
> +description: |
> +  The CIX Sky1 USBSSP controller is based on the Cadence USBSSP DRD
> +  controller. Each instance wraps one of the two USB3 Type-A DRD
> +  controllers of the SoC.
> +
> +  The register range of an instance is a window in the USB30 Type-A DRD
> +  RCSU block at 0x091c0000, starting at the AXI cache attribute strap
> +  register of the instance and ending after its AXI clock status
> +  register. The strap registers of the two controllers and of their PHYs
> +  are interleaved in that block, so the ranges of the two instances
> +  overlap.
> +
> +  The Cadence USBSSP core itself is described by a child node at its own
> +  address. Mode strap controls are programmed through the Sky1 S5 system
> +  controller referenced by the cix,usb-syscon phandle, whose arguments
> +  give the register offset and the bit position of the strap field.
> +
> +  The USB2 PHY of the controller needs no configuration. It is described
> +  as a usb-nop-xceiv device and referenced by the core node like any
> +  other PHY.
> +
> +properties:
> +  compatible:
> +    const: cix,sky1-usbssp
> +
> +  reg:
> +    maxItems: 1
> +    description:
> +      Window from the AXI cache attribute strap register of this instance
> +      up to and including its AXI clock status register.

[Severity: Medium]
Should each instance describe its disjoint strap and status registers as two
separate reg entries (like rcsu_strap and rcsu_status in
cix,sky1-pcie-host.yaml) or model the RCSU block as a shared parent node
rather than a single overlapping reg window?

Because the RCSU block places all strap registers in 0x091c0300..0x091c03ff
and all status registers in 0x091c0400..0x091c04ff, combining both into one
contiguous range causes the two sibling nodes on the same bus (usb@91c0314
and usb@91c0324) to overlap across 0x091c0324..0x091c0403 and the PHY's
strap register at 0x091c0328.  Overlapping reg ranges prevent standard
exclusive MMIO resource reservation via devm_platform_ioremap_resource(), as
the second instance fails probe with -EBUSY.

In addition, the example below uses reg =3D <0x00 0x91c0314 0x00 0x100>, wh=
ich
extends to 0x091c0413 (including the second controller's status register at
0x091c0410) instead of 0xf0 bytes ending after this instance's status
register at 0x091c0400.

[ ... ]

> +  cix,ssp-disable:
> +    type: boolean
> +    description: Disable SuperSpeed Plus mode of the controller.
> +
> +  cix,u3-port-disable:
> +    type: boolean
> +    description: The board does not route the USB3 port of the controlle=
r.

[Severity: Medium]
Are cix,ssp-disable and cix,u3-port-disable redundant with the standard USB
properties already present on the child cdns,usb3 node?

Limiting the controller to Gen1 SuperSpeed is already expressed by setting
maximum-speed =3D "super-speed" on the child node, and an unrouted USB3 port
is expressed by maximum-speed =3D "high-speed" along with omitting
cdns3,usb3-phy from phys and phy-names.  Keeping separate disable properties
on the parent wrapper also allows contradictory configuration between the
glue driver and cdnsp_run() in the Cadence gadget driver, which reads
maximum-speed from the child node and programs the same 3xPort mode
register.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261112022141.4136=
099-1-hongliang.yang@cixtech.com?part=3D1

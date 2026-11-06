Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793960508;
	b=FqyDLSicskq98G/kADBRg93yNWF7dOVbBihFGV35unSbpbYsrwgUacMYn2jRnpyRPls+
	 89VjyNl+0HVxLDGr0+zskqx+LwkxAHsiKn7TKtjuiV+pYPtr4Tzye88kfX56dZIS1ChEd
	 YK61bsBBdp3pp/9yeaTN6pR2zWuqGhB/qU81bzqhEPJpTKSDYoLEQmqHzlHi40gQ+nslm
	 DGBHK+ANga3UFAHMVjBNPCX+WWFgVRlg6GfIwUg4ToOQWMiIdAp2GxEPcpOvsPGYKLMd+
	 1YIxpbrND92PRlk0d/6O3tjXARzd5DPh3rwF50mlSlPki0t8KGx1nkWyyZTmShuqQxw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793960508;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=n5MBbukJIzhEUn6elZkHrpAmlBmzYrRrq+n47iH5saU=;
	b=R5Nt2eVR5w0v7JbyODKKvWtEvpPFBElCcaDwugRWOdg2GXEPQ4x79MblHe8gJ27bbBQ8
	 Q2ONgYKoCIqudMjixpARbHGY1jIg/mquQI7PXOy5PLxQjAJL3KlY7TJHmNOANQarA5040
	 fukTVWaBny2kWeGhHBFo+gNeJ72GGdmreRkQFl5jNoOkpLurTJYePJm9tGu4nTI+W10+S
	 5Jc01oVeCN9yIn17BBVEENIV5H1Wg7xYO4WIp7SMG7BErf20Z0bienKjo98V/9zmTyuEd
	 XczNy9ICbfyy72JJORxXLnbMA07lSHI3idIb9xlRLWyS/kerybIX3pILThR7Qh+1dRw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=iJm3zf5g;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B545606D820;
	Fri,  6 Nov 2026 10:21:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=iJm3zf5g
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BCFD71F008A1;
	Fri,  6 Nov 2026 10:21:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793960508;
	bh=n5MBbukJIzhEUn6elZkHrpAmlBmzYrRrq+n47iH5saU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=iJm3zf5gLnfOP+5iqzxPMDHGmigPCAkRapDq6b+zPMNGwl8W+3GARnUXryz7IVYGp
	 aTX6tOVhAMEh7hJ+gxG7lSYzEWDBBdEiEgr3NH052v067pt+fw4SDKp9wA+DrOs9+d
	 2GNtdqsbj01Lz5Sd/iSG/J3BKEt9Glr8H17sRzFePXIRPWuoR6ZfsP5yOCujgnCNva
	 GzDFSBYYHWBKWM/sBNY7DN69I7eyXX63boWq/NhSLCd9d+YyD8iZBvLYEWf/6DWxrI
	 mjQBV0d3F4WlEq9kkH0T0HqM988cYTLafRTuV9ZwJBPzVf2SHgcmNjGBZykjN3Ut7x
	 Ma0DpCg15sOfQ==
Message-ID: <sashiko-outbox-201200@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 1/2] dt-bindings: usb: Add CIX Sky1 USBSSP controller
Reply-To: sashiko-reviews@lists.linux.dev
To: "Hongliang Yang" <hongliang.yang@cixtech.com>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261106101210.1059256-2-hongliang.yang@cixtech.com>
References: <20261106101210.1059256-1-hongliang.yang@cixtech.com>
 <20261106101210.1059256-2-hongliang.yang@cixtech.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 06 Nov 2026 10:21:47 +0000
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
- [Medium] dt-bindings: usb: cix,sky1-usbssp: redundant unprefixed
  disable properties
--

commit 96269a442880206984d4933991d01ca45a5cc83e
Author: Hongliang Yang <hongliang.yang@cixtech.com>

dt-bindings: usb: Add CIX Sky1 USBSSP controller

This commit adds the Device Tree binding schema for the CIX Sky1 Cadence
USBSSP controller wrapper and its child cdns,usb3 node.

> diff --git a/Documentation/devicetree/bindings/usb/cix,sky1-usbssp.yaml b=
/Documentation/devicetree/bindings/usb/cix,sky1-usbssp.yaml
> new file mode 100644
> index 0000000000000..137ef9ac13356
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/usb/cix,sky1-usbssp.yaml
> @@ -0,0 +1,154 @@
[ ... ]
> +  The register range of an instance is a window in the USB30 Type-A DRD
> +  RCSU block at 0x091c0000, starting at the AXI cache attribute strap
> +  register of the instance and ending after its AXI clock status
> +  register. The strap registers of the two controllers and of their PHYs
> +  are interleaved in that block, so the ranges of the two instances
> +  overlap.
[ ... ]
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
Should reg describe non-overlapping register regions (or should the shared
RCSU block at 0x091c0000 be modeled as a shared parent or syscon node)
instead of overlapping windows across sibling devices on the same bus?

Defining a single contiguous window from each controller's AXI cache
attribute strap register to its AXI clock status register makes the two
instances overlap in 0x091c0324..0x091c0403. In addition, the example
below specifies reg =3D <0x00 0x91c0314 0x00 0x100> for usb@91c0314, which
extends to 0x091c0414 and covers the second controller's STRAP_STATUS4
register at 0x091c0410 (an inclusive window ending after STRAP_STATUS0 at
0x091c0400 would be 0xf0 bytes). Because the two sibling nodes claim
overlapping MMIO ranges, standard exclusive resource reservation via
devm_platform_ioremap_resource() fails with -EBUSY on the second instance.

[ ... ]

> +  ssp-disable:
> +    type: boolean
> +    description: Disable SuperSpeed Plus mode of the controller.
> +
> +  u3-port-disable:
> +    type: boolean
> +    description: The board does not route the USB3 port of the controlle=
r.

[Severity: Medium]
Can the standard maximum-speed and phys properties in the child cdns,usb3
node be used instead of introducing ssp-disable and u3-port-disable?

Both properties lack a vendor prefix and duplicate standard USB bindings
already present on the child controller node: limiting the controller to
super-speed or high-speed is covered by maximum-speed, and an unrouted
USB3 port is represented by omitting cdns3,usb3-phy from phys/phy-names or
setting maximum-speed to "high-speed".

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261106101210.1059=
256-1-hongliang.yang@cixtech.com?part=3D1

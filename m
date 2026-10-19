Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 539CB488234;
	Mon, 19 Oct 2026 13:30:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792416602; cv=none; b=Woh6z8zWB47pAt5CaJnD4KZgXqLcXuoRWvsUw4Z68Urr2S9FAdCQn0DAmul6YsJIDWo6BtKfq+q/oXNLb03InmK/hTQjPNawmqu/z6Cxe/oYErdy0yLQzX7R+6WLhwH7Ff/FwqE6GL2pR7Ja0uOeS27EZLOusQUXp5Qb6n1sUr0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792416602; c=relaxed/simple;
	bh=KWcU77Bp+0nn1DMHCAo4xVDryDjrRZB1a95iW817rwM=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=bl1RZjxLoYhiZAMRhX8EuKnkkjBTRGZ9sCzRPZub2QQEd88oD78XfRksuox1k8KB3HriEVjco/ua0OJET8E0n7uULNX7emfIf0R86A1LvdOCrghsyOTp2+RBSlOE6+366lE1JLIMh4gHDmBif//RO2KCKAkOrb1yvMJESPjJWcI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=U9ZU1pRD; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="U9ZU1pRD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A9AC71F000C4;
	Mon, 19 Oct 2026 13:30:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792416601;
	bh=gTUURBWe0MVLf8LanvfmYqSm3EdYccM2F52z1t6mSb0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=U9ZU1pRDRD4s8Evy2DSP1iLlN4n6TuY/QtTpDx7eZOsP8c8F7vto5RJiG2TlYH/8M
	 9kEF/vDPhDue0vUBQbFHo6d0tx4XABBqgKyqgFZfpI3te+whd8udkhvIg/5+MGX1s/
	 z8gOf4NbjcQTQ6NvkgXff7Blp+HopSo1akcIB5PEYWW/srP/eL1wLJEVq6ELzufYyo
	 EJbtnAgjGoOE/kNuuzCCwebrkY7c+H8W+jx10PROcHbLV1oBi3QnJHLNDT37HWFkyr
	 MFbTzkG5h+Am3qXXjwVKRLQzc1eWo6Cj1KQxtgk9co6WzW/rO1jyeUsjhV/MoZ0wib
	 DbmTmSdCZy1Dg==
Message-ID: <sashiko-outbox-177155@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [RFC PATCH v3 1/2] dt-bindings: usb: snps,dwc3: describe two
 connectors sharing one HS bus
Reply-To: sashiko-reviews@lists.linux.dev
To: "Qianhui Xu" <xiaqinghuan@mail.ustc.edu.cn>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261019131848.344689-2-xiaqinghuan@mail.ustc.edu.cn>
References: <20261017081320.220525-1-xiaqinghuan@mail.ustc.edu.cn>
 <20261019131848.344689-1-xiaqinghuan@mail.ustc.edu.cn>
 <20261019131848.344689-2-xiaqinghuan@mail.ustc.edu.cn>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 19 Oct 2026 13:29:59 +0000
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [Medium] dt-bindings: usb: snps,dwc3: hs-port rejects unnumbered endpoint=
 in port@0
- [Medium] dt-bindings: usb: snps,dwc3: mux-state conditionals allow duplic=
ate state 1
- [Low] dt-bindings: usb: custom mux properties and usb_role_switch_at_endp=
oint() ref
--

commit b06ffa61c11c4632e31e6abcd1a688344b43ffab
Author: Qianhui Xu <xiaqinghuan@mail.ustc.edu.cn>

dt-bindings: usb: snps,dwc3: describe two connectors sharing one HS bus

This commit updates Documentation/devicetree/bindings/usb/snps,dwc3-common.=
yaml
to describe two connectors sharing the High Speed bus of a single DWC3
controller via a GPIO selector and numbered endpoints under port@0.

> diff --git a/Documentation/devicetree/bindings/usb/snps,dwc3-common.yaml =
b/Documentation/devicetree/bindings/usb/snps,dwc3-common.yaml
> index 6c0b8b6538246..6b06b0027b393 100644
> --- a/Documentation/devicetree/bindings/usb/snps,dwc3-common.yaml
> +++ b/Documentation/devicetree/bindings/usb/snps,dwc3-common.yaml
> @@ -13,6 +13,38 @@ description:
>    Defines the properties of the DWC3 core as being embedded in either an
>    vendor-specific implementation or as a standalone component.
> =20
> +$defs:
> +  hs-endpoint:
> +    $ref: /schemas/graph.yaml#/$defs/endpoint-base
> +    unevaluatedProperties: false
> +
> +    properties:
> +      usb-role-switch:
> +        type: boolean
> +        description:
> +          This connector endpoint has its own USB role switch. The switc=
h is
> +          registered against this endpoint and looked up with
> +          usb_role_switch_at_endpoint().
> +
> +      mux-state:
> +        $ref: /schemas/types.yaml#/definitions/uint32
> +        enum: [0, 1]
> +        description:
> +          Logical level of the port-select GPIO which connects this
> +          connector to the shared High Speed data bus.

[Severity: Low]
In $defs/hs-endpoint, the usb-role-switch description references the Linux
kernel internal function usb_role_switch_at_endpoint(). Since
Documentation/devicetree/bindings/writing-bindings.rst advises against
referring to Linux or driver implementation details in hardware bindings,
should this function reference be removed from the description?

Also, the GPIO-controlled switch routing the shared High-Speed D+/D- pair
between two connectors appears to be an external board-level multiplexer.
Could this use the standard multiplexer bindings from
Documentation/devicetree/bindings/mux/gpio-mux.yaml and
Documentation/devicetree/bindings/mux/mux-consumer.yaml (such as mux-contro=
ls
and mux-states) rather than introducing custom port-select-gpios and singul=
ar
mux-state properties on the DWC3 controller and its endpoints?

> +
> +    dependentRequired:
> +      usb-role-switch: [mux-state]
> +      mux-state: [usb-role-switch]
> +
> +  hs-port:
> +    $ref: /schemas/graph.yaml#/$defs/port-base
> +    unevaluatedProperties: false
> +
> +    patternProperties:
> +      '^endpoint@[01]$':
> +        $ref: '#/$defs/hs-endpoint'

[Severity: Medium]
Does replacing /schemas/graph.yaml#/properties/port with #/$defs/hs-port on
ports/properties/port@0 cause a dtbs_check validation regression for existi=
ng
single-connector DWC3 device trees?

Previously, port@0 referenced /schemas/graph.yaml#/properties/port, which
allows both an unnumbered endpoint node and numbered endpoint@N child nodes.
Here, $defs/hs-port references /schemas/graph.yaml#/$defs/port-base with
unevaluatedProperties: false and only matches ^endpoint@[01]$ in
patternProperties.

When a single-connector DWC3 node without port-select-gpios defines an
unnumbered endpoint child node under port@0 (such as in
arch/arm64/boot/dts/qcom/sm8550.dtsi,
arch/arm64/boot/dts/freescale/imx8mp-beacon-kit.dts, or
arch/arm64/boot/dts/apple/t8103-jxxx.dtsi), won't that unnumbered endpoint
node now be rejected as an unevaluated property?

> +
>  allOf:
>    - $ref: usb-drd.yaml#
>    - if:
> @@ -26,8 +58,83 @@ allOf:
>        $ref: usb.yaml#
>      else:
>        $ref: usb-xhci.yaml#
> +  - if:
> +      required: [port-select-gpios]
> +    then:
> +      required: [dr_mode, ports]
> +      properties:
> +        dr_mode:
> +          const: otg
> +        ports:
> +          required: [port@0]
> +          properties:
> +            port@0:
> +              required: ['#address-cells', '#size-cells', endpoint@0, en=
dpoint@1]
> +              properties:
> +                endpoint@0:
> +                  required: [usb-role-switch, mux-state]
> +                endpoint@1:
> +                  required: [usb-role-switch, mux-state]
> +    else:
> +      properties:
> +        ports:
> +          properties:
> +            port@0:
> +              patternProperties:
> +                '^endpoint@[01]$':
> +                  properties:
> +                    usb-role-switch: false
> +                    mux-state: false
> +  - if:
> +      properties:
> +        ports:
> +          properties:
> +            port@0:
> +              properties:
> +                endpoint@0:
> +                  properties:
> +                    mux-state:
> +                      const: 0
> +    then:
> +      properties:
> +        ports:
> +          properties:
> +            port@0:
> +              properties:
> +                endpoint@1:
> +                  properties:
> +                    mux-state:
> +                      const: 1
> +  - if:
> +      properties:
> +        ports:
> +          properties:
> +            port@0:
> +              properties:
> +                endpoint@1:
> +                  properties:
> +                    mux-state:
> +                      const: 0
> +    then:
> +      properties:
> +        ports:
> +          properties:
> +            port@0:
> +              properties:
> +                endpoint@0:
> +                  properties:
> +                    mux-state:
> +                      const: 1

[Severity: Medium]
Do these two if-then blocks in allOf allow both endpoint@0 and endpoint@1 to
set mux-state =3D <1> at the same time?

Both if conditions test for const: 0 (on endpoint@0 and endpoint@1
respectively). When both endpoints set mux-state =3D <1>, neither if condit=
ion
matches const: 0, so neither then branch is enforced and the duplicate
mux-state =3D <1> configuration passes validation.

Also, because the if blocks do not include required constraints at each nes=
ted
level (ports, port@0, endpoint@0/endpoint@1, and mux-state), won't the if
conditions match vacuously when those nodes or properties are absent?

[ ... ]

> @@ -411,7 +518,7 @@ properties:
> =20
>      properties:
>        port@0:
> -        $ref: /schemas/graph.yaml#/properties/port
> +        $ref: '#/$defs/hs-port'
>          description: High Speed (HS) data bus.
> =20
>        port@1:

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261019131848.3446=
89-1-xiaqinghuan@mail.ustc.edu.cn?part=3D1

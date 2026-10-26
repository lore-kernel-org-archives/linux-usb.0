Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793019016;
	b=YSP7fHNPaA1+k4MIGONCe9WSKPW8IDEC0YIbmErESUZIi0xLRLnZwnk1AYMNAefFw3nn
	 iBSgdruvMlwym5iini1/G2wfVhhKg2RwfCHNoiD5n9hd0z/JyisFzJh+cAz5ZobnmFU/V
	 cMYGj313Wy9xgvRt6PcJ48kyHeob/DCFEKDgYUs2hWFtGFkyE6Qnpke+04ZI8a43d/NRM
	 GZRzz9vYQ9DR6SmRGyyi2Kef5mGkJ+LWaGKvXEjaWuReeTtlC/YyiXXtH8Hu3LWj1l7Cq
	 S2K8Oilq8jMe473ioxYA9TB+dve/5IWsMZwnsKO/N//W84tbnLEhIZBFywJKMcr663Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793019016;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=jMgEBNPKmVCOot7xXoz/+CWsSkWb5gQVygyuTrxSDP4=;
	b=KvaUdWBEJpGnwCcJJnrJHr+X3bjTHkARdJwU0ZDdTU5aCU+ZmuSF9cTdcISsKWYhNM+x
	 Ae9e/DcJHwSFzVSJOOicu83JtmaUTbQtP3DXLZZXMkNBU36MfpnOcreO7RN0MJTiohU5/
	 dXMn/D/RUD7hbrRhTa3njUk9C1o2SrQpIynl/NUeXX4jZhyXIgg1mrQomcHtlZPoR80wT
	 r+s58InCLtEweP1Z0Yd0HG7FE7waC3yTVRv+jG88Cidie9djp8H515WfLzQpvYj63e+dX
	 IhbcvTPSIFOu5WU8uSaU8/CpQqEi3jsULVIJulE2fT11DzU2tWobqOWbYl6WQk9lTdQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GKWelPNY;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C46B606A31E;
	Mon, 26 Oct 2026 12:50:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GKWelPNY
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5BF161F01825;
	Mon, 26 Oct 2026 12:50:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793019015;
	bh=jMgEBNPKmVCOot7xXoz/+CWsSkWb5gQVygyuTrxSDP4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=GKWelPNYtZbU2UjArJlbPfvITv4C0VHkl/8rLtA2UiY4ELwIQNbvoGXIIHD3URISx
	 kBw43A9KFmwuYGLqcQSTFZKHJlDfND+TNKTX35k7KbwmTOS1GFGuhobt6jGDxIfc2A
	 C3tyvJPDsKWl0VIz9T2ik9C68HXybKfuQCc7n7HZlUZcEHIS5FuFI+JP/4lFYsFx73
	 zBE/uFT2J/71Cx1emQwquabqg4H1J4GymPox3buUM+QVZBTfGJe/LtOnJ7jlGKuhbL
	 a+FkLX7FTu+x+jZdd9Upz9KyiO9s4FiSgQuhoKxcTnAIoPb8CCAlzDIgeSXOmI8VeT
	 npBJDCgEn7ZyQ==
Message-ID: <sashiko-outbox-185247@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 1/3] dt-bindings: usb: snps,dwc3: describe two
 connectors sharing one HS bus
Reply-To: sashiko-reviews@lists.linux.dev
To: "Qianhui Xu" <xiaqinghuan@mail.ustc.edu.cn>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261026123211.243224-2-xiaqinghuan@mail.ustc.edu.cn>
References: <20261026123211.243224-1-xiaqinghuan@mail.ustc.edu.cn>
 <20261026123211.243224-2-xiaqinghuan@mail.ustc.edu.cn>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 26 Oct 2026 12:50:14 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [Medium] dt-bindings: usb: snps,dwc3: mux-state if-then blocks allow dupl=
icate 1
- [Medium] dt-bindings: usb: snps,dwc3: missing endpoint validation in port=
@0 hs-port
- [Medium] dt-bindings: usb: snps,dwc3: custom mux properties and incomplet=
e constraints
--

commit e70c1a471784d9fdae4486ffe851b5db8bc8f0cf
Author: Qianhui Xu <xiaqinghuan@mail.ustc.edu.cn>

dt-bindings: usb: snps,dwc3: describe two connectors sharing one HS bus

This commit updates Documentation/devicetree/bindings/usb/snps,dwc3-common.=
yaml
to describe two connectors sharing the High Speed D+/D- bus of a single DWC3
controller via a GPIO selector. It adds port-select-gpios on the controller
node and endpoint@0/endpoint@1 under port@0 with mux-state and
usb-role-switch properties.

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
Does replacing /schemas/graph.yaml#/properties/port on properties/ports/por=
t@0
with #/$defs/hs-port drop unevaluatedProperties: false validation for
unnumbered port@0/endpoint nodes and port@0/endpoint@[2-9a-f]+ nodes?

Previously, port@0 referenced /schemas/graph.yaml#/properties/port, which
applies /schemas/graph.yaml#/properties/endpoint (including
unevaluatedProperties: false) to all child nodes matching
^endpoint(@[0-9a-f]+)?$.

Because /schemas/graph.yaml#/$defs/port-base only validates
^endpoint(@[0-9a-f]+)?$ against /schemas/graph.yaml#/$defs/endpoint-base
(which leaves unevaluatedProperties open for extension), and $defs/hs-port
only applies #/$defs/hs-endpoint to ^endpoint@[01]$, any existing
single-connector DWC3 node using an unnumbered port@0/endpoint node (or
endpoint@2 and higher) will no longer have unevaluatedProperties: false
enforced on that endpoint.

In addition, in allOf below, the else branch when port-select-gpios is abse=
nt
only prohibits usb-role-switch and mux-state under patternProperties
^endpoint@[01]$, so placing usb-role-switch, mux-state, or arbitrary
undocumented properties inside an unnumbered port@0/endpoint node will
silently pass schema validation.

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

[Severity: Medium]
When port-select-gpios is present in allOf, should the then branch also
require top-level usb-role-switch on the controller node and disallow the
mutually exclusive single-connector port and connector properties?

In the DWC3 driver (even with the follow-up commit "usb: dwc3: support two
connectors sharing one HS data bus"), role-switch initialization in
dwc3_get_dr_mode(), dwc3_get_extcon(), and dwc3_drd_init() is gated on
device_property_read_bool(dwc->dev, "usb-role-switch") on the controller no=
de
itself:

  dwc3_drd_init()
    if (device_property_read_bool(dwc->dev, "usb-role-switch"))
      dwc3_setup_role_switch()
        dwc3_role_mux_init()

A device tree node that only specifies usb-role-switch inside endpoint@0 and
endpoint@1 as required by this schema will pass validation, but
dwc3_setup_role_switch() -> dwc3_role_mux_init() will never be called at
runtime.

Also, should this binding use the standard multiplexer consumer properties
(mux-controls / mux-states from Documentation/devicetree/bindings/mux/mux-c=
onsumer.yaml)
instead of introducing custom unprefixed port-select-gpios and mux-state
properties, and avoid referencing the Linux-specific helper
usb_role_switch_at_endpoint() in $defs/hs-endpoint?

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
Can a device tree node set mux-state =3D <1> on both endpoint@0 and endpoin=
t@1
and still pass validation?

Both if-then blocks in allOf check for const: 0 in their if condition:
- if endpoint@0/mux-state is 0, then endpoint@1/mux-state must be 1
- if endpoint@1/mux-state is 0, then endpoint@0/mux-state must be 1

Over enum: [0, 1], the second rule is the contrapositive of the first, so
both rules only reject the case where both endpoints set mux-state =3D <0>.
When both endpoint@0 and endpoint@1 specify mux-state =3D <1>, both if clau=
ses
evaluate to false and the duplicate mux-state =3D <1> configuration passes
dt_binding_check.

Additionally, because these if schemas do not include required guards along
the ports -> port@0 -> endpoint@0/1 -> mux-state path, an absent property
causes the if block to match vacuously. Would checking endpoint@0 for
const: 0 (requiring endpoint@1 const: 1) and const: 1 (requiring endpoint@1
const: 0), or using oneOf under the port-select-gpios then block, avoid thi=
s?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261026123211.2432=
24-1-xiaqinghuan@mail.ustc.edu.cn?part=3D1

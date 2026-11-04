Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793763871;
	b=wJ/glYCOxcO0H73rRJHdGxY6ZP1CbqwoziItG9S+TRx9BbsIVO8Fe1EZSDy7DpYjGaBj
	 IcgLWu6j3M0ixxy8KVmBp3IbtsZqwNqTRtZCVCGEjCirB/5q6GY5pRDuzpIuhWZlpg33f
	 Mo8GI8e4SJ0vfBm4emyVexKlVZW99eHqV3Nnu2qsxtSej+5Ak7wIdhA10jPwwZ2EIxFwU
	 8pFZGfgUZwPdW9Za0QIpzZeHOvZq+OKiINZgEWOmlfZoYGjna5p3cEDEAKpUF41LWRC6w
	 PxbI4LZYZgKSRUP266zCV0TtloKHg/AhzdtNbjPj4jJUyOEvAituGyuPfMLp6ST5zrQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793763871;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=nClR0iOHmGl8/bT21GuMVkhHkLEGkp9YZbaQ/jZYwYM=;
	b=jN0Rn05zjcThRpYctHwu0S4gVSB+e92x5PZTRuoMBjeqqpd1p3AEb01yMWcXBDfTL0mW
	 I+WenI6jI+HwFa7vMOkWPmGM1nCxpZecngYjFzOCQo49cL1JKuXCf/CLf//Xbf11jJByJ
	 zd/0zUiLUvqcz64/bglGCYQuBlnJPq+TSVel7nm/45YhzwHu59BwySESTUHnAiJa55VaV
	 cybEOn+ROwU+i39sDNgmsvHmW1JX8I2fgiB3jOGs1KLoUrXYLneuLj47rcUI9vj0bOXKE
	 9LswDG9guN3fNKK9fBFXcFcsEzS++vx2v6U5DIHKV0Gk7tVVdX6BdRP9/cHuJwP2Tdw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RQtcYfHX;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 397D7606A31B;
	Wed,  4 Nov 2026 03:44:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RQtcYfHX
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 904CC1F000C1;
	Wed,  4 Nov 2026 03:44:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793763870;
	bh=nClR0iOHmGl8/bT21GuMVkhHkLEGkp9YZbaQ/jZYwYM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=RQtcYfHX6ZQxkHh85uMG3puqFDqhpis4BefQR0pgfo0K5EISMTxW6NUdANWOp+iD/
	 J65mPg5v/LLWpQlhgDA3e6tu1aPj/5sSJtCZov4YMH3W6bRswD7kt5E+bRM8aNJDx8
	 5t8ZvZOlz337RouVCMukQIH3pAuSE7r7LGophQ2FBQ1jNj6WhaoggYoSiziNVMbmnn
	 ONHpyKn2WmRPK0h3nlC5dQSJbcQ4ed53Nm9/EQrwYMU55DvKOEY8dCsF4+oerJZqvw
	 JLr0zh4KIdsNz8yNG6eC+2tuRrQK8yeq2UNIlco4l93/UCBc5wjcT+fPWMY85TR1Q9
	 szCYkRpWhaOnA==
Message-ID: <sashiko-outbox-196629@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: usb: snps,dwc3: describe two
 connectors sharing one HS bus
Reply-To: sashiko-reviews@lists.linux.dev
To: "Qianhui Xu" <xiaqinghuan@mail.ustc.edu.cn>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261104032706.210042-2-xiaqinghuan@mail.ustc.edu.cn>
References: <20261104032706.210042-1-xiaqinghuan@mail.ustc.edu.cn>
 <20261104032706.210042-2-xiaqinghuan@mail.ustc.edu.cn>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 04 Nov 2026 03:44:30 +0000
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
- [Medium] dt-bindings: usb: snps,dwc3: missing endpoint/mux-state required=
 in oneOf
- [Medium] dt-bindings: usb: snps,dwc3: port@2 missing from top-level ports=
 schema
- [Medium] dt-bindings: usb: snps,dwc3: Linux-specific mux binding and port=
@2 split
--

commit f3f5f5bb87ea01fcf8b40062734fa5217caa615a
Author: Qianhui Xu <xiaqinghuan@mail.ustc.edu.cn>

dt-bindings: usb: snps,dwc3: describe two connectors sharing one HS bus

This commit extends snps,dwc3-common.yaml to describe two USB connectors
sharing a single High-Speed bus via a port-select-gpios multiplexer, using
port@0 and port@2 with per-endpoint mux-state and usb-role-switch
properties.

> diff --git a/Documentation/devicetree/bindings/usb/snps,dwc3-common.yaml =
b/Documentation/devicetree/bindings/usb/snps,dwc3-common.yaml
> index 6c0b8b6538246..0be2a6e83ee48 100644
> --- a/Documentation/devicetree/bindings/usb/snps,dwc3-common.yaml
> +++ b/Documentation/devicetree/bindings/usb/snps,dwc3-common.yaml
> @@ -13,6 +13,40 @@ description:
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
> +          connector to the shared High Speed data bus.  The two connecto=
rs of
> +          one controller must use different levels; the driver rejects a
> +          device tree where two connectors claim the same one.
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
> +      '^endpoint(@[0-9a-f]+)?$':
> +        $ref: '#/$defs/hs-endpoint'
> +
>  allOf:
>    - $ref: usb-drd.yaml#
>    - if:
> @@ -26,8 +60,87 @@ allOf:
>        $ref: usb.yaml#
>      else:
>        $ref: usb-xhci.yaml#
> +  - if:
> +      required: [port-select-gpios]
> +    then:
> +      # The mux path is only taken when the controller itself carries
> +      # "usb-role-switch": dwc3_get_dr_mode() forces dr_mode back to
> +      # peripheral, dwc3_get_extcon() skips the role-switch branch and
> +      # dwc3_drd_init() never calls dwc3_role_mux_init() without it.
> +      required: [dr_mode, ports, usb-role-switch]
> +      properties:
> +        dr_mode:
> +          const: otg
> +        ports:
> +          # Each connector is one port with a single endpoint: the mux-s=
tate
> +          # property on that endpoint says which level of the port-selec=
t GPIO
> +          # reaches it, so two connectors are two ports, not two endpoin=
ts of
> +          # one port.  port@1 is the SuperSpeed lane of the PHY and is a=
lready
> +          # described by snps,dwc3.yaml, so the second High Speed connec=
tor
> +          # lands on port@2.
> +          required: [port@0, port@2]
> +          properties:
> +            port@0:
> +              $ref: '#/$defs/hs-port'
> +            port@2:
> +              $ref: '#/$defs/hs-port'
> +
> +          # The two connectors must claim opposite levels of the port-se=
lect
> +          # GPIO; requiring both ports in every branch is what makes the=
 two
> +          # cases mutually exclusive for oneOf.
> +          oneOf:
> +            - required: [port@0, port@2]
> +              properties:
> +                port@0:
> +                  $ref: '#/$defs/hs-port'
> +                  properties:
> +                    endpoint:
> +                      properties:
> +                        mux-state:
> +                          const: 0
> +                port@2:
> +                  $ref: '#/$defs/hs-port'
> +                  properties:
> +                    endpoint:
> +                      properties:
> +                        mux-state:
> +                          const: 1
> +            - required: [port@0, port@2]
> +              properties:
> +                port@0:
> +                  $ref: '#/$defs/hs-port'
> +                  properties:
> +                    endpoint:
> +                      properties:
> +                        mux-state:
> +                          const: 1
> +                port@2:
> +                  $ref: '#/$defs/hs-port'
> +                  properties:
> +                    endpoint:
> +                      properties:
> +                        mux-state:
> +                          const: 0

[Severity: Medium]
Does the oneOf block under allOf allow incomplete or duplicate mux-state
configurations to pass schema validation while rejecting numbered
endpoint@0 nodes?

In $defs/hs-endpoint, usb-role-switch and mux-state are only constrained
with dependentRequired, so an endpoint omitting both properties satisfies
hs-endpoint. In addition, neither port@0 nor port@2 in the allOf then
branch specifies required: [endpoint], and the endpoint subschemas inside
the two oneOf branches only specify properties: { mux-state: { const: ... }=
 }
without required: [mux-state].

In JSON Schema, the properties keyword evaluates to true when the target
property is absent. If port@0 has an endpoint with mux-state =3D <0> and
usb-role-switch, while port@2 omits endpoint (or its endpoint omits both
mux-state and usb-role-switch), the first branch of oneOf evaluates to true
and the second branch evaluates to false, allowing an incomplete device
tree that fails at runtime in dwc3_role_mux_init() to pass validation.

Furthermore, $defs/hs-port defines patternProperties matching
^endpoint(@[0-9a-f]+)?$, whereas the oneOf branches only check the literal
unnumbered property name endpoint:

1. If port@0 uses endpoint with mux-state =3D <0> and port@2 uses endpoint@0
   with mux-state =3D <0>, port@2 has no unnumbered endpoint property and
   vacuously matches const: 1 in the first oneOf branch, allowing duplicate
   mux-state levels to pass.
2. If both port@0 and port@2 use endpoint@0 with opposite mux-state values
   0 and 1, neither port has an unnumbered endpoint property, so both
   branches of oneOf evaluate to true and oneOf fails.
3. If a port defines both endpoint and endpoint@1, hs-port accepts both and
   oneOf ignores endpoint@1, even though the commit message states that a
   third endpoint is rejected.

Should port@0 and port@2 require a single unnumbered endpoint (or constrain
endpoint count and naming consistently between hs-port and oneOf) and
require mux-state and usb-role-switch on each endpoint when
port-select-gpios is present?

> +    else:
> +      properties:
> +        ports:
> +          properties:
> +            port@0:
> +              patternProperties:
> +                '^endpoint(@[0-9a-f]+)?$':
> +                  properties:
> +                    usb-role-switch: false
> +                    mux-state: false
> =20
>  properties:
> +  port-select-gpios:
> +    maxItems: 1
> +    description:
> +      Selects which of the two connectors drives the controller's shared=
 High
> +      Speed data bus.  Each connector is described by "port@0" or "port@=
2",
> +      and the endpoint of that port carries the connector's own role-swi=
tch
> +      input and the "mux-state" level selecting it.

[Severity: Medium]
Is defining custom port-select-gpios and mux-state properties on the DWC3
controller and splitting the shared High-Speed bus across port@0 and port@2
the right hardware representation for this board topology?

There are three concerns with this binding design in
Documentation/devicetree/bindings/usb/snps,dwc3-common.yaml:

1. The DWC3 controller itself has a single High-Speed D+/D- pair routed
   through an external GPIO-controlled multiplexer to two connectors.
   Instead of introducing custom port-select-gpios and endpoint mux-state
   properties on the DWC3 binding, could this use the existing multiplexer
   bindings in Documentation/devicetree/bindings/mux/gpio-mux.yaml and
   Documentation/devicetree/bindings/mux/mux-consumer.yaml (such as
   mux-controls or mux-states)?
2. Under ports in snps,dwc3-common.yaml, port@0 represents the controller's
   High-Speed data bus and port@1 represents the SuperSpeed data bus. Since
   the controller still has only one physical High-Speed bus, why is the
   second connector modeled as a separate controller port (port@2) rather
   than two endpoints (endpoint@0 and endpoint@1) under port@0 or via an
   intermediate mux node?
3. Documentation/devicetree/bindings/writing-bindings.rst states that
   bindings should describe hardware rather than Linux driver
   implementation details. Here, $defs/hs-endpoint and the allOf conditional
   for port-select-gpios reference Linux kernel functions
   (usb_role_switch_at_endpoint(), dwc3_get_dr_mode(), dwc3_get_extcon(),
   dwc3_drd_init(), and dwc3_role_mux_init()) and force dr_mode and
   controller-level usb-role-switch into required to satisfy current driver
   control flow, even though usb-drd.yaml already defines dr_mode as
   optional with a default of otg.

> @@ -411,7 +524,7 @@ properties:
> =20
>      properties:
>        port@0:
> -        $ref: /schemas/graph.yaml#/properties/port
> +        $ref: '#/$defs/hs-port'
>          description: High Speed (HS) data bus.
> =20
>        port@1:

[Severity: Medium]
Will dtschema reject every device tree that sets port-select-gpios and
defines port@2 because port@2 is missing from the top-level
properties/ports block in snps,dwc3-common.yaml?

In snps,dwc3-common.yaml, the top-level properties/ports schema references
/schemas/graph.yaml#/properties/ports and only lists port@0 and port@1:

    ports:
      $ref: /schemas/graph.yaml#/properties/ports
      ...
      properties:
        port@0:
          $ref: '#/$defs/hs-port'
          description: High Speed (HS) data bus.

        port@1:
          $ref: /schemas/graph.yaml#/properties/port
          description: Super Speed (SS) data bus.

(Note also that the comment in allOf and the commit message state that
port@1 is described by snps,dwc3.yaml, whereas port@1 is defined here in
snps,dwc3-common.yaml.)

When dtschema processes a node referencing graph.yaml#/properties/ports
that defines properties, it automatically injects unevaluatedProperties:
false into that properties/ports subschema. In JSON Schema,
unevaluatedProperties: false on the top-level properties/ports block does
not see port@2 evaluated inside the separate allOf then branch, so any
device tree containing port@2 is rejected as having an unevaluated property.

Conversely, in the allOf else branch when port-select-gpios is absent, only
port@0 is restricted and port@2 is not disallowed with port@2: false.

Should port@2 be declared under the top-level properties/ports block and
disallowed with port@2: false in the else branch when port-select-gpios is
absent?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261104032706.2100=
42-1-xiaqinghuan@mail.ustc.edu.cn?part=3D1

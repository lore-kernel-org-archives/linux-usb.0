Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793965769;
	b=2FLOGWObSArPD/UATTGMBj4LNT5upp/ITj8joKEcuglQ/WPFZoDc27wXuNK4K7nNGRnU
	 16rO8qx0X5iy/OnETTkVPWts5uVkrj5o8JH1bpEx0wC3LPZ0Q7KggsSjJ5Pa9bVmFFVWQ
	 N4tmqmXQvw0JnEsxPLn1O8A8u9q1U/iC1QXENKJ3XXdI/ikq6TlPjWCd9M3WOYjtI/I/F
	 LOmTp2bzB6MZClsh4Xxvqq4vkVn8l/lFNA5b8ARgduRclhrPjDJQ3PabUqj/8pmRIJ7U6
	 Bke1iXcWzohUEBO/DHf9eBUDGiLsjh6Hrv3RWjWD5+EitSjMHnoF9dGEx9EqKaHKEsA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793965769;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=fz1Oiu2DG8akyKAYnkRUl1TsfidmRhyuwQeGhedDsmo=;
	b=a4BIBgMsznth6GPTch073UGbnPWYWNIYtFTezvnNL8WFWYWNpldAEXn10WO13La8wuCT
	 bbiP6zalGztdZlsFLeQppJTZU4orbNEyfj0mQiwEc+zWFcjpad9+C/N3NMjCohR+7x8Yk
	 LY5t+bTCxbzHg3J7z7tSDj9yyj6j2fO052fv2pcrPvmS/Veztik48zAnT1KhZdBA14VPv
	 kvzA4J3jCvYKgB1WlMf71WtCS67o1Nq6MHfdN3OEZOBUf2KWMfbEZmXlMXPSEyIEmExW5
	 c1JJ2n5uKn/+e19M0sAdLsH/vYPfentc1aafxr/TEKv7MCh6M6dyNAKFo0hm5UKc1TQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=h39ahG8G;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AFFF606A326;
	Fri,  6 Nov 2026 11:49:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=h39ahG8G
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C8C1F1F0089F;
	Fri,  6 Nov 2026 11:49:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793965769;
	bh=fz1Oiu2DG8akyKAYnkRUl1TsfidmRhyuwQeGhedDsmo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=h39ahG8GSU9pfWvCbym4AE5KMd+pPPhCFQLtA563nOUSjvhrECYPcYpbuvJCmSO/H
	 YjNRnRuS46QvhvvPYZdbnejZDvcOy2v74PVgHHSrKY7DzsPL68efAaVericL9y1QDf
	 wYrzfxvkYR8PJkWj3oOdPmRgqSt8PemSbsVFFijjSneAsV838dKJHvsDTjK47nHmls
	 gBw22CE5aDXPOZJsTKFvD/bLsXsUCMPukimLTYayUgPDejFFXo80rmgkO3Yqj44uwi
	 GMn5aPWNm0JMPznAfJNHbud1r/Jhjm0L0BzJ1/VoAmszCdUhU86isHx9j9nGt4H9pb
	 K4ww11/N8tWQA==
Message-ID: <sashiko-outbox-201360@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: usb: snps,dwc3: describe two
 connectors sharing one HS bus
Reply-To: sashiko-reviews@lists.linux.dev
To: "Qianhui Xu" <xiaqinghuan@mail.ustc.edu.cn>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261106112811.963923-2-xiaqinghuan@mail.ustc.edu.cn>
References: <20261106112811.963923-1-xiaqinghuan@mail.ustc.edu.cn>
 <20261106112811.963923-2-xiaqinghuan@mail.ustc.edu.cn>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 06 Nov 2026 11:49:28 +0000
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
- [Medium] dt-bindings: usb: snps,dwc3: missing required on endpoint and
  mux-state
- [Medium] dt-bindings: usb: snps,dwc3: hs-port endpoint pattern
  mismatches oneOf
- [Medium] dt-bindings: usb: snps,dwc3: port@2 missing from top-level
  ports schema
- [Low] dt-bindings: usb: snps,dwc3: shared HS mux modeled as port@2
  with Linux refs
--

commit f8622d01bfd3dd39d739606bdf63957e847faee6
Author: Qianhui Xu <xiaqinghuan@mail.ustc.edu.cn>

dt-bindings: usb: snps,dwc3: describe two connectors sharing one HS bus

This commit extends snps,dwc3-common.yaml to describe two connectors sharing
a single High Speed data bus selected via port-select-gpios.

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

[Severity: Medium]
Does patternProperties here mismatch the oneOf check below, which only
inspects the unnumbered endpoint node name?

Because hs-port matches '^endpoint(@[0-9a-f]+)?$', it accepts multiple
endpoints in one port as well as numbered endpoints like endpoint@0.  If
both port@0 and port@2 use endpoint@0 with opposite mux-state values,
neither port has an unnumbered endpoint property, so both oneOf branches
below match vacuously and validation fails.  Conversely, if port@0 uses
endpoint and port@2 uses endpoint@0, both connectors can claim the same
mux-state value and still pass oneOf.

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

[Severity: Low]
Should a shared High Speed bus routed through an external GPIO mux be
modeled as multiple endpoints under port@0 (or using standard mux bindings
such as gpio-mux.yaml and mux-states) rather than as a second controller
port@2 with custom port-select-gpios and mux-state properties?  In OF graph
bindings, ports under the controller node represent the controller's own
physical buses, and the controller still has only one High Speed bus at
port@0.

Also, the property descriptions and comments above reference Linux driver
internals (usb_role_switch_at_endpoint(), dwc3_get_dr_mode(),
dwc3_get_extcon(), dwc3_drd_init(), and dwc3_role_mux_init()) to justify
binding constraints, and note that port@1 is described by snps,dwc3.yaml
when port@1 is defined in snps,dwc3-common.yaml.

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
Can a device tree omit endpoint or mux-state on one of the ports and still
pass this oneOf check?

In hs-endpoint, mux-state and usb-role-switch are only linked via
dependentRequired, and neither hs-port nor the oneOf branches list endpoint
or mux-state in required.  In JSON Schema, properties constraints succeed
when the named property is absent, so if port@0 has an endpoint with
mux-state =3D <0> and usb-role-switch while port@2 omits mux-state and
usb-role-switch (or omits endpoint altogether), the first oneOf branch
matches and dtbs_check passes a device tree that dwc3_role_mux_init() will
reject at runtime with -EINVAL.

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

[ ... ]

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
Does omitting port@2 from the top-level ports properties cause dtbs_check
to reject port@2 as an unevaluated property?

Top-level properties.ports references /schemas/graph.yaml#/properties/ports
and only declares port@0 and port@1, so dtschema's graph fixup on
/properties/ports rejects port@2 even when port-select-gpios is present.
Defining port@2 under top-level properties.ports.properties and setting
port@2: false in the else branch above when port-select-gpios is absent
would allow it only when the GPIO mux is used.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261106112811.9639=
23-1-xiaqinghuan@mail.ustc.edu.cn?part=3D1

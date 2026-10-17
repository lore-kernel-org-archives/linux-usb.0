Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81B323CB542;
	Sat, 17 Oct 2026 08:28:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792225722; cv=none; b=md4I3OwDuMUGuKyoXpeWNO92ePdRJbBucYTQmWYrBfdwOZ60vZZE8zHP3ywfof86FZ5v0e6PbEr9e2W1aLoxTMndSOz2lu0l9YXjBGr9YCuo4fqdsgxSqxcWPgQMEsXpy/zy9yAUGbQw77UtfxDl4VNlzSXPl5nWMXDe49eHZpw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792225722; c=relaxed/simple;
	bh=wZkYRm6OrqK/DQ4oY4JaIcyrY6IpAzfA7KJh6cLq+DI=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=T902OE3MLDYQ4fstffBvq6yh/ZTvLkPdRyPwceuJmxAP8frYAwsVf0wQV7VYfGDtyvNprz/dcXQTZhpMF5kZY7I1TI80kdYTw6RlTQy0bLkkejlnY3+i7/va7Jjk769Ud4y/0Xblbep2JrGpCnLrtgDirj/DS6DUlTvf/a6WeuI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Rbz6c+He; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Rbz6c+He"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2028B1F000C4;
	Sat, 17 Oct 2026 08:28:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792225721;
	bh=a0N4pfiPlAV736gNkFlC1Xo1EYe0tZQvtDBsOXnRmmA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Rbz6c+HegRZvbo3euwJaP6LhinddJolrSLpcqSKWBusUMeLxRZcsOtw/7f/tF+muZ
	 SLv2BZazHxqumg7lwKqv2ZBuovrWCGYhWPaOa6A5BJU50mptXJ9zobC8hr15HmGJna
	 xkTdmkbR7w8dOdyM8I/gc6XOJaiARqSbU7h4hNJRdWLYXw5J0ed/1gVPtemkh9lSvY
	 xz13nI9oDCQOkfyiTM7fYm/sW7ccWnW/IyduczVCEvh4UHWc/tmHBgFDaak4hzsgMM
	 +s8lK8KUfaE4mXFvJXRFwyrEFnaPHH81U3GYKZORA5y2zIkeuc3eV1hdAtHcGd4Cuu
	 uPXC0ekP+810A==
Message-ID: <sashiko-outbox-175391@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: usb: snps,dwc3: describe the
 two-connector HS data path
Reply-To: sashiko-reviews@lists.linux.dev
To: "Qianhui Xu" <xiaqinghuan@mail.ustc.edu.cn>, linux-usb@vger.kernel.org
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261017081320.220525-2-xiaqinghuan@mail.ustc.edu.cn>
References: <20261017081320.220525-1-xiaqinghuan@mail.ustc.edu.cn>
 <20261017081320.220525-2-xiaqinghuan@mail.ustc.edu.cn>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 17 Oct 2026 08:28:40 +0000
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 5 potential issue(=
s) to consider:
- [Medium] dt-bindings: usb: snps,dwc3: board-level HS GPIO mux modeled in =
controller
- [Medium] dt-bindings: usb: snps,dwc3: port@2 models second connector as c=
ontroller bus
- [Medium] dt-bindings: usb: snps,dwc3: usb-role-switch placed on graph end=
point node
- [Medium] dt-bindings: usb: snps,dwc3: port-select-gpios conditional omits=
 required ports
- [Medium] dt-bindings: usb: snps,dwc3: schema allows identical mux-state o=
n both ports
--

commit ee0273505f8490131392861ded800f75a8b82b18
Author: Qianhui Xu <xiaqinghuan@mail.ustc.edu.cn>

dt-bindings: usb: snps,dwc3: describe the two-connector HS data path

This patch updates Documentation/devicetree/bindings/usb/snps,dwc3-common.y=
aml
to describe a shared High Speed data bus connected to two receptacles via a
GPIO-controlled selector, adding port-select-gpios, port@2, and endpoint
properties mux-state and usb-role-switch.

> diff --git a/Documentation/devicetree/bindings/usb/snps,dwc3-common.yaml =
b/Documentation/devicetree/bindings/usb/snps,dwc3-common.yaml
> index 6c0b8b6538246..3d012f22231cb 100644
> --- a/Documentation/devicetree/bindings/usb/snps,dwc3-common.yaml
> +++ b/Documentation/devicetree/bindings/usb/snps,dwc3-common.yaml
> @@ -13,6 +13,34 @@ description:
>    Defines the properties of the DWC3 core as being embedded in either an
>    vendor-specific implementation or as a standalone component.
> =20
> +$defs:
> +  hs-port:
> +    $ref: /schemas/graph.yaml#/$defs/port-base
> +    unevaluatedProperties: false
> +
> +    properties:
> +      endpoint:
> +        $ref: /schemas/graph.yaml#/$defs/endpoint-base
> +        unevaluatedProperties: false
> +
> +        properties:
> +          usb-role-switch:
> +            type: boolean
> +            description:
> +              This connector provides its own role-switch input to the
> +              controller.
> +
> +          mux-state:
> +            $ref: /schemas/types.yaml#/definitions/uint32
> +            enum: [0, 1]
> +            description:
> +              Logical level of the port-select GPIO which connects this
> +              connector to the shared High Speed data bus.
> +
> +        dependentRequired:
> +          usb-role-switch: [mux-state]
> +          mux-state: [usb-role-switch]

[Severity: Medium]
Does usb-role-switch belong on the OF graph endpoint subnode here?

In Documentation/devicetree/bindings/usb/usb-drd.yaml, usb-role-switch is a
device-level boolean property indicating that the controller node registers=
 a
USB role switch.

When a connector driver resolves its role switch over the OF graph via:

  usb_role_switch_get() / fwnode_usb_role_switch_get()
    -> fwnode_graph_devcon_matches()
      -> fwnode_graph_get_remote_port_parent()
        -> of_fwnode_graph_get_port_parent()

the lookup walks from the remote endpoint up past port@N and ports to the
parent controller device node, and checks:

  if (!fwnode_property_present(node, "usb-role-switch"))
          continue;

on the parent device node rather than the endpoint subnode.

In addition, because dependentRequired under $defs:hs-port:properties:endpo=
int
requires usb-role-switch whenever mux-state is present and vice versa,
isn't usb-role-switch on the endpoint completely redundant with mux-state?

> +
>  allOf:
>    - $ref: usb-drd.yaml#
>    - if:
> @@ -26,8 +54,37 @@ allOf:
>        $ref: usb.yaml#
>      else:
>        $ref: usb-xhci.yaml#
> +  - if:
> +      required: [port-select-gpios]
> +    then:
> +      required: [dr_mode, usb-role-switch]
> +      properties:
> +        dr_mode:
> +          const: otg
> +        ports:
> +          required: [port@0, port@2]
> +          properties:
> +            port@0:
> +              required: [endpoint]
> +              properties:
> +                endpoint:
> +                  required: [usb-role-switch, mux-state]
> +            port@2:
> +              required: [endpoint]
> +              properties:
> +                endpoint:
> +                  required: [usb-role-switch, mux-state]

[Severity: Medium]
Since ports is optional at the top level of snps,dwc3-common.yaml (where
required only lists compatible and reg), will a node with port-select-gpios,
dr_mode =3D "otg", and usb-role-switch that omits the ports node altogether
silently pass dt_binding_check?

In JSON Schema, properties:ports: only applies if the ports child node is
present. Should ports also be listed in then:required: alongside dr_mode and
usb-role-switch?

Conversely, without an else branch or dependency, won't port@2 and the
endpoint mux-state and usb-role-switch properties remain allowed even when
port-select-gpios is absent?

[Severity: Medium]
Can a device tree specify the same mux-state value (for example, both <0> or
both <1>) on ports/port@0/endpoint and ports/port@2/endpoint and still pass
schema validation?

Both port@0 and port@2 reference #/$defs/hs-port, which independently checks
enum: [0, 1] on each endpoint, without constraining the two endpoints to use
distinct GPIO levels.

> =20
>  properties:
> +  port-select-gpios:
> +    maxItems: 1
> +    description:
> +      Selects which of two connectors drives the controller's shared High
> +      Speed data bus. Each connector is described by a "ports" endpoint =
that
> +      carries its own role-switch input and the "mux-state" level select=
ing
> +      it. The controller switches the data path only after it has stoppe=
d the
> +      role of the previous connector.

[Severity: Medium]
Should a board-level GPIO multiplexer on the High Speed D+/D- lines be mode=
led
using the existing mux bindings instead of adding controller-specific
port-select-gpios and endpoint mux-state properties to snps,dwc3-common.yam=
l?

The GPIO switches external board routing between two receptacles rather than
an internal block of the Synopsys DWC3 IP core, and the description also
encodes driver switching policy ("The controller switches the data path only
after it has stopped the role of the previous connector").

Could this hardware topology be represented using
Documentation/devicetree/bindings/mux/gpio-mux.yaml (mux-gpios),
Documentation/devicetree/bindings/mux/mux-consumer.yaml (mux-controls /
mux-states), or Documentation/devicetree/bindings/usb/usb-switch.yaml?

> +
>    extcon:
>      maxItems: 1
>      deprecated: true
> @@ -411,13 +468,17 @@ properties:
> =20
>      properties:
>        port@0:
> -        $ref: /schemas/graph.yaml#/properties/port
> +        $ref: '#/$defs/hs-port'
>          description: High Speed (HS) data bus.
> =20
>        port@1:
>          $ref: /schemas/graph.yaml#/properties/port
>          description: Super Speed (SS) data bus.
> =20
> +      port@2:
> +        $ref: '#/$defs/hs-port'
> +        description: Second connector on the multiplexed High Speed data=
 bus.
> +

[Severity: Medium]
Does adding port@2 under properties:ports conflate the DWC3 controller's own
hardware buses with remote connectors?

In snps,dwc3-common.yaml, the children of ports represent buses on the
controller itself (port@0 for the High Speed data bus and port@1 for the Su=
per
Speed data bus). When a single High Speed bus is routed to two remote targe=
ts,
OF graph bindings normally model either an intermediate mux node in the gra=
ph
or multiple numbered endpoints (endpoint@0, endpoint@1) under port@0.

Also, by changing port@0 from /schemas/graph.yaml#/properties/port to
#/$defs/hs-port (which uses /schemas/graph.yaml#/$defs/port-base with
unevaluatedProperties: false and only defines an unnumbered endpoint node),
won't this reject numbered endpoint@N children under port@0, while leaving
port@1 (Super Speed) as a single port even though the commit message notes
that Super Speed lanes stay per connector?

>    wakeup-source:
>      $ref: /schemas/types.yaml#/definitions/flag
>      description:

Base commit: 90d9f76ccb72ec024ef476b4229f3dd1957d7b26
--=20
2.51.0

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261017081320.2205=
25-1-xiaqinghuan@mail.ustc.edu.cn?part=3D1

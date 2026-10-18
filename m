Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 466263DE45A;
	Sun, 18 Oct 2026 23:07:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792364828; cv=none; b=ZP9Bhyoj1PcQfU/V8jh74edtgcD++Pn8/UNBtM7xXzthS4cbPgS/aXuycvhxIMDFxnQ6C1AEblFMS8j11X7XoxrV934zgo1F046Tr8JD6Skz1IWuQ4ri5Nb5TuubuFruggTc5QRJeGHBwSkVOqxX83zRM8JKImJnyYhlkymnAew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792364828; c=relaxed/simple;
	bh=Qvoo/p3vmOBNTXRqkWIqn8zLnfvXIpaXlToRQBd+ZyE=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=iLEcfGxwn4zUHU9yy9ltK1jHHk0RDyXD3++ZmxdCR5yymsTW8Yirm9uMvQ0TTfUi/HwciEy4O2PcM7ezVI+kV4LhvAer1+QsZpRNmGLiPbBLuYUKGP7JrKFxv6iAorEwUtmwo0EmtLeIP2ZY3fk1Brxxl4NWXlyOqdKd3lWZeSg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZWnCIMOd; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZWnCIMOd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 96DDB1F000C4;
	Sun, 18 Oct 2026 23:07:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792364823;
	bh=6Iaop+OWHmG6difkSyl9f2fA+S+AXNQV9idXRuE8P1w=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ZWnCIMOdeu/2BIXyKimeeuYy+bvhHPqx1VDYsFWl0xOI48XdFpV40jM1jz+FIoPh3
	 LMexdgvhOdjv5gtuov6BN860mp3aJfEVd5J6i6cGe2PV3M30WdqK7bed/yARlkqcGt
	 oHucBeMTWgsAFKmoJ0z6O0uEWjme+sMqfUl7Cm8tw+vxKFiJjqMRaup5dDKW7fwVjF
	 wr8vkmYfAE4LDWXe4uviucpDYC4E5pF1TfwWNEkba6eJdFHpBJynDuFg1Aeq4b0Rf9
	 2gpLx/xYNnA6hnn9U2/wt4Kxhh/U7JuCKIRYBj3c+Bg5TagMn5Wp7juaIPCHllp9bD
	 5Z8RzsQG9euaA==
Message-ID: <sashiko-outbox-176444@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: usb: fsa4480: Add an optional audio
 port/endpoint
Reply-To: sashiko-reviews@lists.linux.dev
To: "Val Packett" <val@packett.cool>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261018225906.1265299-2-val@packett.cool>
References: <20261018225906.1265299-1-val@packett.cool>
 <20261018225906.1265299-2-val@packett.cool>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 18 Oct 2026 23:07:03 +0000
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] dt-bindings: usb: fsa4480: conflicting usb-switch-ports.yaml ref=
 in allOf
--

commit bdd98503313bd1c358f2a30a54c1cf8d1fe906dd
Author: Val Packett <val@packett.cool>

dt-bindings: usb: fsa4480: Add an optional audio port/endpoint

This commit updates the fcs,fsa4480 binding to support a multi-port graph
layout so that hotplug notifications can be delivered to an audio codec
driver through a second port while keeping the single-port layout valid.

> diff --git a/Documentation/devicetree/bindings/usb/fcs,fsa4480.yaml b/Doc=
umentation/devicetree/bindings/usb/fcs,fsa4480.yaml
> index 89b1fb90aeebc..9dfe95b6adf35 100644
> --- a/Documentation/devicetree/bindings/usb/fcs,fsa4480.yaml
> +++ b/Documentation/devicetree/bindings/usb/fcs,fsa4480.yaml
> @@ -9,31 +9,11 @@ title: ON Semiconductor Analog Audio Switch
>  maintainers:
>    - Bjorn Andersson <bjorn.andersson@linaro.org>
> =20
> -properties:
> -  compatible:
> -    oneOf:
> -      - const: fcs,fsa4480
> -      - items:
> -          - enum:
> -              - ocs,ocp96011
> -          - const: fcs,fsa4480
> -
> -  reg:
> -    maxItems: 1
> -
> -  interrupts:
> -    maxItems: 1
> -
> -  vcc-supply:
> -    description: power supply (2.7V-5.5V)
> -
> -  mode-switch: true
> -  orientation-switch: true
> -
> -  port:
> +$defs:
> +  controller-port:
>      $ref: /schemas/graph.yaml#/$defs/port-base
>      description:
> -      A port node to link the FSA4480 to a TypeC controller for the purp=
ose of
> +      A port node to link the FSA4480 to a Type-C controller for the pur=
pose of
>        handling altmode muxing and orientation switching.
>      unevaluatedProperties: false
> =20
> @@ -69,15 +49,56 @@ properties:
>                    - AUX+ connected to SBU2
>                    - AUX- connected to SBU1
> =20
> +properties:

[ ... ]

> +  port:
> +    $ref: "#/$defs/controller-port"
> +
> +  ports:
> +    $ref: /schemas/graph.yaml#/properties/ports
> +    properties:
> +      port@0:
> +        $ref: "#/$defs/controller-port"
> +      port@1:
> +        $ref: /schemas/graph.yaml#/$defs/port-base
> +        description:
> +          A port node to link the FSA4480 to an audio codec in order to
> +          notify it whenever an analog audio adapter is plugged/unplugge=
d.
> +        unevaluatedProperties: false
> +
>  required:
>    - compatible
>    - reg
> -  - port
> =20
>  allOf:
>    - $ref: usb-switch.yaml#
>    - $ref: usb-switch-ports.yaml#
> =20
> +oneOf:
> +  - required:
> +      - port
> +  - required:
> +      - ports

[Severity: Medium]
Does keeping usb-switch-ports.yaml# in allOf conflict with the custom ports
schema defined here?

In Documentation/devicetree/bindings/usb/usb-switch-ports.yaml, ports is
defined for SuperSpeed switches:

  ports:
    $ref: /schemas/graph.yaml#/properties/ports
    properties:
      port@0:
        $ref: /schemas/graph.yaml#/properties/port
        description:
          Super Speed (SS) Output endpoint to the Type-C connector

      port@1:
        $ref: /schemas/graph.yaml#/$defs/port-base
        description:
          Super Speed (SS) Input endpoint from the Super-Speed PHY
        ...
        properties:
          endpoint:
            $ref: /schemas/graph.yaml#/$defs/endpoint-base
            ...
            properties:
              data-lanes:
                minItems: 1
                maxItems: 8

Because allOf requires validation against both schemas, port@0 in
usb-switch-ports.yaml references /schemas/graph.yaml#/properties/port, which
enforces unevaluatedProperties: false on endpoint with no data-lanes proper=
ty
(as noted in commit 11e80d371bbb ("dt-bindings: usb: fcs,fsa4480: Fix defau=
lt
port schema reference")). That rejects valid data-lanes properties inside
ports/port@0/endpoint (such as on ocs,ocp96011 in
arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts when converted to ports),
defeating #/$defs/controller-port on port@0.

At the same time, port@1 here uses /schemas/graph.yaml#/$defs/port-base
instead of /schemas/graph.yaml#/properties/port, which leaves port@1/endpoi=
nt
without unevaluatedProperties: false and inherits the SuperSpeed data-lanes
definition from usb-switch-ports.yaml, while ports does not require port@0.

Following commit bd8c3ce6d7a2 ("dt-bindings: usb: switch: split out ports
definition") for bindings with custom ports layouts, should
usb-switch-ports.yaml# be dropped from allOf, port@1 changed to reference
/schemas/graph.yaml#/properties/port, and required: [port@0] added under
ports?

> +
>  additionalProperties: false

[ ... ]

>
>
>

 base-commit: 90d9f76ccb72ec024ef476b4229f3dd1957d7b26
--=20
2.51.2

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261018225906.1265=
299-1-val@packett.cool?part=3D1

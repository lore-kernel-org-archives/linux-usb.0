Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794894010;
	b=Yde9IUue7w60PAk8cEaLGR47hcFePyk+2mJGRwIASDM3UxWj9o9NRyr9suMU/YsfFUtC
	 fU7eu2uWHyfFa4HP3MfLFfPwp+gGkEWmT/eUKIJ6WUb/Yurrc6Tz9CQuRhB19AEOGPu0m
	 eYIhi6GVUUKtHLvzUd7F2vZ7vsviBkeMlaiScgU4HK9FaN7DtTlCdEGu+SXzJRCYMDpTt
	 bIoi61mNDd6OlHLfCC+BtzrrT/Kg7AqFLZx8m/I6jcSAXOPq9l4P/fEW2QqnoRbic8fOQ
	 oHWmE+Co8iAvI3B+E/+q0Jc4mk+eSCCz2O3p25CkU42r2BAd6KJuDPfFFcbPT4uw/cg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794894010;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=VqMfknTG7tvSqj9fOm35OQR0fY0btN0Q3Cy4uPMgz+k=;
	b=uFa7Cj2nPOU8u5TrbaNcAow2U3J6PzWl6IFrpJCGVKsqi5zKDha/4m8Oe/3GHqjKUiN/
	 asVPbEkEJ0UpOtZ6wliHAFKfmoEuxRKaNaYUvEfM3NhSPKzUfKbspbOYTQyhmO1f6GtOl
	 2o4Fk8W8IxI87A7BLEdCklr6ObXCRopDDqk8Z7hmbhoMbokpCjtNT9rVaXX6z6CyAXRo7
	 GxhbpQcrBiuwQ0WRzDI+EogzKaD0/6jD+xy0cNKA0P7pUBCq7vkD1LGD2viLfHYwTYrkR
	 O77nEHecDaHrTQUe/VzwHPg6CblfsvpS6Hq9iQI1dGyhaJEfxuW97qQLgdjQ4ZhvICw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FB8aESZ7;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17D07606A31C;
	Tue, 17 Nov 2026 05:40:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FB8aESZ7
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 46E421F000C4;
	Tue, 17 Nov 2026 05:40:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794894009;
	bh=VqMfknTG7tvSqj9fOm35OQR0fY0btN0Q3Cy4uPMgz+k=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=FB8aESZ7XnY8GSNDU8syP6yC93axAl8Z7wBpXO0caQjc+5ioTAsCEM3/O+zR0G8ph
	 sjjwiTqDCRJu9txGGACuA8tuvZq6k2zTHHM0ncM1ZydK2SL/6O8Jt/wEOqLt7pFYVf
	 BB2Jt0U9QuEt3JHjQQXkdPHwTe+sH1oyR02+iLNG3odtqIWs8bwsIhboKq5VzMT2Fo
	 A/+OAEfgtn4cYx6Iz9I4WiIE06BGWcgxJ/In6FrnBe2/uPpToZxMd03kDzw41vqCeh
	 6DMvpDQzdGYzHY3QRJV8eTsQS8dq/TrhCBnfREuECbk3DU/QymHKbmZhqvdrNFSL5U
	 roVhFfKP/LsLw==
Message-ID: <sashiko-outbox-218217@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v9 1/3] dt-bindings: usb: snps,dwc3: two connectors are
 two endpoints of one port
Reply-To: sashiko-reviews@lists.linux.dev
To: "Qianhui Xu" <xiaqinghuan@mail.ustc.edu.cn>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261117052137.32833-2-xiaqinghuan@mail.ustc.edu.cn>
References: <20261117052137.32833-1-xiaqinghuan@mail.ustc.edu.cn>
 <20261117052137.32833-2-xiaqinghuan@mail.ustc.edu.cn>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 17 Nov 2026 05:40:08 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 3 potential
issues to consider:
- [Medium] dt-bindings: usb: snps,dwc3: unconditional hs-port on port@0
  breaks non-mux DTs
- [Low] dt-bindings: usb: snps,dwc3: hs-port allows omitting mux-state
  on one endpoint
- [Low] dt-bindings: usb: snps,dwc3: commit message written as v8-to-v9
  changelog
--

commit 847f1c050f1cee5ea74edfc8b8a467a8d17c4c69
Author: Qianhui Xu <xiaqinghuan@mail.ustc.edu.cn>

> dt-bindings: usb: snps,dwc3: two connectors are two endpoints of one port
>
> Rework of the v8 binding per Rob Herring's review of
> 2026-11-10 16:36Z (<20261110163640.GA85824-robh@kernel.org>):
>
>   "ports are for separate data streams. Endpoints are for mux'ed data
>    streams. This looks like the latter, so port@0 should have 2 endpoints
>    and port@2 dropped."
>
> and, for the GPIO property:
>
>   "Use the gpio mux binding."
>
> Two connectors sharing one High Speed D+/D- pair are two mux'ed data
> streams of one port, so they become endpoint@0 and endpoint@1 of port@0
> (the Super Speed lane stays port@1).  The GPIO that selects between them
> is no longer described by a private "port-select-gpios" property but by a
> "gpio-mux" controller referenced from "mux-controls", and the endpoint of
> each connector carries the mux state that reaches it.
>
> *** AI-assistance disclosure ***
> This patch was prepared with the help of an LLM coding assistant.  The
> author reviewed every line and ran the gates quoted in the series notes.
>
> Signed-off-by: Qianhui Xu <xiaqinghuan@mail.ustc.edu.cn>

[Severity: Low]
This commit message is written as a v8-to-v9 revision log ("port@2 dropped",
"no longer described by a private port-select-gpios property"), but neither
port@2 nor port-select-gpios exists in the baseline binding.  Could the com=
mit
message describe the newly added dual-connector High Speed mux binding
relative to the baseline tree, moving the inter-version changelog notes bel=
ow
the "---" separator?

> diff --git a/Documentation/devicetree/bindings/usb/snps,dwc3-common.yaml =
b/Documentation/devicetree/bindings/usb/snps,dwc3-common.yaml
> index 6c0b8b6538246..81e3561e47ce6 100644
> --- a/Documentation/devicetree/bindings/usb/snps,dwc3-common.yaml
> +++ b/Documentation/devicetree/bindings/usb/snps,dwc3-common.yaml
> @@ -13,6 +13,84 @@ description:
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
> +          State of the High Speed data bus multiplexer which connects th=
is
> +          connector to the controller.  The two connectors of one contro=
ller
> +          must use different states; the driver rejects a device tree wh=
ere
> +          two connectors claim the same one.
> +
> +    dependentRequired:
> +      usb-role-switch: [mux-state]
> +      mux-state: [usb-role-switch]
> +
> +  hs-port:
> +    $ref: /schemas/graph.yaml#/$defs/port-base
> +    unevaluatedProperties: false
> +
> +    # The two connectors are two mux'ed data streams of the same High Sp=
eed
> +    # bus, so they are two endpoints of one port, not two ports: "ports"
> +    # describes the controller's own data streams (HS in port@0, SS in
> +    # port@1), and an endpoint describes one stream multiplexed onto a p=
ort.
> +    properties:
> +      '#address-cells':
> +        const: 1
> +
> +      '#size-cells':
> +        const: 0
> +
> +      endpoint@0:
> +        $ref: '#/$defs/hs-endpoint'
> +        required: [reg]
> +
> +      endpoint@1:
> +        $ref: '#/$defs/hs-endpoint'
> +        required: [reg]
> +
> +    required: ['#address-cells', '#size-cells', endpoint@0, endpoint@1]
> +
> +    # The two connectors must claim opposite mux states; requiring both
> +    # endpoints in every branch is what makes the two cases mutually
> +    # exclusive for oneOf.
> +    oneOf:
> +      - properties:
> +          endpoint@0:
> +            properties:
> +              mux-state:
> +                $ref: /schemas/types.yaml#/definitions/uint32
> +                const: 0
> +          endpoint@1:
> +            properties:
> +              mux-state:
> +                $ref: /schemas/types.yaml#/definitions/uint32
> +                const: 1
> +      - properties:
> +          endpoint@0:
> +            properties:
> +              mux-state:
> +                $ref: /schemas/types.yaml#/definitions/uint32
> +                const: 1
> +          endpoint@1:
> +            properties:
> +              mux-state:
> +                $ref: /schemas/types.yaml#/definitions/uint32
> +                const: 0

[Severity: Low]
Does hs-port allow one of the two endpoints to omit both usb-role-switch and
mux-state?

Because hs-endpoint only ties usb-role-switch and mux-state together via
dependentRequired, and neither endpoint@0/endpoint@1 nor the oneOf branches
specify required: [mux-state], an endpoint that omits both properties
vacuously satisfies properties.mux-state in JSON Schema.  If endpoint@0 sets
usb-role-switch and mux-state =3D <0> while endpoint@1 omits both, the first
oneOf branch matches and the second fails on endpoint@0, so the incomplete =
DT
node passes dtbs_check even though the driver requires both properties on
both endpoints.

[ ... ]

> @@ -411,7 +528,7 @@ properties:
> =20
>      properties:
>        port@0:
> -        $ref: /schemas/graph.yaml#/properties/port
> +        $ref: '#/$defs/hs-port'
>          description: High Speed (HS) data bus.
> =20
>        port@1:

[Severity: Medium]
Does replacing /schemas/graph.yaml#/properties/port with #/$defs/hs-port on
the top-level port@0 property break dtbs_check for all non-muxed DWC3 nodes?

Applying #/$defs/hs-port unconditionally here (in addition to the condition=
al
branch when mux-controls is present) forces every DWC3 node with ports/port=
@0
to define #address-cells, #size-cells, endpoint@0, and endpoint@1, rejecting
existing single-endpoint DWC3 device trees such as qcom/sm8250.dtsi.
Moreover, when mux-controls is absent, the else branch in allOf forbids
mux-state on both endpoints, causing both branches of hs-port's oneOf to ma=
tch
vacuously and making port@0 impossible to validate without mux-controls.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261117052137.3283=
3-1-xiaqinghuan@mail.ustc.edu.cn?part=3D1

Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795228839;
	b=an5grc+h61yKTKfbQvMKMzhO3H2JOgTp+9CL+VJQ5blHZwmJMhEshuv0HO88dlbAGjmr
	 qX6ouOul13Yf/84A5a0UaKpiMXE0V06j1mSWQOqRSfM2dEIqtvsKE/7zpJxr5+EMc5Wk0
	 zJIOZi8kRs2oMHgnigOWuEh43MGfdMRMABEOrX/pwNhgVVhrpPuz0itxtzq5KRxRBzwxi
	 Pf5z8Cr6iOUimScYzf3TTqKF8zS0r9/ZlhccsjFCPjz4B9axbseUSAHFg6XwMtG0zEdNC
	 cOzy4jyh9dSp6Px2wEPstJLRlD1r+zu/hGJzY3Cq6lxMMjK8Mg8UqbE/Z6Clm5Msmaw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795228839;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=acD3Hn9eXi71wVEp245Iem/X+MGIjwCajsfdnlsJN6g=;
	b=TbtQHLh2ycHtSKqaywSpqq2wFgdYfpVXxpZpHTAVOW14Yk11MRqx5uN42iFyRAP8dYJY
	 WwgKFY18K4Pf9kN7TZN8S9tqojSdTFUD9X0F0o8UX1D0TwPzrYtUsRo5UztW6fqfp4saf
	 LNtD+dHwL7RF8oliOTz3jlHtoz8xO/d5YyjJxXa7tsNpKwFa7QmyPy/PJCdhmUO2CJvQ6
	 GDE1RYjMD/fQUuew/q7flchexgKJqcVE/GezXiKRDMPkO2+NJApndgm1c3sKsRRm4l3p0
	 79ShtqeBOhxAeJ4Cdw56fQS4MM7FlE6nkOvmqNYOmL4DRkyKIKxuglMtzzwLl3oKguw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YjbsrzOc;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5E55606A6A7;
	Sat, 21 Nov 2026 02:40:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YjbsrzOc
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 35EB71F000C0;
	Sat, 21 Nov 2026 02:40:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795228839;
	bh=acD3Hn9eXi71wVEp245Iem/X+MGIjwCajsfdnlsJN6g=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=YjbsrzOcEQRuprk/zfjOmz/oqluTC0rCtQ/fwneluN7cSUmH5UiSmzEuWsPRUK+Fn
	 UI37DzKC7f6krJIqlWIwzOq6QtDsB1PNQvJByv2oyYhyEXPszuLwNHBQKL5sJdbmlJ
	 fx9kcUjMve5HylNj+ThPl1bUQQyE2cYUdohjD3DmEm49QzrWYVJ7nfm2GZQxy21y0p
	 Y7KWEUXoDVukmSm6wIeIwNQIKxzdBQZ9rrjpGDWfV+iGQBYd8Es7kCcJ0QzpWmR3u6
	 pDiKq17Ns6RjAsMzNGbHus9OdnEz+higRWrx53xqnFbIWee3WTT5EnCIPnCocHoDBQ
	 cI7fPWeqTCiuw==
Message-ID: <sashiko-outbox-226549@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v10 1/3] dt-bindings: usb: snps,dwc3: describe two
 connectors on one HS data bus
Reply-To: sashiko-reviews@lists.linux.dev
To: "Qianhui Xu" <xiaqinghuan@mail.ustc.edu.cn>, linux-usb@vger.kernel.org
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261121022104.1507987-2-xiaqinghuan@mail.ustc.edu.cn>
References: <20261117052137.32833-1-xiaqinghuan@mail.ustc.edu.cn>
 <20261121022104.1507987-1-xiaqinghuan@mail.ustc.edu.cn>
 <20261121022104.1507987-2-xiaqinghuan@mail.ustc.edu.cn>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 21 Nov 2026 02:40:38 +0000
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
- [Medium] dt-bindings: usb: snps,dwc3: unconditional hs-port ref breaks
  non-mux port@0
- [Low] dt-bindings: usb: snps,dwc3: unaddressed maintainer feedback on
  schema style
- [Low] dt-bindings: usb: snps,dwc3: requiring dr_mode overrides
  usb-drd.yaml default
--

commit 3dfd09df6c148c2b5dd730fefdb79828ea834f98
Author: Qianhui Xu <xiaqinghuan@mail.ustc.edu.cn>

dt-bindings: usb: snps,dwc3: describe two connectors on one HS data bus

This commit updates the Synopsys DWC3 common DT binding schema to describe
two Type-C connectors sharing a High Speed data bus through a multiplexer,
adding mux-controls and two endpoint nodes under port@0 with per-connector
usb-role-switch and mux-state properties.

> diff --git a/Documentation/devicetree/bindings/usb/snps,dwc3-common.yaml =
b/Documentation/devicetree/bindings/usb/snps,dwc3-common.yaml
> index 6c0b8b6538246..57e3c1d9ed038 100644
> --- a/Documentation/devicetree/bindings/usb/snps,dwc3-common.yaml
> +++ b/Documentation/devicetree/bindings/usb/snps,dwc3-common.yaml
> @@ -13,6 +13,89 @@ description:
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

[ ... ]

> +      endpoint@0:
> +        $ref: '#/$defs/hs-endpoint'
> +        required: [reg, usb-role-switch, mux-state]
> +
> +      endpoint@1:
> +        $ref: '#/$defs/hs-endpoint'
> +        required: [reg, usb-role-switch, mux-state]

[ ... ]

> @@ -26,8 +109,46 @@ allOf:
>        $ref: usb.yaml#
>      else:
>        $ref: usb-xhci.yaml#
> +  - if:
> +      required: [mux-controls]
> +    then:
> +      # The mux path is only taken when the controller itself carries
> +      # "usb-role-switch": dwc3_get_dr_mode() forces dr_mode back to
> +      # peripheral, dwc3_get_extcon() skips the role-switch branch and
> +      # dwc3_drd_init() never sets the mux up without it.

[Severity: Low]
As reported by Rob Herring on v9 [1], should the local $defs be dropped in
favor of defining the endpoint schema under patternProperties for
'^endpoint@[01]$', and can the Linux driver implementation details
(usb_role_switch_at_endpoint(), dwc3_get_dr_mode(), dwc3_get_extcon(),
dwc3_drd_init(), and driver validation behavior) be removed from the
binding?

> +      required: [dr_mode, ports, usb-role-switch]
> +      properties:
> +        dr_mode:
> +          const: otg

[Severity: Low]
Does listing dr_mode in required reject DWC3 nodes with mux-controls that
omit dr_mode to rely on the default "otg" mode from usb-drd.yaml?

In usb-drd.yaml (and dwc3_get_dr_mode() when usb-role-switch is present),
dr_mode already defaults to "otg" when omitted.  Keeping dr_mode: const:
otg under properties while dropping dr_mode from required would still
reject "host" or "peripheral" without forcing board DTs to specify dr_mode
explicitly.

> +        ports:
> +          required: [port@0]
> +          properties:
> +            port@0:
> +              required: ['#address-cells', '#size-cells',
> +                         endpoint@0, endpoint@1]
> +    else:
> +      # Without a mux the High Speed port keeps the generic graph port
> +      # binding, so single-endpoint controllers are described as before.
> +      # port@0 is referenced here rather than declared once in "ports"
> +      # because the graph port forbids properties it does not know
> +      # (unevaluatedProperties: false), which would reject the per-conne=
ctor
> +      # "usb-role-switch" and "mux-state" of the dual-connector form.
> +      properties:
> +        ports:
> +          properties:
> +            port@0:
> +              $ref: /schemas/graph.yaml#/properties/port

[ ... ]

> @@ -411,7 +532,7 @@ properties:
> =20
>      properties:
>        port@0:
> -        $ref: /schemas/graph.yaml#/properties/port
> +        $ref: '#/$defs/hs-port'
>          description: High Speed (HS) data bus.

[Severity: Medium]
Does applying $ref: '#/$defs/hs-port' unconditionally to port@0 cause a
dtbs_check regression for single-connector DWC3 nodes without mux-controls?

In JSON Schema, unevaluatedProperties: false inside hs-port only sees
properties evaluated within hs-port itself, not properties evaluated by
the allOf else branch ($ref: /schemas/graph.yaml#/properties/port).
Because /schemas/graph.yaml#/$defs/port-base omits endpoint and hs-port
only declares endpoint@0 and endpoint@1 (both requiring usb-role-switch
and mux-state), non-mux DWC3 nodes using port@0/endpoint (such as
arch/arm64/boot/dts/qcom/sm8250.dtsi) fail validation with endpoint
rejected as unevaluated, while non-mux nodes using port@0/endpoint@0 fail
because hs-port requires usb-role-switch and mux-state that
/schemas/graph.yaml#/properties/port rejects.

Should $ref: '#/$defs/hs-port' be applied to port@0 only in the
mux-controls then branch of allOf (as described in the else branch
comment), leaving top-level port@0 with only its description?

[1] https://lore.kernel.org/r/20261118153457.GB1824160-robh@kernel.org

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261121022104.1507=
987-1-xiaqinghuan@mail.ustc.edu.cn?part=3D1

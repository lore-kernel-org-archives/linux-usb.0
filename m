Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795016099;
	b=UsyH3+PYU+0jps+pqaPFxjyTnx96FiPIArokENWdYZj2V0vn++9ndXY5rbVtWdOMIFrB
	 RQazpADW0V0JelsvAmUQCYj0e+92JBturY8DghJ2areae2O9RtxbWNtgBQczIeBx5P2P9
	 TzppBNiw0XjZMBS/8+Zt0sUbEmHXJl2eVTwwJ3YSbmDpINz5MJ3kHuC4Skqb8VDN6+UDj
	 +NZvj9fTbG4oYLkfg4NBmXsdWcHr6yJOOhOmDq7U3EPs2EmALLhRE2XLgnU97S7+SsQes
	 NmiMsDv47jK+6vyjhbO5Dis3t4oiXdgGoqUwAjgt1OYPHMv0A7eGQRauNCzYmRMwjbA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795016099;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=q4DZBiCtptxDUrZaYhWzriU2UClMGlXG5cbDC6IikrQ=;
	b=lbgBXU+Lvj3nn9hhItwD11BpX4AzA72d/Z88hTDB4wDq9jidXpTB+qOtIU4Afeg1doLa
	 uDHg6WD6hnxTRFQrft5CwuZHPA0nLCZyzUsfLtf6mdQsPgArNHC5mpZwoNzZi6pLDuDMA
	 Et5Vs0BZI4X3J5sRSUaLoMCTE9GoiztXO4VR5wAQVRZ0zC6ULQE+Bhnpv993Fqgzkz71z
	 CFs3gtxhCr4u2oRGzeEV1nUrPqMh5xq03aF6iKIXCGMGR9vIkVQqeC1jyHYoW/sMcLZ/f
	 B7tVdUCIwwKYmfgg4t9Zba1nLQAirA9UYvkmXQrpXbc0r4D6es5/r3jqQVeH6P7+AkQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=W7mEOWi8;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C446606A334;
	Wed, 18 Nov 2026 15:34:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=W7mEOWi8
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD49D1F000CD;
	Wed, 18 Nov 2026 15:34:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795016099;
	bh=q4DZBiCtptxDUrZaYhWzriU2UClMGlXG5cbDC6IikrQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=W7mEOWi8ttnaoJb/PCE9A6g57U4FTYQVssJWU202EjVLqCr5+Bz/B7x1AI5cqOR63
	 Xb+TIQcKxnDeYZagbb6/DuuUVlcMPfNgl2xFWCVmpim1/XdoRpB6uzev384u+uW4A5
	 g6k4JBTFUN7M+h3XNU8uiFlaNAC5K7Octmk/QjfYFHK70UjJ37d2O35MN0q7yYtoZ8
	 i+4DhF79hDg/BAZZ9miCzif9K4144UbfK/3y9xg7Znp9Lj7E6DSKHc/RqYGAkNJYEX
	 yV90hOHspVk2fsMUPT/+S2KizeNtocH/LyhKP0oY+mZVWLG3JhbGU176PaOUxP7KYn
	 1Q1lUJ+rToYAQ==
Date: Wed, 18 Nov 2026 09:34:57 -0600
From: Rob Herring <robh@kernel.org>
To: Qianhui Xu <xiaqinghuan@mail.ustc.edu.cn>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v9 1/3] dt-bindings: usb: snps,dwc3: two connectors are
 two endpoints of one port
Message-ID: <20261118153457.GB1824160-robh@kernel.org>
References: <20261117052137.32833-1-xiaqinghuan@mail.ustc.edu.cn>
 <20261117052137.32833-2-xiaqinghuan@mail.ustc.edu.cn>
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261117052137.32833-2-xiaqinghuan@mail.ustc.edu.cn>

On Tue, Nov 17, 2026 at 01:21:35PM +0800, Qianhui Xu wrote:
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
> ---
> 
> DRAFT: driver (3/3) still uses a GPIO and must be ported to mux_control_*
> in the same series; DTS (2/3 equivalent) must be rewritten to the new
> shape.  See README.md in this directory.

??

> 
> --- a/Documentation/devicetree/bindings/usb/snps,dwc3-common.yaml
> +++ b/Documentation/devicetree/bindings/usb/snps,dwc3-common.yaml
> @@ -13,6 +13,84 @@ description:
>    Defines the properties of the DWC3 core as being embedded in either an
>    vendor-specific implementation or as a standalone component.
>  
> +$defs:

You don't need to use $defs here.

> +  hs-endpoint:
> +    $ref: /schemas/graph.yaml#/$defs/endpoint-base
> +    unevaluatedProperties: false
> +
> +    properties:
> +      usb-role-switch:
> +        type: boolean
> +        description:
> +          This connector endpoint has its own USB role switch. The switch is
> +          registered against this endpoint and looked up with
> +          usb_role_switch_at_endpoint().
> +
> +      mux-state:
> +        $ref: /schemas/types.yaml#/definitions/uint32
> +        enum: [0, 1]
> +        description:
> +          State of the High Speed data bus multiplexer which connects this
> +          connector to the controller.  The two connectors of one controller
> +          must use different states; the driver rejects a device tree where
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
> +    # The two connectors are two mux'ed data streams of the same High Speed
> +    # bus, so they are two endpoints of one port, not two ports: "ports"
> +    # describes the controller's own data streams (HS in port@0, SS in
> +    # port@1), and an endpoint describes one stream multiplexed onto a port.
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

These can be:

patternProperties:
  '^endpoint@[01]$':
    [everything from hs-endpoint]

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
> +
>  allOf:
>    - $ref: usb-drd.yaml#
>    - if:
> @@ -26,8 +104,47 @@ allOf:
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

Don't put driver specifics in bindings.

> +      required: [dr_mode, ports, usb-role-switch]
> +      properties:
> +        dr_mode:
> +          const: otg
> +        ports:
> +          required: [port@0]
> +          properties:
> +            port@0:
> +              $ref: '#/$defs/hs-port'

This $ref can be dropped. You already have the schema for 'port@0' 
below.

> +    else:
> +      properties:
> +        ports:
> +          properties:
> +            port@0:
> +              properties:
> +                endpoint@0:
> +                  properties:
> +                    usb-role-switch: false
> +                    mux-state: false
> +                endpoint@1:
> +                  properties:
> +                    usb-role-switch: false
> +                    mux-state: false
>  
>  properties:
> +  mux-controls:
> +    maxItems: 1
> +    description:
> +      Phandle to the multiplexer that selects which of the two connectors
> +      drives the controller's shared High Speed data bus, e.g. a
> +      "gpio-mux" controller.  Each connector is described by the endpoint@0
> +      or endpoint@1 of "port@0", and the endpoint of that connector carries
> +      its own role-switch input and the "mux-state" it is reached in.
> +
>    extcon:
>      maxItems: 1
>      deprecated: true
> @@ -411,7 +528,7 @@ properties:
>  
>      properties:
>        port@0:
> -        $ref: /schemas/graph.yaml#/properties/port
> +        $ref: '#/$defs/hs-port'

Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C24936D51B;
	Fri,  3 Jul 2026 07:45:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783064718; cv=none; b=d2KS3VW8XL8vBv/LQ7BSb1LBe1PIDiv0fOl/B9HpMIKc+nyfmMelIYk9s5CxRGnkcFdAvV4yeNfRCmjP7VHak5FO2bg6gUlLX3pPkENSlGaaqGc3sNn5o8u3PHBeCrAMGBX40O//mFrOGuxTOyXHl7b+KTnfQS351jnfUOaWnMw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783064718; c=relaxed/simple;
	bh=adoXp2UdOTCjshJ420yfUWub2vESLo2yY9yWtwFS688=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=D/N62PV3zI48PN9RgbemoNgktG8bZA52xQMKBFvYtCQI6EfQ0jFuhx8x/I2WB90vIR5cSS1FBCoqVrf/wMgZ8ec/AELaHNduFwJXoqX2qKNgbjrmifphYSkFT/GQh7pcBv3Mxgf+thwi2qvhsHGE44ZbuwU4IDXToBeQSJlJHc8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ic7PbX9z; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ic7PbX9z"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BBCD61F000E9;
	Fri,  3 Jul 2026 07:45:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783064716;
	bh=vl77PN/ZP/Q9Mycl5ehT8FqH9er10+QjxzJaAqd3nuo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Ic7PbX9zVoRovT28fcCrHFfqbcLD+XXeFTGxje5CHHngmNsOgs8InOJPIWgb2QaOj
	 vV6wFMAP8D8aN/2n+aSpB8fsqTyyskBmwVJK80DCQDqh7rc8OeYW3f3bSDCaqu8eIz
	 4SXckCQM883R0m/cnK8U8GLaib0FgWDz3HsnZUAzC6CBDRVprwN9Fye8LZTwkaM85G
	 KkGTFphIkTWnBN5iXcdCpwk6TxEnOPYxmQkQQyzeGCJno2FhSaWWfrjC46ldMPhi8W
	 G7mT+9rSki4QdO0CmID5YD+k0k/qjPbiTNBo3P1DCeB0e6WXSrqRn8LEd9930Hoybl
	 AI5AedInTLsfA==
Date: Fri, 3 Jul 2026 09:45:12 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Elson Serrao <elson.serrao@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Souradeep Chowdhury <quic_schowdhu@quicinc.com>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 1/9] dt-bindings: soc: qcom: eud: Add per-path child
 nodes for UTMI routing
Message-ID: <20260703-manipulative-mauve-centipede-f8c95e@quoll>
References: <20260501170635.2641748-1-elson.serrao@oss.qualcomm.com>
 <20260501170635.2641748-2-elson.serrao@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260501170635.2641748-2-elson.serrao@oss.qualcomm.com>

On Fri, May 01, 2026 at 10:06:27AM -0700, Elson Serrao wrote:
> The Qualcomm Embedded USB Debugger (EUD) can intercept one or two
> independent High-Speed UTMI paths, depending on the SoC configuration.
> Each path is distinct, with its own connector/controller connection
> and role-dependent UTMI routing.

You miss SoC specific compatibles in the patch. Binding describes ONLY
SC7280 but you claim here it depends on SoC (not sure what is a
"configuration" of a SoC).

This should be also restricted per each variant as it depends on number
of controllers in each SoC.

> 
> Because the EUD sits between the USB connector and the USB controller,
> it must relay role changes across the UTMI path. In device role, the
> EUD inserts its internal hub into the path to enable debug
> functionality. In host role, the path remains directly connected
> between the PHY and the USB controller, bypassing the EUD hub. These
> hardware constraints require per-path role awareness, as UTMI path
> roles may differ.
> 
> The existing binding models only a single UTMI path and assumes a
> uniform routing model. While sufficient for simple device-role-only
> configurations, this representation does not accurately describe EUD
> hardware when role switching and/or multiple UTMI paths are involved.
> 
> To address this limitation, per-path child nodes are introduced to
> describe individual UTMI paths through the EUD. Each path includes its
> own ports description, allowing controller and connector associations,
> as well as role-aware routing.
> 
> Signed-off-by: Elson Serrao <elson.serrao@oss.qualcomm.com>
> ---
>  .../bindings/soc/qcom/qcom,eud.yaml           | 55 ++++++++++++++++++-
>  1 file changed, 54 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,eud.yaml b/Documentation/devicetree/bindings/soc/qcom/qcom,eud.yaml
> index 84218636c0d8..21f75038a81c 100644
> --- a/Documentation/devicetree/bindings/soc/qcom/qcom,eud.yaml
> +++ b/Documentation/devicetree/bindings/soc/qcom/qcom,eud.yaml
> @@ -45,10 +45,63 @@ properties:
>          $ref: /schemas/graph.yaml#/properties/port
>          description: This port is to be attached to the type C connector.
>  
> +  '#address-cells':
> +    const: 1
> +
> +  '#size-cells':
> +    const: 0
> +
> +patternProperties:
> +  "^eud-path@[0-1]$":
> +    type: object
> +    description:
> +      Represents one High-Speed UTMI path that EUD intercepts. Use eud-path nodes
> +      to associate role-switching behavior with specific port connections, allowing
> +      EUD to manage role transitions independently for each UTMI path.
> +
> +    properties:
> +      reg:
> +        maxItems: 1
> +        description: Path number
> +
> +      usb-role-switch:
> +        type: boolean
> +        description:
> +          Indicates that EUD should act as a role switch for this path.
> +          In device role, debug mode inserts the EUD hub into the UTMI path. In
> +          host role, the EUD hub is bypassed and UTMI traffic flows directly
> +          between the PHY and the USB controller.

role-switch is per entire device, not per path. Either device has role
switching or not.

> +
> +      ports:
> +        $ref: /schemas/graph.yaml#/properties/ports
> +        description:
> +          These ports are to be attached to the endpoint of the USB controller node
> +          and USB connector node.
> +
> +        properties:
> +          port@0:
> +            $ref: /schemas/graph.yaml#/properties/port
> +            description: This port is to be attached to the USB controller.
> +
> +          port@1:
> +            $ref: /schemas/graph.yaml#/properties/port
> +            description: This port is to be attached to the USB connector.

Add one more example with eud-paths and its dedicated compatible.

> +
> +    required:
> +      - reg
> +      - ports
> +
> +    additionalProperties: false
> +
>  required:
>    - compatible
>    - reg
> -  - ports
> +
> +oneOf:
> +  - required:
> +      - ports
> +  - required:
> +      - eud-path@0

- eud-path@1

There is no point to provide eud-path@0 alone. Ports are doing that
already.

Best regards,
Krzysztof


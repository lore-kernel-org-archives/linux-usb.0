Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1216D3126A0;
	Thu, 13 Aug 2026 08:58:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786611505; cv=none; b=EOWrDhQ1JNoh48APV0QnsznPsibBEYQespRAPqXuin9cM8yC8jcWZNrkeg5oJG35/rfrk+T1RTxM0rqVw6MZuz1w197JZz+K+9GBqj1hSllS4CE1vEOaVJHyMbWGJ/UIgNMTxMT/olTDEpFNkiZDXJM48WghqwZyifK6mdqFHbE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786611505; c=relaxed/simple;
	bh=/UBIGNUgjYX+9pBBLlO6oZUmjzXd4JKdbNqg+43IwIo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GCFwqOUl3jCBSLglM7k1qAsUiajz/oAc0r2DGVxyEBltznfB3mBg6kFjP/MZTeJT+Ha55QMbMygFr7OoRtxejkrJ1MwCg5q01ELFMnCWnBd5VSKBcZBezj94Edr5Kh/LZHe3JMeJWDTlnrLBnH87ClVkYH2cImNvb7omMKtWw2Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OEH8U6YY; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OEH8U6YY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 605541F000E9;
	Thu, 13 Aug 2026 08:58:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786611503;
	bh=mUM3gx5fUhLkzXuel80f3jVm80HXZyBPiyyBV8LlM9c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=OEH8U6YY/k3abK15cAm8SOWWeMYPxh5Eo9X4FPfZKKcfG3INBqRbgkVRjLKP79rXA
	 A7CoCi7FwUyaSnsrwPmAK4rSfej/0x4GCw19Rn/4hoJp/TpzGFH0ZtWS20aefiw8z2
	 yUpK1RtLBTD1t78I/ctYhQGTFPErN/oVl4u2tZ4TDwRJpg7mtoGf3TcBzLdLGUSw09
	 EOPERMHKk1D245B8nBhb5QfZHmVfnRD2izaXz0ETwRGk/6nUZdb3yhDgjh24zZqScJ
	 CoTJtfTB5gPKYIJQsx+FEA2RFEEU9ggslcprPlrFlOZqcNXicb8FA/aeBV3eANsS2p
	 jl00SOeF1vlCA==
Date: Thu, 13 Aug 2026 10:58:13 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: George Moussalem <george.moussalem@outlook.com>
Cc: Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Praveenkumar I <quic_ipkumar@quicinc.com>, Varadarajan Narayanan <quic_varada@quicinc.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Wesley Cheng <quic_wcheng@quicinc.com>, linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org
Subject: Re: [PATCH v2 01/14] dt-bindings: phy: Document the Qualcomm IPQ5332
 UNIPHY USB Super-speed PHY
Message-ID: <20260813-alluring-advanced-jackalope-55e5c1@quoll>
References: <20260812-ipq5018-usb3-v2-0-8f355d7ff0ef@outlook.com>
 <20260812-ipq5018-usb3-v2-1-8f355d7ff0ef@outlook.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260812-ipq5018-usb3-v2-1-8f355d7ff0ef@outlook.com>

On Wed, Aug 12, 2026 at 01:34:36PM +0400, George Moussalem wrote:
> From: Praveenkumar I <quic_ipkumar@quicinc.com>
> 
> Document the Qualcomm USB3 22ull UNIPHY present in the IPQ5018 and
> IPQ5332 SoCs.
> 
> Signed-off-by: Praveenkumar I <quic_ipkumar@quicinc.com>
> Signed-off-by: George Moussalem <george.moussalem@outlook.com>
> ---
>  .../phy/qcom,ipq5332-uniphy-usb-ss-phy.yaml        | 111 +++++++++++++++++++++
>  1 file changed, 111 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/phy/qcom,ipq5332-uniphy-usb-ss-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,ipq5332-uniphy-usb-ss-phy.yaml
> new file mode 100644
> index 000000000000..cc9eccac51dd
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/phy/qcom,ipq5332-uniphy-usb-ss-phy.yaml
> @@ -0,0 +1,111 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/phy/qcom,ipq5332-uniphy-usb-ss-phy.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm UNIPHY USB Super-Speed 22ull PHY
> +
> +maintainers:
> +  - Praveenkumar I <quic_ipkumar@quicinc.com>
> +  - Varadarajan Narayanan <quic_varada@quicinc.com>
> +
> +description:
> +  USB Super-Speed UNIPHY found in Qualcomm IPQ5018 & IPQ5332 SoCs.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - qcom,ipq5018-uniphy-usb-ss-phy
> +      - qcom,ipq5332-uniphy-usb-ss-phy
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    minItems: 2
> +    maxItems: 3
> +
> +  resets:
> +    maxItems: 1
> +
> +  vdd-supply:
> +    description:
> +      Phandle to 5V regulator supply to PHY digital circuit.
> +
> +  qcom,phy-usb-mux-sel:
> +    description: |

Do not need '|' unless you need to preserve formatting.

> +      Mux selection for USB PHY. The USB3 and PCIe PHY pads are muxed and the
> +      mux selection is done via a register in TCSR syscon.

git grep qcom,phy-usb-mux-sel gave me zero, so I wonder how is it done
from the PCI side.

> +    $ref: /schemas/types.yaml#/definitions/phandle-array
> +    items:
> +      - items:
> +          - description: phandle of TCSR syscon
> +          - description: offset of PHY mux selection register
> +
> +  "#clock-cells":
> +    const: 0
> +
> +  "#phy-cells":
> +    const: 0
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - resets
> +  - vdd-supply
> +  - qcom,phy-usb-mux-sel
> +  - "#clock-cells"
> +  - "#phy-cells"
> +


> +additionalProperties: false

This goes after "allOf:" block.

> +
> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - qcom,ipq5018-uniphy-usb-ss-phy
> +    then:
> +      properties:
> +        clocks:
> +          items:
> +            - description: USB3 PHY CFG AHB clock
> +            - description: USB3 pipe clock
> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - qcom,ipq5332-uniphy-usb-ss-phy
> +    then:
> +      properties:
> +        clocks:
> +          items:
> +            - description: Shared PCIe/USB3 PHY AHB clock
> +            - description: USB3 PHY CFG AHB clock
> +            - description: USB3 pipe clock
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/qcom,ipq5332-gcc.h>
> +
> +    phy@4b0000 {
> +        compatible = "qcom,ipq5332-uniphy-usb-ss-phy";
> +        reg = <0x4b0000 0x800>;

That is the same address as PCI PHY, so you have one device, not two.

Best regards,
Krzysztof


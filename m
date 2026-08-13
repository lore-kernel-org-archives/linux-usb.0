Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 953CF4446F7;
	Thu, 13 Aug 2026 08:59:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786611600; cv=none; b=UDUavO2bSOG78Q4vFXdu8FbY25527lw3Wv54ThwCmvJX++nTBPDVPfIy6f3urt0pof5NFxPTCGtBlbLBBh+NZfoTmEBCTDxp5tAJ0DUDRf26FOI9Gu7BpDFVOqBoA7d7qrmCqjZ+G3QCyJnNGqMRg4sk3ceTAhYdwAcRF/O4L74=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786611600; c=relaxed/simple;
	bh=GdyuVcouelAph5a8W7iYpdcHMMgGGIj8pLf+4ZiB6Ds=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sl1CEDf0Y+Ol9evfRiVg/P5fExFXxlyhLj4+EUu18pFcfZScOtFS7EsJ31hJ0bqbO4XFymEb5x3hXkd4mzxxEeUU8Dfa+54RlVClfT9FOu+rWtiV3PcFA2RJ0XNEIDn1HSQfuNC5YnsAWySlfL1XeqdA36EvI3iYZKLCEiFxhyA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bq65PrTl; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bq65PrTl"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 875421F00A3A;
	Thu, 13 Aug 2026 08:59:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786611595;
	bh=dtGZ81a3jSSuCBgYV0KTzg5fZRnkjFOsncZEdYGS6S4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=bq65PrTlrpQK5qnE6+gKhwDV8n+44dSRcaQ15A9cQ8w8ugWgWsVHfbcdZSwGUgCFn
	 1RWLpApt10D2UuocrruxHUY5xj2cx/L8E8KYysNR9ozK3XpX0xql6GzPBgNnuimdmo
	 xXKq3sjTcri6QXfHtzfdzvwDWqnshiOIBCOx4OxeQYIMrQepZTuRf7Svc/i86ESnOK
	 P7/MQ69Mw87UW5mWgvo1fOfId3yHTcPm/zjSyqWg4YhgFmkt9fLFpE+txyJbasR0sp
	 Kn25kcWPvTgPwdvLJy3MJQVNSuMNcWT/EP5w/OtreTZjxFDMr94kQbZ1JY3jXx1A3i
	 x9R22341btaUg==
Date: Thu, 13 Aug 2026 10:59:46 +0200
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
Subject: Re: [PATCH v2 12/14] arm64: dts: qcom: ipq5332: Enable USB
 Super-Speed PHY
Message-ID: <20260813-gentle-eel-of-elegance-ccbdbb@quoll>
References: <20260812-ipq5018-usb3-v2-0-8f355d7ff0ef@outlook.com>
 <20260812-ipq5018-usb3-v2-12-8f355d7ff0ef@outlook.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260812-ipq5018-usb3-v2-12-8f355d7ff0ef@outlook.com>

On Wed, Aug 12, 2026 at 01:34:47PM +0400, George Moussalem wrote:
> From: Praveenkumar I <quic_ipkumar@quicinc.com>
> 
> Enable USB Super-Speed PHY support. The PCIe and USB3 PHYs share the
> same MMIO address space, so override the compatible string to use the
> USB3 PHY driver instead of the PCIe PHY driver and set the required
> properties accordingly.
> 
> Signed-off-by: Praveenkumar I <quic_ipkumar@quicinc.com>
> Signed-off-by: George Moussalem <george.moussalem@outlook.com>
> ---
>  arch/arm64/boot/dts/qcom/ipq5332-rdp468.dts | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/ipq5332-rdp468.dts b/arch/arm64/boot/dts/qcom/ipq5332-rdp468.dts
> index 25a70cd884c0..164f9a9a6c75 100644
> --- a/arch/arm64/boot/dts/qcom/ipq5332-rdp468.dts
> +++ b/arch/arm64/boot/dts/qcom/ipq5332-rdp468.dts
> @@ -100,3 +100,22 @@ &usbphy0 {
>  
>  	status = "okay";
>  };
> +
> +/* this combo PHY supports PCIe and USB3 */
> +&pcie0_phy {
> +	compatible = "qcom,ipq5018-uniphy-usb-ss-phy";

Nope, phy in tjhe SoC does not change per board.

You have one phy device, already defined in the SoC DTSI. In the board
you only choose phy type in the consumer node.

Best regards,
Krzysztof


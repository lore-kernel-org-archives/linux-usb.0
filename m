Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDCA33C1984;
	Wed,  1 Jul 2026 08:04:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782893094; cv=pass; b=AP1OiLcNGp12qwutE16Lgoach+1w1tWLQWUtqrY/VH7Qa7CB5TbQGaFmkWTlFrQcR5T+XEynsq1lbXM5m+FU1yqtfFEw/AcTPLqVfz0h3eugjbFoEs9WIf5GZHTtTAeN9LsuhAndFNPeNAcv0Yqu+Wc0FTV+2eWdaopb9OdDLAY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782893094; c=relaxed/simple;
	bh=RzSgtzcfemNBRW4l0erRYHjsjW991FMagcVp+y5BGdg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CEMlGKWCnC8JquGWfr0fR9phoJjEAT5wSNjQh2M+qVGSrcQ5eA+N5DaN7+Ekmej7K4ppP9Y8vkqVkRNCUWVAAdAv+LAPCLe03w/jfdc50QhGoALQsTks3qaxzNqojg/jy5e9JsanzR1+Amr2yy2YIaH7Uxp3N+hnx067Z/g7/F8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=michael.riesch@collabora.com header.b=F0yG8nQo; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=michael.riesch@collabora.com header.b="F0yG8nQo"
ARC-Seal: i=1; a=rsa-sha256; t=1782892953; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=aTPEf3BqjKu6ldy2Xslnu+HCEWFE6vblrMkjVb5aeayVdGPijkyKG1LMZ6CZNLezp4ugzaVWMYco2vxL9LfHDXR2hdnbFzSDgPg8upjd9SJe1Rjm5Zsgvr4aAiXu7+iJqGDW0WJl8SIG1lR2U5JKH1fsYHzSxQW8Qfvy8d2mH8s=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1782892953; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=CWNDIk7fyUz4D/2m8OAHIVTblCwgE7WjSABB2eON9n8=; 
	b=lamTyYNS9M6k0ALZ9lZlnurd7UG/ZXESPXWU00I5ivICDw4j4INNfn5LX3Qz3+BsPU8LTB3JEBwOk+a6HRM4V7bADRXU7UhppH+jbKrp/wCU829XSmn1tOa9BufYdJFyudT94cSNT1cfFuyD9w6AK+MciAzMUPHMLl4NQyu4VCM=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=michael.riesch@collabora.com;
	dmarc=pass header.from=<michael.riesch@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1782892953;
	s=zohomail; d=collabora.com; i=michael.riesch@collabora.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=CWNDIk7fyUz4D/2m8OAHIVTblCwgE7WjSABB2eON9n8=;
	b=F0yG8nQo3YbIjKWV9YHgILL1rxYz9mgW3xw/AfWH94ua+v/J8PH7nd3RXd24npaQ
	IQR5CFW6blT7eUGRjNoFo4TdbDDuGKkWvGSfKjMCC09bfsJAMtMR+F8FIfyglywBXBh
	wvcWiRoSQ2Xgy2B2JXi+Gxz6KCm+/vVsV2ha6qGc=
Received: by mx.zohomail.com with SMTPS id 1782892951290681.0323311430374;
	Wed, 1 Jul 2026 01:02:31 -0700 (PDT)
Message-ID: <39bf50d1-a54c-41c0-bfee-ef73c293b990@collabora.com>
Date: Wed, 1 Jul 2026 10:02:26 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] arm64: dts: rockchip: Fix devices suspend freeze
 on RK3568/RK3566
To: Jonas Karlman <jonas@kwiboo.se>, Heiko Stuebner <heiko@sntech.de>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Peter Geis <pgwipeout@gmail.com>
Cc: Diederik de Haas <diederik@cknow-tech.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, devicetree@vger.kernel.org,
 linux-rockchip@lists.infradead.org, linux-usb@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260624192726.781864-1-jonas@kwiboo.se>
 <20260624192726.781864-3-jonas@kwiboo.se>
Content-Language: en-US
From: Michael Riesch <michael.riesch@collabora.com>
In-Reply-To: <20260624192726.781864-3-jonas@kwiboo.se>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External

Hi Jonas,

On 6/24/26 21:27, Jonas Karlman wrote:
> The EHCI/OHCI controller depends on clk_usbphy1_480m being enabled, or
> the system may freeze when registers are accessed, i.e. during suspend
> in ohci_suspend().
> 
> Add the missing clk_usbphy1_480m clocks reference to EHCI/OHCI
> controllers to ensure the clock is enabled when ECHI/OHCI registers are
> accessed to prevent a system freeze.
> 
> Fixes suspend pm_test issue with EHCI/OHCI devices due to the missing
> clk_usbphy1_480m reference and makes following pm_test modes work:
> 
>   echo N > /sys/module/printk/parameters/console_suspend
> 
>   echo devices > /sys/power/pm_test
>   echo platform > /sys/power/pm_test
>   echo processors > /sys/power/pm_test
>   echo core > /sys/power/pm_test
> 
>   echo mem > /sys/power/state
> 
> Fixes: 91c4c3e06a25 ("arm64: dts: rockchip: add usb2 nodes to rk3568 device tree")
> Fixes: 78f7186095db ("arm64: dts: rockchip: rename and sort the rk356x usb2 phy handles")
> Tested-by: Diederik de Haas <diederik@cknow-tech.com>
> Signed-off-by: Jonas Karlman <jonas@kwiboo.se>

Acked-by: Michael Riesch <michael.riesch@collabora.com>

Thanks and best regards,
Michael

> ---
> v2: Collect t-b tag
> ---
>  arch/arm64/boot/dts/rockchip/rk356x-base.dtsi | 16 ++++++++--------
>  1 file changed, 8 insertions(+), 8 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/rockchip/rk356x-base.dtsi b/arch/arm64/boot/dts/rockchip/rk356x-base.dtsi
> index a5832895bd39..c930a6fd6ea0 100644
> --- a/arch/arm64/boot/dts/rockchip/rk356x-base.dtsi
> +++ b/arch/arm64/boot/dts/rockchip/rk356x-base.dtsi
> @@ -321,44 +321,44 @@ its: msi-controller@fd440000 {
>  	};
>  
>  	usb_host0_ehci: usb@fd800000 {
> -		compatible = "generic-ehci";
> +		compatible = "rockchip,rk3568-ehci", "generic-ehci";
>  		reg = <0x0 0xfd800000 0x0 0x40000>;
>  		interrupts = <GIC_SPI 130 IRQ_TYPE_LEVEL_HIGH>;
>  		clocks = <&cru HCLK_USB2HOST0>, <&cru HCLK_USB2HOST0_ARB>,
> -			 <&cru PCLK_USB>;
> +			 <&cru PCLK_USB>, <&usb2phy1>;
>  		phys = <&usb2phy1_otg>;
>  		phy-names = "usb";
>  		status = "disabled";
>  	};
>  
>  	usb_host0_ohci: usb@fd840000 {
> -		compatible = "generic-ohci";
> +		compatible = "rockchip,rk3568-ohci", "generic-ohci";
>  		reg = <0x0 0xfd840000 0x0 0x40000>;
>  		interrupts = <GIC_SPI 131 IRQ_TYPE_LEVEL_HIGH>;
>  		clocks = <&cru HCLK_USB2HOST0>, <&cru HCLK_USB2HOST0_ARB>,
> -			 <&cru PCLK_USB>;
> +			 <&cru PCLK_USB>, <&usb2phy1>;
>  		phys = <&usb2phy1_otg>;
>  		phy-names = "usb";
>  		status = "disabled";
>  	};
>  
>  	usb_host1_ehci: usb@fd880000 {
> -		compatible = "generic-ehci";
> +		compatible = "rockchip,rk3568-ehci", "generic-ehci";
>  		reg = <0x0 0xfd880000 0x0 0x40000>;
>  		interrupts = <GIC_SPI 133 IRQ_TYPE_LEVEL_HIGH>;
>  		clocks = <&cru HCLK_USB2HOST1>, <&cru HCLK_USB2HOST1_ARB>,
> -			 <&cru PCLK_USB>;
> +			 <&cru PCLK_USB>, <&usb2phy1>;
>  		phys = <&usb2phy1_host>;
>  		phy-names = "usb";
>  		status = "disabled";
>  	};
>  
>  	usb_host1_ohci: usb@fd8c0000 {
> -		compatible = "generic-ohci";
> +		compatible = "rockchip,rk3568-ohci", "generic-ohci";
>  		reg = <0x0 0xfd8c0000 0x0 0x40000>;
>  		interrupts = <GIC_SPI 134 IRQ_TYPE_LEVEL_HIGH>;
>  		clocks = <&cru HCLK_USB2HOST1>, <&cru HCLK_USB2HOST1_ARB>,
> -			 <&cru PCLK_USB>;
> +			 <&cru PCLK_USB>, <&usb2phy1>;
>  		phys = <&usb2phy1_host>;
>  		phy-names = "usb";
>  		status = "disabled";


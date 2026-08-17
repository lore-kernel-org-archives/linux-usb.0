Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011031.outbound.protection.outlook.com [52.101.70.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E55543B3DA;
	Mon, 17 Aug 2026 16:23:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.31
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786983791; cv=fail; b=VpVkhyM1fCM02lWHVCk1XJAY+NN1IeFZI7huAjAsU+2k6X1CcPEbnJaBTdgWVTa40HQMMriJXbbaTmymDt4gQEllbasjCPb9Q1JG6ArtF73mKemJX9kj30grf/ZAJiKkqmofHWG8uYMOLPHAgFZCneMZcOfkl159i6kQitY2gRY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786983791; c=relaxed/simple;
	bh=O/qoapb+N5Vvce9Mj335jbr2JeO9evzGhnzDSLkYHDo=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:CC:References:
	 In-Reply-To:Content-Type; b=JdTPv1tvC4DnW1fGgh4KY4kxh9EFCH+DTLgMggAjB10r1pDPoBuB3VkfzXdIU9rCFxDRK3hvEk/6ryPyR3nhGtVifDgB3hsNyyT724flnqZvzHRj8nueCalQG0pr0/gHGVlgcP/OMiMvKu5MoboZrP/cRZ5IIS6/EP/Vfz373Zg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=N9vV1+Gn; arc=fail smtp.client-ip=52.101.70.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="N9vV1+Gn"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xOf4StfNuXhu1Ebp/MMabuwCd53ubc2F4FY9oi3F6BIozKxxjNG/3xf5nnmpmBdum3kr6BKlBLfxb/8Za9MrbBV7DbCHrNxZ28hhzIsjkfMvSS5lh0GBl8GfW7jOoS/sdPvz7jlTtvnp08t3p+kfkEX6j9iNjxJNV99p/AygomzzazPvBQ/Tc5c1DPf9u3Nj4MCpF9Q9J/N/ux3yLZxR1VpZaWF4+QD5K8TaTu8/ENpULMlr7CBZWNC156hfEaAQxdX7dvcqH8AqkaW8nHoPOKLd5ZznwARPVDg8sQ6tqUlMgc8MgET6uyzUeNyD8/zg7HDu68a/j2HNwAI+tAbOIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Dfb+1RpEnYXxk5EIdc81lJgyVCLGAMINE08Euo5b4H0=;
 b=vYUMkkgPe+uuNTaNFjdBH9m8w+pHYybm+TTThX5axmTMWcbLXWyl8EqZIY89rF5ZdgsDVy9UEblnueq7PMx3Jo8Bu3OsySw4IZTA3Ud2bvQMk8+ZS0mixw23o9mzQGp3AoOZvWvHPknKPynHDC3le/uiNXCbWXsthmV1m6ODEjhcGlB7/0lIkOuCdvumvt7AEv5l4+jF0/s1fSPE3BbzmhdbpEAOeRkdfriwCAx7b9hxdBTDc/XabeJFLZBepVpULkQZEvjTfePvjcnRP2XrH5dSuQYfypaufep7h9zMmR/ggiXOoZtWfaRu46dbGvbCVGbtRM7R4Sg24qEuyjNhjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=nabladev.com smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Dfb+1RpEnYXxk5EIdc81lJgyVCLGAMINE08Euo5b4H0=;
 b=N9vV1+Gnrw6H8qsayB6hUa/lF3vMw5ouB6W2QlQGeCCU7LR3gxF/9vn7DBHXu/1a/SDIgLoBsYXlLP47qhxC8NPYy4hLQaJafNvkiGah6fG3dUTIa0ZEhbHSjTz5+C1ohy/kHskRZjy2F3uQ+71Z57YQlMukXaisuGNQimgJIGsnZz4foYCh3HruoEsU0L8rBvhNwMcuyfpjJoCQsjDBh2eMxKPQlhAK2Ny0eodXy1JdVsKtlzEhhciBL8L+A1X2fwG8kdSeS91dfKgTCzztk7ut5QC7u9boPsHis0RwYOpDoC4MeBTKjcNk84zHuOYQxaqS1qtY3v9q9Jw0ImEQFQ==
Received: from AS9PR06CA0743.eurprd06.prod.outlook.com (2603:10a6:20b:487::17)
 by AM0PR10MB3281.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:17d::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.17; Mon, 17 Aug
 2026 16:23:04 +0000
Received: from AMS0EPF00000196.eurprd05.prod.outlook.com
 (2603:10a6:20b:487:cafe::1b) by AS9PR06CA0743.outlook.office365.com
 (2603:10a6:20b:487::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.315.17 via Frontend Transport; Mon,
 17 Aug 2026 16:23:04 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.59)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 AMS0EPF00000196.mail.protection.outlook.com (10.167.16.217) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.339.3 via Frontend Transport; Mon, 17 Aug 2026 16:23:03 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Mon, 17 Aug
 2026 18:28:37 +0200
Received: from [10.48.86.251] (10.48.86.251) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Mon, 17 Aug
 2026 18:23:02 +0200
Message-ID: <8161b556-7ea5-4d5f-a8cc-12a71c850aa1@foss.st.com>
Date: Mon, 17 Aug 2026 18:23:01 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
Subject: Re: [PATCH 7/8] arm64: dts: st: Add USB nodes on stm32mp231
To: Marek Vasut <marex@nabladev.com>, <linux-usb@vger.kernel.org>
CC: Pankaj Dev <pankaj.dev@st.com>, Alexandre Torgue
	<alexandre.torgue@foss.st.com>, Christian Bruel
	<christian.bruel@foss.st.com>, Conor Dooley <conor+dt@kernel.org>, "Greg
 Kroah-Hartman" <gregkh@linuxfoundation.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, "Neil
 Armstrong" <neil.armstrong@linaro.org>, Rahul Kumar <rahul.kumar05@st.com>,
	Rob Herring <robh@kernel.org>, Rosen Penev <rosenp@gmail.com>, Thinh Nguyen
	<Thinh.Nguyen@synopsys.com>, Vinod Koul <vkoul@kernel.org>,
	<devicetree@vger.kernel.org>, <kernel@dh-electronics.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-phy@lists.infradead.org>, <linux-stm32@st-md-mailman.stormreply.com>
References: <20260812010157.1772849-1-marex@nabladev.com>
 <20260812010157.1772849-8-marex@nabladev.com>
Content-Language: en-US
In-Reply-To: <20260812010157.1772849-8-marex@nabladev.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS0EPF00000196:EE_|AM0PR10MB3281:EE_
X-MS-Office365-Filtering-Correlation-Id: 866349ca-e729-4339-7991-08defc7bd04f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|1800799024|7416014|23010399003|376014|82310400026|10067099003|4143699003|11063799006|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	14fDJO1Zbwz41VLfBCvfeUTVb57GakYm3WUYJSLvHMwWocPLECBVLRWpPicwbJYpqhyfwHIYn1pZZS2wmUkFqAhfHXkftVNi15kSFaFNZeOHBteiXHMDW16548colcie9zECTNHucIqOtJN1NfKU64nHn6OmKIVAx2sKqgQNfRCcjuz5RykARKeXcoWN4sa8WULnu26klE4fCGx/lmGjcDYPTVbvVCMCzWC5ATtig7hJxwOLTzBdlSVGQbsb3hwVEux22C5RResB17WtK2Pt7SUKECpnswGnfT95GsuK5l+ady/zazdwvpmRC9ztlhYmBE5iux3aX3sejdMQs1VkAZhIxW9wURut0qIAOVh78Y7jt9GH/I+vj7b7uRjbHdG50PYtd4kJjWH/MddjvPc+1RnUhl68TpWdGodEKA/6tu5G5cJDEV1RnYXvuAnoMfyncLA72GKet4JQ4gmVM0P8Z1sAWV5CrSnzswf37iFv5R7vceRFbl5PA1jTaicm1dkqxEjeywKlZBLPCTWX7RkDvRXhh300IvvgR9PVxaoQgNWycID4X6eEuVYqzivQe06WgWU0DEZQ3rJmxUb5cVHI4l7ZP8lHFGK1a4wfaiV9hEC/73nxevFdGfTK9mJJXF+739XJZz4Z2t0VqCXEeZzPDaNV4KyruFdN2FTL1ZZjZOd7dh4+i5/3CH2sbNSlgrSuZkefDXmJO3A1U7vM82hQlQ==
X-Forefront-Antispam-Report:
	CIP:164.130.1.59;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(1800799024)(7416014)(23010399003)(376014)(82310400026)(10067099003)(4143699003)(11063799006)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	1sSkiSwpmCcJTvzrAeJ5PT1PoPUHBBj2QIUIwO4886UEz+Bwe880kga3r0ZHEVwpN9PdC16BGeBldaqxXimBy53iS0gVG427YCcO1ZZH4TQBpYYdJIGdO1686Fb6C5J/UuL4ec7VwkXnJG94hDKtMlbgNNsFiSaUDhZZaKg5AE7Ja3iYKWdYHxQrbVtR2jJK19NSzym0NJLNcdVoVvLmsRiNcakTrIQ7Ay/BbEeJeBUlXoZmhBO8+NhkSDojLzrlTNlru0ON7lEkJNq7r1MljXyinw/tQ4/95uSWxQ6udqvoqhURuBZb8q8CqXAK9lQNAMjWENWq6Bk1PEIginLIjR1jGdIUv//iLFGFx2EfO9nBgr22/fX/E/KwyzpknDlsq1MmRFBkEl5If2nSDwO7gWd2SRy/oRkeGnabzk9eAMqan1I3zS3Ct7X2wfthvrBG
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Aug 2026 16:23:03.8385
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 866349ca-e729-4339-7991-08defc7bd04f
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.59];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS0EPF00000196.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR10MB3281


On 8/12/26 02:55, Marek Vasut wrote:
> Add USB controller and PHY nodes to stm32mp231 DT.
> This includes two USB 2.0 FEMTO PHYs, USB 2.0 host
> controller and DWC3 DRD controller nodes. Include
> missing COMBOPHY for the USB 3.0 controller.

Hi Marek,

There's no support for the combophy on STM32MP23.
It means USB3DR can be used in High Speed maximum.
Please check the datasheet.

> 
> Signed-off-by: Marek Vasut <marex@nabladev.com>
> Signed-off-by: Pankaj Dev <pankaj.dev@st.com>
> ---
> Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
> Cc: Christian Bruel <christian.bruel@foss.st.com>
> Cc: Conor Dooley <conor+dt@kernel.org>
> Cc: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
> Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
> Cc: Neil Armstrong <neil.armstrong@linaro.org>
> Cc: Pankaj Dev <pankaj.dev@st.com>
> Cc: Rahul Kumar <rahul.kumar05@st.com>
> Cc: Rob Herring <robh@kernel.org>
> Cc: Rosen Penev <rosenp@gmail.com>
> Cc: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
> Cc: Vinod Koul <vkoul@kernel.org>
> Cc: devicetree@vger.kernel.org
> Cc: kernel@dh-electronics.com
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-kernel@vger.kernel.org
> Cc: linux-phy@lists.infradead.org
> Cc: linux-stm32@st-md-mailman.stormreply.com
> Cc: linux-usb@vger.kernel.org
> ---
>  arch/arm64/boot/dts/st/stm32mp231.dtsi | 77 ++++++++++++++++++++++++++
>  1 file changed, 77 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/st/stm32mp231.dtsi b/arch/arm64/boot/dts/st/stm32mp231.dtsi
> index 4505fc0e3b537..b8cef81eceeb1 100644
> --- a/arch/arm64/boot/dts/st/stm32mp231.dtsi
> +++ b/arch/arm64/boot/dts/st/stm32mp231.dtsi
> @@ -7,6 +7,7 @@
>  #include <dt-bindings/interrupt-controller/arm-gic.h>
>  #include <dt-bindings/regulator/st,stm32mp25-regulator.h>
>  #include <dt-bindings/reset/st,stm32mp25-rcc.h>
> +#include <dt-bindings/phy/phy.h>
>  
>  / {
>  	#address-cells = <2>;
> @@ -146,6 +147,26 @@ timer {
>  		always-on;
>  	};
>  
> +	usb2_phy1: usb2-phy1 {
> +		compatible = "st,stm32mp25-usb2phy1";
> +		#phy-cells = <0>;
> +		#clock-cells = <0>;
> +		st,syscfg = <&syscfg 0x2400>;
> +		clocks = <&rcc CK_KER_USB2PHY1>;
> +		resets = <&rcc USB2PHY1_R>;
> +		status = "disabled";
> +	};
> +
> +	usb2_phy2: usb2-phy2 {
> +		compatible = "st,stm32mp25-usb2phy2";
> +		#phy-cells = <0>;
> +		#clock-cells = <0>;
> +		st,syscfg = <&syscfg 0x2800>;
> +		clocks = <&rcc CK_KER_USB2PHY2EN>;
> +		resets = <&rcc USB2PHY2_R>;
> +		status = "disabled";
> +	};
> +
>  	soc@0 {
>  		compatible = "simple-bus";
>  		ranges = <0x0 0x0 0x0 0x80000000>;
> @@ -769,6 +790,21 @@ dcmipp: dcmipp@48030000 {
>  				status = "disabled";
>  			};
>  
> +			combophy: phy@480c0000 {
> +				compatible = "st,stm32mp25-combophy";
> +				reg = <0x480c0000 0x1000>;
> +				#phy-cells = <1>;
> +				clocks = <&rcc CK_BUS_USB3PCIEPHY>, <&rcc CK_KER_USB3PCIEPHY>;
> +				clock-names = "apb", "ker";
> +				resets = <&rcc USB3PCIEPHY_R>;
> +				reset-names = "phy";
> +				access-controllers = <&rifsc 67>;
> +				power-domains = <&cluster_pd>;
> +				wakeup-source;
> +				interrupts-extended = <&exti1 45 IRQ_TYPE_EDGE_FALLING>;
> +				status = "disabled";
> +			};
> +

Should get rid of combophy node.

>  			sdmmc1: mmc@48220000 {
>  				compatible = "st,stm32mp25-sdmmc2", "arm,pl18x", "arm,primecell";
>  				reg = <0x48220000 0x400>, <0x44230400 0x8>;
> @@ -862,6 +898,47 @@ stmmac_axi_config_1: stmmac-axi-config {
>  					snps,wr_osr_lmt = <0x7>;
>  				};
>  			};
> +
> +			usbh_ohci: usb@482e0000 {
> +				compatible = "generic-ohci";
> +				reg = <0x482e0000 0x1000>;
> +				access-controllers = <&rifsc 63>;
> +				clocks = <&usb2_phy1>, <&rcc CK_BUS_USB2OHCI>;
> +				interrupts = <GIC_SPI 140 IRQ_TYPE_LEVEL_HIGH>;
> +				phys = <&usb2_phy1>;
> +				phy-names = "usb";
> +				resets = <&rcc USBH_R>;
> +				status = "disabled";
> +			};
> +
> +			usbh_ehci: usb@482f0000 {
> +				compatible = "generic-ehci";
> +				reg = <0x482f0000 0x1000>;
> +				access-controllers = <&rifsc 63>;
> +				clocks = <&usb2_phy1>, <&rcc CK_BUS_USB2EHCI>;
> +				companion = <&usbh_ohci>;
> +				interrupts = <GIC_SPI 139 IRQ_TYPE_LEVEL_HIGH>;
> +				phys = <&usb2_phy1>;
> +				phy-names = "usb";
> +				resets = <&rcc USBH_R>;
> +				status = "disabled";
> +			};
> +
> +			usb3dr: usb@48300000 {
> +				compatible = "st,stm32mp25-dwc3";
> +				reg = <0x48300000 0x100000>;
> +				access-controllers = <&rifsc 66>;
> +				clocks = <&rcc CK_KER_USB2PHY2>,
> +					 <&rcc CK_BUS_USB3DR>,
> +					 <&rcc CK_KER_USB2PHY2>;
> +				clock-names = "ref", "bus_early", "suspend";
> +				interrupts = <GIC_SPI 228 IRQ_TYPE_LEVEL_HIGH>;
> +				phys = <&usb2_phy2>, <&combophy PHY_TYPE_USB3>;
> +				phy-names = "usb2-phy", "usb3-phy";

Please update USB2.0 PHYs and speed:
				phys = <&usb2_phy2>;
				phy-names = "usb2-phy";
				maximum-speed = "high-speed";


> +				resets = <&rcc USB3DR_R>;
> +				st,syscfg = <&syscfg 0x4800>;
> +				status = "disabled";
> +			};
>  		};
>  
>  		bsec: efuse@44000000 {


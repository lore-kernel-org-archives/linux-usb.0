Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013065.outbound.protection.outlook.com [40.107.162.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DF89376475;
	Mon, 24 Aug 2026 13:19:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.65
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787577574; cv=fail; b=rMy866We36a+gtX8RDzlSbuBpp8Bi6PAxpyS/4gWjrkNop/6y4Zp52BD/kYkjIxYCg6hrtmqo3ol2hiJJ3YlwmthkYJrjci1+txBSz0ilRX5XwiTQpSPOBAmvMMH1q7zpw61cKFgJny39iHmNlV7LDj0wx0Jks4++qVpoHQdWiA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787577574; c=relaxed/simple;
	bh=sYgS4LphnQScVc3JuWUdecQkyQbpO4xnm6uTJi8LYrA=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=eUGa/mtBKkjZELo1+eQnEBMv8aEcSfEtQB6a+yjdRdkJAjZYpZK1U07pHg3ibqef51MFtiaokiwCzMsmLm0HNBsBa3qiv55bAG5zLlrYktU4J1ZDg4C7f3saOv5HXDCpHjneKcKLz0CIgagdBeEZfIbmdqOVsEslSqHWEe5KtzM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=NaQoMwwb; arc=fail smtp.client-ip=40.107.162.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="NaQoMwwb"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rfjVAVqSU8aYdjj2UcjvMmMs9AAhMqB+Y9lXrk/uBCUg2G6OLvo7C+16XbpujCA0BeaPGKqXPh5zTAcMMKgJGfNCcaJ/GKZAcH5crtzPVWcp2BuZe+5cDW3SPH42o5psfATwa9yiYZRuAQdA9EK/u22thRePIt6OUHrntmGgSIql47MxCm7jnqnoyamedmXDMFDqLxpeOOWZb6r8q1B2VtdTCkTEbEOTg8pFlNzXYqUT48lxZM5U8au5BEeI27/TcBZ5P0BXPwrz7vduNY9A5CmqEKC1Eg6B18Xpo0QbEaAaGySR1+eapcBL+wdO5r9mKVUPeMv1rsA1B0uqJqvH0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wCzOjEA9OywrEATDl45R1TfXZBBJe+6tm4EMtmxJt4w=;
 b=URgoKEyZIdkzbVm20saGD0aoN2QEeJjyPlWQ3UtQQ9/OMkrdlc8m49zyr+l8UBYAv5OYe+prksZwL2WdDnEiOC4NID3N6l2yUQP+0AT0xfw3OuhXPFov4VrNdUYCe5nFh/9hNZ5I2fktBuFlImyZETSD4UkJgYPElHP/hpMP3Wu3y4kUaRtjwYDo75dbo8ge2igJHQNuCRbfh8tIxKZmsZNPhz0CKSPikoNoo2sTZpu7nboOnBE0Mf9MYdnYqST6KYfyQpKtm3R7Nz4Z3btncypz6S6vEAaTVhOZGp3MLImShqbP4eIZLq80amUTmpeTBzNlTWNYxPJJZapLmrInHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=nabladev.com smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wCzOjEA9OywrEATDl45R1TfXZBBJe+6tm4EMtmxJt4w=;
 b=NaQoMwwbQFks28EXWVzr1ItwOWJItlXZoJWDR28rVJvDY2ZXcPRkZqapD0m31LSpWc/SDL4YKq981TLsA9Uvhmu/R9V+Cc4AMgX5E62NgtU33oYolySK+nbObzk7WQelSdDFMLcmvnbKSh+B0IcA3SdJ1O0qW9V3RdUAWDbMJrT1w4vT3JkGrIajFES5wg6pkcsg71t0dTsen9qa7omio8fW4RpMOIgYWnH67nwM4AGt1978dJsNGmYDdL3I0Ja8sSbV34syhl1N+RofgthZRR1elzeihsOWtIQJxoEjIbTeN6ccmnXQihUyBxWbr6u4/oiIIcPo3Jzajnz9D6zSyg==
Received: from AS4PR10CA0023.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:5d8::15)
 by DB4PR10MB6144.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:388::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.12; Mon, 24 Aug
 2026 13:19:25 +0000
Received: from AM4PEPF00027A65.eurprd04.prod.outlook.com
 (2603:10a6:20b:5d8:cafe::77) by AS4PR10CA0023.outlook.office365.com
 (2603:10a6:20b:5d8::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.339.12 via Frontend Transport; Mon,
 24 Aug 2026 13:19:24 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.60)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 AM4PEPF00027A65.mail.protection.outlook.com (10.167.16.86) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.360.3 via Frontend Transport; Mon, 24 Aug 2026 13:19:24 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Mon, 24 Aug
 2026 15:24:43 +0200
Received: from [10.48.86.251] (10.48.86.251) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Mon, 24 Aug
 2026 15:19:23 +0200
Message-ID: <a6c55491-7cbe-4856-bb45-b7f5872966fc@foss.st.com>
Date: Mon, 24 Aug 2026 15:19:21 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 9/9] arm64: dts: st: Add USB nodes on stm32mp251
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
References: <20260822074816.548662-1-marex@nabladev.com>
 <20260822074816.548662-10-marex@nabladev.com>
Content-Language: en-US
From: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
In-Reply-To: <20260822074816.548662-10-marex@nabladev.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: ENXCAS1NODE2.st.com (10.75.128.138) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM4PEPF00027A65:EE_|DB4PR10MB6144:EE_
X-MS-Office365-Filtering-Correlation-Id: 6ae98eac-9034-48a7-d332-08df01e2515e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|376014|7416014|82310400026|1800799024|23010399003|56012099006|10067099003|4143699003|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	LKGQ+lukUjNcB/acinK9XiWx0Er1ZaghSyPB3U3Oyc0R37PMJDZ1Qhux0tf/rDUQviTeZT41VTyEa1OGA9A31IuNPR4Bx8dHx8pZRMtERXWvkoTrUgPwiy3FF2qgWBcr4jN9LaCZhzic28g9EmA072gD5Ix91x6G4dgK8TtBBStVfOKIICmftBKbJUbI2KvPMOTpfdh+TOW6WHL/zvWUBfw5XhSuEzIJrM4l2f8WRtpkkXXnw3TJi/aF49eJSBf7z9ejyMozkCfC0TqOJsKyeKaR1xh9BfZ4R1vKBI37xvCq0mMnLDuijYK3HiVaAdgXe/uO5wutqAesHCtD398DxhVqzQ9VmChYXlwhwJG9EPRq/W+060iiU2dhUJZpJp8qu3SuXtjWGwz5kiNpQE4M5rk9dKIbs/YiPoHgnWlZAKIVbjiDoHlqISzH4G9PF48nMJQ0JWGYjWRY9YZ8WQZOGLNkTBuaZkwbgT0WBdloaAR2jRotsliRj7uP1VMXbSZWmsJvJ1ZbW21izrPFQ/jJoORrQtNbU7Twl0qwtESBqrzaLeGe5YypAyHFEisPtU62A740TVe9I46DJJ+YyIJnf07zO+X+gQhZQAwl08kguO+LwmAL9cs1PAerjb464GuvydQysRdJz2dsAScxzG03KsEAblN1mV49/Wkb/UK8ERqTFOKePQladEYlAypBsiC4ylJCWTfbjhVXklECN8pqcQ==
X-Forefront-Antispam-Report:
	CIP:164.130.1.60;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(376014)(7416014)(82310400026)(1800799024)(23010399003)(56012099006)(10067099003)(4143699003)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	cv0BORWU0EyZsxx0XHEogXXuVtrSdzd9Z6EMbF0qMZsy4+eSoaVypQ4KZYzs7e/kw8/QZBTFOV6Z3CM9jFO/6fjtPy9xbx9jfVXhYKPBZ9NXDGPPZtaQa6vM7SHElE8MGmoP6fmvh1Qy6bGkH9dNHQ/d6W9XPLhs+j9rQ18mg+jm7D8BVFkh7/KmY30e2dST9PoC9wDPYol7768b/fSyF7LFOW6kf18Z0uwrsSBart3wCpPVK/h/ZYs6cuS1/9OLdA2VON1ViaQ7bvuG/4Z0eYU560tyx7JKfkPEBeETtR8FN0f3+1CfZCqnkCZcJCi181mBDhKu+JRQ26TSwdvgoWAm/U3tWsdc2a2l7mc8pZmBxo4kQM9Q0Dbd2RcIwsgKASOTjLjnNyrTzl+T+77PXr3F3XWzse5+ZkqpcQdWTKveQFyVu1QAzAc0NdSzOH4X
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Aug 2026 13:19:24.8401
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ae98eac-9034-48a7-d332-08df01e2515e
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.60];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM4PEPF00027A65.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB4PR10MB6144



On 8/22/26 09:46, Marek Vasut wrote:
> From: Pankaj Dev <pankaj.dev@st.com>
> 
> Add USB controller and PHY nodes to stm32mp251 DT.
> This includes two USB 2.0 FEMTO PHYs, USB 2.0 host
> controller and DWC3 DRD controller nodes.
> 
> Signed-off-by: Pankaj Dev <pankaj.dev@st.com>
> Co-developed-by: Marek Vasut <marex@nabladev.com>
> Signed-off-by: Marek Vasut <marex@nabladev.com>
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
> V2: - Fix up Sob/Cdb lines
>     - Move PHY into syscfg subnode
>     - Turn st,stm32mp25-syscfg into simple-mfd
>     - Use clock-cells = <1> to discern OSC and future PLL clock from the PHY
> V3: - Describe OHCI clock as the CMN clock
>     - Fix up Sob/Cdb lines further
> ---
>  arch/arm64/boot/dts/st/stm32mp251.dtsi | 65 +++++++++++++++++++++++++-
>  1 file changed, 64 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/st/stm32mp251.dtsi b/arch/arm64/boot/dts/st/stm32mp251.dtsi
> index 6e985f115b195..dd2f7ddd9b634 100644
> --- a/arch/arm64/boot/dts/st/stm32mp251.dtsi
> +++ b/arch/arm64/boot/dts/st/stm32mp251.dtsi
> @@ -1746,6 +1746,47 @@ stmmac_axi_config_1: stmmac-axi-config {
>  				};
>  			};
>  
> +			usbh_ohci: usb@482e0000 {
> +				compatible = "generic-ohci";
> +				reg = <0x482e0000 0x1000>;
> +				access-controllers = <&rifsc 63>;
> +				clocks = <&usb2_phy1 1>, <&rcc CK_BUS_USB2OHCI>;
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
> +				clocks = <&usb2_phy1 0>, <&rcc CK_BUS_USB2EHCI>;
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
> +				resets = <&rcc USB3DR_R>;
> +				st,syscfg = <&syscfg 0x4800>;
> +				status = "disabled";
> +			};
> +
>  			pcie_ep: pcie-ep@48400000 {
>  				compatible = "st,stm32mp25-pcie-ep";
>  				reg = <0x48400000 0x100000>,
> @@ -2002,9 +2043,31 @@ exti1: interrupt-controller@44220000 {
>  		};
>  
>  		syscfg: syscon@44230000 {
> -			compatible = "st,stm32mp25-syscfg", "syscon";
> +			compatible = "st,stm32mp25-syscfg", "syscon", "simple-mfd";
>  			reg = <0x44230000 0x10000>;
>  			#clock-cells = <0>;
> +			#address-cells = <1>;
> +			#size-cells = <1>;
> +
> +			usb2_phy1: phy@2400 {
> +				compatible = "st,stm32mp25-usb2phy1";
> +				reg = <0x2400 0x24>;
> +				#phy-cells = <0>;
> +				#clock-cells = <1>;
> +				clocks = <&rcc CK_KER_USB2PHY1>;
> +				resets = <&rcc USB2PHY1_R>;
> +				status = "disabled";
> +			};
> +
> +			usb2_phy2: phy@2800 {
> +				compatible = "st,stm32mp25-usb2phy2";
> +				reg = <0x2800 0xc>;

Hello Marek,

Similar to stm32mp231: should update size ?

				reg = <0x2800 0x10>;

Thanks & BR,
Fabrice

> +				#phy-cells = <0>;
> +				#clock-cells = <1>;
> +				clocks = <&rcc CK_KER_USB2PHY2EN>;
> +				resets = <&rcc USB2PHY2_R>;
> +				status = "disabled";
> +			};
>  		};
>  
>  		pinctrl: pinctrl@44240000 {


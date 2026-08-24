Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010017.outbound.protection.outlook.com [52.101.69.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BEC1423160;
	Mon, 24 Aug 2026 13:18:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787577493; cv=fail; b=s84v8/ik7112HpTZzZUHjaLKTe7lMzZxlVE8k0v2/evmPYK210tS5Fi/hR+y718qWcaFsnF08vEs1CVod1yTmyVVLSI70W13CVaMWFOhi4qEFzll9fHsXYvOcnfeALsEclPcI1J4tmibz99N5onUtpPfbqZo87kxpn+GFqcXN7Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787577493; c=relaxed/simple;
	bh=VEeCQbuFO6LTlvmGVytrm2o1E7wTpR8WuICdrTSZni4=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=XC0zvcOxrBdRo0V/hNoOXoBSPOhzFpez6U7CrBADafaRW2wPfoTeQBH6WJKMqbGy8j76uyQhjL7p00VoHhMK1I6bSWjeI+msWwdqYTai1ixCDZDiOfHEZMR5p/LtrtCgKb3biTwkYMmHb8m77t24eIE46/cit+0wPPEqPCnqbC0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=CWDlzOrJ; arc=fail smtp.client-ip=52.101.69.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="CWDlzOrJ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ne4kBoczRC+SzXV+RLK0L+7UuIs6wTLbnIUj0iMjmMj5bKe77av2Puogv9Z8LEN6GvpAm4XDdpFzYQNtWwJeTDzWhr6vf8R+qg8q1zQzUXopOqcSkpQ9jCyevXxEcjaBT+Q+B50At0HXtF0PiexbF7Lrq8VyZQ04RvaAvQQzFApeiMos84DC4zH4po0fdFtGcosSU8HDckNor7MCFSJCuy0cLBxNcVbxVB0lO3ZLY6ON2gNS96bNoppKQvmF2CnqJLgx0k2BerZ5rH0jWC2mq9KCXj3MjXOHb7xbvEPMtX2yCbhmXVvUgdLnYJAC/nRPpWUZcqY2kpikCrIP3I6r0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MtJk8LKjgPxropMfN6yTesjMYMXNi1KpcghJUpGftXU=;
 b=QGW4sd5hUxL+V82z03EebrJyoPg9jNFlXQCBM6Gwr0QtPp+ajEgUROjQQ2AJlBQyhK3dcQW/PeEvGb9gw3JUz+Wqnj33Tu+QTejCuanDjCHlo/3Q5uw3NbY5KE9hm63EcaqK+unl5uOfjx1JOTdlpk5qjF4JaLVyNlmYvoGv3zrj1qxQgE0dDaNwDOBnqMncU4T1x831q9xouqy+U2RZRSSPBfPw893P4UuY/UzaTzNE4lgvxwuzECzlgsSVHTS7lWctXlxEnDkpuKTYDbi7ml6vGHOwi2BUjRF1NSsXiGSa8jxLpmVSYK9P2kAvUo5iD1W7fbA5NiVgSFTd7OREkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=nabladev.com smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MtJk8LKjgPxropMfN6yTesjMYMXNi1KpcghJUpGftXU=;
 b=CWDlzOrJ/as4ND9biTxMRigL0KcgMU4shV13iqjigsDHlt3WX1jXrYYC54UYlgAM+l72Nyb6ZRO6RttK6eRERCx3JDN1WwcK41pqRMP7aKuHraTnN44sdEK0tJeARzzhy2ImjfNDdqNSsjQI5IqeXQlS32FphW0+R7n3wf4WsDID7yeQCSCrN6kGTwkmfiiv9d0HPMHIC75UvF4FBLiNJEYuzBfjw6DSZnW4pUuB5pSwKnaOpexVIzO8Yy0Xz6jQZKVs48RvXoHOE9DyKwzEFOL5FNNJ6nWS7leC1CKO+ajErwfxgeLvjVOKwuVYO5LBKVaUsTESj5MamFtZyyTHbw==
Received: from AS8PR04CA0155.eurprd04.prod.outlook.com (2603:10a6:20b:331::10)
 by VI0PR10MB9126.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:800:233::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.12; Mon, 24 Aug
 2026 13:18:07 +0000
Received: from AM4PEPF00027A67.eurprd04.prod.outlook.com
 (2603:10a6:20b:331:cafe::22) by AS8PR04CA0155.outlook.office365.com
 (2603:10a6:20b:331::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.339.12 via Frontend Transport; Mon,
 24 Aug 2026 13:18:07 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.60)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 AM4PEPF00027A67.mail.protection.outlook.com (10.167.16.84) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.360.3 via Frontend Transport; Mon, 24 Aug 2026 13:18:06 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Mon, 24 Aug
 2026 15:23:24 +0200
Received: from [10.48.86.251] (10.48.86.251) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Mon, 24 Aug
 2026 15:18:05 +0200
Message-ID: <a77b459f-5b08-453a-a247-c320617beee6@foss.st.com>
Date: Mon, 24 Aug 2026 15:18:03 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 8/9] arm64: dts: st: Add USB nodes on stm32mp231
To: Marek Vasut <marex@nabladev.com>, <linux-usb@vger.kernel.org>
CC: Alexandre Torgue <alexandre.torgue@foss.st.com>, Francois Choleau
	<francois.choleau@st.com>, Christian Bruel <christian.bruel@foss.st.com>,
	Conor Dooley <conor+dt@kernel.org>, Greg Kroah-Hartman
	<gregkh@linuxfoundation.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Neil Armstrong
	<neil.armstrong@linaro.org>, Pankaj Dev <pankaj.dev@st.com>, Rahul Kumar
	<rahul.kumar05@st.com>, Rob Herring <robh@kernel.org>, Rosen Penev
	<rosenp@gmail.com>, Thinh Nguyen <Thinh.Nguyen@synopsys.com>, Vinod Koul
	<vkoul@kernel.org>, <devicetree@vger.kernel.org>,
	<kernel@dh-electronics.com>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux-phy@lists.infradead.org>,
	<linux-stm32@st-md-mailman.stormreply.com>
References: <20260822074816.548662-1-marex@nabladev.com>
 <20260822074816.548662-9-marex@nabladev.com>
Content-Language: en-US
From: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
In-Reply-To: <20260822074816.548662-9-marex@nabladev.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: ENXCAS1NODE2.st.com (10.75.128.138) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM4PEPF00027A67:EE_|VI0PR10MB9126:EE_
X-MS-Office365-Filtering-Correlation-Id: b209bdec-9c59-4e43-1a52-08df01e222ce
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|23010399003|7416014|376014|36860700016|10067099003|56012099006|11063799006|4143699003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	BrENvMlG5fdBrWiCPTO02dgCvWOg1tObwhxE0lK8gfSJJ2n5OFVZtdzjN0HV9g1R8RmYzYTWqcprBYtRnWcC1K67J4EO5E02b5n4d7mBF8F7fytIprc/BmYY4HpGGl3syf7w+S+P9KEDEg6uFh9DrhiDVWAUnjPjjPNxX+wKtK8py2Co3kyZIVpGnbq3SKku+F8KKBMMGRfzA813xFuSIxLm7iE/PIhUFUgZJMk403jEcbNr8puNWbP/thkBLxPVMf+JCFBoCspkwt4Wau44sairVb/7MLZxt4h+f6xeSesdRnz75E16V2b6QRQW15SebFFVoz+Vjayz2R8jsACwqv3yHVXNZR1tVWMP4MKM8CNUKVOyGO+VbEYbhzFbRYAd9FREl7YfDSEAjPcW1OSd2r4e7FNGpvDYstRO5SR/m8b5B9QRIc4YWKSznQNHet18gNANs0SAl2VXlyFAgy+PbZlsLUKJxRc0R9h9wkC8jg2J9ANycNFYWEjMZa3LPARlDDZRpWx/ESi+pFgb1UjeNcS2mL+v1Myr43Q3OCQalIoPaKSqZ3pPmU/hcLU8pdH96bX9OZPDHQwqIJ15TJwzVlB8NYarZXrKsWMbInXsxdYI6Ej/HqirOCgO9EEJG+Ow5JGNpW5UZyFIpXNMael7tUAxgeH+z9K8T8QFrXT989PtZeJxsa41e8bGxASAJNUHyHRCg3znEmE5u8v4XAk4Fw==
X-Forefront-Antispam-Report:
	CIP:164.130.1.60;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(23010399003)(7416014)(376014)(36860700016)(10067099003)(56012099006)(11063799006)(4143699003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	hw8GF6KiWl5YHFtY7Koi0oj5MD8z6WKRXw3X7FfF3Z1v0UD6XeYJI5LKwHkmew740CyDll+WJ3niyPcasi9RkYBQqDZiVQKR9atnVRYsKUfRg3fOfUk/wYIUY939J7dnJsNEK7Qk4Ad71muDRBtHAMctJh4gFsa7zV/uzBC7vGYiZrorQYtPX+tE5EtwrUYmv6XYcu19XmPC8xu6Gp+7VXRtYev+flIIyYWhsxr8gvZNzNjrC6A8Z5tDHjaFoE1mvCPUSisLEQidBSG0xMk5i4ERUjWFS+wVvmC17HfcnJd7ANyGtL5jaoP54oZtsCqYyMlOGlknVcwOnlmV8OOIrACTVcX6QSloZwlVICtP03xFpIib4lUtvh3dFZQfRQkHF/2jL0M2yI+rB/5tiwPPtQjKAwOPmC41RxVY0C5JhpG3vOh1wbfCczV6AGr9SdvL
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Aug 2026 13:18:06.7242
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b209bdec-9c59-4e43-1a52-08df01e222ce
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.60];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM4PEPF00027A67.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR10MB9126

On 8/22/26 09:46, Marek Vasut wrote:
> Add USB controller and PHY nodes to stm32mp231 DT.
> This includes two USB 2.0 FEMTO PHYs, USB 2.0 host
> controller and DWC3 DRD controller nodes.
> 
> Co-developed-by: Alexandre Torgue <alexandre.torgue@foss.st.com>
> Signed-off-by: Alexandre Torgue <alexandre.torgue@foss.st.com>
> Co-developed-by: Francois Choleau <francois.choleau@st.com>
> Signed-off-by: Francois Choleau <francois.choleau@st.com>
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
>     - Turn st,stm32mp23-syscfg into simple-mfd
>     - Use clock-cells = <1> to discern OSC and future PLL clock from the PHY
> V3: - Drop combophy which is not present on MP23
>     - Describe OHCI clock as the CMN clock
> ---
>  arch/arm64/boot/dts/st/stm32mp231.dtsi | 67 +++++++++++++++++++++++++-
>  1 file changed, 66 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/st/stm32mp231.dtsi b/arch/arm64/boot/dts/st/stm32mp231.dtsi
> index 4505fc0e3b537..314a514f31024 100644
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
> @@ -862,6 +863,48 @@ stmmac_axi_config_1: stmmac-axi-config {
>  					snps,wr_osr_lmt = <0x7>;
>  				};
>  			};
> +
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
> +				maximum-speed = "high-speed";
> +				phys = <&usb2_phy2>;
> +				phy-names = "usb2-phy";
> +				resets = <&rcc USB3DR_R>;
> +				st,syscfg = <&syscfg 0x4800>;
> +				status = "disabled";
> +			};
>  		};
>  
>  		bsec: efuse@44000000 {
> @@ -1062,9 +1105,31 @@ exti1: interrupt-controller@44220000 {
>  		};
>  
>  		syscfg: syscon@44230000 {
> -			compatible = "st,stm32mp23-syscfg", "syscon";
> +			compatible = "st,stm32mp23-syscfg", "syscon", "simple-mfd";
>  			reg = <0x44230000 0x10000>;
>  			#clock-cells = <0>;
> +			#address-cells = <1>;
> +			#size-cells = <1>;
> +
> +			usb2_phy1: phy@2400 {
> +				compatible = "st,stm32mp25-usb2phy1";
> +				reg = <0x2400 0x24>;

Hello Marek,

The size 0x24, covers the PHY control, trimming and vbus control logic
for PHY1 (USBH). So this allows to later extend the driver for that, right ?

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

Then here, I guess the size should cover also trimming regs ? e.g. 0x10 ?
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


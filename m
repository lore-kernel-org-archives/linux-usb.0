Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012001.outbound.protection.outlook.com [52.101.66.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 770174DB575;
	Fri, 21 Aug 2026 16:23:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.1
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787329425; cv=fail; b=NKCe65AL3BDbhFTSxJOjmhcnmSiUXraMZTOvjpNkshloO5Hdp3lK2jk80aKoKw9zLMT0FAg963yRX1I5jFNPBCMRcx019xSUA/zWCQFOE9l2d5tijc9x9V3AsnkUOrWV8UjkZVXtyEnZSLBujS6ygYP3r4192zNJjWVnBkvLDsM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787329425; c=relaxed/simple;
	bh=aj0YZtT24s8cuNQYQXlcykNyht6Rjr0BazpVqYF+Mgo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=rvXeCYDEqwB/Kswjfoq0yTbTD01p6zj+E70e4Os7cCNYDlCnqnWHbqb7OZqb1QrR7Fc5Z3ontiiCmaBTfes0t3jrHVALykSlGS7KrqmXgXQsYrIJ1M6TtMQbeqheDM43b7DIyWpqMLAfi/pkMUUxX1TxnER9n2zopGz11xfhfq8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=TKI0rAaT; arc=fail smtp.client-ip=52.101.66.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="TKI0rAaT"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vt1NlrIix1Cvb/J8mI3Q3JKmii16qxL0XVO2Ka/6DdhnxS7PdOx2ih/X12kwgSWBPH1aKzm38DBLEWAXl9LKngYbtVGqPubYM5tyq5LVNqLhJkr3JCSJp0lMYz6xCufgdM0FXN5Mcq7AMuBq/Ae/1Yytch02Um1Eh6r2ZybJBOZrZ2EuAMfeaOH+32q68ti6GggTWjPjg8415ExnZp2aUo8W9Y/StK0zQPqlEcofj8ypckcdJRQIfme1aCz8yUXFlAP1sfV/uM0xxrN7CRZ4y5Y53tqOT242OqExrbuox3b72WhWOcYt9eOZR6cQvRUGSpcUP7snn8WdU25qkUaLEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hP7hhIf7wFwZnKEm8l5Z20gDmziBB27NVhkYA3BI8wM=;
 b=w35AnygJT6OEjIYEeWSHnTJj0mT6o2P1dazGY5RsL1UvgeGA9TFiAkPkmNfTe2p71E+yWy15KTiYcuYSfFY6tKEFKrvElyd5rSxfpCnRxH2ZSaKS7eEyazMcOodPwpJAPK7NUutjv6mA8FiarM3eJVuEbGtt794axiH/FsT3OwUBXUXuiaHRtzuHRd43ZX1iHikYrOtH+VVc75U7otiNGUtAfMbUrESn0kHRp4MJRZG9M5QFcIalqmx0lNd4s9u3Xxa+Lw5/LPgxYTiEH2/X5ajjn48eTIvb1wzXS1fav04vHtRNiEvs8o4r3mgG1emdMSgWN+DElzLqJXlVcxsl0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hP7hhIf7wFwZnKEm8l5Z20gDmziBB27NVhkYA3BI8wM=;
 b=TKI0rAaTcwHVkzScvf3nW+zzPVgTCIr9JXO6M4AEXV73UcWY9ilOHDbElu1JSDC+lzY1wBf/GflIKY6g46LKaTf10shQSB0KUzHaACDO2FccqbGk+Tq82PXPpYRKGMByEXfTlef2v5CT9ebTguFfbsjDo4TX0ZDxWhfxPnqNOU8tQA4mc2aoGWC+XeKHH4IegBTlCiuPl3a26ErC6FJ8yWBOgvYoP2XjClPZ08nlHF1IPOzt27YucE/eVYLQQ+N8ccETsnWVO6T2ihdw9FeUAAtd4bPH6o7Xa4q81HRM95AjSMZq7GWAqePldcooKgU1/zfN8Not1UwLpyxh2hzjXg==
Received: from DU2PR04CA0360.eurprd04.prod.outlook.com (2603:10a6:10:2b4::28)
 by AS4PR10MB5870.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:515::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.10; Fri, 21 Aug
 2026 16:23:37 +0000
Received: from DB1PEPF000509F3.eurprd02.prod.outlook.com
 (2603:10a6:10:2b4:cafe::a2) by DU2PR04CA0360.outlook.office365.com
 (2603:10a6:10:2b4::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.339.11 via Frontend Transport; Fri,
 21 Aug 2026 16:23:36 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.60)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 DB1PEPF000509F3.mail.protection.outlook.com (10.167.242.149) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.360.3 via Frontend Transport; Fri, 21 Aug 2026 16:23:36 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Fri, 21 Aug
 2026 18:28:35 +0200
Received: from localhost (10.48.86.251) by STKDAG1NODE2.st.com (10.75.128.133)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Fri, 21 Aug
 2026 18:23:35 +0200
From: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
Date: Fri, 21 Aug 2026 18:23:25 +0200
Subject: [PATCH 14/16] arm64: dts: st: enable usb on stm32mp257f-ev1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260821-ucpd-host-fusb340-v7-2-rfc-v1-14-c5e27cbc0795@foss.st.com>
References: <20260821-ucpd-host-fusb340-v7-2-rfc-v1-0-c5e27cbc0795@foss.st.com>
In-Reply-To: <20260821-ucpd-host-fusb340-v7-2-rfc-v1-0-c5e27cbc0795@foss.st.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Christian Bruel <christian.bruel@foss.st.com>, Fabrice
 Gasnier <fabrice.gasnier@foss.st.com>, Heikki Krogerus
	<heikki.krogerus@linux.intel.com>, Alexandre Torgue
	<alexandre.torgue@foss.st.com>, Philipp Zabel <p.zabel@pengutronix.de>, "Liam
 Girdwood" <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, "Srinivas
 Kandagatla" <srini@kernel.org>, Marek Vasut <marex@nabladev.com>, Vinod Koul
	<vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, Pankaj Dev
	<pankaj.dev@st.com>, Marek Vasut <marex@nabladev.com>
CC: <linux-usb@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-phy@lists.infradead.org>
X-Mailer: b4 0.16.0
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB1PEPF000509F3:EE_|AS4PR10MB5870:EE_
X-MS-Office365-Filtering-Correlation-Id: d8b9ef1e-23d5-4b36-d067-08deffa08d7c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|7416014|376014|23010399003|1800799024|82310400026|921020|10067099003|11063799006|5023799004|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	kTsksAgAkvLgdkFAf7Qd+qZ7PwpNRghzOJVogq4/QTTOHLj76fmG5zxxAcoxq5N7aDUZolhJTrtGo1rYov6Tk9v6CFR60JM5wKZQpLTsP0vDxMlxekt280dW2gfZ+ayRlTN4TT3OjsAPq1zi+yOem/98R6YLH246Xths/KULq/KAkmaMVLYJVGenPw7yvOgNcYYROkVqEv4Dpm+zSwcMwXWPl9u6ecs0Rz7O4QJSpyPmCCv1qCOLGfnTPQOFd5ULKm5CK5R8Nz2bNL+qmauKusO5vHRn8EFAUp2Hc7ghhNLhlohzwgRZ3RM2BGeTFN8dQnjYP1fJKUNhJmKh0ByiE2EbkXv3dKBBARP8C6KP5b+w/InRbocZCTzzQd2yM+uEJ35bEvN1M/ZBQJmuTICumlIRj3KgqfUIvYs7aZrmqRWYHLajqN305Gnk0WNlpv3nXfQ7BvsuBxfba7q7zPC5X7Nqvan5IhZfTlUd/j464D1CdBk+Y4bIvtS/ClO0mV4lXUM+fteM3/4Lu2VQao7XAcOEvYkR0METdFTzuuBjXbIapjoOZ9hC6JBN6ZXlfGpqAEog9h4WLwZD9tOaH9VlRwmEdxZi/iioZJXMJi88jlrEDGiyHRPo05/Nu+V4l2o1Ze+WSlR7Xilm+C6jLX4JGAvxPTxck8ICWxyF3vVy8vYaWyYet/cB+Z3oxa3XDtaIlKxoT09OR/Su7vROcnWNAHsOlXxSoSuSTniBlMlv2nxHuw2awHSBLbWFwL0lrUWO
X-Forefront-Antispam-Report:
	CIP:164.130.1.60;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(7416014)(376014)(23010399003)(1800799024)(82310400026)(921020)(10067099003)(11063799006)(5023799004)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	P+EAQV0LoafwRoUKmj7RFlW0mhjZI9Cyae00JCs2oShtpSv8FmqFnn3uI8N7WuJS+Rs2X26Jz5cbLkSdfPDliDpR82X3agb7+jU4ENGDjjk2StVD/zwefGDbm+xR18Tw6VL3AFm+i5b5bMpZDZxJu3lrSFTfwQALHEqoHhEg+QA0xJOpOg93+wVVjcGbnCw6S4awlefKlRb3eSiy4FQpDTUnIp2N/9F1pTfiBXK7Om3Za7S5754H9uCsVVLdAMDQ7ZsL+3TXXtoUT3C6OtJVOsAZcwPyOnuefXM6wifdt8TdZ6iQeLlWihdPWEAhiqYEO3nAXK8LtQMW3BbqpNv92W9/rKQbEH+n0DbUJUaBFt/nMEPQk42+lDkGWbHw11eTBBXZ29gxvsGQs6fCBxOSFf8bdtbBsQAKu2bI+YyexgldLWh3wqnZWtVLXe3cjM0f
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2026 16:23:36.5558
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d8b9ef1e-23d5-4b36-d067-08deffa08d7c
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.60];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB1PEPF000509F3.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR10MB5870

STM32MP257F-EV1 board uses two USB controllers:
- USB Host port, with external onboard HUB providing to connectors
- USB Dual role Type-C port
Both are capable of to operate in High-Speed mode.
The Type-C port management is done through integrated UCPD controller
and external TCPP03 I2C protection chip on I2C1.

Signed-off-by: Christian Bruel <christian.bruel@foss.st.com>
Signed-off-by: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
---
 arch/arm64/boot/dts/st/stm32mp257f-ev1.dts | 79 ++++++++++++++++++++++++++++++
 1 file changed, 79 insertions(+)

diff --git a/arch/arm64/boot/dts/st/stm32mp257f-ev1.dts b/arch/arm64/boot/dts/st/stm32mp257f-ev1.dts
index 14e033f365e3..6c2bfbf77aac 100644
--- a/arch/arm64/boot/dts/st/stm32mp257f-ev1.dts
+++ b/arch/arm64/boot/dts/st/stm32mp257f-ev1.dts
@@ -253,6 +253,28 @@ phy0_eth2: ethernet-phy@1 {
 	};
 };
 
+&i2c1 {
+	pinctrl-names = "default", "sleep";
+	pinctrl-0 = <&i2c1_pins_a>;
+	pinctrl-1 = <&i2c1_sleep_pins_a>;
+	clock-frequency = <400000>;
+	status = "okay";
+	/* spare dmas for other usage */
+	/delete-property/dmas;
+	/delete-property/dma-names;
+
+	tcpp: typec@34 {
+		compatible = "st,tcpp03";
+		reg = <0x34>;
+		enable-gpios = <&gpiog 2 GPIO_ACTIVE_HIGH>;
+		interrupt-parent = <&gpiog>;
+		interrupts = <1 IRQ_TYPE_EDGE_BOTH>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&tcpp_flgn_pins_a>;
+		status = "okay";
+	};
+};
+
 &i2c2 {
 	pinctrl-names = "default", "sleep";
 	pinctrl-0 = <&i2c2_pins_a>;
@@ -516,6 +538,27 @@ timer@11 {
 	};
 };
 
+&ucpd {
+	st,tcpp = <&tcpp>;
+	status = "okay";
+
+	connector {
+		compatible = "usb-c-connector";
+		label = "USB-C";
+		data-role = "dual";
+		power-role = "dual";
+		try-power-role = "sink";
+		typec-power-opmode = "1.5A";
+		pd-disable;
+		self-powered;
+		port {
+			typec_ep: endpoint {
+				remote-endpoint = <&dwc3_ep>;
+			};
+		};
+	};
+};
+
 &usart2 {
 	pinctrl-names = "default", "idle", "sleep";
 	pinctrl-0 = <&usart2_pins_a>;
@@ -534,3 +577,39 @@ &usart6 {
 	uart-has-rtscts;
 	status = "disabled";
 };
+
+&usb2_phy1 {
+	vdd33-supply = <&scmi_vdd3v3_usb>;
+	status = "okay";
+};
+
+&usb2_phy2 {
+	vdd33-supply = <&scmi_vdd3v3_usb>;
+	status = "okay";
+};
+
+&usb3dr {
+	maximum-speed = "high-speed";
+	phys = <&usb2_phy2>;
+	phy-names = "usb2-phy";
+	usb-role-switch;
+	status = "okay";
+	port {
+		dwc3_ep: endpoint {
+			remote-endpoint = <&typec_ep>;
+		};
+	};
+};
+
+&usbh_ehci {
+	#address-cells = <1>;
+	#size-cells = <0>;
+	status = "okay";
+	/* onboard HUB */
+	hub@1 {
+		compatible = "usb424,2514";
+		reg = <1>;
+		vdd-supply = <&scmi_v3v3>;
+		vdda-supply = <&scmi_v3v3>;
+	};
+};

-- 
2.43.0


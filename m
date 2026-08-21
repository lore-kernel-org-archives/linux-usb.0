Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010059.outbound.protection.outlook.com [52.101.84.59])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02A3B4DBD8A;
	Fri, 21 Aug 2026 16:23:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.59
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787329431; cv=fail; b=KoBh5frfRXfaFlGalzn76SBwTylg6mQd1JCT8kgOyJBg8lCE/RTmM51CyLovsVWayHiMt7939Lrm5/aRh3lWnK/wNG3uehD2irtEqOF/OHGJr59FgWoXTNSQXjXN6eqfGG0sxb51LU9KdnoTLoQDlIEPLfE6SZfPD3h/wXPQjNA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787329431; c=relaxed/simple;
	bh=qoQYbbmmMlAxP66LsT1aaSjRen4Nkni7wezF73fFr1g=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=uP2+wd4qd9NbNlG+ghNSs2NnxOztEIUrkt588aDtjdHxiWO1bCnAJnFLgLgEpEZScqmUCQhvfVwzREa+BnjxFRTw7mL0+kCmpFw+wE8qe/e0Bd1YyQNo5lqTCZ9IsK+BFWVn4NlMk8mPrIoj++u8ruA4xd5krCrM4n8sLxAWgWY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=MUw+WPjD; arc=fail smtp.client-ip=52.101.84.59
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="MUw+WPjD"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HaCccs/YSx60eHbN30sQVV6j+vyEmdeZcIin9lS/P4GHs2rXUqtkuu1Q5wtP10jHRL2jrt7yA5hecNhtBDhdHM1Y1MQbe28Y2BnXrJ+pUsscmClVZCRnhsOWLZwMKSBfgGbdXC5+9cIW4TWzacRThzPQLFBrve7kFO9Ja0BpYJBpVPZ4KQp1O4xLZ69mtilTZoLRAGIa41T/NJWQZWPFb6Rd1UH525YuQmuHLdM9iOaGnLXhRJxej+bTrLW3hP5o5oJNEIFzhYT/3kLjIr7HJENM+FSLrEzKkN2A4zsg/dM0uhzmTiBvqLGsN1A4jEpDgIUDWXdjbYRwQj+j4y7A9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cCHaMS8/2vBYsSQKE9oSrF/R2Iimd6I93ZbaBZMrt4w=;
 b=AzEXoUVFFQlB40mP7Lo35UX/GJl8L5JWi1xMo9wX1wUh4QlFekePk7CyT5FmgvtqMMpBWSUK8SFAyXZdzgtwoTMWWl9qpbMXrd8uMNiLasodBGyjEkXuWYKYdAIbHQ9RyuV6isw7xdzizORjFVgqFwRCiBAo3jwWsyizWPnz6AjQC8N91prsaVy0EHcQfjpMtBj6MwsJiC2X3yN8h3SClAFkCiKbM3ZQBRsKmgpgufecOwhfGZNWt/w2wDsRQGKcWzhV5rL8S+D/Ri+ed58YP9NZbB3GHytPHqFyFXQrMg+D535hUf8QVWZJpAruo6gNanZDZkIquuVH/rG2OYkqGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cCHaMS8/2vBYsSQKE9oSrF/R2Iimd6I93ZbaBZMrt4w=;
 b=MUw+WPjDg4M7CbCL4ymQU6spwN7eaa8EnOqLG+hWfO5gAffYErg1LQlLXmMbpSOa8qdz0k1PcmIeQ8lCBSlCcW2TFHM5maVHsVKMXUXNmNaNwRYTeC9N+AWRV760XHjbMoeZFEyxSUPc2mkBINOUPeyQ7RYq7i7gQ+ZjQywD7aGC0bPaNcYToYFm8pADYLwugS8qgAUwecJAFPv2OrWs6ayHjFp/DTdCUWJlDXlvO0D09TyaGA7ot39s0J8zkjTOpx9gi6NcA5eRd6P1O/cgQWsrf8kE3Ou+WE8c8Ilv0Mn2GX/NQGnT17vLZ8NiBxK94lwuhsC/cVFccC/ilBvguw==
Received: from DU2PR04CA0353.eurprd04.prod.outlook.com (2603:10a6:10:2b4::13)
 by PAWPR10MB7368.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:2ea::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.10; Fri, 21 Aug
 2026 16:23:38 +0000
Received: from DB1PEPF000509F3.eurprd02.prod.outlook.com
 (2603:10a6:10:2b4:cafe::80) by DU2PR04CA0353.outlook.office365.com
 (2603:10a6:10:2b4::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.339.10 via Frontend Transport; Fri,
 21 Aug 2026 16:23:37 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.60)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 DB1PEPF000509F3.mail.protection.outlook.com (10.167.242.149) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.360.3 via Frontend Transport; Fri, 21 Aug 2026 16:23:37 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Fri, 21 Aug
 2026 18:28:36 +0200
Received: from localhost (10.48.86.251) by STKDAG1NODE2.st.com (10.75.128.133)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Fri, 21 Aug
 2026 18:23:36 +0200
From: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
Date: Fri, 21 Aug 2026 18:23:26 +0200
Subject: [PATCH 15/16] arm64: dts: st: enable usb on stm32mp257f-dk
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260821-ucpd-host-fusb340-v7-2-rfc-v1-15-c5e27cbc0795@foss.st.com>
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
X-MS-TrafficTypeDiagnostic: DB1PEPF000509F3:EE_|PAWPR10MB7368:EE_
X-MS-Office365-Filtering-Correlation-Id: 23341e32-9a82-4115-1d84-08deffa08de8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|7416014|376014|1800799024|36860700016|23010399003|921020|56012099006|10067099003|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	wlptRUwKSAvcoJzOTNhsKzuJRb7YzXPPpRCO8rMcdrMZcrERodYxbE7qE5w4vsG3AIIj/YuEqRmOkN4lT/8309OMxJLGsUcby9Q60j6/zX208GULd1JRVYkXCgc+RuTjQkJPf8CvGgXbPuYq8jV1pg5Sv3xbrmnhtwT/TevPGpcjtDg+KN9fuso4gQOy/Pb73OL3laZ7UyVDkn7LgchpMIpzffKEfm1Ra07j6+ymWla3AFu9eLXHtVu1iVULcY2q7SjpTMX/aiVged44kwoh0JT88YVd6xvYAi63s4s1E4v1fVxaVQl7tRAh0AOX8grcgI08Hx9ZAT5p/utVXRY3PyMZ/9G74Be+C7jAxrAJTLjPP6DQfdlFthbmpV7y9s6DxzNHriHlCSUYj783UoSJ7vcuvI9emXx8yADnQndiqpSJp7aCAC+akUe/KT3Fo5gQhwBWa4/Zxd6MKUjvd+Fv9CBSFrGno2HAjwU7vEFmGVKhH2lfjtULBFTSN2u0D7qzoyPkeWxJzKMruMIj3CdsPpWlG6NrWbi4KpQ2/heReVN3D4Stqh6sFgWGz6e2mDUnELENdN3rUIcgKAud3xEHRuurY1iSBhqixElGs/sFkqxF47sbPhFzKcLN4Q/5m6fLk2G0O0C85ffGpMsA5NWnb3SHoDCyokND0XP97zq+MSUkX7dNlx6pLBGnHe/r31B9veh0/gDPH4h+4Eg+gAuskRY8HWuiL1gJgKrG2VN03fIhF4c3+11n68d1i0yjF2jY
X-Forefront-Antispam-Report:
	CIP:164.130.1.60;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(7416014)(376014)(1800799024)(36860700016)(23010399003)(921020)(56012099006)(10067099003)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	hLC9x9NqP0cTUK+B5/V8Dbj52dPxdm7jptaUnDMvoo3PzVakxj328f1OUnOZQ+bJjyBs46gyYnw2VNWvO+bQyE3YtBoKAvaZasRyNt0NidZJRQd9Nx88UsvrMoknXcG7YLhCFcC0CGbgJYhA1x6eS1m7BxNsve/E9rdUPLAdMAWqxMOWG2w8rBucD+X6g5cXvnvDZeGppBhTTInUINYx5oEchAqmaxe4qDymlsVLt3FbDQBNFVRp6X8M5SMwRmV+46UHzFrUqnKZhzj/eB2RdIXyZwiK/+nFtgzOSeEBiUVeTVb8uqnTqrzIQe5x+RfZwYJMi4rU2uaf6sI6NEO8us35O860KflmVgADOCVJzb8z6g2d701u9lQ4owgxxFvSkNsAGNPy8Y0WO6pov5iQPgEZdR/PcHwaARFW2b1nQ5AWG2irLFMgQAnlgE1FJ6oD
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2026 16:23:37.2619
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 23341e32-9a82-4115-1d84-08deffa08de8
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.60];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB1PEPF000509F3.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR10MB7368

STM32MP257F-DK board uses two USB controllers:
- USB 2.0 High-Speed Host, with external onboard HUB providing two
  connectors.
- USB 3.0 Super-Speed dual role Type-C port

The Type-C port management is done through integrated UCPD controller
and external TCPP03 I2C protection chip on I2C1. FUSB340 SuperSpeed
switch is used to reverse Super-Speed lines, depending on the
orientation.

Signed-off-by: Christian Bruel <christian.bruel@foss.st.com>
Signed-off-by: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
---
 arch/arm64/boot/dts/st/stm32mp257f-dk.dts | 111 ++++++++++++++++++++++++++++++
 1 file changed, 111 insertions(+)

diff --git a/arch/arm64/boot/dts/st/stm32mp257f-dk.dts b/arch/arm64/boot/dts/st/stm32mp257f-dk.dts
index 8daf3dfd5133..fdb21c4c48b9 100644
--- a/arch/arm64/boot/dts/st/stm32mp257f-dk.dts
+++ b/arch/arm64/boot/dts/st/stm32mp257f-dk.dts
@@ -27,6 +27,20 @@ chosen {
 		stdout-path = "serial0:115200n8";
 	};
 
+	fusb340: usb-switch {
+		compatible = "onnn,fusb340";
+		enable-gpios = <&gpioh 2 GPIO_ACTIVE_LOW>;
+		select-gpios = <&gpioh 3 GPIO_ACTIVE_HIGH>;
+		mode-switch;
+		orientation-switch;
+
+		port {
+			fusb340_con_ss: endpoint {
+				remote-endpoint = <&typec_ss>;
+			};
+		};
+	};
+
 	gpio-keys {
 		compatible = "gpio-keys";
 
@@ -138,6 +152,11 @@ &arm_wdt {
 	status = "okay";
 };
 
+&combophy {
+	st,ssc-on;
+	status = "okay";
+};
+
 &ethernet1 {
 	pinctrl-0 = <&eth1_rgmii_pins_b>;
 	pinctrl-1 = <&eth1_rgmii_sleep_pins_b>;
@@ -160,6 +179,28 @@ phy1_eth1: ethernet-phy@1 {
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
+		enable-gpios = <&gpioa 3 GPIO_ACTIVE_HIGH>;
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
 	pinctrl-0 = <&i2c2_pins_b>;
@@ -279,6 +320,44 @@ &sdmmc1 {
 	status = "okay";
 };
 
+&ucpd {
+	vconn-cc1-gpios = <&gpiof 5 GPIO_ACTIVE_HIGH>;
+	vconn-cc2-gpios = <&gpioc 3 GPIO_ACTIVE_HIGH>;
+	vconn-supply = <&scmi_v5v_vconn>;
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
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+				typec_ep: endpoint {
+					remote-endpoint = <&dwc3_ep>;
+				};
+			};
+
+			port@1 {
+				reg = <1>;
+				typec_ss: endpoint {
+					remote-endpoint = <&fusb340_con_ss>;
+				};
+			};
+		};
+	};
+};
+
 &usart2 {
 	pinctrl-names = "default", "idle", "sleep";
 	pinctrl-0 = <&usart2_pins_a>;
@@ -288,3 +367,35 @@ &usart2 {
 	/delete-property/dma-names;
 	status = "okay";
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
+		compatible = "usb424,2422";
+		reg = <1>;
+		vdd-supply = <&scmi_v3v3>;
+	};
+};

-- 
2.43.0


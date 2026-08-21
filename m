Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012018.outbound.protection.outlook.com [52.101.66.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B54784D90AF;
	Fri, 21 Aug 2026 16:23:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787329419; cv=fail; b=J0pkgvDK12oa8u0T1FDMc5PYc/kygNfmQcsOdJgHnBAL7EUYDTexNbqCnqBotbiTSXq+x1tRUzrMiSyLyo/wYSR5Jtl5L0PFv6rkgsQMP/9Ei9wLjrsz99RXXAgWi2KiZ8J2E0hURsGF+yKTVsS08qs81Ivz74IzFMMUV+ATogM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787329419; c=relaxed/simple;
	bh=mTD4g/Zeuunvc8cRIhqipA7es0kWfrsKUOa5gKKNIh8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=mBo5JG5BXyXpdN2rwpIdlZEeUbjCK3752dOzCvuR6r6BIoIWhcBOjJJOKNnf4B2Pa70h1tIWXsEG8NikVCn8/tWLf094kjY4AlXkToLTJo74X1cb9+lUeMPfNJmmGqFY3HkyCe3vsACAjXMRjrffyTV3mEVwL252OFpuOXSLHDg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=jfHu6QLr; arc=fail smtp.client-ip=52.101.66.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="jfHu6QLr"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jtuMxAcgPnoKRWSepnMCy6aBuCOvJH91gDCNYkxV1S3A1Jh3WNRsaE4Wb9mY830KdsKbMmOxwZ3LRp/s+M75EDs3C4PFVWPi2BKWGLqFmFw33wypH++/hbIh4EeHB/my4fqY4mjbpSmyJefbsN0h/ZQYPvc1gmMSzTiJCpsg/muu+OI5B6tMMT1gLwTBCpZhpTx5nfWc+bJNSbpvxBWUWGESzJyGt46/gz5PiGQuvyVGBRGcVWN8Rplw7JodD//zVXFHjEYqOH6i0Xo2mqh+xZHaMVZ94mm2Xeuiw43aEN7Uqy06skD/NoTUxq3qkZVADhh8Jf/HLHirBX8JZp5sLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PjMNO7EktUvxGYtBKqvD7tirdylGJwh6hg7Nw0uiV3A=;
 b=K3rkZ7u5Zv5iuDK8j8GlW1mrtTfi4XCubHftmuS0f5uUje4tfK5De/otHsW3ZxcA4LcIpN2jao4YtKSubmMoZw0Snc4QPgF7iXip2f2BZfdaEBKtifDBi3Nh60k5pQ3rGw9t4Wl8VryZzcej8v3OP2miONyZkTtJiBF92jr2h8GVo5Lox2fhlmMr5V7fUiSMVTmTo2NrudaOGlShqxriqQ+9qUHAe0yV5w2OwVJZQM6PRbnCOI8q11G1mEquIwchaNS+gFpiiUEt2TnSUtRdsmKlawnruyyvrLl1eCBi8DwzfGE1hLGHyzMQZWK9wElPXC6Fak5ekgmomeSsU/02OQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PjMNO7EktUvxGYtBKqvD7tirdylGJwh6hg7Nw0uiV3A=;
 b=jfHu6QLrKrAXN5E8DuC7sKXUbhM/lWwS8ipjFQaP9JYOK6J+tWJNb8Y2ShhTcKff1UZgIPH39w8PFM96D/Yf5Cm/K3MledjetULe7psUBfR56SpryB7Jsg9dgUFnefs5joEnB1CbF2Zo9zsjpfl41Arn9QGKQPLJqTTK/v6XR6GhChaW5D5p93KW4Fp+ySdTQJOy81We9aB4CGCG9GI/1FA/u0msLydeWyzNNWLOCDTQki870lzv84uPyH3djayx9IPFdLa28tekbgPtC+nChi6t9qQke9LAR+/8/OITIgQOmH4FrKsdtPtZgVQyhLfT4IBetwfo7Sz4lzv/iaAcaQ==
Received: from AM9P192CA0020.EURP192.PROD.OUTLOOK.COM (2603:10a6:20b:21d::25)
 by DU0PR10MB7215.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:449::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.17; Fri, 21 Aug
 2026 16:23:31 +0000
Received: from DB1PEPF000509F5.eurprd02.prod.outlook.com
 (2603:10a6:20b:21d:cafe::4f) by AM9P192CA0020.outlook.office365.com
 (2603:10a6:20b:21d::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.339.10 via Frontend Transport; Fri,
 21 Aug 2026 16:23:31 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.60)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 DB1PEPF000509F5.mail.protection.outlook.com (10.167.242.151) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.360.3 via Frontend Transport; Fri, 21 Aug 2026 16:23:31 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Fri, 21 Aug
 2026 18:28:31 +0200
Received: from localhost (10.48.86.251) by STKDAG1NODE2.st.com (10.75.128.133)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Fri, 21 Aug
 2026 18:23:30 +0200
From: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
Date: Fri, 21 Aug 2026 18:23:19 +0200
Subject: [PATCH 08/16] arm64: dts: st: Add ucpd node on stm32mp251
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260821-ucpd-host-fusb340-v7-2-rfc-v1-8-c5e27cbc0795@foss.st.com>
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
	<linux-arm-kernel@lists.infradead.org>, <linux-phy@lists.infradead.org>,
	Thomas Bourgoin <thomas.bourgoin@foss.st.com>
X-Mailer: b4 0.16.0
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB1PEPF000509F5:EE_|DU0PR10MB7215:EE_
X-MS-Office365-Filtering-Correlation-Id: ecddbb8a-899d-419e-a1b3-08deffa08a7a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|376014|7416014|36860700016|23010399003|921020|6133799003|10067099003|56012099006|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	NeHnumGhKI/sTZGQCuyVKxjcPg/q7HsBlnYInV+u9yprPH4mkGpGmNSVV/Xb5c/sL+YU5GJdzB3+OVYEfysCyRngYdiKz/+vXOdmsMbihzR83iJ5nSB3gpAFcqheI/BBJAQTqt4w2AhpJEqhFA7x+5y7wm3byH5Zc0MXpgiSd2MlRp8L8F5QPFZIbopV+KS8AK4z1HuBpFLMhdGNCG70T5af+LHeaPpD+vO0R1JBYSZkVKhTnz2Pi1vi2En9B8V/ih3DzTewtUjxuNI7fEXKi+ytcgsEy/MRTTYBVK5RtYMbVNr+5EBfJgQRGXkNDjzhE35ummxZUZcotnZ7IirVknIPuM6/HoOLihwkd66i10mcf7lsydxi8jKV5/nr5HWMvdLZwBIZleP/MQMQaWusieNE8foADLEIzXkNYWgGv/7961eJ8rF2cgeek6Ht+MhYpNWtMoUNnnetdO3bCmGM4P9T9N8UvYK2FX0beUx7eB10lr4/7tVOJETCj+ZqyjNQgB9UanW0CDoxcunuXqzxjkzGLvVpcUkAVar5Gu46IUi/QCjl03LXL+qtqHLGwHNIC4K93R357m6LFW3Rj48hIfhAiiCih7vijwaxj7rtrvm1t+hA1qm4T9TfSYedzBKFSQdEEw2nTMqPTCDdt2D5N+CoX7jawymmNpCeFFqTmeSgz4cdYa7nvLI/QPvz2VyLQ/OMDdG3NkYhYENlIS7Y6mNxtoS47ivPIjhvjfVc44Zg/8OumUbwKJxV5uRAMSfQ
X-Forefront-Antispam-Report:
	CIP:164.130.1.60;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(7416014)(36860700016)(23010399003)(921020)(6133799003)(10067099003)(56012099006)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	owwSP0kfYwxHEqARu2MRXGG0owlIU8bTlDPHbv3CucvCvKt6/Re0cqFS2ENqbd9K+RJngMT0YHNl8xKzA77vGl3Qx0XZ4apsasJ7VEHOQ/NJ5ipgUtNQSeMcJq9SynziiSwekfnQDgoGLz/R00gW1zuFHUaJ95PgeM0Hbvid3VoEl2y5riZb8ctXMsRrMgRaRsU/tkR09dVdo/3SHXUwlRLmL2q9aTAYzelCVA1k5JH3vEjcobuYR7C6MSSFJSAjtl4jucAinBej58YKwTdvScy1OOwoj2GQSPjzSPTh0SG/CM5gV4hBa0Q/gqUC707coSCxtWf9edjJiMvPCSNFE6WdZ9N/VqsZ/Iw/9Uu2Cq+poN7WUAdqpZeSDRdm96sZGSC01poXNsHz/YFuiURv6KVx0RAiBzALTRhnG5Q2WBY4ce4NzpMGVMovCeeoHFED
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2026 16:23:31.5158
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ecddbb8a-899d-419e-a1b3-08deffa08a7a
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.60];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB1PEPF000509F5.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR10MB7215

Describe UCPD bindings and nvmem cells to access trim values.
This provides the PD and CC USB-C cable signaling functions.

Co-developed-by: Christian Bruel <christian.bruel@foss.st.com>
Signed-off-by: Christian Bruel <christian.bruel@foss.st.com>
Co-developed-by: Thomas Bourgoin <thomas.bourgoin@foss.st.com>
Signed-off-by: Thomas Bourgoin <thomas.bourgoin@foss.st.com>
Signed-off-by: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
---
 arch/arm64/boot/dts/st/stm32mp251.dtsi | 51 ++++++++++++++++++++++++++++++++++
 1 file changed, 51 insertions(+)

diff --git a/arch/arm64/boot/dts/st/stm32mp251.dtsi b/arch/arm64/boot/dts/st/stm32mp251.dtsi
index 9dc7a05fce99..be54dd56713b 100644
--- a/arch/arm64/boot/dts/st/stm32mp251.dtsi
+++ b/arch/arm64/boot/dts/st/stm32mp251.dtsi
@@ -1637,6 +1637,27 @@ dcmipp: dcmipp@48030000 {
 				status = "disabled";
 			};
 
+			ucpd: typec@480a0000 {
+				compatible = "st,stm32mp25-ucpd";
+				reg = <0x480a0000 0x400>;
+				interrupts-extended = <&exti1 46 IRQ_TYPE_LEVEL_HIGH>;
+				interrupt-names = "ucpd";
+				clocks = <&rcc CK_BUS_USBTC>, <&rcc CK_KER_USBTC>;
+				clock-names = "apb", "ker";
+				resets = <&rcc USBTC_R>;
+				reset-names = "ucpd";
+				nvmem-cells = <&ucpd_trim_rd_cc1 &ucpd_trim_rd_cc2
+					       &ucpd_trim_3a_cc1 &ucpd_trim_3a_cc2
+					       &ucpd_trim_1a5_cc1 &ucpd_trim_1a5_cc2>;
+				nvmem-cell-names = "trim_rd_cc1", "trim_rd_cc2",
+						   "trim_3a_cc1", "trim_3a_cc2",
+						   "trim_1a5_cc1", "trim_1a5_cc2";
+				ucpd-supply = <&scmi_vdd33ucpd>;
+				access-controllers = <&rifsc 69>;
+				power-domains = <&CLUSTER_PD>;
+				status = "disabled";
+			};
+
 			combophy: phy@480c0000 {
 				compatible = "st,stm32mp25-combophy";
 				reg = <0x480c0000 0x1000>;
@@ -1818,10 +1839,40 @@ part-number-otp@24 {
 				reg = <0x24 0x4>;
 			};
 
+			ucpd_trim_3a_cc1: trim_3a_cc1@1bd,1 {
+				reg = <0x1bd 0x1>;
+				bits = <1 4>;
+			};
+
+			ucpd_trim_3a_cc2: trim_3a_cc2@1bf,1 {
+				reg = <0x1bf 0x1>;
+				bits = <1 4>;
+			};
+
 			package-otp@1e8 {
 				reg = <0x1e8 0x1>;
 				bits = <0 3>;
 			};
+
+			ucpd_trim_rd_cc1: trim_rd_cc1@1e8,4 {
+				reg = <0x1e8 0x1>;
+				bits = <4 4>;
+			};
+
+			ucpd_trim_1a5_cc1: trim_1a5_cc1@1e9,0 {
+				reg = <0x1e9 0x1>;
+				bits = <0 4>;
+			};
+
+			ucpd_trim_rd_cc2: trim_rd_cc2@1e9,4 {
+				reg = <0x1e9 0x1>;
+				bits = <4 4>;
+			};
+
+			ucpd_trim_1a5_cc2: trim_1a5_cc2@1ea,0 {
+				reg = <0x1ea 0x1>;
+				bits = <0 4>;
+			};
 		};
 
 		hdp: pinctrl@44090000 {

-- 
2.43.0


Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013051.outbound.protection.outlook.com [52.101.83.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFDC04DA526;
	Fri, 21 Aug 2026 16:23:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787329421; cv=fail; b=dsjFXgmQXp/b2KcgHaZ9MBzPfar6dErJXRVZ/UR8nXEa9GwGud5Io9w9fnwpLEPnBKugtOBtfltjvlAmhR1DDBI/WJ//wuq0HfYVLqoxu4G5/UqNkPnAk7xkFFQhft3E33+Z5nLmhhEPfQxS3PBBeq16c4LOix1w38IxPH/UqN4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787329421; c=relaxed/simple;
	bh=/E0+UroYiw6JxJnLiyfdl7cyn3xEZkbUbBpPibPfWFA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=P6HpjXyHFkQB/GGgD/o92b0pxIwXQ0CMBWlxFaPS4PCR2XfvSOPmocC5T9ceG48vfzhoFkO6SDDC9HtBMSS+cmb0r3wenxpuC/7S4SqolDoJwTeL6lpJfq51yuUjVbEhOpkabzdHkWEx7KFN42GZvX2iPBPrGRPHUjwTl/z9VDo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=eyKIifRm; arc=fail smtp.client-ip=52.101.83.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="eyKIifRm"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Zcf1YP3Nl/JpkaXa9s/lXG1/RDCmI9MwwpFF6vaYb2ZE2iTxbatqz6rImdE8wmI0q/JbQBFtzexVmDTsD9tFhLAm/VsJrCpc4RyImg8qZp2xWSqZDvtppQbRJ5RkISgTRjvdfV/zimmLzwlIyWVX0utVWJeg0DORhy9st9U7K7SlfzhbzCCkkZvML2KR0pWOrrVc5cKggq9N40ncy8jjhYuOB++4vo8JuZG3rEVjjLtinQThjHvJzNq1t8euKtnU8S0rVMLC5Mra6AE3QuKE/CiN7LAHaFktJfoS86g1iBP929p9a1WV2xfxspqjSI8Jueah1H3sz/5WEdfds7NJMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7RWcDdkNBu6aL19Rf6Bam6cHci+5r68YmL6/KrCap4A=;
 b=XUFSSfuUNNL/ra0xTXj51pobARYh34AwbT9/rsHeXdur8LfGvhvB5ed9CAIJLwyIpE9ODgMkS/c8HzVfEQykuwzWxUFulcefJolgaAJ5D5yp1jfn2HehuDqNRM9lifOruix7hiSjI10OLLGt2NNLSsmPz3mOLBlYs8+KTGuLATF+sBrRyjeQSZHwrA+duzm5RQaJxIc4DvPsevuRImUXKDBMYfq+7U0w/O1OKlcgH0RJZpxOGjV5cFS2MnWp+MJrXXUv+DE4M+zXFwrVWZAvOkeMFdW7GsUgZC4jlXChLv0/dz4e0D4Hob+ltGgTkh2IZ1GYZviFaq0lNzqLQPfiKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7RWcDdkNBu6aL19Rf6Bam6cHci+5r68YmL6/KrCap4A=;
 b=eyKIifRm1EYC1UlQFgFytU6GfH+XeexRrH7OR8HRfndBhpkqfFzLmQVtwI1v22i/QAOZUY+WiljtrrXEBGHDkCKpXmN/SNT/tRTClofOuuynGXxcRXU2uMCNNz1N3lQgDiacCGhbmfYah5jPldceV8RlVPrP5YY3SPASDsex01gbD7iuqkVzqoePk9FnIhdQ3yY++6OBapIuX9vKBhHdMarTYLSJwJSxjZFJ7DFei3rBWDk4igbc+Qn5x7qs7fFQc9geY1Y5N6kqSUpb6hafxMi95IKfLCWCuDRTi9sd73zhpVRKhBQ5gX3XCEZhY4KsYAPcaDy0w491leyOlvddtw==
Received: from AS4P250CA0007.EURP250.PROD.OUTLOOK.COM (2603:10a6:20b:5df::11)
 by VI0PR10MB8668.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:800:232::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.11; Fri, 21 Aug
 2026 16:23:32 +0000
Received: from AMS0EPF00000190.eurprd05.prod.outlook.com
 (2603:10a6:20b:5df:cafe::31) by AS4P250CA0007.outlook.office365.com
 (2603:10a6:20b:5df::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.339.11 via Frontend Transport; Fri,
 21 Aug 2026 16:23:32 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.59)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 AMS0EPF00000190.mail.protection.outlook.com (10.167.16.213) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.360.3 via Frontend Transport; Fri, 21 Aug 2026 16:23:32 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Fri, 21 Aug
 2026 18:29:07 +0200
Received: from localhost (10.48.86.251) by STKDAG1NODE2.st.com (10.75.128.133)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Fri, 21 Aug
 2026 18:23:31 +0200
From: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
Date: Fri, 21 Aug 2026 18:23:20 +0200
Subject: [PATCH 09/16] arm64: dts: st: add i2c1 pinctrl entries for
 stm32mp25
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260821-ucpd-host-fusb340-v7-2-rfc-v1-9-c5e27cbc0795@foss.st.com>
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
X-MS-TrafficTypeDiagnostic: AMS0EPF00000190:EE_|VI0PR10MB8668:EE_
X-MS-Office365-Filtering-Correlation-Id: 8aa92479-6165-40df-c0a4-08deffa08ad3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|82310400026|36860700016|376014|7416014|11063799006|56012099006|10067099003|18002099003|22082099003|921020;
X-Microsoft-Antispam-Message-Info:
	tmwzAYaCeTxp9g3ath4jyYrkh4IYDPdur5wtI12Cno9OpjZYXyeDJgWiLecOc++W2tA1fPdqlDCNdKoIpJ5pzlsEBrR5QMBLAB09esgtLIBPYJ22rtrFVTkBWbOMPfnDTCyO4z12XnaqeqXVIR/RGEeR+HZuPgx6dyscF8oegDHj7ABcH/LyhyCJagBqQDMGGcE4l0FobaFDIGDMXvyIlWVwsOR2ejlf/hS8wetNI4MGg73bR0iLuNB834wrivHVHeCQWFgCkqXWIzgMbzGt/byt+V8aCZ6iGeYYLOgfVZ6+7GbqDSkxqM4WoIEIEfn4aJebU5X0P9nHnOZ78MRFrlQZqcVIs2on8Y1LTlRRPc+uezWuAaPL3NWIMQsPbHnI73SQWo+V3QSKlT76wQAZQB9JxLZqsWhZzA/oypJSlBr3XNajl79A97xysFLAm+LXrj5Pa5TCBR0mps/sW6wyP1bcGzD+iaPQB9GxsevJvSFDWASwGGe0Hu3L05P5YhBw8pqz7s415L8T5DEG09wlO0oTUi4yipL3If7U14lRbHyI7OomNfmwdG3MydhBGdkdqkG/fpCGXQKcNqSE72dbn6dsoQ6YEd55JoTMpc3GfeEPh7tCzOEOGYtK0NXDRPnRPO8nRKWn983HHGXeQQI8GwTQW2aP24GEwe3BZ1iBX1tdRV1cPhCAws7Y68cJL2g9Z5Qcc2U2/je0R74qvkLhWloX5rASpnMOfd4YRqE4DwoyRf/TbbAJLUGRl/g1wbJg
X-Forefront-Antispam-Report:
	CIP:164.130.1.59;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(82310400026)(36860700016)(376014)(7416014)(11063799006)(56012099006)(10067099003)(18002099003)(22082099003)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	WjA7qiuRAh+n1cz3RM6CooyYl4aeSt5TXn8awctxNzDXzvK3QNlvCI9+sGmF9Wacv8EN92CueMQrdADFVAe1t1Uw1L3lQM4yWcl0CnQPhZXtA1a2Vk6rxJkW/OK5XGALJmUsqWnM1fYf4zw9CTpUWhUIQ6SWUMsa4NwJLV4Df39UcF+bLdKjYPQOWZemnTUjJZ4k5tEsaMTMr05xfWaxXjNKM2zZxhOn6hfe2S7hQfOKJY4Xx6D8egIx87NHE1NwDzFZgyHgvgBZP6JSgvuX3rs0PLSR9+MFUSXt1u4O6VhVfQjODFr8V5gEKD2oZ+3ZkRCL+8KGhOzKl1mtlRN9hMUWVuPinY9q3OYT5XlNOVQoluGfqtbGUTrOefXDQ1f6xWOifT4IXyBODpa30ow9rN8NiriB4iLlbUzPCv8uZFNor+cmqX5SkIefIYr5xyE9
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2026 16:23:32.1016
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8aa92479-6165-40df-c0a4-08deffa08ad3
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.59];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS0EPF00000190.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR10MB8668

From: Christian Bruel <christian.bruel@foss.st.com>

Add pinctrl entries related to TCPP03 I2C in stm32mp25-pinctrl.dtsi

Signed-off-by: Christian Bruel <christian.bruel@foss.st.com>
Signed-off-by: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
---
 arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi b/arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi
index 456ece7f8ebc..f97ce299d6aa 100644
--- a/arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi
+++ b/arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi
@@ -203,6 +203,25 @@ pins {
 		};
 	};
 
+	/omit-if-no-ref/
+	i2c1_pins_a: i2c1-0 {
+		pins {
+			pinmux = <STM32_PINMUX('G', 13, AF9)>, /* I2C1_SCL */
+				 <STM32_PINMUX('I', 1, AF9)>; /* I2C1_SDA */
+			bias-disable;
+			drive-open-drain;
+			slew-rate = <0>;
+		};
+	};
+
+	/omit-if-no-ref/
+	i2c1_sleep_pins_a: i2c1-sleep-0 {
+		pins {
+			pinmux = <STM32_PINMUX('G', 13, ANALOG)>, /* I2C1_SCL */
+				 <STM32_PINMUX('I', 1, ANALOG)>; /* I2C1_SDA */
+		};
+	};
+
 	/omit-if-no-ref/
 	i2c2_pins_a: i2c2-0 {
 		pins {

-- 
2.43.0


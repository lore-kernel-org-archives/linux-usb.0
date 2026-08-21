Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010003.outbound.protection.outlook.com [52.101.84.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9DF14D8DBF;
	Fri, 21 Aug 2026 16:23:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.3
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787329416; cv=fail; b=OA3mheQ2wYdmgNyuYvr/OIAvedXIOeD/g+iyrvtO1SBdM96fp5OGOFNQlwuV56BjFXKjgUZQ+Hz52njGpNE0uuAtuKwV4VD+GZHFP0V/NtfXZ4cZQ+NO8+6qimoSurr92mOr42MhGaiRSLIYGoSRsh+ZHrBFvp5PfPaN9bQn+HY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787329416; c=relaxed/simple;
	bh=OefkLFegZdmJBSUs4K8UfD9eZ7CNoSRb1btkt5Lv0EU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=HvIdsB+qWJhzIXqv2c2J5dKfuSwzNl8isj37RoGWA2m+Ph9m5AZMASb07McUHTKVVbHLzESrOUKsOztzdbTA6ndJMqq/j14zpHUN0pPwyW4fWyg4/k65+qrCrr+7NXR+PPgmKq3RNoybgHB9SZ3olYqMisLKezQoYLf29VZz16I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=lnOrqxn5; arc=fail smtp.client-ip=52.101.84.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="lnOrqxn5"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rxY1IhDCapHQjmrs8GmUWWkYXuo+15K1s8VXFunCRydoFmuOv3Zjdny8hNw9oK0JrdX3d7T9TZlwRM26d2Q3Ze+1Lg9RAWUWYGFK7HhQnZC3J493qq6OvWkjPhUU3tTECgyNOXlvz58cu2QZEO87uE87BAUlyGqtAtdTSw2C5IUFXexbDk0gBwaS99gisu6LhyB2SfybJcWev6N82+c0dA8UdckGofgruviHBVlZ2e3JsQumgv9WkZ0/NcgoZKDnOyNbrfZxWoZfFu8NUfQ0dh9Yra1Z8Dm+yGlZL41471PzsemHu9qusjtlrxTDbpdws7g0rRrY73xM/vLgy0JmVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4n2WO+OmiGTPpbURTDlLMo61fM4nwTSSJxwEpkn99Zc=;
 b=wrlWM3eDrJSa1+5VoKVu/ii965psKblap+4eMUVM3eXCbNP2O68V6Vpt8srRzPfaRSQP2TJ4AtE/U04AYstQV0I5hDK3YDxB62tswyPxPnBQ0NUHZF+Bp03oHNakXx+u4h0/46HpL3/pI6/T79H2XoqUaRXcgkggkuI8k5rmigIoIa6JsyvsYi2wznAjqkJkPsBJsb5j39yb7LZ/q5iFZcQYvmjMH7t4Nlp1ARU1K1hMAUOofqvZgdUUHc5Prb+18IWGaRcELn9e2BySYYufyTlEoZxghOmWxORIcslUzB9Q5wwwF+hNe9jTNLlfHDNN0HDuzG5/ARtHHWp2PCuLBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4n2WO+OmiGTPpbURTDlLMo61fM4nwTSSJxwEpkn99Zc=;
 b=lnOrqxn5lXy+kxe9BTBCX3l6tooor5lDQ4UwSf7TQmNTJ3ouHUTZ/N29G5PckcH0uKSsFKd3c0h8FEvU1SYPh1QteVLjVj4VuajJfZ/ESurTSWQUOkxkFz3eeb6PuiSBVZ1gitpbuxa2VNl7KAGs3ibmK2M7nfIEUF+11HnV2hZPvdMcUhHH82AmnJ+zr1uJbbTvZk4mAjknvhPTxwaZ8sgfaurMvRQOHUZmAVOXRSI5tkSP9PmdvHDy1BdToKk5Dqy4zqzgsKht7i3jG+MoE/cPN11k+56LsrwTulWMkmrfEPkZbvDKzE2gGAndVE6tMEV7hxGAid/c1fPRoHm3Fg==
Received: from AS4P189CA0038.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:5dd::10)
 by DB8PR10MB3813.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:169::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.10; Fri, 21 Aug
 2026 16:23:28 +0000
Received: from AMS0EPF00000192.eurprd05.prod.outlook.com
 (2603:10a6:20b:5dd:cafe::1d) by AS4P189CA0038.outlook.office365.com
 (2603:10a6:20b:5dd::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.339.11 via Frontend Transport; Fri,
 21 Aug 2026 16:23:28 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.59)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 AMS0EPF00000192.mail.protection.outlook.com (10.167.16.218) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.360.3 via Frontend Transport; Fri, 21 Aug 2026 16:23:27 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Fri, 21 Aug
 2026 18:29:03 +0200
Received: from localhost (10.48.86.251) by STKDAG1NODE2.st.com (10.75.128.133)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Fri, 21 Aug
 2026 18:23:26 +0200
From: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
Date: Fri, 21 Aug 2026 18:23:14 +0200
Subject: [PATCH 03/16] dt-bindings: usb: st,stm32-ucpd: Document STM32 UCPD
 controller
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260821-ucpd-host-fusb340-v7-2-rfc-v1-3-c5e27cbc0795@foss.st.com>
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
X-MS-TrafficTypeDiagnostic: AMS0EPF00000192:EE_|DB8PR10MB3813:EE_
X-MS-Office365-Filtering-Correlation-Id: 7251fab6-c7a8-4bc5-11ab-08deffa08837
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|7416014|36860700016|82310400026|1800799024|10067099003|56012099006|11063799006|3023799007|18002099003|22082099003|13003099007|921020;
X-Microsoft-Antispam-Message-Info:
	X2cyMarq31fraXiPTFsTGxt8Hacime0izmnP8wF3+ts2UQUvUTahJB3wZzDuMBuP628e61W1KnWuci9AM3O/mOxRr+5d47Eh8+poZW9oboGfAEAd6PooWzbg05dhm8F6QbrdP02/fumD9f6qedV9G3Pko86UvE10g+NgyV4FbAFby4127XWisTPGKtMTCoSLAzOtOJ9RUZ7FnKrLn3a0fbKGcWIb6pkc56YmGxRjiLoS4HI8dXcf2IoSfc95bePWLQojBWJbYP7HvqxKn5TKyZqqxjm5XxQYuiYBQOQGZNyyoXq0XILPtDEL0idpJM+BHD+qqLgrjeNzdCFsljsBLZetbnww42kvgrRGGcPZZB1Q5aMTyfCNri4nJLAHciGWxHGeWOM0QYeTvwBcUCjoVIQEcF3Zn3d7ACQl0b7K5eu59w5albCZZJuBz05krG7v16tqbdHJlyrg1LYDFdFyjBnWqEZcrAw//5sHtfV5lKaNAceI2qHTJNCpCPYaQn1w0e0SvTJddq8g82zvxdZT4lob5R+kJihkAQagG3wzGy6xm6GOgt7YP4/nZVlvXX1gMsuDctJECX76Yo+IOJn7/hUyPFviM0Y4SZXjB9hDJ4o2BiRItJx6IFbtCdcWCAYQcutN6Cr81BE/HnPNBjQKr9Gov/UD0lWnR92dk4D/eRuVjwh0ABVqRxYQIahST9y8
X-Forefront-Antispam-Report:
	CIP:164.130.1.59;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(23010399003)(7416014)(36860700016)(82310400026)(1800799024)(10067099003)(56012099006)(11063799006)(3023799007)(18002099003)(22082099003)(13003099007)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	oqxDwLKNGna4lnBuqWjOCP6mrUZ/dGwg1eTZTej62x9KjHGWZZHimZC9o92mirYpLmm8KEww9qyQkLFElthAx23iFzLquO77sAd59uBZEkV6matUBE/bIYuQqAm6bmrrveUUXj6wM9Z53V8jZ7AxegbxHitLXis+zWjLeApkF/qMOMxgxceKQe9DZpzw+dKaoaaSxHR7IAVyUcN6Fe0elgVrjH6S9A3SfELNz4j/1y5+KIBq0ydMdh9j9DSyr489g0c7DFAo7h+b+bl8ncfcHudHIavuj5ZraRmCuEpc+smnHbulEwZhOimxppdcVjbt20Q1CFNbXGLodQ3dNretWTJ4jNuj+i4GmpT2+6vOnowGpQkgSRZrq6OP5dh1SwUQuJ/sZavJRyew29mSA5LUaktkXYorfenlguiOpYi45BRrjBJ62VjDBCvLHB+M9s3d
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2026 16:23:27.7494
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7251fab6-c7a8-4bc5-11ab-08deffa08837
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.59];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS0EPF00000192.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR10MB3813

From: Christian Bruel <christian.bruel@foss.st.com>

Add support for the UCPD controller found in STM32MP25 platforms.

Document the compatible "st,stm32-ucpd". This controller handles
USB Type-C CC line management and USB PD.

VBUS monitoring relies on external TCPP03 companion chip

Signed-off-by: Christian Bruel <christian.bruel@foss.st.com>
Signed-off-by: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
---
 .../devicetree/bindings/usb/st,stm32-ucpd.yaml     | 134 +++++++++++++++++++++
 1 file changed, 134 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/st,stm32-ucpd.yaml b/Documentation/devicetree/bindings/usb/st,stm32-ucpd.yaml
new file mode 100644
index 000000000000..d9b8253654a7
--- /dev/null
+++ b/Documentation/devicetree/bindings/usb/st,stm32-ucpd.yaml
@@ -0,0 +1,134 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/usb/st,stm32-ucpd.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: STM32 UCPD (USB Type-C and Power Delivery)
+
+maintainers:
+  - Christian Bruel <christian.bruel@foss.st.com>
+  - Fabrice Gasnier <fabrice.gasnier@foss.st.com>
+
+description:
+  STMicroelectronics USB Type-C and Power Delivery Port Controller
+
+properties:
+  compatible:
+    const: st,stm32mp25-ucpd
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  interrupt-names:
+    const: ucpd
+
+  clocks:
+    items:
+      - description: APB Bus clock
+      - description: RCC kernel clock
+
+  clock-names:
+    items:
+      - const: apb
+      - const: ker
+
+  resets:
+    maxItems: 1
+
+  reset-names:
+    const: ucpd
+
+  nvmem-cells:
+    maxItems: 6
+    description: Phandles to the trim values provided by otp
+
+  nvmem-cell-names:
+    maxItems: 6
+
+  st,tcpp:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description:
+      phandle to Type-C Port Protection companion chip.
+      Refer to ./st,tcpp.yaml
+
+  access-controllers:
+    maxItems: 1
+
+  power-domains:
+    maxItems: 1
+
+  ucpd-supply:
+    description: phandle to the UCPD regulator supply.
+
+  vconn-cc1-gpios:
+    description: Vconn on CC1 gate enable GPIO.
+
+  vconn-cc2-gpios:
+    description: Vconn on CC2 gate enable GPIO.
+
+  vconn-supply:
+    description: phandle to the regulator supplying Vconn gates.
+
+  connector:
+    type: object
+    $ref: ../connector/usb-connector.yaml#
+    unevaluatedProperties: false
+    description: USB Type-C connector properties.
+
+required:
+  - clocks
+  - clock-names
+  - compatible
+  - connector
+  - interrupts
+  - interrupt-names
+  - resets
+  - reset-names
+  - reg
+  - st,tcpp
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/st,stm32mp25-rcc.h>
+    #include <dt-bindings/gpio/gpio.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/reset/st,stm32mp25-rcc.h>
+
+    typec@480a0000 {
+        compatible = "st,stm32mp25-ucpd";
+        reg = <0x480a0000 0x400>;
+        interrupts-extended = <&exti1 46 IRQ_TYPE_LEVEL_HIGH>;
+        interrupt-names = "ucpd";
+        clocks = <&rcc CK_BUS_USBTC>, <&rcc CK_KER_USBTC>;
+        clock-names = "apb", "ker";
+        resets = <&rcc USBTC_R>;
+        reset-names = "ucpd";
+        access-controllers = <&rifsc 69>;
+        power-domains = <&d1_pd>;
+        ucpd-supply = <&scmi_vdd33ucpd>;
+        vconn-cc1-gpios = <&gpiof 5 GPIO_ACTIVE_HIGH>;
+        vconn-cc2-gpios = <&gpioc 3 GPIO_ACTIVE_HIGH>;
+        vconn-supply = <&vconn>;
+        st,tcpp = <&tcpp03>;
+
+        connector {
+            compatible = "usb-c-connector";
+            label = "USB-C";
+            power-role = "dual";
+            try-power-role = "sink";
+            data-role = "dual";
+            typec-power-opmode = "default";
+            pd-disable;
+            port {
+                endpoint {
+                    remote-endpoint = <&dwc3_ep>;
+                };
+            };
+        };
+    };

-- 
2.43.0


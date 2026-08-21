Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013043.outbound.protection.outlook.com [40.107.162.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2F804A33E6;
	Fri, 21 Aug 2026 16:23:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787329416; cv=fail; b=C74qWDoZnhagn5ZUDoXrP9QFxcgYDof8LhCRXYRS+aeVQSvggGdBdNAhUgosTbZKP7PV7abBTJDaX2QpzgYUWfuMoe2jXqhtgbS3YP8P2JpMsmV7Q3b4st3yE9PxM303JXY6ZYVRz7Q/IAA/wYfvCxg22zrQEYXk7MfLVzBP1UI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787329416; c=relaxed/simple;
	bh=YHzSQzP55bIOsS1skaLg7fSSP2j33hJV8WQitj/awdI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=XCrnpFG+JD7ADQ551UhULSZEPpxUJDKMUu59qxtbMr4VAIhZRm2fXL8bUPYhYGdtiA+dIpJrrsZEWlbMAJ9uFNih8SYGTJedjWPfnbi+PZm9rZppO4CDkXrBfaPGbBur82nSMkb7TdhTooXJkUdapjfisoZnpNlsj51reb0kYEQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=nEfhUi9C; arc=fail smtp.client-ip=40.107.162.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="nEfhUi9C"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nWyDRiAtbvgqT4mDvjMVD3rvUK41gL9CG130L1mpLb7Fpoc4Azb30VaGwm2SR8PJauSGP4Cxibxenfr35RGsAD5E6u+D9VA7kuNS3MhG+T4hRGS7XvJ1dhCi1HHH3SPKpXcoguW/Q/xPwwGnWeXhJ1Bxen9tIxvGtbbvgZehwJmuW9a0En3ersJyFclEzAg/1fcChpEEZrBtD9BUNxOwx/1aDYVqQkxchIjrFa+2jn+TFU+eNcq0P6vhnY84GvPoRsIt/VabNw4LMcBDg1OLI5HQjlIsoNZ5BWyCpsgIKxGsPHiEenU9p3qXBtw7NVz6LJT9qAzZ5mH4tQO4/o/94g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FjzGhaNgi/XVKHfD75F04MwKQn0HIDsMA3K+USqyY30=;
 b=taGEGEnES53eNqI5z0g4LM4PxM95DBq68wjIHfMJpil3oIjnpp64FSubwLNObWXGJt5jQNl8E1/suEeCtZmkoi/z3cN+9eE2bsc966JMup1+ilXTqL9ETvdnLRpR24yDJepbtYazLLkP7r+jcLFEo/QcJF2vQGmDM68Sarz2IVDngCvSus2UAuMnaCeII94Vn1NkelkAoIwuX7YjbgyK9SJregrBYHcVlBjPq8QYyRjq6BQI/QGdsvRmsjaJMGp4MhVOshVOVXsrArSvZsttV1uNe9mU3WjZvqQJQrMVG3O0wB3RIgdmlDjcp6EPOcH/ze6MNADN0jQoyvapO7BgpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FjzGhaNgi/XVKHfD75F04MwKQn0HIDsMA3K+USqyY30=;
 b=nEfhUi9CLxY8ZfZ7V18TjT1mDt5xJopJQlUz4/QZ3friOACD8g3MtavZNcwkw8lHMKeYLiz04eGY5n66zWab50KyX0KhSU++L+ZjfqM/LrmfFUK6hon1WdhwVrDRaZbDnWLE9ErOb/MI0+Mdrq78nhaV70mvh/3pqP/fXbiKP4ZYbuQ+fUGH2ZgGbMPEtPh+hV71XEBmDEgBnv2c/1TfvPBaYTuZ44TkVE8GP/bwA92gp0qQiEVLddu+Wh+j68b9MeciKDzQL1ls9+PsTX+q6OeD5ZzwQ3P5rVrzMFuKj2iXRCxpU9WUAGwOKwkid9BSmz/n5DPIk0U4a1/xO06lJw==
Received: from AS4P190CA0017.EURP190.PROD.OUTLOOK.COM (2603:10a6:20b:5d0::7)
 by PA4PR10MB5539.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:260::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.10; Fri, 21 Aug
 2026 16:23:29 +0000
Received: from AMS0EPF00000197.eurprd05.prod.outlook.com
 (2603:10a6:20b:5d0:cafe::8) by AS4P190CA0017.outlook.office365.com
 (2603:10a6:20b:5d0::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.339.11 via Frontend Transport; Fri,
 21 Aug 2026 16:23:29 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.59)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 AMS0EPF00000197.mail.protection.outlook.com (10.167.16.219) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.360.3 via Frontend Transport; Fri, 21 Aug 2026 16:23:29 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Fri, 21 Aug
 2026 18:29:04 +0200
Received: from localhost (10.48.86.251) by STKDAG1NODE2.st.com (10.75.128.133)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Fri, 21 Aug
 2026 18:23:28 +0200
From: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
Date: Fri, 21 Aug 2026 18:23:16 +0200
Subject: [PATCH 05/16] dt-bindings: usb: add FUSB340 switch binding
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260821-ucpd-host-fusb340-v7-2-rfc-v1-5-c5e27cbc0795@foss.st.com>
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
X-MS-TrafficTypeDiagnostic: AMS0EPF00000197:EE_|PA4PR10MB5539:EE_
X-MS-Office365-Filtering-Correlation-Id: f2762d91-5921-4894-6eed-08deffa08918
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|36860700016|23010399003|1800799024|82310400026|56012099006|3023799007|10067099003|11063799006|18002099003|22082099003|921020|13003099007;
X-Microsoft-Antispam-Message-Info:
	U/AxqyMmI6cL5PgQTo9MUDEticBAJrG0AWX1GpsMGjdOEAp5bXdEmrmULarwqbkFbTZmYlRvi2IL2gAzvmkPH6D/FPGqA0f1ksMsLxRP0smBsP/4n1NcwRo8s/HoXZNxHBQPCAYv70PPTo4Zyy7noydzxzr9ROp0gWMGCl4GAf2L6YN65owYV7ZeO2U6YpBsWqFgvE1ezsx9vgDTaw4dgECQS2XwcO1P3cG1MRQAqfBHGjjUBoLiK2WW4o21Qu6x2nkY9EEyu0gercPl2ETpvbjpibVCjuOPEk4Q+7nItiYhGaM/7fUgElUr4Y8L744zBWV3TKgZ/WvW0K1/KcYdGIehFdRXrYRE4ZYave5agc1xNa7eRkTmp3Af3oVv+GhgzSW69R0QqtZX8zNyafJpgn7Oq52VdNMfkVmZxqY5pwskiHeFPXvU6ijIekyLU9kpRq4i9vitgbg1PYb7Os0Kg0ijqtA/cIBtBwZJ49YfeiCnKp8gxT7qctpFYGxgJOFwfnZTK7fq2k3ZAUY3oGAeXDNecFFJh2mWiS027balkjVCQvmknKSHHxBqTR5di7PBjt744n+0wusld79bXzpvI+Bh8Rdcrows7K5SFxvBMVBlk88VlfDwLWxpK8U3XAKxU3F81HPBfqOkWxKWEVPlneJIiCVnv1FatcOv/mmi1A3rLS/yhqItUBP5EHaZshuH
X-Forefront-Antispam-Report:
	CIP:164.130.1.59;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(7416014)(36860700016)(23010399003)(1800799024)(82310400026)(56012099006)(3023799007)(10067099003)(11063799006)(18002099003)(22082099003)(921020)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	7JJhSqdzhEoc+oOCv9MlSGBF7lAa6buVG/OGyFK2MUvToEYt1NXMB3dKBlxF7p3/uxluovgvJouQeRz5v3osnEQH3k6WWG3/rn5JEcXkXlXUPVD7P5+A7757TkYCfHicti22VH0RCTBqroygljv+NYY+J7PWakM8dmzXN2HLuCh6eUOLApMJ3sQgOK4OFnO6nC8n8WaYSdRrdjhUi8ZVPZSUg3OyEuIq8HeT/YA70ydiyPIdq83RIBnEwY3tRo/qxiLvI0OZeRFlVpaACnzHB1nMRrvoDVoFQmNcEuT3BCKoT6cIBVA5VH3Bghxtee1WFPTG/UOt/i0KVVWU+wdFpzT1hn4kJlH1xaWEZ2mo++yK9uWz7SmnYhqJwMn38lIY3B3LQ/gRBlnN8S4khgxN8Hjqgw2TE9UB4fSw8i5O1B4/Egy0JoLO8Byf1mil2F/u
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2026 16:23:29.2238
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f2762d91-5921-4894-6eed-08deffa08918
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.59];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS0EPF00000197.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR10MB5539

Document the ON Semiconductor FUSB340 SuperSpeed switch as a USB switch
binding with enable-gpios and select-gpios controls. The switch can be used
in Type-C applications where a reversible cable requires a switch.

Assisted-by: GitHub-Copilot:GPT-5.4-mini
Signed-off-by: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
---
 .../devicetree/bindings/usb/onnn,fusb340.yaml      | 73 ++++++++++++++++++++++
 1 file changed, 73 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/onnn,fusb340.yaml b/Documentation/devicetree/bindings/usb/onnn,fusb340.yaml
new file mode 100644
index 000000000000..b1991bd465ad
--- /dev/null
+++ b/Documentation/devicetree/bindings/usb/onnn,fusb340.yaml
@@ -0,0 +1,73 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/usb/onnn,fusb340.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: ON Semiconductor FUSB340 SuperSpeed switch
+
+maintainers:
+  - Fabrice Gasnier <fabrice.gasnier@foss.st.com>
+
+description:
+  The FUSB340 is a 2:1 USB 3.1 SuperSpeed data switch with enable and select
+  GPIO control signals. The switch can be used in Type-C applications where a
+  reversible cable requires a switch.
+
+properties:
+  compatible:
+    const: onnn,fusb340
+
+  enable-gpios:
+    description: Switch enable GPIO
+
+  select-gpios:
+    description: Switch path select GPIO
+
+  mode-switch: true
+  orientation-switch: true
+
+required:
+  - compatible
+  - enable-gpios
+  - select-gpios
+  - mode-switch
+  - orientation-switch
+
+allOf:
+  - $ref: usb-switch.yaml#
+  - $ref: usb-switch-ports.yaml#
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+
+    usb-switch {
+        compatible = "onnn,fusb340";
+        enable-gpios = <&gpioh 2 GPIO_ACTIVE_LOW>;
+        select-gpios = <&gpioh 3 GPIO_ACTIVE_HIGH>;
+        mode-switch;
+        orientation-switch;
+
+        ports {
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            port@0 {
+                reg = <0>;
+                usb_con_ss: endpoint {
+                    remote-endpoint = <&typec_con_ss>;
+                };
+            };
+
+            port@1 {
+                reg = <1>;
+                usb_phy_ss: endpoint {
+                    remote-endpoint = <&usb_phy_ss>;
+                };
+            };
+        };
+    };
+...

-- 
2.43.0


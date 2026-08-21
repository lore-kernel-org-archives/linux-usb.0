Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013035.outbound.protection.outlook.com [40.107.159.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11E493537F8;
	Fri, 21 Aug 2026 16:23:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.35
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787329413; cv=fail; b=mM+ec/+7pqGyKFrUxo4hm4zHY9l4M4ZPoNy4JxeUT35T7smUHVPHfJHaK6xDSQ4cVSVm5MUiWlIuFO1+NNXu5IvuN5pq5Tvx0cgtHVD9qklwTFQvE5qnuzAJto5Fz94PutRPrse7winE6+EUfob2kT1lNULoDJ+Q5Wgwfxyx7wk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787329413; c=relaxed/simple;
	bh=PFTnaWa9skVrnM8KGVDW43X0ffby2OkpV7ipY4P6Twg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=dYNNZikWJYLIs1B1FtLfPelvSmr0Ga8eG3ydFEEVyruXfn2NKQTMoT/TRPTgX6l0k6jj2V4cAGKvlDyvHex3wVt5KNeHt9fk622qdYulFYWLcbVOaEIl46DZ/uTlJnkxuGZ7ziwYTc8SJe1REZ+Hy65lrnNM8FWGfkdmrouRqfs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=A811sl3Q; arc=fail smtp.client-ip=40.107.159.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="A811sl3Q"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AMGcMMu8NtOCN2PLv6dJRLDmFcw5H5BXouRAC9MbyCnGYmt9fI7KnBMJNcTo7aOLrc9IQjTgnYmbU4NBnhn1W6oYbSLFA7cpuycTO0HSBao2j8gG+tA4K6TtkV1ygs2BFtk8GN1N7BLNdM1OEUYmA8o2LovaMkGHCpf6DjBM59mL79wl4V1jBuRWEtmQWF4s8leW05RGcePckovYIQDg6Y+pqiZC4DsLPI0QLsEIPEYWduYN/+KzDvWfZcRVQbDe782xtQeuDxCD3/ypmYlTXCHr3jibmWOocZ7FpOy4tyfySCW0wSbkcdtZpnV5Z7QHaTV2x2wNbx2QBbkpUhSHvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qkNg7jjP5mA0oof1d2UsKe6h/yXFDlK4lanzZ9wSFqs=;
 b=CgVui3o8WhtrrWmJhlbmA8X2WQ7LhkcdZPakOcT1wVoqAUXTiTff/eO933v0Fx42bdYeaMnBsx97yRbuk/IDm1n38nqOKeGPwkSLviAV+GItZFtOq276wnCXSjwRTvqc5ARt5Haa/gn850BgeuH+VOgD0D0LZFDUg2TLuz14892pF7jAE7Z1t/AWtYvV80M8sm6OfRG6nCEId64xhwksmvW6nfAVZRMERk/pEtqIPlks6wAilWEez9Kua0FjPKSRNNuYl84KG491NeEVCIhzUUewW6NM1r++MyPW4SNvz6iq42pT/XYE2guhuAo7c7IrAH/0CROjSDzn+zbewaUNtw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qkNg7jjP5mA0oof1d2UsKe6h/yXFDlK4lanzZ9wSFqs=;
 b=A811sl3QzUpEObx1pRMecb1a9S9OnJjiI5L/jc5qrmQUQUSOlhu67YO0YScEFbiEdYo1HOvX7oGJESaw/2d6/xO1S0AwpvqRm7TwYG6DexhlfRaxqVBYhsIiHWk3FaUaFSza9vf9wbcNIgygaAG0M49cLK2syCrvzJkCJzXvLCyBhmKMR1SKuCcFl6QwF7ACA/9ExKHJWGk5VOmP/wt1yOwcBd12V8PcESJFrrYTveSLMh0Z/WC9HZNmbFGyDdN8kgP/TfcUPxmnsDKcmd75tJ+pI+21fOLCqLWG0sjWMfpiZRR9Qttc7KWj4oM4r/d7OeTRiU2eBo+RrstOa1ZCPA==
Received: from AS4P250CA0013.EURP250.PROD.OUTLOOK.COM (2603:10a6:20b:5df::15)
 by GV1PR10MB7980.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:150:81::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.10; Fri, 21 Aug
 2026 16:23:26 +0000
Received: from AMS0EPF00000190.eurprd05.prod.outlook.com
 (2603:10a6:20b:5df:cafe::73) by AS4P250CA0013.outlook.office365.com
 (2603:10a6:20b:5df::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.339.11 via Frontend Transport; Fri,
 21 Aug 2026 16:23:26 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.59)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 AMS0EPF00000190.mail.protection.outlook.com (10.167.16.213) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.360.3 via Frontend Transport; Fri, 21 Aug 2026 16:23:26 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Fri, 21 Aug
 2026 18:29:01 +0200
Received: from localhost (10.48.86.251) by STKDAG1NODE2.st.com (10.75.128.133)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Fri, 21 Aug
 2026 18:23:25 +0200
From: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
Date: Fri, 21 Aug 2026 18:23:12 +0200
Subject: [PATCH 01/16] dt-bindings: usb: st,tcpp: Document TCPP USB-C PD
 protection chip
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260821-ucpd-host-fusb340-v7-2-rfc-v1-1-c5e27cbc0795@foss.st.com>
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
X-MS-TrafficTypeDiagnostic: AMS0EPF00000190:EE_|GV1PR10MB7980:EE_
X-MS-Office365-Filtering-Correlation-Id: 313408da-6dd7-40ed-cd70-08deffa08755
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|23010399003|1800799024|36860700016|82310400026|10067099003|11063799006|56012099006|3023799007|13003099007|22082099003|18002099003|921020;
X-Microsoft-Antispam-Message-Info:
	8cN9ijTmDysFU7KkX7XRr/ZJwhLNIy9Kxq/jZ6USNfZLCh9hdyrbfLnSXsruZq7mHLUW6w58jLF2bEd0PjtOSRezsgZD22iT+QFDnb8uWWBSBS/7gdNetcomMVnBWBBFLhNNhIXgSLrLJtWj4k6/cwKqzEU/LloFQDhK2FG48K7S9amdclPKMbNKDw50tkvLXFKz5BqDm9zp2Yp1kYQA/r9sB5VPVWJ9CTsnpcZxWLFOi0UUS04a/377ltEXhge6hA4C2EWKgI7ct8DkziFFiM4skXQOxdSfzClgKyyw+KSs18jh9YBac4QDqC0yRS7amvF5WlohPWrJyvDfvhSdZ6o+5Js0xnLBe/ePmOveRc3o7qajk10cCFari9Vz3/1q2dJg9qxxXJy7K4QAyuiYaJ35UgWgfIgHBK1uY8j4WCbur+ufuhcQe9du5gCOn5cu0WXg3O8WHqg6I+ujfez++pMDfc9/MfsCwZR4rpWwsRIoF+Y26N9kRwqVvu8xmp5si/QS7nkeAniyYZ8aNpokv0Hc3wZ3x1C65Ua7p+Zrdk2vHK2Ztj+rYtX3TKVhmQlyDLTg8r20xIvnbdUmt4kNI9995iBawrUEr8zkzoIqttJlFYCbEz08L3zI3Z3nrX6bap/EfaHOAI2NYNztDSzAiOHJuaJVED8IlsBXcw+Iyi74baW8zSv0302yHUEbjDImacVhpbVeDxhkoaqeZVeyxA==
X-Forefront-Antispam-Report:
	CIP:164.130.1.59;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(7416014)(23010399003)(1800799024)(36860700016)(82310400026)(10067099003)(11063799006)(56012099006)(3023799007)(13003099007)(22082099003)(18002099003)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	R1RzGQctv1GymduJT6Kk4hR1qGJln+p3vlF6Rxu/W2nVN2tx2tRL+J05VbGlKTzLCbrHkhaE1mi0xoXliRY1HhUJF4ove1xYGJNnZHxPwZfGIiULH1VVVJ7JczE6fpm822VajKkhVPd7NyUILdM7KuPZqJIX3toYQTrHTLPfWR2Obbw7NVvW7jJ/r2GGzDaW2sqX+qAVVfrjeKgxx02SWvoT4JkTmiW/dVQ5mhy0dAPL+qpx5IdsoFw4zo2g14ZnkhNPbqGvNx2vxdZtg/VTZF6dYC5PEgSMt/WPvUS/r/z5S6Y9jqICpH5ovWNM7Bh8LOibAVKdSiNmRD9YawTjtfx3KwtHMlHimexuEhNZQYoYLjBI/LBvQ1bQIRu+25USQHxXPXlvNhKqySmoV9Kxl0rOQv5+L0I/CgVFQiJ/BoJNBD96yfKaWr7RGHYneZFU
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2026 16:23:26.2648
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 313408da-6dd7-40ed-cd70-08deffa08755
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.59];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS0EPF00000190.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR10MB7980

From: Christian Bruel <christian.bruel@foss.st.com>

Add binding documentation for the STMicroelectronics TCPP Type-C port
controller. TCPP03 is a companion chip to interface and to protect
UCB-C DRP port. It has been developed to be used with STM32
family embedding the UCPD controller.

Signed-off-by: Christian Bruel <christian.bruel@foss.st.com>
Signed-off-by: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
---
 Documentation/devicetree/bindings/usb/st,tcpp.yaml | 63 ++++++++++++++++++++++
 1 file changed, 63 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/st,tcpp.yaml b/Documentation/devicetree/bindings/usb/st,tcpp.yaml
new file mode 100644
index 000000000000..3224969359c6
--- /dev/null
+++ b/Documentation/devicetree/bindings/usb/st,tcpp.yaml
@@ -0,0 +1,63 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/usb/st,tcpp.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: STMicroelectronics TCPP03 USB-C PD protection chip for DRP
+
+maintainers:
+  - Christian Bruel <christian.bruel@foss.st.com>
+  - Fabrice Gasnier <fabrice.gasnier@foss.st.com>
+
+description:
+  TCPP03 is a companion chip to interface and to protect USB-C DRP port.
+  It has been developed to be used with STM32 family embedding UCPD controller.
+  Access from I2C interface with 2 read registers SR1/SR2 and 1 CR register.
+
+properties:
+  compatible:
+    const: st,tcpp03
+
+  reg:
+    description: I2C address
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  enable-gpios:
+    description:
+      GPIO pin connected to the TCPP_EN signal of the UCPD
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+    #include <dt-bindings/gpio/gpio.h>
+
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        pinctrl-names = "default", "sleep";
+        pinctrl-0 = <&i2c1_pins_a>;
+        pinctrl-1 = <&i2c1_sleep_pins_a>;
+        clock-frequency = <400000>;
+
+        typec@34 {
+            compatible = "st,tcpp03";
+            reg = <0x34>;
+            enable-gpios = <&gpiog 2 GPIO_ACTIVE_HIGH>;
+            interrupt-parent = <&gpiog>;
+            interrupts = <1 IRQ_TYPE_EDGE_FALLING>;
+            pinctrl-names = "default";
+            pinctrl-0 = <&tcpp_flgn_pins_a>;
+        };
+    };

-- 
2.43.0


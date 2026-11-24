Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.195.136
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795526091;
	b=WBKk4fAsGeItdTW3aQSkwPxGU3dmiT8XeMMg6VYLgUCSNuKL/3XwLN+QFDwWJDz7dNX5
	 Wxz7xZFPzJ0wroQ577MbY8pdpLPgKDVIB8zS/fqQAc0dhgzStBFvtZA/SmD+/qXwRiTGX
	 w1V4IDo8iOVBbiwu0R3ejgI5plDt+AdQk0QkX994aQUin09pQ5NA8iH5UbMAjWXUp5cNT
	 JLGgA9hVs4VdKakn6DcWgDdWrpvE3kWla3ePEaXcH6NqMZfZG6M0TS+PCZZY4fE/O63ic
	 44yq6IXofsJ+TO9LSd/Ruv6V3snlEkGk56bcTZZ7NO9sIy3axZWI0lcGGFsWttC3GXQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795526091;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 X-MS-Exchange-Authentication-Results:Received-SPF:Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-EOPAttributedMessage:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-Id:
	 X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=pYwXxD5MgatSE+puLnhIi9nFAFrR9w/nmUJTmwQBOy8=;
	b=K9GlIYYjP0GzJ+SNeY8lVhwO+UIsYksf9CTO2sSGJaRkjKJi2gXx0H0KOzQ8mZEJZ7cz
	 BEypWBjLfG5ads3bL2cGugL/3U+ASp525lL9LtrSwdLcacy3T7JIu4ZGu1vZcwPA05hqt
	 pP30BXCNWdHFh2/e29/ksyAPE2mUxYssAVDYTkp1WZuU160eNQojhtwuxZ0go+gSwoDl7
	 vnS7gVha3nfmVs0yY9JdWH3wkQMdum4LZDs6tCdN6CYu+yXtvq8c+5crhoTKQEU1Ol9sQ
	 2EwF+bQ8r8wl+n3kqDxf2uoPeYYio8UUeEf4o8Yw3Txucyv/3lsJF1DLpdwU/DDCUVA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=axiado.com;
	spf=pass smtp.mailfrom=axiado.com;
	dkim=pass header.d=axiado.com header.i=@axiado.com header.a=rsa-sha256 header.s=selector1 header.b=TIbt4aaU;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.195.136
Received: from SN4PR2101CU001.outbound.protection.outlook.com (mail-southcentralusazon11022136.outbound.protection.outlook.com [40.93.195.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0ECC1606A335;
	Tue, 24 Nov 2026 13:14:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0ECC1606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=axiado.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=axiado.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=axiado.com header.i=@axiado.com header.a=rsa-sha256 header.s=selector1 header.b=TIbt4aaU
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DQYAbI+OkP27WQNA/eqHbi3cud4pSY7S8bPu34rBwktRKRXWlc0qCSfPkqCJUmGadmH3I2vnJOiTPO1Cu3AP4u5IKnAgDPu0WyPsAt+iVlxjVFjs8msEXUgfB5lLW+gG4M/hdUTx2I+6ujqxu+dv6D+f+WXD6bAIJbG+gqGnRjG1Bie8TTGntc3lR8D2N139fnGMD11Btd/kRk2dnz/IPddMyiw+xmyAKmf8BSkoJAddtEzrAk0PQzTHLZe7iA8UQOuxnMWbty2kqEWyvmWe4PZXl7NgefKIxc1m6TTt2w4N7lLx7M1k6cIm5WhQYrU5QgZua8OHWc1ezsVoJ4IGkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pYwXxD5MgatSE+puLnhIi9nFAFrR9w/nmUJTmwQBOy8=;
 b=wPvDNJQ+wVYL30xOY89gC77mXIp2oyfq1sMcu8N61+gRPMA7ZCBR2w8IhOQOcJd9wEflGnZM/+ViNFcrLADGEes2DLI1zn4FaztH2fo27ObaCwOZ5bzW0u9RiWVXziQHdU0+O1eEZGCwMK2SCgVWAtOIitt7dbSTqE7vlp4MOusK4Owvlo9ajOZYv33AoQHp7hGP9jp4gX5RGtvw12sZnWByD6uIDznMJBmikhnKsDS6uChlQziuDTTAP1IS+b+B9NtGkn8g2r/4ISWVTCSOGEizF1peRiCoeIooxQCHN1RQFUqFaD4S6iPNFIMSTQoA3nv+07bHP1qrdobSlKpG4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 64.62.143.114) smtp.rcpttodomain=axiado.com smtp.mailfrom=axiado.com;
 dmarc=none action=none header.from=axiado.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axiado.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pYwXxD5MgatSE+puLnhIi9nFAFrR9w/nmUJTmwQBOy8=;
 b=TIbt4aaUUGkKyxNv2rBeIPXCCvUZ6jGMI6BNElzG75LAgvz39B5fUHL2jUJ7b6HEiMhoBeJijmJWeT4Kp7eVcvneGclXiDL5R3qMGWGwmniBUr2jkwC5OwHFXNieC/w6AoB76dA1flnSogtPJel1C5G9B6cMtfMY4hcjNHj7lTW1cCcEZyEkGGTEyy4FSMPwUCHlFq6tJp6TJz1SSzQ8TupMmGvMthdSDF2hn/uxbQTT1luSLp8ZwyB/2o6junMmy6PQz2Ojo5hIguPJYc58YroBrh2rqRlpVikmuhjLw5OvqzOOE7naSgwrpsrTUXkKwSzeiRqDToCoHlGwOoAWLQ==
Received: from DS3P220CA0007.NAMP220.PROD.OUTLOOK.COM (2603:10b6:8:45f::6) by
 BY1PR18MB5328.namprd18.prod.outlook.com (2603:10b6:a03:526::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.4; Tue, 24 Nov
 2026 13:14:45 +0000
Received: from CH7PEPF00000017.namprd21.prod.outlook.com
 (2603:10b6:8:45f:cafe::29) by DS3P220CA0007.outlook.office365.com
 (2603:10b6:8:45f::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.662.6 via Frontend Transport; Tue, 24
 Nov 2026 13:14:45 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=fail (sender IP
 is 64.62.143.114) smtp.mailfrom=axiado.com; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axiado.com;
Received-SPF: Fail (protection.outlook.com: domain of axiado.com does not
 designate 64.62.143.114 as permitted sender) receiver=protection.outlook.com;
 client-ip=64.62.143.114; helo=smtp.corp.axiado.com;
Received: from smtp.corp.axiado.com (64.62.143.114) by
 CH7PEPF00000017.mail.protection.outlook.com (10.167.244.166) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.2
 via Frontend Transport; Tue, 24 Nov 2026 13:14:44 +0000
Received: from axz-uw1-build-vm02.corp.axiado.com (unknown [10.14.1.22])
	by smtp.corp.axiado.com (Postfix) with ESMTP id AED5C4186B53;
	Tue, 24 Nov 2026 05:14:43 -0800 (PST)
From: Petar Stepanovic <pstepanovic@axiado.com>
Date: Tue, 24 Nov 2026 05:14:34 -0800
Subject: [PATCH v6 1/6] dt-bindings: usb: gadget: udc: add Axiado AX3000
 and AX3005 UDC
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261124-axiado-ax3000-usb-device-controller-v6-1-b991f9b27111@axiado.com>
References: <20261124-axiado-ax3000-usb-device-controller-v6-0-b991f9b27111@axiado.com>
In-Reply-To: <20261124-axiado-ax3000-usb-device-controller-v6-0-b991f9b27111@axiado.com>
To: Prasad Bolisetty <pbolisetty@axiado.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Tzu-Hao Wei <twei@axiado.com>, 
 Karthikeyan Mitran <kmitran@axiado.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Neill Kapron <nkapron@google.com>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 openbmc@lists.ozlabs.org, Petar Stepanovic <pstepanovic@axiado.com>, 
 Krutik Shah <krutikshah@axiado.com>, 
 Naveen Kumar Rajgiri Bassappa <rbnaveenkumar@axiado.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795526083; l=3700;
 i=pstepanovic@axiado.com; s=20250916; h=from:subject:message-id;
 bh=2xo20+OJyKYJmmo/bodACZzslBB1bDqdJY8tRkXvdGg=;
 b=ZNfFmECuMW77n/PdAZqe58odGfcTHm1M28eIQQUhQ1+NkEgf5Nr84mdJbShKyhxXkWv12aEO0
 t53J96ZjHiHAC6VtHDap4oKbMurGPwA+JD6qK/KjBEcaba5zIat47bF
X-Developer-Key: i=pstepanovic@axiado.com; a=ed25519;
 pk=70f1UJOGT9U11ZK6o+ENXtv0I5wBE3e+Y9YWODzRsdI=
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PEPF00000017:EE_|BY1PR18MB5328:EE_
X-MS-Office365-Filtering-Correlation-Id: fe15373b-0770-4f37-bf33-08df4a2ce89f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|36860700016|376014|7416014|1800799024|82310400026|10067099003|5023799004|56012099006|261021121427099003|261009223027099003|261102123227099003|261026121527099003|261022075727099003|261028144727099003|261022105027099003|261026140227099003|18002099003|22082099003|6133799003|13003099007|3023799007;
X-Microsoft-Antispam-Message-Info:
	jK+Kf9SHNJRRzM8d9ROsQQlMf9odfFu33z2OazWS8JfflV6McZuTwtsW/PKNlPyymuonMKYgkCJ13my9bJwLG5cWbAS3MQODO4706G6fumysiTxwWMe39Q4emunKfXbN21dL4EUxRK1bBPMhkqfoms3VDa9WLN8A0cAoorOThQFFdvltriuqiRtecP1Q8MuZjvObv94ivT+0+gyXQYU4MAJpj/IY4UffoMWMaeKE56cT1YfG0dHuDQHJsTiJZShuzfqLOLX08e0EdfEHlSBEZYuTFW3ECJBZ3IXeN+e/1USrkoXhxE58jkyGLw89ydQ3b5TLoNpI7TJ26/Jv5pueNZ/p/CjEiZ+ZVW6piQQqso13tGJ8F/RDJU9ufGU68l719jjsipfuUsOVkBeLoqusHovLp9vXys0wW6JhpUrPL+e9g/ehDoss9k4YOnSGThjLVaNvfpfCaLoyHaeP652H6XkNOIhsath/XGQiDXzxliYiU3dzzQd0MoWBsiL2lgtHzYUYY+ky6DTrKzEBB5DuGaxZ0w6u17fUh5AnsclgQVvVXFUmrWPVQiYk5mdEd5CtHOWLj8+sLqTwinWSwQUFBLOiemu7ifMeLAuA4WQVJproEq2XUFY8ZIZZ/KiYcqNlQTFBbeCVfnQd4cXcyPgNzg==
X-Forefront-Antispam-Report:
	CIP:64.62.143.114;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtp.corp.axiado.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(36860700016)(376014)(7416014)(1800799024)(82310400026)(10067099003)(5023799004)(56012099006)(261021121427099003)(261009223027099003)(261102123227099003)(261026121527099003)(261022075727099003)(261028144727099003)(261022105027099003)(261026140227099003)(18002099003)(22082099003)(6133799003)(13003099007)(3023799007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	vAQgwqhio6WPzmZVd30tdsaZYCmlbpXthZvABk0fuFNH8lw3eMr9dUlxRZnf6JdygGJqcUlDZkoX4ur38vEpM+JzcDUoZCbRijPUCJrsO/sQ5CtCmSJJA7EpTbrsy3hpX+yqZ5CUnIzZ4KW7D56LfMVKIq7U9ocr9L5F0e3uQD7YYzz0LXPmwfZyEFO98g5ZQNl9UAcOsutPEnWMYiYkD+nBXO4r4H7BPwtC/cyThCgt5g0dt3kMczN2nqI9JQ0+UEjyuP0uUQOfA0c1t7A5QA0mkuskkXwq9YOfRmbOVc7cp8NB669qdFDvC02UxphROEETce0rPwPbeItJoVbsP0N/thdwOuHMJaDskyRTLX7s9ZHTwV6l/l7SV+3u+7bUCFRWEaWrO4z9/g/GYvI4R5jN/RCK9s9frJqmybfrvzj+Xi7nOq05hc82MgCNsgVP
X-OriginatorOrg: axiado.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2026 13:14:44.9056
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fe15373b-0770-4f37-bf33-08df4a2ce89f
X-MS-Exchange-CrossTenant-Id: ff2db17c-4338-408e-9036-2dee8e3e17d7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=ff2db17c-4338-408e-9036-2dee8e3e17d7;Ip=[64.62.143.114];Helo=[smtp.corp.axiado.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH7PEPF00000017.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY1PR18MB5328

Add a Devicetree binding for the USB device controller integrated into
the Axiado AX3000 and AX3005 SoCs.

The controller is based on a Corigine USB 3.1 IP core that is
dual-role capable (device and host), used here in device role. It
provides SuperSpeed (5 Gb/s) or High-Speed (480 Mb/s) operation, and
supports control, bulk, interrupt, and isochronous transfer types
across multiple configurable endpoints.

Co-developed-by: Krutik Shah <krutikshah@axiado.com>
Signed-off-by: Krutik Shah <krutikshah@axiado.com>
Co-developed-by: Naveen Kumar Rajgiri Bassappa <rbnaveenkumar@axiado.com>
Signed-off-by: Naveen Kumar Rajgiri Bassappa <rbnaveenkumar@axiado.com>
Co-developed-by: Tzu-Hao Wei <twei@axiado.com>
Signed-off-by: Tzu-Hao Wei <twei@axiado.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Petar Stepanovic <pstepanovic@axiado.com>
---
 .../devicetree/bindings/usb/axiado,ax3000-udc.yaml | 69 ++++++++++++++++++++++
 MAINTAINERS                                        |  8 +++
 2 files changed, 77 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/axiado,ax3000-udc.yaml b/Documentation/devicetree/bindings/usb/axiado,ax3000-udc.yaml
new file mode 100644
index 000000000000..8b9acdb81907
--- /dev/null
+++ b/Documentation/devicetree/bindings/usb/axiado,ax3000-udc.yaml
@@ -0,0 +1,69 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/usb/axiado,ax3000-udc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Axiado AX3000/AX3005 USB Device Controller
+
+maintainers:
+  - Petar Stepanovic <pstepanovic@axiado.com>
+  - Tzu-Hao Wei <twei@axiado.com>
+  - Prasad Bolisetty <pbolisetty@axiado.com>
+
+description:
+  Axiado USB dual-role controller based on the Corigine USB 3.1 IP core.
+  Supports USB 3.1 SuperSpeed and USB 2.0 High-Speed device operation
+  with control, bulk, interrupt, and isochronous transfers.
+
+allOf:
+  - $ref: usb.yaml#
+
+properties:
+  compatible:
+    oneOf:
+      - const: axiado,ax3000-udc
+      - items:
+          - const: axiado,ax3005-udc
+          - const: axiado,ax3000-udc
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  resets:
+    maxItems: 1
+
+  phys:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - interrupts
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    soc {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        usb@81200000 {
+            compatible = "axiado,ax3000-udc";
+            reg = <0x0 0x81200000 0x0 0x100000>;
+            interrupt-parent = <&gic500>;
+            interrupts = <GIC_SPI 21 IRQ_TYPE_LEVEL_HIGH>;
+            resets = <&reset 0>;
+            phys = <&usb_phy>;
+        };
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index 222b7fc2c3aa..1bf0408e00f3 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -4662,6 +4662,14 @@ F:	Documentation/devicetree/bindings/hwmon/axiado,ax3000-tsadc.yaml
 F:	Documentation/hwmon/axiado-tsadc.rst
 F:	drivers/hwmon/axiado-tsadc.c
 
+AXIADO USB UDC DRIVER
+M:	Petar Stepanovic <pstepanovic@axiado.com>
+M:	Tzu-Hao Wei <twei@axiado.com>
+M:	Prasad Bolisetty <pbolisetty@axiado.com>
+L:	linux-usb@vger.kernel.org
+S:	Supported
+F:	Documentation/devicetree/bindings/usb/axiado,ax3000-udc.yaml
+
 AYANEO PLATFORM EC DRIVER
 M:	Antheas Kapenekakis <lkml@antheas.dev>
 L:	platform-driver-x86@vger.kernel.org

-- 
2.34.1


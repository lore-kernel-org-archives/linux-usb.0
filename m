Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.44.120
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795409903;
	b=lTn9KW3AfOgcZ+iqhauDW39q91xHRBpNRH9w2Ce6Sqznh8ykv1wveYpptrDaecM+3U1J
	 6AeL1BbIn8OTW90JdGncxMM7f8C0yiPD3rZmpNw/kUX2pQ9O6lKVWS+qA60YqpKPFXCJ8
	 xGtHSbT2CThVhOdeY0SI9BBW2JFPHi4+oaaYU3U/YCx7/la3d7Deh3S/dCnt/75eaLgVq
	 uQ91bKEgH8t+U2olQgjUyrhDmcuj07t6cYKpybIyFeJV6BtMReMojMpnJ9zm7qpe86e3T
	 V9wLY8RTZN0yo6R75N4NI+CUb6F+qL8wdaKnP2rvwBiNpqHhIePi0lRUbB0mE4zcsCw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795409903;
	h=DMARC-Filter:Received:Received:X-MS-Exchange-Authentication-Results:
	 Received-SPF:Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-EOPAttributedMessage:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:Content-Type:
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
	bh=fQWnU9X84fixKvJmyQ/ArO25axF0knycUAXvuZUC68Q=;
	b=KbqGmn+/0J1ZX4N8m4BSkZLj3jsIY6kp9aHZc/UvHKf5wQaHEn/6UoZFAnalJYN1YssP
	 cwpm6BBbIfxC6W86IyeiBqbNXibqf4bEkmc/C2QXLtr1X1NLgLK+nDEObYUEQYswAPXwk
	 qdyGKp6qPXCEAgv/zWp3Rvdvl/sUmK2wPOeynW+KsxS4dSR7tBZ5k/6m0jGD2+oFgMzi0
	 CEthmIKakSKBaMX7ZuILUnULafPisR0GZxCFQcGX/8nLRYF9w7jvHY/2eCpFLTDgnLvI8
	 M1/baXK88nGs6DQ1o/yvZJ5n8jDjBR42PQUL8pdlhO75P9GBm4cELbWuWuBfiEcfaHQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=cixtech.com;
	spf=pass smtp.mailfrom=cixtech.com;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.44.120
Received: from SEYPR02CU001.outbound.protection.outlook.com (mail-koreacentralazon11023120.outbound.protection.outlook.com [40.107.44.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00936606A31E;
	Mon, 23 Nov 2026 04:58:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 00936606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cixtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Dr2ROd2gniNFkIkQBjdhdW+QkvVzWyCZvIlFspatqCtvfma0/jumv5cDK0obPh6L68Hudhzv9Wf8vrOFEABXGWFv1ROKfIsF7u8cWBbS1qBCbUAFsOOnR3Te6cQt8Hnek1YQP9Nduv3gIn8C16HV4A9L1uyvxFZ/oVFy3eqT0tkH1iTReI3fDjKJBnF5FhOQDfj+c+Kj+EU74ZLXgfDe7gg8Toqy3bNVuvifAf+SaGBP4n+NiLxnWXG7xPYMbj58yRQ7MXO1UkznyUeDq9ukDrt0a/8unxQBKGwOUs1c3/4q/PNRuWpBTCVrKmvLAvKcyFmW4t1CHtaQF4hAmERsiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fQWnU9X84fixKvJmyQ/ArO25axF0knycUAXvuZUC68Q=;
 b=hR7SxiZbCxn6JY1wK7+A6WJkeZvsDr9FHaYIHuQshpOJxYsR/u1PdMZpca/ZZj0FCjqdbUPC2+eagFAfVkgonjkxmzpOnpkHU31AHRARRfmHDqkZslg40JjoOA9z2aFXvMMq1uLGLN5OdfP9fLev4GDtUcFxPDfJRMRndJYlPphgYcDNmMYqXSgGDoOOYhjWmUVuS4kokYV3gJ4cw2jtjMC8I2UXOF2j0ymcL0ICdk3KGaf9652QHmOfwTwkJIFd/3mY7cnHXqiKhgHFmDbQAg56/y0y311y2w8GIaKApzizBosm/71APZlw2BzvoGZqdw9jDU8FJLuwpILCrW6Qgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=cixtech.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from JH0PR03CA0002.apcprd03.prod.outlook.com (2603:1096:990:6::7) by
 KUYPR06MB8627.apcprd06.prod.outlook.com (2603:1096:d10:8d::23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.662.3; Mon, 23 Nov 2026 04:58:18 +0000
Received: from SG2PEPF000B66CE.apcprd03.prod.outlook.com
 (2603:1096:990:6:cafe::58) by JH0PR03CA0002.outlook.office365.com
 (2603:1096:990:6::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.662.5 via Frontend Transport; Mon, 23
 Nov 2026 04:58:18 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 222.71.101.198) smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 SG2PEPF000B66CE.mail.protection.outlook.com (10.167.240.21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.639.5 via Frontend Transport; Mon, 23 Nov 2026 04:58:17 +0000
Received: from gary-System-Product-Name (unknown [172.16.66.27])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id DE697427EFD5;
	Mon, 23 Nov 2026 12:58:15 +0800 (CST)
From: Gary Yang <gary.yang@cixtech.com>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Fugang Duan <fugang.duan@cixtech.com>
Cc: linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	cix-kernel-upstream@cixtech.com,
	Gary Yang <gary.yang@cixtech.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v7 1/2] dt-bindings: usb: add Realtek RTS5453H Type-C port controller
Date: Mon, 23 Nov 2026 12:58:14 +0800
Message-ID: <20261123045815.812561-2-gary.yang@cixtech.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20261123045815.812561-1-gary.yang@cixtech.com>
References: <20261123045815.812561-1-gary.yang@cixtech.com>
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SG2PEPF000B66CE:EE_|KUYPR06MB8627:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 90b0c6c4-e344-4809-ff40-08df491e6396
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|23010399003|36860700016|376014|1800799024|18002099003|22082099003|3023799007|56012099006|261028144727099003|261102123227099003|261026140227099003|261022075727099003|261026121527099003|261022105027099003|261021121427099003|261021123027099003|261009223027099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	FxRCu9NYW9CCv1bH0fmWKWc0Kn6vWFyvqHwXdiR4E90A6J9gEY0kmLKLGjMdHiBACagF/j8scJN7KiNSCICsJ6YkbRS4SgA2lpAH8PTBj0n/xnqfJozXyfLnEWni1ThIChKZwx93kq0F8hbLCjVsPVjIOTK26xyXursaORynu6efeuCgTKR41ylRykkwjHp0qqOFihyGfWsb73kiFPWLRXm1sjN9f7O+7N+BVviGZt5aB3tRQdlsZzT8yBBXXD7aqURpEKHNAB03/bCEs5flv/E0zSMSx+3L+jfBasFC8xACAT4bCWX2zTR4LFZjES41d8Y/z0kEm92Rr3RR4lcS+iSDsPQxcm9VIvV8yfTwsep/NC+xCUyRk5JB3sj3FZ6VrG49cuHf85mlpNvUJMQXIM7H+yZsg2wgakdepM5HSTgCQrAxsVmqHd3/YH3Abjcupo5r7WXQoWLA7ujePAG38PBOifOm1PVcVXP11NfDlDjlYjmFMWWLBH+qz+p9YH651tWi+FGyvaHiLuf9o0iZTfrT924bKK6oBiouyARR9SD78b5P0yZOf1C7I/atX9krW+SieMKRUJscr6v5qaZee5kNsg+pVuqmxoy/GmdcN88I14xiFhv0lAv5OjfpplxlPYvfKqMt0F759ViX9P/dsg==
X-Forefront-Antispam-Report:
	CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(23010399003)(36860700016)(376014)(1800799024)(18002099003)(22082099003)(3023799007)(56012099006)(261028144727099003)(261102123227099003)(261026140227099003)(261022075727099003)(261026121527099003)(261022105027099003)(261021121427099003)(261021123027099003)(261009223027099003)(10067099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	cTvCyavUks9Xj/XxS7XwTSye33XdbOs6rbSQTyPbgTRXT3OURU8lTGxIvSAUVZ5fBq3gkD6L/mSDxDCxUSymRZ4sApV+CFGvAtZWdlGf3uvQfZyTjoqtoqt5ysDjT+fMbZIdSu55yDfxz6BXthb8AM3PCylzR38eNyM518hgY8dirlvWPqjGuVrgvWE9bDiqzEM5ogKzzhKdA+031SD6XsctGjYXEVvOROWVTO8EDgfidw6yAYUMWI5y+shq79p8r0sYTJfMyHcy2wgFoX7JweDGAsJtYKSi0jSS+SCmfpw2QnTSpGP+6yTZQMdBTXvrkYo3z69LyYC2dO8c6oesAPEZWCDcE3ZPwptstWVDuY7s9zIp3xS8/nUHzWp57BX67m3xC1Gv/lWfETTw2zPutIE6HYtQChIiGRbW+/DGkd5XIJfGDmYDbAgO/SgoQDIK
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Nov 2026 04:58:17.1600
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 90b0c6c4-e344-4809-ff40-08df491e6396
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SG2PEPF000B66CE.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KUYPR06MB8627

Document the Realtek RTS5453H stand-alone USB Type-C port controller.
The controller is connected over I2C and manages a single USB Type-C
connector, described with the generic USB connector binding.

The connector's OF graph links to the Type-C orientation switch and
mode mux provided by the platform PHY.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Gary Yang <gary.yang@cixtech.com>
---
 .../bindings/usb/realtek,rts5453h.yaml        | 70 +++++++++++++++++++
 1 file changed, 70 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/usb/realtek,rts5453h.yaml

diff --git a/Documentation/devicetree/bindings/usb/realtek,rts5453h.yaml b/Documentation/devicetree/bindings/usb/realtek,rts5453h.yaml
new file mode 100644
index 000000000000..f7c062ba1114
--- /dev/null
+++ b/Documentation/devicetree/bindings/usb/realtek,rts5453h.yaml
@@ -0,0 +1,70 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/usb/realtek,rts5453h.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Realtek RTS5453H USB Type-C port controller
+
+description: |
+  The RTS5453H is a stand-alone USB Type-C port controller with USB
+  Power Delivery support. It is controlled over I2C and reports
+  changes of the port state through an interrupt line.
+
+  Orientation switching and USB/DisplayPort lane muxing are performed by
+  the platform PHY. The controller finds the Type-C switch and mux
+  through the OF graph of its connector node.
+
+maintainers:
+  - Gary Yang <gary.yang@cixtech.com>
+
+properties:
+  compatible:
+    const: realtek,rts5453h
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  connector:
+    type: object
+    $ref: /schemas/connector/usb-connector.yaml#
+    unevaluatedProperties: false
+    description:
+      The USB Type-C connector managed by this controller.
+
+    required:
+      - data-role
+      - power-role
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - connector
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        typec@30 {
+            compatible = "realtek,rts5453h";
+            reg = <0x30>;
+            interrupt-parent = <&gpio0>;
+            interrupts = <8 IRQ_TYPE_LEVEL_LOW>;
+
+            connector {
+                compatible = "usb-c-connector";
+                data-role = "host";
+                power-role = "source";
+            };
+        };
+    };
-- 
2.50.1


Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.75.138
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794978800;
	b=bGg7YMUeos5zQhuDRL0vSBLyZT+nspD3OMT9sTDX/SVoShn11zCBrXoQ/cChX7+CFQ7I
	 maMurU475cv5QI2n5PB1dsqT+F4J8EoE1UlFCP7Oizder4lR3QGe+zuE5XI0PphropXP/
	 bMw3xrWobgg1o4FWFJsyfxC30uZPxyeD8SASHNEJjHR4xc7Y+DgQcNJlxcipdIzZHRjhx
	 Trk+x/tMVXOqJORbu4VCEcJAbM1JDL7jvNAjAtitmwZ1Rc9+TufBEyN4NxKERTjxAZ1m3
	 KQlluDu4NS5f0bc9DgBXM2i+Dqleei5qrdR3NXHwIxdEnbYpl7m/6oKJwVvb+TZFUyA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794978800;
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
	b=bgnktJcZTTOQcPd61h7VzOCNFqIXrfO54HuKzibWOKXSRhf4NnbvL6SqeY8j9oGG5gjf
	 mT5ScXYcofHkS/EFff/CHHVWlc3vSjWq8rxxDJzs6ErmTqwIuUsDyB0JoDGban3ScXSWE
	 hZcR3yIsxsWs0kB68XMduHp7whYeXuxKqAQLTM9fSYQYr/d1t+z2LxcHgSHLlPQGKEIHm
	 2C0jguW9vgl2SXrsq6ZO73DiWZ0WkZeV6k96P42ph6xI06gQdV2Vly6VVAC7lV60HjCmk
	 s1wfHIw7R6ol8Vn2whkipN7LlK/Lv2op/KTs3tm6GpvT3SAOtI1Xtk31gi5wfAsAJlQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=cixtech.com;
	spf=pass smtp.mailfrom=cixtech.com;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.75.138
Received: from OS8PR02CU002.outbound.protection.outlook.com (mail-japanwestazon11022138.outbound.protection.outlook.com [40.107.75.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58555606A32A;
	Wed, 18 Nov 2026 05:13:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 58555606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cixtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=t8TA35sRxTXCIddvIWNQpuGfF+c6Yn8ZH9Uvmjv7yoJ/QbOkZGSF3olfU4GlIM+jAXaJGbtXM2CwaJEH9MPyfEJtOjTl1SVO1ThjKxmPsEG68Z7cHmRbw778RfAlQa/8XshyNf1jSfZmE6JyUaA3rg55cFlWfSMAt5XxnEO92OX/N4IegJDhLZh6UYC2tnTJMATLy333x0YHLvfxptB/fwyrGkOPoqMnL4k5tABULfMQ14yZrp6ZRHmCG793Z6iBRVA3F6j4wjxAER484uRJOQZMFc9qlKJeGKhu4Ll7tfO/9OOcv7899pfyiKDkHRto5aopqfDEiHlq91ZNdU32nA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fQWnU9X84fixKvJmyQ/ArO25axF0knycUAXvuZUC68Q=;
 b=rVK4ECcd95vnIRLoVidvvTlL60fn7zFrXYLa83F6Ppzjd5ODx8zRM54Qos4kki3KHe9mXKsXfFXAw9l2zbL+XpZn8DV2b003jcSe2I3F8UDTxGQKbZ6q3QwY3M37+OuhrDrlbBdmFI6SCnqKaDHLRGQTHWwx2isvu0MYxC5Zxo0cncUvKJMlD+Ybo4lkXyD+8bv7nM5Fkqp/0F+pbmRf6OL8JsIXy+vzbTngzu5Jfcw7RUsM7P75OnRIt5I9TVhf5aHbhkvgLc80dSIpn3TKohqb3k+srzOyfS/miE2rvCg8qYRodJ5SP5hzNPlb9lAL9HQlv49io6Cz8tWPpt42ew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=cixtech.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from SI2P153CA0007.APCP153.PROD.OUTLOOK.COM (2603:1096:4:140::8) by
 TYNPR06MB8926.apcprd06.prod.outlook.com (2603:1096:405:3c1::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.639.4; Wed, 18 Nov 2026 05:13:17 +0000
Received: from OSA0EPF000000C7.apcprd02.prod.outlook.com
 (2603:1096:4:140:cafe::94) by SI2P153CA0007.outlook.office365.com
 (2603:1096:4:140::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.662.1 via Frontend Transport; Wed, 18
 Nov 2026 05:13:15 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 222.71.101.198) smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 OSA0EPF000000C7.mail.protection.outlook.com (10.167.240.53) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Wed, 18 Nov 2026 05:13:15 +0000
Received: from gary-System-Product-Name (unknown [172.16.66.27])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id C7D96427EFCE;
	Wed, 18 Nov 2026 13:13:13 +0800 (CST)
From: Gary Yang <gary.yang@cixtech.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Fugang Duan <fugang.duan@cixtech.com>,
	linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: cix-kernel-upstream@cixtech.com,
	Gary Yang <gary.yang@cixtech.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v6 1/2] dt-bindings: usb: add Realtek RTS5453H Type-C port controller
Date: Wed, 18 Nov 2026 13:13:12 +0800
Message-ID: <20261118051313.3634833-2-gary.yang@cixtech.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20261118051313.3634833-1-gary.yang@cixtech.com>
References: <20261118051313.3634833-1-gary.yang@cixtech.com>
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
X-MS-TrafficTypeDiagnostic: OSA0EPF000000C7:EE_|TYNPR06MB8926:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 0da49a43-10f0-4afd-d433-08df4532a677
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|82310400026|23010399003|36860700016|261022075727099003|261102123227099003|10067099003|56012099006|261026121527099003|261028144727099003|261026140227099003|261021123027099003|261022105027099003|261021121427099003|261009223027099003|22082099003|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	JqKJzrZE+Pp39WRf/6CK8Ci3RKRKYM8mRGdlLEQOS7xAoOd1oJBD+P0IoWulBxVZj56ez7rDQjqjb83Ed9HpAanIexqD8M1dZtKhl3a72cP6V3SaQfc1B/xSrtRVdy9Xj/yp2D3pD+8S+KX1uRdLLAYqNt3hjJA4k0NzxaEOvgc/GakJlcI0f4BWBz1GTmep9/wArFyIn8b0yl5ZZvk9f0ZpWK7e9ZpQ0c9zYpiQaGZEunrkby32n+jHjPlwdVc/Lkrrwsuoey3Fc4vwxjGupCzZxk9zUQpENNAZseFM5We36iZRjFckTaNxVh/WM0ew/P9ay98jnBHiEGGbX1y4cWCYslWgIeLl5g8cGjsbFceblwQL6MEIBvPPN8L+0yYzFxeDdSOPtIdylN4lnYgBfmkeW5GGzMiMiPW1EDSo/Z738RRQSFn5XNNuVaWBMBs2NtYBj3K216BGuLhovaXPGRHNzSjonxGRjpb5iDkDFyRcEEo02GXv4BNIW6HVhg23oeA+qcLlr91bQtEnlV4DXR3xCLF8ynY2ZDJBiFL58N4et7K8KGCOOpgJUrQ6P3OHjTeS2gHI3swFqG6LspvA53dLNlnuQbghWscjyF+IVNkgDWIhxUFONRzFbRKxMWeKZ0I94FqP4S5H/nbmJZBdCA==
X-Forefront-Antispam-Report:
	CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(82310400026)(23010399003)(36860700016)(261022075727099003)(261102123227099003)(10067099003)(56012099006)(261026121527099003)(261028144727099003)(261026140227099003)(261021123027099003)(261022105027099003)(261021121427099003)(261009223027099003)(22082099003)(18002099003)(3023799007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	5hgsXDRmz8KvUsgHZc5rsh+qEHuQNnO0FTZsSMZy4wgJVZmwDSIRoALpLrtIzjr2Fv78beqCCaxe/coEpRbA4G3meYFO9OAMCCbOslen5f1n762J0qCmHliqWQFDxNAGxY+T1rllpiTIzMdmNkpO6hSUpF1wfri0i2PZj6J73mcekkZiJ0L5Ok9NQqWPsauQlDdAiYiRN6sas2SXHP3ySyZWbD6HpWLTmQsUxvYKe4OT4x/xK++kIk0jqQdupBuw2HcGSnIvsOc62uvk0tcYhGVmMQTqqRC2wYJkrT9wNcxtqD+CysAhXmSMiofuk61vPBt3Qq5g7xszZrmGYvW5HrqR9dhm3nLZkOrVRbzNHOwxOQZzXO/sqeHc7vREweefVm0Txn/0eJfgl9mkNeJI4tHoNeNpYijPb/XLiIwb/FoDRQEUU7vjHgSEiLGFSfOZ
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2026 05:13:15.0861
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0da49a43-10f0-4afd-d433-08df4532a677
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource:
	OSA0EPF000000C7.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYNPR06MB8926

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


Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=139.219.17.114
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795595877;
	b=Tz2w9ENyGAEkXgwYnIbPowDzRN1evDvnWWlEqc+Y1+9higONYp9u6ZBhInyiXoSSuXQs
	 JB+VYP/fYFjTV1v9loJ6/JMyX9+88d9p73HemrjsBY2zYcaFoiDaoC4dUcnPbYjhQRQ2v
	 cxWd3UGIKOw7ewgQwvNtDgihRqpeTLXzsnNjt/T5sYNLxyIvPeCt8fdPO13mVxtSUUbA5
	 2tD4JhYMGiPrhelByWAKutrfpXZefZ9GR/YMSUbrTKxaj/B9k3ygPXOkFNmVB5eZCt0NG
	 NdqxsIoKObNSN2K6OK6N3xIxDHOWpKa3dPwWhQ03bVJL0Pk8vc6Y0ih9smX1Ff06viQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795595877;
	h=DMARC-Filter:Received:Received:From:To:Cc:Subject:Date:Message-Id:
	 X-Mailer:In-Reply-To:References:Content-Type:X-ClientProxiedBy:
	 MIME-Version:X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=1/JgPA6Niv9HyF4T6hr1ZxU355/ipEYL0Y0fhbk/bPI=;
	b=b9K4IoCdRs5zh6dgFVUp2fDJxIz0cIhoRrX0QKQpdQohmsm0DkKK/wpoZtzxu+bZhqsW
	 VIUNJkxUko5RLb0w+wuVsS9SkyqjeMe1qC89BFlZ9eZsOPJuQByHAoAqjiJucrm+1dy9s
	 pApUVNAAyAI4O3gI2/V3pvVvHcI86+auY/PAHtEC5hfT1M/TRuOOKdlGkeM8A1yyrr24K
	 cNmZlHf8r8NdLfLpmLBIxGqH25tL2YNTLPOU7j75I+3CY3mfpnNkGd0a7lzW2KRaT+gdq
	 vFJRzlY88yuAoY/pQUb2h0ZP/pHNwt2VRO07zBG8n7VOevnBr7dFcmVrFLOvTq1amRw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=starfivetech.com;
	spf=pass smtp.mailfrom=starfivetech.com;
	arc=pass header.oldest-pass=0 smtp.remote-ip=139.219.17.114
Received: from CHN02-BJS-obe.outbound.protection.partner.outlook.cn (mail-bjschn02on2114.outbound.protection.partner.outlook.cn [139.219.17.114])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D7D2606A337;
	Wed, 25 Nov 2026 08:37:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6D7D2606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PO0SJY2LVax2+Wo0v1IsD4EmSWvtS+TKV5aj4fKL5SQM/POpQVHAvhlqCrbpODFwFIHmlbXftiHU2KSiUiZpsEBjE/TxYfbqf1jlG/NP73E36K97vW7/xcU1jCMFnp4xsBhpIvR6K8D7qYTYYFtVH4BL7fDtHZiZh8TqMX/PjJUjeSvd8xtCh3tHEocvCgsWUkehImi/qo3Ded236ywI4f/r9sF4CgP8zGgkJs59+SKb+vR10YwtZF0xBoEO87qoQIJ1B2ycLRLd2GgG7z/qjuOD8WOK39kuKmWYD+/ifb39ktvrvyaFwWGousnasZntFw9nMLf9ZBBnhvbAqam7yQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1/JgPA6Niv9HyF4T6hr1ZxU355/ipEYL0Y0fhbk/bPI=;
 b=aSJXhCBjBzCavN2484Dh94Rrbnfx8CdoU+ViK3vUthYprB0nh0OGajNN25ELQ2qsaMAQw3jNh7IpdhrBpCdnRAHsREBWh4WVOIRYFOKcf6OzGnll9hV5Z7au5XjrQ/bTMsr4/Mez/d1kVJrmNaHb1M+nBR2reT280zEmjMwGxP6Xz5sNUURAA/f6xDzDPBVRrQQ6q1cy1JgDd/zvLbI+wIYBd2DE8gzgzn0Ga1M4iMmFYqHTIVUQIM7fl9eL8vf0iciGRC6kl3DtgIFEAom2X8oTXHavnrWZfikmK3yH7u7o9cUkIP7pF+UbT/kUIwPeOh2+zGvg2U1gWUOBlYBpDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from ZQ0PR01MB1111.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:e::7) by ZQ0PR01MB1048.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:d::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.15; Wed, 25 Nov
 2026 08:37:46 +0000
Received: from ZQ0PR01MB1111.CHNPR01.prod.partner.outlook.cn
 ([fe80::d777:e23a:d111:5fa1]) by
 ZQ0PR01MB1111.CHNPR01.prod.partner.outlook.cn ([fe80::d777:e23a:d111:5fa1%4])
 with mapi id 15.21.0639.012; Wed, 25 Nov 2026 08:37:46 +0000
From: Minda Chen <minda.chen@starfivetech.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor@kernel.org>,
	linux-usb@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	Minda Chen <minda.chen@starfivetech.com>
Subject: [PATCH v3 2/3] dt-bindings: usb: starfive,jhb100-dwc3: Add clock number limit
Date: Wed, 25 Nov 2026 16:37:35 +0800
Message-Id: <20261125083736.50606-3-minda.chen@starfivetech.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20261125083736.50606-1-minda.chen@starfivetech.com>
References: <20261125083736.50606-1-minda.chen@starfivetech.com>
Content-Type: text/plain
X-ClientProxiedBy: ZQ0PR01CA0001.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:5::14) To ZQ0PR01MB1111.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:e::7)
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: ZQ0PR01MB1111:EE_|ZQ0PR01MB1048:EE_
X-MS-Office365-Filtering-Correlation-Id: 956e3938-8466-46b0-c40b-08df4acf6156
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|1800799024|23010399003|366016|38350700014|10067099003|56012099006|261021121427099003|261022105027099003|261009223027099003|261102123227099003|261028144727099003|261026140227099003|261026121527099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	qAridV8L6GPbHkMsZQ5YgrLNSxEOl6u0dKINmtSkvNfm/MjndHRO7hAkFqMImIf51dDvSHlX5fT0jnsuwX6vxa4nEKU+yD/5Q3bIP7QicJJCZ75AMrk76ew8Pz5/hQx/Z73NHCNojpA019qHouFRxV2zXgxH6B/CbQ/yz8KbjQapo42lBTykL+YakNAYaBd95/txmMUGLtPGVeN4q/KkBuutit6bZ3InwIgHv/gO7tDahvqsw3wL9w0wwobSX6l53/KAZv6H7piyfFExIMWT2FUouzbVOaWzumB+xI5AUFW1p/6STZTyJDmKIATgrauF9jTngCjzEulR0yagOcdmtVA1/NcuRqK025g0uZTrTB7JSh+ODzIG+CbJO3NrqC1iXfkFg9v3yj17C7FXy87qAbue/E7SJOhlILZsfZ4KmWGFfQUVcv7It8yZcLuYXlb5aV7LRuKIPI05UX3WLJhI13SW/yCp290UoZFY5s2RdbyxFvM8eNkhPapnY3KF9OG8zjVCLcvzDr6vwNn85+sO34i5FLs6UzltfnzHIJfTvSBFI15Iksek0RO3N3iz+WNF
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ0PR01MB1111.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(1800799024)(23010399003)(366016)(38350700014)(10067099003)(56012099006)(261021121427099003)(261022105027099003)(261009223027099003)(261102123227099003)(261028144727099003)(261026140227099003)(261026121527099003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ghvMYnzGQMJfJymcBqKvHWSVSJwGaHP3d+BfSRUFJaon5dm9BfsvDQJrW7wy?=
 =?us-ascii?Q?D4mvSXUP0YOL1Kro5Q24pb5ZEERL6P/umLMREVFiJFl17zIutKPGMKn10zo5?=
 =?us-ascii?Q?td/ASRxj19YMXH3tCOkK66L7J5wce2ohW+Ak6Fz/qsnexbqYR0oufscAJKxU?=
 =?us-ascii?Q?Js9vtUQ17O3VWAP8OhrAnjIY8c/ekp4odDsUGAbxKvrJdxOCddH5xn02E6e9?=
 =?us-ascii?Q?gULZnyYqtSqi1L1VXVpQ+bHGd4Zj5P7Rv7h+MMgygQu47sOh96GZNpB62ESj?=
 =?us-ascii?Q?jWr5juMPaf8L6HEGlrYWw93GjmBHbY3LhmRFnUhPHLbdacqVonCrtTTfMzTW?=
 =?us-ascii?Q?BWToR2Jo/nhnh7UpHW3y3SLFoLpy2GNiu36WT2R9UWW8lCR+5cZ/cdxSV3Om?=
 =?us-ascii?Q?BoPHwHWSLlGOPr1hFbvtnv45FP3B23xOybN9Hsibw+UasDcNylxGiVD+iOaz?=
 =?us-ascii?Q?aoxcWZNPcwqYovc9G1WWU9q2QuGpCN+FL/1o4hUQwVUghMvDtVnQbvLFvRzf?=
 =?us-ascii?Q?gFBhjnuxxxAebxjkjPZ6GSiDRpqNHt0fgDOix4b2wPtqm0JEL/bFmkeGdreH?=
 =?us-ascii?Q?ZmLp9KYkXfdQjTlQcqmwlme23I0N0AGU8NITVpYWIE6a+/cc9d747xvXMoOX?=
 =?us-ascii?Q?XSJxEUZmkDLBdoMVTg0bcldblpyoEbcOg3CAzWOPXovyo1Bc4tuBlPGigsyr?=
 =?us-ascii?Q?8kCu8kf3yHzjH++vSHHcM5jnMzwJ+j7P2N7B1+0C86wGNrKGZHdnEHBMrMyK?=
 =?us-ascii?Q?aaHmoCA6fR/vW7AuqnORXZsv/3wqUS+Sln6aPBQSusfE8OGoyXtfHNHzrrIH?=
 =?us-ascii?Q?Y7dumuXAPHsWRb+NZHwNmHGxS60D1MFSNCawAycuDuy39mFcyBjw3oPSLP7x?=
 =?us-ascii?Q?WrX74pcOXaSayG17jxN+b1VVZGu46WXvKvsHACfgyGF4RhLng1cYV+PI339p?=
 =?us-ascii?Q?oVg5+a7nfwLnuGpXGQ2tuGzgvutIYYwnoXcUUP0n4PPxV4DWGfKAdxRwuMBT?=
 =?us-ascii?Q?owLIsXBzc4YArlgGfe/w3iPa4FUfVUDiWC4R+qt2UqygOxY9b8qev9doWjBO?=
 =?us-ascii?Q?IrQVqsLKOQdcfbAy0CI2JA0wO3yhW17x7HdtAnxMo0JZpk1TO8PTTJhmj+9D?=
 =?us-ascii?Q?ssFmw2/Au3GlXiymmnTkUutnueHkuEldwqh19cRsVFP6tAgJn7sEE1STo4Hv?=
 =?us-ascii?Q?QeR1wJVsJrJChNvNrPTs2HEpoEjDootVTwQLEfbplEJq0U8uO9n6ivGMBPmT?=
 =?us-ascii?Q?W1xztABGuVHBPrVg80lpCaH557ucRBPPPyhEk/UV39ikDbfQVId5cbVAuAbL?=
 =?us-ascii?Q?68/bxQxSvG9nPxUqHd+1o9YBfItKnqxQMmcJ6n2Yb9yUy/U7RkjNGFkFCL84?=
 =?us-ascii?Q?f8AI9le3N3DZKzN8zyUCAMeM/PFG+un1ZWn6oje5gPxUi32QWF8B3c5w5r79?=
 =?us-ascii?Q?RubyY0u4W5a/zq1JabqHe8xu5AJqltHMMGZ4JM81xW3rjcgLvoygtYf20zu9?=
 =?us-ascii?Q?y6MyHxYhGUiCh9hyS3jE/K7a2SGzDudzdHgNEidmGYbFsMdr1Vx388EwewsL?=
 =?us-ascii?Q?G7Jz8v9Kp3RHdVI/cDezKDOhyAVzIPSnmzUfG+h7kXsYsM3rsfeOQ+zATQgx?=
 =?us-ascii?Q?Amd87kF2uJvKFlHJ3U/46m2Sa5gtLuTczIBSkfsZxTJ+3NJh1M+M0CsqrbNi?=
 =?us-ascii?Q?XWiJMYNQJVKpMX2tiQc6K/+CrOEIUF++iHgYXIOtv/75G5gogUGyf5olg0lo?=
 =?us-ascii?Q?odMUFmoBF6X4v+gQ8AJvwMBBLOJstXE=3D?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 956e3938-8466-46b0-c40b-08df4acf6156
X-MS-Exchange-CrossTenant-AuthSource: ZQ0PR01MB1111.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2026 08:37:46.2886
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UpZ6beU4n3ah87H41RBoCzWr/vgUDGmYnX4WBg/c6Zte+4PPoLCtbyj/pT6SRa7aHfdwws2CRf5NWcuJUWPX3nrGgGqIEj16VinC8mc89H0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ0PR01MB1048

The JHB100 device-only controllers are connected to a digital PHY
adapter instead of a USB PHY, so they have no reference clock. Only
the "main" and "bus_early" clocks are present.

Allow two clocks for the controllers with the adapter region, keep
requiring all three clocks for the DRD controllers, and add an
example of a device-only controller.

Signed-off-by: Minda Chen <minda.chen@starfivetech.com>
---
 .../bindings/usb/starfive,jhb100-dwc3.yaml    | 22 +++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/starfive,jhb100-dwc3.yaml b/Documentation/devicetree/bindings/usb/starfive,jhb100-dwc3.yaml
index 3ebf39616bd1..9ed439c112c7 100644
--- a/Documentation/devicetree/bindings/usb/starfive,jhb100-dwc3.yaml
+++ b/Documentation/devicetree/bindings/usb/starfive,jhb100-dwc3.yaml
@@ -30,6 +30,10 @@ allOf:
           minItems: 2
         reg-names:
           minItems: 2
+        clocks:
+          maxItems: 2
+        clock-names:
+          maxItems: 2
         dr_mode:
           const: peripheral
     else:
@@ -38,6 +42,10 @@ allOf:
           maxItems: 1
         reg-names:
           maxItems: 1
+        clocks:
+          minItems: 3
+        clock-names:
+          minItems: 3
 
 properties:
   compatible:
@@ -59,12 +67,14 @@ properties:
     maxItems: 1
 
   clocks:
+    minItems: 2
     items:
       - description: USB main enable clk
       - description: DWC3 bus early clock
       - description: DWC3 ref clock
 
   clock-names:
+    minItems: 2
     items:
       - const: main
       - const: bus_early
@@ -95,3 +105,15 @@ examples:
         interrupts = <105>;
         dr_mode = "host";
     };
+  - |
+    usb@10600000 {
+        compatible = "starfive,jhb100-dwc3";
+        reg = <0x10600000 0x10000>, <0x10695800 0x100>;
+        reg-names = "core", "adapter";
+        clocks = <&usbdcrg 30>,
+                 <&usbdcrg 31>;
+        clock-names = "main", "bus_early";
+        resets = <&usbdcrg 12>;
+        interrupts = <106>;
+        dr_mode = "peripheral";
+    };
-- 
2.17.1


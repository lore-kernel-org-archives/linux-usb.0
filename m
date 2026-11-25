Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=139.219.17.114
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795595877;
	b=QhKPyef80ZtRMkB2Wj5LtcqqfoWo4/FC53oOE3G+OLjlvuC1gjjjCMqzNVTDtYuAZovR
	 JhY/gK2Jx6fpWt9Kf1zqqshWbzHOBf97gnWqIwTAOsClgBHuC0x7FCQSatAff6+mCWW8b
	 EJxCEcq5/yFwpXVpfozXLtOl12d6/HG5qXpsUmVBbrLSrSxmcOgHXQ4PwAGW1oY2bArze
	 ACTAlItlayReRMankCHMvwcSJhOzbgR9KpnXOKnzkXfhsfht/YShYYzomOA1RjDgLWyle
	 1YEa5h+rFyIoFxw75cEPzBst4jjcH8Pw5JVlO3G7dScqeGwTYykQ370bF3MKnlujn6w==
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
	bh=ijNZCacA+DsJ2bTiYCRCjMZXpo6i9pbzjBjAHznXs1U=;
	b=aORBBz796tB5PVpXHwMRDz2+b6qXwNV084LhqY2hSGpgBeb2a4JsWmhoWMToENT/wq13
	 ybs9BBd7IMehwkIZ01eAle9ga90x4xTS2COKPyeE3r1LGN3HDDEphaAx47KQkEJGSSJUr
	 ueoVJXKb8SqYOi+cD2xWwHGJW6xfphVSgPBPwGQhxUKi7PDjcxX9H7T1ZJOi/2hoBZDhf
	 5CKtdHhzwY7vA03oBBKy19xq46omvBUa2M7C0YDsswgOJ7X8SLPxLiAXgBLkMMU5V4bow
	 JjeIPMy9vIRpELtM/JiHaNvaAFM/RJ0ty35qY/cKWoBuklsNpZ0QoyNDvSrZjdRRAzQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=starfivetech.com;
	spf=pass smtp.mailfrom=starfivetech.com;
	arc=pass header.oldest-pass=0 smtp.remote-ip=139.219.17.114
Received: from CHN02-BJS-obe.outbound.protection.partner.outlook.cn (mail-bjschn02on2114.outbound.protection.partner.outlook.cn [139.219.17.114])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFBC5606A329;
	Wed, 25 Nov 2026 08:37:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AFBC5606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=J+vJmeMYH8cDfmlwZJ63D17qXgM4OoHzT8R7wWfj39H0m6TgrKuzgopO0wiQyaWM2VR6HBFl2RFuZYY6UcLX95F9rXoRULwikpah5CeuEi0cqxF5ijy7TRkxifBXO6JFMdWOk+QxkFZp6AMg2fKud4XoCJo1zEOc1gRaNow20buk0JeAVKHf9mbCUsoBq4fV4K6fPPV5PQm0RFMrNY8/HMK51volO7lyA6s2Z0E/KOXVNIkKGcOYkwGimFQn7n49MJoy9cZKYIxbL0hqLqvIq71ZNDRY3G6RX3e4/POEcfniOJClM0M/CTgH8IJf1DEUsGtxWOyBDf6z/AeTeP8LpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ijNZCacA+DsJ2bTiYCRCjMZXpo6i9pbzjBjAHznXs1U=;
 b=hpTAF/bX17dfb9q83+2ixFno3xm4W6Mk9njN5IUXuXoiRf2m68a9U+ftNRw7cnsZN07rNluWIbrMiK1tOPjtQ+kbIh1QMgauTDbkUy2S6bEufDoM4Npw6OgMShPZmTzvwET4wKJG7Loe4YMSQtjrjmhe8YEOVpBKhOFu6KK8OgAGAoaLuJhFoVWgq+cUUDt9MQoBSmbmYOMWDftbdkGtVPsMBGi5Ak+xY5JEQYtcPyhCGA4qHpwk6ZpU+ildaxriqwhAj9xQET0d9zoDyLsWu2eHHvyNtT73hzvB5Smp4/xSKMEZ/MHvRzCcsWgInUYdu7eSUecp2+e98XKuYBrEsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from ZQ0PR01MB1111.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:e::7) by ZQ0PR01MB1048.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:d::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.15; Wed, 25 Nov
 2026 08:37:45 +0000
Received: from ZQ0PR01MB1111.CHNPR01.prod.partner.outlook.cn
 ([fe80::d777:e23a:d111:5fa1]) by
 ZQ0PR01MB1111.CHNPR01.prod.partner.outlook.cn ([fe80::d777:e23a:d111:5fa1%4])
 with mapi id 15.21.0639.012; Wed, 25 Nov 2026 08:37:45 +0000
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
Subject: [PATCH v3 1/3] dt-bindings: usb: starfive,jhb100-dwc3: Add adapter register region
Date: Wed, 25 Nov 2026 16:37:34 +0800
Message-Id: <20261125083736.50606-2-minda.chen@starfivetech.com>
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
X-MS-Office365-Filtering-Correlation-Id: ccbdab7c-4850-4109-a2fd-08df4acf60dd
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|1800799024|23010399003|366016|38350700014|10067099003|56012099006|261021123027099003|261021121427099003|261022105027099003|261009223027099003|261102130727099003|261102123227099003|261028144727099003|261026140227099003|261026121527099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	PcQ/APd0Y+zBvwK9Pcyw12JMdpDo4RMpHOrGgzqvbv5r7tcUKFE3fMbmi3nppqh83O94sv92t7Dfa+2GovDv6oDKv9g2WR7QcPEuKh+WX/lKYCBHCEOQQRyF4v6tEYyH7v8bBKugT6c/eOs71lOE1GLBxsgy4eKhgki0nzqhTugUrqI06VK4APbU3EDz0iBqHkI5Z5cRXq5MS4ZhSYTS2opYND5dXiRN54iyYzUmu7ubSWPvWsBYIvT5Xej9uSP47L4dIa02Aj4QaJ/Z+cK6DiaqT9fjpmh4TWIAOMioFBbZwYSOVjCszHNtInzwGQcaq3eriDYzeGK0JyRmJ0q9Qa5YquZ/XKSgIkvOboApHlJol8oYbFACf0YSa9G4qu0FYbr3eAUoQWRam3kcsC+f5AX0W5cqe+/tFsQTNcsfYy8KWHJFnbDGZjD9EmJNaaIYRa0jSuxizf2B2JtGrnSmPtvpCg6RM11K4SxqfjFD6k0YlC6H2KOcW+/kDIHMRryHw/V8M4W8xmAEkR88xkpwbvY/Mu32mDy2OvTO7PaHNq8zlXDYgY7XAi+mdwUrdBqW
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ0PR01MB1111.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(1800799024)(23010399003)(366016)(38350700014)(10067099003)(56012099006)(261021123027099003)(261021121427099003)(261022105027099003)(261009223027099003)(261102130727099003)(261102123227099003)(261028144727099003)(261026140227099003)(261026121527099003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Y8qXP1o0gHfI3oz2440T6UQ7drqkdP+6ZvDPb2aJdGMQC/3qoyhhMU3Ht5bH?=
 =?us-ascii?Q?8vFcBzOZdqzK5/+uwq3pqZw5hoCRd/WA1CsJL+ruT7mAd/MpT8b1f8h7L74u?=
 =?us-ascii?Q?0rrsz6csjGrLGYMhjpdqIQHT9Z5IdImstIpqwUSqxpLeOSTgddsNxO6eBjmC?=
 =?us-ascii?Q?pZLZ0ic19rbBXq21piPrl8hc4180098Vs/DYzJXP4flCqKFy3zUrJErtj8/d?=
 =?us-ascii?Q?Ce9uL70OPlymjTr/94gnxOSRvLUYhd3LRXjEQUgNDxbTwYksYHlRjjrYx6ib?=
 =?us-ascii?Q?Lontx4AKNWT6S0In6/OJP3oz4P/PM8qBkK5LTTyjDgX7pjG2quzRKXs66adH?=
 =?us-ascii?Q?8wtRcw4Ef5XqVKtAgYFGmiO2Qo2KbWn9LeBBhIF/+Uap/P0Po49WOwwhZLEN?=
 =?us-ascii?Q?QGQGv2zSswCKhoT0HP+d4h7Z9EJtzP1NUeX+Vn64arNWh7V3y0iqT15iOxC1?=
 =?us-ascii?Q?7s9pwxEQ/cah+nPVL/ybZ0Ty5q73D1YnE5URRUeR1m09bvUyFnHWH5VZDAZq?=
 =?us-ascii?Q?nYxu5aXH4QKmM2g4xXK2cncrfZ8sM6kIDEpcQa4TGPewJIHd6AFmTlv98KUD?=
 =?us-ascii?Q?g6PBgaMUxr5DAJNNCIvt3m9cMqejuoVQkWoSXKX1vXCsULgpY8lKDA2rgz1t?=
 =?us-ascii?Q?BP1AzcMyxpjllP6YpuGWR2AncKyf6LUVgidB/ZHIEZ4D1rZimxrDF+dL6tTM?=
 =?us-ascii?Q?H0mghJOKaafZLKWLpi8GqWsI6M/+4Ut+zqPjSPLqRPawwvglti1wtUc6L5r/?=
 =?us-ascii?Q?+HBeFAHmS6LUwuXpMm5DmfSHgXnX0GoKRl5JO4Akfyt395+J04VXtpD98BfT?=
 =?us-ascii?Q?v55J9egjWpWaEEEWf8ujaqQ+iWQdsqkiiwM+KfV2kRp2KglzqnFjWTzgjdrC?=
 =?us-ascii?Q?yZ0lR3jeCBMDhF3Isox0x1QxoGwpCKmJYfVqFJgr+ihVYC8L9Y6iyfTVdqXp?=
 =?us-ascii?Q?oLJ/ZeQVOx4efBA39kY55cdDkuQtes6m2+RmRcyRVY54INx72bEAwogkuwo3?=
 =?us-ascii?Q?pMk3e01mYi+QxleSFU75pyLZZlPHzLr/LyeR30s8AOZ2XTOzy+7ukLJsT5wC?=
 =?us-ascii?Q?e4+91dDdnqRqNlbE3QUI15ZFnO9XvasjQKEXqlllyKRwtLzLCNxjhpXhwVuP?=
 =?us-ascii?Q?PkYfnbfF2caob63XaRYkPH9fOK55vqRKJxLfuBOmzEUzwyL9Ynxitj6CHY6d?=
 =?us-ascii?Q?sW9eAxvNPXBDHfCC91anzJoOsO8rxRfIrd8j2KKujhp13M1Gsuvgq1Fjfd5/?=
 =?us-ascii?Q?7aTuGWUuNQevkcqyeAUw20Dgg44VAeSTLFQXTJrKoO7RtPZGO2iwVyztRNSE?=
 =?us-ascii?Q?qRiOIwO+HuEa3h7VHgAZMhy6G3YnJFXNx9e0xFTgFI9vml7V7TL+LUzamwXO?=
 =?us-ascii?Q?rGfzePxn+B8Uvsk6ymcZUsacImnl81B08bxPH3PBQd6xTRUk4iJR64LHJd/M?=
 =?us-ascii?Q?QwzATOQTlAuqugMOAKLWQHUDB2pAXxqZTqAAw/J/cF9HkGjC+aBLZu/D1rYt?=
 =?us-ascii?Q?W3ByBkEmkjhhyViT44Y0vceLxK6moFPmy/a3xQPWaWjn4XXPb67bOVr6ELq8?=
 =?us-ascii?Q?81lpK1rYSqrDl1Mb1npo1CfEHPMGKcXL3+l0ZLBnkoMGa1bo93VE5UBzRulw?=
 =?us-ascii?Q?AzSOT+BVgVjGDuEXQdHMsb+rHcgVIYk+hSQC/MPulLa7c3+/RcOJVk/019QG?=
 =?us-ascii?Q?22n+DmZIgFdqgcVpM9UsXqDCDVa3KJi0MnnpN7ZcQl0Y75XLiRZ6AraTQmu5?=
 =?us-ascii?Q?PfSJFprEHf+rMbQUVRRWID1j7Dc9Gg8=3D?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ccbdab7c-4850-4109-a2fd-08df4acf60dd
X-MS-Exchange-CrossTenant-AuthSource: ZQ0PR01MB1111.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2026 08:37:45.5055
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XfIUCIxtq3QeB1OWpcYotrncC7bMpgXia96Bt+DfBpYKc1o1nFG+UG7tQr0VH8MwJEgUMxxhOlrEx/YXn7PDKUdSxczRyh2vj1CmW52x9lQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ0PR01MB1048

Besides the DRD controllers, the JHB100 BMC SoC has DWC3 device-only
controllers which are not connected to a USB PHY. Each of them is
connected through a PHY adapter to a port of an xHCI controller that
is exported to the server host over PCIe. The adapter has its own
register region that software has to program.

Describe the adapter register region as an optional second "reg"
entry and add "reg-names". The DRD controllers keep a single
register region.

The adapter is only present on the device-only controllers, so
restrict dr_mode to "peripheral" when the adapter region is described.

Signed-off-by: Minda Chen <minda.chen@starfivetech.com>
---
 .../bindings/usb/starfive,jhb100-dwc3.yaml    | 37 ++++++++++++++++++-
 1 file changed, 35 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/usb/starfive,jhb100-dwc3.yaml b/Documentation/devicetree/bindings/usb/starfive,jhb100-dwc3.yaml
index fbabe99e9d5c..3ebf39616bd1 100644
--- a/Documentation/devicetree/bindings/usb/starfive,jhb100-dwc3.yaml
+++ b/Documentation/devicetree/bindings/usb/starfive,jhb100-dwc3.yaml
@@ -10,17 +10,50 @@ maintainers:
   - Minda Chen <minda.chen@starfivetech.com>
 
 description:
-  The USB DRD controller on JHB100 BMC SoC.
+  The USB DRD controllers and the USB device-only controllers on the
+  JHB100 BMC SoC. The device-only controllers are not connected to a USB
+  PHY. Each one is connected through a PHY adapter to an xHCI port that
+  is exported to the server host.
 
 allOf:
   - $ref: snps,dwc3-common.yaml#
+  - if:
+      required:
+        - reg-names
+      properties:
+        reg-names:
+          contains:
+            const: adapter
+    then:
+      properties:
+        reg:
+          minItems: 2
+        reg-names:
+          minItems: 2
+        dr_mode:
+          const: peripheral
+    else:
+      properties:
+        reg:
+          maxItems: 1
+        reg-names:
+          maxItems: 1
 
 properties:
   compatible:
     const: starfive,jhb100-dwc3
 
   reg:
-    maxItems: 1
+    minItems: 1
+    items:
+      - description: DWC3 core registers
+      - description: DWC3 device controller PHY adapter registers
+
+  reg-names:
+    minItems: 1
+    items:
+      - const: core
+      - const: adapter
 
   interrupts:
     maxItems: 1
-- 
2.17.1


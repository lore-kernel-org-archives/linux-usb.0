Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.193.51
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795102891;
	b=j1xgcnlW+Ybd95jEcKa8UciUG5vKzlqrz+x8AUmyOzMsBhCtiJRghn4pbZxqTeyq19vv
	 +m0n7spni4YrKY1eFSX4CU3BKXZQ5T8s59IbKtdcI71t6fZ7l3DowucDVNwbkKxmXUGN0
	 wRGu38SGatyBWaBHRRQz0NGEtqTuZJL9sV+Zu6s5xJPWC5s2JHffZMG2KrQRo3CrA7feJ
	 uRC9x+c6+6PwsxDPHyZ328SQlpvccBV8HqDVy+rlN+WH4nk4rfQq+r39uzn9JnSuFbBRX
	 l51CrLEmvuplX5t9a1dIXMAGfi5iPJmTI1vPUoI9FGeLrXrPJFbtxH8ith3tRSOlXXg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795102891;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 X-MS-Exchange-Authentication-Results:Received-SPF:Received:Received:
	 Received:Received:From:To:CC:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:X-Developer-Signature:
	 X-Developer-Key:Content-Transfer-Encoding:Content-Type:
	 X-EOPAttributedMessage:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-Id:
	 X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=WxwFL0Eyh5oo1wAKff53K+/44KaKdONJMPKd0rVab2Q=;
	b=liC/9SX1Jkf2rKkmBr9AXz+ELbl13QbNvz+Df0G8qSwtTEOZNcTI3gnj/nh54O8DM+/v
	 BiTr1JZkEaiv2JNaaLh09ZPoPRBqx5PcWcx4NFHYs808Y8rvLigSB3yKTUdk7bqOETjEY
	 M3CSl4Tm9lxkOQWyjg6fIGf/9nMIOxnGDlQBAtY5Jlm5ANkNEqNoys1lZwu3XHbRjvcfl
	 tbH6O1HRs5Upr8IY73leFVWDhZa9gMFuc9FqUA4pIZRAZS7x5UKwKABf/TtGvalzPtePR
	 QPnt5N1xJH1X5jO7bETwoLeWnfB65qhfBERXMS8l86Zh+sM2QTBHeC88v0rIl4uafjQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=ZMdsRpqy;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.193.51
Received: from CH1PR05CU001.outbound.protection.outlook.com (mail-northcentralusazon11010051.outbound.protection.outlook.com [52.101.193.51])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 655FC606B30C;
	Thu, 19 Nov 2026 15:41:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 655FC606B30C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=ZMdsRpqy
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=r7eVRBjkN/+gOF5r78tvSVrzYYDL6tr52KfXHK6SLWSraKlvREwVIsvGGbuG6CZfW7PAbg1pRmxWZkzfS6gX/uX5qYSokPq9mBJFL8uz3L289RfO2MPnpmw6BhwGUx9h9PSHteiHM3jS0FbcAK9IPRdM6zv5vptbrTzgL+z+UeyWEMqF35hyDKUJ3dtoFYceAt2KSrroE9HKO9+6+EcjvKb9gvOvfqXF66Ieqsh+RvIq2uOkFVqGPLq+YFASIhLE8R8ppVI+M5PP/UgSglq2flLzwxkii+SMd9wvrSHrW926L22USWOi4TUrWH3BirulsSPePTAacdacrY/05639OQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WxwFL0Eyh5oo1wAKff53K+/44KaKdONJMPKd0rVab2Q=;
 b=LXRX4Sv49Ur26b7jxRDGKktKHAtkmbwfYRvLZhoFIMYPJTNnHLdYcFE9RkN59YUTfGfD/YKqBpXzv3umhvuCjlZt4Uqs/0LRVlIS9tzOqtkETLgum8wDXKAASfYBjQ/la+73PqlpNycdgN1DpvkjYjXqW2kD8VAHoUD6lojTMn94P12c5A2lc3WSIa062kwvv6bAeMTFt7qGnmh2qYBj/GrhWuVdzxTiXeGj4kpqjsI47tpQ5t8fnx90ExbhjAmBB5GiuwSKue6DJo1knNhESqD29xNF7MikMJrS9gYa4faC+XR+/sEQ39Jk6wQBxz6+u2XW2QTB9bN49aPOk0TaOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WxwFL0Eyh5oo1wAKff53K+/44KaKdONJMPKd0rVab2Q=;
 b=ZMdsRpqyFpb+JBILxGebXnySQbgZenBT9hvAFmRFu2aVKWQp4lfiYdpCf9pWTsvrpz8kYwTJ1+SDgjecDBFlLlVpsCJ8B8vBH6ORzjuKuTXibzI2Si/VQ6Z7ePqUS7pzWb8pMy/SWXOcswRPGKu7533b0UZRxCqXGDjEYCjjVfo=
Received: from BN0PR04CA0209.namprd04.prod.outlook.com (2603:10b6:408:e9::34)
 by PH0PR12MB999111.namprd12.prod.outlook.com (2603:10b6:510:38d::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Thu, 19 Nov
 2026 15:41:27 +0000
Received: from BN2PEPF0000A890.namprd04.prod.outlook.com
 (2603:10b6:408:e9:cafe::47) by BN0PR04CA0209.outlook.office365.com
 (2603:10b6:408:e9::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.13 via Frontend Transport; Thu,
 19 Nov 2026 15:41:26 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN2PEPF0000A890.mail.protection.outlook.com (10.167.248.182) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.639.5 via Frontend Transport; Thu, 19 Nov 2026 15:41:26 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Thu, 19 Nov
 2026 09:41:02 -0600
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Thu, 19 Nov
 2026 09:41:01 -0600
Received: from localhost (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57 via Frontend
 Transport; Thu, 19 Nov 2026 09:41:00 -0600
From: Michal Simek <michal.simek@amd.com>
To: <linux-kernel@vger.kernel.org>, <monstr@monstr.eu>,
	<michal.simek@amd.com>, <git@amd.com>
CC: Conor Dooley <conor+dt@kernel.org>, Greg Kroah-Hartman
	<gregkh@linuxfoundation.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, "Rob
 Herring" <robh@kernel.org>, Shyam Pandey <radhey.shyam.pandey@amd.com>, "open
 list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
	<devicetree@vger.kernel.org>, "open list:USB SUBSYSTEM"
	<linux-usb@vger.kernel.org>
Subject: [PATCH 1/3] dt-bindings: usb: microchip,usb5744: Allow post-init-providers
Date: Thu, 19 Nov 2026 16:40:42 +0100
Message-ID: <3ba97695bbcf616492f2dc4aea4f72373c984ae0.1795102838.git.michal.simek@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1795102838.git.michal.simek@amd.com>
References: <cover.1795102838.git.michal.simek@amd.com>
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=959; i=michal.simek@amd.com; h=from:subject:message-id; bh=WfGZakO4wYeeUjKwKXbxBQiQ3IcySPiDD+2uYdSB4hs=; b=owGbwMvMwCG2mv3fB7+vgl8ZT6slMWT9l2jxZVxaoFVyU0fvrI3vrSvSt5VzrRbfOHTLdZL8L r//bHVHOkpZGMQ4GGTFFFmmM+k4rPl2banY8sh8mDmsTCBDGLg4BWAiUzQZGRo/rLpss2DCpB7Z t3a10/6bzu5cIPs6LWHZ8drDj/bIV9Qw/BUq38umbPZhkXuw+9yMDO/oadKdgg6C/28K/NXln1T ygA0A
X-Developer-Key: i=michal.simek@amd.com; a=openpgp; fpr=67350C9BF5CCEE9B5364356A377C7F21FE3D1F91
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF0000A890:EE_|PH0PR12MB999111:EE_
X-MS-Office365-Filtering-Correlation-Id: 9c57296a-0dd2-4987-1091-08df46539284
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700016|82310400026|23010399003|376014|22082099003|18002099003|6133799003|3023799007|261009223027099003|11063799006|56012099006|261026121527099003|261102123227099003|261021121427099003|261021123027099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	C0ATuT9fYMFSnML3bda/kgETmpVBqnfz4Fzpdji0s5leMcAbHXKcE4+sHUmgQosAYCG/u7pWGMQXYAodSLI/A5VyAMODCFaQFAS9VazlCYoRUMHMTQURV6Vc3WuIVbScn9D0exqKJxfh3wAUIEo/e+ql2vGLjwssGocsvR3aecwycgaJC+7LNcXg+LCflIxRT1gNQT08qMcMeye25Sy8BmSvLgm5ZUlBeAqEvC7k2tVbnhkYBL+hrD7SFtY1V1PnmjTpDLuenLpROhOPOoLQnnBzjDFnDjp0Lw09Nza8tLc6r9ehDR1CzfenQLFBAtDDut4dwqZsBxsp24tYiD7/w1EoKX1ev/tJxDv+27jMRTJ1v6oAKFbqJkJAkNV1RoNYsc1KYdo8B/sOaejRKh6v79cDuEfi4rMc0ezoV/cwhYnER6w4w80JW/xzrhTsVjZiX1WuWksK42jplbQLBP9qdqyoRZwbwncZ9EDbY+uLfbvN6rMkrJ9uIx1y3TPyDuF6WkRBd/MwJT+RlEQB8hUKpyRflFm8qvdJ79P2dlBQ4IORM/+pJEpK351g63E/6fdAQ6M7taMk8C34iMPMZwSlGFwsDKRbjsg4eCVbpGU4eHZd1pdXj9jFsTxz81s3MkYV6sZtr70U+R0ZiKDNpraeSWNhUs3IEjzNyN8wcuWV3+vYuweisfx1+Lsds9YByI4KX+kbvjDlgiEhv8J0wS9YgA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700016)(82310400026)(23010399003)(376014)(22082099003)(18002099003)(6133799003)(3023799007)(261009223027099003)(11063799006)(56012099006)(261026121527099003)(261102123227099003)(261021121427099003)(261021123027099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	VsiP1n75XtNiqLJNSs14o8xvT8m/yWhMgvAANECaaQ897o/frzzlrzbhWLMPRAtP8+5J05vVaCy6nG4TAcPOqDtPP4No8ChUUEvioA2MBJSYOO/0tLTgm/apvoFiWcPAJ22UnWhtkfcfC7tnE07PsQtCz78oeLxuu0nZpgwBKk3kYVCswmeXkdnnqmC70DY3M/m+qLM7TURhiNUgKI6mMjoTVTAFW6mYJepgvUtaJUX+chzOxCaN2joIpV7RziwU4eATDxDFCyEFZIQ39vOpF2qJ2cWENMx9f+HKYgsE28B4QJA2sBoMz4qBRfrSPhoiJQCEmloSOG0H0juyJIpMbvjjcntoCX2hbPK6Lo7kws0k/SutOOnU9BaJiNsKfzY3XkUO+whjkkiIls85JxEc/j+Uq5S81KZ09Go0itPH1RyLmXBaIjr0SlVfs9xrkZUL
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2026 15:41:26.3839
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c57296a-0dd2-4987-1091-08df46539284
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF0000A890.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB999111

The two peer hub nodes share one reset provider. Either peer can
mark that provider as not required for its own initialization.

Signed-off-by: Michal Simek <michal.simek@amd.com>
---

 Documentation/devicetree/bindings/usb/microchip,usb5744.yaml | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/usb/microchip,usb5744.yaml b/Documentation/devicetree/bindings/usb/microchip,usb5744.yaml
index c68c04da3399..d0f2e5e20197 100644
--- a/Documentation/devicetree/bindings/usb/microchip,usb5744.yaml
+++ b/Documentation/devicetree/bindings/usb/microchip,usb5744.yaml
@@ -57,6 +57,7 @@ required:
   - reg
 
 allOf:
+  - $ref: /schemas/post-init-providers.yaml#
   - if:
       properties:
         compatible:
@@ -72,7 +73,7 @@ allOf:
     else:
       $ref: /schemas/usb/usb-device.yaml
 
-additionalProperties: false
+unevaluatedProperties: false
 
 examples:
   - |
-- 
2.43.0


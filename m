Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013015.outbound.protection.outlook.com [52.101.72.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75F1D3FFABF;
	Tue, 25 Aug 2026 12:59:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787662779; cv=fail; b=Q1VmdFiHfbPLWdnvOtU4R7nOTBoBJFVrvc+SdA72nHsD4hoOzr0OH/ULbCRBSenQnHamDbh+WZQisqJMY7znqej06rybY0BsAu/GIygmWXfytViVoCPvbAp2GTVBpzwLrJSO+YXBcjwXy8WdWN5Xi4jrsKv4U6b43B4M+vGNmGk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787662779; c=relaxed/simple;
	bh=KZvH7b4hhV6Fe/Oq/pPWQPFFa+evXT3PlassIuTTh2k=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type:To:CC; b=GudhIJqlW5N50XJFPvz5hEZy7ATGExj2a48Pon5aXn6InSLAgAaUbpsccnzfG+syZSMkA5v+Pf1/Xxxj0VGoLB+PZ8nL48auEBFia6/RWdNjYaX5C6RhAzghmZQDb37zudgPwn5C/0LGd/6e/4X6zAKGGKVM9zmJCw+qU81nAdY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=OkKB8iHc; arc=fail smtp.client-ip=52.101.72.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="OkKB8iHc"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ivfTgqb4eWWB5gfUEJQpQRffxzEnmxPRbtStGrcS2lOlV150Mi+ic7fs1LqiEwVur09QHGm8XxFQGFOf2ygCP8cEjvAtdcTnk6g3f3bDAj3eZYclGw1O/q0EHF8thwaok1P7BVjNKeT3Q+U1GlSWwLSh3gwMrUKFPoTai2PR/STRHtCsv/whMmr+mvPQ9OaNqSPYBZ5UQANeI4Z8ozwnUwkAdYNhxmDcKrKlcA26dGLx/b/iAnIR/0m8aK6Vj5wgn9/Huzny+406VsiKAe8h1ZFguIQi2L/GZiPJyoH/lyIxxHOo/BgoKRtBj254DIn8VO5aiL11vay4lX2ZCdKMkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RWRv8KcyaF+jchRscDw1c+GqjW8zezdhkxHEzRljObI=;
 b=iQA6giZqotweTABgVtJxaJWF5qe1CQ+sMay2KbbnIdaXYKqFWXSmknU438iQMfzmfwaVp25Dr7ZNupyhoXSdRbrSAfOltWNE17d9cPGRC2BaK7CTjsAE994FPsHcv9xXu1AABBUVFTCZzzT4tpyBplGhpaAsyoWnRa70cfm0IZ+fT+NcCO+kvQ3dJFNMyrGm1PkqnFEvHnl3nZplHQYDeLcqoDEseGEZ4A+n/vJnP9vxi9SBaC68TzE+IQtm8LnzJ4YUTe7BgpWAmR5A/CrJ8VXFic4q3tU+wtWdP6m+oq81sVfJkTTEswgKa3GKM+SJAp0z9DDGHoFLdq60ToN86Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RWRv8KcyaF+jchRscDw1c+GqjW8zezdhkxHEzRljObI=;
 b=OkKB8iHc0cYQiO35wm2QHCVCwp5Qb0TzOlz7gi7q9vHN6oTdda/YRrXwZfeRYjMLXskaTTP/dCKIFFinng9zi7Yow3b6hLrUQG4ssqqzaZ5HcninVeaWQ79Ppm5ELOdqQztF6dmLmgZiya/wEYDgtZ+QjuZRcGi5CR1VCo4zv33WSxaPmLYKajB+17JgkpVo07pX6WX9LemwpkiD9CnyBLEY4Wh55Ygmaw7vPCeHi7fVbkQ5BYPjP0yklDXXHnr4te5gphy0JJ2OGieuwkTv63LWTQZmewwYbd6yJT0euC7g/+YS/zmeNv6MtP/8trgWs4kDK4hw5vTTOMvfo7xtQg==
Received: from AS4P192CA0009.EURP192.PROD.OUTLOOK.COM (2603:10a6:20b:5da::16)
 by PAVPR10MB7491.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:2f6::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.12; Tue, 25 Aug
 2026 12:59:29 +0000
Received: from DU6PEPF0000A7DF.eurprd02.prod.outlook.com
 (2603:10a6:20b:5da::4) by AS4P192CA0009.outlook.office365.com
 (2603:10a6:20b:5da::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.339.12 via Frontend Transport; Tue,
 25 Aug 2026 12:59:29 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.60)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 DU6PEPF0000A7DF.mail.protection.outlook.com (10.167.8.36) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.360.3 via Frontend Transport; Tue, 25 Aug 2026 12:59:28 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Tue, 25 Aug
 2026 15:04:47 +0200
Received: from localhost (10.252.23.181) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Tue, 25 Aug
 2026 14:59:27 +0200
From: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
Subject: [PATCH 0/2] usb: gpio-sbu-mux: add FUSB340 and enable option for
 orientation
Date: Tue, 25 Aug 2026 14:54:22 +0200
Message-ID: <20260825-usb-fusb340-v1-v1-0-2191179b0661@foss.st.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAH6QjWoC/yXMyw5AQAyF4VeRrjWpcYl4FbFgdKgFMkUk4t0NN
 if5Fue/QNkLK1TRBZ4PUVnmgCSOwI7tPDBKHwyGTEGlyXHXDl2YNCM8EnRUUJu7MutTC+G0enZ
 yfsG6+a17N7Hd3grc9wMZvuMjcgAAAA==
X-Change-ID: 20260825-usb-fusb340-v1-f060a5f84d3c
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, "Heikki
 Krogerus" <heikki.krogerus@linux.intel.com>
CC: Marek Vasut <marex@nabladev.com>, <linux-usb@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-stm32@st-md-mailman.stormreply.com>, Fabrice Gasnier
	<fabrice.gasnier@foss.st.com>
X-Mailer: b4 0.16.0
X-ClientProxiedBy: ENXCAS1NODE2.st.com (10.75.128.138) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU6PEPF0000A7DF:EE_|PAVPR10MB7491:EE_
X-MS-Office365-Filtering-Correlation-Id: 68046750-a2b9-43fe-97f9-08df02a8b2d0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700016|82310400026|7416014|376014|23010399003|56012099006|10067099003|18002099003|11063799006;
X-Microsoft-Antispam-Message-Info:
	JCZLsQJ8ON9hR7WWrKfaJgNkMijMHNTJvihFi2aJDyEqrIJvAkqrNPRfUpRk6YA+7NN27PbSSO1+DLisoXRfIe28f1mzJwVKG6ifJmEdJXjOBWNrbgEyOHmxItophUHoHy2nreJCk0EtfzAHFlUIy+w3iH3DlkOdtwtNE0MUYdSal+QG/+Bu1vOLIB3S2xR7/dKhvpWZHjG9ILMPVloE6Bpn1i51Kwai8dgbBuScdVuqPWMDjW9ozngWoY3/LSuVkRkSpOaDBktkptzTVJLy5uWyE/r53IRJHmqfeu5kBravELfjd+bV/WHvaImAPO49rWM2OCFA3FruT0qD4nLHbCA4PaFk5luw6fC7U71DtB5lWYI5STIC2bti9DJC9jvrj5il9a+UzPgiUiKRpuidApHE4HQp8Jd2eljQ0U3sij1R7sfo1+ItLhgPQSF7UlG1WogI3xXDcl/ZzyGd//QV+Qe2hJZD/+vx21vCSgdwAk7j15lDA/dEjUsEvj+FYctoVbwdQtQK0epAgkv3iHaUShLELa/vfq1xAq3uhkI3RDqitEyeWJHBrJOnyUH7x2oXiMbiKeEECvYMGkE2AZ0WKsOYskAL9UmiQydJcW9C95E3yEt4puUOQbPIyaB6HCtVUfl0+YVIkcoQZp2rUcARsKc9PL/CTx2GLnuBTCWSbSiKVmUTkD375ohdo9bAMLqgELf9+s9HzFESuiC/d4h6lA==
X-Forefront-Antispam-Report:
	CIP:164.130.1.60;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700016)(82310400026)(7416014)(376014)(23010399003)(56012099006)(10067099003)(18002099003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	TK/VPvOnl744xadI503Hy1PEJMiMvuWuLqaLqM5V7mUslpBqhHCn17L2nZLtOFI3FZG6U1V/Vp46LTC6S8ksn5ea0kVTMBrEA5xDXTLkyQzWdufEkQnEtdl9WX3Xm3aRaHor9EVEHIaVKIwH9hYV9qKtaJCnyxF0M9GusskS4OGz9DuloPrEGHXibULoyUTE8VxO5nRDkrnmyXE4IfLncSzjlqyrF7/DUsbgj4sKNhLqnZGALTATs8phklJcninbpVeHfij/vI7xTxB9OUoI87ZB7iLl0NoAPfgO7SKxeuM/ODmQCDwBfd3IvvWf/pjXRDGMzL5n9LOEHsP74cZRnAJprz+rS7XNor0bK0+gG83DZzq3jMjx/zGq3Czj65M7+PDGLlvLs7BJyAEYw+VwyUOg3VMeaJmwttI886nFyc88glu/fVq1ZQb6OwEvabcQ
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2026 12:59:28.6482
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 68046750-a2b9-43fe-97f9-08df02a8b2d0
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.60];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DU6PEPF0000A7DF.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR10MB7491

Add a new compatible for FUSB340. Also mange the enable GPIO, when used as
orientation-switch only.
It is used on STM32MP25 DK boards, as orientation-switch only for
USB SuperSpeed lines on the Type-C connector, the enable GPIO being
connected to the SoC.

- - - - SoC - - - - - - - - - - board - - - - -
                        |                 USB-C
+------+  +----------+  |                   +-+
|      |--|  USB2PHY |<-----------------HS->|*|
|      |--|    HS    |<-----------------HS->|*|
|      |  +----------+  |                   | |
|      |                |    ________       | |
+ dwc3 |  +----------+  |   /        |<-SS->|*|
|      |  |          |<--->/         |<-SS->|*|
|      |--| ComboPHY |<--->  FUSB340 |      | |
|      |  |    SS    |  |  \  __     |<-SS->|*|
+------+  +----------+  |   \_en__sw_|<-SS->|*|
                        |     ^   ^         | |
          +----------+  |     |   |         ...
          [   GPIO   ]--------+   |
          [   GPIO   ]------------+
          +----------+  |
- - - - - - - - - - - - - - - - - - - - - - --

This is a subset of STM32MP25 Type-C support [1].

[1] https://lore.kernel.org/all/20260821-ucpd-host-fusb340-v7-2-rfc-v1-0-c5e27cbc0795@foss.st.com/

---
Fabrice Gasnier (2):
      dt-bindings: usb: gpio-sbu-mux: Add compatible for FUSB340
      usb: typec: mux: gpio-sbu: enable when only used for orientation

 Documentation/devicetree/bindings/usb/gpio-sbu-mux.yaml | 1 +
 drivers/usb/typec/mux/gpio-sbu-mux.c                    | 7 +++++++
 2 files changed, 8 insertions(+)
---
base-commit: 8d3ae59288f1e7d58d76558a6ee96d533bc5019f
change-id: 20260825-usb-fusb340-v1-f060a5f84d3c

Best regards,
--  
Fabrice Gasnier <fabrice.gasnier@foss.st.com>


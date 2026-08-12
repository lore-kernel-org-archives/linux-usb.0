Received: from BL0PR03CU003.outbound.protection.outlook.com (mail-eastusazon11012046.outbound.protection.outlook.com [52.101.53.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E9C538D3FE;
	Wed, 12 Aug 2026 16:15:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.53.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786551336; cv=fail; b=JybLMyreba4Jnw6o5HEgM51IlFC/MeUE8gxTClWLW9reWjnlps2jH1RhQnkPf7JXXbryg4g38QWkSFXrEuW1MaHWTyjMg5e/9A6EDyZmvMuicn2iErYmVYNc+2hy8Tyesz/KhzbWUfAwX1wpwEWHcLqMGyjnsEEDePT0r0+yUdY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786551336; c=relaxed/simple;
	bh=CrY/nRmzwHYdPQxCwkow/9tosC77D5Tjn3/Mj/RcgQA=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=HzePrpZExVcI06R4J/ymtVaBoyigaZi9LocS1esTgu/cnVAUh/0gi9yplHc8fiYMBf6B6LLL6MUmyTMo8cMBWSvu+0oS2sOTTCMiOkcoCDuWDW0vqrzZavskBJtQquzUowpdq2APSceTdm0JMpQwxfxpAmV0NFAp9/f9jYMJOt8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=Qcl66oeZ; arc=fail smtp.client-ip=52.101.53.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="Qcl66oeZ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bYH9K879/+CrVXbpEsQARh8+j7GG+KGnqCeURpqxLd6Yuxtu+Qhkhz//3UcupvjeeSttqX4jaZmM3YIosmvq98cJO2oNSAUZbavj2WMEXwS482sLedD2Zl2EL4wFQd47eh1QgyUguQCyzD7u0mkN8Zo+QDC47i5iZK4zuBS5sSkjaSgBFNH3iODzsEJ8A8CCS3jcYlg2QwM+RHZc05gMIfv9WWEv4epUhAmwy/kIN4zyoTgmdp/+H01VLcWDf8e5FvKCxPKMWUZg29m2tN324YqbIFQfJNvSjx7pBkLOrNzdOzNXAs0k0HrqmbDHU+hZs1EF41PP2RM52Q5+8eZEbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ry9bfkiOU2xUomUJyMhJYZc5RR8CWyTJ9CaVn905xXo=;
 b=uAawichWqCs11FIrjxIsTBOngOimyXEtrUkJidHp4byvPlmkXcPiS8ZvfzyI30W8qwBeoKwOkVyrOs/pETwyRT3YHLpBvhFjSGIbf1Foy3AWUcPtZZA/yYJFlyb0JoseEXbaeooze2QxWpJNTWh4AphW/vpAtFr8mFXpqYwn5GWXMCrd4G1m0L0FYqprkEVZBx110vsGbRrXGj5z108eRgSLzwq4jnKRrlESOy6QYnSZ+6cau31Mw0IRGZ16B8d7w14vXubQJnIa/hQghsILIqwMtwisEw8MkRWowfqv0Mpez1FI2eIbtGXRQQZHgH7ZZjTpvSyiu4tN5AIfFD+Ftw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linux.intel.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ry9bfkiOU2xUomUJyMhJYZc5RR8CWyTJ9CaVn905xXo=;
 b=Qcl66oeZePe5aEsipNoZUVA3+REiE/u80wXCRR7CebGE+bR9za4Qn9eJQZzWSLTMnQxVJLQZYBANMgdI6OeEQTKJpVGeJuDVi9o/D69RQjfqba8rgzUR9+58Pf3syP6u8oNCXQVaNKylNlZUhezova4Yv70tyRRKVKjENUWuvLc=
Received: from MN2PR08CA0022.namprd08.prod.outlook.com (2603:10b6:208:239::27)
 by PH0PR12MB5605.namprd12.prod.outlook.com (2603:10b6:510:129::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.12; Wed, 12 Aug
 2026 16:15:24 +0000
Received: from BL6PEPF00020E64.namprd04.prod.outlook.com
 (2603:10b6:208:239:cafe::40) by MN2PR08CA0022.outlook.office365.com
 (2603:10b6:208:239::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.315.13 via Frontend Transport; Wed,
 12 Aug 2026 16:15:24 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 BL6PEPF00020E64.mail.protection.outlook.com (10.167.249.25) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.315.6 via Frontend Transport; Wed, 12 Aug 2026 16:15:23 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 12 Aug
 2026 11:15:10 -0500
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 12 Aug
 2026 11:15:09 -0500
Received: from xhdradheys41.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.45 via Frontend
 Transport; Wed, 12 Aug 2026 11:15:08 -0500
From: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
To: <heikki.krogerus@linux.intel.com>, <gregkh@linuxfoundation.org>
CC: <linux-usb@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<git@amd.com>, Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
Subject: [PATCH v3 0/2] usb: typec: tipd: fix uninitialized typec_partner_desc on stack
Date: Wed, 12 Aug 2026 21:44:52 +0530
Message-ID: <20260812161454.149606-1-radhey.shyam.pandey@amd.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF00020E64:EE_|PH0PR12MB5605:EE_
X-MS-Office365-Filtering-Correlation-Id: 867d3b03-3fd0-4bab-403c-08def88ce9b9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|23010399003|1800799024|36860700016|5023799004|11063799006|56012099006|10067099003|6133799003|18002099003;
X-Microsoft-Antispam-Message-Info:
	+qHYLCLSdeFC+4ISb4oGjdoCNPpS8VS4oUOTwuDhUhnPJ/yiUhwzOHTVdsIc82k3vXxRCDk7H1Dx0+aVBnTNqCotYk/WGmvpUZeqQjRZJabWLhGPM+EtJouscD+c/m9zlXPxwCrQOsD2b3z1dEDEQRYKJ5hylBJmljHmy1ZKy096lL1ynwMAWU8E8RTBodNIsB1iTdJLCXWmu6iE5bapZSrPJd2g/0DA2rAhIfnj9soWJmuAEJAJNtQL9NFn/NJ8mDMLz+eSu6u+0/yOrRQK3uGL8r39UdbE6iQJEzyaXYawzNkDGb2w080o0bGtSAF/jlwnEnno+oh/oq9PMidPId9WS0Hdbj0r3o9naxTuq7Gaw6Ofq3tHgwkygwLFgJn+l4jU6aQK6Zn4rEFUIxsfh1ia1sy1w1BU9bTQv/gJody8K5UFbVTB7EkeoQCV95E/zeDuDSr67AoeDFMqIij0bwZpxLInV0YwS1qw/AarU7PgQxss2zwAenWJ/zBG7efd4A52FvVuFGhFW3w/klc3Shmsm1PrIs8VJBRT1xvBdhoclCleek3u+Cf26WERQZbU
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(23010399003)(1800799024)(36860700016)(5023799004)(11063799006)(56012099006)(10067099003)(6133799003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	BmC2pMx83iwk2NMxSeQjvMkTZCRkBAZ59yA6t2zW2wmR9g96lNuR5ynTC7p2HUhu2+jr9y2wOPs+9Fjdbh2E9y0pwtzXqMRANFn8mOSom0eUnELkfyJ4bYQnanV2M3PfAKNuTq1TJ+glENkA8x96Y4re63gzc1MZiW8Nl/RcYFeuctAWTg+3Eh6B4DJPN/KAoDDczzW2VYeJ/4FY32Xi7kVJybJGmVWCiIhMN8D8S2rjQcxC33H2ZOzE5DxTVDr65+ptMTamvTumKxGxuUelxmESIDWuXD8xO/zZEwLS9vHhRIAWOH7ynKTUoXgJe6GQqVCDMgv8dPP/PoIJOKnR7GsX3mwISVPUQH03RlEvvbpAHb+HjoInVuvsTdOISVxvyyXpBdfSej7KwruQsR/5GAwAezbvquUBM4CyyGE+9L8AB9GKiD8t8Q3giJZjLpb+
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Aug 2026 16:15:23.3226
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 867d3b03-3fd0-4bab-403c-08def88ce9b9
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF00020E64.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB5605

tps6598x_connect() and cd321x_update_work() pass a stack-allocated
typec_partner_desc to typec_register_partner() after initializing only
usb_pd, accessory and identity.

typec_register_partner() copies attach and deattach from the descriptor
into the partner. With those fields left unset, garbage function pointers
may be stored and later invoked from typec_partner_link_device() when a USB
device is linked to the port. Uninitialized pd_revision and usb_capability
similarly leak stack data through partner sysfs.

Zero-initialize the descriptor in each call site so optional callbacks
remain NULL and the remaining fields are zero.

The series is split into one patch per function so each fix can be
backported independently with the correct stable prerequisite:

  - tps6598x_connect(): Cc stable # 5.15+ (core.c, v5.13)
  - cd321x_update_work(): Cc stable # 6.18+

Changes for v3:
- Split v2 into separate patches to simplify LTS backporting.
- Add stable Cc prerequisites per patch.
- Drop Reviewed-by tag while the series is split.

Changes for v2:
- Add Assisted-by tag.
- Remove explicit identity = NULL.

Radhey Shyam Pandey (2):
  usb: typec: tipd: fix uninitialized typec_partner_desc in
    tps6598x_connect()
  usb: typec: tipd: fix uninitialized typec_partner_desc in
    cd321x_update_work()

 drivers/usb/typec/tipd/core.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

base-commit: 5e6de6a2b522f659defacb1551d0465ba6ce13cf
-- 
2.43.0

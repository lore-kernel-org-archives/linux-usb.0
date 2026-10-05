Received: from BYAPR05CU005.outbound.protection.outlook.com (mail-westusazon11010046.outbound.protection.outlook.com [52.101.85.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9626C48643C;
	Mon,  5 Oct 2026 13:44:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.85.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791207868; cv=fail; b=BavVaQFJ/m3rBhXrFeoPx465FVseZXG3bNbZpxsl9dUsPYQ5ICCxYHHirHYMW+krOs67DV2RU+4uCznExCeFNLBbZZSNM2WL4I+CsYiI49htWi35HLCPQzMC/wDp/KhPEHlziSrNxsr3SWC30fWWk3ujA7LI1TyTqVWKWe4JiJ0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791207868; c=relaxed/simple;
	bh=Uj+1LJ/7Y+Bq/8Gmrt/8iA9fBuuKfQYOZI9npBzStcY=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=N5c7EcX8JEoA/QONngMsCoiJ5yr7lAabSEUY6U0+mElYRTZZzS418HQXWtRhA9LuupCjvXNYdePQ1ane3XbXeSm1f9t3qh8DJzPshFx5UCneck0XQQpJFqzB5Ij7cIHiHsW3EpYTfnUOOSxawCXGgCt1IFNR9He3fW09ZtUcyVc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=LrjMNIe2; arc=fail smtp.client-ip=52.101.85.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="LrjMNIe2"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dAe0vcnO0VQg2iddT/zg/PPiMfLopWLl8Q6Vs3RciclfVLeXTa5BU+k+nkChqcyFG3c/YMoaP8CSVkCNTEWIX5fjqGgBxgf0NyxAbhDXxcQ8//GxzdWkcLkvjC91SEAMv7D380r/SCE+cmDdeM5f1J7wglzv07lz11o+a0cwZ80+RRJvDWkq7ws/XWtojTWw2DKSdjBYXAiXfVWa7QY/S+UBChWd7OIypr9QRzC18EKZdt0K3kDpZe/zpuuOhHImWZLbFysqLtE5uTDq9CR/+X9CpR+6Jt9m038auKvF6RCkcd8ABfdeU3rfYUHzrxnHThGPMxaq5jRbo7P1wbZ5jg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Vm80yVD/UFjB25axty0aZZuyU9eYSSzSgwMXnWmWAEI=;
 b=DaYmefvK0yWaisqzgMLfDA+nrOSu4SOfK8sTDO2jx49eIVAds4YjysbERezXgma8mnt/byko9SlNOHLupRP56dVEl366LZhr0RnFBgnnEYctQr0BHLE2026HaEO9FBvrdDXKLgSxjfzQ2wQEoDKq2FGR/m7pj/YM6ApBioHxX98ZSg8dShASZwXA678BU2KYaXz6sKlw3rutV+70rCvAudstVDrvGLhHn1K8vmuWQseRv22Z4OAcKoYj9f1n5rUqmGTkWR/QX9Y1yPa1xV0+F2UxWnQ42/yiJFc90yxejxJ09CiafbNO2q3RZ+KAIYEInBnp9SCaELIN0VsRglBUWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Vm80yVD/UFjB25axty0aZZuyU9eYSSzSgwMXnWmWAEI=;
 b=LrjMNIe2ODyQmWiO4s2JJCb6gR0CQyyxPfUAWCdOt/XFK2dD1a90iBrFJbwc7MiQZgDvhl726QlVM1hb/S2/R+dM6rZfCLbFFhN6HxE7TzKOHxiqC7pQJSdOwAMSXCUXK2laldf7BX28pQfMJbTOnAYIy0CnHavH9ItwuJBufiM=
Received: from CH0PR04CA0055.namprd04.prod.outlook.com (2603:10b6:610:77::30)
 by PH7PR12MB7116.namprd12.prod.outlook.com (2603:10b6:510:1ef::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.18; Mon, 5 Oct
 2026 13:44:11 +0000
Received: from DM2PEPF00003FC2.namprd04.prod.outlook.com
 (2603:10b6:610:77:cafe::65) by CH0PR04CA0055.outlook.office365.com
 (2603:10b6:610:77::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.20 via Frontend Transport; Mon, 5
 Oct 2026 13:44:11 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 DM2PEPF00003FC2.mail.protection.outlook.com (10.167.23.20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.496.14 via Frontend Transport; Mon, 5 Oct 2026 13:44:11 +0000
Received: from airavat.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Mon, 5 Oct
 2026 08:44:03 -0500
From: Basavaraj Natikar <Basavaraj.Natikar@amd.com>
To: Andreas Noever <andreas.noever@gmail.com>, Mika Westerberg
	<westeri@kernel.org>, Yehezkel Bernat <YehezkelShB@gmail.com>, "Jonathan
 Corbet" <corbet@lwn.net>, Andrew Lunn <andrew+netdev@lunn.ch>, "David S .
 Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, "Jakub
 Kicinski" <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
CC: <linux-usb@vger.kernel.org>, <linux-doc@vger.kernel.org>, "Mario
 Limonciello" <Mario.Limonciello@amd.com>, Sanath S <Sanath.S@amd.com>,
	Basavaraj Natikar <Basavaraj.Natikar@amd.com>
Subject: [PATCH 0/3] thunderbolt: Reset affected AMD host interfaces before DMA HopID reuse
Date: Mon, 5 Oct 2026 19:13:38 +0530
Message-ID: <cover.1790854235.git.Basavaraj.Natikar@amd.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM2PEPF00003FC2:EE_|PH7PR12MB7116:EE_
X-MS-Office365-Filtering-Correlation-Id: b7db4a6b-1e80-4697-1878-08df22e6bcbf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|82310400026|1800799024|23010399003|376014|36860700016|10067099003|56012099006|18002099003|11063799006;
X-Microsoft-Antispam-Message-Info:
	zP281Td4U/3gCMy+PL7YE9X9Xqerc0/7KhwxQywTW0/fwbDINVOblv3iTw10dm2p7KfNvfOvRgdkB65mHi93VaMwgeR1bxksIfqGcEoDXr4n3zLj3F2dAnNbN09Vet1hOqcZr5qbzwK94FeEk/PllYjLu77siEef6xr77pvInp58moA3UrLtSHE8AnUaIo0DKB13F6XtZsQoxQWYr05+abJ7HBYqp1PjCDjRYttH9sC6sDAHDrHWEevupLpVIXNqP0sbyVygdY1h4WVLA6JYClqDa997mZ6DZvAlK+DH/3lGCQyCRpfoVKE5VRwuaptO1hIdATRU9cqyLuW+6KnQ37TLVB8boybdcf96lj78YF5yb+WqD2yZetCjyu5UfqivNFGiYkQEM4p2ZbG70r/Udn4Jf60EWwN7pufODv8ITW1SvaL/4fpyaBSmDS7qx+O8W9UszIF/4HW3sbKY6sDGxrHg98N/kiOgqBhQmU4LR87AVxK2NMGDJeW+1NxTnvubatZu21mIi76iuX4rKER9YLCtL5kBYEDOYC1qSOe4YK2jzMhnc9SASyt1jp2tV2J5R70Wa615KlH2wfURw5UFRMJx3oKNnw14pYHWW7h1eGCT/QQtKcJ7Hj9MM8ON887urQtMoWKKRPJTa6+vw+tnCFYnJoD9fOm1G1L9dT1s5beL0ut5oltKh1rhsztB5pFd+CYEArdOpDYenFprwrq1QQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(82310400026)(1800799024)(23010399003)(376014)(36860700016)(10067099003)(56012099006)(18002099003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	ZWMYWc116+mbRMrCDfoGJjHxxPCe+XP8/8MchQEC1Kw+ZRWN71VriHUfZwFQ8ODD7r85hl7XIv58oZOKPiHs36fknY0K4q5aWGxeEqDcqchjiZlMj1Fks1ailsCnw30qZWA6EezQgJSjLosBmWLktc6BgdnoPfks7uvMsLhsmbfv2NC76DBDo6iRoUFrM37bLWhZrEgMeutL3wLaO1C5SiBZSxBzQ/nr84cEKPHnBb+jypYt7qkFggGr3t7xTYNtZ8px1CIYnrBVq5ti5/M3bgtZz55cs824RdqlaBJA9pbHStCD4B1RXaXt00D6QK40rQdpQWUpMK7wq3YIARu/VHAVY18uZKmNxDkzVLBF3lTIZeMl2l81inaUXiig6zd4U2ra0BQD3GctI0phb0R/Yag6bq+qNBpySNfbDUx9wrAkTNgpodt6pIt1Q0V7JwBB
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Oct 2026 13:44:11.3612
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b7db4a6b-1e80-4697-1878-08df22e6bcbf
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DM2PEPF00003FC2.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7116

Some AMD USB4 host routers hang a TX ring when a DMA HopID is reused after
a DMA path is torn down without a host interface reset in between. Resetting
on every teardown clears the state but also disrupts other active DMA
tunnels on the same host interface.

Track the TX and RX DMA HopIDs programmed since the last reset and prefer
unused HopIDs when allocating rings. Check reuse at tb_ring_start() as well,
since networking retains its rings across reconnect, and return -EAGAIN
instead of reprogramming a HopID that still needs a reset. Run the reset
from a per-NHI work item once all DMA rings are idle, serialized with the
connection manager and with the control channel stopped only over the reset.
Enable it only for the affected AMD routers via QUIRK_RESET_DMA_ON_REUSE,
and only on v1 host interfaces.

On -EAGAIN networking retries login asynchronously; stream and DMA-test
users retry the operation. An active tunnel is left running even if it
blocks another tunnel from starting until it stops.

Basavaraj Natikar (3):
  thunderbolt: Allow tb_ring_start() to fail
  thunderbolt: Reset the host interface before reusing a DMA HopID
  thunderbolt: Add quirk to reset host interface for AMD USB4 routers

 Documentation/admin-guide/thunderbolt.rst |   6 +
 drivers/net/thunderbolt/main.c            | 120 +++++++----
 drivers/thunderbolt/ctl.c                 |  36 +++-
 drivers/thunderbolt/ctl.h                 |   1 +
 drivers/thunderbolt/dma_test.c            |  32 ++-
 drivers/thunderbolt/domain.c              |  66 +++++-
 drivers/thunderbolt/nhi.c                 | 249 ++++++++++++++++++++--
 drivers/thunderbolt/nhi.h                 |  13 ++
 drivers/thunderbolt/nhi_regs.h            |   4 +
 drivers/thunderbolt/pci.c                 |  21 ++
 drivers/thunderbolt/stream.c              | 175 +++++++++------
 include/linux/thunderbolt.h               |  22 +-
 12 files changed, 612 insertions(+), 133 deletions(-)


-- 
2.34.1


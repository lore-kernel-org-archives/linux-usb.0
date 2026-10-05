Received: from MW6PR02CU001.outbound.protection.outlook.com (mail-westus2azon11012017.outbound.protection.outlook.com [52.101.48.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E73E4CEE60;
	Mon,  5 Oct 2026 16:47:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.48.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791218882; cv=fail; b=YlBmxX5yAA+8IKh6vtYaYenMcWzAoujtlXCTXGufGF4IFrF4aqLUjc4aQsaF7zmcVd9i6wpIaLY1eKX8jvuqhJDbpLB7A4oiqtpw6zjX4dSFlQIvMKZ7h6T/cnUrqejNkUg7u6KYfhjFddQVtHaxdDaghwJwXNdmeci6Vw/b2Us=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791218882; c=relaxed/simple;
	bh=vI4Ckv+ibf6mFu8/6WtGTmLNTcKL3sc6o+D+Tec0MN4=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=E/js0bBUmhAohivMhNOI93RB/1oSGAJFa1qH7+5s29v34zZsSIdxr3e53iefXfztZUuEDkbpZq345eErit/enzAhaq8xtM0LqmEMPhmUmnS7fLVemv3V5zYnMFgbNtNEAOVWN1Ql4yFGPawR/OA4Btt7yL9kMNEc+UDSFpFEe5g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=biUWq1Kt; arc=fail smtp.client-ip=52.101.48.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="biUWq1Kt"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Q9yz/hvHC3CD2u69nFuDJfkyrI5XruZE1IvdCXi1kT0ujD3EycsDFYhV7tt2baRR3DzOqFdcEMb+P2c/kJJOgUsphKTgEXdT372gbBuPygEwRxNqx7JrQ0S3TxNU0DGT9QI3T2SNhUY97CVd2MaTnYhwNFWj3sn3M3BAxSlubD01oF/lE6BX3Qvci3d1oSZ0aoC+W5EWCJ84/NvY8BjinS8+p9MMhbM2sC5fXhtp7K7dbCaAzEmt8ZZpymvEmeg5c1J02ORYonwdqMwBw6/W8JX0srnCC9LZ8LmYgq4JJ8fNM2SJNi+OAjkQZ2g52reNBROv4adGPOd/8GxsZLEdVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PpZfIwMsCZHmYThziY3Tylfu3nrICaHZ8Iu2tK1KZ9g=;
 b=knYLJVKd/tClQEA2k9kBX/DzVN018CWVDxn1VkTv6dSMj30FxkRuN0+V3gx7ejg3+Pzv/tuovE7OvIhP3zdfdcnh1o0uI5cDakEDDb+IkA6hPYerl6tR20aNWoXLXzXfFCMYFHp45X9qSqNIDF1epn9o/wp6VvVgaa2rLiVOUTmKhOVaRQfCIauRGedT7/Ori1GtMkAs4BQAeEW+ijEv/yPrNJ5XTxIqUKdlr9EngazGTHsE2mswbCC47KUhdPwRZ1tTvVlC90xmhUF/lLKPK+2Id1emru6RUB2HdYtQ0OCDrw6ttv2YSkDbtja37LMlZ1AXpJMOYxnj4SwwU9zp3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PpZfIwMsCZHmYThziY3Tylfu3nrICaHZ8Iu2tK1KZ9g=;
 b=biUWq1KtfDznIDR8N992ok15WcP8fmNA26Ux7UKG94LANsicQgxMCN0BFaMLrH8n1jsABxgtMfy6mFwCSeHqmaE3dvEb/acoEmnkoJhfjfx3FEZbtTcphlGZ3cQ1x4UMLJyFwF8URxPKRawVEoG3RYUtGe6C+JLp8YbG5/umyo4=
Received: from CH0PR08CA0030.namprd08.prod.outlook.com (2603:10b6:610:33::35)
 by CH8PR12MB9790.namprd12.prod.outlook.com (2603:10b6:610:274::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.20; Mon, 5 Oct
 2026 16:47:53 +0000
Received: from CH01EPF000BE943.namprd02.prod.outlook.com
 (2603:10b6:610:33:cafe::3f) by CH0PR08CA0030.outlook.office365.com
 (2603:10b6:610:33::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.20 via Frontend Transport; Mon, 5
 Oct 2026 16:47:53 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CH01EPF000BE943.mail.protection.outlook.com (10.167.244.135) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.472.14 via Frontend Transport; Mon, 5 Oct 2026 16:47:53 +0000
Received: from airavat.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Mon, 5 Oct
 2026 11:47:48 -0500
From: Basavaraj Natikar <Basavaraj.Natikar@amd.com>
To: Andreas Noever <andreas.noever@gmail.com>, Mika Westerberg
	<westeri@kernel.org>, Yehezkel Bernat <YehezkelShB@gmail.com>, "Jonathan
 Corbet" <corbet@lwn.net>, Andrew Lunn <andrew+netdev@lunn.ch>, "David S .
 Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, "Jakub
 Kicinski" <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
CC: <linux-usb@vger.kernel.org>, <linux-doc@vger.kernel.org>, "Mario
 Limonciello" <Mario.Limonciello@amd.com>, Sanath S <Sanath.S@amd.com>,
	Basavaraj Natikar <Basavaraj.Natikar@amd.com>
Subject: [PATCH -next v2 0/3] thunderbolt: Reset affected AMD host interfaces before DMA HopID reuse
Date: Mon, 5 Oct 2026 22:17:15 +0530
Message-ID: <20261005164718.4166200-1-Basavaraj.Natikar@amd.com>
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
X-MS-TrafficTypeDiagnostic: CH01EPF000BE943:EE_|CH8PR12MB9790:EE_
X-MS-Office365-Filtering-Correlation-Id: 1b2bf12a-4ff8-4fab-ec05-08df2300666f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|23010399003|82310400026|376014|1800799024|36860700016|18002099003|10067099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	U4bsgkpbWnmpE7ccU2c+ejeASJ9IS9wnO0v03LGJEN9cZy+L/1PK05Hu+JGFPkpuGS08+uJOGYWA7VTXI8EuTDG7yYbAaiv0Dejdgd2SasiyB8gCbeLL2P0UeQmPsrkDjIemn8su5Bz1GuScferbRxvtgLYut9uE5RNkdDPvkrecebIMGBnC0jZd8pOP/YKB65r1eIE/pcg9wkq7yiUABJ2T8A3a1iEeKFFC9urvS5o+A0kTOGUVifeHYreUlUGT/rZd6O8uVKhZmmiXgs16sKZ0HrAxzOl7oTJX8suB4v0xTTrImIREAOfoy0L4Uz3ZL+kCLJi2DXPURijnnCyFTsxiv+gg2zrGbJDTOQtRF6JmzEwS9+oE/DGSlG2elCPWujHw2pCorlZ1+VYLVR8Ja9G52/GUdzVHFpSa0tGbRMGQe8L702CjIgTaLaEab8bC8uqIMfsbFbzN9mK5WyPERG87oEI+bmfGFAWRBTzc8Gd1mQ5Sg89JzcaFaQtXes7f+WcC5MG4q64k8GnPFnjn9klMXT2es6e+HldDDEcoO0ha93IEdMVGGx9A0b2b/EYJohH9K759WtdZfLjYcK/4NnYhB57Bwsdx7uLGmAHen6dx8GOULD8EDjY8iNBxfA6+WO2tkRDiu+DapErxY8XhJ2wmhWMnmz3j6YGMEj5LZ4mTDjGN0U7n+o4Z9UqG74mJpvbGGTUPYxsT2VTmmgG69g==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(23010399003)(82310400026)(376014)(1800799024)(36860700016)(18002099003)(10067099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	kh/p4ShTRY18yrDPG97UdlfIrR+ZwzdWmvrlTN1UlMnGH6W7BDG0yKUsCdCZ+blaJ6Z8YnImHVy52DHkfmhJ7Ud6QuyqPzjBABBlYC4Iqtp2uX+3falhnreug4zYbhknpfqqR+LfKzebY3805ZBzqPJGZQjiJsR5KkAmKZyrpR1LKhSoyxikLX7IQzmgplscBDqhgpN80apzEH4nJtrfJaquAp6gVkSk154gN+DSmAZdAMtU9xamsfOx6rtIunXiVYy1vXp3pWj4UDDlREb7UnVaeiuMvyD6Ze2ko8W5U5ZkB6fYh74fyghWvI+fUalvrRJ/q0WkhMiwt2SzeC+sndbYme7RHJkI+pZD0UCoeAPnlWHH1ROB+mU1c9hVsPJ/VK2r4Vemb9T1+p7/HTrWUKcRfarsv6b7rkX2dx6dF8EMgH1UVDBxH+qOMyQSuXFC
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Oct 2026 16:47:53.4907
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b2bf12a-4ff8-4fab-ec05-08df2300666f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH01EPF000BE943.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH8PR12MB9790

Some AMD USB4 host routers hang a TX ring when a DMA HopID is reused
after a DMA path is torn down without a host interface reset in between.
Resetting on every teardown clears the state but also disrupts other active
DMA tunnels on the same host interface.

Track the TX and RX DMA HopIDs programmed since the last reset and prefer
unused HopIDs when allocating rings. Check reuse at tb_ring_start()
as well,
since networking retains its rings across reconnect, and return -EAGAIN
instead of reprogramming a HopID that still needs a reset. Run the reset
from a per-NHI work item once all DMA rings are idle, serialized with the
connection manager and with the control channel stopped only over
the reset.
Enable it only for the affected AMD routers via QUIRK_RESET_DMA_ON_REUSE,
and only on v1 host interfaces.

On -EAGAIN networking retries login asynchronously; stream and DMA-test
users retry the operation. An active tunnel is left running even if it
blocks another tunnel from starting until it stops.

Changes in v2:
- Rebase onto thunderbolt/next at a93a8e320000.
- Keep generic NHI code bus-independent by using the existing
  reset_interface operation.
- Replace the existing immediate reset-on-teardown path in
  thunderbolt/next with deferred reset-on-reuse handling.

Basavaraj Natikar (3):
  thunderbolt: Allow tb_ring_start() to fail
  thunderbolt: Reset the host interface before reusing a DMA HopID
  thunderbolt: Add quirk to reset host interface for AMD USB4 routers

 Documentation/admin-guide/thunderbolt.rst |   6 +
 drivers/net/thunderbolt/main.c            | 120 ++++++++----
 drivers/thunderbolt/ctl.c                 |  36 +++-
 drivers/thunderbolt/ctl.h                 |   1 +
 drivers/thunderbolt/dma_test.c            |  32 ++-
 drivers/thunderbolt/domain.c              |  84 ++++++--
 drivers/thunderbolt/nhi.c                 | 225 ++++++++++++++++++++--
 drivers/thunderbolt/nhi.h                 |   2 +-
 drivers/thunderbolt/pci.c                 |   8 +-
 drivers/thunderbolt/stream.c              | 175 ++++++++++-------
 include/linux/thunderbolt.h               |  22 ++-
 11 files changed, 555 insertions(+), 156 deletions(-)

-- 
2.34.1


Received: from TYPPR03CU001.outbound.protection.outlook.com (mail-japaneastazon11022087.outbound.protection.outlook.com [52.101.126.87])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCF603D669A
	for <linux-usb@vger.kernel.org>; Wed, 30 Sep 2026 10:18:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.126.87
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790763499; cv=fail; b=LZY3uxYzAMWqb5oZbGr8h0tZH5R9tr4aF8j2itBENXKDMPSCxu2cHu3Spog4Batf8urURRz7Mku6kowdOBkw1IeUXuE8HB5Bo1bSVUakpxvy9w9k+abz/PUah/0L0oXE29v/r6iuzcRnDInWY4c2MP34Md/ogzdGgf/Y00qFP9k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790763499; c=relaxed/simple;
	bh=2EUEPGDEsuLKJ6EP945JCGuQLD9sL5wSJuk6len8tgA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=dOjS5gVCqkP36FB+RsQXk+l0J1M1qukFqxYj+oiLUeOSQLS7gMEE5Ske4mjzmjQpdnrHobaxyNl86U3EBtMcBeojuzO1ufa1MFhU+AhjRCgBb5idfRpqUiE8WAi0bph0Zpjas2KDB6PyzvTkgpGrHcPloMmwwCZsZsTBlOEQbK4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qnap.com; spf=pass smtp.mailfrom=qnap.com; dkim=pass (2048-bit key) header.d=qnap.com header.i=@qnap.com header.b=djeIHpC4; arc=fail smtp.client-ip=52.101.126.87
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qnap.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qnap.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qnap.com header.i=@qnap.com header.b="djeIHpC4"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Aqs04+uQomEOYMXWzo7a1CuoTsPbim/0RLKc93KhI1pl4F1NoMC1rHI0z0FgxH9wlun55e6TtGURqvuMcNzvhsGNwUcBc+wYxK2NpnDOZk2Btq436UZ3/buFmDLct/AjLXTYunLcMmbdrVOUstSLq2r299hO4ZPjhl998eXSVCeUIm2fPzkVIw8XuXaDKaq81eic8EN+xTixoPSa/6/OYkPZ3WqfYTe3D/T/lZdZm836HJ+mJPPsy/M1OHBh6SEOwY0GSAcrodPJIuKaUiDeoVSUVjv0C0KfP3AdFiPq+Gz5QhFuNcNZ6DiIL9llcShhIYXF3QLVoBWPV7EZsUE41w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NAvL/BuHdWH63KqmycM3WHkfC6GSAJh4Gsq494bVaQA=;
 b=BZpNHzxY0Egur2jBr3JRdl+z3af0IXPg2B/Vi7lLsKtb/fi1INJb1zvl1Gpy06hdxbsaFMXoIgM4IYymZ5oOQeW6Ai7rM5Xw/G/iIeehmhC19flLrJ16PQqfXR5LOxCCi1pusH5NQq6nJs66XjaeEjovH9aAbhuEa5Ijtk9paFrdq9Z7fqKukvxvzLQYFfg5Wm2U8XQSdp/yFheYA8DW+1Cwk9JmzH8bWM4JLSWuvcdDLCbHlWtHtc2gv4N8sn791Uut6r9702AINCNDSvx9SwVbKTM3ZvnM4cX40KfjTl0ZJ5o+cg+NELXu96vElXGzG9QgzS9NGtPZvbDwDIIRDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 122.147.219.42) smtp.rcpttodomain=intel.com smtp.mailfrom=qnap.com;
 dmarc=fail (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=qnap.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qnap.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NAvL/BuHdWH63KqmycM3WHkfC6GSAJh4Gsq494bVaQA=;
 b=djeIHpC4jpsTWmNq6nVk1yvWwEsRTKwqalxVNkI2AWDhvyqr3CvpE1eHngvX/EL+tjhbUFNCxijstsLITS0uvVKmaqZYjgJ+ab6YJZLd6HWP5cuVdRJiKdz5uJlC52LYBCBYgY3eOsQk92JBQ9GzPQmAGnE90oqJx/ENLM/S3DsgNJpUCIEXEb6UjFMe7xj4HcgQCEUReGUzytIumrpIJMiFQIBKHOmjp1ACR1HVGinX/FCgKzTMqDOrV2ckI3jz9jGH3raz4wGiDC4jFML+55Dn0pPGpuo8RmZKZa90KZGAhbLGP63kMv76NKWZ92w/7kqvKdNGw2tdqCNf9FRWBg==
Received: from PSBPR02CA0018.apcprd02.prod.outlook.com (2603:1096:301::28) by
 SEZPR04MB7258.apcprd04.prod.outlook.com (2603:1096:101:17a::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.472.15; Wed, 30 Sep 2026 10:18:12 +0000
Received: from OSA0EPF000000C7.apcprd02.prod.outlook.com
 (2603:1096:301:0:cafe::80) by PSBPR02CA0018.outlook.office365.com
 (2603:1096:301::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.15 via Frontend Transport; Wed,
 30 Sep 2026 10:18:12 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=fail (sender IP
 is 122.147.219.42) smtp.mailfrom=qnap.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=qnap.com;
Received-SPF: Fail (protection.outlook.com: domain of qnap.com does not
 designate 122.147.219.42 as permitted sender)
 receiver=protection.outlook.com; client-ip=122.147.219.42;
 helo=mail19.qnap.com;
Received: from mail19.qnap.com (122.147.219.42) by
 OSA0EPF000000C7.mail.protection.outlook.com (10.167.240.53) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.14
 via Frontend Transport; Wed, 30 Sep 2026 10:18:11 +0000
Received: from localhost (unknown [172.17.22.73])
	by mail19.qnap.com (Postfix) with ESMTP id 89F9A202;
	Wed, 30 Sep 2026 18:18:10 +0800 (CST)
From: Henry Tseng <henrytseng@qnap.com>
To: Mathias Nyman <mathias.nyman@intel.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org,
	Henry Tseng <henrytseng@qnap.com>
Subject: [PATCH 0/2] xhci: handshake timeout overrun and configure endpoint hang on device disconnect
Date: Wed, 30 Sep 2026 18:17:50 +0800
Message-ID: <20260930101752.15794-1-henrytseng@qnap.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OSA0EPF000000C7:EE_|SEZPR04MB7258:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 09a8a4e2-0e73-4299-c259-08df1edc21b5
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|376014|23010399003|82310400026|1800799024|55112099003|18002099003|13003099007|6133799003|10067099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	jObe9zqqrIb3Z/exrM9X0oLJjEr0+GN0lQGShda7+RfVq37Zp1+TwyEzczeDhBCWUAK3A9fkJXgn0bUbOs12POPZebHaC+v+KLrKp5AjWW/VIjV3tPISEV8g5kIPL05HgAB1lPZjp3miRojvlXSyHaiGsagqz2jxkeDkorRsOe2n1ZWvwQlwFkF/+OkQ5+p6a+d+4t/zObA94OGDoiXQyWu7mYSktV9RL+U197UiGF9Y7CNczx9NC5YNvBIzFAJQkPHNyLgn8VjgNGaiLZK2OGeaamOIfncIq1HH3bh8aME8DUYDXWddodkUDfDP00vrhkVjJZ0M6Ikf6z7vnCX83qXUr5SkKhCG8WF3OULKQUD5+cDy7YfMlInmD4ny+YtSrZDTxiRxd/6pVRCh75YkFleZWBwWfTcZzRnaEHB1lYmSpr87HDKFNVe6No6qGRcZ60kCxk73XJez2XUkx7cCFOd9s0AbfXAqBl/SvErIxad69PrS+ROGWHTPH4QA1ekLHZcXF6rIbxCGk4XCkJaOGl505oCPvE+bmR3rA4UdegdA9YgvmRmrjfV5udlaLNp2NEZsA/LuriUBHzjlxM0etDhe8Si3IzuSYFROi6CdYdOnYfKOray+BpPte2imwLsevCnYetmX7aGqU4iWz6ybSA==
X-Forefront-Antispam-Report:
	CIP:122.147.219.42;CTRY:TW;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail19.qnap.com;PTR:122-147-219-42.static.sparqnet.net;CAT:NONE;SFS:(13230040)(36860700016)(376014)(23010399003)(82310400026)(1800799024)(55112099003)(18002099003)(13003099007)(6133799003)(10067099003)(56012099006)(11063799006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	vI2TgFaqkEhif04Tds2gfSWaU7F4poXPlZE7cUoUPBvk6DKeQd6uYE351q2UsFHF/eZk81TZUEycLsH0FIC/0Se13JgRVm5nneAW3qJEbj6KRabo1vIoVfndh1JC15x+a/iwMvtQdZUpDsXvquPSpX9UUBCPRFTta2QXKYT8z33Re/syQjIsUfxdDqCSwXqIeLjAJqig/IcxQZzV8Pxs8dQy4E28mQTQcC4m+OU9SQtREE2OV9iEF/rOyzTzacFSgWNTShIUTmVCffablDviT3+pYaJ6GaKslv/QZiMgZVqgJGTORTmOKip+SlWYI34qfXpN8SHjToI6fSM6xG07hX7xX7yrm7VlJ2ziAC67mLxpF/UEiSPbElr+EgtfOgC//zwdgEdf6koMs3Pcl30zGl+ogHUjrNffUbMDIVVMeeTnOudumgduh9mnd47Pexbj
X-OriginatorOrg: qnap.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2026 10:18:11.5845
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 09a8a4e2-0e73-4299-c259-08df1edc21b5
X-MS-Exchange-CrossTenant-Id: 6eba8807-6ef0-4e31-890c-a6ecfbb98568
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=6eba8807-6ef0-4e31-890c-a6ecfbb98568;Ip=[122.147.219.42];Helo=[mail19.qnap.com]
X-MS-Exchange-CrossTenant-AuthSource:
	OSA0EPF000000C7.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR04MB7258

This series addresses two problems found while debugging an AMD Raven
USB 3.1 xHCI (1022:15e0) that gets declared dead when a USB storage
enclosure is unplugged. During teardown a command fails to complete,
aborting the command ring also fails, and the whole host is declared
dead, taking unrelated devices on other root ports down with it:

  xhci_hcd 0000:0c:00.3: Command timeout, USBSTS: 0x00000010 PCD
  xhci_hcd 0000:0c:00.3: Abort command ring
  xhci_hcd 0000:0c:00.3: Abort failed to stop command ring: -110
  xhci_hcd 0000:0c:00.3: xHCI host controller not responding, assume dead

Reproduced on mainline v7.3-rc5:

  CPU:        AMD Ryzen Embedded V1500B
  xHCI:       AMD Raven USB 3.1, 0000:0c:00.3 [1022:15e0]
  Enclosure:  QNAP TL-D800C

I have only seen this with this enclosure on this controller. Other USB
devices unplug cleanly from the same host, and this enclosure unplugs
cleanly from a Meteor Lake-P xHCI. Similar messages were reported in
[1][2] without a resolution. I could not confirm the same command was
involved.

Patch 2 fixes the host death on disconnect. The command that never
completed is a configure endpoint command issued during teardown of a
device behind the disconnected root port, right before disable slot for
the same slot. Skip it when the roothub port is gone, as
xhci_check_bandwidth() already does when the host is being removed.

Patch 1 is an independent handshake overrun noticed during the same
debugging, and does not fix the disconnect hang on its own. The command
abort handshake has a 5 s timeout but took 15.8 s with interrupts
disabled. This is not specific to this controller. When forced to time
out, a 10 s xhci_handshake() returns after 19.1 s on Alder Lake-S and
17.2 s on Meteor Lake-P. With patch 1 applied it returns after 10 s on
both.

[1] https://bugs.launchpad.net/ubuntu/+source/linux/+bug/1857385
[2] https://marc.info/?l=linux-usb&m=155120372130870&w=2

Henry Tseng (2):
  xhci: make xhci_handshake() timeout wall-clock based again
  xhci: skip configure endpoint when dropping endpoints of a
    disconnected device

 drivers/usb/host/xhci.c | 30 ++++++++++++++++++++++--------
 1 file changed, 22 insertions(+), 8 deletions(-)

-- 
2.43.0


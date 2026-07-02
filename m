Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azon11010015.outbound.protection.outlook.com [52.101.201.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A5EC34389D;
	Thu,  2 Jul 2026 19:06:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.201.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783019179; cv=fail; b=BkIrKRKizUsP9xKcMlM7U2JOUy7E/lJmGrlwYPlq0n5udcG+3hFG8FxvAvod+MDLkiQZu5tSlC1nvyCbe48MWO9b9K5PX3ixAl8C/HuqHO2OAuoY7rYsfunx+35bGLqFEgLz6LvBonYGWCgzbJ2VU1iGlhbRGvyK71mmx+iixew=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783019179; c=relaxed/simple;
	bh=2RlmAQY4HpNwxFcQjvSuqwqBT8h5AAXBMnXgm3R2WM8=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=gnXt0k9ErMA//R7uYQ/J0LRt6q92/SFpdT+oBiylc1v9fd3uCDI2w1uhxYu+D2h8yI3beDc/l2rnhhcNyOA0D1tXjaxSOZgexkU3e1ktGjXUuxEiw8RYQsX8tthOyIU9PhE1/DxgZ6PwF5btz6AttbXCTBm934uubxY9Nx5qpMw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=j9dBWLgq; arc=fail smtp.client-ip=52.101.201.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="j9dBWLgq"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QMKCTJSBrsP5pFrZxpB3ODMQVp9BvE+w5Gl+oU+biZrVuzy6aQ1q0SOqAXPA5mPuYho/FekWL70J1VOX0vjToPqcIfHkpjWJdHc0uMfeJc6Gf57Jb5uw6rbTQlzwfK087m0Fuqm3YZ7h6dc3C6ZRO8JZOwxcfgj5vpau5W5Nd97fNAvO5p6Ivlv/NTTHBwEq6frh8dKTXSK7dca1EbyQBHifdjly6Nc0P3txqgcBJu7kZXEP+xWgcnlXGEY4K/Vpr5liqLkuyUBmt5Z8CHk1wenHD12VPZhjcDIMo0VsLk/d7aPKg3bn86hMdZm+f7XwBaodXyzysj+AXq0ylsM3WA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GFhpPicHCbehJYoR5Xb9CzVNmuzsmxpLBLRDcq7TtjE=;
 b=ZX+A0rgQTfuNxRHBTGm5MnWmmHxaZpSz/+jXJCNxj4kQP/JpEaBa80FnY1GlhpvbTMGSytA1bAPHbUdRKDui4s8NuGfTCCoKty5QbjAkRlVOxJWFyPjiQoIw94nR0YHZFXhFZAk/gv3t11q64tBrOvNGIJpm1v9hDhQKw0v0UW3HIPU0sI7owS8C/bs5gOtM8NAu1jCnIt+WCqvDN46lqbo5zq4FcrlQQlMzunV2NVjc67+e85slpO1ckzkJRWkTWIgBz4N+2LAoaP+m2cTPDR/Hs+ZBB/UeDFkREkaRe8WLKcNJ1I9NRP9yoh1mByrxXCOl2r1U0Q59m61Jrpd+Mg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linuxfoundation.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GFhpPicHCbehJYoR5Xb9CzVNmuzsmxpLBLRDcq7TtjE=;
 b=j9dBWLgqdgj68hdsscaR5e3Ej1yHeAoAzl5iGvYorOzuqa8nUXRoHtgNt734fL1kTglyXsmtDIS5uAfLaiuSfYOjC/2teXOHgnQgk3M7H5NlcLFajNs0sV0l66TsmSBLnzPYqKtKKExk/MiNXbuvMy4e86mKsenCiUMhKg/MmKk=
Received: from SJ0PR05CA0182.namprd05.prod.outlook.com (2603:10b6:a03:330::7)
 by CH0PR12MB8508.namprd12.prod.outlook.com (2603:10b6:610:18c::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.10; Thu, 2 Jul
 2026 19:06:09 +0000
Received: from SJ1PEPF00001CE6.namprd03.prod.outlook.com
 (2603:10b6:a03:330:cafe::79) by SJ0PR05CA0182.outlook.office365.com
 (2603:10b6:a03:330::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.181.8 via Frontend Transport; Thu, 2
 Jul 2026 19:06:09 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 SJ1PEPF00001CE6.mail.protection.outlook.com (10.167.242.22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Thu, 2 Jul 2026 19:06:09 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Thu, 2 Jul
 2026 14:06:09 -0500
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Thu, 2 Jul
 2026 12:06:08 -0700
Received: from xhdradheys41.xilinx.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Thu, 2 Jul 2026 14:06:06 -0500
From: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
To: <gregkh@linuxfoundation.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <heikki.krogerus@linux.intel.com>
CC: <linux-usb@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Radhey Shyam Pandey
	<radhey.shyam.pandey@amd.com>
Subject: [PATCH v2 0/3] usb: typec: tipd: add TPS66993 support
Date: Fri, 3 Jul 2026 00:35:24 +0530
Message-ID: <20260702190527.1820671-1-radhey.shyam.pandey@amd.com>
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CE6:EE_|CH0PR12MB8508:EE_
X-MS-Office365-Filtering-Correlation-Id: cf2c230b-899a-49f2-d41e-08ded86cf9d7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|82310400026|376014|1800799024|23010399003|11063799006|56012099006|3023799007|18002099003;
X-Microsoft-Antispam-Message-Info:
	wAtuB4Ply8sspF4riMm8SG1i+0t8AzHSlJXp0/QcciyXJNyVWayr2nGej2RSusJBP35oMn5w+KWPzUIWpBJ3OxjWrHU1DfXK5q4x2Qb347QgZjqnklkYCuslnXOXHHEpqI+9xcF9REqcsM/5qVWjE/J9qk4q0y4aZ0AMumTK6uVnp25l3kp3G+TI2OyuTEbDbSfO0Dh4dvdZOycpGoSgqRs1/4WytirQ+TLiyBSMzzpTM6tZ7Xb61yRf9yovg/33nVcRdvdB97bK7KFL1YkTV4gcCDHsYjPAOQJ3WNSWQ42YbpCLvvaW428vi3qVRudJk8AvGvyZ+NzLaBEUPoSy2o+KKN8q+pvRsm/YGwOY+dTEH/n+g2mPfxv3cURlclfRbVvpU/wzVL6KwPygLxMcGK9NcUKD2MWRyg0bTfZByuCtC7EYEIoH+AaZlGYdg7YaoWvTycVNGnm4otmp6hZpwyvi9vIsNgK47AqTTuP1ytzKHrbQWup0uhwzxatz82MUDPsDvghZQvmitQK01lRhSlHAUgJ9+whJ0u5u/+Ft+4FTFsTvxR5vNmWXbJyoaxNOwtKQA2H9hEG51VN8IYKEuaHMpQgHB3iB82HUUWrNuFGviWeUZgyY5tSr0nZ0LGGQxWDUKEOOO0ltfYTnm7YNR77ZHTmSLl93KUChrp6oCm73jX/5ycB7SNfz2BEtWyePCwUAtTRrdDVWm/B6DzwvBg==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(376014)(1800799024)(23010399003)(11063799006)(56012099006)(3023799007)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	dc32LgpePuVtaxOKVVcXvAb1DhWbxaDfSznz7siUYJXJ5F0H+P6r/6S/P7Nc2Vyl8Il+L+EzJkkUNne3XgwBGRTrbLbrczrcZoMFNkv6YHc79BZRXUJ8WJ1ZtvfTKYhR/Xw2fYZFe5osDVC7t3gI/2knuSS7lhBUH8oH02MyGykmFXjHJlyGZUcRP63+UoZ+m0EzWMHcwDBj9eJElbj2UHTiaqRuS/uEAFJU9CjMdWIsQbfAnzNTpLEEnBN9zc9FcA4SmTN9Gh47dRSWeNk3Bvrr3d4iam/V7Wn2ovGunXq7gC5mP41KM20mBDza/p6gx8mCrBSEoVkx9GzmYpOz8DblX3KpVIxOr62nhxjZipxlyO+uWUS5tTeIH+GTH9Gl0U6nKkKsgDFRwM7IiHnlAnjvhzb03LE0fM2fW4bPh5Ods5bqTPLBfo+J7ozU7TqJ
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jul 2026 19:06:09.1631
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cf2c230b-899a-49f2-d41e-08ded86cf9d7
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00001CE6.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR12MB8508

This series adds support for the Texas Instruments TPS66993 USB
Type-C / USB PD controller to the tipd driver.

The TPS66993 is used on the AMD Versal AI Edge Gen 2 VEK385
Evaluation Kit as the USB PD DRP controller for the MMI USB
interface, handling CC signaling, connection detection, PD
negotiation, and power/data role swapping. Although the register
interface is largely shared with TPS6598x, the device is not
host-interface compatible and therefore needs its own
"ti,tps66993" compatible.

Changes in this series:
- Document the "ti,tps66993" compatible in the existing
  ti,tps6598x binding.
- Introduce a read_power_status() callback in tipd_data so
  variants can override how power status is obtained without
  changing TPS6598x, CD321x, or TPS25750 behavior.
- Add TPS66993 support.

Changes for v2:
- Use specific device compatible string as suggested by Krzysztof.
- add TPS66993 driver support.

Depends on (submitted separately):
[PATCH v3 0/3] usb: typec: tipd: improve probe diagnostics and POWER_STATUS handling
https://lore.kernel.org/all/20260618074745.629638-1-radhey.shyam.pandey@amd.com

Radhey Shyam Pandey (3):
  dt-bindings: usb: ti,tps6598x: add TPS66993 compatible
  usb: typec: tipd: add read_power_status callback to tipd_data
  usb: typec: tipd: add TPS66993 support

 .../devicetree/bindings/usb/ti,tps6598x.yaml  |  6 +-
 drivers/usb/typec/tipd/core.c                 | 77 +++++++++++++++++--
 2 files changed, 75 insertions(+), 8 deletions(-)


base-commit: 4f441960e691d37c880d2cc004de06bb5b6bd5e4
-- 
2.43.0


Received: from SN4PR2101CU001.outbound.protection.outlook.com (mail-southcentralusazon11012055.outbound.protection.outlook.com [40.93.195.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5242736EAA4;
	Tue, 14 Jul 2026 06:18:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.195.55
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784009928; cv=fail; b=IqYm+Yxb7aGqidXgLJYFZNp4zzwOcxqBCY6p+SoRiFMsPJta+8/cv+cti2i8940weoDuNoh2qTkb5bjooiCoPjVZtlTXyKaVqjFHnuCpOol2WWK0L5kZv0jUhbZesQkfPrWBfM+9hs+WGQ4LO9+TcESHxceZbc1+U/X/pVE1unU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784009928; c=relaxed/simple;
	bh=23GmvdQw+j3DEDGceyDHBxVCzyAQjnny1R0LcoTdBIw=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=LYiqCvzz2zahq8fy6ifOTXPaAlo7hGRrwkVgyXNXhfffnTddQiu982qD7ZLIQQ7P1rWGWGm0HquIBIkZ52OF3qs8w55pzcSgFJxb3qd+ubXrx1t0jgWbcBzeQN+/VPbXoQKDv3jQUD4hzSaeiByCssQwyp7qzThHaeP0uhJ/oJw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=nxbyKMZl; arc=fail smtp.client-ip=40.93.195.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="nxbyKMZl"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CNn1S4IwE58rNRZLQ/rj0abmm1UCIvcWke2uXBXHWL8bfVxwpB7MMpEyg+jfDUgzlyrZg7H3B2bOcWDG+MfurJd/AktNAqYOJPpVdfkdJtyueklAxdp+LNDFi0enBTuzpIN6pFBc7MIzHQZoxX/uaDb6eGrq0sOhFkG93UfGYl4B4ECYinc9EJAVkS7Iix0mpQv+fppm8vB2n9dV6vC10xsKJNvxbrsVapa9qeoZvDFCpyB5+eoIPcthr9CxmmeRp7P3T42JLK56Jzy4cLtP0GTFjfXJCd/VxsfyiEgbokcUQo+r0lqar693CQIER0NC74NWja+6tgKlGdcOjNOoOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WKliloXlfaPyaKBa0RVlJ5vTtRW7fraoHqpYvBZrchc=;
 b=sy3tdPSSuAOUfNmoewxWwbeNgh3zTG1BZE4ekQyGVoKAbZXARHafdLje0eS/9fp56tD3uo4n2g1bPNoiJyse8t/AmLeZnMWXWS5c8cQJ5xJ3qVryEhQIK2+Rgd09X0Zdq8IeujA0JbqWyYfbtvluNhE1UhyR4sTml8ZAC8S4j9CeEi/0kbncbt3DLxdFeu0Toa0J8npuDpWAkqBswZ03FeVRaKVJO/DeygTZdkPWexbsUW7Zp0U+00ptvA4bub2sBuA8Z/r7DxrnNrOdnmJP2EarQjhYXg+GDl0UJray2JHaLe/rlWbfNUnNgKW2hrfw6HAATTvhwfUVJVqHxflH+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linuxfoundation.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WKliloXlfaPyaKBa0RVlJ5vTtRW7fraoHqpYvBZrchc=;
 b=nxbyKMZlJNR8XtAkhGRqM68NA0VY3esvUeGjN3haWuL9s6xRrJB1IawkAOONh73r2mKKY+ommmasPx3mLnUQHFzL+HRfNQhTSo9kmI34aFnHdeP0vFdqNrq8PFZyi+KHBmCa/PExaSBxOKTBawqAgZ59IetSLuQoK7ifO5c65kg=
Received: from MN0P221CA0016.NAMP221.PROD.OUTLOOK.COM (2603:10b6:208:52a::19)
 by CYYPR12MB8853.namprd12.prod.outlook.com (2603:10b6:930:cb::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.17; Tue, 14 Jul
 2026 06:18:43 +0000
Received: from BL6PEPF0001AB74.namprd02.prod.outlook.com
 (2603:10b6:208:52a:cafe::63) by MN0P221CA0016.outlook.office365.com
 (2603:10b6:208:52a::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.223.9 via Frontend Transport; Tue, 14
 Jul 2026 06:18:43 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 BL6PEPF0001AB74.mail.protection.outlook.com (10.167.242.167) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.223.9 via Frontend Transport; Tue, 14 Jul 2026 06:18:43 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Tue, 14 Jul
 2026 01:18:41 -0500
Received: from xhdradheys41.xilinx.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Tue, 14 Jul 2026 01:18:39 -0500
From: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
To: <gregkh@linuxfoundation.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <heikki.krogerus@linux.intel.com>
CC: <linux-usb@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <git@amd.com>, Radhey Shyam Pandey
	<radhey.shyam.pandey@amd.com>
Subject: [PATCH v3 2/3] usb: typec: tipd: add read_power_status callback to tipd_data
Date: Tue, 14 Jul 2026 11:48:18 +0530
Message-ID: <20260714061820.537792-3-radhey.shyam.pandey@amd.com>
X-Mailer: git-send-email 2.49.1
In-Reply-To: <20260714061820.537792-1-radhey.shyam.pandey@amd.com>
References: <20260714061820.537792-1-radhey.shyam.pandey@amd.com>
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
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB74:EE_|CYYPR12MB8853:EE_
X-MS-Office365-Filtering-Correlation-Id: 9aba0ddf-8eff-41fb-b1bd-08dee16fc148
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|36860700016|23010399003|376014|11063799006|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	TbxenNXh0/OTNWRmU+IfYWYdIj4ak9yHHgEs4C+YsV5yJDfTQVz2RqRl3eG/it5ElVEPVbY0p7M4ZI7NmlSIz+o2mxcRphvGPJHJm6DxU3jpZKxINnBlMY5lQjkFJt1Y+3XXLbmBObpub78t4mU1ERG0KsidQ7bmWNwFE80NPbAXB1D21Oy+8EFpaseSlVrPrBfuGMRiKDSu5qM3Lgr34PX5akz4Xo9EqpjiuzS6oS3l0E9hPIZ0HjXNFJEOCDSsJgygdYTx8NBPzD5hWGeskFH/ZTuCrSzhm8wb8+NLeABFkXJQIGDI472T+4HVu3edWwUPw3uilz6KeQBGyu3LmRoDZ8f1tzdlJSZTHagezwccRI9ueHpQyZH4Sb/+UbI+sIja6KNw8UeXITeY+vmWiwo3yWknNxXHqCry1LHx3BXsM/fNCrNPdyTC39NtgAB5qbixw+F3Ne5Q7py0Pb0JC0t9pbQsAu4fYV2918nAA47Qf8tNGZct5s63zi/8wXwT/WHZU69+5k99rPsf1RmHd7q2DbV9dBGcpxbm+7fCdObRp1FsLdm2+JsdkSeRnuh74yGiW8nPxuSgWp9VvMfbmYKZ4LWv5aIGFL3CVJWmkqC8WQo1CTgJ4cFxmrovkud6dO7RUiKMfLASGYu3C5/OyGb5kOZWkJFB1XrSkjHgDpoWvw1wFuvTpXF46BwT9dhGk7QXK9cP0l708CKgKMr3Yw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700016)(23010399003)(376014)(11063799006)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	MNiOpPun43RNCHLS4y5WIcmDCD4TySx6c5dAzp8qbzfd3t9ohtiRzl7DizQ0HDS/Mq3G6r+IALzqdqwo0sBW1xkp+iWSvD34ag6ybL08jWbh7DbJsAxxAhJE4Logm7yxdezLLORpOyFxXYkvTFUyVge9npjUy/PVW5f7Wgw1B/y6KFjp4Sx+lfVIR3Z2ELAqRmdS9vphcxgMMcCc1+RVPEuqx3h7vPvyOsvyPcersQRuO8Iwlmu/D60J6H2Me20mA7kBRt/Ob1gThmcnknCRSbmkY/Wt9kovE9qGvGtvPM3w/djmHB3FZCTjpOCMsL9WYFB8s7iQQ8fnPDjexXvDhWk4E9B8Tg+9VllB9l2wSVj9dQPUOhF5jBcdJt4Fz7/w6+kyhZv4oqMUMTF2OMVTSvoyp004Wjl7bbv39VrizBNRbd65rtPk3E4o6XBY2tdc
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jul 2026 06:18:43.3142
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9aba0ddf-8eff-41fb-b1bd-08dee16fc148
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF0001AB74.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR12MB8853

Convert direct tps6598x_read_power_status() calls to use an indirect
read_power_status callback through tipd_data. This allows variants
(e.g. TPS66993) to provide their own power status reading logic while
keeping existing behavior unchanged for TPS6598x, CD321x, and TPS25750.

Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Signed-off-by: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
---
Changes for v3:
- Add Heikki Krogerus reviewed-by tag.

Changes for v2:
- New patch to add TPS66993 driver support.
---
 drivers/usb/typec/tipd/core.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/typec/tipd/core.c b/drivers/usb/typec/tipd/core.c
index b6335b36d384..9097b0d40a71 100644
--- a/drivers/usb/typec/tipd/core.c
+++ b/drivers/usb/typec/tipd/core.c
@@ -159,6 +159,7 @@ struct tipd_data {
 	int (*init)(struct tps6598x *tps);
 	int (*switch_power_state)(struct tps6598x *tps, u8 target_state);
 	bool (*read_data_status)(struct tps6598x *tps);
+	bool (*read_power_status)(struct tps6598x *tps);
 	int (*reset)(struct tps6598x *tps);
 	int (*connect)(struct tps6598x *tps, u32 status);
 };
@@ -897,7 +898,7 @@ static irqreturn_t cd321x_interrupt(int irq, void *data)
 		goto err_unlock;
 
 	if (event & APPLE_CD_REG_INT_POWER_STATUS_UPDATE) {
-		if (!tps6598x_read_power_status(tps))
+		if (!tps->data->read_power_status(tps))
 			goto err_unlock;
 		if (TPS_POWER_STATUS_PWROPMODE(tps->pwr_status) == TYPEC_PWR_MODE_PD) {
 			if (tps6598x_read_partner_identity(tps)) {
@@ -952,7 +953,7 @@ static irqreturn_t tps25750_interrupt(int irq, void *data)
 		goto err_clear_ints;
 
 	if (event[0] & TPS_REG_INT_POWER_STATUS_UPDATE)
-		if (!tps6598x_read_power_status(tps))
+		if (!tps->data->read_power_status(tps))
 			goto err_clear_ints;
 
 	if (event[0] & TPS_REG_INT_DATA_STATUS_UPDATE)
@@ -1026,7 +1027,7 @@ static irqreturn_t tps6598x_interrupt(int irq, void *data)
 		goto err_unlock;
 
 	if ((event1[0] | event2[0]) & TPS_REG_INT_POWER_STATUS_UPDATE)
-		if (!tps6598x_read_power_status(tps))
+		if (!tps->data->read_power_status(tps))
 			goto err_unlock;
 
 	if ((event1[0] | event2[0]) & TPS_REG_INT_DATA_STATUS_UPDATE)
@@ -1839,7 +1840,7 @@ static int tps6598x_probe(struct i2c_client *client)
 
 	if (status & TPS_STATUS_PLUG_PRESENT) {
 		ret = -EINVAL;
-		if (!tps6598x_read_power_status(tps))
+		if (!tps->data->read_power_status(tps))
 			goto err_unregister_port;
 		if (!tps->data->read_data_status(tps))
 			goto err_unregister_port;
@@ -1981,6 +1982,7 @@ static const struct tipd_data cd321x_data = {
 	.trace_status = trace_tps6598x_status,
 	.init = cd321x_init,
 	.read_data_status = cd321x_read_data_status,
+	.read_power_status = tps6598x_read_power_status,
 	.reset = cd321x_reset,
 	.switch_power_state = cd321x_switch_power_state,
 	.connect = cd321x_connect,
@@ -2000,6 +2002,7 @@ static const struct tipd_data tps6598x_data = {
 	.apply_patch = tps6598x_apply_patch,
 	.init = tps6598x_init,
 	.read_data_status = tps6598x_read_data_status,
+	.read_power_status = tps6598x_read_power_status,
 	.reset = tps6598x_reset,
 	.connect = tps6598x_connect,
 };
@@ -2018,6 +2021,7 @@ static const struct tipd_data tps25750_data = {
 	.apply_patch = tps25750_apply_patch,
 	.init = tps25750_init,
 	.read_data_status = tps6598x_read_data_status,
+	.read_power_status = tps6598x_read_power_status,
 	.reset = tps25750_reset,
 	.connect = tps6598x_connect,
 };
-- 
2.49.1


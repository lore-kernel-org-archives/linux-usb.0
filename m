Received: from CH1PR05CU001.outbound.protection.outlook.com (mail-northcentralusazon11010056.outbound.protection.outlook.com [52.101.193.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D65073033E6;
	Tue, 14 Jul 2026 06:18:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.193.56
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784009934; cv=fail; b=LqiY0RaLzTJgCqjDDB9ibQ11cl5DPXAPG162g+Za9WAXqsKW80De3HAJ/OxVDI/JVlf/q0lORpq7y7Fe0S8OIR0cGifxOeA/f1qVNY2ueKlgRrkhEnb1LHSW+GDwDZO8twzzOU0u+TtEyLFnRjScz/zZ3d68UaHJ9Qsu8Zzcp0A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784009934; c=relaxed/simple;
	bh=wlKQefAHTXuOPslDybQRufCCjG5Ok+jeBG1R0uy239s=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Kp6a6SvuSfOYOheiZe3wlhuXWaPwHhWY/ouBM2nE1sUF/OE8Y45hbZwlzAhHs9nlspY8YFdbhmEcvG5ct8p+rRpgC+pPWp04VW8RtyvOijlx8dUkGQuPqeeFzY34kK6YhkMVtLKQv3gYzctcFDOsrUi0/z6Gi53YzN49nohW/pk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=2QZKaU4x; arc=fail smtp.client-ip=52.101.193.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="2QZKaU4x"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cS/3pKICJlQL6rRP5s38/9xqWt6bF1Hkx8g1leNn7FV2uaVNqrBI1BAK9ShbbBK1S9n6rBInvRWRJbe1IC20dz9dxNilPh1UZxfaXqm+F2d06fjipk5Yplbi/gtXNNUHuI6ssE+X+/xAOMNcnvWyL8ytywjsvo231UxxIa/EWQKQfmvVT3tdqng5MmrzQ/7iv/8IzmxcJf2k99y5O/c0FDbEfy/cVigT80PzilTderxXxWlUWl6IRdOURiQRifR3GhA5fSSmprZNOlT5f9ypVB8Ki1BXl1XI7cNMwU+DT71a0DAfx55v04UaZHCEQkNz31Db1FXNFRJdezDdH7wkgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9K0YpmS4dE4BF+6oS+fQ6oAmmaedPOgiPHr6NHW1xMQ=;
 b=YuNJUajtJrGsrEI6zzeaaawO/IDhMX1DhNIS06W8yDmIE9p8xtNgRm/yl3eO4l3lx+FcdtsYlLk9LDyddaKLv5cqjWbnp14WesgMNTK7SS1kAlWEGTKZRLrJabzJkmtkWJoNCfwGo/1sT90cODX7lMsVrpWPW3/wSRxwS4cJ1XR2QQUVY4PUK4chz50nnWg/ehse48eu2+vEzNSZLsORqHM/rEbX4gsjoHC1gyY0/RrM3WCDPYivwFhk2ZnuDRJEdf0//tepsq/K0yV5LRuGjoT+PPwvrH5h0TA0FtbpUm30DSTEkVI/MJKJC6lsi2RSwysPBa8ZGARe6Zvg01/ppg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linuxfoundation.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9K0YpmS4dE4BF+6oS+fQ6oAmmaedPOgiPHr6NHW1xMQ=;
 b=2QZKaU4xxXbJaMGTe1GhX4Q43jdet9Fq3YIwMVER4rdES3AG2O8P2hUUjA1qNIPtSvPkGRK4HV6+XomC+GGkEzI+QyzGBYr+F0HWD7aBh9NHYHaJjs+Zb0PuinGUno6pEBwXWnz9yWLG1ZsFb9ilLYEN1o2SokAYSOME0KgJG1o=
Received: from BN9PR03CA0752.namprd03.prod.outlook.com (2603:10b6:408:13a::7)
 by IA0PR12MB8982.namprd12.prod.outlook.com (2603:10b6:208:481::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.202.18; Tue, 14 Jul
 2026 06:18:48 +0000
Received: from BN1PEPF00006000.namprd05.prod.outlook.com
 (2603:10b6:408:13a:cafe::a1) by BN9PR03CA0752.outlook.office365.com
 (2603:10b6:408:13a::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.223.9 via Frontend Transport; Tue, 14
 Jul 2026 06:18:48 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN1PEPF00006000.mail.protection.outlook.com (10.167.243.232) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.223.9 via Frontend Transport; Tue, 14 Jul 2026 06:18:47 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Tue, 14 Jul
 2026 01:18:45 -0500
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Mon, 13 Jul
 2026 23:18:44 -0700
Received: from xhdradheys41.xilinx.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Tue, 14 Jul 2026 01:18:42 -0500
From: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
To: <gregkh@linuxfoundation.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <heikki.krogerus@linux.intel.com>
CC: <linux-usb@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <git@amd.com>, Radhey Shyam Pandey
	<radhey.shyam.pandey@amd.com>
Subject: [PATCH v3 3/3] usb: typec: tipd: add TPS66993 support
Date: Tue, 14 Jul 2026 11:48:19 +0530
Message-ID: <20260714061820.537792-4-radhey.shyam.pandey@amd.com>
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
X-MS-TrafficTypeDiagnostic: BN1PEPF00006000:EE_|IA0PR12MB8982:EE_
X-MS-Office365-Filtering-Correlation-Id: e3e3affe-0bf6-41f5-52bb-08dee16fc3e7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|82310400026|36860700016|1800799024|3023799007|56012099006|18002099003|22082099003|11063799006;
X-Microsoft-Antispam-Message-Info:
	qQInE45B41Azi/Mh5T21DT86dcd+NXwLaW89p1vCwF45JqxvJ0bg+RNgLYVItWDPcoJwKOsyg4EpNR2ggLYHZ/lo1t3wg8hCYIgWaHQaXRvtm2YKpv/RTNVM0yA8aoGM7DP2sGXV6loqGWTf9huT08uB5Wwynm5FtW4hFzFAWIufus43fM9KUksmuCQ5bpXiHE53WBdllwmZPKlCi9+t9dXD/5/0v0cwfu8zihPWJx85cTT9tVHAf75qf/oEJ3cGNy67s2ZKhCLN6k4+BkajmaIi1KJ13ardDd+q7U4KiP2KQKzZ+gGV076MjqsrTZ12y86BqgTjDcV74GG5WRpoXRrY72HZc3NTQwADcKmI8rKfQIv68K6IvSXuoUlZs/3xBTKxxAxp2ccHhhj3ZZJFWfpF3t+YnmxsCgjo0bd8DGxdjnL4KvZkEut7GnolupJ5/1dyMCNfj/rMoTuqQSGg2Rn/zlJ5swYmNmzr3Bp4euhJORHRqMkwSos6cHZ5x+E8c9xJ2ugcxn2mteYXs6l3TpZPUhnsmTy7fJI2s0QnehsGm5GLHzVG58jAV3bc4BXmUIP8ZNS85Xv7qmiO3WzrPMemqhTCAgUVXi4NJMenSlVmmei0F3kJbEyGUQb/07/DacNZWiu4dX8JuI2MzBrODcA6TdsQFwFB6/8iLiJXRg0sDVIeNDRgnZbgV84C6JZIfQ7qesuiEPt0zu599AzsuQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(376014)(82310400026)(36860700016)(1800799024)(3023799007)(56012099006)(18002099003)(22082099003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	snZ6VXv7rIO1VT4SbCDqBUbsfD5ult4QbjH100KIOcMZuepzFefeNWh4Ab19XVo3NCZGcuVJcq6rVFskRDwJkoun7DTCNsqmP4QatLlv4Fn/AEg3KayG6BZc0rkJa85SGwtYZZDzzqlzrgCIeYcRUtf5NcMozLnKgU7nPkyZARCpWOCDj4rR6lzLZYlQRspP1IcNTX+P7kr+YH9z4TE1DI/8qmPcmro1JsQQRPWaR4qrm4WtXedBetpOxv6Uzhc+1wta4L4Lsm02JejuOkPXyvrAbLUBDo29q8tkhEfC79+eB1PQgqS/9khmtWlHLNi04+aGq1qOzm30PYjY8bsKxoLRw3YeBV/uHB5aN+elkjujK6dGhMN2A+nqDArjZHJEE1lTAyfxX5B4zudbjSRWMOLY+egbGCjUJMOV473R9arAvcnsXz7T4xgCsBhFg6I9
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jul 2026 06:18:47.7096
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e3e3affe-0bf6-41f5-52bb-08dee16fc3e7
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN1PEPF00006000.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8982

Derive power status from the STATUS register (0x1A) now that TPS66993
deprecates the Power_Status register (0x3F). Add support for the "APP1"
mode string. TPS66993 controller is configured in polling mode and only
type-c flip orientation feature is supported on AMD Versal AI Edge Gen 2
VEK385 Evaluation Kit.

Signed-off-by: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
---
Changes for v3:
-  Remove the unnecessary if (tps->data->trace_power_status) guard and
   call the trace callback unconditionally, since every tipd_data entry
   always provides it.

Changes for v2:
- New patch to add TPS66993 driver support.
---
 drivers/usb/typec/tipd/core.c | 64 +++++++++++++++++++++++++++++++++--
 1 file changed, 62 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/typec/tipd/core.c b/drivers/usb/typec/tipd/core.c
index 9097b0d40a71..522f56742aa9 100644
--- a/drivers/usb/typec/tipd/core.c
+++ b/drivers/usb/typec/tipd/core.c
@@ -130,6 +130,7 @@ enum {
 	TPS_MODE_BIST,
 	TPS_MODE_DISC,
 	TPS_MODE_PTCH,
+	TPS_MODE_APP1,
 };
 
 static const char *const modes[] = {
@@ -138,6 +139,7 @@ static const char *const modes[] = {
 	[TPS_MODE_BIST]	= "BIST",
 	[TPS_MODE_DISC]	= "DISC",
 	[TPS_MODE_PTCH] = "PTCH",
+	[TPS_MODE_APP1]	= "APP1",
 };
 
 /* Unrecognized commands will be replaced with "!CMD" */
@@ -631,6 +633,34 @@ static bool tps6598x_read_power_status(struct tps6598x *tps)
 	return true;
 }
 
+/*
+ * TPS66993 deprecated Power_Status register (0x3F). BC1.2 is not supported
+ * and the remaining bits are redundant with STATUS register (0x1A).
+ * Synthesize pwr_status from the already-read STATUS register.
+ */
+static bool tps66993_read_power_status(struct tps6598x *tps)
+{
+	u16 pwr_status = 0;
+
+	/* Same masks as TPS_POWER_STATUS_CONNECTION() / SOURCESINK() / PWROPMODE() in tps6598x.h */
+	if (tps->status & TPS_STATUS_PLUG_PRESENT)
+		pwr_status |= FIELD_PREP(TPS_POWER_STATUS_CONNECTION_MASK, 1);
+
+	/* SOURCESINK: 1=sink; STATUS.PortRole 1=source, opposite convention */
+	if (!TPS_STATUS_TO_TYPEC_PORTROLE(tps->status))
+		pwr_status |= FIELD_PREP(TPS_POWER_STATUS_SOURCESINK_MASK, 1);
+
+	if (TPS_STATUS_VBUS_STATUS(tps->status) == TPS_STATUS_VBUS_STATUS_PD)
+		pwr_status |= FIELD_PREP(TPS_POWER_STATUS_TYPEC_CURRENT_MASK,
+					 TPS_POWER_STATUS_TYPEC_CURRENT_PD);
+
+	tps->pwr_status = pwr_status;
+
+	tps->data->trace_power_status(pwr_status);
+
+	return true;
+}
+
 static void tps6598x_handle_plug_event(struct tps6598x *tps, u32 status)
 {
 	int ret;
@@ -1026,6 +1056,8 @@ static irqreturn_t tps6598x_interrupt(int irq, void *data)
 	if (!tps6598x_read_status(tps, &status))
 		goto err_unlock;
 
+	tps->status = status;
+
 	if ((event1[0] | event2[0]) & TPS_REG_INT_POWER_STATUS_UPDATE)
 		if (!tps->data->read_power_status(tps))
 			goto err_unlock;
@@ -1034,9 +1066,15 @@ static irqreturn_t tps6598x_interrupt(int irq, void *data)
 		if (!tps->data->read_data_status(tps))
 			goto err_unlock;
 
-	/* Handle plug insert or removal */
-	if ((event1[0] | event2[0]) & TPS_REG_INT_PLUG_EVENT)
+	/*
+	 * Refresh power status before connect - needed for TPS66993 which
+	 * synthesizes pwr_status from STATUS and never gets POWER_STATUS_UPDATE.
+	 */
+	if ((event1[0] | event2[0]) & TPS_REG_INT_PLUG_EVENT) {
+		if (!tps->data->read_power_status(tps))
+			goto err_unlock;
 		tps6598x_handle_plug_event(tps, status);
+	}
 
 err_unlock:
 	mutex_unlock(&tps->lock);
@@ -1072,6 +1110,7 @@ static int tps6598x_check_mode(struct tps6598x *tps)
 
 	switch (ret) {
 	case TPS_MODE_APP:
+	case TPS_MODE_APP1:
 	case TPS_MODE_PTCH:
 		return ret;
 	case TPS_MODE_BOOT:
@@ -1813,6 +1852,8 @@ static int tps6598x_probe(struct i2c_client *client)
 		goto err_clear_mask;
 	}
 
+	tps->status = status;
+
 	/*
 	 * This fwnode has a "compatible" property, but is never populated as a
 	 * struct device. Instead we simply parse it to read the properties.
@@ -2007,6 +2048,24 @@ static const struct tipd_data tps6598x_data = {
 	.connect = tps6598x_connect,
 };
 
+static const struct tipd_data tps66993_data = {
+	.irq_handler = tps6598x_interrupt,
+	.irq_mask1 = TPS_REG_INT_DATA_STATUS_UPDATE |
+		     TPS_REG_INT_PLUG_EVENT,
+	.tps_struct_size = sizeof(struct tps6598x),
+	.register_port = tps6598x_register_port,
+	.unregister_port = tps6598x_unregister_port,
+	.trace_data_status = trace_tps6598x_data_status,
+	.trace_power_status = trace_tps6598x_power_status,
+	.trace_status = trace_tps6598x_status,
+	.apply_patch = tps6598x_apply_patch,
+	.init = tps6598x_init,
+	.read_data_status = tps6598x_read_data_status,
+	.read_power_status = tps66993_read_power_status,
+	.reset = tps6598x_reset,
+	.connect = tps6598x_connect,
+};
+
 static const struct tipd_data tps25750_data = {
 	.irq_handler = tps25750_interrupt,
 	.irq_mask1 = TPS_REG_INT_POWER_STATUS_UPDATE |
@@ -2028,6 +2087,7 @@ static const struct tipd_data tps25750_data = {
 
 static const struct of_device_id tps6598x_of_match[] = {
 	{ .compatible = "ti,tps6598x", &tps6598x_data},
+	{ .compatible = "ti,tps66993", &tps66993_data},
 	{ .compatible = "apple,cd321x", &cd321x_data},
 	{ .compatible = "ti,tps25750", &tps25750_data},
 	{}
-- 
2.49.1


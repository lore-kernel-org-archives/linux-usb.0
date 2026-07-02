Received: from CH1PR05CU001.outbound.protection.outlook.com (mail-northcentralusazon11010047.outbound.protection.outlook.com [52.101.193.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A198438553F;
	Thu,  2 Jul 2026 19:06:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.193.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783019186; cv=fail; b=Rg2wqoDRiX8CSukZjy/Rqx374TezGklaqxdCUxWy+5JwcUYhz8qie5HYEVUmsKS/zaSFsn/nNktWBR/zPz393SosDmXYVHEWanWbWhAW+2wSPt8MEFluiMKM+2lIGOXdAuwLt6gCP+9qaaYdhfipaXi4+21giQPJHOXnR3baG8A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783019186; c=relaxed/simple;
	bh=Hf+Lr7YA+2IcTv5Nap77+AAo8wNO5HD0bXDaMZCQu8A=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=tsOWgA/YxWM3gBt+P60A10gDOxg6YAZPbWfm6CQVkj01jv4FD2T2/LqC0sr1CkT6LAXgA+zYYBLu2wV1QWjajfL82Nsy/DZLoBSZbzlSs4VHeRxHM31LcMRxUEzpOT7g0AzO95ETRobjhMCroPFwnjaHT0WRynOEPlC4yVI/O10=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=hujBVQ+g; arc=fail smtp.client-ip=52.101.193.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="hujBVQ+g"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xyeoNwhayMV/L33ipEs3k6t8DczA2Q+RjTmthZ8cQ1dRqGDlxoLL5PDCJlYpz2slHQB3sLy8Dy6phpWK89fKOyceLbNYXKHd+Af50xEUrOOmwAMN/xaFo/ePOPRnjExKuuIh6wB6cB3wPRtKyvhpFxOmay5fPq9IngP2Cu4CdX2PQAhrDz/yYx7rTtkpb9UO2xdWz/KH5TH/Kq1OIS1wky6B0rOWAht9F3gfpXhY/38VIs9sB++3TmxEacrJy866wxg7vgVGoJzY5Ey+EBDbT3R9yW6NwsRQSH401lycbR+81afCxzTfFnank70nxSgqBYU2tR1wuxYmMWsnLn7r+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NjFl6MxdgnHZKlrPEJbj7JTe5LQbaUA9iP7je1wI6zE=;
 b=L5hyunlllXpfjChxJejspuOjcyvLqF+q9LVNtLiu2+unRiMnr/VOiSslGINAAm9rQp4yIWrZX1JiwfUp3Oi6KxfJsMBVLwTBKAz5vI2oEAJ8HkGKMn85r70fEchWko8K6qlam9k5lOpLm35Www33BFzbKkn75DandMGeIxvIPJfNrjZ3GVu6GvQBTVjOKBIL2r31zTtoA9a1Xoi85y7pIBaJTzma5z6JXZtJkMFwPXKBOXex1R6n3n5MblTCLZTKh3pqpZTNXFi2LLP8YZhgnvRevaQAYFRtsNZEEYVvivEIToq18EE/PEL2arRYX2zldJrzkR2W3o48iJdz4r3RMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linuxfoundation.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NjFl6MxdgnHZKlrPEJbj7JTe5LQbaUA9iP7je1wI6zE=;
 b=hujBVQ+goX8v9K21r9YdvpRAvQ5FxIGl4AE5aZpZHyWRU6beGAAcHSkM45SNyfz5g/fBmHZe4QhKDmLgZunQSIEBEdADVXBiqRKqEn5swIOTTndcO+Rm3mT00rjhdJwqSUyAfQqau68sowVxc4lkXn27N41ZUB03aiqfknl/mWY=
Received: from DS7PR03CA0001.namprd03.prod.outlook.com (2603:10b6:5:3b8::6) by
 SJ0PR12MB6808.namprd12.prod.outlook.com (2603:10b6:a03:47a::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.19; Thu, 2 Jul
 2026 19:06:15 +0000
Received: from DS2PEPF000061C2.namprd02.prod.outlook.com
 (2603:10b6:5:3b8:cafe::63) by DS7PR03CA0001.outlook.office365.com
 (2603:10b6:5:3b8::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.181.8 via Frontend Transport; Thu, 2
 Jul 2026 19:06:15 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 DS2PEPF000061C2.mail.protection.outlook.com (10.167.23.69) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Thu, 2 Jul 2026 19:06:14 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Thu, 2 Jul
 2026 14:06:14 -0500
Received: from xhdradheys41.xilinx.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Thu, 2 Jul 2026 14:06:11 -0500
From: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
To: <gregkh@linuxfoundation.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <heikki.krogerus@linux.intel.com>
CC: <linux-usb@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Radhey Shyam Pandey
	<radhey.shyam.pandey@amd.com>
Subject: [PATCH v2 2/3] usb: typec: tipd: add read_power_status callback to tipd_data
Date: Fri, 3 Jul 2026 00:35:26 +0530
Message-ID: <20260702190527.1820671-3-radhey.shyam.pandey@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260702190527.1820671-1-radhey.shyam.pandey@amd.com>
References: <20260702190527.1820671-1-radhey.shyam.pandey@amd.com>
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
X-MS-TrafficTypeDiagnostic: DS2PEPF000061C2:EE_|SJ0PR12MB6808:EE_
X-MS-Office365-Filtering-Correlation-Id: e138324a-fde6-44d7-92b5-08ded86cfd20
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|376014|36860700016|23010399003|18002099003|56012099006|11063799006|22082099003;
X-Microsoft-Antispam-Message-Info:
	I1NLLNeUFQsmC37CqvsCuJvwSfapQ4dbcch9fcSWTAYot+4Bk7g2BaEF8ZcA6sY1h9ONc6SwsF7nQjI0z52baUi00el7tsyLy97ZGTIbd7bU98c74z9Br7r/Zh2DfHObJEzo2aNNqBA9F1rBUY7nUOrNAfKWofrxCltq5Sut53Xu3BRUDT4VwoWXNhxAfHbZ0WbGBOmYa4zl9Ywr/92uDBjiD6otsn1AWmUh5ASaOmVkSfPHAx7dffxwDC2TUCdW3NkzNB7tzRf4/wz0FKZPs/f6G2TynoiAxlmM6p6XJVzhOQ8l7fXBuj1EAufE/Y7HCLSxuMBsKqaBdAoYtr53DzTR2WARkNLegVj9X38dULiTIwfFj7BOUNPlGcHXzR/SVJ6fPYGOHVvL4ADaIu5vqcyZsgmjnNHQsz6OyBKtbfE9fCiFnOHmX8nKrKLELAqOPfqw6YIp5pmRdHUmufp9eqosqEDW5gHh2lOtjnvDzE0V0BcjfHQNcfiI9zG2F7N/mHR15oab1hk5j7HEjKY7wP7SA19NCzPqHN9P1bjZBqkREavhBZw/Ra8xULMZ8/MtgJfaDdMVUntmrolwTbhpfLaruEGDhv4EVBrsTcLlv8tG8iHMgoqlYMN1i/aj0bOsQoU4iefUjU7i3BhjzbXlK90/+TCYOV2g0HsTK+RZZkxZzI1zcfkRvDMrhoJQj5dzqvhIdIAFKhyiesG2sutjOg==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(36860700016)(23010399003)(18002099003)(56012099006)(11063799006)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	KVByZJ7K7nUxljGpZgzt+WFHq4iKLLU4VslBDP0FtpnL95ktXDPiOqxzYwR8xKIi55P0/I9HNaLBiu4IcwHWlY88Hyqb2GC9q2VNH6a+S5DfSf0KMS4JiIxp1oW9/HhTFQNmmeuGQrveAY93TaTJdK1Y2p5PBvOSO+LFfexNstBNjScrvAvwxzkypvxGI2Yerr6NFfp8JfqTrvqJqHkMYjWgiA6s8bPrQ26gtpjl9aFQdANsrguaObh//JTzHQag9kh7EfizqqB8xW2zRVfyxmpO8SQEXOZ59VTRhTlAOjuu5nAiBnYk/5/Zmih7tW7s+PGXeCTj9rci1WDNAH8BDrT5gI/Cgd131+l8U1qCRgTYNCZ5sT64iSQ3o7EsoTLmWWWn01F7eTwRKMXZVb5Pc2Y0bcRF3MjPzi7dMD1sx0srvxqUcokwvw9G3944XIFg
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jul 2026 19:06:14.7525
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e138324a-fde6-44d7-92b5-08ded86cfd20
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS2PEPF000061C2.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB6808

Convert direct tps6598x_read_power_status() calls to use an indirect
read_power_status callback through tipd_data. This allows variants
(e.g. TPS66993) to provide their own power status reading logic while
keeping existing behavior unchanged for TPS6598x, CD321x, and TPS25750.

Signed-off-by: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
---
Changes for v2:
- New patch to add TPS66993 driver support.
---
 drivers/usb/typec/tipd/core.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/typec/tipd/core.c b/drivers/usb/typec/tipd/core.c
index d5ee0af9058b..a6cb233a055d 100644
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
@@ -1836,7 +1837,7 @@ static int tps6598x_probe(struct i2c_client *client)
 
 	if (status & TPS_STATUS_PLUG_PRESENT) {
 		ret = -EINVAL;
-		if (!tps6598x_read_power_status(tps))
+		if (!tps->data->read_power_status(tps))
 			goto err_unregister_port;
 		if (!tps->data->read_data_status(tps))
 			goto err_unregister_port;
@@ -1978,6 +1979,7 @@ static const struct tipd_data cd321x_data = {
 	.trace_status = trace_tps6598x_status,
 	.init = cd321x_init,
 	.read_data_status = cd321x_read_data_status,
+	.read_power_status = tps6598x_read_power_status,
 	.reset = cd321x_reset,
 	.switch_power_state = cd321x_switch_power_state,
 	.connect = cd321x_connect,
@@ -1997,6 +1999,7 @@ static const struct tipd_data tps6598x_data = {
 	.apply_patch = tps6598x_apply_patch,
 	.init = tps6598x_init,
 	.read_data_status = tps6598x_read_data_status,
+	.read_power_status = tps6598x_read_power_status,
 	.reset = tps6598x_reset,
 	.connect = tps6598x_connect,
 };
@@ -2015,6 +2018,7 @@ static const struct tipd_data tps25750_data = {
 	.apply_patch = tps25750_apply_patch,
 	.init = tps25750_init,
 	.read_data_status = tps6598x_read_data_status,
+	.read_power_status = tps6598x_read_power_status,
 	.reset = tps25750_reset,
 	.connect = tps6598x_connect,
 };
-- 
2.43.0


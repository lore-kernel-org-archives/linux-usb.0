Received: from CO1PR03CU002.outbound.protection.outlook.com (mail-westus2azon11010023.outbound.protection.outlook.com [52.101.46.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8635D382377;
	Thu,  2 Jul 2026 19:06:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.46.23
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783019185; cv=fail; b=hNdM6FvQu9MyteKgB4+4oxXlunMXR0P9rdn8sC7+ZLeNJARaTkkAg2vwnXVO0iwr4h1O1intqCPCopqUcOqyu9VxLNIeEqGUiFUr/WcWF6NgriMhcwkrkUbZxFMeNBqesrI47pXucgSPZhxVrBIc2C3D93rwmRqLqUyth/s3mxI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783019185; c=relaxed/simple;
	bh=RzVh9pqGDmo6ZPC3Y5PJ7N2+Kmr318G8wryff3qtPbg=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=GpLQMoSxiQGe0bsnJWFYPBNSXlvwcN7/Z7N/5ZvgK8cmCuA+tZHZF88w4WlXfKnSe/rS+Tx7J4PXLl6wM4Z/VU8HkQZqKaSkgCXG2orTyyAlwhC5sj9/RZS6bDp+RbZTEL5IBVUwUQUT3xKsNet9pS9TQHnhkK1D8eVda8I7xiU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=s3rWPys3; arc=fail smtp.client-ip=52.101.46.23
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="s3rWPys3"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rA2TuvH4ZlipXgfiBNow4mHc8wP6nifcGImom/0Z56Bb9uNANNmzCT8y9wbGZdElFalBeLp3pMKr+llVegSa1HrrC0EnV19Fjw+2vBrUzIDlT/ddVvKop7dxHRu+u7ANTNBrYVXIIttNENkN3DSE/Ch3iyO+JRdQGYg0XX8Ebv/awHKZNEFQh9a6NwxBSEZ0T1bCIm5lhoVMtpaxbcgB56rrsZceJQjaNpX+M9Vy7KrGgu3yGouWxKTWsAGYFb9S9HyT5s/bry4ELsBBm1s+L2hTTKxpqZSl+fuBtTGQqzuAnWkP8V3AWU8Jj+KxqRhmSYa08o42Sq0DprA7OSl4jg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VDwXNA8n+pxgGDT+6nnTUeFQNY+Cwy9CdXGOGpnkhMk=;
 b=k9/jKiLAdLP38PrH2n5URxJyTWmt+qFpwlmz7svJZLTlMx4vmKS9wDodrXWWoa2GWyooa5QSee3vWQqN50ue3VMcOKQPXiOKHQ0byNLo+YSH/7I8RH/NoSGlsoREJEFLvcWvcIE4paL2LjBN7O4Xf0rP0eLlj5mljYcqPgV6IfGantJYN7KObl7zGeOJrkhgS+bIPF3UOjWxjqhYhfdp/WIe6UZrVQ6BuAXi+hL9P1bp9Aljp4QpNhigjAGxCga2TFQJfcX43kRHwzTxAcN6CABEZQTavc1aDFFqXuAoLOF9js0UcFchuJ9X//2BTKmaak94AACCAWgY7Gz/aNqS5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linuxfoundation.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VDwXNA8n+pxgGDT+6nnTUeFQNY+Cwy9CdXGOGpnkhMk=;
 b=s3rWPys3prLHc7EySj3pJtSDwo5fUwUGGIvbe/39XxfKI2K6+MM3QsTM8sVil6uPww/3tWGDx8o0Vt1KiP+kC2E5djMyAZyQ5LWPvmAp5t+oxNPH6H5FeFr3NZZoDl5hFrIaw7E/Os043+FsnxxY5un0oI0spZ0hCAuTTOpB9AU=
Received: from SJ0PR03CA0108.namprd03.prod.outlook.com (2603:10b6:a03:333::23)
 by IA0PPF9A76BB3A6.namprd12.prod.outlook.com (2603:10b6:20f:fc04::bdc) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.9; Thu, 2 Jul 2026
 19:06:19 +0000
Received: from SJ1PEPF00001CE8.namprd03.prod.outlook.com
 (2603:10b6:a03:333:cafe::32) by SJ0PR03CA0108.outlook.office365.com
 (2603:10b6:a03:333::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.181.8 via Frontend Transport; Thu, 2
 Jul 2026 19:06:19 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 SJ1PEPF00001CE8.mail.protection.outlook.com (10.167.242.24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Thu, 2 Jul 2026 19:06:19 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Thu, 2 Jul
 2026 14:06:17 -0500
Received: from xhdradheys41.xilinx.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Thu, 2 Jul 2026 14:06:14 -0500
From: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
To: <gregkh@linuxfoundation.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <heikki.krogerus@linux.intel.com>
CC: <linux-usb@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Radhey Shyam Pandey
	<radhey.shyam.pandey@amd.com>
Subject: [PATCH v2 3/3] usb: typec: tipd: add TPS66993 support
Date: Fri, 3 Jul 2026 00:35:27 +0530
Message-ID: <20260702190527.1820671-4-radhey.shyam.pandey@amd.com>
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CE8:EE_|IA0PPF9A76BB3A6:EE_
X-MS-Office365-Filtering-Correlation-Id: c23401d3-feb2-460f-0bd3-08ded86cfff0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|82310400026|1800799024|36860700016|18002099003|22082099003|11063799006|56012099006|3023799007;
X-Microsoft-Antispam-Message-Info:
	9mQoiAhia/pY5bFzut84T9heCIVt3q+lAT0qQ6y0PnXp4w19/CR5lVHGf6vXqoLfxNWCLNeP658cO2ZVDKZB1nWWKExs3gADvhZVPeJugAdYow6dE9mnMuAw0fkVN25F63P0U6tzRlTNSDiBFbaDoblDuEBjtyq6V4/L9NihvuQgVMgzAMeSbqbuWEf7imOoIQy5y/X+r1y4U7FdOWkpI3J+E3IiTSeDM+iH6u/KTX2N1WOrDaWE2yLyPhTUmFcsUQRoQaDktT0v/iBMBUgEHXHJ6kAdzdfPBhsqKNjvAzJCJjJLtkl+A6TpXilQ/v/79phOFRGyAhT219sPWRe2SSmUilNZBdyXIfe1288Cbehkt27n0EXi3Cr08e2oWrz7MFIEB6sbUsg1DBN+doHdG49uxFnJdoLuqGyS07LqlQx0bWGNO4Lq1WxKajhbUCQyc3izsrnyDjA7KzlB/mO3gQo+n+SHVPWN/XnT+GIIuOxsMxBH6IB4NG+e8rJcybhbGfcLh5A7U7A/WSgek2xK0VHgQDevzNB93jbOg943gHD6ORl1zjqvWXRQZESo6f83BryIIErijZjI7F7LzcH28xpzyYjJgtkZTL/X57eUEmpAI1z2hlDGbEVkS6PziQw+2JT6geDlOmblF+C5RImyUknh7fx6jgKwWaoXzD2YOi+ssQcm/00EfuV1NVSX0UXwU82ILYq/oBZS+J2yCRDs1Q==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(376014)(82310400026)(1800799024)(36860700016)(18002099003)(22082099003)(11063799006)(56012099006)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	zgayBs8d4SiY9BhjpuoZAgS/1vTusVAYb0zGXVcV+nTPa6cN1zTGraBnTe3Y3C5tVS3rfUgw2XgRXDUoEh1o8EHOlkmPvT+4sWaZHd4BzZUPmfpLO3g9MotZvPPm31oIUnNZvJRoOU2CJcFy+cwnldjoKTPMjpWZEVhASlAkn147H0Bj2SMZnYrFrEyj50EdHk5fbEX2oEDE29B/viZ4V6MxOdJJ06RVZqic2kE336+yNyJ2kFXxgB816qhEaoUGIe3qiA3gQ2K37LkNqsvvO7qVKcpRUtQ+N+BjLiPEQBaQYyb5GT5YECp+al01kqlUio5Rqcy+++zWIh73STa3RvS0Bu+pMq8dydYO7qV84Ad5/OUJOzKHZXdZUAiBp0nTfBa71sddGVOe1+6HI3AUqbeVYbvRkJ5sgZyzGm4Xq8zdTlF/P76CpMRhkX64viGW
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jul 2026 19:06:19.3904
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c23401d3-feb2-460f-0bd3-08ded86cfff0
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00001CE8.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PPF9A76BB3A6

Derive power status from the STATUS register (0x1A) now that TPS66993
deprecates the Power_Status register (0x3F). Add support for the "APP1"
mode string. TPS66993 controller is configured in polling mode and only
type-c flip orientation feature is supported on AMD Versal AI Edge Gen 2
VEK385 Evaluation Kit.

Signed-off-by: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
---
Changes for v2:
- New patch to add TPS66993 driver support.
---
 drivers/usb/typec/tipd/core.c | 65 +++++++++++++++++++++++++++++++++--
 1 file changed, 63 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/typec/tipd/core.c b/drivers/usb/typec/tipd/core.c
index a6cb233a055d..d2394d23a2dc 100644
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
@@ -631,6 +633,35 @@ static bool tps6598x_read_power_status(struct tps6598x *tps)
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
+	if (tps->data->trace_power_status)
+		tps->data->trace_power_status(pwr_status);
+
+	return true;
+}
+
 static void tps6598x_handle_plug_event(struct tps6598x *tps, u32 status)
 {
 	int ret;
@@ -1026,6 +1057,8 @@ static irqreturn_t tps6598x_interrupt(int irq, void *data)
 	if (!tps6598x_read_status(tps, &status))
 		goto err_unlock;
 
+	tps->status = status;
+
 	if ((event1[0] | event2[0]) & TPS_REG_INT_POWER_STATUS_UPDATE)
 		if (!tps->data->read_power_status(tps))
 			goto err_unlock;
@@ -1034,9 +1067,15 @@ static irqreturn_t tps6598x_interrupt(int irq, void *data)
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
@@ -1072,6 +1111,7 @@ static int tps6598x_check_mode(struct tps6598x *tps)
 
 	switch (ret) {
 	case TPS_MODE_APP:
+	case TPS_MODE_APP1:
 	case TPS_MODE_PTCH:
 		return ret;
 	case TPS_MODE_BOOT:
@@ -1810,6 +1850,8 @@ static int tps6598x_probe(struct i2c_client *client)
 		goto err_clear_mask;
 	}
 
+	tps->status = status;
+
 	/*
 	 * This fwnode has a "compatible" property, but is never populated as a
 	 * struct device. Instead we simply parse it to read the properties.
@@ -2004,6 +2046,24 @@ static const struct tipd_data tps6598x_data = {
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
@@ -2025,6 +2085,7 @@ static const struct tipd_data tps25750_data = {
 
 static const struct of_device_id tps6598x_of_match[] = {
 	{ .compatible = "ti,tps6598x", &tps6598x_data},
+	{ .compatible = "ti,tps66993", &tps66993_data},
 	{ .compatible = "apple,cd321x", &cd321x_data},
 	{ .compatible = "ti,tps25750", &tps25750_data},
 	{}
-- 
2.43.0


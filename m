Received: from BL0PR03CU003.outbound.protection.outlook.com (mail-eastusazon11012063.outbound.protection.outlook.com [52.101.53.63])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69C9E418A58;
	Sat,  8 Aug 2026 13:19:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.53.63
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786195197; cv=fail; b=Nn5074KJNrf2pozk2pfRYCnkY0NVwG86AzYjsvTJDYFHC8yPz3BSHghKOVGclNoUQ1ED30p1dFFjJOfG4XK9M9TnXDS2o0IwzJmRsJOgbtirNYgYO1VUIW+79dbX7lQ+90NL8b6nN+t4Ev9+HZpkdjFXuBVfNRfrq/QZYALA4FQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786195197; c=relaxed/simple;
	bh=0ORTyNROEfIiO5ZPvUUSnay20GK/ToSq/W8fPCi+lfE=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=dvP7dpbeJgCa9TqoYGC7GFGx5fk/PWh4QFDAQ7yoHTH68bD6CtUUlCSUmTLSKvQDxrbh6WavZmkksV9/2/K/r8N1UmX5QkXm8zTvMh+LjGZv/BrgV3wFfX9LrqEoUj/gMx9YD/C3Tp1GSoGvmwyAvofArFoeoLeXk44HxCIXJMs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=MC+EKn8d; arc=fail smtp.client-ip=52.101.53.63
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="MC+EKn8d"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iT6JBhwD/6MxI/Zx8mqAQBE/inENP2wKFy5shQ+igU8jNoRfVBPTxC8DEzIZAPItgofcwBL9jwAYSziFrsuAuDK11yDrvdNqDANcmfdyPDCVeYM7S9YKSAY7tSZ6y5T0aflpA/6FpLwo+edRuqi96ZTdapIJIkR+DVJkuH8LN83Yy5027iK6cZEiw8uh9V/st40b9TizuTtxu6B0XzkvF5H3JJn4X1IsoP9Pw747ljXjOpFNkOPPhHzuPa/KASEvW/Z9PeMTxAggHwd52OZvSpKPcbSj4DFxvw1fNOjwOEt9mvUyg1RBuJhScKhWrjlWegh39HYB4wtTbMMZe6rQpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1qRtxZ9IUsXO+NPPmvBs1hEvXNleoTT8okFVC1jSixU=;
 b=nPf1eyPg4FmYIehsjQ2hjboGYzDQTrrUZ5BVORkZzXF4CIRFLe4eTgh6o9OtyhLGIo7VQfw6M2/B7zAQFqKf1TVxfzisYHfpuU3iJy4XDzB6cNoXOFbVOA6vavIOHZ3h01Y5qCppMppo8qa1P0X011EWKlsNrL+Df8X2BDFUGQJbDmgXMrJrbVY79duGOdjKmhZN/hx/OAIoOkG7y6VDro0JHnE6n/vNsgQFGmiFdoVZjXf2LT0IdraKFH/8fqazDXrMqZIsQ3pgpIlOO3zsH7UhhzM96f9CN+N3QXLHfz5CCVLZzQgFVsmVN+ayah9h/8QFRpQDySx7hQrywwEhsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linuxfoundation.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1qRtxZ9IUsXO+NPPmvBs1hEvXNleoTT8okFVC1jSixU=;
 b=MC+EKn8dNj3xw5NLvre65LTAV6SP9WEbFQzHJWWHJ/18+7RU6byFAVkX3whlf6Rds/7UEdAAb+yeCkRlHy5cJix6kNOaJd/elAZtMbZYheBd+33pHhjyvaa9PlQMwZ3ByeeSplsqZOiMhSM0H+oKyeGiJRbAdgvxt2CGw+7tfGs=
Received: from CYZPR05CA0017.namprd05.prod.outlook.com (2603:10b6:930:89::14)
 by SJ5PPF75EAF8F39.namprd12.prod.outlook.com (2603:10b6:a0f:fc02::999) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.19; Sat, 8 Aug
 2026 13:19:44 +0000
Received: from CY4PEPF0000EDD4.namprd03.prod.outlook.com
 (2603:10b6:930:89:cafe::5d) by CYZPR05CA0017.outlook.office365.com
 (2603:10b6:930:89::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.315.10 via Frontend Transport; Sat, 8
 Aug 2026 13:19:44 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 CY4PEPF0000EDD4.mail.protection.outlook.com (10.167.241.200) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.315.6 via Frontend Transport; Sat, 8 Aug 2026 13:19:43 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Sat, 8 Aug
 2026 08:19:43 -0500
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Sat, 8 Aug
 2026 08:19:42 -0500
Received: from xhdradheys41.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Sat, 8 Aug 2026 08:19:40 -0500
From: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
To: <gregkh@linuxfoundation.org>, <jiashengjiangcool@gmail.com>,
	<Thinh.Nguyen@synopsys.com>, <zzzccc427@gmail.com>, <kees@kernel.org>,
	<christophe.jaillet@wanadoo.fr>
CC: <linux-usb@vger.kernel.org>, <linux-kernel@vger.kernel.org>, "Radhey Shyam
 Pandey" <radhey.shyam.pandey@amd.com>
Subject: [PATCH 2/2] usb: gadget: f_tcm: validate UAS command IU length before parsing
Date: Sat, 8 Aug 2026 18:49:27 +0530
Message-ID: <20260808131927.214132-3-radhey.shyam.pandey@amd.com>
X-Mailer: git-send-email 2.44.4
In-Reply-To: <20260808131927.214132-1-radhey.shyam.pandey@amd.com>
References: <20260808131927.214132-1-radhey.shyam.pandey@amd.com>
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
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EDD4:EE_|SJ5PPF75EAF8F39:EE_
X-MS-Office365-Filtering-Correlation-Id: 2c1d6528-f4ae-49af-ce36-08def54fb602
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700016|23010399003|1800799024|376014|6133799003|56012099006|22082099003|10067099003|18002099003|11063799006;
X-Microsoft-Antispam-Message-Info:
	xsATMpqYRh0UrsEFGyPlewdkTtASqTGliPxYp5/c96unT+lxlLjFSpbRUHvrIYOHlH9CATlWyUU/J7LdRCpTlUIuOWd8abDyiFivDnDYbvy6JP9q/d7unFXsCBKCRGr3T1oGznxUh8Pbg0Hb6hsdmu9QTBjE83gMjzDQWn90v77R3gFRgENVRMuQWZKKAU1JJxlDvX9GjKH9Jd7NAvp+nSJAa5uCfApydjl14mwB+KEF0DxKO8T+gmW4WSwTLUSAQzahJkYSCjISq5XAgNRTwahvq6V5LKMyQmqUKGX4C04PddCoQByLTvJGCZhMfmTXzmPTEc+vxyMr/OIlhfCqAbHV2bb3tsZW3OZd7mcTsxs64lQXQBRFgPJ/Pzx27qpLE+O5kGR3x10b5GZz7pMrRr0zfaqNahdHVbE2PQ5RQE9CH7+MFBNVyyoPaxeq8qs4BLuUGSgQ4c/MTIBcPAqqDXsr7aLabT6PcathXiq7c06rGDroIetH3yhp//VwPNg4nXZfUMAe3//XazpoRlXbUPoY6Aavtitzic0z1EIGnetOVhYtZK01k/ATQqFoa1i9x6DtbEOpN5MGlRiqZoOJghfXxAwPRU2xHvhcl87yzmHLWt7WZJqDR41NqHG/vLppevo4k1P8M6Yhg+BTKZS1TEphyG9L/okIZwpjbe2aymeYt/xix49lDDDPw/+SBkaR4KQxjpOyNa6EatiDx94dhQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(23010399003)(1800799024)(376014)(6133799003)(56012099006)(22082099003)(10067099003)(18002099003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	jO1OC3AfIHhW6WWVAuRQ4v3OpFRi4J0B/6DMIdM2O4S25cBqmH4onBtG9sgcgTgRfVVzHeCefLG8ejJ2FoUPgPv8ev1LFIDRHbpFR0bORaDES2ZvIvP/MszVWhZpN9GwEdcHqAR4yC5084VOU/DcUDjMva2TYj897v7+CqTBNnNmVt6x6an2oegAJG5EmhBAtyyaG8mMBjpxJV5yoghbn7Gi7uZxxCOQqnMhaIhpTCdH/LtvVB8QZy43QSuXWE760xbU1VVW1BtKBLBBu3fX8nHvrqByPA4jf81eze5QRWNzDqox7S2XxWdXD5ZgXFYqHMmzLBIliWSWhg31fsvEfx6CKX4Kon3ZH+ihTm0bDWeW8yWFB6sR9gOeaKafVYSFZK6MShWGVg46oAw7Loo+h2ttzuhMsBd6K56EpgqEHMgjxylm3yz6izQIRzf3GPti
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Aug 2026 13:19:43.7175
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c1d6528-f4ae-49af-ce36-08def54fb602
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EDD4.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF75EAF8F39

usbg_submit_command() parsed Command and Task Management IUs from a
buffer sized to ep_cmd->maxpacket without checking req->actual. A host
could supply a short IU or inflated cmd_iu->len and trigger an
out-of-bounds read when copying the CDB. Validate the received length
before parsing, matching the BOT path, and re-queue the command
endpoint request when validation fails.

Assisted-by: claude-mythos-preview-high
Signed-off-by: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
---
 drivers/usb/gadget/function/f_tcm.c | 33 ++++++++++++++++++++++-------
 1 file changed, 25 insertions(+), 8 deletions(-)

diff --git a/drivers/usb/gadget/function/f_tcm.c b/drivers/usb/gadget/function/f_tcm.c
index 565ad1934755..4b30b23ddac0 100644
--- a/drivers/usb/gadget/function/f_tcm.c
+++ b/drivers/usb/gadget/function/f_tcm.c
@@ -862,6 +862,7 @@ static int usbg_submit_command(struct f_uas *, struct usb_request *);
 static void uasp_cmd_complete(struct usb_ep *ep, struct usb_request *req)
 {
 	struct f_uas *fu = req->context;
+	int ret;
 
 	if (req->status == -ESHUTDOWN)
 		return;
@@ -871,7 +872,9 @@ static void uasp_cmd_complete(struct usb_ep *ep, struct usb_request *req)
 		return;
 	}
 
-	usbg_submit_command(fu, req);
+	ret = usbg_submit_command(fu, req);
+	if (ret)
+		usb_ep_queue(fu->ep_cmd, req, GFP_ATOMIC);
 }
 
 static int uasp_alloc_stream_res(struct f_uas *fu, struct uas_stream *stream)
@@ -1382,6 +1385,27 @@ static int usbg_submit_command(struct f_uas *fu, struct usb_request *req)
 		return -EINVAL;
 	}
 
+	cmd_iu = (struct command_iu *)iu;
+
+	if (req->actual < offsetof(struct command_iu, cdb)) {
+		pr_err("Wrong length for UAS command IU\n");
+		return -EINVAL;
+	}
+
+	if (iu->iu_id == IU_ID_COMMAND) {
+		cmd_len = (cmd_iu->len & ~0x3) + 16;
+		if (cmd_len > USBG_MAX_CMD ||
+		    req->actual < offsetof(struct command_iu, cdb) + cmd_len) {
+			pr_err("Wrong length for UAS command IU\n");
+			return -EINVAL;
+		}
+	} else if (iu->iu_id == IU_ID_TASK_MGMT) {
+		if (req->actual < sizeof(struct task_mgmt_iu)) {
+			pr_err("Wrong length for UAS task management IU\n");
+			return -EINVAL;
+		}
+	}
+
 	scsi_tag = be16_to_cpup(&iu->tag);
 	cmd = usbg_get_cmd(fu, tv_nexus, scsi_tag);
 	if (IS_ERR(cmd)) {
@@ -1398,8 +1422,6 @@ static int usbg_submit_command(struct f_uas *fu, struct usb_request *req)
 	cmd->flags = 0;
 	cmd->data_len = 0;
 
-	cmd_iu = (struct command_iu *)iu;
-
 	/* Command and Task Management IUs share the same LUN offset */
 	cmd->unpacked_lun = scsilun_to_int(&cmd_iu->lun);
 
@@ -1434,11 +1456,6 @@ static int usbg_submit_command(struct f_uas *fu, struct usb_request *req)
 	}
 
 	cmd_len = (cmd_iu->len & ~0x3) + 16;
-	if (cmd_len > USBG_MAX_CMD) {
-		target_free_tag(tv_nexus->tvn_se_sess, &cmd->se_cmd);
-		hash_del(&stream->node);
-		return -EINVAL;
-	}
 	memcpy(cmd->cmd_buf, cmd_iu->cdb, cmd_len);
 
 	switch (cmd_iu->prio_attr & 0x7) {
-- 
2.44.4


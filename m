Received: from TYDPR03CU002.outbound.protection.outlook.com (mail-japaneastazon11023079.outbound.protection.outlook.com [52.101.127.79])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F0AA38B158
	for <linux-usb@vger.kernel.org>; Wed,  2 Sep 2026 10:15:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.127.79
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788344143; cv=fail; b=KTsiBEzEXU39fcSurC2/+iXAfbbQ3Pb0x82tzEC7L/5RWXE6TqPOjgUfOXUFavnrbuEGpmYjDGTLgYUR2wwqow8gNcxIat6/LZNKn72yTQLQ3eTPiY4TTN9yqnPCTGRsHId50uVz8f06e93XT5Mn4kjVkl84OrtgcCgWOCDQLxw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788344143; c=relaxed/simple;
	bh=mRswU8U2bW1dh8zItL11yAsMeYKfRnrzlvWuSlB7dZY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=eblGh1x8/OY4DREDJCm/QiH/kGh3vrq6k4wqBUfqWZgnWCOja3mhPey8hAn5fmZAsSBGCZmF+MPG9bjl9zf/RKOrvdJowz79+G0FPHZf3224kYh7ZrBYKk0uUbQs4013Tluegb8lZlm3Rrj7dpPo1UgXXKq3ptBpjuwQbcJtfio=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qnap.com; spf=pass smtp.mailfrom=qnap.com; dkim=pass (2048-bit key) header.d=qnap.com header.i=@qnap.com header.b=M16OtSKU; arc=fail smtp.client-ip=52.101.127.79
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qnap.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qnap.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qnap.com header.i=@qnap.com header.b="M16OtSKU"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DsWOlSKgiqtw2GgSI3VqfY50SZsG3DrMdcPlSU9yBswIuNgy2Epv0YVbHJjEz2vLvJKwQe+NkIdKrFBcg1jTpNOVIUvbfhnBn+KE84LSDDHcKZw50RefOpeKl6mLv+G+7g17SbmXrbXNtE6W9jRoVRIVISWT7iDqoSdiqKeTfjlxqg4ZNX25yhTHMf/xXxM3Zt7lKylzMBGY3L/uKkt2Ic2rBXjPEU6kgqMCPeCcjzRjk19cQ+dVcPOn/WrZvlOpfGBIDSPngBl9CHI1VkWJcHDs/GKWNk3ifD8kdhXVLYIOPKCohlFx6wtFM1mrdKBLUa5GdobL74up0q42QhUt2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J1RowBJLK/qU45Bt4tkXEjuWIK1J97V6FklDocVfIHQ=;
 b=wWZERYSDWjM6iRI2u+xEFNNWdRRWx4CZedXuCXovbfgHQgGcMbZScFgq0GiDcV2h65LoBIJyeQqA+sAk5jzGGL/E4nVXOLELUBKonBBEG9o7dUvGRRCWqyK021OJxeVV4JSfZACSv9hNe1XHo+OMmp1SsqoSCC9V0eGKMJtnKFL8hvODoNKvnDMIrtRyTmIzIP/TAEmBP27Ojx2LxGf+3jOS7hCNlce2PwfK5JN2ImnQjB7nj09Kg5MRCs7d1qijj7EQXyG9tk3kCW6tKPCYdnRuyXZYYYxlKhOuWWfRaPLSVxgIDMaYkdKLmtkGhCaJtTG2AnFN/ASsFLC2joF2tw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 122.147.219.42) smtp.rcpttodomain=intel.com smtp.mailfrom=qnap.com;
 dmarc=fail (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=qnap.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qnap.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J1RowBJLK/qU45Bt4tkXEjuWIK1J97V6FklDocVfIHQ=;
 b=M16OtSKUx87ZMnd0PpJFW6Hl+SdL+C3/kxfFfh9eDlJ6BF39i3gEoe/RnkT0KfK98Dck87TOPgdQ0sIZUIMOa1SVdtSlHUxY8n1kC9dfjCTZZKEdDzF2c/d0ZSTfaK5xzfq9TjMSX7EOhADZUhns3DIOv76DkAP7/KsR+UoD/FfiHH+Mi2a7+BKA/G0alnFxnQqxjE6XpFjJQtInJUGmFwdpWr7W06KijVl/RhFPq7nCifvV5UMqyBgWY/H44EfrrE2vMRU5ReYnz0CQJi4kNOeMYIdn6TypLqdsx8MRpjgbkddAvDbbS3v9WjXh7DD/QLOrzRybu7edd43s2UlLAA==
Received: from PUVP216CA0002.KORP216.PROD.OUTLOOK.COM (2603:1096:301:16f::8)
 by OS8PR04MB8164.apcprd04.prod.outlook.com (2603:1096:604:28a::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Wed, 2 Sep
 2026 10:15:34 +0000
Received: from TY2PEPF0000AB83.apcprd03.prod.outlook.com
 (2603:1096:301:16f:cafe::19) by PUVP216CA0002.outlook.office365.com
 (2603:1096:301:16f::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.382.11 via Frontend Transport; Wed, 2
 Sep 2026 10:15:33 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 122.147.219.42)
 smtp.mailfrom=qnap.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=qnap.com;
Received-SPF: Fail (protection.outlook.com: domain of qnap.com does not
 designate 122.147.219.42 as permitted sender)
 receiver=protection.outlook.com; client-ip=122.147.219.42;
 helo=mail19.qnap.com;
Received: from mail19.qnap.com (122.147.219.42) by
 TY2PEPF0000AB83.mail.protection.outlook.com (10.167.253.4) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.382.8
 via Frontend Transport; Wed, 2 Sep 2026 10:15:33 +0000
Received: from localhost (unknown [172.17.22.73])
	by mail19.qnap.com (Postfix) with ESMTP id 97C3AD03;
	Wed,  2 Sep 2026 18:15:32 +0800 (CST)
From: Henry Tseng <henrytseng@qnap.com>
To: Mathias Nyman <mathias.nyman@intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org,
	Henry Tseng <henrytseng@qnap.com>
Subject: [PATCH] usb: xhci: return an error if the host is not halted
Date: Wed,  2 Sep 2026 18:15:10 +0800
Message-ID: <20260902101510.30246-1-henrytseng@qnap.com>
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
X-MS-TrafficTypeDiagnostic: TY2PEPF0000AB83:EE_|OS8PR04MB8164:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 0dd655a2-f941-4540-e83f-08df08db1fa9
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700016|23010399003|376014|82310400026|56012099006|11063799006|10067099003|18002099003|55112099003;
X-Microsoft-Antispam-Message-Info:
	hprGa9Ol6xDFfWu16Qi7aC/vsPn99Ads39N6XwBshkqkzDHCteyf35Vu9uI9UigLAricxk4TSpb53AhZlKvATsmqv2RMwTe90V9a36zihl9kv3/0FRfpVOM7DdlWV8s6r7QoqDl2Gg+vzkkjSoI8M3lFPzsWD01dLUuwQAHZgjKnacEPKBYiyKLD5BTEXoM3pUYo+3Q45dL7dTOznaZY++8h9SAnE+nrXTCnuHrHy/vfm4QDcUikpWeyqTGFldY7l63JBsjClyqBX/8rhu9aGiqqjzMoz//K6TKzsW2SPcFfE1ECSuR1UE9c2TxgyG0gw8X2HGZu0SXtyVGwtDJNJImDqIuJabKkuma1c5FzXr2x0qBH7vUPUn37sY6faooSiDmZrq4PUReeJjVxGMchQ/QEnD7UdvqXNaHFKmwchO+HhlGq6Z3ACm315wvp+VMO8MwZOMcaPU5MJkAZ2Sg2qiWyAYgMLQuyTaFSkfJ7nAq4uhzt4VgcignVKQh91A3AUgm1iA+bctL3bMMiHg5aoh9BqDIAfnbDTiHKs2un0B3SpHpFF60/N7Eqtz9bKr0nosG7ca+pyp6/ZLBUVmywjnwhAOynSUhXK8yayiXWWqBcd987j6XjRDZ/BMAwGJvFmdKzAobRQdegY8d4gWSPSUksV5C8Qcv85xtD6wC+zQpWDEMx69P450URXz/J7ibg698YAAxfS/j+rXaCrNEV6w==
X-Forefront-Antispam-Report:
	CIP:122.147.219.42;CTRY:TW;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail19.qnap.com;PTR:122-147-219-42.static.sparqnet.net;CAT:NONE;SFS:(13230040)(1800799024)(36860700016)(23010399003)(376014)(82310400026)(56012099006)(11063799006)(10067099003)(18002099003)(55112099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	yutnQWFU2BfWsIIwlPy7lxmrX0XEt/13cYoNl4z3eLRzeDkwN04oUq+7q1LXgHLHuh7zIit9/fp1ZuCIxyGx2YYK54a3c7YVT1kn80+1n9Pjm++/lSq9Ll0Y4CrUJpUT0V/M0EaUyB0Z5Lciu9m/dLcsmz7nbywoM3jupJCtIdzyxzLQZyocVwYNXsJwY+ElV/74/Ox+vtFVy+G7/nRb4A5ZZ1htr59N2yjhakcFhRUChca124RDyU0/SxxZ6OvHRp7hIA7c5oxrguBNGOcPeZo2GiZJhBPMKTm3Ezsj5bhHPrsC8Z7rQYlgSd+OSue6ax/+bLovwuOgbLM7J40815G6YHdO+08x1aX/SRGHZzwbBGX+nxrAze5FXrC96QhtnN7qJ252+5A0/ryfpp5mPj0cDv5jfLueVcpELiM126v40nw197IIX1uw11S58MwR
X-OriginatorOrg: qnap.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2026 10:15:33.0864
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0dd655a2-f941-4540-e83f-08df08db1fa9
X-MS-Exchange-CrossTenant-Id: 6eba8807-6ef0-4e31-890c-a6ecfbb98568
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=6eba8807-6ef0-4e31-890c-a6ecfbb98568;Ip=[122.147.219.42];Helo=[mail19.qnap.com]
X-MS-Exchange-CrossTenant-AuthSource:
	TY2PEPF0000AB83.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS8PR04MB8164

xhci_reset() returns 0 when the host is not halted, without ever writing
CMD_RESET. Every other path that fails to reset the host returns an
error, so callers that check the return value are told the reset
succeeded on the one path where it did not happen.

Return -EBUSY when the reset is aborted because the host is not halted.

Signed-off-by: Henry Tseng <henrytseng@qnap.com>
---
 drivers/usb/host/xhci.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/host/xhci.c b/drivers/usb/host/xhci.c
index a9e47e178c28..2af6a7b91e55 100644
--- a/drivers/usb/host/xhci.c
+++ b/drivers/usb/host/xhci.c
@@ -195,7 +195,7 @@ int xhci_reset(struct xhci_hcd *xhci, u64 timeout_us)
 
 	if ((state & STS_HALT) == 0) {
 		xhci_warn(xhci, "Host controller not halted, aborting reset.\n");
-		return 0;
+		return -EBUSY;
 	}
 
 	xhci_dbg_trace(xhci, trace_xhci_dbg_init, "// Reset the HC");
-- 
2.43.0


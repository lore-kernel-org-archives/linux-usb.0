Received: from TYPPR03CU001.outbound.protection.outlook.com (mail-japaneastazon11022140.outbound.protection.outlook.com [52.101.126.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E3DE411693
	for <linux-usb@vger.kernel.org>; Wed, 30 Sep 2026 10:18:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.126.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790763501; cv=fail; b=ISjNEdRW0Zs8Nt7trzwhe22PCMBEbxFX5gZT1I+oO3uGX7feCiAU2tQC1VFmMxweXNMhj6OT4ybooRoPFs0vKHn4bdwtxiXAO35TcW0FzLmeGThJMFPkfPj6e460Y7pienU1DHmGrdmeWrj0iTXSBVsadh8job+cYqIxRPQbgpA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790763501; c=relaxed/simple;
	bh=SSBTcG6UGlYWIVfD90cg+oUC4gQNyLprR1nmgWuMHl0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=jdsuivS2X/LCZMbEANw/zbOqmASaura+/T9oqmP6RVg0M1OgbNRK9DN66CHXbgSjNF/WysF2gxTcP/xnSwx9pWTi/ePrv6OVtk/h02V/dZy4ecKYYM5QbJt0McxEjRY/pcc++O01/r8xvi9BdPsBn8DmXylbqFwQ/5/PPidaejE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qnap.com; spf=pass smtp.mailfrom=qnap.com; dkim=pass (2048-bit key) header.d=qnap.com header.i=@qnap.com header.b=cAX2/0iQ; arc=fail smtp.client-ip=52.101.126.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qnap.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qnap.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qnap.com header.i=@qnap.com header.b="cAX2/0iQ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=E23wGuqroH3DeuS0pB4TLs5ocOgRNp96GstjsalEazBI2MNHj0wHvLCZKR82yolb5EcE1sSKwTc4z2i0543bMN98qbs6GvziFvDttpIrw/pl1l7QmosyChvB6vB6D0xyC53zEyJRNto08kD7WCVF/fVHv4/FkO7fWbBkVYjq8KAsBbOf0OMYZhKag5GzaxZIMMzRHADEg2MHZUfYDS3qP8+ObhwD6EyeCuJz6j7mh78M8mtNzzjJc54lWxgvh1+sUbG6r53qF4MXkheoKtPBL+aJ305gj1CINg+ChVd8tWI3CCmv5oPFvisUq8xZrePD+pmVtn/RflTpi/sNV/UcSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bnRisDTf01IO/RcvBnRFwNcLkuFFI04KPC1viUQe8RU=;
 b=J6yY/9me4U9hVGMm9PXiHFdoMzw8+G20fVUJGGaGDtGMCisFjhka7+LA7atWb2O8GSAGJljGUU4a4wTLApncRy6lAPOZQx5zczjm+fMNdO6oE0y+Wfycz9b7RpOkQzTCAMndigwzgps+dM53WLHjFqMvbaQhYyX5SdQYaS11aaDmr7hqN05vySHgTUJgvfer35PcuOw38fxWWNNMZzI1wxHm3iWwuD1522FyY1+q201dX2Ie9S+NtCstrvsQIQHrRelGLSvntkgzTCqgPA5YMHjEXqQsVrYXWh3lbDnNgQzYDhtm9E4bfAr6Oyp8d7E8e/pIA/WHuuGcFiJ807qAbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 122.147.219.42) smtp.rcpttodomain=intel.com smtp.mailfrom=qnap.com;
 dmarc=fail (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=qnap.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qnap.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bnRisDTf01IO/RcvBnRFwNcLkuFFI04KPC1viUQe8RU=;
 b=cAX2/0iQc1lAVSo4tbdCdxKLWbUwDjQyLSX0UOuH/AYKzAkAszgY9R9p9c+Jt8opHj18lOsUpWWvmHQvlkJPiC11HYqpDZYm9S1R8G1fNvlGLP6cmgZbBAKktYH4B3w6zbaPhA6NqcltNifm2hJIs217zPxdLIu88IvBFb5jfw9G783299gDan8OyU45Uz4TSWNjrAMwbh4X8f0VYTv+DZqDBXCp1/PzBRyc2dmAcHC8KpVdd8wniiaDQwgTpYmQmGrNaG2+LcZbsZMbeqtvbeD9tLWQyo/peaMKxhRxHty6jwks1kcf6gkAbAJUZrRCmZ4XQtxjEl1GZ4WqL2xdjQ==
Received: from SG2PR01CA0197.apcprd01.prod.exchangelabs.com
 (2603:1096:4:189::8) by TYNPR04MB9619.apcprd04.prod.outlook.com
 (2603:1096:405:3c1::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.18; Wed, 30 Sep
 2026 10:18:14 +0000
Received: from SG2PEPF000B66C9.apcprd03.prod.outlook.com
 (2603:1096:4:189:cafe::8b) by SG2PR01CA0197.outlook.office365.com
 (2603:1096:4:189::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.15 via Frontend Transport; Wed,
 30 Sep 2026 10:18:14 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=fail (sender IP
 is 122.147.219.42) smtp.mailfrom=qnap.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=qnap.com;
Received-SPF: Fail (protection.outlook.com: domain of qnap.com does not
 designate 122.147.219.42 as permitted sender)
 receiver=protection.outlook.com; client-ip=122.147.219.42;
 helo=mail19.qnap.com;
Received: from mail19.qnap.com (122.147.219.42) by
 SG2PEPF000B66C9.mail.protection.outlook.com (10.167.240.20) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.14
 via Frontend Transport; Wed, 30 Sep 2026 10:18:13 +0000
Received: from localhost (unknown [172.17.22.73])
	by mail19.qnap.com (Postfix) with ESMTP id 8A850202;
	Wed, 30 Sep 2026 18:18:12 +0800 (CST)
From: Henry Tseng <henrytseng@qnap.com>
To: Mathias Nyman <mathias.nyman@intel.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org,
	Henry Tseng <henrytseng@qnap.com>
Subject: [PATCH 1/2] xhci: make xhci_handshake() timeout wall-clock based again
Date: Wed, 30 Sep 2026 18:17:51 +0800
Message-ID: <20260930101752.15794-2-henrytseng@qnap.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260930101752.15794-1-henrytseng@qnap.com>
References: <20260930101752.15794-1-henrytseng@qnap.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SG2PEPF000B66C9:EE_|TYNPR04MB9619:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: f441b897-456f-4333-97c7-08df1edc2291
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|23010399003|376014|1800799024|82310400026|10067099003|11063799006|6133799003|55112099003|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	BWHSCA+ORNcTI96tpsmyBVaxSd/2s9MgeXmlsu4ROWrbQiyf2STT0stosXa2E+WogSUlZbzMSAdDrE+0Pf0oiE8N12txBkhNvZs7JCjfQMJQyHuk/JmiscGV28VJ8OJTPxzyqb+5eLMIU6MNqsQy2yHdWMgdfhsNVdMTNwhr4/0NaQnT6DGxa3hE8q+W/Zs3kP8NuyBsJ92OK0dFSuMGO54b9qjSWanQuwVtiAi7xIyx0OmOgNAt2BWfMmGcqxzI1AiGcSaFIBxFGWw4sxH5g2qb+jAGaq5299VSkgVdnQmFasacArWSY85PDBsq9BoFKqZdf1xpCyIn7cOmNu/ttxms3zcPrAtqQhuszJVYscFohgU+JXF8g4qOQL7nhJMdbiv5jzEs/VaMQMUHY2IObDN4xYARcmd3Lkc17bcfDrMIsTg+HqqtpFSz+aYq66RK04uRSiGHc4iJWZxcw237nim59ZdraB0jgwFmtsi9R24mld2OMxIZnlMRZD+7Q/tAl5IdlJUqYD3thpp1cagL6H3Ga7Yk5RotU1IKyxFbI62pgxY0n1YjnfjZ9bQYpBHJpxlTswCLwjI5lfnm8MxKd2ofJiCwNpkXnoHTmYy81jvlYlFdPd6OeAzTtcXhZ4e6lRoQBgMey8XrvEl4uKlmhCDMbXAe/QoOLAEFuYfzWmHFB4aGUizxNu8+8oND45LjtOGssahdTY8vwq9dmc9PiA==
X-Forefront-Antispam-Report:
	CIP:122.147.219.42;CTRY:TW;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail19.qnap.com;PTR:122-147-219-42.static.sparqnet.net;CAT:NONE;SFS:(13230040)(36860700016)(23010399003)(376014)(1800799024)(82310400026)(10067099003)(11063799006)(6133799003)(55112099003)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	dYPhTGgBqIgX5ZN0NTN9ig2an4Wo5AV3exfwQPnIvESuhNsnb3xru+mQXg2a8wiOe803cPh29m0R+uo0Uexay5WwTAaArVtLAJJHiHWgPsy/ESAa0uvbVPp86MRUiqqV/7xYbW40WFA7Au/YT2JGtO/vm/kdOJQUCE2onhuh9RnsTpHXDTog5u8SWXSn2oJb2Tyvw5f0dUJMXHv5F2Qk4338atQjDU/e775FDO/ccQluolkQiJJwzCy7rKZlyR/xeAS5xJ8xJaOkFaa7GOJkpzdkgSvrTZf+PDviGqVHZEQGypDhNUVdwuK2F5RisjUhurWL6Fp4YRplwm3mzfKmROdqBYCyinCBf3KDvntekjeG2/eEsbKiiDNJ59sWAHherG6PXAhmP4AlqpTFWBl2YRjOLtTa3DSfXr9xnDesgG9wdmuH4tvtNAanF1moHXC6
X-OriginatorOrg: qnap.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2026 10:18:13.0141
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f441b897-456f-4333-97c7-08df1edc2291
X-MS-Exchange-CrossTenant-Id: 6eba8807-6ef0-4e31-890c-a6ecfbb98568
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=6eba8807-6ef0-4e31-890c-a6ecfbb98568;Ip=[122.147.219.42];Helo=[mail19.qnap.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SG2PEPF000B66C9.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYNPR04MB9619

xhci_abort_cmd_ring() waits for the command ring to stop with
xhci_handshake() and a 5 s timeout. On an AMD Raven USB 3.1 xHCI
(1022:15e0), after a configure endpoint command failed to complete
during device disconnect, that handshake returned -ETIMEDOUT 15.8 s
later:

  [   86.086412] xhci_hcd 0000:0c:00.3: Command timeout, USBSTS: 0x00000010 PCD
  [   86.086450] xhci_hcd 0000:0c:00.3: Abort command ring
  [  101.924383] xhci_hcd 0000:0c:00.3: Abort failed to stop command ring: -110

xhci_abort_cmd_ring() is called from xhci_handle_command_timeout() with
xhci->lock held, so interrupts were disabled on that CPU for the whole
15.8 s.

The timeout budget is no longer tied to elapsed time. xhci_handshake()
originally polled with readl(), udelay(1) and a decrementing
microsecond counter. Commit f7fac17ca925 ("xhci: Convert
xhci_handshake() to use readl_poll_timeout_atomic()") replaced that loop
with readl_poll_timeout_atomic(), which at the time computed its
deadline with ktime_get(). Its commit message notes that this also
fixed a bug on AMD Stoneyridge, where udelay(1) sometimes took over
10 ms and a 5 s timeout ran for over 15 s, triggering the watchdog.
Commit 7349a69cf312 ("iopoll: Do not use timekeeping in
read_poll_timeout_atomic()") then replaced that deadline with a locally
estimated one, which does not account for the readl(), however long it
takes.

To fix this, restore the readl() and udelay() loop, with the
decrementing microsecond counter replaced by a ktime deadline.

Signed-off-by: Henry Tseng <henrytseng@qnap.com>
---
The overrun was measured on v7.3-rc5 by calling xhci_handshake() on
USBSTS bit 5, which is reserved and zeroed, so the poll always runs
to the timeout:

  ret = xhci_handshake(&xhci->op_regs->status, BIT(5), BIT(5),
                       XHCI_RESET_LONG_USEC);

XHCI_RESET_LONG_USEC is 10000000 us. Elapsed time was taken around the call
with ktime_get(). All runs returned -ETIMEDOUT.

  Intel Core 9 273PE, Alder Lake-S PCH USB 3.2 (8086:7ae0)
    unpatched 19121395 us (1.91x)   patched 10000001 us
  Intel Core Ultra 7 155H, Meteor Lake-P USB 3.2 (8086:7e7d)
    unpatched 17161328 us (1.71x)   patched 10000001 us

 drivers/usb/host/xhci.c | 20 ++++++++++++--------
 1 file changed, 12 insertions(+), 8 deletions(-)

diff --git a/drivers/usb/host/xhci.c b/drivers/usb/host/xhci.c
index a9e47e178c28..8169d30dd40e 100644
--- a/drivers/usb/host/xhci.c
+++ b/drivers/usb/host/xhci.c
@@ -86,16 +86,20 @@ static bool td_on_ring(struct xhci_td *td, struct xhci_ring *ring)
 int xhci_handshake(void __iomem *ptr, u32 mask, u32 done, u64 timeout_us)
 {
 	u32	result;
-	int	ret;
+	ktime_t deadline = ktime_add_us(ktime_get(), timeout_us);
 
-	ret = readl_poll_timeout_atomic(ptr, result,
-					(result & mask) == done ||
-					result == U32_MAX,
-					1, timeout_us);
-	if (result == U32_MAX)		/* card removed */
-		return -ENODEV;
+	for (;;) {
+		result = readl(ptr);
+		if (result == U32_MAX)			/* card removed */
+			return -ENODEV;
+		if ((result & mask) == done)
+			return 0;
 
-	return ret;
+		if (ktime_compare(ktime_get(), deadline) > 0)
+			return -ETIMEDOUT;
+
+		udelay(1);
+	}
 }
 
 /*
-- 
2.43.0


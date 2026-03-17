Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012035.outbound.protection.outlook.com [52.101.66.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BED21A4F2F;
	Tue, 17 Mar 2026 03:03:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.35
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773716633; cv=fail; b=uHVji5As/ex87XgA6tgXV+MCeg44JdF7rN9bbWVTTnEyRYNj16tV8Hv3wB1q7JtmeeKTox4TzfXOPRqMGo+FpXWhQG52JM+GMWDt0oMxn3VlBxKeO/LB3JiOlD44IKULTXPKv8FuOC0YwD18ZGXISs7EEACXWqVt+gV1Bcvecgg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773716633; c=relaxed/simple;
	bh=NIBgcijCBES0AAiVLsGeDOZcN6ma4iUFSpBnqPjdoOM=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=aVvGREGeSWLr1bxR7ZaqFM+KVB8coPTRB28HTjA9Fravb0Becp85bWoaXb2Br96SAivMGprioZNLDs/MpJwbjpf0aDvhwoAjf3p3xo27pPWITWOmhvLR5UU/lZoMYzDR5pPz7UGKG+SU8LHVgpFzedtRXRh2gOjWd82RsQdsPVs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=VasspV8p; arc=fail smtp.client-ip=52.101.66.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="VasspV8p"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PYH12VYTpjcgZfVJFMKMIaeGlfy/jZFoSOStIIyubRRpr840K4CrdbZ9O34C60FPI+5XzKRqxqUACLrUctoRsLWE0rXR1R6aVKDKWIZd5uXtaEmUQsk7Xo89S07CMf9Ogv7c4aMq0MTZbLTX1fRsNnvXjtIH8bw28KlWiTQYZ3XIaq2PsPANvg6I6koWZydspbJEgr13nvdyXLZe7lauNY+E3y4/EhpqzLIu5cq11MMxTDByzmHWsldlNtSrfG0SQuxfOuHLzBRWZTHaUSxzAUChglvwqWoSOJoDDswO/nSzdtESJqy3x1N0xunWtvtX+0d3PpwCW11Un1NmhANqsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C8MwDfUojx/c26V4vpzGe2oCFICxNzOdSEmEmZ0qfoA=;
 b=ZHPNFYuEpn6lBGbWLIrWDIPrDAB/jgC34oZqVavqiKLTZfPQM0/GXy+XjcOfMD/aSgLrJ2TXqj5GFAwx8VNsmt2L2l+0CYnlbo8fMT8HqS4AG6lSrJFin/y8mE9d82CRT1lrgNqLnYBqpBmX4Qv9jpw9q+dOg2/oMNOP7tJ4WkNtYjCzkIZ1s8Ed2ugKe4HPbxRSXZEP6x5oLLXzAPTQOmJ687dAUUKZA5rCnBU5nlaRSvB2owqGF8oZOo1pChJ6L7P6yFuJ6e2dbX0rKh1enonmJKFthEUyZaX7gt+PZDe+ZoB5VRtZ9RZTgMBozPZlbTo3Ojq9z8y/MBdWTUDPPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C8MwDfUojx/c26V4vpzGe2oCFICxNzOdSEmEmZ0qfoA=;
 b=VasspV8p/xvghZbz2cbKLj4MplPph0z4Gp7jDMzC6rTlPSPyArV3PflqM3V7ohj66nm3dxf1Sfpbu0CqDtKlZzaNZW6/GT14gWpZlfD9K6ba1ywsIEZKeCeSyyrA+oj41+z6hTDp21YWG+RZRE6LSU2T5R+h9+F4NL0sxc5h1htRVBzLWiTeX/7Uhxk4oTKaJklcuFnuyMZsKOFav0RaNhIhJvv2LaEoC02zfw/mbBibYR4+PKpuHs3QsF6ytYXb+pGjVdVLkOTyOmZDwOdkEtcCMTBfK8IHDQeVaBRwNfDFskoCj+Y8//Ub00Pf5H4GQ0H3sf6TdVaV6nHc8KM6jw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
 by VI0PR04MB10878.eurprd04.prod.outlook.com (2603:10a6:800:259::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.24; Tue, 17 Mar
 2026 03:03:24 +0000
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::c67b:71cd:6338:9dce]) by DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::c67b:71cd:6338:9dce%5]) with mapi id 15.20.9700.022; Tue, 17 Mar 2026
 03:03:29 +0000
From: Xu Yang <xu.yang_2@nxp.com>
To: Thinh.Nguyen@synopsys.com,
	gregkh@linuxfoundation.org,
	Frank.Li@nxp.com,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com
Cc: linux-usb@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	jun.li@nxp.com
Subject: [PATCH] usb: dwc3: imx: avoid calling imx suspend/resume callbacks twice
Date: Tue, 17 Mar 2026 11:05:46 +0800
Message-Id: <20260317030546.1665206-1-xu.yang_2@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MA5P287CA0013.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:179::11) To DU2PR04MB8822.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::11)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8822:EE_|VI0PR04MB10878:EE_
X-MS-Office365-Filtering-Correlation-Id: 0f3da5e9-9f1f-4fcc-ec2e-08de83d1c3a9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|52116014|376014|19092799006|366016|18002099003|56012099003|38350700014;
X-Microsoft-Antispam-Message-Info:
	OISdrtTtUH9Z2FY8z61ZbQrcIEZI55yO7QkAP9rtAv8ZjKRcdwVSBjMQ0tZVcQFbGXDVGwSXu75r9wS63mW8egwW4IIx6m+w7m0Uy4WyOW+qy8rZR9KkRfp43tbfPWryEPn+xEdpZAslX6s0/2hTEnQJynk/sChQyfvOC1cZiKDCvO3vBcSRKWxcVmMoBuiEQ/VmTXPK22qYux8vjQbDkdqgiWprV5WK64FbdG/nve2oVJ0fxjBYaKKfAMVOKq1c+isBCUXb3QMqxQ3V9rd3Boddn93SFO1KcsHBDO3toeKoteXoXuJjijT1CYktROIzyV64TCFtB5yratLecX9mzMpkqKXXiiA8bm7idwMibaWQu8qlpL5Eg+x6CFYcg9mnUzMUnmEFdekRwAxZpX/PgsuazSbwuEqlPh8ZIXNV4O3sgHt2R9HwpeMpLf3Hyhr8GdDHZJbABz7ugD5a3om6ZyCBDCwzmBo/hXfKJIbVhqkPMYHM8exhpbonUb5diem61t/gEVUwL+t0d+JqQZ8K10IdVewY/MK6M3bcgdhQnYo/hbaEnfQ33HShuxm1D4uqrnd+XfBUcNKmEiMGI6WF/41LMw3LnoGEg3N8FkLpwo8qes6nPkA8b1ZeCbDXu2eMY2+lE0S8ttpqYelE8bQSWpAiZpNVyOuWakvAoiEdxl+/t4J8xaUtkVmE7I2VUX6ziMVAXz1buxSjVqz3n/xpvNzNL1dbE8HXQwWgmK54FnSsrwbieEczIx9olD3lGbu3kdMPCSlceC4lO3RA5BpZFpDnfGv5hiocRFnwErburws=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8822.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(19092799006)(366016)(18002099003)(56012099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?yyjPyMrYzieNJ1spMuMZaUNE4fxeu4I/WkaBjkMYpDdrzStE12YaanO9QkXf?=
 =?us-ascii?Q?agjbPrH6qEqppjc0AUY2o60QwRquxb3lZ/4RKKYGmV2gMfYsKS7RYqdXa/DA?=
 =?us-ascii?Q?bn8bpVJhF/2yY1jiBHijpe1sHIe+VLlvDyu6j5AtBgPdRuJs71T40DloMz9G?=
 =?us-ascii?Q?Rtb4bcH0TeSNgcCCioXV/GY4U7oKRl56rHc5B6RoALicXs+My46N0iw157s0?=
 =?us-ascii?Q?NpAO3La/TbVUIwSLI0j1A26XUNs+V+K3s/ngfgfurHJJDnNAeqHZDtkvMSbx?=
 =?us-ascii?Q?ApdnQbRmwdaN8ysBHZ3Zo4H7WBCQD5rBAWGfY+wklM754VPfoNMBVFByOybt?=
 =?us-ascii?Q?X1YNvB7BRN6rmP4rN9L3XFx2GH0NVkwdcH7oEGaSrFR/RXvhX4cQaNfTPaCi?=
 =?us-ascii?Q?v3L/RD4p7HrrJIsvNWP04tDELgh7Y/akn2mkYzzf/UqUouyWbsxXCOb3yLzX?=
 =?us-ascii?Q?T3ShS68l/jEUuRp8+E+ZY700Pw3cE8YXN7UElnLpEP7gD8+mJxjpdbFBc2Oa?=
 =?us-ascii?Q?fTY1PepPo/JL0Ifu4zLqvMRo1vswS2u0ThRdpVbgy5vSnfQQR8KLfq2GgxwZ?=
 =?us-ascii?Q?3n6yB+VFHYWqQvHJNy/PSleK7InVbnE5A9OqIfpr1zZbkBgZNlSPM6p3t8ty?=
 =?us-ascii?Q?7ajy5vMUjZHAirj4ANeo4jiZGjjjBxeN2BpEkD1NpPrmH3rjQoefC8FsNSEL?=
 =?us-ascii?Q?1rUah3YMTBMY4Vj38NPs9MAM3ZPKfyhZRI2rR64VjnsGRvKmvVDBiVR+WtnV?=
 =?us-ascii?Q?HwvleTlQ5/0h2Z2IoMOexhq3EkwTd5FrsZgK3xAxJ65UQtihriW7KFfZxk2d?=
 =?us-ascii?Q?tQoDkvQ8I89YstwuydtDvcztunIjmlzIW+/iuPSHSFNRkx7zTqCpgAn5chVy?=
 =?us-ascii?Q?khuwOdxAxqXRg2RXmKIB65t7MS+F+38Ckz+0a1ijTqs7CnxSpiEqZBOSmHdI?=
 =?us-ascii?Q?owj1dR35RF2+3pTbRwBUvjGspD8KO3Td/SQlli1L9zQu7Awbeq49xO8SD3Z/?=
 =?us-ascii?Q?BxttufLOcP67gmUEx1nRqtU3fOYM2ZDaSi+ZsRzYfvG0mHYnGM9I09qA545O?=
 =?us-ascii?Q?+8pQMax0mF6+imhbdxfTVA9EY4A30M6/BOTJd4E2pAiaHGeECm8Tdm4/0pEc?=
 =?us-ascii?Q?63FE4Fa8L+fZCbMXwgo/+mjqQV4LD4AwXzoG6M5ckhVbiPlPcvS34N9Um7Wr?=
 =?us-ascii?Q?+epWj4iDL9JIWhyw85B4jcea3Kj4D/YReI4+am3FwlMX1ky2hmplKnSwj3bm?=
 =?us-ascii?Q?ZJOJKPoAEMLqBhdA/LQpfgxbTTgewqkLEck4WCKU2ugBDX4NXEE2qALvlPgr?=
 =?us-ascii?Q?/sQF89g6ilq6XeKj/PVCmJZLd0tzAw5nnTijbR6S/I2GeJGiTcPDbdpKeZqE?=
 =?us-ascii?Q?nVQpbIuejzp1qzCRZPY+RSvT6zL3k0HFyYB5B1XwK4E1dBBvq7vhWnCvy3X6?=
 =?us-ascii?Q?3QMyvxV2yXQNfsrdsBA+l9Me+jwje3P1B7S9md3HcnSx+V+F5EDE/iQ8rVvN?=
 =?us-ascii?Q?fejq9vqtAbdDDxIuy4F4/4uwszF/TzWBh7GvexJ0FIkZap9Xo529RoYwmTIu?=
 =?us-ascii?Q?dNajQfuGex5/84CvuEWyf34HP9iQy2nqEX93+IMD2Isa168vs4gYmnIwxpgp?=
 =?us-ascii?Q?bujOYiBJ1lUpXjIh6k7fiPHPK3GnkkF8Jadf5LpuIMgmP/7CZcMVxlo+jCUb?=
 =?us-ascii?Q?GEWuwAfXDgYaiP64QGYnw/uWaPbyBjg8r4B0Bu/Mo4xXjJyPmNeurLbkuv/4?=
 =?us-ascii?Q?AbpLiACQQQ=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f3da5e9-9f1f-4fcc-ec2e-08de83d1c3a9
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8822.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2026 03:03:29.2317
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1N5FIs9t4MLXkA67MmIwhPgHiRHH9Y5WGlTlRJc3JWtqFP+iMXlPBlFfV08UJnuA1HqLVxkg+Nwh3Xinq4QYNA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB10878

If a runtime suspend is executed followed by a system suspend, the driver
may invoke dwc3_imx_suspend() twice, which causes enable_irq() to be
called twice as well. This leads to an unbalanced IRQ state and may
trigger warnings or malfunction. Prevent this by checking the pm_suspended
flag before running the imx suspend/resume path.

Fixes: 76fc9452a6bf ("usb: dwc3: introduce flatten model driver of i.MX Soc")
Cc: stable@vger.kernel.org
Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
---
 drivers/usb/dwc3/dwc3-imx.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/usb/dwc3/dwc3-imx.c b/drivers/usb/dwc3/dwc3-imx.c
index 303708f7d79a..973a486b544d 100644
--- a/drivers/usb/dwc3/dwc3-imx.c
+++ b/drivers/usb/dwc3/dwc3-imx.c
@@ -288,6 +288,9 @@ static void dwc3_imx_remove(struct platform_device *pdev)
 
 static void dwc3_imx_suspend(struct dwc3_imx *dwc_imx, pm_message_t msg)
 {
+	if (dwc_imx->pm_suspended)
+		return;
+
 	if (PMSG_IS_AUTO(msg) || device_may_wakeup(dwc_imx->dev))
 		dwc3_imx_wakeup_enable(dwc_imx, msg);
 
@@ -299,6 +302,9 @@ static void dwc3_imx_resume(struct dwc3_imx *dwc_imx, pm_message_t msg)
 {
 	struct dwc3	*dwc = &dwc_imx->dwc;
 
+	if (!dwc_imx->pm_suspended)
+		return;
+
 	dwc_imx->pm_suspended = false;
 	if (!dwc_imx->wakeup_pending)
 		disable_irq_nosync(dwc_imx->irq);
-- 
2.34.1


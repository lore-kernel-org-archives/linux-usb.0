Received: from OS8PR02CU002.outbound.protection.outlook.com (mail-japanwestazon11012060.outbound.protection.outlook.com [40.107.75.60])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9FFA37E5E5;
	Tue, 11 Aug 2026 06:05:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.75.60
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786428362; cv=fail; b=HzmQp6QyICO/gy6EF3BzlSnK5KB4/5wDTPTYrvwMx5iJblqwqIPLaf7i/AQHUdSmB0uk2nr/u+EkIJWebqQ+Ij6xcSurLkJTeHwhGxKWrbUdPIs+JOdLrd5ckOxyleEID1I59779gCbbfSIbzhcAB9bxJdA51fXz5Fs0eMjapDY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786428362; c=relaxed/simple;
	bh=hu1zmkiTuRHr+ewBmTDK4GBEgTmB2Jq7s1eaVbYi1qE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=gaTt/Mn3HOqiYjItxxKkfRZUgvtd7V2Fr7/cLqk81OJeEbzlags/jXrN7GeeaupcCXiEIj/4/4dWZv0wa+cDhqffyOQJLj9GtM1trrcwV8tBBo9KWmMnn5a9min/VXVI3qW1OOr5cE68CUugOUY5zpMCYNmbgdMNKxD53OQ2PUo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=moxa.com; spf=pass smtp.mailfrom=moxa.com; dkim=pass (1024-bit key) header.d=moxa.com header.i=@moxa.com header.b=BapDemJt; arc=fail smtp.client-ip=40.107.75.60
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=moxa.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=moxa.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=moxa.com header.i=@moxa.com header.b="BapDemJt"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Do2sDgBxQI97vKzEZAnuVeTUowSd2y5XpdvBVvZXAoWgwcHpJndISXmJMcgpKns7YJL9tcqgLp81pZlKS5StsPZCb0H0PqVwFdgUdp+8unmjBwXjOZ6ynHNHTJ/LKow+gkGadjVYOYIHBHRnPwDrcc7jNpp0C669X8oY5+UDqVm5DUh+RAemZ0uxRouBX3U4yd/0Z0fZhPTncDb83eI5XpY6LUDXiQ7tl9Y3FZezus48bgyh2jPVo2iiDLH0TWKwOQZxVjLZDE7mBvEFeiHRp3C5+LePBRBkZ2J1OxbPJIx6z0xJRKGQ+AxEt/GHLs/pxvrFlGFhm6SI1KFXXvS2PA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BPsC10oovsK3OEFbW5LPxy7lnf+G05pgzjZsAflmZyA=;
 b=Vr7fxcTLnBkCNjgkBuuRQ9zDtoQWC48W4A6T0DC2/SbFvssXzvKHgL3J6guOqf7TAvP5KMwQWiyhVJFOZQXHPP10htNSBg2HBoX3xLxfTfBPmtFtYuwEdYgRy1gmbiVkEimDwEZndFB8G1NxrBA6QaEKf61JOir9mAHAZ7NtyvsLo7L+hfvjDWRMJv5cU4r0bYN4N6tlfoZWCtbMDFVa0lSW3y9dCxWBxXIhFY/RASLyKwXxtx23CM8sp7ISKLvUK1IMsFL+xf6evcM21mJWsH98kWZcFPk49CtzgA+Eg6T3rBzWu/WR9EWQPt8O+UX0S0q5F6+ZaB33p3SAr0ND7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=moxa.com; dmarc=pass action=none header.from=moxa.com;
 dkim=pass header.d=moxa.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=moxa.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BPsC10oovsK3OEFbW5LPxy7lnf+G05pgzjZsAflmZyA=;
 b=BapDemJtf3cqJo5qUD8AQ+rwUf7bAV7y1/35w/r2yQoMY/W8oQc57uIM+MWyZ+h+Mtcpp702xSM9m10w0tJUYtKAWyGUyscZ5EFtDAqMlBTE1UNo3E7rlKbWq8dPDoUpbwV88BxZEwyxDXauDYLpMLt1rTZFbxZ9oavgZiGDcUM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=moxa.com;
Received: from PUZPR01MB5405.apcprd01.prod.exchangelabs.com
 (2603:1096:301:115::14) by TYZPR01MB4211.apcprd01.prod.exchangelabs.com
 (2603:1096:400:1c4::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.25; Tue, 11 Aug
 2026 06:05:56 +0000
Received: from PUZPR01MB5405.apcprd01.prod.exchangelabs.com
 ([fe80::ae38:e821:cf7d:3717]) by PUZPR01MB5405.apcprd01.prod.exchangelabs.com
 ([fe80::ae38:e821:cf7d:3717%4]) with mapi id 15.21.0292.024; Tue, 11 Aug 2026
 06:05:56 +0000
From: Crescent Hsieh <crescentcy.hsieh@moxa.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Johan Hovold <johan@kernel.org>
Cc: FangpingFP.Cheng@moxa.com,
	Epson.Chiang@moxa.com,
	EddieSY.Lin@moxa.com,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Crescent Hsieh <crescentcy.hsieh@moxa.com>
Subject: [PATCH v3 1/6] USB: serial: mxuport: clean up product ID definitions and device table
Date: Tue, 11 Aug 2026 14:04:56 +0800
Message-ID: <20260811060501.2307836-2-crescentcy.hsieh@moxa.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260811060501.2307836-1-crescentcy.hsieh@moxa.com>
References: <20260811060501.2307836-1-crescentcy.hsieh@moxa.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TPYP295CA0054.TWNP295.PROD.OUTLOOK.COM (2603:1096:7d0:8::6)
 To PUZPR01MB5405.apcprd01.prod.exchangelabs.com (2603:1096:301:115::14)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PUZPR01MB5405:EE_|TYZPR01MB4211:EE_
X-MS-Office365-Filtering-Correlation-Id: 45eea465-23af-4389-1c81-08def76e9b25
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|52116014|366016|1800799024|376014|10067099003|56012099006|18002099003|22082099003|38350700014;
X-Microsoft-Antispam-Message-Info:
	iIzujBHrJSNrwdAcqE5rXSeMWBM9gy6L2/ApI1kk/4SXM8JFXitKPJTRPXN30WSPViUTF1pEBG8eiyq2Rzje5Zq6SzHpcRcsZsku7Uds0uA8nqvzPmC1X3dcC3789vNEeZD0qTM30x3vyJEH1xLsaZA0/6l8pIpj7c00rtEJ5FJIsYWhG/dP/9LXlZfdVaDLDrvaluOzJtMtIUSzNnfYpqu4wNnZdcKbY0V1Bu9pmD7A/ydzFWmzxyUGWL0HYe1pLmlaDg0jSGo1te5JWVGGlztPC3nOPm4VTnF6WMSDfo8MKIS7APYIw+AVmd8rvE3YHGcwR3KdELfnZlwwl2G0fnRM+spfLcOagqFjVHLxyZaW3BuPeQQJedHsX6EfZ8nKFtjc7+jKx3BYhQvGVNtwdXUodq9VzzhMsjCKH+CqxGnxm8tgzSAXktlN8jV0KocG0fdCQJiaA8Fmf1ZB8M4/DXisHC3t1cvVEHULLlTthDxTsnhWpHXh+NiOMnV+m7Ukosl5PVsV8ZF1nHLdQikbKkUJn/QZZWaVs5yrOMHLIVwBOOWQgBaFnF94p9YybllijJR95q2T5T4DOKkGOn3lIYd/lQywnQePIJhMw6E+R+WS3qLXEOYAYb8y1avFNnTRDyb+dgIyWayiW65N6cM3TY5BFXC/LmaY97xejN91y1UhICZd7puVvks1q0vq7ZGji2BgNyyjDEAPXAoqIQSZtg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PUZPR01MB5405.apcprd01.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(52116014)(366016)(1800799024)(376014)(10067099003)(56012099006)(18002099003)(22082099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?mfW+uMV1GqgEsKPrd5/kcDCXBoCooelUm5NFoJOg0CKPH5UFRGhc271Hc/fE?=
 =?us-ascii?Q?NoHmAzooZ75doZA2W95vig21s+i6ywdAv9ret1Mg9tUvKBoGACWBrcfsDnFX?=
 =?us-ascii?Q?is6rg8GP82GpdFdxCoXRfRMUeQCEE/3aR+kvD6yn/4hqx2KDsPQt+jL3OqEv?=
 =?us-ascii?Q?HABqe3pnJ7WzdVllGnIEXZRi+PVDxPhDJssnHQM2l4ItcereOykoSvM/SbLr?=
 =?us-ascii?Q?kTKmVv9S04YooxPenaZ77EfJtOoCzrOzjZbrhxKdKTHFXYqF+mm/lgCMii8H?=
 =?us-ascii?Q?8QBj6ncxxSolzSWyrGoOkYr2eoTWIDapYCLUdjCADMAdONA4mGcNxs/4fZnh?=
 =?us-ascii?Q?96fOcTWxMkoTG6KpZmQKb9Kb7j9dmtPl+NHeojLhpEcSgPCBWjK/UxScYInv?=
 =?us-ascii?Q?NmAz5HKHAD6pu+7UT9d4uTw71E0FFzxf3OOxxMO0qzVrr2OC0w88mTjYGmjs?=
 =?us-ascii?Q?WvZsR5ZqqmZ0Yg5lwYmGfwFAbU+npeu42FLYxgwyWtDLemA5qXUYxFpTEEHZ?=
 =?us-ascii?Q?Y4u0cfecj9fMaRaQjar9OaoJ8wJ+e7EbwBP5yEFSDhiKnBXQH6Sy3tyKOxKF?=
 =?us-ascii?Q?n/MflJGPC04mkyAMs3oDSwIGbYBAN9yIOggh5tsZC7XK5tsk6swoLTytSbSW?=
 =?us-ascii?Q?JTp7IOVCwZWh3Ay3xFJijtU/xvTg6hi4HPubT7MJp9xDZL17l7UlzFXBvGzK?=
 =?us-ascii?Q?a8Rpr376F8+tCpwNJS6gwfO6KG1jKyuKtaqWooS+pTJcjZQSeKKg3wo6JupI?=
 =?us-ascii?Q?Zv2LWomYccm/v5k+TxIxn8h+4g7dDIMoYNyu2Di3+NnAuxH0sFfQ2Xtw04rd?=
 =?us-ascii?Q?8k7JbIRGitAD/o5SOnzM29KClLESRPUaC6cfwqi8IFYxpeuZh/0hH42F7JT4?=
 =?us-ascii?Q?vkcjzyzWvXAw7/HSmEs6Lu6UQHm1e73hrIL3U5eux3eod11piIn9LdmBRsI5?=
 =?us-ascii?Q?pzx4GrFrUFE60C1LWKvEcUKlbW4N4k0BYz5Mje7VptqBs8oBC8qT4Ys4QZL3?=
 =?us-ascii?Q?CbG01lhpfko9eZTnZZeAM4mH1FOQ6oMQAhe8I0f621Wk1LYc889gxzOprhij?=
 =?us-ascii?Q?YBYSGGeQMY7l5EQFelYfNHx9ofeNONaSAou+01CR0LJaqceie/6cttkZEu2I?=
 =?us-ascii?Q?oRyXl/atq72AjSJp5vP4xIo8NSSzQTx2p4gta1W6YXFURI+ZoyITEjPJ+ITV?=
 =?us-ascii?Q?5dFwE8LSAnlJNoS8hzn1YfeFoiz3oPrf+3p44/+OfnY/RZCZqtkAjdPq9xhK?=
 =?us-ascii?Q?mT24WgjThC/3j/TgdiiDVoJBhmKeekFfSsorNdvXpddNs7E3xks4YSbMd0qe?=
 =?us-ascii?Q?zX++YNodEMhNjAbxscEUTvTtBLuJkDEvKLNNWs/KZtOshbPnT4W3v6RstggQ?=
 =?us-ascii?Q?cQMM6vV0/HBWOoYLlFnD5Q5IFCh5jcZdw3LObGvXnN2t1zR8xuRT1HcQLiFH?=
 =?us-ascii?Q?i4VyThftndLCkU/KyTtGKaauP7RiWAUSN4p+ALCdQS+sSB3EzDr8mDyhULZ1?=
 =?us-ascii?Q?nLFnofDE7gV4/2GVAvzRcvrtq4IBHmJ1L7EWW00bnTZ7nXQ4QNxf+gwQ9vCS?=
 =?us-ascii?Q?b+XTNQ/i4eMWpjKSrO/MHCxwAAAP3Ouc8+9r06i5QCSmKI+IrnnseLmcEY97?=
 =?us-ascii?Q?Po0JHeEQjwK6fxjFu/YLDBJr+eeJf1oJG4yC+9yNB7ksqcWbkDORDgRvMuQg?=
 =?us-ascii?Q?TrtEXwtYeNa6cNfbZ14SfkMb2r1QM7EIj4pcIruXATfFJsruI9aOGaiQ50BG?=
 =?us-ascii?Q?Xjn9+F2UZNDt6Qh2LTViYR9y+m8qNyE=3D?=
X-OriginatorOrg: moxa.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 45eea465-23af-4389-1c81-08def76e9b25
X-MS-Exchange-CrossTenant-AuthSource: PUZPR01MB5405.apcprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Aug 2026 06:05:55.9835
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5571c7d4-286b-47f6-9dd5-0aa688773c8e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 55NGKCDZ3MureiGLuA6DMIooX/I7G7IbO2lzCZnuZXN/1skbVpgeblmg1TqRV1bpWtopAqf2xy5Hl06P+yXe9XSBc1Q3XXKkBuM8S0D8PDE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR01MB4211

Rename the product ID definitions after the corresponding product names
to make the product mapping explicit. Introduce a helper macro to keep
each device-table entry on one line and make the table easier to scan.

Signed-off-by: Crescent Hsieh <crescentcy.hsieh@moxa.com>
---
 drivers/usb/serial/mxuport.c | 43 ++++++++++++++++--------------------
 1 file changed, 19 insertions(+), 24 deletions(-)

diff --git a/drivers/usb/serial/mxuport.c b/drivers/usb/serial/mxuport.c
index 088d5dd8abb5..a4e0467171c6 100644
--- a/drivers/usb/serial/mxuport.c
+++ b/drivers/usb/serial/mxuport.c
@@ -28,14 +28,14 @@
 /* Definitions for the vendor ID and device ID */
 #define MX_USBSERIAL_VID	0x110A
 #define MX_UPORT1250_PID	0x1250
-#define MX_UPORT1251_PID	0x1251
+#define MX_UPORT1250I_PID	0x1251
 #define MX_UPORT1410_PID	0x1410
 #define MX_UPORT1450_PID	0x1450
-#define MX_UPORT1451_PID	0x1451
-#define MX_UPORT1618_PID	0x1618
-#define MX_UPORT1658_PID	0x1658
-#define MX_UPORT1613_PID	0x1613
-#define MX_UPORT1653_PID	0x1653
+#define MX_UPORT1450I_PID	0x1451
+#define MX_UPORT1610_8_PID	0x1618
+#define MX_UPORT1650_8_PID	0x1658
+#define MX_UPORT1610_16_PID	0x1613
+#define MX_UPORT1650_16_PID	0x1653
 
 /* Definitions for USB info */
 #define HEADER_SIZE		4
@@ -157,26 +157,21 @@ struct mxuport_port {
 #define MX_PORTS_OFFSET			1
 #define MX_PORTS(n)			(((n) - MX_PORTS_OFFSET) & MX_PORTS_MASK)
 
+#define MX_DEVICE(pid, ports)					\
+	{ USB_DEVICE(MX_USBSERIAL_VID, pid),			\
+	  .driver_info = MX_PORTS(ports) }
+
 /* Table of devices that work with this driver */
 static const struct usb_device_id mxuport_idtable[] = {
-	{ USB_DEVICE(MX_USBSERIAL_VID, MX_UPORT1250_PID),
-	  .driver_info = MX_PORTS(2) },
-	{ USB_DEVICE(MX_USBSERIAL_VID, MX_UPORT1251_PID),
-	  .driver_info = MX_PORTS(2) },
-	{ USB_DEVICE(MX_USBSERIAL_VID, MX_UPORT1410_PID),
-	  .driver_info = MX_PORTS(4) },
-	{ USB_DEVICE(MX_USBSERIAL_VID, MX_UPORT1450_PID),
-	  .driver_info = MX_PORTS(4) },
-	{ USB_DEVICE(MX_USBSERIAL_VID, MX_UPORT1451_PID),
-	  .driver_info = MX_PORTS(4) },
-	{ USB_DEVICE(MX_USBSERIAL_VID, MX_UPORT1618_PID),
-	  .driver_info = MX_PORTS(8) },
-	{ USB_DEVICE(MX_USBSERIAL_VID, MX_UPORT1658_PID),
-	  .driver_info = MX_PORTS(8) },
-	{ USB_DEVICE(MX_USBSERIAL_VID, MX_UPORT1613_PID),
-	  .driver_info = MX_PORTS(16) },
-	{ USB_DEVICE(MX_USBSERIAL_VID, MX_UPORT1653_PID),
-	  .driver_info = MX_PORTS(16) },
+	MX_DEVICE(MX_UPORT1250_PID,	 2),
+	MX_DEVICE(MX_UPORT1250I_PID,	 2),
+	MX_DEVICE(MX_UPORT1410_PID,	 4),
+	MX_DEVICE(MX_UPORT1450_PID,	 4),
+	MX_DEVICE(MX_UPORT1450I_PID,	 4),
+	MX_DEVICE(MX_UPORT1610_8_PID,	 8),
+	MX_DEVICE(MX_UPORT1650_8_PID,	 8),
+	MX_DEVICE(MX_UPORT1610_16_PID,	16),
+	MX_DEVICE(MX_UPORT1650_16_PID,	16),
 	{}			/* Terminating entry */
 };
 
-- 
2.53.0


Received: from OS8PR02CU002.outbound.protection.outlook.com (mail-japanwestazon11012060.outbound.protection.outlook.com [40.107.75.60])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19D973876B0;
	Tue, 11 Aug 2026 06:06:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.75.60
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786428367; cv=fail; b=nHbi5Wtvha14YzKcVDTnznuPZXA7j1vi/+YYa95/xStY6EABCVvmz9EdGXW5Hmovs51zFwNVKkaYQgvDkDheNp/h9RGDvpKwRFKC54ArQPfQEPrszNL3glRyfjyDWe57LMEx7UKs3zqeQFaddH2Y6gVU6ipfxJW5hNSDbxqZQmU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786428367; c=relaxed/simple;
	bh=jVVsWNSwCiz1MPtuJRAXYtol3na3nK2xNvHEfeDIC0I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=o30rXceNF9wF4FawbIXOx9pcTrxwUQDytrlE8A1KG/Vmou3J8IsZMw/63kNzqM7OHdVJfHPgfOXo8+tG5MsHhNw+Mr+rM/GazmAziTse75GdSPZXhORPy6aVJ21jxfO/3T0OcdEOmbJCcQnoyLiQ5KdjLVFmZ58N8Mk1o7ubKnA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=moxa.com; spf=pass smtp.mailfrom=moxa.com; dkim=pass (1024-bit key) header.d=moxa.com header.i=@moxa.com header.b=QnvKdF/v; arc=fail smtp.client-ip=40.107.75.60
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=moxa.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=moxa.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=moxa.com header.i=@moxa.com header.b="QnvKdF/v"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cI0ehN/aCtkLNB/tJAuMWj+PTBdNvZHvYDPCgGJmdXloTtw8bfTDDrKEBuRin8gLKpJm+Havx64fv/NwTv/hHAFUcRX1sgLLA6z1GHjZW8RX2rRpuRzEUXTASwPZHyWpOMXlOoe9y6dwAyZ0AkoTntOW4Ggx6Y8LG0ROzg1R6XiOCSAeiG/RmwRIAGFh/U6Snd09q/yF3Fygg4D9BFLGdG4Lb+mWyevq5qhTMA7H2cDOeBN5KZV7tCZzI9gwzrUqpG69Lpdv4QixQyr/gc6dc9hkoRhGf37F/Iue9pxc7ZIDm2plyjyGbaFQvGCDLRAk/D0cxIh0sMK3Caz87WGGZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kRhHMF0NGYoqa0l/4TTeNDNPE3KSoSS/Gu7f6dsugFg=;
 b=WYAzgrgUEz05Gx8L0qa1S9sHnKdHMeb/eBUw7G5CIBmXxypH+Qv0KdsGGpQbBdOcwfyP/Q8N/JBW6j0W6+cmUwT4L/3uJWBlF8PjJOt1vbBw7Zd1hWvV+3xD6tsV7v2Ard5iZcKsaSmDSVC0vT0BDLsY66NQ6rvbSgZ+mC/uoUg19VOQrp+/g7xPy0Wt0VnUeGDfR7ujIH0bb7TNt2jHm9j6ZamYEG53PHTvityda0Bj5gFIY1ZuVqX2HDnSaWEhaMuaC7v5ZcZ6juUunXq1NuHD3WxzgjsxS6jFwD4LzaALyuEXOtkMCzf3IeQT06YEDvsfskJXtoHVoqGEbFyBIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=moxa.com; dmarc=pass action=none header.from=moxa.com;
 dkim=pass header.d=moxa.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=moxa.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kRhHMF0NGYoqa0l/4TTeNDNPE3KSoSS/Gu7f6dsugFg=;
 b=QnvKdF/vms3Lu+CvH4AWhcue9t42jiJVPmDR5pBtO60rNaMWOHKfk0hsuhMIybDiUsiYoso2E5CgGPHJLB//xqDN/0E5HdAuV0XYCkf7Kep8E5lr8y45HIzWcAMMTMKFGM66+kIl+tjC90GH4sMOtxpTy7QJnQgbTKrb2Kgp7IA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=moxa.com;
Received: from PUZPR01MB5405.apcprd01.prod.exchangelabs.com
 (2603:1096:301:115::14) by TYZPR01MB4211.apcprd01.prod.exchangelabs.com
 (2603:1096:400:1c4::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.25; Tue, 11 Aug
 2026 06:05:58 +0000
Received: from PUZPR01MB5405.apcprd01.prod.exchangelabs.com
 ([fe80::ae38:e821:cf7d:3717]) by PUZPR01MB5405.apcprd01.prod.exchangelabs.com
 ([fe80::ae38:e821:cf7d:3717%4]) with mapi id 15.21.0292.024; Tue, 11 Aug 2026
 06:05:58 +0000
From: Crescent Hsieh <crescentcy.hsieh@moxa.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Johan Hovold <johan@kernel.org>
Cc: FangpingFP.Cheng@moxa.com,
	Epson.Chiang@moxa.com,
	EddieSY.Lin@moxa.com,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Crescent Hsieh <crescentcy.hsieh@moxa.com>
Subject: [PATCH v3 4/6] USB: serial: add generic write control callbacks
Date: Tue, 11 Aug 2026 14:04:59 +0800
Message-ID: <20260811060501.2307836-5-crescentcy.hsieh@moxa.com>
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
X-MS-Office365-Filtering-Correlation-Id: 888bc4a4-d9ba-4950-9f71-08def76e9cd1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|52116014|366016|1800799024|376014|10067099003|56012099006|18002099003|22082099003|38350700014;
X-Microsoft-Antispam-Message-Info:
	dbpe4iPhP9qOgwlPDrA61tLYFcA4IjunOvOpv90OpQ/GRq1+JXHO0LIW/40IoiGcZleayU+95qA15mpUyDPOqvxLbXdS8Ty8aeojcN6zoMyjx7fiug1OscHshOUYEm5ogZ7pfcbHDeVbVR8aEhH9Sl4jMlqOrHuy3qHaIrRG4khe7Udx6EjaJlymkpQqrhGIVd5iBx6MWbjd5HwCrj6xE73+ZF1yCVzs7n1DiFO2AaLBZUvkOmrkqjLgTxHMI7iNZ27fWypruih1TrocV2Kagl2Sq157p/rWfJjvTUBxibmjAYVUPdYDHTxvBG7DHjQb+QUWrJ7Q7UdynxpjcQxfRnGrKuQhNVZ3FJKxZ0X5E2bSlLCWwU2TVReuQjZSkfMKSLat6A8FcWpVSoEBRT3IURW57JlsNMKG2S0CZVnE3z6TH0lyZxJsAylMN6HLoC2mZoUP4TBPlRatDvzoxKAEOxc57rHrKPrGd+cn8uTYZQ+gWS8z7jdYzDA9I2HX5c2JSR/IOmzYlQbAcZZmfdiD+YhdZN/6VwLkHBhQbUxsWqA1Kl9dPoAHVb8PSZchGXDxcpkeDHpDprv8TTDkTDQEAz21M62//2n9ezbUZKOZdQ1IxhFJV/TL+6h04JYff0eodxrQYa4siRmpepR5LF5KLE+dotQ5O2IXBWERK8vCWLcXZ9qRGhCQiCfUI13Yf7LC5vHvNEoF+/Ma8tvXSW1qxRMEkVJ7/zqTcaVx517zWrM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PUZPR01MB5405.apcprd01.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(52116014)(366016)(1800799024)(376014)(10067099003)(56012099006)(18002099003)(22082099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?a86lRRKZB33DHbx6Ri+wgPtOGPkbp4WbDmACZfTpdJUPM+6fC66osDMDciLb?=
 =?us-ascii?Q?da97GVSoFZ97xP5NwRYj3l70aCA9f37uccQoqY1mbgRDUkH0Tk/Af0vd7Ef+?=
 =?us-ascii?Q?CuY1+kJg6sTmb/bxW+PMVefocJ8AIj7y2OM6rOY+3HLLfFQumnszvCDExvlm?=
 =?us-ascii?Q?gLnaaqEILrlgwlXhbEKp5EmoR4i8ZVskzEGUrKd7IeI+QNagRUDds4PfgePT?=
 =?us-ascii?Q?BM8kYR1/k0OzrAWyOROdvkL99VIBUSZX6kE5eEiAss+7PcUKut/6+1hCxxTb?=
 =?us-ascii?Q?qMy4aP/gBFhJoljijE6IUqcsZ4GUYQyzMGFEyHy2xBow1md3yp9lvEQ4yTAS?=
 =?us-ascii?Q?zfCD8j2wLAob70jhvO2vbyKjxNJqsZzXvFWa+mdN2anB++xhCfbhSm9xQm6Z?=
 =?us-ascii?Q?Bo1GWYeT+9TaLWIAi+lqHBT7CT9TeWZsxeHP8xNhhPVDz2fG3UXMwfrWepWE?=
 =?us-ascii?Q?XzGMo4Cvl4GRplMAlTPDG+v6gJTQsIH9F6Y+rpzCHA4vlfbo/GvGzvNOtaS9?=
 =?us-ascii?Q?R4eM7C0Z9XjiHK1z0pidTIy1Cq6Gf+A0N+K8pokm3DaOuyp5NIwI9GESEOi9?=
 =?us-ascii?Q?0RH3XJGIRjlY05iHEDBd3mrMuj0EOsR9QZ+9CfS9sJ5Gp9DYa1L1VaG0jUg6?=
 =?us-ascii?Q?idfKFJGmjyU9cdFdqGnzIdEpwXekqNookRNXAf7xl0bKUSXaNSCVOdOnbk4J?=
 =?us-ascii?Q?hnC7kYig3zv4m+3RZm/5zsDkF6WfSSemTvfwuQYAIKD61/PqoqjGpw+0Vlwb?=
 =?us-ascii?Q?m50skVEb/axM+e7+CyUmLNzhFr7HdT9unilVVVoDMlDFCbwGdHBwSY0h2+gJ?=
 =?us-ascii?Q?4ySpcqdeE2wJhsJ8OJMjFCX02GnBHd0E6MA5r6Zej3T0UcfMRJa3ZcUsWsD2?=
 =?us-ascii?Q?X0gAxvJkp7ZkrfwbmTJNrRrtH9rclboK178AlZltQu+qLVqxSjU6JO/AHUFw?=
 =?us-ascii?Q?DgPeQ2TTOUKnMBTiUWryS7i3WavJJj1WQkBt5aHU8OrhjpyEx31/AtY5KsAo?=
 =?us-ascii?Q?1cvxgpMlIeH4BJeP1jgcEWCIsgFLNq8FQE6qrE8FeOKMcFvDTeremV9Goqdg?=
 =?us-ascii?Q?JVAKe98p7/QwBM2kX5GHFnX84pFPNQSWgKKo3bHPD5fWibNUd/5/iSccLAbk?=
 =?us-ascii?Q?8vYLv6sV/5+ONdYvNBawZTmxQ5jeAqNNx8zv6eWuUnK3YP/r6LrVOELjRCx5?=
 =?us-ascii?Q?kaeTgqx9sNNZkBfum2IApgBj4ku2Yy7tA0VG/pIvM9i6tu1YeBYZrLY1zsbT?=
 =?us-ascii?Q?M2LBFiuAp3ocZkO8xnrxbpJvVq1wijyH3DGiXBjnz8puwpTc9X7U90fcJh2s?=
 =?us-ascii?Q?4RbBHOcOBQPDjUrKfF8DoerHS+McFAl+Rliy52QlUrW5zrY+xkY3MLf3d723?=
 =?us-ascii?Q?+3EkfXzQAx+qS+WT/HgijUO8nRYpWpsSYzxkwbagy37RYyiMWB3sRJj9CRzP?=
 =?us-ascii?Q?0utExsKeg6QX2Q3lT631sCrRnE7jyqImTpHabF4J3ZKqTADmjK57GuKWzat3?=
 =?us-ascii?Q?kyWfSB+uV3ouucJ2eyoL2wOELwKlHErNSzFcZY9voJEcSNJwSLYv9ourvYhJ?=
 =?us-ascii?Q?cTHK/9GKD63qxHIQ8roCaGnILYtfEhVFNeV7a4lAFZXhFkcEhy3et+mKRgql?=
 =?us-ascii?Q?Aj6ORw0PMKbDcfW7tHUXGaStGn5GrBfwe21mYfUb1fYCaapEl4gHYNgyp/Rn?=
 =?us-ascii?Q?CcXG+hiPyJeugS7saHO8yTWlNMluJztgbmhasNug+FwLFHYtVKxy0G5SXZoX?=
 =?us-ascii?Q?yuP6gtjZiZdjMq7OJXTOl+l/pnIR7zY=3D?=
X-OriginatorOrg: moxa.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 888bc4a4-d9ba-4950-9f71-08def76e9cd1
X-MS-Exchange-CrossTenant-AuthSource: PUZPR01MB5405.apcprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Aug 2026 06:05:58.4679
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5571c7d4-286b-47f6-9dd5-0aa688773c8e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rzm4qHLTXtCDLvNh/QFHsSu7mEFVMrcz/fqW4XX0QTZQLaPrmVl8ppL7PvZ0sd2jI+1NnOVuwJXPSc+aQJHzHlXBfz1qPr2FU+NGp5fU56c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR01MB4211

Some USB serial devices use device-specific flow control to determine
whether write submission may proceed. The generic write path currently
provides no way to pause submission based on driver-specific state. It
also provides no way for a driver to restore its state if URB submission
fails.

Add an optional write_ready() callback to struct usb_serial_driver. Call
it with port->lock held after confirming that data is queued and a write
URB is available. If the callback returns false, stop write processing
and leave the data in the FIFO. The driver must call
usb_serial_generic_write_start() when writes may proceed again.

Add an optional write_rollback() callback for restoring driver-specific
state after usb_submit_urb() fails. Call it with port->lock held after
restoring the generic transmit accounting, and pass it the length of the
prepared transfer.

Drivers which do not provide these callbacks retain the existing generic
write behaviour.

Signed-off-by: Crescent Hsieh <crescentcy.hsieh@moxa.com>
---
 drivers/usb/serial/generic.c | 12 ++++++++----
 include/linux/usb/serial.h   |  9 ++++++++-
 2 files changed, 16 insertions(+), 5 deletions(-)

diff --git a/drivers/usb/serial/generic.c b/drivers/usb/serial/generic.c
index 6eaf74930aa3..bb042b97893b 100644
--- a/drivers/usb/serial/generic.c
+++ b/drivers/usb/serial/generic.c
@@ -152,6 +152,7 @@ int usb_serial_generic_prepare_write_buffer(struct usb_serial_port *port,
 int usb_serial_generic_write_start(struct usb_serial_port *port,
 							gfp_t mem_flags)
 {
+	struct usb_serial_driver *type = port->serial->type;
 	struct urb *urb;
 	int count, result;
 	unsigned long flags;
@@ -161,7 +162,8 @@ int usb_serial_generic_write_start(struct usb_serial_port *port,
 		return 0;
 retry:
 	spin_lock_irqsave(&port->lock, flags);
-	if (!port->write_urbs_free || !kfifo_len(&port->write_fifo)) {
+	if (!port->write_urbs_free || !kfifo_len(&port->write_fifo) ||
+	    (type->write_ready && !type->write_ready(port))) {
 		clear_bit_unlock(USB_SERIAL_WRITE_BUSY, &port->flags);
 		spin_unlock_irqrestore(&port->lock, flags);
 		return 0;
@@ -171,9 +173,7 @@ int usb_serial_generic_write_start(struct usb_serial_port *port,
 	spin_unlock_irqrestore(&port->lock, flags);
 
 	urb = port->write_urbs[i];
-	count = port->serial->type->prepare_write_buffer(port,
-						urb->transfer_buffer,
-						port->bulk_out_size);
+	count = type->prepare_write_buffer(port, urb->transfer_buffer, port->bulk_out_size);
 	urb->transfer_buffer_length = count;
 	usb_serial_debug_data(&port->dev, __func__, count, urb->transfer_buffer);
 	spin_lock_irqsave(&port->lock, flags);
@@ -188,6 +188,10 @@ int usb_serial_generic_write_start(struct usb_serial_port *port,
 		set_bit(i, &port->write_urbs_free);
 		spin_lock_irqsave(&port->lock, flags);
 		port->tx_bytes -= count;
+
+		if (type->write_rollback)
+			type->write_rollback(port, count);
+
 		spin_unlock_irqrestore(&port->lock, flags);
 
 		clear_bit_unlock(USB_SERIAL_WRITE_BUSY, &port->flags);
diff --git a/include/linux/usb/serial.h b/include/linux/usb/serial.h
index 534e6650e2aa..d44ae5a9bf5d 100644
--- a/include/linux/usb/serial.h
+++ b/include/linux/usb/serial.h
@@ -305,9 +305,17 @@ struct usb_serial_driver {
 	void (*write_bulk_callback)(struct urb *urb);
 	/* Called by the generic read bulk callback */
 	void (*process_read_urb)(struct urb *urb);
+	/*
+	 * Called with port->lock held before preparing another write URB.
+	 * Drivers returning false must restart the generic write path when
+	 * writes may proceed again.
+	 */
+	bool (*write_ready)(struct usb_serial_port *port);
 	/* Called by the generic write implementation */
 	int (*prepare_write_buffer)(struct usb_serial_port *port,
 						void *dest, size_t size);
+	/* Called with port->lock held to roll back a failed write submission */
+	void (*write_rollback)(struct usb_serial_port *port, int count);
 };
 #define to_usb_serial_driver(d) \
 	container_of(d, struct usb_serial_driver, driver)
@@ -436,4 +444,3 @@ module_exit(usb_serial_module_exit);
 	usb_serial_module_driver(KBUILD_MODNAME, __serial_drivers, __ids)
 
 #endif /* __LINUX_USB_SERIAL_H */
-
-- 
2.53.0


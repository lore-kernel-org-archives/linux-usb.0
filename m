Received: from SEYPR02CU001.outbound.protection.outlook.com (mail-koreacentralazon11013020.outbound.protection.outlook.com [40.107.44.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B63F938AC96;
	Tue, 11 Aug 2026 06:06:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.44.20
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786428369; cv=fail; b=DWj92Ygg9lSpYilKyok5vk7/vjb3X8qqN21ZMm37OA/QoBD7zwUT1eP7j2KO+yJe3f0e7grV1Jv/O4FVgArh81Wf4RTPArYz6yu4mc8oRmsXg3pImXmj8rwyQR5s5otJskXdD70LOfwwcDxV3/Uenu5B8Ztx/M2z8tsGztm0VLs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786428369; c=relaxed/simple;
	bh=6CTk8lRDwWxjYcd6UX8paRaWVsfXiMF6zol4BSRmIp0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=E/4FhnBb9hZVmiz+0vBUrJfkl71WB736vDgjjEz7u4a32WDT9Jd84MhEuvIXQZ8Wm4RGR4w5M1kmnHLOhlM34uJjwzgNPD2MgBOsZPEYX51zdqWcZKaKpS7TdWGDfciTVJcLYkgD9banJ9zLkpf9+AoovC5nfFwHekCSl5NBBi8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=moxa.com; spf=pass smtp.mailfrom=moxa.com; dkim=pass (1024-bit key) header.d=moxa.com header.i=@moxa.com header.b=JLTnVmvR; arc=fail smtp.client-ip=40.107.44.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=moxa.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=moxa.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=moxa.com header.i=@moxa.com header.b="JLTnVmvR"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XlOZPympZ4AzSoiSk2zAkUoVKezNwzCB9eMYJ+Bi166p4BOVtgKcbRUKWnK4Y8MQ0uPTWehQnQ95Aiqi0Uxmc0oDHSJWmrNA8X8h4mqiFDSZJCg/pUtZig1MzdVY1pJA1WvrBtWAx4KXpkPa5AZa+w1xw8YrPY1VB6vrOSdGhY7XkljkcwsDGPzFtJMU4i8jdvQNNepCF1BIiSxsaeZIFs8s58aGl9kGFbwTfOepGCFFutgoiriJq0L025TG2nfGdaMUY/SlwZ8jZi1lQcGO5BBqt211j0Pyaesd0fDw+591Cg62Nlt3v2tBy2GN1DNLPzEncMJ8MbHOc+GIdrYn6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dcXXlzirzCE7BEV1hB9yXsBrtxM3DVLOvkXoeacLo04=;
 b=ayjAJY+cj1MJWrLloSPkBc+ZdaJhGve4h7W4BnLAMR0ZQXKF04QKfhcnRTRpq4vNIUfuBcSY6QcuRmOWL3K4cFecKk4x3VySlD07ezhi7Zv9Ad9HHLsgO2tGF1b59oYR4JXrfFO1HPptqVWh7ZY311YKlmw+b5pc6LEsWU9c7RGJ5whBeug9dWXnIhOfWPEzQ4mrUGzKyv46Igm+BeOIkbODYVWnz0PG9O2L3Wsr/LiGR/JEUHtzSUTf4WMYjdAfwcJ5riG96icdvLMt6tvZ/oA4//7jFkk0gNVynjcVmeFRLgZ+Eo+7Desixs1ShQj+0qIX9j+CTIonCSymorWaoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=moxa.com; dmarc=pass action=none header.from=moxa.com;
 dkim=pass header.d=moxa.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=moxa.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dcXXlzirzCE7BEV1hB9yXsBrtxM3DVLOvkXoeacLo04=;
 b=JLTnVmvRftpggORrnRLuN3+RaSh8CB3vViovHG+WrvhIfTOWWDJGV3buuhuqVGgXYTwUObRKbgnaL3J5qqEDHB7tYG7e+SwbaxXhUEr3/4c1RDCSDV3Mh2hCfQMbQvfrWL4MwoUer+93wZl1giEOhNBoFM2aIp1/PXgIYagHfpQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=moxa.com;
Received: from PUZPR01MB5405.apcprd01.prod.exchangelabs.com
 (2603:1096:301:115::14) by TYZPR01MB4211.apcprd01.prod.exchangelabs.com
 (2603:1096:400:1c4::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.25; Tue, 11 Aug
 2026 06:06:00 +0000
Received: from PUZPR01MB5405.apcprd01.prod.exchangelabs.com
 ([fe80::ae38:e821:cf7d:3717]) by PUZPR01MB5405.apcprd01.prod.exchangelabs.com
 ([fe80::ae38:e821:cf7d:3717%4]) with mapi id 15.21.0292.024; Tue, 11 Aug 2026
 06:05:59 +0000
From: Crescent Hsieh <crescentcy.hsieh@moxa.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Johan Hovold <johan@kernel.org>
Cc: FangpingFP.Cheng@moxa.com,
	Epson.Chiang@moxa.com,
	EddieSY.Lin@moxa.com,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Crescent Hsieh <crescentcy.hsieh@moxa.com>
Subject: [PATCH v3 5/6] USB: serial: mxuport: handle SEND_NEXT transmit flow control
Date: Tue, 11 Aug 2026 14:05:00 +0800
Message-ID: <20260811060501.2307836-6-crescentcy.hsieh@moxa.com>
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
X-MS-Office365-Filtering-Correlation-Id: eb9deca0-bec3-4803-0133-08def76e9d5c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|52116014|366016|1800799024|376014|10067099003|56012099006|3023799007|18002099003|22082099003|38350700014;
X-Microsoft-Antispam-Message-Info:
	NZ0amk72WJfhYgIIRUulzBWBUVKfaV+FqiWDUT5vuBYxCux1YthkI86QT5GbjKwYoYcs04hS4rzJX90Vb3LtQUN/jwq8i/kwJdn4PvJtJJiHhE08fKXPGTU4+kIFx2493UPFBLpBb2NRYl/a3Yc4cz3RXzylB93Ik9e52u/INm+vypQFB1jRw7THkmW9h+KjDW1BH04Jnm191x4V9nIHLZS9bKUCKet3ebBwLYy7EkJD52rDs/5w7UGEGYfrEMcycMab85m9fq960R+rSa1wEgzIE4P2xzkvcJxPnP1oGKfmTE53pq8HWmQ7g3MIZWTyiZ7fMRvvD/E0z1eViPGbBKe+W85FngaioYrUoxko8hI1vTcumaYZD4ow105j7e1DSC3KXlCJ+sb+FXJU5Xaci397G/Cna/z4glJvPFRAzfCT6K8GkCRmgbkKIPm4uAEy2dBg/tf3iiwu+qSCWVSNsGhgfnWI0sqdHkUB+xc9e8PyJs+dp5MtNnOSdSWAceOqpl5AR5B86sQ6OeKV/rkdpfHIwuAAiDcL6ioiJ0AzmfCnnVsuctywMzsQARH+NdovL1SVzggCQ+MQWFzr6C0vvdH+DBzZDwilXAW5BIKUxXvsCuWG+C5Dlxzkwtmumaotc5U6CkuQ3dM1bz0znqpK/a6seFSMD8Xy5IBOGNXoDJ4mm1WFX2hxWQ6qlmDrc22ToJO04ZZ5umL14bF+WVIFrLTxP8LIr7mW++x+zieLWaY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PUZPR01MB5405.apcprd01.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(52116014)(366016)(1800799024)(376014)(10067099003)(56012099006)(3023799007)(18002099003)(22082099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?SYyAR3WQwo8hkLGoCiOXncK9EhqDvBGj7V7TKyEwJZMvqxuQbIQ7zRSXvCf+?=
 =?us-ascii?Q?luz9NsRV+uQtD6PqSBo7OiCQdv2q4nyZWdiimZgUGKbiU52DQCKlfEyYVJCT?=
 =?us-ascii?Q?WkXllSFXAETBBC4HVqWKO74JsjKL7lTbFCCWkvP6sVAO+zkOEqtzgmdRkrmn?=
 =?us-ascii?Q?ClCq/B8eU18Lw49ynBMSlvKatnmhRCaKn1KR7kdHFbIVhSwG/znJttNeM6gl?=
 =?us-ascii?Q?JWBuynulGSSPcOvn2H96zz74Tdw2ySJ+jep5UyNyKrNpsEhFBhr4UjOY/mj6?=
 =?us-ascii?Q?FtfMI9fdJOglNCj+7sa59XFzvhoPYNJ+Ypgfn1DN9YwcJ4J+5K5wCWJzUqas?=
 =?us-ascii?Q?9a3p/8x/qSgIrGqUNb7Aw0gUSOIDldZTWxuTemBWaXbVHCFbwpRJVefb57AK?=
 =?us-ascii?Q?tBtT4Twvpk/J/5kEN9GYWvg4pARaInvSETUOgCqCfjPi4Xdi4iXTSXVxrQsi?=
 =?us-ascii?Q?/shlggNZbZd+npNBPwB6zHz3j9/mP+XIiw03r2DXkrv6maIj2ePE5efrJEnJ?=
 =?us-ascii?Q?pwEKqK/oV6PKcgVzd130npIwuEtYheUJ8p+W3VDH4lEU4wGLvIwFlxt1gjWt?=
 =?us-ascii?Q?K6o5niEnpfVbxFfyV3hP6EGrfTCjMyy/FFsc8acgioCMEJdrctIU+n2jU+lL?=
 =?us-ascii?Q?sQs/bHUSq06byNLUS6Xa59GhGjJIf3lBOEWYZ/p6UxqYRV5VKW71aHvjtsxN?=
 =?us-ascii?Q?ZtaxJHbv7FMErncwPPyYAjtW/u2c7riCi4CcR9BYoXFEuw0YRR1Jt5Z4Fzta?=
 =?us-ascii?Q?9yB8J6tL3aSPulAcLSX4kUQQ/NVVN1i2KWaHafyqtZMsTes3R47OQ9NXFKP2?=
 =?us-ascii?Q?XwVyMFHmkX1pe25wqnNUdwIEjV24emVMGC0sC2i+ukFeKVWelwYGFMODsYao?=
 =?us-ascii?Q?wSixY+FsKMwm4MDantKfZzIzBvN1cogjjSULps0V522lDHy8I/wWb34FSZhM?=
 =?us-ascii?Q?2jhR662mhgDG6GX2OLcIe7nLP/4jAfyiFpTpDY45OWSq/1ji9hfMMm+zByCa?=
 =?us-ascii?Q?U/MD078ok7KGkmEW/lSQ8w6RzV6d/CWFsOp6pTCFw7fpjFTCnwk468/c3h8C?=
 =?us-ascii?Q?iFT6YFfF0V0ak6/nZSC5EX5xGTWTnLYuOLOWFeMVKvNdkZiIeQxNOH64WIBC?=
 =?us-ascii?Q?E/W+CarLkyDl+7sUVuqQ1AlahBUBAZ8q30vQPJ+AqD2+jDjlZ256ZiwKFmhU?=
 =?us-ascii?Q?TBIoPwQgceARS74+XFgztsG/PQu+dUX7NL9WGqffytbrnxBl2zz++f8aX7b9?=
 =?us-ascii?Q?uCr6ppPeGNNdPvt8aqIoXKsZfPgqm/dML6iiYIxLo1/VfoSQ6jsDVryb/Azk?=
 =?us-ascii?Q?7JoZ07mYYEgeNz6qbO9qLHUMa+srDJLLI3SrormV9pbNKM4iDl1cChwnlJ1A?=
 =?us-ascii?Q?a9Is7FXuVS1qvrUt/a2aekGE/JiOVguoc4S8wL5QZIy6a9FggTCREu2xFhuz?=
 =?us-ascii?Q?zbsZqP0MWH62NYUkDh+PILiwDhPCz/kKezdXh7Lk306gfoXxTvfpukttLs0s?=
 =?us-ascii?Q?RSbQMWNcnsV0knXNqlvNU4gYmWpVXbdexuStd1wyEhvmEZc7CvATZciWZMIe?=
 =?us-ascii?Q?oj2wdaHysaIc722LRO4XB10/x3roOYUx9iQyTkmbG4Qtmfw0FtoztC3RKfr/?=
 =?us-ascii?Q?AtITLtA3GveaNIgRiAZzzkaY0UGKDYWtyHgFr2WU7HoEk7JIJ5bsBs/mV2XW?=
 =?us-ascii?Q?c2x5eWZ0M7rjllEN8VnUwihwbLznSqOMXYHg4EWLEur4veC1tIsps7RdxRjN?=
 =?us-ascii?Q?WEeK+hYlTabWNBrwtKAE8RP2U9yaOgQ=3D?=
X-OriginatorOrg: moxa.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eb9deca0-bec3-4803-0133-08def76e9d5c
X-MS-Exchange-CrossTenant-AuthSource: PUZPR01MB5405.apcprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Aug 2026 06:05:59.3356
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5571c7d4-286b-47f6-9dd5-0aa688773c8e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: P6+ac/1GA/o1tp7BETJsOmLU1d3/EQ+Xi8tip0hys4hiK9GJYAnsHeoU1/SLgFtZasQUmGx15Aq4q3XCTUmLAxgCRC4xSMfVimcb/lOsMPA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR01MB4211

The device uses a per-port SEND_NEXT request and event to pace
host-to-device transmission. During burn-in testing, sustained writes
without waiting for this event resulted in per-port buffer overflows and
data errors. The issue can be reproduced on existing G1 devices as well.

The driver initiates the protocol by setting the SEND_NEXT bit in a
bulk-out header and then stops submitting data for that port. The
firmware reports a SEND_NEXT event when the corresponding per-port
buffer is empty, at which point the driver resumes transmission.

Track the payload placed in bulk-out transfers for each port and set the
request bit when it reaches bulk_out_size. Use the generic write control
callbacks to hold further submissions until the event arrives and to
roll back the payload count and hold state if usb_submit_urb() fails.

Use bulk_out_size as a common threshold for all device families instead
of encoding their firmware buffer sizes in the driver.

Signed-off-by: Crescent Hsieh <crescentcy.hsieh@moxa.com>
---
 drivers/usb/serial/mxuport.c | 61 +++++++++++++++++++++++++++++++-----
 1 file changed, 54 insertions(+), 7 deletions(-)

diff --git a/drivers/usb/serial/mxuport.c b/drivers/usb/serial/mxuport.c
index 35123572ca4d..96dc85defb0b 100644
--- a/drivers/usb/serial/mxuport.c
+++ b/drivers/usb/serial/mxuport.c
@@ -156,6 +156,8 @@ static const u16 mxuport_mux50u_fw_ver_offsets[] = {
 #define UPORT_EVENT_LSR			4 /* Line status */
 #define UPORT_EVENT_MCR			5 /* Modem control */
 
+#define UPORT_REQUEST_SEND_NEXT		0x80
+
 /* Definitions for serial event type */
 #define SERIAL_EV_CTS			0x0008	/* CTS changed state */
 #define SERIAL_EV_DSR			0x0010	/* DSR changed state */
@@ -202,6 +204,8 @@ static const u16 mxuport_mux50u_fw_ver_offsets[] = {
 
 /* This structure holds all of the local port information */
 struct mxuport_port {
+	u32 sent_payload;
+	u8 hold_reason;
 	u8 mcr_state;		/* Last MCR state */
 	u8 msr_state;		/* Last MSR state */
 	struct mutex mutex;	/* Protects mcr_state */
@@ -256,6 +260,13 @@ static const struct usb_device_id mxuport_idtable[] = {
 
 MODULE_DEVICE_TABLE(usb, mxuport_idtable);
 
+static bool mxuport_write_ready(struct usb_serial_port *port)
+{
+	struct mxuport_port *mxport = usb_get_serial_port_data(port);
+
+	return !(mxport->hold_reason & MX_WAIT_FOR_SEND_NEXT);
+}
+
 /*
  * Add a four byte header containing the port number and the number of
  * bytes of data in the message. Return the number of bytes in the
@@ -264,22 +275,40 @@ MODULE_DEVICE_TABLE(usb, mxuport_idtable);
 static int mxuport_prepare_write_buffer(struct usb_serial_port *port,
 					void *dest, size_t size)
 {
+	struct mxuport_port *mxport = usb_get_serial_port_data(port);
+	bool request_send_next;
+	unsigned long flags;
 	u8 *buf = dest;
 	int count;
 
-	count = kfifo_out_locked(&port->write_fifo, buf + HEADER_SIZE,
-				 size - HEADER_SIZE,
-				 &port->lock);
+	spin_lock_irqsave(&port->lock, flags);
+	count = kfifo_out(&port->write_fifo, buf + HEADER_SIZE, size - HEADER_SIZE);
+	mxport->sent_payload += count;
+	request_send_next = mxport->sent_payload >= port->bulk_out_size;
+	if (request_send_next)
+		mxport->hold_reason |= MX_WAIT_FOR_SEND_NEXT;
+	spin_unlock_irqrestore(&port->lock, flags);
 
 	put_unaligned_be16(port->port_number, buf);
 	put_unaligned_be16(count, buf + 2);
 
+	if (request_send_next)
+		buf[0] |= UPORT_REQUEST_SEND_NEXT;
+
 	dev_dbg(&port->dev, "%s - size %zd count %d\n", __func__,
 		size, count);
 
 	return count + HEADER_SIZE;
 }
 
+static void mxuport_write_rollback(struct usb_serial_port *port, int count)
+{
+	struct mxuport_port *mxport = usb_get_serial_port_data(port);
+
+	mxport->sent_payload -= count - HEADER_SIZE;
+	mxport->hold_reason &= ~MX_WAIT_FOR_SEND_NEXT;
+}
+
 /* Read the given buffer in from the control pipe. */
 static int mxuport_recv_ctrl_urb(struct usb_serial *serial,
 				 u8 request, u16 value, u16 index,
@@ -498,14 +527,24 @@ static void mxuport_lsr_event(struct usb_serial_port *port, u8 buf[4])
 static void mxuport_process_read_urb_event(struct usb_serial_port *port,
 					   u8 buf[4], u32 event)
 {
+	struct mxuport_port *mxport = usb_get_serial_port_data(port);
+	bool resume_tx = false;
+	unsigned long flags;
+
 	dev_dbg(&port->dev, "%s - receive event : %04x\n", __func__, event);
 
 	switch (event) {
 	case UPORT_EVENT_SEND_NEXT:
-		/*
-		 * Sent as part of the flow control on device buffers.
-		 * Not currently used.
-		 */
+		spin_lock_irqsave(&port->lock, flags);
+		if (mxport->hold_reason & MX_WAIT_FOR_SEND_NEXT) {
+			mxport->hold_reason &= ~MX_WAIT_FOR_SEND_NEXT;
+			mxport->sent_payload = 0;
+			resume_tx = true;
+		}
+		spin_unlock_irqrestore(&port->lock, flags);
+
+		if (resume_tx)
+			usb_serial_generic_write_start(port, GFP_ATOMIC);
 		break;
 	case UPORT_EVENT_MSR:
 		mxuport_msr_event(port, buf);
@@ -1353,6 +1392,7 @@ static int mxuport_open(struct tty_struct *tty, struct usb_serial_port *port)
 {
 	struct mxuport_port *mxport = usb_get_serial_port_data(port);
 	struct usb_serial *serial = port->serial;
+	unsigned long flags;
 	int err;
 
 	/* Set receive host (enable) */
@@ -1373,6 +1413,11 @@ static int mxuport_open(struct tty_struct *tty, struct usb_serial_port *port)
 	if (tty)
 		mxuport_set_termios(tty, port, NULL);
 
+	spin_lock_irqsave(&port->lock, flags);
+	mxport->sent_payload = 0;
+	mxport->hold_reason &= ~MX_WAIT_FOR_SEND_NEXT;
+	spin_unlock_irqrestore(&port->lock, flags);
+
 	/*
 	 * TODO: use RQ_VENDOR_GET_MSR, once we know what it
 	 * returns.
@@ -1466,7 +1511,9 @@ static struct usb_serial_driver mxuport_device = {
 	.tiocmset		= mxuport_tiocmset,
 	.dtr_rts		= mxuport_dtr_rts,
 	.process_read_urb	= mxuport_process_read_urb,
+	.write_ready		= mxuport_write_ready,
 	.prepare_write_buffer	= mxuport_prepare_write_buffer,
+	.write_rollback		= mxuport_write_rollback,
 	.resume			= mxuport_resume,
 };
 
-- 
2.53.0


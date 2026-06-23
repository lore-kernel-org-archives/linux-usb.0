Received: from TYDPR03CU002.outbound.protection.outlook.com (mail-japaneastazon11013029.outbound.protection.outlook.com [52.101.127.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C24CB3C98B3;
	Tue, 23 Jun 2026 08:04:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.127.29
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782201862; cv=fail; b=LUmhWF7F32KUESElhT67vfPPJN5mPmq24ZQj/ZLyiE+U7VFkUc1WPPgtjdztm0i8LzKGk8Od9dtTpNqOertkEZndcUY93trpLXAHsA2oX9TlyPrdtuqi04tpx2SNsV7A8PedDrT7Gf3HJG+5pV8OQ4bZXDbIXHpzhka+CDnp5Nc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782201862; c=relaxed/simple;
	bh=7FUiZvUkItDDS6pSoqq/XZyiuWr4c0jeA7GYcOPYRqM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=LW+Y2hchUhxWgeejxHcQ/+v+wQ3KORC+ggga8j5i2nNCXSTzrmIfG4CJje1bkg61SBLkPZD//6SKci+1tZMcdDl45jK9eWzgyCrFO/qc6a/4qN6ria0q4oCFqH7STFWVsF7unUYmYom89zxAPuQcb0eAz17YXB4qBFZyA5LI3aU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=moxa.com; spf=pass smtp.mailfrom=moxa.com; dkim=pass (1024-bit key) header.d=moxa.com header.i=@moxa.com header.b=KiRszpls; arc=fail smtp.client-ip=52.101.127.29
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=moxa.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=moxa.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=moxa.com header.i=@moxa.com header.b="KiRszpls"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kVyYnGHoih9hxk5DfbBSqR3CBYJwb30ZtAW3IV9DHWYZXE048cY8XDVIKNhd/3nK2ujyKzIxZtk3J4LLljauahQNBEpCjOJjqoROBJkRXLvQck5N/58l9yY5uaocHSa+X4SSBOIBXcsbzCM4IVidaFbNtdlkRh2qXfbT1Tqy89OLRyMgNArB03U2/NiuaVpjE8dIJFz1087qwFngCy5yr8neCO3+bhB9VpQIpWYpm4RRGB+YRk3UxjN8dGz+E8vbE6pA99TILO23e4DxONcWKG4HqmFy08IjqJosH2rIWIkYwxBbn1+IQ53/HqviKumgwTFTSKX87Ctbn4fwBFll3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aAhUKHXF4MJGewheP8qu13aULRXGhI+RT9wZI00pDmU=;
 b=mcttJL1Wc77fshIJvIQ4fjS++/fU0bzwh4UAvQnPUc9rR5Aac9oKifXAwE8W66zQzhb1FO4Pa1p2yM02rNp8AtBJOwP68OBHeDLPU2SS0VSMQlfv8XeNflStc3ixJvLjQ0sZuF7naB5S3N12hxkmuBcjnYtTiB4qDAiL2BdfkgPRlsrQNlwTxt/yob7MQcd1O7CVc9wppE2fdEJpZm2QXFv0VNSPpYyieRA7vUDQBMtfX/kUiUmmkYfn4yGuPKjUGcv24lQaJUQnqHf9m/l9Br6QK98HC8CY/LC1/1qAcyoOyy5VT0kL1V+x/HWSWwNeod3OWXzZkaavZCxEaLH2QA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=moxa.com; dmarc=pass action=none header.from=moxa.com;
 dkim=pass header.d=moxa.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=moxa.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aAhUKHXF4MJGewheP8qu13aULRXGhI+RT9wZI00pDmU=;
 b=KiRszpls1JkZ+0UVg4klrrW75zCICoflwsLiyT6WHf/nRSUoXGHGkLzE5wDJ/I5hzxYVOhCZFynjUedwc/Prdh1kiGIhe+JPx4yas/NNioyNe6e2zbPaNcoT/xF3HlgUPLrtAHHzAVl2leX6OLR8O+XeeeUCRu5Cs1q5RHFrqkw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=moxa.com;
Received: from PUZPR01MB5405.apcprd01.prod.exchangelabs.com
 (2603:1096:301:115::14) by TYUPR01MB5306.apcprd01.prod.exchangelabs.com
 (2603:1096:400:359::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.18; Tue, 23 Jun
 2026 08:04:17 +0000
Received: from PUZPR01MB5405.apcprd01.prod.exchangelabs.com
 ([fe80::ae38:e821:cf7d:3717]) by PUZPR01MB5405.apcprd01.prod.exchangelabs.com
 ([fe80::ae38:e821:cf7d:3717%4]) with mapi id 15.21.0139.018; Tue, 23 Jun 2026
 08:04:17 +0000
From: Crescent Hsieh <crescentcy.hsieh@moxa.com>
To: Johan Hovold <johan@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	FangpingFP.Cheng@moxa.com,
	Epson.Chiang@moxa.com,
	Crescent Hsieh <crescentcy.hsieh@moxa.com>
Subject: [PATCH v2 3/4] USB: serial: mxuport: handle SEND_NEXT transmit flow control
Date: Tue, 23 Jun 2026 16:01:38 +0800
Message-ID: <20260623080138.166398-5-crescentcy.hsieh@moxa.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260623080138.166398-2-crescentcy.hsieh@moxa.com>
References: <20260623080138.166398-2-crescentcy.hsieh@moxa.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TPYP295CA0017.TWNP295.PROD.OUTLOOK.COM (2603:1096:7d0:a::9)
 To PUZPR01MB5405.apcprd01.prod.exchangelabs.com (2603:1096:301:115::14)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PUZPR01MB5405:EE_|TYUPR01MB5306:EE_
X-MS-Office365-Filtering-Correlation-Id: c4ce2104-b308-42e9-db79-08ded0fe05d8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|366016|23010399003|376014|1800799024|22082099003|38350700014|18002099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	e4XGK2a973eFV+nKZhUDYlYPY/iAYqY+2AI65lGQqV44JvT/f+C+0c9VgpjBWx7qdBGORJDeza/43dxLymbg4mWIjgisCpfnTrxCLfDU8d9Np8msT7EQRBj9ToihLuPDx+H7AFzpyhK9NojH4CyxU+SmIu15N1jfQnvEnbJdJV1UHAL9G7KSnB5Mft8mtxcOnU4Q/5cvmyVaalK1TcgTh/ffOG1h65JNPqdCelnKxoNTm0u0dK7pe7ovCxN4KMniAwvk83dOFp/42jeyHOlcr9g4wN4EGaY8cwwOZVJw41HIk3JZ4xXTZ9LvchrtzhbxS4BSRDhu7OIJ1Mpdy2zyLZrGPMCfYmo9wx8uosUdnXG7NEgPQtTWj7Um+9KPzPoamtaU492qVSUqU6XcBOQeT/e42QVoxuUY63zq4S/OawashyO1qfSyP9N8p+qRSZnb5hBHap+XSO/NAxMyMs8USjDx54GjHnNC0ZbJ3XQBJP6cGAGhOvuMTA/tlNZjMfWl1KqY8mzyaAhTqL20RJuH8PvGmVqnKM2KFdUVBEJF3SimI5onZkL2x3JndzSX2HSFJXdOye9xuxiW6zOuQF/sUg2rpFAJ0LR07yf9R9l3GWYGMCDmQqeXYG4Hmo3brGuHZw/qHC1NfxkNAl+pfegRV4ZYNj8sGm0piVq0St2RK85h5JFr/dVXTGESFi9zz9bMx8MSdiJMNYOGRxt/WynFno76WO1E4V87iY6rUPygnuk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PUZPR01MB5405.apcprd01.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(366016)(23010399003)(376014)(1800799024)(22082099003)(38350700014)(18002099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?FyGYzvrtaoIc5ZR8U427liNxdcq9WpOhRpKnwGoDZ+ZtopRBBL0Q9XJh3TyD?=
 =?us-ascii?Q?C9NIyqhuUUitso6xIagqaOXb3n2eqNug17aEY96Tp77mGNZq0QFhLxYFfTfC?=
 =?us-ascii?Q?YM76b09A0np914AE8gTLmUOrJsrlWl6wi4pTzqkXqxBxouVJuqSY8HMgCkUr?=
 =?us-ascii?Q?rAbRHQ4fejr2uVujJUP9bqpneMJCtyBwp/c/42ASh/xqbxQeAWIOSzAl+INt?=
 =?us-ascii?Q?4OaXeOgipKGESwFhb9XNqvixoxqgXt2z5wyYpTGgJWyu3MEXQjBA1zT5yIIY?=
 =?us-ascii?Q?0wOHEwMTunOk4jgUUt0LIeAG+9GyPe9lnSL+BywIWfdyiEHaBNIIoDM9D32o?=
 =?us-ascii?Q?ibv1zEU4e/XtSlIpIH/rb+JwNN7PC+DT2ZJDl7q4IeAjqP/PKDJbt8bZeJii?=
 =?us-ascii?Q?h821ZmC2Wdwh5rno/n4Pypnmi7aga9jZnAX2rLp0Nw/iBHX7XZCCNtzIQEq9?=
 =?us-ascii?Q?WT/I1MVC4Vsw4wA5EYaLr8PcM5z1wgrjnJ34CS9oha8qYxlSo8ixxGKwtSma?=
 =?us-ascii?Q?sPmaxnkRUQAgGqlQITUQp8C5uolfhd4K/WcNJtPb5Cq7Y54VB6rG6EFe38la?=
 =?us-ascii?Q?J+X5FhTMF6ufBBAh7E49ozV1jajz7IC/wkjMRPfR0bC5M7mv/OymPB8yPb0y?=
 =?us-ascii?Q?HB1BfZXjwW3tvkxwjRWyH9zaPiIo4GZd3H9qe3m4zL9IhvSGLHRwnVFbalDA?=
 =?us-ascii?Q?TrRMxY2nwhc007c1zSVoav4fAd/ICGm+WisKCIpb7WmDw1fIqZRTAelz1bP/?=
 =?us-ascii?Q?X1B6QAjz4x85XcA+rXd7wW+Iyro9A64ZF9KXJQUrj635/KX1D/4vzBun9b9x?=
 =?us-ascii?Q?BvG2B4DpZKzKSV2617xHN6px7hgOdJaTHKMq90R0E1e+4K02xzdXMQDZBs2A?=
 =?us-ascii?Q?Rgnt65AVrLuStJsaMPEVAG93y+xR1j36aM6MV/bzaJmBObJS9walKS+onj2q?=
 =?us-ascii?Q?xloudOaDOdfOSYTX+hgH3PsYXaHG7112k6f9EblxJ8isz6FG964sk7uFdW8B?=
 =?us-ascii?Q?iaelnsjNHyvHIFrUTeA3E6bt8VtpBP4Ra3HtbZV2QNrgNfdE0Qv3OiYtX7dJ?=
 =?us-ascii?Q?eFvcJ7Po6vzLKXFX7KsvXT4hOFPE8rbTcEYxKhrBOdum7Zij1QjOLPx0cwby?=
 =?us-ascii?Q?h6b2eUmKDYg1G+2wlR3Z1pNkc/j1iggCzHwmBEmuBSQ8HBgtno72PzohBeql?=
 =?us-ascii?Q?UyNwKqg1JK/pZK+G6EnDntsP6tKggkxfWbgQynSQZPhig4f/KagNiWXIs+8d?=
 =?us-ascii?Q?RBc7jcdXSJzYWfvWkOGd+9Ph0KEXORY3KPsboagTz6VBVMChGFWboIgRje4P?=
 =?us-ascii?Q?ueBPyupFx2uLJldsF3l80g39wUmKgQdia8nQdit+k8oDF+XORa8l7vK8OVkf?=
 =?us-ascii?Q?B5Cm6ZUqipXm0avt/sBTwz/+HZiEJzePKck3z3aAkYZqBavB4788LODZFYMC?=
 =?us-ascii?Q?wdKr06YKXJQDxSzOLl8PDVTGvMTpti0zM41Wdj54JAcWXj3By+siex7E2gD4?=
 =?us-ascii?Q?ctGBwEVsLqTfplLEZaLQzQQCPL8mB8M442SpkAqtV7wAEWNLtTVtzHet+fKk?=
 =?us-ascii?Q?9SD3bsycG+g3ZB0hV294hs2GhGbFP8fVBqlMK+PT9mASJjzBCFBXX3BstUsy?=
 =?us-ascii?Q?l9xaJXbxFi1ddIhSBpuQVedsdLDlWorB6wDzw0ETM8Cw81sMJrqJL+mvRMHk?=
 =?us-ascii?Q?tSXa8V3Lo3tFe+oqz2QJop8kVT67BSw+owPrSX9lV7Twj4ruIbtVkpeKI7E6?=
 =?us-ascii?Q?UrDVWextggVeMmnqj+efn1NLrBZL2Xc=3D?=
X-OriginatorOrg: moxa.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c4ce2104-b308-42e9-db79-08ded0fe05d8
X-MS-Exchange-CrossTenant-AuthSource: PUZPR01MB5405.apcprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2026 08:04:17.8229
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5571c7d4-286b-47f6-9dd5-0aa688773c8e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ed5+M8oLDPVtlkaYfJFTeva2CAMIfvO/ATC7/KDFIuVyrbiAWq96wUO4FkDoIQmr/MCWnJtxHKG9aV4pRPNjY0iCwL87dE2g2yszAGd2pqY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYUPR01MB5306

The device uses the SEND_NEXT event to pace host-to-device transmission.
Without waiting for this event, continuous transmission on multiple
ports can make the driver submit bulk-out URBs faster than the device
can process them, which can result in data errors during burn-in
testing.

Stop submitting further write URBs after requesting SEND_NEXT and resume
transmission when the matching event is received.

This cannot be implemented by returning zero from
prepare_write_buffer(), as the generic write implementation expects the
callback to return a transfer length once data is available in the write
FIFO. Add a mxuport-specific write path so that URB submission can be
stopped and resumed explicitly.

This may reduce throughput, but avoids data errors under sustained
transmit load.

Signed-off-by: Crescent Hsieh <crescentcy.hsieh@moxa.com>
---
 drivers/usb/serial/mxuport.c | 165 +++++++++++++++++++++++++++++++++--
 1 file changed, 156 insertions(+), 9 deletions(-)

diff --git a/drivers/usb/serial/mxuport.c b/drivers/usb/serial/mxuport.c
index 067c8d9752e0..f3be2b3bd95b 100644
--- a/drivers/usb/serial/mxuport.c
+++ b/drivers/usb/serial/mxuport.c
@@ -147,6 +147,8 @@ static const u16 mxuport_mux50u_fw_ver_offsets[] = {
 #define UPORT_EVENT_LSR			4 /* Line status */
 #define UPORT_EVENT_MCR			5 /* Modem control */
 
+#define UPORT_REQUEST_SEND_NEXT		0x80
+
 /* Definitions for serial event type */
 #define SERIAL_EV_CTS			0x0008	/* CTS changed state */
 #define SERIAL_EV_DSR			0x0010	/* DSR changed state */
@@ -193,6 +195,8 @@ static const u16 mxuport_mux50u_fw_ver_offsets[] = {
 
 /* This structure holds all of the local port information */
 struct mxuport_port {
+	u32 sent_payload;
+	u8 hold_reason;
 	u8 mcr_state;		/* Last MCR state */
 	u8 msr_state;		/* Last MSR state */
 	struct mutex mutex;	/* Protects mcr_state */
@@ -276,22 +280,148 @@ MODULE_DEVICE_TABLE(usb, mxuport_idtable);
 static int mxuport_prepare_write_buffer(struct usb_serial_port *port,
 					void *dest, size_t size)
 {
+	struct mxuport_port *mxport = usb_get_serial_port_data(port);
 	u8 *buf = dest;
+	unsigned long flags;
+	bool request_send_next;
 	int count;
 
-	count = kfifo_out_locked(&port->write_fifo, buf + HEADER_SIZE,
-				 size - HEADER_SIZE,
-				 &port->lock);
+	spin_lock_irqsave(&port->lock, flags);
+	count = kfifo_out(&port->write_fifo, buf + HEADER_SIZE,
+			  size - HEADER_SIZE);
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
 
+static int mxuport_write_start(struct usb_serial_port *port, gfp_t mem_flags)
+{
+	struct mxuport_port *mxport = usb_get_serial_port_data(port);
+	struct urb *urb;
+	unsigned long flags;
+	int i;
+	int count;
+	int result;
+
+	if (test_and_set_bit_lock(USB_SERIAL_WRITE_BUSY, &port->flags))
+		return 0;
+retry:
+	spin_lock_irqsave(&port->lock, flags);
+	if ((mxport->hold_reason & MX_WAIT_FOR_SEND_NEXT) ||
+	    !port->write_urbs_free || !kfifo_len(&port->write_fifo)) {
+		clear_bit_unlock(USB_SERIAL_WRITE_BUSY, &port->flags);
+		spin_unlock_irqrestore(&port->lock, flags);
+		return 0;
+	}
+
+	i = (int)find_first_bit(&port->write_urbs_free,
+				ARRAY_SIZE(port->write_urbs));
+	spin_unlock_irqrestore(&port->lock, flags);
+
+	urb = port->write_urbs[i];
+	count = mxuport_prepare_write_buffer(port, urb->transfer_buffer,
+					     port->bulk_out_size);
+	urb->transfer_buffer_length = count;
+	usb_serial_debug_data(&port->dev, __func__, count,
+			      urb->transfer_buffer);
+
+	spin_lock_irqsave(&port->lock, flags);
+	port->tx_bytes += count;
+	spin_unlock_irqrestore(&port->lock, flags);
+
+	clear_bit(i, &port->write_urbs_free);
+	result = usb_submit_urb(urb, mem_flags);
+	if (result) {
+		dev_err_console(port, "%s - error submitting urb: %d\n",
+				__func__, result);
+		set_bit(i, &port->write_urbs_free);
+		spin_lock_irqsave(&port->lock, flags);
+		port->tx_bytes -= count;
+		if (mxport->hold_reason & MX_WAIT_FOR_SEND_NEXT) {
+			mxport->hold_reason &= ~MX_WAIT_FOR_SEND_NEXT;
+			mxport->sent_payload = 0;
+		}
+		spin_unlock_irqrestore(&port->lock, flags);
+
+		clear_bit_unlock(USB_SERIAL_WRITE_BUSY, &port->flags);
+		return result;
+	}
+
+	goto retry;
+}
+
+static int mxuport_write(struct tty_struct *tty, struct usb_serial_port *port,
+			 const unsigned char *buf, int count)
+{
+	int result;
+
+	if (!port->bulk_out_size)
+		return -ENODEV;
+
+	if (!count)
+		return 0;
+
+	count = kfifo_in_locked(&port->write_fifo, buf, count, &port->lock);
+	result = mxuport_write_start(port, GFP_ATOMIC);
+	if (result)
+		return result;
+
+	return count;
+}
+
+static void mxuport_write_bulk_callback(struct urb *urb)
+{
+	struct usb_serial_port *port = urb->context;
+	unsigned long flags;
+	int status = urb->status;
+	int i;
+
+	for (i = 0; i < ARRAY_SIZE(port->write_urbs); ++i) {
+		if (port->write_urbs[i] == urb)
+			break;
+	}
+
+	spin_lock_irqsave(&port->lock, flags);
+	port->tx_bytes -= urb->transfer_buffer_length;
+	set_bit(i, &port->write_urbs_free);
+	spin_unlock_irqrestore(&port->lock, flags);
+
+	switch (status) {
+	case 0:
+		break;
+	case -ENOENT:
+	case -ECONNRESET:
+	case -ESHUTDOWN:
+		dev_dbg(&port->dev, "%s - urb stopped: %d\n", __func__,
+			status);
+		return;
+	case -EPIPE:
+		dev_err_console(port, "%s - urb stopped: %d\n", __func__,
+				status);
+		return;
+	default:
+		dev_err_console(port, "%s - nonzero urb status: %d\n",
+				__func__, status);
+		break;
+	}
+
+	mxuport_write_start(port, GFP_ATOMIC);
+	usb_serial_port_softint(port);
+}
+
 /* Read the given buffer in from the control pipe. */
 static int mxuport_recv_ctrl_urb(struct usb_serial *serial,
 				 u8 request, u16 value, u16 index,
@@ -510,14 +640,24 @@ static void mxuport_lsr_event(struct usb_serial_port *port, u8 buf[4])
 static void mxuport_process_read_urb_event(struct usb_serial_port *port,
 					   u8 buf[4], u32 event)
 {
+	struct mxuport_port *mxport = usb_get_serial_port_data(port);
+	unsigned long flags;
+	bool resume_tx = false;
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
+			mxuport_write_start(port, GFP_ATOMIC);
 		break;
 	case UPORT_EVENT_MSR:
 		mxuport_msr_event(port, buf);
@@ -1372,6 +1512,7 @@ static int mxuport_open(struct tty_struct *tty, struct usb_serial_port *port)
 {
 	struct mxuport_port *mxport = usb_get_serial_port_data(port);
 	struct usb_serial *serial = port->serial;
+	unsigned long flags;
 	int err;
 
 	/* Set receive host (enable) */
@@ -1396,6 +1537,11 @@ static int mxuport_open(struct tty_struct *tty, struct usb_serial_port *port)
 	 * TODO: use RQ_VENDOR_GET_MSR, once we know what it
 	 * returns.
 	 */
+	spin_lock_irqsave(&port->lock, flags);
+	mxport->sent_payload = 0;
+	mxport->hold_reason &= ~MX_WAIT_FOR_SEND_NEXT;
+	spin_unlock_irqrestore(&port->lock, flags);
+
 	mxport->msr_state = 0;
 
 	return err;
@@ -1451,7 +1597,7 @@ static int mxuport_resume(struct usb_serial *serial)
 		if (!tty_port_initialized(&port->port))
 			continue;
 
-		r = usb_serial_generic_write_start(port, GFP_NOIO);
+		r = mxuport_write_start(port, GFP_NOIO);
 		if (r < 0)
 			c++;
 	}
@@ -1477,6 +1623,8 @@ static struct usb_serial_driver mxuport_device = {
 	.set_termios		= mxuport_set_termios,
 	.break_ctl		= mxuport_break_ctl,
 	.tx_empty		= mxuport_tx_empty,
+	.write			= mxuport_write,
+	.write_bulk_callback	= mxuport_write_bulk_callback,
 	.tiocmiwait		= usb_serial_generic_tiocmiwait,
 	.get_icount		= usb_serial_generic_get_icount,
 	.throttle		= mxuport_throttle,
@@ -1485,7 +1633,6 @@ static struct usb_serial_driver mxuport_device = {
 	.tiocmset		= mxuport_tiocmset,
 	.dtr_rts		= mxuport_dtr_rts,
 	.process_read_urb	= mxuport_process_read_urb,
-	.prepare_write_buffer	= mxuport_prepare_write_buffer,
 	.resume			= mxuport_resume,
 };
 
-- 
2.43.0


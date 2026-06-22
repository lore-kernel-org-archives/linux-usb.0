Received: from OS8PR02CU002.outbound.protection.outlook.com (mail-japanwestazon11022109.outbound.protection.outlook.com [40.107.75.109])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D62C39F188;
	Mon, 22 Jun 2026 09:44:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.75.109
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782121453; cv=fail; b=BBaAa6H4wEiPAKzYeDjcUwYO4HfeyuqBEs2RwgQAbE+VXncRWZGRrPN136Yx/fL/eZ1q6W9cNXGLhCHiekCWpUDjlqOQpamS+oMwLm3SiXAqHdz657GFFpCK/3lgzEwbUKMRYlB2h5wBPmVhZwO8R6TGk81At1sYdsqr7p1yM68=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782121453; c=relaxed/simple;
	bh=Zt3ceQxg5NDeEC1lLwQkuPK0oxlNTvRY06Nw3bYTR8k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=uqHD3f5UEoFezG5dSZ8MRyxFnag+G/rtnmP1LUoH1K/iizRVkXptF2KhSlsIWAV2KAmo6EIRyht/NDkC8KTPpGNLFEMBXpAGOuySJ+5Hlii6iZ/T3gDDeXW+yBT9cuWfZxM9x0GY1OExWDXAUlclFH95VOgV4V9DD4SncoQ6Fes=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ftdichip.com; spf=pass smtp.mailfrom=ftdichip.com; dkim=pass (2048-bit key) header.d=ftdichip.com header.i=@ftdichip.com header.b=aSPX3eDl; arc=fail smtp.client-ip=40.107.75.109
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ftdichip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ftdichip.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ftdichip.com header.i=@ftdichip.com header.b="aSPX3eDl"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eaXL5xBEU1pT1oUzDzQiPRJT2oX2a7XUbIc7wS8W/A0zf0bvSw5LvB1oQpwWWFnXyL09DwFdY1fi2ExmgpKuruMDn8eOurccSgXm7bJ6wIIK+s12UoMRzUUhwEZNqnDvB+aVVLkWKysuheTWP/TeF+EbTMClnAisS5pIplkcurZOZz8LVTVSGy5a3nPzhdoKLfEKNoHDJnZ7+ne3yAdgdirWzKVoAt2BUD0XWLW9nSu3p9DTyEGHOUUGtB8tRXTNE8el7LXQwyPi4XLpSsgP/U3qXumel8RVtcKFAobyV9aPybtadb7kWjJhbaITSiQasIQQ6GfBIIoo5YgrXnXLMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iWBGO0E4On5roUPqhyxG4WwXBGgCQVu/ya0Ny+VR4QI=;
 b=T3XUSKSEJ7jiDOTGcfEyFtW7nAUOYqeb1oC/jim1aTthtWacqqvJ4R/Z5VzbXcmnJEaFCNpZ5xJtRDGvm4Z5vIvlClJJNGPcYGbw6tE7CawmAPJWgI0xbqqsE/QZcNcKD6HMFGibXUABVWuBL1Aq6Etbs8Tdqdkij7MYmG3bHY2cAR50MYBWY+x3ev8G40DM41boy7/o9beBQZDSSRSE5DfxbN9wMNU/OA4pj1J8LHvw/ywg08XBrhthHij6PYY+fn6pZhQkM7w9aNHaLZpqCLuqk7Yaatj/kkm0L0TU9Cg8tvrrGZKhK/ZaXTLusqzmdUEAaNWSHnnNf/DsU1c/Mw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ftdichip.com; dmarc=pass action=none header.from=ftdichip.com;
 dkim=pass header.d=ftdichip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ftdichip.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iWBGO0E4On5roUPqhyxG4WwXBGgCQVu/ya0Ny+VR4QI=;
 b=aSPX3eDlzkrdtu2hd2AdVbGQ76fURjfxDtcpWQ8zyxCWxVnim5guNc4vno0Fi3vxC6wvVYrp6flRbL7/UAq+2CuqgpOUGQD+ja2rwsS2HNlIIr8x/T8PLCSmjsIWL3hWT/T6yXluydkNgUFWf+yylgGSCufc3OjHXFNWW31tF+71jFUBLEEeTEaD3TaG+Nrm5IQ1LzaCKGJaGGjNmpvMKlrU3IdlTqbtOAVKLRtAJx6INx5MGbGd1xBOlb7AmG8kLawnJROHERa/fzsw2eDSlTvgZDBxCG5SstcD3eM90UWvZa83gjC/CzhLPek+FkKoMOAvdOE+/0IdlNHbkJ0C/g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=ftdichip.com;
Received: from SG2PPFE985372F0.apcprd01.prod.exchangelabs.com
 (2603:1096:f:fff6::45e) by SI4PR01MB8053.apcprd01.prod.exchangelabs.com
 (2603:1096:4:29c::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.19; Mon, 22 Jun
 2026 09:44:04 +0000
Received: from SG2PPFE985372F0.apcprd01.prod.exchangelabs.com
 ([fe80::e65f:ac00:2342:9108]) by
 SG2PPFE985372F0.apcprd01.prod.exchangelabs.com
 ([fe80::e65f:ac00:2342:9108%4]) with mapi id 15.21.0139.018; Mon, 22 Jun 2026
 09:44:04 +0000
From: Chinna Mopurigari Naveen Kumar Reddy <naveen.reddy@ftdichip.com>
To: Johan Hovold <johan@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Arun Pappan <arun.pappan@ftdichip.com>
Subject: [PATCH v2 1/2] USB: serial: ftdi_sio: retry transient errors on chip-side control transfers
Date: Mon, 22 Jun 2026 17:43:39 +0800
Message-ID: <37cc6844010da737aeae61e0248fb3e9ca5e35b0.1782121274.git.naveen.reddy@ftdichip.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1782121274.git.naveen.reddy@ftdichip.com>
References: <cover.1781744946.git.naveen.reddy@ftdichip.com> <cover.1782121274.git.naveen.reddy@ftdichip.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TPYP295CA0001.TWNP295.PROD.OUTLOOK.COM
 (2603:1096:7d0:9::18) To SG2PPFE985372F0.apcprd01.prod.exchangelabs.com
 (2603:1096:f:fff6::45e)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SG2PPFE985372F0:EE_|SI4PR01MB8053:EE_
X-MS-Office365-Filtering-Correlation-Id: 14a06fac-d3c2-482a-9eb9-08ded042cc19
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|23010399003|366016|1800799024|38350700014|4143699003|56012099006|6133799003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	us1N1aaf/kEEPulPxGop1p0aeQnW7rQmHCTGrC9hhSqG2axCUmDDSkgJfb9wjStJS069rgDXTJSHd1J8aDqx0K/f6qxXHd73tRrUdHJpv0jLi8tkXXqudxvRlUm+CWqSyfsRB5Bi6nnB8M74cTNT/mYneC0ievu5em1NBf2UbFLjJB/Vd8RN5IM91ny26ZdEW/DgSfH/Td0v5AMEZKz2pu+/HKl69mu0Y5z+Qizb5f6htFuphefCj7pboOzviHsvO0Gymhsyec57skHNATXTIx+WpBUME0F87na/CPGzXSrnwH+oJ6cBTcQJNcRl6uH9Jv8UAiX7j60Jfi+Vs2HEGgcTFGUN/N47+oampvuulT0Qv4h9FDfRdyHHOHP35KwbUtZt8DCnPJYMqAtM58xQLIEnqCqmde3/ltSGKvF27YcxKPExjMDg1HHcy3kM2S1mif0I8rflf1XOxWpSFBGk38i9gIFfKtgC/MtldwskaxxyRCudg712ialTBz+ohMHoztRUsMzCpzuJ5Y5JtgEANjzTI0IoQqZx09FHdoO51wHU1Afx3XjEZMOHE1vZGsTW3/EJRuAhteHFbZFBjg2pc1LiMeRuG8I+oHo0tywuSKnITS0+R1UlOZ5clCprtBVSFlJqxsIBrmRkn+UvRII/3Du1o4T+d9y0TH77SGh0Z2px9QulMHGDK3dZRHglPcEaw9rKE4iTFR9nQttH2L+PzXLbD7w1Y0yMdwFaq57TMv0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SG2PPFE985372F0.apcprd01.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(23010399003)(366016)(1800799024)(38350700014)(4143699003)(56012099006)(6133799003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?DNARcTnV/Ehzgo71GIqC3Tn7Wz0FL815J4W3AJbgtJLA81kDU7ItLYQTRBMD?=
 =?us-ascii?Q?2GIInKRH7e8L4UrHHqoCP8OxQYauvR4v9/Upasz65WElC81uL1+x3uFzrs4a?=
 =?us-ascii?Q?bUyPcn13VPKe/zF+6iqQAowY49/DDqTNAO764QlEcJHY8Bb16YdHtlOKw6T2?=
 =?us-ascii?Q?15hsULMP3A+9Ic2e53QoGCHZmYAaq522HMfeTR2kxpQnamD35sx0iOeZer6W?=
 =?us-ascii?Q?qXeNz41/lLO8mjpvLkpiFNASPyhqUsMYjbmwyEXIGx6A3XouPdB9a67dcFYa?=
 =?us-ascii?Q?sRQhcY6/Zb82YNyq/DSZxLmUC8RV210cPZtyao12j5b7nbxkyWTgtEy0w6FW?=
 =?us-ascii?Q?XAgSNC1ECFzCrhJvy5HNpzButc7F25E1GI9obQbmvul63kGv9ZT58H1Ud3ir?=
 =?us-ascii?Q?CU+rFmSooXfB/FHM8XO+8MfPQoK8uIS84bppDgxJ5B5Tv0pOdW0r9b5GZeX8?=
 =?us-ascii?Q?tyFDxMsqMlwCRGQXE5uok/5Z4CS9h7u0I8Q5RsOpLuHNRSZAZwYX8SLBx86X?=
 =?us-ascii?Q?8b+oUzPrGZgXUEkeZubVYlP1Oy0SMcarkGESL+mANMTln5ML350mu7NQiSQU?=
 =?us-ascii?Q?5dVK7abNEqYH2hrS+oU/N/OiJlRQ3heGgDYE/gHVI/Tz6CnmKNl9quh6SI1B?=
 =?us-ascii?Q?9Smvafv6h2En1/zun0L+eqNUZKKEkmTxmgDM3cdM76Fp8CS6bn+bogu3NdxD?=
 =?us-ascii?Q?wrSyGpVOCPRlTA1kSypdTN0uVVN+1ir2oG07luuRN+aS+y2nW7f5uLQ+Y8YA?=
 =?us-ascii?Q?QjSnOX9eSmoU0UiTYIUQ7oNs8i/PU3LOP1SCoeXLIUGShjdCCdjn3hhnHh7h?=
 =?us-ascii?Q?tljfHoG3v6kcx6tZkYonLd7pTckuXKP8DwrjcqIH2U/ndx2aoIj0cf2LcqKV?=
 =?us-ascii?Q?v83x2dhGmEkkEHmxYfT0kKoDG9n4p1WJELrNQfmfUMsRNbHiydhiWqfRcJbj?=
 =?us-ascii?Q?UWjSrwY1BUvyLs3CVEaupGluStm+FXMECFkWg4TdlwjH9jpyJazax2zX/UHL?=
 =?us-ascii?Q?RUWrKpsMR6vJRssVQzFOyzvVCMm4g8Jt+sRWH+n1+BWOZKzS6HzuNGkETQaa?=
 =?us-ascii?Q?hVuGWNs5AbpYzswcT7x/I6mHs8+gcBG6V9bB5psgyMrM/a2qsg5hmSm7hGCj?=
 =?us-ascii?Q?JnBWKz1chnl1ccuPCfajxZ1tn+vRvLI2xBd8AyIKfyplVfTfdLMzFars72JG?=
 =?us-ascii?Q?khq2gY4z4moEtUjGKLP3YlPpwz6PtMQqqQZPmZaHJ110RZ4ld7bo7tSQKPNL?=
 =?us-ascii?Q?2Q1SBTKfZOOycmY1miP6peXXJFL4to4cXjUH6q5OXTD7Vmk4xgDxq14F+vJm?=
 =?us-ascii?Q?TrTL+Gc75EPTg0R4fCCmVRLdrW8s5tDc6kNCEfuSsgaOU/p7iqFxRHGzdsgY?=
 =?us-ascii?Q?NaZ/c7yNvEAQChDz5R0fZ4GaQJGo6RW5U82XpZz5qhckFvJyRrGDZN8PvfWL?=
 =?us-ascii?Q?N6lybHVhbceLCsEjET3M+g//yc+F5eRGcacLV1d38I1imPhQOe8xWORSANGS?=
 =?us-ascii?Q?Ak1IZWOFVs/ZBsurEntbaoKFVER+DW7JXqtamonS2hU0ZXpJYFoKi9ctuEjm?=
 =?us-ascii?Q?QbQYGbJ3Wfl4WyQwhV1Dc22KDCxL6ZGfrlRdHuyi0u+e+MOd4zbmztm0BGRz?=
 =?us-ascii?Q?4nscXqSY0yqxC9UAWAZILWEDpvx4Mt0YlKJGF04Dt2PQk5X4ZJoHFMtUcRPj?=
 =?us-ascii?Q?WPcwOUBpiGWMKHYELWrb4OiGemB5Cm9AilWmt2Gmq5jkZzLZMsrWQ9psOTuy?=
 =?us-ascii?Q?b9iO1nC/eEDycOFf786vNVQvh6hRv2c=3D?=
X-OriginatorOrg: ftdichip.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 14a06fac-d3c2-482a-9eb9-08ded042cc19
X-MS-Exchange-CrossTenant-AuthSource: SG2PPFE985372F0.apcprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jun 2026 09:44:04.5535
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: c2456335-1328-47c5-82f2-1fe6783d7182
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5e4nns8+bMBCkPyTDlwWvH2DRybI/ttDtlArvpmHhahTjkjzLOMb04PIp4hU4fOzx81H70JSH55yZpw2RyAuS4Fv+hlsFCx1yTUqgv2vcrI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SI4PR01MB8053

usb_control_msg() can return -ETIMEDOUT, -EPIPE or -EPROTO on a
functioning device when the host controller is momentarily unable to
complete the transfer.  These are transient conditions that surface
under heavy USB bus load -- for example when several high-baud FTDI
channels share a busy host controller -- and a short retry generally
succeeds.

When such an error happens during a one-shot userspace operation such
as a sysfs write to /sys/bus/usb-serial/devices/ttyUSBx/latency_timer,
the write fails back to userspace with -EIO and the chip's per-channel
latency timer register is left unchanged, even though the device is
healthy and the next attempt would have worked.

Introduce a small helper, ftdi_send_request(), that wraps
usb_control_msg() with up to FTDI_CONTROL_RETRIES attempts on these
documented transient errno values, separated by
FTDI_CONTROL_RETRY_DELAY_MS.  Non-transient errors are returned
immediately, as before.  Each retry is logged with dev_warn() so the
underlying bus condition stays visible in dmesg.

Convert write_latency_timer() to use the helper.  Only this site is
converted, as it is the one where a transient failure has a directly
userspace-visible effect; other chip-side control transfers are left
unchanged.

Signed-off-by: Chinna Mopurigari Naveen Kumar Reddy <naveen.reddy@ftdichip.com>
---
 drivers/usb/serial/ftdi_sio.c | 48 ++++++++++++++++++++++++++++++-----
 1 file changed, 41 insertions(+), 7 deletions(-)

diff --git a/drivers/usb/serial/ftdi_sio.c b/drivers/usb/serial/ftdi_sio.c
index af14548fa03d..7aaa7fc1be71 100644
--- a/drivers/usb/serial/ftdi_sio.c
+++ b/drivers/usb/serial/ftdi_sio.c
@@ -30,6 +30,7 @@
 #include <linux/kernel.h>
 #include <linux/errno.h>
 #include <linux/slab.h>
+#include <linux/delay.h>
 #include <linux/tty.h>
 #include <linux/tty_driver.h>
 #include <linux/tty_flip.h>
@@ -1363,10 +1364,46 @@ static int change_speed(struct tty_struct *tty, struct usb_serial_port *port)
 	return rv;
 }
 
+/*
+ * Send a chip-side control request, retrying transient bus errors.
+ *
+ * On a healthy device, usb_control_msg() can still return -ETIMEDOUT,
+ * -EPIPE or -EPROTO when the host controller is under heavy load --
+ * for example multiple high-baud FTDI channels sharing a host
+ * controller with limited DMA-channel fairness. Failing a single
+ * one-shot configuration (e.g. a sysfs latency_timer write) to the
+ * caller as -EIO in that situation is unhelpful: the next attempt
+ * usually succeeds.  Retry a small number of times before giving up.
+ */
+#define FTDI_CONTROL_RETRIES		3
+#define FTDI_CONTROL_RETRY_DELAY_MS	2
+
+static int ftdi_send_request(struct usb_serial_port *port, u8 request,
+			     u8 requesttype, u16 value, u16 index)
+{
+	struct usb_device *udev = port->serial->dev;
+	int attempts;
+	int rv = -EIO;
+
+	for (attempts = 0; attempts < FTDI_CONTROL_RETRIES; ++attempts) {
+		rv = usb_control_msg(udev, usb_sndctrlpipe(udev, 0),
+				     request, requesttype, value, index,
+				     NULL, 0, WDR_TIMEOUT);
+		if (rv >= 0)
+			return rv;
+		if (rv != -ETIMEDOUT && rv != -EPIPE && rv != -EPROTO)
+			return rv;
+		dev_warn(&port->dev,
+			 "control msg req 0x%02x attempt %d returned %d, retrying\n",
+			 request, attempts + 1, rv);
+		msleep(FTDI_CONTROL_RETRY_DELAY_MS);
+	}
+	return rv;
+}
+
 static int write_latency_timer(struct usb_serial_port *port)
 {
 	struct ftdi_private *priv = usb_get_serial_port_data(port);
-	struct usb_device *udev = port->serial->dev;
 	int rv;
 	int l = priv->latency;
 
@@ -1378,12 +1415,9 @@ static int write_latency_timer(struct usb_serial_port *port)
 
 	dev_dbg(&port->dev, "%s: setting latency timer = %i\n", __func__, l);
 
-	rv = usb_control_msg(udev,
-			     usb_sndctrlpipe(udev, 0),
-			     FTDI_SIO_SET_LATENCY_TIMER_REQUEST,
-			     FTDI_SIO_SET_LATENCY_TIMER_REQUEST_TYPE,
-			     l, priv->channel,
-			     NULL, 0, WDR_TIMEOUT);
+	rv = ftdi_send_request(port, FTDI_SIO_SET_LATENCY_TIMER_REQUEST,
+			       FTDI_SIO_SET_LATENCY_TIMER_REQUEST_TYPE,
+			       l, priv->channel);
 	if (rv < 0)
 		dev_err(&port->dev, "Unable to write latency timer: %i\n", rv);
 	return rv;
-- 
2.43.0


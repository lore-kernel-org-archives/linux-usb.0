Received: from TYDPR03CU002.outbound.protection.outlook.com (mail-japaneastazon11023072.outbound.protection.outlook.com [52.101.127.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FBE636DA03;
	Mon, 22 Jun 2026 07:39:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.127.72
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782113955; cv=fail; b=i1nVVVUMqgMA/ltMW10nAj4GXXmggpauoi+AaHLz+Sh1ien6sO8pJRC8RnY6KAsHHN/kR/qnMshHS13SKFhuP4k++VxZDLgO7HwTBe3ZyOOo4WiHBr4dGXVaStaRr5fndG03/wC8/JYXLec+2mIrd1RonFLUpX8YRoFVH3i7Mn8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782113955; c=relaxed/simple;
	bh=D7Mavbwtz6EsiFwXGizmXC9K7d+OheQVsh82I/EbxZU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=bxlV0PTHSYA8QnkAOsewuGvlYcxHe69iuS5jmxsbuPfvaINuUInsf3PXSiPvB+Zx1vQAkaY6E2Zj13bsArEX38rTDK/XpoxVND43Jo15RDHrPl0q7VUcugMCZTtTBwmHn+9DsFfPgBwocPMlYzzGrPRvsVKqWRiGn0fL3etzFz4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ftdichip.com; spf=pass smtp.mailfrom=ftdichip.com; dkim=pass (2048-bit key) header.d=ftdichip.com header.i=@ftdichip.com header.b=gD4fiqlM; arc=fail smtp.client-ip=52.101.127.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ftdichip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ftdichip.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ftdichip.com header.i=@ftdichip.com header.b="gD4fiqlM"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dVxt3TOI+592+NnfqEg/f1TNozKjXCuKYJimVtamGcJ+hKi9MiOfNjZYuuzhnvh2EilTRwSxpO161pQWiKx3tCWB11irxx5fk7OiSGGQhSWaGdt7AIqPBiZq/cTKALuJ1DJ/vTiCmItJ+b97tngR+sssWQO9o0BeVzFf5LB4FWDZDeVqPHMyxvLaP7lsbGiiGvtAZmg3OROiiUYY00sLaSd3G5faCvmTkB4IVJWSXCTD7F2cYtqM8zuBDPIbseOs9XyZyBYmDfValVIkQ7wJxfPPfMqow22OZO4HBj6G5/xhg9f+WvU41ik9Xd+uPNJvfQSUsQ7/KrXYXQ3FK4tKUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ML4ullz58duvIhwZRGn8irzaZDAtRHvTRjsJfnuTwdY=;
 b=oqhX7NYt7eB0pDvq7NIY+pFdmIW84nQDphv4oSr8+axHJB4fxuH0rCQb0db8WxfOC5Pvve4Zria5/QWxm40SO1jtSfOsQkNy5aviuavAQWWnW7ZmjhAiyCoSTNXHkvUrdH2fTDN7kfc+iPUrmmJ6rYTUoBdCGHW38TAE85kYu/F6QLRVcZyN+7FwCJGnkj7dmp3p2x/FIydtjSm4W/3dq91IFMTOcX9nYUJP6eIngOmHf/Fatk7ZRa5eHNOCKjVhtwOjox84OnX3rMaTDT+RQH+4WBvX/aJLkiW/6oo2RLhhT1Fl1AJZY1Hr3S1t79QFcxEXKM6I6XiAWM8NSJ/GbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ftdichip.com; dmarc=pass action=none header.from=ftdichip.com;
 dkim=pass header.d=ftdichip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ftdichip.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ML4ullz58duvIhwZRGn8irzaZDAtRHvTRjsJfnuTwdY=;
 b=gD4fiqlM+U7BqVccYFz6V5XFq60NKzbsfO3xtyda4n50hS1NM0QfuXoBBW4mn/SI2n/FmOH3Wujg4PJ9hj08V9sGKacLXN2F6N59gvJVf0ik5TZ6EEKpf/gB5B7TyQFo6e8VbohZ7rpIMiuGEeCjqj3W14kQKRTyzzRLfQEtej1m+VXLwC0JLLQIWrSmfsw3S6SMABC8QFH/HgZalMH5Tm2Za9RSJ8+KxhJnzPXsHumcBO0CUKkU4PV8ecXdHOrl0S3hP/VOnmsnd7haRvIlx4LaRmnJ2uAw0iuTYi/5J9XCNYvmUJATggfYRqtp2gC16XLc0mcBQgEhtRuJ0duxIQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=ftdichip.com;
Received: from SG2PPFE985372F0.apcprd01.prod.exchangelabs.com
 (2603:1096:f:fff6::45e) by TY0PR0101MB4383.apcprd01.prod.exchangelabs.com
 (2603:1096:400:1b6::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.11; Mon, 22 Jun
 2026 07:39:09 +0000
Received: from SG2PPFE985372F0.apcprd01.prod.exchangelabs.com
 ([fe80::e65f:ac00:2342:9108]) by
 SG2PPFE985372F0.apcprd01.prod.exchangelabs.com
 ([fe80::e65f:ac00:2342:9108%4]) with mapi id 15.21.0139.018; Mon, 22 Jun 2026
 07:39:09 +0000
From: Chinna Mopurigari Naveen Kumar Reddy <naveen.reddy@ftdichip.com>
To: Johan Hovold <johan@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Arun Pappan <arun.pappan@ftdichip.com>
Subject: [PATCH 2/6] USB: serial: ftdi_sio: retry transient errors on chip-side control transfers
Date: Mon, 22 Jun 2026 15:38:35 +0800
Message-ID: <90377ad7270768f81997d2264afdc9104af8f676.1781744946.git.naveen.reddy@ftdichip.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1781744946.git.naveen.reddy@ftdichip.com>
References: <cover.1781744946.git.naveen.reddy@ftdichip.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TP0P295CA0030.TWNP295.PROD.OUTLOOK.COM
 (2603:1096:910:5::15) To SG2PPFE985372F0.apcprd01.prod.exchangelabs.com
 (2603:1096:f:fff6::45e)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SG2PPFE985372F0:EE_|TY0PR0101MB4383:EE_
X-MS-Office365-Filtering-Correlation-Id: 8209a444-3b98-45ad-0f33-08ded031587d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|52116014|366016|23010399003|18002099003|22082099003|38350700014|56012099006|6133799003;
X-Microsoft-Antispam-Message-Info:
	YHkpM6RxvKEvmmDCqRSE3Mms3vsGxCltqtwKuFGoSQF6YyeNGQAglCWg56Ou2MYN+aysPQbCzX2kuFWIP59Q/A+iUcjYnLlPBZdN4V4EO3x4m0Zc27RRt1bguM3RBCanbto/aMhQMaM8P4ic9rSQzE+tvxLC/7gO7wMEWJ7Ous4IL642DgS5PAUbi2cvBUTIKFhG6rpG/bH95Pc6ZlWH6p+F73A68RfptwY/kFp4UNEvvaliqlgzg98rSpaKQwab0aYC+JChy8jAp6H8xkC06JL6QqjRF8OHi4/6lXjN1w57+sVi0+Kzv0tM/NYyvwVw4rZO0QO2Vhs7dLGlGE3X7Fg2y6IZCOfBQUhpKReyQu01Op5s5jwe6E5Z9zEpMT5+UMD67+zP4wVpmE6RbkIaqVDXMGhfgfVUiy/3JcO7ifFHRfXGeo0mvJ5oR4D6Pu+mrc22BOHmsyqT1SK82K/hpx9p5Du/jOvnvOfiwSTo0gRH1kUT7dZ85QRw6Uu2azMMRjD9/BLTUJ4TjSefk5W6MAkVlGPLTFiAqMugSTQbyjbjACZOvWcPkqj3yXSrAZEfMI9KqTF0sTIqnu3Jy24uEdtWRJwFt5kytHHYGrozNwYKCDoLKFKD2qzX/m4hyOn14JuLwhldsh8Ez4ekKYD7ziMT+qmaFGZLwKAri9rKll4DVWWXhwxeYUtuQZvAGsMBTW0dSMj9aLql4ybeb7kplcDOmeKfWEHEph0z5deon54=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SG2PPFE985372F0.apcprd01.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(52116014)(366016)(23010399003)(18002099003)(22082099003)(38350700014)(56012099006)(6133799003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?sIxxLxE+84HUMDAHkScKTkGQD0CvBtwRHTTSrVOkwKFhU87K9eV8/pQcl9qM?=
 =?us-ascii?Q?3REDEQ8xtLSOOatQNPknIE8BqyrvKZnSaN4IP0R7HWcEKsGk6Xmd6avnwWIF?=
 =?us-ascii?Q?fn5lCKi3sGnBh8BTB5bpkqOybzZA6utJLuXvHggOKciXlrzlYEBGjYGvuG65?=
 =?us-ascii?Q?a/JSh02nXbzxyroT9DP2RGduh5mSoXdbobj6xvaORlBjCndRJ+JVpdVcMIKO?=
 =?us-ascii?Q?+7woRCezEL+y7KXYSQdgEzvOqh3bMG0lEOxNSQtzS7nACMel4m4FXlkufgvU?=
 =?us-ascii?Q?Z0o4ahWeifGGkGeilJBygYZo/1j3tesnJQh26k82Zd8VofNHtpTYBb85Qsxt?=
 =?us-ascii?Q?zK1uSqJoPLv7fK4cgnmg5oNsv/C5Sgk6qCChy/hGuPiBMtZzPgU4c80rav09?=
 =?us-ascii?Q?o0aNPeoROtgginDDCrL8UNeQCOkyjdXQ/2EAmzH1AHnl3lIrjLVI6ppA8Yk1?=
 =?us-ascii?Q?cZ19wUEYNtb9pQ0L/dHzhDYHF2HB8oASyXHMB39GltJsSCmqjTDER1Bvlwhy?=
 =?us-ascii?Q?nEa1afBdDfpqwnOaY6yxeExT3MIflVRAT0kYz+pO3VIrqTqZ+Q+xExLHQmrZ?=
 =?us-ascii?Q?G13dnJ7DvpCr7BzaxHs4oEOfHuvSHjNwcNy09YtlJ1/NaOjPPkin6HrlnoYm?=
 =?us-ascii?Q?SGCH0fjGClqZb7hkNbZdrFt3plK+eY0ZF1gDjUEOFqMRsT1APKe/XHHMXKxv?=
 =?us-ascii?Q?CX36HbX4QEwHv+1mvlyvZngiDliY5FyCV8XtLiS3hYk3euCod3tPsI1iGbfy?=
 =?us-ascii?Q?StdbphE3qEzyKMs7E/clRw/A5Mh6GbQEHMKfZUwXWgU9ZS2AJ/nCAnorN4Dk?=
 =?us-ascii?Q?A0YeXffbWuIQDliJrL8JUE26AIxRkdP0sCE1utixYGr1ZCt/aXM2GvMkp77C?=
 =?us-ascii?Q?FRPNfqtJTYCRDIc/IQSgbmcPlA25cZTkYvlrmtxxG5RHrmMGSCEnyuF/QRCw?=
 =?us-ascii?Q?59c3Z7hPVvtABfBxlAQ2wOvvJeSbrUdkJSOw1EMD3CspTWUBkbEa13oyPmEE?=
 =?us-ascii?Q?UDFeeJcQ7qAiNBntMOorVbWwaGYcuQs+PVR9uERK/uoaoGuvf9gEY2/ds5FW?=
 =?us-ascii?Q?5zGKICQfOVDWefDp+5UcAuQI4e+mo0bmnO2UvZJ7+rYc9OEnMup/yiv4nAAO?=
 =?us-ascii?Q?m0OvNV//TZFaxoU3TZdLG7Ukz6KQk41sS9rg+GTnTu0AJfL0qJj4184KJrjw?=
 =?us-ascii?Q?+ZGFY+PcKXwLXCUjh+mH9HjhluCiMrHlZouD+DzxI0OcxBw7Fnqb9nbun8P2?=
 =?us-ascii?Q?W+qqJXu7DDD7pUcNrgBWD7bARrjwB3DkU6YijOJZa7fBFxUehq3qFJKqiWhD?=
 =?us-ascii?Q?ueDioK4WfHYW7Jipw31Qo2a4Z0AyqaFrLva4tF5NMBd1sGTsjpAQIj28/HtG?=
 =?us-ascii?Q?0HEYLfhHZ4L5YsH5r/RqQh5gTRy5P9T2HsMHrbKZbgSk8EOh6wZEJ1psY8P3?=
 =?us-ascii?Q?ephCp4s6l+uFFJPO8ut8DjWMpbw9XKeTo2BO5uv23q+AB6bsUWrUYnTLhDhR?=
 =?us-ascii?Q?XGthRkg9qx3BkT8KiEfXmBV8gF4GUrLqw1cbc1OV7M+1H25eNcJVd9DjsgxM?=
 =?us-ascii?Q?5Rinzw7bl95E0xZ4wHlok3N0ZAdDta8/1vRPmC5OBQdxKU1tYMfkchsBMYft?=
 =?us-ascii?Q?oDhS0Qvp8KhgHoUgYPV7+OhuHxftdcaedN4dcF5YIGei2mQE2U/fvNrkOYAC?=
 =?us-ascii?Q?ykNpgA8usEvux/6hGLqP8xiu5myoYwUojr29Le1kRn7uztDrkLTlhHEtAcfq?=
 =?us-ascii?Q?8IKVPUgQ9SrKjrRN9AlLGgz6lFe5waE=3D?=
X-OriginatorOrg: ftdichip.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8209a444-3b98-45ad-0f33-08ded031587d
X-MS-Exchange-CrossTenant-AuthSource: SG2PPFE985372F0.apcprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jun 2026 07:39:09.1240
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: c2456335-1328-47c5-82f2-1fe6783d7182
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ttJOeTPffK7MIBBSAEZMg9kFvMLDdFiEg9wXTjgro6rFZ0mcRdPhO7wUlmiGBDN8uxgzxP7ZizMm65+wx8hkmtmomXhtkQmq53/dJGrYjAE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY0PR0101MB4383

usb_control_msg() can return -ETIMEDOUT, -EPIPE or -EPROTO on a
functioning device when the host controller is momentarily unable to
complete the transfer -- typically under heavy USB bus load.  A common
real-world scenario is multiple high-baud (~916 kbps) FTDI channels
sharing a host controller with limited DMA-channel fairness, e.g. the
BCM2835 DWC_OTG controller used on the Raspberry Pi Compute Module 3.

When this happens during a one-shot userspace operation such as a
sysfs write to /sys/bus/usb-serial/devices/ttyUSBx/latency_timer, the
write returns -EIO to userspace and the chip's per-channel latency
timer register is not updated.  A short retry usually succeeds.

Introduce a small helper, ftdi_send_request(), that wraps
usb_control_msg() with up to FTDI_CONTROL_RETRIES attempts on the
documented transient errno values, separated by
FTDI_CONTROL_RETRY_DELAY_MS.  Non-transient errors are returned
immediately as before.  Each retry is logged with dev_warn() so the
underlying bus condition remains visible in dmesg.

Convert write_latency_timer() to use the helper.  Other chip-side
control transfer sites in this driver may benefit from the same
treatment as transient failures are reported there; this patch keeps
the scope to the one site for which userspace-visible failures have
been observed.

Signed-off-by: Chinna Mopurigari Naveen Kumar Reddy <naveen.reddy@ftdichip.com>
---
 drivers/usb/serial/ftdi_sio.c | 48 ++++++++++++++++++++++++++++++-----
 1 file changed, 41 insertions(+), 7 deletions(-)

diff --git a/drivers/usb/serial/ftdi_sio.c b/drivers/usb/serial/ftdi_sio.c
index 8ae887107de7..ac0951ba74a0 100644
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
@@ -1383,10 +1384,46 @@ static int change_speed(struct tty_struct *tty, struct usb_serial_port *port)
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
 
@@ -1398,12 +1435,9 @@ static int write_latency_timer(struct usb_serial_port *port)
 
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


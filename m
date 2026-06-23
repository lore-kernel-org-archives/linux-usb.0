Received: from SEYPR02CU001.outbound.protection.outlook.com (mail-koreacentralazon11023091.outbound.protection.outlook.com [40.107.44.91])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82C463C8196;
	Tue, 23 Jun 2026 08:03:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.44.91
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782201823; cv=fail; b=JvVM+ikXf1G1stUd+GLwtiNg5/qz7drHgDvHUzXS+fVa1yGGJ6ZAPWL7Pt+N0QPHZyz+lxhNzFqCe+SYj0URV1CybmS7iGGobvFNRVMV3q+VZ3CYmrV262zTqbUXAmpUMHasTAx2O94Agj5YfR1MwpMVnTxn8bRu71irZAd8xE4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782201823; c=relaxed/simple;
	bh=Zt3ceQxg5NDeEC1lLwQkuPK0oxlNTvRY06Nw3bYTR8k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ETuQL44LgvsJP/4hFcfZRnRh5QIsgzUBYEASGevW6NyrEbfOetwLvV2zON+2xYiGgJHshxLq0g7IKjVIlzosdUbfE72SMsOQXqNM54HfXP30mUeVlRgDG7eMbzWreHYeqmQ5e4SRhCT5bs/AK2K8MMa0l6fF2AlJ8ZW9FMUaUPA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ftdichip.com; spf=pass smtp.mailfrom=ftdichip.com; dkim=pass (2048-bit key) header.d=ftdichip.com header.i=@ftdichip.com header.b=BaNs/xh7; arc=fail smtp.client-ip=40.107.44.91
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ftdichip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ftdichip.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ftdichip.com header.i=@ftdichip.com header.b="BaNs/xh7"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zOAHFxmTGBo9/tsnoybLnJN+S1xomoNNXV4g6mJEvuRcyAfrhv11MW7oHiBh8BFX3flfmPmmGwWqdZ0ZHql1HwDpYesRwPjVWFmjvRbbYVrjDVL49JJO4vfmJc+9Tge58/Mcb2W6Jil7Wsardp7M7Y0VZbUJtiZmYD6S+vvA2QDGLNlDjzEjVIFuYLo0RWsZmh9P3uj4EWY/oX57hu8L41kifzY2X6IP+UVCf/pOS7280v2xtJYhb4MhYVWkt40/Puix3v/A1iyQe7H9XVOjJD6kG1MwTABFVatlsgGy7/59GZ6MiG84v+37Fa4rWvnSexz4XAIbi7a7NN2eVkRJTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iWBGO0E4On5roUPqhyxG4WwXBGgCQVu/ya0Ny+VR4QI=;
 b=FgiYkm6A0NPhTkpVqHPQtEjyT+tGsc/LJPXeGd85HYxy4WX5TrpY94I1CEkdveqQquQcjnUfpWGn25CakB1zoahvM37/OHhDavUkFyXFmLg5hB81ECaCYmYMnwGs+OnWGA99ZLlDhm4QrcMB11DNyV/otk0D1Es3ckICnzRFNTQ68ic008+T/ck8gvnYF00jEsXWFo2NI2MKAVM0lQ1gJlks+NHZ06hYxvoKOBgDUhCB7v5v0UwbiVYP58mh6KTDmUg9OMR77/pjEZQtnJpciSObKz/bBDh+hP4lF2PsI4DroDzGpfuqX7Tost1Inan/BzvlUz0Lir/plnh+6kdpYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ftdichip.com; dmarc=pass action=none header.from=ftdichip.com;
 dkim=pass header.d=ftdichip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ftdichip.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iWBGO0E4On5roUPqhyxG4WwXBGgCQVu/ya0Ny+VR4QI=;
 b=BaNs/xh77QdanRac/jJRZGrNLIvNE/t50yh7eDFcsEEIzc+XVK38eRQetuIGSPMEnmy8GsRnONlVkM4hJer/yXfi/7ZbB19ObCwBGxjcWTVtHSxEdWu6zYdN7LP4s7rfNG3k5KKqRtgXUWqCuirmB58PNd6QsRfmRgRanb7f3IsfU2r0d6Zqm3ue8/lHrCHUBAtadtRXa3xXOOLOMgkme26Ha31pcmuHulFNx50sp48LAWk90krW/9JJaU9F+RJFlbWwOCWp9ST2WOuMtVrB05J9rmZWIqR/c2VAacRwdXtinnUnP1YICBpEEGhHNIbZnY0bURPE2ljdRNTw3JiwBw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=ftdichip.com;
Received: from SG2PPFE985372F0.apcprd01.prod.exchangelabs.com
 (2603:1096:f:fff6::45e) by OSNPR01MB7296.apcprd01.prod.exchangelabs.com
 (2603:1096:604:318::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.18; Tue, 23 Jun
 2026 08:03:36 +0000
Received: from SG2PPFE985372F0.apcprd01.prod.exchangelabs.com
 ([fe80::e65f:ac00:2342:9108]) by
 SG2PPFE985372F0.apcprd01.prod.exchangelabs.com
 ([fe80::e65f:ac00:2342:9108%4]) with mapi id 15.21.0139.018; Tue, 23 Jun 2026
 08:03:36 +0000
From: Chinna Mopurigari Naveen Kumar Reddy <naveen.reddy@ftdichip.com>
To: Johan Hovold <johan@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Arun Pappan <arun.pappan@ftdichip.com>
Subject: [PATCH v3 1/2] USB: serial: ftdi_sio: retry transient errors on chip-side control transfers
Date: Tue, 23 Jun 2026 16:03:20 +0800
Message-ID: <37cc6844010da737aeae61e0248fb3e9ca5e35b0.1782201674.git.naveen.reddy@ftdichip.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1782201674.git.naveen.reddy@ftdichip.com>
References: <cover.1782121274.git.naveen.reddy@ftdichip.com> <cover.1782201674.git.naveen.reddy@ftdichip.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TP0P295CA0016.TWNP295.PROD.OUTLOOK.COM
 (2603:1096:910:5::20) To SG2PPFE985372F0.apcprd01.prod.exchangelabs.com
 (2603:1096:f:fff6::45e)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SG2PPFE985372F0:EE_|OSNPR01MB7296:EE_
X-MS-Office365-Filtering-Correlation-Id: b68c64cb-627f-46c4-c201-08ded0fded25
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|376014|366016|52116014|18002099003|22082099003|38350700014|4143699003|6133799003|56012099006;
X-Microsoft-Antispam-Message-Info:
	4vmeNkt32Tw0pXoJ31iei+JgUnHMCq88NtKjzYH/AwFOeg0vB8bYuGMorB+q3LJzv3dzew6eKj+r2KMP2potLHm1acpC/zg/I6nKT4nIpGjAIgHUzeTe/6k4082MaUBTBoB44wi/R8M1Pmh+A8YfxTYkhTPGcuFVD2jbjTFvxSZBDx7ql0wCoXQBDJGEkFdDs99leU55ugpXxMaJthgzb+TP5SvPlIZGVJzt1uBBLO4cwAkgiQtuyTfp3ezhYKuzFEPrt1KQWMePdHhUNrv5HmHvOb1O75aWNC//ZpSqN96st93AEU3y4qfxaqYK4YLaAh6zHuUrnGqOY0rXx0xQkmZqv6BY4OljiKC9NBCQTmcwC3v03fK7Stz72ngSRW5jLoEat1BPTvMu1qPe+hlXC7jSOkaLdm2dqI7qmDikpsWBv3uiFJKCvubhABCnx0wvsR/LRZ9qKA9AWtIMlg8UmDiFtI+kgtxkC+gNvK7CoHzLJwkNqkIFT/FORcC8cmYigc6tbTjuLD1BKC8VZeGW48/WeKH8yFq6qQF+BkIOfbhNv2RAADRcTdhoxEgsKWd+0E3QNOU2+1v67X5cuztuwn4JvMysgV+dp28Mi8YY/YUWxZ8Rl0EWeMKKVvonpA8zGFtRnaUpAT/MOpN/gtzU7JM0QMDXhHf77VNXDJxxo5CHu3ZHFFKTRGHLTpEPtMHdRd4StIawmuv4beU2sVKDY/paaSKvcK66ro6vk9OiZGg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SG2PPFE985372F0.apcprd01.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(376014)(366016)(52116014)(18002099003)(22082099003)(38350700014)(4143699003)(6133799003)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?072gu3mPPwOJxGiV2ZP28Udu3rJnJioCr4TadzFwFNgDVXmBTML6kpgsbiv/?=
 =?us-ascii?Q?/ewRsqnbU6vXNxF2RZI0MXVNkUNnwVHuhch2maJpbBrVpWwhf7pPWDs40cOX?=
 =?us-ascii?Q?PyTVDI6bkv/tGr9H+eMZ3dbkPVpqNybdMHsaawVgO3XM3kurpioSKCcotrFO?=
 =?us-ascii?Q?1xoMUW8q/eghXjqyLbUJ4nuNDHNchlyGoGN07/ji/AI/nYAefCTN1KHj/6oF?=
 =?us-ascii?Q?CdPqGpDPgM+rEnpZR3x9YwsY52kSu/WGL86hl/XUaWuMtRd6KSO6FhCrKmx2?=
 =?us-ascii?Q?+t7kJfCIS2bZx3/6Z6t/b0n24HKAOb+LhF7ThII34sCBg+L+vqi4rqf/Cv1x?=
 =?us-ascii?Q?fhoPrzXbqC7ZpcUGxuTVfwrFoEXA9m6qDMksv1TdqSm44mod4kPLB50nC9HB?=
 =?us-ascii?Q?Qhtsh5GrHA2wG63HXufiJ6u1lxieZ9REcIX0pO1EA2PYKUn8vcLhAr1rv9Vi?=
 =?us-ascii?Q?bPCSqt69ANdYn1Z/A/Qfkubfl8BiytfPMP173vHuMhOrtbcQVsG50jECwHWn?=
 =?us-ascii?Q?o/EIS9qLHtz1I++XxUkRm5DHCo/U37uSxZxifMTpR53M0OVxI/SYJFsM36oQ?=
 =?us-ascii?Q?uF9CHWrV1uVBJkFd1KcdGsxJ3NZ7FIGgPOWk45ZmR1F19Akh92MFNWMVXH5g?=
 =?us-ascii?Q?uUGks97iJAVqVg07yh+kMdJAGxubS8BCnQA0d0YiCe+LYH9CWr5O6q7SAzoE?=
 =?us-ascii?Q?S6akVGGOVGE/gGs5vz5vJos/VBPHYpQoBtqBE9kzJJDEFcy0i4kVnKnk6U3g?=
 =?us-ascii?Q?EWzUrk1Yhvi24EgbNa8v19WGr2t4jGU+aTNjQRweIcZHmCKlpjW2Zs47hOaK?=
 =?us-ascii?Q?xnZm0OrOui5qMoHkAjuw3BQAyHuzelA6GHatknNwxwIlZBSNwbCaRRuPcfVn?=
 =?us-ascii?Q?BcM6W2olmiGXJvgmWNKvIr9UE6aLm+7RGFd9fdJhGUQHGsphh5Q1+NEZ0lRq?=
 =?us-ascii?Q?XijYmKP+qIATgd2vgZKwTLMHJ+LD45ec+c9n3OGUgpjII2Eh240TTX7jkzSm?=
 =?us-ascii?Q?FG5kp2J/U/oPdT33eraLH3CUrbPad/M0B5+tuzxXUmrVZUfREyMwnh9phQB2?=
 =?us-ascii?Q?Tfm8hiv5DbsB2l0nTScaBxh20BMbLa+NVO8v2//BxiUz+TddzUinNtcsZbBH?=
 =?us-ascii?Q?sI4JBiqIvhzZud+6KgKcoM4GrZuoGsurvK7a1Qu6rgSkKZUrqGohE2QgCu3k?=
 =?us-ascii?Q?0miAGw27b1Co6taiGEkHWy9AxljbUJtLUnQ+Mv6b3etGTBY8/mtX4onWmi+h?=
 =?us-ascii?Q?q6Mq+duFm3pn6ZDzZevKfhDsgOsQ09bSlZX+WzflXiw/FYe0ew7wz5+N7uL9?=
 =?us-ascii?Q?utcWO/U0YF0rTRtpGb1tNJZ9su5n2TF/OPbBpMXww9baOjtoWR397VUE7jp2?=
 =?us-ascii?Q?U2qOz+Zihoc0SuwN7oTjTzJoGkFOUppJgR3zd/RvJN1a1ZXwvE5NmVSLuvpR?=
 =?us-ascii?Q?bBDTJyiFxpQ2qufE2w3zwFqLXl4A+/3L3gR06k/blfMc1c9Mta0tFfM0lH4M?=
 =?us-ascii?Q?JYAB/uZvAejQ1plBRYh7reAxAMqzpQnhQ6WYRqP08XCESThFrvwuoO/7PJJc?=
 =?us-ascii?Q?6qr8tiVTfQJlW4TalDFj1FhIoz3zOQ2Pbs6zGKskUYXskbctBI/t1QhDaoJM?=
 =?us-ascii?Q?jFlyOT8i78JnQlimI5BuNrRC7rmC8VeBF4wsG6yMGLoaGsXqR88AFmPAnbHV?=
 =?us-ascii?Q?vO3CYHk1/L+C0K5DXc/P8X365HDl1ugZVb9kmiBtVKTcWmv5L1lljTao8TIG?=
 =?us-ascii?Q?ZpTs7Jod9E2DTQk7cOp8F+2YkA5kCgg=3D?=
X-OriginatorOrg: ftdichip.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b68c64cb-627f-46c4-c201-08ded0fded25
X-MS-Exchange-CrossTenant-AuthSource: SG2PPFE985372F0.apcprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2026 08:03:35.9084
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: c2456335-1328-47c5-82f2-1fe6783d7182
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZYwWF76U9tWDd7J8ZOPyx9i8/Jt9NQujQgUGUDqDtc6tkLHyT8HXL0gEKORFnLPL0RNn7uX1FusV/J0C/cbMfMq0oxiEcYh6l66/jxWpqUI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSNPR01MB7296

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


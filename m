Received: from TYDPR03CU002.outbound.protection.outlook.com (mail-japaneastazon11023072.outbound.protection.outlook.com [52.101.127.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18BFD36D9F1;
	Mon, 22 Jun 2026 07:39:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.127.72
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782113954; cv=fail; b=obWnZREYZDkXID5qIq8iCBLPANhfG+KjBH2I6Q1R/sLjTVR+J476vYPkizG5HAh6zqTavEyEQupCCcIkeE5jeRdFtvBAGzzga7uFNQlkBcs9MBXX2AD0b6q07r3qC3Am02kxGBz6Sd9v/1knklB6DRObpyGYBwh0iWe3iPw29A4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782113954; c=relaxed/simple;
	bh=EyvWAmOnMRztUypA0sdS/KpZEYx0bvIMHmZNQ+PuxPI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ilS/yOZBC+pMSvo0oEpOMhlRpHtSBqINHIMCVqxuinCgDN/rkCy+doNifUpYP4GRf6l9dwHANmDEeNI0Yb2UiH9N2s5sHT05DIURy//w9k/EMaoMAj12USKTEhL6vCwla6nYyIOX3w/JpA/cu8ygjl+dqGp6eI/eeMFuC0vM8cE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ftdichip.com; spf=pass smtp.mailfrom=ftdichip.com; dkim=pass (2048-bit key) header.d=ftdichip.com header.i=@ftdichip.com header.b=hcd+c7un; arc=fail smtp.client-ip=52.101.127.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ftdichip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ftdichip.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ftdichip.com header.i=@ftdichip.com header.b="hcd+c7un"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ILED5FceoTvQyr2/QI2Wfm2Fwdkeb7cCKixE/c8EJWktQxzMu2y5ZS06H/t+CaPDPli3uhgJxld/Ndi96/WaUWF3TWfjkpMoi2SpiPdcJCbu/fk6KYUmX1Ud1XDGerzbeyhBS8JT3DRRlIg3EHLpvzFNB/esTbjprv03CkXt9/S39EuDyzkDKwKQGUGO7LG1vq1guyziGEAK2BUcLOURWwfIB9UseEKWaBcyUXXObuvOsTautVS3UiUJkWuOTxFrsw4jsTjFb2WjUlLre8PHVnM7yAKGfJW5krCNuYMw1mpzIb8UPeMyIwe4H1kx2hRmWR7KHbi0bTs9nFj07Q2lng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IqD7Du/YOyJ9oSnivMVs+8JBKTXIwiuH+SM0Sj/KfOU=;
 b=IMyGlQvQI/WMmDXP5hM64VhxO2KcHxhOede7Ld6OhPyKwvCjI4riSKKuf4eRNDC2d0NK2asjeHcUXmavm7sP5Obz5WWyshVrj2G5xkZZe/XFXZcfrpmGQLh9hOXDm3Bqq52Tamp6E0s9Rz40Kv59f5x3IU/RS3jgSr/fx1urfPq6N+86NuOawKz0m/f31SQ1eGWu+/ULIuve8TNh0CczSjZK6cH0Ka83Q18auQ8VjkxtnJSfHPhM+bRzFy6oSoe5y8rE11oX8VAlpkVoiEsWZ7ZTidiAoWe4I3trD4OL7KaVFZK32XqV0iN60wcjseSYBdQunPPYSSYthiHaR4q+Ew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ftdichip.com; dmarc=pass action=none header.from=ftdichip.com;
 dkim=pass header.d=ftdichip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ftdichip.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IqD7Du/YOyJ9oSnivMVs+8JBKTXIwiuH+SM0Sj/KfOU=;
 b=hcd+c7unC2JoBE2m1HcOnnit3tWlPuAPsJd01PwimbM2so2l3qgyeLEt/JcbeYN1Y7q+9NHVBfdkcFGbgWTpRZNWTdKstTv6nTXveB1HnSXKJ6ZFxvsADvJToqBbw4S28NYLKqbCSDD2ADVpj4Qg+j4tLervEAUJR51TGPaqV61RS2eL5NwVwziEvZmbzGc73yCFjaAzapE7bAXbvkccgMyFwwkjvvyN2mGIU5M4qBkeIhr7miBRmtZj0AEhZ2ub31kGax6kIyjhGp0poD4+5iqoeCezCqDa8GjN6VWy70im/6nxaP/oICedptvd78U6vZweXvrgjRZXUoxwt45DPg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=ftdichip.com;
Received: from SG2PPFE985372F0.apcprd01.prod.exchangelabs.com
 (2603:1096:f:fff6::45e) by TY0PR0101MB4383.apcprd01.prod.exchangelabs.com
 (2603:1096:400:1b6::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.11; Mon, 22 Jun
 2026 07:39:08 +0000
Received: from SG2PPFE985372F0.apcprd01.prod.exchangelabs.com
 ([fe80::e65f:ac00:2342:9108]) by
 SG2PPFE985372F0.apcprd01.prod.exchangelabs.com
 ([fe80::e65f:ac00:2342:9108%4]) with mapi id 15.21.0139.018; Mon, 22 Jun 2026
 07:39:08 +0000
From: Chinna Mopurigari Naveen Kumar Reddy <naveen.reddy@ftdichip.com>
To: Johan Hovold <johan@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Arun Pappan <arun.pappan@ftdichip.com>
Subject: [PATCH 1/6] USB: serial: ftdi_sio: add configurable inter-batch defer for read URBs
Date: Mon, 22 Jun 2026 15:38:34 +0800
Message-ID: <eb7093a47b77e9ef3ab55ada4c9591ae472da645.1781744946.git.naveen.reddy@ftdichip.com>
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
X-MS-Office365-Filtering-Correlation-Id: bfa6485a-6d12-466f-4a3b-08ded03157e0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|52116014|366016|23010399003|18002099003|22082099003|38350700014|56012099006|3023799007|6133799003;
X-Microsoft-Antispam-Message-Info:
	hxuD9gV8lCy1XO/IPbL2JS4f22ZkVuZsh0S8Km5Z6MqHOa79EBYZUHOApeqY73A5EAdmbn/DBNJ5Yqsd5Namfou52BHCM6r/IZmbnZyFBss+1rw8t41n+o59X5WiLYPoqaYQfqSMxUB1Kc6hQgmS4WNaI3OHzJoiK7zrLoATtod1DWcBVdZwbx/mrmQHxSfG3J8UILScYUhKPWYDp32scmWoUErda8ukmgbLFHpzWtaKmepsIIH7MztIWIksELwQR/vW8Frh6gRatjM1608RBqlXFtAJZABnjAHOEno3P5unh6XtRQ+CiWBVaYzlVSrN+gxY/UngOxB3h1VZ2L+gwrm9i0KvhRVE81AU+ozttdRNSBrtMzbI+yFG3eTBg1Dye6FHBIgE7uPzFDDU541U4GSNML+h8on9hn2X5nDR2FqJLvekeF3Wzkwu72dmFZpSWQ8hYTAnJXG8JynMAGisZgWJbMUmpYBYSysCs023cXAVh3Cen5opePF88tDKq0lv/c765fwIHnqg0Ideriuk3mpfUm3lYhgz5B2hp99y9tn9WRiJlEFVu7WCb56caFnRB1Xqqguaf17EpM4hK5iM4+FZocS5j+vNbbpRCigMcLf/OLNhL4kZ63D2hUt1sq0RGYMtO7AZnB+wQvlt4/adDGTonlDXoxaKNMsqcgsWlCwNg/O3AzTzhhmC+xh6PGyXf4K5XxmNDQXRJWmv81VDZDMf11ShaEqMYqCLdfXTmk4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SG2PPFE985372F0.apcprd01.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(52116014)(366016)(23010399003)(18002099003)(22082099003)(38350700014)(56012099006)(3023799007)(6133799003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?UMwdSizqe7lP3/kktdyKygMX7FPgCsTba9DU+eLY1CHoKKeqh7mXxnQ51hLl?=
 =?us-ascii?Q?i3k6fNFS1VAelZMvQnAkHoZd8jtBK93C6t539g4AypCtspKBd5E2ehBKLW7g?=
 =?us-ascii?Q?jPUES9tUof8wPzj/qFPwn/fnFELSgRg9rsQpaBYO09SoIxw9/DtasBYpH35X?=
 =?us-ascii?Q?3fJ4bF1t19r43aFYrH524gItj6YkkAyXSjpenGjIfwzFEvQj7AucRhkiJAyi?=
 =?us-ascii?Q?dGN6kL6ZvR6jPmQS8dj7lzyysJ7VqI3pSzMe2CkXRcJ3gciUNKeKNqBK8fiw?=
 =?us-ascii?Q?5Ol2xdY0jfWKRK6Y4ox3lw/KSVdZ/JXwSy12roa7zUY1cocA8Faq+0a0RwCP?=
 =?us-ascii?Q?UjO3lsMzWDP4VCItajuwl7Y/IBFvxSWmXcrUfSqF2mIVtOPhKzc0tv/0jNu9?=
 =?us-ascii?Q?f6wDezw8HD9q0KS+6RkeU6JqPKFIPVesDeRrVqvIjFXpcL7SgWzNZtdABORc?=
 =?us-ascii?Q?zMyrghEhFzQZyylHsZEwjcDg7p2Ix/4npZl2oAiUAgoHK1REGS2MRU0N3jn6?=
 =?us-ascii?Q?By0CtvoFHghU8nBVl7i9ukN2ZIBF+Qkiqnhf8NdHr11m4MfjJu8oF0HKCT5e?=
 =?us-ascii?Q?YD7/fq+YSgpfk4hQiumR8KCBziGxc91rGOXOphbYEKTPwXMhEzoso215uA1L?=
 =?us-ascii?Q?0j5F6doOBPzyQF73UmQXHrS+LB9OWvmYcTRq36syE9Cx7p5xxi+L8wygrWFr?=
 =?us-ascii?Q?jMuTeny3SizhPaTy8QbvHZAPfVwSCxjqacCDsMDUuYDpEv86aZT4R3kvn/7a?=
 =?us-ascii?Q?dthd7i7ZInSTBCTd8vkimysLwsviwUKWDxa8LkkJfmXsBJNsmTIpf+6bWgVo?=
 =?us-ascii?Q?OwLTBGpuqqaaG0gy2l2hbUwVpklqrubYadvXLI5nwDYbrcg3RoIybH0qnkvA?=
 =?us-ascii?Q?kueYD/AP41i+XpwujzSfoCzpU6Q9yCTPfBCZfw+kEsUCulT6pWYjXmOXF4ff?=
 =?us-ascii?Q?axfmZZGaFWtJg1iNDw/oW/fIow502WMNEFbMcwXSoH5fKrDMLUdwYxaiA4lX?=
 =?us-ascii?Q?yrz2DBj+N5KyOsUhCFf0hHRPWl6iF+oh2KLawKNdflqMbHbTp0sL8n05LScj?=
 =?us-ascii?Q?ebTTMTgrwPTW87iEMBijVY33MArPqWKUZPnn9SlPq4+5soqtHFtUOPvZ6P/p?=
 =?us-ascii?Q?H5BaI3Zk1OL72dOyiPiQRN1uId8Qvo1mjVi57HWf9e+Ahdg5Wie5n2kUrSpD?=
 =?us-ascii?Q?GLQqrITneVChhULhrS9KaU3zhAWuGwriOzdOhZl91TxfRqfdrEOQiI3/jV9X?=
 =?us-ascii?Q?ac9yeEVmkfkKpxwgGFFG37Xd5stmuxNR4YbJ8G7aTY+vTp5cE3uTSC4JK7wm?=
 =?us-ascii?Q?z346XWWhx3VHAsY4+0I6FpERU2Cy9ndvvj3Rr8+L37mNbEGu8cGm4QZkp8RH?=
 =?us-ascii?Q?wp0L2RnY/oERuBf5VvhJekC+KdvBonHtmHTUgcK2rqN5PoCjlBnkKKvN833U?=
 =?us-ascii?Q?U14sTTl9vICmlZl8CGeuXa38j7WVmwZqQPWK0Fw9gh25InG3OzyCId16b56j?=
 =?us-ascii?Q?RFxpquNQt5UtnmUQbeDUd/oTU59/1X/byFZ0+Ll82i6R4rCH5Joq0GLMLsAC?=
 =?us-ascii?Q?N3TqlxFtF+Syq358FlvQf0sQ+z1nP/0YQfvDa9HxuwxFpcTh3/D9n/uHd8W5?=
 =?us-ascii?Q?zebMzv6XT19Jh6Cg118nDIlmEAC/zTHrSCWlZBNUBSRn1AFeyPm3cj30jBSJ?=
 =?us-ascii?Q?XSG+cWdRbbO6I73Bp9f6UbOc9ZZqEc/s64aEItBZXmW+wRMtazzpG5XGA0ee?=
 =?us-ascii?Q?fYlh+DBW/3Fb37WV0KftQ1aM8R99FAw=3D?=
X-OriginatorOrg: ftdichip.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bfa6485a-6d12-466f-4a3b-08ded03157e0
X-MS-Exchange-CrossTenant-AuthSource: SG2PPFE985372F0.apcprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jun 2026 07:39:08.1394
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: c2456335-1328-47c5-82f2-1fe6783d7182
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: u1NW3at6zfpoCjnHJICzED1GjvIRGj8s/MXk/Lwp+4cwjNvbCUKReNOEc9YItoKsuakrh+YXlX7azc0+nQdKyyetnC3Y2OcbT0bjtD7bGI0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY0PR0101MB4383

Some USB host controllers do not enforce DMA-channel fairness
between devices.  On such hosts, ftdi_sio's read-URB resubmission
rate from a single high-throughput device can occupy every
available DMA channel and block progress on the control endpoint
and unrelated devices on the same bus, with visible consequences
such as failed device enumeration and stalled hub events.  The
BCM2835 DWC_OTG controller used on the Raspberry Pi Compute Module
3 is one example: at ~916 kbps per channel across two FT4232 chips
(eight RS485 channels), the symptom is reproducible.

Most hosts are not affected and should see no behavioural change.
Field testing on a CM3 with two FT4232 chips shows the symptom
only when more than five channels are concurrently open at this
baud; smaller configurations on the same host work fine with no
defer at all and would only pay a latency cost for it.  A default
defer would therefore be inappropriate.

Add a module parameter urb_defer_timer_ns whose default is 0,
which leaves the new code path inactive: ftdi_read_bulk_callback()
delegates straight to usb_serial_generic_read_bulk_callback() and
the driver is bit-for-bit equivalent to the version without this
patch.  Setting urb_defer_timer_ns to a non-zero value (clamped to
FTDI_URB_DEFER_MAX_NS = 100 ms) enables a per-port inter-batch
defer: after each read URB is processed, the port is throttled and
an hrtimer is armed; on expiry, usb_serial_generic_unthrottle()
clears USB_SERIAL_THROTTLED and the generic submit path resubmits
the next batch.  This bounds per-device DMA-channel occupancy on
the host controller without changing how each URB is processed.

The parameter is settable at module load time
(modprobe ftdi_sio urb_defer_timer_ns=30000000) or at runtime via
/sys/module/ftdi_sio/parameters/urb_defer_timer_ns; runtime
changes apply to ports probed after the change.

A new ftdi_close op cancels any pending hrtimer and drops the tty
reference captured at open.  ftdi_port_remove() also cancels the
timer so it cannot fire on freed memory after a hot unplug.

Read URBs are resubmitted from the hrtimer callback (and, when no tty
is bound, directly from the completion handler) -- both atomic
contexts.  usb_serial_generic_submit_read_urbs() cannot be used there:
its error-recovery path calls usb_kill_urb(), which sleeps, so a
failed inner submit under bus pressure would sleep in atomic context.
A small helper, ftdi_atomic_submit_read_urbs(), submits each free read
URB inline with usb_submit_urb(GFP_ATOMIC) -- which does not sleep --
and returns the URB to the free list on failure for the next
completion to re-drive.

100 ms is the upper bound at which most real-world RS-232/RS-485
protocols still function; values higher than this are rejected as
indicative of misconfiguration.

Subsequent patches in this series add a per-port low_latency sysfs
attribute that selectively bypasses the defer on a single port
when it is globally enabled, and the serialisation needed to
toggle that attribute safely under load.

Signed-off-by: Chinna Mopurigari Naveen Kumar Reddy <naveen.reddy@ftdichip.com>
---
 drivers/usb/serial/ftdi_sio.c | 274 +++++++++++++++++++++++++++++++++-
 1 file changed, 273 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/serial/ftdi_sio.c b/drivers/usb/serial/ftdi_sio.c
index af14548fa03d..8ae887107de7 100644
--- a/drivers/usb/serial/ftdi_sio.c
+++ b/drivers/usb/serial/ftdi_sio.c
@@ -41,12 +41,25 @@
 #include <linux/serial.h>
 #include <linux/gpio/driver.h>
 #include <linux/usb/serial.h>
+#include <linux/hrtimer.h>
+#include <linux/ktime.h>
 #include "ftdi_sio.h"
 #include "ftdi_sio_ids.h"
 
 #define DRIVER_AUTHOR "Greg Kroah-Hartman <greg@kroah.com>, Bill Ryder <bryder@sgi.com>, Kuba Ober <kuba@mareimbrium.org>, Andreas Mohr, Johan Hovold <jhovold@gmail.com>"
 #define DRIVER_DESC "USB FTDI Serial Converters Driver"
 
+/*
+ * Configurable inter-batch defer on read-URB resubmission. Useful on
+ * host controllers that do not enforce DMA-channel fairness between
+ * devices (the BCM2835 DWC_OTG on the Raspberry Pi Compute Module 3
+ * is one example), where an unbounded read-URB rate from a single
+ * high-throughput device can occupy every DMA channel and prevent
+ * progress on the control endpoint and unrelated devices on the same
+ * bus. Bounded to 100 ms; disabled by default.
+ */
+#define FTDI_URB_DEFER_MAX_NS	(100 * 1000000)
+
 enum ftdi_chip_type {
 	SIO,
 	FT232A,
@@ -89,6 +102,13 @@ struct ftdi_private {
 	unsigned int latency;		/* latency setting in use */
 	unsigned short max_packet_size;
 	struct mutex cfg_lock; /* Avoid mess by parallel calls of config ioctl() and change_speed() */
+
+	/* Inter-batch defer state (see FTDI_URB_DEFER_MAX_NS). */
+	spinlock_t		urb_defer_lock;	/* guards tty and timer_active */
+	ktime_t			urb_defer_ktime;
+	struct hrtimer		urb_defer_timer;
+	struct tty_struct	*urb_defer_tty;
+	bool			urb_defer_timer_active;
 #ifdef CONFIG_GPIOLIB
 	struct gpio_chip gc;
 	struct mutex gpio_lock;	/* protects GPIO state */
@@ -2167,6 +2187,95 @@ static void ftdi_gpio_remove(struct usb_serial_port *port) { }
  * ***************************************************************************
  */
 
+/*
+ * Module parameter: inter-batch defer between read-URB resubmissions,
+ * in nanoseconds.
+ *
+ * Default 0 -- defer disabled, behaviour identical to prior versions
+ * of this driver. Set to a non-zero value (typically 30000000 = 30 ms;
+ * clamped to FTDI_URB_DEFER_MAX_NS = 100 ms) to bound the read-URB
+ * resubmission rate on hosts whose USB controller does not enforce
+ * DMA-channel fairness. Settable at module load time
+ * (modprobe ftdi_sio urb_defer_timer_ns=30000000) or at runtime via
+ * /sys/module/ftdi_sio/parameters/urb_defer_timer_ns; the new value
+ * takes effect on ports probed after the change.
+ */
+static unsigned long urb_defer_timer_ns;
+
+/*
+ * hrtimer callback that fires after the configured defer interval and
+ * un-throttles the port so the generic submit-read-urbs path can run
+ * again. The timer is armed with HRTIMER_MODE_REL, so this runs in
+ * atomic (hard-irq) context and must not sleep.
+ */
+/*
+ * Resubmit the port's free read URBs from atomic context.
+ *
+ * usb_serial_generic_submit_read_urbs() accepts a gfp_t and looks
+ * usable from atomic context, but its error-recovery path calls
+ * usb_kill_urb(), which sleeps waiting for the URB to be reaped.  If
+ * an individual usb_submit_urb() fails -- which can happen under bus
+ * pressure -- calling that helper from a completion handler or hrtimer
+ * callback would sleep in atomic context.  Submit each free URB inline
+ * instead; usb_submit_urb() does not sleep under GFP_ATOMIC.  On
+ * failure the URB is returned to the free list and the next completion
+ * re-drives submission.
+ */
+static void ftdi_atomic_submit_read_urbs(struct usb_serial_port *port)
+{
+	int i;
+	int res;
+
+	for (i = 0; i < ARRAY_SIZE(port->read_urbs); ++i) {
+		if (!test_and_clear_bit(i, &port->read_urbs_free))
+			continue;
+
+		res = usb_submit_urb(port->read_urbs[i], GFP_ATOMIC);
+		if (res) {
+			dev_dbg(&port->dev, "%s - submit failed: %d\n",
+				__func__, res);
+			set_bit(i, &port->read_urbs_free);
+		}
+	}
+}
+
+static enum hrtimer_restart ftdi_urb_defer_timer_callback(struct hrtimer *timer)
+{
+	struct ftdi_private *priv = container_of(timer, struct ftdi_private,
+						 urb_defer_timer);
+	struct tty_struct *tty;
+	unsigned long flags;
+
+	spin_lock_irqsave(&priv->urb_defer_lock, flags);
+	priv->urb_defer_timer_active = false;
+	tty = priv->urb_defer_tty;
+	if (tty)
+		tty_kref_get(tty);
+	spin_unlock_irqrestore(&priv->urb_defer_lock, flags);
+
+	if (tty) {
+		struct usb_serial_port *port = tty->driver_data;
+
+		/*
+		 * This is the body of usb_serial_generic_unthrottle(), but
+		 * that helper resubmits with GFP_KERNEL and may sleep; we are
+		 * in the hrtimer's atomic context, so clear the throttle bit
+		 * and resubmit with GFP_ATOMIC instead.
+		 */
+		clear_bit(USB_SERIAL_THROTTLED, &port->flags);
+		/*
+		 * Order the throttle-bit clear before the resubmit, pairing
+		 * with the barrier that guards the read_urbs_free update in
+		 * ftdi_read_bulk_callback().
+		 */
+		smp_mb__after_atomic();
+		ftdi_atomic_submit_read_urbs(port);
+		tty_kref_put(tty);
+	}
+
+	return HRTIMER_NORESTART;
+}
+
 static int ftdi_probe(struct usb_serial *serial, const struct usb_device_id *id)
 {
 	const struct ftdi_quirk *quirk = (struct ftdi_quirk *)id->driver_info;
@@ -2186,6 +2295,7 @@ static int ftdi_port_probe(struct usb_serial_port *port)
 {
 	const struct ftdi_quirk *quirk = usb_get_serial_data(port->serial);
 	struct ftdi_private *priv;
+	unsigned long defer_ns;
 	int result;
 
 	priv = kzalloc_obj(struct ftdi_private);
@@ -2193,6 +2303,20 @@ static int ftdi_port_probe(struct usb_serial_port *port)
 		return -ENOMEM;
 
 	mutex_init(&priv->cfg_lock);
+	spin_lock_init(&priv->urb_defer_lock);
+
+	/*
+	 * urb_defer_timer_ns == 0 leaves the inter-batch defer disabled
+	 * for this port; ftdi_read_bulk_callback() short-circuits to the
+	 * generic callback below. Otherwise clamp out-of-range values to
+	 * the documented maximum.
+	 */
+	defer_ns = urb_defer_timer_ns;
+	if (defer_ns > FTDI_URB_DEFER_MAX_NS)
+		defer_ns = FTDI_URB_DEFER_MAX_NS;
+	priv->urb_defer_ktime = ns_to_ktime(defer_ns);
+	hrtimer_setup(&priv->urb_defer_timer, &ftdi_urb_defer_timer_callback,
+		      CLOCK_MONOTONIC, HRTIMER_MODE_REL);
 
 	if (quirk && quirk->port_probe)
 		quirk->port_probe(priv);
@@ -2307,6 +2431,8 @@ static void ftdi_port_remove(struct usb_serial_port *port)
 {
 	struct ftdi_private *priv = usb_get_serial_port_data(port);
 
+	hrtimer_cancel(&priv->urb_defer_timer);
+
 	ftdi_gpio_remove(port);
 
 	kfree(priv);
@@ -2316,6 +2442,7 @@ static int ftdi_open(struct tty_struct *tty, struct usb_serial_port *port)
 {
 	struct usb_device *dev = port->serial->dev;
 	struct ftdi_private *priv = usb_get_serial_port_data(port);
+	unsigned long flags;
 
 	/* No error checking for this (will get errors later anyway) */
 	/* See ftdi_sio.h for description of what is reset */
@@ -2329,12 +2456,46 @@ static int ftdi_open(struct tty_struct *tty, struct usb_serial_port *port)
 	   This is same behaviour as serial.c/rs_open() - Kuba */
 
 	/* ftdi_set_termios  will send usb control messages */
-	if (tty)
+	if (tty) {
 		ftdi_set_termios(tty, port, NULL);
+		spin_lock_irqsave(&priv->urb_defer_lock, flags);
+		priv->urb_defer_tty = tty_kref_get(tty);
+		priv->urb_defer_timer_active = false;
+		spin_unlock_irqrestore(&priv->urb_defer_lock, flags);
+	}
 
 	return usb_serial_generic_open(tty, port);
 }
 
+static void ftdi_close(struct usb_serial_port *port)
+{
+	struct ftdi_private *priv = usb_get_serial_port_data(port);
+	struct tty_struct *tty;
+	unsigned long flags;
+
+	/*
+	 * Stop the defer machinery before tearing down the read URBs.
+	 * Clearing urb_defer_tty first means the timer callback (and a
+	 * racing read completion) sees no tty and will not resubmit;
+	 * cancelling the hrtimer then guarantees it cannot fire after
+	 * usb_serial_generic_close() has killed the read URBs. Doing this
+	 * after the close, as before, left a window where the timer could
+	 * resubmit URBs behind a closing port.
+	 */
+	spin_lock_irqsave(&priv->urb_defer_lock, flags);
+	tty = priv->urb_defer_tty;
+	priv->urb_defer_tty = NULL;
+	priv->urb_defer_timer_active = false;
+	spin_unlock_irqrestore(&priv->urb_defer_lock, flags);
+
+	hrtimer_cancel(&priv->urb_defer_timer);
+
+	usb_serial_generic_close(port);
+
+	if (tty)
+		tty_kref_put(tty);
+}
+
 static void ftdi_dtr_rts(struct usb_serial_port *port, int on)
 {
 	struct ftdi_private *priv = usb_get_serial_port_data(port);
@@ -2519,6 +2680,111 @@ static void ftdi_process_read_urb(struct urb *urb)
 		tty_flip_buffer_push(&port->port);
 }
 
+/*
+ * Read bulk completion handler with URB-defer throttling.
+ *
+ * Behaves like usb_serial_generic_read_bulk_callback() except that,
+ * after processing the URB and marking it free, it throttles the
+ * port and arms urb_defer_timer so the next batch of read URBs is
+ * submitted at most once per urb_defer_timer_ns. This caps the
+ * controller-side DMA pressure created by this device.
+ */
+static void ftdi_read_bulk_callback(struct urb *urb)
+{
+	struct usb_serial_port *port = urb->context;
+	struct ftdi_private *priv = usb_get_serial_port_data(port);
+	unsigned char *data = urb->transfer_buffer;
+	struct tty_struct *tty;
+	bool stopped = false;
+	bool start_timer = false;
+	int status = urb->status;
+	unsigned long flags;
+	int i;
+
+	/*
+	 * Inter-batch defer disabled for this port (urb_defer_timer_ns
+	 * was 0 at probe). Use the generic callback directly so this
+	 * port behaves bit-for-bit like upstream ftdi_sio without this
+	 * patch series applied.
+	 */
+	if (ktime_to_ns(priv->urb_defer_ktime) == 0) {
+		usb_serial_generic_read_bulk_callback(urb);
+		return;
+	}
+
+	for (i = 0; i < ARRAY_SIZE(port->read_urbs); ++i) {
+		if (urb == port->read_urbs[i])
+			break;
+	}
+
+	dev_dbg(&port->dev, "%s - urb %d, len %d\n", __func__, i,
+		urb->actual_length);
+	switch (status) {
+	case 0:
+		usb_serial_debug_data(&port->dev, __func__,
+				      urb->actual_length, data);
+		port->serial->type->process_read_urb(urb);
+		break;
+	case -ENOENT:
+	case -ECONNRESET:
+	case -ESHUTDOWN:
+		dev_dbg(&port->dev, "%s - urb stopped: %d\n",
+			__func__, status);
+		stopped = true;
+		break;
+	case -EPIPE:
+		dev_err(&port->dev, "%s - urb stopped: %d\n",
+			__func__, status);
+		stopped = true;
+		break;
+	default:
+		dev_dbg(&port->dev, "%s - nonzero urb status: %d\n",
+			__func__, status);
+		break;
+	}
+
+	/* Ensure URB processing is observed before we mark the URB free. */
+	smp_mb__before_atomic();
+	set_bit(i, &port->read_urbs_free);
+	/* Ensure the free bit is observed before we read THROTTLED below. */
+	smp_mb__after_atomic();
+
+	if (stopped)
+		return;
+
+	if (test_bit(USB_SERIAL_THROTTLED, &port->flags))
+		return;
+
+	spin_lock_irqsave(&priv->urb_defer_lock, flags);
+	tty = priv->urb_defer_tty;
+	if (tty) {
+		tty_kref_get(tty);
+		if (!priv->urb_defer_timer_active) {
+			priv->urb_defer_timer_active = true;
+			start_timer = true;
+		}
+	}
+	spin_unlock_irqrestore(&priv->urb_defer_lock, flags);
+
+	if (tty) {
+		usb_serial_generic_throttle(tty);
+		if (start_timer)
+			hrtimer_start(&priv->urb_defer_timer,
+				      priv->urb_defer_ktime,
+				      HRTIMER_MODE_REL);
+		tty_kref_put(tty);
+	} else {
+		/*
+		 * No tty is bound to this port (e.g. it was opened as a
+		 * console). The inter-batch defer needs a tty to throttle,
+		 * so resubmit the read URBs immediately rather than stalling
+		 * the read stream.  We are in completion (atomic) context, so
+		 * use the atomic-safe helper.
+		 */
+		ftdi_atomic_submit_read_urbs(port);
+	}
+}
+
 static int ftdi_break_ctl(struct tty_struct *tty, int break_state)
 {
 	struct usb_serial_port *port = tty->driver_data;
@@ -2850,10 +3116,12 @@ static struct usb_serial_driver ftdi_device = {
 	.port_probe =		ftdi_port_probe,
 	.port_remove =		ftdi_port_remove,
 	.open =			ftdi_open,
+	.close =		ftdi_close,
 	.dtr_rts =		ftdi_dtr_rts,
 	.throttle =		usb_serial_generic_throttle,
 	.unthrottle =		usb_serial_generic_unthrottle,
 	.process_read_urb =	ftdi_process_read_urb,
+	.read_bulk_callback =	ftdi_read_bulk_callback,
 	.prepare_write_buffer =	ftdi_prepare_write_buffer,
 	.tiocmget =		ftdi_tiocmget,
 	.tiocmset =		ftdi_tiocmset,
@@ -2872,6 +3140,10 @@ static struct usb_serial_driver * const serial_drivers[] = {
 };
 module_usb_serial_driver(serial_drivers, id_table_combined);
 
+module_param(urb_defer_timer_ns, ulong, 0644);
+MODULE_PARM_DESC(urb_defer_timer_ns,
+		 "Inter-batch defer between read-URB resubmissions, in nanoseconds. 0 (default) disables the defer. Max 100000000 = 100 ms.");
+
 MODULE_AUTHOR(DRIVER_AUTHOR);
 MODULE_DESCRIPTION(DRIVER_DESC);
 MODULE_LICENSE("GPL");
-- 
2.43.0


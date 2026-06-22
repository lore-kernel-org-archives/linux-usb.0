Received: from TYDPR03CU002.outbound.protection.outlook.com (mail-japaneastazon11023072.outbound.protection.outlook.com [52.101.127.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 997DE36DA08;
	Mon, 22 Jun 2026 07:39:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.127.72
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782113976; cv=fail; b=jhKP7aDYbrBhs9DihEbhEyFIcJsNrDMfLfWJxV8OZuBEZHBIWh5A5kaYosvSUpAq+zurdgObizFKhrnjL1OCwjsGtPMtbzHyNghO0wTKw2FLZiUh3RLBlC5Ae3NTgffnX3m6bWRcUzpoSxt7Uqu3IkNxGfsBAeJZeBNtf3WS8H0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782113976; c=relaxed/simple;
	bh=UW3mzmtrMHi0fj16IClOFySKwXOgjREc2/X/Zoawui8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ugmJmxSCkYeUEzwacH1T0kr3H+hgHVUcGzpYNB3NgnEUtpfGNJC5S/ATLLxuzmgDE809T2TphpnWX6RPBkgVUp1Lmdrkhh+4OXNNc0S6+K41C1ECZQjWHAW2djzcXPYJe+nNOGE+42D8pcjFVYwPH9xS1FTGVRSRslvrpaxQjGs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ftdichip.com; spf=pass smtp.mailfrom=ftdichip.com; dkim=pass (2048-bit key) header.d=ftdichip.com header.i=@ftdichip.com header.b=lX2c40jt; arc=fail smtp.client-ip=52.101.127.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ftdichip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ftdichip.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ftdichip.com header.i=@ftdichip.com header.b="lX2c40jt"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ova+jsP3c7+zl20iVHxmCgU/ZjD0++zPEqP6BdqxTTAghQxMu0vjA4uAoPQ4qcalSgzERqtDzSAuBfuoQsqIFalMafw1kMjRcQRLU0juSrXLCQcwSQwGKJn1skwCJg1LrgyOeKJfDyccfyqMVvpmDzbS/x7c5EgkrejFw+ZVkkMaVQ2hW+hJvY5i7q4T/cUTA5SHMM8oWd7mEm0cPX0CLcc1Ko5ozsw9G9K3XbsKuV6KFyzeRPuV9MhLSExaa9VWTCFiyckmyc9dkDa9/ATqJotyBGKMl8Vj3nYw7TZQ9nuVIexNDu922TwoKo8tnXdLaBYhJR7vhfKFPNP1sFm4gQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p1MkxHP+WXDCO6UaTyP26MiDR/x65gQow/B28E45g50=;
 b=oIg6EG1ZwZVCDAKIcUEVwW6IGApwAlK7yeqjk8Kq2AONcGNzGoBNJAwEi5X1y5CG1nbcDT5kydgqCKcvZ+217CxEYbj8UwtSI40mVIEQW72Iv9iyGdZcdDL7FSoszOFzJjrpKDVhEGmMaljThdqpgfV6Oc3MGZtIdSLbXgaOT3ks5ZPxqZcLbm6PZ4CBClnOIO7ltX1iWDWR3sYI9E0r6FAF4fXIq1h5KSeyr+aE+gsJ3/caCHZMXUnjrMH26N1KtfOcXAHiMRZp3z3BvgVZk8Z7zNyXPZlV8jJHWxQWoi4sESNlLgj7XswbfbgXZKuckuE1imOxldT2btnbJJ9yaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ftdichip.com; dmarc=pass action=none header.from=ftdichip.com;
 dkim=pass header.d=ftdichip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ftdichip.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p1MkxHP+WXDCO6UaTyP26MiDR/x65gQow/B28E45g50=;
 b=lX2c40jtVXgmWo9sPdispuf8LlRxk5mwrm7PaSPyWW2D52gPWS+jNnJ9ajukJiFijYqQBQcpsMSI1HLkZFJZCsXL7bEOfxhIcCMiJnhZCBy9vwJbGnMkh27GQg+Xxczv3QQvK43Ppa/QM1SMVtnbMvIb+QukilCeVuHKIiA2nwaYN5HVNWvd6VIopdU+DqoqqISzgsuSFopacGxKHr9UoSGnkw3DUUcEW2/rOne4ajHIGHPvXHUiR6cTLpOPwJVuRTg2u6683mKEZI3wsC6Pc8XshT/6CKwgflsXOCpnOHKytGt180dmjGK8j5RYyCDUBLipnaJR1bOqXq629cHLTA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=ftdichip.com;
Received: from SG2PPFE985372F0.apcprd01.prod.exchangelabs.com
 (2603:1096:f:fff6::45e) by TY0PR0101MB4383.apcprd01.prod.exchangelabs.com
 (2603:1096:400:1b6::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.11; Mon, 22 Jun
 2026 07:39:14 +0000
Received: from SG2PPFE985372F0.apcprd01.prod.exchangelabs.com
 ([fe80::e65f:ac00:2342:9108]) by
 SG2PPFE985372F0.apcprd01.prod.exchangelabs.com
 ([fe80::e65f:ac00:2342:9108%4]) with mapi id 15.21.0139.018; Mon, 22 Jun 2026
 07:39:14 +0000
From: Chinna Mopurigari Naveen Kumar Reddy <naveen.reddy@ftdichip.com>
To: Johan Hovold <johan@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Arun Pappan <arun.pappan@ftdichip.com>
Subject: [PATCH 6/6] USB: serial: ftdi_sio: pace low_latency ports with low_latency_defer_ns
Date: Mon, 22 Jun 2026 15:38:39 +0800
Message-ID: <5c94299f7b19a3f83cff71d86ecc612b309d3171.1781744946.git.naveen.reddy@ftdichip.com>
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
X-MS-Office365-Filtering-Correlation-Id: a7b34ec5-df73-4d2e-f195-08ded0315aec
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|52116014|366016|23010399003|18002099003|22082099003|38350700014|56012099006|3023799007;
X-Microsoft-Antispam-Message-Info:
	Vq6cxcXY/HbFQJa+UeTyrnImGC5UOO0vpR4LaUoNxYgq/IEK7oFAxV6btlkd7UMcTTwVUn9DYtBN7Wl7yMY5Yg3daPSTTqEv0V6WSzIU43S/t5tPUDdwHQVLdXP02J6tAB1dkIGDGQTsPgNrkPEdHy8Sw8wuucAO4ANdKNOsj5b/EZunrDn0v3md/RgrESz44L5RW7xiKvWGHKiNnSle5rmsha/zOUdOHMujBkAJhaaprQxm30fM7uNvD5zQuxzGqhLsXkwIIV7z8lrvVBjIUcs7ETq8o+lYV+cYw7JAhFEKt3VXMjhOKs0+pBt/zAdgt/z31TWszLmxdFX74BuSTy8fXqGlJO7i9J8Tj6Lu/uxQKcOLMNB/J3sg5WM0TEms0uATQYvQlzzvYjZTnm8w1RUOSy0Y39sdU1Q08j4KSxYlTBQ8hhfScE29J4VN0db/1pTkb4lv1xV1Lpd6hqYyHpHvT9rD2ZOIhcd5iUZivsmCHzK4PjBX1eQhLCunZrm8i+oVl+0pTF7BMbntElke2MBezGIFY9ahDxkdmRV4P46aJSB2kqmU/vo3xlKUFQ2305me9T7eBr9mhbJmV/eFu25N3gc8uOdCMdYZNPej/WndcpMvxginT37b+pzI9c6yO435UY7tsr2/uESKLrMsSnIGx0Ug4zpbVplUJe+bLrt6fDg7+x3WV4l/iAsv/ZEwX7Lbr8X7u6N+i56kGK114JiszAYBfkdBDKG2jxOpCik=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SG2PPFE985372F0.apcprd01.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(52116014)(366016)(23010399003)(18002099003)(22082099003)(38350700014)(56012099006)(3023799007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?XncwsnWNHQmMdkgT4dZRXAlgXFyA9LaMyanXiPTxsQnc+kn0ktkF214bM+ny?=
 =?us-ascii?Q?08S8wDjlEfuknQrrB5/XjAgAZACTrMRkdIsot7Zpo7ipsAUnkbyEj1jR+tFB?=
 =?us-ascii?Q?pven7GkH0gaAVyHq5dwje/+PTI9d06AmaZrG4EEpsACMiAgmpNKZti+wBHCq?=
 =?us-ascii?Q?v2EueaO63Sb9y1FASl/tql1p4GuYhvIxPdObn1h1P+Wml0d3sCS8vbbv+Q1h?=
 =?us-ascii?Q?Vt/XjkZl9mrsBE+YWElU3nXUYSjKvKQNeLR0DMIG4K/H7wg18+FORjaQoL6S?=
 =?us-ascii?Q?EaMwd0gsRzJeJCKvg5CtnGaZNOODxpfjqTzuKFV9MghcmEZpNmYWLU8dJxZC?=
 =?us-ascii?Q?6v9YjdhGmlDRt924PAnY+QZcbW3vFPLpyc9Q8uFYjC92p4lmh5PIru/KbtV3?=
 =?us-ascii?Q?3x8HCqhiNHzvCwMf0qGUxaBShKKoZYHyqT0YIsnSawVcqwljVMjWPubFxhdM?=
 =?us-ascii?Q?yH6sMVNiySIRFOI3OzbkQihL1V2KVNmwz5yI45WLgEhBSkp3V3s7lAdSdwB9?=
 =?us-ascii?Q?N4EjkF59+E0YTfjrFDi6W1Mq+d7JBubTiip/uAoTDt6YytagnxyWenSosn7U?=
 =?us-ascii?Q?9pRVQ3/G16LsP2gb9apuuK9ms7jq2PC5up4W2e1fvy97m2T9NgwRc88OKOKh?=
 =?us-ascii?Q?MWuEG5rOMWnfmcy7Cb0SRsguO89nS8uT4+0Y/KjUk/Gp6m+FuEZcP3KyOG5Q?=
 =?us-ascii?Q?0rwNaa49nLlNAF9Rj2WX7uTRoBLp/2Y3C6JnJxJ1sPzkNrTmAdQbuGAiNwYX?=
 =?us-ascii?Q?CZLTnqrc8wgJqmgqKyfRmwsqSv5oyv5Eqevu8Lvb+lMaLTafWhsQpCL12ZlE?=
 =?us-ascii?Q?IyFUl0fnIK2/adfSJUhgdHc+S8s4cuv3m3xASmVqtB84KFh9e2VRGeijTUD+?=
 =?us-ascii?Q?mhXWBOhiqOX9fxnSV+9f8Iv2Au5QjQrQkTwK+oIPqbKpwlhG7EF+dHToC9ak?=
 =?us-ascii?Q?G1Dl6nIOVnmaUs7uAY0bgaLdzofroPToEmTq24bH1gz1eOsdTdV1KJBOPN7w?=
 =?us-ascii?Q?jQOPED8EAt3W3KqI3bAV4LR/qb5H4NRccBiugC6ZjE2q36F4V5jis6dv1SIR?=
 =?us-ascii?Q?BcA8MG/jo3u6SxvdnKvz/C8DgYMIxuHzt3IX6fd+eBX6JAOaB2VirWJIBW6u?=
 =?us-ascii?Q?u4NlrMMiMrFIUGHUr9IeILu+TxdfwGBjU1bC64s9D0deW3FUCwmy8YxJCjXD?=
 =?us-ascii?Q?pf/B3XB7GTZDqXGnxd5Bg9jcygFBL8isbCKqLpr+xCmz1ggL0Qb8GR1SS+5a?=
 =?us-ascii?Q?a2FmVEDgcMwoUMHZc1gYiK9LJmU5geWQAA8zha5FhH8sGUtbfugS8gCYrlAC?=
 =?us-ascii?Q?xgdEi09lWm0iv1dJj+RSnYsr4xvAlzvTw6mddQsg3/DTbzxuUJVZiqnSRrKp?=
 =?us-ascii?Q?HPcTLzupatG5vKS18e5vTO4JDIzKZpAahnL7F+oDNIBTxA/x6H/tE2gXT+f4?=
 =?us-ascii?Q?XYJrcSr4Jfl2EBpTnSIQt0Y7MFbpu8Z4hPjOYfEODYanCsKILjnQztk4bJuZ?=
 =?us-ascii?Q?i4IHoqU6WIFrUyFf91BGGyb4XUPoCS3ReyS0P9lXL8G92vrS36sZLdGNnqGP?=
 =?us-ascii?Q?nn8i0Tbt2wh7Tk/SehjJWTTKjXYg6cjk2xFLCSrVu2X3G39Lqbfy2qE4BCEh?=
 =?us-ascii?Q?PEx9C9cvOTPPdL79L8w0Dkh3r4KP86N8kF6GxkJ71qnVETC53mM1hmS18q0J?=
 =?us-ascii?Q?mnIYDHKQ7uPHLJcG/4U0NoQg/XSp5Qn1I+4QvpwW/whgOyPQ1uSy0rbv9NW7?=
 =?us-ascii?Q?2owdtXyj+RsSQnZZDacQT8m8SgR/qBs=3D?=
X-OriginatorOrg: ftdichip.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a7b34ec5-df73-4d2e-f195-08ded0315aec
X-MS-Exchange-CrossTenant-AuthSource: SG2PPFE985372F0.apcprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jun 2026 07:39:13.2027
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: c2456335-1328-47c5-82f2-1fe6783d7182
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vZrp2GT+uPOzdMmw7aF+TEellOms/6TdbFswM10gMIDa3zwvzZQk67vAoyhHj4KSrj6xAEKX/QEYhTj2IWS/j+FGflvztkKJHsTkZgAFIbQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY0PR0101MB4383

The low_latency attribute makes a port bypass the inter-batch read
defer entirely: read URBs are resubmitted immediately, giving the
lowest read latency but keeping a host-controller DMA channel occupied
almost continuously.  On controllers that do not enforce DMA-channel
fairness (such as the BCM2835 DWC_OTG on the Raspberry Pi Compute
Module 3) only about two such ports can run at high baud before
control transfers and other devices on the same bus -- a USB-attached
Ethernet adapter, for instance -- are starved again.

Add a module parameter, low_latency_defer_ns, that applies a small
inter-batch defer to low_latency ports instead of bypassing the defer
entirely.  Default 0 preserves the existing full-bypass behaviour.  A
small non-zero value (e.g. 2000000 = 2 ms) paces each low_latency port
with that interval, roughly halving how long it occupies a DMA
channel, so more low_latency ports can coexist without starving
control transfers, at the cost of a bounded read latency (~the value,
well under the urb_defer_timer_ns default).

The value is read on each completion, so runtime changes via
/sys/module/ftdi_sio/parameters/low_latency_defer_ns take effect
immediately on every low_latency port; it is clamped to
FTDI_URB_DEFER_MAX_NS.  As a rough guide, on the CM3/DWC_OTG with
eight 916 kbps channels about 1 ms per low_latency port beyond two
keeps control-transfer latency and unrelated USB throughput bounded;
the optimum is workload-dependent and best confirmed by measurement.

Signed-off-by: Chinna Mopurigari Naveen Kumar Reddy <naveen.reddy@ftdichip.com>
---
 drivers/usb/serial/ftdi_sio.c | 50 ++++++++++++++++++++++++++++++-----
 1 file changed, 43 insertions(+), 7 deletions(-)

diff --git a/drivers/usb/serial/ftdi_sio.c b/drivers/usb/serial/ftdi_sio.c
index c631c6d0a1a5..7d7644ecab06 100644
--- a/drivers/usb/serial/ftdi_sio.c
+++ b/drivers/usb/serial/ftdi_sio.c
@@ -2342,6 +2342,26 @@ static void ftdi_gpio_remove(struct usb_serial_port *port) { }
  */
 static unsigned long urb_defer_timer_ns;
 
+/*
+ * Optional small inter-batch defer applied to low_latency ports, in
+ * nanoseconds.
+ *
+ * Default 0 keeps low_latency ports fully bypassed (immediate read-URB
+ * resubmit, lowest latency), which pins a host-controller DMA channel
+ * almost continuously.  On a controller that does not enforce
+ * DMA-channel fairness only about two such ports can run at high baud
+ * before control transfers and other devices on the bus are starved.
+ *
+ * A small non-zero value (e.g. 2000000 = 2 ms) instead paces each
+ * low_latency port with that interval, roughly halving its
+ * DMA-channel occupancy so more low_latency ports can coexist, at the
+ * cost of a bounded read latency (~the value, still well under the
+ * urb_defer_timer_ns default).  Read live, so runtime changes apply
+ * immediately to every low_latency port; clamped to
+ * FTDI_URB_DEFER_MAX_NS.
+ */
+static unsigned long low_latency_defer_ns;
+
 /*
  * hrtimer callback that fires after the configured defer interval and
  * un-throttles the port so the generic submit-read-urbs path can run
@@ -2854,11 +2874,13 @@ static void ftdi_read_bulk_callback(struct urb *urb)
 
 	/*
 	 * Latency-critical ports opt out of the inter-batch defer via
-	 * /sys/.../low_latency. Delegate straight to the generic
-	 * callback so the data stream sees no added latency on this
-	 * port even when the defer is globally enabled.
+	 * /sys/.../low_latency.  With low_latency_defer_ns == 0 (default),
+	 * delegate straight to the generic callback so the data stream
+	 * sees no added latency on this port.  A non-zero
+	 * low_latency_defer_ns instead paces this port with that (small)
+	 * interval to bound its DMA-channel occupancy.
 	 */
-	if (priv->low_latency) {
+	if (priv->low_latency && !low_latency_defer_ns) {
 		usb_serial_generic_read_bulk_callback(urb);
 		return;
 	}
@@ -2915,7 +2937,7 @@ static void ftdi_read_bulk_callback(struct urb *urb)
 	 * so the data stream does not stall in the narrow window
 	 * before the store's unthrottle runs.
 	 */
-	if (priv->low_latency) {
+	if (priv->low_latency && !low_latency_defer_ns) {
 		spin_unlock_irqrestore(&priv->urb_defer_lock, flags);
 		ftdi_atomic_submit_read_urbs(port);
 		return;
@@ -2931,10 +2953,21 @@ static void ftdi_read_bulk_callback(struct urb *urb)
 	spin_unlock_irqrestore(&priv->urb_defer_lock, flags);
 
 	if (tty) {
+		ktime_t defer_kt = priv->urb_defer_ktime;
+
+		/*
+		 * A low_latency port that is being paced (low_latency_defer_ns
+		 * != 0) uses that small per-port interval instead of the
+		 * global inter-batch defer.
+		 */
+		if (priv->low_latency)
+			defer_kt = ns_to_ktime(min_t(unsigned long,
+						     low_latency_defer_ns,
+						     FTDI_URB_DEFER_MAX_NS));
+
 		usb_serial_generic_throttle(tty);
 		if (start_timer)
-			hrtimer_start(&priv->urb_defer_timer,
-				      priv->urb_defer_ktime,
+			hrtimer_start(&priv->urb_defer_timer, defer_kt,
 				      HRTIMER_MODE_REL);
 		tty_kref_put(tty);
 	} else {
@@ -3307,6 +3340,9 @@ module_usb_serial_driver(serial_drivers, id_table_combined);
 module_param(urb_defer_timer_ns, ulong, 0644);
 MODULE_PARM_DESC(urb_defer_timer_ns,
 		 "Inter-batch defer between read-URB resubmissions, in nanoseconds. 0 (default) disables the defer. Max 100000000 = 100 ms.");
+module_param(low_latency_defer_ns, ulong, 0644);
+MODULE_PARM_DESC(low_latency_defer_ns,
+		 "Inter-batch defer applied to low_latency ports, in nanoseconds. 0 (default) bypasses the defer entirely on low_latency ports; a small value (e.g. 2000000 = 2 ms) paces them so more can run without starving control transfers. Max 100000000 = 100 ms.");
 
 MODULE_AUTHOR(DRIVER_AUTHOR);
 MODULE_DESCRIPTION(DRIVER_DESC);
-- 
2.43.0


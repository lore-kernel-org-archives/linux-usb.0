Received: from TYDPR03CU002.outbound.protection.outlook.com (mail-japaneastazon11023072.outbound.protection.outlook.com [52.101.127.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6212436DA0B;
	Mon, 22 Jun 2026 07:39:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.127.72
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782113965; cv=fail; b=uUeQ/ZCig3PX2G/rW3Yobs14+Vqhbh+gHFZ/8laxpstNAOBVHYvZnwSmfdNsZWbcysd99coTMvukuhQKoMb56oDgkarVIQqsBH7pTOmiVYpiMhCHlUWxYIlAhHhs/WSk8fh79aBt9/F9cmsnsItx5pCbfS1bfC0MtKokbJY99lw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782113965; c=relaxed/simple;
	bh=DpnKq9bdl+jivwByTq7nK84b6kG3R4/HAqAI2txzlzY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=hJ4PvMMktRxMZf7GW/f2nDFccUtPHfJKCeLiqOxhTHigLi7ixKnn3zndaRgONWNPbyIMTod3Botl24xVj8ycSxpCu2mzzvKr3jC+MnO5/EvSKAYs8K2prXnOtPiW9UPqJzUCTcII0TZB5IXemLzvagezSOONzanNMJVQYAgUJ+o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ftdichip.com; spf=pass smtp.mailfrom=ftdichip.com; dkim=pass (2048-bit key) header.d=ftdichip.com header.i=@ftdichip.com header.b=nfs8jYl0; arc=fail smtp.client-ip=52.101.127.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ftdichip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ftdichip.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ftdichip.com header.i=@ftdichip.com header.b="nfs8jYl0"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=O1infHjw0fDyMArROkMTlRSK55mXZ+2e3mB2AIcEMmAa2h56GIpg29erfi0FqF80DXZYFkohAfDiN7vyVkvu2G2eRegcqNlQRuNcJE6vwCsYu04SmaCqreR6e2xNxj2hHPXjW4OBFJyZ7dDR3e08S9unnAn2czVFLAKBn67h1Y6N33MrvsukyWuA34R3kP2Ppz/2QTwRzdzh6kVOubaumgT0g9dtnZuWn94YRXwYAir3KfhVl+O3bEhG1b0Z2/FYaFWdXtJluzR3jqF7KOqUJUhOalU5fggR2Af+5pIHurigVIhfKf9wrW1oL3wbkkmrrIeru6IHFPyyoyTNoUg6sA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zgbl4khM/HW1IwyyZQNg4QN4OZ8CXf5ZmqoGX9AYRi8=;
 b=m22XKSOspyYXv4HXuhTQ+LW9X2zt3c78/1QNu9k5ElSmHYfIq6z6R1/bQ8M4z9yTRPMbzK3t8BoPpgFycz7DzBkhDZaVKEoplFTUJBSSl+6CI8TrLuzVPsbreHpX8wFKKKKgvOv4FkQBu1kSGO7VJ+hY8wfx3H3b4z9jxOpKpDdbjuAGnLiyCPpXY0nxoYLD3WxJMZeNIc4ktg6Ovoi1Cqd3qGr6PaW48i2P3tP4r5qVbqw+eBGUkLOhO0Fb22B9Y7h16s4DqtAkfxoauaxcPrm8oJk+Uey9ll0aT/3XS/90Ku7b4PzxPDw7CRXWJgg4Kx26Yutd4kMB7f52S+BsNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ftdichip.com; dmarc=pass action=none header.from=ftdichip.com;
 dkim=pass header.d=ftdichip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ftdichip.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zgbl4khM/HW1IwyyZQNg4QN4OZ8CXf5ZmqoGX9AYRi8=;
 b=nfs8jYl0m76Qi+R5doCnXGWWV4fa0zyeggUPIKCXiOAzmHYByX5oRAupzhtnPSaQ7wqU8Ld1YzSxgQAKWwhKwxN3+MGatJdaRBWb1sW7p5NV2rlp4EY2JXPhbuMzoIaUmzWQqZooOPjgde7DCiNn7JDNq+e+BQlgdKgjZant82tyWkKrTKvQSWUazibnX8C5Tf5GZkK5y1V+tsf4MKABHAH6qdmBXL7Me5iqgnPXVy4FwQeKHgbaovgGb0jQwpsmJ//2TDxOvMxjWFB/9nqEaGz9cTC+yadS3krlsaSR+d8yfXv562cBVGOkNiXXBkR33FO1n68WkAusEat/Diwu2A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=ftdichip.com;
Received: from SG2PPFE985372F0.apcprd01.prod.exchangelabs.com
 (2603:1096:f:fff6::45e) by TY0PR0101MB4383.apcprd01.prod.exchangelabs.com
 (2603:1096:400:1b6::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.11; Mon, 22 Jun
 2026 07:39:11 +0000
Received: from SG2PPFE985372F0.apcprd01.prod.exchangelabs.com
 ([fe80::e65f:ac00:2342:9108]) by
 SG2PPFE985372F0.apcprd01.prod.exchangelabs.com
 ([fe80::e65f:ac00:2342:9108%4]) with mapi id 15.21.0139.018; Mon, 22 Jun 2026
 07:39:11 +0000
From: Chinna Mopurigari Naveen Kumar Reddy <naveen.reddy@ftdichip.com>
To: Johan Hovold <johan@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Arun Pappan <arun.pappan@ftdichip.com>
Subject: [PATCH 4/6] USB: serial: ftdi_sio: add per-port low_latency sysfs attribute
Date: Mon, 22 Jun 2026 15:38:37 +0800
Message-ID: <3c60c6d2b9812d19ee9b1b9b573add084fa68dea.1781744946.git.naveen.reddy@ftdichip.com>
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
X-MS-Office365-Filtering-Correlation-Id: 5d15ef28-050b-4c98-c8c1-08ded03159aa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|52116014|366016|23010399003|3122999024|18002099003|22082099003|38350700014|56012099006;
X-Microsoft-Antispam-Message-Info:
	6TBpHV6cszRDT4GbtHLnCAkkowUnc6o+K7H9a26dSyE1UP53MliJh4gvym3dHt0Oglshy49sbvfYAa/kTWceCx7fk5WAUllQSp+2xUC+nHl7kUaiaDKafrMCNLd39U/77StC08F1NSMYlecPFm7KPI37k3+o1568fJNEBSvo3Phn3ARqs4kXXT78Cw1cQFGfe3Vf/LmLqaGUdWo7kPe2cLnMUmOqtddPNoE5uAXpCLRtQwbJ8Cmpo+2qpxc2iOh83Jyy6dSIzJYpqn9DnJ/60IOR9IyR7qh3q27Q0lWIsXx6fJ2+mX3jnzj3zAVTejY9sQPb6gYcBDOXx8A5Hy4fOyQpaoNPcnYxwnEViyBV9XhDUjn+sLJki26N4E8mqsl0/wUyCEOd9pjIZEcVRod2Mc8dlitDI+RsSNq7IS/YPDu9Az3hLW4PSVcLKUinQ+zRBpsacZtokMDaAkZq1OLFPwmBTHNcWHAjkFnQcUaqhV8TF8cbfgNsxP5VFG8XcyDsKI5ojbd7CD83uC46DbLJTa1IK3tmS4ObxP8XoBN4RLhYYPaftE64jfLXi/vw8kGTZb38/ToeYwuJzfrCzGBWZvIOGfLulyGJQXFumnw7Y1Zz1h1HTZLGTtoRZW09e3oxVTUzOUWIMcx6M8v9Y+EGi4P9kk3SpbphORNT3htQtdVFfHHvV4vvDKmEPwtgFPwl/pQ8zKWwa1ChiBXjIUcyDg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SG2PPFE985372F0.apcprd01.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(52116014)(366016)(23010399003)(3122999024)(18002099003)(22082099003)(38350700014)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?S/Jz9CY04HxFcpTanGBFB+hohXvWpWAXWuTCd25HOjehVmmAHldTxbonNesM?=
 =?us-ascii?Q?UsqNIqkypPKAEtqE1opcAWRYawVF6YlYFtVOYfdZhWuprkkPKx1HucLmiPOw?=
 =?us-ascii?Q?Kktnn6hX4RVYoT74vcDLvU1yuUcXoJVSHpvaPkGY1Dkbcvaa8Zdh7eq51+D5?=
 =?us-ascii?Q?MtovlfsC1gjIN4az6OBxP0GeVRIYyWVrb0Yjfz4X2+qACEKSAtz/qJ8ymFp4?=
 =?us-ascii?Q?GIma6fVkcn4XYpOMBbE9zOlCOvzT+rEjksbmAFu33AvWV+oqIvA1K2CIGknJ?=
 =?us-ascii?Q?HNJUQ5XNJ9wnBqWzd8Y9qY4imxwZHHxr3xb2pyJXowy9ZPYUkX1Yhh1eQLtE?=
 =?us-ascii?Q?F3hrA17wxaprh6Uj0uB3Wh+VQ0Sd+aOYXvPad9RQQaAQ9b7RFR7Nh/en8TDF?=
 =?us-ascii?Q?kGGvH0YDXJRKohOBcFjAtdDqY3nUsjPlvzkVSSmCdmaNoO6vZbC7MVuSo6d+?=
 =?us-ascii?Q?+JB1Q1JTYx44WVUe67GrB/6zFLUYa5YUt08Oe7E3ETGwuCGqNPAi6KYp5DzW?=
 =?us-ascii?Q?MwPM1MJpDgZjthjh/ON5c23GGuwfoK3UfGD4CKoXPQkxKOLhuwAYBIQj4u9I?=
 =?us-ascii?Q?1+PUZJ9jyGhLEn4EkfPgA+x9z+JRgY54+8tu8lpCsB42jfmA4Neov8KL6PV8?=
 =?us-ascii?Q?MbvKqpjgyQngR97z7UxWZkCjv1it9cpLcxjMYOkbLNdKIThXTF+SDkj30HXE?=
 =?us-ascii?Q?UdOzVIel9C1TxqLI1LurChmnKEo9FkVI0PBHDNo5zdrXeoIWfJ+YaejQpHR2?=
 =?us-ascii?Q?O0PwhMJZMf+kYMeGwHvkNpMwIgZrIjjmtOYV1N5wa1aHpgNa0vUG0OcAaUIa?=
 =?us-ascii?Q?3o/G3C1+kPDhFp6JJP6rVzcsuo98cVfk+H3SwKvCQNXep6SI14wIrQF5zJk4?=
 =?us-ascii?Q?NdnS/n8xXvHAU49wI95YoeeF7y2kO4rsapeNuJVAnVKmj7IUWcOmmO5o+WZj?=
 =?us-ascii?Q?DrfhUw5ppjydcZ4EYzCh/9ZRTGAfIsYJfOvqzQi4BcBXmAOZhrZqNCJt/gxi?=
 =?us-ascii?Q?RW3EMWAH+1icX7AYMuJPBkqTBdd5UTEh4SzOY261MfnbUKPmjtQmizaJo93A?=
 =?us-ascii?Q?/NeJn/ZJ7Wh/FycUfYYbPqGeXyPhrQ0nMWpCq3XOxM4KdysvLFsQMdsySszz?=
 =?us-ascii?Q?s0362Uj+QV9EEjbaaOqAWpJiD8Yx/Voc/F2+lUeGColm/Ok0161HH5YNzbjq?=
 =?us-ascii?Q?CasHsBtjBt9zM1YWYJO8xptpmqoBwF6NtEpjtWyjCq/SdKJpbgVjmSTg3XH6?=
 =?us-ascii?Q?orAaBzqsav3bwR5camPhenT4GMohOhhmEEeuy974krY4I0S1XPaM2BC5cXjj?=
 =?us-ascii?Q?UzNCA6IxHEFJ617BCCWqOQLy/zsS27eOIrw9VrMfz3LF2cXXQopJOjwU6wKe?=
 =?us-ascii?Q?ZP8YMUX/+QPORUDrxjli9o1xvGS7vSQiITjz3ioLRPoQoLmQmSBg40NJwg7i?=
 =?us-ascii?Q?eN35R7i6K7ftAl1f0SO/l9NmuMemZqPXBY19XXPtDlHbYR/NQW29VUi822x1?=
 =?us-ascii?Q?INuE8KKKgvxKge+b4jHvHWq+65e1BqGtUJB2a2uz7nLhrmeqvaV9eDsEY3b5?=
 =?us-ascii?Q?ZzLyuh9JkXV2hNVPst7WQ98P0tpUOvtnCIj4M1ruTedOkBGG3/FTfbpQFXc3?=
 =?us-ascii?Q?uqvzBrAtgsxsWCh+viltVffAJiy1CGbX+/rUqpsL6lLY7QWiWmFLfV7//pOB?=
 =?us-ascii?Q?A5XqPb4MmT+FzWwMrI5UwcTccX28Rsu+v2A82WxosCrAa35fR7JU5x6hLGVb?=
 =?us-ascii?Q?l47izFNt2BdAI8nWroLSZDyfF3L4aZM=3D?=
X-OriginatorOrg: ftdichip.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d15ef28-050b-4c98-c8c1-08ded03159aa
X-MS-Exchange-CrossTenant-AuthSource: SG2PPFE985372F0.apcprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jun 2026 07:39:11.1733
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: c2456335-1328-47c5-82f2-1fe6783d7182
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Vtyi2LUKQe+jA0yljdvhwMMGNACml5N+cLtKlDvL3+feiwM/WPuxKCljNW4/gnwlVHAwc3V922DsCQuxCFLQV6FyJMHUfPkyz4lKHIdziDI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY0PR0101MB4383

When the inter-batch read-URB defer added by the previous patch is
enabled globally (urb_defer_timer_ns != 0), every port served by
this driver pays a small read-side latency.  In multi-channel
products it is common for one or more channels to be
latency-critical while others tolerate the defer; today there is
no way to express that on a per-port basis.

Add a new writable boolean sysfs attribute, low_latency, on every
ftdi_sio port:

  /sys/bus/usb-serial/devices/ttyUSBx/low_latency
    0 (default): inter-batch defer applies to this port when the
                 defer is globally enabled.
    1          : defer is bypassed on this port; the generic
                 read-bulk callback handles URB completions
                 directly with no throttle / hrtimer interaction.

The implementation adds a bool low_latency field to struct
ftdi_private (zero-initialised by kzalloc), settable via the new
attribute.  ftdi_read_bulk_callback() short-circuits to
usb_serial_generic_read_bulk_callback() at the top of the function
when the flag is set, skipping the throttle/hrtimer path entirely.

Writing 1 also cancels any in-flight defer hrtimer and clears the
timer_active bookkeeping so the next URB completion takes the
direct path immediately.

A udev rule typically sets the flag at device-add for the
latency-critical port; other ports are unaffected.

Signed-off-by: Chinna Mopurigari Naveen Kumar Reddy <naveen.reddy@ftdichip.com>
---
 drivers/usb/serial/ftdi_sio.c | 66 +++++++++++++++++++++++++++++++++++
 1 file changed, 66 insertions(+)

diff --git a/drivers/usb/serial/ftdi_sio.c b/drivers/usb/serial/ftdi_sio.c
index c0cda19f074a..8faa073f1383 100644
--- a/drivers/usb/serial/ftdi_sio.c
+++ b/drivers/usb/serial/ftdi_sio.c
@@ -110,6 +110,15 @@ struct ftdi_private {
 	struct hrtimer		urb_defer_timer;
 	struct tty_struct	*urb_defer_tty;
 	bool			urb_defer_timer_active;
+	/*
+	 * Per-port opt-out of the inter-batch defer.  When true, set via
+	 * /sys/bus/usb-serial/devices/ttyUSBx/low_latency, the read-bulk
+	 * callback short-circuits to the generic upstream callback and
+	 * skips the hrtimer-based throttle.  Defaults to false: the
+	 * defer applies to every port unless this port is explicitly
+	 * opted out (and the defer is globally enabled to begin with).
+	 */
+	bool			low_latency;
 #ifdef CONFIG_GPIOLIB
 	struct gpio_chip gc;
 	struct mutex gpio_lock;	/* protects GPIO state */
@@ -1728,6 +1737,51 @@ static ssize_t latency_timer_store(struct device *dev,
 }
 static DEVICE_ATTR_RW(latency_timer);
 
+/*
+ * /sys/bus/usb-serial/devices/ttyUSBx/low_latency
+ *   0 (default): inter-batch defer applies to this port (only
+ *                meaningful when the defer is globally enabled
+ *                via urb_defer_timer_ns).
+ *   1          : defer bypassed on this port; the upstream
+ *                read-bulk callback handles URB completions with
+ *                no throttle / hrtimer interaction.
+ * Typically written by a udev rule on the latency-critical port at
+ * device-add. Writing 1 also cancels any in-flight defer timer so
+ * the next URB submits immediately.
+ */
+static ssize_t low_latency_show(struct device *dev,
+				struct device_attribute *attr, char *buf)
+{
+	struct usb_serial_port *port = to_usb_serial_port(dev);
+	struct ftdi_private *priv = usb_get_serial_port_data(port);
+
+	return sprintf(buf, "%u\n", priv->low_latency ? 1 : 0);
+}
+
+static ssize_t low_latency_store(struct device *dev,
+				 struct device_attribute *attr,
+				 const char *valbuf, size_t count)
+{
+	struct usb_serial_port *port = to_usb_serial_port(dev);
+	struct ftdi_private *priv = usb_get_serial_port_data(port);
+	unsigned long flags;
+	u8 v;
+
+	if (kstrtou8(valbuf, 10, &v))
+		return -EINVAL;
+
+	priv->low_latency = !!v;
+
+	if (priv->low_latency) {
+		hrtimer_cancel(&priv->urb_defer_timer);
+		spin_lock_irqsave(&priv->urb_defer_lock, flags);
+		priv->urb_defer_timer_active = false;
+		spin_unlock_irqrestore(&priv->urb_defer_lock, flags);
+	}
+	return count;
+}
+static DEVICE_ATTR_RW(low_latency);
+
 /* Write an event character directly to the FTDI register.  The ASCII
    value is in the low 8 bits, with the enable bit in the 9th bit. */
 static ssize_t event_char_store(struct device *dev,
@@ -1762,6 +1816,7 @@ static DEVICE_ATTR_WO(event_char);
 static struct attribute *ftdi_attrs[] = {
 	&dev_attr_event_char.attr,
 	&dev_attr_latency_timer.attr,
+	&dev_attr_low_latency.attr,
 	NULL
 };
 
@@ -2763,6 +2818,17 @@ static void ftdi_read_bulk_callback(struct urb *urb)
 		return;
 	}
 
+	/*
+	 * Latency-critical ports opt out of the inter-batch defer via
+	 * /sys/.../low_latency. Delegate straight to the generic
+	 * callback so the data stream sees no added latency on this
+	 * port even when the defer is globally enabled.
+	 */
+	if (priv->low_latency) {
+		usb_serial_generic_read_bulk_callback(urb);
+		return;
+	}
+
 	for (i = 0; i < ARRAY_SIZE(port->read_urbs); ++i) {
 		if (urb == port->read_urbs[i])
 			break;
-- 
2.43.0


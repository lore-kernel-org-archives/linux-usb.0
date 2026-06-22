Received: from TYDPR03CU002.outbound.protection.outlook.com (mail-japaneastazon11023072.outbound.protection.outlook.com [52.101.127.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1731436E488;
	Mon, 22 Jun 2026 07:39:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.127.72
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782113974; cv=fail; b=XddAhWDMnyaeeZAGhyYF8yUv/QF2HGEcPCxGTUdcSElFCV1fTBQzkp8ammPFOH8BkEUoDJBs/N4DLSnfL1vTWFzNPdHIztVrrhSL4V3y8K3vbt9I7df+QJb9DvdSty7pqPANVqIhKj1tUW+Uz7s2wtHjfdcZ6qDTbyiC71paaA8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782113974; c=relaxed/simple;
	bh=tl/fDqKGiooRpWKsbUsBYN5/p+/q03gojNPhYTBIKYo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ZKR+bGM4tTDBX0w8zjAP2uc8mFB9GV6Kbc/NgBMXw66EMKeaFiU0sxfdxaC9PwD4r5hZc2Ag2sYJ3JlyO04Vk+Pj2JZ5JG8/Rf0JIYIFAomjItnJRPRKAbegcYMULlkTqzLGAGNlLhWjqYDQpnuO0CxRl5a0ZKvtadWxp9bjTZE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ftdichip.com; spf=pass smtp.mailfrom=ftdichip.com; dkim=pass (2048-bit key) header.d=ftdichip.com header.i=@ftdichip.com header.b=Ugi1tWlx; arc=fail smtp.client-ip=52.101.127.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ftdichip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ftdichip.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ftdichip.com header.i=@ftdichip.com header.b="Ugi1tWlx"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=a1iiqYLVRq2aPHF8WrVOutx+pOO1QC+wXNGfu9e/zPGhNtaxhvn2mwp9866DEyRIOl9C4r9ECZEjkO/iiNXwu0HhYAgOT8YIC5uH4dHIkObACcY1l64kWMs064eyy2cNijGr7m25E+vzDSxH+Zkz70LEwT9SAUgae+/lO2OK94FRL8b0fv9LP+V1xrgIXG4ZFLIhfMaxQWBk1fCN4CPOAbQE9SfDpOjBKHHnUiBjYm9/JbgGwsCkf0gj2xOB/tONJlHnBgVWSzSFfWRghFQYB4QdVjK0/O01IIUPjRahy6A19l1udwP0B+O3EWFAhgvFsdjtbzyZjoOQuzMO9jMF2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aQ2ynoQDgwOoNUYKNUZFQJ++F7K9XC7kUBhlBqxBJ0I=;
 b=YEUu1q2tEnyYm2jngRbcHqMs+yr94ZE8pow/pfG8Wz9wZf/kXKypYrqqcI0pZViCZq8qFehiQUS/7rzdn3r92mtKLEpeH9I61K4sTdKJXkihCIW2/ka0rsNX5ji3fPeKqRmnyyFEJZoWJUsZLh6JfbO/ncDJZXKYnyf9ELl3qPbRPdOAYqqqKhQtTMXgOsdBKV6uBU92f2c018K1i4oQMqj/DM54kWzYJo7KsLzmHUge53HhRQu+s8HRZrLmDNfla89kecW/3DoUBVTeXwWPbliyk/qWOA6FAxLsbPP7df9kfS3nmGmoTD2UnU4oWFSl01dRgICms7HYw/AweRj1bg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ftdichip.com; dmarc=pass action=none header.from=ftdichip.com;
 dkim=pass header.d=ftdichip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ftdichip.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aQ2ynoQDgwOoNUYKNUZFQJ++F7K9XC7kUBhlBqxBJ0I=;
 b=Ugi1tWlx9jBoRLT75b49XQFhhBmdU8Y73pNYx1QCOVJyrqIGTQlEbDTyvYtsEEZGuZ+wU48FCs4WiDrivbF9vZ09ZiR3t1Rk8S1UC5XfELatH/PsVWGXYwD7Ud9VQiLj/iZKc2XYTgw6KbO1wPrPnPBSjTIW2fLRKJuY0PvWbKnsCOp0J0ur1bkgZlCtv1/6bo02+NGYGzvClvNwX9retNEFufnxsuBuN3nQU2SVC/4TqLAx2Vrj4/XAaVay/QuV0rQUWPWeEH3ydioIX2+kD0gqQd7MMNdKGcI44vvV6+imHw2ThJXzDuK82OmkUCYfo8GJ39MfoKRp9SqcE9xfFw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=ftdichip.com;
Received: from SG2PPFE985372F0.apcprd01.prod.exchangelabs.com
 (2603:1096:f:fff6::45e) by TY0PR0101MB4383.apcprd01.prod.exchangelabs.com
 (2603:1096:400:1b6::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.11; Mon, 22 Jun
 2026 07:39:12 +0000
Received: from SG2PPFE985372F0.apcprd01.prod.exchangelabs.com
 ([fe80::e65f:ac00:2342:9108]) by
 SG2PPFE985372F0.apcprd01.prod.exchangelabs.com
 ([fe80::e65f:ac00:2342:9108%4]) with mapi id 15.21.0139.018; Mon, 22 Jun 2026
 07:39:12 +0000
From: Chinna Mopurigari Naveen Kumar Reddy <naveen.reddy@ftdichip.com>
To: Johan Hovold <johan@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Arun Pappan <arun.pappan@ftdichip.com>
Subject: [PATCH 5/6] USB: serial: ftdi_sio: serialise low_latency toggle against read_bulk_callback
Date: Mon, 22 Jun 2026 15:38:38 +0800
Message-ID: <b5fff3074c5c6c57af5facb560190ed929b7ca69.1781744946.git.naveen.reddy@ftdichip.com>
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
X-MS-Office365-Filtering-Correlation-Id: ab2716bf-0ced-46d2-dc23-08ded0315a4f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|52116014|366016|23010399003|18002099003|22082099003|38350700014|56012099006|5023799004;
X-Microsoft-Antispam-Message-Info:
	cjrh+NY9Iry+kztyHADyhV+WQLQPOc2sdNL3NmwFP9swxhPdaoFFjmTQTIMyggdyGOs7Y6zWYczM1+fW7dnkWte51ER+KeE1UIcaYKEB/sw3eaG91F1tympD68eQhMf99x0NVzqTwEaIk/zF83AeDN+mDec7Ak/rZeTiG8cfv1OriOTGS5qhsVQoUShABBjbkhzDMSEk847HBeUAvrTkwPex0ktTE8SGDlpvZeZE2m466Dq9J1nLOjZ42hUKIvoWnxw4shNXQvMA/WC3bqwgM4PSWyhU7MVPHlJU8H83EL7c/zTPshX/7JJNOUXiG/dJSCyRzKkLY0nj5A1pzX31M4laiM/788E19CiEAbyl9mdo6nmSIb8eCdGyPERDTO1QvStFdQRAc1ygrlV4dPpazqsc6mXTBUiH5aGjkE+klSdbZ2zNPJOloy9G+69Y6Ee1skXlQzUc85TbFy1R/hjAHQMSTGbNzGzO1/Wp3a0dPfum6sOkvVV3+Mt1QQiFn1dPFNXAQceG7Pwl142HusXQKs0h/ZCEybsubxER57oPOwy2+2AJ43kdwLulnLmN48La9Br+6mg68oifA32T1V3kMFHUHqB4nMRFm1qOq2EfafAdQW03gweZQDim/VwacT/WUf5QRhLJ565FvDQs7udJr0j5zzXZqwPHfFKOGYjGPXaUbIOFNwRDdxUJbR6YQ5KPAD9qZv9Dv/gndulzYJPnAEaN3LP8PhCP1nRQQ10lGNY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SG2PPFE985372F0.apcprd01.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(52116014)(366016)(23010399003)(18002099003)(22082099003)(38350700014)(56012099006)(5023799004);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?9HsFZDc30gyVPAn2EgHoaVYzrn+4IWzBwWo6QzzBKIOD+e7LXWXPSBdH7nRz?=
 =?us-ascii?Q?+GQ5o9iaCc1fqNjSAToeXoK708IL+6hZI7tgmQaRCNE12V07rOIEk3R3vREf?=
 =?us-ascii?Q?KyQYZUOOfDPi5qtas5TlPXrY14iN65txDS+iPqX/hNQRmXrvD7FuLCjSTlgo?=
 =?us-ascii?Q?Pnq8q8CyxIfYInxSFDMLFjXk/jI3WZM3We6GyEoGjdtjF91X4TiGRhC52YN3?=
 =?us-ascii?Q?s6PYHzlKdFsYI/fmWUPdcfMA3S8bZeVyXg1Ap7GTXdkLou1uynl3Gn2+BzRN?=
 =?us-ascii?Q?X09bDAatgROomtdkBkt8ED2aICrueJe9Xu52GBrb/9tY1qVhOYE2E5SKr3dq?=
 =?us-ascii?Q?9Vrn+z02iGnAsom4gJxG8BeVkrIOK+oopBU0rX2Y5gIAlY4s/8Re+uolutY0?=
 =?us-ascii?Q?7sDWHt9iQsQXSmiI+ppaLqlzonfycdUirA83A9HtA3IDjd8ROhRNBhJBdkcF?=
 =?us-ascii?Q?i5h4cJ7KvFh6niLY/mzUgdDPSzpGlMGXIcsoKmlvnrAAnQuzIOgPxQT1hQB8?=
 =?us-ascii?Q?yTBWjszqQqD/+u5jNcxEO6Q3Afr5oU8W5mPnxW6XHQMI/eXViYChpIs0/ff3?=
 =?us-ascii?Q?ZNgYefEg009Zfm8r1jal/pbZWz3H3tGu7sqdbwV3fmfJWbWPOu1IS8sqD/pP?=
 =?us-ascii?Q?Es2lxAoalJq5nI8C51WzRxls1n/6vjW/Dg774jzOAzxu3Jz5cWU+JCGskiQA?=
 =?us-ascii?Q?5Hc+x1XqQNBmDm2GhuwIkldKjnX/UrQCHHhFHbwPp9ByqBbMDCpfhtMXfNJh?=
 =?us-ascii?Q?Cv5gha25Phljl+YrCJqQxg92vo4hRUzKNazCEiHvaMw5Evy+QL24ni0aYzZ2?=
 =?us-ascii?Q?Jm9F79zF+fUjpHOmjAg+jBce1f7kmA0+TKlmf6C4/noXkD7F80nHEL86CpJ5?=
 =?us-ascii?Q?kD1SdCH2B1KJXWRBgVS7IVIXMhwj42YPMCKcXksSyingYmFrx8kXHUMX9LgS?=
 =?us-ascii?Q?uk5UR0tXQEBzg1qJhkxiFfsVb/l8CBblzU2SvKsYRWXVywecWvcMN/I0Jj5J?=
 =?us-ascii?Q?h6a5F3q2dzy2Q192OfEzz3vO3iXkUOa5woROk6AtqMd6X1NHYVwiWt4JZg/J?=
 =?us-ascii?Q?2uVgl/NPCYm//SPfBKZNxsVSDSTcdJzPhZXQQHMTa2yTJU0WpGkDuGp3WrBU?=
 =?us-ascii?Q?aWRCXrf9U2HbqUmFNNHIsjrhfgEd65C77ftqKEbWQy5SPDn0OB2dSR1e52zJ?=
 =?us-ascii?Q?L6OfRYL/rzxIA28qBm7iHI3jbqmfIfBVy+l+IHywvlVPXC/d1v0KWNY0DToh?=
 =?us-ascii?Q?3RCe01CfODr9xWVi6fuK2W6XE/zTbUYt+051Uc6gDwVMrNiOVLA1aBWufVjK?=
 =?us-ascii?Q?tOX6c2DBpUHE7LdTlsghnWy2uLHV8BDVaUmpYyHotTrgg00nGl9xaxRZtRn1?=
 =?us-ascii?Q?yTTz4Srj10gkC6v545GN+JTUOZXXqaQYrmCDjjIjVIlNzb9fqjHN0v9NHYSl?=
 =?us-ascii?Q?519Up847RBkccjh8xfBx7833aYlZZRbrtzjimmCD21nDCb4b76l9n+Eq1EYz?=
 =?us-ascii?Q?zqQKJSyVL8tgH4rebMODm/8g2WOAbyAZDtXAEj0kgJ6S2INbCwSxNmFFyRXx?=
 =?us-ascii?Q?llWTh0rIF4oFOW67eVXuxKXzkxwufFt1RCiCve4zSy5BLWspDGJbwI4yoTCi?=
 =?us-ascii?Q?lXCXaXrhNxmyOJmkAcnVlKEfwq6cSFaMYPXmy1T80YtpJ7Bw5nvyPchE949G?=
 =?us-ascii?Q?dDH4poQfirFVpcuedWdkFqJGurOjJBIU0OJ2Iic8b6Y7ZPCIkS/pgttIWu6I?=
 =?us-ascii?Q?smRUzvL7GlgbkFRtf/snd98TlhxAEyk=3D?=
X-OriginatorOrg: ftdichip.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ab2716bf-0ced-46d2-dc23-08ded0315a4f
X-MS-Exchange-CrossTenant-AuthSource: SG2PPFE985372F0.apcprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jun 2026 07:39:12.1817
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: c2456335-1328-47c5-82f2-1fe6783d7182
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AMiil0HzryS8CiLjhh2MJv98xWxUmzOg9LZHSlBaBHa6qJZkwjFeo2D+g7HL7I90Ltu1M9/uld54JU2qDMThixEyeMm0BCsLSBkMa7pZDkA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY0PR0101MB4383

Toggling the per-port low_latency sysfs attribute while the port is
actively reading or writing was found to occasionally leave the port
wedged.  The application would block on read() until restarted.

The race is between low_latency_store() and ftdi_read_bulk_callback():

  1. ftdi_read_bulk_callback() passes the top-of-function fast-path
     low_latency check (sees false) and proceeds towards the
     throttle/start-timer block.
  2. low_latency_store() runs on another CPU and sets the flag.
     Previously it only cancelled the hrtimer and cleared
     timer_active -- it did not clear USB_SERIAL_THROTTLED.
  3. ftdi_read_bulk_callback() continues past the lock, calls
     usb_serial_generic_throttle() which sets USB_SERIAL_THROTTLED,
     and arms the (now-cancelled-and-restarted) hrtimer.
  4. Every subsequent URB completion now takes the low_latency fast
     path at the top of the callback, delegates to the upstream
     generic callback which marks the URB free, sees
     USB_SERIAL_THROTTLED set, and refuses to resubmit.  The data
     stream stalls.

Close the race:

  a) low_latency_store() now publishes the new value under
     urb_defer_lock so the callback's locked re-check observes it
     with proper ordering, then cancels the hrtimer synchronously,
     then calls usb_serial_generic_unthrottle() to clear
     USB_SERIAL_THROTTLED and resubmit any free URBs.  This is done
     in both directions of the toggle -- when nothing is parked it
     is a cheap no-op submit.

  b) ftdi_read_bulk_callback() re-checks low_latency under the same
     urb_defer_lock immediately before the throttle/start-timer
     block.  On bail it calls usb_serial_generic_submit_read_urbs()
     to resubmit the URB itself, closing the brief window where the
     URB is marked free but neither the store nor anyone else has
     resubmitted.

Signed-off-by: Chinna Mopurigari Naveen Kumar Reddy <naveen.reddy@ftdichip.com>
---
 drivers/usb/serial/ftdi_sio.c | 57 ++++++++++++++++++++++++++++++++---
 1 file changed, 52 insertions(+), 5 deletions(-)

diff --git a/drivers/usb/serial/ftdi_sio.c b/drivers/usb/serial/ftdi_sio.c
index 8faa073f1383..c631c6d0a1a5 100644
--- a/drivers/usb/serial/ftdi_sio.c
+++ b/drivers/usb/serial/ftdi_sio.c
@@ -1764,20 +1764,54 @@ static ssize_t low_latency_store(struct device *dev,
 {
 	struct usb_serial_port *port = to_usb_serial_port(dev);
 	struct ftdi_private *priv = usb_get_serial_port_data(port);
+	struct tty_struct *tty;
 	unsigned long flags;
 	u8 v;
 
 	if (kstrtou8(valbuf, 10, &v))
 		return -EINVAL;
 
+	/*
+	 * Toggling low_latency while the port is actively reading or
+	 * writing is racy unless we serialise carefully.  Between the
+	 * moment ftdi_read_bulk_callback() passes its top-of-function
+	 * low_latency check and the moment it sets USB_SERIAL_THROTTLED
+	 * + starts the hrtimer, this store may set low_latency = true.
+	 * If we then merely cancelled the timer (without clearing
+	 * USB_SERIAL_THROTTLED), every subsequent URB completion would
+	 * take the generic callback path, mark the URB free, observe
+	 * the throttled bit, refuse to resubmit, and silently stall
+	 * the data stream -- only an application restart would recover.
+	 *
+	 * Three things, in order, close the race:
+	 *   1. Publish low_latency under urb_defer_lock so the
+	 *      callback's re-check (in the throttle block below)
+	 *      observes the new value with proper ordering.
+	 *   2. Cancel the defer hrtimer synchronously so no late
+	 *      timer callback can race the unthrottle.
+	 *   3. Force-unthrottle the port and resubmit any free URBs.
+	 *      Done in both directions of the toggle -- when nothing is
+	 *      parked this is a cheap no-op submit; it eliminates the
+	 *      wedge case either way.
+	 */
+	spin_lock_irqsave(&priv->urb_defer_lock, flags);
 	priv->low_latency = !!v;
+	tty = priv->urb_defer_tty;
+	if (tty)
+		tty_kref_get(tty);
+	spin_unlock_irqrestore(&priv->urb_defer_lock, flags);
 
-	if (priv->low_latency) {
-		hrtimer_cancel(&priv->urb_defer_timer);
-		spin_lock_irqsave(&priv->urb_defer_lock, flags);
-		priv->urb_defer_timer_active = false;
-		spin_unlock_irqrestore(&priv->urb_defer_lock, flags);
+	hrtimer_cancel(&priv->urb_defer_timer);
+
+	spin_lock_irqsave(&priv->urb_defer_lock, flags);
+	priv->urb_defer_timer_active = false;
+	spin_unlock_irqrestore(&priv->urb_defer_lock, flags);
+
+	if (tty) {
+		usb_serial_generic_unthrottle(tty);
+		tty_kref_put(tty);
 	}
+
 	return count;
 }
 static DEVICE_ATTR_RW(low_latency);
@@ -2873,6 +2907,19 @@ static void ftdi_read_bulk_callback(struct urb *urb)
 		return;
 
 	spin_lock_irqsave(&priv->urb_defer_lock, flags);
+	/*
+	 * Re-check low_latency under the lock.  Pairs with the locked
+	 * publish in low_latency_store().  If the toggle landed
+	 * between the top-of-function fast-path check and here, do
+	 * not throttle or arm the timer; resubmit the URB ourselves
+	 * so the data stream does not stall in the narrow window
+	 * before the store's unthrottle runs.
+	 */
+	if (priv->low_latency) {
+		spin_unlock_irqrestore(&priv->urb_defer_lock, flags);
+		ftdi_atomic_submit_read_urbs(port);
+		return;
+	}
 	tty = priv->urb_defer_tty;
 	if (tty) {
 		tty_kref_get(tty);
-- 
2.43.0


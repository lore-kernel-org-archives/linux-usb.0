Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2ADEA3D9523
	for <linux-usb@vger.kernel.org>; Mon, 13 Jul 2026 10:48:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783939725; cv=none; b=p2vgUjdm4mSU4ukUdtroiJcg2HA2iOtYX4FznQ2PRC0cQ+N/oz11+K2fPHs5oHS4VpohbVBTUoMHAHS3NK80ub6OX4MUdCP5Gkzgi9CNb9HcL56Suah7MF8ZB44Ylp0T0XHWjxPCck//+B0oSN2uXjYO5w9dynuHuNtfDGRgZng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783939725; c=relaxed/simple;
	bh=irNXuYtPue17w2KR57H/9X9H6FdHS1lDEkgRO59XnWw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mJYdDNPTnd48yC3gD19O1NCj/G5eK3zZ/V+h7gHQdQWpJkWtBzxqyWHutW3vj/OnOy2IhHMznVSf2lcxMac08HKOeLoSq4034tadwqiuG3zBZyWJxdFAxmKrDV3ApXHoqdFR8+htM9iy1Gl1MQivmP1DZYrryjA97UU55tM3Ero=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jXn+mUM2; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jXn+mUM2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783939724; x=1815475724;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=irNXuYtPue17w2KR57H/9X9H6FdHS1lDEkgRO59XnWw=;
  b=jXn+mUM2RuEkJ0UQiFg5XIuVLh9UVcP4AACr3Xwf6hc1UVEHd248TeHH
   tNPQNYdev0ZrOD5JX33/IrCY0WtqKXDvBFC/YtQEXS/iHzuF+K+/hT1cC
   5VbQOlCFEZRVd1NJNAT/ayyU7jVie8jWfGajl07O/fk4CY7KXGhNK0H/5
   wZSamEBtqtz74iLy41CMI50pASw1oIV0WeUN+Mmhc4oqpoiXoj/MIeXqD
   0e8tOgPR/UMwO5KEod8xBcVhEGZj5iP4s0pHBqofngmc/RoYbFZiCuKs+
   /dAZj638usGYQvkBn6jvY2jcvGs5GsEkTfVOlZLEgZvJqVLmocJr1AwE/
   w==;
X-CSE-ConnectionGUID: ZERjCPwDS6GAUOIl3QYJ0Q==
X-CSE-MsgGUID: 5hUpxuGDQxuKAsEeWbCzvg==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="84323783"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="84323783"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jul 2026 03:48:42 -0700
X-CSE-ConnectionGUID: fsnyK9ryQ/WrlYQFSpn5bg==
X-CSE-MsgGUID: SrN07iThRgq3FCuP/Df46w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="259821865"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa005.jf.intel.com with ESMTP; 13 Jul 2026 03:48:41 -0700
Received: by black.igk.intel.com (Postfix, from userid 1058)
	id 488F598; Mon, 13 Jul 2026 12:48:40 +0200 (CEST)
From: Niklas Neronin <niklas.neronin@linux.intel.com>
To: mathias.nyman@linux.intel.com
Cc: linux-usb@vger.kernel.org,
	Niklas Neronin <niklas.neronin@linux.intel.com>
Subject: [PATCH 02/22] usb: xhci: rework Port Speed macros
Date: Mon, 13 Jul 2026 12:47:16 +0200
Message-ID: <20260713104738.629612-3-niklas.neronin@linux.intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260713104738.629612-1-niklas.neronin@linux.intel.com>
References: <20260713104738.629612-1-niklas.neronin@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rework the Port Speed handling to use standard bitfield helpers and
explicit numeric values. Replace suffix 'DEV_' and 'XDEV_' with 'PORT_',
which is more descriptive.

By consolidating macro usage and eliminating custom helpers, the code
becomes simpler and easier to follow. The use of standard bitfield
macros improves readability and enforces consistent register field
handling.

Relocate Slot Context macros alongside the Slot Context definitions to
keep the decoding logic self-contained and improve code organization.

Signed-off-by: Niklas Neronin <niklas.neronin@linux.intel.com>
---
 drivers/usb/host/xhci-debugfs.c |  6 ++---
 drivers/usb/host/xhci-hub.c     |  8 +++---
 drivers/usb/host/xhci-port.h    | 44 ++++++++++++++-------------------
 drivers/usb/host/xhci-ring.c    |  5 ++--
 drivers/usb/host/xhci-tegra.c   | 14 +++++++----
 drivers/usb/host/xhci.h         | 13 ++++++++--
 6 files changed, 48 insertions(+), 42 deletions(-)

diff --git a/drivers/usb/host/xhci-debugfs.c b/drivers/usb/host/xhci-debugfs.c
index d07276192256..841bb62b8196 100644
--- a/drivers/usb/host/xhci-debugfs.c
+++ b/drivers/usb/host/xhci-debugfs.c
@@ -714,7 +714,7 @@ static int xhci_ss_bw_show(struct seq_file *s, void *unused)
 	int ret;
 	struct xhci_hcd		*xhci = (struct xhci_hcd *)s->private;
 
-	ret = xhci_port_bw_show(xhci, DEV_PORT_SPEED(XDEV_SS), s);
+	ret = xhci_port_bw_show(xhci, PORT_SPEED_SS, s);
 	return ret;
 }
 
@@ -723,7 +723,7 @@ static int xhci_hs_bw_show(struct seq_file *s, void *unused)
 	int ret;
 	struct xhci_hcd		*xhci = (struct xhci_hcd *)s->private;
 
-	ret = xhci_port_bw_show(xhci, DEV_PORT_SPEED(XDEV_HS), s);
+	ret = xhci_port_bw_show(xhci, PORT_SPEED_HS, s);
 	return ret;
 }
 
@@ -732,7 +732,7 @@ static int xhci_fs_bw_show(struct seq_file *s, void *unused)
 	int ret;
 	struct xhci_hcd		*xhci = (struct xhci_hcd *)s->private;
 
-	ret = xhci_port_bw_show(xhci, DEV_PORT_SPEED(XDEV_FS), s);
+	ret = xhci_port_bw_show(xhci, PORT_SPEED_FS, s);
 	return ret;
 }
 
diff --git a/drivers/usb/host/xhci-hub.c b/drivers/usb/host/xhci-hub.c
index b0264bd8577a..37d93bcac836 100644
--- a/drivers/usb/host/xhci-hub.c
+++ b/drivers/usb/host/xhci-hub.c
@@ -376,9 +376,11 @@ static void xhci_hub_descriptor(struct usb_hcd *hcd, struct xhci_hcd *xhci,
 
 static unsigned int xhci_port_speed(int portsc)
 {
-	if (DEV_LOWSPEED(portsc))
+	u32 port_speed = FIELD_GET(PORT_SPEED_MASK, portsc);
+
+	if (port_speed == PORT_SPEED_LS)
 		return USB_PORT_STAT_LOW_SPEED;
-	if (DEV_HIGHSPEED(portsc))
+	if (port_speed == PORT_SPEED_HS)
 		return USB_PORT_STAT_HIGH_SPEED;
 	/*
 	 * FIXME: Yes, we should check for full speed, but the core uses that as
@@ -1007,7 +1009,7 @@ static u32 xhci_get_ext_port_status(u32 portsc, u32 port_li)
 	int speed_id;
 
 	/* only support rx and tx lane counts of 1 in usb3.1 spec */
-	speed_id = DEV_PORT_SPEED(portsc);
+	speed_id = FIELD_GET(PORT_SPEED_MASK, portsc);
 	ext_stat |= speed_id;		/* bits 3:0, RX speed id */
 	ext_stat |= speed_id << 4;	/* bits 7:4, TX speed id */
 
diff --git a/drivers/usb/host/xhci-port.h b/drivers/usb/host/xhci-port.h
index 45e081a9c510..12ff962cfea4 100644
--- a/drivers/usb/host/xhci-port.h
+++ b/drivers/usb/host/xhci-port.h
@@ -1,5 +1,6 @@
 /* SPDX-License-Identifier: GPL-2.0 */
 
+#include <linux/bitfield.h>
 #include <linux/bits.h>
 
 /* PORTSC - Port Status and Control Register - port_status_base bitmasks */
@@ -33,35 +34,26 @@
 
 /* true: port has power (see HCC_PPC) */
 #define PORT_POWER	BIT(9)
-/* bits 10:13 indicate device speed:
+/*
+ * bits 13:10 - Port Speed
+ * Values defined in xHCI specification 7.2.2.1.1:
  * 0 - undefined speed - port hasn't be initialized by a reset yet
- * 1 - full speed
- * 2 - low speed
- * 3 - high speed
- * 4 - super speed
- * 5-15 reserved
+ * 1 - Full-speed
+ * 2 - Low-speed
+ * 3 - High-speed
+ * 4 - SuperSpeed Gen1 x1
+ * 5 - SuperSpeed Gen2 x1
+ * 6 - SuperSpeed Gen1 x2
+ * 7 - SuperSpeed Gen2 x2
+ * 8-15 Reserved
  */
-#define DEV_SPEED_MASK		(0xf << 10)
-#define	XDEV_FS			(0x1 << 10)
-#define	XDEV_LS			(0x2 << 10)
-#define	XDEV_HS			(0x3 << 10)
-#define	XDEV_SS			(0x4 << 10)
-#define	XDEV_SSP		(0x5 << 10)
-#define DEV_UNDEFSPEED(p)	(((p) & DEV_SPEED_MASK) == (0x0<<10))
-#define DEV_FULLSPEED(p)	(((p) & DEV_SPEED_MASK) == XDEV_FS)
-#define DEV_LOWSPEED(p)		(((p) & DEV_SPEED_MASK) == XDEV_LS)
-#define DEV_HIGHSPEED(p)	(((p) & DEV_SPEED_MASK) == XDEV_HS)
-#define DEV_SUPERSPEED(p)	(((p) & DEV_SPEED_MASK) == XDEV_SS)
-#define DEV_SUPERSPEEDPLUS(p)	(((p) & DEV_SPEED_MASK) == XDEV_SSP)
-#define DEV_SUPERSPEED_ANY(p)	(((p) & DEV_SPEED_MASK) >= XDEV_SS)
-#define DEV_PORT_SPEED(p)	(((p) >> 10) & 0x0f)
+#define PORT_SPEED_MASK		GENMASK(13, 10)
+#define	PORT_SPEED_FS		1
+#define	PORT_SPEED_LS		2
+#define	PORT_SPEED_HS		3
+#define	PORT_SPEED_SS		4
+#define	PORT_SPEED_SSP		5
 
-/* Bits 20:23 in the Slot Context are the speed for the device */
-#define	SLOT_SPEED_FS		(XDEV_FS << 10)
-#define	SLOT_SPEED_LS		(XDEV_LS << 10)
-#define	SLOT_SPEED_HS		(XDEV_HS << 10)
-#define	SLOT_SPEED_SS		(XDEV_SS << 10)
-#define	SLOT_SPEED_SSP		(XDEV_SSP << 10)
 /* Port Indicator Control */
 #define PORT_LED_OFF	(0 << 14)
 #define PORT_LED_AMBER	(1 << 14)
diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
index 4f98d8269625..f6f275f32f9e 100644
--- a/drivers/usb/host/xhci-ring.c
+++ b/drivers/usb/host/xhci-ring.c
@@ -2062,7 +2062,7 @@ static void handle_port_status(struct xhci_hcd *xhci, union xhci_trb *event)
 			goto cleanup;
 		}
 
-		if (DEV_SUPERSPEED_ANY(portsc)) {
+		if (FIELD_GET(PORT_SPEED_MASK, portsc) >= PORT_SPEED_SS) {
 			xhci_dbg(xhci, "remote wake SS port %d\n", port_id);
 			/* Set a flag to say the port signaled remote wakeup,
 			 * so we can tell the difference between the end of
@@ -2094,8 +2094,7 @@ static void handle_port_status(struct xhci_hcd *xhci, union xhci_trb *event)
 		}
 	}
 
-	if ((portsc & PORT_PLC) &&
-	    DEV_SUPERSPEED_ANY(portsc) &&
+	if ((portsc & PORT_PLC) && FIELD_GET(PORT_SPEED_MASK, portsc) >= PORT_SPEED_SS &&
 	    ((portsc & PORT_PLS_MASK) == XDEV_U0 ||
 	     (portsc & PORT_PLS_MASK) == XDEV_U1 ||
 	     (portsc & PORT_PLS_MASK) == XDEV_U2)) {
diff --git a/drivers/usb/host/xhci-tegra.c b/drivers/usb/host/xhci-tegra.c
index e7e6d569f1db..fb9620012cad 100644
--- a/drivers/usb/host/xhci-tegra.c
+++ b/drivers/usb/host/xhci-tegra.c
@@ -6,6 +6,7 @@
  * Copyright (C) 2014 Google, Inc.
  */
 
+#include <linux/bitfield.h>
 #include <linux/clk.h>
 #include <linux/delay.h>
 #include <linux/dma-mapping.h>
@@ -2107,16 +2108,18 @@ static void tegra_xusb_restore_context(struct tegra_xusb *tegra)
 
 static enum usb_device_speed tegra_xhci_portsc_to_speed(struct tegra_xusb *tegra, u32 portsc)
 {
-	if (DEV_LOWSPEED(portsc))
+	u32 port_speed = FIELD_GET(PORT_SPEED_MASK, portsc);
+
+	if (port_speed == PORT_SPEED_LS)
 		return USB_SPEED_LOW;
 
-	if (DEV_HIGHSPEED(portsc))
+	if (port_speed == PORT_SPEED_HS)
 		return USB_SPEED_HIGH;
 
-	if (DEV_FULLSPEED(portsc))
+	if (port_speed == PORT_SPEED_FS)
 		return USB_SPEED_FULL;
 
-	if (DEV_SUPERSPEED_ANY(portsc))
+	if (port_speed >= PORT_SPEED_SS)
 		return USB_SPEED_SUPER;
 
 	return USB_SPEED_UNKNOWN;
@@ -2255,7 +2258,8 @@ static int tegra_xusb_enter_elpg(struct tegra_xusb *tegra, bool is_auto_resume)
 			continue;
 		portsc = xhci_portsc_readl(xhci->usb2_rhub.ports[i]);
 		tegra->lp0_utmi_pad_mask &= ~BIT(i);
-		if (((portsc & PORT_PLS_MASK) == XDEV_U3) || ((portsc & DEV_SPEED_MASK) == XDEV_FS))
+		if (((portsc & PORT_PLS_MASK) == XDEV_U3) ||
+		    (FIELD_GET(PORT_SPEED_MASK, portsc) == PORT_SPEED_FS))
 			tegra->lp0_utmi_pad_mask |= BIT(i);
 	}
 
diff --git a/drivers/usb/host/xhci.h b/drivers/usb/host/xhci.h
index d02046a573e4..52be3a184838 100644
--- a/drivers/usb/host/xhci.h
+++ b/drivers/usb/host/xhci.h
@@ -12,6 +12,7 @@
 #ifndef __LINUX_XHCI_HCD_H
 #define __LINUX_XHCI_HCD_H
 
+#include <linux/bitfield.h>
 #include <linux/bits.h>
 #include <linux/usb.h>
 #include <linux/timer.h>
@@ -355,9 +356,17 @@ struct xhci_slot_ctx {
 /* dev_info bitmasks */
 /* Route String - 0:19 */
 #define ROUTE_STRING_MASK	(0xfffff)
-/* Device speed - values defined by PORTSC Device Speed field - 20:23 */
+/*
+ * bits 23:20 - Device speed, values defined by PORTSC Device Speed field
+ * xHCI version 1.2 onwards these bits are Reserved
+ */
 #define DEV_SPEED	(0xf << 20)
 #define GET_DEV_SPEED(n) (((n) & DEV_SPEED) >> 20)
+#define	SLOT_SPEED_FS		(PORT_SPEED_FS << 20)
+#define	SLOT_SPEED_LS		(PORT_SPEED_LS << 20)
+#define	SLOT_SPEED_HS		(PORT_SPEED_HS << 20)
+#define	SLOT_SPEED_SS		(PORT_SPEED_SS << 20)
+#define	SLOT_SPEED_SSP		(PORT_SPEED_SSP << 20)
 /* bit 24 reserved */
 /* Is this LS/FS device connected through a HS hub? - bit 25 */
 #define DEV_MTT		BIT(25)
@@ -2407,7 +2416,7 @@ static inline const char *xhci_decode_portsc(char *str, u32 portsc)
 	if (portsc == ~(u32)0)
 		return str;
 
-	ret += sprintf(str + ret, "Speed=%d ", DEV_PORT_SPEED(portsc));
+	ret += sprintf(str + ret, "Speed=%ld ", FIELD_GET(PORT_SPEED_MASK, portsc));
 	ret += sprintf(str + ret, "Link=%s ", xhci_portsc_link_state_string(portsc));
 
 	/* RO/ROS: Read-only */
-- 
2.50.1


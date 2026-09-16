Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A92F050AC30
	for <linux-usb@vger.kernel.org>; Wed, 16 Sep 2026 14:15:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.6
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789568160; cv=none; b=WqrC3+qfRfgZG+9om8k1hLiH898wHtX6HZ1I/C4l6wL6lRcpZ82g9k80uU1kkdmXkoJuj6zOAul8LfbjkStO2NO2w4SIxr0+2zj7IPYwT2BAM3Jh3nUfnhCmRLKpMZatnTZ6stnOopqWAn1lz5uwAmgMzU2Nx8D2hMXY5KTIPB8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789568160; c=relaxed/simple;
	bh=jo/MNjUHY5vv+GVDD2V60agNZErEbGoPCF4/OYew1/E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oQotjpf5pnNEYbeR6lu/Hdrkxj0D55hf6modWNCy5uer1dwGi1rxTy1DNo70g8brPRK0MnOhHTmzkWWFr7FsLOLz7cRtz1F9MVtpglF726ak85mS/T62YGa7h+7dByxO/FL/lMHX2pXcVQf02SzAUWbqqasnVndt5xmyjs4poyo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ghRuk3li; arc=none smtp.client-ip=192.198.163.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ghRuk3li"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789568158; x=1821104158;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=jo/MNjUHY5vv+GVDD2V60agNZErEbGoPCF4/OYew1/E=;
  b=ghRuk3li62Qz3oX6gUUwgCpa9K8Wcisd4CaLP2NASvrQmnuBOauwi7Yj
   9I9oBoibySB/uGo/igKRZPT07/iN7cm8YlJ+TirnJjGjeNK5BzAf/W9hh
   FogW7TEzjI/5IUL82LQUqSsk3jOU4zDTDy37q6b4hKeHNSJ50gk9eexdB
   0EhaelQ3osE2jRRBwglnC9BRxH/6tMuKJC+ZG+ly262+In1un0GNCramy
   JdZ76pGSMvnofBEN8YyMVbHsGnXSRgCUYkD3aeYQqTv/90PE/LQ+MdkBA
   4nP3wQN4OaoQmg4B8QFDDQQEvyHKKqu0pD5El/cIrhWMO+wA7UiDHTQ/L
   Q==;
X-CSE-ConnectionGUID: BZW5NKhhT2mQovlblI+jJA==
X-CSE-MsgGUID: GdVu6vpJRe2V1+uoAjpImQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="449948"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="449948"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa116.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2026 07:15:57 -0700
X-CSE-ConnectionGUID: 6FYmWzASTR+8NppousLPyQ==
X-CSE-MsgGUID: Me1qhMknSFGFGY2xFzWT0w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="296838695"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa002.fm.intel.com with ESMTP; 16 Sep 2026 07:15:56 -0700
Received: by black.igk.intel.com (Postfix, from userid 1058)
	id C304A9D; Wed, 16 Sep 2026 16:15:55 +0200 (CEST)
From: Niklas Neronin <niklas.neronin@linux.intel.com>
To: mathias.nyman@linux.intel.com
Cc: linux-usb@vger.kernel.org,
	Niklas Neronin <niklas.neronin@linux.intel.com>
Subject: [PATCH v2 03/20] usb: xhci: rework Port Link State macros
Date: Wed, 16 Sep 2026 16:13:52 +0200
Message-ID: <20260916141409.629621-4-niklas.neronin@linux.intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260916141409.629621-1-niklas.neronin@linux.intel.com>
References: <20260916141409.629621-1-niklas.neronin@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rework the Port Link State (PLS) handling to use standard bitfield helpers
and explicit numeric values. Renaming is done in a later patch.

By consolidating macro usage and eliminating custom helpers, the code
becomes simpler and easier to follow. The use of standard bitfield
macros improves readability and enforces consistent register field
handling.

Change PLS macros in xhci_hub_report_usb3_link_state() from USB
chapter 1 to xhci driver. Because the PLS value is then written to
a xHCI register.

Signed-off-by: Niklas Neronin <niklas.neronin@linux.intel.com>
---
 drivers/usb/host/xhci-debugfs.c |  6 ++--
 drivers/usb/host/xhci-hub.c     | 49 +++++++++++++++++----------------
 drivers/usb/host/xhci-pci.c     |  2 +-
 drivers/usb/host/xhci-port.h    | 40 ++++++++++++++-------------
 drivers/usb/host/xhci-ring.c    | 13 ++++-----
 drivers/usb/host/xhci-tegra.c   |  6 ++--
 drivers/usb/host/xhci.c         |  6 ++--
 drivers/usb/host/xhci.h         |  2 +-
 8 files changed, 63 insertions(+), 61 deletions(-)

diff --git a/drivers/usb/host/xhci-debugfs.c b/drivers/usb/host/xhci-debugfs.c
index 450247b8bca5..b7095b2817d5 100644
--- a/drivers/usb/host/xhci-debugfs.c
+++ b/drivers/usb/host/xhci-debugfs.c
@@ -361,13 +361,13 @@ static ssize_t xhci_port_write(struct file *file,  const char __user *ubuf,
 		spin_lock_irqsave(&xhci->lock, flags);
 		/* compliance mode can only be enabled on ports in RxDetect */
 		portsc = xhci_portsc_readl(port);
-		if ((portsc & PORT_PLS_MASK) != XDEV_RXDETECT) {
+		if (FIELD_GET(PORT_PLS_MASK, portsc) != XDEV_RXDETECT) {
 			spin_unlock_irqrestore(&xhci->lock, flags);
 			return -EPERM;
 		}
 		portsc = xhci_port_state_to_neutral(portsc);
-		portsc &= ~PORT_PLS_MASK;
-		portsc |= PORT_LINK_STROBE | XDEV_COMP_MODE;
+		FIELD_MODIFY(PORT_PLS_MASK, &portsc, XDEV_COMP_MODE);
+		portsc |= PORT_LINK_STROBE;
 		xhci_portsc_writel(port, portsc);
 		spin_unlock_irqrestore(&xhci->lock, flags);
 	} else {
diff --git a/drivers/usb/host/xhci-hub.c b/drivers/usb/host/xhci-hub.c
index c52021ed948a..ca9df914bce8 100644
--- a/drivers/usb/host/xhci-hub.c
+++ b/drivers/usb/host/xhci-hub.c
@@ -801,8 +801,8 @@ void xhci_set_link_state(struct xhci_hcd *xhci, struct xhci_port *port,
 
 	portsc = xhci_portsc_readl(port);
 	temp = xhci_port_state_to_neutral(portsc);
-	temp &= ~PORT_PLS_MASK;
-	temp |= PORT_LINK_STROBE | link_state;
+	FIELD_MODIFY(PORT_PLS_MASK, &temp, link_state);
+	temp |= PORT_LINK_STROBE;
 	xhci_portsc_writel(port, temp);
 
 	xhci_dbg(xhci, "Set port %d-%d link state, portsc: 0x%x, write 0x%x",
@@ -853,7 +853,7 @@ void xhci_test_and_clear_bit(struct xhci_hcd *xhci, struct xhci_port *port,
 /* Updates Link Status for super Speed port */
 static void xhci_hub_report_usb3_link_state(struct xhci_hcd *xhci, u32 *status, u32 portsc)
 {
-	u32 pls = portsc & PORT_PLS_MASK;
+	u32 pls = FIELD_GET(PORT_PLS_MASK, portsc);
 
 	/*
 	 * CAS indicates that a warm reset is required, it may be set in any
@@ -865,7 +865,7 @@ static void xhci_hub_report_usb3_link_state(struct xhci_hcd *xhci, u32 *status,
 		 * report Compliance Mode so the hub logic triggers a warm reset.
 		 */
 		if (pls != XDEV_COMP_MODE && pls != XDEV_INACTIVE)
-			pls = USB_SS_PORT_LS_COMP_MOD;
+			pls = XDEV_COMP_MODE;
 
 		/* Signal a connection change to force a reset */
 		*status |= USB_PORT_STAT_CONNECTION;
@@ -874,7 +874,7 @@ static void xhci_hub_report_usb3_link_state(struct xhci_hcd *xhci, u32 *status,
 		 * Resume is an internal xHCI-only state and must not be exposed
 		 * to usbcore. Report it as U3 so transfers are blocked.
 		 */
-		pls = USB_SS_PORT_LS_U3;
+		pls = XDEV_U3;
 	} else if (pls == XDEV_COMP_MODE) {
 		/*
 		 * Some hardware may enter Compliance Mode without CAS.
@@ -885,7 +885,7 @@ static void xhci_hub_report_usb3_link_state(struct xhci_hcd *xhci, u32 *status,
 	}
 
 	/* update status field */
-	*status |= pls;
+	FIELD_MODIFY(PORT_PLS_MASK, status, pls);
 }
 
 /*
@@ -898,7 +898,7 @@ static void xhci_hub_report_usb3_link_state(struct xhci_hcd *xhci, u32 *status,
 static void xhci_del_comp_mod_timer(struct xhci_hcd *xhci, u32 portsc, int portnum)
 {
 	u32 all_ports_seen_u0 = ((1 << xhci->usb3_rhub.num_ports) - 1);
-	bool port_in_u0 = ((portsc & PORT_PLS_MASK) == XDEV_U0);
+	bool port_in_u0 = (FIELD_GET(PORT_PLS_MASK, portsc) == XDEV_U0);
 
 	if (!(xhci->quirks & XHCI_COMP_MODE_QUIRK))
 		return;
@@ -1031,7 +1031,7 @@ static void xhci_get_usb3_port_status(struct xhci_port *port, u32 *status,
 	bus_state = &port->rhub->bus_state;
 	xhci = hcd_to_xhci(port->rhub->hcd);
 	hcd = port->rhub->hcd;
-	link_state = portsc & PORT_PLS_MASK;
+	link_state = FIELD_GET(PORT_PLS_MASK, portsc);
 	portnum = port->hcd_portnum;
 
 	/* USB3 specific wPortChange bits
@@ -1079,7 +1079,7 @@ static void xhci_get_usb2_port_status(struct xhci_port *port, u32 *status,
 	int err;
 
 	bus_state = &port->rhub->bus_state;
-	link_state = portsc & PORT_PLS_MASK;
+	link_state = FIELD_GET(PORT_PLS_MASK, portsc);
 	portnum = port->hcd_portnum;
 
 	/* USB2 wPortStatus bits */
@@ -1288,7 +1288,7 @@ int xhci_hub_control(struct usb_hcd *hcd, u16 typeReq, u16 wValue,
 		switch (wValue) {
 		case USB_PORT_FEAT_SUSPEND:
 			portsc = xhci_portsc_readl(port);
-			if ((portsc & PORT_PLS_MASK) != XDEV_U0) {
+			if (FIELD_GET(PORT_PLS_MASK, portsc) != XDEV_U0) {
 				/* Resume the port to U0 first */
 				xhci_set_link_state(xhci, port, XDEV_U0);
 				spin_unlock_irqrestore(&xhci->lock, flags);
@@ -1301,7 +1301,7 @@ int xhci_hub_control(struct usb_hcd *hcd, u16 typeReq, u16 wValue,
 			 */
 			portsc = xhci_portsc_readl(port);
 			if ((portsc & PORT_PE) == 0 || (portsc & PORT_RESET) ||
-			    (portsc & PORT_PLS_MASK) >= XDEV_U3) {
+			    FIELD_GET(PORT_PLS_MASK, portsc) >= XDEV_U3) {
 				xhci_warn(xhci, "USB core suspending port %d-%d not in U0/U1/U2\n",
 					  hcd->self.busnum, portnum + 1);
 				goto error;
@@ -1349,7 +1349,7 @@ int xhci_hub_control(struct usb_hcd *hcd, u16 typeReq, u16 wValue,
 			if (link_state == USB_SS_PORT_LS_RX_DETECT) {
 				xhci_dbg(xhci, "Enable port %d-%d\n",
 					 hcd->self.busnum, portnum + 1);
-				xhci_set_link_state(xhci, port,	XDEV_RXDETECT);
+				xhci_set_link_state(xhci, port, XDEV_RXDETECT);
 				portsc = xhci_portsc_readl(port);
 				break;
 			}
@@ -1406,7 +1406,7 @@ int xhci_hub_control(struct usb_hcd *hcd, u16 typeReq, u16 wValue,
 			 * completion
 			 */
 			if (link_state == USB_SS_PORT_LS_U0) {
-				u32 pls = portsc & PORT_PLS_MASK;
+				u32 pls = FIELD_GET(PORT_PLS_MASK, portsc);
 				bool wait_u0 = false;
 
 				/* already in U0 */
@@ -1450,7 +1450,7 @@ int xhci_hub_control(struct usb_hcd *hcd, u16 typeReq, u16 wValue,
 				while (retries--) {
 					usleep_range(4000, 8000);
 					portsc = xhci_portsc_readl(port);
-					if ((portsc & PORT_PLS_MASK) == XDEV_U3)
+					if (FIELD_GET(PORT_PLS_MASK, portsc) == XDEV_U3)
 						break;
 				}
 				spin_lock_irqsave(&xhci->lock, flags);
@@ -1545,7 +1545,7 @@ int xhci_hub_control(struct usb_hcd *hcd, u16 typeReq, u16 wValue,
 			xhci_dbg(xhci, "PORTSC %04x\n", portsc);
 			if (portsc & PORT_RESET)
 				goto error;
-			if ((portsc & PORT_PLS_MASK) == XDEV_U3) {
+			if (FIELD_GET(PORT_PLS_MASK, portsc) == XDEV_U3) {
 				if ((portsc & PORT_PE) == 0)
 					goto error;
 
@@ -1733,7 +1733,7 @@ int xhci_bus_suspend(struct usb_hcd *hcd)
 		 * prevent suspend as port might be stuck
 		 */
 		if ((hcd->speed >= HCD_USB3) && retries-- &&
-		    (t1 & PORT_PLS_MASK) == XDEV_POLLING) {
+		    FIELD_GET(PORT_PLS_MASK, t1) == XDEV_POLLING) {
 			spin_unlock_irqrestore(&xhci->lock, flags);
 			msleep(XHCI_PORT_POLLING_LFPS_TIME);
 			spin_lock_irqsave(&xhci->lock, flags);
@@ -1749,7 +1749,7 @@ int xhci_bus_suspend(struct usb_hcd *hcd)
 			return -EBUSY;
 		}
 		/* suspend ports in U0, or bail out for new connect changes */
-		if ((t1 & PORT_PE) && (t1 & PORT_PLS_MASK) == XDEV_U0) {
+		if ((t1 & PORT_PE) && FIELD_GET(PORT_PLS_MASK, t1) == XDEV_U0) {
 			if ((t1 & PORT_CSC) && wake_enabled) {
 				bus_state->bus_suspended = 0;
 				spin_unlock_irqrestore(&xhci->lock, flags);
@@ -1758,8 +1758,8 @@ int xhci_bus_suspend(struct usb_hcd *hcd)
 			}
 			xhci_dbg(xhci, "port %d-%d not suspended\n",
 				 hcd->self.busnum, port_index + 1);
-			t2 &= ~PORT_PLS_MASK;
-			t2 |= PORT_LINK_STROBE | XDEV_U3;
+			FIELD_MODIFY(PORT_PLS_MASK, &t2, XDEV_U3);
+			t2 |= PORT_LINK_STROBE;
 			set_bit(port_index, &bus_state->bus_suspended);
 		}
 		/* USB core sets remote wake mask for USB 3.0 hubs,
@@ -1822,6 +1822,7 @@ int xhci_bus_suspend(struct usb_hcd *hcd)
 static bool xhci_port_missing_cas_quirk(struct xhci_port *port)
 {
 	u32 portsc;
+	u32 pls;
 
 	portsc = xhci_portsc_readl(port);
 
@@ -1829,8 +1830,8 @@ static bool xhci_port_missing_cas_quirk(struct xhci_port *port)
 	if (portsc & (PORT_CONNECT | PORT_CAS))
 		return false;
 
-	if (((portsc & PORT_PLS_MASK) != XDEV_POLLING) &&
-	    ((portsc & PORT_PLS_MASK) != XDEV_COMP_MODE))
+	pls = FIELD_GET(PORT_PLS_MASK, portsc);
+	if (pls != XDEV_POLLING && pls != XDEV_COMP_MODE)
 		return false;
 
 	/* clear wakeup/change bits, and do a warm port reset */
@@ -1898,11 +1899,11 @@ int xhci_bus_resume(struct usb_hcd *hcd)
 		}
 		/* resume if we suspended the link, and it is still suspended */
 		if (test_bit(port_index, &bus_state->bus_suspended))
-			switch (portsc & PORT_PLS_MASK) {
+			switch (FIELD_GET(PORT_PLS_MASK, portsc)) {
 			case XDEV_U3:
 				portsc = xhci_port_state_to_neutral(portsc);
-				portsc &= ~PORT_PLS_MASK;
-				portsc |= PORT_LINK_STROBE | next_state;
+				FIELD_MODIFY(PORT_PLS_MASK, &portsc, next_state);
+				portsc |= PORT_LINK_STROBE;
 				break;
 			case XDEV_RESUME:
 				/* resume already initiated */
diff --git a/drivers/usb/host/xhci-pci.c b/drivers/usb/host/xhci-pci.c
index a8889081ae82..c7b79c5daa53 100644
--- a/drivers/usb/host/xhci-pci.c
+++ b/drivers/usb/host/xhci-pci.c
@@ -914,7 +914,7 @@ static int xhci_pci_poweroff_late(struct usb_hcd *hcd, bool do_wakeup)
 		port = &xhci->hw_ports[i];
 		portsc = xhci_portsc_readl(port);
 
-		if ((portsc & PORT_PLS_MASK) != XDEV_U3)
+		if (FIELD_GET(PORT_PLS_MASK, portsc) != XDEV_U3)
 			continue;
 
 		if (!port->slot_id || !xhci->devs[port->slot_id]) {
diff --git a/drivers/usb/host/xhci-port.h b/drivers/usb/host/xhci-port.h
index 142f8010287f..51fe4cc14d74 100644
--- a/drivers/usb/host/xhci-port.h
+++ b/drivers/usb/host/xhci-port.h
@@ -13,26 +13,28 @@
 #define PORT_OC		BIT(3)
 /* true: port reset signaling asserted */
 #define PORT_RESET	BIT(4)
-/* Port Link State - bits 5:8
- * A read gives the current link PM state of the port,
- * a write with Link State Write Strobe set sets the link state.
+/*
+ * bits 8:5 - Port Link State, by default '5'.
+ * Reading gives the current link PM state of the port.
+ * Writing sets the link state, Port Link State Write Strobe (LWS) must be set.
+ * PLS values 0-11 are defined in USB chapter 11.
  */
-#define PORT_PLS_MASK	(0xf << 5)
-#define XDEV_U0		(0x0 << 5)
-#define XDEV_U1		(0x1 << 5)
-#define XDEV_U2		(0x2 << 5)
-#define XDEV_U3		(0x3 << 5)
-#define XDEV_DISABLED	(0x4 << 5)
-#define XDEV_RXDETECT	(0x5 << 5)
-#define XDEV_INACTIVE	(0x6 << 5)
-#define XDEV_POLLING	(0x7 << 5)
-#define XDEV_RECOVERY	(0x8 << 5)
-#define XDEV_HOT_RESET	(0x9 << 5)
-#define XDEV_COMP_MODE	(0xa << 5)
-#define XDEV_TEST_MODE	(0xb << 5)
-#define XDEV_RESUME	(0xf << 5)
-
-/* true: port has power (see HCC_PPC) */
+#define PORT_PLS_MASK	GENMASK(8, 5)
+#define XDEV_U0		0
+#define XDEV_U1		1
+#define XDEV_U2		2
+#define XDEV_U3		3
+#define XDEV_DISABLED	4
+#define XDEV_RXDETECT	5
+#define XDEV_INACTIVE	6
+#define XDEV_POLLING	7
+#define XDEV_RECOVERY	8
+#define XDEV_HOT_RESET	9
+#define XDEV_COMP_MODE	10
+#define XDEV_TEST_MODE	11
+/* Values 12-14 are Reserved */
+#define XDEV_RESUME	15
+/* bit 9 - Port Power (PP) */
 #define PORT_POWER	BIT(9)
 /*
  * bits 13:10 - Port Speed
diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
index 635118a32466..de6cf2026b82 100644
--- a/drivers/usb/host/xhci-ring.c
+++ b/drivers/usb/host/xhci-ring.c
@@ -2045,7 +2045,7 @@ static void handle_port_status(struct xhci_hcd *xhci, union xhci_trb *event)
 	bus_state = &port->rhub->bus_state;
 	hcd_portnum = port->hcd_portnum;
 	portsc = xhci_portsc_readl(port);
-	pls = portsc & PORT_PLS_MASK;
+	pls = FIELD_GET(PORT_PLS_MASK, portsc);
 
 	xhci_dbg(xhci, "Port change event, %d-%d, id %d, portsc: 0x%x\n",
 		 hcd->self.busnum, hcd_portnum + 1, port_id, portsc);
@@ -2066,7 +2066,8 @@ static void handle_port_status(struct xhci_hcd *xhci, union xhci_trb *event)
 		port->connected = !!(portsc & PORT_CONNECT);
 	}
 
-	if ((portsc & PORT_PLC) && (portsc & PORT_PLS_MASK) == XDEV_RESUME) {
+	pls = FIELD_GET(PORT_PLS_MASK, portsc);
+	if ((portsc & PORT_PLC) && pls == XDEV_RESUME) {
 		xhci_dbg(xhci, "port resume event for port %d\n", port_id);
 
 		cmd_reg = readl(&xhci->op_regs->command);
@@ -2107,11 +2108,9 @@ static void handle_port_status(struct xhci_hcd *xhci, union xhci_trb *event)
 		}
 	}
 
-	if ((portsc & PORT_PLC) &&
-	    FIELD_GET(DEV_SPEED_MASK, portsc) >= XDEV_SS &&
-	    ((portsc & PORT_PLS_MASK) == XDEV_U0 ||
-	     (portsc & PORT_PLS_MASK) == XDEV_U1 ||
-	     (portsc & PORT_PLS_MASK) == XDEV_U2)) {
+	pls = FIELD_GET(PORT_PLS_MASK, portsc);
+	if ((portsc & PORT_PLC) && pls <= XDEV_U2 &&
+	    FIELD_GET(DEV_SPEED_MASK, portsc) >= XDEV_SS) {
 		xhci_dbg(xhci, "resume SS port %d finished\n", port_id);
 		complete(&port->u3exit_done);
 		/* We've just brought the device into U0/1/2 through either the
diff --git a/drivers/usb/host/xhci-tegra.c b/drivers/usb/host/xhci-tegra.c
index c4e6b107c678..cd646f6bbe04 100644
--- a/drivers/usb/host/xhci-tegra.c
+++ b/drivers/usb/host/xhci-tegra.c
@@ -2037,7 +2037,7 @@ static bool xhci_hub_ports_suspended(struct xhci_hub *hub)
 		if ((value & PORT_PE) == 0)
 			continue;
 
-		if ((value & PORT_PLS_MASK) != XDEV_U3) {
+		if (FIELD_GET(PORT_PLS_MASK, value) != XDEV_U3) {
 			dev_info(dev, "%u-%u isn't suspended: %#010x\n",
 				 hub->hcd->self.busnum, i + 1, value);
 			status = false;
@@ -2258,7 +2258,7 @@ static int tegra_xusb_enter_elpg(struct tegra_xusb *tegra, bool is_auto_resume)
 			continue;
 		portsc = xhci_portsc_readl(xhci->usb2_rhub.ports[i]);
 		tegra->lp0_utmi_pad_mask &= ~BIT(i);
-		if (((portsc & PORT_PLS_MASK) == XDEV_U3) ||
+		if ((FIELD_GET(PORT_PLS_MASK, portsc) == XDEV_U3) ||
 		    (FIELD_GET(DEV_SPEED_MASK, portsc) == XDEV_FS))
 			tegra->lp0_utmi_pad_mask |= BIT(i);
 	}
@@ -2804,7 +2804,7 @@ static int tegra_xhci_hub_control(struct usb_hcd *hcd, u16 type_req, u16 value,
 			if (!test_bit(i, &bus_state->resuming_ports))
 				continue;
 			portsc = xhci_portsc_readl(ports[i]);
-			if ((portsc & PORT_PLS_MASK) == XDEV_RESUME)
+			if (FIELD_GET(PORT_PLS_MASK, portsc) == XDEV_RESUME)
 				tegra_phy_xusb_utmi_pad_power_on(
 					tegra_xusb_get_phy(tegra, "usb2", (int) i));
 		}
diff --git a/drivers/usb/host/xhci.c b/drivers/usb/host/xhci.c
index a9e47e178c28..4acffe73d00d 100644
--- a/drivers/usb/host/xhci.c
+++ b/drivers/usb/host/xhci.c
@@ -377,7 +377,7 @@ static void compliance_mode_recovery(struct timer_list *t)
 
 	for (i = 0; i < rhub->num_ports; i++) {
 		temp = xhci_portsc_readl(rhub->ports[i]);
-		if ((temp & PORT_PLS_MASK) == USB_SS_PORT_LS_COMP_MOD) {
+		if (FIELD_GET(PORT_PLS_MASK, temp) == XDEV_COMP_MODE) {
 			/*
 			 * Compliance Mode Detected. Letting USB Core
 			 * handle the Warm Reset
@@ -929,7 +929,7 @@ static bool xhci_pending_portevent(struct xhci_hcd *xhci)
 	while (port_index--) {
 		portsc = xhci_portsc_readl(ports[port_index]);
 		if (portsc & PORT_CHANGE_MASK ||
-		    (portsc & PORT_PLS_MASK) == XDEV_RESUME)
+		    FIELD_GET(PORT_PLS_MASK, portsc) == XDEV_RESUME)
 			return true;
 	}
 	port_index = xhci->usb3_rhub.num_ports;
@@ -937,7 +937,7 @@ static bool xhci_pending_portevent(struct xhci_hcd *xhci)
 	while (port_index--) {
 		portsc = xhci_portsc_readl(ports[port_index]);
 		if (portsc & (PORT_CHANGE_MASK | PORT_CAS) ||
-		    (portsc & PORT_PLS_MASK) == XDEV_RESUME)
+		    FIELD_GET(PORT_PLS_MASK, portsc) == XDEV_RESUME)
 			return true;
 	}
 	return false;
diff --git a/drivers/usb/host/xhci.h b/drivers/usb/host/xhci.h
index 8f3bd27df795..9c6c36870fb6 100644
--- a/drivers/usb/host/xhci.h
+++ b/drivers/usb/host/xhci.h
@@ -2374,7 +2374,7 @@ static inline const char *xhci_decode_slot_context(char *str,
 
 static inline const char *xhci_portsc_link_state_string(u32 portsc)
 {
-	switch (portsc & PORT_PLS_MASK) {
+	switch (FIELD_GET(PORT_PLS_MASK, portsc)) {
 	case XDEV_U0:
 		return "U0";
 	case XDEV_U1:
-- 
2.50.1


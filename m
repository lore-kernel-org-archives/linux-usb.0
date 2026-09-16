Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E150050EC19
	for <linux-usb@vger.kernel.org>; Wed, 16 Sep 2026 14:16:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789568167; cv=none; b=hvDBK7E4g/1hdvpsx+whzpIndEZoWcZLJvRZPkVDYytxEQfymj2qwXWVhuxeHL93On9+osGFur1ux32XIH6TPq0Dpy9G8P12XiBY9KrBLGHPAF4p5s4ig+/7yf7bUkwLSa7w/RlIPVXpa/OmMPo9DCDBUepkHu8pKDUb3o8X2cg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789568167; c=relaxed/simple;
	bh=zToKU+TK2QrjYibHCzDCiVDQ81qg0dVU6XGft3k2Npc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iz5p1ydcDIWNrW33zQ/qYiXLESeWzZO2zjlhPA89nmzMD+RQiSEP87LCvKAoAzvHo691+2cLmj9zV4mYQtvj8aPQnTbNqVgGWlMivm0euVBXd10MH5vcZYR1hSXoONSgDI9Eusk0Sjc4xE4jZCaAzE7JU2hJj6BRbHwYAxyipp0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=O5wg8PDp; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="O5wg8PDp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789568165; x=1821104165;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=zToKU+TK2QrjYibHCzDCiVDQ81qg0dVU6XGft3k2Npc=;
  b=O5wg8PDp4qmIj22ok8S1eqHUtrIIm+P617WPz3my05OVW/QzXOFjv4FH
   mF3/WQBp9QqnrT0ticsWOnQQ8lnGfUAJEJS/TBQIooJ1msYxDo/amVvbk
   kmTuUSmENsyvTYxYBKARXBah5+xUSwTqbgQY3I6jE+Il33QfVQXChjEdn
   jmzRug1FaGkmuVVLXS5EPxf3pXrVbOSQjgk4PN6s2y+YAz220kYQ+Xn6w
   +23aqw+JPf7eMIPtluOgNuc2XOh6sQ/vtENoZX+Ybo4Hdz8xk2Iz3Ckhg
   Aa2tBpTmwv3PCay0Fgh/W3eX8KsXhf+gYan4fETK4FjLKZwCYBmv9IqSO
   g==;
X-CSE-ConnectionGUID: AM3baQJFS+a+wVANYRcyBg==
X-CSE-MsgGUID: TlaVCcJdTQ2UdOKBNsepeQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="89967295"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="89967295"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2026 07:16:05 -0700
X-CSE-ConnectionGUID: P4Wnzz7SQi+Xc9uTjm2phw==
X-CSE-MsgGUID: R6JDzs6vQz+oYkwoWD2b6A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="270720168"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa008.fm.intel.com with ESMTP; 16 Sep 2026 07:16:03 -0700
Received: by black.igk.intel.com (Postfix, from userid 1058)
	id 0254F99; Wed, 16 Sep 2026 16:16:03 +0200 (CEST)
From: Niklas Neronin <niklas.neronin@linux.intel.com>
To: mathias.nyman@linux.intel.com
Cc: linux-usb@vger.kernel.org,
	Niklas Neronin <niklas.neronin@linux.intel.com>
Subject: [PATCH v2 13/20] usb: xhci: rename port register macros to xHCI spec abbreviations
Date: Wed, 16 Sep 2026 16:14:02 +0200
Message-ID: <20260916141409.629621-14-niklas.neronin@linux.intel.com>
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

The driver currently uses two different naming schemes for PORTSC
field macros:
 - xHCI specification abbreviations (e.g. CCS, PED, OCA)
 - custom driver-specific names (e.g. CONNECT, PE, OC)

The custom naming is inconsistent and does not follow a clear pattern,
making the macros harder to search for and correlate with the xHCI
specification.

Rename the custom macros to use the standard xHCI abbreviations so that
the code matches the specification terminology. This improves
readability, reduces ambiguity, and makes it easier to cross-reference
with the spec.

Verified identical object code before and after the renaming by
comparing objdump -dr output.

No functional change intended.

Signed-off-by: Niklas Neronin <niklas.neronin@linux.intel.com>
---
 drivers/usb/dwc3/host.c         |  2 +-
 drivers/usb/early/xhci-dbc.c    |  4 +-
 drivers/usb/host/xhci-debugfs.c |  2 +-
 drivers/usb/host/xhci-hub.c     | 92 ++++++++++++++++-----------------
 drivers/usb/host/xhci-pci.c     |  2 +-
 drivers/usb/host/xhci-port.h    | 50 +++++++++---------
 drivers/usb/host/xhci-ring.c    |  6 +--
 drivers/usb/host/xhci-tegra.c   |  6 +--
 drivers/usb/host/xhci.c         |  4 +-
 drivers/usb/host/xhci.h         | 24 ++++-----
 10 files changed, 96 insertions(+), 96 deletions(-)

diff --git a/drivers/usb/dwc3/host.c b/drivers/usb/dwc3/host.c
index c5674161b2b0..e0605b1a9c37 100644
--- a/drivers/usb/dwc3/host.c
+++ b/drivers/usb/dwc3/host.c
@@ -54,7 +54,7 @@ static void dwc3_power_off_all_roothub_ports(struct dwc3 *dwc)
 		for (i = 1; i <= port_num; i++) {
 			offset = op_regs_base + XHCI_PORTSC_BASE + 0x10 * (i - 1);
 			reg = readl(xhci_regs + offset);
-			reg &= ~PORT_POWER;
+			reg &= ~PORT_PP;
 			writel(reg, xhci_regs + offset);
 		}
 
diff --git a/drivers/usb/early/xhci-dbc.c b/drivers/usb/early/xhci-dbc.c
index 41118bba9197..ec2efd0e92eb 100644
--- a/drivers/usb/early/xhci-dbc.c
+++ b/drivers/usb/early/xhci-dbc.c
@@ -359,8 +359,8 @@ static void xdbc_do_reset_debug_port(u32 id, u32 count)
 	for (i = id; i < (id + count); i++) {
 		portsc = ops_reg + 0x400 + i * 0x10;
 		val = readl(portsc);
-		if (!(val & PORT_CONNECT))
-			writel(val | PORT_RESET, portsc);
+		if (!(val & PORT_CCS))
+			writel(val | PORT_PR, portsc);
 	}
 }
 
diff --git a/drivers/usb/host/xhci-debugfs.c b/drivers/usb/host/xhci-debugfs.c
index 02729682c7e2..fb4c216253c1 100644
--- a/drivers/usb/host/xhci-debugfs.c
+++ b/drivers/usb/host/xhci-debugfs.c
@@ -367,7 +367,7 @@ static ssize_t xhci_port_write(struct file *file,  const char __user *ubuf,
 		}
 		portsc = xhci_port_state_to_neutral(portsc);
 		FIELD_MODIFY(PORT_PLS_MASK, &portsc, PLS_COMP_MODE);
-		portsc |= PORT_LINK_STROBE;
+		portsc |= PORT_LWS;
 		xhci_portsc_writel(port, portsc);
 		spin_unlock_irqrestore(&xhci->lock, flags);
 	} else {
diff --git a/drivers/usb/host/xhci-hub.c b/drivers/usb/host/xhci-hub.c
index ff5645df55e3..c3e57acdad2a 100644
--- a/drivers/usb/host/xhci-hub.c
+++ b/drivers/usb/host/xhci-hub.c
@@ -17,9 +17,9 @@
 #include "xhci.h"
 #include "xhci-trace.h"
 
-#define	PORT_WAKE_BITS	(PORT_WKOC_E | PORT_WKDISC_E | PORT_WKCONN_E)
+#define	PORT_WAKE_BITS	(PORT_WOE | PORT_WDE | PORT_WCE)
 #define	PORT_RWC_BITS	(PORT_CSC | PORT_PEC | PORT_WRC | PORT_OCC | \
-			 PORT_RC | PORT_PLC | PORT_PE)
+			 PORT_PRC | PORT_PLC | PORT_PED)
 
 /* Default sublink speed attribute of each lane */
 static u32 ssp_cap_default_ssa[] = {
@@ -302,7 +302,7 @@ static void xhci_usb2_hub_descriptor(struct usb_hcd *hcd, struct xhci_hcd *xhci,
 		/* If a device is removable, PORTSC reports a 0, same as in the
 		 * hub descriptor DeviceRemovable bits.
 		 */
-		if (portsc & PORT_DEV_REMOVE)
+		if (portsc & PORT_DR)
 			/* This math is hairy because bit 0 of DeviceRemovable
 			 * is reserved, and bit 1 is for port 1, etc.
 			 */
@@ -356,7 +356,7 @@ static void xhci_usb3_hub_descriptor(struct usb_hcd *hcd, struct xhci_hcd *xhci,
 	/* bit 0 is reserved, bit 1 is for port 1, etc. */
 	for (i = 0; i < ports; i++) {
 		portsc = xhci_portsc_readl(rhub->ports[i]);
-		if (portsc & PORT_DEV_REMOVE)
+		if (portsc & PORT_DR)
 			port_removable |= 1 << (i + 1);
 	}
 
@@ -571,7 +571,7 @@ static void xhci_disable_port(struct xhci_hcd *xhci, struct xhci_port *port)
 	portsc = xhci_port_state_to_neutral(portsc);
 
 	/* Write 1 to disable the port */
-	xhci_portsc_writel(port, portsc | PORT_PE);
+	xhci_portsc_writel(port, portsc | PORT_PED);
 
 	portsc = xhci_portsc_readl(port);
 	xhci_dbg(xhci, "disable port %d-%d, portsc: 0x%x\n",
@@ -586,7 +586,7 @@ static void xhci_clear_port_change_bit(struct xhci_hcd *xhci, u16 wValue, struct
 
 	switch (wValue) {
 	case USB_PORT_FEAT_C_RESET:
-		status = PORT_RC;
+		status = PORT_PRC;
 		port_change_bit = "reset";
 		break;
 	case USB_PORT_FEAT_C_BH_PORT_RESET:
@@ -660,11 +660,11 @@ static void xhci_set_port_power(struct xhci_hcd *xhci, struct xhci_port *port,
 
 	if (on) {
 		/* Power on */
-		xhci_portsc_writel(port, temp | PORT_POWER);
+		xhci_portsc_writel(port, temp | PORT_PP);
 		xhci_portsc_readl(port);
 	} else {
 		/* Power off */
-		xhci_portsc_writel(port, temp & ~PORT_POWER);
+		xhci_portsc_writel(port, temp & ~PORT_PP);
 	}
 
 	spin_unlock_irqrestore(&xhci->lock, *flags);
@@ -802,7 +802,7 @@ void xhci_set_link_state(struct xhci_hcd *xhci, struct xhci_port *port,
 	portsc = xhci_portsc_readl(port);
 	temp = xhci_port_state_to_neutral(portsc);
 	FIELD_MODIFY(PORT_PLS_MASK, &temp, link_state);
-	temp |= PORT_LINK_STROBE;
+	temp |= PORT_LWS;
 	xhci_portsc_writel(port, temp);
 
 	xhci_dbg(xhci, "Set port %d-%d link state, portsc: 0x%x, write 0x%x",
@@ -819,19 +819,19 @@ static void xhci_set_remote_wake_mask(struct xhci_hcd *xhci,
 	temp = xhci_port_state_to_neutral(temp);
 
 	if (wake_mask & USB_PORT_FEAT_REMOTE_WAKE_CONNECT)
-		temp |= PORT_WKCONN_E;
+		temp |= PORT_WCE;
 	else
-		temp &= ~PORT_WKCONN_E;
+		temp &= ~PORT_WCE;
 
 	if (wake_mask & USB_PORT_FEAT_REMOTE_WAKE_DISCONNECT)
-		temp |= PORT_WKDISC_E;
+		temp |= PORT_WDE;
 	else
-		temp &= ~PORT_WKDISC_E;
+		temp &= ~PORT_WDE;
 
 	if (wake_mask & USB_PORT_FEAT_REMOTE_WAKE_OVER_CURRENT)
-		temp |= PORT_WKOC_E;
+		temp |= PORT_WOE;
 	else
-		temp &= ~PORT_WKOC_E;
+		temp &= ~PORT_WOE;
 
 	xhci_portsc_writel(port, temp);
 }
@@ -929,9 +929,9 @@ static int xhci_handle_usb2_port_link_resume(struct xhci_port *port,
 	xhci = hcd_to_xhci(hcd);
 	portnum = port->hcd_portnum;
 
-	if ((portsc & PORT_RESET) || !(portsc & PORT_PE)) {
+	if ((portsc & PORT_PR) || !(portsc & PORT_PED))
 		return -EINVAL;
-	}
+
 	/* did port event handler already start resume timing? */
 	if (!port->resume_timestamp) {
 		/* If not, maybe we are in a host initiated resume? */
@@ -1051,7 +1051,7 @@ static void xhci_get_usb3_port_status(struct xhci_port *port, u32 *status,
 		*status |= USB_PORT_STAT_C_CONFIG_ERROR << 16;
 
 	/* USB3 specific wPortStatus bits */
-	if (portsc & PORT_POWER)
+	if (portsc & PORT_PP)
 		*status |= USB_SS_PORT_STAT_POWER;
 
 	/* no longer suspended or resuming */
@@ -1083,7 +1083,7 @@ static void xhci_get_usb2_port_status(struct xhci_port *port, u32 *status,
 	portnum = port->hcd_portnum;
 
 	/* USB2 wPortStatus bits */
-	if (portsc & PORT_POWER) {
+	if (portsc & PORT_PP) {
 		*status |= USB_PORT_STAT_POWER;
 
 		/* link state is only valid if port is powered */
@@ -1153,19 +1153,19 @@ static u32 xhci_get_port_status(struct usb_hcd *hcd, struct xhci_bus_state *bus_
 		status |= USB_PORT_STAT_C_ENABLE << 16;
 	if (portsc & PORT_OCC)
 		status |= USB_PORT_STAT_C_OVERCURRENT << 16;
-	if (portsc & PORT_RC)
+	if (portsc & PORT_PRC)
 		status |= USB_PORT_STAT_C_RESET << 16;
 
 	/* common wPortStatus bits */
-	if (portsc & PORT_CONNECT) {
+	if (portsc & PORT_CCS) {
 		status |= USB_PORT_STAT_CONNECTION;
 		status |= xhci_port_speed(portsc);
 	}
-	if (portsc & PORT_PE)
+	if (portsc & PORT_PED)
 		status |= USB_PORT_STAT_ENABLE;
-	if (portsc & PORT_OC)
+	if (portsc & PORT_OCA)
 		status |= USB_PORT_STAT_OVERCURRENT;
-	if (portsc & PORT_RESET)
+	if (portsc & PORT_PR)
 		status |= USB_PORT_STAT_RESET;
 
 	/* USB2 and USB3 specific bits, including Port Link State */
@@ -1300,7 +1300,7 @@ int xhci_hub_control(struct usb_hcd *hcd, u16 typeReq, u16 wValue,
 			 * enabled (PED = '1',PLS < '3') state.
 			 */
 			portsc = xhci_portsc_readl(port);
-			if ((portsc & PORT_PE) == 0 || (portsc & PORT_RESET) ||
+			if ((portsc & PORT_PED) == 0 || (portsc & PORT_PR) ||
 			    FIELD_GET(PORT_PLS_MASK, portsc) >= PLS_U3) {
 				xhci_warn(xhci, "USB core suspending port %d-%d not in U0/U1/U2\n",
 					  hcd->self.busnum, portnum + 1);
@@ -1338,9 +1338,9 @@ int xhci_hub_control(struct usb_hcd *hcd, u16 typeReq, u16 wValue,
 				 * connection event.
 				 */
 				portsc |= PORT_CSC | PORT_PEC | PORT_WRC |
-					  PORT_OCC | PORT_RC | PORT_PLC |
+					  PORT_OCC | PORT_PRC | PORT_PLC |
 					  PORT_CEC;
-				xhci_portsc_writel(port, portsc | PORT_PE);
+				xhci_portsc_writel(port, portsc | PORT_PED);
 				portsc = xhci_portsc_readl(port);
 				break;
 			}
@@ -1374,7 +1374,7 @@ int xhci_hub_control(struct usb_hcd *hcd, u16 typeReq, u16 wValue,
 					break;
 				}
 
-				if ((portsc & PORT_CONNECT)) {
+				if ((portsc & PORT_CCS)) {
 					xhci_warn(xhci, "Can't set compliance mode when port is connected\n");
 					goto error;
 				}
@@ -1387,7 +1387,7 @@ int xhci_hub_control(struct usb_hcd *hcd, u16 typeReq, u16 wValue,
 				break;
 			}
 			/* Port must be enabled */
-			if (!(portsc & PORT_PE)) {
+			if (!(portsc & PORT_PED)) {
 				retval = -ENODEV;
 				break;
 			}
@@ -1468,7 +1468,7 @@ int xhci_hub_control(struct usb_hcd *hcd, u16 typeReq, u16 wValue,
 			xhci_set_port_power(xhci, port, true, &flags);
 			break;
 		case USB_PORT_FEAT_RESET:
-			portsc |= PORT_RESET;
+			portsc |= PORT_PR;
 			xhci_portsc_writel(port, portsc);
 
 			portsc = xhci_portsc_readl(port);
@@ -1483,7 +1483,7 @@ int xhci_hub_control(struct usb_hcd *hcd, u16 typeReq, u16 wValue,
 				 hcd->self.busnum, portnum + 1, portsc);
 			break;
 		case USB_PORT_FEAT_BH_PORT_RESET:
-			portsc |= PORT_WR;
+			portsc |= PORT_WPR;
 			xhci_portsc_writel(port, portsc);
 			portsc = xhci_portsc_readl(port);
 			break;
@@ -1541,10 +1541,10 @@ int xhci_hub_control(struct usb_hcd *hcd, u16 typeReq, u16 wValue,
 			portsc = xhci_portsc_readl(port);
 			xhci_dbg(xhci, "clear USB_PORT_FEAT_SUSPEND\n");
 			xhci_dbg(xhci, "PORTSC %04x\n", portsc);
-			if (portsc & PORT_RESET)
+			if (portsc & PORT_PR)
 				goto error;
 			if (FIELD_GET(PORT_PLS_MASK, portsc) == PLS_U3) {
-				if ((portsc & PORT_PE) == 0)
+				if ((portsc & PORT_PED) == 0)
 					goto error;
 
 				set_bit(portnum, &bus_state->resuming_ports);
@@ -1668,9 +1668,9 @@ int xhci_hub_status_data(struct usb_hcd *hcd, char *buf)
 			buf[(i + 1) / 8] |= 1 << (i + 1) % 8;
 			status = 1;
 		}
-		if ((temp & PORT_RC))
+		if ((temp & PORT_PRC))
 			reset_change = true;
-		if (temp & PORT_OC)
+		if (temp & PORT_OCA)
 			status = 1;
 	}
 	if (!status && !reset_change) {
@@ -1740,14 +1740,14 @@ int xhci_bus_suspend(struct usb_hcd *hcd)
 			goto retry;
 		}
 		/* bail out if port detected a over-current condition */
-		if (t1 & PORT_OC) {
+		if (t1 & PORT_OCA) {
 			bus_state->bus_suspended = 0;
 			spin_unlock_irqrestore(&xhci->lock, flags);
 			xhci_dbg(xhci, "Bus suspend bailout, port over-current detected\n");
 			return -EBUSY;
 		}
 		/* suspend ports in U0, or bail out for new connect changes */
-		if ((t1 & PORT_PE) && FIELD_GET(PORT_PLS_MASK, t1) == PLS_U0) {
+		if ((t1 & PORT_PED) && FIELD_GET(PORT_PLS_MASK, t1) == PLS_U0) {
 			if ((t1 & PORT_CSC) && wake_enabled) {
 				bus_state->bus_suspended = 0;
 				spin_unlock_irqrestore(&xhci->lock, flags);
@@ -1757,7 +1757,7 @@ int xhci_bus_suspend(struct usb_hcd *hcd)
 			xhci_dbg(xhci, "port %d-%d not suspended\n",
 				 hcd->self.busnum, port_index + 1);
 			FIELD_MODIFY(PORT_PLS_MASK, &t2, PLS_U3);
-			t2 |= PORT_LINK_STROBE;
+			t2 |= PORT_LWS;
 			set_bit(port_index, &bus_state->bus_suspended);
 		}
 		/* USB core sets remote wake mask for USB 3.0 hubs,
@@ -1765,12 +1765,12 @@ int xhci_bus_suspend(struct usb_hcd *hcd)
 		 * is enabled, so also enable remote wake here.
 		 */
 		if (wake_enabled) {
-			if (t1 & PORT_CONNECT) {
-				t2 |= PORT_WKOC_E | PORT_WKDISC_E;
-				t2 &= ~PORT_WKCONN_E;
+			if (t1 & PORT_CCS) {
+				t2 |= PORT_WOE | PORT_WDE;
+				t2 &= ~PORT_WCE;
 			} else {
-				t2 |= PORT_WKOC_E | PORT_WKCONN_E;
-				t2 &= ~PORT_WKDISC_E;
+				t2 |= PORT_WOE | PORT_WCE;
+				t2 &= ~PORT_WDE;
 			}
 
 			if ((xhci->quirks & XHCI_U2_DISABLE_WAKE) &&
@@ -1825,7 +1825,7 @@ static bool xhci_port_missing_cas_quirk(struct xhci_port *port)
 	portsc = xhci_portsc_readl(port);
 
 	/* if any of these are set we are not stuck */
-	if (portsc & (PORT_CONNECT | PORT_CAS))
+	if (portsc & (PORT_CCS | PORT_CAS))
 		return false;
 
 	pls = FIELD_GET(PORT_PLS_MASK, portsc);
@@ -1834,7 +1834,7 @@ static bool xhci_port_missing_cas_quirk(struct xhci_port *port)
 
 	/* clear wakeup/change bits, and do a warm port reset */
 	portsc &= ~(PORT_RWC_BITS | PORT_CEC | PORT_WAKE_BITS);
-	portsc |= PORT_WR;
+	portsc |= PORT_WPR;
 	xhci_portsc_writel(port, portsc);
 	/* flush write */
 	xhci_portsc_readl(port);
@@ -1901,7 +1901,7 @@ int xhci_bus_resume(struct usb_hcd *hcd)
 			case PLS_U3:
 				portsc = xhci_port_state_to_neutral(portsc);
 				FIELD_MODIFY(PORT_PLS_MASK, &portsc, next_state);
-				portsc |= PORT_LINK_STROBE;
+				portsc |= PORT_LWS;
 				break;
 			case PLS_RESUME:
 				/* resume already initiated */
diff --git a/drivers/usb/host/xhci-pci.c b/drivers/usb/host/xhci-pci.c
index a63f85961700..3088ec4c3d05 100644
--- a/drivers/usb/host/xhci-pci.c
+++ b/drivers/usb/host/xhci-pci.c
@@ -933,7 +933,7 @@ static int xhci_pci_poweroff_late(struct usb_hcd *hcd, bool do_wakeup)
 		xhci_dbg(xhci, "port %d-%d in U3 without wakeup, disable it\n",
 			 port->rhub->hcd->self.busnum, port->hcd_portnum + 1);
 		portsc = xhci_port_state_to_neutral(portsc);
-		xhci_portsc_writel(port, portsc | PORT_PE);
+		xhci_portsc_writel(port, portsc | PORT_PED);
 	}
 
 	return 0;
diff --git a/drivers/usb/host/xhci-port.h b/drivers/usb/host/xhci-port.h
index f10ce1f24eb4..69d583d1faae 100644
--- a/drivers/usb/host/xhci-port.h
+++ b/drivers/usb/host/xhci-port.h
@@ -8,15 +8,15 @@
 #include <linux/bits.h>
 
 /* Port Status and Control (PORTSC) 5.4.8 */
-/* bit 0 - Current Connect Status (CCS) */
-#define PORT_CONNECT	BIT(0)
-/* bit 1 - Port Enabled/Disabled (PED) */
-#define PORT_PE		BIT(1)
+/* bit 0 - Current Connect Status */
+#define PORT_CCS	BIT(0)
+/* bit 1 - Port Enabled/Disabled */
+#define PORT_PED	BIT(1)
 /* bit 2 - Rsvd */
-/* bit 3 - Over-current Active (OCA) */
-#define PORT_OC		BIT(3)
-/* bit 4 - Port Reset (PR) */
-#define PORT_RESET	BIT(4)
+/* bit 3 - Over-current Active */
+#define PORT_OCA	BIT(3)
+/* bit 4 - Port Reset */
+#define PORT_PR		BIT(4)
 /*
  * bits 8:5 - Port Link State, by default '5'.
  * Reading gives the current link PM state of the port.
@@ -38,8 +38,8 @@
 #define PLS_TEST_MODE	11
 /* Values 12-14 are Reserved */
 #define PLS_RESUME	15
-/* bit 9 - Port Power (PP) */
-#define PORT_POWER	BIT(9)
+/* bit 9 - Port Power */
+#define PORT_PP		BIT(9)
 /*
  * bits 13:10 - Port Speed
  * Values defined in xHCI specification 7.2.2.1.1:
@@ -65,8 +65,8 @@
 #define PIC_OFF		0
 #define PIC_AMBER	1
 #define PIC_GREEN	2
-/* bit 16 - Port Link State Write Strobe (LWS), set this when changing link state */
-#define PORT_LINK_STROBE	BIT(16)
+/* bit 16 - Port Link State Write Strobe, set this when changing link state */
+#define PORT_LWS	BIT(16)
 /* bit 17 - Connect Status Change */
 #define PORT_CSC	BIT(17)
 /* bit 18 - Port Enabled/Disabled Change */
@@ -81,8 +81,8 @@
 #define PORT_WRC	BIT(19)
 /* bit 20 - Over-current Change */
 #define PORT_OCC	BIT(20)
-/* bit 21 - Port Reset Change (PRC) */
-#define PORT_RC		BIT(21)
+/* bit 21 - Port Reset Change */
+#define PORT_PRC	BIT(21)
 /*
  * bit 22 - Port Link State Change, set on some port link state transitions:
  *  Transition				Reason
@@ -106,19 +106,19 @@
  * Warm port reset should be perfomed to clear this bit and move port to connected state.
  */
 #define PORT_CAS	BIT(24)
-/* bit 25 - Wake on Connect Enable (WCE) */
-#define PORT_WKCONN_E	BIT(25)
-/* bit 26 - Wake on Disconnect Enable (WDE) */
-#define PORT_WKDISC_E	BIT(26)
-/* bit 27 - Wake on Over-current Enable (WOE) */
-#define PORT_WKOC_E	BIT(27)
+/* bit 25 - Wake on Connect Enable */
+#define PORT_WCE	BIT(25)
+/* bit 26 - Wake on Disconnect Enable */
+#define PORT_WDE	BIT(26)
+/* bit 27 - Wake on Over-current Enable */
+#define PORT_WOE	BIT(27)
 /* bits 29:28 - RsvdZ */
-/* bit 30 - Device Removable (DR), for USB 3.0 roothub emulation */
-#define PORT_DEV_REMOVE	BIT(30)
-/* bit 31 - Warm Port Reset (WPR), complete when PORT_WRC is '1' */
-#define PORT_WR		BIT(31)
+/* bit 30 - Device Removable, for USB 3.0 roothub emulation */
+#define PORT_DR		BIT(30)
+/* bit 31 - Warm Port Reset, complete when PORT_WRC is '1' */
+#define PORT_WPR		BIT(31)
 #define PORT_CHANGE_MASK	(PORT_CSC | PORT_PEC | PORT_WRC | PORT_OCC | \
-				 PORT_RC | PORT_PLC | PORT_CEC)
+				 PORT_PRC | PORT_PLC | PORT_CEC)
 
 /* We mark duplicate entries with -1 */
 #define DUPLICATE_ENTRY ((u8)(-1))
diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
index 7ea79501c035..6e06c6733570 100644
--- a/drivers/usb/host/xhci-ring.c
+++ b/drivers/usb/host/xhci-ring.c
@@ -2061,9 +2061,9 @@ static void handle_port_status(struct xhci_hcd *xhci, union xhci_trb *event)
 	 * Tag broken links to avoid retries while hub driver sorts it out.
 	 * Link status is not relible while port is in reset.
 	 */
-	if (!(portsc & PORT_RESET)) {
+	if (!(portsc & PORT_PR)) {
 		port->link_inactive = (pls == PLS_INACTIVE);
-		port->connected = !!(portsc & PORT_CONNECT);
+		port->connected = !!(portsc & PORT_CCS);
 	}
 
 	pls = FIELD_GET(PORT_PLS_MASK, portsc);
@@ -2146,7 +2146,7 @@ static void handle_port_status(struct xhci_hcd *xhci, union xhci_trb *event)
 	if (hcd->speed < HCD_USB3) {
 		xhci_test_and_clear_bit(xhci, port, PORT_PLC);
 		if ((xhci->quirks & XHCI_RESET_PLL_ON_DISCONNECT) &&
-		    (portsc & PORT_CSC) && !(portsc & PORT_CONNECT))
+		    (portsc & PORT_CSC) && !(portsc & PORT_CCS))
 			xhci_cavium_reset_phy_quirk(xhci);
 	}
 
diff --git a/drivers/usb/host/xhci-tegra.c b/drivers/usb/host/xhci-tegra.c
index 6a8fb386c2d8..620c7f67c8b3 100644
--- a/drivers/usb/host/xhci-tegra.c
+++ b/drivers/usb/host/xhci-tegra.c
@@ -2034,7 +2034,7 @@ static bool xhci_hub_ports_suspended(struct xhci_hub *hub)
 
 	for (i = 0; i < hub->num_ports; i++) {
 		value = xhci_portsc_readl(hub->ports[i]);
-		if ((value & PORT_PE) == 0)
+		if ((value & PORT_PED) == 0)
 			continue;
 
 		if (FIELD_GET(PORT_PLS_MASK, value) != PLS_U3) {
@@ -2822,7 +2822,7 @@ static int tegra_xhci_hub_control(struct usb_hcd *hcd, u16 type_req, u16 value,
 				return -EPIPE;
 			ports = rhub->ports;
 			portsc = xhci_portsc_readl(ports[port]);
-			if (portsc & PORT_CONNECT)
+			if (portsc & PORT_CCS)
 				tegra_phy_xusb_utmi_pad_power_on(phy);
 		}
 	}
@@ -2841,7 +2841,7 @@ static int tegra_xhci_hub_control(struct usb_hcd *hcd, u16 type_req, u16 value,
 		if ((type_req == ClearPortFeature) && (value == USB_PORT_FEAT_C_CONNECTION)) {
 			ports = rhub->ports;
 			portsc = xhci_portsc_readl(ports[port]);
-			if (!(portsc & PORT_CONNECT)) {
+			if (!(portsc & PORT_CCS)) {
 				/* We don't suspend the PAD while HNP role swap happens on the OTG
 				 * port
 				 */
diff --git a/drivers/usb/host/xhci.c b/drivers/usb/host/xhci.c
index d3fcca94e06a..3f80000fc5a9 100644
--- a/drivers/usb/host/xhci.c
+++ b/drivers/usb/host/xhci.c
@@ -31,7 +31,7 @@
 #define DRIVER_AUTHOR "Sarah Sharp"
 #define DRIVER_DESC "'eXtensible' Host Controller (xHC) Driver"
 
-#define	PORT_WAKE_BITS	(PORT_WKOC_E | PORT_WKDISC_E | PORT_WKCONN_E)
+#define	PORT_WAKE_BITS	(PORT_WOE | PORT_WDE | PORT_WCE)
 
 /* Some 0.95 hardware can't handle the chain bit on a Link TRB being cleared */
 static int link_quirk;
@@ -896,7 +896,7 @@ static void xhci_disable_hub_port_wake(struct xhci_hcd *xhci,
 			t2 &= ~PORT_WAKE_BITS;
 
 		/* Don't touch csc bit if connected or connect change is set */
-		if (!(portsc & (PORT_CSC | PORT_CONNECT)))
+		if (!(portsc & (PORT_CSC | PORT_CCS)))
 			t2 |= PORT_CSC;
 
 		if (t1 != t2) {
diff --git a/drivers/usb/host/xhci.h b/drivers/usb/host/xhci.h
index 758155a772cc..2808b363f2f8 100644
--- a/drivers/usb/host/xhci.h
+++ b/drivers/usb/host/xhci.h
@@ -2420,37 +2420,37 @@ static inline const char *xhci_decode_portsc(char *str, u32 portsc)
 	ret += sprintf(str + ret, "Link=%s ", xhci_portsc_link_state_string(portsc));
 
 	/* RO/ROS: Read-only */
-	if (portsc & PORT_CONNECT)
+	if (portsc & PORT_CCS)
 		ret += sprintf(str + ret, "CCS ");
-	if (portsc & PORT_OC)
+	if (portsc & PORT_OCA)
 		ret += sprintf(str + ret, "OCA "); /* No set for USB2 ports */
 	if (portsc & PORT_CAS)
 		ret += sprintf(str + ret, "CAS ");
-	if (portsc & PORT_DEV_REMOVE)
+	if (portsc & PORT_DR)
 		ret += sprintf(str + ret, "DR ");
 
 	/* RWS; writing 1 sets the bit, writing 0 clears the bit. */
-	if (portsc & PORT_POWER)
+	if (portsc & PORT_PP)
 		ret += sprintf(str + ret, "PP ");
-	if (portsc & PORT_WKCONN_E)
+	if (portsc & PORT_WCE)
 		ret += sprintf(str + ret, "WCE ");
-	if (portsc & PORT_WKDISC_E)
+	if (portsc & PORT_WDE)
 		ret += sprintf(str + ret, "WDE ");
-	if (portsc & PORT_WKOC_E)
+	if (portsc & PORT_WOE)
 		ret += sprintf(str + ret, "WOE ");
 
 	/* RW; writing 1 sets the bit, writing 0 clears the bit */
-	if (portsc & PORT_LINK_STROBE)
+	if (portsc & PORT_LWS)
 		ret += sprintf(str + ret, "LWS "); /* LWS 0 write is ignored */
 
 	/* RW1S; writing 1 sets the bit, writing 0 has no effect */
-	if (portsc & PORT_RESET)
+	if (portsc & PORT_PR)
 		ret += sprintf(str + ret, "PR ");
-	if (portsc & PORT_WR)
+	if (portsc & PORT_WPR)
 		ret += sprintf(str + ret, "WPR "); /* RsvdZ for USB2 ports */
 
 	/* RW1CS; writing 1 clears the bit, writing 0 has no effect. */
-	if (portsc & PORT_PE)
+	if (portsc & PORT_PED)
 		ret += sprintf(str + ret, "PED ");
 	if (portsc & PORT_CSC)
 		ret += sprintf(str + ret, "CSC ");
@@ -2460,7 +2460,7 @@ static inline const char *xhci_decode_portsc(char *str, u32 portsc)
 		ret += sprintf(str + ret, "WRC "); /* RsvdZ for USB2 ports */
 	if (portsc & PORT_OCC)
 		ret += sprintf(str + ret, "OCC ");
-	if (portsc & PORT_RC)
+	if (portsc & PORT_PRC)
 		ret += sprintf(str + ret, "PRC ");
 	if (portsc & PORT_PLC)
 		ret += sprintf(str + ret, "PLC ");
-- 
2.50.1


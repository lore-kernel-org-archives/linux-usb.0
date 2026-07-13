Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DB3429E10F
	for <linux-usb@vger.kernel.org>; Mon, 13 Jul 2026 10:48:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783939725; cv=none; b=mAWPqex0jETiDqcXVGr8QMKKQpds2iwfmBjomHlFzPAckCiSXfmPicocxWFcCG9mY0R/ipXwT7qZbhJ22aClXr/TsdOzqThMSdiFYtUyjCKEwApAwTx0u33k1QV2MljfO/rffdW6n+uZppYr8MjjlCizpFarZpM2oankMqRLjWw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783939725; c=relaxed/simple;
	bh=qg/acCtER+SWOgUS7C7gCymmzNB14QhAKfACNN6Z2JY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QxPYK/SsUCKfl3CHgEf13YsTqCqrcxRIOlcQzTwX0bT3N1UnsvtKuFRKo3vFPRnbtFC+NhnbFiZmj+SpsPq2YhHXZzSnjlgPAEYXzr88Dw9iSFtaEVb3pggkuh2jnPG2Kjl+cZqVsiQxCI79zeh1JXuIMOGjw2sbtIOju/52cL8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IYDZWfbd; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IYDZWfbd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783939724; x=1815475724;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=qg/acCtER+SWOgUS7C7gCymmzNB14QhAKfACNN6Z2JY=;
  b=IYDZWfbdmvE1cY1+Xfg6da/DEafbaLXfBbV7bZoIfsks4086VFiQ8xnO
   nOkT2DeUaSNvcbfo4buo4bh8zXRsMosDgChEqhH0gj6DEKWyeDFmTOr0u
   q0WD+yCzsNrx7HZPonxNTuAKTB8LCu5eTgvy7XSIMSwxmWwG+GUcahCht
   1Os658dCGYQN2R9OqLXpVedzsl2RD6FbLqoLMB85kvZSBH9tkffiMlrah
   36SgaqGJrikf81N8IIKam7qJb3d//yptU1bzv6hXlOwpiMHzHW0KOHUR2
   Wato4UFZ+g4CBMtaGfXgU/WAxl1C8HkjRCfQqk6rvAu46d+3+StcFL2aE
   g==;
X-CSE-ConnectionGUID: +eUpNo70SPKHQHsGUTuMKQ==
X-CSE-MsgGUID: Oy9oJBRiSXaDGdzOisowag==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="96057029"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="96057029"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jul 2026 03:48:43 -0700
X-CSE-ConnectionGUID: WEzbivL9Q1+CAKzVl9kwQg==
X-CSE-MsgGUID: 493xYorkTd6u7FzXImkm6g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="279928970"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa001.fm.intel.com with ESMTP; 13 Jul 2026 03:48:41 -0700
Received: by black.igk.intel.com (Postfix, from userid 1058)
	id D691F99; Mon, 13 Jul 2026 12:48:40 +0200 (CEST)
From: Niklas Neronin <niklas.neronin@linux.intel.com>
To: mathias.nyman@linux.intel.com
Cc: linux-usb@vger.kernel.org,
	Niklas Neronin <niklas.neronin@linux.intel.com>
Subject: [PATCH 03/22] usb: xhci: rework Port Link State macros
Date: Mon, 13 Jul 2026 12:47:17 +0200
Message-ID: <20260713104738.629612-4-niklas.neronin@linux.intel.com>
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

Rework the Port Link State mask to use standard bitfield helper.
Replace suffix 'XDEV_' with 'PORT_' or 'PLS_', which is better suited.

Rework the Port Link State handling to use standard bitfield helpers and
explicit numeric values. Replace suffix 'XDEV_' with 'PORT_', which is
more descriptive.

By consolidating macro usage and eliminating custom helpers, the code
becomes simpler and easier to follow. The use of standard bitfield
macros improves readability and enforces consistent register field
handling.

Signed-off-by: Niklas Neronin <niklas.neronin@linux.intel.com>
---
 drivers/usb/host/xhci-debugfs.c |   6 +-
 drivers/usb/host/xhci-hub.c     | 111 ++++++++++++++++----------------
 drivers/usb/host/xhci-pci.c     |   2 +-
 drivers/usb/host/xhci-port.h    |  40 ++++++------
 drivers/usb/host/xhci-ring.c    |  12 ++--
 drivers/usb/host/xhci-tegra.c   |   6 +-
 drivers/usb/host/xhci.c         |   8 +--
 drivers/usb/host/xhci.h         |  28 ++++----
 8 files changed, 108 insertions(+), 105 deletions(-)

diff --git a/drivers/usb/host/xhci-debugfs.c b/drivers/usb/host/xhci-debugfs.c
index 841bb62b8196..6ca3450ebe31 100644
--- a/drivers/usb/host/xhci-debugfs.c
+++ b/drivers/usb/host/xhci-debugfs.c
@@ -360,13 +360,13 @@ static ssize_t xhci_port_write(struct file *file,  const char __user *ubuf,
 		spin_lock_irqsave(&xhci->lock, flags);
 		/* compliance mode can only be enabled on ports in RxDetect */
 		portsc = xhci_portsc_readl(port);
-		if ((portsc & PORT_PLS_MASK) != XDEV_RXDETECT) {
+		if (FIELD_GET(PORT_PLS_MASK, portsc) != PLS_RXDETECT) {
 			spin_unlock_irqrestore(&xhci->lock, flags);
 			return -EPERM;
 		}
 		portsc = xhci_port_state_to_neutral(portsc);
-		portsc &= ~PORT_PLS_MASK;
-		portsc |= PORT_LINK_STROBE | XDEV_COMP_MODE;
+		FIELD_MODIFY(PORT_PLS_MASK, &portsc, PLS_COMP_MODE);
+		portsc |= PORT_LINK_STROBE;
 		xhci_portsc_writel(port, portsc);
 		spin_unlock_irqrestore(&xhci->lock, flags);
 	} else {
diff --git a/drivers/usb/host/xhci-hub.c b/drivers/usb/host/xhci-hub.c
index 37d93bcac836..e5ff6d10fba2 100644
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
@@ -864,18 +864,18 @@ static void xhci_hub_report_usb3_link_state(struct xhci_hcd *xhci, u32 *status,
 		 * If not already in Compliance or Inactive state,
 		 * report Compliance Mode so the hub logic triggers a warm reset.
 		 */
-		if (pls != XDEV_COMP_MODE && pls != XDEV_INACTIVE)
-			pls = USB_SS_PORT_LS_COMP_MOD;
+		if (pls != PLS_COMP_MODE && pls != PLS_INACTIVE)
+			pls = PLS_COMP_MODE;
 
 		/* Signal a connection change to force a reset */
 		*status |= USB_PORT_STAT_CONNECTION;
-	} else if (pls == XDEV_RESUME) {
+	} else if (pls == PLS_RESUME) {
 		/*
 		 * Resume is an internal xHCI-only state and must not be exposed
 		 * to usbcore. Report it as U3 so transfers are blocked.
 		 */
-		pls = USB_SS_PORT_LS_U3;
-	} else if (pls == XDEV_COMP_MODE) {
+		pls = PLS_U3;
+	} else if (pls == PLS_COMP_MODE) {
 		/*
 		 * Some hardware may enter Compliance Mode without CAS.
 		 * Fake a connection event so usbcore notices and resets the port.
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
+	bool port_in_u0 = (FIELD_GET(PORT_PLS_MASK, portsc) == PLS_U0);
 
 	if (!(xhci->quirks & XHCI_COMP_MODE_QUIRK))
 		return;
@@ -968,7 +968,7 @@ static int xhci_handle_usb2_port_link_resume(struct xhci_port *port,
 		port->rexit_active = true;
 
 		xhci_test_and_clear_bit(xhci, port, PORT_PLC);
-		xhci_set_link_state(xhci, port, XDEV_U0);
+		xhci_set_link_state(xhci, port, PLS_U0);
 
 		spin_unlock_irqrestore(&xhci->lock, *flags);
 		time_left = wait_for_completion_timeout(
@@ -1031,7 +1031,7 @@ static void xhci_get_usb3_port_status(struct xhci_port *port, u32 *status,
 	bus_state = &port->rhub->bus_state;
 	xhci = hcd_to_xhci(port->rhub->hcd);
 	hcd = port->rhub->hcd;
-	link_state = portsc & PORT_PLS_MASK;
+	link_state = FIELD_GET(PORT_PLS_MASK, portsc);
 	portnum = port->hcd_portnum;
 
 	/* USB3 specific wPortChange bits
@@ -1043,7 +1043,7 @@ static void xhci_get_usb3_port_status(struct xhci_port *port, u32 *status,
 	 * irq won't be generated.
 	 */
 
-	if (portsc & PORT_PLC && (link_state != XDEV_RESUME))
+	if (portsc & PORT_PLC && (link_state != PLS_RESUME))
 		*status |= USB_PORT_STAT_C_LINK_STATE << 16;
 	if (portsc & PORT_WRC)
 		*status |= USB_PORT_STAT_C_BH_RESET << 16;
@@ -1055,9 +1055,9 @@ static void xhci_get_usb3_port_status(struct xhci_port *port, u32 *status,
 		*status |= USB_SS_PORT_STAT_POWER;
 
 	/* no longer suspended or resuming */
-	if (link_state != XDEV_U3 &&
-	    link_state != XDEV_RESUME &&
-	    link_state != XDEV_RECOVERY) {
+	if (link_state != PLS_U3 &&
+	    link_state != PLS_RESUME &&
+	    link_state != PLS_RECOVERY) {
 		/* remote wake resume signaling complete */
 		if (bus_state->port_remote_wakeup & (1 << portnum)) {
 			bus_state->port_remote_wakeup &= ~(1 << portnum);
@@ -1079,7 +1079,7 @@ static void xhci_get_usb2_port_status(struct xhci_port *port, u32 *status,
 	int err;
 
 	bus_state = &port->rhub->bus_state;
-	link_state = portsc & PORT_PLS_MASK;
+	link_state = FIELD_GET(PORT_PLS_MASK, portsc);
 	portnum = port->hcd_portnum;
 
 	/* USB2 wPortStatus bits */
@@ -1087,17 +1087,17 @@ static void xhci_get_usb2_port_status(struct xhci_port *port, u32 *status,
 		*status |= USB_PORT_STAT_POWER;
 
 		/* link state is only valid if port is powered */
-		if (link_state == XDEV_U3)
+		if (link_state == PLS_U3)
 			*status |= USB_PORT_STAT_SUSPEND;
-		if (link_state == XDEV_U2)
+		if (link_state == PLS_U2)
 			*status |= USB_PORT_STAT_L1;
-		if (link_state == XDEV_U0) {
+		if (link_state == PLS_U0) {
 			if (bus_state->suspended_ports & (1 << portnum)) {
 				bus_state->suspended_ports &= ~(1 << portnum);
 				bus_state->port_c_suspend |= 1 << portnum;
 			}
 		}
-		if (link_state == XDEV_RESUME) {
+		if (link_state == PLS_RESUME) {
 			err = xhci_handle_usb2_port_link_resume(port, portsc,
 								flags);
 			if (err < 0)
@@ -1112,7 +1112,7 @@ static void xhci_get_usb2_port_status(struct xhci_port *port, u32 *status,
 	 * or resuming. Port either resumed to U0/U1/U2, disconnected, or in a
 	 * error state. Resume related variables should be cleared in all those cases.
 	 */
-	if (link_state != XDEV_U3 && link_state != XDEV_RESUME) {
+	if (link_state != PLS_U3 && link_state != PLS_RESUME) {
 		if (port->resume_timestamp ||
 		    test_bit(portnum, &bus_state->resuming_ports)) {
 			port->resume_timestamp = 0;
@@ -1288,9 +1288,9 @@ int xhci_hub_control(struct usb_hcd *hcd, u16 typeReq, u16 wValue,
 		switch (wValue) {
 		case USB_PORT_FEAT_SUSPEND:
 			portsc = xhci_portsc_readl(port);
-			if ((portsc & PORT_PLS_MASK) != XDEV_U0) {
+			if (FIELD_GET(PORT_PLS_MASK, portsc) != PLS_U0) {
 				/* Resume the port to U0 first */
-				xhci_set_link_state(xhci, port, XDEV_U0);
+				xhci_set_link_state(xhci, port, PLS_U0);
 				spin_unlock_irqrestore(&xhci->lock, flags);
 				msleep(10);
 				spin_lock_irqsave(&xhci->lock, flags);
@@ -1301,7 +1301,7 @@ int xhci_hub_control(struct usb_hcd *hcd, u16 typeReq, u16 wValue,
 			 */
 			portsc = xhci_portsc_readl(port);
 			if ((portsc & PORT_PE) == 0 || (portsc & PORT_RESET) ||
-			    (portsc & PORT_PLS_MASK) >= XDEV_U3) {
+			    FIELD_GET(PORT_PLS_MASK, portsc) >= PLS_U3) {
 				xhci_warn(xhci, "USB core suspending port %d-%d not in U0/U1/U2\n",
 					  hcd->self.busnum, portnum + 1);
 				goto error;
@@ -1316,7 +1316,7 @@ int xhci_hub_control(struct usb_hcd *hcd, u16 typeReq, u16 wValue,
 			xhci_stop_device(xhci, port->slot_id, 1);
 			spin_lock_irqsave(&xhci->lock, flags);
 
-			xhci_set_link_state(xhci, port, XDEV_U3);
+			xhci_set_link_state(xhci, port, PLS_U3);
 
 			spin_unlock_irqrestore(&xhci->lock, flags);
 			msleep(10); /* wait device to enter */
@@ -1349,7 +1349,7 @@ int xhci_hub_control(struct usb_hcd *hcd, u16 typeReq, u16 wValue,
 			if (link_state == USB_SS_PORT_LS_RX_DETECT) {
 				xhci_dbg(xhci, "Enable port %d-%d\n",
 					 hcd->self.busnum, portnum + 1);
-				xhci_set_link_state(xhci, port,	XDEV_RXDETECT);
+				xhci_set_link_state(xhci, port, PLS_RXDETECT);
 				portsc = xhci_portsc_readl(port);
 				break;
 			}
@@ -1381,7 +1381,7 @@ int xhci_hub_control(struct usb_hcd *hcd, u16 typeReq, u16 wValue,
 
 				xhci_dbg(xhci, "Enable compliance mode transition for port %d-%d\n",
 					 hcd->self.busnum, portnum + 1);
-				xhci_set_link_state(xhci, port, XDEV_COMP_MODE);
+				xhci_set_link_state(xhci, port, PLS_COMP_MODE);
 
 				portsc = xhci_portsc_readl(port);
 				break;
@@ -1406,22 +1406,22 @@ int xhci_hub_control(struct usb_hcd *hcd, u16 typeReq, u16 wValue,
 			 * completion
 			 */
 			if (link_state == USB_SS_PORT_LS_U0) {
-				u32 pls = portsc & PORT_PLS_MASK;
+				u32 pls = FIELD_GET(PORT_PLS_MASK, portsc);
 				bool wait_u0 = false;
 
 				/* already in U0 */
-				if (pls == XDEV_U0)
+				if (pls == PLS_U0)
 					break;
-				if (pls == XDEV_U3 ||
-				    pls == XDEV_RESUME ||
-				    pls == XDEV_RECOVERY) {
+				if (pls == PLS_U3 ||
+				    pls == PLS_RESUME ||
+				    pls == PLS_RECOVERY) {
 					wait_u0 = true;
 					reinit_completion(&port->u3exit_done);
 				}
-				if (pls <= XDEV_U3) /* U1, U2, U3 */
-					xhci_set_link_state(xhci, port, XDEV_U0);
+				if (pls <= PLS_U3) /* U1, U2, U3 */
+					xhci_set_link_state(xhci, port, PLS_U3);
 				if (!wait_u0) {
-					if (pls > XDEV_U3)
+					if (pls > PLS_U3)
 						goto error;
 					break;
 				}
@@ -1445,12 +1445,12 @@ int xhci_hub_control(struct usb_hcd *hcd, u16 typeReq, u16 wValue,
 					xhci_stop_device(xhci, port->slot_id, 1);
 					spin_lock_irqsave(&xhci->lock, flags);
 				}
-				xhci_set_link_state(xhci, port, XDEV_U3);
+				xhci_set_link_state(xhci, port, PLS_U3);
 				spin_unlock_irqrestore(&xhci->lock, flags);
 				while (retries--) {
 					usleep_range(4000, 8000);
 					portsc = xhci_portsc_readl(port);
-					if ((portsc & PORT_PLS_MASK) == XDEV_U3)
+					if (FIELD_GET(PORT_PLS_MASK, portsc) == PLS_U3)
 						break;
 				}
 				spin_lock_irqsave(&xhci->lock, flags);
@@ -1545,17 +1545,17 @@ int xhci_hub_control(struct usb_hcd *hcd, u16 typeReq, u16 wValue,
 			xhci_dbg(xhci, "PORTSC %04x\n", portsc);
 			if (portsc & PORT_RESET)
 				goto error;
-			if ((portsc & PORT_PLS_MASK) == XDEV_U3) {
+			if (FIELD_GET(PORT_PLS_MASK, portsc) == PLS_U3) {
 				if ((portsc & PORT_PE) == 0)
 					goto error;
 
 				set_bit(portnum, &bus_state->resuming_ports);
 				usb_hcd_start_port_resume(&hcd->self, portnum);
-				xhci_set_link_state(xhci, port, XDEV_RESUME);
+				xhci_set_link_state(xhci, port, PLS_RESUME);
 				spin_unlock_irqrestore(&xhci->lock, flags);
 				msleep(USB_RESUME_TIMEOUT);
 				spin_lock_irqsave(&xhci->lock, flags);
-				xhci_set_link_state(xhci, port, XDEV_U0);
+				xhci_set_link_state(xhci, port, PLS_U0);
 				clear_bit(portnum, &bus_state->resuming_ports);
 				usb_hcd_end_port_resume(&hcd->self, portnum);
 			}
@@ -1733,7 +1733,7 @@ int xhci_bus_suspend(struct usb_hcd *hcd)
 		 * prevent suspend as port might be stuck
 		 */
 		if ((hcd->speed >= HCD_USB3) && retries-- &&
-		    (t1 & PORT_PLS_MASK) == XDEV_POLLING) {
+		    FIELD_GET(PORT_PLS_MASK, t1) == PLS_POLLING) {
 			spin_unlock_irqrestore(&xhci->lock, flags);
 			msleep(XHCI_PORT_POLLING_LFPS_TIME);
 			spin_lock_irqsave(&xhci->lock, flags);
@@ -1749,7 +1749,7 @@ int xhci_bus_suspend(struct usb_hcd *hcd)
 			return -EBUSY;
 		}
 		/* suspend ports in U0, or bail out for new connect changes */
-		if ((t1 & PORT_PE) && (t1 & PORT_PLS_MASK) == XDEV_U0) {
+		if ((t1 & PORT_PE) && FIELD_GET(PORT_PLS_MASK, t1) == PLS_U0) {
 			if ((t1 & PORT_CSC) && wake_enabled) {
 				bus_state->bus_suspended = 0;
 				spin_unlock_irqrestore(&xhci->lock, flags);
@@ -1758,8 +1758,8 @@ int xhci_bus_suspend(struct usb_hcd *hcd)
 			}
 			xhci_dbg(xhci, "port %d-%d not suspended\n",
 				 hcd->self.busnum, port_index + 1);
-			t2 &= ~PORT_PLS_MASK;
-			t2 |= PORT_LINK_STROBE | XDEV_U3;
+			FIELD_MODIFY(PORT_PLS_MASK, &t2, PLS_U3);
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
+	if (pls != PLS_POLLING && pls != PLS_COMP_MODE)
 		return false;
 
 	/* clear wakeup/change bits, and do a warm port reset */
@@ -1871,9 +1872,9 @@ int xhci_bus_resume(struct usb_hcd *hcd)
 
 	/* bus specific resume for ports we suspended at bus_suspend */
 	if (hcd->speed >= HCD_USB3) {
-		next_state = XDEV_U0;
+		next_state = PLS_U0;
 	} else {
-		next_state = XDEV_RESUME;
+		next_state = PLS_RESUME;
 		if (bus_state->bus_suspended) {
 			/*
 			 * prevent port event interrupts from interfering
@@ -1898,13 +1899,13 @@ int xhci_bus_resume(struct usb_hcd *hcd)
 		}
 		/* resume if we suspended the link, and it is still suspended */
 		if (test_bit(port_index, &bus_state->bus_suspended))
-			switch (portsc & PORT_PLS_MASK) {
-			case XDEV_U3:
+			switch (FIELD_GET(PORT_PLS_MASK, portsc)) {
+			case PLS_U3:
 				portsc = xhci_port_state_to_neutral(portsc);
-				portsc &= ~PORT_PLS_MASK;
-				portsc |= PORT_LINK_STROBE | next_state;
+				FIELD_MODIFY(PORT_PLS_MASK, &portsc, next_state);
+				portsc |= PORT_LINK_STROBE;
 				break;
-			case XDEV_RESUME:
+			case PLS_RESUME:
 				/* resume already initiated */
 				break;
 			default:
@@ -1930,7 +1931,7 @@ int xhci_bus_resume(struct usb_hcd *hcd)
 			/* Clear PLC to poll it later for U0 transition */
 			xhci_test_and_clear_bit(xhci, ports[port_index],
 						PORT_PLC);
-			xhci_set_link_state(xhci, ports[port_index], XDEV_U0);
+			xhci_set_link_state(xhci, ports[port_index], PLS_U0);
 		}
 	}
 
diff --git a/drivers/usb/host/xhci-pci.c b/drivers/usb/host/xhci-pci.c
index 039c26b241d0..080e74e91e66 100644
--- a/drivers/usb/host/xhci-pci.c
+++ b/drivers/usb/host/xhci-pci.c
@@ -911,7 +911,7 @@ static int xhci_pci_poweroff_late(struct usb_hcd *hcd, bool do_wakeup)
 		port = &xhci->hw_ports[i];
 		portsc = xhci_portsc_readl(port);
 
-		if ((portsc & PORT_PLS_MASK) != XDEV_U3)
+		if (FIELD_GET(PORT_PLS_MASK, portsc) != PLS_U3)
 			continue;
 
 		if (!port->slot_id || !xhci->devs[port->slot_id]) {
diff --git a/drivers/usb/host/xhci-port.h b/drivers/usb/host/xhci-port.h
index 12ff962cfea4..89bed19c3c65 100644
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
+ * PLS values 0-11 are defined in USB chaper 11.
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
+#define PLS_U0		0
+#define PLS_U1		1
+#define PLS_U2		2
+#define PLS_U3		3
+#define PLS_DISABLED	4
+#define PLS_RXDETECT	5
+#define PLS_INACTIVE	6
+#define PLS_POLLING	7
+#define PLS_RECOVERY	8
+#define PLS_HOT_RESET	9
+#define PLS_COMP_MODE	10
+#define PLS_TEST_MODE	11
+/* Values 12-14 are Reserved */
+#define PLS_RESUME	15
+/* bit 9 - Port Power (PP) */
 #define PORT_POWER	BIT(9)
 /*
  * bits 13:10 - Port Speed
diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
index f6f275f32f9e..64cd333d2483 100644
--- a/drivers/usb/host/xhci-ring.c
+++ b/drivers/usb/host/xhci-ring.c
@@ -1995,6 +1995,7 @@ static void handle_port_status(struct xhci_hcd *xhci, union xhci_trb *event)
 	struct usb_hcd *hcd;
 	u32 port_id;
 	u32 portsc, cmd_reg;
+	u32 pls;
 	unsigned int hcd_portnum;
 	struct xhci_bus_state *bus_state;
 	bool bogus_port_status = false;
@@ -2046,14 +2047,14 @@ static void handle_port_status(struct xhci_hcd *xhci, union xhci_trb *event)
 		usb_hcd_resume_root_hub(hcd);
 	}
 
-	if (vdev && (portsc & PORT_PLS_MASK) == XDEV_INACTIVE) {
+	if (vdev && FIELD_GET(PORT_PLS_MASK, portsc) == PLS_INACTIVE) {
 		if (!(portsc & PORT_RESET))
 			vdev->flags |= VDEV_PORT_ERROR;
 	} else if (vdev && portsc & PORT_RC) {
 		vdev->flags &= ~VDEV_PORT_ERROR;
 	}
 
-	if ((portsc & PORT_PLC) && (portsc & PORT_PLS_MASK) == XDEV_RESUME) {
+	if ((portsc & PORT_PLC) && FIELD_GET(PORT_PLS_MASK, portsc) == PLS_RESUME) {
 		xhci_dbg(xhci, "port resume event for port %d\n", port_id);
 
 		cmd_reg = readl(&xhci->op_regs->command);
@@ -2071,7 +2072,7 @@ static void handle_port_status(struct xhci_hcd *xhci, union xhci_trb *event)
 			bus_state->port_remote_wakeup |= 1 << hcd_portnum;
 			xhci_test_and_clear_bit(xhci, port, PORT_PLC);
 			usb_hcd_start_port_resume(&hcd->self, hcd_portnum);
-			xhci_set_link_state(xhci, port, XDEV_U0);
+			xhci_set_link_state(xhci, port, PLS_U0);
 			/* Need to wait until the next link state change
 			 * indicates the device is actually in U0.
 			 */
@@ -2094,10 +2095,9 @@ static void handle_port_status(struct xhci_hcd *xhci, union xhci_trb *event)
 		}
 	}
 
+	pls = FIELD_GET(PORT_PLS_MASK, portsc);
 	if ((portsc & PORT_PLC) && FIELD_GET(PORT_SPEED_MASK, portsc) >= PORT_SPEED_SS &&
-	    ((portsc & PORT_PLS_MASK) == XDEV_U0 ||
-	     (portsc & PORT_PLS_MASK) == XDEV_U1 ||
-	     (portsc & PORT_PLS_MASK) == XDEV_U2)) {
+	    (pls == PLS_U0 || pls == PLS_U1 || pls == PLS_U2)) {
 		xhci_dbg(xhci, "resume SS port %d finished\n", port_id);
 		complete(&port->u3exit_done);
 		/* We've just brought the device into U0/1/2 through either the
diff --git a/drivers/usb/host/xhci-tegra.c b/drivers/usb/host/xhci-tegra.c
index fb9620012cad..00552acf9d75 100644
--- a/drivers/usb/host/xhci-tegra.c
+++ b/drivers/usb/host/xhci-tegra.c
@@ -2037,7 +2037,7 @@ static bool xhci_hub_ports_suspended(struct xhci_hub *hub)
 		if ((value & PORT_PE) == 0)
 			continue;
 
-		if ((value & PORT_PLS_MASK) != XDEV_U3) {
+		if (FIELD_GET(PORT_PLS_MASK, value) != PLS_U3) {
 			dev_info(dev, "%u-%u isn't suspended: %#010x\n",
 				 hub->hcd->self.busnum, i + 1, value);
 			status = false;
@@ -2258,7 +2258,7 @@ static int tegra_xusb_enter_elpg(struct tegra_xusb *tegra, bool is_auto_resume)
 			continue;
 		portsc = xhci_portsc_readl(xhci->usb2_rhub.ports[i]);
 		tegra->lp0_utmi_pad_mask &= ~BIT(i);
-		if (((portsc & PORT_PLS_MASK) == XDEV_U3) ||
+		if ((FIELD_GET(PORT_PLS_MASK, portsc) == PLS_U3) ||
 		    (FIELD_GET(PORT_SPEED_MASK, portsc) == PORT_SPEED_FS))
 			tegra->lp0_utmi_pad_mask |= BIT(i);
 	}
@@ -2804,7 +2804,7 @@ static int tegra_xhci_hub_control(struct usb_hcd *hcd, u16 type_req, u16 value,
 			if (!test_bit(i, &bus_state->resuming_ports))
 				continue;
 			portsc = xhci_portsc_readl(ports[i]);
-			if ((portsc & PORT_PLS_MASK) == XDEV_RESUME)
+			if (FIELD_GET(PORT_PLS_MASK, portsc) == PLS_RESUME)
 				tegra_phy_xusb_utmi_pad_power_on(
 					tegra_xusb_get_phy(tegra, "usb2", (int) i));
 		}
diff --git a/drivers/usb/host/xhci.c b/drivers/usb/host/xhci.c
index f44ccee5fa07..eb0f65f8f32f 100644
--- a/drivers/usb/host/xhci.c
+++ b/drivers/usb/host/xhci.c
@@ -376,7 +376,7 @@ static void compliance_mode_recovery(struct timer_list *t)
 
 	for (i = 0; i < rhub->num_ports; i++) {
 		temp = xhci_portsc_readl(rhub->ports[i]);
-		if ((temp & PORT_PLS_MASK) == USB_SS_PORT_LS_COMP_MOD) {
+		if (FIELD_GET(PORT_PLS_MASK, temp) == PLS_COMP_MODE) {
 			/*
 			 * Compliance Mode Detected. Letting USB Core
 			 * handle the Warm Reset
@@ -928,7 +928,7 @@ static bool xhci_pending_portevent(struct xhci_hcd *xhci)
 	while (port_index--) {
 		portsc = xhci_portsc_readl(ports[port_index]);
 		if (portsc & PORT_CHANGE_MASK ||
-		    (portsc & PORT_PLS_MASK) == XDEV_RESUME)
+		    FIELD_GET(PORT_PLS_MASK, portsc) == PLS_RESUME)
 			return true;
 	}
 	port_index = xhci->usb3_rhub.num_ports;
@@ -936,7 +936,7 @@ static bool xhci_pending_portevent(struct xhci_hcd *xhci)
 	while (port_index--) {
 		portsc = xhci_portsc_readl(ports[port_index]);
 		if (portsc & (PORT_CHANGE_MASK | PORT_CAS) ||
-		    (portsc & PORT_PLS_MASK) == XDEV_RESUME)
+		    FIELD_GET(PORT_PLS_MASK, portsc) == PLS_RESUME)
 			return true;
 	}
 	return false;
@@ -4740,7 +4740,7 @@ static int xhci_set_usb2_hardware_lpm(struct usb_hcd *hcd,
 			spin_unlock_irqrestore(&xhci->lock, flags);
 			xhci_change_max_exit_latency(xhci, udev, 0);
 			readl_poll_timeout(&ports[port_num]->port_reg->portsc, pm_val,
-					   (pm_val & PORT_PLS_MASK) == XDEV_U0,
+					   (pm_val & PORT_PLS_MASK) == PLS_U0,
 					   100, 10000);
 			return 0;
 		}
diff --git a/drivers/usb/host/xhci.h b/drivers/usb/host/xhci.h
index 52be3a184838..cb935f5cfdcf 100644
--- a/drivers/usb/host/xhci.h
+++ b/drivers/usb/host/xhci.h
@@ -2374,32 +2374,32 @@ static inline const char *xhci_decode_slot_context(char *str,
 
 static inline const char *xhci_portsc_link_state_string(u32 portsc)
 {
-	switch (portsc & PORT_PLS_MASK) {
-	case XDEV_U0:
+	switch (FIELD_GET(PORT_PLS_MASK, portsc)) {
+	case PLS_U0:
 		return "U0";
-	case XDEV_U1:
+	case PLS_U1:
 		return "U1";
-	case XDEV_U2:
+	case PLS_U2:
 		return "U2";
-	case XDEV_U3:
+	case PLS_U3:
 		return "U3";
-	case XDEV_DISABLED:
+	case PLS_DISABLED:
 		return "Disabled";
-	case XDEV_RXDETECT:
+	case PLS_RXDETECT:
 		return "RxDetect";
-	case XDEV_INACTIVE:
+	case PLS_INACTIVE:
 		return "Inactive";
-	case XDEV_POLLING:
+	case PLS_POLLING:
 		return "Polling";
-	case XDEV_RECOVERY:
+	case PLS_RECOVERY:
 		return "Recovery";
-	case XDEV_HOT_RESET:
+	case PLS_HOT_RESET:
 		return "Hot Reset";
-	case XDEV_COMP_MODE:
+	case PLS_COMP_MODE:
 		return "Compliance mode";
-	case XDEV_TEST_MODE:
+	case PLS_TEST_MODE:
 		return "Test mode";
-	case XDEV_RESUME:
+	case PLS_RESUME:
 		return "Resume";
 	default:
 		break;
-- 
2.50.1


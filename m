Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FEF550C280
	for <linux-usb@vger.kernel.org>; Wed, 16 Sep 2026 14:15:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789568161; cv=none; b=TavbQtR8phhkc0IGlhZocKMM6qjDR/nMebkDrGG06Q+kPwaOy67KIOrh8WP8SPvJO1+nPTgsqLTZoHDiYGUt6sBM62sxZ1ny3OY870sTajoz27AJEGqDm2tHtnaQLfNv5DVrfaSbLEJ32s109qVXlN5yYenbWCpoOJ86pH8qo3s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789568161; c=relaxed/simple;
	bh=d3psX5I3ZNRxdz8meBDdfx0I8lfMZFfXKT+dY9agf5g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sy6g+h4TFrlxSBw9gE+KrFNgh36EErc/C0hM1ege0sxp5d2c5EJq+bpYgnQN5n+vyGg2oVRvAn+nB0YFxwAGZeCLbVk7ABo4A0tuz6eGjnnKCw1o44jjK25WQ4T15wpoBrSlRpTAQkV1RFcH2fE/+m67HaWQcRwl+c0fuRNPl8k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NFHhgvJB; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NFHhgvJB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789568159; x=1821104159;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=d3psX5I3ZNRxdz8meBDdfx0I8lfMZFfXKT+dY9agf5g=;
  b=NFHhgvJBNdz0Lkd+IHxzVs0X/YMxCUP7ZppHfam6FlrvaCgznM1S2DdM
   cGO3tLEgBUZiNH3ONUiXq4zp7RIpE725GJs052UoBc4PyHpWFXTCJop0j
   RIghmLmkQAxWBmbUTME0XF3FG51CfzytBPbBZ+z7Bfm5qlM5GOH/2JAWr
   aT51cRXFqxhPWrGGYY1vgjp9JUs8u3ZEfccXptdK4YM8HIiOkAtND9cA3
   HqBKhIY1NYTwdrZi2sBBULJzkCB482Bwurx/1ipkFg9LQmdo6oeybm3YA
   0Sfst6uzkbpDmi4+Ifr/US15lxN6te68G+9D8ON9qeeU34XtpBUth6BU2
   A==;
X-CSE-ConnectionGUID: 9s5TObGaSNyZsS4CuxMFLw==
X-CSE-MsgGUID: kgDz0haJQ0eH0+nGiyZ/wA==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="89967271"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="89967271"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2026 07:15:59 -0700
X-CSE-ConnectionGUID: DpvU8iMwSvOVyqVk6timXA==
X-CSE-MsgGUID: AbDxS2lNSw6NgbuUMv41cA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="270720124"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa008.fm.intel.com with ESMTP; 16 Sep 2026 07:15:57 -0700
Received: by black.igk.intel.com (Postfix, from userid 1058)
	id 8B06399; Wed, 16 Sep 2026 16:15:56 +0200 (CEST)
From: Niklas Neronin <niklas.neronin@linux.intel.com>
To: mathias.nyman@linux.intel.com
Cc: linux-usb@vger.kernel.org,
	Niklas Neronin <niklas.neronin@linux.intel.com>
Subject: [PATCH v2 04/20] usb: xhci: replace old Port macro prefix
Date: Wed, 16 Sep 2026 16:13:53 +0200
Message-ID: <20260916141409.629621-5-niklas.neronin@linux.intel.com>
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

Replace prefix 'DEV_' and 'XDEV_' with 'PORT_', which better describes
the macro. This affects Port Link State (PLS) and Port Speed.
No functional change intended.
Verified identical object code before and after the renaming by
comparing objdump -dr output.

No functional change intended.

Signed-off-by: Niklas Neronin <niklas.neronin@linux.intel.com>
---
 drivers/usb/host/xhci-debugfs.c | 10 ++--
 drivers/usb/host/xhci-hub.c     | 94 ++++++++++++++++-----------------
 drivers/usb/host/xhci-pci.c     |  2 +-
 drivers/usb/host/xhci-port.h    | 38 ++++++-------
 drivers/usb/host/xhci-ring.c    | 12 ++---
 drivers/usb/host/xhci-tegra.c   | 18 +++----
 drivers/usb/host/xhci.c         |  8 +--
 drivers/usb/host/xhci.h         | 38 ++++++-------
 8 files changed, 110 insertions(+), 110 deletions(-)

diff --git a/drivers/usb/host/xhci-debugfs.c b/drivers/usb/host/xhci-debugfs.c
index b7095b2817d5..e61ee722e2cd 100644
--- a/drivers/usb/host/xhci-debugfs.c
+++ b/drivers/usb/host/xhci-debugfs.c
@@ -361,12 +361,12 @@ static ssize_t xhci_port_write(struct file *file,  const char __user *ubuf,
 		spin_lock_irqsave(&xhci->lock, flags);
 		/* compliance mode can only be enabled on ports in RxDetect */
 		portsc = xhci_portsc_readl(port);
-		if (FIELD_GET(PORT_PLS_MASK, portsc) != XDEV_RXDETECT) {
+		if (FIELD_GET(PORT_PLS_MASK, portsc) != PLS_RXDETECT) {
 			spin_unlock_irqrestore(&xhci->lock, flags);
 			return -EPERM;
 		}
 		portsc = xhci_port_state_to_neutral(portsc);
-		FIELD_MODIFY(PORT_PLS_MASK, &portsc, XDEV_COMP_MODE);
+		FIELD_MODIFY(PORT_PLS_MASK, &portsc, PLS_COMP_MODE);
 		portsc |= PORT_LINK_STROBE;
 		xhci_portsc_writel(port, portsc);
 		spin_unlock_irqrestore(&xhci->lock, flags);
@@ -715,7 +715,7 @@ static int xhci_ss_bw_show(struct seq_file *s, void *unused)
 	int ret;
 	struct xhci_hcd		*xhci = (struct xhci_hcd *)s->private;
 
-	ret = xhci_port_bw_show(xhci, XDEV_SS, s);
+	ret = xhci_port_bw_show(xhci, PORT_SPEED_SS, s);
 	return ret;
 }
 
@@ -724,7 +724,7 @@ static int xhci_hs_bw_show(struct seq_file *s, void *unused)
 	int ret;
 	struct xhci_hcd		*xhci = (struct xhci_hcd *)s->private;
 
-	ret = xhci_port_bw_show(xhci, XDEV_HS, s);
+	ret = xhci_port_bw_show(xhci, PORT_SPEED_HS, s);
 	return ret;
 }
 
@@ -733,7 +733,7 @@ static int xhci_fs_bw_show(struct seq_file *s, void *unused)
 	int ret;
 	struct xhci_hcd		*xhci = (struct xhci_hcd *)s->private;
 
-	ret = xhci_port_bw_show(xhci, XDEV_FS, s);
+	ret = xhci_port_bw_show(xhci, PORT_SPEED_FS, s);
 	return ret;
 }
 
diff --git a/drivers/usb/host/xhci-hub.c b/drivers/usb/host/xhci-hub.c
index ca9df914bce8..d464f261284d 100644
--- a/drivers/usb/host/xhci-hub.c
+++ b/drivers/usb/host/xhci-hub.c
@@ -376,11 +376,11 @@ static void xhci_hub_descriptor(struct usb_hcd *hcd, struct xhci_hcd *xhci,
 
 static unsigned int xhci_port_speed(int portsc)
 {
-	u32 port_speed = FIELD_GET(DEV_SPEED_MASK, portsc);
+	u32 port_speed = FIELD_GET(PORT_SPEED_MASK, portsc);
 
-	if (port_speed == XDEV_LS)
+	if (port_speed == PORT_SPEED_LS)
 		return USB_PORT_STAT_LOW_SPEED;
-	if (port_speed == XDEV_HS)
+	if (port_speed == PORT_SPEED_HS)
 		return USB_PORT_STAT_HIGH_SPEED;
 	/*
 	 * FIXME: Yes, we should check for full speed, but the core uses that as
@@ -864,18 +864,18 @@ static void xhci_hub_report_usb3_link_state(struct xhci_hcd *xhci, u32 *status,
 		 * If not already in Compliance or Inactive state,
 		 * report Compliance Mode so the hub logic triggers a warm reset.
 		 */
-		if (pls != XDEV_COMP_MODE && pls != XDEV_INACTIVE)
-			pls = XDEV_COMP_MODE;
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
-		pls = XDEV_U3;
-	} else if (pls == XDEV_COMP_MODE) {
+		pls = PLS_U3;
+	} else if (pls == PLS_COMP_MODE) {
 		/*
 		 * Some hardware may enter Compliance Mode without CAS.
 		 * Fake a connection event so usbcore notices and resets the port.
@@ -898,7 +898,7 @@ static void xhci_hub_report_usb3_link_state(struct xhci_hcd *xhci, u32 *status,
 static void xhci_del_comp_mod_timer(struct xhci_hcd *xhci, u32 portsc, int portnum)
 {
 	u32 all_ports_seen_u0 = ((1 << xhci->usb3_rhub.num_ports) - 1);
-	bool port_in_u0 = (FIELD_GET(PORT_PLS_MASK, portsc) == XDEV_U0);
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
@@ -1009,7 +1009,7 @@ static u32 xhci_get_ext_port_status(u32 portsc, u32 port_li)
 	int speed_id;
 
 	/* only support rx and tx lane counts of 1 in usb3.1 spec */
-	speed_id = FIELD_GET(DEV_SPEED_MASK, portsc);
+	speed_id = FIELD_GET(PORT_SPEED_MASK, portsc);
 	ext_stat |= speed_id;		/* bits 3:0, RX speed id */
 	ext_stat |= speed_id << 4;	/* bits 7:4, TX speed id */
 
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
-			if (FIELD_GET(PORT_PLS_MASK, portsc) != XDEV_U0) {
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
-			    FIELD_GET(PORT_PLS_MASK, portsc) >= XDEV_U3) {
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
-				xhci_set_link_state(xhci, port, XDEV_RXDETECT);
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
@@ -1410,18 +1410,18 @@ int xhci_hub_control(struct usb_hcd *hcd, u16 typeReq, u16 wValue,
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
+					xhci_set_link_state(xhci, port, PLS_U0);
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
-					if (FIELD_GET(PORT_PLS_MASK, portsc) == XDEV_U3)
+					if (FIELD_GET(PORT_PLS_MASK, portsc) == PLS_U3)
 						break;
 				}
 				spin_lock_irqsave(&xhci->lock, flags);
@@ -1545,17 +1545,17 @@ int xhci_hub_control(struct usb_hcd *hcd, u16 typeReq, u16 wValue,
 			xhci_dbg(xhci, "PORTSC %04x\n", portsc);
 			if (portsc & PORT_RESET)
 				goto error;
-			if (FIELD_GET(PORT_PLS_MASK, portsc) == XDEV_U3) {
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
-		    FIELD_GET(PORT_PLS_MASK, t1) == XDEV_POLLING) {
+		    FIELD_GET(PORT_PLS_MASK, t1) == PLS_POLLING) {
 			spin_unlock_irqrestore(&xhci->lock, flags);
 			msleep(XHCI_PORT_POLLING_LFPS_TIME);
 			spin_lock_irqsave(&xhci->lock, flags);
@@ -1749,7 +1749,7 @@ int xhci_bus_suspend(struct usb_hcd *hcd)
 			return -EBUSY;
 		}
 		/* suspend ports in U0, or bail out for new connect changes */
-		if ((t1 & PORT_PE) && FIELD_GET(PORT_PLS_MASK, t1) == XDEV_U0) {
+		if ((t1 & PORT_PE) && FIELD_GET(PORT_PLS_MASK, t1) == PLS_U0) {
 			if ((t1 & PORT_CSC) && wake_enabled) {
 				bus_state->bus_suspended = 0;
 				spin_unlock_irqrestore(&xhci->lock, flags);
@@ -1758,7 +1758,7 @@ int xhci_bus_suspend(struct usb_hcd *hcd)
 			}
 			xhci_dbg(xhci, "port %d-%d not suspended\n",
 				 hcd->self.busnum, port_index + 1);
-			FIELD_MODIFY(PORT_PLS_MASK, &t2, XDEV_U3);
+			FIELD_MODIFY(PORT_PLS_MASK, &t2, PLS_U3);
 			t2 |= PORT_LINK_STROBE;
 			set_bit(port_index, &bus_state->bus_suspended);
 		}
@@ -1831,7 +1831,7 @@ static bool xhci_port_missing_cas_quirk(struct xhci_port *port)
 		return false;
 
 	pls = FIELD_GET(PORT_PLS_MASK, portsc);
-	if (pls != XDEV_POLLING && pls != XDEV_COMP_MODE)
+	if (pls != PLS_POLLING && pls != PLS_COMP_MODE)
 		return false;
 
 	/* clear wakeup/change bits, and do a warm port reset */
@@ -1872,9 +1872,9 @@ int xhci_bus_resume(struct usb_hcd *hcd)
 
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
@@ -1900,12 +1900,12 @@ int xhci_bus_resume(struct usb_hcd *hcd)
 		/* resume if we suspended the link, and it is still suspended */
 		if (test_bit(port_index, &bus_state->bus_suspended))
 			switch (FIELD_GET(PORT_PLS_MASK, portsc)) {
-			case XDEV_U3:
+			case PLS_U3:
 				portsc = xhci_port_state_to_neutral(portsc);
 				FIELD_MODIFY(PORT_PLS_MASK, &portsc, next_state);
 				portsc |= PORT_LINK_STROBE;
 				break;
-			case XDEV_RESUME:
+			case PLS_RESUME:
 				/* resume already initiated */
 				break;
 			default:
@@ -1931,7 +1931,7 @@ int xhci_bus_resume(struct usb_hcd *hcd)
 			/* Clear PLC to poll it later for U0 transition */
 			xhci_test_and_clear_bit(xhci, ports[port_index],
 						PORT_PLC);
-			xhci_set_link_state(xhci, ports[port_index], XDEV_U0);
+			xhci_set_link_state(xhci, ports[port_index], PLS_U0);
 		}
 	}
 
diff --git a/drivers/usb/host/xhci-pci.c b/drivers/usb/host/xhci-pci.c
index c7b79c5daa53..a63f85961700 100644
--- a/drivers/usb/host/xhci-pci.c
+++ b/drivers/usb/host/xhci-pci.c
@@ -914,7 +914,7 @@ static int xhci_pci_poweroff_late(struct usb_hcd *hcd, bool do_wakeup)
 		port = &xhci->hw_ports[i];
 		portsc = xhci_portsc_readl(port);
 
-		if (FIELD_GET(PORT_PLS_MASK, portsc) != XDEV_U3)
+		if (FIELD_GET(PORT_PLS_MASK, portsc) != PLS_U3)
 			continue;
 
 		if (!port->slot_id || !xhci->devs[port->slot_id]) {
diff --git a/drivers/usb/host/xhci-port.h b/drivers/usb/host/xhci-port.h
index 51fe4cc14d74..752f33e35bf5 100644
--- a/drivers/usb/host/xhci-port.h
+++ b/drivers/usb/host/xhci-port.h
@@ -20,20 +20,20 @@
  * PLS values 0-11 are defined in USB chapter 11.
  */
 #define PORT_PLS_MASK	GENMASK(8, 5)
-#define XDEV_U0		0
-#define XDEV_U1		1
-#define XDEV_U2		2
-#define XDEV_U3		3
-#define XDEV_DISABLED	4
-#define XDEV_RXDETECT	5
-#define XDEV_INACTIVE	6
-#define XDEV_POLLING	7
-#define XDEV_RECOVERY	8
-#define XDEV_HOT_RESET	9
-#define XDEV_COMP_MODE	10
-#define XDEV_TEST_MODE	11
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
 /* Values 12-14 are Reserved */
-#define XDEV_RESUME	15
+#define PLS_RESUME	15
 /* bit 9 - Port Power (PP) */
 #define PORT_POWER	BIT(9)
 /*
@@ -49,12 +49,12 @@
  * 7 - SuperSpeed Gen2 x2
  * 8-15 Reserved
  */
-#define DEV_SPEED_MASK	GENMASK(13, 10)
-#define	XDEV_FS		1
-#define	XDEV_LS		2
-#define	XDEV_HS		3
-#define	XDEV_SS		4
-#define	XDEV_SSP	5
+#define PORT_SPEED_MASK	GENMASK(13, 10)
+#define	PORT_SPEED_FS	1
+#define	PORT_SPEED_LS	2
+#define	PORT_SPEED_HS	3
+#define	PORT_SPEED_SS	4
+#define	PORT_SPEED_SSP	5
 
 /* Port Indicator Control */
 #define PORT_LED_OFF	(0 << 14)
diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
index de6cf2026b82..7ea79501c035 100644
--- a/drivers/usb/host/xhci-ring.c
+++ b/drivers/usb/host/xhci-ring.c
@@ -2062,12 +2062,12 @@ static void handle_port_status(struct xhci_hcd *xhci, union xhci_trb *event)
 	 * Link status is not relible while port is in reset.
 	 */
 	if (!(portsc & PORT_RESET)) {
-		port->link_inactive = (pls == XDEV_INACTIVE);
+		port->link_inactive = (pls == PLS_INACTIVE);
 		port->connected = !!(portsc & PORT_CONNECT);
 	}
 
 	pls = FIELD_GET(PORT_PLS_MASK, portsc);
-	if ((portsc & PORT_PLC) && pls == XDEV_RESUME) {
+	if ((portsc & PORT_PLC) && pls == PLS_RESUME) {
 		xhci_dbg(xhci, "port resume event for port %d\n", port_id);
 
 		cmd_reg = readl(&xhci->op_regs->command);
@@ -2076,7 +2076,7 @@ static void handle_port_status(struct xhci_hcd *xhci, union xhci_trb *event)
 			goto cleanup;
 		}
 
-		if (FIELD_GET(DEV_SPEED_MASK, portsc) >= XDEV_SS) {
+		if (FIELD_GET(PORT_SPEED_MASK, portsc) >= PORT_SPEED_SS) {
 			xhci_dbg(xhci, "remote wake SS port %d\n", port_id);
 			/* Set a flag to say the port signaled remote wakeup,
 			 * so we can tell the difference between the end of
@@ -2085,7 +2085,7 @@ static void handle_port_status(struct xhci_hcd *xhci, union xhci_trb *event)
 			bus_state->port_remote_wakeup |= 1 << hcd_portnum;
 			xhci_test_and_clear_bit(xhci, port, PORT_PLC);
 			usb_hcd_start_port_resume(&hcd->self, hcd_portnum);
-			xhci_set_link_state(xhci, port, XDEV_U0);
+			xhci_set_link_state(xhci, port, PLS_U0);
 			/* Need to wait until the next link state change
 			 * indicates the device is actually in U0.
 			 */
@@ -2109,8 +2109,8 @@ static void handle_port_status(struct xhci_hcd *xhci, union xhci_trb *event)
 	}
 
 	pls = FIELD_GET(PORT_PLS_MASK, portsc);
-	if ((portsc & PORT_PLC) && pls <= XDEV_U2 &&
-	    FIELD_GET(DEV_SPEED_MASK, portsc) >= XDEV_SS) {
+	if ((portsc & PORT_PLC) && pls <= PLS_U2 &&
+	    FIELD_GET(PORT_SPEED_MASK, portsc) >= PORT_SPEED_SS) {
 		xhci_dbg(xhci, "resume SS port %d finished\n", port_id);
 		complete(&port->u3exit_done);
 		/* We've just brought the device into U0/1/2 through either the
diff --git a/drivers/usb/host/xhci-tegra.c b/drivers/usb/host/xhci-tegra.c
index cd646f6bbe04..6a8fb386c2d8 100644
--- a/drivers/usb/host/xhci-tegra.c
+++ b/drivers/usb/host/xhci-tegra.c
@@ -2037,7 +2037,7 @@ static bool xhci_hub_ports_suspended(struct xhci_hub *hub)
 		if ((value & PORT_PE) == 0)
 			continue;
 
-		if (FIELD_GET(PORT_PLS_MASK, value) != XDEV_U3) {
+		if (FIELD_GET(PORT_PLS_MASK, value) != PLS_U3) {
 			dev_info(dev, "%u-%u isn't suspended: %#010x\n",
 				 hub->hcd->self.busnum, i + 1, value);
 			status = false;
@@ -2108,18 +2108,18 @@ static void tegra_xusb_restore_context(struct tegra_xusb *tegra)
 
 static enum usb_device_speed tegra_xhci_portsc_to_speed(struct tegra_xusb *tegra, u32 portsc)
 {
-	u32 port_speed = FIELD_GET(DEV_SPEED_MASK, portsc);
+	u32 port_speed = FIELD_GET(PORT_SPEED_MASK, portsc);
 
-	if (port_speed == XDEV_LS)
+	if (port_speed == PORT_SPEED_LS)
 		return USB_SPEED_LOW;
 
-	if (port_speed == XDEV_HS)
+	if (port_speed == PORT_SPEED_HS)
 		return USB_SPEED_HIGH;
 
-	if (port_speed == XDEV_FS)
+	if (port_speed == PORT_SPEED_FS)
 		return USB_SPEED_FULL;
 
-	if (port_speed >= XDEV_SS)
+	if (port_speed >= PORT_SPEED_SS)
 		return USB_SPEED_SUPER;
 
 	return USB_SPEED_UNKNOWN;
@@ -2258,8 +2258,8 @@ static int tegra_xusb_enter_elpg(struct tegra_xusb *tegra, bool is_auto_resume)
 			continue;
 		portsc = xhci_portsc_readl(xhci->usb2_rhub.ports[i]);
 		tegra->lp0_utmi_pad_mask &= ~BIT(i);
-		if ((FIELD_GET(PORT_PLS_MASK, portsc) == XDEV_U3) ||
-		    (FIELD_GET(DEV_SPEED_MASK, portsc) == XDEV_FS))
+		if ((FIELD_GET(PORT_PLS_MASK, portsc) == PLS_U3) ||
+		    (FIELD_GET(PORT_SPEED_MASK, portsc) == PORT_SPEED_FS))
 			tegra->lp0_utmi_pad_mask |= BIT(i);
 	}
 
@@ -2804,7 +2804,7 @@ static int tegra_xhci_hub_control(struct usb_hcd *hcd, u16 type_req, u16 value,
 			if (!test_bit(i, &bus_state->resuming_ports))
 				continue;
 			portsc = xhci_portsc_readl(ports[i]);
-			if (FIELD_GET(PORT_PLS_MASK, portsc) == XDEV_RESUME)
+			if (FIELD_GET(PORT_PLS_MASK, portsc) == PLS_RESUME)
 				tegra_phy_xusb_utmi_pad_power_on(
 					tegra_xusb_get_phy(tegra, "usb2", (int) i));
 		}
diff --git a/drivers/usb/host/xhci.c b/drivers/usb/host/xhci.c
index 4acffe73d00d..cab7bae3ecc3 100644
--- a/drivers/usb/host/xhci.c
+++ b/drivers/usb/host/xhci.c
@@ -377,7 +377,7 @@ static void compliance_mode_recovery(struct timer_list *t)
 
 	for (i = 0; i < rhub->num_ports; i++) {
 		temp = xhci_portsc_readl(rhub->ports[i]);
-		if (FIELD_GET(PORT_PLS_MASK, temp) == XDEV_COMP_MODE) {
+		if (FIELD_GET(PORT_PLS_MASK, temp) == PLS_COMP_MODE) {
 			/*
 			 * Compliance Mode Detected. Letting USB Core
 			 * handle the Warm Reset
@@ -929,7 +929,7 @@ static bool xhci_pending_portevent(struct xhci_hcd *xhci)
 	while (port_index--) {
 		portsc = xhci_portsc_readl(ports[port_index]);
 		if (portsc & PORT_CHANGE_MASK ||
-		    FIELD_GET(PORT_PLS_MASK, portsc) == XDEV_RESUME)
+		    FIELD_GET(PORT_PLS_MASK, portsc) == PLS_RESUME)
 			return true;
 	}
 	port_index = xhci->usb3_rhub.num_ports;
@@ -937,7 +937,7 @@ static bool xhci_pending_portevent(struct xhci_hcd *xhci)
 	while (port_index--) {
 		portsc = xhci_portsc_readl(ports[port_index]);
 		if (portsc & (PORT_CHANGE_MASK | PORT_CAS) ||
-		    FIELD_GET(PORT_PLS_MASK, portsc) == XDEV_RESUME)
+		    FIELD_GET(PORT_PLS_MASK, portsc) == PLS_RESUME)
 			return true;
 	}
 	return false;
@@ -4742,7 +4742,7 @@ static int xhci_set_usb2_hardware_lpm(struct usb_hcd *hcd,
 			spin_unlock_irqrestore(&xhci->lock, flags);
 			xhci_change_max_exit_latency(xhci, udev, 0);
 			readl_poll_timeout(&ports[port_num]->port_reg->portsc, pm_val,
-					   (pm_val & PORT_PLS_MASK) == XDEV_U0,
+					   (pm_val & PORT_PLS_MASK) == PLS_U0,
 					   100, 10000);
 			return 0;
 		}
diff --git a/drivers/usb/host/xhci.h b/drivers/usb/host/xhci.h
index 9c6c36870fb6..758155a772cc 100644
--- a/drivers/usb/host/xhci.h
+++ b/drivers/usb/host/xhci.h
@@ -367,11 +367,11 @@ struct xhci_slot_ctx {
  */
 #define DEV_SPEED	(0xf << 20)
 #define GET_DEV_SPEED(n) (((n) & DEV_SPEED) >> 20)
-#define	SLOT_SPEED_FS		(XDEV_FS << 20)
-#define	SLOT_SPEED_LS		(XDEV_LS << 20)
-#define	SLOT_SPEED_HS		(XDEV_HS << 20)
-#define	SLOT_SPEED_SS		(XDEV_SS << 20)
-#define	SLOT_SPEED_SSP		(XDEV_SSP << 20)
+#define	SLOT_SPEED_FS		(PORT_SPEED_FS << 20)
+#define	SLOT_SPEED_LS		(PORT_SPEED_LS << 20)
+#define	SLOT_SPEED_HS		(PORT_SPEED_HS << 20)
+#define	SLOT_SPEED_SS		(PORT_SPEED_SS << 20)
+#define	SLOT_SPEED_SSP		(PORT_SPEED_SSP << 20)
 /* bit 24 reserved */
 /* Is this LS/FS device connected through a HS hub? - bit 25 */
 #define DEV_MTT		BIT(25)
@@ -2375,31 +2375,31 @@ static inline const char *xhci_decode_slot_context(char *str,
 static inline const char *xhci_portsc_link_state_string(u32 portsc)
 {
 	switch (FIELD_GET(PORT_PLS_MASK, portsc)) {
-	case XDEV_U0:
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
@@ -2416,7 +2416,7 @@ static inline const char *xhci_decode_portsc(char *str, u32 portsc)
 	if (portsc == ~(u32)0)
 		return str;
 
-	ret += sprintf(str + ret, "Speed=%ld ", FIELD_GET(DEV_SPEED_MASK, portsc));
+	ret += sprintf(str + ret, "Speed=%ld ", FIELD_GET(PORT_SPEED_MASK, portsc));
 	ret += sprintf(str + ret, "Link=%s ", xhci_portsc_link_state_string(portsc));
 
 	/* RO/ROS: Read-only */
-- 
2.50.1


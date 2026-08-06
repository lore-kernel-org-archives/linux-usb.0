Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79E54448CE0
	for <linux-usb@vger.kernel.org>; Thu,  6 Aug 2026 14:21:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786026100; cv=none; b=kLdM3+u1WmQBQxFIb9oXAcyqOo9FKG3V0hbk51SNZs01GdtNbfOg9Vhm7A9g6yi2Lw9gtI6DtTZK6lxzdAyX/WmjrufEMJtMy7mWTvPKB76c8sl2BjuVrbVYuBUBp56A7l7nW9+NDsUxBI0LlKaNkbpLeSHvY4rkB0WEjx76T74=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786026100; c=relaxed/simple;
	bh=5NStuepKO0w8fKZL86Pm0pMRJLsHrGLTaNpF3SsmlaQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=H50F2kpt0qefZxGNfEKydNq3WrgAdBcfX7HkpY14TiF1aHftfe5sdiqmcYOdl9ELyfWQ2zr4ufQH8XaYW0mMawXwvUL5WJG/SJ+EPFDjQtEetWP1KvFcFCX7PJAdC2bg7gGx3aZaWsz0n8J1b6u+eFiu3uSUbibYL2v+mvq5egY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MtCTcehx; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MtCTcehx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786026096; x=1817562096;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=5NStuepKO0w8fKZL86Pm0pMRJLsHrGLTaNpF3SsmlaQ=;
  b=MtCTcehx9OETKRi19P55oNMNv39oBq9TR1zQhALehN1KHXzNtfsK7vY0
   hQkaOMVbmnfIV3onpqPOvIBb2ASVr2E1/P9BCIcT+nxBKGWH2BltF0gFM
   Mn1SagVPs32FUGTSPLkfp3hoydlX17Nf40aHmfAKEya3eXiu/uHlEgkBf
   yk3hx91RpJa1uliyAQ0f0fX1NnqGMEvvszR69c60Xzx19dC95dgSTyTW8
   3ysZinpD5Wm6MhnhgEXOoM35XsEUOnu7R/qvqV6nn5pGL6pbhBY0hMPj4
   tH5FsJMvpoek9DKlUdVd/Ednp0w7q45PbeE6nT+DIgo2/xxazKucFQIcH
   w==;
X-CSE-ConnectionGUID: cn97cDAARWSosHdesCrv/w==
X-CSE-MsgGUID: +47UmMFzRCG1196XlMMj6g==
X-IronPort-AV: E=McAfee;i="6800,10657,11867"; a="97268136"
X-IronPort-AV: E=Sophos;i="6.25,208,1779174000"; 
   d="scan'208";a="97268136"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Aug 2026 07:21:31 -0700
X-CSE-ConnectionGUID: EfhQAZ12Tcq0GWBBChimKw==
X-CSE-MsgGUID: P/PBu7Q8SluP8S9Ex/WmnQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,208,1779174000"; 
   d="scan'208";a="285500348"
Received: from amilburn-desk.amilburn-desk (HELO mnyman-desk.home) ([10.245.244.235])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Aug 2026 07:21:30 -0700
From: Mathias Nyman <mathias.nyman@linux.intel.com>
To: <gregkh@linuxfoundation.org>
Cc: <linux-usb@vger.kernel.org>,
	Mathias Nyman <mathias.nyman@linux.intel.com>,
	Xu Rao <raoxu@uniontech.com>
Subject: [PATCH 03/17] xhci: include all root port children in recovery prevention on link error
Date: Thu,  6 Aug 2026 17:20:59 +0300
Message-ID: <20260806142113.2436238-4-mathias.nyman@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260806142113.2436238-1-mathias.nyman@linux.intel.com>
References: <20260806142113.2436238-1-mathias.nyman@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Driver already prevents useless transfer retry and endpoint recovery
for devices directly connected to a root port with link errors.

These devices are either disconnecting or will be reset. Link is gone.

Move the flag indicating link error from the xhci device structure to
the root port strucure, allowing all child devices behind hubs to easily
check for root port link errors, avoiding useless transfer retries and
endpoint recovery.

This extends the previous endpoint recovery prevention in
commit b8c3b718087b ("usb: xhci: Don't try to recover an endpoint if port
is in error state.")
Only root port link errors can be detected early by xhci driver,
not link errors between external hubs and their children.

Tested-by: Xu Rao <raoxu@uniontech.com>
Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
---
 drivers/usb/host/xhci-ring.c | 27 +++++++++++++++------------
 drivers/usb/host/xhci.c      |  4 +---
 drivers/usb/host/xhci.h      |  9 +--------
 3 files changed, 17 insertions(+), 23 deletions(-)

diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
index 3ab0d1b68d85..544749b607a4 100644
--- a/drivers/usb/host/xhci-ring.c
+++ b/drivers/usb/host/xhci-ring.c
@@ -993,7 +993,7 @@ static int xhci_handle_halted_endpoint(struct xhci_hcd *xhci,
 	 * Avoid resetting endpoint if link is inactive. Can cause host hang.
 	 * Device will be reset soon to recover the link so don't do anything
 	 */
-	if (ep->vdev->flags & VDEV_PORT_ERROR)
+	if (ep->vdev->rhub_port->link_inactive)
 		return -ENODEV;
 
 	/* add td to cancelled list and let reset ep handler take care of it */
@@ -1992,13 +1992,15 @@ static void xhci_cavium_reset_phy_quirk(struct xhci_hcd *xhci)
 static void handle_port_status(struct xhci_hcd *xhci, union xhci_trb *event)
 {
 	struct xhci_virt_device *vdev = NULL;
-	struct usb_hcd *hcd;
-	u32 port_id;
-	u32 portsc, cmd_reg;
-	unsigned int hcd_portnum;
 	struct xhci_bus_state *bus_state;
-	bool bogus_port_status = false;
 	struct xhci_port *port;
+	struct usb_hcd *hcd;
+	bool bogus_port_status = false;
+	unsigned int hcd_portnum;
+	u32 cmd_reg;
+	u32 port_id;
+	u32 portsc;
+	u32 pls;
 
 	/* Port status change events always have a successful completion code */
 	if (GET_COMP_CODE(le32_to_cpu(event->generic.field[2])) != COMP_SUCCESS)
@@ -2035,6 +2037,7 @@ static void handle_port_status(struct xhci_hcd *xhci, union xhci_trb *event)
 	bus_state = &port->rhub->bus_state;
 	hcd_portnum = port->hcd_portnum;
 	portsc = xhci_portsc_readl(port);
+	pls = portsc & PORT_PLS_MASK;
 
 	xhci_dbg(xhci, "Port change event, %d-%d, id %d, portsc: 0x%x\n",
 		 hcd->self.busnum, hcd_portnum + 1, port_id, portsc);
@@ -2046,12 +2049,12 @@ static void handle_port_status(struct xhci_hcd *xhci, union xhci_trb *event)
 		usb_hcd_resume_root_hub(hcd);
 	}
 
-	if (vdev && (portsc & PORT_PLS_MASK) == XDEV_INACTIVE) {
-		if (!(portsc & PORT_RESET))
-			vdev->flags |= VDEV_PORT_ERROR;
-	} else if (vdev && portsc & PORT_RC) {
-		vdev->flags &= ~VDEV_PORT_ERROR;
-	}
+	/*
+	 * Tag broken links to avoid retries while hub driver sorts it out.
+	 * Link status is not relible while port is in reset.
+	 */
+	if (!(portsc & PORT_RESET))
+		port->link_inactive = (pls == XDEV_INACTIVE);
 
 	if ((portsc & PORT_PLC) && (portsc & PORT_PLS_MASK) == XDEV_RESUME) {
 		xhci_dbg(xhci, "port resume event for port %d\n", port_id);
diff --git a/drivers/usb/host/xhci.c b/drivers/usb/host/xhci.c
index 091c82ca8ee2..6f830a43963f 100644
--- a/drivers/usb/host/xhci.c
+++ b/drivers/usb/host/xhci.c
@@ -1664,7 +1664,7 @@ static int xhci_urb_enqueue(struct usb_hcd *hcd, struct urb *urb, gfp_t mem_flag
 		goto free_priv;
 	}
 
-	if (xhci->devs[slot_id]->flags & VDEV_PORT_ERROR) {
+	if (xhci->devs[slot_id]->rhub_port->link_inactive) {
 		xhci_dbg(xhci, "Can't queue urb, port error, link inactive\n");
 		ret = -ENODEV;
 		goto free_priv;
@@ -4035,7 +4035,6 @@ static int xhci_discover_or_reset_device(struct usb_hcd *hcd,
 				xhci_get_slot_state(xhci, virt_dev->out_ctx));
 		xhci_dbg(xhci, "Not freeing device rings.\n");
 		/* Don't treat this as an error.  May change my mind later. */
-		virt_dev->flags = 0;
 		ret = 0;
 		goto command_cleanup;
 	case COMP_SUCCESS:
@@ -4087,7 +4086,6 @@ static int xhci_discover_or_reset_device(struct usb_hcd *hcd,
 	}
 	/* If necessary, update the number of active TTs on this root port */
 	xhci_update_tt_active_eps(xhci, virt_dev, old_active_eps);
-	virt_dev->flags = 0;
 	ret = 0;
 
 command_cleanup:
diff --git a/drivers/usb/host/xhci.h b/drivers/usb/host/xhci.h
index 8b07f7808ad7..7c8467581076 100644
--- a/drivers/usb/host/xhci.h
+++ b/drivers/usb/host/xhci.h
@@ -758,14 +758,6 @@ struct xhci_virt_device {
 	struct xhci_port		*rhub_port;
 	struct xhci_interval_bw_table	*bw_table;
 	struct xhci_tt_bw_info		*tt_info;
-	/*
-	 * flags for state tracking based on events and issued commands.
-	 * Software can not rely on states from output contexts because of
-	 * latency between events and xHC updating output context values.
-	 * See xhci 1.1 section 4.8.3 for more details
-	 */
-	unsigned long			flags;
-#define VDEV_PORT_ERROR			BIT(0) /* Port error, link inactive */
 
 	/* The current max exit latency for the enabled USB3 link states. */
 	u16				current_mel;
@@ -1485,6 +1477,7 @@ struct xhci_port {
 	int			hcd_portnum;
 	struct xhci_hub		*rhub;
 	struct xhci_port_cap	*port_cap;
+	unsigned int		link_inactive:1;
 	unsigned int		lpm_incapable:1;
 	unsigned long		resume_timestamp;
 	bool			rexit_active;
-- 
2.43.0


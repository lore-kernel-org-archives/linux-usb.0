Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 674F93E63A6
	for <linux-usb@vger.kernel.org>; Mon, 13 Jul 2026 10:49:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783939741; cv=none; b=m5U5raNStgBkRxluX9kJ/hnScR0/Yd+Mlt/n70uSyiWBbX5kFLQbDoB0ROT/mbthhz8OPYX+PTyhrMkN+Tqn95k1nm4xGNqHPR0OjDnEirEn77Oc1/M9MZVg+igteMdfdSlemzoxFdSj4mPg5ITz2vs52PsCBZ2zzMT7UPWswyI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783939741; c=relaxed/simple;
	bh=k9+Gpsws1+BMSWIgmMQYlcVinQA8rP9UdLJxFPuTf/U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TxMUSMFeDBv0lJnAQZNOZieWVavDKOK8Hiur3Qwy9+XayCDevJ+EPvzeq4woPHPfIxJH1k7jCmfTvgQgC4itlOP7xycbxAY7E7byAxIDLJsju1OY0z69f5d5QIkUummCXh5eWJv2tK8FhoFf4KcSmyVx/AOCdN1Nj3OSwAha52s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=oJAjG2qP; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="oJAjG2qP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783939741; x=1815475741;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=k9+Gpsws1+BMSWIgmMQYlcVinQA8rP9UdLJxFPuTf/U=;
  b=oJAjG2qPDdCcenCzVFGT3GQmO1+3ObCf6xooG4Q3z0PhQj9+dKlgZi5v
   Z7Vy7IeIrIiazvKxVWXvV01dLJP/wLXd2i5ibatEpqOc7P9ZZ864KdHMq
   aNoVJV+9T/Dt9HU4CNHn8NQOf1NRQPfpuX33N3kCB73PhhlJNi9vMCV9/
   QAtwZUllTkKExU5V6lFUZ8GlUZy19uN8drQbd9XS3hUsmfHMoPS7P+cvL
   2S95+OARouTe78b+YSRuHL7UlLuLmUBvgOFN19kxH5mUEARXu93LMfOuw
   H07NwjgtWXQAJfN+b6IYgMZFY3K9mx9JFI/7/IMc37o/FFSu/f6j9yjME
   Q==;
X-CSE-ConnectionGUID: K1f1OA80Q5iORCWbZZZnbg==
X-CSE-MsgGUID: lw4ms15mTt2boCcC96mk6w==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="88224933"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="88224933"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jul 2026 03:49:00 -0700
X-CSE-ConnectionGUID: FhYGEZ3cS/S5Dr/UjhGOMw==
X-CSE-MsgGUID: ioNyX8KOQcKjXWUttfH4TA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="256154428"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa009.jf.intel.com with ESMTP; 13 Jul 2026 03:48:59 -0700
Received: by black.igk.intel.com (Postfix, from userid 1058)
	id E8C6895; Mon, 13 Jul 2026 12:48:57 +0200 (CEST)
From: Niklas Neronin <niklas.neronin@linux.intel.com>
To: mathias.nyman@linux.intel.com
Cc: linux-usb@vger.kernel.org,
	Niklas Neronin <niklas.neronin@linux.intel.com>
Subject: [PATCH 22/22] usb: xhci: rename 'temp' PORTSC variables to 'portcs'
Date: Mon, 13 Jul 2026 12:47:36 +0200
Message-ID: <20260713104738.629612-23-niklas.neronin@linux.intel.com>
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

Rename local 'temp' variable which are used to store PORTSC values to
'portcs'. This makes the code easier to follow.

Signed-off-by: Niklas Neronin <niklas.neronin@linux.intel.com>
---
 drivers/usb/host/xhci-hub.c | 62 ++++++++++++++++++-------------------
 drivers/usb/host/xhci.c     |  6 ++--
 2 files changed, 33 insertions(+), 35 deletions(-)

diff --git a/drivers/usb/host/xhci-hub.c b/drivers/usb/host/xhci-hub.c
index dbf1183a6813..ca48a49d6716 100644
--- a/drivers/usb/host/xhci-hub.c
+++ b/drivers/usb/host/xhci-hub.c
@@ -603,29 +603,27 @@ static void xhci_set_port_power(struct xhci_hcd *xhci, struct xhci_port *port,
 	__must_hold(&xhci->lock)
 {
 	struct usb_hcd *hcd;
-	u32 temp;
+	u32 portsc;
 
 	hcd = port->rhub->hcd;
-	temp = xhci_portsc_readl(port);
+	portsc = xhci_portsc_readl(port);
 
 	xhci_dbg(xhci, "set port power %d-%d %s, portsc: 0x%x\n",
-		 hcd->self.busnum, port->hcd_portnum + 1, on ? "ON" : "OFF", temp);
+		 hcd->self.busnum, port->hcd_portnum + 1, on ? "ON" : "OFF", portsc);
 
-	temp = xhci_port_state_to_neutral(temp);
+	portsc = xhci_port_state_to_neutral(portsc);
 
 	if (on) {
 		/* Power on */
-		xhci_portsc_writel(port, temp | PORT_PP);
+		xhci_portsc_writel(port, portsc | PORT_PP);
 		xhci_portsc_readl(port);
 	} else {
 		/* Power off */
-		xhci_portsc_writel(port, temp & ~PORT_PP);
+		xhci_portsc_writel(port, portsc & ~PORT_PP);
 	}
 
 	spin_unlock_irqrestore(&xhci->lock, *flags);
-	temp = usb_acpi_power_manageable(hcd->self.root_hub,
-					 port->hcd_portnum);
-	if (temp)
+	if (usb_acpi_power_manageable(hcd->self.root_hub, port->hcd_portnum))
 		usb_acpi_set_power_state(hcd->self.root_hub,
 					 port->hcd_portnum, on);
 	spin_lock_irqsave(&xhci->lock, *flags);
@@ -768,40 +766,40 @@ void xhci_set_link_state(struct xhci_hcd *xhci, struct xhci_port *port,
 static void xhci_set_remote_wake_mask(struct xhci_hcd *xhci,
 				      struct xhci_port *port, u16 wake_mask)
 {
-	u32 temp;
+	u32 portsc;
 
-	temp = xhci_portsc_readl(port);
-	temp = xhci_port_state_to_neutral(temp);
+	portsc = xhci_portsc_readl(port);
+	portsc = xhci_port_state_to_neutral(portsc);
 
 	if (wake_mask & USB_PORT_FEAT_REMOTE_WAKE_CONNECT)
-		temp |= PORT_WCE;
+		portsc |= PORT_WCE;
 	else
-		temp &= ~PORT_WCE;
+		portsc &= ~PORT_WCE;
 
 	if (wake_mask & USB_PORT_FEAT_REMOTE_WAKE_DISCONNECT)
-		temp |= PORT_WDE;
+		portsc |= PORT_WDE;
 	else
-		temp &= ~PORT_WDE;
+		portsc &= ~PORT_WDE;
 
 	if (wake_mask & USB_PORT_FEAT_REMOTE_WAKE_OVER_CURRENT)
-		temp |= PORT_WOE;
+		portsc |= PORT_WOE;
 	else
-		temp &= ~PORT_WOE;
+		portsc &= ~PORT_WOE;
 
-	xhci_portsc_writel(port, temp);
+	xhci_portsc_writel(port, portsc);
 }
 
 /* Test and clear port RWC bit */
 void xhci_test_and_clear_bit(struct xhci_hcd *xhci, struct xhci_port *port,
 			     u32 port_bit)
 {
-	u32 temp;
+	u32 portsc;
 
-	temp = xhci_portsc_readl(port);
-	if (temp & port_bit) {
-		temp = xhci_port_state_to_neutral(temp);
-		temp |= port_bit;
-		xhci_portsc_writel(port, temp);
+	portsc = xhci_portsc_readl(port);
+	if (portsc & port_bit) {
+		portsc = xhci_port_state_to_neutral(portsc);
+		portsc |= port_bit;
+		xhci_portsc_writel(port, portsc);
 	}
 }
 
@@ -1559,7 +1557,7 @@ EXPORT_SYMBOL_GPL(xhci_hub_control);
 int xhci_hub_status_data(struct usb_hcd *hcd, char *buf)
 {
 	unsigned long flags;
-	u32 temp, status;
+	u32 portsc, status;
 	u32 mask;
 	int i, retval;
 	struct xhci_hcd	*xhci = hcd_to_xhci(hcd);
@@ -1601,24 +1599,24 @@ int xhci_hub_status_data(struct usb_hcd *hcd, char *buf)
 
 	/* For each port, did anything change?  If so, set that bit in buf. */
 	for (i = 0; i < max_ports; i++) {
-		temp = xhci_portsc_readl(ports[i]);
-		if (temp == ~(u32)0) {
+		portsc = xhci_portsc_readl(ports[i]);
+		if (portsc == ~(u32)0) {
 			xhci_hc_died(xhci);
 			retval = -ENODEV;
 			break;
 		}
-		trace_xhci_hub_status_data(ports[i], temp);
+		trace_xhci_hub_status_data(ports[i], portsc);
 
-		if ((temp & mask) != 0 ||
+		if ((portsc & mask) != 0 ||
 			(bus_state->port_c_suspend & 1 << i) ||
 			(ports[i]->resume_timestamp && time_after_eq(
 			    jiffies, ports[i]->resume_timestamp))) {
 			buf[(i + 1) / 8] |= 1 << (i + 1) % 8;
 			status = 1;
 		}
-		if ((temp & PORT_PRC))
+		if ((portsc & PORT_PRC))
 			reset_change = true;
-		if (temp & PORT_OCA)
+		if (portsc & PORT_OCA)
 			status = 1;
 	}
 	if (!status && !reset_change) {
diff --git a/drivers/usb/host/xhci.c b/drivers/usb/host/xhci.c
index 9e4e5c3cd7c2..ba6c4124ff65 100644
--- a/drivers/usb/host/xhci.c
+++ b/drivers/usb/host/xhci.c
@@ -363,7 +363,7 @@ static void compliance_mode_recovery(struct timer_list *t)
 	struct xhci_hcd *xhci;
 	struct usb_hcd *hcd;
 	struct xhci_hub *rhub;
-	u32 temp;
+	u32 portsc;
 	int i;
 
 	xhci = timer_container_of(xhci, t, comp_mode_recovery_timer);
@@ -374,8 +374,8 @@ static void compliance_mode_recovery(struct timer_list *t)
 		return;
 
 	for (i = 0; i < rhub->num_ports; i++) {
-		temp = xhci_portsc_readl(rhub->ports[i]);
-		if (FIELD_GET(PORT_PLS_MASK, temp) == PLS_COMP_MODE) {
+		portsc = xhci_portsc_readl(rhub->ports[i]);
+		if (FIELD_GET(PORT_PLS_MASK, portsc) == PLS_COMP_MODE) {
 			/*
 			 * Compliance Mode Detected. Letting USB Core
 			 * handle the Warm Reset
-- 
2.50.1


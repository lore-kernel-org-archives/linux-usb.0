Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D85E0406267
	for <linux-usb@vger.kernel.org>; Mon, 29 Jun 2026 12:30:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782736253; cv=none; b=O419lFoSvVIg1pkRiu9qilsVl1frn9kI/nNTFSDNhJFGG07F3eGkPcGUX4pp0CzTXw+wN4yQFu8keIjYInHPbnGhm4XwLTIHG/mhb8smTp/EWU9ED9YufDt4/gdBE/RTlz2eRpBTdR58/mDO0P6Kwg3BenrSKIGceiqNBZ0jQ88=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782736253; c=relaxed/simple;
	bh=nFwq8DMmndjpR5AW848La7T2Rsjy2zBACNHEJIcwrB4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ka5uHd8Nrt/yXsK0K86w+bq/Jdx+ml3GmK4VUUMyP7/jdVXTLs3pkDMXMFx3mZYMIiUCIGTtAoPBkSPTXV+QOhYeveW1/aRJU/um6LJO9F+2YQHF8BTB62M1q2rJ4kk8dkH2PR5J0dk+OhlgWZOF1peOFmj0U7n07mCGSlq+1gM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bx8O58Nj; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bx8O58Nj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782736252; x=1814272252;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=nFwq8DMmndjpR5AW848La7T2Rsjy2zBACNHEJIcwrB4=;
  b=bx8O58Njnu6DZCnEtEmMik/JyRl7+YF2ICo2+PoNngkPma7KrNbsgTnI
   vumWWh462KW+P3O343GpBOrovg3zpi2wSpRlEu6kSWK8AShCIte6OtLtM
   2ICSSBJ3JGuog7TOkrbo1YgfYbkzT3r8ECwl1vcJDC8cF/v7sbQGShiUV
   mzgdz2qgaueJRV7fxcQc4u8c3PM2VVEEMJxengJp2WbFapRdlzC4ZEA/L
   bbifjgCdU4nm+CIq0sS3CgEuJmUf/RPHEBwtHe5jF6qHlPZ2k9ejYZy6T
   3clJX4M8Sx6btI2LSQ9lVmscEQiyTqLg1vHbNCS/Qn4sBp5ERCAOcL84p
   A==;
X-CSE-ConnectionGUID: nYcbGP9FRG26VvARkgIEiw==
X-CSE-MsgGUID: 0nw4b40bT7uvuS6iTJTJQg==
X-IronPort-AV: E=McAfee;i="6800,10657,11831"; a="70943956"
X-IronPort-AV: E=Sophos;i="6.24,231,1774335600"; 
   d="scan'208";a="70943956"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jun 2026 05:30:50 -0700
X-CSE-ConnectionGUID: 8qGfdphZQTmu9SuzGOOIhg==
X-CSE-MsgGUID: Hl8QfD6pSW+/mih2EMzR+g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,231,1774335600"; 
   d="scan'208";a="252081300"
Received: from vpanait-mobl.ger.corp.intel.com (HELO mnyman-desk.home) ([10.245.244.241])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jun 2026 05:30:48 -0700
From: Mathias Nyman <mathias.nyman@linux.intel.com>
To: <linux-usb@vger.kernel.org>
Cc: raoxu@uniontech.com,
	michal.pecio@gmail.com,
	Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [RFT PATCH 2/3] xhci: prevent endpoint recovery after roothub disconnect
Date: Mon, 29 Jun 2026 15:30:30 +0300
Message-ID: <20260629123031.142133-3-mathias.nyman@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260629123031.142133-1-mathias.nyman@linux.intel.com>
References: <20260629123031.142133-1-mathias.nyman@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Prevent transfer retry and endpoint recovery if the device or its parent
disconnected from the roothub. Just like link error case.

There is a suspicion some xHC controllers may stop processing endpoint
related commands after the last USB device disconnects from the host.

Disconnect often causes transaction errors, xhci driver tries to (soft)
reset and restart the endpoint to recover it.
Hub driver again will cancel all pending URBs once disconnect is detected,
stopping the endpoint right after (soft) reset restarted it.
xHC controller sometimes fail to complete the stop endpoint command,
leading to driver timing out, and tearing down xhci

Prevent extra endpoint (soft) reset after xhci driver is aware of the
parent roothub port disconnect.

Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
---
 drivers/usb/host/xhci-ring.c | 12 ++++++++----
 drivers/usb/host/xhci.h      |  1 +
 2 files changed, 9 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
index 020e924c1ced..5e9efd3aa629 100644
--- a/drivers/usb/host/xhci-ring.c
+++ b/drivers/usb/host/xhci-ring.c
@@ -986,14 +986,16 @@ static int xhci_handle_halted_endpoint(struct xhci_hcd *xhci,
 				struct xhci_td *td,
 				enum xhci_ep_reset_type reset_type)
 {
+	struct xhci_port *rhub_port = ep->vdev->rhub_port;
 	unsigned int slot_id = ep->vdev->slot_id;
 	int err;
 
 	/*
-	 * Avoid resetting endpoint if link is inactive. Can cause host hang.
-	 * Device will be reset soon to recover the link so don't do anything
+	 * Avoid resetting endpoint if link is inactive or device disonnected.
+	 * Can cause host hang.
+	 * Device will be reset to recover an inactive link, so don't do anything
 	 */
-	if (ep->vdev->rhub_port->link_inactive)
+	if (rhub_port->link_inactive || !rhub_port->connected)
 		return -ENODEV;
 
 	/* add td to cancelled list and let reset ep handler take care of it */
@@ -2053,8 +2055,10 @@ static void handle_port_status(struct xhci_hcd *xhci, union xhci_trb *event)
 	 * Tag broken links to avoid retries while hub driver sorts it out.
 	 * Link status is not relible while port is in reset.
 	 */
-	if (!(portsc & PORT_RESET))
+	if (!(portsc & PORT_RESET)) {
 		port->link_inactive = (pls == XDEV_INACTIVE);
+		port->connected = !!(portsc & PORT_CONNECT);
+	}
 
 	if ((portsc & PORT_PLC) && (portsc & PORT_PLS_MASK) == XDEV_RESUME) {
 		xhci_dbg(xhci, "port resume event for port %d\n", port_id);
diff --git a/drivers/usb/host/xhci.h b/drivers/usb/host/xhci.h
index 717a7fd60a76..fd5533bdb261 100644
--- a/drivers/usb/host/xhci.h
+++ b/drivers/usb/host/xhci.h
@@ -1471,6 +1471,7 @@ struct xhci_port {
 	struct xhci_hub		*rhub;
 	struct xhci_port_cap	*port_cap;
 	unsigned int		link_inactive:1;
+	unsigned int		connected:1;
 	unsigned int		lpm_incapable:1;
 	unsigned long		resume_timestamp;
 	bool			rexit_active;
-- 
2.43.0


Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DDD3456DF3
	for <linux-usb@vger.kernel.org>; Thu,  6 Aug 2026 14:21:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786026100; cv=none; b=RO1ntMuM7MfgRdTbQsd96ic30G1z+SVNJJNRcGo/wL1vBhRhRxYip6v+FGJYNY50FlXUjJB1pAzhFdqhK/SHLjdB59jwMswlEv10xboAg38TCITmbbKnqwqKiJTjsTNmMlM1njICpMVUiolJoVQnpgdfjKOS3N6lzHApyq+9jBM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786026100; c=relaxed/simple;
	bh=46rzMSxx9DHg6fV7GGoofpFGW1cspYHfuB7Y/yd5YiU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=D4uOjfT9uZ/BWiU0/IzEMHp6JogtUQvrNrwgW/5v3EQ8QaWbXAC7nUAi74IFXg2Oimdd3tMiY/7MLV2yFqM5S5wYAwP7ADleM55mCpCfkquk3UQGC8sLc1Bz8MeHSUKJkFxMzAXw9Nkp6IyAKeleKSisM7Sc/9LnlX8KFp3bE1Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=P9CwbhMu; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="P9CwbhMu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786026097; x=1817562097;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=46rzMSxx9DHg6fV7GGoofpFGW1cspYHfuB7Y/yd5YiU=;
  b=P9CwbhMujM1b/e+D4IX1ekAbHENSEXFGrg708A7DCacLWGonISdDpkOn
   62shzJF/R/x9Tu6HNfGxLFZMTmy8DSLgKYmtLZo5gBTINEaAkN8XBRHIZ
   vZt5GljBz1o+llof8MM6YDjuDJYpWxFSeNMHUwFVCbMeCkpegSzSqgfN5
   kmu3sElCFUVpzru76YaS38EwgjnkqgDBUKT3j7QPOgWywb2TFjLPXwzVV
   U+Z6Q8UsdE4EY7+UbWKrvJGOYkgrr+ZMiavyElhzFaFmCVpCnjYwv+XET
   17QOF9in/HmQBcr3C/WI8iO9hjbOwhKGrAgK14n396LVtIs7zx25Jewf2
   w==;
X-CSE-ConnectionGUID: oQBKUosMRKiASEIj/kKzRQ==
X-CSE-MsgGUID: RZtxM14ESiS46Z+nUU9RIg==
X-IronPort-AV: E=McAfee;i="6800,10657,11867"; a="97268144"
X-IronPort-AV: E=Sophos;i="6.25,208,1779174000"; 
   d="scan'208";a="97268144"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Aug 2026 07:21:33 -0700
X-CSE-ConnectionGUID: 6GK2kP9zS26egj+pYig64w==
X-CSE-MsgGUID: +XIXGVHYQc+MgLDSL+/X4A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,208,1779174000"; 
   d="scan'208";a="285500358"
Received: from amilburn-desk.amilburn-desk (HELO mnyman-desk.home) ([10.245.244.235])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Aug 2026 07:21:32 -0700
From: Mathias Nyman <mathias.nyman@linux.intel.com>
To: <gregkh@linuxfoundation.org>
Cc: <linux-usb@vger.kernel.org>,
	Mathias Nyman <mathias.nyman@linux.intel.com>,
	Xu Rao <raoxu@uniontech.com>
Subject: [PATCH 04/17] xhci: prevent endpoint recovery after roothub disconnect
Date: Thu,  6 Aug 2026 17:21:00 +0300
Message-ID: <20260806142113.2436238-5-mathias.nyman@linux.intel.com>
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

Tested-by: Xu Rao <raoxu@uniontech.com>
Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
---
 drivers/usb/host/xhci-ring.c | 12 ++++++++----
 drivers/usb/host/xhci.h      |  1 +
 2 files changed, 9 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
index 544749b607a4..656ed6470e4a 100644
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
index 7c8467581076..defc5ff5aa55 100644
--- a/drivers/usb/host/xhci.h
+++ b/drivers/usb/host/xhci.h
@@ -1478,6 +1478,7 @@ struct xhci_port {
 	struct xhci_hub		*rhub;
 	struct xhci_port_cap	*port_cap;
 	unsigned int		link_inactive:1;
+	unsigned int		connected:1;
 	unsigned int		lpm_incapable:1;
 	unsigned long		resume_timestamp;
 	bool			rexit_active;
-- 
2.43.0


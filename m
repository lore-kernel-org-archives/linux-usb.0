Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA8E934AAE3
	for <linux-usb@vger.kernel.org>; Thu, 19 Mar 2026 13:57:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773928631; cv=none; b=oi6FGkLbzrWSUVaOw0dP3xMQ/tRkKqsOzBf8NmdO9/wPn2ia96sjuACnBhzY9oTwufosWZWzzVn6c8q2jp8CSIfTSBiUY+5ForisARzAmeYI9rgyxLKctcPLQWFTw21iwJjf3YrwdZr6ohHlsukVcqP/o1ylJSPK34dlEDLatWI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773928631; c=relaxed/simple;
	bh=UIRc3VxnvrESnaUmKcZxhiDgFb1/pxyyFyAo3t6ihN0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MQHJ0ikabhv6CfGkQucSo+mQqU057uRkuP6VUiQyQ84q6i+hcJLu0tkIkregJvIaCwuAy0HwNMeT+u8WBVE3nM9COU4dlNMoejb5cZOnfw5eYRy9VYEdEfJqC7udz4OcB/O+pN8sqscMYzym40KbRpVTTslEYuNdfO1YvQ5SrJQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=crXvDdoV; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="crXvDdoV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773928630; x=1805464630;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=UIRc3VxnvrESnaUmKcZxhiDgFb1/pxyyFyAo3t6ihN0=;
  b=crXvDdoV7Dz+/Hn6FNNa0b9+l2EMiIe9qRSp8xO9TsMtIrbmlmJtOOl8
   7syLZSH9H7jkmIJatS5BxRKQ7x6mdj9iNRNZQsOJquwuBHHDorZ09zi86
   wJ6Bq9FLbyXcvT2Pbv97esSALTYrE6vFeJWuFEhwUsiBFuN3VxePPB7DS
   HXtcZ/ylC72jgQ7CLq6UIUnL/X6w2e4sCsXryZSl5+UHgPq2cNi5+d0aG
   zulhvFIp59aGiLbc4NJj5Jr6lxxhc7wrxL3Mc9wtNWL8Ln4hMZRKKwy2F
   rXVbPp0JvHw9ZCpNAmDk5LYiamrmvWMwulwVTA1QQC9Zk6MsXlOoOtK+b
   Q==;
X-CSE-ConnectionGUID: CrsPmtpKSx2Jv5SO/jqhWA==
X-CSE-MsgGUID: H63D9AQoRfmFky+gUZ1p/Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11734"; a="78904207"
X-IronPort-AV: E=Sophos;i="6.23,129,1770624000"; 
   d="scan'208";a="78904207"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Mar 2026 06:57:09 -0700
X-CSE-ConnectionGUID: 66CGLZLjRfOmFEcTzGVUUg==
X-CSE-MsgGUID: JyZuGclWSc6R3l6dtNybdA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,129,1770624000"; 
   d="scan'208";a="260866338"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa001.jf.intel.com with ESMTP; 19 Mar 2026 06:57:08 -0700
Received: by black.igk.intel.com (Postfix, from userid 1058)
	id E79D798; Thu, 19 Mar 2026 14:57:07 +0100 (CET)
From: Niklas Neronin <niklas.neronin@linux.intel.com>
To: mathias.nyman@linux.intel.com
Cc: linux-usb@vger.kernel.org,
	Niklas Neronin <niklas.neronin@linux.intel.com>
Subject: [PATCH 9/9] usb: xhci: cleanup xhci_hub_report_usb3_link_state()
Date: Thu, 19 Mar 2026 14:56:24 +0100
Message-ID: <20260319135626.3077643-10-niklas.neronin@linux.intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260319135626.3077643-1-niklas.neronin@linux.intel.com>
References: <20260319135626.3077643-1-niklas.neronin@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Improve readability of xhci_hub_report_usb3_link_state().

Comments are shortened and clarified, and the code now makes it explicit
when the Port Link State (PLS) value is modified versus when other status
bits are updated.

No functional changes.

Signed-off-by: Niklas Neronin <niklas.neronin@linux.intel.com>
---
 drivers/usb/host/xhci-hub.c | 58 ++++++++++++++-----------------------
 1 file changed, 21 insertions(+), 37 deletions(-)

diff --git a/drivers/usb/host/xhci-hub.c b/drivers/usb/host/xhci-hub.c
index 8e134f6b4e37..bacd0ddd0d09 100644
--- a/drivers/usb/host/xhci-hub.c
+++ b/drivers/usb/host/xhci-hub.c
@@ -850,53 +850,37 @@ void xhci_test_and_clear_bit(struct xhci_hcd *xhci, struct xhci_port *port,
 }
 
 /* Updates Link Status for super Speed port */
-static void xhci_hub_report_usb3_link_state(struct xhci_hcd *xhci,
-		u32 *status, u32 portsc)
+static void xhci_hub_report_usb3_link_state(struct xhci_hcd *xhci, u32 *status, u32 portsc)
 {
 	u32 pls = portsc & PORT_PLS_MASK;
 
-	/* When the CAS bit is set then warm reset
-	 * should be performed on port
+	/*
+	 * CAS indicates that a warm reset is required, it may be set in any
+	 * link state and is only present on roothubs.
 	 */
 	if (portsc & PORT_CAS) {
-		/* The CAS bit can be set while the port is
-		 * in any link state.
-		 * Only roothubs have CAS bit, so we
-		 * pretend to be in compliance mode
-		 * unless we're already in compliance
-		 * or the inactive state.
+		/*
+		 * If not already in Compliance or Inactive state,
+		 * report Compliance Mode so the hub logic triggers a warm reset.
 		 */
-		if (pls != XDEV_COMP_MODE &&
-		    pls != XDEV_INACTIVE) {
+		if (pls != XDEV_COMP_MODE && pls != XDEV_INACTIVE)
 			pls = USB_SS_PORT_LS_COMP_MOD;
-		}
-		/* Return also connection bit -
-		 * hub state machine resets port
-		 * when this bit is set.
-		 */
-		pls |= USB_PORT_STAT_CONNECTION;
-	} else {
-		/*
-		 * Resume state is an xHCI internal state.  Do not report it to
-		 * usb core, instead, pretend to be U3, thus usb core knows
-		 * it's not ready for transfer.
-		 */
-		if (pls == XDEV_RESUME) {
-			*status |= USB_SS_PORT_LS_U3;
-			return;
-		}
 
+		/* Signal a connection change to force a reset */
+		*status |= USB_PORT_STAT_CONNECTION;
+	} else if (pls == XDEV_RESUME) {
 		/*
-		 * If CAS bit isn't set but the Port is already at
-		 * Compliance Mode, fake a connection so the USB core
-		 * notices the Compliance state and resets the port.
-		 * This resolves an issue generated by the SN65LVPE502CP
-		 * in which sometimes the port enters compliance mode
-		 * caused by a delay on the host-device negotiation.
+		 * Resume is an internal xHCI-only state and must not be exposed
+		 * to usbcore. Report it as U3 so transfers are blocked.
 		 */
-		if ((xhci->quirks & XHCI_COMP_MODE_QUIRK) &&
-				(pls == XDEV_COMP_MODE))
-			pls |= USB_PORT_STAT_CONNECTION;
+		pls = USB_SS_PORT_LS_U3;
+	} else if (pls == XDEV_COMP_MODE) {
+		/*
+		 * Some hardware may enter Compliance Mode without CAS.
+		 * Fake a connection event so usbcore notices and resets the port.
+		 */
+		if (xhci->quirks & XHCI_COMP_MODE_QUIRK)
+			*status |= USB_PORT_STAT_CONNECTION;
 	}
 
 	/* update status field */
-- 
2.50.1


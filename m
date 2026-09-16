Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3CA150AC25
	for <linux-usb@vger.kernel.org>; Wed, 16 Sep 2026 14:16:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789568167; cv=none; b=jli6nyck2CZoE/x97DQo0F0nNZWmFhg8IpicwNfb60Dn/Y2/SEQd9I+HCe78Mh7i3AAYNso/mA6YIB4Ie3sAi8pC/sGLBoR6BbZ4FOrj0b169PMZNAoAXwzuYPiiVE+ehrfoAws489Dij4QzUTN7wU7oKdS0YEJFTmXLGKh+dZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789568167; c=relaxed/simple;
	bh=H2UC3T4jeBB7dUtSJb+xyY6pUl7e4j/SIoHNspXeHvc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MJSoDqxRkV9uFt8RAPZalWrh7KdRu38NXxDbdPccqg/WvXZFDQQPbJ/dZl4zywO1EwwqVaH5LqbbornCAwQCaCwSAnuxjz0bZ8sH6X8bFkURWdPMxLMP/YHYmJNS8eHcfJwLotO0EVVVuh996gpSYZJYvvjOxIjBx4fuRUI8umA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=m0bDYG96; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="m0bDYG96"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789568165; x=1821104165;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=H2UC3T4jeBB7dUtSJb+xyY6pUl7e4j/SIoHNspXeHvc=;
  b=m0bDYG968oBUrTcfwFbXC6y4fcDrj7cxO+bNlhLIupdbuHyUCJu9sgZj
   RKpncYnN0mRMaOcIMa0zV/IE2jsjEwXEikz6hTURdbCZd71hn0QhDJBEQ
   OOFwulS5FLiR0hTYw/naIgev0/Ux5B7wlEh5ICKO0LIrb2Pe7b5fRSrpq
   an8I/qVpmu3caSDTlmXMVV+K9QcdTvF3fN3WcJNqJmBurD9bWXuZ+jH2E
   g/KQ/s6JCeMJFiBpSKwCSYpZiKlkNdByOJ7ohnC9VCyboK6RABUURe1ud
   F0uhVl4S0Ak/OvwRQRXPY6VQ5w/xLF2yqlx/NBIgt+DAHorQN37VE02OC
   A==;
X-CSE-ConnectionGUID: zh7yd6NpQL+m5S8zQIvKuA==
X-CSE-MsgGUID: DkrBj41RQniURaINMQok8A==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="89967294"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="89967294"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2026 07:16:04 -0700
X-CSE-ConnectionGUID: DRpARcNDRSuQMT9Q4dA3Hg==
X-CSE-MsgGUID: lFjGaA03SZW9c1aQHXI4rw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="270720165"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa008.fm.intel.com with ESMTP; 16 Sep 2026 07:16:02 -0700
Received: by black.igk.intel.com (Postfix, from userid 1058)
	id 46C439B; Wed, 16 Sep 2026 16:16:02 +0200 (CEST)
From: Niklas Neronin <niklas.neronin@linux.intel.com>
To: mathias.nyman@linux.intel.com
Cc: linux-usb@vger.kernel.org,
	Niklas Neronin <niklas.neronin@linux.intel.com>
Subject: [PATCH v2 12/20] usb: xhci: update port register bitfield comments for consistency
Date: Wed, 16 Sep 2026 16:14:01 +0200
Message-ID: <20260916141409.629621-13-niklas.neronin@linux.intel.com>
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

No functional changes.

Update comments in xhci-port.h to improve readability and ensure a
consistent format across all Port Register bit fields.

Each field now includes a brief description of its name, along with the
xHCI specification abbreviation when the macro uses a different name,
and its valid value range where applicable.

Bit field comment format:
/* <bit range> - <Field name>,<noteworthy information if any> */

These updates are based on the xHCI specification, revision 1.2.

Signed-off-by: Niklas Neronin <niklas.neronin@linux.intel.com>
---
 drivers/usb/host/xhci-port.h | 63 ++++++++++++++++++++----------------
 drivers/usb/host/xhci.c      |  2 +-
 2 files changed, 36 insertions(+), 29 deletions(-)

diff --git a/drivers/usb/host/xhci-port.h b/drivers/usb/host/xhci-port.h
index 064588335e74..f10ce1f24eb4 100644
--- a/drivers/usb/host/xhci-port.h
+++ b/drivers/usb/host/xhci-port.h
@@ -1,17 +1,21 @@
 /* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * xHCI Host Controller USB Port Register Set
+ * xHCI Specification Section 5.4, Revision 1.2.
+ */
 
 #include <linux/bitfield.h>
 #include <linux/bits.h>
 
-/* PORTSC - Port Status and Control Register - port_status_base bitmasks */
-/* true: device connected */
+/* Port Status and Control (PORTSC) 5.4.8 */
+/* bit 0 - Current Connect Status (CCS) */
 #define PORT_CONNECT	BIT(0)
-/* true: port enabled */
+/* bit 1 - Port Enabled/Disabled (PED) */
 #define PORT_PE		BIT(1)
-/* bit 2 reserved and zeroed */
-/* true: port has an over-current condition */
+/* bit 2 - Rsvd */
+/* bit 3 - Over-current Active (OCA) */
 #define PORT_OC		BIT(3)
-/* true: port reset signaling asserted */
+/* bit 4 - Port Reset (PR) */
 #define PORT_RESET	BIT(4)
 /*
  * bits 8:5 - Port Link State, by default '5'.
@@ -61,23 +65,26 @@
 #define PIC_OFF		0
 #define PIC_AMBER	1
 #define PIC_GREEN	2
-/* Port Link State Write Strobe - set this when changing link state */
+/* bit 16 - Port Link State Write Strobe (LWS), set this when changing link state */
 #define PORT_LINK_STROBE	BIT(16)
-/* true: connect status change */
+/* bit 17 - Connect Status Change */
 #define PORT_CSC	BIT(17)
-/* true: port enable change */
+/* bit 18 - Port Enabled/Disabled Change */
 #define PORT_PEC	BIT(18)
-/* true: warm reset for a USB 3.0 device is done.  A "hot" reset puts the port
+/*
+ * bit 19 - Warm Port Reset Change
+ * Warm reset for a USB 3.0 device is done.  A "hot" reset puts the port
  * into an enabled state, and the device into the default state.  A "warm" reset
  * also resets the link, forcing the device through the link training sequence.
  * SW can also look at the Port Reset register to see when warm reset is done.
  */
 #define PORT_WRC	BIT(19)
-/* true: over-current change */
+/* bit 20 - Over-current Change */
 #define PORT_OCC	BIT(20)
-/* true: reset change - 1 to 0 transition of PORT_RESET */
+/* bit 21 - Port Reset Change (PRC) */
 #define PORT_RC		BIT(21)
-/* port link status change - set on some port link state transitions:
+/*
+ * bit 22 - Port Link State Change, set on some port link state transitions:
  *  Transition				Reason
  *  ------------------------------------------------------------------------------
  *  - U3 to Resume			Wakeup signaling from a device
@@ -91,28 +98,27 @@
  *  - Any state to inactive		Error on USB 3.0 port
  */
 #define PORT_PLC	BIT(22)
-/* port configure error change - port failed to configure its link partner */
+/* bit 23 - Port Config Error Change, port failed to configure its link partner */
 #define PORT_CEC	BIT(23)
-#define PORT_CHANGE_MASK	(PORT_CSC | PORT_PEC | PORT_WRC | PORT_OCC | \
-				 PORT_RC | PORT_PLC | PORT_CEC)
-
-
-/* Cold Attach Status - xHC can set this bit to report device attached during
- * Sx state. Warm port reset should be perfomed to clear this bit and move port
- * to connected state.
+/*
+ * bit 24 - Cold Attach Status
+ * xHC can set this bit to report device attached during Sx state.
+ * Warm port reset should be perfomed to clear this bit and move port to connected state.
  */
 #define PORT_CAS	BIT(24)
-/* wake on connect (enable) */
+/* bit 25 - Wake on Connect Enable (WCE) */
 #define PORT_WKCONN_E	BIT(25)
-/* wake on disconnect (enable) */
+/* bit 26 - Wake on Disconnect Enable (WDE) */
 #define PORT_WKDISC_E	BIT(26)
-/* wake on over-current (enable) */
+/* bit 27 - Wake on Over-current Enable (WOE) */
 #define PORT_WKOC_E	BIT(27)
-/* bits 28:29 reserved */
-/* true: device is non-removable - for USB 3.0 roothub emulation */
+/* bits 29:28 - RsvdZ */
+/* bit 30 - Device Removable (DR), for USB 3.0 roothub emulation */
 #define PORT_DEV_REMOVE	BIT(30)
-/* Initiate a warm port reset - complete when PORT_WRC is '1' */
+/* bit 31 - Warm Port Reset (WPR), complete when PORT_WRC is '1' */
 #define PORT_WR		BIT(31)
+#define PORT_CHANGE_MASK	(PORT_CSC | PORT_PEC | PORT_WRC | PORT_OCC | \
+				 PORT_RC | PORT_PLC | PORT_CEC)
 
 /* We mark duplicate entries with -1 */
 #define DUPLICATE_ENTRY ((u8)(-1))
@@ -185,7 +191,8 @@
 #define PORT_BESLD_MASK		GENMASK(13, 10)
 /* bits 31:14 - RsvdP */
 
-/* Set default HIRD/BESL value to 4 (350/400us) for USB2 L1 LPM resume latency.
+/*
+ * Set default HIRD/BESL value to 4 (350/400us) for USB2 L1 LPM resume latency.
  * Safe to use with mixed HIRD and BESL systems (host and device) and is used
  * by other operating systems.
  *
diff --git a/drivers/usb/host/xhci.c b/drivers/usb/host/xhci.c
index 3c9e3244f941..d3fcca94e06a 100644
--- a/drivers/usb/host/xhci.c
+++ b/drivers/usb/host/xhci.c
@@ -4700,7 +4700,7 @@ static int xhci_set_usb2_hardware_lpm(struct usb_hcd *hcd,
 		if (udev->usb2_hw_lpm_besl_capable) {
 			/* if device doesn't have a preferred BESL value use a
 			 * default one which works with mixed HIRD and BESL
-			 * systems. See XHCI_DEFAULT_BESL definition in xhci.h
+			 * systems. See XHCI_DEFAULT_BESL definition in xhci-ports.h
 			 */
 			field = le32_to_cpu(udev->bos->ext_cap->bmAttributes);
 			if ((field & USB_BESL_SUPPORT) &&
-- 
2.50.1


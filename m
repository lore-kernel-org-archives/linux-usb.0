Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D43C3E63A6
	for <linux-usb@vger.kernel.org>; Mon, 13 Jul 2026 10:48:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783939739; cv=none; b=Zwqaqd2ZmQb6Qk1uKFdawmTHuIcc9fV8+wUIEdolzyALOLtk/uAzHuL9tHLpsB5TW0GSDwxifThHvjprd914QblRXAzQPDUx2P32+10m24Czvv4HKhHkxXeY7vpiGCbwUqufX8eb8XyLZT1rRABiqqAcKNB0/c1kKALCW9jgZt8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783939739; c=relaxed/simple;
	bh=PVwAmDcK8Jg2nnUjMZWN4eNGP/2yHLG8xLTPu+QmDE4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bWRAPnBBVmkh0yycq2ScMB6YqU+yZWWPxvcFnVg+wIY1GPHSQQaKrYbgAAKek/RkEKXjKNO10j8CSeKmlaHHixZHATJkiW6VhXyAulirlNWWbVcrZBFlVfUpx5tCicgVVzv8cec8PEN6YwgU4+fIkypbzyIXe8yqhb3y8DsVyug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MjMMI2U0; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MjMMI2U0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783939729; x=1815475729;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=PVwAmDcK8Jg2nnUjMZWN4eNGP/2yHLG8xLTPu+QmDE4=;
  b=MjMMI2U0Csq5m+VhUv+sXJa57JvJDHIdcJH/OyhKjlw7FfIpBMDc+gOM
   EX3Y6N+pAJlzCEL6rrwR0z6I+U8IdhcEIaV5cjhTdMGiZ0tzS6CVrzJD7
   HejR7ZcpQwafaZfAWcQtfuI/cPV+uhV9O6SOQUtURCBXttBjO461vQT/M
   w08yyIO0dRxsN+r1K29jpaEBnFL45y+DZ7BLXTfjRxoO1BIHmfhRBwkT6
   9vVVT8TTqxdcd3uZHC6EMDWB2dgTGf0Phr3nWfZakAtr/e7LqjVCY9qGd
   jGWY0VYpNHkTXwh5RuO55jLMXdmLjGytyxmmVz6zjkxKHpML0t+tD27Mn
   A==;
X-CSE-ConnectionGUID: 8pD5DftyQL+RxDfFUWZVxg==
X-CSE-MsgGUID: qZ8q35k0QGiqfIU/Y5bL4Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="96057036"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="96057036"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jul 2026 03:48:47 -0700
X-CSE-ConnectionGUID: Nrdkua6tSHqfR8VLwA4MBA==
X-CSE-MsgGUID: A7S7iupzTM+J+xPto5YG+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="279928978"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa001.fm.intel.com with ESMTP; 13 Jul 2026 03:48:45 -0700
Received: by black.igk.intel.com (Postfix, from userid 1058)
	id 38FE595; Mon, 13 Jul 2026 12:48:45 +0200 (CEST)
From: Niklas Neronin <niklas.neronin@linux.intel.com>
To: mathias.nyman@linux.intel.com
Cc: linux-usb@vger.kernel.org,
	Niklas Neronin <niklas.neronin@linux.intel.com>
Subject: [PATCH 11/22] usb: xhci: update port register bitfield comments for consistency
Date: Mon, 13 Jul 2026 12:47:25 +0200
Message-ID: <20260713104738.629612-12-niklas.neronin@linux.intel.com>
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

No functional changes.

Update comments in xhci-port.h to improve readability and ensure a
consistent format across all Port Register bit fields.

Each field now includes a brief description of its name, along with the
xHCI specification abbreviation when the macro uses a different name,
and its valid value range where applicable.

Bit field comment format:
/* <bit range> - <Field name>,<noteworthy information if any> */

These updates are based on the xHCI specification, revision 1.2.

Why print the bit range?
 The bit range aids in identifying missing macros and reserved bit ranges.

Signed-off-by: Niklas Neronin <niklas.neronin@linux.intel.com>
---
 drivers/usb/host/xhci-port.h | 63 ++++++++++++++++++++----------------
 drivers/usb/host/xhci.c      |  2 +-
 2 files changed, 36 insertions(+), 29 deletions(-)

diff --git a/drivers/usb/host/xhci-port.h b/drivers/usb/host/xhci-port.h
index 3aa23e143521..8cc175fb4dcb 100644
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
index 9ae4f6b3e5ec..0e246755e979 100644
--- a/drivers/usb/host/xhci.c
+++ b/drivers/usb/host/xhci.c
@@ -4699,7 +4699,7 @@ static int xhci_set_usb2_hardware_lpm(struct usb_hcd *hcd,
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


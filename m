Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76E1A4E66A7
	for <linux-usb@vger.kernel.org>; Wed, 16 Sep 2026 14:15:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.6
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789568158; cv=none; b=ddwx0XFpbkdiWjHnOg+3sDLSYXCD0GrWSgPNjvL79adT1if9qViSFl8tfLa84qt8q1YlW3wGHaiVKxmiY3eRcYftX1WGafs9WiVmPORbdtUEzY8xxDdNjBQR41sAzYqdfa+X7WaZZm0V9lRlnR4IxLtJt9/mgqangTkQL3As5hs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789568158; c=relaxed/simple;
	bh=UJl9ATGSpc4Js3o//Ya3+/4ZvJz1xj2wKsg7mmpeCwA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ge7bUgaYgZ2/DssthWJkSvK2/lqcHYrtn0699V4WRu2fYdLnjvTw3au5Pa3MVvjiHtEHS5fQK88lQ0l2viQc2KfHCzd4AN7tO71bSIksI+Q5ip2EgCVaIaL1NFTLdSwjoRF/UR8vmBq6mh0L42X4ZcYK9tGZbz/9tLhfYalIbsc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hQRXksMB; arc=none smtp.client-ip=192.198.163.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hQRXksMB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789568156; x=1821104156;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=UJl9ATGSpc4Js3o//Ya3+/4ZvJz1xj2wKsg7mmpeCwA=;
  b=hQRXksMB8xe53hGREGjSpUh+UxBOoqdDTI3vpcSL9eNYyOwDN6DCp0UJ
   04smqi3NqN7Ih6rgXClrFHFvIkwSgIien6S+E8w7CGqs6+uplH9uJLjpl
   RxoMIAezL5s83ubILDiUGwVnM4mXDuegPvzAp/nwMBknLy6FUjrfF3uT3
   tFw5DunK/blPxbhhbbyIdTiIPRfhp5JosLnW0WQvPv90jLrCxk45Dyknb
   zIzdryeJ2TQVo82o1C9NST+xfyhSGb+wqQq7HiXvGC5H3WvoctEeJAsxA
   wLfC57WkYYTmEeFQWw/j9qlOPFVExywV9bLEL/stgsmDipNRJz8G4fDo/
   A==;
X-CSE-ConnectionGUID: 6R9iHvMCR+SC/xVbIWsL3Q==
X-CSE-MsgGUID: 3VHZXet2TDG/EFo1S9TRmw==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="449945"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="449945"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa116.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2026 07:15:55 -0700
X-CSE-ConnectionGUID: K++8SswRSnyK8fXxYFnvxQ==
X-CSE-MsgGUID: 2QgG5LhjQdGJJKFcE+1Zjg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="296838691"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa002.fm.intel.com with ESMTP; 16 Sep 2026 07:15:54 -0700
Received: by black.igk.intel.com (Postfix, from userid 1058)
	id 1D4CC99; Wed, 16 Sep 2026 16:15:54 +0200 (CEST)
From: Niklas Neronin <niklas.neronin@linux.intel.com>
To: mathias.nyman@linux.intel.com
Cc: linux-usb@vger.kernel.org,
	Niklas Neronin <niklas.neronin@linux.intel.com>
Subject: [PATCH v2 01/20] usb: xhci: replace bit shifts with the BIT() macro in xhci-port.h
Date: Wed, 16 Sep 2026 16:13:50 +0200
Message-ID: <20260916141409.629621-2-niklas.neronin@linux.intel.com>
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

Use the modern approach.

No need for BIT_ULL() in xhciport.h

Signed-off-by: Niklas Neronin <niklas.neronin@linux.intel.com>
---
 drivers/usb/host/xhci-port.h | 44 +++++++++++++++++++-----------------
 1 file changed, 23 insertions(+), 21 deletions(-)

diff --git a/drivers/usb/host/xhci-port.h b/drivers/usb/host/xhci-port.h
index 889b5fb0fcd8..45e081a9c510 100644
--- a/drivers/usb/host/xhci-port.h
+++ b/drivers/usb/host/xhci-port.h
@@ -1,15 +1,17 @@
 /* SPDX-License-Identifier: GPL-2.0 */
 
+#include <linux/bits.h>
+
 /* PORTSC - Port Status and Control Register - port_status_base bitmasks */
 /* true: device connected */
-#define PORT_CONNECT	(1 << 0)
+#define PORT_CONNECT	BIT(0)
 /* true: port enabled */
-#define PORT_PE		(1 << 1)
+#define PORT_PE		BIT(1)
 /* bit 2 reserved and zeroed */
 /* true: port has an over-current condition */
-#define PORT_OC		(1 << 3)
+#define PORT_OC		BIT(3)
 /* true: port reset signaling asserted */
-#define PORT_RESET	(1 << 4)
+#define PORT_RESET	BIT(4)
 /* Port Link State - bits 5:8
  * A read gives the current link PM state of the port,
  * a write with Link State Write Strobe set sets the link state.
@@ -30,7 +32,7 @@
 #define XDEV_RESUME	(0xf << 5)
 
 /* true: port has power (see HCC_PPC) */
-#define PORT_POWER	(1 << 9)
+#define PORT_POWER	BIT(9)
 /* bits 10:13 indicate device speed:
  * 0 - undefined speed - port hasn't be initialized by a reset yet
  * 1 - full speed
@@ -66,21 +68,21 @@
 #define PORT_LED_GREEN	(2 << 14)
 #define PORT_LED_MASK	(3 << 14)
 /* Port Link State Write Strobe - set this when changing link state */
-#define PORT_LINK_STROBE	(1 << 16)
+#define PORT_LINK_STROBE	BIT(16)
 /* true: connect status change */
-#define PORT_CSC	(1 << 17)
+#define PORT_CSC	BIT(17)
 /* true: port enable change */
-#define PORT_PEC	(1 << 18)
+#define PORT_PEC	BIT(18)
 /* true: warm reset for a USB 3.0 device is done.  A "hot" reset puts the port
  * into an enabled state, and the device into the default state.  A "warm" reset
  * also resets the link, forcing the device through the link training sequence.
  * SW can also look at the Port Reset register to see when warm reset is done.
  */
-#define PORT_WRC	(1 << 19)
+#define PORT_WRC	BIT(19)
 /* true: over-current change */
-#define PORT_OCC	(1 << 20)
+#define PORT_OCC	BIT(20)
 /* true: reset change - 1 to 0 transition of PORT_RESET */
-#define PORT_RC		(1 << 21)
+#define PORT_RC		BIT(21)
 /* port link status change - set on some port link state transitions:
  *  Transition				Reason
  *  ------------------------------------------------------------------------------
@@ -94,9 +96,9 @@
  *  - U0 to disabled			L1 entry error with USB 2.1 device
  *  - Any state to inactive		Error on USB 3.0 port
  */
-#define PORT_PLC	(1 << 22)
+#define PORT_PLC	BIT(22)
 /* port configure error change - port failed to configure its link partner */
-#define PORT_CEC	(1 << 23)
+#define PORT_CEC	BIT(23)
 #define PORT_CHANGE_MASK	(PORT_CSC | PORT_PEC | PORT_WRC | PORT_OCC | \
 				 PORT_RC | PORT_PLC | PORT_CEC)
 
@@ -105,18 +107,18 @@
  * Sx state. Warm port reset should be perfomed to clear this bit and move port
  * to connected state.
  */
-#define PORT_CAS	(1 << 24)
+#define PORT_CAS	BIT(24)
 /* wake on connect (enable) */
-#define PORT_WKCONN_E	(1 << 25)
+#define PORT_WKCONN_E	BIT(25)
 /* wake on disconnect (enable) */
-#define PORT_WKDISC_E	(1 << 26)
+#define PORT_WKDISC_E	BIT(26)
 /* wake on over-current (enable) */
-#define PORT_WKOC_E	(1 << 27)
+#define PORT_WKOC_E	BIT(27)
 /* bits 28:29 reserved */
 /* true: device is non-removable - for USB 3.0 roothub emulation */
-#define PORT_DEV_REMOVE	(1 << 30)
+#define PORT_DEV_REMOVE	BIT(30)
 /* Initiate a warm port reset - complete when PORT_WRC is '1' */
-#define PORT_WR		(1 << 31)
+#define PORT_WR		BIT(31)
 
 /* We mark duplicate entries with -1 */
 #define DUPLICATE_ENTRY ((u8)(-1))
@@ -135,12 +137,12 @@
 /* USB2 Protocol PORTSPMSC */
 #define	PORT_L1S_MASK		7
 #define	PORT_L1S_SUCCESS	1
-#define	PORT_RWE		(1 << 3)
+#define	PORT_RWE		BIT(3)
 #define	PORT_HIRD(p)		(((p) & 0xf) << 4)
 #define	PORT_HIRD_MASK		(0xf << 4)
 #define	PORT_L1DS_MASK		(0xff << 8)
 #define	PORT_L1DS(p)		(((p) & 0xff) << 8)
-#define	PORT_HLE		(1 << 16)
+#define	PORT_HLE		BIT(16)
 #define PORT_TEST_MODE_SHIFT	28
 
 /* USB3 Protocol PORTLI  Port Link Information */
-- 
2.50.1


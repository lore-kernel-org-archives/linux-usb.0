Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD2D33E7BB0
	for <linux-usb@vger.kernel.org>; Mon, 13 Jul 2026 10:48:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783939741; cv=none; b=a+QN1mKLE3vNrb9T0BrfNnnyldP9XXv/3tHksV0Pk7iO/mF7YqyXoHXdgGspF+wJt14kQxJZi9brPpOsKdtNZ0LMmno38DIUxvDRAKl0xYZ83Zffu605X7/jsPI7RKtccAxRkhngjMtGG+RpSQ20/1FsVDBkhRXXWw3s2j7muPM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783939741; c=relaxed/simple;
	bh=w5/Gs0gmhhdcJu5sN5aFcLr1Pp557z6Ogl7IcSCZbR0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qf5CupX50SLc4+Dc1scK/KPeIL1FU462ROSgWk+fEr6+BOFdVqc88w3hqAVdoGq1qMpRsNxHO9dzeiPpsO1Fs1KgCkbCJwbRmKSfNDBN+HgPhm4uU66bneuSpCje9VCMRUdiCEzOWGTktkXkO0Hg3NkabKBlEyxA7tvAVbErcNA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=N82dZaCp; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="N82dZaCp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783939740; x=1815475740;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=w5/Gs0gmhhdcJu5sN5aFcLr1Pp557z6Ogl7IcSCZbR0=;
  b=N82dZaCpYIN8GtIGzisJUTiyH4BloLxTMaVmwBglx3ZthylVE0ijpDeS
   4z4XpHk68HwZhlaivhwuPqEFJwUIEAsFMmuIe0ImOGYgADD4mVa1biP9x
   h7boTPDMkJE5sqIX49LgGB+0kSXT9CZP2qTV0yvxk2IY5Yt93PQD55isg
   rsQV7yXegyO53i7kwuOEdRo1iT2oPh7OB6N3HyPVXMu93ULKJktLuwDXx
   vBMyvpCV4rmeZiiA/ILuH1KPYGuJonGBgBqIi3D5v9GeA1syy9ELvdRAj
   TqDuGq9W0nHdbImwcPFJtenL6hLevqeWgjfjU1phZYlNVjNv2KPHTH1lQ
   Q==;
X-CSE-ConnectionGUID: VLyg7wnHTIGDk6yjGtJomg==
X-CSE-MsgGUID: lvkorP76RGCXl+1RL/AbSw==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="96057040"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="96057040"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jul 2026 03:48:49 -0700
X-CSE-ConnectionGUID: +D3TeJ9VRJeyVrUNpkW9yw==
X-CSE-MsgGUID: SGYFcxYYQcSRUroqS3KMdA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="279928983"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa001.fm.intel.com with ESMTP; 13 Jul 2026 03:48:48 -0700
Received: by black.igk.intel.com (Postfix, from userid 1058)
	id 50D619B; Mon, 13 Jul 2026 12:48:47 +0200 (CEST)
From: Niklas Neronin <niklas.neronin@linux.intel.com>
To: mathias.nyman@linux.intel.com
Cc: linux-usb@vger.kernel.org,
	Niklas Neronin <niklas.neronin@linux.intel.com>
Subject: [PATCH 15/22] usb: xhci: consolidate PORTSC RW1CS bit macros
Date: Mon, 13 Jul 2026 12:47:29 +0200
Message-ID: <20260713104738.629612-16-niklas.neronin@linux.intel.com>
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

There are currently multiple macros describing overlapping sets of
write-1-to-clear (RW1CS) bits in the PORTSC register:

  PORT_CHANGE_MASK  (      CSC | PEC | WRC | OCC | RC | PLC | CEC)
  PORT_RWC_BITS     (PE  | CSC | PEC | WRC | OCC | RC | PLC      )
  XHCI_PORT_RW1CS   (PE  | CSC | PEC | WRC | OCC | RC | PLC | CEC)

These definitions largely duplicate each other, with 'XHCI_PORT_RW1CS'
being a superset of the others. This duplication adds unnecessary
complexity and makes it harder to reason about which bits are being
manipulated in different contexts.

Remove the redundant macros and introduce a single 'PORTSC_RW1CS_BITS'
definition covering all RW1CS bits. Callers can mask out or extend the
set as needed for specific use cases.

This simplifies the code, avoids duplication, and makes the intent clearer
when handling PORTSC change/status bits.

Signed-off-by: Niklas Neronin <niklas.neronin@linux.intel.com>
---
 drivers/usb/host/xhci-hub.c  | 21 ++++-----------------
 drivers/usb/host/xhci-port.h |  7 ++++---
 drivers/usb/host/xhci.c      | 10 ++++++----
 3 files changed, 14 insertions(+), 24 deletions(-)

diff --git a/drivers/usb/host/xhci-hub.c b/drivers/usb/host/xhci-hub.c
index 48dda978d5a4..09b2ae3deb7b 100644
--- a/drivers/usb/host/xhci-hub.c
+++ b/drivers/usb/host/xhci-hub.c
@@ -18,8 +18,6 @@
 #include "xhci-trace.h"
 
 #define	PORT_WAKE_BITS	(PORT_WOE | PORT_WDE | PORT_WCE)
-#define	PORT_RWC_BITS	(PORT_CSC | PORT_PEC | PORT_WRC | PORT_OCC | \
-			 PORT_PRC | PORT_PLC | PORT_PED)
 
 /* Default sublink speed attribute of each lane */
 static u32 ssp_cap_default_ssa[] = {
@@ -410,15 +408,6 @@ static unsigned int xhci_port_speed(int portsc)
  * bits 4, 31
  */
 #define	XHCI_PORT_RW1S	(PORT_PR | PORT_WPR)
-/*
- * These bits are RW; writing a 1 clears the bit, writing a 0 has no effect:
- * bits 1, 17, 18, 19, 20, 21, 22, 23
- * port enable/disable, and
- * change bits: connect, PED, warm port reset changed (reserved zero for USB 2.0 ports),
- * over-current, reset, link state, and L1 change
- */
-#define XHCI_PORT_RW1CS	(PORT_PED | PORT_CSC | PORT_PEC | PORT_WRC | PORT_OCC | PORT_PRC | \
-			 PORT_PLC | PORT_CEC)
 /*
  * Bit 16 is RW, and writing a '1' to it causes the link state control to be
  * latched in
@@ -1339,10 +1328,8 @@ int xhci_hub_control(struct usb_hcd *hcd, u16 typeReq, u16 wValue,
 				 * Clear all change bits, so that we get a new
 				 * connection event.
 				 */
-				portsc |= PORT_CSC | PORT_PEC | PORT_WRC |
-					  PORT_OCC | PORT_PRC | PORT_PLC |
-					  PORT_CEC;
-				xhci_portsc_writel(port, portsc | PORT_PED);
+				portsc |= PORTSC_RW1CS_BITS;
+				xhci_portsc_writel(port, portsc);
 				portsc = xhci_portsc_readl(port);
 				break;
 			}
@@ -1835,7 +1822,7 @@ static bool xhci_port_missing_cas_quirk(struct xhci_port *port)
 		return false;
 
 	/* clear wakeup/change bits, and do a warm port reset */
-	portsc &= ~(PORT_RWC_BITS | PORT_CEC | PORT_WAKE_BITS);
+	portsc &= ~(PORTSC_RW1CS_BITS | PORT_WAKE_BITS);
 	portsc |= PORT_WPR;
 	xhci_portsc_writel(port, portsc);
 	/* flush write */
@@ -1915,7 +1902,7 @@ int xhci_bus_resume(struct usb_hcd *hcd)
 				break;
 			}
 		/* disable wake for all ports, write new link state if needed */
-		portsc &= ~(PORT_RWC_BITS | PORT_CEC | PORT_WAKE_BITS);
+		portsc &= ~(PORTSC_RW1CS_BITS | PORT_WAKE_BITS);
 		xhci_portsc_writel(ports[port_index], portsc);
 	}
 
diff --git a/drivers/usb/host/xhci-port.h b/drivers/usb/host/xhci-port.h
index 34f69f063b4f..28dafbd5ff45 100644
--- a/drivers/usb/host/xhci-port.h
+++ b/drivers/usb/host/xhci-port.h
@@ -116,9 +116,10 @@
 /* bit 30 - Device Removable, for USB 3.0 roothub emulation */
 #define PORT_DR		BIT(30)
 /* bit 31 - Warm Port Reset, complete when PORT_WRC is '1' */
-#define PORT_WPR		BIT(31)
-#define PORT_CHANGE_MASK	(PORT_CSC | PORT_PEC | PORT_WRC | PORT_OCC | \
-				 PORT_PRC | PORT_PLC | PORT_CEC)
+#define PORT_WPR	BIT(31)
+/* Writing 1 clears the bit, writing 0 sets the bit. */
+#define PORTSC_RW1CS_BITS	(PORT_PED | PORT_CSC | PORT_PEC | PORT_WRC | PORT_OCC | PORT_PRC | \
+				 PORT_PLC | PORT_CEC)
 
 /* We mark duplicate entries with -1 */
 #define DUPLICATE_ENTRY ((u8)(-1))
diff --git a/drivers/usb/host/xhci.c b/drivers/usb/host/xhci.c
index 6e33665b7321..0374b1b92810 100644
--- a/drivers/usb/host/xhci.c
+++ b/drivers/usb/host/xhci.c
@@ -914,6 +914,7 @@ static bool xhci_pending_portevent(struct xhci_hcd *xhci)
 	int			port_index;
 	u32			status;
 	u32			portsc;
+	u32			mask;
 
 	status = readl(&xhci->op_regs->status);
 	if (status & STS_EINT)
@@ -926,18 +927,19 @@ static bool xhci_pending_portevent(struct xhci_hcd *xhci)
 
 	port_index = xhci->usb2_rhub.num_ports;
 	ports = xhci->usb2_rhub.ports;
+	/* Check all Write-1-to-clear status bits, except for the Port Enadled bit. */
+	mask = PORTSC_RW1CS_BITS & ~PORT_PED;
 	while (port_index--) {
 		portsc = xhci_portsc_readl(ports[port_index]);
-		if (portsc & PORT_CHANGE_MASK ||
-		    FIELD_GET(PORT_PLS_MASK, portsc) == PLS_RESUME)
+		if (portsc & mask || FIELD_GET(PORT_PLS_MASK, portsc) == PLS_RESUME)
 			return true;
 	}
 	port_index = xhci->usb3_rhub.num_ports;
 	ports = xhci->usb3_rhub.ports;
+	mask |= PORT_CAS;
 	while (port_index--) {
 		portsc = xhci_portsc_readl(ports[port_index]);
-		if (portsc & (PORT_CHANGE_MASK | PORT_CAS) ||
-		    FIELD_GET(PORT_PLS_MASK, portsc) == PLS_RESUME)
+		if (portsc & mask || FIELD_GET(PORT_PLS_MASK, portsc) == PLS_RESUME)
 			return true;
 	}
 	return false;
-- 
2.50.1


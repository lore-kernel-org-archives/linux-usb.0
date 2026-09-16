Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72EE950C297
	for <linux-usb@vger.kernel.org>; Wed, 16 Sep 2026 14:16:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789568161; cv=none; b=G0kaWlfqdjkPiLoIyy4Le0+Lqet4WOzHl9DbCAxJOxVzhJDGe4n8z/wM2j1ejlCXNFU8h3gXpYUt3dVx8LMZKtf6t0Z4B0Gf+0V1yGUNdZI8v+bK6WsU2+L5jCigQ1P2OPy2XkII7WinYgDHQneqPJj6Ky3l0eJ7ulN/4KyptM4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789568161; c=relaxed/simple;
	bh=/3D0XTrZtaqEPjQYFo5/4Bc/cH6OFKrdpY2fJhEZcxk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QdmDyTWPGHjsJehlF9BPqGupcNBNggp3L/AThhqn2/NmjQRjc+oy5Tf6Z0ogQZ3CwZhu4uM84f8gIDJMEh4vjfbajBcO5DJWFpMhwta6uZBfN4h6RJuaGcf/L5P0D71LO3PvOv55rSUN1iL8uJimkyiQEODumcM9srPcOX4YuUA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=A6F5UUvc; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="A6F5UUvc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789568161; x=1821104161;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=/3D0XTrZtaqEPjQYFo5/4Bc/cH6OFKrdpY2fJhEZcxk=;
  b=A6F5UUvc2t/SRR6z5nymD3EG/ArrJyJVK7MjcGyHNeg/z3hjwMEqWYuS
   ZSqOyfeiX6/aAqPpq1w+7MsB1n8Ex9fOa5jn5ZxXNSsLDg3fkYqW2Z2Mo
   SW1VoLx57f18iAXfUnFAF8yK5DAMX4b7A2+QcSsthb8cbguet1llK3Yb1
   H8vLoiiHIw622WXkxJPdOO3x37y97o9w/A1jGorKBG7Ez2Xn972aQP5Y1
   WKBogr7kXUof25mAbzrVm32KBX2XKzuhcXd59T2e27m5UlQG7wPWuBVrI
   NQYCT9d4/8K8r1g/yRYdyAbcU/uJkiuKqixusZ4YM4/vn/cI10H/6Ol0j
   w==;
X-CSE-ConnectionGUID: 20sy2CTJQR6md2mYytrEHQ==
X-CSE-MsgGUID: i+DXZG4/TlSM3ZSouM8x7A==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="89967275"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="89967275"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2026 07:16:00 -0700
X-CSE-ConnectionGUID: EgdiqRXaSiSVyZ5czaBJ1A==
X-CSE-MsgGUID: KplTSuluTyieRFdGgv2W+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="270720132"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa008.fm.intel.com with ESMTP; 16 Sep 2026 07:15:59 -0700
Received: by black.igk.intel.com (Postfix, from userid 1058)
	id 157579D; Wed, 16 Sep 2026 16:15:58 +0200 (CEST)
From: Niklas Neronin <niklas.neronin@linux.intel.com>
To: mathias.nyman@linux.intel.com
Cc: linux-usb@vger.kernel.org,
	Niklas Neronin <niklas.neronin@linux.intel.com>
Subject: [PATCH v2 06/20] usb: xhci: rework USB3 PORTPMSC macros
Date: Wed, 16 Sep 2026 16:13:55 +0200
Message-ID: <20260916141409.629621-7-niklas.neronin@linux.intel.com>
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

Define macros to describe only the bit masks, and use the standard
FIELD_* helpers to extract, set, and update field values.

By consolidating macro usage and eliminating custom helpers, the code
becomes simpler and easier to follow. The use of standard bitfield
macros improves readability and enforces consistent register field
handling.

Signed-off-by: Niklas Neronin <niklas.neronin@linux.intel.com>
---
 drivers/usb/host/xhci-hub.c  |  6 ++----
 drivers/usb/host/xhci-port.h | 23 ++++++++++++++---------
 2 files changed, 16 insertions(+), 13 deletions(-)

diff --git a/drivers/usb/host/xhci-hub.c b/drivers/usb/host/xhci-hub.c
index d464f261284d..e2b1986d217c 100644
--- a/drivers/usb/host/xhci-hub.c
+++ b/drivers/usb/host/xhci-hub.c
@@ -1493,8 +1493,7 @@ int xhci_hub_control(struct usb_hcd *hcd, u16 typeReq, u16 wValue,
 
 			timeout = (wIndex & 0xff00) >> 8;
 			portpmsc = readl(&port->port_reg->portpmsc);
-			portpmsc &= ~PORT_U1_TIMEOUT_MASK;
-			portpmsc |= PORT_U1_TIMEOUT(timeout);
+			FIELD_MODIFY(PORT_U1_TIMEOUT_MASK, &portpmsc, timeout);
 			writel(portpmsc, &port->port_reg->portpmsc);
 			break;
 		case USB_PORT_FEAT_U2_TIMEOUT:
@@ -1503,8 +1502,7 @@ int xhci_hub_control(struct usb_hcd *hcd, u16 typeReq, u16 wValue,
 
 			timeout = (wIndex & 0xff00) >> 8;
 			portpmsc = readl(&port->port_reg->portpmsc);
-			portpmsc &= ~PORT_U2_TIMEOUT_MASK;
-			portpmsc |= PORT_U2_TIMEOUT(timeout);
+			FIELD_MODIFY(PORT_U2_TIMEOUT_MASK, &portpmsc, timeout);
 			writel(portpmsc, &port->port_reg->portpmsc);
 			break;
 		case USB_PORT_FEAT_TEST:
diff --git a/drivers/usb/host/xhci-port.h b/drivers/usb/host/xhci-port.h
index dca6d5c7ad1e..fb4a2c4f7691 100644
--- a/drivers/usb/host/xhci-port.h
+++ b/drivers/usb/host/xhci-port.h
@@ -117,16 +117,21 @@
 /* We mark duplicate entries with -1 */
 #define DUPLICATE_ENTRY ((u8)(-1))
 
-/* Port Power Management Status and Control - port_power_base bitmasks */
-/* Inactivity timer value for transitions into U1, in microseconds.
- * Timeout can be up to 127us.  0xFF means an infinite timeout.
+/* USB3 Port Power Management Status and Control (PORTPMSC) 5.4.9.1 */
+/*
+ * bits 7:0 - U1 Timeout, inactivity timer value for transitions into U1.
+ * Timeout can be 0us to 127us (0x7f), in 1us increments.
+ * Value 0xff means an infinite timeout.
  */
-#define PORT_U1_TIMEOUT(p)	((p) & 0xff)
-#define PORT_U1_TIMEOUT_MASK	0xff
-/* Inactivity timer value for transitions into U2 */
-#define PORT_U2_TIMEOUT(p)	(((p) & 0xff) << 8)
-#define PORT_U2_TIMEOUT_MASK	(0xff << 8)
-/* Bits 24:31 for port testing */
+#define PORT_U1_TIMEOUT_MASK	GENMASK(7, 0)
+/*
+ * bits 15:8 - U2 Timeout, inactivity timer value for transitions into U2.
+ * Timeout can be 0us to 65024ms (0xfe), in 256us increments.
+ * Value 0xff means an infinite timeout.
+ */
+#define PORT_U2_TIMEOUT_MASK	GENMASK(15, 8)
+/* bit 16 - Force Link PM Accept (FLA) */
+/* bits 31:17 - RsvdP */
 
 /* USB2 Protocol PORTSPMSC */
 #define	PORT_L1S_MASK		7
-- 
2.50.1


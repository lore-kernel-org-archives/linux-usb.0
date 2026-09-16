Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B6AD503BF4
	for <linux-usb@vger.kernel.org>; Wed, 16 Sep 2026 14:16:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789568174; cv=none; b=BCf0OfQqKIQ4fBPgoShL9xQ5XdUUrmB2B5MLkib+4TgI7yedUO0E8xJCHU9xUP1X4D6nyfCC928cAprh3jZYrPdnsEyHxBvJjU4X/mqYCnor7WQ6JRBrRiPi3ZtYl41n2B/Z3yRDUYpfZKTlPN79Vc4DUYqVf5yyYi6OWKmHX14=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789568174; c=relaxed/simple;
	bh=mwSayd4y2O6p7xRUZDJJB4goM7IWlgRUgUnnHvsjIBU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EHpB/hxbENY5zHM+wHmtCXiyCH3HarHjvd9Z7DyzSlvwiaWorS9WjPUBnE1IfdnjMPcf6b7TtNiKUcsA8YDqsKA+bj19TgTdrG2vo4fNLTYNz9pK1p35ILNc3RlbJNRfGZF0dJBkNmnDAl7Opjk2EPwXosx6qdDUOUlFyTvKv80=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=C+keytoM; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="C+keytoM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789568174; x=1821104174;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=mwSayd4y2O6p7xRUZDJJB4goM7IWlgRUgUnnHvsjIBU=;
  b=C+keytoMBAV4iXwsdHsFqcBf+jvFas+qqGTs94TKVV2qKibAqKHiYoZ1
   orbBNvP9uergP+oMkmrN3d+ej0CfWaJKFfV+EzlTu0HSujThaLbT61/0+
   aObTwRcXJDsQUSK+wDPlth2dJgFbTk/AzpFpWGBfCuHqjNe6sT9aAJ5v4
   66ZZjSF7vttv7f7J2I3Y/ugxMqFc5UgXsYijT3o2OOSrr6EB9hHkmnpmf
   sQEB/yTjDj1irp+9FkzjCBqmnReI2mdIQ/HmG7+FATQdBc5ocGSMp/lKI
   aI+xzsVPA+UjuKrxByvELLite3oqNytZiE+Ou1Ik0J1CxAXDy/cSnTzhc
   g==;
X-CSE-ConnectionGUID: gjmLknPsT9+YWe5iLaW0XQ==
X-CSE-MsgGUID: A4FjanKDQmiYBSIMpFk5qw==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="89967316"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="89967316"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2026 07:16:13 -0700
X-CSE-ConnectionGUID: HwAtNqL5TaSwdgrUzTGs/g==
X-CSE-MsgGUID: HOa2/NjbTmisT4a390NHkw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="270720217"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa008.fm.intel.com with ESMTP; 16 Sep 2026 07:16:12 -0700
Received: by black.igk.intel.com (Postfix, from userid 1058)
	id 5761D99; Wed, 16 Sep 2026 16:16:11 +0200 (CEST)
From: Niklas Neronin <niklas.neronin@linux.intel.com>
To: mathias.nyman@linux.intel.com
Cc: linux-usb@vger.kernel.org,
	Niklas Neronin <niklas.neronin@linux.intel.com>
Subject: [PATCH v2 17/20] usb: xhci: relocate all port register macros to xhci-port.h
Date: Wed, 16 Sep 2026 16:14:06 +0200
Message-ID: <20260916141409.629621-18-niklas.neronin@linux.intel.com>
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

Move all port register macros to xhci-port.h and place them next to the
corresponding macros for improved organization and readability.

Rename the macros to PORTSC_*_BITS to better reflect that they describe
bitfields within the PORTSC register rather than the entire port
register.

Remove macro XHCI_PORT_RZ.

Signed-off-by: Niklas Neronin <niklas.neronin@linux.intel.com>
---
 drivers/usb/host/xhci-hub.c  | 35 +----------------------------------
 drivers/usb/host/xhci-port.h | 10 ++++++++++
 drivers/usb/host/xhci.c      |  2 --
 3 files changed, 11 insertions(+), 36 deletions(-)

diff --git a/drivers/usb/host/xhci-hub.c b/drivers/usb/host/xhci-hub.c
index 48814dea1b60..5f389773041d 100644
--- a/drivers/usb/host/xhci-hub.c
+++ b/drivers/usb/host/xhci-hub.c
@@ -17,8 +17,6 @@
 #include "xhci.h"
 #include "xhci-trace.h"
 
-#define	PORT_WAKE_BITS	(PORT_WOE | PORT_WDE | PORT_WCE)
-
 /* Default sublink speed attribute of each lane */
 static u32 ssp_cap_default_ssa[] = {
 	0x00050034, /* USB 3.0 SS Gen1x1 id:4 symmetric rx 5Gbps */
@@ -388,37 +386,6 @@ static unsigned int xhci_port_speed(int portsc)
 	return 0;
 }
 
-/*
- * These bits are Read Only (RO) and should be saved and written to the
- * registers: 0, 3, 10:13, 24, 30
- * connect status, over-current status, port speed, and device removable.
- * connect status and port speed are also sticky - meaning they're in
- * the AUX well and they aren't changed by a hot, warm, or cold reset.
- */
-#define	XHCI_PORT_RO	(PORT_CCS | PORT_OCA | PORT_SPEED_MASK | PORT_CAS | PORT_DR)
-/*
- * These bits are RW; writing a 0 clears the bit, writing a 1 sets the bit:
- * bits 5:8, 9, 14:15, 25, 26, 27
- * link state, port power, port indicator state, "wake on" enable state
- */
-#define XHCI_PORT_RWS	(PORT_PLS_MASK | PORT_PP | PORT_PIC_MASK | PORT_WCE | \
-			 PORT_WDE | PORT_WOE)
-/*
- * These bits are RW; writing a 1 sets the bit, writing a 0 has no effect:
- * bits 4, 31
- */
-#define	XHCI_PORT_RW1S	(PORT_PR | PORT_WPR)
-/*
- * Bit 16 is RW, and writing a '1' to it causes the link state control to be
- * latched in
- */
-#define	XHCI_PORT_RW	(PORT_LWS)
-/*
- * These bits are Reserved Zero (RsvdZ) and zero should be written to them:
- * bits 2, 28:31
- */
-#define	XHCI_PORT_RZ	((1<<2) | (0xf<<28))
-
 /**
  * xhci_port_state_to_neutral() - Clean up read portsc value back into writeable
  * @portsc: u32 port value read from portsc register to be cleanup up
@@ -437,7 +404,7 @@ static unsigned int xhci_port_speed(int portsc)
 u32 xhci_port_state_to_neutral(u32 portsc)
 {
 	/* Save read-only status and port state */
-	return (portsc & XHCI_PORT_RO) | (portsc & XHCI_PORT_RWS);
+	return (portsc & PORTSC_RO_BITS) | (portsc & PORTSC_RWS_BITS);
 }
 EXPORT_SYMBOL_GPL(xhci_port_state_to_neutral);
 
diff --git a/drivers/usb/host/xhci-port.h b/drivers/usb/host/xhci-port.h
index 78735dc0e899..074300acf361 100644
--- a/drivers/usb/host/xhci-port.h
+++ b/drivers/usb/host/xhci-port.h
@@ -112,14 +112,24 @@
 #define PORT_WDE	BIT(26)
 /* bit 27 - Wake on Over-current Enable */
 #define PORT_WOE	BIT(27)
+#define	PORT_WAKE_BITS	(PORT_WOE | PORT_WDE | PORT_WCE)
 /* bits 29:28 - RsvdZ */
 /* bit 30 - Device Removable, for USB 3.0 roothub emulation */
 #define PORT_DR		BIT(30)
 /* bit 31 - Warm Port Reset, complete when PORT_WRC is '1' */
 #define PORT_WPR		BIT(31)
+/* These bits are read-only, should be saved and written to the registers. */
+#define	PORTSC_RO_BITS		(PORT_CCS | PORT_OCA | PORT_SPEED_MASK | PORT_CAS | PORT_DR)
+/* Writing 0 clears the bit, writing 1 sets the bit. */
+#define PORTSC_RWS_BITS		(PORT_PLS_MASK | PORT_PP | PORT_PIC_MASK | PORT_WCE | \
+				 PORT_WDE | PORT_WOE)
 /* Writing 1 clears the bit, writing 0 has no effect. */
 #define PORTSC_RW1CS_BITS	(PORT_PED | PORT_CSC | PORT_PEC | PORT_WRC | PORT_OCC | PORT_PRC | \
 				 PORT_PLC | PORT_CEC)
+/* Writing 1 sets the bit, writing 0 has no effect. */
+#define PORTSC_RW1S_BITS	(PORT_PR | PORT_WPR)
+/* Writing 1 sets the bit, writing 0 clears the bit. */
+#define	PORTSC_RW_BITS		(PORT_LWS)
 
 /* We mark duplicate entries with -1 */
 #define DUPLICATE_ENTRY ((u8)(-1))
diff --git a/drivers/usb/host/xhci.c b/drivers/usb/host/xhci.c
index 9fc5b30c75ec..8ccf796e5989 100644
--- a/drivers/usb/host/xhci.c
+++ b/drivers/usb/host/xhci.c
@@ -31,8 +31,6 @@
 #define DRIVER_AUTHOR "Sarah Sharp"
 #define DRIVER_DESC "'eXtensible' Host Controller (xHC) Driver"
 
-#define	PORT_WAKE_BITS	(PORT_WOE | PORT_WDE | PORT_WCE)
-
 /* Some 0.95 hardware can't handle the chain bit on a Link TRB being cleared */
 static int link_quirk;
 module_param(link_quirk, int, S_IRUGO | S_IWUSR);
-- 
2.50.1


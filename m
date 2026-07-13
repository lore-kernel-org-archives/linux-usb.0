Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12CB03E1693
	for <linux-usb@vger.kernel.org>; Mon, 13 Jul 2026 10:48:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783939740; cv=none; b=DEKjI2OJAQ9vPIb+SCZQmEuOsEAk4trngCIQfIZfubIMMZ2hwq2ZbAbNKkRxa27fXVliUId+ayx7eA4csV3+OqQ3FGLzTMeIisK/prNlCIy/WSFKGjLAyTLX/ZO+MaEEKyqkCjERB6q7E18jvD1Gj/TLLJWBWt7cm0nyfN++blA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783939740; c=relaxed/simple;
	bh=4aAeGj+L+e7MTa71Cuqhww22p4wnFpLEyfPXa67WJnc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tzZuhHbVT0EJQMAaecrFdVaR/WpSa/Gl3PJnI6AXueoidODM6ZXNOjXeURPvUQsDgRQMMs6wlOv4AZKRGHSwgc6VXLuebm21ceCdvq8P3uo70vXY6cQ8l4o/V+UjMwRuxM1WVDsHwtK0O7jvWyCTeigHduGGtmfU6Drqv8ragLk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NUnWx69r; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NUnWx69r"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783939739; x=1815475739;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=4aAeGj+L+e7MTa71Cuqhww22p4wnFpLEyfPXa67WJnc=;
  b=NUnWx69r9uwvknnjiwKsuoijJ1Bu+tEJ24jT6KbvGdMiWaHxMPTTWUH2
   VjbrVhDWuBjeePFAJb0QXNQAdHgx2LB3O8DYojF+q/7WjFp+Blrf7T+6h
   h+yfFlfJ1JZAgiPGezSaeL/yiz9CQd36Xe1q/5RUNeO9uNY7ZcsECcbL9
   VGwT4RNJ1Fw+L+ul9miLIMYnL/eGh0VZnfMZfwETD219hf5rb+VtJCbBk
   pOe5L+RkPUACrqkkIunbJgzHBGuEKXdB7zpM+XJ8CkLblruabFuewjk8d
   t71sAfKIEoFBxkD4aO9eFeW+rAmkQ989v2n08E+nUlJmttL7XPMTdKhrV
   Q==;
X-CSE-ConnectionGUID: SKiOnGIvS1yyXgTNYKPhSg==
X-CSE-MsgGUID: yZKKkleGQC2ioswqpF5qag==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="96057038"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="96057038"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jul 2026 03:48:48 -0700
X-CSE-ConnectionGUID: KB+VriCbTve5Rx7k2Sjupg==
X-CSE-MsgGUID: 0eIdwFuyQ1KiKharK7Aqtw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="279928981"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa001.fm.intel.com with ESMTP; 13 Jul 2026 03:48:46 -0700
Received: by black.igk.intel.com (Postfix, from userid 1058)
	id 43FD898; Mon, 13 Jul 2026 12:48:46 +0200 (CEST)
From: Niklas Neronin <niklas.neronin@linux.intel.com>
To: mathias.nyman@linux.intel.com
Cc: linux-usb@vger.kernel.org,
	Niklas Neronin <niklas.neronin@linux.intel.com>
Subject: [PATCH 13/22] usb: xhci: replace magic numbers with Port macros
Date: Mon, 13 Jul 2026 12:47:27 +0200
Message-ID: <20260713104738.629612-14-niklas.neronin@linux.intel.com>
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

No functional change.

Replace open-coded bit masks with the corresponding symbolic PORT_* macros.

This removes hard-coded shifts and masks (e.g. (1 << n), (x << m))
in favor of named definitions, making the code easier to read and modify
in future patches.

Signed-off-by: Niklas Neronin <niklas.neronin@linux.intel.com>
---
 drivers/usb/host/xhci-hub.c | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/drivers/usb/host/xhci-hub.c b/drivers/usb/host/xhci-hub.c
index 16574467bfdc..c9f73054737d 100644
--- a/drivers/usb/host/xhci-hub.c
+++ b/drivers/usb/host/xhci-hub.c
@@ -397,18 +397,19 @@ static unsigned int xhci_port_speed(int portsc)
  * connect status and port speed are also sticky - meaning they're in
  * the AUX well and they aren't changed by a hot, warm, or cold reset.
  */
-#define	XHCI_PORT_RO	((1<<0) | (1<<3) | (0xf<<10) | (1<<30))
+#define	XHCI_PORT_RO	(PORT_CCS | PORT_OCA | PORT_SPEED_MASK | PORT_DR)
 /*
  * These bits are RW; writing a 0 clears the bit, writing a 1 sets the bit:
- * bits 5:8, 9, 14:15, 25:27
+ * bits 5:8, 9, 14:15, 25, 26, 27
  * link state, port power, port indicator state, "wake on" enable state
  */
-#define XHCI_PORT_RWS	((0xf<<5) | (1<<9) | (0x3<<14) | (0x7<<25))
+#define XHCI_PORT_RWS	(PORT_PLS_MASK | PORT_PP | PORT_PIC_MASK | PORT_WCE | \
+			 PORT_WDE | PORT_WOE)
 /*
  * These bits are RW; writing a 1 sets the bit, writing a 0 has no effect:
  * bit 4 (port reset)
  */
-#define	XHCI_PORT_RW1S	((1<<4))
+#define	XHCI_PORT_RW1S	(PORT_PR)
 /*
  * These bits are RW; writing a 1 clears the bit, writing a 0 has no effect:
  * bits 1, 17, 18, 19, 20, 21, 22, 23
@@ -416,12 +417,13 @@ static unsigned int xhci_port_speed(int portsc)
  * change bits: connect, PED, warm port reset changed (reserved zero for USB 2.0 ports),
  * over-current, reset, link state, and L1 change
  */
-#define XHCI_PORT_RW1CS	((1<<1) | (0x7f<<17))
+#define XHCI_PORT_RW1CS	(PORT_PED | PORT_CSC | PORT_PEC | PORT_WRC | PORT_OCC | PORT_PRC | \
+			 PORT_PLC | PORT_CEC)
 /*
  * Bit 16 is RW, and writing a '1' to it causes the link state control to be
  * latched in
  */
-#define	XHCI_PORT_RW	((1<<16))
+#define	XHCI_PORT_RW	(PORT_LWS)
 /*
  * These bits are Reserved Zero (RsvdZ) and zero should be written to them:
  * bits 2, 24, 28:31
-- 
2.50.1


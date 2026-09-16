Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 239D250EC1D
	for <linux-usb@vger.kernel.org>; Wed, 16 Sep 2026 14:16:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789568166; cv=none; b=IEydeRsaN/lSbcxOBXjvyw7HT10oThA6sJjJZxGR7ONAOJEDKYtGnKGhNc3zLWp1nE228l44v2ppdosWc1mrwnMC5YrQ3CsJvl31MAt1TsyLrPpknWNDagTaAyZpBKsrx4havOa6DN8EAAD2alU/iyTd3bWFZn0f6CoGh0w5GZ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789568166; c=relaxed/simple;
	bh=Tk/ox+qnWes6vYiMa9ePM02KnQqSTAzPsHRzNHYznPA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mLjWDP6DfYG6YOXYB8Y8VehmC264iPtOtnEZO4ZSNNMu0VMsqnXyVfCxKqHfJTWpkgFyWOINuqUXM+pJNkymis6XiE6JGeG7jTfbQ91pwLZA3OOJW4+cs2vVZe+ALB1TC7U2XeGx7AXuuZOiAr5fudu8SQwWXB/ZEYaeYdojO70=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VzM2QiO9; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VzM2QiO9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789568165; x=1821104165;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Tk/ox+qnWes6vYiMa9ePM02KnQqSTAzPsHRzNHYznPA=;
  b=VzM2QiO9/4C3PuSGKhbyfstBIPhN+9y2L2pboLAntKpt0uCq70pmVgIW
   xtkDjA+F/BRpHrj9WsuDl/6Zuk/ufdDbOMBq1QIHo0WejIq9QEkY0tCGO
   /2vJ4/rtGjQLlkZmN2qRa7cwtritylh1oisgct+0px9v7xD1PTVAo15Lv
   xq5kf9uycQN3MzqYbDI66lNGujWD2iwYo829Yaa8XhhTsaWmB4geYZZzA
   ufzrkExNle6Pxup1HDfb7zROouv5Pi7bm96y7K4UMmZjnJ63vzVQjCp36
   9vgmIYH0s42ShmDFLr5+ja5XALe8J1xDaF+IkBrUXVDjd4HyWKej03d29
   w==;
X-CSE-ConnectionGUID: TgcXcHNTSh+ut5Vctrappg==
X-CSE-MsgGUID: bjWTyEDdTPGLR0HPvCVS2A==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="89967297"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="89967297"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2026 07:16:05 -0700
X-CSE-ConnectionGUID: yXWwNJp3Q6aUfGz5mIxLfA==
X-CSE-MsgGUID: 8swn0713T7SapL0vmm2Q1w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="270720170"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa008.fm.intel.com with ESMTP; 16 Sep 2026 07:16:04 -0700
Received: by black.igk.intel.com (Postfix, from userid 1058)
	id A70C69B; Wed, 16 Sep 2026 16:16:03 +0200 (CEST)
From: Niklas Neronin <niklas.neronin@linux.intel.com>
To: mathias.nyman@linux.intel.com
Cc: linux-usb@vger.kernel.org,
	Niklas Neronin <niklas.neronin@linux.intel.com>
Subject: [PATCH v2 14/20] usb: xhci: replace magic numbers with Port macros
Date: Wed, 16 Sep 2026 16:14:03 +0200
Message-ID: <20260916141409.629621-15-niklas.neronin@linux.intel.com>
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
index c3e57acdad2a..fb75a171f5a0 100644
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


Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6943C3E7BA9
	for <linux-usb@vger.kernel.org>; Mon, 13 Jul 2026 10:48:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783939727; cv=none; b=D2B6TwpzmLMyl4R0WZo1Io7pOEtWcKQ13m7pIkl8X9403EzPvbi4XGc7UcCikNcLZZzw0wmWhuUypddGlyYiYeJes6d9yG+CLXX+U26BicxxlNs9TfyJtPsjz/R5qFILoYQPNdzMX9dS9bQSEyR2nwvXV8D0fDvoS72kjObEc6w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783939727; c=relaxed/simple;
	bh=HTA8zhlnGAJvGjpaHIo3uOMKRVWdeb7Qr+LF5D4f3Ng=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IgSD4NXoO72jMUD3jdicMeTTcEY0dDqfO3ctqtxbLxTfiRv3iM9b27J/E4jI1XYA/8o+cMz7etqzlltpemJfJFME8F1bJZmBKv2ia1U0CU9qD/83NqaxxKSgLD7123jvronf46q/PutPNF4vtMDO8Y8G5v2N3IwosUJaeJPr1qc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jbG9LG2R; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jbG9LG2R"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783939727; x=1815475727;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=HTA8zhlnGAJvGjpaHIo3uOMKRVWdeb7Qr+LF5D4f3Ng=;
  b=jbG9LG2RjnE365bZATXr51AiFaCeT1a4PR/oQcdiEFgFFW14E9tdD8kr
   b5vwOAQrxDTK3q3ZYPuNaXsQbNgyyK/HjdK6EQuryPIwcg0wrMh+xme9f
   2/fYLEyTDqhaDmOMV2+Cxn9fmX9bW2MNB9tD/Im/HFN/NFTCgrUPW9/Aq
   Kdw6qwwd8B/OHsjOW+IZOjOmDYQuGIkj4cLnBKYHRKWegqiOvW9zUEbPY
   rA0wSvGl47Ly9uRPZdD1H9m3KeWtYrOt73Ntiix3h+izC+v1JAbABEi6z
   ej9pDeb6LDwfzhtRickw/i8VHcr8kA8oyjLsAYwNz5tVo+SRSjhBEZnYU
   A==;
X-CSE-ConnectionGUID: xgTnXmTmTbOn/gxOFAYKCQ==
X-CSE-MsgGUID: vmb58rIdSOGMRTTHcyyxxQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="96057032"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="96057032"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jul 2026 03:48:45 -0700
X-CSE-ConnectionGUID: q4pSsFr0Tj60RJsbmi44MQ==
X-CSE-MsgGUID: WXyQEWliQdKVpMPfqkGdtQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="279928975"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa001.fm.intel.com with ESMTP; 13 Jul 2026 03:48:43 -0700
Received: by black.igk.intel.com (Postfix, from userid 1058)
	id 19C2699; Mon, 13 Jul 2026 12:48:43 +0200 (CEST)
From: Niklas Neronin <niklas.neronin@linux.intel.com>
To: mathias.nyman@linux.intel.com
Cc: linux-usb@vger.kernel.org,
	Niklas Neronin <niklas.neronin@linux.intel.com>
Subject: [PATCH 07/22] usb: xhci: rework USB3 PORTLI macros
Date: Mon, 13 Jul 2026 12:47:21 +0200
Message-ID: <20260713104738.629612-8-niklas.neronin@linux.intel.com>
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

Define macros to describe only the bit masks, and use the standard
FIELD_* helpers to extract, set, and update field values.

By consolidating macro usage and eliminating custom helpers, the code
becomes simpler and easier to follow. The use of standard bitfield
macros improves readability and enforces consistent register field
handling.

Signed-off-by: Niklas Neronin <niklas.neronin@linux.intel.com>
---
 drivers/usb/host/xhci-debugfs.c |  7 +++++--
 drivers/usb/host/xhci-hub.c     |  4 ++--
 drivers/usb/host/xhci-port.h    | 12 ++++++++----
 3 files changed, 15 insertions(+), 8 deletions(-)

diff --git a/drivers/usb/host/xhci-debugfs.c b/drivers/usb/host/xhci-debugfs.c
index 6ca3450ebe31..4c345d18c33b 100644
--- a/drivers/usb/host/xhci-debugfs.c
+++ b/drivers/usb/host/xhci-debugfs.c
@@ -7,6 +7,7 @@
  * Author: Lu Baolu <baolu.lu@linux.intel.com>
  */
 
+#include <linux/bitfield.h>
 #include <linux/slab.h>
 #include <linux/uaccess.h>
 
@@ -401,8 +402,10 @@ static int xhci_portli_show(struct seq_file *s, void *unused)
 
 	/* PORTLI fields are valid if port is a USB3 or eUSB2V2 port */
 	if (port->rhub == &xhci->usb3_rhub)
-		seq_printf(s, "0x%08x LEC=%u RLC=%u TLC=%u\n", portli,
-			   PORT_LEC(portli), PORT_RX_LANES(portli), PORT_TX_LANES(portli));
+		seq_printf(s, "0x%08x LEC=%lu RLC=%lu TLC=%lu\n", portli,
+			   FIELD_GET(PORT_LEC_MASK, portli),
+			   FIELD_GET(PORT_RLC_MASK, portli),
+			   FIELD_GET(PORT_TLC_MASK, portli));
 	else if (xhci->hcc_params2 & HCC2_E2V2C)
 		seq_printf(s, "0x%08x RDR=%u TDR=%u\n", portli,
 			   PORTLI_RDR(portli), PORTLI_TDR(portli));
diff --git a/drivers/usb/host/xhci-hub.c b/drivers/usb/host/xhci-hub.c
index 0945fff4f94c..d5e9728e1785 100644
--- a/drivers/usb/host/xhci-hub.c
+++ b/drivers/usb/host/xhci-hub.c
@@ -1013,8 +1013,8 @@ static u32 xhci_get_ext_port_status(u32 portsc, u32 port_li)
 	ext_stat |= speed_id;		/* bits 3:0, RX speed id */
 	ext_stat |= speed_id << 4;	/* bits 7:4, TX speed id */
 
-	ext_stat |= PORT_RX_LANES(port_li) << 8;  /* bits 11:8 Rx lane count */
-	ext_stat |= PORT_TX_LANES(port_li) << 12; /* bits 15:12 Tx lane count */
+	ext_stat |= FIELD_PREP(PORT_RLC_MASK, port_li) << 8;  /* bits 11:8 Rx lane count */
+	ext_stat |= FIELD_PREP(PORT_TLC_MASK, port_li) << 12; /* bits 15:12 Tx lane count */
 
 	return ext_stat;
 }
diff --git a/drivers/usb/host/xhci-port.h b/drivers/usb/host/xhci-port.h
index f8506ae8dfb7..191cae8fff1e 100644
--- a/drivers/usb/host/xhci-port.h
+++ b/drivers/usb/host/xhci-port.h
@@ -152,10 +152,14 @@
 /* bits 31:28 - Port Test Control */
 #define PORT_TEST_MODE_MASK	GENMASK(31, 28)
 
-/* USB3 Protocol PORTLI  Port Link Information */
-#define PORT_LEC(p)		((p) & 0xffff)
-#define PORT_RX_LANES(p)	(((p) >> 16) & 0xf)
-#define PORT_TX_LANES(p)	(((p) >> 20) & 0xf)
+/* USB3 Port Link Info Register (PORTLI) 5.4.10.1 */
+/* bits 15:0 - Link Error Count */
+#define PORT_LEC_MASK		GENMASK(15, 0)
+/* bits 19:16 - Rx Lane Count */
+#define PORT_RLC_MASK		GENMASK(19, 16)
+/* bits 23:20 - Tx Lane Count */
+#define PORT_TLC_MASK		GENMASK(23, 20)
+/* bits 31:24 - RsvdP */
 
 /* eUSB2v2 protocol PORTLI Port Link information, RsvdP for normal USB2 */
 #define PORTLI_RDR(p)		((p) & 0xf)
-- 
2.50.1


Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A87373E2746
	for <linux-usb@vger.kernel.org>; Mon, 13 Jul 2026 10:48:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783939726; cv=none; b=OVD4DtvEw75q3Cw+ivH7qEm/O+q5NyQcgomL1G/EPoRYRRzM60jSJaOeNMYfkChvyyvGT7juj5/jlia4ctA4NupO4rw+SoVXdTgAbl51l3txct5GejNJtzBFbLX/VnuYiLtlC5xWS/n66tSLDxtTPeewGwjWWOmspWhoaT11PbI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783939726; c=relaxed/simple;
	bh=BW183mIu9uG7GgXc7OgIGi90mQS5LHdJ0GmSiEtVX3A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=B0s7/9kZkv9if72FhpffHeRXsy0EvYJkVBV6zK/J3tedcOKP12W1rGCY7nQocD2mGDBaxeZ5fs6IgwRxIzRDC8XhoYJLM2/IjdWsJIN6Jn8nmCZvkcoOsdGbu/nP1yhKRdu/HzHeZBcdJjuSwl6z551vL5UuiSPCwOh5tf3pM50=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gvLdPkKS; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gvLdPkKS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783939725; x=1815475725;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=BW183mIu9uG7GgXc7OgIGi90mQS5LHdJ0GmSiEtVX3A=;
  b=gvLdPkKSem2+Mcc/iTs7eQljp8iCutyGbspgJz0eRq1WfYWuQfBSPGJF
   Hwmrdamh7KcUobEeXuugFRWaX3NHw0aSs59Q9l5GrQPxTANOhJ8fCmFX1
   /cLtxfZAl3+BVimrXYRPo5gqayh9HsGh6+Cp4t/fbP2S6zHjgYx84Xv6M
   fijJQJNfvgbjNyn0HgvzP1aYH4uZ9GPjzbsuWL0kNBB/RFwVNGaAYPB0b
   PpHec0aUrYk0meI/CVvt8XutqRHPswC9IF+GOV5HZT4StFFv8EupvUryP
   M1q6tV+NmvJLRkg/mFQkajBOqag+IxERTrlx5zh1Y7A3aT20RcS6/Qp+e
   A==;
X-CSE-ConnectionGUID: sM46QFUZTqaAE3eIAqxl/Q==
X-CSE-MsgGUID: Xla8rLPCRaCf+tEsTaxBGw==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="96057030"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="96057030"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jul 2026 03:48:44 -0700
X-CSE-ConnectionGUID: PnCqru8dQQyg6GbTpBhAyw==
X-CSE-MsgGUID: wTDOO27kSbKB2DyAaoCLdw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="279928971"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa001.fm.intel.com with ESMTP; 13 Jul 2026 03:48:42 -0700
Received: by black.igk.intel.com (Postfix, from userid 1058)
	id 00BCD95; Mon, 13 Jul 2026 12:48:41 +0200 (CEST)
From: Niklas Neronin <niklas.neronin@linux.intel.com>
To: mathias.nyman@linux.intel.com
Cc: linux-usb@vger.kernel.org,
	Niklas Neronin <niklas.neronin@linux.intel.com>
Subject: [PATCH 05/22] usb: xhci: rework USB3 PORTPMSC macros
Date: Mon, 13 Jul 2026 12:47:19 +0200
Message-ID: <20260713104738.629612-6-niklas.neronin@linux.intel.com>
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
 drivers/usb/host/xhci-hub.c  |  6 ++----
 drivers/usb/host/xhci-port.h | 23 ++++++++++++++---------
 2 files changed, 16 insertions(+), 13 deletions(-)

diff --git a/drivers/usb/host/xhci-hub.c b/drivers/usb/host/xhci-hub.c
index e5ff6d10fba2..897de2e14b65 100644
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
index 7bbc3105aba1..6dea904f3bc8 100644
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


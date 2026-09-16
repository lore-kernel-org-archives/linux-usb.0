Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6F0041F35C
	for <linux-usb@vger.kernel.org>; Wed, 16 Sep 2026 14:16:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789568163; cv=none; b=P+TpAX6kM9UN71kJQsP16MF82L72id0YYlLXiTn9cLHxHmiatAkq7qdE8Z28eLtCXvqtLhtLFd03Xvyl5IV8bnbxobgfhdxhPY5FD8z3+aADsu/nZdkkEiCdfYHihComloBw44uMKI+0Y3bB0JX+7feXcP+1cH1QEM9TjlpzzBQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789568163; c=relaxed/simple;
	bh=k95x0+H6ayYJuV+4awGEVjSr/F/TEbhTERNx2Cm3IOw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=r1AzSIIVye4UIYUX614ZfB6l6GtKhQqJ6j4Tw0RyBztCXejUFAZXCI4A6DI2OFXZ58h8wZlSROcR6TdqV7AACXFxLdyJePoLX54ux+9HvPE/qQS6FZFNPkR0t6LCjXEYXcFJyiqcO8YMqSHdUgrpdEcDT1dQhi/uzbVqzVWYXMM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ApJfIk3D; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ApJfIk3D"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789568162; x=1821104162;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=k95x0+H6ayYJuV+4awGEVjSr/F/TEbhTERNx2Cm3IOw=;
  b=ApJfIk3D4LxhPFLkUVbYoBU/QElHFozR8O8MrZzwYLDxln7aIkUfGf9i
   Eo0s6dzI/R0+PGf1k4NtsnVwtWD15//JfJB7gnjANdujbpeZeH6oFpZsf
   kqKd1L7XmRXN8Ds//O5bjj5ua4YONYPycfuYYxyJ0j022NDPYOB97tLXt
   L1fZDPlaNAbq7pf8PSs6JTrDnY9oFDTdU9EcWvjDRJHOLRVTj2LxsqpMQ
   NZFl+Dr/0p2wn346lxMBQxeoYIWsjMeayvKM9Ot91w1M3wRQuIW4OS0xV
   c/kPDkI4Xz8Dk9h2dDfvlWjBJGQc/XXqshJ4kIG1jPWZpGgxBUHNGgzra
   Q==;
X-CSE-ConnectionGUID: CUOd7jClRXOBI2LXyawvVA==
X-CSE-MsgGUID: zb79M2J+QjujkbP+NZSpGA==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="89967276"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="89967276"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2026 07:16:00 -0700
X-CSE-ConnectionGUID: liwHUxkaRHOwcl4pa2I8vQ==
X-CSE-MsgGUID: j7ft2dT/QCaBOaXt4vJe8A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="270720133"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa008.fm.intel.com with ESMTP; 16 Sep 2026 07:15:59 -0700
Received: by black.igk.intel.com (Postfix, from userid 1058)
	id BE02F9E; Wed, 16 Sep 2026 16:15:58 +0200 (CEST)
From: Niklas Neronin <niklas.neronin@linux.intel.com>
To: mathias.nyman@linux.intel.com
Cc: linux-usb@vger.kernel.org,
	Niklas Neronin <niklas.neronin@linux.intel.com>
Subject: [PATCH v2 07/20] usb: xhci: rework USB2 PORTPMSC macros
Date: Wed, 16 Sep 2026 16:13:56 +0200
Message-ID: <20260916141409.629621-8-niklas.neronin@linux.intel.com>
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

Rename bits 7:4 mask from the legacy HIRD definition to BESL, as per xHCI
specification.

Raname xhci_port_set_test_mode() local variabel 'temp' to 'portpmsc'.

Signed-off-by: Niklas Neronin <niklas.neronin@linux.intel.com>
---
 drivers/usb/host/xhci-hub.c  |  8 ++++----
 drivers/usb/host/xhci-port.h | 24 ++++++++++++++++--------
 drivers/usb/host/xhci.c      |  7 ++++---
 3 files changed, 24 insertions(+), 15 deletions(-)

diff --git a/drivers/usb/host/xhci-hub.c b/drivers/usb/host/xhci-hub.c
index e2b1986d217c..6b5867ca5d6b 100644
--- a/drivers/usb/host/xhci-hub.c
+++ b/drivers/usb/host/xhci-hub.c
@@ -678,14 +678,14 @@ static void xhci_set_port_power(struct xhci_hcd *xhci, struct xhci_port *port,
 
 static void xhci_port_set_test_mode(struct xhci_hcd *xhci, u16 test_mode, int portnum)
 {
-	u32 temp;
+	u32 portpmsc;
 	struct xhci_port *port;
 
 	/* xhci only supports test mode for usb2 ports */
 	port = xhci->usb2_rhub.ports[portnum];
-	temp = readl(&port->port_reg->portpmsc);
-	temp |= test_mode << PORT_TEST_MODE_SHIFT;
-	writel(temp, &port->port_reg->portpmsc);
+	portpmsc = readl(&port->port_reg->portpmsc);
+	FIELD_MODIFY(PORT_TEST_MODE_MASK, &portpmsc, test_mode);
+	writel(portpmsc, &port->port_reg->portpmsc);
 	xhci->test_mode = test_mode;
 	if (test_mode == USB_TEST_FORCE_ENABLE)
 		xhci_start(xhci);
diff --git a/drivers/usb/host/xhci-port.h b/drivers/usb/host/xhci-port.h
index fb4a2c4f7691..889a6b7f8721 100644
--- a/drivers/usb/host/xhci-port.h
+++ b/drivers/usb/host/xhci-port.h
@@ -133,16 +133,24 @@
 /* bit 16 - Force Link PM Accept (FLA) */
 /* bits 31:17 - RsvdP */
 
-/* USB2 Protocol PORTSPMSC */
-#define	PORT_L1S_MASK		7
-#define	PORT_L1S_SUCCESS	1
+/* USB2 Port Power Management Status and Control (PORTPMSC) 5.4.9.2 */
+/* bits 2:0 - L1 Status */
+#define	PORT_L1S_MASK		GENMASK(2, 0)
+/* bit 3 - Remote Wake Enable */
 #define	PORT_RWE		BIT(3)
-#define	PORT_HIRD(p)		(((p) & 0xf) << 4)
-#define	PORT_HIRD_MASK		(0xf << 4)
-#define	PORT_L1DS_MASK		(0xff << 8)
-#define	PORT_L1DS(p)		(((p) & 0xff) << 8)
+/*
+ * bits 7:4 - Best Effort Service Latency
+ * Some host controllers may implement the pre-2011 USB 2.0 LPM definition,
+ * where this field is interpreted as Host Initiated Resume Duration (HIRD).
+ */
+#define	PORT_BESL_MASK		GENMASK(7, 4)
+/* bits 15:8 - L1 Device Slot */
+#define	PORT_L1DS_MASK		GENMASK(15, 8)
+/* bit 16 - Hardware LPM Enable */
 #define	PORT_HLE		BIT(16)
-#define PORT_TEST_MODE_SHIFT	28
+/* bits 27:17 - RsvdP */
+/* bits 31:28 - Port Test Control */
+#define PORT_TEST_MODE_MASK	GENMASK(31, 28)
 
 /* USB3 Protocol PORTLI  Port Link Information */
 #define PORT_LEC(p)		((p) & 0xffff)
diff --git a/drivers/usb/host/xhci.c b/drivers/usb/host/xhci.c
index cab7bae3ecc3..0d4c31a86aad 100644
--- a/drivers/usb/host/xhci.c
+++ b/drivers/usb/host/xhci.c
@@ -4725,8 +4725,9 @@ static int xhci_set_usb2_hardware_lpm(struct usb_hcd *hcd,
 			hird = xhci_calculate_hird_besl(xhci, udev);
 		}
 
-		pm_val &= ~PORT_HIRD_MASK;
-		pm_val |= PORT_HIRD(hird) | PORT_RWE | PORT_L1DS(udev->slot_id);
+		FIELD_MODIFY(PORT_BESL_MASK, &pm_val, hird);
+		FIELD_MODIFY(PORT_L1DS_MASK, &pm_val, udev->slot_id);
+		pm_val |= PORT_RWE;
 		writel(pm_val, &port_reg->portpmsc);
 		pm_val = readl(&port_reg->portpmsc);
 		pm_val |= PORT_HLE;
@@ -4734,7 +4735,7 @@ static int xhci_set_usb2_hardware_lpm(struct usb_hcd *hcd,
 		/* flush write */
 		readl(&port_reg->portpmsc);
 	} else {
-		pm_val &= ~(PORT_HLE | PORT_RWE | PORT_HIRD_MASK | PORT_L1DS_MASK);
+		pm_val &= ~(PORT_HLE | PORT_RWE | PORT_BESL_MASK | PORT_L1DS_MASK);
 		writel(pm_val, &port_reg->portpmsc);
 		/* flush write */
 		readl(&port_reg->portpmsc);
-- 
2.50.1


Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3E3D3E5A20
	for <linux-usb@vger.kernel.org>; Mon, 13 Jul 2026 10:48:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783939727; cv=none; b=o//cq2yvgcriNEcmd1z6aoEuQEf/aE98WpoHbIjD9K5uzfOS5covKM1qy6oGEjU3suHXc6sSZI5a+dFzKxPsDJZa2UoonoG5eaq9lBuJBkfYHkF7HZbaQbaQuddz5oNMxPOyPvOzg6KUsSDdBImOTyG7PHA7ypFF0mN113fZc74=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783939727; c=relaxed/simple;
	bh=ILWtjIenEl7XLczZVIP4q75kucs2eqHqYVmvP8AjObY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MnijbFhoPbHUz0rlzGBzEZaQPVll6XDuMgtAUc0rILAA230wJDPxyPmiMqiL2CfxHrNZdITVoyUS+yWeOdPboQUGFNjh3CuweDwUZiUd3KSUUm6+hADRH6XrVkPztJ0MxEsTkLmBDutL5/yOKrVymOYaR6d+WqPtqlkIqgkNKmU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=E9bsmT45; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="E9bsmT45"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783939726; x=1815475726;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ILWtjIenEl7XLczZVIP4q75kucs2eqHqYVmvP8AjObY=;
  b=E9bsmT451CdxBqUzoA6h/kZPeorAUNzHBmQ7fC/9b84OwDAlyJHQL9jG
   UjNkMKhfWkvciw8/WkzA7Vxx3LfZb2DEmnYFiBzGOlz03NM5FUVkL8GWu
   8EpEvpQKPa0ciEqGy/+c25RiLOaD7x3DbLP9RiSuhc/mwUMrt6UjRGTLx
   vXqBMR+6d79svvJLm+/1+CJKTobgZ8Xo2BomWbAaAK1SBeEY32zM+4YgS
   Ywj1gaojUagj0IGn7MG91cXXuE/ELNbqHmxCSUzg5aeu+6HRIzlwVTUM2
   IapQXunaXffazQVXVSw8uLjlM2TgALm/LiQFoptmGAz7XcK7LO4jROCnD
   g==;
X-CSE-ConnectionGUID: lOk0zzMqR96PNriw3kBFfg==
X-CSE-MsgGUID: gY45FDwRQ8Wqmrs0ZQwg7w==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="96057031"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="96057031"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jul 2026 03:48:44 -0700
X-CSE-ConnectionGUID: 9BR4m6gcSPqqOjbKMqV5Sw==
X-CSE-MsgGUID: +qYFRDTxTKibLd1zsUlw3g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="279928974"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa001.fm.intel.com with ESMTP; 13 Jul 2026 03:48:43 -0700
Received: by black.igk.intel.com (Postfix, from userid 1058)
	id 8948C98; Mon, 13 Jul 2026 12:48:42 +0200 (CEST)
From: Niklas Neronin <niklas.neronin@linux.intel.com>
To: mathias.nyman@linux.intel.com
Cc: linux-usb@vger.kernel.org,
	Niklas Neronin <niklas.neronin@linux.intel.com>
Subject: [PATCH 06/22] usb: xhci: rework USB2 PORTPMSC macros
Date: Mon, 13 Jul 2026 12:47:20 +0200
Message-ID: <20260713104738.629612-7-niklas.neronin@linux.intel.com>
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

Rename bits 7:4 mask from the legacy HIRD definition to BESL, as per xHCI
specification.

Raname xhci_port_set_test_mode() local variabel 'temp' to 'portpmsc'.

Signed-off-by: Niklas Neronin <niklas.neronin@linux.intel.com>
---
 drivers/usb/host/xhci-hub.c  |  8 ++++----
 drivers/usb/host/xhci-port.h | 24 ++++++++++++++++--------
 drivers/usb/host/xhci.c      |  8 +++++---
 3 files changed, 25 insertions(+), 15 deletions(-)

diff --git a/drivers/usb/host/xhci-hub.c b/drivers/usb/host/xhci-hub.c
index 897de2e14b65..0945fff4f94c 100644
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
index 6dea904f3bc8..f8506ae8dfb7 100644
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
index eb0f65f8f32f..edfb2e0739f0 100644
--- a/drivers/usb/host/xhci.c
+++ b/drivers/usb/host/xhci.c
@@ -8,6 +8,7 @@
  * Some code borrowed from the Linux EHCI driver.
  */
 
+#include <linux/bitfield.h>
 #include <linux/jiffies.h>
 #include <linux/pci.h>
 #include <linux/iommu.h>
@@ -4723,8 +4724,9 @@ static int xhci_set_usb2_hardware_lpm(struct usb_hcd *hcd,
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
@@ -4732,7 +4734,7 @@ static int xhci_set_usb2_hardware_lpm(struct usb_hcd *hcd,
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


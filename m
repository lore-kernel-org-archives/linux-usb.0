Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51B013C1D70
	for <linux-usb@vger.kernel.org>; Fri,  9 Oct 2026 09:58:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791539936; cv=none; b=W9TLskOdRjuanpeNplZ+C/w1e/0k+kzfEln7dY2YwlUdtspOcQGM1gkFcJPmw0XZW8SKv9Y5eA+CCVw7HEAeQJcuGfWcOi+fGsFAkrp4Igr1uV3vSh3dTxh3trZBziwrw9KJ9fp3618N7evGuwLiY3BNmDNBlUCl/iMwlnJB63g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791539936; c=relaxed/simple;
	bh=iOBJ+m9ceeUwunU652VN8P7/22dhg693JQtVPxLm/bs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iksR5qn3nQk0z1Bd92eBp5L8GuNBODDtsIrTJtkxrw9Vu3GM9RfrtVm9tmRLhzszAKpVSrSe7NX8YO1RhkiMFLwDzlJ+ehCFWe5YrSFxQtJYuDk3bYOCS5+vNQ+1q9YNPTrlL7xR8weQ4Wso5DlithW9r5odARKJ70pm93DAjik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KWk8z+KM; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KWk8z+KM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791539934; x=1823075934;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=iOBJ+m9ceeUwunU652VN8P7/22dhg693JQtVPxLm/bs=;
  b=KWk8z+KMlyW78c8mxPc6ZpDEKGbaWFuOp+eq6xprosDb0+CgI7opOvEh
   Hn6eA9/+HiRKJHb5h2KqdUAkQVGmKwJ91TVs1HUJ/vwfV9k9OVzVoteiH
   41TgxGsMXPLM5/+wXggcyNwDeySKgUo81k3ZdkhEJ0RGcMo/erfcFcIvR
   aTcpxWUS2FDQi13SW6ZihaZ7x+HgKv/10qm8IF3QoGvinkNh6hASUwSVc
   +5Yo704vNVm5lq6MEJsejrmuzND5I4Hu9Wf+5rm2DBRTDa9vmdunBpXNf
   6slL2fj8YkfIpoTta6fI5T7BhglpBmsuXk6a7k3xMM9M/V4/8Q/0xdcsR
   A==;
X-CSE-ConnectionGUID: 9gOJfaIRTUCPLa8i/kARLQ==
X-CSE-MsgGUID: yAJK9oTyRVGLw5cL2JlthA==
X-IronPort-AV: E=McAfee;i="6800,10657,11929"; a="224094"
X-IronPort-AV: E=Sophos;i="6.27,148,1787036400"; 
   d="scan'208";a="224094"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2026 02:58:54 -0700
X-CSE-ConnectionGUID: OAjDtI2iSgOwjNvjihI+2Q==
X-CSE-MsgGUID: 3YuHyxCgS9CCa7+hlR0PqA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,148,1787036400"; 
   d="scan'208";a="613308"
Received: from ettammin-mobl2.ger.corp.intel.com (HELO mnyman-desk.intel.com) ([10.245.244.17])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2026 02:58:52 -0700
From: Mathias Nyman <mathias.nyman@linux.intel.com>
To: <gregkh@linuxfoundation.org>
Cc: <linux-usb@vger.kernel.org>,
	Umang Jain <uajain@igalia.com>,
	Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH 01/14] early: usb: xhci-dbc: Handle out of bounds xhci-xdbc capability
Date: Fri,  9 Oct 2026 12:58:21 +0300
Message-ID: <20261009095834.561578-2-mathias.nyman@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261009095834.561578-1-mathias.nyman@linux.intel.com>
References: <20261009095834.561578-1-mathias.nyman@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Umang Jain <uajain@igalia.com>

Currently, the early xhci-dbc assumes that the entire PCIe memory IO
can be entirely mapped  within the fixed boot time mappings
dictated by NR_FIX_BTMAPS. This patch handles the case where the PCIe
memory IO size can be larger than the fixed boot time mappings and
query the xhci debug extended capability in xdbc_map_pci_mmio().

This commit ensures that the xHCI debug capability can still be queried
when the PCIe memory IO space exceeds the fixmap size. In this scenario,
the base address is mapped uptil fixmap size and debug capabilities are
queried thereafter. Iterating over the entire PCIe BAR address size is
left for future improvement as and when, such a case arises.

Additionally, this brings the need to track the early_ioremap() mapped
size separately hence, introduce additional struct member xhci_base_length
in struct xdbc_state.

Signed-off-by: Umang Jain <uajain@igalia.com>
Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
---
 drivers/usb/early/xhci-dbc.c | 81 ++++++++++++++++++++++++++++++++----
 drivers/usb/early/xhci-dbc.h |  1 +
 2 files changed, 74 insertions(+), 8 deletions(-)

diff --git a/drivers/usb/early/xhci-dbc.c b/drivers/usb/early/xhci-dbc.c
index 41118bba9197..f2ed8e52cc56 100644
--- a/drivers/usb/early/xhci-dbc.c
+++ b/drivers/usb/early/xhci-dbc.c
@@ -35,10 +35,23 @@ static bool early_console_keep;
 static inline void xdbc_trace(const char *fmt, ...) { }
 #endif /* XDBC_TRACE */
 
+/* Size of xHCI debug capability structure as per section 7.6.8 of xHCI spec. */
+#define XDBC_MAPPING_SIZE	64
+
+enum xdbc_capability_flags {
+	XDBC_CAP_FLAG_NONE		= 0,
+	XDBC_CAP_FLAG_LEGACY		= 1 << 0,
+	XDBC_CAP_FLAG_PROTOCOL		= 1 << 1,
+	XDBC_CAP_FLAG_DEBUG		= 1 << 2,
+};
+
 static void __iomem * __init xdbc_map_pci_mmio(u32 bus, u32 dev, u32 func)
 {
-	u64 val64, sz64, mask64;
+	u64 val64, sz64, mask64, fixmap_size;
+	enum xdbc_capability_flags cap_flags = XDBC_CAP_FLAG_NONE;
+	bool found_all_caps = false;
 	void __iomem *base;
+	int offset;
 	u32 val, sz;
 	u8 byte;
 
@@ -85,7 +98,59 @@ static void __iomem * __init xdbc_map_pci_mmio(u32 bus, u32 dev, u32 func)
 
 	xdbc.xhci_start = val64;
 	xdbc.xhci_length = sz64;
-	base = early_ioremap(val64, sz64);
+
+	fixmap_size = NR_FIX_BTMAPS << PAGE_SHIFT;
+	if (sz64 < fixmap_size) {
+		xdbc.xhci_base_length = sz64;
+		return early_ioremap(val64, sz64);
+	}
+
+	/*
+	 * Base address size is greater than fixed size boot time mappings
+	 * hence, map maximum allowed fixmap size from base address and
+	 * determine if the required extended capabilities lies within the
+	 * fixmap.
+	 */
+	base = early_ioremap(val64, fixmap_size);
+	if (!base)
+		return NULL;
+
+	offset = xhci_find_next_ext_cap(base, 0, 0);
+
+	while (offset < fixmap_size) {
+		val = readl(base + offset);
+		switch (XHCI_EXT_CAPS_ID(val)) {
+		case XHCI_EXT_CAPS_DEBUG:
+			if (offset + XDBC_MAPPING_SIZE < fixmap_size)
+				cap_flags |= XDBC_CAP_FLAG_DEBUG;
+			break;
+		case XHCI_EXT_CAPS_PROTOCOL:
+			cap_flags |= XDBC_CAP_FLAG_PROTOCOL;
+			break;
+		case XHCI_EXT_CAPS_LEGACY:
+			cap_flags |= XDBC_CAP_FLAG_LEGACY;
+			break;
+		}
+
+		if ((cap_flags & XDBC_CAP_FLAG_DEBUG) &&
+		    (cap_flags & XDBC_CAP_FLAG_PROTOCOL) &&
+		    (cap_flags & XDBC_CAP_FLAG_LEGACY)) {
+			found_all_caps = true;
+			break;
+		}
+
+		offset = xhci_find_next_ext_cap(base, offset, 0);
+		if (!offset)
+			break;
+	}
+
+	if (found_all_caps) {
+		xdbc.xhci_base_length = fixmap_size;
+	} else {
+		early_iounmap(base, fixmap_size);
+		xdbc.xhci_base_length = 0;
+		base = NULL;
+	}
 
 	return base;
 }
@@ -643,9 +708,9 @@ int __init early_xdbc_parse_parameter(char *s, int keep_early)
 	offset = xhci_find_next_ext_cap(xdbc.xhci_base, 0, XHCI_EXT_CAPS_DEBUG);
 	if (!offset) {
 		pr_notice("xhci host doesn't support debug capability\n");
-		early_iounmap(xdbc.xhci_base, xdbc.xhci_length);
+		early_iounmap(xdbc.xhci_base, xdbc.xhci_base_length);
 		xdbc.xhci_base = NULL;
-		xdbc.xhci_length = 0;
+		xdbc.xhci_base_length = 0;
 
 		return -ENODEV;
 	}
@@ -682,9 +747,9 @@ int __init early_xdbc_setup_hardware(void)
 		xdbc.table_base = NULL;
 		xdbc.out_buf = NULL;
 
-		early_iounmap(xdbc.xhci_base, xdbc.xhci_length);
+		early_iounmap(xdbc.xhci_base, xdbc.xhci_base_length);
 		xdbc.xhci_base = NULL;
-		xdbc.xhci_length = 0;
+		xdbc.xhci_base_length = 0;
 	}
 
 	return ret;
@@ -987,7 +1052,7 @@ static int __init xdbc_init(void)
 	}
 
 	raw_spin_lock_irqsave(&xdbc.lock, flags);
-	early_iounmap(xdbc.xhci_base, xdbc.xhci_length);
+	early_iounmap(xdbc.xhci_base, xdbc.xhci_base_length);
 	xdbc.xhci_base = base;
 	offset = xhci_find_next_ext_cap(xdbc.xhci_base, 0, XHCI_EXT_CAPS_DEBUG);
 	xdbc.xdbc_reg = (struct xdbc_regs __iomem *)(xdbc.xhci_base + offset);
@@ -1004,7 +1069,7 @@ static int __init xdbc_init(void)
 	memblock_phys_free(xdbc.table_dma, PAGE_SIZE);
 	memblock_phys_free(xdbc.out_dma, PAGE_SIZE);
 	writel(0, &xdbc.xdbc_reg->control);
-	early_iounmap(xdbc.xhci_base, xdbc.xhci_length);
+	early_iounmap(xdbc.xhci_base, xdbc.xhci_base_length);
 
 	return ret;
 }
diff --git a/drivers/usb/early/xhci-dbc.h b/drivers/usb/early/xhci-dbc.h
index 8b4d71de45fc..e2aefb796084 100644
--- a/drivers/usb/early/xhci-dbc.h
+++ b/drivers/usb/early/xhci-dbc.h
@@ -144,6 +144,7 @@ struct xdbc_state {
 	u32			dev;
 	u32			func;
 	void __iomem		*xhci_base;
+	size_t			xhci_base_length;
 	u64			xhci_start;
 	size_t			xhci_length;
 	int			port_number;
-- 
2.43.0


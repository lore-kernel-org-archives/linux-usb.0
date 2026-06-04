Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD47747B439;
	Thu,  4 Jun 2026 14:40:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.97.179.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780584033; cv=none; b=QHudXOTYPF1RgaoeUqYsOS2T/texKJNSV1zL/mllJ+B4KyXI2jlh60Bn66SCXl/gj7n9BA1L7i01BbpwE2LK3/konEAiu77oTH99hMcdcqIr+I8AvQLhq6pA444pQ6q0T+2DgDAaWrvPM57Z0wAbyUjoiuXUZx4WJ9dNQ/SLtYk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780584033; c=relaxed/simple;
	bh=qc4prvSskt3Khf+ZL+++BHMFHyaEzTuV+uL7DHFRYvs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LLZnOXq7dH7HPngrm4fAKZLroU5vdz+A3g36wR9WZP87Ip1VxobY2oep0onPH04SmB1/RldKWfC6/z5NPjWMy3oYksZZ7ttxmOvMdtRE5IeCYWdrBZ7v2b/2yhZr+KxhAy84Dp/LITvLZstAQz/vb+mOOkgp874m9AxSJTC8Dh4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=VmuxITzX; arc=none smtp.client-ip=213.97.179.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="VmuxITzX"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=g9KH+tgzUi6Unr+8AR+EvbtiUJhJ0FJeX7Ih14TUyyU=; b=VmuxITzXyQVkO1wY1lYbUc20ge
	RNYl5/jx6eZFkTNQvoE3sShVYbGuECBbi4KGO9k6iuWlosrKbJdLg8Cf2irfkRkiu+A5lV0Hcy+pR
	824g2DkHH386uZWti32PVkdioMy3pIpQouOCpeCOqBBHZRrPyQPIbhv8Ru2hCjl9KDlITooQDur3P
	luVYlyL8hwDme5rO/B0QTjnMLfcmU+1SK92DjlyQG3zPJdptEv2nNhlT+Ihz4Grk0mYLGu+kN1JNO
	jLiTJFBCFa4A6DKJXiBgJpWIegWp/WS2K3lY1FGMtfWKvY2+uf22rlhhhumM0Gv4WrppbfGg9Mbd6
	B6tOk1kA==;
Received: from [49.36.124.180] (helo=uajain)
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1wV9F5-00Cfsr-5v; Thu, 04 Jun 2026 16:40:19 +0200
From: Umang Jain <uajain@igalia.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Lucas De Marchi <demarchi@kernel.org>
Cc: Mathias Nyman <mathias.nyman@linux.intel.com>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	kernel-dev@igalia.com,
	Umang Jain <uajain@igalia.com>
Subject: [RFC PATCH v1 2/3] early: usb: xhci-dbc: Handle out of bounds xhci-xdbc capability
Date: Thu,  4 Jun 2026 20:11:21 +0530
Message-ID: <20260604144122.962236-3-uajain@igalia.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260604144122.962236-1-uajain@igalia.com>
References: <20260604144122.962236-1-uajain@igalia.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Currently, the early xhci-dbc assumes that the extended capability
can be mapped within the fixed boot time mappings dictated by
NR_FIX_BTMAPS.

This patch iterates over the PCI BAR address size to find and map
xhci-xdbc capability which could be out-of-bounds otherwise,
in xdbc_map_pci_mmio(). The iterations map the maximum allowed
boot time mappings (fixmap size) at a time and search for xhci-xdbc
capability offset, till the end of the bar address size.

Signed-off-by: Umang Jain <uajain@igalia.com>
---
 drivers/usb/early/xhci-dbc.c | 47 +++++++++++++++++++++++++++++++++---
 1 file changed, 44 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/early/xhci-dbc.c b/drivers/usb/early/xhci-dbc.c
index 8ce362a90910..1f6a129d4b5d 100644
--- a/drivers/usb/early/xhci-dbc.c
+++ b/drivers/usb/early/xhci-dbc.c
@@ -35,10 +35,13 @@ static bool early_console_keep;
 static inline void xdbc_trace(const char *fmt, ...) { }
 #endif /* XDBC_TRACE */
 
+#define XDBC_MAPPING_SIZE 56
+
 static void __iomem * __init xdbc_map_pci_mmio(u32 bus, u32 dev, u32 func)
 {
-	u64 val64, sz64, mask64;
+	u64 val64, sz64, mask64, fixmap_size, mapped_size;
 	void __iomem *base;
+	int offset;
 	u32 val, sz;
 	u8 byte;
 
@@ -85,8 +88,46 @@ static void __iomem * __init xdbc_map_pci_mmio(u32 bus, u32 dev, u32 func)
 
 	xdbc.xhci_start = val64;
 	xdbc.xhci_length = sz64;
-	base = early_ioremap(val64, sz64);
-	xdbc.xhci_base_length = sz64;
+
+	fixmap_size = NR_FIX_BTMAPS << PAGE_SHIFT;
+	if (sz64 < fixmap_size) {
+		xdbc.xhci_base_length = sz64;
+		return early_ioremap(val64, sz64);
+	}
+
+	/*
+	 * Base address size is greater than fixed size boot mappings,
+	 * hence iterate over the region one fixmap_size at a time.
+	 */
+	base = early_ioremap(val64, fixmap_size);
+	offset = xhci_find_next_ext_cap(base, 0, 0);
+	mapped_size = fixmap_size;
+
+	while (mapped_size <= sz64) {
+		val = readl(base + offset);
+		if (XHCI_EXT_CAPS_ID(val) == XHCI_EXT_CAPS_DEBUG) {
+			if (offset + XDBC_MAPPING_SIZE > fixmap_size) {
+				early_iounmap(base, fixmap_size);
+				base = early_ioremap(val64 + offset, XDBC_MAPPING_SIZE);
+			}
+			break;
+		}
+
+		/*
+		 * Find offset to next xhci-ext capability, remap if the offset
+		 * is out of bounds of the already mapped region.
+		 */
+		offset = xhci_find_next_ext_cap(base, offset, 0);
+		if (!offset) {
+			early_iounmap(base, fixmap_size);
+			base = early_ioremap(val64 + mapped_size, fixmap_size);
+			mapped_size += fixmap_size;
+
+			offset = xhci_find_next_ext_cap(base, 0, 0);
+		}
+	}
+
+	xdbc.xhci_base_length = fixmap_size;
 
 	return base;
 }
-- 
2.53.0


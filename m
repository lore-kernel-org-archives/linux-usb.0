Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD35D3B19D8;
	Thu,  4 Jun 2026 14:40:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.97.179.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780584032; cv=none; b=A/2DWaFkK5GATEGyqujkLXM2z4o6VASropTAKF2vUA+xx8F0SgVE+twhC1DJyn27UHoozB1/B+a3I8iNZDEIsRDcpri7N36UIqW+LEIaZrFKyQj7O+2qfofjUzivyH5zRxmBYLUOsBbqztrEbImdKSssURtTytqt5U6PpP63A3I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780584032; c=relaxed/simple;
	bh=gi+C/I2R8FnHSvcBWJpqptXPhjZWYhnjOM1BaI+Rzng=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LWmthRj4gUc/SGYlYtKEof7fAboe9fLZretyDrCVjsMbSietRbJYiBRCmmZyz1hX2DRtj4068Nu20+LJjeYe73OUQ1omp7r8c5clcIigF6NWZfs/QULK5sJX4Tv3wKvTJ74jOJpbl10+GT1GdNaDGlKdu9d0wCl4BIP7r0ngmHQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=OcrEK3Qh; arc=none smtp.client-ip=213.97.179.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="OcrEK3Qh"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=KpM3cqM9NADN79SY0+R9Jq2ShWErGEMrJ3dJav2dVjA=; b=OcrEK3QhjV6iSZynBEl7l/lia0
	odfE/U7EexfZ/I2xZFDTTQTnW43BYew52Li1rsP0AUctTbYwt/9mMRQ2NSmtc1cTUVvFLQDgY9lmt
	xDVqXLC3fzwMqBZ7P/QJYwlGDuMyR3ycqTxZnXqrHINm63DitSu3fJO4e/4pp632n0zzaItf36Qr8
	6rDhZoORZEbDYsXwcUluJG5fgOHuERUNQdiaLCRkhoZlASqPXRJRLq7BFX3yuh2UnDQx48HcNBIlg
	FCTli9+C/BYDJQ21wMKglkFvHJe7bDhJJLSFSjTvwPdMAYgK05Mi+MP+5+1TdvN9uv8ZORmAMISf6
	nktP4SSw==;
Received: from [49.36.124.180] (helo=uajain)
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1wV9F3-00Cfsr-F7; Thu, 04 Jun 2026 16:40:17 +0200
From: Umang Jain <uajain@igalia.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Lucas De Marchi <demarchi@kernel.org>
Cc: Mathias Nyman <mathias.nyman@linux.intel.com>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	kernel-dev@igalia.com,
	Umang Jain <uajain@igalia.com>
Subject: [RFC PATCH v1 1/3] usb: early: xhci-dbc: Track early_ioremap size separately
Date: Thu,  4 Jun 2026 20:11:20 +0530
Message-ID: <20260604144122.962236-2-uajain@igalia.com>
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

early_ioremap() only allows to map a fixed number of boot time mappings,
hence, the mapped size should be tracked separately from the PCIe base
address and size.

Signed-off-by: Umang Jain <uajain@igalia.com>
---
 drivers/usb/early/xhci-dbc.c | 13 +++++++------
 drivers/usb/early/xhci-dbc.h |  1 +
 2 files changed, 8 insertions(+), 6 deletions(-)

diff --git a/drivers/usb/early/xhci-dbc.c b/drivers/usb/early/xhci-dbc.c
index 41118bba9197..8ce362a90910 100644
--- a/drivers/usb/early/xhci-dbc.c
+++ b/drivers/usb/early/xhci-dbc.c
@@ -86,6 +86,7 @@ static void __iomem * __init xdbc_map_pci_mmio(u32 bus, u32 dev, u32 func)
 	xdbc.xhci_start = val64;
 	xdbc.xhci_length = sz64;
 	base = early_ioremap(val64, sz64);
+	xdbc.xhci_base_length = sz64;
 
 	return base;
 }
@@ -643,9 +644,9 @@ int __init early_xdbc_parse_parameter(char *s, int keep_early)
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
@@ -682,9 +683,9 @@ int __init early_xdbc_setup_hardware(void)
 		xdbc.table_base = NULL;
 		xdbc.out_buf = NULL;
 
-		early_iounmap(xdbc.xhci_base, xdbc.xhci_length);
+		early_iounmap(xdbc.xhci_base, xdbc.xhci_base_length);
 		xdbc.xhci_base = NULL;
-		xdbc.xhci_length = 0;
+		xdbc.xhci_base_length = 0;
 	}
 
 	return ret;
@@ -987,7 +988,7 @@ static int __init xdbc_init(void)
 	}
 
 	raw_spin_lock_irqsave(&xdbc.lock, flags);
-	early_iounmap(xdbc.xhci_base, xdbc.xhci_length);
+	early_iounmap(xdbc.xhci_base, xdbc.xhci_base_length);
 	xdbc.xhci_base = base;
 	offset = xhci_find_next_ext_cap(xdbc.xhci_base, 0, XHCI_EXT_CAPS_DEBUG);
 	xdbc.xdbc_reg = (struct xdbc_regs __iomem *)(xdbc.xhci_base + offset);
@@ -1004,7 +1005,7 @@ static int __init xdbc_init(void)
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
2.53.0


Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCA05385D94;
	Thu,  4 Jun 2026 14:40:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.97.179.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780584033; cv=none; b=tCmDNT+izLS85yLmt+d/bMGp9wVzsouHBt4Ryt+ZpHHeQF0HaUXivlGAVAGvnbTE8Foa41ablgU7WHgw1/KvNyLKapjcKRhKYXLEbWeWnSezm7Q4I1yqQLFepKX2GgW739REtfUhzrbKLu5QpK0geMZIG/smJ2/Qccc3b7ygbio=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780584033; c=relaxed/simple;
	bh=182DBq2EHIlRJ1LDWMojQFwJq1Z1ZmXVsPcX57PlzPU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jLMGq3HGrC8Zp883V4pAhUfWFacEa4Kv5y+gxEqWSGeuZQujVe/5ti99stEsYIfnW2F2O6JIdacnrX8zxV89cPclQTVifb0DIfMg/OmyIchiA8MFuDSHfxEmGYoWVYo8J5DvU5v4z+XnWF3FS+M9Nuw+oRBwKnZBugLv4gSavRQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=HHXVAXAR; arc=none smtp.client-ip=213.97.179.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="HHXVAXAR"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=ISIKerVlZfSV+WyXavGS0DqsEVYVTPDaaKjRFymYdxU=; b=HHXVAXAREykoowr2SUegFEf2nh
	p1TQ4VWT392Nwrt/c772FmeTdOjmI48Rxl3EuT01JJoW9Gtyw7G5ZIRGozwOo7RopivE+eUOJkbXD
	6Et7AK6CvlRDrXJg98heDD+b2nvepedqTLYVFuaYuHNhqaJX22xsHGPRgZFmekuZi0CjBRW4jUwk1
	iaH/9OEEjAWuMM1o3PLOpEfyHP0M9YfdO15INDU1ruqf39cx8zm81UACURmMJ8GhwM1JtiReXIqmw
	1wld/FKKA65n1vmj58sHcyWP503QH76a7LJJgFKmrrq5ZUk3wSiV8kKbis4WWQoYxoH0TrfJapX1e
	7wxwc53g==;
Received: from [49.36.124.180] (helo=uajain)
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1wV9F6-00Cfsr-Sy; Thu, 04 Jun 2026 16:40:21 +0200
From: Umang Jain <uajain@igalia.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Lucas De Marchi <demarchi@kernel.org>
Cc: Mathias Nyman <mathias.nyman@linux.intel.com>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	kernel-dev@igalia.com,
	Umang Jain <uajain@igalia.com>
Subject: [RFC PATCH v1 3/3] WIP: early: xhci-xdbc: Map lower and with 0 offset to partially work
Date: Thu,  4 Jun 2026 20:11:22 +0530
Message-ID: <20260604144122.962236-4-uajain@igalia.com>
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

Map the area slightly lower than max fixmap. Detect the offset of xhci
xdbc cap and remap it again, so that the offset becomes 0.

----
>> This is investigation patch to get early xdbc attached to host
>> successfully. Without this, the xdbc doesn't attach to host.

on host:
[180056.895751] usb usb4-port2: attempt power cycle
[180059.049494] usb 4-2: Device not responding to setup address.
[180059.262513] usb 4-2: Device not responding to setup address.
[180059.463201] usb 4-2: device not accepting address 81, error -71
[180059.651391] usb 4-2: Device not responding to setup address.
[180059.862171] usb 4-2: Device not responding to setup address.
[180060.065072] usb 4-2: device not accepting address 82, error -71

on target:
[    5.779884] xhci_dbc:xdbc_start: waiting for device configuration timed out
[    5.779891] xhci_dbc:early_xdbc_setup_hardware: failed to setup the connection to host
----

This patches atleast makes the target attach to xhci host at
/dev/ttyUSB0. It's meant to debug and discuss the core issue as a
"clue".

Signed-off-by: Umang Jain <uajain@igalia.com>
---
 drivers/usb/early/xhci-dbc.c | 23 ++++++++++++-----------
 1 file changed, 12 insertions(+), 11 deletions(-)

diff --git a/drivers/usb/early/xhci-dbc.c b/drivers/usb/early/xhci-dbc.c
index 1f6a129d4b5d..b2bde2e8f85f 100644
--- a/drivers/usb/early/xhci-dbc.c
+++ b/drivers/usb/early/xhci-dbc.c
@@ -95,6 +95,9 @@ static void __iomem * __init xdbc_map_pci_mmio(u32 bus, u32 dev, u32 func)
 		return early_ioremap(val64, sz64);
 	}
 
+	/* Do not fill all fixed page slots in one go. */
+	fixmap_size = fixmap_size / 2;
+
 	/*
 	 * Base address size is greater than fixed size boot mappings,
 	 * hence iterate over the region one fixmap_size at a time.
@@ -110,6 +113,14 @@ static void __iomem * __init xdbc_map_pci_mmio(u32 bus, u32 dev, u32 func)
 				early_iounmap(base, fixmap_size);
 				base = early_ioremap(val64 + offset, XDBC_MAPPING_SIZE);
 			}
+
+			pr_notice("Found CAPS_DEBUG: mapped size: %llu, \
+				  fixmap_size: %llu, offset: %d, page_size:%d\n",
+				  mapped_size, fixmap_size, offset, 1 << PAGE_SHIFT);
+
+			early_iounmap(base, fixmap_size);
+			base = early_ioremap(val64+offset, fixmap_size);
+
 			break;
 		}
 
@@ -681,17 +692,7 @@ int __init early_xdbc_parse_parameter(char *s, int keep_early)
 	if (!xdbc.xhci_base)
 		return -EINVAL;
 
-	/* Locate DbC registers: */
-	offset = xhci_find_next_ext_cap(xdbc.xhci_base, 0, XHCI_EXT_CAPS_DEBUG);
-	if (!offset) {
-		pr_notice("xhci host doesn't support debug capability\n");
-		early_iounmap(xdbc.xhci_base, xdbc.xhci_base_length);
-		xdbc.xhci_base = NULL;
-		xdbc.xhci_base_length = 0;
-
-		return -ENODEV;
-	}
-	xdbc.xdbc_reg = (struct xdbc_regs __iomem *)(xdbc.xhci_base + offset);
+	xdbc.xdbc_reg = (struct xdbc_regs __iomem *)(xdbc.xhci_base);
 
 	return 0;
 }
-- 
2.53.0


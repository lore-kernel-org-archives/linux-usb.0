Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B019450C2B0
	for <linux-usb@vger.kernel.org>; Wed, 16 Sep 2026 14:16:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789568163; cv=none; b=tWn7JYbF6i4ylbop2NG846jI5KGi4nIJ39PIX6j1dw99JYRMHaMPVjQ5g8LoJZ9R2WLdtV7ALpHc1rskH03iqgpcHJyHxuTtnZMf5ZrZS8dhjmP0v24UvZI2R1OJivN15lJdRuz85AjKo+nxcMoa8ybgkLLSJ8GD4HgDd+N6COs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789568163; c=relaxed/simple;
	bh=ve68yjyNSKOwGspvMOg48vtsmAW46zPo88FMmlk2z10=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RO///CeP/+7k9FCuXt53b2W+YUJPfwgMXb/gFCQZp2Gtn53En1HXH24DIyA5ErTkxitGbZM++1AiqzkD8Zk3PZCo+3HKwRQwePt7cPYj6Bd7wVFB4NDw2isH14AgWlN4plMX8Ur4kmYG/JMwshVs3NMUwQjq0EoQ1aHGQ0Y9W+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Y0N2wPJW; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Y0N2wPJW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789568162; x=1821104162;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ve68yjyNSKOwGspvMOg48vtsmAW46zPo88FMmlk2z10=;
  b=Y0N2wPJWUXm4OJCH0tCLJ48tKxPFNm6YRKzlb1T5NMrv7nSLXzKIleHs
   Xmeb34Ahe+zg2dfvubEkUT7oZOUgnwalTNBGetdWroJNOjogIBxNEKcKZ
   9vdKvAaXsaSGM29xGu2dgts8UL0V0dw9Oo0/pS5Si4HuQoBo+kz+1Dl+R
   DTv49pahI3XS7BL7qSlhou7zRrzhGOLIzdMhbZoKITEZgv2bA5onuaVGG
   79r29Z8dpg4ASQB75QKUovDaj0bnn1qESriHWnOnvtIpiXRbXUxRllI9c
   4h+gXHzNIoUF9zHC/pV2k8058G5vnJG/RPmzN0t553ke4/Bh2WBkoLO0P
   A==;
X-CSE-ConnectionGUID: bkj2DSgITEmDIsXENeqQzg==
X-CSE-MsgGUID: d1m7mRyJRF6HhOOiP4ja7Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="89967279"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="89967279"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2026 07:16:02 -0700
X-CSE-ConnectionGUID: vUerP0QWTuigV1FrWDbasQ==
X-CSE-MsgGUID: 0yr4LYGFTlmzNoDtduRZpA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="270720148"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa008.fm.intel.com with ESMTP; 16 Sep 2026 07:16:00 -0700
Received: by black.igk.intel.com (Postfix, from userid 1058)
	id 29CBD9B; Wed, 16 Sep 2026 16:16:00 +0200 (CEST)
From: Niklas Neronin <niklas.neronin@linux.intel.com>
To: mathias.nyman@linux.intel.com
Cc: linux-usb@vger.kernel.org,
	Niklas Neronin <niklas.neronin@linux.intel.com>
Subject: [PATCH v2 09/20] usb: xhci: rework USB2 PORTLI macros
Date: Wed, 16 Sep 2026 16:13:58 +0200
Message-ID: <20260916141409.629621-10-niklas.neronin@linux.intel.com>
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

Signed-off-by: Niklas Neronin <niklas.neronin@linux.intel.com>
---
 drivers/usb/host/xhci-debugfs.c | 5 +++--
 drivers/usb/host/xhci-port.h    | 9 ++++++---
 2 files changed, 9 insertions(+), 5 deletions(-)

diff --git a/drivers/usb/host/xhci-debugfs.c b/drivers/usb/host/xhci-debugfs.c
index 8a73d3ee3481..02729682c7e2 100644
--- a/drivers/usb/host/xhci-debugfs.c
+++ b/drivers/usb/host/xhci-debugfs.c
@@ -407,8 +407,9 @@ static int xhci_portli_show(struct seq_file *s, void *unused)
 			   FIELD_GET(PORT_RLC_MASK, portli),
 			   FIELD_GET(PORT_TLC_MASK, portli));
 	else if (xhci->hcc_params2 & HCC2_E2V2C)
-		seq_printf(s, "0x%08x RDR=%u TDR=%u\n", portli,
-			   PORTLI_RDR(portli), PORTLI_TDR(portli));
+		seq_printf(s, "0x%08x RDR=%lu TDR=%lu\n", portli,
+			   FIELD_GET(PORT_RDR_MASK, portli),
+			   FIELD_GET(PORT_TDR_MASK, portli));
 	else
 		seq_printf(s, "0x%08x RsvdP\n", portli);
 
diff --git a/drivers/usb/host/xhci-port.h b/drivers/usb/host/xhci-port.h
index e5bf7e7c083d..f2194c84f9f2 100644
--- a/drivers/usb/host/xhci-port.h
+++ b/drivers/usb/host/xhci-port.h
@@ -161,9 +161,12 @@
 #define PORT_TLC_MASK		GENMASK(23, 20)
 /* bits 31:24 - RsvdP */
 
-/* eUSB2v2 protocol PORTLI Port Link information, RsvdP for normal USB2 */
-#define PORTLI_RDR(p)		((p) & 0xf)
-#define PORTLI_TDR(p)		(((p) >> 4) & 0xf)
+/* USB2 Port Link Info Register (PORTLI) 5.4.10.2 */
+/* bits 3:0 - Rx Data Rate, if E2V2C=1 else RsvdP */
+#define PORT_RDR_MASK		GENMASK(3, 0)
+/* bits 7:4 - Tx Data Rate, if E2V2C=1 else RsvdP */
+#define PORT_TDR_MASK		GENMASK(7, 4)
+/* bits 31:8 - RsvdP */
 
 /* USB2 Protocol PORTHLPMC */
 #define PORT_HIRDM(p)((p) & 3)
-- 
2.50.1


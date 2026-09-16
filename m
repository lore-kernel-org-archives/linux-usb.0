Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E0C950C2A6
	for <linux-usb@vger.kernel.org>; Wed, 16 Sep 2026 14:16:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789568162; cv=none; b=nTu2wP35A6Sey/EiJdAy/0COP9ZT/ec+rp8y3dZvUML33OrDCk79f2gl/FNW6ouhySs2yluxLgOasx/iXCRhLhSihywC6AC37O95VprrhB2vPdcWoikqOdpA/oM+uVVpxGtK3e81vgTknCUmgZZuTON0q2YOYppk51/Bw5wUYeg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789568162; c=relaxed/simple;
	bh=5WbodEMgdSwRXeCsk65XCvbjRfm4RqfDvG4l5pQNarY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Wzm9HITGte+/J0zkajktlIyhI1L9FBTfpZ0rTgfUEDaDMB7IeyMgIkE6aCBlRYUlXB4TobbHqzRrDRu10+MiS1dh+27Ny8f+2g6RwWbJGHOD4wsFf5cerPFHbufvd0PiGntF4qs7FWOOSJ2ZrMlJU0xY33LvaMwijnLERnWl/B8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bIWcNkXA; arc=none smtp.client-ip=192.198.163.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bIWcNkXA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789568161; x=1821104161;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=5WbodEMgdSwRXeCsk65XCvbjRfm4RqfDvG4l5pQNarY=;
  b=bIWcNkXAfTBwx+yVOnP2sYVgnch+W4cR4TtL8esA45jFPRCPFXu53UIg
   7ADZm2NqkwmDF6yGI4rguZlZIQhjGyZnc+mb+Gc8WUcIbitHj0852fn+F
   TwSQIPHfj2rUNb6b64pKd+zaRkmqatg3mopM93uMEvbgi+dJLXkBVy+rq
   K8WuJfQVIvaLvYlY5wZZKMC10DErS6NlYT5u/awbmcGpvSt9xhTfQuPFm
   XVf5aKc9a/cGSrdeVqXa6Upd+yBvLDIm2fzXHJafYDqRsPdTB+K+NEncN
   HdE4w+lHqNf/fuK6t5uKZdR0VeAeNwERXgK+GbNzmGci1/fCqg6MXVnWi
   g==;
X-CSE-ConnectionGUID: kcjwHZqhS3uZcC7iD/oBTg==
X-CSE-MsgGUID: qfT+YCDER6SKoObYREMtAQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="453768"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="453768"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa115.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2026 07:16:00 -0700
X-CSE-ConnectionGUID: r9JnVOUBRzeS1KvKQ7vCqg==
X-CSE-MsgGUID: dxURMWLTROCPfJ0iOqk6NQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="273889309"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa009.jf.intel.com with ESMTP; 16 Sep 2026 07:16:00 -0700
Received: by black.igk.intel.com (Postfix, from userid 1058)
	id 74D3999; Wed, 16 Sep 2026 16:15:59 +0200 (CEST)
From: Niklas Neronin <niklas.neronin@linux.intel.com>
To: mathias.nyman@linux.intel.com
Cc: linux-usb@vger.kernel.org,
	Niklas Neronin <niklas.neronin@linux.intel.com>
Subject: [PATCH v2 08/20] usb: xhci: rework USB3 PORTLI macros
Date: Wed, 16 Sep 2026 16:13:57 +0200
Message-ID: <20260916141409.629621-9-niklas.neronin@linux.intel.com>
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
 drivers/usb/host/xhci-debugfs.c |  6 ++++--
 drivers/usb/host/xhci-hub.c     |  4 ++--
 drivers/usb/host/xhci-port.h    | 12 ++++++++----
 3 files changed, 14 insertions(+), 8 deletions(-)

diff --git a/drivers/usb/host/xhci-debugfs.c b/drivers/usb/host/xhci-debugfs.c
index e61ee722e2cd..8a73d3ee3481 100644
--- a/drivers/usb/host/xhci-debugfs.c
+++ b/drivers/usb/host/xhci-debugfs.c
@@ -402,8 +402,10 @@ static int xhci_portli_show(struct seq_file *s, void *unused)
 
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
index 6b5867ca5d6b..ff5645df55e3 100644
--- a/drivers/usb/host/xhci-hub.c
+++ b/drivers/usb/host/xhci-hub.c
@@ -1013,8 +1013,8 @@ static u32 xhci_get_ext_port_status(u32 portsc, u32 port_li)
 	ext_stat |= speed_id;		/* bits 3:0, RX speed id */
 	ext_stat |= speed_id << 4;	/* bits 7:4, TX speed id */
 
-	ext_stat |= PORT_RX_LANES(port_li) << 8;  /* bits 11:8 Rx lane count */
-	ext_stat |= PORT_TX_LANES(port_li) << 12; /* bits 15:12 Tx lane count */
+	ext_stat |= FIELD_GET(PORT_RLC_MASK, port_li) << 8;  /* bits 11:8 Rx lane count */
+	ext_stat |= FIELD_GET(PORT_TLC_MASK, port_li) << 12; /* bits 15:12 Tx lane count */
 
 	return ext_stat;
 }
diff --git a/drivers/usb/host/xhci-port.h b/drivers/usb/host/xhci-port.h
index 889a6b7f8721..e5bf7e7c083d 100644
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


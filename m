Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88EF93E5EEA
	for <linux-usb@vger.kernel.org>; Mon, 13 Jul 2026 10:48:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783939739; cv=none; b=ZCBkLbaPy3mJKD9+TgBTCJNGj39tDAbml8Gq3z7LQpAT6TW/4GoEZaWptaJ0JR463u9SXpZ7JxZM7kZiJvifBIwaypmaEkLRat+PbdLniIn3ETZm3dfp8f6YXwxL7So1biHdc9yH4BnLTpmwGRHUqGq7H8qZv8hTJtmMS4JXeEk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783939739; c=relaxed/simple;
	bh=hBEqYOhHTlIli5dYEsDlQ8a29CEvbGNAOsafIpOf1fA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MZ30dPUBH+093bwSXmpN96HdUY/WN6Lw5jqGyK6ur4fMAbgzwqlyIxNR5W2R+OCbN5kFHnKP5w/DAzL9ZZEWncXUgq7VNVh4Mg285PylYxe35d1M4MEdhgYeCFG6S8HLmZkl67X0I4dfy3a2zr7h2ORotwZd7qZDoEPEhUxKx7M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HkRREw1M; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HkRREw1M"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783939728; x=1815475728;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=hBEqYOhHTlIli5dYEsDlQ8a29CEvbGNAOsafIpOf1fA=;
  b=HkRREw1MWoPDFmW3K41QVHFsKdxyjivgvX/WGUe3jCOuAA+7zFpSIo11
   guwPdH+u4whrP+q48KlZ5FuDOskUgE3oSB9xl4RiZK3WyzD3bPgHwK+dR
   +bo+ySA05hrWjLMnLjEwEsAhcfhibVvTDHUVXmhXAb2a5VIpiIVQysy6j
   YEOrprW0oh7YzmAZ85F3Uxb6DTnZgFPb3cOubvdafHNRLKf+9AiZuKXee
   SelvgbyuzEXP2HYYAtLythM0xtkffzrIG55TVwMH2GQ5uEM3FSMV4+ldR
   dZXyI1NMkStWOS5zvqrOyYXgrEC3f/y1EBy5BlUlhiuRZTq3yG8WmlTTj
   Q==;
X-CSE-ConnectionGUID: 2uPSkqmGQdOizZDiagXMng==
X-CSE-MsgGUID: V+gVrq9PQVeKD1qkTvTdvQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="96057034"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="96057034"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jul 2026 03:48:46 -0700
X-CSE-ConnectionGUID: 8G4nOoNvRweGJzSrDRNKdA==
X-CSE-MsgGUID: 3M8S7wJvSy6qkcC7Rn1Ndw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="279928977"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa001.fm.intel.com with ESMTP; 13 Jul 2026 03:48:45 -0700
Received: by black.igk.intel.com (Postfix, from userid 1058)
	id A784998; Mon, 13 Jul 2026 12:48:44 +0200 (CEST)
From: Niklas Neronin <niklas.neronin@linux.intel.com>
To: mathias.nyman@linux.intel.com
Cc: linux-usb@vger.kernel.org,
	Niklas Neronin <niklas.neronin@linux.intel.com>
Subject: [PATCH 10/22] usb: xhci: rework USB2 PORTHLPMC macros
Date: Mon, 13 Jul 2026 12:47:24 +0200
Message-ID: <20260713104738.629612-11-niklas.neronin@linux.intel.com>
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
 drivers/usb/host/xhci-port.h | 17 +++++++++++------
 drivers/usb/host/xhci.c      |  3 ++-
 2 files changed, 13 insertions(+), 7 deletions(-)

diff --git a/drivers/usb/host/xhci-port.h b/drivers/usb/host/xhci-port.h
index 1ec0ee01e552..3aa23e143521 100644
--- a/drivers/usb/host/xhci-port.h
+++ b/drivers/usb/host/xhci-port.h
@@ -172,13 +172,18 @@
 /* bits 15:0 - Link Soft Error Count, if LSECC=1 else RsvdP */
 /* bits 31:16 - RsvdP */
 
-/* USB2 Protocol PORTHLPMC */
-#define PORT_HIRDM(p)((p) & 3)
-#define PORT_L1_TIMEOUT(p)(((p) & 0xff) << 2)
-#define PORT_BESLD(p)(((p) & 0xf) << 10)
-
-/* use 512 microseconds as USB2 LPM L1 default timeout. */
+/* USB2 Port Hardware LPM Control Register (PORTHLPMC) 5.4.11.2 */
+/* bits 1:0 - Host Initiated Resume Duration Mode */
+#define PORT_HIRDM_MASK		GENMASK(1, 0)
+/*
+ * bits 9:2 - L1 Timeout, can be 128us to 65280us (0xff), in 128us increments.
+ * The default timeout is 128us.
+ */
+#define PORT_L1_TIMEOUT_MASK	GENMASK(9, 2)
 #define XHCI_L1_TIMEOUT		512
+/* bits 13:10 - Best Effort Service Latency Deep */
+#define PORT_BESLD_MASK		GENMASK(13, 10)
+/* bits 31:14 - RsvdP */
 
 /* Set default HIRD/BESL value to 4 (350/400us) for USB2 L1 LPM resume latency.
  * Safe to use with mixed HIRD and BESL systems (host and device) and is used
diff --git a/drivers/usb/host/xhci.c b/drivers/usb/host/xhci.c
index edfb2e0739f0..9ae4f6b3e5ec 100644
--- a/drivers/usb/host/xhci.c
+++ b/drivers/usb/host/xhci.c
@@ -4654,7 +4654,8 @@ static int xhci_calculate_usb2_hw_lpm_params(struct usb_device *udev)
 		hirdm = 1;
 	}
 
-	return PORT_BESLD(besld) | PORT_L1_TIMEOUT(l1) | PORT_HIRDM(hirdm);
+	return FIELD_PREP(PORT_BESLD_MASK, besld) | FIELD_PREP(PORT_L1_TIMEOUT_MASK, l1) |
+	       FIELD_PREP(PORT_HIRDM_MASK, hirdm);
 }
 
 static int xhci_set_usb2_hardware_lpm(struct usb_hcd *hcd,
-- 
2.50.1


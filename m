Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EE4450EBF3
	for <linux-usb@vger.kernel.org>; Wed, 16 Sep 2026 14:16:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789568165; cv=none; b=hDd4ZrYTuztZhH1fu+JVUi6yJ5nPGa4kYunxoJRrcSpQa06j50fFI9iutD4MmxEvSFSWtwqzntguZxNhIGqCQERXcZB2qr4AH/Gvk91ZPIUWbph588WoCxfzMF4kYrqsS14K35l1WvXQEgjAR39brj2cMlGhmBQ8wMZqz/kOVjo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789568165; c=relaxed/simple;
	bh=PxMQMrAp8EUsQKdEM1dFHJJwbssE/z8KvOBd1f7mwlQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qSSt96K67mR+p1MwzHSOZ3j62tMCeIgjFLo2iE4QzQDnuxavZiwQNnF8nz6hHKifyfK0WMtrq1QE+c2W2ZBPvK+JpHMLye4jnWqwdUo+6eIomGFzNx9M3l29NFpWIPnntB99BYF6WcecaMLNJbl/z+CrZa0w9H8nGWiwQY9/iyg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZxmDYvhE; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZxmDYvhE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789568164; x=1821104164;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=PxMQMrAp8EUsQKdEM1dFHJJwbssE/z8KvOBd1f7mwlQ=;
  b=ZxmDYvhExt3fpHAs1X2IhBg6T1Jv499Te7I31Uvf73U+JEGo7gVYV08X
   5C4eWVpWaw5T8wIwlJqyq1rYF8izc0UkfXmESi9r7GkSDu4SvPrE5S7rz
   2GUx77SqZbcVkeTy/F77O3N70PmJuZWYzg93P1PfFn0JV+E9Rb3m0W2hm
   wshsRjjdtBgUlOjmGhXtJ1GxTiWSKplcyajgS0/LoHpuWyqn0DthDp/bw
   uCExBOYUUhtgN28ARrkF5ARCjNFPPHzPmeKXPmnZzBrL+tZcuXQcqrCAs
   xpfj+n0yTqSzA84VLM0+6g11fwt5fOsxwOWCLaoMfOXblofW6eqE4swFE
   Q==;
X-CSE-ConnectionGUID: 1xL0BU6FTXC6nicbnfy2Kg==
X-CSE-MsgGUID: iv3RMz8TSmSRBKOqMyeAlg==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="89967293"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="89967293"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2026 07:16:03 -0700
X-CSE-ConnectionGUID: VaiaVOAER1226O4r+cII2w==
X-CSE-MsgGUID: 3/8Ha786Q3iblyLs16BTQQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="270720162"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa008.fm.intel.com with ESMTP; 16 Sep 2026 07:16:02 -0700
Received: by black.igk.intel.com (Postfix, from userid 1058)
	id 89CF499; Wed, 16 Sep 2026 16:16:01 +0200 (CEST)
From: Niklas Neronin <niklas.neronin@linux.intel.com>
To: mathias.nyman@linux.intel.com
Cc: linux-usb@vger.kernel.org,
	Niklas Neronin <niklas.neronin@linux.intel.com>
Subject: [PATCH v2 11/20] usb: xhci: rework USB2 PORTHLPMC macros
Date: Wed, 16 Sep 2026 16:14:00 +0200
Message-ID: <20260916141409.629621-12-niklas.neronin@linux.intel.com>
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
 drivers/usb/host/xhci-port.h | 17 +++++++++++------
 drivers/usb/host/xhci.c      |  3 ++-
 2 files changed, 13 insertions(+), 7 deletions(-)

diff --git a/drivers/usb/host/xhci-port.h b/drivers/usb/host/xhci-port.h
index 070cf44f12ea..064588335e74 100644
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
index 0d4c31a86aad..3c9e3244f941 100644
--- a/drivers/usb/host/xhci.c
+++ b/drivers/usb/host/xhci.c
@@ -4655,7 +4655,8 @@ static int xhci_calculate_usb2_hw_lpm_params(struct usb_device *udev)
 		hirdm = 1;
 	}
 
-	return PORT_BESLD(besld) | PORT_L1_TIMEOUT(l1) | PORT_HIRDM(hirdm);
+	return FIELD_PREP(PORT_BESLD_MASK, besld) | FIELD_PREP(PORT_L1_TIMEOUT_MASK, l1) |
+	       FIELD_PREP(PORT_HIRDM_MASK, hirdm);
 }
 
 static int xhci_set_usb2_hardware_lpm(struct usb_hcd *hcd,
-- 
2.50.1


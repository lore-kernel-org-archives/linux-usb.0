Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DC203E5EF0
	for <linux-usb@vger.kernel.org>; Mon, 13 Jul 2026 10:48:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783939727; cv=none; b=BsXeaeCGpoKjfzUs0J33huCQZ322qSSKPimZnym9kCMurLDhU7a4T0Oe3V01KtwR+oDHwpD7PGhmDy1QbMQKwO/jgMzOmujQgFGi0bRUcZacKRHSox9fi6NY4cTUIBItGhS44HN1nMDDFKPBS5QBH88cYlSqR2TDtXLRwv2OeKw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783939727; c=relaxed/simple;
	bh=xSatp2ptPotMfJ3t+OrKM6ECzL9YQWf3OoZ21ex0dus=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rbk04Skp6jAvg0CpehWErp9rGWwi9K+QqTgXDvmiIGBVrIbpIFECY7dU5LmAvhx09zENcrcbb1rKtlkpsJ6IFG6Irf7NZclnyKmrwNyHry9jiPNM1X8ngYgEvBiXgv2E6THfSAiw9KPVsMsITVldxyBLswFXMEBzRu2jQYmzKJo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=J/TwdMRU; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="J/TwdMRU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783939726; x=1815475726;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=xSatp2ptPotMfJ3t+OrKM6ECzL9YQWf3OoZ21ex0dus=;
  b=J/TwdMRULSkXe5qjB+hnOLdpkwDtw8DAysCPS7/zDM8i3HHGytI02KJM
   3q+wKy3/j+nQ2xnbzWBVQLnwpfig1V+UrglRrwyxXugW4BsjOh3gtEdfQ
   T5Nu4n0gojHvjhOYl4bsueyHxqeoHTN6MTelODCE0Eb+Wp/5JJlTWGm9x
   6Qc1tVQTUwq89sWW8ujJif5t7ihsm8/eBBTDrmtqnYLFq9t3pXZdliLtA
   n4SOthdKzbPghHDpnNukOyJ8LsMIwtVvmhPcVXwg5zf4XfR9wsGt/yc6w
   5Q5MsA0zmGfEYBYUbecwRPHoJZXOpZnb+BPlU/aoQtU3OyqIYMCa+ntsW
   w==;
X-CSE-ConnectionGUID: MkR1Pq7KSsmRKR94/oAI0w==
X-CSE-MsgGUID: hoXMGxzNTd6scuFCH2ouvg==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="84323791"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="84323791"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jul 2026 03:48:46 -0700
X-CSE-ConnectionGUID: zpTWeoZWTbOw/XD2gNPpLw==
X-CSE-MsgGUID: IFhamglYSYGMYKw4MUmGxQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="259821869"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa005.jf.intel.com with ESMTP; 13 Jul 2026 03:48:45 -0700
Received: by black.igk.intel.com (Postfix, from userid 1058)
	id 259869B; Mon, 13 Jul 2026 12:48:44 +0200 (CEST)
From: Niklas Neronin <niklas.neronin@linux.intel.com>
To: mathias.nyman@linux.intel.com
Cc: linux-usb@vger.kernel.org,
	Niklas Neronin <niklas.neronin@linux.intel.com>
Subject: [PATCH 09/22] usb: xhci: rework USB3 PORTHLPMC macros
Date: Mon, 13 Jul 2026 12:47:23 +0200
Message-ID: <20260713104738.629612-10-niklas.neronin@linux.intel.com>
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
 drivers/usb/host/xhci-port.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/usb/host/xhci-port.h b/drivers/usb/host/xhci-port.h
index c87a73f03540..1ec0ee01e552 100644
--- a/drivers/usb/host/xhci-port.h
+++ b/drivers/usb/host/xhci-port.h
@@ -168,6 +168,10 @@
 #define PORT_TDR_MASK		GENMASK(7, 4)
 /* bits 31:8 - RsvdP */
 
+/* USB3 Port Hardware LPM Control Register (PORTHLPMC) 5.4.11.1 */
+/* bits 15:0 - Link Soft Error Count, if LSECC=1 else RsvdP */
+/* bits 31:16 - RsvdP */
+
 /* USB2 Protocol PORTHLPMC */
 #define PORT_HIRDM(p)((p) & 3)
 #define PORT_L1_TIMEOUT(p)(((p) & 0xff) << 2)
-- 
2.50.1


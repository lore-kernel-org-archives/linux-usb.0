Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1776250C289
	for <linux-usb@vger.kernel.org>; Wed, 16 Sep 2026 14:16:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789568172; cv=none; b=DXgFWGxLPfO7yrIEZgd+BcxNN6eNm52m33bt30AGb/udrcXmE0MXjSEnT8vtWatjm5S0wmgkwHOmnUNBooVM/8RirPjnLNMJE+4tFtzXjZP09LW3RV7oQv/BnAah5eu5IGRiWDVc6CDZ87zmqMeVU6qn8dMdCjNfIpHc6IixvE8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789568172; c=relaxed/simple;
	bh=yn06GAEJZoEfweKJZTke3pTHpixoAA7K+DeGkazAEso=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YTMUYORN8LLZG37nJ8H5N0+7ODYry4myAxJcLMJhj3VD/Syf3RRFmHuxIrUysftTvEy9ZMfANAAnDFsUD7IkELd/d5L1DR3kSZh2/H8LxtfCVzzt9Li7l3u03jcqmL6eRiT0hMrKOL/NtipeoNJ65s+zX+DGlyNFOaryxew4TKU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=n4tEfawX; arc=none smtp.client-ip=192.198.163.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="n4tEfawX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789568171; x=1821104171;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=yn06GAEJZoEfweKJZTke3pTHpixoAA7K+DeGkazAEso=;
  b=n4tEfawXobjUNdeutfHICfofgfsdcweYjX0cW92yX8Z3/Hi7zOdm3ym6
   /Jmrd6MoQF+aRvagc6R+WB5aFZW7jVKscTzPeCi1hC66JlgG0/MFR5t5T
   DCA3QmuqUp30DuBZjcYE4hRPQ4+KuNUzXzQRlYqLraZaKQNc0Gb0SDW/H
   N+9AHEOisW9gJdURSDmMSdXonhwVGXHiseJAQDrPlNG7QY21sagy5mK0e
   wwC9/iRs5OXRdIfXDNXgJofuNYtDIiQAq5s6K7NNXh7HJZpQEVGq50kk1
   gVW+kZNykTxbGxxMXn466k5x7PCUdzhgTvpTj/XuAer5V1ZBEdbC7B4ms
   w==;
X-CSE-ConnectionGUID: m9bgvbNGRA+25PkqB7qFgw==
X-CSE-MsgGUID: kbOzKu4LS/W+SGExO5K32A==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="453787"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="453787"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa115.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2026 07:16:10 -0700
X-CSE-ConnectionGUID: szhfdXgUTa2OyaJx92rGEg==
X-CSE-MsgGUID: ta9IIadtRhemZ2DzTWWXWw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="273889499"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa009.jf.intel.com with ESMTP; 16 Sep 2026 07:16:10 -0700
Received: by black.igk.intel.com (Postfix, from userid 1058)
	id AD2E099; Wed, 16 Sep 2026 16:16:08 +0200 (CEST)
From: Niklas Neronin <niklas.neronin@linux.intel.com>
To: mathias.nyman@linux.intel.com
Cc: linux-usb@vger.kernel.org,
	Niklas Neronin <niklas.neronin@linux.intel.com>
Subject: [PATCH v2 15/20] usb: xhci: update PORTSC aggregate macros
Date: Wed, 16 Sep 2026 16:14:04 +0200
Message-ID: <20260916141409.629621-16-niklas.neronin@linux.intel.com>
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

PORTSC bit 24 is no longer reserved and is defined as Cold Attach
Status (CAS), a read-only field. Include it in 'XHCI_PORT_RO' and
remove it from the reserved mask.

PORTSC bit 31 is Warm Port Reset (WPR), used on USB 3 ports and
write-1-to-set. Include it in 'XHCI_PORT_RW1S', the macro is
currently not in use, hence no visible issues.

Signed-off-by: Niklas Neronin <niklas.neronin@linux.intel.com>
---
 drivers/usb/host/xhci-hub.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/usb/host/xhci-hub.c b/drivers/usb/host/xhci-hub.c
index fb75a171f5a0..365b821675a7 100644
--- a/drivers/usb/host/xhci-hub.c
+++ b/drivers/usb/host/xhci-hub.c
@@ -392,12 +392,12 @@ static unsigned int xhci_port_speed(int portsc)
 
 /*
  * These bits are Read Only (RO) and should be saved and written to the
- * registers: 0, 3, 10:13, 30
+ * registers: 0, 3, 10:13, 24, 30
  * connect status, over-current status, port speed, and device removable.
  * connect status and port speed are also sticky - meaning they're in
  * the AUX well and they aren't changed by a hot, warm, or cold reset.
  */
-#define	XHCI_PORT_RO	(PORT_CCS | PORT_OCA | PORT_SPEED_MASK | PORT_DR)
+#define	XHCI_PORT_RO	(PORT_CCS | PORT_OCA | PORT_SPEED_MASK | PORT_CAS | PORT_DR)
 /*
  * These bits are RW; writing a 0 clears the bit, writing a 1 sets the bit:
  * bits 5:8, 9, 14:15, 25, 26, 27
@@ -407,9 +407,9 @@ static unsigned int xhci_port_speed(int portsc)
 			 PORT_WDE | PORT_WOE)
 /*
  * These bits are RW; writing a 1 sets the bit, writing a 0 has no effect:
- * bit 4 (port reset)
+ * bits 4, 31
  */
-#define	XHCI_PORT_RW1S	(PORT_PR)
+#define	XHCI_PORT_RW1S	(PORT_PR | PORT_WPR)
 /*
  * These bits are RW; writing a 1 clears the bit, writing a 0 has no effect:
  * bits 1, 17, 18, 19, 20, 21, 22, 23
@@ -426,9 +426,9 @@ static unsigned int xhci_port_speed(int portsc)
 #define	XHCI_PORT_RW	(PORT_LWS)
 /*
  * These bits are Reserved Zero (RsvdZ) and zero should be written to them:
- * bits 2, 24, 28:31
+ * bits 2, 28:31
  */
-#define	XHCI_PORT_RZ	((1<<2) | (1<<24) | (0xf<<28))
+#define	XHCI_PORT_RZ	((1<<2) | (0xf<<28))
 
 /**
  * xhci_port_state_to_neutral() - Clean up read portsc value back into writeable
-- 
2.50.1


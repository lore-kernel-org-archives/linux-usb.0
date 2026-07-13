Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73CC13E51EC
	for <linux-usb@vger.kernel.org>; Mon, 13 Jul 2026 10:48:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783939740; cv=none; b=SfGHoqNnziaAV0lKI4txTV3p1pEyuNlWmnsTrdTJTc5tlWWgDBUDaGjCbSarYLGHLxue4QKNOuqfEj85Xl+nz6mGlBf+RYy5EVd2GFJzwIKDIfcXaNaUJ8Kb8Uum0yLqv9XhiqhDOJoJvlXCGsL/WB10u7x8UwX8mt13iHERCPo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783939740; c=relaxed/simple;
	bh=t1hUkTn4lu+hnBF548pTckd7SwB/M8sBKuCm/VkjD8Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bC44VK7wDHbJ6UpdiisJf89uAXAKlM8uLfodXeumyOIMzAAAWi6FiUh1e6E8MVE+f9YyCYAt1a2n5CCEN8YJJqGcXXzS8VCjLlh3yFH4p09GBBl8IAHVN068LteFe8gCD9NGDQZ5zuWcohCCoN7yoWVjKdnxMn7TnZPC4LRIYqE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=l0142jaO; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="l0142jaO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783939740; x=1815475740;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=t1hUkTn4lu+hnBF548pTckd7SwB/M8sBKuCm/VkjD8Q=;
  b=l0142jaOLqchtClQ8/QDvwjCujeLgEzspkxdeWOa/ev0oEc/Jm+6aouF
   Vgd7xiino5yWgmZGAkyRNO61zJhAf3crRCqDWMxTPPNXzPozy3aoqn4ae
   4vdVpjIvyXdMWdn8mtSO+oA2sQ4HwihnHNTqOiy27gkh2tsl5Rv1TB05h
   0pe3ZaS3zp5Bh9e/6ZOrdZqZbRapjOpEGil5iEFP3cjEz2Q1IDlCu2WLX
   EzJH51DIpPmtt6r/EivKa84W/zjwLl8mm5m3GAzce3SCL7nNILTsxbVCT
   pLmSb2/FyXxmlj0vPKHs9HI/j+FA+mG7CIncmRqxcWmaBrf6tHpvhba8O
   A==;
X-CSE-ConnectionGUID: GvSh9xLdTYW8TCMLaBC1dw==
X-CSE-MsgGUID: tt+T9y3jSUSDsRk0nvNxHw==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="96057039"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="96057039"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jul 2026 03:48:49 -0700
X-CSE-ConnectionGUID: hCzHu2BFRemHRkrDMaZ6KA==
X-CSE-MsgGUID: AIqzh+JLRtS7A1kUUbvCjA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="279928982"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa001.fm.intel.com with ESMTP; 13 Jul 2026 03:48:47 -0700
Received: by black.igk.intel.com (Postfix, from userid 1058)
	id BF34195; Mon, 13 Jul 2026 12:48:46 +0200 (CEST)
From: Niklas Neronin <niklas.neronin@linux.intel.com>
To: mathias.nyman@linux.intel.com
Cc: linux-usb@vger.kernel.org,
	Niklas Neronin <niklas.neronin@linux.intel.com>
Subject: [PATCH 14/22] usb: xhci: update PORTSC aggregate macros
Date: Mon, 13 Jul 2026 12:47:28 +0200
Message-ID: <20260713104738.629612-15-niklas.neronin@linux.intel.com>
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

PORTSC bit 24 is no longer reserved and is defined as Cold Attach
Status (CAS), a read-only field. Include it in 'XHCI_PORT_RO' and
remove it from the reserved mask.

PORTSC bit 31 is Warm Port Reset (WPR), used on USB 3 ports and
write-1-to-set. Include it in 'XHCI_PORT_RW1S'.

Signed-off-by: Niklas Neronin <niklas.neronin@linux.intel.com>
---
 drivers/usb/host/xhci-hub.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/usb/host/xhci-hub.c b/drivers/usb/host/xhci-hub.c
index c9f73054737d..48dda978d5a4 100644
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


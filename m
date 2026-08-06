Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 394B2477991
	for <linux-usb@vger.kernel.org>; Thu,  6 Aug 2026 14:21:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786026107; cv=none; b=FlzaITZcHO3mzvESryVb9El/K1swBwsT1rCmZflauA31odTSLQ2bUtx5yktzKVa0FNKwly2xYhF/P45Km8lwIPCWytt6bUf94bp3pAZes3fMo1wVtXHQjP64RDhJOWnXnpTx//GiovrQaT7RHQ9wAtA36gfdfg1SQCZc53moZDU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786026107; c=relaxed/simple;
	bh=zkpmfRl+J8lrGt2ipMHhfkyMuI1yc8yu/GZYvUK/bDo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WObzChlQW1hRchd5j5a+SyI75uaXnkbDWSlO2/SxZUjX3t81W7vZJTYXM3ddSU22ZER1aB+fOHghFKCX3p2k5XQV7Fpm6wZP/LwTX4GgoKe9vlvnNQ9E7whxKyzU3te6M6gOGxyvLTIq4GcU+k61NYDZxr2mH342VwoIyCKoFmE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=A41mNezg; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="A41mNezg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786026106; x=1817562106;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=zkpmfRl+J8lrGt2ipMHhfkyMuI1yc8yu/GZYvUK/bDo=;
  b=A41mNezgH6Q2ZbxUS0Rgr1sC0Od0tQGFJjUl8gaAZF8YvXsbJnIHmOqO
   01V/HyIo+Cvyo/n+7QKs7ZuDByebjKyz1IHa5wtz81wYXa2Bgo8u/sT4a
   2aH44mnc2OozAalh/zCaAGj20aJpFU6rxCb1896PKez8Wk8RLraC/hmvD
   XzH6MNyU4bbL+iKXdwUYxfQvMLn/DBG63El6yBKpqyOHAzKP9AZ0PB20K
   s9XzZf9+T0lCTKexc5/8ET8JIcI0//Zzqx3gDGzdaC2mvGIHcWD6VSDYZ
   h6oNZTIDgaNRzUpoMv3s+SrBCLCNTZhbdPjemMFLf2MaGAjW7URhLI6Ts
   g==;
X-CSE-ConnectionGUID: P/kiPl/4SrC5j/HXw3LIBQ==
X-CSE-MsgGUID: eH0iE4OYRwqqC+QGHIK5wA==
X-IronPort-AV: E=McAfee;i="6800,10657,11867"; a="97268187"
X-IronPort-AV: E=Sophos;i="6.25,208,1779174000"; 
   d="scan'208";a="97268187"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Aug 2026 07:21:46 -0700
X-CSE-ConnectionGUID: ENMmZgnATu+zQfGK3OqJVA==
X-CSE-MsgGUID: ocD/3/edSnK+q/YLolWpmA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,208,1779174000"; 
   d="scan'208";a="285500478"
Received: from amilburn-desk.amilburn-desk (HELO mnyman-desk.home) ([10.245.244.235])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Aug 2026 07:21:45 -0700
From: Mathias Nyman <mathias.nyman@linux.intel.com>
To: <gregkh@linuxfoundation.org>
Cc: <linux-usb@vger.kernel.org>,
	Niklas Neronin <niklas.neronin@linux.intel.com>,
	Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH 12/17] usb: xhci: use 64-bit Addressing Capability macro
Date: Thu,  6 Aug 2026 17:21:08 +0300
Message-ID: <20260806142113.2436238-13-mathias.nyman@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260806142113.2436238-1-mathias.nyman@linux.intel.com>
References: <20260806142113.2436238-1-mathias.nyman@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Niklas Neronin <niklas.neronin@linux.intel.com>

Simplify by replace BIT(0) call with its relevant macro.

Signed-off-by: Niklas Neronin <niklas.neronin@linux.intel.com>
Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
---
 drivers/usb/host/xhci.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/host/xhci.c b/drivers/usb/host/xhci.c
index 2faf91966890..174fea16cd50 100644
--- a/drivers/usb/host/xhci.c
+++ b/drivers/usb/host/xhci.c
@@ -5523,7 +5523,7 @@ int xhci_gen_setup(struct usb_hcd *hcd, xhci_get_quirks_t get_quirks)
 	 * DMA_BIT_MASK(32)) in this xhci_gen_setup().
 	 */
 	if (xhci->quirks & XHCI_NO_64BIT_SUPPORT)
-		xhci->hcc_params &= ~BIT(0);
+		xhci->hcc_params &= ~HCC_64BIT_ADDR;
 
 	/*
 	 * Set dma_mask and coherent_dma_mask to 64-bits if xHC supports
-- 
2.43.0


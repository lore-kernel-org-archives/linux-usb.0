Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 160B23815D0
	for <linux-usb@vger.kernel.org>; Wed,  3 Jun 2026 09:11:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780477916; cv=none; b=E1WYJDJxrKxez58mm7mnesTj+9EnT6M/fSs/RDr4AIzJDHZ1WCYLmOMhbVLLa0szX2+yBS3PWncxA9rsxy5nJV3ePztixvLecxnpZkZSG6HDzqGEthO3oe3VkRpeVhNf5GPmd4e9+q3BiOr+lgWRV5SvvNesxtHBhdMPjYQSZRQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780477916; c=relaxed/simple;
	bh=Ljc2ehxtPDPBX+zuOeRUkj0uhNKAgopNDmjKdRgg/AM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rY+/n2HiHTfDESUz+K3hpphE0mbOJyeYIs55fyvSf/yGWf9Tk7A55gSFEqVqqgAWL4UJdYpUU5+n7eW8qnFrCr36F8cunCMZ4mZ/e/G/ERSt5rg3exqcZJXb811FCK3tYKs4uMSVJyVm1J8IWbHELloJanm4TySozS1UmEJSyRg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Z4PMRtYZ; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Z4PMRtYZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780477915; x=1812013915;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Ljc2ehxtPDPBX+zuOeRUkj0uhNKAgopNDmjKdRgg/AM=;
  b=Z4PMRtYZctz6OBfIsL13/BN4O2Y/3K487lrHNgltxjhr/2JqxkM6gCKO
   ZGPw8akiJfwaN3KS00ONvdbd8gRe+AoXotIbIjZkqrsaU5giS45mbcZ7F
   VzHiyHGouuxQs0tS0N2q5lPQsEO48cXENk6vZOz3MdiH4nS968uV7cytm
   eM6Lxtqc2POslvY5x2t6hVFZ74LunWeaaaH1/AkAUgGqw9pjhJyb6u8Wu
   noxJQV1vhdwz4dAJrufvj14BEBBD8bT+8DYqfKIwwdgnoBlBEfd284QyR
   WV4uY6gxcmRwGBVhTRM5RLuM9b16xXwyil7Ir1Icya4YT+BguJWgx5J/G
   A==;
X-CSE-ConnectionGUID: 7UTcds+pTkW70FTTU2gMNQ==
X-CSE-MsgGUID: YhrjC4PNSkSo5PYg6U6Z7Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11805"; a="92657530"
X-IronPort-AV: E=Sophos;i="6.24,184,1774335600"; 
   d="scan'208";a="92657530"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jun 2026 02:11:55 -0700
X-CSE-ConnectionGUID: zlDTvfgzT9KqPLlzO1oTfw==
X-CSE-MsgGUID: EWxzVEqIRF63gFtH1XazCg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,184,1774335600"; 
   d="scan'208";a="244281807"
Received: from slindbla-desk.ger.corp.intel.com (HELO mnyman-desk.intel.com) ([10.245.244.174])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jun 2026 02:11:54 -0700
From: Mathias Nyman <mathias.nyman@linux.intel.com>
To: <gregkh@linuxfoundation.org>
Cc: <linux-usb@vger.kernel.org>,
	Michal Pecio <michal.pecio@gmail.com>,
	Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH 03/15] usb: xhci: Simplify xhci_quiesce()
Date: Wed,  3 Jun 2026 12:11:20 +0300
Message-ID: <20260603091132.1110849-4-mathias.nyman@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260603091132.1110849-1-mathias.nyman@linux.intel.com>
References: <20260603091132.1110849-1-mathias.nyman@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Michal Pecio <michal.pecio@gmail.com>

The function reads USBCMD, clears some bits and writes it back.
Its treatment of the Run bit is weird: the bit is usually written
as 0, as we would expect, but it may also be written as 1 if both
its current value and USBSTS.HCHalted are observed as 1.

Per xHCI 5.4.2, HCHalted is 0 whenever Run is 1, so the above can
only happen due to buggy HW or SW, e.g. concurrent xhci_quiesce()
and xhci_start() execution.

It's unclear why we should treat such cases specially and write
the bit as 1. The logic comes from original PoC implementation
and has never been explained. Just write 0 every time, which
looks like the safer choice when the intent is to stop the xHC.

We could get in trouble if clearing Run causes some very broken
xHC to start running after it was halted, but no such case has
been documented. It seems the logic was just poorly thought out.

Signed-off-by: Michal Pecio <michal.pecio@gmail.com>
Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
---
 drivers/usb/host/xhci.c | 9 +--------
 1 file changed, 1 insertion(+), 8 deletions(-)

diff --git a/drivers/usb/host/xhci.c b/drivers/usb/host/xhci.c
index a54f5b57f205..0bf0446b4c87 100644
--- a/drivers/usb/host/xhci.c
+++ b/drivers/usb/host/xhci.c
@@ -102,17 +102,10 @@ int xhci_handshake(void __iomem *ptr, u32 mask, u32 done, u64 timeout_us)
  */
 void xhci_quiesce(struct xhci_hcd *xhci)
 {
-	u32 halted;
 	u32 cmd;
-	u32 mask;
-
-	mask = ~(XHCI_IRQS);
-	halted = readl(&xhci->op_regs->status) & STS_HALT;
-	if (!halted)
-		mask &= ~CMD_RUN;
 
 	cmd = readl(&xhci->op_regs->command);
-	cmd &= mask;
+	cmd &= ~(CMD_RUN | XHCI_IRQS);
 	writel(cmd, &xhci->op_regs->command);
 }
 
-- 
2.43.0


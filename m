Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34CD637CD2A
	for <linux-usb@vger.kernel.org>; Wed,  3 Jun 2026 09:12:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780477925; cv=none; b=u2j6OwtMf4OI+PIbxGlptv3An/batBrFNFwYwcwyRBvsYHpL6NMn8UzWVnJWd8/BkSraB3OBpUG+v6KLmmY3EE4S284PlCryou5flrVmJ+p7k5dsDtcwkt/LhAY12QFEXiUQituolNyO7LtzE4FT7ONh3YawDQBOUZAKTFyUr7M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780477925; c=relaxed/simple;
	bh=+eI/6dVCA4j88bpanBqpsBduGKtgvdhBkMie72c4cG0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Op02IIlaGvERkLFXFfEYT4h180bzYE+Nyorm9djcmkTWpvvmOOIdI/RQhjlBR1T6RUrnqCOzCo/c5Otdjv0Fkj3S94/Udik+9j/20N413nIqIE2kqFCTo/U0SyoacC+mZMpdwnKn5Kq+iJrwy3Sy0CDndA2UU/5GA8yaRiM6XRo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=h0ew1DPf; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="h0ew1DPf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780477924; x=1812013924;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=+eI/6dVCA4j88bpanBqpsBduGKtgvdhBkMie72c4cG0=;
  b=h0ew1DPfOb1w8igMielhaSvtG6litMah4QEG2FH86h9iYpHja4a8h/d2
   rVMdztdYXj0Exaa5UNn6MnMQZbfSFLmmyVyYijdTCtrHD3w+MR6iYGhlF
   AoruEpg4VBPmbi9ZWztSRDwvbEiPV5ZAh4zRTWqB76HKiCfbIJw5Xbktf
   lAZP1IVutZrZnKzynnsPP864+sLFizToKDpPFXFbAzR2/VsWEsSIglwfn
   58Fy+FkR5TEFWIAK+ZtB3d2/XV0XBWYXXO7636mFmF2mzpQP8D+R22WHe
   cGxm9brOh1Xyyq9bnTYwkt1uiyHBwPP1pbIUO1Z8q0qJpu0+By5G1o3Ab
   Q==;
X-CSE-ConnectionGUID: DVLbE0hOS6qOUX8tAESBfA==
X-CSE-MsgGUID: /OzWvwMMQeGQu/slGTOVSg==
X-IronPort-AV: E=McAfee;i="6800,10657,11805"; a="92657581"
X-IronPort-AV: E=Sophos;i="6.24,184,1774335600"; 
   d="scan'208";a="92657581"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jun 2026 02:12:04 -0700
X-CSE-ConnectionGUID: WvqDezfpTyiplbBaZ01kTg==
X-CSE-MsgGUID: TKACcVVIT7uk1h99uS54fg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,184,1774335600"; 
   d="scan'208";a="244281987"
Received: from slindbla-desk.ger.corp.intel.com (HELO mnyman-desk.intel.com) ([10.245.244.174])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jun 2026 02:12:03 -0700
From: Mathias Nyman <mathias.nyman@linux.intel.com>
To: <gregkh@linuxfoundation.org>
Cc: <linux-usb@vger.kernel.org>,
	Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH 09/15] xhci: dbc: add helper to set and clear DbC DCE enable bit
Date: Wed,  3 Jun 2026 12:11:26 +0300
Message-ID: <20260603091132.1110849-10-mathias.nyman@linux.intel.com>
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

Add xhci_dbc_enable_dce() helper to enable or disable DbC by manipulating
DCE bit correctly. It will be used for stuck DbC recovery attempts in
addition to normal DbC enable and disable functionality

Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
---
 drivers/usb/host/xhci-dbgcap.c | 29 ++++++++++++++++++-----------
 1 file changed, 18 insertions(+), 11 deletions(-)

diff --git a/drivers/usb/host/xhci-dbgcap.c b/drivers/usb/host/xhci-dbgcap.c
index 49ae546c4103..8cf0f0356bf1 100644
--- a/drivers/usb/host/xhci-dbgcap.c
+++ b/drivers/usb/host/xhci-dbgcap.c
@@ -628,18 +628,30 @@ static void xhci_dbc_mem_cleanup(struct xhci_dbc *dbc)
 	dbc->ring_evt = NULL;
 }
 
+static int xhci_dbc_enable_dce(struct xhci_dbc *dbc, bool enable)
+{
+	u32 done_state = 0;
+	u32 ctrl = 0;
+
+	if (enable) {
+		ctrl = readl(&dbc->regs->control);
+		ctrl |= DBC_CTRL_DBC_ENABLE | DBC_CTRL_PORT_ENABLE;
+		done_state =  DBC_CTRL_DBC_ENABLE;
+	}
+
+	writel(ctrl, &dbc->regs->control);
+	return xhci_handshake(&dbc->regs->control, DBC_CTRL_DBC_ENABLE,
+			      done_state, 1000);
+}
+
 static int xhci_do_dbc_start(struct xhci_dbc *dbc)
 {
 	int			ret;
-	u32			ctrl;
 
 	if (dbc->state != DS_DISABLED)
 		return -EINVAL;
 
-	writel(0, &dbc->regs->control);
-	ret = xhci_handshake(&dbc->regs->control,
-			     DBC_CTRL_DBC_ENABLE,
-			     0, 1000);
+	ret = xhci_dbc_enable_dce(dbc, false);
 	if (ret)
 		return ret;
 
@@ -647,12 +659,7 @@ static int xhci_do_dbc_start(struct xhci_dbc *dbc)
 	if (ret)
 		return ret;
 
-	ctrl = readl(&dbc->regs->control);
-	writel(ctrl | DBC_CTRL_DBC_ENABLE | DBC_CTRL_PORT_ENABLE,
-	       &dbc->regs->control);
-	ret = xhci_handshake(&dbc->regs->control,
-			     DBC_CTRL_DBC_ENABLE,
-			     DBC_CTRL_DBC_ENABLE, 1000);
+	ret = xhci_dbc_enable_dce(dbc, true);
 	if (ret)
 		return ret;
 
-- 
2.43.0


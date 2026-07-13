Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E4C43E9C05
	for <linux-usb@vger.kernel.org>; Mon, 13 Jul 2026 10:49:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783939745; cv=none; b=H5ov8A9vKHnHDFzbTj4oeZeSPgUx29QGSlzoIUjx8R2ftDUDM+DPfQWGg2r7vxgXbB/qrZ7X99jg15N7qm1N+07bGzlFNu1d8O3QfBpSdkHOTfZMpf3+uLJw/UZ27AWPqmqgPr5ZsWl0kJ04FXPHANY6SLTWmw45AGKwedUGdWk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783939745; c=relaxed/simple;
	bh=d1qLS9rdx642nmdNSrfdGeoSNf6RveBFrz2IBkwJWO8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jElKhr6tYHYWg14cP1joFAaFJM5eOPWN1cWOLLq+1gzj897NI/LZpYjQWD10NQ6PNQc2wlgJZhc7bBJ1WzxUskUX1I9v+Gchi6wMENG0C+yG4Yl3Zxb36IxjgcS3KhVFCvBS2ANTGMqoa8ktx/06esnKxXAw+5UmYP4Xhgx9IsA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FpCw+C1F; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FpCw+C1F"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783939742; x=1815475742;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=d1qLS9rdx642nmdNSrfdGeoSNf6RveBFrz2IBkwJWO8=;
  b=FpCw+C1F07R2tSuw4T2XVbTvkjgGUnwH5iaId6d3VaWQQ9R8fVZRCuBF
   W7W3M0xjRDEYaFoLH10bMYRgXRjnOkYz4DJBCydXxBPB06H9OWRCdJunJ
   HHHUkB1dQBPdxqRzO/7geMU5hzX5LPI3gn947elnFPXVI3sKcxysYnWLv
   OBMpZOWlE8UuXfToXFN6CyRaiNLB5mnAfynrS2O6FknysFfp2+/nr3w9g
   7adwev/2kPaEl/G5UxVo5rD3nwHuavilaERmMqm9myoF4vsoCmwV3KhcM
   15syW/jJgUCB6Su0lA2UQwKy4XBdYzKRU2Um9jK5x5blMkl+YJtyi/ll2
   g==;
X-CSE-ConnectionGUID: 87L8jV8gTGqoSCROjh54+w==
X-CSE-MsgGUID: d6qtSYDySw2tBnM5m4j51Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="96057043"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="96057043"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jul 2026 03:48:50 -0700
X-CSE-ConnectionGUID: PKbBPMb0S72UJvAqmNBAqw==
X-CSE-MsgGUID: Wd53o719TJm1wEKvNwPHbA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="279928987"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa001.fm.intel.com with ESMTP; 13 Jul 2026 03:48:49 -0700
Received: by black.igk.intel.com (Postfix, from userid 1058)
	id E163099; Mon, 13 Jul 2026 12:48:48 +0200 (CEST)
From: Niklas Neronin <niklas.neronin@linux.intel.com>
To: mathias.nyman@linux.intel.com
Cc: linux-usb@vger.kernel.org,
	Niklas Neronin <niklas.neronin@linux.intel.com>
Subject: [PATCH 18/22] usb: xhci: improve xhci_port_missing_cas_quirk()
Date: Mon, 13 Jul 2026 12:47:32 +0200
Message-ID: <20260713104738.629612-19-niklas.neronin@linux.intel.com>
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

Previously the function dropped all RW1CS and Wake bits and set the
Warm Port Reset (WPR) bit.

This was done by manually clearing RW1CS and Wake bits and then
setting WPR. Instead, use xhci_port_state_to_neutral(), which
already drops all bits with write side effects (e.g. RW1CS, RW1S and
reserved-zero fields), and produces a safe value for writeback.

Afterwards, explicitly clear the Wake bits.

Compared to the previous logic, this also correctly clears additional
bits such as reserved-zero (bits 2, 28, 29) and RW1S bit (bit 4),
which could otherwise lead to unintended behavior.

Overall this simplifies the code and aligns it with the generic PORTSC
sanitization logic.

Signed-off-by: Niklas Neronin <niklas.neronin@linux.intel.com>
---
 drivers/usb/host/xhci-hub.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/host/xhci-hub.c b/drivers/usb/host/xhci-hub.c
index 0375929aac70..17347bca0682 100644
--- a/drivers/usb/host/xhci-hub.c
+++ b/drivers/usb/host/xhci-hub.c
@@ -1785,8 +1785,9 @@ static bool xhci_port_missing_cas_quirk(struct xhci_port *port)
 	if (pls != PLS_POLLING && pls != PLS_COMP_MODE)
 		return false;
 
-	/* clear wakeup/change bits, and do a warm port reset */
-	portsc &= ~(PORTSC_RW1CS_BITS | PORT_WAKE_BITS);
+	portsc = xhci_port_state_to_neutral(portsc);
+	/* clear wakeup and do a warm port reset */
+	portsc &= ~PORT_WAKE_BITS;
 	portsc |= PORT_WPR;
 	xhci_portsc_writel(port, portsc);
 	/* flush write */
-- 
2.50.1


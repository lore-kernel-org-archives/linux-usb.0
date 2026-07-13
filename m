Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAC653E4500
	for <linux-usb@vger.kernel.org>; Mon, 13 Jul 2026 10:49:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783939747; cv=none; b=GuSx6ExTisMwshWzfNmcAWrvw0mCCEYAB7s2eRdyb7EhN6a/Eq8gw0ylQH+EYi4g65Jcf9BY2ls+1gdfXq/gFpBHArlTyQ+STxOFwLBIrzPGUJfO/ifUYFqy73T4op+/kATjBBDtfAB6gjn4dOZUF47DBu3t77yK+KuqLNE94JY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783939747; c=relaxed/simple;
	bh=dYmjwq5xVY6Zxm7viTCpKNJRwyQ51K2OaGIV6zLipKs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=idLe1NECYwNEZ1+krJzQRwmAKoKOl6R55yIPhhvpJx4B+9omfZ48QAR6JRpv7gaFANjId+vKXD6ZJXidpbFQhDi7i1Xq26faDGBv+dHNDbqYA7xyzN1FvknHTamQPM4pwHTeATDwiQzSp9k3Rh+jwV4h/Ls9o/J+9UWvYjfecUI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZKmLYANy; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZKmLYANy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783939746; x=1815475746;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=dYmjwq5xVY6Zxm7viTCpKNJRwyQ51K2OaGIV6zLipKs=;
  b=ZKmLYANymcpT+avbrk2DgIauRyCznAjQs2OHqtbsqoCU0sf987bWKoD4
   qZodXwYNBP133t96S/XyVdzWFzThtPyR8YsBWVUf9aQ80eAr05tpPKPao
   isq5cmMaaMlFiBoGzpn2ZgNUGnmbM/Hu5MhIEe+TP021YoKsJHDUK2Pbg
   82eoqr0kmFBy23floyvMNMI6rpYwLqmfKFh1D/yntUBhJi+NGI/5AueRB
   z+WunymIsydoSm/CTRp99bxpwOQs9eT4HBAe245bFUkkNrXG2ZZAsIzRb
   lnN4t1FYwm90RAkCXWXAGQcmJ4/RSsJt1kX7N0mlrSmsJcnxKVeSOfBX3
   g==;
X-CSE-ConnectionGUID: XQryZ43eRTyNq1tk2aSTxQ==
X-CSE-MsgGUID: sxL3LoDmR0i7N1ISsgt/dw==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="96057047"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="96057047"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jul 2026 03:48:52 -0700
X-CSE-ConnectionGUID: RwlovIfZS9SyXeXuq+n+Ig==
X-CSE-MsgGUID: 45Z71cB6Q4yVGPi+Zxi/CQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="279928990"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa001.fm.intel.com with ESMTP; 13 Jul 2026 03:48:51 -0700
Received: by black.igk.intel.com (Postfix, from userid 1058)
	id 86E9099; Mon, 13 Jul 2026 12:48:50 +0200 (CEST)
From: Niklas Neronin <niklas.neronin@linux.intel.com>
To: mathias.nyman@linux.intel.com
Cc: linux-usb@vger.kernel.org,
	Niklas Neronin <niklas.neronin@linux.intel.com>
Subject: [PATCH 21/22] usb: xhci: move struct 'xhci_port' specific macro
Date: Mon, 13 Jul 2026 12:47:35 +0200
Message-ID: <20260713104738.629612-22-niklas.neronin@linux.intel.com>
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

This macro is not for a USB Port Register, rather specific macro for
struct 'xhci_port'. Because xhci-port.h contains only xHCI specification
macros, move 'DUPLICATE_ENTRY' macro out of xhci-port.h.

Signed-off-by: Niklas Neronin <niklas.neronin@linux.intel.com>
---
 drivers/usb/host/xhci-port.h | 3 ---
 drivers/usb/host/xhci.h      | 3 +++
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/host/xhci-port.h b/drivers/usb/host/xhci-port.h
index 7ec67924cace..f190fd9b720a 100644
--- a/drivers/usb/host/xhci-port.h
+++ b/drivers/usb/host/xhci-port.h
@@ -131,9 +131,6 @@
 /* Writing 1 sets the bit, writing 0 clears the bit. */
 #define	PORTSC_RW_BITS		(PORT_LWS)
 
-/* We mark duplicate entries with -1 */
-#define DUPLICATE_ENTRY ((u8)(-1))
-
 /* USB3 Port Power Management Status and Control (PORTPMSC) 5.4.9.1 */
 /*
  * bits 7:0 - U1 Timeout, inactivity timer value for transitions into U1.
diff --git a/drivers/usb/host/xhci.h b/drivers/usb/host/xhci.h
index 2d74b643aa11..ff0d2546bc0e 100644
--- a/drivers/usb/host/xhci.h
+++ b/drivers/usb/host/xhci.h
@@ -1483,6 +1483,9 @@ struct xhci_port_cap {
 	u32			protocol_caps;
 };
 
+/* We mark duplicate 'hcd_portnum' entries with -1 */
+#define DUPLICATE_ENTRY ((u8)(-1))
+
 struct xhci_port {
 	struct xhci_port_regs __iomem	*port_reg;
 	int			hw_portnum;
-- 
2.50.1


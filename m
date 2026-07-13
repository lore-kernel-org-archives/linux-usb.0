Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31E893D9523
	for <linux-usb@vger.kernel.org>; Mon, 13 Jul 2026 10:48:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783939727; cv=none; b=BiMeBUYN3YqX20Y7BjoML+JCjsfbecGSbAjd+xxOKF7iamIJcTk4/+W+e0gknsOnZ81JB3Z0UiGrlS05YrZmZ87pDM0unN3n8CWakTxcJDfm+7ArTehhCDHBTLYs1URU43LTkz/TR+2Q5RWXY3wOHcD7fdDJ8ixFVFqdejUtHM0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783939727; c=relaxed/simple;
	bh=/vqNukA+VHPRVkZ1nIzVjH7Vb90ZWixE7dXZ8qS9dlM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EKZYtN8lwQUH+Abgv2Av/Zl6dH6gUppxk3QX5M93GfsnH4TOV7Ce/KXX5vh6wIERoxY2AdfExMmJbyQE27B3tbQmNtvvJKRk1zmUY909QlZMnIkFJgG6SsWINO4S3R+gZyHUb3VuXzvOdCjhGU+1yVQNicNZsxpTIUTPRzJLHIw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NzvmatT2; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NzvmatT2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783939726; x=1815475726;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=/vqNukA+VHPRVkZ1nIzVjH7Vb90ZWixE7dXZ8qS9dlM=;
  b=NzvmatT2iVmzgLtBHIhK6BrKxVO1VYDQpMS6qZW85T3z4X/SrfyfB4eR
   HokGTJpBzka5ztPBgCkXI17xLX0IkpDxMexxRx4d/ffoBn1KENwzgRmZk
   1+pD1XPumurvsU6k4I1WWjjTw5mdsZTJyvDwVD9eLzGb6lTM1CMOMSawI
   hSEv1U690TKovYgEn0K8ksfRPgRJH6BupMB9vFFeUjUNq7vAHAmA9zTK8
   oaT5h4ZVWrVzLC/jSP/WBluwzAug3B0Q3l0S0gwmFswTmQhB0qPIuslsf
   GY1JSVBf6D0OXghRbNDwkCl9UGcc0wQ3+to3Obfwkuuq0Qp4V73m+t4/b
   g==;
X-CSE-ConnectionGUID: wVZQsLDsTbeA9KH/+1BBrA==
X-CSE-MsgGUID: aHRjR1XvQ92NduDKBFsi4w==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="96057033"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="96057033"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jul 2026 03:48:45 -0700
X-CSE-ConnectionGUID: sTmgQ/zhSjG99uuNHQlaLQ==
X-CSE-MsgGUID: CM1W6D64TSuQH9Rb/r9BZA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="279928976"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa001.fm.intel.com with ESMTP; 13 Jul 2026 03:48:44 -0700
Received: by black.igk.intel.com (Postfix, from userid 1058)
	id 9A08395; Mon, 13 Jul 2026 12:48:43 +0200 (CEST)
From: Niklas Neronin <niklas.neronin@linux.intel.com>
To: mathias.nyman@linux.intel.com
Cc: linux-usb@vger.kernel.org,
	Niklas Neronin <niklas.neronin@linux.intel.com>
Subject: [PATCH 08/22] usb: xhci: rework USB2 PORTLI macros
Date: Mon, 13 Jul 2026 12:47:22 +0200
Message-ID: <20260713104738.629612-9-niklas.neronin@linux.intel.com>
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
 drivers/usb/host/xhci-debugfs.c | 5 +++--
 drivers/usb/host/xhci-port.h    | 9 ++++++---
 2 files changed, 9 insertions(+), 5 deletions(-)

diff --git a/drivers/usb/host/xhci-debugfs.c b/drivers/usb/host/xhci-debugfs.c
index 4c345d18c33b..7dc4cf8a19a8 100644
--- a/drivers/usb/host/xhci-debugfs.c
+++ b/drivers/usb/host/xhci-debugfs.c
@@ -407,8 +407,9 @@ static int xhci_portli_show(struct seq_file *s, void *unused)
 			   FIELD_GET(PORT_RLC_MASK, portli),
 			   FIELD_GET(PORT_TLC_MASK, portli));
 	else if (xhci->hcc_params2 & HCC2_E2V2C)
-		seq_printf(s, "0x%08x RDR=%u TDR=%u\n", portli,
-			   PORTLI_RDR(portli), PORTLI_TDR(portli));
+		seq_printf(s, "0x%08x RDR=%lu TDR=%lu\n", portli,
+			   FIELD_GET(PORT_RDR_MASK, portli),
+			   FIELD_GET(PORT_TDR_MASK, portli));
 	else
 		seq_printf(s, "0x%08x RsvdP\n", portli);
 
diff --git a/drivers/usb/host/xhci-port.h b/drivers/usb/host/xhci-port.h
index 191cae8fff1e..c87a73f03540 100644
--- a/drivers/usb/host/xhci-port.h
+++ b/drivers/usb/host/xhci-port.h
@@ -161,9 +161,12 @@
 #define PORT_TLC_MASK		GENMASK(23, 20)
 /* bits 31:24 - RsvdP */
 
-/* eUSB2v2 protocol PORTLI Port Link information, RsvdP for normal USB2 */
-#define PORTLI_RDR(p)		((p) & 0xf)
-#define PORTLI_TDR(p)		(((p) >> 4) & 0xf)
+/* USB2 Port Link Info Register (PORTLI) 5.4.10.2 */
+/* bits 3:0 - Rx Data Rate, if E2V2C=1 else RsvdP */
+#define PORT_RDR_MASK		GENMASK(3, 0)
+/* bits 7:4 - Tx Data Rate, if E2V2C=1 else RsvdP */
+#define PORT_TDR_MASK		GENMASK(7, 4)
+/* bits 31:8 - RsvdP */
 
 /* USB2 Protocol PORTHLPMC */
 #define PORT_HIRDM(p)((p) & 3)
-- 
2.50.1


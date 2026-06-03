Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F380395DB9
	for <linux-usb@vger.kernel.org>; Wed,  3 Jun 2026 09:11:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780477919; cv=none; b=o6Fpn8631HtJ++hoplTuc/qZ9EVrsFah8/ZTQQA49/aAIQKH6ryx/yUMkMSLsPqg8qQzp0uTY1XEaFhjBwchHNqYGwDFORosPzJTyxtysj2QFd8R19IAqMpnh7zK1A1OqLrPF/SgPazvsDNQNVWnUaD97ywne1eGCKXaP/5JWBY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780477919; c=relaxed/simple;
	bh=7Ky9OVsBTgDVkef2kxK6YwT7wpkol/aSrVVMKwKEV/w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Rbr9hGgcDIdRixM/3O/Uf3nbXBM6BakBp43khrBDdeHsIhpLJz5TtWVoBzbGzkHCSoSnsbXQkoFMavNHc75OytTyAEK5pNOx7hwekYjwhmj6Rgc9QRPgpJpJz8c/t+Q+3zBdNdFbYZR0O0vqwlJYmlwMtQVFGALz6HEQpchUlz4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nf1OxRH9; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nf1OxRH9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780477918; x=1812013918;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=7Ky9OVsBTgDVkef2kxK6YwT7wpkol/aSrVVMKwKEV/w=;
  b=nf1OxRH9n4QUy2ETARgBSAR2pdvnXp3dzNPKf0d4XIPXzfS34p5R0ESy
   V9XatnZiWZmfsG0ctk5BGFtDMJaXbIa36G8cY/9mHI3kmTL45aSw/eEUH
   eG2RVUU9whk6py8R1phoKEGkTYomWMVJgbzlGwoWPpqxetRCvhhvzs0Z+
   G+lk7nBcFULpHGrjoQRh9J+1ymtWh1ZvsBDbxBIVnenQ2qcGNdcxC4v6R
   fBVFFeLjEthXnk+h1lq89V7S7Miyl3anqQq2qlMBX5X9G1OpnKalcyL3D
   u2iSVC8V9yhT7Ls8wIdg/vRVMVMYvg8plbTfWjsQYDdcbjf5fvKeg9hfR
   w==;
X-CSE-ConnectionGUID: 6X3g57TVQ8CXTGewgyFKWQ==
X-CSE-MsgGUID: qwNYFw/kQy68fbCNP81K/Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11805"; a="92657549"
X-IronPort-AV: E=Sophos;i="6.24,184,1774335600"; 
   d="scan'208";a="92657549"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jun 2026 02:11:58 -0700
X-CSE-ConnectionGUID: F16I825bSlq3wliKg0CWiA==
X-CSE-MsgGUID: SepxYpOBT462VNQKEvf85Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,184,1774335600"; 
   d="scan'208";a="244281854"
Received: from slindbla-desk.ger.corp.intel.com (HELO mnyman-desk.intel.com) ([10.245.244.174])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jun 2026 02:11:57 -0700
From: Mathias Nyman <mathias.nyman@linux.intel.com>
To: <gregkh@linuxfoundation.org>
Cc: <linux-usb@vger.kernel.org>,
	Michal Pecio <michal.pecio@gmail.com>,
	Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH 05/15] usb: xhci: Remove isochronous URB_SHORT_NOT_OK handling
Date: Wed,  3 Jun 2026 12:11:22 +0300
Message-ID: <20260603091132.1110849-6-mathias.nyman@linux.intel.com>
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

This URB flag was never supposed to have any effect on isoc endpoints.

No kernel code uses the flag except usb_sg_init(), on non-isoc only.
USBFS can't use it on isoc because proc_do_submiturb() rejects it.

Signed-off-by: Michal Pecio <michal.pecio@gmail.com>
Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
---
 drivers/usb/host/xhci-ring.c | 12 +++---------
 1 file changed, 3 insertions(+), 9 deletions(-)

diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
index 1fbf43a51037..a5342d49a65b 100644
--- a/drivers/usb/host/xhci-ring.c
+++ b/drivers/usb/host/xhci-ring.c
@@ -2395,7 +2395,6 @@ static void process_isoc_td(struct xhci_hcd *xhci, struct xhci_virt_ep *ep,
 	u32 trb_comp_code;
 	bool sum_trbs_for_length = false;
 	u32 remaining, requested, ep_trb_len;
-	int short_framestatus;
 
 	trb_comp_code = GET_COMP_CODE(le32_to_cpu(event->transfer_len));
 	urb_priv = td->urb->hcpriv;
@@ -2404,8 +2403,6 @@ static void process_isoc_td(struct xhci_hcd *xhci, struct xhci_virt_ep *ep,
 	requested = frame->length;
 	remaining = EVENT_TRB_LEN(le32_to_cpu(event->transfer_len));
 	ep_trb_len = TRB_LEN(le32_to_cpu(ep_trb->generic.field[2]));
-	short_framestatus = td->urb->transfer_flags & URB_SHORT_NOT_OK ?
-		-EREMOTEIO : 0;
 
 	/* handle completion code */
 	switch (trb_comp_code) {
@@ -2413,15 +2410,12 @@ static void process_isoc_td(struct xhci_hcd *xhci, struct xhci_virt_ep *ep,
 		/* Don't overwrite status if TD had an error, see xHCI 4.9.1 */
 		if (td->error_mid_td)
 			break;
-		if (remaining) {
-			frame->status = short_framestatus;
+		if (remaining)
 			sum_trbs_for_length = true;
-			break;
-		}
 		frame->status = 0;
 		break;
 	case COMP_SHORT_PACKET:
-		frame->status = short_framestatus;
+		frame->status = 0;
 		sum_trbs_for_length = true;
 		break;
 	case COMP_BANDWIDTH_OVERRUN_ERROR:
@@ -2456,7 +2450,7 @@ static void process_isoc_td(struct xhci_hcd *xhci, struct xhci_virt_ep *ep,
 		break;
 	case COMP_STOPPED_SHORT_PACKET:
 		/* field normally containing residue now contains transferred */
-		frame->status = short_framestatus;
+		frame->status = 0;
 		requested = remaining;
 		break;
 	case COMP_STOPPED_LENGTH_INVALID:
-- 
2.43.0


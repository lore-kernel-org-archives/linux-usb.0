Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 341D137BE9C
	for <linux-usb@vger.kernel.org>; Wed,  3 Jun 2026 09:11:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780477918; cv=none; b=FXXHBZIYiNpQHfUfJE0CHeY8eNHN9IF0uec6pM6aYGtDa5xupbwLGDvqgxOsyizDoCkMciGC9aogfTvbr6ucgMyKnogOGuFshrnB8e9zpnknsjSAORkyeHwXt37MZ5B8+OFdUx00DfPO4XIA7eUkf5qi3RgNewrsxg5c3J7hULA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780477918; c=relaxed/simple;
	bh=pXhwQziFQhaFo8j1iNrLi1mQL98P99zifhqjYoHxxQU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=R9oezZ3OWLDvbNjmCY7Xf9fuZWOyVfLWbTs1S712tG64E8IyEChy0dSrJ4BirTrA9cN59AVpaVAnawfdoBkTv2hOIdn0TGJfEeL3PTWzNVw+8AVwiMADTB/2G25zsoo+Qy5Y5yoib7BYT6X/XvOj5JTFE7xWn8VyAwmfATvXDM4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bAHB4+Kw; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bAHB4+Kw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780477917; x=1812013917;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=pXhwQziFQhaFo8j1iNrLi1mQL98P99zifhqjYoHxxQU=;
  b=bAHB4+KwuBBbxpix0qeJuZdxOltNi42ddsn4r/5UQD59cfz+8I/TxrpM
   6YKFtv6cBqWsXpEtuKRmgJgnv/kDHwC5M2t35hBeXpMDZxxaRzGEtOKEk
   tMYBVF3urqxLjoniJIxEvEd/66TN+n/63MpqqZvgeFZCnnVeC7f+bcmOm
   mTZ7s6r+dnwIvsFOh9BqiYROIfIDwxLHsRfUp+Z5Zi0oxNtHK/axFq29j
   wjGNts+W3oprtw+f/dDReYg65FTXl3g281Bpx7Tg616RkRaKG3+59MU5v
   YTxZgiYQMw4sX9vd5g90Pn1TF+Raavw1GoHEjNoqftZUpw2F1ZqwFGOx/
   w==;
X-CSE-ConnectionGUID: uuj9+lguSNeQWdylrMwgpg==
X-CSE-MsgGUID: oQIvBqhLQBGSWdg1/7/TIg==
X-IronPort-AV: E=McAfee;i="6800,10657,11805"; a="92657538"
X-IronPort-AV: E=Sophos;i="6.24,184,1774335600"; 
   d="scan'208";a="92657538"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jun 2026 02:11:56 -0700
X-CSE-ConnectionGUID: baGHbZ/ARWunobJLVjarXw==
X-CSE-MsgGUID: wLlfbGC8S1CsI1Gjw0LZgg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,184,1774335600"; 
   d="scan'208";a="244281830"
Received: from slindbla-desk.ger.corp.intel.com (HELO mnyman-desk.intel.com) ([10.245.244.174])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jun 2026 02:11:55 -0700
From: Mathias Nyman <mathias.nyman@linux.intel.com>
To: <gregkh@linuxfoundation.org>
Cc: <linux-usb@vger.kernel.org>,
	Michal Pecio <michal.pecio@gmail.com>,
	Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH 04/15] usb: xhci: Remove skip_isoc_td()
Date: Wed,  3 Jun 2026 12:11:21 +0300
Message-ID: <20260603091132.1110849-5-mathias.nyman@linux.intel.com>
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

This function is pointless because usb_submit_urb() initializes all
isoc frame descriptors to -EXDEV and 0 length so that HCDs don't need
to do anything with transfers which were never executed.

Other HCDs rely on this (e.g. EHCI itd_complete()), so we can too.
This gets rid of a potentially dangereous function which could corrupt
memory if we weren't super careful to only call it on isoc URBs.

Also, set status to 0 rather than any random status determined by the
later TD which caused skipping. This status will be ignored anyway.

Signed-off-by: Michal Pecio <michal.pecio@gmail.com>
Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
---
 drivers/usb/host/xhci-ring.c | 26 +++++---------------------
 1 file changed, 5 insertions(+), 21 deletions(-)

diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
index f62db238276d..1fbf43a51037 100644
--- a/drivers/usb/host/xhci-ring.c
+++ b/drivers/usb/host/xhci-ring.c
@@ -2492,26 +2492,6 @@ static void process_isoc_td(struct xhci_hcd *xhci, struct xhci_virt_ep *ep,
 	finish_td(xhci, ep, ep_ring, td, trb_comp_code);
 }
 
-static void skip_isoc_td(struct xhci_hcd *xhci, struct xhci_td *td,
-			 struct xhci_virt_ep *ep, int status)
-{
-	struct urb_priv *urb_priv;
-	struct usb_iso_packet_descriptor *frame;
-	int idx;
-
-	urb_priv = td->urb->hcpriv;
-	idx = urb_priv->num_tds_done;
-	frame = &td->urb->iso_frame_desc[idx];
-
-	/* The transfer is partly done. */
-	frame->status = -EXDEV;
-
-	/* calc actual length */
-	frame->actual_length = 0;
-
-	xhci_dequeue_td(xhci, td, ep->ring, status);
-}
-
 /*
  * Process bulk and interrupt tds, update urb status and actual_length.
  */
@@ -2854,7 +2834,11 @@ static int handle_tx_event(struct xhci_hcd *xhci,
 				if (trb_comp_code == COMP_STOPPED_LENGTH_INVALID)
 					return 0;
 
-				skip_isoc_td(xhci, td, ep, status);
+				/*
+				 * TD was missed, skip it. Core already initialized frame->status
+				 * to -EXDEV and frame->actual_length to 0, nothing more to do.
+				 */
+				xhci_dequeue_td(xhci, td, ep_ring, 0);
 
 				if (!list_empty(&ep_ring->td_list)) {
 					if (ring_xrun_event) {
-- 
2.43.0


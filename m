Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E51FD4DEC0E
	for <linux-usb@vger.kernel.org>; Fri,  9 Oct 2026 15:16:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791559006; cv=none; b=ptJWu9lFl+yjvF+XCKzpRv9Ct+IIizmus1KFjhqKXv4gZZD+c0+0M6PWN6LoDPSkFT2WLvmfmeaBvpqw4r3i41s4FweXE3i8x60IFjGRrlZLFIntHACYHzWzShZktjG5SXunDimp2rW42uULA8gEqQCpblAvFEnTlqLwd1BjRSo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791559006; c=relaxed/simple;
	bh=DMttMpReNpUs0PpveUEFA9fiU6+9px/ljnKovIdzeeA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=q8zyBIgY32O4mCl0+IhiAQMFmywm2xkIzwFy+F1TVVhcbJP8L13qK7rGHPcFFuMgWqxaRVVMPrPl3YJaZPsMYWerCCDcUwlxy9g3O0E92meavfsrluqWuLRD2ohUadkJ5qFDnCpv0BvTGJhK+yicN9/tWXKCwkelpX5v0Bifis4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FyeeXevb; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FyeeXevb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791559005; x=1823095005;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=DMttMpReNpUs0PpveUEFA9fiU6+9px/ljnKovIdzeeA=;
  b=FyeeXevbSGCx24m2XCU3ZOAcaErC9rJL2xhBESfClkfJW3JApcRvSbk9
   JipEmPTsFnoGjDLcV2yw1xiRUAZqqG30HLpmP+QngIIbr0Y9GvsRzM1xz
   A8+5PFTXCJGLEcfPbnXld4yDE6OHTrcQ86KbjyLfz4vZHMUDl+twLHPdc
   05XYTOmM/Q5HK/A84BARfWe75PjJuKS5JWXs3meMxNRzAMrdlEct1brRM
   wEVsqON4wy8FZup2fxgBY2FXUBOo1DJaitmgRZrkDaH/0UyDVxmb5BoK8
   ydTICNo889m85dF3093rWTNimAj6SYizKYyFu0JCsPmh6afRdinK9fp+u
   Q==;
X-CSE-ConnectionGUID: DUKs6eEFSe+TfWbLlVbnVQ==
X-CSE-MsgGUID: HntCqphcQW2OdK6i4gLkvQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11930"; a="351690"
X-IronPort-AV: E=Sophos;i="6.27,148,1787036400"; 
   d="scan'208";a="351690"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2026 08:16:44 -0700
X-CSE-ConnectionGUID: nlEZ/g7aQh+J5IVg3Vbh4w==
X-CSE-MsgGUID: OoF/d7MGQzO3rIWOH05WsA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,148,1787036400"; 
   d="scan'208";a="650063"
Received: from ettammin-mobl2.ger.corp.intel.com (HELO mnyman-desk.intel.com) ([10.245.244.17])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2026 08:16:43 -0700
From: Mathias Nyman <mathias.nyman@linux.intel.com>
To: <gregkh@linuxfoundation.org>
Cc: <linux-usb@vger.kernel.org>,
	Michal Pecio <michal.pecio@gmail.com>,
	Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH v2 07/11] usb: xhci: Don't set the skip flag on non-isoc endpoints
Date: Fri,  9 Oct 2026 18:16:20 +0300
Message-ID: <20261009151624.618967-8-mathias.nyman@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261009151624.618967-1-mathias.nyman@linux.intel.com>
References: <20261009151624.618967-1-mathias.nyman@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Michal Pecio <michal.pecio@gmail.com>

These events are unique to isochronous endpoints, ignore them otherwise.
Update debug messages to reflect new policies. We could also log invalid
events as errors, but it seems nobody has ever had problems with that,
so don't bother.

This allows dropping the isoc check when skipping TDs.

Signed-off-by: Michal Pecio <michal.pecio@gmail.com>
Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
---
 drivers/usb/host/xhci-ring.c | 16 +++++++++-------
 1 file changed, 9 insertions(+), 7 deletions(-)

diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
index 8b915a1d5b25..2dd11732bb87 100644
--- a/drivers/usb/host/xhci-ring.c
+++ b/drivers/usb/host/xhci-ring.c
@@ -2778,16 +2778,18 @@ static int handle_tx_event(struct xhci_hcd *xhci,
 		 * Set skip flag of the ep_ring; Complete the missed tds as
 		 * short transfer when process the ep_ring next time.
 		 */
-		ep->skip = true;
+		if (ep_ring->type == TYPE_ISOC)
+			ep->skip = true;
 		xhci_dbg(xhci,
-			 "Miss service interval error for slot %u ep %u, set skip flag%s\n",
-			 slot_id, ep_index, ep_trb_dma ? ", skip now" : "");
+			 "Missed Service Error for slot %u ep %u, skip %d, try now %d\n",
+			 slot_id, ep_index, ep->skip, !!ep_trb_dma);
 		break;
 	case COMP_NO_PING_RESPONSE_ERROR:
-		ep->skip = true;
+		if (ep_ring->type == TYPE_ISOC)
+			ep->skip = true;
 		xhci_dbg(xhci,
-			 "No Ping response error for slot %u ep %u, Skip one Isoc TD\n",
-			 slot_id, ep_index);
+			 "No Ping response error for slot %u ep %u, skip %d\n",
+			 slot_id, ep_index, ep->skip);
 		return 0;
 
 	case COMP_INCOMPATIBLE_DEVICE_ERROR:
@@ -2863,7 +2865,7 @@ static int handle_tx_event(struct xhci_hcd *xhci,
 		/* Is this TRB not part of the currently executing TD? */
 		if (!trb_in_td(td, ep_trb_dma)) {
 
-			if (ep->skip && usb_endpoint_xfer_isoc(&td->urb->ep->desc)) {
+			if (ep->skip) {
 				/* this event is unlikely to match any TD, don't skip them all */
 				if (trb_comp_code == COMP_STOPPED_LENGTH_INVALID)
 					return 0;
-- 
2.43.0


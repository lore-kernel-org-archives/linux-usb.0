Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 611B54A6CEF
	for <linux-usb@vger.kernel.org>; Fri,  9 Oct 2026 09:59:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791539949; cv=none; b=tj7P8stwl6nnSLkh2BG+svMehddMS8ssE8DZoTUfBqOPbeatOWm1cUU8b9arTwW4LGbVE2iADmQ8TvZNfrK+LBvEvpz060jeWcJGiYnaVK7NlC4HrAUIaN5G6qzPB4JfVSWMcv8ni3U7EQOYrBHnmkq/NZawEuOyvY/x/wejvoY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791539949; c=relaxed/simple;
	bh=za9kiPePpQ2ylV9Y8iXUbbLuXBRWituP31fK5a/ytjg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VLADP1Y7yMwRuX4jNaBrWcEt9l2HlbJTb8l+DuqfSQ777FYKbwSRkUACE8O5Jq4im6RNd3ZtyAlf+Ow4CvQq+v0F2l84VtUOyXyy8MdFsneOcfGEH447W+UwDTiJI/09YsewcmeTMq5e7IpGVHXxySB3D/hHSz3x3/DusdOJB6M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=co0TrPDH; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="co0TrPDH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791539948; x=1823075948;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=za9kiPePpQ2ylV9Y8iXUbbLuXBRWituP31fK5a/ytjg=;
  b=co0TrPDHwQrmcg1xVIXFY6zf+f5tnpkDmHtr6KuUnda+olFDj8CiKvKc
   3iQb+5hOI7v0JXcsAPGxs+pvLbOq4vnTq+aksBUeKwryarZZHz+SefZk8
   pDYAOFw/kJvqKi4OYebCYgzzJ/ubFb8+YvKqw0YrnvjSMtL4W+AAH/yjT
   vxaWToz02TeI2Na6oRvWbwJkGvWrmf6dWTkBfdu/81mMX3vDnKK5F8Rms
   LUGpf7118toy3nm3u+ktqGPPJO0nzwKUNzkNfYlzK1PG+CE3vdwNoG8Tp
   n3ZT2gmoe1wHbEJREyvG0nHVgSvlkyvqB+qsC4YpJFUb10YE2xYd1LvKZ
   g==;
X-CSE-ConnectionGUID: P9TMq1L7Smi16C+ugSYLeA==
X-CSE-MsgGUID: yDmpFzdoRCmHpbvMSFadxQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11929"; a="224128"
X-IronPort-AV: E=Sophos;i="6.27,148,1787036400"; 
   d="scan'208";a="224128"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2026 02:59:08 -0700
X-CSE-ConnectionGUID: f2TKiHNkQGGfsZPwzVhNiQ==
X-CSE-MsgGUID: qVV5X87DSh+UvgU1fH24Dw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,148,1787036400"; 
   d="scan'208";a="613435"
Received: from ettammin-mobl2.ger.corp.intel.com (HELO mnyman-desk.intel.com) ([10.245.244.17])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2026 02:59:06 -0700
From: Mathias Nyman <mathias.nyman@linux.intel.com>
To: <gregkh@linuxfoundation.org>
Cc: <linux-usb@vger.kernel.org>,
	Michal Pecio <michal.pecio@gmail.com>,
	Mathias Nyman <mathias.nyman@intel.com>
Subject: [PATCH 10/14] usb: xhci: Don't set the skip flag on non-isoc endpoints
Date: Fri,  9 Oct 2026 12:58:30 +0300
Message-ID: <20261009095834.561578-11-mathias.nyman@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261009095834.561578-1-mathias.nyman@linux.intel.com>
References: <20261009095834.561578-1-mathias.nyman@linux.intel.com>
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
Signed-off-by: Mathias Nyman <mathias.nyman@intel.com>
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


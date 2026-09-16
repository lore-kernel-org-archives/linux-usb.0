Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 428E75111B2
	for <linux-usb@vger.kernel.org>; Wed, 16 Sep 2026 14:16:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789568177; cv=none; b=obJkU8zHvf4LNVf0y8VGtVgVejSghVk9MSJoSS0b8+7Pr0WO+McsD99U42jvyjAx7EHb4GbqxeRdwvx9zKxxeJkHfP0AcfZNKKJdaxrjmBVoE79YjRYU9f/1Esc8XdfxzF8yCGUPuUw6Th9FRgas4iattexo/uJMwsxWsB+v0Ek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789568177; c=relaxed/simple;
	bh=4xqVcQWmLETFwCkiogy1TiO6brJkhKqiehPlxNh9wAg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tTBX7t/E9iPUcfMyL+YNG0pHwr8Qx3Tpi7DfvveCVD4BJMB7M0QDzmSZKLDfwT+jQPX1r7ZmiGX3U8QrBiNDmtukiqqMZEQTfgP+a4GJfEPmweRc8aWGyHoos95lDSmMeBMfnKcT/QveEQc22JW8AgsqDOJwLCnTUwfHaUqSAxU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SP/tlodV; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SP/tlodV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789568176; x=1821104176;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=4xqVcQWmLETFwCkiogy1TiO6brJkhKqiehPlxNh9wAg=;
  b=SP/tlodVbj6e1qKcLZYUpG28mS1VXRokAMr43CI4ZY3wTS9cS6F6rX72
   GhuZ5+HynbdTE0TZxnfXpvixqbpaOvdpFKWlrFKSvMcpr23Uc1iTOLsJk
   HrSrtzFa+6z2pAYSKST9nlgYYxBwJaJRex7U+q7HnkhC8yfruaZDIzqbL
   HQdS9vcfBSZ2irYPwNyaGzEmuv7qLbMRDwITamuEYeXpNUlu3m1XUE6SY
   XNHvzejrbonoEDORBcTFRuGwJGDo7eJu25XrABPIyUo21jesv23eUYbHi
   roZvHjWHQ/zA8Hg1nGM8bjwu1IjMD6ZYTKiiKZU4h2ExNQ1mAFZhmWBGi
   A==;
X-CSE-ConnectionGUID: XtI0haWGS9G7LrNxtbDg4w==
X-CSE-MsgGUID: TYY18gW/QymNLk/DfvRCRQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="89967324"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="89967324"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2026 07:16:16 -0700
X-CSE-ConnectionGUID: KIbNqlmSQ2iAEINVoJEyHA==
X-CSE-MsgGUID: Kw4T5PHNR6WNEg52Sj0slw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="270720227"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa008.fm.intel.com with ESMTP; 16 Sep 2026 07:16:15 -0700
Received: by black.igk.intel.com (Postfix, from userid 1058)
	id 5E07A9B; Wed, 16 Sep 2026 16:16:14 +0200 (CEST)
From: Niklas Neronin <niklas.neronin@linux.intel.com>
To: mathias.nyman@linux.intel.com
Cc: linux-usb@vger.kernel.org,
	Niklas Neronin <niklas.neronin@linux.intel.com>
Subject: [PATCH v2 20/20] usb: xhci: use neutral helper when resuming ports
Date: Wed, 16 Sep 2026 16:14:09 +0200
Message-ID: <20260916141409.629621-21-niklas.neronin@linux.intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260916141409.629621-1-niklas.neronin@linux.intel.com>
References: <20260916141409.629621-1-niklas.neronin@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

xhci_bus_resume() sanitizes PORTSC before writing it back. Previously,
this was done by manually clearing RW1CS and Wake bits and then setting
Warm Port Reset (WPR).

Replace this with xhci_port_state_to_neutral(), which already clears
all bits with write side effects (e.g. RW1CS, RW1S, and reserved-zero
fields) and produces a safe value for writeback. Afterwards, explicitly
clear the Wake bits as required.

This also ensures that additional bits, such as reserved-zero bits
(e.g. 2, 28, 29) and RW1S bits (e.g. bit 4), are consistently cleared,
avoiding unintended effects when writing back PORTSC.

xhci_port_state_to_neutral() preserves Port Link State (PLS), allowing
the subsequent resume logic to operate on the current link state.

Signed-off-by: Niklas Neronin <niklas.neronin@linux.intel.com>
---
 drivers/usb/host/xhci-hub.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/drivers/usb/host/xhci-hub.c b/drivers/usb/host/xhci-hub.c
index e5f542ae3106..446c66030f8f 100644
--- a/drivers/usb/host/xhci-hub.c
+++ b/drivers/usb/host/xhci-hub.c
@@ -1838,8 +1838,6 @@ int xhci_bus_resume(struct usb_hcd *hcd)
 	}
 	port_index = max_ports;
 	while (port_index--) {
-		portsc = xhci_portsc_readl(ports[port_index]);
-
 		/* warm reset CAS limited ports stuck in polling/compliance */
 		if ((xhci->quirks & XHCI_MISSING_CAS) &&
 		    (hcd->speed >= HCD_USB3) &&
@@ -1849,11 +1847,17 @@ int xhci_bus_resume(struct usb_hcd *hcd)
 			clear_bit(port_index, &bus_state->bus_suspended);
 			continue;
 		}
+
+		portsc = xhci_portsc_readl(ports[port_index]);
+		portsc = xhci_port_state_to_neutral(portsc);
+
+		/* Disable wake for all ports */
+		portsc &= ~PORT_WAKE_BITS;
+
 		/* resume if we suspended the link, and it is still suspended */
 		if (test_bit(port_index, &bus_state->bus_suspended))
 			switch (FIELD_GET(PORT_PLS_MASK, portsc)) {
 			case PLS_U3:
-				portsc = xhci_port_state_to_neutral(portsc);
 				FIELD_MODIFY(PORT_PLS_MASK, &portsc, next_state);
 				portsc |= PORT_LWS;
 				break;
@@ -1866,8 +1870,6 @@ int xhci_bus_resume(struct usb_hcd *hcd)
 					  &bus_state->bus_suspended);
 				break;
 			}
-		/* disable wake for all ports, write new link state if needed */
-		portsc &= ~(PORTSC_RW1CS_BITS | PORT_WAKE_BITS);
 		xhci_portsc_writel(ports[port_index], portsc);
 	}
 
-- 
2.50.1


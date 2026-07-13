Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 210963E7BCC
	for <linux-usb@vger.kernel.org>; Mon, 13 Jul 2026 10:49:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783939746; cv=none; b=EBMvXy2uayhtEvPiXrdzI3YtBPcLo6bP30F/MXUutE4BQru7sR3Mj1GxX/hrqnpIumo2U14tVBydgCpFC09N1JY9k5A/+QYRnnGsWgHe+kRSj4I8/aOB1d8+SttGLZoAadk2oKLQoMJlr6zGzlR0x8YYHXZbiglbCOr7/EiAQ4Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783939746; c=relaxed/simple;
	bh=taZjHjXm72SN2keudqXll9ouCkGpD4p4mAIXtbJxcmI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IcY0A+Z3SVQI1cGxR4Y0jckDnmilU2F5ul4HIDcKMjzpx6EDElTJf6d23aGHgbIyhP/iPpua9G9Pzz1yogX9J+Ip6VBBwCJe8Q585Q6A1Ne2prKYeLphit9shcmde5/asyaHNr+QIGuWySKWC/cBGlLcRLiO2jyZVAYkueW4fSM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EjyD7ZpO; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EjyD7ZpO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783939742; x=1815475742;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=taZjHjXm72SN2keudqXll9ouCkGpD4p4mAIXtbJxcmI=;
  b=EjyD7ZpOPOgMzcLEZbQ/AzQGRR0slluUDLMiDWrhA31vAxVCZruvEHaK
   ZSpbPm4DljniJzeEtRfhmBp1SxeaiyvfzC0qYeF2cMNG8gRp/3nhmYDHM
   TAp8jmz2Pl5QQD8QZzF/1sIIWIE87g24cAqf9U4/euxJESh0Uodj/OsTq
   8f0OxmPSIhzYaEqMEfsHls34LG047Wy8XJNOeTnL9G22FzzaAnLkxh0RK
   EraLmBLeCKIrt5vlWUFojAM2fjw/XeligZzUq/hjquMzBBqy7zjhNqmUv
   53gdpDUIh6bwhStTAFAhyH512rIUnOFToFGJOlkNVer/vgeb11H7mTkdk
   A==;
X-CSE-ConnectionGUID: pBqTNE7TRMWOqvVyi59ffw==
X-CSE-MsgGUID: h/KMXXmdQHGVioQLkYlrGg==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="96057044"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="96057044"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jul 2026 03:48:51 -0700
X-CSE-ConnectionGUID: APbUqxULT4q8/4hhb1fH8A==
X-CSE-MsgGUID: agIFQxSDRXmqIhWRj/jTgw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="279928988"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa001.fm.intel.com with ESMTP; 13 Jul 2026 03:48:49 -0700
Received: by black.igk.intel.com (Postfix, from userid 1058)
	id 69F7B98; Mon, 13 Jul 2026 12:48:49 +0200 (CEST)
From: Niklas Neronin <niklas.neronin@linux.intel.com>
To: mathias.nyman@linux.intel.com
Cc: linux-usb@vger.kernel.org,
	Niklas Neronin <niklas.neronin@linux.intel.com>
Subject: [PATCH 19/22] usb: xhci: use neutral helper when resuming ports
Date: Mon, 13 Jul 2026 12:47:33 +0200
Message-ID: <20260713104738.629612-20-niklas.neronin@linux.intel.com>
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

Port Link State (PLS) remains preserved by the helper, allowing the
subsequent resume logic to operate on the current link state.

Signed-off-by: Niklas Neronin <niklas.neronin@linux.intel.com>
---
 drivers/usb/host/xhci-hub.c | 16 ++++++++++------
 1 file changed, 10 insertions(+), 6 deletions(-)

diff --git a/drivers/usb/host/xhci-hub.c b/drivers/usb/host/xhci-hub.c
index 17347bca0682..06192ae95526 100644
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
-		if (test_bit(port_index, &bus_state->bus_suspended))
+		if (test_bit(port_index, &bus_state->bus_suspended)) {
 			switch (FIELD_GET(PORT_PLS_MASK, portsc)) {
 			case PLS_U3:
-				portsc = xhci_port_state_to_neutral(portsc);
 				FIELD_MODIFY(PORT_PLS_MASK, &portsc, next_state);
 				portsc |= PORT_LWS;
 				break;
@@ -1866,8 +1870,8 @@ int xhci_bus_resume(struct usb_hcd *hcd)
 					  &bus_state->bus_suspended);
 				break;
 			}
-		/* disable wake for all ports, write new link state if needed */
-		portsc &= ~(PORTSC_RW1CS_BITS | PORT_WAKE_BITS);
+		}
+
 		xhci_portsc_writel(ports[port_index], portsc);
 	}
 
-- 
2.50.1


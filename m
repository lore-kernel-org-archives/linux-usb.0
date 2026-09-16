Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D22E50EBF0
	for <linux-usb@vger.kernel.org>; Wed, 16 Sep 2026 14:16:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789568176; cv=none; b=EATueMRdVik/yG8IDE7IQ6t7hbtgYqz48XiNUGIxUhp6Oa12fBo835bb/tmDV1vT7wOJAlLT80BXJ06DOIHOTVvWxps3ehStFRV2A8wXzQH+cID/nkvajSQt3uSugh2YIjjMC9uu2v3kPoA1eACNVYUGrZtWFVobfOYp4VOW0Ow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789568176; c=relaxed/simple;
	bh=os2OGl3XtBMli5luCJKQCVeCRbX8hwxpFmV/sDudY04=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JGEt7O+W10zBszbu8xUMmt147+MoNHDRiG4v58/pCO95+vjK2WO1F9JMDoSV8t2CV0/8YLAU5yubsC4REJECYNd4k3Ggq7/biK3Eg3HGlpyttLsJvPE1Po7VTZXAJgW6FpjjrR3rQdDyPSBW2tyBdGbhb5SZpn0zz0Vtvi06sPQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jmUn8N2k; arc=none smtp.client-ip=192.198.163.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jmUn8N2k"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789568175; x=1821104175;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=os2OGl3XtBMli5luCJKQCVeCRbX8hwxpFmV/sDudY04=;
  b=jmUn8N2kW1Yu+5c04qHofeo4TFi+xAm2dQULWWpPSQA2zM5DDLE/BCd6
   8G8fKhFmxxn2JNUuVuH2QXs2QDmxhZKvjc+owRw/DysEVM8wqXlkyJlOL
   kS6GFx+m7GHGoXvXYUIgL/1g0yi90dMc6/DDdePpfkPOOA1jdkr0pTzvJ
   eC0VAcfGuE9g79A16UnZePufi3ywkvA9WLLX/kuwGZXuU2bM6tl2KnOZu
   LCouer6OHrMK1v36KTmWR8gMVoH/vTMhmBkOf7oW6NNB7YXoltc4uK5O8
   fqwFplRovODT/EAuVB0NbKVzaROsP+7ovmx7wUbeF0PBlc7JHX/HcHanv
   Q==;
X-CSE-ConnectionGUID: YhLj9JMbQNGXIJRvr1aiXA==
X-CSE-MsgGUID: EAOBuP8AQrG4zIfrOd0DdQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="453806"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="453806"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa115.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2026 07:16:15 -0700
X-CSE-ConnectionGUID: BC49aAirTOyBvCnZ+dSQlg==
X-CSE-MsgGUID: nAXdsU3KSjOjTT0OHiwgKw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="273889537"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa009.jf.intel.com with ESMTP; 16 Sep 2026 07:16:15 -0700
Received: by black.igk.intel.com (Postfix, from userid 1058)
	id 86BD199; Wed, 16 Sep 2026 16:16:13 +0200 (CEST)
From: Niklas Neronin <niklas.neronin@linux.intel.com>
To: mathias.nyman@linux.intel.com
Cc: linux-usb@vger.kernel.org,
	Niklas Neronin <niklas.neronin@linux.intel.com>
Subject: [PATCH v2 19/20] usb: xhci: improve xhci_port_missing_cas_quirk()
Date: Wed, 16 Sep 2026 16:14:08 +0200
Message-ID: <20260916141409.629621-20-niklas.neronin@linux.intel.com>
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
index e0d4ee605f82..e5f542ae3106 100644
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


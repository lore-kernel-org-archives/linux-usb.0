Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F159749CF38
	for <linux-usb@vger.kernel.org>; Tue,  6 Oct 2026 15:24:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791300289; cv=none; b=Fr4XTtsjq8yJ/AChWS3ZgcgaXlu475NgHj71eGfhMbXCLXwHKZPLKnYOJJeRQzQ0Qvqlz07rqWuJkcyQNbC2KmMliso4WYVQBoYZCV84wM0EYu7xNdAA/OKhHHLpn3YzJjf6XU+b+jRMA5/89uX70EKesRs7ZFeaOIXchR7GwdI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791300289; c=relaxed/simple;
	bh=a7VV7vjkg0Z/hhf7SDMjB4Js6+V79qqupIdQxE4Zby4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LRb5JfqA1rHuYseyn3wlOsc956Wb/i+P1q80zwT2DX3xj9aE2ZiCmhQBr9ifEfYq1vTblw0RyrE88GV0uGmtkl5Tj983Swucgx0T4K7zHaSD56ONog211DNOKKcdAnrgWvvxqEhZG9L+yAtvbk2DGGLeJbTMCFb8MS7hMmkLKyI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZoLAPVy+; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZoLAPVy+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791300288; x=1822836288;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=a7VV7vjkg0Z/hhf7SDMjB4Js6+V79qqupIdQxE4Zby4=;
  b=ZoLAPVy+hwBROizmbICH+eYqJ3zzJXoIdPLFAmzI48SIp9psreWyLg+1
   HoS4VqcTsy0bQrqMHfOJdgHgp6CLFvNoA8+jqr0CXHSWT/FnlRQxoXx8E
   tf/xtyBX0HvuoTdD0ibip/xrpgr8DkIxlmh6UbAo5iidnR0bU/A+tX+jZ
   tpq15FFuex5EOozBR8PyuCu3xVHanGov48Bn65B2Rsgr/D2pQ0wo3TZxY
   6woNI4aunwYT4iKCeYQIT4vO+AMtrbLixMElJHAHnrmzxp4GLyu4jB+Yw
   3s+DCCYmDIOFXRjrGe3/Xu/HEulJ4bnzu410+8PWWNblhOsLk+67b+ucF
   g==;
X-CSE-ConnectionGUID: hDl8FwiGSRqlIMtfq06d6g==
X-CSE-MsgGUID: 7Ez9ZDtzRAaUgXl7HWTgtA==
X-IronPort-AV: E=McAfee;i="6800,10657,11927"; a="32778"
X-IronPort-AV: E=Sophos;i="6.27,143,1787036400"; 
   d="scan'208";a="32778"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Oct 2026 08:24:47 -0700
X-CSE-ConnectionGUID: bgkVxhVDRNKjUCQcsadBTQ==
X-CSE-MsgGUID: VIgNnWb7Rn62lBSAan40sQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,143,1787036400"; 
   d="scan'208";a="303454870"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa002.fm.intel.com with ESMTP; 06 Oct 2026 08:24:45 -0700
Received: by black.igk.intel.com (Postfix, from userid 1058)
	id 635DDA1; Tue, 06 Oct 2026 17:24:44 +0200 (CEST)
From: Niklas Neronin <niklas.neronin@linux.intel.com>
To: mathias.nyman@linux.intel.com
Cc: linux-usb@vger.kernel.org,
	Niklas Neronin <niklas.neronin@linux.intel.com>
Subject: [PATCH 5/5] usb: xhci: remove unused structs
Date: Tue,  6 Oct 2026 17:24:27 +0200
Message-ID: <20261006152427.3735383-6-niklas.neronin@linux.intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20261006152427.3735383-1-niklas.neronin@linux.intel.com>
References: <20261006152427.3735383-1-niklas.neronin@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Neither structure has any remaining users in the xHCI driver, so
remove them as dead code.

Last time 'xhci_cd' was used [1] in 2014.
Last time 'dev_info' was used [2] in 2013.

Link: https://git.kernel.org/torvalds/c/c311e391a7ef [1]
Link: https://git.kernel.org/torvalds/c/de68bab4fa96 [2]
Signed-off-by: Niklas Neronin <niklas.neronin@linux.intel.com>
---
 drivers/usb/host/xhci.h | 12 ------------
 1 file changed, 12 deletions(-)

diff --git a/drivers/usb/host/xhci.h b/drivers/usb/host/xhci.h
index c7bfa7f028d3..20abcc5a7acc 100644
--- a/drivers/usb/host/xhci.h
+++ b/drivers/usb/host/xhci.h
@@ -1322,12 +1322,6 @@ struct xhci_td {
  */
 #define XHCI_CMD_DEFAULT_TIMEOUT	5000
 
-/* command descriptor */
-struct xhci_cd {
-	struct xhci_command	*command;
-	union xhci_trb		*cmd_trb;
-};
-
 enum xhci_ring_type {
 	TYPE_CTRL = 0,
 	TYPE_ISOC,
@@ -1424,12 +1418,6 @@ struct s3_save {
 	u32	config_reg;
 };
 
-/* Use for lpm */
-struct dev_info {
-	u32			dev_id;
-	struct	list_head	list;
-};
-
 struct xhci_bus_state {
 	unsigned long		bus_suspended;
 	unsigned long		next_statechange;
-- 
2.50.1


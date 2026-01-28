Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D858E21FF30
	for <linux-usb@vger.kernel.org>; Wed, 28 Jan 2026 13:15:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769606159; cv=none; b=k0DsM0s4UKNhiwEBDVK0Rau8xpXG7avyuEqRW5Mli3lXLdydvV1v68kByMV4vX4u+d5Sg9boNgXY3z6+24HnABMsiz/Iw1gLdhCGuMump08PfDvGHKG/0sLx6d+4l02XrlOVCsTZwuvbzo4FuXrGy7DYXlTsVqWRTa6l3WqDRWU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769606159; c=relaxed/simple;
	bh=X6hxv7RwJD9c1UiWrST9/IiB38OXb81qJcU+YhoyJvI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WmAisDmA/hLwwK1KIpLjQD48ic8b29kFfivCHM6FpOBEdXwP3ZPBXed1LwX68gcH5LTcwioTyUmOuxVNGl3VaJ/88rmfH5MrsGpr904Mn671mwR5YWmuX5Dwmc39AUDwmNU0tO1d1b/a8XK9eTGEpwHDK+1/Lb/X4KKJtroW9C8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EJvoGKvm; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EJvoGKvm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769606158; x=1801142158;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=X6hxv7RwJD9c1UiWrST9/IiB38OXb81qJcU+YhoyJvI=;
  b=EJvoGKvmb39jxeRQHCUbbl67KHW/Iaqgtqmd9bG3GJWAD2acFjX0Ount
   XqZi9nido+wKsg/CXHf2JYKr+1a/uL8V5h0O2uJHL0OA5j8wmK8KEP6pw
   5sEi+WruBtsKw49rWnDBUZ/3xGTcxJm7y42mxSVrYqCWsqo0ws0bwtjfL
   B+qShdckE3zfbJsd/k9ZxpdwQxfhTlXZRHGQMuoMWYgHZmEa432T9wz3L
   VW1nqCNsqjrDXftc6FANoZfVNqSUt5FD/76hKdgtzsbSiCtiGGQFp2Fp5
   lhKKfnoFDBvG456dx7xan0NZc6jeRfcYXD4nji9R1B4QYH3z0ZXsZTuIB
   A==;
X-CSE-ConnectionGUID: VDJd21reQfe93FXKIqDacw==
X-CSE-MsgGUID: 6prQywXiQs+uMq2GfQIBig==
X-IronPort-AV: E=McAfee;i="6800,10657,11684"; a="70981632"
X-IronPort-AV: E=Sophos;i="6.21,258,1763452800"; 
   d="scan'208";a="70981632"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jan 2026 05:15:57 -0800
X-CSE-ConnectionGUID: gimyd2Z2TW+xv1eRBKVmFA==
X-CSE-MsgGUID: qQNHjIdIRfm+JzyL/HrJeQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,258,1763452800"; 
   d="scan'208";a="213240593"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa005.jf.intel.com with ESMTP; 28 Jan 2026 05:15:56 -0800
Received: by black.igk.intel.com (Postfix, from userid 1058)
	id 3C7C799; Wed, 28 Jan 2026 14:15:55 +0100 (CET)
From: Niklas Neronin <niklas.neronin@linux.intel.com>
To: mathias.nyman@linux.intel.com
Cc: linux-usb@vger.kernel.org,
	raoxu@uniontech.com,
	Niklas Neronin <niklas.neronin@linux.intel.com>
Subject: [PATCH 1/2] usb: xhci: move Primary Interrupter IMODI setup
Date: Wed, 28 Jan 2026 14:15:03 +0100
Message-ID: <20260128131504.124322-2-niklas.neronin@linux.intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260128131504.124322-1-niklas.neronin@linux.intel.com>
References: <20260128131504.124322-1-niklas.neronin@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Move IMODI programming into the Primary Interrupter initialization path,
keeping all interrupter-related setup in a single place.

xHCI platform drivers set 'xhci->imod_interval' well before xhci_init()
is called, so the value is available when the Primary Interrupter is
initialized.

The IMODI value does not change unless explicitly written by software.
See xHCI Specification v1.2, section 5.5.2.2.

Signed-off-by: Niklas Neronin <niklas.neronin@linux.intel.com>
---
 drivers/usb/host/xhci.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/usb/host/xhci.c b/drivers/usb/host/xhci.c
index b3ba16b9718c..fcf8b486b0e0 100644
--- a/drivers/usb/host/xhci.c
+++ b/drivers/usb/host/xhci.c
@@ -578,6 +578,7 @@ static int xhci_init(struct usb_hcd *hcd)
 
 	/* Initialize the Primary interrupter */
 	xhci_add_interrupter(xhci, 0);
+	xhci_set_interrupter_moderation(xhci->interrupters[0], xhci->imod_interval);
 	xhci->interrupters[0]->isoc_bei_interval = AVOID_BEI_INTERVAL_MAX;
 
 	/* Initializing Compliance Mode Recovery Data If Needed */
@@ -664,8 +665,6 @@ int xhci_run(struct usb_hcd *hcd)
 	xhci_dbg_trace(xhci, trace_xhci_dbg_init,
 			"ERST deq = 64'h%0lx", (long unsigned int) temp_64);
 
-	xhci_set_interrupter_moderation(ir, xhci->imod_interval);
-
 	if (xhci->quirks & XHCI_NEC_HOST) {
 		struct xhci_command *command;
 
-- 
2.50.1


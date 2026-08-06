Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11833470E8C
	for <linux-usb@vger.kernel.org>; Thu,  6 Aug 2026 14:21:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786026106; cv=none; b=eZsl+5WNxPYvYXhPKRUqFjdbahv41Hf6wNu+72KxQ6mEXNznoxrf90as7QpgLo4S86vluKB5R7f7/oiGV1v6rkvroja5Wxlg8R0lQJBvHAQtgwVZMGTE5DUpHgLxu7VU0iCppgFhoJ+634HQ78ZcKjJcGsJjvZ3UGUcSrgw0GTY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786026106; c=relaxed/simple;
	bh=/su622RJcek9VStuHW6gtL70fcKHll3R5gUeh8GJHWE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fWoceyrvwc0wWnNxx0bUMI50YxVZt7DV/XQDpC7H/PNHPncpPqHBzEfZAK3pPrbegFnLGT82XlxvO+BcD9zPA0bmP4lXEqvz4mKGghxM3oRcFzDj6w4KZf72VHFHd8G0h8RBhq0aV0g/mI3O2dQ7OW4kIB7If72QXkaVu4TCdGA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=e7z5IYGq; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="e7z5IYGq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786026104; x=1817562104;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=/su622RJcek9VStuHW6gtL70fcKHll3R5gUeh8GJHWE=;
  b=e7z5IYGqurmAFR+ytrjgoxE6pjJd22P4PCO1ZEDvT785jVzoGMsM8+K/
   Bvs7sojhpaXJbe7lgGdl7qbRrxlpshB3Xfz9goJe57jk69bz/1cdKYe5a
   TnCzcgkIHts4TZMlIdFtEBW/TpI/hWfxGL9jDcU41y2TdfGIfHNKAXNEr
   53ltx0dwjej0aXN2SIwIs3hx70BWRAb5DFVl+lwEjzee7XhSk5KA/2GPS
   K8whLebCH94sYFM0XzNyyOQbMqsgE71661hhSkV7lKZdnaJ6eKytQudNy
   /9nfDgwX45v4JJ+8xiGhBeFpdLTps2Njig+aao1CgSAG4Do4RApIxIGVM
   A==;
X-CSE-ConnectionGUID: zCFmXRiuST+hYF7Uq07o0A==
X-CSE-MsgGUID: coLZvmeATi+wZ2w2C779Pg==
X-IronPort-AV: E=McAfee;i="6800,10657,11867"; a="97268170"
X-IronPort-AV: E=Sophos;i="6.25,208,1779174000"; 
   d="scan'208";a="97268170"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Aug 2026 07:21:41 -0700
X-CSE-ConnectionGUID: Z+5yayOeTK2ff+RtEoUENQ==
X-CSE-MsgGUID: EGNOI8MSTYGAW6a/GH4zxw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,208,1779174000"; 
   d="scan'208";a="285500453"
Received: from amilburn-desk.amilburn-desk (HELO mnyman-desk.home) ([10.245.244.235])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Aug 2026 07:21:40 -0700
From: Mathias Nyman <mathias.nyman@linux.intel.com>
To: <gregkh@linuxfoundation.org>
Cc: <linux-usb@vger.kernel.org>,
	Lucas De Marchi <ldemarchi@nvidia.com>,
	Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH 09/17] xhci: dbgtty: Drop extra call to idr_destroy()
Date: Thu,  6 Aug 2026 17:21:05 +0300
Message-ID: <20260806142113.2436238-10-mathias.nyman@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260806142113.2436238-1-mathias.nyman@linux.intel.com>
References: <20260806142113.2436238-1-mathias.nyman@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lucas De Marchi <ldemarchi@nvidia.com>

idr_destroy() is already called on error paths in dbc_tty_init(). Do not
call it again on exit. For symmetry with the init side, also use
IS_ERR_OR_NULL() to gate the exit steps.

Signed-off-by: Lucas De Marchi <ldemarchi@nvidia.com>
Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
---
 drivers/usb/host/xhci-dbgtty.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/usb/host/xhci-dbgtty.c b/drivers/usb/host/xhci-dbgtty.c
index 7e44e62d6ea9..3d51e8d82659 100644
--- a/drivers/usb/host/xhci-dbgtty.c
+++ b/drivers/usb/host/xhci-dbgtty.c
@@ -665,11 +665,11 @@ int dbc_tty_init(void)
 
 void dbc_tty_exit(void)
 {
-	if (dbc_tty_driver) {
-		tty_unregister_driver(dbc_tty_driver);
-		tty_driver_kref_put(dbc_tty_driver);
-		dbc_tty_driver = NULL;
-	}
+	if (IS_ERR_OR_NULL(dbc_tty_driver))
+		return;
 
+	tty_unregister_driver(dbc_tty_driver);
+	tty_driver_kref_put(dbc_tty_driver);
 	idr_destroy(&dbc_tty_minors);
+	dbc_tty_driver = NULL;
 }
-- 
2.43.0


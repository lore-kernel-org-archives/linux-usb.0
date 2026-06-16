Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CAFF42EEA2
	for <linux-usb@vger.kernel.org>; Tue, 16 Jun 2026 10:09:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781604571; cv=none; b=cZOwiTUCwMItMp3ifJzioIsHbzSi42BGGKw6GfmoWZmH8/DnIBq7camqB+5vGxKj3AcnIurQnXfJsAXPOcYyCyq+2eW4IXM+9QhaJ6O1eSp3UzCvXFlsLJ24M5giZxSHvcEJjgwowiIyNLzj/J14qn2/88f2ctVen+kmWSfRIQU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781604571; c=relaxed/simple;
	bh=r4WlXSINs7O0MFRzFd8RlCWcmylvmZrAIbKYMXp8kNc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AoxApnvpZSSIiiF/MpBJNTcwNLwKrtJquhmS4+JU/ZdpspBbuqiHNjZj3qAH4oK21sRPb47weEmcxFMll5S3TArNkafDZrCUl10iYmfKOi9Pl6N5z6/4waXCHi1vh709HeN1j3/OR9wMRlWy+V7ZG5KMVKeqhY4JPDOixNdDtEQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eIu4Ai5+; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eIu4Ai5+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781604569; x=1813140569;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=r4WlXSINs7O0MFRzFd8RlCWcmylvmZrAIbKYMXp8kNc=;
  b=eIu4Ai5+JDhUGcCo9+CzOjDMfbClmfNPsj724bxHIOWNSBPTlvc1R4qU
   M9bgUyP5mj6SNiY1l4hh3E+aXLXiymbiAxW9i8f52yqgBbG+dSlji/tfi
   osSvtcZgOdDLsWeuYN+S0sB5vNxAgZmP0NmesevLPXDZqdO96z3fLVMeE
   UvHYTxi9Oh1PkqPUS4W66Dureyne0Piq3Yg95tmCtuIUdS0dfQTAxF8o0
   Wj0iFW9pdbPiPaUsGeV4oRr9wxj4UvYG1p9i7rM8XH27LnRo7tFM74X2o
   v9uqt6c/sGaRIJkjH96y5T+2bPQ9GFgOFlqmXkyEK6fH8ZpLnddlmm9NZ
   g==;
X-CSE-ConnectionGUID: vNbM6AbiRCOFmSNcbAxUiQ==
X-CSE-MsgGUID: 0ufEwJqfTVOGL0M4m5kX4Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11818"; a="93482935"
X-IronPort-AV: E=Sophos;i="6.24,208,1774335600"; 
   d="scan'208";a="93482935"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jun 2026 03:09:28 -0700
X-CSE-ConnectionGUID: iKLah4KOSjWdwADdfScBXA==
X-CSE-MsgGUID: t4tlN0g7QKmzyCvG65OB1g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,208,1774335600"; 
   d="scan'208";a="247599737"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO mnyman-desk.intel.com) ([10.245.244.156])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jun 2026 03:09:27 -0700
From: Mathias Nyman <mathias.nyman@linux.intel.com>
To: <gregkh@linuxfoundation.org>
Cc: chaitanya.kumar.borah@intel.com,
	linux-usb@vger.kernel.org,
	Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH v2 1/1] xhci: dbc: support runtime suspend while DbC is in enabled state
Date: Tue, 16 Jun 2026 13:09:16 +0300
Message-ID: <20260616100916.2234205-2-mathias.nyman@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260616100916.2234205-1-mathias.nyman@linux.intel.com>
References: <20260616100916.2234205-1-mathias.nyman@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Allow xHC to runtime suspend if DbC is in 'enabled' state for over
15 seconds without a connect.

Idea is that every time we go to 'enabled' state we make sure DbC runtime
pm usage is '1' and save a timestamp. if the event loop still finds DbC in
enabled state 15 seconds later then it decrease DbC runtime pm usage by
calling pm_runtime_put().
Enabled state is reached either when DbC is enabled by userspace or a
connected/configured DbC is disconnected.

When a connect is detected we make sure DbC usage count is 1.

If DbC has been in 'enabled' state for 15 seconds and DbC usage is
decreased to 0 by pm_runtime_put, then the whole xHC controller may
runtime suspends to PCI D3 state if no other devices are using it

DbC sysfs file will show 'suspended' when xHC is suspended and will wake up
and enable DbC at cable connect, or when user writes 'enable' to the file.

This patch was originally part of a larger DbC series, but dropped before
the series was submitted to 7.2-rc1. The series has a locking issue in
commit 520058b73ba3 ("xhci: dbc: serialize enabling and disabling dbc")
which is also resolved by this patch

Fixes: 520058b73ba3 ("xhci: dbc: serialize enabling and disabling dbc")
Reported-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
Closes: https://lore.kernel.org/linux-usb/9ce24ff5-efab-4089-92d7-709862d68e6d@intel.com
Tested-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
---

 v2: Added Reported-by, Closes, and Tested-by tags to commit message

 .../testing/sysfs-bus-pci-drivers-xhci_hcd    |  2 +-
 drivers/usb/host/xhci-dbgcap.c                | 60 ++++++++++++++++++-
 drivers/usb/host/xhci-dbgcap.h                |  3 +
 3 files changed, 62 insertions(+), 3 deletions(-)

diff --git a/Documentation/ABI/testing/sysfs-bus-pci-drivers-xhci_hcd b/Documentation/ABI/testing/sysfs-bus-pci-drivers-xhci_hcd
index 98a8376a83d2..991765d84201 100644
--- a/Documentation/ABI/testing/sysfs-bus-pci-drivers-xhci_hcd
+++ b/Documentation/ABI/testing/sysfs-bus-pci-drivers-xhci_hcd
@@ -22,7 +22,7 @@ Description:
 
 		Reading this attribute gives the state of the DbC. It
 		can be one of the following states: disabled, enabled,
-		initialized, connected or configured.
+		initialized, connected, configured or suspended.
 
 What:		/sys/bus/pci/drivers/xhci_hcd/.../dbc_idVendor
 Date:		March 2023
diff --git a/drivers/usb/host/xhci-dbgcap.c b/drivers/usb/host/xhci-dbgcap.c
index b1cabf5582fa..48ee6a4f9e1c 100644
--- a/drivers/usb/host/xhci-dbgcap.c
+++ b/drivers/usb/host/xhci-dbgcap.c
@@ -646,6 +646,31 @@ static int xhci_dbc_enable_dce(struct xhci_dbc *dbc, bool enable)
 
 static void xhci_dbc_set_state(struct xhci_dbc *dbc, enum dbc_state new_state)
 {
+	if (dbc->state == new_state)
+		return;
+
+	switch (new_state) {
+	case DS_ENABLED:
+		/*
+		 * DbC pm usage is 1 here, both when moved from disconnect or
+		 * configured states, or when setting initial DbC enable state.
+		 * Just enable pending put
+		 */
+		dev_dbg(dbc->dev, "DbC set pending_rpm_put = 1\n");
+		dbc->pending_rpm_put = 1;
+		break;
+	case DS_CONNECTED:
+		if (dbc->pending_rpm_put)
+			/* DbC pm usage still 1, just remove pending put */
+			dbc->pending_rpm_put = 0;
+		else
+			/* DbC pm usage was put to 0, call get */
+			pm_runtime_get(dbc->dev);
+		break;
+	default:
+		break;
+	}
+
 	dbc->state_timestamp = jiffies;
 	dbc->state = new_state;
 }
@@ -681,7 +706,7 @@ static int xhci_dbc_start(struct xhci_dbc *dbc)
 
 	WARN_ON(!dbc);
 
-	pm_runtime_get_sync(dbc->dev); /* note this was self.controller */
+	pm_runtime_get(dbc->dev);
 
 	spin_lock_irqsave(&dbc->lock, flags);
 	ret = xhci_do_dbc_start(dbc);
@@ -706,6 +731,7 @@ static int xhci_dbc_start(struct xhci_dbc *dbc)
 static void xhci_dbc_stop(struct xhci_dbc *dbc)
 {
 	unsigned long		flags;
+	bool			need_rpm_put = false;
 
 	WARN_ON(!dbc);
 
@@ -731,12 +757,20 @@ static void xhci_dbc_stop(struct xhci_dbc *dbc)
 
 	spin_lock_irqsave(&dbc->lock, flags);
 	writel(0, &dbc->regs->control);
+
+	if (dbc->state == DS_CONNECTED || dbc->state == DS_CONFIGURED ||
+	    dbc->pending_rpm_put)
+		need_rpm_put = true;
+
+	dbc->pending_rpm_put = 0;
+
 	xhci_dbc_set_state(dbc, DS_DISABLED);
 	spin_unlock_irqrestore(&dbc->lock, flags);
 
 	xhci_dbc_mem_cleanup(dbc);
 
-	pm_runtime_put(dbc->dev); /* note, was self.controller */
+	if (need_rpm_put)
+		pm_runtime_put(dbc->dev);
 }
 
 static void
@@ -908,6 +942,12 @@ static enum evtreturn xhci_dbc_do_handle_events(struct xhci_dbc *dbc)
 			dev_info(dbc->dev, "DbC connected\n");
 		} else if (!(ctrl & DBC_CTRL_DBC_ENABLE)) {
 			dev_err(dbc->dev, "unexpected DbC disable, xHC reset?\n");
+		} else if (dbc->pending_rpm_put &&
+			   time_is_before_jiffies(dbc->state_timestamp +
+				msecs_to_jiffies(DBC_AUTOSUSPEND_DELAY))) {
+			dbc->pending_rpm_put = 0;
+			dev_dbg(dbc->dev, "DbC Enabled state for 15 seconds, allow rpm suspend\n");
+			pm_runtime_put(dbc->dev);
 		}
 
 		return EVT_DONE;
@@ -1096,6 +1136,9 @@ static ssize_t dbc_show(struct device *dev,
 	if (dbc->state >= ARRAY_SIZE(dbc_state_strings))
 		return sysfs_emit(buf, "unknown\n");
 
+	if (dbc->resume_required)
+		return sysfs_emit(buf, "suspended\n");
+
 	return sysfs_emit(buf, "%s\n", dbc_state_strings[dbc->state]);
 }
 
@@ -1110,12 +1153,25 @@ static ssize_t dbc_store(struct device *dev,
 	dbc = xhci->dbc;
 
 	if (sysfs_streq(buf, "enable")) {
+		pm_runtime_get_sync(dbc->dev);
+
 		mutex_lock(&dbc->enable_mutex);
+		/*
+		 * DbC may already be enabled here if xhci was suspended with
+		 * dbc->resume_required set, and resumed by pm_runtime_get_sync()
+		 * above. In this case we end up calling xhci_dbc_start() twice,
+		 * second time returns an error but is harmless
+		 */
 		xhci_dbc_start(dbc);
+
 		mutex_unlock(&dbc->enable_mutex);
+		pm_runtime_put(dbc->dev);
 	} else if (sysfs_streq(buf, "disable")) {
 		mutex_lock(&dbc->enable_mutex);
+
+		dbc->resume_required = 0;
 		xhci_dbc_stop(dbc);
+
 		mutex_unlock(&dbc->enable_mutex);
 	} else {
 		return -EINVAL;
diff --git a/drivers/usb/host/xhci-dbgcap.h b/drivers/usb/host/xhci-dbgcap.h
index df7aca8bfe99..5b18efb2c1ea 100644
--- a/drivers/usb/host/xhci-dbgcap.h
+++ b/drivers/usb/host/xhci-dbgcap.h
@@ -114,6 +114,8 @@ struct dbc_ep {
 #define DBC_POLL_INTERVAL_MAX		5000	/* milliseconds */
 #define DBC_XFER_INACTIVITY_TIMEOUT	10	/* milliseconds */
 #define DBC_ENUMERATION_TIMEOUT		2000	/* milliseconds */
+#define DBC_AUTOSUSPEND_DELAY		15000	/* milliseconds */
+
 /*
  * Private structure for DbC hardware state:
  */
@@ -166,6 +168,7 @@ struct xhci_dbc {
 	unsigned long			xfer_timestamp;
 	unsigned long			state_timestamp;
 	unsigned			resume_required:1;
+	unsigned			pending_rpm_put:1;
 	struct dbc_ep			eps[2];
 
 	const struct dbc_driver		*driver;
-- 
2.43.0


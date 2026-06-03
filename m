Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49686408006
	for <linux-usb@vger.kernel.org>; Wed,  3 Jun 2026 09:12:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780477924; cv=none; b=Tej0yDxODtoSLy1eWfbCG+qttCw2VxTi23KSKeHzVb+jbpeZxQJUxlJp2nNuAAknvMTauoLvLghaAi4L/HkizjcXUbzHRjBF8uQOEOLKxWLysdbRAZUO98tGlWVR8QhDYBOFkWYjQBf6toHgneT1YXnSZPhihnwHigabWnMsPQk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780477924; c=relaxed/simple;
	bh=uEC3zoWXsWpBciowb4fYhDIycf5saVu54Yj7EXxCG+Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ruJMXPyqh/g4jIrIFl3wkpVsAz7JF6yh/FFg/BESAAzLyMKah7SUNWdmN1KBMsSW9r1GzRxrNwVMICw7O4bZfCAWD/iUSG5lUtSOz2LJUezgAXX+fX+lQx8X3fJhmiCW75rRR/OkzJ1XXEvYRFIdhrsIx/ovNJkGn9U2oVslju0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bE7MFk82; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bE7MFk82"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780477923; x=1812013923;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=uEC3zoWXsWpBciowb4fYhDIycf5saVu54Yj7EXxCG+Q=;
  b=bE7MFk82UkCbUxg3ZL5lONRdZ4JWDHr198RBs3QQwTKRDVCMvZu2BLn+
   ZAVObICZGSigxQeVM0uzIU8XPYn3zckpDhkcCd7hBjBi6biCgvKlhwVPT
   WHupRYcikjQMxLcrV/lasZP8IPtc16TFZPDoQx+aloG7X1KpLBGiWhgHB
   ky6iP/bjjSPJkcXtkM7vkurWlq2sRBNnvJ5oWzzIpwliyop2l/xFUar+4
   BCKitHDntAjWtefVVRDk0tWkfr0DxHAJdddhozwxRTcBa2fpwpZYBPCtu
   PhQCR+3EOpDwh6XllPefKM4tqJqbtkPh1O9nPAuHSIN+Uf35cBUNjZX0D
   A==;
X-CSE-ConnectionGUID: m7AjZDzYQNGZvwUtU3vXkA==
X-CSE-MsgGUID: RMnescGiQsinT2A8QJd8ow==
X-IronPort-AV: E=McAfee;i="6800,10657,11805"; a="92657572"
X-IronPort-AV: E=Sophos;i="6.24,184,1774335600"; 
   d="scan'208";a="92657572"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jun 2026 02:12:02 -0700
X-CSE-ConnectionGUID: lz97T3zUS+uEkMITJsieCg==
X-CSE-MsgGUID: DDpp3Bs9SiiROQHqN60QrQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,184,1774335600"; 
   d="scan'208";a="244281967"
Received: from slindbla-desk.ger.corp.intel.com (HELO mnyman-desk.intel.com) ([10.245.244.174])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jun 2026 02:12:02 -0700
From: Mathias Nyman <mathias.nyman@linux.intel.com>
To: <gregkh@linuxfoundation.org>
Cc: <linux-usb@vger.kernel.org>,
	Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH 08/15] xhci: dbc: serialize enabling and disabling dbc
Date: Wed,  3 Jun 2026 12:11:25 +0300
Message-ID: <20260603091132.1110849-9-mathias.nyman@linux.intel.com>
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

DbC can be enabled and disabled via sysfs, serialize those
with a mutex to make sure everything is done in the correct
order.

remove xhci_do_dbc_stop() and integrate the register write and
dbc->state setting into xhci_do_stop()

Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
---
 drivers/usb/host/xhci-dbgcap.c | 66 ++++++++++++++++++++--------------
 drivers/usb/host/xhci-dbgcap.h |  1 +
 2 files changed, 40 insertions(+), 27 deletions(-)

diff --git a/drivers/usb/host/xhci-dbgcap.c b/drivers/usb/host/xhci-dbgcap.c
index 6a9f73fecb73..49ae546c4103 100644
--- a/drivers/usb/host/xhci-dbgcap.c
+++ b/drivers/usb/host/xhci-dbgcap.c
@@ -661,17 +661,6 @@ static int xhci_do_dbc_start(struct xhci_dbc *dbc)
 	return 0;
 }
 
-static int xhci_do_dbc_stop(struct xhci_dbc *dbc)
-{
-	if (dbc->state == DS_DISABLED)
-		return -EINVAL;
-
-	writel(0, &dbc->regs->control);
-	dbc->state = DS_DISABLED;
-
-	return 0;
-}
-
 static int xhci_dbc_start(struct xhci_dbc *dbc)
 {
 	int			ret;
@@ -683,29 +672,37 @@ static int xhci_dbc_start(struct xhci_dbc *dbc)
 
 	spin_lock_irqsave(&dbc->lock, flags);
 	ret = xhci_do_dbc_start(dbc);
+	if (ret)
+		goto err_unlock;
+
 	spin_unlock_irqrestore(&dbc->lock, flags);
 
-	if (ret) {
-		pm_runtime_put(dbc->dev); /* note this was self.controller */
-		return ret;
-	}
+	mod_delayed_work(system_percpu_wq, &dbc->event_work,
+			 msecs_to_jiffies(dbc->poll_interval));
 
-	return mod_delayed_work(system_percpu_wq, &dbc->event_work,
-				msecs_to_jiffies(dbc->poll_interval));
+	return 0;
+
+err_unlock:
+
+	spin_unlock_irqrestore(&dbc->lock, flags);
+	pm_runtime_put(dbc->dev); /* note this was self.controller */
+
+	return ret;
 }
 
 static void xhci_dbc_stop(struct xhci_dbc *dbc)
 {
-	int ret;
 	unsigned long		flags;
 
 	WARN_ON(!dbc);
 
+	spin_lock(&dbc->lock);
+
 	switch (dbc->state) {
 	case DS_DISABLED:
+		spin_unlock(&dbc->lock);
 		return;
 	case DS_CONFIGURED:
-		spin_lock(&dbc->lock);
 		xhci_dbc_flush_requests(dbc);
 		spin_unlock(&dbc->lock);
 
@@ -713,19 +710,20 @@ static void xhci_dbc_stop(struct xhci_dbc *dbc)
 			dbc->driver->disconnect(dbc);
 		break;
 	default:
+		spin_unlock(&dbc->lock);
 		break;
 	}
 
 	cancel_delayed_work_sync(&dbc->event_work);
 
 	spin_lock_irqsave(&dbc->lock, flags);
-	ret = xhci_do_dbc_stop(dbc);
+	writel(0, &dbc->regs->control);
+	dbc->state = DS_DISABLED;
 	spin_unlock_irqrestore(&dbc->lock, flags);
-	if (ret)
-		return;
 
 	xhci_dbc_mem_cleanup(dbc);
-	pm_runtime_put_sync(dbc->dev); /* note, was self.controller */
+
+	pm_runtime_put(dbc->dev); /* note, was self.controller */
 }
 
 static void
@@ -1072,12 +1070,17 @@ static ssize_t dbc_store(struct device *dev,
 	xhci = hcd_to_xhci(dev_get_drvdata(dev));
 	dbc = xhci->dbc;
 
-	if (sysfs_streq(buf, "enable"))
+	if (sysfs_streq(buf, "enable")) {
+		mutex_lock(&dbc->enable_mutex);
 		xhci_dbc_start(dbc);
-	else if (sysfs_streq(buf, "disable"))
+		mutex_unlock(&dbc->enable_mutex);
+	} else if (sysfs_streq(buf, "disable")) {
+		mutex_lock(&dbc->enable_mutex);
 		xhci_dbc_stop(dbc);
-	else
+		mutex_unlock(&dbc->enable_mutex);
+	} else {
 		return -EINVAL;
+	}
 
 	return count;
 }
@@ -1443,6 +1446,7 @@ xhci_alloc_dbc(struct device *dev, void __iomem *base, const struct dbc_driver *
 
 	INIT_DELAYED_WORK(&dbc->event_work, xhci_dbc_handle_events);
 	spin_lock_init(&dbc->lock);
+	mutex_init(&dbc->enable_mutex);
 
 	ret = sysfs_create_groups(&dev->kobj, dbc_dev_groups);
 	if (ret)
@@ -1460,8 +1464,9 @@ void xhci_dbc_remove(struct xhci_dbc *dbc)
 	if (!dbc)
 		return;
 	/* stop hw, stop wq and call dbc->ops->stop() */
+	mutex_lock(&dbc->enable_mutex);
 	xhci_dbc_stop(dbc);
-
+	mutex_unlock(&dbc->enable_mutex);
 	/* remove sysfs files */
 	sysfs_remove_groups(&dbc->dev->kobj, dbc_dev_groups);
 
@@ -1514,6 +1519,8 @@ int xhci_dbc_suspend(struct xhci_hcd *xhci)
 	if (!dbc)
 		return 0;
 
+	mutex_lock(&dbc->enable_mutex);
+
 	switch (dbc->state) {
 	case DS_ENABLED:
 	case DS_CONNECTED:
@@ -1525,6 +1532,7 @@ int xhci_dbc_suspend(struct xhci_hcd *xhci)
 	}
 
 	xhci_dbc_stop(dbc);
+	mutex_unlock(&dbc->enable_mutex);
 
 	return 0;
 }
@@ -1537,11 +1545,15 @@ int xhci_dbc_resume(struct xhci_hcd *xhci)
 	if (!dbc)
 		return 0;
 
+	mutex_lock(&dbc->enable_mutex);
+
 	if (dbc->resume_required) {
 		dbc->resume_required = 0;
 		xhci_dbc_start(dbc);
 	}
 
+	mutex_unlock(&dbc->enable_mutex);
+
 	return ret;
 }
 #endif /* CONFIG_PM */
diff --git a/drivers/usb/host/xhci-dbgcap.h b/drivers/usb/host/xhci-dbgcap.h
index 20ae4e7617f2..f4c0169a1b4d 100644
--- a/drivers/usb/host/xhci-dbgcap.h
+++ b/drivers/usb/host/xhci-dbgcap.h
@@ -140,6 +140,7 @@ struct dbc_driver {
 
 struct xhci_dbc {
 	spinlock_t			lock;		/* device access */
+	struct mutex			enable_mutex;
 	struct device			*dev;
 	struct xhci_hcd			*xhci;
 	struct dbc_regs __iomem		*regs;
-- 
2.43.0


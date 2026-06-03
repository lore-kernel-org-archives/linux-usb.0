Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8514A408006
	for <linux-usb@vger.kernel.org>; Wed,  3 Jun 2026 09:12:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780477926; cv=none; b=l4PFvO4KNx2Kuz170SJM38wAT5SX4yZeLBW70En10CIn+PLMLd2yQdAyr7RDA1gPvSL62Zxf70O4bB7Auc27fKmOHvv52hKyuEZydZZWfMFUAO2LwJ5OBfyka7ZM52NZTjhSXsZ73UWaKuoJIYInSdbFABItN4dBedrn3iwRf/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780477926; c=relaxed/simple;
	bh=m9uytlbodDLxKLXfy6yJTugmAFts7sSijwJvzXLHU8Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=T10M8bptvurv1n4/1NHnYKLre9+3kWej58dcfPgSFewBU5c1JoyEMhfdpYuF6qwLnRUeokaioajrWhG4ao3wzGFcKDlF+ILj5C0idNAIflk1/lkBewtBoWJiq4aX7jj9/oZn5pzGu4DJB63XuVrhf1mCLSWpSEA0gi2IanC1LsU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SZSUbUkM; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SZSUbUkM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780477925; x=1812013925;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=m9uytlbodDLxKLXfy6yJTugmAFts7sSijwJvzXLHU8Y=;
  b=SZSUbUkM2VWJPPNVZvruL8WOIcrwIDdLIX1t4thWSRYHs5phgDIOtlsD
   1L5A9sVcd5lgURNqgr2HrbIqmjvN6zcIY0bpYYzKiq+UgmUlFm9rdPyVH
   XfWDFrLj5AWOa3C2mQe+swizX4yzmimDsgUYYKCPxd3dUltZuAUcCJ7gC
   exxKaOwHqYSXty+BACbj8fR3TFgK8TZmbymzUT66kSuOvACKbmJMiEkMf
   mgUcfqYcgXSyOayRnpuVA8AoaTS2OPt7NBvDN8G+aowyoNJF20lKwTytm
   6Uej9OTE3hb9UgJA6p9De1dfkDpVXq7GkP3FjEf9R+TVwCoPCt/jjRefz
   w==;
X-CSE-ConnectionGUID: 69s9tnXLQT6OQXsVNwhU3w==
X-CSE-MsgGUID: +b/BVQzjTl+1JgoEnP314A==
X-IronPort-AV: E=McAfee;i="6800,10657,11805"; a="92657589"
X-IronPort-AV: E=Sophos;i="6.24,184,1774335600"; 
   d="scan'208";a="92657589"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jun 2026 02:12:05 -0700
X-CSE-ConnectionGUID: iIHUi5UbQh6f/9RdtdXHlg==
X-CSE-MsgGUID: mJBscu8XT/ufBEyqNGH4Dg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,184,1774335600"; 
   d="scan'208";a="244281990"
Received: from slindbla-desk.ger.corp.intel.com (HELO mnyman-desk.intel.com) ([10.245.244.174])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jun 2026 02:12:05 -0700
From: Mathias Nyman <mathias.nyman@linux.intel.com>
To: <gregkh@linuxfoundation.org>
Cc: <linux-usb@vger.kernel.org>,
	Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH 10/15] xhci: dbc: add timestamps to DbC state changes in a new helper.
Date: Wed,  3 Jun 2026 12:11:27 +0300
Message-ID: <20260603091132.1110849-11-mathias.nyman@linux.intel.com>
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

The timestamp helps us track when a state changed the last time.
It allows us to detect if DbC is stuck in connected state for too long,
and can later be used to enable runtime suspend if there is no activity
for some time

Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
---
 drivers/usb/host/xhci-dbgcap.c | 18 ++++++++++++------
 drivers/usb/host/xhci-dbgcap.h |  1 +
 2 files changed, 13 insertions(+), 6 deletions(-)

diff --git a/drivers/usb/host/xhci-dbgcap.c b/drivers/usb/host/xhci-dbgcap.c
index 8cf0f0356bf1..34441ffa5e15 100644
--- a/drivers/usb/host/xhci-dbgcap.c
+++ b/drivers/usb/host/xhci-dbgcap.c
@@ -644,6 +644,12 @@ static int xhci_dbc_enable_dce(struct xhci_dbc *dbc, bool enable)
 			      done_state, 1000);
 }
 
+static void xhci_dbc_set_state(struct xhci_dbc *dbc, enum dbc_state new_state)
+{
+	dbc->state_timestamp = jiffies;
+	dbc->state = new_state;
+}
+
 static int xhci_do_dbc_start(struct xhci_dbc *dbc)
 {
 	int			ret;
@@ -663,7 +669,7 @@ static int xhci_do_dbc_start(struct xhci_dbc *dbc)
 	if (ret)
 		return ret;
 
-	dbc->state = DS_ENABLED;
+	xhci_dbc_set_state(dbc, DS_ENABLED);
 
 	return 0;
 }
@@ -725,7 +731,7 @@ static void xhci_dbc_stop(struct xhci_dbc *dbc)
 
 	spin_lock_irqsave(&dbc->lock, flags);
 	writel(0, &dbc->regs->control);
-	dbc->state = DS_DISABLED;
+	xhci_dbc_set_state(dbc, DS_DISABLED);
 	spin_unlock_irqrestore(&dbc->lock, flags);
 
 	xhci_dbc_mem_cleanup(dbc);
@@ -896,7 +902,7 @@ static enum evtreturn xhci_dbc_do_handle_events(struct xhci_dbc *dbc)
 	case DS_ENABLED:
 		portsc = readl(&dbc->regs->portsc);
 		if (portsc & DBC_PORTSC_CONN_STATUS) {
-			dbc->state = DS_CONNECTED;
+			xhci_dbc_set_state(dbc, DS_CONNECTED);
 			dev_info(dbc->dev, "DbC connected\n");
 		}
 
@@ -904,7 +910,7 @@ static enum evtreturn xhci_dbc_do_handle_events(struct xhci_dbc *dbc)
 	case DS_CONNECTED:
 		ctrl = readl(&dbc->regs->control);
 		if (ctrl & DBC_CTRL_DBC_RUN) {
-			dbc->state = DS_CONFIGURED;
+			xhci_dbc_set_state(dbc, DS_CONFIGURED);
 			dev_info(dbc->dev, "DbC configured\n");
 			portsc = readl(&dbc->regs->portsc);
 			writel(portsc, &dbc->regs->portsc);
@@ -919,7 +925,7 @@ static enum evtreturn xhci_dbc_do_handle_events(struct xhci_dbc *dbc)
 		if (!(portsc & DBC_PORTSC_PORT_ENABLED) &&
 		    !(portsc & DBC_PORTSC_CONN_STATUS)) {
 			dev_info(dbc->dev, "DbC cable unplugged\n");
-			dbc->state = DS_ENABLED;
+			xhci_dbc_set_state(dbc, DS_ENABLED);
 			xhci_dbc_flush_requests(dbc);
 			xhci_dbc_reinit_ep_rings(dbc);
 			return EVT_DISC;
@@ -929,7 +935,7 @@ static enum evtreturn xhci_dbc_do_handle_events(struct xhci_dbc *dbc)
 		if (portsc & DBC_PORTSC_RESET_CHANGE) {
 			dev_info(dbc->dev, "DbC port reset\n");
 			writel(portsc, &dbc->regs->portsc);
-			dbc->state = DS_ENABLED;
+			xhci_dbc_set_state(dbc, DS_ENABLED);
 			xhci_dbc_flush_requests(dbc);
 			xhci_dbc_reinit_ep_rings(dbc);
 			return EVT_DISC;
diff --git a/drivers/usb/host/xhci-dbgcap.h b/drivers/usb/host/xhci-dbgcap.h
index f4c0169a1b4d..b3efea43a6be 100644
--- a/drivers/usb/host/xhci-dbgcap.h
+++ b/drivers/usb/host/xhci-dbgcap.h
@@ -163,6 +163,7 @@ struct xhci_dbc {
 	struct delayed_work		event_work;
 	unsigned int			poll_interval;	/* ms */
 	unsigned long			xfer_timestamp;
+	unsigned long			state_timestamp;
 	unsigned			resume_required:1;
 	struct dbc_ep			eps[2];
 
-- 
2.43.0


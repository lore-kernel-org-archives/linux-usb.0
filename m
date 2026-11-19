Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.19
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795108360;
	b=kcynLF7NPHzStz/8/WlceC69pk0xYEW2XIkG4vfGdrhZXF9cwNX1y16vfd4wRaPN1UP0
	 WMwfmPDNhM+ary1OZ7AfMULRlCqmZWmeEpMylzMNWH0TmzFcUnJY/Y3UXBaVjKCv+KdVq
	 dvweD+xTI5OWbtQxLHxumcD02HwQ03nCSpvIzA5+zaYXOYUuporQo90bikf7D9fGBNSBr
	 74QNW4wX5g/RTjNIPfJ6LsWYfTdftKLJkFBfhe75/A3BKXQg2HH0zQcOvyBmd0eo2KSfM
	 vyhSpVHxu3m7n72SKrQ84wyKzid2bTbH3F9oD2Wv3zcJXxhCyjC3pu/145+zIs+VolA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795108360;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=eRpxgvrI7FVCAyly5LCQswhBXI7nGSXNTf9Fvfm+ozU=;
	b=sdjAMkrA8VnDfDQGH4oxsser9Imm6BfdcZ3Z2pSld0kxjMByi6reVm3OY5IxUWMV6Igk
	 Wn8U9DQzUDzhp6A4/hqcPPONnyc9TCiHlVrnxZZ2PO/BOC1lv/t7+hNeBkEPJUVRSZrg0
	 qTL8IOOrShsp7GZvORJHWmSKQzOEhvqUqfU7KzCO4DPRfB0UrIUtbwn7Ej3xfoHKqpkjc
	 iHkXlsDglLL5B3j1B+SmRBn29iXWKFGEAVIVeo8g0spbYZ0jJYjHA/wU5xkdHD6ViOADa
	 S5yj/nkzot1y5Ir307z7BbtM7S8c6rLRTgDW2S2P2jfHjwBTScyEbhzzvK2Dq9vEisg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b="PGJwb0E/";
	arc=none smtp.remote-ip=198.175.65.19
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 898F0606A623
	for <linux-usb@vger.kernel.org>; Thu, 19 Nov 2026 17:12:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 898F0606A623
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=PGJwb0E/
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795108359; x=1826644359;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=UM/VMoSw/smEGcSNXS1b7xy4pe/g/EySRiEiVdJ3xuw=;
  b=PGJwb0E/OpKZJa1kya39c7TsKuTpmy3K7U2c10J0uW4kc5wkTtX5w3hJ
   51tHz02CGyq2Tsc+GYkFR+tR1u7plvl5iIsQYfA/wyVGIxhEVAIwCUblY
   w9SmRb4UiMA4kkhJP1M/JC5WAwPmq5UD8WlqymCGVAawBIKaQ9hCHaOEB
   TMFptZd6pliTfN9/+NQ7cK/g7epATulvhpaPBLOI6j+waJ0pwKj/XWVC5
   CqSCTRUyUsGpvMLs0gLqHgX8dUrytw6gDvP6nB400U9VPha5OiWHihCg5
   rRpMZ6V+bxPgXgYbev1vhkRdHYZQV4cFrzmhbIwZIPnfZFC/Em+iFUSIq
   A==;
X-CSE-ConnectionGUID: NW9d/qsCRcK4T0qBAe+5Fg==
X-CSE-MsgGUID: NWVdBsI5TPmkwgU11sWrvA==
X-IronPort-AV: E=McAfee;i="6800,10657,11971"; a="4013002"
X-IronPort-AV: E=Sophos;i="6.27,221,1787036400"; 
   d="scan'208";a="4013002"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2026 09:12:38 -0800
X-CSE-ConnectionGUID: czhklWngRwu8X54IJYStCw==
X-CSE-MsgGUID: +Iyj8moCT+ydizdyHn/nMw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,221,1787036400"; 
   d="scan'208";a="10575077"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa005.fm.intel.com with ESMTP; 19 Nov 2026 09:12:36 -0800
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id 1D374A9; Thu, 19 Nov 2026 18:12:33 +0100 (CET)
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: linux-usb@vger.kernel.org
Cc: Yehezkel Bernat <YehezkelShB@gmail.com>,
	Lukas Wunner <lukas@wunner.de>,
	Andreas Noever <andreas.noever@gmail.com>,
	Gil Fine <gil.fine@linux.intel.com>,
	Rene Sapiens <rene.sapiens@linux.intel.com>,
	Pooja Katiyar <pooja.katiyar@intel.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH 11/18] thunderbolt: Reset topology after suspend-to-disk
Date: Thu, 19 Nov 2026 18:12:25 +0100
Message-ID: <20261119171232.1616316-12-mika.westerberg@linux.intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20261119171232.1616316-1-mika.westerberg@linux.intel.com>
References: <20261119171232.1616316-1-mika.westerberg@linux.intel.com>
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Mika Westerberg (Intel)" <westeri@kernel.org>

The hibernation image is taken with all tunnels up, so after restore the
tunnels the restore kernel (or boot firmware) created may collide with
the resources the image still holds. Instead of discovering and tearing
those down, reset the host router on restore and re-create the tunnels
from the image. DP tunnels are dropped and re-established from plug
events just like we do on system suspend.

Links can take some time to retrain after reset so we wait for them to
retrain before resuming the connected routers (and we mask the hotplug
during that time). Because the plug events are masked we perform rescan
in complete phase to pick up devices replaced during hibernation (or S3
for older Apple devices).

DPRX polling is put on hold while the control channel is stopped so that
it does not pointlessly try to access the hardware during hibernation.

Cc: Rene Sapiens <rene.sapiens@linux.intel.com>
Cc: Pooja Katiyar <pooja.katiyar@intel.com>
Signed-off-by: Mika Westerberg (Intel) <westeri@kernel.org>
---
 drivers/thunderbolt/domain.c |  5 ++-
 drivers/thunderbolt/nhi.c    | 17 ++++++--
 drivers/thunderbolt/switch.c | 76 ++++++++++++++++++++++++++++++++++++
 drivers/thunderbolt/tb.c     | 64 ++++++++++++++++--------------
 drivers/thunderbolt/tb.h     |  4 +-
 drivers/thunderbolt/tunnel.c | 32 ++++++++++++---
 6 files changed, 155 insertions(+), 43 deletions(-)

diff --git a/drivers/thunderbolt/domain.c b/drivers/thunderbolt/domain.c
index 24611f05b3cd..f9951d4311cb 100644
--- a/drivers/thunderbolt/domain.c
+++ b/drivers/thunderbolt/domain.c
@@ -545,20 +545,21 @@ int tb_domain_suspend_noirq(struct tb *tb)
 /**
  * tb_domain_resume_noirq() - Resume a domain
  * @tb: Domain to resume
+ * @hibernate: Are we resuming from hibernation
  *
  * Re-starts the control channel, and resumes all devices connected to
  * the domain.
  *
  * Return: %0 on success, negative errno otherwise.
  */
-int tb_domain_resume_noirq(struct tb *tb)
+int tb_domain_resume_noirq(struct tb *tb, bool hibernate)
 {
 	int ret = 0;
 
 	mutex_lock(&tb->lock);
 	tb_ctl_start(tb->ctl);
 	if (tb->cm_ops->resume_noirq)
-		ret = tb->cm_ops->resume_noirq(tb);
+		ret = tb->cm_ops->resume_noirq(tb, hibernate);
 	mutex_unlock(&tb->lock);
 
 	return ret;
diff --git a/drivers/thunderbolt/nhi.c b/drivers/thunderbolt/nhi.c
index f54ab2189cf4..cfb782f3233a 100644
--- a/drivers/thunderbolt/nhi.c
+++ b/drivers/thunderbolt/nhi.c
@@ -1139,9 +1139,8 @@ static int nhi_poweroff_noirq(struct device *dev)
 	return __nhi_suspend_noirq(dev, wakeup);
 }
 
-static int nhi_resume_noirq(struct device *dev)
+static int __nhi_resume_noirq(struct tb *tb, bool hibernate)
 {
-	struct tb *tb = dev_get_drvdata(dev);
 	struct tb_nhi *nhi = tb->nhi;
 	int ret;
 
@@ -1158,7 +1157,17 @@ static int nhi_resume_noirq(struct device *dev)
 			return ret;
 	}
 
-	return tb_domain_resume_noirq(tb);
+	return tb_domain_resume_noirq(tb, hibernate);
+}
+
+static int nhi_resume_noirq(struct device *dev)
+{
+	return __nhi_resume_noirq(dev_get_drvdata(dev), false);
+}
+
+static int nhi_restore_noirq(struct device *dev)
+{
+	return __nhi_resume_noirq(dev_get_drvdata(dev), true);
 }
 
 static int nhi_suspend(struct device *dev)
@@ -1396,7 +1405,7 @@ const struct dev_pm_ops nhi_pm_ops = {
 					    * pci-tunnels stay alive.
 					    */
 	.thaw_noirq = nhi_thaw_noirq,
-	.restore_noirq = nhi_resume_noirq,
+	.restore_noirq = nhi_restore_noirq,
 	.suspend = nhi_suspend,
 	.poweroff_noirq = nhi_poweroff_noirq,
 	.poweroff = nhi_suspend,
diff --git a/drivers/thunderbolt/switch.c b/drivers/thunderbolt/switch.c
index 85a2aa67cbec..216681d2bb8f 100644
--- a/drivers/thunderbolt/switch.c
+++ b/drivers/thunderbolt/switch.c
@@ -21,6 +21,8 @@
 
 /* How long a hop is given to drain when a path is deactivated */
 #define TB_PORT_PENDING_TIMEOUT		500 /* ms */
+/* Maximum time we wait after link reset */
+#define TB_RESET_LINK_TIMEOUT		5000 /* ms */
 
 /* Switch NVM support */
 
@@ -495,6 +497,11 @@ static bool tb_port_state_is_up(enum tb_port_state state)
 	}
 }
 
+static inline bool tb_port_link_is_up(struct tb_port *port)
+{
+	return tb_port_state_is_up(tb_port_state(port));
+}
+
 /**
  * tb_wait_for_port() - wait for a port to become ready
  * @port: Port to wait
@@ -1649,6 +1656,15 @@ static int tb_plug_events_active(struct tb_switch *sw, bool active)
 			   sw->cap_plug_events + 1, 1);
 }
 
+/*
+ * USB4 ports whose link is expected to come back after host reset
+ * because something was connected before.
+ */
+static bool tb_port_should_reconnect(const struct tb_port *port)
+{
+	return tb_port_has_remote(port) || (port->xdomain && port->usb4);
+}
+
 static int tb_switch_reset_host_ports(struct tb_switch *sw)
 {
 	struct tb_port *port;
@@ -1698,12 +1714,63 @@ static int tb_switch_reset_host_ports(struct tb_switch *sw)
 	return 0;
 }
 
+static void tb_switch_wait_for_reconnect(struct tb_switch *sw)
+{
+	ktime_t timeout = ktime_add_ms(ktime_get(), TB_RESET_LINK_TIMEOUT);
+	struct tb_port *port;
+
+	tb_switch_for_each_port(sw, port) {
+		if (!tb_port_should_reconnect(port))
+			continue;
+
+		/*
+		 * It's fine to wait just for one port. The others train
+		 * in parallel.
+		 */
+		while (!tb_port_link_is_up(port)) {
+			if (ktime_after(ktime_get(), timeout)) {
+				tb_port_dbg(port, "link not up after reset\n");
+				break;
+			}
+			msleep(20);
+		}
+	}
+}
+
+static void tb_switch_hotplug_disable(struct tb_switch *sw)
+{
+	struct tb_port *port;
+
+	tb_plug_events_active(sw, false);
+	tb_switch_for_each_port(sw, port) {
+		if (!port->cap_usb4 || !tb_port_should_reconnect(port))
+			continue;
+		usb4_port_hotplug_disable(port);
+	}
+}
+
+static void tb_switch_hotplug_enable(struct tb_switch *sw)
+{
+	struct tb_port *port;
+
+	tb_switch_for_each_port(sw, port) {
+		if (!port->cap_usb4 || !tb_port_should_reconnect(port))
+			continue;
+		usb4_port_hotplug_enable(port);
+	}
+	tb_plug_events_active(sw, true);
+}
+
 static int tb_switch_reset_host(struct tb_switch *sw)
 {
 	if (sw->generation > 1) {
 		int ret;
 
+		tb_switch_hotplug_disable(sw);
 		ret = tb_switch_reset_host_ports(sw);
+		if (!ret)
+			tb_switch_wait_for_reconnect(sw);
+		tb_switch_hotplug_enable(sw);
 		if (ret)
 			return ret;
 	} else {
@@ -3618,6 +3685,15 @@ int tb_switch_resume(struct tb_switch *sw, bool runtime)
 	/* Disable wakes */
 	tb_switch_set_wake(sw, 0, true);
 
+	/*
+	 * Restore link back to dual if it was asymmetric. This will be
+	 * updated once DP tunnels are created.
+	 */
+	if (sw->link_width > TB_LINK_WIDTH_DUAL)
+		sw->link_width = TB_LINK_WIDTH_DUAL;
+
+	tb_switch_clx_init(sw);
+
 	err = tb_switch_tmu_init(sw);
 	if (err)
 		return err;
diff --git a/drivers/thunderbolt/tb.c b/drivers/thunderbolt/tb.c
index 6a11d686bdf1..6c1ca4b5ffdd 100644
--- a/drivers/thunderbolt/tb.c
+++ b/drivers/thunderbolt/tb.c
@@ -57,6 +57,7 @@ MODULE_PARM_DESC(asym_threshold,
  *		    events and exit if this is not set (it needs to
  *		    acquire the lock one more time). Used to drain wq
  *		    after cfg has been paused.
+ * @rescan_on_complete: Topology rescan is needed in tb_complete()
  * @remove_work: Work used to remove any unplugged routers after
  *		 runtime resume
  * @tunnel_dp_work: Work used to delay DP tunnel creation
@@ -66,6 +67,7 @@ struct tb_cm {
 	struct list_head tunnel_list;
 	struct list_head dp_resources;
 	bool hotplug_active;
+	bool rescan_on_complete;
 	struct delayed_work remove_work;
 	struct delayed_work tunnel_dp_work;
 	struct tb_bandwidth_group groups[MAX_GROUPS];
@@ -3201,21 +3203,24 @@ static void tb_free_unplugged_xdomains(struct tb_switch *sw)
 	}
 }
 
-static int tb_resume_noirq(struct tb *tb)
+static int tb_resume_noirq(struct tb *tb, bool hibernate)
 {
 	struct tb_cm *tcm = tb_priv(tb);
 	struct tb_tunnel *tunnel, *n;
-	unsigned int usb3_delay = 0;
-	LIST_HEAD(tunnels);
+	bool usb3_delay = false;
 
 	tb_dbg(tb, "resuming...\n");
 
 	/*
-	 * For non-USB4 hosts (Apple systems) remove any PCIe devices
-	 * the firmware might have setup.
+	 * Resume from suspend-to-disk or non-USB4 Apple systems reset
+	 * the topology to get rid of the tunnels the restore kernel or
+	 * boot firmware created.
 	 */
-	if (!tb_switch_is_usb4(tb->root_switch))
+	if (hibernate || !tb_switch_is_usb4(tb->root_switch)) {
 		tb_switch_reset(tb->root_switch);
+		/* Plug events were masked over domain reset */
+		tcm->rescan_on_complete = true;
+	}
 
 	tb_switch_resume(tb->root_switch, false);
 	tb_free_invalid_tunnels(tb);
@@ -3223,27 +3228,23 @@ static int tb_resume_noirq(struct tb *tb)
 	tb_free_unplugged_xdomains(tb->root_switch);
 	tb_restore_children(tb->root_switch);
 
-	/*
-	 * If we get here from suspend to disk the boot firmware or the
-	 * restore kernel might have created tunnels of its own. Since
-	 * we cannot be sure they are usable for us we find and tear
-	 * them down.
-	 */
-	tb_switch_discover_tunnels(tb->root_switch, &tunnels, false);
-	list_for_each_entry_safe_reverse(tunnel, n, &tunnels, list) {
-		if (tb_tunnel_is_usb3(tunnel))
-			usb3_delay = 500;
-		tb_tunnel_deactivate(tunnel);
-		tb_tunnel_put(tunnel);
+	if (hibernate) {
+		tb_disconnect_and_release_dp(tb);
+		tb_add_dp_resources(tb->root_switch);
+		tb_switch_exit_redrive(tb->root_switch);
+		usb3_delay = true;
 	}
 
 	/* Re-create our tunnels now */
 	list_for_each_entry_safe(tunnel, n, &tcm->tunnel_list, list) {
-		/* USB3 requires delay before it can be re-activated */
-		if (tb_tunnel_is_usb3(tunnel)) {
-			msleep(usb3_delay);
-			/* Only need to do it once */
-			usb3_delay = 0;
+		/*
+		 * USB3 requires delay before it can be re-activated.
+		 * If we have it saved assume the restore kernel had it
+		 * as well.
+		 */
+		if (usb3_delay && tb_tunnel_is_usb3(tunnel)) {
+			msleep(500);
+			usb3_delay = false;
 		}
 		tb_tunnel_activate(tunnel);
 		if (tb_tunnel_is_pci(tunnel))
@@ -3283,14 +3284,19 @@ static int tb_thaw_noirq(struct tb *tb)
 
 static void tb_complete(struct tb *tb)
 {
+	struct tb_cm *tcm = tb_priv(tb);
+	bool rescan;
+
+	rescan = tb_domain_unregister_unplugged_xdomains(tb);
+
+	guard(mutex)(&tb->lock);
 	/*
-	 * Unregister unplugged XDomains and if there is a case where
-	 * another domain is swapped in place of unplugged XDomain we
-	 * need to run another rescan.
+	 * Rescan if an unplugged XDomain was replaced by another
+	 * domain, or after host router reset.
 	 */
-	if (tb_domain_unregister_unplugged_xdomains(tb)) {
-		scoped_guard(mutex, &tb->lock)
-			tb_scan_switch(tb->root_switch);
+	if (rescan || tcm->rescan_on_complete) {
+		tcm->rescan_on_complete = false;
+		tb_scan_switch(tb->root_switch);
 	}
 }
 
diff --git a/drivers/thunderbolt/tb.h b/drivers/thunderbolt/tb.h
index 727e33992e41..7f47a5c3c0d3 100644
--- a/drivers/thunderbolt/tb.h
+++ b/drivers/thunderbolt/tb.h
@@ -513,7 +513,7 @@ struct tb_cm_ops {
 	void (*stop)(struct tb *tb);
 	void (*deinit)(struct tb *tb);
 	int (*suspend_noirq)(struct tb *tb);
-	int (*resume_noirq)(struct tb *tb);
+	int (*resume_noirq)(struct tb *tb, bool hibernate);
 	int (*suspend)(struct tb *tb);
 	int (*freeze_noirq)(struct tb *tb);
 	int (*thaw_noirq)(struct tb *tb);
@@ -777,7 +777,7 @@ struct tb *tb_domain_alloc(struct tb_nhi *nhi, int timeout_msec, size_t privsize
 int tb_domain_add(struct tb *tb, bool reset);
 void tb_domain_remove(struct tb *tb);
 int tb_domain_suspend_noirq(struct tb *tb);
-int tb_domain_resume_noirq(struct tb *tb);
+int tb_domain_resume_noirq(struct tb *tb, bool hibernate);
 int tb_domain_suspend(struct tb *tb);
 int tb_domain_freeze_noirq(struct tb *tb);
 int tb_domain_thaw_noirq(struct tb *tb);
diff --git a/drivers/thunderbolt/tunnel.c b/drivers/thunderbolt/tunnel.c
index 90bc6e42d89b..9d831a7a1ced 100644
--- a/drivers/thunderbolt/tunnel.c
+++ b/drivers/thunderbolt/tunnel.c
@@ -1090,6 +1090,24 @@ static int tb_dp_wait_dprx(struct tb_tunnel *tunnel, int timeout_msec)
 	return -ETIMEDOUT;
 }
 
+static int tb_dp_dprx_poll(struct tb_tunnel *tunnel)
+{
+	int ret;
+
+	ret = tb_dp_wait_dprx(tunnel, TB_DPRX_WAIT_TIMEOUT);
+	switch (ret) {
+	case 0:
+		return 0;
+	case -ESHUTDOWN:
+		/* Control channel is frozen, ignore the timeout */
+		return -EINPROGRESS;
+	default:
+		if (ktime_before(ktime_get(), tunnel->dprx_timeout))
+			return -EINPROGRESS;
+		return ret;
+	}
+}
+
 static void tb_dp_dprx_work(struct work_struct *work)
 {
 	struct tb_tunnel *tunnel = container_of(work, typeof(*tunnel), dprx_work.work);
@@ -1103,17 +1121,19 @@ static void tb_dp_dprx_work(struct work_struct *work)
 	 */
 	mutex_lock(&tb->lock);
 	if (!tunnel->dprx_canceled) {
-		if (tb_dp_is_usb4(tunnel->src_port->sw) &&
-		    tb_dp_wait_dprx(tunnel, TB_DPRX_WAIT_TIMEOUT)) {
-			if (ktime_before(ktime_get(), tunnel->dprx_timeout)) {
+		int ret = 0;
+
+		if (tb_dp_is_usb4(tunnel->src_port->sw)) {
+			ret = tb_dp_dprx_poll(tunnel);
+			if (ret == -EINPROGRESS) {
 				queue_delayed_work(tb->wq, &tunnel->dprx_work,
-						   msecs_to_jiffies(TB_DPRX_POLL_DELAY));
+					msecs_to_jiffies(TB_DPRX_POLL_DELAY));
 				mutex_unlock(&tb->lock);
 				return;
 			}
-		} else {
-			tb_tunnel_set_active(tunnel, true);
 		}
+		if (!ret)
+			tb_tunnel_set_active(tunnel, true);
 	}
 	tunnel->callback(tunnel);
 	mutex_unlock(&tb->lock);
-- 
2.50.1


Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.19
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795108357;
	b=aLocDnbp0OTlnaJWwFEiiKA+dO64OljnJkfvgJmWNW01aGujnDxQ6TdTVGCgZcmn9f7L
	 8SGRyjmd6IP14LundnRvDni92Nzpt2DkkMU5d5huGMvZ+wpCdwDMUdqw8a3jAkV13+xcb
	 2IB98CnMNkVXB749AFnMsg9AcgNAqgMOG4nw8+/dIUfwUKd9305HiDQHcDtNiySJU0ezO
	 BoOHaOsfs0L1HJwGxaposVq9kyCSBH6S4eVL8N2fwZPhJF0q6BhzI61TZt4D63YW7rFk0
	 TmMOEIwzdlhfrDaDrZRIeOfiSoojARkyr3puGfijK69tlRSq9MwBUq/7UglRbb8YSsQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795108357;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=gmBJgQut5UpwQuKZJ19NLUC7DJH58zYLJpKo1HUQ+Ug=;
	b=U/K11hUav2NxfNXrpMXR6vkGcOxfsYZ5bRXtySfXjskL3uUSPVoZiFl6tGxVqvg0VNNx
	 H7Fbse8uakWQu6L9CxBb8WtjewaA6cWm8g28SC6mevo6ZfDVq3sYr9ytI1SU5x9o8P/W9
	 Gim+BoPoplW3C3oQpoJbCbziU2YWczaZTrSBlrQ6vA2VsRV5r5blMwbOgEgd9m6hYBl41
	 +yAz/TveXQlAEESVqLbE1bMns7wa7FOmUowtVSBaq6QRPtQMfB0QyiAs/6fWQFNucXg51
	 uIBxt6vb57+T7O97dpcV28BlGIVjboWe4ReKAc2qm1g573xr2t8Q66LrcKxNbpmLCcQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ZSu++My4;
	arc=none smtp.remote-ip=198.175.65.19
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BD30606A602
	for <linux-usb@vger.kernel.org>; Thu, 19 Nov 2026 17:12:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4BD30606A602
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ZSu++My4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795108357; x=1826644357;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=l5XmzXpLFN/AaLc+rRWwg8ekAdDL7BVdvPGOJda3VY8=;
  b=ZSu++My4vxRCh02AooNDWUxA1zP63PfUaGecWXt3iT0sMXK/Q4VTNjc5
   49xglzGahfSYPMKv3ZBkUWyGrXbm6whea5FYB0S0wVho+kbJ3pWEwfBCj
   o0hWY2GII6CyGCNtOW7gi/x9XC1DFRyw9zPOtKP/iELuMvRw5gTINof1W
   dJF0Cw95bNMnJxf4wwZ+umnGtGosHrKmQGFLGH0jvCL4M/iecM+7HWKUU
   jbdRa/7Zaj8xolOC9GcdYDO6IWBnTe4BMH8DB4vrSXQp8qx/+ONlKuvq8
   dv+/UeNlzR36fm1xgyn3WzXzdILAzEnmKsBZdnEX1oN9jVZjmtdxgnucy
   Q==;
X-CSE-ConnectionGUID: Af2SbhN6THiVGtZlvFE6Hg==
X-CSE-MsgGUID: tl+Cnrz/RhageTcHkAJSqw==
X-IronPort-AV: E=McAfee;i="6800,10657,11971"; a="4012985"
X-IronPort-AV: E=Sophos;i="6.27,221,1787036400"; 
   d="scan'208";a="4012985"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2026 09:12:36 -0800
X-CSE-ConnectionGUID: 1GR6rFuYTfSkddg/bRl35A==
X-CSE-MsgGUID: +RApTVxNQ9WGNmlTl/nzPw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,221,1787036400"; 
   d="scan'208";a="10575062"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa005.fm.intel.com with ESMTP; 19 Nov 2026 09:12:34 -0800
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id 04E589E; Thu, 19 Nov 2026 18:12:33 +0100 (CET)
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: linux-usb@vger.kernel.org
Cc: Yehezkel Bernat <YehezkelShB@gmail.com>,
	Lukas Wunner <lukas@wunner.de>,
	Andreas Noever <andreas.noever@gmail.com>,
	Gil Fine <gil.fine@linux.intel.com>,
	Rene Sapiens <rene.sapiens@linux.intel.com>,
	Pooja Katiyar <pooja.katiyar@intel.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH 03/18] thunderbolt: Delay re-pairing DP IN/OUT if DPRX negotiation fails
Date: Thu, 19 Nov 2026 18:12:17 +0100
Message-ID: <20261119171232.1616316-4-mika.westerberg@linux.intel.com>
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

If DPRX negotiation fails, for example the DP IN that was tried does not
have cable connected to the add-in-card, we call tb_dp_resource_unavailable()
and that then tries to pair the DP OUT with another DP IN. However, at
that point the existing tunnel may be still referenced so its HopIDs are
reserved and that causes the new tunnel activation to fail.

Instead schedule a worker that runs on the same work queue as the DPRX
work so the reference should be dropped at that point.

Fixes: 67600ccfc4f3 ("thunderbolt: Fix use-after-free in tb_dp_dprx_work")
Signed-off-by: Mika Westerberg (Intel) <westeri@kernel.org>
---
 drivers/thunderbolt/tb.c | 24 +++++++++++++++++++++++-
 1 file changed, 23 insertions(+), 1 deletion(-)

diff --git a/drivers/thunderbolt/tb.c b/drivers/thunderbolt/tb.c
index 680ed23db0bf..acad8461011c 100644
--- a/drivers/thunderbolt/tb.c
+++ b/drivers/thunderbolt/tb.c
@@ -59,6 +59,7 @@ MODULE_PARM_DESC(asym_threshold,
  *		    after cfg has been paused.
  * @remove_work: Work used to remove any unplugged routers after
  *		 runtime resume
+ * @tunnel_dp_work: Work used to delay DP tunnel creation
  * @groups: Bandwidth groups used in this domain.
  */
 struct tb_cm {
@@ -66,6 +67,7 @@ struct tb_cm {
 	struct list_head dp_resources;
 	bool hotplug_active;
 	struct delayed_work remove_work;
+	struct delayed_work tunnel_dp_work;
 	struct tb_bandwidth_group groups[MAX_GROUPS];
 };
 
@@ -2128,6 +2130,23 @@ static void tb_tunnel_dp(struct tb *tb)
 		tb_dbg(tb, "no suitable DP IN adapter available, not tunneling\n");
 }
 
+static void tb_tunnel_dp_work(struct work_struct *work)
+{
+	struct tb_cm *tcm = container_of(work, struct tb_cm,
+					 tunnel_dp_work.work);
+	struct tb *tb = tcm_to_tb(tcm);
+
+	pm_runtime_get_sync(&tb->dev);
+
+	scoped_guard(mutex, &tb->lock) {
+		if (tcm->hotplug_active)
+			tb_tunnel_dp(tb);
+	}
+
+	pm_runtime_mark_last_busy(&tb->dev);
+	pm_runtime_put_autosuspend(&tb->dev);
+}
+
 static void tb_enter_redrive(struct tb_port *port)
 {
 	struct tb_switch *sw = port->sw;
@@ -2205,6 +2224,7 @@ static void tb_switch_exit_redrive(struct tb_switch *sw)
 static void tb_dp_resource_unavailable(struct tb *tb, struct tb_port *port,
 				       const char *reason)
 {
+	struct tb_cm *tcm = tb_priv(tb);
 	struct tb_port *in, *out;
 	struct tb_tunnel *tunnel;
 
@@ -2230,7 +2250,7 @@ static void tb_dp_resource_unavailable(struct tb *tb, struct tb_port *port,
 	 * to create another tunnel.
 	 */
 	tb_recalc_estimated_bandwidth(tb);
-	tb_tunnel_dp(tb);
+	queue_delayed_work(tb->wq, &tcm->tunnel_dp_work, 0);
 }
 
 static void tb_dp_resource_available(struct tb *tb, struct tb_port *port)
@@ -2966,6 +2986,7 @@ static void tb_stop(struct tb *tb)
 	struct tb_tunnel *n;
 
 	cancel_delayed_work(&tcm->remove_work);
+	cancel_delayed_work(&tcm->tunnel_dp_work);
 	/* tunnels are only present after everything has been initialized */
 	list_for_each_entry_safe(tunnel, n, &tcm->tunnel_list, list) {
 		/*
@@ -3361,6 +3382,7 @@ struct tb *tb_probe(struct tb_nhi *nhi)
 	INIT_LIST_HEAD(&tcm->tunnel_list);
 	INIT_LIST_HEAD(&tcm->dp_resources);
 	INIT_DELAYED_WORK(&tcm->remove_work, tb_remove_work);
+	INIT_DELAYED_WORK(&tcm->tunnel_dp_work, tb_tunnel_dp_work);
 	tb_init_bandwidth_groups(tcm);
 
 	tb_dbg(tb, "using software connection manager\n");
-- 
2.50.1


Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.12
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795620672;
	b=ZK6ketMXMTOJ2HIZf1jwV+9Pn8U5akd4z4QhDWoIX3PKzgQ3lVnS9jjgU4pJO2fD22bs
	 bqqmCsPkJBRY1jMICukf3hdWMwjor2wGuGh6fIhWYyWrZ/auMpbU6ciZu33s41A5Ao3Db
	 FIuWsNYLKX5XArt/G/eIpvdaVStfU4maw5onmjlW97Z+/8UiscbkoSpIybuerNd2PSbTF
	 OmHYaNLv+WYq44E2qPpNUGcalfxMvc31iHdrxJbLuXE7+UimGDekaJ+9N4d/GlGNZkgKC
	 KuQ23qydv9FTcxd1TYpNN32WNa9qd2+COxeLpVmtleG3bJLL69AulwjiBZMWT872DCQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795620672;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=gykUi/J6B8D+wkbsGpZf+dJW+Q/DEGg3dBEQz+7aSaA=;
	b=09vSd27QmA3ISroG95oJtljejChelIrz7MB6Ea3eUW/LSMYncNpNuNt03VdK5+mUsGlI
	 fVAb4VjzVA+Hxtep+0yWRrl6QjKUJsQXnbEntDJ2E7lygF0bKzKK8rXj4VQuKHBLSzfhL
	 BQMF5rm3Hxq+Mctpu0Sz9GoyfWJctcordcydHXPAjkXlXrB0MJnM0OePSIJqMQMOuIPuv
	 8Oet7v7rjJphyg2NtX1g1I0bj/vKu8OxgBt9U5Nb9ifb8UqDjNVqaTPh2hkXWK2OVFvIG
	 QQRlgR+6Cs6LkJ9OH7n7h7QctEsyF0LcjSKd6j5xyMdk5rfnLLEEmhoNHuv24AHrQ7w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ZQH2DIfI;
	arc=none smtp.remote-ip=198.175.65.12
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B367B606A330
	for <linux-usb@vger.kernel.org>; Wed, 25 Nov 2026 15:31:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B367B606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ZQH2DIfI
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795620672; x=1827156672;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=VTJ0RbmBZxdAHWUBKWIdkYCxJTBA5l/HvvVP4paG7HY=;
  b=ZQH2DIfIZlE922IRrSplB4K3tPZso8QjHZJPYUc114xf1hCd4zJKuqnR
   tHDbHLKT94h8nqowBzC6HEWjG+7Ko2WBZu4UZbdGDUCvNN97jxTIOhHOp
   gNinu1l1P4LBGP9opIU4qY2zxQh+LxYpZd5i0iytpeK6IuZweizVNoAOQ
   pjeO4Zczgiu1hPA29YAPM+IIpSUAOmt1qsCJS6bHIdPxUa4UQMlQpBVBL
   IqGQvydafxe3Khjf9wf9yXho0ure3wWrxhSeBqjQGh8+zRFZdQutgtGfi
   3X9LFnkoL+LjJlSI3F4FMx0kKiG/8qtqbCZJob/0hJO6Qz86w/Ub3ElAG
   g==;
X-CSE-ConnectionGUID: BxdVMb2aR76pbsU4xFcjEw==
X-CSE-MsgGUID: y549jdmOSpuLFAsFMVML5g==
X-IronPort-AV: E=McAfee;i="6800,10657,11977"; a="4408246"
X-IronPort-AV: E=Sophos;i="6.27,233,1787036400"; 
   d="scan'208";a="4408246"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2026 07:26:28 -0800
X-CSE-ConnectionGUID: eR4BzctqT7iP1Ik0frlUDA==
X-CSE-MsgGUID: u1Cvg64XT+KGGohVsgJmng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,233,1787036400"; 
   d="scan'208";a="13938532"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa013.fm.intel.com with ESMTP; 25 Nov 2026 07:26:24 -0800
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id 09CB399; Wed, 25 Nov 2026 16:26:23 +0100 (CET)
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: linux-usb@vger.kernel.org
Cc: Yehezkel Bernat <YehezkelShB@gmail.com>,
	Lukas Wunner <lukas@wunner.de>,
	Andreas Noever <andreas.noever@gmail.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Mika Westerberg <westeri@kernel.org>
Subject: [PATCH 1/9] thunderbolt: Add and remove XDomain services outside of the state work
Date: Wed, 25 Nov 2026 16:26:14 +0100
Message-ID: <20261125152623.456054-2-mika.westerberg@linux.intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20261125152623.456054-1-mika.westerberg@linux.intel.com>
References: <20261125152623.456054-1-mika.westerberg@linux.intel.com>
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

The XDomain services are registered and unregistered from the state
work, which means the service driver probe and remove callbacks are
called from there too. The state work is cancelled synchronously in
tb_xdomain_remove() which is called with tb->lock held, so if a service
driver calls anything that takes tb->lock, such as
tb_xdomain_disable_paths() they end up waiting for each other.

Fix this by moving the service enumeration into a separate work that is
only waited for in tb_xdomain_unregister(), which is called without
tb->lock.

Fixes: a8937f35cf39 ("thunderbolt: Remove XDomain from the bus without holding tb->lock")
Signed-off-by: Mika Westerberg (Intel) <westeri@kernel.org>
---
 drivers/thunderbolt/xdomain.c | 53 ++++++++++++++++++++++++++---------
 include/linux/thunderbolt.h   |  5 ++++
 2 files changed, 44 insertions(+), 14 deletions(-)

diff --git a/drivers/thunderbolt/xdomain.c b/drivers/thunderbolt/xdomain.c
index e5a962537920..55e17f4e35dc 100644
--- a/drivers/thunderbolt/xdomain.c
+++ b/drivers/thunderbolt/xdomain.c
@@ -1164,15 +1164,14 @@ static void __unregister_service(struct device *dev)
 
 static int remove_missing_service(struct device *dev, void *data)
 {
-	struct tb_xdomain *xd = data;
+	struct tb_property_dir *dir = data;
 	struct tb_service *svc;
 
 	svc = tb_to_service(dev);
 	if (!svc)
 		return 0;
 
-	if (!tb_property_find(xd->remote_properties, svc->key,
-			      TB_PROPERTY_TYPE_DIRECTORY))
+	if (!tb_property_find(dir, svc->key, TB_PROPERTY_TYPE_DIRECTORY))
 		__unregister_service(dev);
 
 	return 0;
@@ -1223,7 +1222,8 @@ static int populate_service(struct tb_service *svc,
 	return 0;
 }
 
-static void enumerate_services(struct tb_xdomain *xd)
+static void enumerate_services(struct tb_xdomain *xd,
+			       struct tb_property_dir *dir)
 {
 	struct tb_service *svc;
 	struct tb_property *p;
@@ -1234,10 +1234,10 @@ static void enumerate_services(struct tb_xdomain *xd)
 	 * First remove all services that are not available anymore in
 	 * the updated property block.
 	 */
-	device_for_each_child_reverse(&xd->dev, xd, remove_missing_service);
+	device_for_each_child_reverse(&xd->dev, dir, remove_missing_service);
 
 	/* Then re-enumerate properties creating new services as we go */
-	tb_property_for_each(xd->remote_properties, p) {
+	tb_property_for_each(dir, p) {
 		if (p->type != TB_PROPERTY_TYPE_DIRECTORY)
 			continue;
 
@@ -1544,7 +1544,6 @@ static int tb_xdomain_get_properties(struct tb_xdomain *xd)
 {
 	struct tb_property_dir *dir;
 	struct tb *tb = xd->tb;
-	bool update = false;
 	u32 *block = NULL;
 	u32 gen = 0;
 	int ret;
@@ -1570,7 +1569,8 @@ static int tb_xdomain_get_properties(struct tb_xdomain *xd)
 	mutex_lock(&xd->lock);
 
 	/* Only accept newer generation properties */
-	if (xd->remote_properties && gen <= xd->remote_property_block_gen) {
+	if (xd->remote_properties && gen <= xd->remote_property_block_gen &&
+	    !xd->remote_properties_stale) {
 		ret = 0;
 		goto err_free_block;
 	}
@@ -1589,13 +1589,12 @@ static int tb_xdomain_get_properties(struct tb_xdomain *xd)
 	}
 
 	/* Release the existing one */
-	if (xd->remote_properties) {
+	if (xd->remote_properties)
 		tb_property_free_dir(xd->remote_properties);
-		update = true;
-	}
 
 	xd->remote_properties = dir;
 	xd->remote_property_block_gen = gen;
+	xd->remote_properties_stale = false;
 
 	tb_xdomain_update_link_attributes(xd);
 
@@ -1608,7 +1607,7 @@ static int tb_xdomain_get_properties(struct tb_xdomain *xd)
 	 * bus and let userspace know about it. If the device is already
 	 * registered, we notify the userspace that it has changed.
 	 */
-	if (!update) {
+	if (!device_is_registered(&xd->dev)) {
 		/*
 		 * Now disable lane 1 if bonding was not enabled. Do
 		 * this only if bonding was possible at the beginning
@@ -1643,7 +1642,7 @@ static int tb_xdomain_get_properties(struct tb_xdomain *xd)
 		kobject_uevent(&xd->dev.kobj, KOBJ_CHANGE);
 	}
 
-	enumerate_services(xd);
+	queue_work(system_long_wq, &xd->services_work);
 	return 0;
 
 err_free_dir:
@@ -1842,6 +1841,24 @@ static void tb_xdomain_state_work(struct work_struct *work)
 			   msecs_to_jiffies(XDOMAIN_DEFAULT_TIMEOUT));
 }
 
+static void tb_xdomain_services_work(struct work_struct *work)
+{
+	struct tb_xdomain *xd = container_of(work, typeof(*xd), services_work);
+	struct tb_property_dir *dir;
+
+	/* The state work may replace the remote properties meanwhile */
+	scoped_guard(mutex, &xd->lock) {
+		if (xd->removing)
+			return;
+		dir = tb_property_copy_dir(xd->remote_properties);
+		if (!dir)
+			return;
+	}
+
+	enumerate_services(xd, dir);
+	tb_property_free_dir(dir);
+}
+
 static void tb_xdomain_properties_changed(struct work_struct *work)
 {
 	struct tb_xdomain *xd = container_of(work, typeof(*xd),
@@ -2040,7 +2057,13 @@ static void tb_xdomain_release(struct device *dev)
 
 static int __maybe_unused tb_xdomain_suspend(struct device *dev)
 {
-	stop_handshake(tb_to_xdomain(dev));
+	struct tb_xdomain *xd = tb_to_xdomain(dev);
+
+	stop_handshake(xd);
+	if (cancel_work_sync(&xd->services_work)) {
+		guard(mutex)(&xd->lock);
+		xd->remote_properties_stale = true;
+	}
 	return 0;
 }
 
@@ -2151,6 +2174,7 @@ struct tb_xdomain *tb_xdomain_alloc(struct tb *tb, struct device *parent,
 	INIT_DELAYED_WORK(&xd->state_work, tb_xdomain_state_work);
 	INIT_DELAYED_WORK(&xd->properties_changed_work,
 			  tb_xdomain_properties_changed);
+	INIT_WORK(&xd->services_work, tb_xdomain_services_work);
 	atomic_set(&xd->ntunnels, 0);
 
 	xd->local_uuid = kmemdup(local_uuid, sizeof(uuid_t), GFP_KERNEL);
@@ -2265,6 +2289,7 @@ void tb_xdomain_unregister(struct tb_xdomain *xd)
 {
 	lockdep_assert_not_held(&xd->tb->lock);
 
+	cancel_work_sync(&xd->services_work);
 	device_for_each_child_reverse(&xd->dev, xd, unregister_service);
 
 	dev_info(&xd->dev, "host disconnected\n");
diff --git a/include/linux/thunderbolt.h b/include/linux/thunderbolt.h
index 57502da29080..48ae996a779c 100644
--- a/include/linux/thunderbolt.h
+++ b/include/linux/thunderbolt.h
@@ -226,6 +226,8 @@ enum tb_link_width {
  * @local_property_block_len: Length of the @local_property_block in dwords
  * @remote_properties: Properties exported by the remote domain
  * @remote_property_block_gen: Generation of @remote_properties
+ * @remote_properties_stale: Accept the next properties even if
+ *			     @remote_property_block_gen has not changed
  * @state: Next XDomain discovery state to run
  * @state_work: Work used to run the next state
  * @state_retries: Number of retries remain for the state
@@ -233,6 +235,7 @@ enum tb_link_width {
  *			     our properties have changed
  * @properties_changed_retries: Number of times left to send properties
  *				changed notification
+ * @services_work: Work used to add and remove the services
  * @bonding_possible: True if lane bonding is possible on local side
  * @target_link_width: Target link width from the remote host
  * @ntunnels: Keeps track of how many tunnels go through this XDomain
@@ -275,11 +278,13 @@ struct tb_xdomain {
 	u32 local_property_block_len;
 	struct tb_property_dir *remote_properties;
 	u32 remote_property_block_gen;
+	bool remote_properties_stale;
 	int state;
 	struct delayed_work state_work;
 	int state_retries;
 	struct delayed_work properties_changed_work;
 	int properties_changed_retries;
+	struct work_struct services_work;
 	bool bonding_possible;
 	u8 target_link_width;
 	atomic_t ntunnels;
-- 
2.50.1


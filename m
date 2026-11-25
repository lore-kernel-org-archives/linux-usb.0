Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.12
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795620671;
	b=3ahDaHPbKwtSjspHqNOU9Se/GehS7rk/X5nR/KNiK8fm7SYbqOHbx8162wW/vQUb3r16
	 wtgfrE8LjpkNCaGPyMLqFJHmMhVCD/EyIOJA0JlXSm5lu3c7sntEP9nzHu09xqGlTzyOA
	 yOW9sWP1pI20du/UuAWEOwe1HeRIeQnSJPn9szqM0pG+NcBBG1JbmwU1luiqcivTm/ON0
	 ZV9NEK+I/TivlfofwDbjxVtcowA3EfX82wxxwHsjbQ8hFaq4Tgy1aGZEy1G/QUX+SZWUh
	 m3pUS6pJwTPgvrlR3kh3OU743E2/LGGvinErlUcCx+FEp3mLIRO3cXRQQhF0/26GmZA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795620671;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Edy/WYXX2reALz3tjnQ8NIejVvlEJF2xDswptBKyWx4=;
	b=krLOsldxwARXcwrG7fM6FYB17/uOqcxeZcNDz54AZ013q6OXvPn/3WIim57wdO7CVzRI
	 QgB0Mk+YfYcSQETwE7Fz2IS8lapYSR112L5z4+ft/jjSM93GDb+CnLqn0dDxCrFNBeTlL
	 yo5n5A9p9KfEtdCbOZ8U13dPTMPlAGIz9y+Zyscq0JXqH8QGlagKTMCCDzD1BwjADs4oX
	 bsEhIyZESZPHQbesyQNL53y001h4J5rJV/4ONazpssvReKsJlBJUpHjC98duUnwAsevAA
	 hMFxETwfuIeE/CfKbb6UzvxzL6HVhdL10ZS5FFQQIz90O4+zIMVk2y6VtEGSd1ykfGg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=h5Hg7TPy;
	arc=none smtp.remote-ip=198.175.65.12
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FD04606A32E
	for <linux-usb@vger.kernel.org>; Wed, 25 Nov 2026 15:31:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4FD04606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=h5Hg7TPy
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795620672; x=1827156672;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=gpyhZ6+Nv90SD44LCa6sd//sKo49lvwWFXaybbrm9Vo=;
  b=h5Hg7TPyiCyK2I6Mo6LSJXrZuE152dkbUwR1E4uz3++2pMDODxCoP1cC
   K/nYSHjvorEMoP4c1FmlrLxvRbjMpLEwOhGc+9FYNM94L3foqChi7Jh/R
   wPCnM6z2VDEByN71Ya3SIaQPLPmA1d10xDZrK9YRuoh7GLpqj0tnT+C21
   qhsLQZKiJVQ0jIUYJkT9iGkhJqzHJ47THFSdnTqmxCpIevdvXqWf/3Vt1
   tGmZcEeE5Y5UBQT3NeN4KNTR5Yh+i2Mvx0jzZZIVfFCDEV5YKvxnzThUi
   sEM4DvvcyFFQPE3Dz4k8ndMFLdK11N8Ko0pRmb2BgwSEJFU/vODw/pxiN
   A==;
X-CSE-ConnectionGUID: Ut+P5gBzQUi4u+CFcOb6TQ==
X-CSE-MsgGUID: avucYS8pTgaq/dyjCULsmw==
X-IronPort-AV: E=McAfee;i="6800,10657,11977"; a="4408241"
X-IronPort-AV: E=Sophos;i="6.27,233,1787036400"; 
   d="scan'208";a="4408241"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2026 07:26:28 -0800
X-CSE-ConnectionGUID: pTFvO1ERRzO7dd7wmHGfuQ==
X-CSE-MsgGUID: eTtPaO/1Q7mbQH2TSr6PWw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,233,1787036400"; 
   d="scan'208";a="13938530"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa013.fm.intel.com with ESMTP; 25 Nov 2026 07:26:24 -0800
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id 0D1F49D; Wed, 25 Nov 2026 16:26:23 +0100 (CET)
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: linux-usb@vger.kernel.org
Cc: Yehezkel Bernat <YehezkelShB@gmail.com>,
	Lukas Wunner <lukas@wunner.de>,
	Andreas Noever <andreas.noever@gmail.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Mika Westerberg <westeri@kernel.org>
Subject: [PATCH 2/9] thunderbolt: Unregister XDomains when the domain is removed
Date: Wed, 25 Nov 2026 16:26:15 +0100
Message-ID: <20261125152623.456054-3-mika.westerberg@linux.intel.com>
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

tb_xdomain_remove() only stops the handshake and leaves the XDomain
registered to the bus. Unregistering happens separately without tb->lock
by tb_domain_unregister_unplugged_xdomains() but this is never called
when the domain itself is removed. This may cause adding XDomains later
on fail like:

  sysfs: cannot create duplicate filename '/bus/thunderbolt/devices/0-1'
  thunderbolt 0-1: failed to add XDomain device

Fix this by first unbinding the service drivers in tb_domain_remove(),
and then unregistering the XDomains once tb->lock has been released and
the workqueue has been flushed (the work items unregister the unplugged
XDomains too, so this avoids doing it twice).

Fixes: a8937f35cf39 ("thunderbolt: Remove XDomain from the bus without holding tb->lock")
Signed-off-by: Mika Westerberg (Intel) <westeri@kernel.org>
---
 drivers/thunderbolt/domain.c  | 34 ++++++++++++++++++++++++++++++++++
 drivers/thunderbolt/xdomain.c |  2 +-
 include/linux/thunderbolt.h   |  3 +++
 3 files changed, 38 insertions(+), 1 deletion(-)

diff --git a/drivers/thunderbolt/domain.c b/drivers/thunderbolt/domain.c
index f9951d4311cb..61666e1a9b39 100644
--- a/drivers/thunderbolt/domain.c
+++ b/drivers/thunderbolt/domain.c
@@ -78,6 +78,9 @@ static int tb_service_probe(struct device *dev)
 	struct tb_service *svc = tb_to_service(dev);
 	struct tb_service_driver *driver;
 
+	if (READ_ONCE(tb_service_parent(svc)->tb->removing))
+		return -ENODEV;
+
 	driver = container_of(dev->driver, struct tb_service_driver, driver);
 
 	return driver->probe(svc);
@@ -491,6 +494,29 @@ int tb_domain_add(struct tb *tb, bool reset)
 	return ret;
 }
 
+static int unbind_service(struct device *dev, void *data)
+{
+	if (tb_is_service(dev))
+		device_release_driver(dev);
+	return 0;
+}
+
+static int unbind_services(struct device *dev, void *data)
+{
+	struct tb_xdomain *xd;
+	const struct tb *tb = data;
+
+	xd = tb_to_xdomain(dev);
+	if (xd && xd->tb == tb) {
+		scoped_guard(mutex, &xd->lock)
+			xd->removing = true;
+		cancel_work_sync(&xd->services_work);
+		device_for_each_child_reverse(&xd->dev, NULL, unbind_service);
+	}
+
+	return 0;
+}
+
 /**
  * tb_domain_remove() - Removes and releases a domain
  * @tb: Domain to remove
@@ -500,6 +526,13 @@ int tb_domain_add(struct tb *tb, bool reset)
  */
 void tb_domain_remove(struct tb *tb)
 {
+	WRITE_ONCE(tb->removing, true);
+	/*
+	 * Unbind service drivers now so they can do their cleanup with
+	 * the working control channel.
+	 */
+	bus_for_each_dev(&tb_bus_type, NULL, tb, unbind_services);
+
 	mutex_lock(&tb->lock);
 	if (tb->cm_ops->stop)
 		tb->cm_ops->stop(tb);
@@ -508,6 +541,7 @@ void tb_domain_remove(struct tb *tb)
 	mutex_unlock(&tb->lock);
 
 	flush_workqueue(tb->wq);
+	tb_domain_unregister_unplugged_xdomains(tb);
 
 	if (tb->cm_ops->deinit)
 		tb->cm_ops->deinit(tb);
diff --git a/drivers/thunderbolt/xdomain.c b/drivers/thunderbolt/xdomain.c
index 55e17f4e35dc..fceaa177b3c1 100644
--- a/drivers/thunderbolt/xdomain.c
+++ b/drivers/thunderbolt/xdomain.c
@@ -1848,7 +1848,7 @@ static void tb_xdomain_services_work(struct work_struct *work)
 
 	/* The state work may replace the remote properties meanwhile */
 	scoped_guard(mutex, &xd->lock) {
-		if (xd->removing)
+		if (READ_ONCE(xd->tb->removing) || xd->removing)
 			return;
 		dir = tb_property_copy_dir(xd->remote_properties);
 		if (!dir)
diff --git a/include/linux/thunderbolt.h b/include/linux/thunderbolt.h
index 48ae996a779c..03f315934e44 100644
--- a/include/linux/thunderbolt.h
+++ b/include/linux/thunderbolt.h
@@ -78,6 +78,8 @@ enum tb_security_level {
  * @index: Linux assigned domain number
  * @security_level: Current security level
  * @nboot_acl: Number of boot ACLs the domain supports
+ * @removing: Domain is about to be removed, no new XDomain services are
+ *	      allowed to be registered
  * @privdata: Private connection manager specific data
  */
 struct tb {
@@ -91,6 +93,7 @@ struct tb {
 	int index;
 	enum tb_security_level security_level;
 	size_t nboot_acl;
+	bool removing;
 	unsigned long privdata[];
 };
 
-- 
2.50.1


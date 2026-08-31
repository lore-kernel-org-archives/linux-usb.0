Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D0CC4156C5
	for <linux-usb@vger.kernel.org>; Mon, 31 Aug 2026 13:18:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788182327; cv=none; b=UIZvojiNWE5p9PPNGywYyWZicdc3qiX1XzwrRiunnx/mSEnEGUviK7+spqJKFNkPuSZccdvL+wEm7K5mvniK+xPRrVlP/aN0zUNv/MvF3ZxM5lQaqKa4bT7f8FXnhNs1bXaxEcQ1pux1r1/ThzEDY5ImzotvUCud07qweyI1f2M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788182327; c=relaxed/simple;
	bh=IMNpfsvu6VpaLryEueSl/GIIboKKP45iJjC0s9MLEKo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rcLo18DXntetIg6zbRpurx8D9gNPBzA66MLF7fYwkzst0p9ciNdoEpBauUt15NPWHJ39IDSn9x5vOnh0wh0xbdD8nl1YlfckiOX5u9fKSNgVFshDKb2u8azzmlS9lbeczWiQjciitjQDdrHLFVyrEVqKNrqvalcxs1n2fW3CjBU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KEVIJZfa; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KEVIJZfa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788182325; x=1819718325;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=IMNpfsvu6VpaLryEueSl/GIIboKKP45iJjC0s9MLEKo=;
  b=KEVIJZfa2iiKUupRsXax/SD0vCLyLh4Bz798ilbxt0RzqAlnJ9mWwrFN
   tweg2KNmzRqUu+E8ePcoOHU4mau6WPQP+C0d6io0KiRpPe4H+EJ1J5OZC
   AfZxbDB2J1tNabC0VA8CnDdyS1MNnZgrWdWmNFrW1dhuh6f07X/8zBMm2
   Twp8sM2pehlqJNYZRg3MZR42B7AV6KaQc96MNtKmwp0UIxr0PkyE4Dwdy
   a6i4PJzCb6I9Osdp13vRM61oxfBjipgDppHw8nYXyw0nr1OoZh2SmxLjz
   3g5/dusBLJ/zpnCvdyj/IMGc3cvdrLoF9eXsOdqiKK8ytd5X/NuUMx7Hk
   g==;
X-CSE-ConnectionGUID: 0S/sSRCZRz6kka/kPZFlhA==
X-CSE-MsgGUID: 9ezCGMUIS66l0I5WP1iusQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11891"; a="92276908"
X-IronPort-AV: E=Sophos;i="6.25,254,1779174000"; 
   d="scan'208";a="92276908"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2026 06:18:43 -0700
X-CSE-ConnectionGUID: UieM0P47ToOytlDmT6eyYw==
X-CSE-MsgGUID: WWbtjYI+REellHxG5L5kDQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,254,1779174000"; 
   d="scan'208";a="262662289"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa009.fm.intel.com with ESMTP; 31 Aug 2026 06:18:42 -0700
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id EC67C9D; Mon, 31 Aug 2026 15:18:40 +0200 (CEST)
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: linux-usb@vger.kernel.org
Cc: Yehezkel Bernat <YehezkelShB@gmail.com>,
	Lukas Wunner <lukas@wunner.de>,
	Andreas Noever <andreas.noever@gmail.com>,
	Alan Borzeszkowski <alan.borzeszkowski@linux.intel.com>,
	Milo Chen <cmh79479@gmail.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH 2/3] thunderbolt: Use separate lock class for each ring
Date: Mon, 31 Aug 2026 15:18:39 +0200
Message-ID: <20260831131840.1982842-3-mika.westerberg@linux.intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260831131840.1982842-1-mika.westerberg@linux.intel.com>
References: <20260831131840.1982842-1-mika.westerberg@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When connected to another host and then unplugging cable lockdep
triggers following:

 ======================================================
 WARNING: possible circular locking dependency detected
 7.1.0-rc2+ #1775 Tainted: G     U
 ------------------------------------------------------
 kworker/u16:6/312 is trying to acquire lock:
 ffff8881179c70a8 ((work_completion)(&ring->work)){+.+.}-{0:0}, at: __flush_work+0x3cf/0xd10

 but task is already holding lock:
 ffff8881a8b810b0 (&net->connection_lock){+.+.}-{4:4}, at: tbnet_tear_down+0x110/0x720 [thunderbolt_net]

 which lock already depends on the new lock.

 the existing dependency chain (in reverse order) is:

 -> #1 (&net->connection_lock){+.+.}-{4:4}:
        __mutex_lock+0x19a/0x2490
        mutex_lock_nested+0x1b/0x30
        tbnet_handle_packet+0x74c/0xd70 [thunderbolt_net]
        tb_xdomain_handle_request+0x37c/0x4b0 [thunderbolt]
        tb_domain_event_cb+0xc9/0x140 [thunderbolt]
        tb_ctl_handle_event+0xd6/0x2c0 [thunderbolt]
        tb_ctl_rx_callback+0x22c/0xa10 [thunderbolt]
        ring_work+0x715/0xcb0 [thunderbolt]
        process_one_work+0x902/0x1790
        worker_thread+0x5cd/0xfe0
        kthread+0x339/0x420
        ret_from_fork+0x79a/0x9d0
        ret_from_fork_asm+0x1a/0x30

 -> #0 ((work_completion)(&ring->work)){+.+.}-{0:0}:
        __lock_acquire+0x1592/0x2640
        lock_acquire+0x1a3/0x300
        __flush_work+0x3e9/0xd10
        flush_work+0x21/0x30
        tb_ring_stop+0x240/0x840 [thunderbolt]
        tbnet_tear_down+0x2ff/0x720 [thunderbolt_net]
        tbnet_stop+0x47/0x1a0 [thunderbolt_net]
        __dev_close_many+0x19e/0x4e0
        netif_close_many+0x1e8/0x640
        unregister_netdevice_many_notify+0x6d3/0x22d0
        unregister_netdevice_queue+0x2b9/0x3a0
        unregister_netdev+0x1c/0x70
        tbnet_remove+0x52/0xb0 [thunderbolt_net]
        tb_service_remove+0x8a/0xe0 [thunderbolt]
        device_remove+0xc5/0x190
        device_release_driver_internal+0x3db/0x590
        device_release_driver+0x12/0x20
        bus_remove_device+0x2c1/0x580
        device_del+0x3d9/0x9f0
        device_unregister+0x17/0xc0
        unregister_service+0x46/0x60 [thunderbolt]
        device_for_each_child_reverse+0xfa/0x180
        tb_xdomain_unregister+0x57/0xe0 [thunderbolt]
        unregister_unplugged_xdomain+0x101/0x1a0 [thunderbolt]
        bus_for_each_dev+0x111/0x1a0
        tb_domain_unregister_unplugged_xdomains+0x98/0xe0 [thunderbolt]
        tb_handle_hotplug+0xc3/0x2bb0 [thunderbolt]
        process_one_work+0x902/0x1790
        worker_thread+0x5cd/0xfe0
        kthread+0x339/0x420
        ret_from_fork+0x79a/0x9d0
        ret_from_fork_asm+0x1a/0x30

 other info that might help us debug this:

  Possible unsafe locking scenario:

        CPU0                    CPU1
        ----                    ----
   lock(&net->connection_lock);
                                lock((work_completion)(&ring->work));
                                lock(&net->connection_lock);
   lock((work_completion)(&ring->work));

This in fact is false positive because they involve unrelated rings (and
unrelated work structures). In the first one it is ring 0 which is used
for control traffic and in the second it is dealing with another ring
used for the high-speed traffic.

Fix this by using separate lock class for each ring worker.

Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 drivers/thunderbolt/nhi.c   | 5 +++++
 include/linux/thunderbolt.h | 3 +++
 2 files changed, 8 insertions(+)

diff --git a/drivers/thunderbolt/nhi.c b/drivers/thunderbolt/nhi.c
index 5809809f64d4..d4d1efa2afa0 100644
--- a/drivers/thunderbolt/nhi.c
+++ b/drivers/thunderbolt/nhi.c
@@ -15,6 +15,7 @@
 #include <linux/dma-mapping.h>
 #include <linux/interrupt.h>
 #include <linux/iommu.h>
+#include <linux/lockdep.h>
 #include <linux/module.h>
 #include <linux/delay.h>
 #include <linux/property.h>
@@ -560,6 +561,8 @@ static struct tb_ring *tb_ring_alloc(struct tb_nhi *nhi, u32 hop, int size,
 	INIT_LIST_HEAD(&ring->in_flight);
 	INIT_WORK(&ring->work, ring_work);
 	init_waitqueue_head(&ring->wait);
+	lockdep_register_key(&ring->lock_key);
+	lockdep_init_map(&ring->work.lockdep_map, "ring.work", &ring->lock_key, 0);
 
 	ring->nhi = nhi;
 	ring->hop = hop;
@@ -599,6 +602,7 @@ static struct tb_ring *tb_ring_alloc(struct tb_nhi *nhi, u32 hop, int size,
 			  ring->size * sizeof(*ring->descriptors),
 			  ring->descriptors, ring->descriptors_dma);
 err_free_ring:
+	lockdep_unregister_key(&ring->lock_key);
 	kfree(ring);
 
 	return NULL;
@@ -848,6 +852,7 @@ void tb_ring_free(struct tb_ring *ring)
 	 * to finish before freeing the ring.
 	 */
 	flush_work(&ring->work);
+	lockdep_unregister_key(&ring->lock_key);
 	kfree(ring);
 }
 EXPORT_SYMBOL_GPL(tb_ring_free);
diff --git a/include/linux/thunderbolt.h b/include/linux/thunderbolt.h
index d48623fda79b..b62dfa52b149 100644
--- a/include/linux/thunderbolt.h
+++ b/include/linux/thunderbolt.h
@@ -22,6 +22,7 @@ struct device;
 #include <linux/device.h>
 #include <linux/idr.h>
 #include <linux/list.h>
+#include <linux/lockdep.h>
 #include <linux/mutex.h>
 #include <linux/device-id/tb.h>
 #include <linux/pci.h>
@@ -565,6 +566,7 @@ struct tb_nhi {
  * @interval_nsec: Interval counter if interrupt throttling is to be
  *		   used with this ring (in ns)
  * @wait: Used to signal that the ring may be empty now
+ * @lock_key: Lock validator class key per-ring
  */
 struct tb_ring {
 	spinlock_t lock;
@@ -590,6 +592,7 @@ struct tb_ring {
 	void *poll_data;
 	unsigned int interval_nsec;
 	wait_queue_head_t wait;
+	struct lock_class_key lock_key;
 };
 
 /* Leave ring interrupt enabled on suspend */
-- 
2.50.1


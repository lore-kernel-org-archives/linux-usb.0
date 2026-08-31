Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7DD3330650
	for <linux-usb@vger.kernel.org>; Mon, 31 Aug 2026 13:18:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788182325; cv=none; b=BfgivB7M74CrTZPNpP1dIt45jO+5yPj9hmebY2GMdZnlQ7zHS5FIHP2FexiBmlo/jTCTB9LuxMdVQvjWlao63vP8cykbJhfaTmxkuzdZnN+8EpN4gaWm2kr2Qs7R3cTRVQVKUW+2QoHIkGn/C0JquTpaGk8wrjSRDn0/Z0OGbtE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788182325; c=relaxed/simple;
	bh=7x/e+CJP9DHBz83oZ/UTnJ/PAEm0WujZ0Yj0egNo6JE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ux+ghtw525lGzyoPvIwS/RU9a3wAdhLs0igsZn8iykXlAGA/I7P7U5E/aSW+40R7E1OTD/1Xk8ONEEB1Pv3mXvp8uoQPQ93b8g9qQCC2ea/sDbRdZfe7ie1tBUf3omhyVDPyKFtOYN9i46nnB2VST95ZXP2V7lAQfRxmcZZnkYY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gg9jrcvc; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gg9jrcvc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788182324; x=1819718324;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=7x/e+CJP9DHBz83oZ/UTnJ/PAEm0WujZ0Yj0egNo6JE=;
  b=gg9jrcvcwEEy5AMUmQs/Ks4SpW1T21SWUDPnZW4/buvkqDckQ8wzZAfd
   uD3CoKSQFx2JF32EV6E4VUz5wU+JeiRVGWLQcyC7Ww8RRf+y0zWYkw9GF
   Y6rzujM/vIqutxwWl6TOJEoneoghGSykcXq/YxjGxnaXrxrwicKAL5tJm
   0IfHa64Is4lncH/Dh9sVLJ1JkrUxL89QFP7vzh9BpGFSmzjh8GdLig4NS
   KKsUMJomQ02t/SZF17nyXReqct9e29Bnvq1Yau33mDIL5oONbiyd3+jt/
   P02XT15RO3RK45eMhnosv2zfmK4W2GMiD3kTP0NE2YL1rl8srILkIc1m+
   Q==;
X-CSE-ConnectionGUID: HcuoooCDTvasGrtmu2+8+A==
X-CSE-MsgGUID: pGCy09BAT0ifPGnRZY6DaQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11891"; a="88351588"
X-IronPort-AV: E=Sophos;i="6.25,254,1779174000"; 
   d="scan'208";a="88351588"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2026 06:18:43 -0700
X-CSE-ConnectionGUID: xCOl/kCaRUK9RwCcPwZoVg==
X-CSE-MsgGUID: 3YXMqO1JQCCo+0lB4ESD1Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,254,1779174000"; 
   d="scan'208";a="267465863"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa010.jf.intel.com with ESMTP; 31 Aug 2026 06:18:42 -0700
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id E94029B; Mon, 31 Aug 2026 15:18:40 +0200 (CEST)
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: linux-usb@vger.kernel.org
Cc: Yehezkel Bernat <YehezkelShB@gmail.com>,
	Lukas Wunner <lukas@wunner.de>,
	Andreas Noever <andreas.noever@gmail.com>,
	Alan Borzeszkowski <alan.borzeszkowski@linux.intel.com>,
	Milo Chen <cmh79479@gmail.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH 1/3] thunderbolt: Fix KASAN reported use-after-free when request is canceled
Date: Mon, 31 Aug 2026 15:18:38 +0200
Message-ID: <20260831131840.1982842-2-mika.westerberg@linux.intel.com>
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

Alan reported that when doing stress testing sometimes KASAN notices
use-after-free during control channel operation (stripped down keeping
the relevant parts):

 BUG: KASAN: slab-use-after-free in tb_cfg_request_sync+0x240/0x250 [thunderbolt]
 Read of size 24 at addr ffff88811067f290 by task kworker/u40:2/1760
  <TASK>
  tb_cfg_request_sync+0x240/0x250 [thunderbolt]
  tb_cfg_read_raw+0x367/0x510 [thunderbolt]
  tb_cfg_read+0xec/0x240 [thunderbolt]
  tb_port_get_link_generation+0x258/0x420 [thunderbolt]
  tb_usb3_consumed_bandwidth+0x1c1/0x2c0 [thunderbolt]
  tb_tunnel_consumed_bandwidth+0xfd/0x910 [thunderbolt]
  tb_available_bandwidth+0x5f2/0xeb0 [thunderbolt]
  tb_recalc_estimated_bandwidth+0x2a0/0x1bc0 [thunderbolt]
  tb_handle_dp_bandwidth_request+0x1897/0x5e20 [thunderbolt]
  process_one_work+0x675/0x1230
  worker_thread+0x5e6/0xf70
  kthread+0x365/0x470
  ret_from_fork+0x54d/0x710
  ret_from_fork_asm+0x1a/0x30
  </TASK>

 Allocated by task 1760:
  __kmalloc_cache_noprof+0x1ee/0x550
  tb_cfg_read_raw+0x1d3/0x510 [thunderbolt]
  tb_cfg_read+0xec/0x240 [thunderbolt]
  tb_port_get_link_generation+0x258/0x420 [thunderbolt]
  tb_usb3_consumed_bandwidth+0x1c1/0x2c0 [thunderbolt]
  tb_tunnel_consumed_bandwidth+0xfd/0x910 [thunderbolt]
  tb_available_bandwidth+0x5f2/0xeb0 [thunderbolt]
  tb_recalc_estimated_bandwidth+0x2a0/0x1bc0 [thunderbolt]
  tb_handle_dp_bandwidth_request+0x1897/0x5e20 [thunderbolt]
  process_one_work+0x675/0x1230
  worker_thread+0x5e6/0xf70
  kthread+0x365/0x470
  ret_from_fork+0x54d/0x710
  ret_from_fork_asm+0x1a/0x30

 Freed by task 926:
  kfree+0x18f/0x4a0
  tb_cfg_request_put+0xb7/0xe0 [thunderbolt]
  tb_cfg_request_work+0x82/0x120 [thunderbolt]
  process_one_work+0x675/0x1230
  worker_thread+0x5e6/0xf70
  kthread+0x365/0x470
  ret_from_fork+0x54d/0x710
  ret_from_fork_asm+0x1a/0x30

 Second to last potentially related work creation:
  __queue_work+0x575/0xd00
  queue_work_on+0x77/0x80
  tb_cfg_request_cancel+0xc7/0x260 [thunderbolt]
  tb_cfg_request_sync+0x1f6/0x250 [thunderbolt]
  tb_cfg_read_raw+0x367/0x510 [thunderbolt]
  tb_cfg_read+0xec/0x240 [thunderbolt]
  tb_port_get_link_generation+0x258/0x420 [thunderbolt]
  tb_usb3_consumed_bandwidth+0x1c1/0x2c0 [thunderbolt]
  tb_tunnel_consumed_bandwidth+0xfd/0x910 [thunderbolt]
  tb_available_bandwidth+0x5f2/0xeb0 [thunderbolt]
  tb_recalc_estimated_bandwidth+0x2a0/0x1bc0 [thunderbolt]
  tb_handle_dp_bandwidth_request+0x1897/0x5e20 [thunderbolt]
  process_one_work+0x675/0x1230
  worker_thread+0x5e6/0xf70
  kthread+0x365/0x470
  ret_from_fork+0x54d/0x710
  ret_from_fork_asm+0x1a/0x30

The last stack trace is helpful because it shows that we are cancelling
a request and looking at tb_cfg_request_cancel() what might happen is
that tb_cfg_request_work() completes right before tb_cfg_request_cancel()
starts and because of this it will call schedule_work() queueing the
same work to run again. However, it is already removed from the
request_queue and reference count is dropped so when
tb_cfg_request_work() triggers again it will access memory that is
already released.

Fix this so that we first make sure a cancelled request is not handed
away from tb_cfg_request_find() or scheduled to run. Then instead of
relying on the worker to clean up the request we will do it in
tb_cfg_request_cancel() after the work is canceled from running. Make
tb_cfg_request_dequeue() release the request only if it was actually
removed from the queue.

Reported-by: Alan Borzeszkowski <alan.borzeszkowski@linux.intel.com>
Fixes: d7f781bfdbf4 ("thunderbolt: Rework control channel to be more reliable")
Cc: stable@vger.kernel.org
Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 drivers/thunderbolt/ctl.c | 63 +++++++++++++++++++--------------------
 1 file changed, 31 insertions(+), 32 deletions(-)

diff --git a/drivers/thunderbolt/ctl.c b/drivers/thunderbolt/ctl.c
index cd47b627f97b..965988b18608 100644
--- a/drivers/thunderbolt/ctl.c
+++ b/drivers/thunderbolt/ctl.c
@@ -73,7 +73,6 @@ struct tb_ctl {
 #define tb_ctl_dbg_once(ctl, format, arg...) \
 	dev_dbg_once((ctl)->nhi->dev, format, ## arg)
 
-static DECLARE_WAIT_QUEUE_HEAD(tb_cfg_request_cancel_queue);
 /* Serializes access to request kref_get/put */
 static DEFINE_MUTEX(tb_cfg_request_lock);
 
@@ -133,41 +132,42 @@ void tb_cfg_request_put(struct tb_cfg_request *req)
 static int tb_cfg_request_enqueue(struct tb_ctl *ctl,
 				  struct tb_cfg_request *req)
 {
+	tb_cfg_request_get(req);
+
 	WARN_ON(test_bit(TB_CFG_REQUEST_ACTIVE, &req->flags));
 	WARN_ON(req->ctl);
 
-	mutex_lock(&ctl->request_queue_lock);
+	guard(mutex)(&ctl->request_queue_lock);
 	if (!ctl->running) {
-		mutex_unlock(&ctl->request_queue_lock);
+		tb_cfg_request_put(req);
 		return -ENOTCONN;
 	}
 	req->ctl = ctl;
 	list_add_tail(&req->list, &ctl->request_queue);
 	set_bit(TB_CFG_REQUEST_ACTIVE, &req->flags);
-	mutex_unlock(&ctl->request_queue_lock);
 	return 0;
 }
 
-static void tb_cfg_request_dequeue(struct tb_cfg_request *req)
+static bool tb_cfg_request_is_active(struct tb_cfg_request *req)
 {
-	struct tb_ctl *ctl = req->ctl;
-
-	mutex_lock(&ctl->request_queue_lock);
-	if (!test_bit(TB_CFG_REQUEST_ACTIVE, &req->flags)) {
-		mutex_unlock(&ctl->request_queue_lock);
-		return;
-	}
+	return test_bit(TB_CFG_REQUEST_ACTIVE, &req->flags);
+}
 
-	list_del(&req->list);
-	clear_bit(TB_CFG_REQUEST_ACTIVE, &req->flags);
-	if (test_bit(TB_CFG_REQUEST_CANCELED, &req->flags))
-		wake_up(&tb_cfg_request_cancel_queue);
-	mutex_unlock(&ctl->request_queue_lock);
+static bool tb_cfg_request_is_canceled(struct tb_cfg_request *req)
+{
+	return test_bit(TB_CFG_REQUEST_CANCELED, &req->flags);
 }
 
-static bool tb_cfg_request_is_active(struct tb_cfg_request *req)
+static void tb_cfg_request_dequeue(struct tb_cfg_request *req)
 {
-	return test_bit(TB_CFG_REQUEST_ACTIVE, &req->flags);
+	struct tb_ctl *ctl = req->ctl;
+
+	guard(mutex)(&ctl->request_queue_lock);
+	if (tb_cfg_request_is_active(req)) {
+		list_del(&req->list);
+		clear_bit(TB_CFG_REQUEST_ACTIVE, &req->flags);
+		tb_cfg_request_put(req);
+	}
 }
 
 static struct tb_cfg_request *
@@ -178,7 +178,7 @@ tb_cfg_request_find(struct tb_ctl *ctl, struct ctl_pkg *pkg)
 	mutex_lock(&pkg->ctl->request_queue_lock);
 	list_for_each_entry(iter, &pkg->ctl->request_queue, list) {
 		tb_cfg_request_get(iter);
-		if (iter->match(iter, pkg)) {
+		if (!tb_cfg_request_is_canceled(iter) && iter->match(iter, pkg)) {
 			req = iter;
 			break;
 		}
@@ -512,8 +512,11 @@ static void tb_ctl_rx_callback(struct tb_ring *ring, struct ring_frame *frame,
 	trace_tb_rx(pkg->ctl->index, frame->eof, pkg->buffer, frame->size, !req);
 
 	if (req) {
-		if (req->copy(req, pkg))
-			schedule_work(&req->work);
+		scoped_guard(mutex, &pkg->ctl->request_queue_lock) {
+			if (!tb_cfg_request_is_canceled(req) &&
+			    req->copy(req, pkg))
+				schedule_work(&req->work);
+		}
 		tb_cfg_request_put(req);
 	}
 
@@ -525,11 +528,10 @@ static void tb_cfg_request_work(struct work_struct *work)
 {
 	struct tb_cfg_request *req = container_of(work, typeof(*req), work);
 
-	if (!test_bit(TB_CFG_REQUEST_CANCELED, &req->flags))
+	if (!tb_cfg_request_is_canceled(req))
 		req->callback(req->callback_data);
 
 	tb_cfg_request_dequeue(req);
-	tb_cfg_request_put(req);
 }
 
 /**
@@ -555,10 +557,9 @@ int tb_cfg_request(struct tb_ctl *ctl, struct tb_cfg_request *req,
 	INIT_WORK(&req->work, tb_cfg_request_work);
 	INIT_LIST_HEAD(&req->list);
 
-	tb_cfg_request_get(req);
 	ret = tb_cfg_request_enqueue(ctl, req);
 	if (ret)
-		goto err_put;
+		return ret;
 
 	ret = tb_ctl_tx(ctl, req->request, req->request_size,
 			req->request_type);
@@ -572,9 +573,6 @@ int tb_cfg_request(struct tb_ctl *ctl, struct tb_cfg_request *req,
 
 err_dequeue:
 	tb_cfg_request_dequeue(req);
-err_put:
-	tb_cfg_request_put(req);
-
 	return ret;
 }
 
@@ -588,9 +586,10 @@ int tb_cfg_request(struct tb_ctl *ctl, struct tb_cfg_request *req,
  */
 void tb_cfg_request_cancel(struct tb_cfg_request *req, int err)
 {
-	set_bit(TB_CFG_REQUEST_CANCELED, &req->flags);
-	schedule_work(&req->work);
-	wait_event(tb_cfg_request_cancel_queue, !tb_cfg_request_is_active(req));
+	scoped_guard(mutex, &req->ctl->request_queue_lock)
+		set_bit(TB_CFG_REQUEST_CANCELED, &req->flags);
+	cancel_work_sync(&req->work);
+	tb_cfg_request_dequeue(req);
 	req->result.err = err;
 }
 
-- 
2.50.1


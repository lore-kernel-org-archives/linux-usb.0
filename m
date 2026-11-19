Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795074966;
	b=Myt1r1SVddNFsolxeF+WG/RssLqQ/y1hxOtvD5IX+7XZ14cW3mLgn+iByZ8lYfaLLAhB
	 Uy8GPqiGw6A+PbpgTcllfcPZydNS+c2Gx8KHmLq7B30BC7zCoarvk6fQrV/urLV66p5Vy
	 fKXgUMlQMCKbIu0C8XeH5+BEuSTC4U6UgGKcPpZdPb4gV3UwazLfSo1ZgIIa3qYfaU6ar
	 LWUeAaaEkxCC0xkp//A9GvCguKM1D1skR4WFkuseTGe5FPSOMg0YbYqdn7FjjlxRUICyz
	 JodG94Q89nws0Vc7UpDpPXXFYbG22ePcKtiS68sn5Y/IySOITNJ3lxN2S3PKwKc83Bg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795074966;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=NFT26QLLW6OyJix7DF39lCL7EHKtdlI1fGw5rZ7fjC4=;
	b=BUtjmLyvVTjkCB8dZ71mUl/5eilh5MpcV+mA3viAjVcjhxrefEPVUDbbuO1z3N0RuOlW
	 Ee/tfZ86rzs0xiocu7cSRcBrlSidJhhIvTgMKSsX7iiRIWhPLUg1eXaDZn+1282A0g+Et
	 FFcbc8t5lIuvaruMZd7GLQjvRUPoqXebIFA6lzL2Fv9DfpBOb0gIUKwWw2t4V/OcOHMwv
	 8o0/ZVXs7chITaXEOYSzjS14YwaRO3UAOA9HJa8ELIEyBzqiDXdTbNO11gnni3o3SUIbq
	 W7cE6LnEcZiMV1R98DA8dRu+NnehQ4wICOoIccS0UCDpR7DBRnrK1PThyCj1BHFUphg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LSrzTBrC;
	arc=none smtp.remote-ip=209.85.215.182
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3677606A320
	for <linux-usb@vger.kernel.org>; Thu, 19 Nov 2026 07:56:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E3677606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LSrzTBrC
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-cddac941ed1so846078a12.2
        for <linux-usb@vger.kernel.org>; Wed, 18 Nov 2026 23:56:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795074964; x=1795679764; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=NFT26QLLW6OyJix7DF39lCL7EHKtdlI1fGw5rZ7fjC4=;
        b=LSrzTBrCzW7zys75BGx2QciiQ0ox1AVjDh+NFo8TZan0YHao32FAQEShm/4KxIyWOn
         bsaAymeMqApH7wintLvN3ItRDiE6bQqPvVaB5S/EpdEglklfKhsxNCGzUClSEbLmvjZj
         +12iYCIHq4uZ9Sjp7fvAvjqElM0VgykjhswGkIEupLyjbx2TDWPsltPwF7V1hiIgzW24
         Shdut83wOIKUKMQVR8eph5zoJZumuPenPZ7TttJGh9NsZDdroKsDzi345ppQJcGnXxvW
         Ap0IxHLKMVfoLR9uJ7tB0fnOwRoSp16BZLu3LL6bTjxaj+uy+8COfq9FcHNV7e+ifln8
         vfqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795074964; x=1795679764;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NFT26QLLW6OyJix7DF39lCL7EHKtdlI1fGw5rZ7fjC4=;
        b=SgWiVi30MhD+o8bQ3WnXaQ+/DzRapia4yRuJi0IOkxNlCvrXQwLP0W/gKWoxtywrJU
         i3oo7Bw7zoE3esV1x3UGCf3IpuogVgrGPb2s/r4l8b/3HNSqHCw7mlJlVFZZP51sCG5S
         SdAbzUTQ7iwdw3q7GmqSMwBTwebPC0ex60EKRBDJ8YAqA5PRoau+zb17VdmOqYuqhBFh
         NVPW/dmg1ezko2nZYU1vxzv3oQN1AC3/tm4Pwg14jBPvnOZ9FHymKubD7nwzR18L3ha9
         Pw1bD9CxdaNHbb7Ht+myTyFUlfvXI79eYqVvzp8Ao7UQPlgHnAS2LBez3ge63mxwk7h8
         GCpw==
X-Forwarded-Encrypted: i=1; AL+hErGQktdLbfHE+JPAVkF88wpbGGo7V3G/778v/xxPc3/KExsZj8vOAknwtloSIZoC2qqWTtuzNNxXLjc=@vger.kernel.org
X-Gm-Message-State: APuU4Z8lY7ov+P5hODJsDc+1IM25SnVBgEMyaU4jjdOHv7zeREOdd993
	rrminWwhCboC4j0zqCIc9o5G9wW8RQbbbjQYzxFwjhrEag0AtB9V16Wa
X-Gm-Gg: AZFdTZdnNF/CEi1MCnyVXRUdYk5nKtAXDikzeckpUMKAvmv4cW3Kl2xilQeopWDY9Zp
	ylOd5Uvw0RhYo79VBKwDdyNHzFtQP12BsBAuAk6mDbtfit5MktTcYuIiWdznNMN/Rxt+piMdLTk
	53v4tAfAZrNZgOdLfYtqOC/Wn+etmvQLnTiRzPOF8UYc1HydaV7DjZwQ/7Kr0gjS5PLlPUHi/Lh
	I+sdALa35WSXhUzVxTjCgZieDxQzssrUxJ91gQfBQ6zF/7uYOGMtF99SrU0DW7WHc44U3Qd/AO8
	d7hDRZQVArfQ4OJDm/2c0txhdOY9oimets/1Zd04kCCNCtJFCCml4ha5W9kfqvnszQr6J5+BP4L
	G4e7xj9NvQZcS24PGxYtDEftkmbRr7zS9tVyqaotheF2cURtKBoaPlRkCCeXrAONF2zated0MIf
	JQ1qb9UkYyZANLbU9iSQer7IwdwnQiEABCnS2DBkHLTAyS/jT4p5E0FZCynOERnPwxd7dkghkvM
	7yewS6L35Wq8lXdC6A6PBBlTd6uy6eP5ppw+jDhp95TyEiBUmyzyPEB+ILuYsUIuGREMtfPst1o
	wjGsv0wKNsIGBdygFiz+xvYXOOZocszXrNeIu/JF6jcp8itvCn6U/OrkRhvjjt/BrThq/AFHcIs
	8CanUBUj/RKQ3aYcWCvImqFehP2x3uhHkKCX7GlPUXrS40BNIcNHJKBVDAINxRxnkMd1q
X-Received: by 2002:a17:90b:4acb:b0:3a0:516d:9f88 with SMTP id 98e67ed59e1d1-3b3d07a85damr5153075a91.26.1795074963919;
        Wed, 18 Nov 2026 23:56:03 -0800 (PST)
Received: from lwq-server.tail118c18.ts.net ([74.176.208.23])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b4058d2208sm1499092a91.9.2026.11.18.23.56.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 23:56:03 -0800 (PST)
From: Yaohan Li <shunsheng1218@gmail.com>
To: Mika Westerberg <westeri@kernel.org>
Cc: Andreas Noever <andreas.noever@gmail.com>,
	Yehezkel Bernat <YehezkelShB@gmail.com>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH] thunderbolt: cancel the queued control requests on teardown
Date: Thu, 19 Nov 2026 15:55:57 +0800
Message-Id: <20261119075557.3399335-1-shunsheng1218@gmail.com>
X-Mailer: git-send-email 2.34.1
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

tb_domain_remove() stops the control channel but nothing cancels the
requests still in its queue.  Their completion work is already scheduled
and the queue itself holds a reference, so tb_ctl_free() releases the
channel, the rings and the frame pool while that work is still pending.

Splice the queue instead, cancel the work and complete the callback data
with -ENOTCONN.  The reference the queue held is taken before the request
becomes unprotected, so a completion that runs in the meantime cannot
free it under the loop.  The terminal error is published once under a
small lock, because a request can be canceled by its owner and by the
teardown at the same time: the value is written before the flag that
announces it, so a canceler that loses the race never reads a stale
result.

A synchronous request waits on a completion that it passes as the
callback data, and a canceled request never runs its callback.  It
installs that same completion as its cancel hook so the teardown wakes
it, guarded by a one-shot flag because the owner and the teardown can
both reach it.

Two windows have to be covered and one counter cannot cover both.  The
first is the request that has been admitted and queued but has not been
handed to the TX ring yet: the teardown cancels it, but the submitter
still dereferences the channel to send it.  The second is the synchronous
user that keeps using the channel after the send, through the wait, the
timeout and the cancel, and the teardown can run in between.  Every user
is therefore registered on the channel with two counters, both taken
under request_queue_lock - the lock tb_ctl_stop() uses to clear @running,
so no user can appear once the channel has been stopped.  @submitting
covers the first window, and the rings are not stopped before it drops to
zero; @sync_users covers the second, and tb_ctl_cancel_requests() waits
for it before the channel may be freed.

tb_domain_add() calls tb_ctl_cancel_requests() on its error path as
well: a failing driver_ready() or start() leaves requests behind and that
domain is released without tb_domain_remove().

Signed-off-by: Yaohan Li <shunsheng1218@gmail.com>

---
Prepared against v7.4-rc1-1969-g666539eecdf4.

Tested with a controlled interleaving test: drivers/thunderbolt/ctl.c is
compiled verbatim into a module on a KASAN kernel built from this tree
(x86_64, QEMU/KVM), with only the NHI ring backend replaced.  The test parks
a submitter inside tb_ctl_tx() with a completion, calls tb_ctl_stop() from
another thread and checks that the rings are stopped only after the submitter
returned; it also checks that a synchronous waiter is woken by
tb_ctl_cancel_requests() with -ENOTCONN, that an owner cancel racing the
teardown cancel releases callback_data once and publishes one terminal error,
and that a submitter arriving after the stop is rejected without touching the
ring.  All 23 assertions pass on this patch; against 666539eecdf4 the same
scenarios fail (the ring is stopped before the submitter returns, tx=2
stop=1).  The Thunderbolt controller itself was not available, so no hardware
timing was exercised.

The initialisation failure, suspend and cancellation paths were audited
rather than run.  tb_ctl_alloc() hands partially initialised pointers to
tb_ctl_free(), which is safe: dma_pool_destroy() returns early for a NULL
pool and tb_ctl_pkg_free() accepts a NULL package.  tb_domain_suspend() and
tb_domain_suspend_noirq() call tb_ctl_stop() with tb->lock held and leave the
queued requests for the resume, which is unchanged, and no submitter takes
tb->lock, so the new wait cannot invert against it.  The owner-cancel and
teardown-cancel race is the one the test drives.

Checked against mainline 21a7f44fd076, where the patch applies, and against
the list traffic: no fix for this teardown is in flight.  The "dangling
request in request_queue" warning that tb_ctl_stop() still emits is being
discussed separately for AMD USB4 routers ("Fix tb->lock deadlock during
hot-unplug on AMD USB4 routers", 2026-10); that work moves the router reset,
it does not cancel control requests.

AI assistance: the analysis, the change and its review notes were
prepared with Claude (Anthropic) as a coding assistant.  The author
reviewed the reasoning and takes responsibility for the content.
---
 drivers/thunderbolt/ctl.c    | 218 +++++++++++++++++++++++++++++++++--
 drivers/thunderbolt/ctl.h    |   9 ++
 drivers/thunderbolt/domain.c |  14 +++
 drivers/thunderbolt/icm.c    |  18 +++
 4 files changed, 247 insertions(+), 12 deletions(-)

diff --git a/drivers/thunderbolt/ctl.c b/drivers/thunderbolt/ctl.c
index 965988b18608..58d0c6851013 100644
--- a/drivers/thunderbolt/ctl.c
+++ b/drivers/thunderbolt/ctl.c
@@ -31,6 +31,9 @@
  * @request_queue_lock: Lock protecting @request_queue
  * @request_queue: List of outstanding requests
  * @running: Is the control channel running at the moment
+ * @submitting: Requests between the queue and the TX ring
+ * @sync_users: Synchronous users inside tb_cfg_request_sync()
+ * @idle_wait: Woken when the last submitter or synchronous user leaves
  * @timeout_msec: Default timeout for non-raw control messages
  * @callback: Callback called when hotplug message is received
  * @callback_data: Data passed to @callback
@@ -46,6 +49,9 @@ struct tb_ctl {
 	struct mutex request_queue_lock;
 	struct list_head request_queue;
 	bool running;
+	int submitting;
+	int sync_users;
+	wait_queue_head_t idle_wait;
 
 	int timeout_msec;
 	event_cb callback;
@@ -528,8 +534,10 @@ static void tb_cfg_request_work(struct work_struct *work)
 {
 	struct tb_cfg_request *req = container_of(work, typeof(*req), work);
 
-	if (!tb_cfg_request_is_canceled(req))
+	if (!tb_cfg_request_is_canceled(req)) {
 		req->callback(req->callback_data);
+		set_bit(TB_CFG_REQUEST_COMPLETED, &req->flags);
+	}
 
 	tb_cfg_request_dequeue(req);
 }
@@ -546,12 +554,76 @@ static void tb_cfg_request_work(struct work_struct *work)
  *
  * Return: %0 on success, negative errno otherwise.
  */
+/*
+ * Admission for everything that uses the channel.  tb_ctl_stop() clears
+ * @running under @request_queue_lock, so taking the same lock here is what
+ * makes the waits below complete: once the channel has been stopped no new
+ * user can appear.
+ *
+ * @submitting covers a request from the moment it is admitted until it has
+ * been handed to the TX ring.  Such a request is already queued, so the
+ * teardown cancels it, but it still dereferences @ctl in tb_ctl_tx() and the
+ * rings must not be stopped under it.
+ *
+ * @sync_users covers the longer window of a synchronous request, which keeps
+ * using @ctl after the send has completed: it waits, possibly times out and
+ * then cancels the request.
+ */
+static int tb_ctl_submit_enter(struct tb_ctl *ctl)
+{
+	int ret = 0;
+
+	mutex_lock(&ctl->request_queue_lock);
+	if (ctl->running)
+		ctl->submitting++;
+	else
+		ret = -ENOTCONN;
+	mutex_unlock(&ctl->request_queue_lock);
+
+	return ret;
+}
+
+static void tb_ctl_submit_exit(struct tb_ctl *ctl)
+{
+	mutex_lock(&ctl->request_queue_lock);
+	ctl->submitting--;
+	wake_up_all(&ctl->idle_wait);
+	mutex_unlock(&ctl->request_queue_lock);
+}
+
+static int tb_ctl_sync_enter(struct tb_ctl *ctl)
+{
+	int ret = 0;
+
+	mutex_lock(&ctl->request_queue_lock);
+	if (ctl->running)
+		ctl->sync_users++;
+	else
+		ret = -ENOTCONN;
+	mutex_unlock(&ctl->request_queue_lock);
+
+	return ret;
+}
+
+static void tb_ctl_sync_exit(struct tb_ctl *ctl)
+{
+	mutex_lock(&ctl->request_queue_lock);
+	ctl->sync_users--;
+	wake_up_all(&ctl->idle_wait);
+	mutex_unlock(&ctl->request_queue_lock);
+}
+
 int tb_cfg_request(struct tb_ctl *ctl, struct tb_cfg_request *req,
 		   void (*callback)(void *), void *callback_data)
 {
 	int ret;
 
+	ret = tb_ctl_submit_enter(ctl);
+	if (ret)
+		return ret;
+
 	req->flags = 0;
+	spin_lock_init(&req->result_lock);
 	req->callback = callback;
 	req->callback_data = callback_data;
 	INIT_WORK(&req->work, tb_cfg_request_work);
@@ -559,23 +631,57 @@ int tb_cfg_request(struct tb_ctl *ctl, struct tb_cfg_request *req,
 
 	ret = tb_cfg_request_enqueue(ctl, req);
 	if (ret)
-		return ret;
+		goto out;
 
 	ret = tb_ctl_tx(ctl, req->request, req->request_size,
 			req->request_type);
-	if (ret)
-		goto err_dequeue;
+	if (ret) {
+		tb_cfg_request_dequeue(req);
+		goto out;
+	}
 
 	if (!req->response)
 		schedule_work(&req->work);
 
-	return 0;
+out:
+	tb_ctl_submit_exit(ctl);
 
-err_dequeue:
-	tb_cfg_request_dequeue(req);
 	return ret;
 }
 
+/*
+ * If @callback did not get a chance to run then the owner of
+ * @callback_data did not get a chance to release it either.  The hook runs
+ * at most once: a request can be canceled by its owner and by
+ * tb_ctl_cancel_requests() and the data it releases (or the completion it
+ * wakes) must not be touched twice.
+ */
+static void tb_cfg_request_release_callback_data(struct tb_cfg_request *req)
+{
+	if (req->cancel && !test_bit(TB_CFG_REQUEST_COMPLETED, &req->flags) &&
+	    !test_and_set_bit(TB_CFG_REQUEST_CANCEL_HANDLED, &req->flags))
+		req->cancel(req->callback_data);
+}
+
+/*
+ * The terminal error is published once.  A request can be canceled by its
+ * owner after a timeout and by tb_ctl_cancel_requests() at the same time;
+ * the error is written before the flag that announces it, both under
+ * @result_lock, so a canceler that loses the race never observes the flag
+ * before the value it guards.
+ */
+static void tb_cfg_request_set_error(struct tb_cfg_request *req, int err)
+{
+	unsigned long flags;
+
+	spin_lock_irqsave(&req->result_lock, flags);
+	if (!test_bit(TB_CFG_REQUEST_ERROR_SET, &req->flags)) {
+		req->result.err = err;
+		set_bit(TB_CFG_REQUEST_ERROR_SET, &req->flags);
+	}
+	spin_unlock_irqrestore(&req->result_lock, flags);
+}
+
 /**
  * tb_cfg_request_cancel() - Cancel a control request
  * @req: Request to cancel
@@ -590,7 +696,8 @@ void tb_cfg_request_cancel(struct tb_cfg_request *req, int err)
 		set_bit(TB_CFG_REQUEST_CANCELED, &req->flags);
 	cancel_work_sync(&req->work);
 	tb_cfg_request_dequeue(req);
-	req->result.err = err;
+	tb_cfg_request_set_error(req, err);
+	tb_cfg_request_release_callback_data(req);
 }
 
 static void tb_cfg_request_complete(void *data)
@@ -612,6 +719,7 @@ static void tb_cfg_request_complete(void *data)
  * Return: &struct tb_cfg_result with non-zero @err field if error
  * has occurred.
  */
+
 struct tb_cfg_result tb_cfg_request_sync(struct tb_ctl *ctl,
 					 struct tb_cfg_request *req,
 					 int timeout_msec)
@@ -621,18 +729,41 @@ struct tb_cfg_result tb_cfg_request_sync(struct tb_ctl *ctl,
 	DECLARE_COMPLETION_ONSTACK(done);
 	int ret;
 
-	ret = tb_cfg_request(ctl, req, tb_cfg_request_complete, &done);
+	/*
+	 * A user that times out goes on to call tb_cfg_request_cancel(), which
+	 * dereferences @ctl.  Register so that the channel is not freed under
+	 * it.
+	 */
+	ret = tb_ctl_sync_enter(ctl);
 	if (ret) {
 		res.err = ret;
 		return res;
 	}
 
+	/*
+	 * A synchronous request is completed by its callback, so the same
+	 * function serves as the cancel hook: a teardown that cancels the
+	 * request then wakes the waiter instead of leaving it to its timeout
+	 * with the control channel already gone.
+	 */
+	req->cancel = tb_cfg_request_complete;
+
+	ret = tb_cfg_request(ctl, req, tb_cfg_request_complete, &done);
+	if (ret) {
+		res.err = ret;
+		goto out;
+	}
+
 	if (!wait_for_completion_timeout(&done, timeout))
 		tb_cfg_request_cancel(req, -ETIMEDOUT);
 
 	flush_work(&req->work);
 
-	return req->result;
+	res = req->result;
+out:
+	tb_ctl_sync_exit(ctl);
+
+	return res;
 }
 
 /* public interface, alloc/start/stop/free */
@@ -664,6 +795,7 @@ struct tb_ctl *tb_ctl_alloc(struct tb_nhi *nhi, int index, int timeout_msec,
 	ctl->callback_data = cb_data;
 
 	mutex_init(&ctl->request_queue_lock);
+	init_waitqueue_head(&ctl->idle_wait);
 	INIT_LIST_HEAD(&ctl->request_queue);
 	ctl->frame_pool = dma_pool_create("thunderbolt_ctl", nhi->dev,
 					  TB_FRAME_SIZE, 4, 0);
@@ -735,7 +867,9 @@ void tb_ctl_start(struct tb_ctl *ctl)
 	for (i = 0; i < TB_CTL_RX_PKG_COUNT; i++)
 		tb_ctl_rx_submit(ctl->rx_packets[i]);
 
+	mutex_lock(&ctl->request_queue_lock);
 	ctl->running = true;
+	mutex_unlock(&ctl->request_queue_lock);
 }
 
 /**
@@ -743,7 +877,8 @@ void tb_ctl_start(struct tb_ctl *ctl)
  * @ctl: Control channel to stop
  *
  * All invocations of ctl->callback will have finished after this method
- * returns.
+ * returns.  The requests that are still in the request queue are left for
+ * tb_ctl_cancel_requests() to cancel.
  *
  * Must NOT be called from ctl->callback.
  */
@@ -753,15 +888,74 @@ void tb_ctl_stop(struct tb_ctl *ctl)
 	ctl->running = false;
 	mutex_unlock(&ctl->request_queue_lock);
 
+	/*
+	 * A request that passed the admission check is between the queue and
+	 * the TX ring and still hands its packet to the ring, so wait for it
+	 * before the rings are stopped.
+	 */
+	wait_event(ctl->idle_wait, !READ_ONCE(ctl->submitting));
+
 	tb_ring_stop(ctl->rx);
 	tb_ring_stop(ctl->tx);
 
 	if (!list_empty(&ctl->request_queue))
 		tb_ctl_WARN(ctl, "dangling request in request_queue\n");
-	INIT_LIST_HEAD(&ctl->request_queue);
 	tb_ctl_dbg(ctl, "control channel stopped\n");
 }
 
+/**
+ * tb_ctl_cancel_requests() - cancel the requests that are still queued
+ * @ctl: Control channel whose requests are canceled
+ *
+ * Cancels all the requests that are still in the request queue and releases
+ * the reference taken by tb_cfg_request_enqueue().  The request callbacks
+ * may take locks that the caller holds, so this must be called after
+ * tb_ctl_stop() and outside of any such lock.  Each request is kept alive
+ * until it has been canceled, so a completion work that runs in the
+ * meantime cannot free it under this function.
+ *
+ * Must NOT be called from ctl->callback.
+ */
+void tb_ctl_cancel_requests(struct tb_ctl *ctl)
+{
+	struct tb_cfg_request *req, *n;
+	LIST_HEAD(requests);
+
+	mutex_lock(&ctl->request_queue_lock);
+	list_for_each_entry_safe(req, n, &ctl->request_queue, list) {
+		/*
+		 * Take a reference and drop the one held by the queue while
+		 * the request is still protected by the lock.  The requests
+		 * are canceled outside of it and their completion work may
+		 * run in the meantime: without the extra reference it could
+		 * drop the last one and free the request under us.
+		 */
+		tb_cfg_request_get(req);
+		set_bit(TB_CFG_REQUEST_CANCELED, &req->flags);
+		clear_bit(TB_CFG_REQUEST_ACTIVE, &req->flags);
+		list_del_init(&req->list);
+		list_add_tail(&req->list, &requests);
+		tb_cfg_request_put(req);
+	}
+	mutex_unlock(&ctl->request_queue_lock);
+
+	list_for_each_entry_safe(req, n, &requests, list) {
+		cancel_work_sync(&req->work);
+		list_del_init(&req->list);
+		tb_cfg_request_set_error(req, -ENOTCONN);
+		tb_cfg_request_release_callback_data(req);
+		tb_cfg_request_put(req);
+	}
+
+	/*
+	 * @running has been cleared, so no new synchronous user can register.
+	 * Wait for the ones that did: a user whose wait timed out is about to
+	 * take @request_queue_lock in tb_cfg_request_cancel(), and the channel
+	 * must not be freed before it has returned.
+	 */
+	wait_event(ctl->idle_wait, !READ_ONCE(ctl->sync_users));
+}
+
 /* public interface, commands */
 
 /**
diff --git a/drivers/thunderbolt/ctl.h b/drivers/thunderbolt/ctl.h
index db1646eb4fd0..8ebfdef35f2f 100644
--- a/drivers/thunderbolt/ctl.h
+++ b/drivers/thunderbolt/ctl.h
@@ -25,6 +25,7 @@ struct tb_ctl *tb_ctl_alloc(struct tb_nhi *nhi, int index, int timeout_msec,
 			    event_cb cb, void *cb_data);
 void tb_ctl_start(struct tb_ctl *ctl);
 void tb_ctl_stop(struct tb_ctl *ctl);
+void tb_ctl_cancel_requests(struct tb_ctl *ctl);
 void tb_ctl_free(struct tb_ctl *ctl);
 
 /* configuration commands */
@@ -65,6 +66,8 @@ struct ctl_pkg {
  * @copy: Function used to copy the incoming packet to @response
  * @callback: Callback called when the request is finished successfully
  * @callback_data: Data to be passed to @callback
+ * @cancel: Callback called when the request is canceled before @callback
+ *	    had a chance to run
  * @flags: Flags for the request
  * @work: Work item used to complete the request
  * @result: Result after the request has been completed
@@ -89,6 +92,9 @@ struct tb_cfg_request {
 	bool (*copy)(struct tb_cfg_request *req, const struct ctl_pkg *pkg);
 	void (*callback)(void *callback_data);
 	void *callback_data;
+	void (*cancel)(void *callback_data);
+	/* serializes the publication of the terminal error */
+	spinlock_t result_lock;
 	unsigned long flags;
 	struct work_struct work;
 	struct tb_cfg_result result;
@@ -97,6 +103,9 @@ struct tb_cfg_request {
 
 #define TB_CFG_REQUEST_ACTIVE		0
 #define TB_CFG_REQUEST_CANCELED		1
+#define TB_CFG_REQUEST_COMPLETED	2
+#define TB_CFG_REQUEST_CANCEL_HANDLED	3
+#define TB_CFG_REQUEST_ERROR_SET	4
 
 struct tb_cfg_request *tb_cfg_request_alloc(void);
 void tb_cfg_request_get(struct tb_cfg_request *req);
diff --git a/drivers/thunderbolt/domain.c b/drivers/thunderbolt/domain.c
index 24611f05b3cd..40898c1ecd80 100644
--- a/drivers/thunderbolt/domain.c
+++ b/drivers/thunderbolt/domain.c
@@ -488,6 +488,14 @@ int tb_domain_add(struct tb *tb, bool reset)
 	tb_ctl_stop(tb->ctl);
 	mutex_unlock(&tb->lock);
 
+	/*
+	 * A failing driver_ready() or start() can leave requests behind, and
+	 * this domain is released without tb_domain_remove(), so the queue has
+	 * to be canceled here.  The callbacks take tb->lock, hence the unlock
+	 * above.
+	 */
+	tb_ctl_cancel_requests(tb->ctl);
+
 	return ret;
 }
 
@@ -507,6 +515,12 @@ void tb_domain_remove(struct tb *tb)
 	tb_ctl_stop(tb->ctl);
 	mutex_unlock(&tb->lock);
 
+	/*
+	 * The requests that were still in the queue are canceled here, outside
+	 * of tb->lock, because their callbacks take it.
+	 */
+	tb_ctl_cancel_requests(tb->ctl);
+
 	flush_workqueue(tb->wq);
 
 	if (tb->cm_ops->deinit)
diff --git a/drivers/thunderbolt/icm.c b/drivers/thunderbolt/icm.c
index a295a5e6cc9c..1e6ab9ca55f4 100644
--- a/drivers/thunderbolt/icm.c
+++ b/drivers/thunderbolt/icm.c
@@ -100,6 +100,7 @@ struct icm {
 	size_t max_boot_acl;
 	bool rpm;
 	bool can_upgrade_nvm;
+	bool stopped;
 	u8 proto_version;
 	struct usb4_switch_nvm_auth *last_nvm_auth;
 	bool veto;
@@ -2229,6 +2230,7 @@ static void icm_stop(struct tb *tb)
 	tb_switch_remove(tb->root_switch);
 	tb->root_switch = NULL;
 	nhi_mailbox_cmd(tb->nhi, NHI_MAILBOX_DRV_UNLOADS, 0);
+	icm->stopped = true;
 	kfree(icm->last_nvm_auth);
 	icm->last_nvm_auth = NULL;
 }
@@ -2249,12 +2251,27 @@ static void icm_usb4_switch_nvm_auth_complete(void *data)
 	       auth->reply.hdr.flags, auth->reply.status);
 
 	mutex_lock(&tb->lock);
+	/*
+	 * The domain may have been stopped while the response was on its way.
+	 * @last_nvm_auth was released by icm_stop() already, so release the
+	 * response here instead of leaking it.
+	 */
+	if (icm->stopped) {
+		mutex_unlock(&tb->lock);
+		kfree(auth);
+		return;
+	}
 	if (WARN_ON(icm->last_nvm_auth))
 		kfree(icm->last_nvm_auth);
 	icm->last_nvm_auth = auth;
 	mutex_unlock(&tb->lock);
 }
 
+static void icm_usb4_switch_nvm_auth_cancel(void *data)
+{
+	kfree(data);
+}
+
 static int icm_usb4_switch_nvm_authenticate(struct tb *tb, u64 route)
 {
 	struct usb4_switch_nvm_auth *auth;
@@ -2280,6 +2297,7 @@ static int icm_usb4_switch_nvm_authenticate(struct tb *tb, u64 route)
 
 	req->match = icm_match;
 	req->copy = icm_copy;
+	req->cancel = icm_usb4_switch_nvm_auth_cancel;
 	req->request = &auth->request;
 	req->request_size = sizeof(auth->request);
 	req->request_type = TB_CFG_PKG_ICM_CMD;
-- 
2.34.1


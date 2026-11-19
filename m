Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795087154;
	b=ig9L9m0yo+hByNEeTyNo7rN1vufYqJzWhATc71grVJS3GOUljfD5lssBxgDYh0H898ix
	 qEx5ZSdG2JG9VC987q5BrWa1YVIwq1dMLSy1rV4o8yAFpUXb8bFPOFCal67vdFWHzhDJv
	 9f7UG+H4gQBc8ynheciu4rjRZZZ8zszPaYLLbtzf6TvY7aesehhsBzChy+VzARQ4QfAi1
	 DvJeNBy5xpc+Lgvuj9IH+W8INM168OQ34JfarKx0g9vEEeZVAy+VKSqjK3KcRAkHBvpSZ
	 bqukj/61Wzg0vBWMhaguA+QRpdGje7IId6biZZmZ8rDy7YxwOGLz8O3n8Fc9fWOt1Wg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795087154;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=8O6OA/JT665LGVj3CH9y9GXSHfmaVipuZr0wbePfbbE=;
	b=Ti2sbLN98/7xMRY/xiz2iGfN2+y7EAX62guEesGNu7Mna+wDD1MqUoivEXiaPRwZaM8K
	 nLIsfLeiNAPejWqdLJgU+H9y76HBTUWmQcz6tvAp6KC1ouipplTy0r1ONUbKQ+9JTQLUw
	 ryPqfIYMgu/haJ7NRad0Ss1budvU69m8M23mAgCguZ58aR5TDc9UcYZd0/6WP8aRQt3ch
	 RjsDk5XeogEwjxNVyEGhYPYODDuzYB1jLw935qXY8nUdIrBB1Xxm1xb7hMBoCqD5nAxAm
	 x0hj710ylKI2v07xm/ainqOpaSMT/HPKKZexy0UOpCEC6KiX+jloUWifqLyYHpBydmQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ubBxL4Dm;
	arc=none smtp.remote-ip=74.125.82.175
Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E335760A260E
	for <linux-usb@vger.kernel.org>; Thu, 19 Nov 2026 11:19:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E335760A260E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ubBxL4Dm
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-3282db206d3so5634736eec.0
        for <linux-usb@vger.kernel.org>; Thu, 19 Nov 2026 03:19:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795087153; x=1795691953; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8O6OA/JT665LGVj3CH9y9GXSHfmaVipuZr0wbePfbbE=;
        b=ubBxL4DmfoeyIih0wuqEv6tssDlPVmD+9OQ6J63RcwDJeG2ga/zKRsyTT0d1CmHB5U
         kpilmmd/FsISpSCu05uUXEKFUyxl8pO3CaGf7n9OTmp1uUFRWzU7072KFbR8Fib17gMh
         lVjKT06ea7NdjwiKJ2QeA6g/Ic/tsUBD7IbSWK8LJa2FULb2IxHoaqm2anzvpMBjKSxp
         n/RV3L6uF4jygKdX2Q+GMG6SBnTZ8PH0u9lLm7XIZd0VbFfK57Y6CaWS9b1D5304Scvd
         6cUFv96F982iKxethl+jTh8WEFvTZFFJdOZ6vZ3Fnk3iIqayGp0KjlQTSZUHVse2vqPp
         5wjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795087153; x=1795691953;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=8O6OA/JT665LGVj3CH9y9GXSHfmaVipuZr0wbePfbbE=;
        b=IGD4eSj8UOh9kHXcQs0ynbFVZ1dzFPcWT7vt+41Ov49tx3w25rCOkNn5wKDWU2PTQM
         R0hxWYohq5MYqt67Eat4m+VuVy8lCYe3DgUZhqP5b3BceuFupOm8YgNpUizcHU3rDErv
         Jp984Pd8IybNiNh9/2YnMZKzQtJQjYCRuIS834NvkH61d3+NDgj8DNZ6o5P27m9jEbCf
         EKFVFc2zS8/EoTfbmwg1BQUwblBIv/BMrvvT07WT9SzSbgBy7jLyr33iJdU1ZF9LuG0S
         sO6X9w/EGiXamX1L7Y2VEpHqDZK9WQR2BTHI+72y06RT9g575nArywLWkQeICXjNL3WU
         Wocw==
X-Forwarded-Encrypted: i=1; AL+hErEhTi7CmgFjMJCp81ZnK55UZepKfxUYMRzUrW+NvmIwlV54KNwk2g6+kCWBjD3IFe2elgY2D3LY8Ag=@vger.kernel.org
X-Gm-Message-State: APuU4Z/Q5kPD+xx9SJXjVN6UvhHTeTwA6UJTNPYTdvv7z9EM+rA+6dP6
	jMnNAb9DAL8Scp9eCNBdXeuP+38jidve5qFtxjsOuu4MZIiyalz0oGVK
X-Gm-Gg: AZFdTZdF01+VN4AlTE7KCUjdMrVwszbnNO6kbyaYn89Dht2zQ0VMrjfAJQZGwcLTaFL
	/u/LVpEQJh3nKrdyaSPV9DEIUYUc3Xd9XFXzLx3hhWhcqF58Ub/K02p0ZiRjTSI4axiTUwNiPbg
	siFy6Haau4H3hvPKj/GFCuACuj9kL2gdwF60IANZSiW5PcrqmCzPfVmN8xq570UXXUR0E1LG7/C
	EhIFH0WOqfYqaN1XUF0T9tM+f45dmMgd8EM8qp6ch+ObCZM0zHJIQuoB1N59MDIs2USZbiokmY6
	XkuPcpxAy0cnnN0EPRcIPqVFc82ID71rlUCi6i2pA7IEV0d1WmuJeYitmfQza/l4e4OUo6tOZZ6
	IryD+yf6J+KY1rVEtCowurXIKEueAEmigZoY7HBcH/lK9HNyl0zHPvdA1m+fPI350EnlaOU/O9b
	EDyNeaXTAYnOlNspvNRfNXDZjKdy99YbR6g3VuJYvLuhjGWWo2spmKKUsreLyTyn5Kqq8o0m7D0
	iF3XFtma1LauoL6slph1ccyhEo+gymgWdzn3uEBpHjiO1jUsAlwzcMkcoCYFIggE6fWLnP2wKQv
	Xu4CJ4SWciq0zDnbSSCPYQR8+ZhyOW2ixG9oLJrqiDeCG5E065v9qjS+djVfyMZ6xIvJE3d5Axm
	knhmPsEje7LpSey3yeo3cuwbvDziTOq0Ecb2N8CXpSSAZ2J00eX983ySnNm6sSChwjCFDKQ==
X-Received: by 2002:a05:7301:1522:b0:374:e25e:a533 with SMTP id 5a478bee46e88-3828141dcedmr5489342eec.35.1795087152635;
        Thu, 19 Nov 2026 03:19:12 -0800 (PST)
Received: from lwq-server.tail118c18.ts.net ([74.176.208.23])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-382a6df02adsm17546603eec.14.2026.11.19.03.19.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 03:19:12 -0800 (PST)
From: Yaohan Li <shunsheng1218@gmail.com>
To: Mika Westerberg <westeri@kernel.org>
Cc: Andreas Noever <andreas.noever@gmail.com>,
	Yehezkel Bernat <YehezkelShB@gmail.com>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH v2] thunderbolt: cancel the queued control requests on teardown
Date: Thu, 19 Nov 2026 19:19:07 +0800
Message-Id: <20261119111907.3616041-1-shunsheng1218@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261119075557.3399335-1-shunsheng1218@gmail.com>
References: <20261119075557.3399335-1-shunsheng1218@gmail.com>
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

Splice the queue instead, cancel the work and release the callback data
with -ENOTCONN.  The reference the queue held is taken before the request
becomes unprotected, so a completion that runs in the meantime cannot
free it under the loop.

The terminal state is published once.  A request can be canceled by its
owner after a timeout and by the teardown at the same time, so the error
and the cancellation hook run under one small lock, and only for a request
whose completion work has not finished: both callers reach this after
cancel_work_sync(), so a request whose callback already ran keeps the
result it published instead of being turned into -ENOTCONN.

A synchronous request waits on a completion that it passes as the callback
data, and a canceled request never runs its callback.  It installs that
same completion as its cancel hook so the teardown wakes it.  The hook runs
under the same lock, and the owner takes that lock before its stack
completion goes away and clears the hook, so a hook that is still running
on another thread has finished by the time the waiter returns.

The callback data can be the request itself: __tb_xdomain_response() hands
its reference to response_ready(), which is the callback.  A request that
is canceled instead never runs it, so the same function is installed as the
cancel hook and releases the reference from there.  The submission failure
path already drops it and keeps doing so.

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

Fixes: d7f781bfdbf4 ("thunderbolt: Rework control channel to be more reliable")
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
ring.

All 42 assertions pass on this patch.  Against 666539eecdf4 the same
scenarios fail (the ring is stopped before the submitter returns, tx=2
stop=1).  The five interleavings added for the cancellation protocol are:

 - a cancel hook that is parked inside the lock blocks the second canceller
   until it returns, and the hook runs exactly once;
 - a synchronous owner that is woken by the teardown clears its stack
   completion hook before it returns, and reads the published result;
 - a request whose callback already ran keeps its result when the teardown
   cancels it afterwards, and its cancel hook is not called;
 - a request whose callback and cancel hook hand over the same reference
   (the __tb_xdomain_response() pattern) releases it when it is canceled,
   which the test checks through a reference it keeps itself;
 - the worst case of the two: the synchronous owner runs into its timeout
   while the teardown's hook is parked inside the lock just before it wakes
   the owner.  The owner must not return before that hook finishes, and the
   result it reads is the one the teardown published.

The Thunderbolt controller itself was not available, so no hardware timing
was exercised.

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
 drivers/thunderbolt/ctl.c     | 239 ++++++++++++++++++++++++++++++++--
 drivers/thunderbolt/ctl.h     |  18 +++
 drivers/thunderbolt/domain.c  |  14 ++
 drivers/thunderbolt/icm.c     |  21 +++
 drivers/thunderbolt/xdomain.c |   6 +
 5 files changed, 286 insertions(+), 12 deletions(-)

diff --git a/drivers/thunderbolt/ctl.c b/drivers/thunderbolt/ctl.c
index 965988b18608..5ff0e04b8265 100644
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
@@ -528,12 +534,73 @@ static void tb_cfg_request_work(struct work_struct *work)
 {
 	struct tb_cfg_request *req = container_of(work, typeof(*req), work);
 
-	if (!tb_cfg_request_is_canceled(req))
+	if (!tb_cfg_request_is_canceled(req)) {
 		req->callback(req->callback_data);
+		set_bit(TB_CFG_REQUEST_COMPLETED, &req->flags);
+	}
 
 	tb_cfg_request_dequeue(req);
 }
 
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
 /**
  * tb_cfg_request() - Start control request not waiting for it to complete
  * @ctl: Control channel to use
@@ -551,7 +618,13 @@ int tb_cfg_request(struct tb_ctl *ctl, struct tb_cfg_request *req,
 {
 	int ret;
 
+	ret = tb_ctl_submit_enter(ctl);
+	if (ret)
+		return ret;
+
 	req->flags = 0;
+	spin_lock_init(&req->result_lock);
+	mutex_init(&req->cancel_lock);
 	req->callback = callback;
 	req->callback_data = callback_data;
 	INIT_WORK(&req->work, tb_cfg_request_work);
@@ -559,23 +632,70 @@ int tb_cfg_request(struct tb_ctl *ctl, struct tb_cfg_request *req,
 
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
+/*
+ * Terminal state of a request that is canceled instead of completed.  If
+ * @callback did not get a chance to run then the owner of @callback_data
+ * did not get a chance to release it either, so the cancel hook releases it
+ * instead; it runs at most once because a request can be canceled by its
+ * owner and by tb_ctl_cancel_requests() at the same time.
+ *
+ * @cancel_lock serializes the hook with the synchronous owner, which takes
+ * the same lock before the completion it passed as @callback_data goes
+ * away.  Both callers reach this after cancel_work_sync(), so the completion
+ * work cannot be finishing the request at the same time: a request whose
+ * callback already ran keeps the result it published.
+ */
+static void tb_cfg_request_finish_cancel(struct tb_cfg_request *req, int err)
+{
+	mutex_lock(&req->cancel_lock);
+	if (!test_bit(TB_CFG_REQUEST_COMPLETED, &req->flags)) {
+		tb_cfg_request_set_error(req, err);
+
+		if (req->cancel &&
+		    !test_and_set_bit(TB_CFG_REQUEST_CANCEL_HANDLED,
+				      &req->flags))
+			req->cancel(req->callback_data);
+	}
+	mutex_unlock(&req->cancel_lock);
+}
+
 /**
  * tb_cfg_request_cancel() - Cancel a control request
  * @req: Request to cancel
@@ -590,7 +710,7 @@ void tb_cfg_request_cancel(struct tb_cfg_request *req, int err)
 		set_bit(TB_CFG_REQUEST_CANCELED, &req->flags);
 	cancel_work_sync(&req->work);
 	tb_cfg_request_dequeue(req);
-	req->result.err = err;
+	tb_cfg_request_finish_cancel(req, err);
 }
 
 static void tb_cfg_request_complete(void *data)
@@ -612,6 +732,7 @@ static void tb_cfg_request_complete(void *data)
  * Return: &struct tb_cfg_result with non-zero @err field if error
  * has occurred.
  */
+
 struct tb_cfg_result tb_cfg_request_sync(struct tb_ctl *ctl,
 					 struct tb_cfg_request *req,
 					 int timeout_msec)
@@ -621,18 +742,50 @@ struct tb_cfg_result tb_cfg_request_sync(struct tb_ctl *ctl,
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
+	/*
+	 * A teardown can cancel the request on another thread and run the
+	 * hook above while this one is already returning.  Taking the same
+	 * lock waits for that invocation, and clearing the hook keeps it away
+	 * from @done once this function returns.
+	 */
+	mutex_lock(&req->cancel_lock);
+	res = req->result;
+	req->cancel = NULL;
+	mutex_unlock(&req->cancel_lock);
+out:
+	tb_ctl_sync_exit(ctl);
+
+	return res;
 }
 
 /* public interface, alloc/start/stop/free */
@@ -664,6 +817,7 @@ struct tb_ctl *tb_ctl_alloc(struct tb_nhi *nhi, int index, int timeout_msec,
 	ctl->callback_data = cb_data;
 
 	mutex_init(&ctl->request_queue_lock);
+	init_waitqueue_head(&ctl->idle_wait);
 	INIT_LIST_HEAD(&ctl->request_queue);
 	ctl->frame_pool = dma_pool_create("thunderbolt_ctl", nhi->dev,
 					  TB_FRAME_SIZE, 4, 0);
@@ -735,7 +889,9 @@ void tb_ctl_start(struct tb_ctl *ctl)
 	for (i = 0; i < TB_CTL_RX_PKG_COUNT; i++)
 		tb_ctl_rx_submit(ctl->rx_packets[i]);
 
+	mutex_lock(&ctl->request_queue_lock);
 	ctl->running = true;
+	mutex_unlock(&ctl->request_queue_lock);
 }
 
 /**
@@ -743,7 +899,8 @@ void tb_ctl_start(struct tb_ctl *ctl)
  * @ctl: Control channel to stop
  *
  * All invocations of ctl->callback will have finished after this method
- * returns.
+ * returns.  The requests that are still in the request queue are left for
+ * tb_ctl_cancel_requests() to cancel.
  *
  * Must NOT be called from ctl->callback.
  */
@@ -753,15 +910,73 @@ void tb_ctl_stop(struct tb_ctl *ctl)
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
+		tb_cfg_request_finish_cancel(req, -ENOTCONN);
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
index db1646eb4fd0..38765ea267c0 100644
--- a/drivers/thunderbolt/ctl.h
+++ b/drivers/thunderbolt/ctl.h
@@ -25,6 +25,7 @@ struct tb_ctl *tb_ctl_alloc(struct tb_nhi *nhi, int index, int timeout_msec,
 			    event_cb cb, void *cb_data);
 void tb_ctl_start(struct tb_ctl *ctl);
 void tb_ctl_stop(struct tb_ctl *ctl);
+void tb_ctl_cancel_requests(struct tb_ctl *ctl);
 void tb_ctl_free(struct tb_ctl *ctl);
 
 /* configuration commands */
@@ -65,6 +66,10 @@ struct ctl_pkg {
  * @copy: Function used to copy the incoming packet to @response
  * @callback: Callback called when the request is finished successfully
  * @callback_data: Data to be passed to @callback
+ * @cancel: Callback called when the request is canceled before @callback
+ *	    had a chance to run
+ * @result_lock: Serializes the publication of the terminal error
+ * @cancel_lock: Serializes the cancellation hook with the request owner
  * @flags: Flags for the request
  * @work: Work item used to complete the request
  * @result: Result after the request has been completed
@@ -89,6 +94,16 @@ struct tb_cfg_request {
 	bool (*copy)(struct tb_cfg_request *req, const struct ctl_pkg *pkg);
 	void (*callback)(void *callback_data);
 	void *callback_data;
+	void (*cancel)(void *callback_data);
+	/* serializes the publication of the terminal error */
+	spinlock_t result_lock;
+	/*
+	 * Serializes the terminal error and the cancellation hook.  A
+	 * synchronous owner takes it before it returns, so a hook that the
+	 * teardown runs on another thread is done with the completion the
+	 * owner passed as @callback_data before that completion goes away.
+	 */
+	struct mutex cancel_lock;
 	unsigned long flags;
 	struct work_struct work;
 	struct tb_cfg_result result;
@@ -97,6 +112,9 @@ struct tb_cfg_request {
 
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
index a295a5e6cc9c..1e86c3df4202 100644
--- a/drivers/thunderbolt/icm.c
+++ b/drivers/thunderbolt/icm.c
@@ -75,6 +75,8 @@ struct usb4_switch_nvm_auth {
  * @max_boot_acl: Maximum number of preboot ACL entries (%0 if not supported)
  * @rpm: Does the controller support runtime PM (RTD3)
  * @can_upgrade_nvm: Can the NVM firmware be upgrade on this controller
+ * @stopped: Set while the domain is being removed; late NVM_AUTH results
+ *	     are dropped instead of touching the request that is gone
  * @proto_version: Firmware protocol version
  * @last_nvm_auth: Last USB4 router NVM_AUTH result (or %NULL if not set)
  * @veto: Is RTD3 veto in effect
@@ -100,6 +102,8 @@ struct icm {
 	size_t max_boot_acl;
 	bool rpm;
 	bool can_upgrade_nvm;
+	/* set while the domain is being removed; late responses are dropped */
+	bool stopped;
 	u8 proto_version;
 	struct usb4_switch_nvm_auth *last_nvm_auth;
 	bool veto;
@@ -2229,6 +2233,7 @@ static void icm_stop(struct tb *tb)
 	tb_switch_remove(tb->root_switch);
 	tb->root_switch = NULL;
 	nhi_mailbox_cmd(tb->nhi, NHI_MAILBOX_DRV_UNLOADS, 0);
+	icm->stopped = true;
 	kfree(icm->last_nvm_auth);
 	icm->last_nvm_auth = NULL;
 }
@@ -2249,12 +2254,27 @@ static void icm_usb4_switch_nvm_auth_complete(void *data)
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
@@ -2280,6 +2300,7 @@ static int icm_usb4_switch_nvm_authenticate(struct tb *tb, u64 route)
 
 	req->match = icm_match;
 	req->copy = icm_copy;
+	req->cancel = icm_usb4_switch_nvm_auth_cancel;
 	req->request = &auth->request;
 	req->request_size = sizeof(auth->request);
 	req->request_type = TB_CFG_PKG_ICM_CMD;
diff --git a/drivers/thunderbolt/xdomain.c b/drivers/thunderbolt/xdomain.c
index 45e26833c953..d82056c3cbc0 100644
--- a/drivers/thunderbolt/xdomain.c
+++ b/drivers/thunderbolt/xdomain.c
@@ -150,6 +150,12 @@ static int __tb_xdomain_response(struct tb_ctl *ctl, const void *response,
 	req->request = response;
 	req->request_size = size;
 	req->request_type = type;
+	/*
+	 * The reference taken here belongs to the callback once the request is
+	 * submitted.  A teardown that cancels the request never runs the
+	 * callback, so the same function has to release it.
+	 */
+	req->cancel = response_ready;
 
 	ret = tb_cfg_request(ctl, req, response_ready, req);
 	if (ret)
-- 
2.34.1


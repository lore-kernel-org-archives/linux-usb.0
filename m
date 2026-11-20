Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795148849;
	b=huszrXl4YS23ljLGJpXVdemX1bI4Yq7aGibz20hqEl08Ey9u1qmarK4/BUTYBsWPA0Gi
	 XKCBN4ym8yz0kjfsyp7OeFbAOF77TTkcw2BBk/3GjV2EbRiTT/rhfjyLUlBAnuM2CTJv2
	 mU3mnuUGhV0KV05CttYZOPs8p7p6Y1GFJxLiNr/qy2YbUirZxAKycd1nklSI0oDxou09q
	 T4/elnUWUFJl5YFPMLO/AfJlVoNTDvk1yx3GvfK9p1fZAj+0mCt5tIO7lqvOA3/C8Seri
	 akSjWqj6ANW04nW1wkzsg9MnIgn/XF5HXtCnrYYXJ08msYxOVJAbOZ4H6w1fVYoa3AQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795148849;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=garnFC8C3YSpOmHRt2U0/jhG+X+PYFnA/y2cB3ppLtI=;
	b=xFjnCBW4hZLqmK9HQVmcA8OojFk1ZK2VmTpiUoQIDQiWMND0ToFXGMh0r3IsMxiilzIo
	 VOSSZQDAsWiKofhrZUhl7IKEi3meITrYFf58h04F3T3yxOOXc6wzOTCwYOK2Ie8FurNzk
	 UnV5fLJc0JG9JyONyC8qHdNaikbSFN08/C9+JDgH1TqhFH/i4enhR1NMX3k4kbB4ERnK/
	 /yxr7GVffK9wpLPbpZcnpSGNpcpmwpdsPIbHNoVNucRcKSGWLhU26ddZUvr2tFIJvg4xu
	 5/JjhR7srhrAw92kkdQgVy9TAa+MsfuL9y6A1joyuAhUmFLKo8/HuMyArmZwV4raJtA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZixdZJb+;
	arc=none smtp.remote-ip=209.85.214.176
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF3F0606A320
	for <linux-usb@vger.kernel.org>; Fri, 20 Nov 2026 04:27:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DF3F0606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZixdZJb+
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2efd659464aso1474645ad.3
        for <linux-usb@vger.kernel.org>; Thu, 19 Nov 2026 20:27:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795148848; x=1795753648; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=garnFC8C3YSpOmHRt2U0/jhG+X+PYFnA/y2cB3ppLtI=;
        b=ZixdZJb+vYMKOv6sexdI6PmvIujVKdAqkjZBcCiG4wp1exefhBjoPJrU+3bGG02MaN
         kVI2Z72Bug43YRbZk15Qr8Rb8blOFip6djCZSyqAiw6sd7KfPSiNkW3oowR4MeduqPzr
         /SR6PgeysmV70GTPjLzsoi1XD6l8L9gHOjWPDfXXBrgcvAOQi3PWra3IPcJ+2U8oumKx
         SyMpdhzEkvyYLb7ZsOOhjJyzvV14TI3zuIgygXAIJbvUcbY9++USmPAUVAieu7fR1PLR
         JXfd67lDCjlB4WweIw7imP68c7rs+gkpvLOOgm/C9eIOyhMdFAIoRC83pFoxKHjlPn9j
         dNPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795148848; x=1795753648;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=garnFC8C3YSpOmHRt2U0/jhG+X+PYFnA/y2cB3ppLtI=;
        b=I7U9eLAnyYAlckM3HijpGkZRcVMkdHPpGVyhhDxgQFiu9wFwYdivV5YYDKyQKIpDL5
         iBodG3f7HcKY3p+4pBPl0/WJ1pNS6QC1C2kC1XG41+ivgbbt2YohdlDWjHQVjyWRssZG
         ufXZhp8owNSaCHphwi9TfEHex2wJlpBYyY96U5I9b6eUNNfcaY01OMhimfYDFqyqVCcR
         Ko2luWKGXqsvUcsQDF0UqyCrTBXulTPNDwadYEQc2WJHhSDih+/XIOGJ8ZIZX2IlgOvP
         ZcK4nHH3p5ADJQGd7J0YCSh2/J4iCdK9rAuCsawQeRL5MRrjs+ToZyUJNwH/D6fGrjqY
         8XIA==
X-Forwarded-Encrypted: i=1; AL+hErGwAPPAd4t74YFnYTq7ji9QVPVtgKYqXl0InXA9kR38wjJ21+Bh0arXu7qyILK9xrqsYS1ihgHJ6zY=@vger.kernel.org
X-Gm-Message-State: APuU4Z8X2Pr8vIJu3mtYjc+bULWAMbayIXPivo5mHfdz85zmTvA8gI/G
	jIz0UOE/rHq+S81/BzxMr2jbdnDI1AYM7f3SvyKGTTzvcCn7hh1LA5jqnLFqCf5wc2JY5g==
X-Gm-Gg: AZFdTZcvjGp536e1OR0tif5HPIeSfeljzUWsP3sLt+T7aywkRxeE1qR299lcVTyodRT
	97KQ68Wv0kOaGFGwciJgdUM7Ca4fish5106qquoCmWJX19ZZFbZ7+gwPW8I3UyziQdexPac0hys
	jZPchIdZaw+ZOxjkKIN5BIkvLomP62lHAFxZk7sPtUFozgoE8sXMY5Odvd0NQ+ZMP7STZUOHMZ8
	kSQfsEGw+LFywqTC2XcwaxcGE9Gx5CbT4TuTICsHE6UT5jioledHcEC/q1iy4sRfWOS+Lh1kHBj
	6vd3VlML3cyyHhJI/pLgjjP2h8SXusc+cQRxYqlsOBZz1YrzcyU3DEZJZbCyaYixydkoL6fEsA8
	5lnfCjiTQZMmI3zuUlU0oyuMFD5TIImnA92ooOkf3B4rZTtvLoc4qJPH14psB1C/3PNkHQEvcNF
	hyAwe16DcU8g2nJ2+Gkpub46so28qtueomvlpmYFM6UQTpVEIDM5hH5b3BJ7I8It6Q/02Z14MAj
	U4+J/1jt3Qki/M3tb5pRvUxjJne/gO9bCWLa4XWJn5hxETd9wPDJMK2ZPo7TiNwtKYQeO8y0jTW
	hI2duONHVmb6vX1Chna9ySHCpjOv13TRXqCseSvRnZXv1/CN4IJvA8LPgkHhO6m+zl3PImyrReU
	lxPDF0fRlvv88LN9akn83QoWoQ8CGsDFvSlI7MKI4orcIybU=
X-Received: by 2002:a17:902:ec8b:b0:2f0:20cc:32fd with SMTP id d9443c01a7336-2f03f17e8acmr18113495ad.51.1795148847647;
        Thu, 19 Nov 2026 20:27:27 -0800 (PST)
Received: from lwq-server.tail118c18.ts.net ([74.176.208.23])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f1207f1sm7948745ad.64.2026.11.19.20.27.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 20:27:27 -0800 (PST)
From: Yaohan Li <shunsheng1218@gmail.com>
To: Mika Westerberg <westeri@kernel.org>
Cc: Andreas Noever <andreas.noever@gmail.com>,
	Yehezkel Bernat <YehezkelShB@gmail.com>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH v3] thunderbolt: cancel the queued control requests on teardown
Date: Fri, 20 Nov 2026 12:27:21 +0800
Message-Id: <20261120042721.420468-1-shunsheng1218@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261119111907.3616041-1-shunsheng1218@gmail.com>
References: <20261119111907.3616041-1-shunsheng1218@gmail.com>
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
timeout and the cancel, and the teardown can run in between; the retry
loops in tb_cfg_read_raw(), tb_cfg_write_raw() and icm_request() keep
using it after one request has finished, and so do tb_cfg_read() and
tb_cfg_write() when they report the result.  Every user is therefore
registered on the channel with two counters, both taken under
request_queue_lock - the lock tb_ctl_stop() uses to clear @running, so no
user can appear once the channel has been stopped.  @submitting covers
the first window, and the rings are not stopped before it drops to zero;
@sync_users covers the second from the first access to the last one, and
tb_ctl_cancel_requests() waits for it before the channel may be freed.

Dropping the counter is not enough.  The thread that drops the last one
still holds @request_queue_lock until its ..._exit() returns, so both
waits are followed by taking and releasing that lock: after that the last
user has left the channel, not just the count.

A config access that is rejected or canceled because the channel is going
away now returns -ENOTCONN from tb_cfg_read() and tb_cfg_write() instead
of falling into their default branch and warning.

tb_ctl_stop() no longer warns about requests left in the queue.  They are
expected to be there: they are what tb_ctl_cancel_requests() runs on next,
and the unlocked list_empty() check did not match a queue that is modified
under request_queue_lock.

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

All 47 assertions pass on this patch.  Against 666539eecdf4 the same
scenarios fail (the ring is stopped before the submitter returns, tx=2
stop=1).  The additional controlled interleavings cover:

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
   result it reads is the one the teardown published;
 - a config read that is inside its retry loop when the channel is stopped:
   the teardown returns only after the whole read has left the channel, the
   read ends with -ENOTCONN, and the admission counter is back to zero;
 - tb_cfg_read() on a torn down channel returns -ENOTCONN and the log has no
   warning from it.

The read that is inside its retry loop is also the only case that observes
the wait itself; the moment between its decrement of @sync_users and the
release of @request_queue_lock cannot be parked in from the test, so that
ordering rests on the code and not on a reproduced interleaving.

The remaining callers that submit on the TX ring were audited instead of
being admitted, because each already sits behind an outer guarantee.
tb_cfg_ack_notification() and tb_cfg_ack_plug() are called only from the
control channel callback, which runs in ring_work() and is therefore
finished when tb_ring_stop(ctl->rx) returns; tb_ctl_stop() stops the RX ring
before the TX ring, so those acks cannot reach a stopped TX ring.
tb_cfg_reset() reads ctl->timeout_msec before tb_cfg_request_sync() admits
the user, but both of its callers (tb_start() and tb_resume_noirq()) hold
tb->lock for the whole call, and the channel is released from
tb_domain_remove(), which takes the same lock; the request that follows is
then either admitted or refused by tb_cfg_request_sync().

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
the list traffic: no fix for this teardown is in flight.  The AMD USB4 router
work from 2026-10 ("Fix tb->lock deadlock during hot-unplug on AMD USB4
routers") moves the router reset and does not cancel control requests, so the
two do not overlap.

AI assistance: the analysis, the change and its review notes were
prepared with Claude (Anthropic) as a coding assistant.  The author
reviewed the reasoning and takes responsibility for the content.
---
 drivers/thunderbolt/ctl.c     | 362 ++++++++++++++++++++++++++++++----
 drivers/thunderbolt/ctl.h     |  20 ++
 drivers/thunderbolt/domain.c  |  14 ++
 drivers/thunderbolt/icm.c     |  38 +++-
 drivers/thunderbolt/xdomain.c |   6 +
 5 files changed, 404 insertions(+), 36 deletions(-)

diff --git a/drivers/thunderbolt/ctl.c b/drivers/thunderbolt/ctl.c
index 965988b18608..1233aebc6f7d 100644
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
@@ -528,12 +534,74 @@ static void tb_cfg_request_work(struct work_struct *work)
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
+ * @sync_users covers every synchronous user of @ctl, from the moment it
+ * starts using the channel until its last access: a single request that
+ * waits, times out and cancels, and also the retry loops and error paths
+ * that keep using the channel after one request has finished.
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
+int tb_ctl_sync_enter(struct tb_ctl *ctl)
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
+void tb_ctl_sync_exit(struct tb_ctl *ctl)
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
@@ -551,7 +619,13 @@ int tb_cfg_request(struct tb_ctl *ctl, struct tb_cfg_request *req,
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
@@ -559,23 +633,70 @@ int tb_cfg_request(struct tb_ctl *ctl, struct tb_cfg_request *req,
 
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
@@ -590,7 +711,7 @@ void tb_cfg_request_cancel(struct tb_cfg_request *req, int err)
 		set_bit(TB_CFG_REQUEST_CANCELED, &req->flags);
 	cancel_work_sync(&req->work);
 	tb_cfg_request_dequeue(req);
-	req->result.err = err;
+	tb_cfg_request_finish_cancel(req, err);
 }
 
 static void tb_cfg_request_complete(void *data)
@@ -612,6 +733,7 @@ static void tb_cfg_request_complete(void *data)
  * Return: &struct tb_cfg_result with non-zero @err field if error
  * has occurred.
  */
+
 struct tb_cfg_result tb_cfg_request_sync(struct tb_ctl *ctl,
 					 struct tb_cfg_request *req,
 					 int timeout_msec)
@@ -621,18 +743,50 @@ struct tb_cfg_result tb_cfg_request_sync(struct tb_ctl *ctl,
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
@@ -664,6 +818,7 @@ struct tb_ctl *tb_ctl_alloc(struct tb_nhi *nhi, int index, int timeout_msec,
 	ctl->callback_data = cb_data;
 
 	mutex_init(&ctl->request_queue_lock);
+	init_waitqueue_head(&ctl->idle_wait);
 	INIT_LIST_HEAD(&ctl->request_queue);
 	ctl->frame_pool = dma_pool_create("thunderbolt_ctl", nhi->dev,
 					  TB_FRAME_SIZE, 4, 0);
@@ -735,7 +890,9 @@ void tb_ctl_start(struct tb_ctl *ctl)
 	for (i = 0; i < TB_CTL_RX_PKG_COUNT; i++)
 		tb_ctl_rx_submit(ctl->rx_packets[i]);
 
+	mutex_lock(&ctl->request_queue_lock);
 	ctl->running = true;
+	mutex_unlock(&ctl->request_queue_lock);
 }
 
 /**
@@ -743,7 +900,8 @@ void tb_ctl_start(struct tb_ctl *ctl)
  * @ctl: Control channel to stop
  *
  * All invocations of ctl->callback will have finished after this method
- * returns.
+ * returns.  The requests that are still in the request queue are left for
+ * tb_ctl_cancel_requests() to cancel.
  *
  * Must NOT be called from ctl->callback.
  */
@@ -753,15 +911,90 @@ void tb_ctl_stop(struct tb_ctl *ctl)
 	ctl->running = false;
 	mutex_unlock(&ctl->request_queue_lock);
 
+	/*
+	 * A request that passed the admission check is between the queue and
+	 * the TX ring and still hands its packet to the ring, so wait for it
+	 * before the rings are stopped.
+	 */
+	wait_event(ctl->idle_wait, !READ_ONCE(ctl->submitting));
+
+	/*
+	 * The submitter that dropped @submitting still holds
+	 * @request_queue_lock until tb_ctl_submit_exit() returns.  Taking the
+	 * lock here waits for that, so the channel is not freed while the
+	 * last user is still inside it.
+	 */
+	mutex_lock(&ctl->request_queue_lock);
+	mutex_unlock(&ctl->request_queue_lock);
+
+	/*
+	 * The RX callback acks notifications and hot plug events through
+	 * tb_cfg_ack_notification() and tb_cfg_ack_plug(), which submit on
+	 * the TX ring.  Stopping the RX ring waits for the callbacks it has
+	 * dispatched, so it has to happen before the TX ring is stopped.
+	 */
 	tb_ring_stop(ctl->rx);
 	tb_ring_stop(ctl->tx);
 
-	if (!list_empty(&ctl->request_queue))
-		tb_ctl_WARN(ctl, "dangling request in request_queue\n");
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
+
+	/* As in tb_ctl_stop(): wait for the last user to leave the lock. */
+	mutex_lock(&ctl->request_queue_lock);
+	mutex_unlock(&ctl->request_queue_lock);
+}
+
 /* public interface, commands */
 
 /**
@@ -904,6 +1137,9 @@ static bool tb_cfg_copy(struct tb_cfg_request *req, const struct ctl_pkg *pkg)
  * reply (even though the switch will reset). The caller should check for
  * -ETIMEDOUT and attempt to reconfigure the switch.
  *
+ * Must be called with the domain lock held: the control channel is
+ * released from a context that takes the same lock.
+ *
  * Return: &struct tb_cfg_result with non-zero @err field if error
  * has occurred.
  */
@@ -968,6 +1204,13 @@ struct tb_cfg_result tb_cfg_read_raw(struct tb_ctl *ctl, void *buffer,
 	};
 	struct cfg_write_pkg reply;
 	int retries = 0;
+	int ret;
+
+	ret = tb_ctl_sync_enter(ctl);
+	if (ret) {
+		res.err = ret;
+		return res;
+	}
 
 	while (retries < TB_CTL_RETRIES) {
 		struct tb_cfg_request *req;
@@ -975,7 +1218,7 @@ struct tb_cfg_result tb_cfg_read_raw(struct tb_ctl *ctl, void *buffer,
 		req = tb_cfg_request_alloc();
 		if (!req) {
 			res.err = -ENOMEM;
-			return res;
+			goto out;
 		}
 
 		request.addr.seq = retries++;
@@ -1001,12 +1244,14 @@ struct tb_cfg_result tb_cfg_read_raw(struct tb_ctl *ctl, void *buffer,
 	}
 
 	if (res.err)
-		return res;
+		goto out;
 
 	res.response_port = reply.addr.port;
 	res.err = check_config_address(reply.addr, space, offset, length);
 	if (!res.err)
 		memcpy(buffer, &reply.data, 4 * length);
+out:
+	tb_ctl_sync_exit(ctl);
 	return res;
 }
 
@@ -1042,16 +1287,23 @@ struct tb_cfg_result tb_cfg_write_raw(struct tb_ctl *ctl, const void *buffer,
 	};
 	struct cfg_read_pkg reply;
 	int retries = 0;
+	int ret;
 
 	memcpy(&request.data, buffer, length * 4);
 
+	ret = tb_ctl_sync_enter(ctl);
+	if (ret) {
+		res.err = ret;
+		return res;
+	}
+
 	while (retries < TB_CTL_RETRIES) {
 		struct tb_cfg_request *req;
 
 		req = tb_cfg_request_alloc();
 		if (!req) {
 			res.err = -ENOMEM;
-			return res;
+			goto out;
 		}
 
 		request.addr.seq = retries++;
@@ -1077,10 +1329,12 @@ struct tb_cfg_result tb_cfg_write_raw(struct tb_ctl *ctl, const void *buffer,
 	}
 
 	if (res.err)
-		return res;
+		goto out;
 
 	res.response_port = reply.addr.port;
 	res.err = check_config_address(reply.addr, space, offset, length);
+out:
+	tb_ctl_sync_exit(ctl);
 	return res;
 }
 
@@ -1110,8 +1364,16 @@ static int tb_cfg_get_error(struct tb_ctl *ctl, enum tb_cfg_space space,
 int tb_cfg_read(struct tb_ctl *ctl, void *buffer, u64 route, u32 port,
 		enum tb_cfg_space space, u32 offset, u32 length)
 {
-	struct tb_cfg_result res = tb_cfg_read_raw(ctl, buffer, route, port,
-			space, offset, length, ctl->timeout_msec);
+	struct tb_cfg_result res;
+	int ret;
+
+	ret = tb_ctl_sync_enter(ctl);
+	if (ret)
+		return ret;
+
+	res = tb_cfg_read_raw(ctl, buffer, route, port, space, offset, length,
+			      ctl->timeout_msec);
+
 	switch (res.err) {
 	case 0:
 		/* Success */
@@ -1119,25 +1381,41 @@ int tb_cfg_read(struct tb_ctl *ctl, void *buffer, u64 route, u32 port,
 
 	case 1:
 		/* Thunderbolt error, tb_error holds the actual number */
-		return tb_cfg_get_error(ctl, space, &res);
+		ret = tb_cfg_get_error(ctl, space, &res);
+		goto out;
 
 	case -ETIMEDOUT:
 		tb_ctl_warn(ctl, "%llx: timeout reading config space %u from %#x\n",
 			    route, space, offset);
 		break;
 
+	case -ENOTCONN:
+		/* The channel is being torn down, this is not an error. */
+		break;
+
 	default:
 		WARN(1, "tb_cfg_read: %d\n", res.err);
 		break;
 	}
-	return res.err;
+	ret = res.err;
+out:
+	tb_ctl_sync_exit(ctl);
+	return ret;
 }
 
 int tb_cfg_write(struct tb_ctl *ctl, const void *buffer, u64 route, u32 port,
 		 enum tb_cfg_space space, u32 offset, u32 length)
 {
-	struct tb_cfg_result res = tb_cfg_write_raw(ctl, buffer, route, port,
-			space, offset, length, ctl->timeout_msec);
+	struct tb_cfg_result res;
+	int ret;
+
+	ret = tb_ctl_sync_enter(ctl);
+	if (ret)
+		return ret;
+
+	res = tb_cfg_write_raw(ctl, buffer, route, port, space, offset, length,
+			       ctl->timeout_msec);
+
 	switch (res.err) {
 	case 0:
 		/* Success */
@@ -1145,18 +1423,26 @@ int tb_cfg_write(struct tb_ctl *ctl, const void *buffer, u64 route, u32 port,
 
 	case 1:
 		/* Thunderbolt error, tb_error holds the actual number */
-		return tb_cfg_get_error(ctl, space, &res);
+		ret = tb_cfg_get_error(ctl, space, &res);
+		goto out;
 
 	case -ETIMEDOUT:
 		tb_ctl_warn(ctl, "%llx: timeout writing config space %u to %#x\n",
 			    route, space, offset);
 		break;
 
+	case -ENOTCONN:
+		/* The channel is being torn down, this is not an error. */
+		break;
+
 	default:
 		WARN(1, "tb_cfg_write: %d\n", res.err);
 		break;
 	}
-	return res.err;
+	ret = res.err;
+out:
+	tb_ctl_sync_exit(ctl);
+	return ret;
 }
 
 /**
@@ -1172,12 +1458,22 @@ int tb_cfg_write(struct tb_ctl *ctl, const void *buffer, u64 route, u32 port,
 int tb_cfg_get_upstream_port(struct tb_ctl *ctl, u64 route)
 {
 	u32 dummy;
-	struct tb_cfg_result res = tb_cfg_read_raw(ctl, &dummy, route, 0,
-						   TB_CFG_SWITCH, 0, 1,
-						   ctl->timeout_msec);
+	struct tb_cfg_result res;
+	int ret;
+
+	ret = tb_ctl_sync_enter(ctl);
+	if (ret)
+		return ret;
+
+	res = tb_cfg_read_raw(ctl, &dummy, route, 0, TB_CFG_SWITCH, 0, 1,
+			      ctl->timeout_msec);
 	if (res.err == 1)
-		return -EIO;
-	if (res.err)
-		return res.err;
-	return res.response_port;
+		ret = -EIO;
+	else if (res.err)
+		ret = res.err;
+	else
+		ret = res.response_port;
+
+	tb_ctl_sync_exit(ctl);
+	return ret;
 }
diff --git a/drivers/thunderbolt/ctl.h b/drivers/thunderbolt/ctl.h
index db1646eb4fd0..4f9952408a27 100644
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
@@ -97,10 +112,15 @@ struct tb_cfg_request {
 
 #define TB_CFG_REQUEST_ACTIVE		0
 #define TB_CFG_REQUEST_CANCELED		1
+#define TB_CFG_REQUEST_COMPLETED	2
+#define TB_CFG_REQUEST_CANCEL_HANDLED	3
+#define TB_CFG_REQUEST_ERROR_SET	4
 
 struct tb_cfg_request *tb_cfg_request_alloc(void);
 void tb_cfg_request_get(struct tb_cfg_request *req);
 void tb_cfg_request_put(struct tb_cfg_request *req);
+int tb_ctl_sync_enter(struct tb_ctl *ctl);
+void tb_ctl_sync_exit(struct tb_ctl *ctl);
 int tb_cfg_request(struct tb_ctl *ctl, struct tb_cfg_request *req,
 		   void (*callback)(void *), void *callback_data);
 void tb_cfg_request_cancel(struct tb_cfg_request *req, int err);
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
index a295a5e6cc9c..e3087a2a8fc7 100644
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
@@ -301,14 +305,21 @@ static int icm_request(struct tb *tb, const void *request, size_t request_size,
 		       int retries, unsigned int timeout_msec)
 {
 	struct icm *icm = tb_priv(tb);
+	int ret;
+
+	ret = tb_ctl_sync_enter(tb->ctl);
+	if (ret)
+		return ret;
 
 	do {
 		struct tb_cfg_request *req;
 		struct tb_cfg_result res;
 
 		req = tb_cfg_request_alloc();
-		if (!req)
+		if (!req) {
+			tb_ctl_sync_exit(tb->ctl);
 			return -ENOMEM;
+		}
 
 		req->match = icm_match;
 		req->copy = icm_copy;
@@ -326,12 +337,16 @@ static int icm_request(struct tb *tb, const void *request, size_t request_size,
 
 		tb_cfg_request_put(req);
 
-		if (res.err != -ETIMEDOUT)
-			return res.err == 1 ? -EIO : res.err;
+		if (res.err != -ETIMEDOUT) {
+			ret = res.err == 1 ? -EIO : res.err;
+			tb_ctl_sync_exit(tb->ctl);
+			return ret;
+		}
 
 		usleep_range(20, 50);
 	} while (retries--);
 
+	tb_ctl_sync_exit(tb->ctl);
 	return -ETIMEDOUT;
 }
 
@@ -2229,6 +2244,7 @@ static void icm_stop(struct tb *tb)
 	tb_switch_remove(tb->root_switch);
 	tb->root_switch = NULL;
 	nhi_mailbox_cmd(tb->nhi, NHI_MAILBOX_DRV_UNLOADS, 0);
+	icm->stopped = true;
 	kfree(icm->last_nvm_auth);
 	icm->last_nvm_auth = NULL;
 }
@@ -2249,12 +2265,27 @@ static void icm_usb4_switch_nvm_auth_complete(void *data)
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
@@ -2280,6 +2311,7 @@ static int icm_usb4_switch_nvm_authenticate(struct tb *tb, u64 route)
 
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


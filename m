Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792994447;
	b=k01sPpMgCrchlIjx7nFngQ03aw79FzfXABDzZgIAUERXK4nP3wW1Xll5okN6whc7mdk5
	 rnodHJdrgKgLblysWI5PcNNTN2EceuSrUWn+eAG6l++E8dNmBztM62poRfT8DV6HLgKwN
	 DdjRC8q3G4zqcyyk8GPEhwydCHT5ZA2CjkZTSHeBAPv9GI5/vGKYzQ5ngyGBrnX1JKIxW
	 c5pZX4cpk0qxaByHc00HPYHrYCBs5OxxD8fX6QTS8So/G/40f1rcuWSvC6BROh6Bxvis3
	 EN3ZU1E3yYLhqZxSBi2s/jiP4R7Cc4oH/zPw9ZdQn0T3JeTC0zD2c3DT/QwuqBJ4qjg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792994447;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=AthUPl1Vi250H7j13yBEimZbQkhUEMEFrCpf0L5Rwag=;
	b=ETP/6BIJUtWLJBdmLH8O07+yQ9lrkKwVoj2n0bc22KyK1ZLT4SVeXFIvelyBQgU3ihHU
	 NI9qxwDXhqHyYrZbOMTb4hNA5ezbb3q0vhzsaQTlpnoPaIIJCdlnl1bDYeJrIDwekURU7
	 to19RTkemY3/RZ0FjqCAxoC3SrMnM0Asa3BUEUTVdDEDRv3dIUDqF2Ua51ltjaPAoUPpj
	 0BB6N/uwRPZby04JX1PltVOG9TcsJDF54tTHRYZt47/0LtP/wVtDzO8w9UkbCJzUogCpv
	 mdVRtCmTggrQe6mmDgA2aYmigEvWCGbH5RZewH+/8xNFrHx7OvViCyiT5g2p4hNNB+A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=aVoaYR4K;
	arc=none smtp.remote-ip=209.85.210.174
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6054606A31F
	for <linux-usb@vger.kernel.org>; Mon, 26 Oct 2026 06:00:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E6054606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=aVoaYR4K
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-8a058315c79so917107b3a.3
        for <linux-usb@vger.kernel.org>; Sun, 25 Oct 2026 23:00:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792994446; x=1793599246; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=AthUPl1Vi250H7j13yBEimZbQkhUEMEFrCpf0L5Rwag=;
        b=aVoaYR4KGwxdEJ+I9HK+HQUmLk9NnMqwNe05yhHvbQ0ntmWgK2HnQVFeiQ8euA15KA
         ipZGt4+fo6BqsoHvS4T0K1F6cT0h/EFZP2Hgv3CUB0DO1TQz/stuIFPl8XXUZ6dLFlha
         WqexFO/xUhWOGullcV3CXon2Xyi4EdNEomovKc1VxdM1UCzaylM6Cvsb3tp5z+fafF+1
         WvYrOKQi2xlYOCjuUsbvM6s1Xe1E+v7VWGVJmqixtL2zfM8hhRLJb/k6AkpdMZSdCRIS
         3HnkzlsAebBB6f48C6VYQ3WDW7itas1rdVHWBi4MtWdFOlJxnTMCEuDfph/0BlCYISBg
         OnkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792994446; x=1793599246;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AthUPl1Vi250H7j13yBEimZbQkhUEMEFrCpf0L5Rwag=;
        b=ih+pHiJnflqhvXH0mH14Lo/HG/Q6EKsYHkgrTAgVIOUmTHr9D8xfX50lavynWpmziA
         yHT2UpIbMSUhQlS3VQrkKOF0k/y/+gP/UbIOXnYmSMyGHIWzR5M/aFpVPWYjA+KvBFRe
         B2dxi3V5ap6YbMLuvqUD8furrCERXI1xNUNCMguphsFSJTfX/jya5BEqHELuh1enuFPC
         eKRhoc86EkExcixeKBU6sVyRrYYKRxjmQQeL0qNffloqrtGzwR+qcGd6Lr0OT2hVyrQo
         WI6ipla0cYNVQwJ3HOT1mc1jl8ZSkhBBurAtIejj9MW9v3lRjlUSx+PU92wY/fCpaXD6
         xnVA==
X-Gm-Message-State: AFq9FYIsY9B18zgTVW9Ge0pkiHy3yY2hcOkuo7F4XZ0/kOezlZOY2XDB
	ooXd/R4GmobbaXyD+q+dnNFo+rOHy3zTYNYuNWfyJC8FlAlC2F6rF5vyAvau7gfd
X-Gm-Gg: AYBFou1aarR7+LgInVEamKYvU3ZhQyPPK7aa3GrfLkUE7CwbnLiPF5bIoNThJxboUIU
	8Z3oOe78R3W3Rt4XIhTdVJfBGtqwXa7gRUBUERNbeeRVaSvWyknC+XvASRC9MKVeo10FK3A4YXf
	LFrbKnTPJRn9PRRM5T3AQGJ4m6M3nN9RWkaqPBoiqQt17csXdf9z8tY3nK+9TzYzZYpEdVlGGuG
	17Ot78F4FBkCfz11q8XqajaS5EKLuwNAJtEpghIAoatCHrqGtYaH2/QluOsmyt4cEAna8yhqs2s
	YSEllnOUGT59JxuyZNz/t42+ZEKvK+7yZaYyj/0ewfqWd+k0NrcE4EiVtehre1LQBh3S27rEppi
	9dzAIsS0ppE6VW3PIa3FNmxq16eyTqmNe+Nt0qz7XjAq7yh5rIeB6DkxI62dKJHpdfMVwaHgZs5
	XSnyHGJswWCVrXmT1DbjiRdF6eyAvlGpFIBLjYTRWwq2MDxw2tD4ag2oVDKxM9KZMOfhUvXXIaY
	7dhaDLXeoZ0aLVPx8eTssfqGXmK207doOyySMWe1smij+VbvrH6B6g9wNOxZcchoRZjws0TD8AA
	lLeDHa5/7zUHd99QMPV7Y4fdLwwJl6l3TpAo0TU3m0OJ0QjSUQUonSNyuy72eGiERt7uut3G6nV
	QNmS3hQtMz3y+afVi5YCFG5Z064oi
X-Received: by 2002:a05:6a00:3a11:b0:88d:8074:1a9e with SMTP id d2e1a72fcca58-8a364b4c9f7mr867710b3a.3.1792994446159;
        Sun, 25 Oct 2026 23:00:46 -0700 (PDT)
Received: from EAIT-H54D9Q2FJQ.eait.uq.edu.au ([130.102.10.17])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8a36c4e8616sm993961b3a.56.2026.10.25.23.00.40
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 25 Oct 2026 23:00:45 -0700 (PDT)
From: Yu Zhang <yuz08559@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Neill Kapron <nkapron@google.com>
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Yu Zhang <yuz08559@gmail.com>
Subject: [PATCH] usb: gadget: f_ecm: serialize notification state with a spinlock
Date: Mon, 26 Oct 2026 16:00:31 +1000
Message-ID: <20261026060031.60582-1-yuz08559@gmail.com>
X-Mailer: git-send-email 2.55.0
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

ecm_do_notify() guards re-entry only with an atomic_read() of
notify_count, then fills ecm->notify_req, does atomic_inc() and
usb_ep_queue().  This check-fill-inc-queue sequence is not atomic and
runs from three contexts that share no lock: ecm_notify_complete(),
ecm_open()/ecm_close() (netdev up/down via u_ether) and ecm_set_alt().

When the completion handler decrements notify_count to 0 and re-enters
ecm_do_notify(), a concurrent ecm_close()/ecm_set_alt() can observe
notify_count == 0 in the window between the atomic_dec() and the next
atomic_inc(), and queue the same ecm->notify_req a second time.  The
request is then added to the endpoint queue twice (list_add corruption),
and notify_state is updated concurrently.

struct f_ecm has carried a FIXME about this missing locking.  The sibling
f_ncm already serializes the identical state machine with a per-instance
spinlock.  Do the same in f_ecm: take ecm->lock across the is_open update
and ecm_notify() in open/close/set_alt and across the state update in
ecm_notify_complete(), dropping it only around usb_ep_queue().

Signed-off-by: Yu Zhang <yuz08559@gmail.com>
---
 drivers/usb/gadget/function/f_ecm.c | 19 ++++++++++++++++---
 1 file changed, 16 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/gadget/function/f_ecm.c b/drivers/usb/gadget/function/f_ecm.c
index e495bac..d699832 100644
--- a/drivers/usb/gadget/function/f_ecm.c
+++ b/drivers/usb/gadget/function/f_ecm.c
@@ -59,9 +59,8 @@ struct f_ecm {
 	atomic_t			notify_count;
 	bool				is_open;
 
-	/* FIXME is_open needs some irq-ish locking
-	 * ... possibly the same as port.ioport
-	 */
+	/* protects the notification state machine */
+	spinlock_t			lock;
 };
 
 static inline struct f_ecm *func_to_ecm(struct usb_function *f)
@@ -414,7 +413,11 @@ static void ecm_do_notify(struct f_ecm *ecm)
 	event->wIndex = cpu_to_le16(ecm->ctrl_id);
 
 	atomic_inc(&ecm->notify_count);
+
+	/* usb_ep_queue() can complete the request re-entrantly */
+	spin_unlock(&ecm->lock);
 	status = usb_ep_queue(ecm->notify, req, GFP_ATOMIC);
+	spin_lock(&ecm->lock);
 	if (status < 0) {
 		atomic_dec(&ecm->notify_count);
 		DBG(cdev, "notify --> %d\n", status);
@@ -438,6 +441,7 @@ static void ecm_notify_complete(struct usb_ep *ep, struct usb_request *req)
 	struct usb_composite_dev	*cdev = ecm->port.func.config->cdev;
 	struct usb_cdc_notification	*event = req->buf;
 
+	spin_lock(&ecm->lock);
 	switch (req->status) {
 	case 0:
 		/* no fault */
@@ -455,6 +459,7 @@ static void ecm_notify_complete(struct usb_ep *ep, struct usb_request *req)
 		break;
 	}
 	ecm_do_notify(ecm);
+	spin_unlock(&ecm->lock);
 }
 
 static int ecm_setup(struct usb_function *f, const struct usb_ctrlrequest *ctrl)
@@ -588,7 +593,9 @@ static int ecm_set_alt(struct usb_function *f, unsigned intf, unsigned alt)
 		 * follow another (if the first is in flight), and instead
 		 * just guarantee that a speed notification is always sent.
 		 */
+		spin_lock(&ecm->lock);
 		ecm_notify(ecm);
+		spin_unlock(&ecm->lock);
 	} else
 		goto fail;
 
@@ -653,8 +660,10 @@ static void ecm_open(struct gether *geth)
 
 	DBG(ecm->port.func.config->cdev, "%s\n", __func__);
 
+	spin_lock(&ecm->lock);
 	ecm->is_open = true;
 	ecm_notify(ecm);
+	spin_unlock(&ecm->lock);
 }
 
 static void ecm_close(struct gether *geth)
@@ -663,8 +672,10 @@ static void ecm_close(struct gether *geth)
 
 	DBG(ecm->port.func.config->cdev, "%s\n", __func__);
 
+	spin_lock(&ecm->lock);
 	ecm->is_open = false;
 	ecm_notify(ecm);
+	spin_unlock(&ecm->lock);
 }
 
 /*-------------------------------------------------------------------------*/
@@ -942,6 +953,8 @@ static struct usb_function *ecm_alloc(struct usb_function_instance *fi)
 	if (!ecm)
 		return ERR_PTR(-ENOMEM);
 
+	spin_lock_init(&ecm->lock);
+
 	opts = container_of(fi, struct f_ecm_opts, func_inst);
 	mutex_lock(&opts->lock);
 	opts->refcnt++;
-- 
2.43.0


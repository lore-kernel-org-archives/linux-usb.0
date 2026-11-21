Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795261326;
	b=JKa0q4E0Eay/Jr1SBjaIXfS37kr5UZnFT/LH4+w6IugjVAC3XbmEOaMI+e3NBmF/MkPI
	 XIcvxxK6OEOgvtDM+etO9Flt1mwUZwJelkFxL1AIAdrtBe9s7cQZmG6yJ9Nv00GmL+V2J
	 vlQuE4jBtvOm8HNzDzNSYwJ3wOZ5tofQL8rHQQAxCm3V2Fuh85xAHFhFq+sOQMnfgg7YK
	 Am9+GQbdn3Ydki9fNQtNVcLCaUSSSKykIH9AkIxnNBFLqQTqkWVUUcISevWh4MIhS6dPo
	 j/EH1xOync0bN6WPrRbxHPGC3dNItOM36PC5J3R45aJlrXEuo+1bHCzv30vb1GKm4sw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795261326;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=GrCPnjv5Z6Dci31A0hwhpm1/xWI8LJ1YVMLpligaZfE=;
	b=XhPcWGvNAq6Ffr45G4W2uzrBZu0Z3OPn2aj8Eyxqp3kSx5vIYvU4e52vgDOhH8hS4Bv2
	 P2velLCMF6Tm3KEaFnlLQLk3oQDwcnNSR07okGy/yOEZKdaybELdIX2yriwiNRNzD6eam
	 Rvd4zf34v7SoeP+roKzPYNxK/XAxuVsYpC0DrsJr2pPDeEjoUSIZw4Ap7zzmCdRPSMKZi
	 KWSdAr8gxFJflSH9A7a0893ounJlh4aV0rqbUTSi259m33CCEvyHLPN54zl5HTJ2G3DM4
	 Q49+paB9wh2nmE0BAopkMP9ityRvHP//RAhtD/z1gh3hcg9D7fg8W0tFOoWdilGU6Pg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=efJ20zfi;
	arc=none smtp.remote-ip=209.85.215.182
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B78D606A325
	for <linux-usb@vger.kernel.org>; Sat, 21 Nov 2026 11:42:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2B78D606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=efJ20zfi
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-cde0daf3a2aso787870a12.3
        for <linux-usb@vger.kernel.org>; Sat, 21 Nov 2026 03:42:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795261325; x=1795866125; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=GrCPnjv5Z6Dci31A0hwhpm1/xWI8LJ1YVMLpligaZfE=;
        b=efJ20zfipgq6k0kSqXeU+p/Cc4qQGvJKUbY//GzAWBS2YcI6aL1HdvJceSvK5+S+A/
         JAd/Nh5ddEaFqjxsg5cnBA3EIGGNlZ0Qj5RaiNow3mz6M7FqRj/IJhQxEd9xxAet+AIz
         ojP04+eL57UvEW7rTZHD043dAzqIRk5I6BTbBOz+EIIjCHmSHDmcF280zPkUfQBksoJ8
         /HnPKaeBZMMS8NOpLnPNcbACqPZa1cBIsqhgfAk1ir6W8EV8Ka9AeuST0WNYEPcPg1y2
         pGD/Iow4Yom1Y3mS3ADzv7+Itjt1aVHUKpU9W4mPS+hcYqvvFik2aNfPb3AqNXJIOSwr
         d5PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795261325; x=1795866125;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GrCPnjv5Z6Dci31A0hwhpm1/xWI8LJ1YVMLpligaZfE=;
        b=ThhjT9ATEI9BFnkv/qywEJcny5C0skBCW7Mr5g5HdxIQNBynk8gkf1X7EAuR3fWy9m
         auU9vCOmUVoVdLoz5vs8Y0xCt0Kt91ks/g1Ijw/AUGMy/L97+MLbuLXvNJbS8bAzN6II
         vCVFgW6wZZxhBKc6H+DaqiOGBfHshVqINIfNDNGUtMUymbyGw+giS61Tbu3PnhrR/6kK
         8Ispmu+Gs27XBq6OeUTVTZfjCA/YsiKh448KxagGQt3JwkxAUFMG5WFQbFg8zC7FHHF9
         d/kQECd+wfinxGqwbp2LOh2RZvVOqMjpSlquo5RltZZG8Z/zQgSaCIWv0FxPwafF1+2X
         uqDQ==
X-Forwarded-Encrypted: i=1; AL+hErH5Vah/3fl/HimCSCxvyEtCzlsA6eEkzjf1ck95Bjr0ptaaKVNBvkzT05ltKAyZJjxZOFbn1Sg7+H0=@vger.kernel.org
X-Gm-Message-State: APuU4Z8Vmxd/29kl2pGOz8bUHApsGvc1xcCzpiclQQDWdUqJLl/wtxuX
	S5xgIn8EmEpXMfcBbFs5EsW3ESAM8CN6O5UW6FKY7Raopb/KpoE2XICC
X-Gm-Gg: AZFdTZeU++jk18E59f3PLYJsLcITenKtY1AqSPVXb22FpI1Z5t7GiWxHmqQdPco/ou6
	rZR+4i/uqUBstAxA78YA87m+Kq73cvbnD5Nkf2dUc17bTLJUMWYWz0njMWLYO7kTVg4FUA3c7zl
	odi9U2sfLanodyNLrERZ8yIPEqNhkyKPHwZaaJMkwdGcFR0TOk8Ux7vNFF8XycVIrh3plbyxAjb
	1zSqDyHcIGf+U2K2tKqVQbm/yXXwD4uKInqV7qxyzU08LUm21vY29y0vkTO2SvaO/pzudM0AEe3
	mOlHImIS7DKX8JgnV5KV4u+D4bwiTgLD5idZecF1y80eMR/tZvSnv3Yza3G7NUa2Mjib03VN3sa
	9P6LN+/oevw++qDJrJyv7MVJpZVcWZ3+uUPKv9hBT3NfQuTzjTIDWD081myHeBYfwJfLkJzppTf
	7B++z20UNzwqhnIJ7lOZtqrlbSAlx16Gk7RVkg5/XF05hbq9laFTulH4a8Y3guUgnbrjaRBFnYS
	sJdEgFiT2DWqBvI4jq3TqprG4JvBoIwQSthmV+R6HehnzdhVhZcLByJE7XveF2+liugV9G1yEbR
	jsBnU3+Xj9Kx5yIeMtu5ru/HeHduAKq6mAhn3f1BZ7kXafoNSmHyHLqMwWZUQOkvfI72gLbDSuo
	oUAP3ZZ9PWK7r3iFy7XkeTNuYUpuER4HOFkKDhOJvxdkG6srQzva8y8wj/1jPbXjNldmONz8fTA
	pzfEg=
X-Received: by 2002:a17:90b:50:b0:3b4:1926:9eb5 with SMTP id 98e67ed59e1d1-3b41c98a1dcmr5092333a91.10.1795261325368;
        Sat, 21 Nov 2026 03:42:05 -0800 (PST)
Received: from EAIT-H54D9Q2FJQ.eait.uq.edu.au ([130.102.10.222])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cde6cea7c29sm2439972a12.1.2026.11.21.03.42.01
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 21 Nov 2026 03:42:04 -0800 (PST)
From: Yu Zhang <yuz08559@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Neill Kapron <nkapron@google.com>
Cc: Aldo Ariel Panzardo <qwe.aldo@gmail.com>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Yu Zhang <yuz08559@gmail.com>
Subject: [PATCH v2] usb: gadget: f_ecm: serialize notification state with a spinlock
Date: Sat, 21 Nov 2026 21:41:54 +1000
Message-ID: <20261121114154.30274-1-yuz08559@gmail.com>
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
v2:
 - Take ecm->lock with guard()/scoped_guard() in ecm_open(), ecm_close(),
   ecm_set_alt() and ecm_notify_complete() instead of explicit
   spin_lock()/spin_unlock() pairs (Greg Kroah-Hartman).  The lock is
   still dropped around usb_ep_queue() in ecm_do_notify(), as f_ncm does,
   because the completion can run before usb_ep_queue() returns.  No
   change to what is protected.
 - Sent as a new thread.
v1: https://lore.kernel.org/all/20261026060031.60582-1-yuz08559@gmail.com/

 drivers/usb/gadget/function/f_ecm.c | 20 ++++++++++++++++----
 1 file changed, 16 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/gadget/function/f_ecm.c b/drivers/usb/gadget/function/f_ecm.c
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
@@ -414,7 +413,11 @@ static void ecm_do_notify(struct f_ecm *
 	event->wIndex = cpu_to_le16(ecm->ctrl_id);
 
 	atomic_inc(&ecm->notify_count);
+
+	/* ecm_notify_complete() can run before usb_ep_queue() returns */
+	spin_unlock(&ecm->lock);
 	status = usb_ep_queue(ecm->notify, req, GFP_ATOMIC);
+	spin_lock(&ecm->lock);
 	if (status < 0) {
 		atomic_dec(&ecm->notify_count);
 		DBG(cdev, "notify --> %d\n", status);
@@ -438,6 +441,8 @@ static void ecm_notify_complete(struct u
 	struct usb_composite_dev	*cdev = ecm->port.func.config->cdev;
 	struct usb_cdc_notification	*event = req->buf;
 
+	guard(spinlock)(&ecm->lock);
+
 	switch (req->status) {
 	case 0:
 		/* no fault */
@@ -588,7 +593,8 @@ static int ecm_set_alt(struct usb_functi
 		 * follow another (if the first is in flight), and instead
 		 * just guarantee that a speed notification is always sent.
 		 */
-		ecm_notify(ecm);
+		scoped_guard(spinlock, &ecm->lock)
+			ecm_notify(ecm);
 	} else
 		goto fail;
 
@@ -653,6 +659,8 @@ static void ecm_open(struct gether *geth
 
 	DBG(ecm->port.func.config->cdev, "%s\n", __func__);
 
+	guard(spinlock)(&ecm->lock);
+
 	ecm->is_open = true;
 	ecm_notify(ecm);
 }
@@ -663,6 +671,8 @@ static void ecm_close(struct gether *get
 
 	DBG(ecm->port.func.config->cdev, "%s\n", __func__);
 
+	guard(spinlock)(&ecm->lock);
+
 	ecm->is_open = false;
 	ecm_notify(ecm);
 }
@@ -942,6 +952,8 @@ static struct usb_function *ecm_alloc(st
 	if (!ecm)
 		return ERR_PTR(-ENOMEM);
 
+	spin_lock_init(&ecm->lock);
+
 	opts = container_of(fi, struct f_ecm_opts, func_inst);
 	mutex_lock(&opts->lock);
 	opts->refcnt++;

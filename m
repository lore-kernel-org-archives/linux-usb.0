Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795619274;
	b=SSqv2YMls7xcx5zFYV9nmKjxHNdlIvDq1neh2Pt3O+nTV9yoMz57s0b+jhjaOuvYbvYk
	 BmDRasFqf9c+1L+drwn2F/rA9jCcVC1mDeaQ+PY9DmVaf0fyede0gWJnk6Abn+C5UdmP/
	 5KYPQcGfFyB7G4G6c9ZP8sK4MMFJgX9CtgAyDfuJcyjYt4U9AllJnIHOtJRip6MqlxwV0
	 joXCb90bHEu+USOSxnSCzMhEsh+tfxR8zSoobGCzBP7cNO6DPlTGDORKSBuKypuL3qL93
	 +HPafrM7DwXGu6YmMqZnIPYXUBcA2WlM+k+2VNB9i0o9I/BviY7X8N09q1avq/bpuBw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795619274;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=HntBfuH10YLJdkO0KLyyg7h8BiT6ci6WYuXlNzTouSs=;
	b=VSmtqk1abtG0I6Wv4dBzFTMubKXoPdWMrw1g0SO1hJhysiYKt0Yf0Tg/sxlC0oVcu9BZ
	 mkBM6z/FB7xSwZcK4idBvTJb9rshDLqp30lP8ezZJOLfv38Tm+oLJeS6Kd0WML8qMWhjJ
	 FfPuI9+RIAr3nCVAJB7ByNJpC9sign/jKMrKVoE2OtBhkbvkijHZbS9RxsDt8WD5ptsrc
	 jDiXXijxxF2TBk2JUA6gwdEyr7z0Nt7KKhRdrEzjwxTgTZeo2XcXnFXIWlL1nkL7aQnu8
	 o8kpuRAXUAPGo2P9+UyvyUl75PDYhzO3/znkdMgYaT5sJjLKwu0JfyplPdh/PN/qW0A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EiSePnIP;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5233606A330;
	Wed, 25 Nov 2026 15:07:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EiSePnIP
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795619274;
	b=3NQ5vBNoX06kjb+IEfGHZaPwlm1KfuEJimyarMYagbvcoqW5D5uXuN5jK+QnTtYR7Poy
	 MDdjK4AONoSLSbup4wNCN1vkaf4N7qJDfSnva/GrUJHKoXsU5QsplQFdD5UN96d0jjpBL
	 jbt8m2B6tbYHsy29pcP/vphLRr+J79MuzIgRVJLCqJkGG6+RbLjnulAcIwnumTA3lTaBW
	 GcUpKsTMDFJUZi3bconCnWymQDJNcEwd0pa5HFPquMoTexRKMw5WAp+MFeTxrv/43t9Dp
	 3HaRXZhT0+dF1ZORr3y53N6o12CuebQvQh7fhabfLNnzLN+tZFo/GZCRcoEAqpofu5g==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795619274;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=HntBfuH10YLJdkO0KLyyg7h8BiT6ci6WYuXlNzTouSs=;
	b=yx+igZDvBgQ/9UudAk9Ed9plyNLvZpAWZ8/JsBBHmr8T5+qN5usbpS6QnRk3RoeFutrq
	 TnYjPzam0pomMHRQOUUj5WI+Znocm/ZOLrKvrKoGr/S/6clYGi1OW4ZZ1hAhKe5+h6Bju
	 BRCqOiYXt6zVnINcl/Oh0s9F1njXPwAUT8pGoTt/4J9vjMddwS4CdZTvuPaPwS5j9NOtx
	 ZXF1s7i2L2ZVZgZQ/hLsPX3BbS0MBzKd2gYnO9iGhih9Vr5e/7NlbceCiibWkuoNJTAQx
	 pTHT0ZFTQuBx+LIBBr/3K2JYHfC50XSQYcCC7ucx54cKjKQvo7w3AdpHYc0MIFg+THw==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 5FD7E1F00A03;
	Wed, 25 Nov 2026 15:07:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795619274;
	bh=HntBfuH10YLJdkO0KLyyg7h8BiT6ci6WYuXlNzTouSs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=EiSePnIPkLzhw4CQOanpojQrD7r4ltjx/X1mqhxfst5dMvI64F05sWaiEuoNTmA65
	 Hb59OuI6SUgW6yxFkZpZGZc8FFaRy68zBX6+qnTYrqq++eM2opfYSJfczbr8oLU+gq
	 0WvV2Quv2WPqoRdiwXO2XZ51WU90MwhYgvLiNg6NmtVtGemVVxCGoDUhSXDZbXMlDu
	 PIhR4SxfJQC9miJqZ6aC58ww/Pd2DzG/xUc2WYdBUFT7IfKfscCFotfPcMC3+3mkRU
	 MG/czkBdsUXDhpUiF0G3VU2uckObrFEMJaSvnJmFA64VFmrobnfV0PQ41LliHESR8j
	 dyrCrELjMqE4g==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id DCDD14CF27;
	Wed, 25 Nov 2026 15:07:41 +0000 (UTC)
From: Fabricio Akio via B4 Relay <devnull+fabricioakio.gmail.com@kernel.org>
Date: Wed, 25 Nov 2026 12:05:27 -0300
Subject: [PATCH v3 2/2] usb: gadget: u_serial: Free the console request
 only once it is back
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261125-u-serial-console-dequeue-v3-2-b47f6e401dc1@gmail.com>
References: <20261125-u-serial-console-dequeue-v3-0-b47f6e401dc1@gmail.com>
In-Reply-To: <20261125-u-serial-console-dequeue-v3-0-b47f6e401dc1@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Neill Kapron <nkapron@google.com>
Cc: Krystian Kaniewski <krystianmkaniewski@gmail.com>, 
 Brian Ellis <brianellis@gotenna.com>, Ai Chao <aichao@kylinos.cn>, 
 =?utf-8?q?Micha=C5=82_Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>, 
 Prashanth K <prashanth.k@oss.qualcomm.com>, linux-usb@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Fabricio Akio <fabricioakio@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795619260; l=11605;
 i=fabricioakio@gmail.com; s=20260928; h=from:subject:message-id;
 bh=sRzi/lxpu56EUIGmhjcE40owKZyliMMmY2QTZ9GnGvc=;
 b=A/1XvM3uoGS8t11liVaJSOn2axVucEbCwYfdQeJwb8Oub5WSwTZcGu8S3usGYj1AK8FeVHWOX
 KTnCgzwy4ojBcX9ozpqFeYSZOQ2k4r6EFtIi3lFvZq69G6br7tRnT9Y
X-Developer-Key: i=fabricioakio@gmail.com; a=ed25519;
 pk=TlMUT8bPI/ZQzp2q24BIQTb2qSx/jdUTBlGEXIRCm54=
X-Endpoint-Received: by B4 Relay for fabricioakio@gmail.com/20260928 with
 auth_id=1076
X-Original-From: Fabricio Akio <fabricioakio@gmail.com>
Reply-To: fabricioakio@gmail.com
Content-Transfer-Encoding: 7bit

From: Fabricio Akio <fabricioakio@gmail.com>

gs_console_disconnect() frees the console request right after
usb_ep_dequeue(), which is asynchronous: the controller, dwc3 here,
gives a queued request back from usb_ep_disable() in
gserial_disconnect(), after it was freed. __gs_console_push() also
queues the request with cons->lock dropped, so a disconnect in that
window frees a request still being queued. An idle request is dequeued
too, which dwc3 reports as "request ... was not queued" at each
disconnect.

Track whether the request is out in a console flag, cons->busy, under
cons->lock, instead of in req->length, which the driver may not examine
while the request is queued. Queue the request under a second lock,
cons->tx_lock, which the disconnect also takes, so that a disconnect
waits for a queue in progress; cons->lock stays dropped across
usb_ep_queue(), since the controller may print from inside it into
gs_console_write(). The controller may also complete a tty write from
inside it, and gs_write_complete() takes port_lock, so
gserial_disconnect() disconnects the console after dropping port_lock,
holding a reference on it. On disconnect, the console gives the request
up and frees it only if idle. A busy request, now orphaned, is freed by
its completion, and holds a reference on the console until then, so
that the console outlives it after gs_console_exit().
__gs_console_push() is folded into gs_console_work(), its only caller,
which holds tx_lock across the push.

The disconnect no longer dequeues: in gserial_disconnect(),
usb_ep_disable() follows and gives the request back. gs_console_exit()
drops the unsent output and, with no disconnect under way to give it
back, dequeues a request still queued itself.

Fixes: fe1ea63ad806 ("usb: gadget: u_serial: reimplement console support")
Fixes: e5990469943c ("usb: gadget: u_serial: Avoid spinlock recursion in __gs_console_push")
Cc: stable@vger.kernel.org
Signed-off-by: Fabricio Akio <fabricioakio@gmail.com>
---
 drivers/usb/gadget/function/u_serial.c | 196 ++++++++++++++++++++++++++-------
 1 file changed, 154 insertions(+), 42 deletions(-)

diff --git a/drivers/usb/gadget/function/u_serial.c b/drivers/usb/gadget/function/u_serial.c
index 1f0110ea7f6a..e4698209bb57 100644
--- a/drivers/usb/gadget/function/u_serial.c
+++ b/drivers/usb/gadget/function/u_serial.c
@@ -29,6 +29,7 @@
 #include <linux/kthread.h>
 #include <linux/workqueue.h>
 #include <linux/kfifo.h>
+#include <linux/kref.h>
 #include <linux/serial.h>
 
 #include "u_serial.h"
@@ -109,10 +110,20 @@ static DEFINE_SPINLOCK(serial_port_lock);
 struct gs_console {
 	struct console		console;
 	struct work_struct	work;
+	/*
+	 * Held across usb_ep_queue(), so that gs_console_disconnect() can wait
+	 * for a queue in progress. lock is not, since the controller may print
+	 * from inside usb_ep_queue() into gs_console_write(). Never taken
+	 * under port_lock: the controller may also complete a tty write from
+	 * inside usb_ep_queue(), and gs_write_complete() takes port_lock.
+	 */
+	spinlock_t		tx_lock;
 	spinlock_t		lock;
 	struct usb_request	*req;
+	bool			busy;
 	struct kfifo		buf;
 	size_t			missed;
+	struct kref		kref;
 };
 
 /*
@@ -998,46 +1009,73 @@ static struct tty_driver *gs_tty_driver;
 
 #ifdef CONFIG_U_SERIAL_CONSOLE
 
+static void gs_console_release(struct kref *kref)
+{
+	struct gs_console *cons = container_of(kref, struct gs_console, kref);
+
+	kfifo_free(&cons->buf);
+	kfree(cons);
+}
+
 static void gs_console_complete_out(struct usb_ep *ep, struct usb_request *req)
 {
 	struct gs_console *cons = req->context;
+	bool push = true;
+	bool orphaned;
 
 	switch (req->status) {
 	default:
 		pr_warn("%s: unexpected %s status %d\n",
 			__func__, ep->name, req->status);
-		fallthrough;
+		break;
 	case 0:
 		/* normal completion */
-		spin_lock(&cons->lock);
-		req->length = 0;
-		schedule_work(&cons->work);
-		spin_unlock(&cons->lock);
 		break;
 	case -ECONNRESET:
 	case -ESHUTDOWN:
 		/* disconnect */
 		pr_vdebug("%s: %s shutdown\n", __func__, ep->name);
+		push = false;
 		break;
 	}
+
+	spin_lock(&cons->lock);
+	orphaned = req != cons->req;
+	if (!orphaned) {
+		cons->busy = false;
+		if (push)
+			schedule_work(&cons->work);
+	}
+	spin_unlock(&cons->lock);
+
+	/* gs_console_disconnect() gave it up while it was queued */
+	if (orphaned) {
+		gs_free_req(ep, req);
+		kref_put(&cons->kref, gs_console_release);
+	}
 }
 
-static void __gs_console_push(struct gs_console *cons)
+static void gs_console_work(struct work_struct *work)
 {
-	struct usb_request *req = cons->req;
+	struct gs_console *cons = container_of(work, struct gs_console, work);
+	struct usb_request *req;
 	struct usb_ep *ep;
 	size_t size;
 
-	if (!req)
-		return;	/* disconnected */
+	spin_lock_irq(&cons->tx_lock);
+	spin_lock(&cons->lock);
 
-	if (req->length)
-		return;	/* busy */
+	req = cons->req;
+	if (!req)
+		goto unlock;	/* disconnected */
+
+	if (cons->busy)
+		goto unlock;	/* busy */
 
 	ep = cons->console.data;
 	size = kfifo_out(&cons->buf, req->buf, ep->maxpacket);
 	if (!size)
-		return;
+		goto unlock;
 
 	if (cons->missed && ep->maxpacket >= 64) {
 		char buf[64];
@@ -1049,22 +1087,22 @@ static void __gs_console_push(struct gs_console *cons)
 	}
 
 	req->length = size;
+	cons->busy = true;
 
-	spin_unlock_irq(&cons->lock);
-	if (usb_ep_queue(ep, req, GFP_ATOMIC))
-		req->length = 0;
-	spin_lock_irq(&cons->lock);
-}
+	spin_unlock(&cons->lock);
 
-static void gs_console_work(struct work_struct *work)
-{
-	struct gs_console *cons = container_of(work, struct gs_console, work);
+	if (usb_ep_queue(ep, req, GFP_ATOMIC)) {
+		spin_lock(&cons->lock);
+		cons->busy = false;
+		spin_unlock(&cons->lock);
+	}
 
-	spin_lock_irq(&cons->lock);
+	spin_unlock_irq(&cons->tx_lock);
+	return;
 
-	__gs_console_push(cons);
-
-	spin_unlock_irq(&cons->lock);
+unlock:
+	spin_unlock(&cons->lock);
+	spin_unlock_irq(&cons->tx_lock);
 }
 
 static void gs_console_write(struct console *co,
@@ -1080,7 +1118,7 @@ static void gs_console_write(struct console *co,
 	if (n < count)
 		cons->missed += count - n;
 
-	if (cons->req && !cons->req->length)
+	if (cons->req && !cons->busy)
 		schedule_work(&cons->work);
 
 	spin_unlock_irqrestore(&cons->lock, flags);
@@ -1107,7 +1145,6 @@ static int gs_console_connect(struct gs_port *port)
 		return -ENOMEM;
 	req->complete = gs_console_complete_out;
 	req->context = cons;
-	req->length = 0;
 
 	spin_lock(&cons->lock);
 	cons->req = req;
@@ -1121,28 +1158,68 @@ static int gs_console_connect(struct gs_port *port)
 	return 0;
 }
 
-static void gs_console_disconnect(struct gs_port *port)
+/*
+ * Give the request up, with no queue in progress. An idle request is returned,
+ * for the caller to free.
+ */
+static struct usb_request *__gs_console_disconnect(struct gs_console *cons)
 {
-	struct gs_console *cons = port->console;
 	struct usb_request *req;
-	struct usb_ep *ep;
-
-	if (!cons)
-		return;
+	bool busy;
 
 	spin_lock(&cons->lock);
 
 	req = cons->req;
-	ep = cons->console.data;
+	busy = cons->busy;
 	cons->req = NULL;
+	cons->busy = false;
+	/*
+	 * A busy request is queued. The console gives it up here, and the
+	 * orphaned request is freed by its completion. It holds a reference
+	 * on the console until then.
+	 */
+	if (busy)
+		kref_get(&cons->kref);
 
 	spin_unlock(&cons->lock);
 
-	if (!req)
+	return busy ? NULL : req;
+}
+
+/*
+ * Called with port_lock held. The reference keeps the console for
+ * gs_console_disconnect(), which runs without it.
+ */
+static struct gs_console *gs_console_get(struct gs_port *port)
+{
+	struct gs_console *cons = port->console;
+
+	if (cons)
+		kref_get(&cons->kref);
+
+	return cons;
+}
+
+/*
+ * Called without port_lock, see tx_lock, and before the endpoint is disabled.
+ * Drops the reference of gs_console_get().
+ */
+static void gs_console_disconnect(struct gs_console *cons, struct usb_ep *ep)
+{
+	struct usb_request *req;
+	unsigned long flags;
+
+	if (!cons)
 		return;
 
-	usb_ep_dequeue(ep, req);
-	gs_free_req(ep, req);
+	/* Wait for a queue in progress: after it, busy means queued */
+	spin_lock_irqsave(&cons->tx_lock, flags);
+	req = __gs_console_disconnect(cons);
+	spin_unlock_irqrestore(&cons->tx_lock, flags);
+
+	if (req)
+		gs_free_req(ep, req);
+	kref_put(&cons->kref, gs_console_release);
 }
 
 static int gs_console_init(struct gs_port *port)
@@ -1164,7 +1241,9 @@ static int gs_console_init(struct gs_port *port)
 	cons->console.index = port->port_num;
 
 	INIT_WORK(&cons->work, gs_console_work);
+	spin_lock_init(&cons->tx_lock);
 	spin_lock_init(&cons->lock);
+	kref_init(&cons->kref);
 
 	err = kfifo_alloc(&cons->buf, GS_CONSOLE_BUF_SIZE, GFP_KERNEL);
 	if (err) {
@@ -1187,21 +1266,46 @@ static int gs_console_init(struct gs_port *port)
 static void gs_console_exit(struct gs_port *port)
 {
 	struct gs_console *cons = port->console;
+	struct usb_request *req;
+	struct usb_ep *ep;
 
 	if (!cons)
 		return;
 
 	unregister_console(&cons->console);
 
+	/*
+	 * Drop the unsent output and wait for a push in progress, so that the
+	 * request is busy below only if it is queued.
+	 */
+	spin_lock_irq(&cons->lock);
+	kfifo_reset(&cons->buf);
+	spin_unlock_irq(&cons->lock);
+	cancel_work_sync(&cons->work);
+
 	spin_lock_irq(&port->port_lock);
-	if (cons->req)
-		gs_console_disconnect(port);
+
+	/*
+	 * Nothing gives a queued request back here, so cancel it. With
+	 * port_usb set, no gserial_disconnect() is under way to orphan it, so
+	 * it cannot be freed under usb_ep_dequeue(). Otherwise the disconnect
+	 * gives it back.
+	 */
+	spin_lock(&cons->lock);
+	req = cons->busy ? cons->req : NULL;
+	ep = cons->console.data;
+	spin_unlock(&cons->lock);
+	if (req && port->port_usb)
+		usb_ep_dequeue(ep, req);
+
+	req = __gs_console_disconnect(cons);
+	if (req)
+		gs_free_req(ep, req);
 	port->console = NULL;
 	spin_unlock_irq(&port->port_lock);
 
 	cancel_work_sync(&cons->work);
-	kfifo_free(&cons->buf);
-	kfree(cons);
+	kref_put(&cons->kref, gs_console_release);
 }
 
 ssize_t gserial_set_console(unsigned char port_num, const char *page, size_t count)
@@ -1259,7 +1363,12 @@ static int gs_console_connect(struct gs_port *port)
 	return 0;
 }
 
-static void gs_console_disconnect(struct gs_port *port)
+static struct gs_console *gs_console_get(struct gs_port *port)
+{
+	return NULL;
+}
+
+static void gs_console_disconnect(struct gs_console *cons, struct usb_ep *ep)
 {
 }
 
@@ -1542,6 +1651,7 @@ EXPORT_SYMBOL_GPL(gserial_connect);
 void gserial_disconnect(struct gserial *gser)
 {
 	struct gs_port	*port = gser->ioport;
+	struct gs_console *cons;
 	unsigned long	flags;
 
 	if (!port)
@@ -1552,7 +1662,7 @@ void gserial_disconnect(struct gserial *gser)
 	/* tell the TTY glue not to do I/O here any more */
 	spin_lock(&port->port_lock);
 
-	gs_console_disconnect(port);
+	cons = gs_console_get(port);
 
 	/* REVISIT as above: how best to track this? */
 	port->port_line_coding = gser->port_line_coding;
@@ -1568,6 +1678,8 @@ void gserial_disconnect(struct gserial *gser)
 	spin_unlock(&port->port_lock);
 	spin_unlock_irqrestore(&serial_port_lock, flags);
 
+	gs_console_disconnect(cons, gser->in);
+
 	/* disable endpoints, aborting down any active I/O */
 	usb_ep_disable(gser->out);
 	usb_ep_disable(gser->in);

-- 
2.56.1



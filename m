Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0827A27703
	for <linux-usb@vger.kernel.org>; Sun, 23 Aug 2026 01:11:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787447472; cv=none; b=QRrQCrUJwjCSxDSqkOhROFfdSZbJZKUGRxP0kJcT3q7nJe60k4kbogqSMavuULzQp/pzqE7kZG//pZl/e80Ps1TFsOrH3eJip2EgQ/Ac9zJ7JX/2g2pE4GzpCT453xFFPIrYQOWxcSKDEZfuHHFQPuyzVerrkaTMZcGNn6XFREk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787447472; c=relaxed/simple;
	bh=5XWZeD+aV/ufn7LGXIMzugG2P1/aXkck5gEFoa68Oh8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nPnkYKm9Nb+sscL0uZbtoD/IHPwg3Dougt86unoiOV5GQX2XfD59/6sCxRLZJFXorEmRlU9XTV+530y2q0xSIV5UtnQeqU6uilKfBi8d+JcVcAR2Ad+HH73WDe4iU12uXtxZqc8SZk+9ZviTIZq7Rq3rYW97AltcliOlzkk2pQc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=ZeTgD3ys; arc=none smtp.client-ip=209.85.222.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="ZeTgD3ys"
Received: by mail-qk1-f174.google.com with SMTP id af79cd13be357-92ea24a2dbfso166029385a.0
        for <linux-usb@vger.kernel.org>; Sat, 22 Aug 2026 18:11:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1787447461; x=1788052261; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mwXgOcDkpSDATYrsl6MIfqAqVVortV6jV8bLHxFBAYs=;
        b=ZeTgD3ysZ0GEN/p1qQqTMqO1l7J2xhCxHq7es+8BTQ9KOq4SqKyvMUP3TCZ2TYPMdO
         uUPuRHOH5xlwWTFOSSURTwUSvs1/CGB6xrVg7J6cGe/j3RVxAvekv7xRJiG9NDZQu9hW
         cqoFfdLtJk/zIwa0B2RpELn2LZT/aZYGdVQg8Xwr0fv7yJdAMqS1+KBiqU0+a7f2MCI4
         EEE1s6N4Y21yhv9OOvnY4fQW80O9kD7PvzywF+PyRlUZkQ+4+ZzFEDSyLLjccRjpuXM/
         pFPu8XKljV3LpG63HS63C2sjVHCiX1BAYwYs3jtGG2h1ke8g2nMcD/KEpGKHQzN1bup8
         e8Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787447461; x=1788052261;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mwXgOcDkpSDATYrsl6MIfqAqVVortV6jV8bLHxFBAYs=;
        b=oesnC8B4qiyIftcGaKd2cEfpuRO5Duprkru7mvrllmdLJHBilg/kNH32SyeBarYEIL
         o31rTHrvOrPhXmm4IQ3ZI3iUB38Jtv7omoIm1CAKdpTBVUQxN3IasrwNM/JPiInACXk3
         6AhnuMzOZgZZFuuD81QGAY18WspgBSFCAkqqw7ij8ue4LUZ7wftKErvy1JB6x6VyEnWr
         9oI0WEIuVueFYM3S5usPo3Y/Rw9/TAVRQYjhy4k711hG8ocndSefJoD1Qx/UXBbh+2uC
         le3m8TFvfSRC9xH1dBaCHoLAPGC5Cfj8+T/IZPPW36/OX5+NuFdaoUq/Nfy3l3O4PfKN
         NsXg==
X-Forwarded-Encrypted: i=1; AHgh+RogPrSQcSiQv1+lo8AF17GKXwGNGoZyuj5bWfn2UwOUXPMxqDAWRymBhsuXN7tuWrGA6D7bEEA3KCw=@vger.kernel.org
X-Gm-Message-State: AFuF++l82H8cDiAUXDByuO98nOzimmYz4251BdZby/QYLlzOVdilr1MS
	gTG6oxdzhSOXWgd8tPels7fHpkEv0nkTeiThG4vNNLp5QJW3Hz+m8gtwpE1uqWFY1g==
X-Gm-Gg: AR+sD11GwcZoZZyuOz4ioeYyQGWYZXEbUjpSLdFZhoNX8Nka+OgaeS0wUntt3VnFLia
	SivZ0qA2WqSfyXre01O9fpR5Dd7dZss433JG1Vjigr1BQHSccaF9VjMhQV5RFIvT1B0yil8ncty
	dCICFQJED4ikzShavBbzg3L6mqTgWMvx5t5DT94XtDOxj4FPVIFQd4JxEC4uhD1iepwXlRbvNc5
	usMH4pvlD5qnzFW8u23Wd8JTOQSs7T8cqMdEtn71sFH7VvIjQ84rdhMq1qI+S2ZEiVBBjm6ZinR
	4feqgzUlxWIjZ9b3Cqq5IGgU99M4A729dgkHFwuNUqiVHVPJ2tNjzX1/O2uLIJF7MDWQYYpHHlC
	XDHgOBoU042TUF6mbEtPAB9OV3skDsf7RtLKYoUJ4jtZUlrayMf5dz8PmMq4DmV/d8PDzygonpa
	rsuFrv6LfozTQmi6H6vqE1TwFJEIRI5azkAHS9N0KbaPODEn7RILEWyp2zAAVigg==
X-Received: by 2002:a05:620a:44c6:b0:92e:f380:dabf with SMTP id af79cd13be357-9374694e5e8mr828761185a.30.1787447461052;
        Sat, 22 Aug 2026 18:11:01 -0700 (PDT)
Received: from rowland.harvard.edu ([2601:19b:d01:d210::dfd8])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93749eb4250sm209056985a.46.2026.08.22.18.10.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 Aug 2026 18:11:00 -0700 (PDT)
Date: Sat, 22 Aug 2026 21:10:57 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Minseo Kim <neck3922@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Andrey Konovalov <andreyknvl@gmail.com>, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org, syzkaller@googlegroups.com
Subject: Re: [BUG] usb: gadgetfs: KASAN null-ptr-deref and intermittent UAF
 in ep_aio_cancel()
Message-ID: <0305182d-5914-4022-a0a6-1ab4221b0a6c@rowland.harvard.edu>
References: <CAFmvuTXvwuUrfbvsAQ_VvC9jH5iS62J+Ei23TD0NfQ_igFRJ_A@mail.gmail.com>
 <6761b47f-0230-4f3e-942c-26ed8dd6d0d4@rowland.harvard.edu>
 <CAFmvuTW2cfj5dzkRR8ymenWoA7tw1WAYsMitorvppTwcZ+xfbg@mail.gmail.com>
 <e8655e37-02b3-40ef-9ce0-98c8fa25481d@rowland.harvard.edu>
 <15185c2d-4544-42cc-ba0a-79dd36e82a21@rowland.harvard.edu>
 <CAFmvuTU=t5TiZSpHmF1MXpVs+3K7G1VOTDeeazwGru4+1eozBg@mail.gmail.com>
 <cd57f283-71e6-4531-a311-1180ccc22ab8@rowland.harvard.edu>
 <CAFmvuTVH=mVMZNoYnU07_WA+cBc4m+UG2BBTLwF5KWhcj-z-KA@mail.gmail.com>
 <908a5b29-e6d8-4595-b451-6c328e25c60e@rowland.harvard.edu>
 <CAFmvuTU5HnBKbve=v_C7Mhw2586rR_8qsRNua2XPokgKy_o31w@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFmvuTU5HnBKbve=v_C7Mhw2586rR_8qsRNua2XPokgKy_o31w@mail.gmail.com>

On Sun, Aug 23, 2026 at 05:26:20AM +0900, Minseo Kim wrote:
> Hi Alan,
> 
> Thank you. I am glad the testing has been useful.
> 
> > What was the cause of this warning? If it is sufficiently
> > straightforward, maybe I can fix it as well.
> 
> The warning is caused by ep_aio_cancel() enabling local IRQs while its
> caller still holds ctx->ctx_lock. io_cancel() acquires ctx->ctx_lock with
> spin_lock_irq() and invokes the cancel callback before releasing that
> lock. In the posted revision, ep_aio_cancel() uses spin_lock_irq() for
> aio_lock and releases it with spin_unlock_irq(), which enables local IRQs
> before the callback returns. LOCKDEP records the resulting SOFTIRQ-ON-W
> usage; in the reported run, it later reports inconsistent
> softirq-context use of the same lock in the free_ioctx_users() path.
> 
> When entered with local IRQs already disabled, the unpatched driver has
> the same underlying behavior because ep_aio_cancel() unconditionally
> calls local_irq_enable() before returning. Using the same reproducer,
> arguments, and kernel configuration, I reproduced the warning on both the
> posted revision and the unpatched kernel.
> 
> Would it make sense to change the aio_lock operations in
> ep_aio_cancel() to spin_lock_irqsave() and spin_unlock_irqrestore(), using
> the saved flags on every path that releases the lock? This would preserve
> the incoming IRQ state both when the AIO core invokes the callback and
> when ep_aio() replays an early cancellation.

Yes, that is the best solution.

> I tested this change locally by rerunning, on fresh boots, the full
> pre-queue cancellation matrix from my previous message and a longer
> cancellation workload of 1000 rounds with 32 requests per round. Each
> matrix case produced exactly one expected completion, and neither the
> matrix nor the longer workload produced a KASAN report, Oops, or LOCKDEP
> warning. If you prefer a different way to preserve the caller's IRQ
> state, I would be happy to test that as well.

No, that's all good.

> Separately, my understanding was that we had set the teardown issue aside
> for a later discussion. I also tested that case and wanted to share the
> result here in case it is useful.
> 
> On the posted revision, the reproducer repeatedly triggered:
> 
>   KASAN: null-ptr-deref in range [0x0000000000000010-0x0000000000000017]
>   Workqueue: events ep_unlink_worker
>   RIP: usb_ep_dequeue+0x2c/0x220
>   drivers/usb/gadget/udc/core.c:333
>   called from ep_unlink_worker+0x8d/0x1b0
>   drivers/usb/gadget/legacy/inode.c:477
> 
> The endpoint argument to usb_ep_dequeue() was NULL. I also reproduced the
> same teardown failure with the local IRQ-state change applied, so the two
> issues appear independent.
> 
> The reproducer submits AIO FSYNC requests from a thread pinned to CPU 0
> and verifies that at least 1024 remain outstanding. The cancel thread is
> also pinned to CPU 0, so the work items handled by aio_fsync_work() and
> ep_unlink_worker() are both queued through schedule_work() to the CPU 0
> worker pool of the system per-CPU workqueue. In the faulting ordering,
> after io_cancel() returned -1 with errno set to EINPROGRESS, the main
> thread on CPU 1 closed ep0 before ep_unlink_worker() reached
> usb_ep_dequeue().
> 
> Closing ep0 invoked dev_release(), which called
> usb_gadget_unregister_driver(). The unregister path then invoked
> gadgetfs_unbind(), where destroy_ep_files() cleared epdata->ep. When
> ep_unlink_worker() later reached the dequeue call, it passed the now-NULL
> epdata->ep to usb_ep_dequeue().
> 
> Quiescing or flushing the relevant unlink work only after
> destroy_ep_files() would be too late for this ordering, because
> epdata->ep had already been cleared before that synchronization began.
> The teardown path therefore appears to need synchronization that prevents
> ep_unlink_worker() from dereferencing the endpoint after invalidation,
> whether by preventing new unlink_work from being queued and quiescing
> pending or running work before invalidation, retaining the endpoint until
> such work finishes, or using an equivalent state or lifetime mechanism.

destroy_ep_files() clears epdata->ep in order to prevent new I/O 
transfers.  But this situation involves terminating an existing 
transfer, which is quite different.  Therefore I think the best approach 
is to store a copy of the ep value in priv, so it will be available to 
ep_unlink_worker() even after epdata->ep is cleared.  (Although the 
driver isn't supposed to allocate new requests or start new transfers 
after an endpoint is disabled, it is allowed to free existing requests 
or try to cancel existing transfers.)

I think it will still be necessary to flush the workqueue after 
destroy_ep_files() runs.  The best way to check whether this is needed 
would be to put a long delay right at the start of ep_unlink_worker() 
and then run a test where during that delay, the test program closes its 
open files, unmounts the directory, and unloads the gadgetfs module.

A new patch containing the two changes discussed above follows.

Alan Stern



Index: usb-devel/drivers/usb/gadget/legacy/inode.c
===================================================================
--- usb-devel.orig/drivers/usb/gadget/legacy/inode.c
+++ usb-devel/drivers/usb/gadget/legacy/inode.c
@@ -236,6 +236,8 @@ static void put_ep (struct ep_data *data
 static const char *CHIP;
 static DEFINE_MUTEX(sb_mutex);		/* Serialize superblock operations */
 
+static DEFINE_SPINLOCK(aio_lock);	/* Protect aio cancellation info */
+
 /*----------------------------------------------------------------------*/
 
 /* NOTE:  don't use dev_printk calls before binding to the gadget
@@ -433,40 +435,99 @@ static long ep_ioctl(struct file *fd, un
 
 /* ASYNCHRONOUS ENDPOINT I/O OPERATIONS (bulk/intr/iso) */
 
+enum aio_req_state {
+	AIO_SUBMITTING,
+	AIO_RUNNING,
+	AIO_COMPLETED,
+	AIO_GIVEN_BACK,
+};
+
+enum aio_cancel_state {
+	AIO_NOT_CANCELLED,
+	AIO_UNLINKING,
+	AIO_UNLINK_DONE,
+};
+
 struct kiocb_priv {
 	struct usb_request	*req;
 	struct ep_data		*epdata;
+	struct usb_ep		*ep;
 	struct kiocb		*iocb;
 	struct mm_struct	*mm;
-	struct work_struct	work;
+	struct work_struct	copy_work;
+	struct work_struct	unlink_work;
 	void			*buf;
 	struct iov_iter		to;
 	const void		*to_free;
 	unsigned		actual;
+	enum aio_req_state	req_state;
+	enum aio_cancel_state	cancel_state;
 };
 
+static void ep_unlink_worker(struct work_struct *work)
+{
+	struct kiocb_priv	*priv;
+	struct usb_request	*req;
+	enum aio_req_state	req_state;
+
+	priv = container_of(work, struct kiocb_priv, unlink_work);
+	req = priv->req;
+
+	usb_ep_dequeue(priv->ep, req);
+
+	spin_lock_irq(&aio_lock);
+	req_state = priv->req_state;
+	priv->cancel_state = AIO_UNLINK_DONE;
+	spin_unlock_irq(&aio_lock);
+
+	/*
+	 * req and epdata are freed after unlinking and completion are both done.
+	 * priv is freed after unlinking and giveback are both done.
+	 */
+	if (req_state >= AIO_COMPLETED) {
+		usb_ep_free_request(priv->ep, req);
+		put_ep(priv->epdata);
+		if (req_state == AIO_GIVEN_BACK)
+			kfree(priv);
+	}
+}
+
 static int ep_aio_cancel(struct kiocb *iocb)
 {
-	struct kiocb_priv	*priv = iocb->private;
-	struct ep_data		*epdata;
-	int			value;
+	struct kiocb_priv	*priv;
+	unsigned long		flags;
 
-	local_irq_disable();
-	epdata = priv->epdata;
-	// spin_lock(&epdata->dev->lock);
-	if (likely(epdata && epdata->ep && priv->req))
-		value = usb_ep_dequeue (epdata->ep, priv->req);
-	else
-		value = -EINVAL;
-	// spin_unlock(&epdata->dev->lock);
-	local_irq_enable();
+	spin_lock_irqsave(&aio_lock, flags);
+	priv = iocb->private;
+	if (!priv || priv->cancel_state != AIO_NOT_CANCELLED) {
+		spin_unlock_irqrestore(&aio_lock, flags);
+		return -EINVAL;		/* Already completed or cancelled */
+	}
+	if (priv->req_state == AIO_SUBMITTING) {
+		priv->cancel_state = AIO_UNLINK_DONE;
+		spin_unlock_irqrestore(&aio_lock, flags);
+		return 0;	/* ep_aio() will call us again if needed */
+	}
 
-	return value;
+	priv->cancel_state = AIO_UNLINKING;
+	spin_unlock_irqrestore(&aio_lock, flags);
+
+	/*
+	 * We are called with the aio core holding iocb's context lock.
+	 * usb_ep_dequeue() is allowed to run synchronously, calling the
+	 * completion handler ep_aio_complete() before it returns.
+	 * But ep_aio_complete() may call iocb->kio_complete(), which
+	 * tries to acquire the context lock, leading to deadlock.
+	 * For this reason, do the dequeue operation in a work routine.
+	 */
+	INIT_WORK(&priv->unlink_work, ep_unlink_worker);
+	schedule_work(&priv->unlink_work);
+	return 0;
 }
 
 static void ep_user_copy_worker(struct work_struct *work)
 {
-	struct kiocb_priv *priv = container_of(work, struct kiocb_priv, work);
+	struct kiocb_priv *priv = container_of(work, struct kiocb_priv, copy_work);
 	struct mm_struct *mm = priv->mm;
 	struct kiocb *iocb = priv->iocb;
 	size_t ret;
@@ -482,19 +543,25 @@ static void ep_user_copy_worker(struct w
 
 	kfree(priv->buf);
 	kfree(priv->to_free);
-	kfree(priv);
+
+	spin_lock_irq(&aio_lock);
+	priv->req_state = AIO_GIVEN_BACK;
+	if (priv->cancel_state != AIO_UNLINKING)
+		kfree(priv);
+	spin_unlock_irq(&aio_lock);
 }
 
 static void ep_aio_complete(struct usb_ep *ep, struct usb_request *req)
 {
 	struct kiocb		*iocb = req->context;
 	struct kiocb_priv	*priv = iocb->private;
-	struct ep_data		*epdata = priv->epdata;
+	enum aio_req_state	new_req_state;
+	enum aio_cancel_state	cancel_state;
 
-	/* lock against disconnect (and ideally, cancel) */
-	spin_lock(&epdata->dev->lock);
-	priv->req = NULL;
-	priv->epdata = NULL;
+	/* Prevent future cancellation */
+	spin_lock(&aio_lock);
+	iocb->private = NULL;
+	spin_unlock(&aio_lock);
 
 	/* if this was a write or a read returning no data then we
 	 * don't need to copy anything to userspace, so we can
@@ -503,25 +570,35 @@ static void ep_aio_complete(struct usb_e
 	if (priv->to_free == NULL || unlikely(req->actual == 0)) {
 		kfree(req->buf);
 		kfree(priv->to_free);
-		kfree(priv);
-		iocb->private = NULL;
 		iocb->ki_complete(iocb,
 				req->actual ? req->actual : (long)req->status);
+		new_req_state = AIO_GIVEN_BACK;
 	} else {
 		/* ep_copy_to_user() won't report both; we hide some faults */
 		if (unlikely(0 != req->status))
-			DBG(epdata->dev, "%s fault %d len %d\n",
+			DBG(priv->epdata->dev, "%s fault %d len %d\n",
 				ep->name, req->status, req->actual);
 
 		priv->buf = req->buf;
 		priv->actual = req->actual;
-		INIT_WORK(&priv->work, ep_user_copy_worker);
-		schedule_work(&priv->work);
+		new_req_state = AIO_COMPLETED;
 	}
 
-	usb_ep_free_request(ep, req);
-	spin_unlock(&epdata->dev->lock);
-	put_ep(epdata);
+	spin_lock(&aio_lock);
+	priv->req_state = new_req_state;
+	cancel_state = priv->cancel_state;
+	spin_unlock(&aio_lock);
+
+	if (new_req_state == AIO_COMPLETED) {
+		INIT_WORK(&priv->copy_work, ep_user_copy_worker);
+		schedule_work(&priv->copy_work);
+	}
+	if (cancel_state != AIO_UNLINKING) {
+		usb_ep_free_request(ep, req);
+		put_ep(priv->epdata);
+		if (new_req_state == AIO_GIVEN_BACK)
+			kfree(priv);
+	}
 }
 
 static ssize_t ep_aio(struct kiocb *iocb,
@@ -532,11 +609,12 @@ static ssize_t ep_aio(struct kiocb *iocb
 {
 	struct usb_request *req;
 	ssize_t value;
+	struct usb_ep *ep;
+	bool need_unlink = false;
 
 	iocb->private = priv;
 	priv->iocb = iocb;
 
-	kiocb_set_cancel_fn(iocb, ep_aio_cancel);
 	get_ep(epdata);
 	priv->epdata = epdata;
 	priv->actual = 0;
@@ -547,10 +625,12 @@ static ssize_t ep_aio(struct kiocb *iocb
 	 */
 	spin_lock_irq(&epdata->dev->lock);
 	value = -ENODEV;
-	if (unlikely(epdata->ep == NULL))
+	ep = epdata->ep;
+	if (unlikely(ep == NULL))
 		goto fail;
+	priv->ep = ep;
 
-	req = usb_ep_alloc_request(epdata->ep, GFP_ATOMIC);
+	req = usb_ep_alloc_request(ep, GFP_ATOMIC);
 	value = -ENOMEM;
 	if (unlikely(!req))
 		goto fail;
@@ -560,12 +640,45 @@ static ssize_t ep_aio(struct kiocb *iocb
 	req->length = len;
 	req->complete = ep_aio_complete;
 	req->context = iocb;
-	value = usb_ep_queue(epdata->ep, req, GFP_ATOMIC);
+
+	priv->req_state = AIO_SUBMITTING;
+	priv->cancel_state = AIO_NOT_CANCELLED;
+
+	/* Not allowed to manipulate the aio context while holding dev->lock */
+	++epdata->dev->udc_usage;
+	spin_unlock_irq(&epdata->dev->lock);
+
+	kiocb_set_cancel_fn(iocb, ep_aio_cancel);
+	value = usb_ep_queue(ep, req, GFP_KERNEL);
+
+	spin_lock_irq(&epdata->dev->lock);
+	--epdata->dev->udc_usage;
+
 	if (unlikely(0 != value)) {
-		usb_ep_free_request(epdata->ep, req);
+		spin_lock(&aio_lock);
+		iocb->private = NULL;
+		spin_unlock(&aio_lock);
+
+		usb_ep_free_request(ep, req);
 		goto fail;
 	}
 	spin_unlock_irq(&epdata->dev->lock);
+
+	spin_lock_irq(&aio_lock);
+	if (iocb->private != NULL) {
+		priv->req_state = AIO_RUNNING;
+
+		/* Cancelled before or just after submission? */
+		if (priv->cancel_state == AIO_UNLINK_DONE) {
+			priv->cancel_state = AIO_NOT_CANCELLED;
+			need_unlink = true;
+		}
+	}			/* Otherwise already completed */
+	spin_unlock_irq(&aio_lock);
+
+	if (need_unlink)	/* Redo cancel that was too early */
+		ep_aio_cancel(iocb);
+
 	return -EIOCBQUEUED;
 
 fail:


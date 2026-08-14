Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A97F48AE1F
	for <linux-usb@vger.kernel.org>; Fri, 14 Aug 2026 16:17:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786724261; cv=none; b=t08dKdtzOOrmmegbBcul9MltGGjwj8dnZ879JxPCk25svWSeVSoDticR7GeZxcWDUJRc9+lGL0xZQQdNIE7r7DW84hx8P4EK40yCorEX5T8cu1kj2zZ29+FEUag1g/op5fc+yqruGaMS4iXOk0L1Xi9kdQ5vf6BusoEFklsrxN4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786724261; c=relaxed/simple;
	bh=juFDv7RvuAPqszMqqwEhpAF4VUFVTTR/K1AEUJ7aEOo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=elxJ7KgIc9UsnvAfujF4FOhJSAm/2paw/pBbso7J+2dXA0RveFD+0rjGftKZOtJIXy7AfXnsdP37C03NYoDWynADGaFfZqyvRT3lvkPMYElzibnjy6elvLOBCgQI3Faa99Vg1BLNcij0MIul9o9AMX+KscZSxKVmIVBrjq/Gibk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=tXltAKUv; arc=none smtp.client-ip=209.85.219.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="tXltAKUv"
Received: by mail-qv1-f54.google.com with SMTP id 6a1803df08f44-9061a795d76so11722746d6.3
        for <linux-usb@vger.kernel.org>; Fri, 14 Aug 2026 09:17:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1786724257; x=1787329057; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=gCFg5uMrkm2OEsRvXdLpnJSQsI053RQZSwuU+wws3qk=;
        b=tXltAKUvfN+FOWd3FIN61eq7lc6+ACuTHbkwtGcbtW7tXGI6EFYJnpkUed0iC4K5ZN
         uIfLe6PyEXA4os0pzgSaDA/koEOTm4sTeAJllY84FGeTi075zUf9scjg42ODGs0hkJGL
         LNCUQPFlkPe2HHMlXDPTnU+J+zhj34nDsT1CT7XfZFRHnBcnIo0ITasmMFKz6IHHuTOL
         040NRuOS0O7wPP6DwPJtUbIYtow9qebdgkDmIZ9hnsBG0NKJwNyJqCnoEXwpcAPjTl5n
         COuxUkho+ddJ98X411QdeQuab7r+/Wx/qslzcs+NLKVL0xPOmGZKjvO7lG4eg5K0/Kak
         mxCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786724257; x=1787329057;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gCFg5uMrkm2OEsRvXdLpnJSQsI053RQZSwuU+wws3qk=;
        b=cUWQnCc7xxMne9nFm4B/iEIvsy+Uc17pfX2LuBKEtFkbmRg8MiedB1IryTjLmJwKVy
         2rgEIWq3xjrm2sPDJLcmlRTxZ2nzEzgVFo7ssiLQ7EsQEyNqSLMEG4bzbGV9gRp7B1pt
         ZiuPflU3Q1Ia1SLu1rKByQZWi+HAjI8WACqVLHXRocAGFn7zFWuLsCzRpUxfiHHsj2kf
         CatJkACCQuDbtAhLlXkGSNtUdRsVFHnWo6RPMsX0MP48gGLp7g8WCTv48fwjOq2gbD3Y
         Tr81Bwp8SWzbQyZ+MaG+gXSc6nc/FHHC1aktvEkzFZiBs2EAYKV1IGzrXLrCn3HOSbu4
         AmcQ==
X-Forwarded-Encrypted: i=1; AHgh+RoSCGj2SJ8TUKAsRFwynEsDAwFLCkpESf3OBWKNi9iSIJRhgKy30jnu9LuXWS2fzpq+7eZlJgC6xYg=@vger.kernel.org
X-Gm-Message-State: AOJu0YwzFHl6xhsCgbHS2waRhxRRqVH1UPT8/wBe2uCC1ZUyGLkC/fCu
	3eeuEvi5nU8DW3QUSc+FqjEaBzQ1ahhQlLSRndO0tSXB5Op3sP6WgAmhmOTaG3LeTg==
X-Gm-Gg: AR+sD121IUy6wfltWILzpnqywig8Bj6BDZ5CCgfaTqtTMtkVwGqGeV4D1ZkmA2snv8A
	G+4XiiaPxyxWFuOmNlfZ1QigNPtf1IjcU6sPt3t9hR0oGkpZXN9f4moMlKNLpBeFGo08OJ9928z
	gjeIMGvrauSAtcrNbRBAykemJGWkGG+7j1xwOHjl+LRJ+1mgay0SNnxFOsBPx3QyBDf8iPIUIaF
	TVA+pma4FkJNcUPVFdLMHVcWhoPA99nXsuSvHyAYbsAHWeQrwcnB6cyIiFUeOeoZDa/xW62mJFa
	oERYkxBbwfMQ+XDlW5VsacS+uD7WRcVYFkCR9zLHPUhSQfhWQP+bIt9EaT/10mmpQoEy7ozQWp2
	879YTvfiHYAKto4BgxSHpT5yTrnuxR7/9ICvEEGyEY2c9FWwlAeACMXVzfLTrwRWkD0ua+WQDyB
	7EJbGa3AVWrrLfc841wdNd505hrHknxmzFYNGcr8j0rLNSccxc0lyPBEQ7iBI1wg==
X-Received: by 2002:a05:6214:5789:b0:8f5:c166:b418 with SMTP id 6a1803df08f44-90a91cd80afmr90211956d6.11.1786724256931;
        Fri, 14 Aug 2026 09:17:36 -0700 (PDT)
Received: from rowland.harvard.edu ([2601:19b:d01:d210::dfd8])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-90a93548b24sm20885956d6.36.2026.08.14.09.17.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Aug 2026 09:17:36 -0700 (PDT)
Date: Fri, 14 Aug 2026 12:17:33 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Minseo Kim <neck3922@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Andrey Konovalov <andreyknvl@gmail.com>, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org, syzkaller@googlegroups.com
Subject: Re: [BUG] usb: gadgetfs: KASAN null-ptr-deref and intermittent UAF
 in ep_aio_cancel()
Message-ID: <15185c2d-4544-42cc-ba0a-79dd36e82a21@rowland.harvard.edu>
References: <a7f9d958-7f9d-40eb-89ea-56094f60c075@rowland.harvard.edu>
 <CAFmvuTXx6bOEEusjf=bw5c-RDVu-bzRLbd_RVnhn2tLe4n4upQ@mail.gmail.com>
 <887e75d3-dd11-4d98-b6e6-5f6a2c3a6ae8@rowland.harvard.edu>
 <e05c6ba1-48f9-49e7-9d56-25db41e70f6e@rowland.harvard.edu>
 <CAFmvuTVYt2bVaqcyJVUSvNZfss6yzVdPbA5Wk2dtr89w2tz+5w@mail.gmail.com>
 <483692a4-8fb7-419e-90d5-1784b71fbb9f@rowland.harvard.edu>
 <CAFmvuTXvwuUrfbvsAQ_VvC9jH5iS62J+Ei23TD0NfQ_igFRJ_A@mail.gmail.com>
 <6761b47f-0230-4f3e-942c-26ed8dd6d0d4@rowland.harvard.edu>
 <CAFmvuTW2cfj5dzkRR8ymenWoA7tw1WAYsMitorvppTwcZ+xfbg@mail.gmail.com>
 <e8655e37-02b3-40ef-9ce0-98c8fa25481d@rowland.harvard.edu>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e8655e37-02b3-40ef-9ce0-98c8fa25481d@rowland.harvard.edu>

On Wed, Aug 05, 2026 at 12:17:22PM -0400, Alan Stern wrote:
> But as you have seen, there are still other problems in that driver.
> 
> However, I'm not sure it's worth working on them.  Greg KH is talking 
> about getting rid of almost all the drivers in the gadget/legacy 
> directory.  I don't know if that will include the gadgetfs driver.  If 
> it does, trying to fix up the driver will be a waste of time.

Not having heard anything from Greg, I'll assume that the driver is not 
in any imminent danger.

Accordingly, below is a new patch implementing the updates mentioned 
last time.  In particular, the ep_aio_cancel() carries out its dequeue 
operation in a separate thread, and ep_aio() drops dev->lock before 
calling kiocb_set_cancel_fn() and usb_ep_queue().

It will probably be necessary to flush the workqueue in 
gadgetfs_unbind() after calling destroy_ep_files(), to make sure that 
any work routines scheduled for aio requests are no longer running.  We 
can worry about that later.

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
@@ -433,40 +435,98 @@ static long ep_ioctl(struct file *fd, un
 
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
 
-static int ep_aio_cancel(struct kiocb *iocb)
+static void ep_unlink_worker(struct work_struct *work)
 {
-	struct kiocb_priv	*priv = iocb->private;
+	struct kiocb_priv	*priv;
 	struct ep_data		*epdata;
-	int			value;
+	enum aio_req_state	req_state;
 
-	local_irq_disable();
+	priv = container_of(work, struct kiocb_priv, unlink_work);
 	epdata = priv->epdata;
-	// spin_lock(&epdata->dev->lock);
-	if (likely(epdata && epdata->ep && priv->req))
-		value = usb_ep_dequeue (epdata->ep, priv->req);
-	else
-		value = -EINVAL;
-	// spin_unlock(&epdata->dev->lock);
-	local_irq_enable();
 
-	return value;
+	usb_ep_dequeue(epdata->ep, priv->req);
+
+	spin_lock_irq(&aio_lock);
+	req_state = priv->req_state;
+	priv->cancel_state = AIO_UNLINK_DONE;
+	spin_unlock_irq(&aio_lock);
+
+	/*
+	 * priv->req and epdata are freed after unlinking and completion are
+	 * both done.
+	 * priv itself is freed after unlinking and giveback are both done.
+	 */
+	if (req_state >= AIO_COMPLETED) {
+		usb_ep_free_request(epdata->ep, priv->req);
+		put_ep(epdata);
+		if (req_state == AIO_GIVEN_BACK)
+			kfree(priv);
+	}
+}
+
+static int ep_aio_cancel(struct kiocb *iocb)
+{
+	struct kiocb_priv	*priv;
+
+	spin_lock_irq(&aio_lock);
+	priv = iocb->private;
+	if (!priv || priv->cancel_state != AIO_NOT_CANCELLED) {
+		spin_unlock_irq(&aio_lock);
+		return -EINVAL;		/* Already completed or cancelled */
+	}
+	if (priv->req_state == AIO_SUBMITTING) {
+		priv->cancel_state = AIO_UNLINK_DONE;
+		spin_unlock_irq(&aio_lock);
+		return 0;	/* ep_aio() will call us again if needed */
+	}
+
+	priv->cancel_state = AIO_UNLINKING;
+	spin_unlock_irq(&aio_lock);
+
+	/*
+	 * usb_ep_dequeue() is allowed to run synchronously, calling the
+	 * request's completion handler before it returns.
+	 * We are called with the aio core holding the aio's context lock,
+	 * and ep_aio_complete() below may call iocb->kio_complete(), which
+	 * tries to acquire the context lock, which would cause deadlock.
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
@@ -482,7 +542,12 @@ static void ep_user_copy_worker(struct w
 
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
@@ -490,11 +555,13 @@ static void ep_aio_complete(struct usb_e
 	struct kiocb		*iocb = req->context;
 	struct kiocb_priv	*priv = iocb->private;
 	struct ep_data		*epdata = priv->epdata;
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
@@ -503,10 +570,9 @@ static void ep_aio_complete(struct usb_e
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
@@ -515,13 +581,24 @@ static void ep_aio_complete(struct usb_e
 
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
+		put_ep(epdata);
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
@@ -547,10 +625,11 @@ static ssize_t ep_aio(struct kiocb *iocb
 	 */
 	spin_lock_irq(&epdata->dev->lock);
 	value = -ENODEV;
-	if (unlikely(epdata->ep == NULL))
+	ep = epdata->ep;
+	if (unlikely(ep == NULL))
 		goto fail;
 
-	req = usb_ep_alloc_request(epdata->ep, GFP_ATOMIC);
+	req = usb_ep_alloc_request(ep, GFP_ATOMIC);
 	value = -ENOMEM;
 	if (unlikely(!req))
 		goto fail;
@@ -560,12 +639,45 @@ static ssize_t ep_aio(struct kiocb *iocb
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


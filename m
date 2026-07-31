Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE72E47CC87
	for <linux-usb@vger.kernel.org>; Fri, 31 Jul 2026 18:59:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785524368; cv=none; b=ZpTFG12oBaMI4dIQhAFqa8/+xwUTgTKvn8scs/SNgg0N0mV11U4xmwSYjI3uV5O9rBiVx4sEdm5dYzkIAQS6mc44xtDDF5Kae/Z02dRmWUfKxeM23pP0FZshPngzrBlBbvkt3b8SeQ7Vbq3RcHdrpJowPIj+zOKa6GnGtj74wS0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785524368; c=relaxed/simple;
	bh=+4UuqCGDJvYiHY5ATL3vTwUJpNpQn+RbOiQ7hFigNf4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=H74Kn6K3yBIloHpOtUbqA8Ows9DZi5tSokkdks84/6HGi7qQLrE8/t5hUScZygk0f5qlfWkQRwPoylDel02WOkzWQbE2U2WSPybjCIkBE/TfXbzJ8p5azU9/1ykV+jlDfh6d9cl9p54KjH2hJyn0D78tLaOZ2qPJSeGuzcfWq3k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=cOsY+SxE; arc=none smtp.client-ip=209.85.222.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="cOsY+SxE"
Received: by mail-qk1-f177.google.com with SMTP id af79cd13be357-92e602d2c0fso141814885a.0
        for <linux-usb@vger.kernel.org>; Fri, 31 Jul 2026 11:59:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1785524366; x=1786129166; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+bdNNeltNar6WxpdXcgfNthavCd4cr8ezSkYqu5772o=;
        b=cOsY+SxEp6BqZasnT9qERkvdo/Tl+U/+2CvzMEXtuSkvbh2omrVpzeM4Qv6rwcP3MQ
         XRzveSDgEbEuuop1eNcIivudoWfY+TqM8bMXsXJFk9aCMtR2Ua0fkWaJCEpZ2DA6uuMB
         u5Yw/DDoUqCApGzaIqmlWxwDZwtWjT8KQ2nsUk2XWInxrACKMOd76yKmEnCzXz238IWa
         gbWgqlWB+QeoeIbF9dBfHF6cv7m4B9q5t378zesMtQLHfz4y5vzqRw+0Z5RrvoU4J6Ka
         5Ez8scsVXfZSpgMZEewVUpA35Tg3QtEVd4XvdKZ2YjUIot8fqJKfNCmc0LCTRIZrQESw
         oiQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785524366; x=1786129166;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+bdNNeltNar6WxpdXcgfNthavCd4cr8ezSkYqu5772o=;
        b=FGLUuWmy2rjTjWUaqJH5C5FN9JEcd391dKkpgw1+WhiQWYE0hCHgqbkrzVUKLQYBbL
         K+TPwM65wWpirkpsP1zKPatneQItJmB5ocJ2aWGNxA2xxw/ZNxER2VaX9Qm6YNXANR1y
         vIn/dpdtpp3Ifsua+M71n0Mg2B1QHh1FE+bVw/s5N1qNhv3KTmXP+EIkhNv1c/CSmajH
         NJmsxkLDQ/qdQdQY/+dfo+pdQJ77wFw2sgKJ0CN4jn88cc83JO8sXv2QZNcXEiQHGgZ5
         RHStSAZAnWoMslhzVLLjRzK9pY1PSQN7FCM9KFBE1iGmrIEG4LLBZ+EV0+dzjWF3r6u6
         tuNQ==
X-Forwarded-Encrypted: i=1; AHgh+Rrsb4qNbIR2Rw3w6/iWanPzrWMoqSbdUR6hGq4V3TVrN30c7gIRVpit+9bq2fZdWIjENQsTvuG3va4=@vger.kernel.org
X-Gm-Message-State: AOJu0YyRK8QrLzAqwwhWkv0tKmiduXH0qdmVXwshKdimToMbCH0NukMM
	HdqF/2/oJfPjpk27zKwl3R1/uP7p84GBY1lnZ64535bTcCyY6kcbQ7M51wh+vr5KmA==
X-Gm-Gg: AR+sD134NoNorj00Qh1UJeQSfoZRXFgRe0PSvgxvSzsDP2SF/DYuG8HhvU7wjEOg+Jx
	a49C+5ei4uwA57Qhs5Difhi9QYDhDcYkZkbk50dPh7qtsMjR4tSibAiJC+zWFjd+K5+DNZJlXYG
	APOpX9alv0FwHIm7VNeY+xduTIBAsdVvlHVsXnB8jUiR5zngEZRPbsF/bFayUFX9zieG+H+A/st
	CL9fmbyu3elMEmmLoLp5H5FxTGPxEqg1mV6CbxbM/v4dCi98wCVK1ydbZdibIyQj/awuAGm61Q4
	a1yx2cInu7ivqcufJ64MjFNp7xxoKlmdqod0NST87NaCVZm59pm706XrnxQ3XGwVsQ/K3LEQsob
	KlpqU/3sawaJoRmFFj7anESubj88AJwjW0rePmEaJBcR02RhIu1Qu6T5i/hLGxz42n338j6u+z8
	POmFlK1aKjI4lfhhTC/0aOZTn88v7nHeFTRxUCvfCl/v3oc5Uu0jIkKo+c5NOWbA==
X-Received: by 2002:a05:620a:3d04:b0:915:92f3:54e3 with SMTP id af79cd13be357-9349aa7184fmr311577485a.4.1785524365624;
        Fri, 31 Jul 2026 11:59:25 -0700 (PDT)
Received: from rowland.harvard.edu ([2601:19b:d01:d210::dfd8])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9349c199641sm118752485a.22.2026.07.31.11.59.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jul 2026 11:59:24 -0700 (PDT)
Date: Fri, 31 Jul 2026 14:59:22 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Minseo Kim <neck3922@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	syzkaller@googlegroups.com
Subject: Re: [BUG] usb: gadgetfs: KASAN null-ptr-deref and intermittent UAF
 in ep_aio_cancel()
Message-ID: <483692a4-8fb7-419e-90d5-1784b71fbb9f@rowland.harvard.edu>
References: <CAFmvuTWq7TKZaj6R9JJzWhwe1WB1FanZ17T1-TFL1g2wsUBZ4w@mail.gmail.com>
 <8067503d-1c0d-4319-adbd-225a03e16ea3@rowland.harvard.edu>
 <CAFmvuTUEg8fr8pY91WpEk=CxHuackJfr0c2c4jxexNy9wkiS0A@mail.gmail.com>
 <a5e0e32a-7e49-4112-bcbc-92da449eb303@rowland.harvard.edu>
 <CAFmvuTXQbqbt3qxqUXitzboZhiMxAC7aaOqAtyZXs+QtJvAjBg@mail.gmail.com>
 <a7f9d958-7f9d-40eb-89ea-56094f60c075@rowland.harvard.edu>
 <CAFmvuTXx6bOEEusjf=bw5c-RDVu-bzRLbd_RVnhn2tLe4n4upQ@mail.gmail.com>
 <887e75d3-dd11-4d98-b6e6-5f6a2c3a6ae8@rowland.harvard.edu>
 <e05c6ba1-48f9-49e7-9d56-25db41e70f6e@rowland.harvard.edu>
 <CAFmvuTVYt2bVaqcyJVUSvNZfss6yzVdPbA5Wk2dtr89w2tz+5w@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFmvuTVYt2bVaqcyJVUSvNZfss6yzVdPbA5Wk2dtr89w2tz+5w@mail.gmail.com>

On Fri, Jul 31, 2026 at 12:55:03AM +0900, Minseo Kim wrote:
> For a fix, I think the important invariant is exactly-once completion and
> teardown: each GadgetFS private object and USB request must be released
> exactly once, the iocb must be completed exactly once, and no path may
> dereference any of these objects after its lifetime has ended.

Okay, the new patch below guarantees this.  Or at least, I believe it 
does.  :-)

> One additional point from the v2 results may be relevant to the approach
> you outlined: delaying kiocb_set_cancel_fn() until after successful
> submission. Moving it after a successful usb_ep_queue(), by itself, may
> not be sufficient: once the request has been queued successfully, its
> completion can run before cancellation is registered. The revised-patch
> UAF demonstrated this completion-before-registration ordering. The
> registration and completion paths therefore appear to need an additional
> ordering or lifetime mechanism.

The new patch registers the cancel function before submission, so this 
will be okay.

> There is also a locking constraint: io_cancel() and free_ioctx_users() can
> invoke the cancel callback while holding ctx->ctx_lock. A synchronous
> dequeue giveback must therefore not cause aio_complete_rw() to reacquire
> that lock while the iocb is still linked and the original caller still
> holds ctx->ctx_lock.

In the new patch, nothing more complicated than kfree() happens while 
the new aio_lock is held, no new locking cycles will be created.  Of 
course, your testing may reveal a pre-existing cycle.

On the other hand, we have no control over whether dequeue givebacks are 
synchronous.  If necessary we could complete the aio in a different 
thread, but that would be wasteful if it isn't needed.

Thanks for your help, and let me know how the patch below works out.

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
@@ -433,6 +435,19 @@ static long ep_ioctl(struct file *fd, un
 
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
@@ -443,24 +458,53 @@ struct kiocb_priv {
 	struct iov_iter		to;
 	const void		*to_free;
 	unsigned		actual;
+	enum aio_req_state	req_state;
+	enum aio_cancel_state	cancel_state;
 };
 
 static int ep_aio_cancel(struct kiocb *iocb)
 {
-	struct kiocb_priv	*priv = iocb->private;
+	struct kiocb_priv	*priv;
 	struct ep_data		*epdata;
+	struct usb_ep		*ep;
 	int			value;
+	enum aio_req_state	req_state;
 
-	local_irq_disable();
-	epdata = priv->epdata;
-	// spin_lock(&epdata->dev->lock);
-	if (likely(epdata && epdata->ep && priv->req))
-		value = usb_ep_dequeue (epdata->ep, priv->req);
-	else
-		value = -EINVAL;
-	// spin_unlock(&epdata->dev->lock);
-	local_irq_enable();
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
 
+	epdata = priv->epdata;
+	ep = epdata->ep;
+	priv->cancel_state = AIO_UNLINKING;
+	spin_unlock_irq(&aio_lock);
+
+	value = usb_ep_dequeue(ep, priv->req);
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
+		usb_ep_free_request(ep, priv->req);
+		put_ep(epdata);
+		if (req_state == AIO_GIVEN_BACK)
+			kfree(priv);
+	}
 	return value;
 }
 
@@ -482,7 +526,12 @@ static void ep_user_copy_worker(struct w
 
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
@@ -490,11 +539,16 @@ static void ep_aio_complete(struct usb_e
 	struct kiocb		*iocb = req->context;
 	struct kiocb_priv	*priv = iocb->private;
 	struct ep_data		*epdata = priv->epdata;
+	enum aio_req_state	new_req_state;
+	enum aio_cancel_state	cancel_state;
 
-	/* lock against disconnect (and ideally, cancel) */
+	/* lock against unbind */
 	spin_lock(&epdata->dev->lock);
-	priv->req = NULL;
-	priv->epdata = NULL;
+
+	/* Prevent future cancellation */
+	spin_lock(&aio_lock);
+	iocb->private = NULL;
+	spin_unlock(&aio_lock);
 
 	/* if this was a write or a read returning no data then we
 	 * don't need to copy anything to userspace, so we can
@@ -503,10 +557,9 @@ static void ep_aio_complete(struct usb_e
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
@@ -516,12 +569,23 @@ static void ep_aio_complete(struct usb_e
 		priv->buf = req->buf;
 		priv->actual = req->actual;
 		INIT_WORK(&priv->work, ep_user_copy_worker);
-		schedule_work(&priv->work);
+		new_req_state = AIO_COMPLETED;
 	}
-
-	usb_ep_free_request(ep, req);
 	spin_unlock(&epdata->dev->lock);
-	put_ep(epdata);
+
+	spin_lock(&aio_lock);
+	priv->req_state = new_req_state;
+	cancel_state = priv->cancel_state;
+	spin_unlock(&aio_lock);
+
+	if (new_req_state == AIO_COMPLETED)
+		schedule_work(&priv->work);
+	if (cancel_state != AIO_UNLINKING) {
+		usb_ep_free_request(ep, req);
+		put_ep(epdata);
+		if (new_req_state == AIO_GIVEN_BACK)
+			kfree(priv);
+	}
 }
 
 static ssize_t ep_aio(struct kiocb *iocb,
@@ -532,11 +596,12 @@ static ssize_t ep_aio(struct kiocb *iocb
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
@@ -547,10 +612,11 @@ static ssize_t ep_aio(struct kiocb *iocb
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
@@ -560,12 +626,37 @@ static ssize_t ep_aio(struct kiocb *iocb
 	req->length = len;
 	req->complete = ep_aio_complete;
 	req->context = iocb;
-	value = usb_ep_queue(epdata->ep, req, GFP_ATOMIC);
+
+	priv->req_state = AIO_SUBMITTING;
+	priv->cancel_state = AIO_NOT_CANCELLED;
+	kiocb_set_cancel_fn(iocb, ep_aio_cancel);
+
+	value = usb_ep_queue(ep, req, GFP_ATOMIC);
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
+	if (priv->req_state == AIO_SUBMITTING) {
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


Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 180E22F39AB
	for <linux-usb@vger.kernel.org>; Sun,  2 Aug 2026 16:07:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785686859; cv=none; b=oHLoUqtiXmpaxN38HVcWm/fzSt8Y9sph7qVxEjTNOl5Nnk3TumV2D5n4M8nhqbu9atwkQx8mQsAzv0DnMM/B4mUChd2V+iuYIQhPazZNiSwFFrGRrgESdfVrBguJwgXCYsgY1AioBBmnqsuVY1pvQmhSSIxsm79KQZf4HL1O3ZE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785686859; c=relaxed/simple;
	bh=pIZnRig4gmV1aV8/e26hOd1fP7pBZWGH0PfuIGX/mOM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VuuBYIDqqK6lsoQFFTa/5kD4ZM2pVCeL9n7x4VU+5irMhDkiG4zZ4xDxf1FO9E8z/RroF+HYKtUS7Hi5X7TI/bOUULZvlOMAFUngJslDxZSHAoR8qUabFKVLq5KesvQFRKFYlNWz/oPV8A1FXTtrLOojKhVtjDPfMr9y/hVJ+qA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=Sk+gyyW1; arc=none smtp.client-ip=209.85.160.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="Sk+gyyW1"
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-51c2808dbc3so14842301cf.1
        for <linux-usb@vger.kernel.org>; Sun, 02 Aug 2026 09:07:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1785686856; x=1786291656; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=r5JGJ4+JrG32eyiSzkz63YQUnhFRkI2lKXLnV/2mhS0=;
        b=Sk+gyyW1RE35dEopIui9+oAakkgoZAe3ppCOhW9hFiuA85bKNq79AKQPvsDdnO3yh+
         Fpej6VGHVXfNyX8wXz3Ve+yDNSKTYuK4jGq0skwP5IohVZlHF8vth2hq2pffU9A5QMr9
         uL8CK9JmWAf+6eX6lS0fY6JwRdlK7dOENK4cEtGFfzYUw7pfulof+mfHZ2BZsW3rKhag
         qcanUhK5jm6YbjoA/0Br3G2eGxKpK0Zmi2RFJLz80vcwpA8gd6HD0o8NkPtFIvnHRP2W
         kAkYL7MCw3Co4PcekMDXVOw57TEXVxCPMpfc3Dqqy4slRPQRJQKveSCsXGYTGKH2Rtzv
         7VrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785686856; x=1786291656;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=r5JGJ4+JrG32eyiSzkz63YQUnhFRkI2lKXLnV/2mhS0=;
        b=MHU1yLF+0rWMbZE37/jKTAoTWOxnz7WuVrAV5j2E2F4IEVYYeuNUhrDayuZvzLniJi
         zNOT0YUBcR/wV8wVQ3WCJWjN6DPGX9FnlTI3KPeJO9WHXDqCSvEc/0uhpu1LMjD9SyMN
         pNokzfCG0NSHkvmhgjak2bjl+myQH+SF5ZPyJJWefgQ8w+lkAnFSvHZyt3ZQiKrRS59d
         zoP6us/QtHhROJypxv3vz3zHELxWBC55jS3NRnfSLXUBpSaY3irj4q0GJPThS1wqQIWR
         h//q1R4vWs2W+ZBDweBwBPr2rp4zZv9LZg/0DWLLI/F4rChh4mu+QNjQ2AFWPEuje25s
         +LXQ==
X-Forwarded-Encrypted: i=1; AHgh+RrZkmab5uZG4ViffsHMvYZyXH4EenLnhTZabgei5Q8F73Zkyhrde4G55aka40PculQEFKMq13FhjSw=@vger.kernel.org
X-Gm-Message-State: AOJu0YxGMFUBIfQ5xjhgnpb7uIYaPbG94rkrEeQeoiG1VsBiG+0yd3oB
	tf+hskHYsE7GQA5ctmNFtfNI2NoXdaE7kkxVmAURU1KSIM169+1f2BbHn9WfqwZVuA==
X-Gm-Gg: AR+sD13W6eKvs35ip9/SmB3BPFs86nVl781EQj32RAfBVbSR1wekQ/0XberHDJ5fncv
	m2hjaxD8Qwp270Sj2iqDPJXnKC3de4MFiZPPNhiMMNa3QkCWRLG6Egs4x2iVD0rwOzWk24fTXtG
	kUkrO/8ColZxdP2FPOXOK8JB8Pwq+X724swrHdt+5z++1deTpFdpS+5FiXq0+7YcVUlLXHuhHOA
	SSWUfZDRZmlVdt3IVC4mKXZzQf5usUXbl3DT2stTCiZlETvt0oTdp5n0QUqYMFU7/cb5n+q5KwW
	zncAQe8Wlp0w1My4Z8Dlra8qx5xw+UvFvm3sozeIJ14u4EmRwYzgEkBMAdRwKapZpjKwIN+RnFj
	t9DupoPYWsLhs6QIFJS6N+kYZT2FFPL/tqIe8y1p+TKs0yB2IPzl5KL7IDDTEcU77MmfaAEVYa1
	7Pqu7vbYkhDsiS4VdCpOgW9/3Efpe5fnE6+qilO3U03fjMhjPxmp5xyrp3kAuiSw==
X-Received: by 2002:a05:622a:258a:b0:50e:a1ab:114c with SMTP id d75a77b69052e-52b56795c37mr142175591cf.32.1785686855779;
        Sun, 02 Aug 2026 09:07:35 -0700 (PDT)
Received: from rowland.harvard.edu ([2601:19b:d01:d210::dfd8])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-52b4eb956c3sm44815681cf.22.2026.08.02.09.07.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Aug 2026 09:07:34 -0700 (PDT)
Date: Sun, 2 Aug 2026 12:07:30 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Minseo Kim <neck3922@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	syzkaller@googlegroups.com
Subject: Re: [BUG] usb: gadgetfs: KASAN null-ptr-deref and intermittent UAF
 in ep_aio_cancel()
Message-ID: <6761b47f-0230-4f3e-942c-26ed8dd6d0d4@rowland.harvard.edu>
References: <CAFmvuTUEg8fr8pY91WpEk=CxHuackJfr0c2c4jxexNy9wkiS0A@mail.gmail.com>
 <a5e0e32a-7e49-4112-bcbc-92da449eb303@rowland.harvard.edu>
 <CAFmvuTXQbqbt3qxqUXitzboZhiMxAC7aaOqAtyZXs+QtJvAjBg@mail.gmail.com>
 <a7f9d958-7f9d-40eb-89ea-56094f60c075@rowland.harvard.edu>
 <CAFmvuTXx6bOEEusjf=bw5c-RDVu-bzRLbd_RVnhn2tLe4n4upQ@mail.gmail.com>
 <887e75d3-dd11-4d98-b6e6-5f6a2c3a6ae8@rowland.harvard.edu>
 <e05c6ba1-48f9-49e7-9d56-25db41e70f6e@rowland.harvard.edu>
 <CAFmvuTVYt2bVaqcyJVUSvNZfss6yzVdPbA5Wk2dtr89w2tz+5w@mail.gmail.com>
 <483692a4-8fb7-419e-90d5-1784b71fbb9f@rowland.harvard.edu>
 <CAFmvuTXvwuUrfbvsAQ_VvC9jH5iS62J+Ei23TD0NfQ_igFRJ_A@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFmvuTXvwuUrfbvsAQ_VvC9jH5iS62J+Ei23TD0NfQ_igFRJ_A@mail.gmail.com>

On Sun, Aug 02, 2026 at 03:08:11PM +0900, Minseo Kim wrote:
> Hi Alan,
> 
> Thank you for the new patch. I applied it as posted to upstream v7.2-rc1,
> commit dc59e4fea9d83f03bad6bddf3fa2e52491777482.
> 
> Across the timing ranges I tested, I did not reproduce the originally
> reported ep_aio_cancel() stale-priv failure on the kernel with the new
> patch applied. In a targeted diagnostic comparison, the original
> ep_aio_cancel() UAF was reproduced on the unpatched kernel. Using the
> same kernel configuration, reproducer, and arguments, the diagnostic
> runs on the patched kernel produced no KASAN or Oops. I also did not
> observe the original null-ptr-deref or UAF signatures in non-diagnostic
> runs of the patched kernel.
> 
> However, I observed a different slab-use-after-free in ep_aio() on the
> patched kernel:
> 
>   BUG: KASAN: slab-use-after-free in ep_aio+0x573/0x660
>   Read of size 4
>   drivers/usb/gadget/legacy/inode.c:647
> 
> This UAF was repeatedly reproduced on the patched kernel. It was not
> observed in control runs on the unpatched kernel using the same kernel
> configuration, reproducer, workload, and timing settings.
> 
> The ordering appears to be:
> 
> 1. ep_aio() registers cancellation and successfully queues the USB request.
> 2. ep_aio() releases epdata->dev->lock before acquiring aio_lock.
> 3. ep_aio_complete() can run the immediate-completion branch, clear
>    iocb->private, call iocb->ki_complete(), set priv->req_state to
>    AIO_GIVEN_BACK, observe that cancel_state is not AIO_UNLINKING, and
>    reach the path that frees priv.
> 4. ep_aio() then acquires aio_lock and reads priv->req_state at line 647.
> 
> Thus aio_lock serializes the post-queue state check and update, but it
> does not keep priv alive until ep_aio() has finished that transition.
> This is not the original ep_aio_cancel() stale-pointer window. The
> observed UAF and the code ordering are consistent with ep_aio()
> dereferencing priv after the completion path has freed it.
> 
> This suggests that the submitting path may need an additional lifetime
> handoff. Either priv must remain alive until ep_aio() has finished its
> post-queue work, or ep_aio() must no longer access priv after the point at
> which the completion path may free it.

In fact it's simpler than that; I didn't think to add a test in one 
spot.  The updated patch is below.  It differs from the previous patch 
only in that one line.

> In diagnostic runs, I also tested cancellation while the request was in
> AIO_SUBMITTING. In the queue-success ordering, I observed one completion
> event with res=-ECONNRESET; in the forced queue-failure ordering, one
> event with res=-EINVAL. Neither case produced KASAN or an Oops.
> 
> I also rechecked the potential unbind race you mentioned earlier. Using
> pointer-correlated tracing on the patched build, I observed an
> ep_aio_cancel() operation overlapping the gadgetfs_unbind() path while
> that path called usb_ep_disable() on the request's endpoint. The
> ep_aio_cancel() entry and ep_aio_complete() records referred to the same
> iocb, priv, and usb_request, and the corresponding usb_ep_dequeue()
> record referred to that same usb_request and endpoint.
> ep_user_copy_worker() also ran for the same priv while gadgetfs_unbind()
> was still in progress.

That's okay.  The possibility I was worried about was that 
gadgetfs_unbind() might complete while ep_aio_cancel() was still 
running.  If that happened, the usb_ep_free_request() and put_ep() calls 
near the end of ep_aio_cancel() might run into trouble.  Even worse, the 
aio file descriptor might get closed and the entire module unloaded from 
memory while ep_aio_cancel() is running on another CPU.

I don't know if that's possible, but I also don't see anything to 
prevent it from happening.  It might be necessary to add a reference 
counter for the number of outstanding aio operations.

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
+	if (iocb->private != NULL && priv->req_state == AIO_SUBMITTING) {
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


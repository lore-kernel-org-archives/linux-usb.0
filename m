Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E7333812FE
	for <linux-usb@vger.kernel.org>; Tue, 14 Jul 2026 03:23:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783999433; cv=none; b=tJbILrWxlLdEO5CNDAZpE2DJNat5n2neoDn59cZZK5kC9p44Tm2TC5Q8qVrcGljhhM6YdRNYeBgjQp637mG/Mi+nS/eoA8ddyBbXr38s1/LehnVcqDwXQ2EbYXtQTLz7NNgXjMi/o6MoMJ4hU5PcfxMacCpo1/NJH3g22lqDLZI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783999433; c=relaxed/simple;
	bh=qYPzZw//X7QsB/k1CgCQAPLqWKDLf0h5ACNsF6pQivc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=A9ST8wk9PTl5VF5IgMRhhokkc1h8LGW57sz0hOYHB5kKVYgf+RzAynnKyBkhWMn4YjzMePBcIpGB7mTohPh0OICGtSgaVgibkmtsQWJGqEu7/qN1qp/IFOJo7+hrX3Zb6qVgcbUMhvpa9jrhM6CM8ID5TDDQ1UumgHM+yW6VdJM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=ttonz4Ki; arc=none smtp.client-ip=209.85.222.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="ttonz4Ki"
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-92e55b62640so227328385a.0
        for <linux-usb@vger.kernel.org>; Mon, 13 Jul 2026 20:23:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1783999429; x=1784604229; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=N8lQpf0Ws7P8SqZGnBZf5+Hdd5mZTbzgyIda3MBUihM=;
        b=ttonz4KiVvlawd423yaiexkXwPHQ42nOZIoM1kg/OL3nr3ZfROg596KYMVD6oiW6ZI
         okZbF93umaz7xpnc90Dcy9dkPP1P/VyL2WlNtcexUHYcS4v+l44oC/5AU+0/oEh6pK+N
         CxK+ZpcyVNCMyoFElVJd4PfcovBd8ajdRCCeQeUJB9jBc9nIawrYyHvABFEIbvFELuks
         w/ZI7bv5K7O1BmpXSindEVZKJEAhD3t6KgHATdbPVA2Y2gp8HiuKWswlTjYhg3t+Fkz4
         K6gyvQoSbSEBR2WhGfXpU6MeK7CbBkJr9q+tzSAUa6fpUf2IA5mblyKhBId6lYMFP/9l
         0Y8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783999429; x=1784604229;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=N8lQpf0Ws7P8SqZGnBZf5+Hdd5mZTbzgyIda3MBUihM=;
        b=g55j9uxhU3L6sm3tdvmxHcfGpfA6eWlZCJ1mR+H2Y7tQSAeSihIN0wzBHOkI+3xnFm
         eYtLtq1IuL1nUCxLWDKIowKKehq5vagJkBPqPmdmt1/QuGTDhMgFpbwHkhOfaaazk7Ct
         CXaE5CeB+d8o7TIeVOQFQiCXlIxhAVCyj4ojktG36t0OzpwsKbbYp3KSXdErx60KBHw6
         kHHS5ErXefmmjirfWT6r1Q/25VKAd/bplNLoMI+4TN4tGykazJpSlhx5u7AeE9yvlTAz
         SGXlHK42syuZ3M3bsWobOUoH333z5M1p32DfYbCkOIouSiG0UaxxaVuZqoI1HxxU/o/g
         bx5w==
X-Forwarded-Encrypted: i=1; AHgh+Ro1PBj2o89fN+vJ36TpdeO50GfVZQ7OA+MqlLJftOsEmoW8i7X+8BVzBIaktORljRyF2ZMLiXX8AYc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzq8risW2eVUpfcE6ODrCU1fhCQ3LIACYBqR71bYsie0qOufxhW
	Y4aV6Oj/6p0oKg5B2Wxb8j7/0qcKYqXQsRfvSg1/CpEYJFdrIv+UxVfoANQ3xyMtrA==
X-Gm-Gg: AfdE7cm9xufXN6a6TEISMYZRaobqof+J343hamc1R2tQSanxCwPJYyK4oSS/SDeY+RG
	8Vp3QCEM6bXngLuUo0aGN0MK1XEOJLtt1sqNCS9L/YDBFvvUZltBLxGKlPLoANXkVuQebyo5tUQ
	U14OHXGz5lZ9EDfDHsbFZsksyy6EHarqd1X3l8NAEMoJ+5lO9douZbVjjZQNkp77DKszvuUmGsp
	YcQf/YZ5Fx7xvGMmuDK9iJ/xcS4O2NNfWVC2yH6rT8xeml4hOsyQ3Tl8n7MFh8gxdzUR68pGzus
	YA5wDi4YBKEk29uGOWP47jFNKPrnZ8KT/qoqqlryKIvxZKhKs5G1mnFCHW0FS/b1rL0Ky3q8aHo
	Gzui2kWn4UMGcHGhNXu8ZkXYpINPLNh45dK3Njcp111DWXGOLlhs81XsMgPdHt0cAWt8Aqi95eu
	k0gm7+Z5lO/5Shjlj/R6mD3P4i
X-Received: by 2002:a05:620a:444b:b0:92f:1d0:871c with SMTP id af79cd13be357-92f01d0878dmr772577585a.75.1783999429351;
        Mon, 13 Jul 2026 20:23:49 -0700 (PDT)
Received: from rowland.harvard.edu ([2601:19b:d01:d210::883a])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-92ee5b93387sm1440309685a.16.2026.07.13.20.23.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 20:23:48 -0700 (PDT)
Date: Mon, 13 Jul 2026 23:23:45 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Minseo Kim <neck3922@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	syzkaller@googlegroups.com
Subject: Re: [BUG] usb: gadgetfs: KASAN null-ptr-deref and intermittent UAF
 in ep_aio_cancel()
Message-ID: <a7f9d958-7f9d-40eb-89ea-56094f60c075@rowland.harvard.edu>
References: <CAFmvuTWc880R=mw7=kixfx3Yb8u9thLHPA7D=rm6a8p9dYBBDA@mail.gmail.com>
 <2d4a91dc-037f-4c31-8ce1-7bc840d42b0b@rowland.harvard.edu>
 <CAFmvuTWq7TKZaj6R9JJzWhwe1WB1FanZ17T1-TFL1g2wsUBZ4w@mail.gmail.com>
 <8067503d-1c0d-4319-adbd-225a03e16ea3@rowland.harvard.edu>
 <CAFmvuTUEg8fr8pY91WpEk=CxHuackJfr0c2c4jxexNy9wkiS0A@mail.gmail.com>
 <a5e0e32a-7e49-4112-bcbc-92da449eb303@rowland.harvard.edu>
 <CAFmvuTXQbqbt3qxqUXitzboZhiMxAC7aaOqAtyZXs+QtJvAjBg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFmvuTXQbqbt3qxqUXitzboZhiMxAC7aaOqAtyZXs+QtJvAjBg@mail.gmail.com>

On Tue, Jul 14, 2026 at 03:47:55AM +0900, Minseo Kim wrote:
> Hi Alan,
> 
> Thank you very much for taking the time to prepare this patch. I applied
> the patch as posted in your message to upstream v7.2-rc1, commit
> dc59e4fea9d83f03bad6bddf3fa2e52491777482.
> 
> I repeatedly tested the proposed patch with the original null-ptr-deref
> and UAF reproducers, as well as several reduced variants. During those
> tests, I did not observe either of the original signatures.

That's good progress.

> While continuing the tests, I observed a new null-ptr-deref in
> ep_aio_cancel() on the kernel with the proposed patch applied. It appears
> to be associated with the initialization window in ep_aio(). Running the
> reproducer without command-line arguments triggered:
> 
>   KASAN: null-ptr-deref in range [0x0000000000000028-0x000000000000002f]
>   RIP: ep_aio_cancel+0xd0/0x2d0
>   drivers/usb/gadget/legacy/inode.c:473
> 
> The corresponding source statement is:
> 
>   ep = epdata->ep;
> 
> where epdata is NULL. The faulting task has UID 1000.
> 
> One detail that may be relevant is the initialization order in ep_aio().
> iocb->private is assigned and kiocb_set_cancel_fn() registers the
> cancellation callback before priv->epdata is initialized. Because priv is
> zero-initialized and AIO_REQ_RUNNING is the zero-valued enumerator in the
> proposed patch, the state check can treat priv as RUNNING before the
> explicit state assignment. The observed crash is consistent with
> cancellation reaching this initialization window, because priv->epdata
> was NULL at the fault.

In the patch below, I moved the kiocb_set_cancel_fn() call down to after 
all the other initialization.  That ought to take care of the problem.   
But I admit, I don't understand how the I/O can be cancelled before 
ep_aio() returns.

> I also ran the reproducer on a LOCKDEP-enabled build. LOCKDEP reported the
> following possible circular locking dependency involving the newly added
> aio_lock:
> 
>   &ctx->ctx_lock -> aio_lock -> &dev->lock#2 -> &ctx->ctx_lock
> 
> The cycle appears to arise because io_cancel() calls ep_aio_cancel() while
> holding ctx->ctx_lock, and ep_aio_cancel() then acquires aio_lock. In the
> other direction, the patched completion path holds aio_lock and dev->lock
> while calling iocb->ki_complete(). In this path, the completion callback
> is aio_complete_rw(), which can acquire ctx->ctx_lock.
> 
> The reported cycle involving aio_lock appears specific to the proposed
> patch, since aio_lock is newly introduced there.

In the new patch I removed the dev->lock accesses in ep_aio_cancel() and 
moved the iocb->ko_complete() call outside the scope of aio_lock in 
ep_aio_complete().  This should break the locking cycles.

There's still a potential race: unbind against ep_aio_cancel or 
ep_user_copy_work.  That would be a difficult race to trigger; you'd 
have to unbind the gadgetfs driver just as an aio request was 
completing or being cancelled.

> I wanted to share these observations in case they are useful. Please let
> me know if I have misunderstood any part of the initialization or locking
> sequence.

No, I think you've done a great job of assimilating this complex 
information.  Let me know how the new patch works out.

Alan Stern


---
 drivers/usb/gadget/legacy/inode.c |   92 +++++++++++++++++++++++++++++---------
 1 file changed, 72 insertions(+), 20 deletions(-)

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
@@ -433,6 +435,13 @@ static long ep_ioctl(struct file *fd, un
 
 /* ASYNCHRONOUS ENDPOINT I/O OPERATIONS (bulk/intr/iso) */
 
+enum aio_req_state {
+	AIO_REQ_RUNNING,
+	AIO_REQ_CANCELLING,
+	AIO_REQ_CANCELLED,
+	AIO_REQ_COMPLETED,
+};
+
 struct kiocb_priv {
 	struct usb_request	*req;
 	struct ep_data		*epdata;
@@ -443,24 +452,48 @@ struct kiocb_priv {
 	struct iov_iter		to;
 	const void		*to_free;
 	unsigned		actual;
+	enum aio_req_state	aio_state;
 };
 
 static int ep_aio_cancel(struct kiocb *iocb)
 {
-	struct kiocb_priv	*priv = iocb->private;
+	struct kiocb_priv	*priv;
 	struct ep_data		*epdata;
-	int			value;
+	struct usb_ep		*ep;
+	struct dev_data		*dev;
+	int			value = -EINVAL;
+
+	spin_lock_irq(&aio_lock);
+	priv = iocb->private;
+	if (!priv || priv->aio_state != AIO_REQ_RUNNING)
+		goto Done;	/* Already completed or cancelled */
 
-	local_irq_disable();
+	priv->aio_state = AIO_REQ_CANCELLING;
 	epdata = priv->epdata;
-	// spin_lock(&epdata->dev->lock);
-	if (likely(epdata && epdata->ep && priv->req))
-		value = usb_ep_dequeue (epdata->ep, priv->req);
-	else
-		value = -EINVAL;
-	// spin_unlock(&epdata->dev->lock);
-	local_irq_enable();
+	ep = epdata->ep;
+	dev = epdata->dev;
+	spin_unlock_irq(&aio_lock);
+
+	value = usb_ep_dequeue(ep, priv->req);
+
+	/*
+	 * priv->req is freed by the first stage of completion or the
+	 * second stage of cancellation, whichever is last.
+	 * priv itself is freed by the final stage of completion or
+	 * the second stage of cancellation, whichever is last.
+	 */
+	spin_lock_irq(&aio_lock);
+	if (priv->aio_state == AIO_REQ_CANCELLING) {
+		/* Completion is not yet finished */
+		priv->aio_state = AIO_REQ_CANCELLED;
+	} else {
+		/* Must be AIO_REQ_COMPLETED so completion is finished */
+		usb_ep_free_request(ep, priv->req);
+		kfree(priv);
+	}
 
+ Done:
+	spin_unlock_irq(&aio_lock);
 	return value;
 }
 
@@ -482,7 +515,13 @@ static void ep_user_copy_worker(struct w
 
 	kfree(priv->buf);
 	kfree(priv->to_free);
-	kfree(priv);
+
+	spin_lock_irq(&aio_lock);
+	if (priv->aio_state == AIO_REQ_CANCELLING)
+		priv->aio_state = AIO_REQ_COMPLETED;
+	else
+		kfree(priv);	/* Not cancelled or cancellation is finished */
+	spin_unlock_irq(&aio_lock);
 }
 
 static void ep_aio_complete(struct usb_ep *ep, struct usb_request *req)
@@ -490,11 +529,16 @@ static void ep_aio_complete(struct usb_e
 	struct kiocb		*iocb = req->context;
 	struct kiocb_priv	*priv = iocb->private;
 	struct ep_data		*epdata = priv->epdata;
+	bool			cancelling;
+	size_t			ret;
+
+	/* lock against cancellation */
+	spin_lock(&aio_lock);
+	cancelling = (priv->aio_state == AIO_REQ_CANCELLING);
 
-	/* lock against disconnect (and ideally, cancel) */
+	/* lock against unbind */
 	spin_lock(&epdata->dev->lock);
-	priv->req = NULL;
-	priv->epdata = NULL;
+	iocb->private = NULL;		/* Prevent future cancellation */
 
 	/* if this was a write or a read returning no data then we
 	 * don't need to copy anything to userspace, so we can
@@ -503,11 +547,17 @@ static void ep_aio_complete(struct usb_e
 	if (priv->to_free == NULL || unlikely(req->actual == 0)) {
 		kfree(req->buf);
 		kfree(priv->to_free);
-		kfree(priv);
-		iocb->private = NULL;
-		iocb->ki_complete(iocb,
-				req->actual ? req->actual : (long)req->status);
+		if (cancelling)	/* Cancellation started, not yet finished */
+			priv->aio_state = AIO_REQ_COMPLETED;
+		else		/* Not cancelled or cancellation is finished */
+			kfree(priv);
+		ret = req->actual;
+		if (ret == 0)
+			ret = req->status;
+		spin_unlock(&aio_lock);		/* Cancel now may free req */
+		iocb->ki_complete(iocb, ret);
 	} else {
+		spin_unlock(&aio_lock);
 		/* ep_copy_to_user() won't report both; we hide some faults */
 		if (unlikely(0 != req->status))
 			DBG(epdata->dev, "%s fault %d len %d\n",
@@ -519,7 +569,8 @@ static void ep_aio_complete(struct usb_e
 		schedule_work(&priv->work);
 	}
 
-	usb_ep_free_request(ep, req);
+	if (!cancelling)	/* Not cancelled or cancellation is finished */
+		usb_ep_free_request(ep, req);
 	spin_unlock(&epdata->dev->lock);
 	put_ep(epdata);
 }
@@ -536,11 +587,11 @@ static ssize_t ep_aio(struct kiocb *iocb
 	iocb->private = priv;
 	priv->iocb = iocb;
 
-	kiocb_set_cancel_fn(iocb, ep_aio_cancel);
 	get_ep(epdata);
 	priv->epdata = epdata;
 	priv->actual = 0;
 	priv->mm = current->mm; /* mm teardown waits for iocbs in exit_aio() */
+	priv->aio_state = AIO_REQ_RUNNING;
 
 	/* each kiocb is coupled to one usb_request, but we can't
 	 * allocate or submit those if the host disconnected.
@@ -566,6 +617,7 @@ static ssize_t ep_aio(struct kiocb *iocb
 		goto fail;
 	}
 	spin_unlock_irq(&epdata->dev->lock);
+	kiocb_set_cancel_fn(iocb, ep_aio_cancel);
 	return -EIOCBQUEUED;
 
 fail:

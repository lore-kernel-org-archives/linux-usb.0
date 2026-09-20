Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F7BA45C6E9
	for <linux-usb@vger.kernel.org>; Sun, 20 Sep 2026 21:39:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789940398; cv=none; b=mowDSP61LIxJv0D9VPWPQ3+poDIpIIhzU2gExlgbDeuOYD8NibWLOP5F77Gi7rfOrGCroJFBdvJfll328pWgTNZMxfPLLJ/gOVUeRNsS/eU+gmBCC9ccfx5OAAN6WShMPE7Ny6jQB3wSKm96O6v0PlVpf91NU4C8riTfzabR3bE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789940398; c=relaxed/simple;
	bh=c74YBOZOkTUrjen6LA7t130fGfENork+jYRJ8jBxHE4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=BBMGexrK7NQAA/Pa9uFqEUBuL/l6Jl6dV5Rf56wh2PFAL5ESi+nXzxLGINmfAMcFu5C3KW3eHCQXtEvybJiH7KHciO7B6/fISKgtJFgLtHC30ph8eUTDfQN/FZAZa5HUZ8NxLnFGn7GDDhxAGmeRj73O6zAJzkW2a5s9TaagK10=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=RTPzCbVy; arc=none smtp.client-ip=209.85.160.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="RTPzCbVy"
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-52f9fc510e1so28128371cf.0
        for <linux-usb@vger.kernel.org>; Sun, 20 Sep 2026 14:39:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1789940390; x=1790545190; darn=vger.kernel.org;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LcYHRgsoDb+s1L9J+goIeR+hfuePWxAsgJqRHGHu/Bc=;
        b=RTPzCbVyBshwab8UUYXpLhb4aCBJxFcJ9IgoZ3MeKodMdFXIA0t/pBRykaFG5ZPUEa
         Xk4W7wKbmI58piFQTQVMXdDfymYBw4W3gUtX+FyOMjTychb2gsaygyZ2WEOCZsdRYhVO
         s9qKJzAbHUxh8Mpo9jbsmfcsSPhbS4p8BCWP4sg7qHqmtIs4uVsqq3ALHD56p5PrZTim
         J2BFnL0PxIaTbkaT2Psud30VFqGwxBabyMpRlTG/i2yTNK8GLpNb6p2d+okiyN99wqQ/
         Tk0ZE/1UEvMcQH/RC6bnoJXe4inxbS/oZ/dT0NPX62C262ZhKoYWkDIsLEVlyOzrWWWx
         WDHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789940390; x=1790545190;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LcYHRgsoDb+s1L9J+goIeR+hfuePWxAsgJqRHGHu/Bc=;
        b=rxkLVW1SLnRFYPNEFQYR5DrsR1hQZpmZeKhogS1gP4C7MPDFVzU3z0KrScArtc+Oaq
         FnwfGn08W2UkzAGmfXdmsKAn4A93UpBAfhTU4AzzGSxbd7d0/mqpfs+OJBLvXZSZ/vLj
         1FFS1Eetg+qJnTdml1rY/OzY+qB/G63Bde7x/hBTl53Q2TjugoKmQw5FEKdg9noshMqn
         QAv+a3FVO/P+CmHuy9A+CKGnCJXyjF/ZavsOWsiQ9guUwq3Kd6jzfV6iHh+zG5cHw5Ft
         pnKOMArgmycvLUSg0GHibJp4/DuWd6eZ3ijELU7kDLXq6ZV/RJXWKV4esTPPRbjkSj+Y
         uU7g==
X-Forwarded-Encrypted: i=1; AKwUvByV1AIM9PR4MPjaI52Ei8rUMEkxjGJ8muw4MzrfQNWhXSJ4P3oBqOo++UT8Ij3G0Xn3kHFxlNn8pfI=@vger.kernel.org
X-Gm-Message-State: AFuF++mne+qqEs1ddVMiiuK3XBV0VEkjJ88J/Bfkw28naCRZ8qIaXUxC
	NTbGf2HaVJwraX7nLkXP0rMc3TSNaXy/TuxvNs3nb2AUNlHDilZtNHyyEt/cAN+Vjg==
X-Gm-Gg: AYBFou3gz2Pzr8gnW9JK0KIKROxpinkyMDG88wb5Q5V36OQtkhhRo5g56xDhxNrfOHV
	dCFFPQQcjWZD18z3EQR9PsUwZwWr1qVsdkzeBD1D5yZJpITy3X4zaR9GwGsiVbECpMQOO7NQD9i
	OSDl2WiY/PIxtrbAqZvcbbcqV4IZeHxpRVTwRjjKHTwdebr757XlE5M4Tw9UpOh1fakxby9lR8J
	eX11vFJBazclcNa7dekGeR25cqeHlsc24Wm+Vu6eFETksxGocKsXnOSGdM4jZ+eypOobUTuOkNq
	/E6GhVhorxNVvtCsm6ugqS1SLuIssGBp2VDkNTEahg8/mcqS2VmZzMOvfxKv0u9XrBFbpG+KNC4
	qbj4H9/pO/t2h0fEX/d5NkcWm4AWhSyzcdgqbGM7khosOwLnhXQg+s5rc41NFAvFW+ovQp2yaT7
	BlUJNqsDJvA866pgZXOrkQxF6V05hYaXQKSpG0y9/NuxBbKRPefYvP2frxXE+tEHgl7vID5YA=
X-Received: by 2002:a05:622a:1e0d:b0:531:2394:9663 with SMTP id d75a77b69052e-532b71da94cmr69533421cf.7.1789940389599;
        Sun, 20 Sep 2026 14:39:49 -0700 (PDT)
Received: from rowland.harvard.edu ([2601:19b:d01:d210::7544])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-532ae511210sm49182291cf.2.2026.09.20.14.39.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Sep 2026 14:39:48 -0700 (PDT)
Date: Sun, 20 Sep 2026 17:39:46 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Minseo Kim <neck3922@gmail.com>,
	USB mailing list <linux-usb@vger.kernel.org>
Subject: [PATCH 1/3] USB: gadgetfs: Fix races and locking in asynchronous I/O
Message-ID: <c06cb937-6872-401a-8c94-1944f2838007@rowland.harvard.edu>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

It has been known for a long time that the asynchronous I/O handling
in the gadgetfs driver is subject to multiple races and locking
issues.  Even the very first version of AIO support -- see:

https://git.kernel.org/pub/scm/linux/kernel/git/tglx/history.git/commit/drivers/usb/gadget/inode.c?id=75787d943ab3770270c6c3f6e154ab8e59f693ef

-- had weird locking in ep_aio_cancel(), a tacit acknowledgment that
it wasn't being done correctly.  (I vaguely recall some discussion
about this on the linux-usb-devel mailing list, eventually concluding
that the problem was too hard to solve then.  See for example these
threads:

	https://marc.info/?l=linux-usb-devel&m=118530826204776&w=2
	https://marc.info/?l=linux-usb-devel&m=119129049420190&w=2

Note: usbfs2 was an attempt to update the usbfs API.  It never went
anywhere.)

Regardless, it's well past time to fix all these issues.  Minseo Kim
has done very thorough testing, and all the races he was able to find
are fixed by this patch.  So are the lockdep violations.

The key is keeping explicit track of the various stages of
asynchronous URB submission/completion as well as of AIO cancellation,
because bad interactions between those two are responsible for the
races.  Doing this required adding a new spinlock to serialize access
to the new state variables, as well as making local copies of values
belonging to a private data structure that could be deallocated at
unexpected times.

Fixing the lockdep problems required moving the usb_unlink_urb()
operation to a separate worker thread (see the comment added to
ep_aio_cancel()).  Aside from that, the overall structure of the code
was not changed very much, although there is quite a lot of churn in
several of the AIO-handling subroutines.

Reported-by: Minseo Kim <neck3922@gmail.com>
Closes: https://lore.kernel.org/CAFmvuTWc880R=mw7=kixfx3Yb8u9thLHPA7D=rm6a8p9dYBBDA@mail.gmail.com/
Tested-by: Minseo Kim <neck3922@gmail.com>
Signed-off-by: Alan Stern <stern@rowland.harvard.edu>

---

This is such an intrusive change, I hesitate to recommend it for the
-stable kernels.  Otherwise it would qualify.

The marc.info mailing list references in the description are necessary
because the linux-usb-devel mailing list was discontinued before
lore.kernel.org began operation.

 drivers/usb/gadget/legacy/inode.c |  184 +++++++++++++++++++++++++++++++-------
 1 file changed, 151 insertions(+), 33 deletions(-)

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
@@ -433,40 +435,104 @@ static long ep_ioctl(struct file *fd, un
 
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
 
-static int ep_aio_cancel(struct kiocb *iocb)
+static void ep_unlink_worker(struct work_struct *work)
 {
-	struct kiocb_priv	*priv = iocb->private;
+	struct kiocb_priv	*priv;
+	struct usb_request	*req;
 	struct ep_data		*epdata;
-	int			value;
+	struct usb_ep		*ep;
+	enum aio_req_state	req_state;
 
-	local_irq_disable();
+	priv = container_of(work, struct kiocb_priv, unlink_work);
+	req = priv->req;
 	epdata = priv->epdata;
-	// spin_lock(&epdata->dev->lock);
-	if (likely(epdata && epdata->ep && priv->req))
-		value = usb_ep_dequeue (epdata->ep, priv->req);
-	else
-		value = -EINVAL;
-	// spin_unlock(&epdata->dev->lock);
-	local_irq_enable();
+	ep = priv->ep;
 
-	return value;
+	usb_ep_dequeue(ep, req);
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
+		/* priv may have been freed already, depending on req_state */
+		usb_ep_free_request(ep, req);
+		put_ep(epdata);
+		if (req_state == AIO_GIVEN_BACK)
+			kfree(priv);
+	}
+}
+
+static int ep_aio_cancel(struct kiocb *iocb)
+{
+	struct kiocb_priv	*priv;
+	unsigned long		flags;
+
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
+
+	priv->cancel_state = AIO_UNLINKING;
+	spin_unlock_irqrestore(&aio_lock, flags);
+
+	/*
+	 * We are called with the aio core holding iocb's context lock.
+	 * usb_ep_dequeue() is allowed to run synchronously, calling the
+	 * completion handler ep_aio_complete() before it returns.
+	 * But ep_aio_complete() may call iocb->io_complete(), which
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
@@ -488,19 +554,25 @@ static void ep_user_copy_worker(struct w
 
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
@@ -510,25 +582,35 @@ static void ep_aio_complete(struct usb_e
 		mmdrop(priv->mm);
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
@@ -539,11 +621,12 @@ static ssize_t ep_aio(struct kiocb *iocb
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
@@ -555,10 +638,12 @@ static ssize_t ep_aio(struct kiocb *iocb
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
@@ -568,12 +653,45 @@ static ssize_t ep_aio(struct kiocb *iocb
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

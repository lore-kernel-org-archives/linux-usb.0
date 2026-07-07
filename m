Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96A712C3259
	for <linux-usb@vger.kernel.org>; Tue,  7 Jul 2026 17:31:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783445488; cv=none; b=srm8x+j3MzSrtcdeHHofs0/mT+tiBwCnuTND6kquKUtlZUOQqZBC8id5qnxs0NmTEqBsKKEv/bNYsZrBp/8y/ueJSte42ABLoEP8AUXIoF1NFw7LZo3QgFRxf4eihUvnYEoWQo9Po/5w1uaTynHoA25bC8XGJRiyNpcoeCjCrSg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783445488; c=relaxed/simple;
	bh=W7h00B/XDBDTVMfrRTZM4b57n06ur7YWuLuGTShyUXk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YP4n8p2kUaePpJ0+8/mxVdNuMFV1JwqxHEl9C9HctNCaAwlbd16tjHt1yT7ZyedGTNHPCvppVc8CVMkD2cZK8XNNC2MVpyjIC2haehjhBhBGsNp0egVuIifQTeFqomM9PEBqy0D7iygjYf92XT5Jp0LQPRmHQoQKmM/CGW3Gqmc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=IWnTAday; arc=none smtp.client-ip=209.85.160.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="IWnTAday"
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-51c0ecfaee7so27569301cf.0
        for <linux-usb@vger.kernel.org>; Tue, 07 Jul 2026 10:31:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1783445485; x=1784050285; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=NmWj9SvTHnNk1CJQ8AH3HLE0gEo9HAaU+02sEKte5V8=;
        b=IWnTAday3sDR1l/vKtpcexKE1VaLIftHeFEkDMeu7RVTUnVd76bmAKa2kVbtEzPZ/i
         45BAB2HIVeBYNKvr1Lk/XtBQKnIrTfnWUXsiH5I7hTH0Vc7GOUkS95EVFhcRAvaRf3y4
         5FYiyhW0AR6N/SemMLDKFzcjKzLI2bAK1Kv+2FbgQQSxkmtf5ScF6MHbR4UKeYJacFXN
         1Haeer2xfStsbTSwWp5OwBLy8PPRjTfo61WVu+0vIRRWTTMiWyZqpfu1i0YgtlO8uDvb
         1+hxQZ0n6TNhZhxr9kZGqOZUCLs5eWFCcPlWiVlD9SovbqA5ooaklj9yPgyIvD5zktjr
         fF3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783445485; x=1784050285;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NmWj9SvTHnNk1CJQ8AH3HLE0gEo9HAaU+02sEKte5V8=;
        b=WJS1ed/yahFiBYUSolIGdGofTBRLQrQPqb+gYavMzNzFvPDN26AH6LfuOlw8A5azZh
         JHzpewwwBiqNufi8U6PYlCYRZRiSX+Krn0DsXVag06N4DAcBFNC7owQ2KmDd81oHoIyn
         GSq7ReH5T1tlfztnNtmLIs1MhunAflCpNM6MVRjnpXmE5EY66JTvdy5XPRCbb4YyLtOr
         Nyvxaf3ed2EOGSFy/X5tuGQWHs7QF6lpPOQTvwRR4R/BheWs1IV0cowiTuS43/2GrsuP
         i98aXobAdo5+Np6JF196Q8HXHhLdIiVrYCXI9ilgEByQiva2DmV9lpEcyM76oyrX96/v
         d4EQ==
X-Forwarded-Encrypted: i=1; AHgh+Rr9P4+y84/p7Yy2LscgczDCIBfXEzBP6deEpR15A1kBUCHttqSnNYnf48rK5aV+by7wFh/JfcD+Sgw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+WuEKAz07+qaPGH3l/FZUy1MR9PWzyBWZlQsgIZHPZEgwjwNt
	hkORD8h3CDbhlMD6Udpynn9kqUpD96ZMQHF3ZGiGoAnLSuHFkxmVgTMKfSRukY28VQ==
X-Gm-Gg: AfdE7clXzj9pYQqZ8WNg49eXtdGejeOOh7vORD0onC6plyzzHdBbJmAby+mHGRTA1wB
	cREu9F2d/KtGCbvTBUhtfoFR+h3AkNz+0/JakjeKh82EbXjld/i4/dVQgar3eln2SMuC6rj91Fp
	PDYKWHQU8/oVSw63GAfAuq+x50FOeV7Fnn8g+kUrDS+OWgrmci/IdJoY7lDeB+AQk0bE10KhqXU
	q4GiAfMdCd7m+gcZE+Ck4UoCMnu3S4z1bbKcFXa3tBs9Dboa4kud85wFT1l0X/s+R5xemvkafTt
	E2CMK54SWxaVwiMpyiDqTmm7Fmlks3guRACwxsFWy9FeJKjSgSO4GGoqPlMDZnuJyeNpX51ZL6T
	F/mgZW/L3rGDOsr85w0e9KcEv/Mrlxxji/xUtDEkq3PNKryCFdG/7hMgLhFLYXbYcLoDoaUtlyy
	HgK6whCcQrVNEG/vOC1ocO5iYq5a+Md/IhpbynoFy5i/r9HMg6Mr6jpR7y1UYT0n0Ol/Q=
X-Received: by 2002:a05:622b:42:10b0:51c:7b12:6006 with SMTP id d75a77b69052e-51c7b126705mr25519081cf.82.1783445484843;
        Tue, 07 Jul 2026 10:31:24 -0700 (PDT)
Received: from rowland.harvard.edu ([2607:fb60:1011:2006:2008:aeb7:73d7:d8ff])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-51c41abe748sm119896771cf.1.2026.07.07.10.31.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 10:31:24 -0700 (PDT)
Date: Tue, 7 Jul 2026 13:31:21 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: =?utf-8?B?6rmA66+87ISc?= <neck3922@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	syzkaller@googlegroups.com
Subject: Re: [BUG] usb: gadgetfs: KASAN null-ptr-deref and intermittent UAF
 in ep_aio_cancel()
Message-ID: <a5e0e32a-7e49-4112-bcbc-92da449eb303@rowland.harvard.edu>
References: <CAFmvuTWc880R=mw7=kixfx3Yb8u9thLHPA7D=rm6a8p9dYBBDA@mail.gmail.com>
 <2d4a91dc-037f-4c31-8ce1-7bc840d42b0b@rowland.harvard.edu>
 <CAFmvuTWq7TKZaj6R9JJzWhwe1WB1FanZ17T1-TFL1g2wsUBZ4w@mail.gmail.com>
 <8067503d-1c0d-4319-adbd-225a03e16ea3@rowland.harvard.edu>
 <CAFmvuTUEg8fr8pY91WpEk=CxHuackJfr0c2c4jxexNy9wkiS0A@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAFmvuTUEg8fr8pY91WpEk=CxHuackJfr0c2c4jxexNy9wkiS0A@mail.gmail.com>

On Mon, Jul 06, 2026 at 10:18:11AM +0900, 김민서 wrote:
> I can help validate candidate fixes under KASAN against the reproducer and
> the intermittent UAF variant. I can also build a lockdep-enabled kernel and
> run the reproducer against candidate fixes if that would be useful.
> 
> The clearest conclusion I can draw is still the lifetime invariant:
> ep_aio_cancel() should not be able to use iocb->private as a
> struct kiocb_priv pointer after the completion path has cleared
> iocb->private or freed the underlying struct kiocb_priv. I would be happy
> to test any candidate fix or approach you think would be worth trying.

Here is a possible fix for you to test.  It's a little complicated, 
which is to be expected since this is a somewhat complicated problem.

I believe it will solve the problems you are seeing but I have not tried 
using it myself.

Alan Stern


---
 drivers/usb/gadget/legacy/inode.c |   80 +++++++++++++++++++++++++++++---------
 1 file changed, 63 insertions(+), 17 deletions(-)

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
@@ -443,24 +452,46 @@ struct kiocb_priv {
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
+	spin_lock(&dev->lock);
+	++dev->udc_usage;
+	spin_unlock(&dev->lock);
+	spin_unlock_irq(&aio_lock);
+
+	value = usb_ep_dequeue(ep, priv->req);
+
+	spin_lock_irq(&aio_lock);
+	if (priv->aio_state == AIO_REQ_CANCELLING) {
+		priv->aio_state = AIO_REQ_CANCELLED;
+	} else {		/* Must be AIO_REQ_COMPLETED */
+		usb_ep_free_request(ep, priv->req);
+		kfree(priv);
+	}
+	spin_lock(&dev->lock);
+	--dev->udc_usage;
+	spin_unlock(&dev->lock);
 
+ Done:
+	spin_unlock_irq(&aio_lock);
 	return value;
 }
 
@@ -482,7 +513,13 @@ static void ep_user_copy_worker(struct w
 
 	kfree(priv->buf);
 	kfree(priv->to_free);
-	kfree(priv);
+
+	spin_lock_irq(&aio_lock);
+	if (priv->aio_state == AIO_REQ_CANCELLING)
+		priv->aio_state = AIO_REQ_COMPLETED;
+	else
+		kfree(priv);
+	spin_unlock_irq(&aio_lock);
 }
 
 static void ep_aio_complete(struct usb_ep *ep, struct usb_request *req)
@@ -490,11 +527,15 @@ static void ep_aio_complete(struct usb_e
 	struct kiocb		*iocb = req->context;
 	struct kiocb_priv	*priv = iocb->private;
 	struct ep_data		*epdata = priv->epdata;
+	bool			cancelling;
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
@@ -503,8 +544,10 @@ static void ep_aio_complete(struct usb_e
 	if (priv->to_free == NULL || unlikely(req->actual == 0)) {
 		kfree(req->buf);
 		kfree(priv->to_free);
-		kfree(priv);
-		iocb->private = NULL;
+		if (cancelling)
+			priv->aio_state = AIO_REQ_COMPLETED;
+		else
+			kfree(priv);
 		iocb->ki_complete(iocb,
 				req->actual ? req->actual : (long)req->status);
 	} else {
@@ -519,8 +562,10 @@ static void ep_aio_complete(struct usb_e
 		schedule_work(&priv->work);
 	}
 
-	usb_ep_free_request(ep, req);
+	if (!cancelling)
+		usb_ep_free_request(ep, req);
 	spin_unlock(&epdata->dev->lock);
+	spin_unlock(&aio_lock);
 	put_ep(epdata);
 }
 
@@ -541,6 +586,7 @@ static ssize_t ep_aio(struct kiocb *iocb
 	priv->epdata = epdata;
 	priv->actual = 0;
 	priv->mm = current->mm; /* mm teardown waits for iocbs in exit_aio() */
+	priv->aio_state = AIO_REQ_RUNNING;
 
 	/* each kiocb is coupled to one usb_request, but we can't
 	 * allocate or submit those if the host disconnected.

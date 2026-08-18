Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF4E639BFED
	for <linux-usb@vger.kernel.org>; Tue, 18 Aug 2026 02:57:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787021846; cv=none; b=PEswNE5T54rkixBInAnk51RInsClBySumYQCS4KD2MddKK1hM1vOw971E1B2gZIWJ2sDhtg38lDavuEjxaUkhraOuit4H/E59msb+ir6B9ppZqgJXXm69PtoRntRPI3liPpwd3Eyx/0oBDxAHslFxqryS7QQ5bqJZ5b2THidQjk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787021846; c=relaxed/simple;
	bh=USn2Is9PCw/QX4PDBFvGC03MsJcww0Lq12xzzHHqiDw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ghIOfWVe7DfobPqz/dBqQk+etQvrKNabyfut5PZTgBM9brx/Dx/3lEYJJjlvlXFzXYIOp0LlvyfvR7S6zfgg/3hcxhavoQ2PwFfGeSkTb1xXGoH+utu+5+sqD/uFDf3VWajXp8X/5wSP1Ic8n71ioipIGv4SOt8uE+7chG6dKjM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=J7juA8mH; arc=none smtp.client-ip=209.85.222.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="J7juA8mH"
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-936c02e58dfso264117085a.3
        for <linux-usb@vger.kernel.org>; Mon, 17 Aug 2026 19:57:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1787021843; x=1787626643; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=GFP7DhkFoVg28mbqSuGTGChOaQ1hxwuFbDRkVPBhG8k=;
        b=J7juA8mHIseBBofc3pVjshP+XN1PHQTZEbW+UGcQXxe/OLHrJzV+VhcWBemr9p6qZ5
         vkEoWdkLZMStFgghLVORCW6bhR44tyM7PEFpvp3dvtMq3d+glsRJw3NXDVAHh1KkT4xn
         6D4b2T+EguLIk5i4fVYSxHq7UrOysYL6ZnPSgEpbMaX0tM2hGu47XA2Ek6zmZkbmuQJo
         QP/roVTB8fi6/l+hbfK/Vm/IS0aClH9kyzNnDv19VoWcc146cXVb6909yt5NKSsyuf4N
         cNbWn8Nym49tCa+Sn9Jz7pUmaEbfQr/UO0NJwUMsYiI5KjnrsxTYRDYhrO4CMwoeFdqH
         YsTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787021843; x=1787626643;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GFP7DhkFoVg28mbqSuGTGChOaQ1hxwuFbDRkVPBhG8k=;
        b=CEH4mkj0EsXSgiikUcbnCX2TN8W9yHgqxX24NlRhJzAoWL9wn7y6avltbP7dUQ1Hsb
         V8/Fsryw+ruQZ4r4e0bn29gJ6Q3FiYqlK8yTRACy2vsjaIKUB5u1dtP4cKCxBI1ExGck
         6whchGySA2fUGygJcNgJhqLs5+en4goRD88im3CzFfD08iOkYG4LrlxUP1SDLDuc3iSC
         p2hhdCU5dr5UMRgAQ13s1pQXVB2d+qWfQurWY5aCHGcGqNmgfWcqvOYtUb4bgadFde+F
         GEPEa7eDwIkhhHm7cA6FXZ6eERtkQNYWVEx/T+f3g7PbAg0m4TlbcpCkPixFzqmFR+tF
         9+Lw==
X-Forwarded-Encrypted: i=1; AHgh+RqA0TveMiRLN0qzLtDhKB49TXiPwCza2c28zW5Y9L3jifx5KStLjqwEAPQXrQl+XPTGYgH7ABcgkCc=@vger.kernel.org
X-Gm-Message-State: AOJu0YwLGrqDixtqX90Sg+G2m3aeU5/WBmawAbrKSxBFXuUabE2fOjY/
	L+ki6P950bHHJp/EnHKPKZpTkeS3sjJIfd2BDOVJ6pcVhPY9kd8CIicqgFI7oTWxmw==
X-Gm-Gg: AR+sD10hNk8/AVp2mJ4AGGy57dU1aFOYlM5sUrFSb24TQKlu+P1hS5q9RwgPoZvVtLM
	Uo4ql/eWqBNue1ZP4SHmnWSOF1wTpIwsejJHP68W3tLhYknzeXqI+3JLR48/nw0YODE4i+KPr7S
	fHp+lUnAM5UO8pVgVYGMAJ94D9er1FPXaH4OcptTALS3InIJovI+hssOtxDoWaMBQWXMmD0bwKj
	gaSHcxjasIRszBAkhRT2A54IH3UeZUW5lPZ39Cj6TJJRQP0h+jom/0AT/KtTdUtxbjyjpKj5tQD
	jNlMK411LgfyyuiV4VFCRDnl0IuAJjYmLya4I61agCDfyjHNGaJVdN6GO93XzMNi0v38ormUH3h
	CEb9yrRQF5iL/OujK3iVtvcxsf31SuF2D8H1yz5JdN+C6dIZ5dfn9E2gGk9BZcF2mE67LYCDiHk
	E4bDo7q/qWQVS25O/U7ImTjtdKoJRAra2GTxMHrwEdu9L6e1dwqVqe4athqp0A8vTaHNG5xRrr
X-Received: by 2002:a05:620a:6881:b0:931:2:65b6 with SMTP id af79cd13be357-936d238c122mr3645935085a.38.1787021842576;
        Mon, 17 Aug 2026 19:57:22 -0700 (PDT)
Received: from rowland.harvard.edu ([2601:19b:d01:d210::dfd8])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-937033fadc5sm188774785a.33.2026.08.17.19.57.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Aug 2026 19:57:21 -0700 (PDT)
Date: Mon, 17 Aug 2026 22:57:19 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Minseo Kim <neck3922@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Andrey Konovalov <andreyknvl@gmail.com>, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org, syzkaller@googlegroups.com
Subject: Re: [BUG] usb: gadgetfs: KASAN null-ptr-deref and intermittent UAF
 in ep_aio_cancel()
Message-ID: <cd57f283-71e6-4531-a311-1180ccc22ab8@rowland.harvard.edu>
References: <887e75d3-dd11-4d98-b6e6-5f6a2c3a6ae8@rowland.harvard.edu>
 <e05c6ba1-48f9-49e7-9d56-25db41e70f6e@rowland.harvard.edu>
 <CAFmvuTVYt2bVaqcyJVUSvNZfss6yzVdPbA5Wk2dtr89w2tz+5w@mail.gmail.com>
 <483692a4-8fb7-419e-90d5-1784b71fbb9f@rowland.harvard.edu>
 <CAFmvuTXvwuUrfbvsAQ_VvC9jH5iS62J+Ei23TD0NfQ_igFRJ_A@mail.gmail.com>
 <6761b47f-0230-4f3e-942c-26ed8dd6d0d4@rowland.harvard.edu>
 <CAFmvuTW2cfj5dzkRR8ymenWoA7tw1WAYsMitorvppTwcZ+xfbg@mail.gmail.com>
 <e8655e37-02b3-40ef-9ce0-98c8fa25481d@rowland.harvard.edu>
 <15185c2d-4544-42cc-ba0a-79dd36e82a21@rowland.harvard.edu>
 <CAFmvuTU=t5TiZSpHmF1MXpVs+3K7G1VOTDeeazwGru4+1eozBg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFmvuTU=t5TiZSpHmF1MXpVs+3K7G1VOTDeeazwGru4+1eozBg@mail.gmail.com>

On Tue, Aug 18, 2026 at 04:49:08AM +0900, Minseo Kim wrote:
> Hi Alan,
> 
> Thank you for letting me know that the earlier results were helpful.
> 
> I applied the patch as posted to upstream v7.2-rc1, commit
> dc59e4fea9d83f03bad6bddf3fa2e52491777482.
> 
> I reran the original null-ptr-deref and UAF reproducers, along with the
> reproducers for the earlier candidate-patch regressions. I did not observe
> the corresponding KASAN signatures with this patch.

Nor any of the old lockdep violations, I trust.

> A separate cross-CPU concurrency diagnostic appears to expose a remaining
> lifetime race in the deferred-read cancellation path. As I understand it,
> copy_work and unlink_work are distinct work items queued through
> schedule_work() and may execute concurrently on different CPUs. I did not
> see an ordering mechanism in the posted patch that would serialize the two
> work items. I therefore treated their concurrent execution as a possible
> interleaving and modified only dummy_hcd to exercise it directly.

That's right; the two work items are allowed to run concurrently.

> On dummy_hcd's successful dequeue path, the calling path released
> dummy_hcd's lock and restored its IRQ state before invoking work_on_cpu().
> The diagnostic ran the giveback on another online CPU and waited for it to
> complete before usb_ep_dequeue() returned. GadgetFS remained exactly as in
> the posted patch. The target-CPU helper disabled local IRQs around
> usb_gadget_giveback_request() and restored the previous IRQ state after
> the function returned. The VM used a fixed four-CPU configuration and did
> not perform CPU hotplug.
> 
> With this diagnostic, the C workload repeatedly triggered:
> 
>   BUG: KASAN: slab-use-after-free in ep_unlink_worker+0x1d1/0x1f0
>   Read of size 8
>   drivers/usb/gadget/legacy/inode.c:488
> 
> The faulting source statement is:
> 
>   usb_ep_free_request(epdata->ep, priv->req);
> 
> I did not reproduce this UAF with unmodified dummy_hcd under the same
> kernel configuration, reproducer, and arguments. Those runs completed
> without KASAN or an Oops and produced one AIO completion event with
> res=512 for each request.
> 
> The observed UAF is consistent with the following ordering.
> ep_unlink_worker() calls usb_ep_dequeue(), and the giveback enters
> ep_aio_complete(), sets req_state to AIO_COMPLETED, and queues
> ep_user_copy_worker(). After usb_ep_dequeue() returns, the unlink worker
> observes AIO_COMPLETED, sets cancel_state to AIO_UNLINK_DONE, and releases
> aio_lock. The copy worker can then set req_state to AIO_GIVEN_BACK,
> observe that cancel_state is no longer AIO_UNLINKING, and free priv before
> the unlink worker reaches the access above.

Ah, that's an interleaving I failed to anticipate.

> aio_lock serializes these state changes, but it does not keep priv alive
> after the unlink worker releases the lock. This suggests that the final
> free must be deferred until every queued or running work item that may
> access priv has finished accessing it. For example, a lifetime reference
> could be taken for unlink_work before it is queued and released after
> ep_unlink_worker() has finished its final access, or an equivalent
> last-user mechanism could release priv only after both work items have
> finished accessing it.

It's an easy problem to fix; just make sure that the unlink worker does 
not access priv after setting cancel_state to AIO_UNLINK_DONE unless it 
sees that req_state was AIO_GIVEN_BACK.  The revised patch is below.

> The reproducer does not close the GadgetFS files or trigger unbind during
> the request loop, and it consumes all AIO completion events before
> teardown. A workqueue flush in gadgetfs_unbind() would therefore address
> teardown ordering, but it would not serialize unlink_work and copy_work
> during this race.

Yes, I think that's an issue for a different discussion.

> If I have misunderstood whether the USB gadget API permits a UDC to
> deliver a dequeue giveback on another CPU before usb_ep_dequeue() returns,
> please let me know.

It all sounds good.  There's just one more thing I'd like to be sure 
gets tested: What happens if the aio is cancelled exactly between 
ep_aio()'s calls to kiocb_set_cancel_fn() and usb_ep_queue()?  This is a 
new possibility created by the patch, and we should ensure that the 
approach it takes is correct.

Thanks a lot for all your testing and analysis!

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
+	struct usb_request	*req;
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
+	req = priv->req;
 
-	return value;
+	usb_ep_dequeue(epdata->ep, req);
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
+		usb_ep_free_request(epdata->ep, req);
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
@@ -482,7 +543,12 @@ static void ep_user_copy_worker(struct w
 
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
@@ -490,11 +556,13 @@ static void ep_aio_complete(struct usb_e
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
@@ -503,10 +571,9 @@ static void ep_aio_complete(struct usb_e
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
@@ -515,13 +582,24 @@ static void ep_aio_complete(struct usb_e
 
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
@@ -532,11 +610,12 @@ static ssize_t ep_aio(struct kiocb *iocb
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
@@ -547,10 +626,11 @@ static ssize_t ep_aio(struct kiocb *iocb
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

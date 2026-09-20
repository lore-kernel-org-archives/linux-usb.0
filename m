Received: from mail-qk2-f12.google.com (mail-qk2-f12.google.com [74.125.230.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5525E477E2E
	for <linux-usb@vger.kernel.org>; Sun, 20 Sep 2026 21:43:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.204
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789940621; cv=none; b=Zsgwn9cG787BJakloOZfw6pQcNXp3O9ZVzWdKlHP2QBAKcFI/92I58SyC1QnG+8Lv4XZSqfVQSKDaunIvzSZtC5PmRM/pZVwxfD5SlI7lhD+0sNS6/Juf8vYycqpwI1U+SL9qdmFU1Y1gIj8Yb7ezgyQScJMfJUMstBPstio+Rs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789940621; c=relaxed/simple;
	bh=g+Lz9pcc9xHooiuStZ8V3Xm5HLtOQWyrVoZDA9Kw8Zs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NTLepVIIN1euaLboCi5VIR1GNsSR6LNtVyKvlbjSwP5jw62+PGC5D1njJdMB/zChQQPiZMUt/fGfxAJaCFc3F2cOIjay3G45tVYtnogHYHiBu7Yz+rVXIVpmSI+ROO8ik5G+tHv726yFr+UC+HsK+RDhDe8bSkezUOG0O9yPXrI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=JNTBrz9M; arc=none smtp.client-ip=74.125.230.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="JNTBrz9M"
Received: by mail-qk2-f12.google.com with SMTP id d75a77b69052e-530301ff353so31661841cf.2
        for <linux-usb@vger.kernel.org>; Sun, 20 Sep 2026 14:43:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1789940619; x=1790545419; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=tHb11wYQB0tVqBVFqiaZ3n9EfOYTdOebOAyONiE3TNA=;
        b=JNTBrz9MqLFgLmKRhSB4/8PQlKGB0PXMMIV6Q6bROgPK+lr8r2Ln6eUb2qYfzxvVnN
         7V3QMNOdjOUSUKXY1vTIOa+ILghVxmPtI4S2WNRho0RcWJMuoV3vekcdz3i7vb76p5HH
         RsWkkfIfbgZohHlfl3Y59e0psUCpwJ84RarIKYdztMfsZRs2TKiNku81wFaqxe9ECyiQ
         FvV2UsbHME1qvsmA1yzyl43QRpyYnLXSTKhuo9AXXz4KHd8x4bezdrFZbJUw3HdDjgPd
         X73IEJJ0RtYrxwzFEmeIZZXyayAk/LzACQU+YOB/xwtp7+fjatNiMgdSZuNyGuPMqgQ0
         dqVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789940619; x=1790545419;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tHb11wYQB0tVqBVFqiaZ3n9EfOYTdOebOAyONiE3TNA=;
        b=VUN9xL/3EzYNv70ywRtA4b8UDVELG6PvxyuKUUL0qOIFNrFnqfXMwjvuWs5XVY+Cty
         0c2y6lVCXCAWDMDAI1CnAqiamoJGH7B813/JGp99uPNnSpHjF6emZV8mkF84oRb7iD0W
         1HwnDZUimyJDm4v1hR7bCPsQe9hk5hL6AIxlIhce/eXNhJO5OYXIhHzUKSbiFhs+obnC
         LBzYe0+WVmvcrH4aHy2scG2aXCckd5qPiC4thmTNjpT+EYFatAP71thywV9EWMPTu7Sp
         MoAiM3KH8PJnvkiAyiMUO+iYA47+x5fQufxdTWhgvOJmteqNoK4MdO4/5PsYPs+lnPlX
         Dvog==
X-Forwarded-Encrypted: i=1; AKwUvBwOYhg5NKPuy3MjnTaqDrh8KwesL4Q/HKIN5Z/xRUzZkyE5c6cUNzjZA4rcWlJWxokehea5O28miwM=@vger.kernel.org
X-Gm-Message-State: AFuF++k4T3HgBbq09mM7/wlg7tCAVdMoMLM8C1gaekycq8hml/AXiLJ5
	ux5JdzGGslo4NaXAkjrk6W9Fryb4M5ZtGqRsE64iphYESJ/ErsUlDtlvl/n6Si8K6A==
X-Gm-Gg: AYBFou05bq8dFk3o9uU5AWjV/dnGnQt66uuHkXCKifUBNqOVS4XpLsMGL6qmAkfxcUY
	WDR3lXttDTIf5viqi/6wFcjicAAkDOOXYshDNwAWYlAbZqaWhAT4yULBTvcP2zi1AY+ZaUMfCWw
	FVK8ebgRb8dhLPJBAeu8mWC1iz3MrOffMx7UDaQsv+MiRs9UaKz7L0baPW9FWmWmHgKmJrOJW0d
	4ahX9bNVPVRcrFmv1EqMJ1PHsiNGwPrhvTqc9jHXU5OgNFA0e/3ttDr5vClY5+cZtlQazX3mH8m
	gYojg/RqPFPQLgPB2Z5w0yCXC+3q2cAbgCO2HTLR929BPbRxT9cEdE44/u4Y2YRhNHqIFIsYJ+D
	VZptQ0YrUvuk/wbCHXU9lL4kkS8JnQIN2pRuRKa3sMqYADgBw9fdZdtyooh9+x6Hr81npU4OIGc
	WHiJzqBY/9RpE9KUEhTAD3G4s+VDo51wXXQttq7nDMj4OqnH7UYHgjBv+jorUrjPK/DjbI/ic=
X-Received: by 2002:a05:622a:148f:b0:532:a1d2:1c41 with SMTP id d75a77b69052e-532b739e535mr80489001cf.68.1789940618967;
        Sun, 20 Sep 2026 14:43:38 -0700 (PDT)
Received: from rowland.harvard.edu ([2601:19b:d01:d210::7544])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-532ae5eea5fsm48492301cf.8.2026.09.20.14.43.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Sep 2026 14:43:38 -0700 (PDT)
Date: Sun, 20 Sep 2026 17:43:36 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Minseo Kim <neck3922@gmail.com>,
	USB mailing list <linux-usb@vger.kernel.org>
Subject: [PATCH 3/3] USB: gadgetfs: Wait for work routines before unloading
Message-ID: <2f657ef5-6ea0-4820-9579-324b9b812417@rowland.harvard.edu>
References: <c06cb937-6872-401a-8c94-1944f2838007@rowland.harvard.edu>
 <a9a88aa0-a624-4b42-a9f7-661d50a4894b@rowland.harvard.edu>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a9a88aa0-a624-4b42-a9f7-661d50a4894b@rowland.harvard.edu>

The gadgetfs driver uses work routines to handle asynchronous I/O,
but it doesn't make certain that the work routines have completed
before it allows itself to be unloaded from memory (if it is built as
a module).  Testing shows that under the right conditions this can
actually happen.

Fix this problem by creating a dedicated workqueue for the driver's
work routines.  Automatic flushing when the workqueue is destroyed
will ensure that no work routines are still in operation when the
driver is unloaded.

Tested-by: Minseo Kim <neck3922@gmail.com>
Signed-off-by: Alan Stern <stern@rowland.harvard.edu>

---

 drivers/usb/gadget/legacy/inode.c |   23 ++++++++++++++++-------
 1 file changed, 16 insertions(+), 7 deletions(-)

Index: usb-devel/drivers/usb/gadget/legacy/inode.c
===================================================================
--- usb-devel.orig/drivers/usb/gadget/legacy/inode.c
+++ usb-devel/drivers/usb/gadget/legacy/inode.c
@@ -237,6 +237,7 @@ static const char *CHIP;
 static DEFINE_MUTEX(sb_mutex);		/* Serialize superblock operations */
 
 static DEFINE_SPINLOCK(aio_lock);	/* Protect aio cancellation info */
+static struct workqueue_struct *gadgetfs_wq;
 
 /*----------------------------------------------------------------------*/
 
@@ -514,9 +515,7 @@ static int ep_aio_cancel(struct kiocb *i
 		spin_unlock_irqrestore(&aio_lock, flags);
 		return 0;	/* ep_aio() will call us again if needed */
 	}
-
 	priv->cancel_state = AIO_UNLINKING;
-	spin_unlock_irqrestore(&aio_lock, flags);
 
 	/*
 	 * We are called with the aio core holding iocb's context lock.
@@ -527,7 +526,9 @@ static int ep_aio_cancel(struct kiocb *i
 	 * For this reason, do the dequeue operation in a work routine.
 	 */
 	INIT_WORK(&priv->unlink_work, ep_unlink_worker);
-	schedule_work(&priv->unlink_work);
+	queue_work(gadgetfs_wq, &priv->unlink_work);
+
+	spin_unlock_irqrestore(&aio_lock, flags);
 	return 0;
 }
 
@@ -604,7 +605,7 @@ static void ep_aio_complete(struct usb_e
 
 	if (new_req_state == AIO_COMPLETED) {
 		INIT_WORK(&priv->copy_work, ep_user_copy_worker);
-		schedule_work(&priv->copy_work);
+		queue_work(gadgetfs_wq, &priv->copy_work);
 	}
 	if (cancel_state != AIO_UNLINKING) {
 		usb_ep_free_request(ep, req);
@@ -2255,10 +2256,17 @@ static int __init gadgetfs_init (void)
 {
 	int status;
 
+	gadgetfs_wq = alloc_workqueue("gadgetfs", WQ_PERCPU, 0);
+	if (!gadgetfs_wq)
+		return -ENOMEM;
+
 	status = register_filesystem (&gadgetfs_type);
-	if (status == 0)
-		pr_info ("%s: %s, version " DRIVER_VERSION "\n",
-			shortname, driver_desc);
+	if (status) {
+		destroy_workqueue(gadgetfs_wq);
+		return status;
+	}
+
+	pr_info("%s: %s, version " DRIVER_VERSION "\n", shortname, driver_desc);
 	return status;
 }
 module_init (gadgetfs_init);
@@ -2267,6 +2275,7 @@ static void __exit gadgetfs_cleanup (voi
 {
 	pr_debug ("unregister %s\n", shortname);
 	unregister_filesystem (&gadgetfs_type);
+	destroy_workqueue(gadgetfs_wq);
 }
 module_exit (gadgetfs_cleanup);
 

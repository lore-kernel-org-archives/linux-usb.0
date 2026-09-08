Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41F9B5A0AD3
	for <linux-usb@vger.kernel.org>; Tue,  8 Sep 2026 19:03:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788894182; cv=none; b=Ezgbw5MKa1pnYZLWv6qLR7Q7CSukJg2Pnt3n1io5aZS9c28AqhTqADZHPW8SggOL50H9exvAXx1aUDszOMnYvvMNMwy580foi6WPryPq5x1xfw4ZL1j7Oo/6uS06xnMuXwBe9+XEfh7gfLLHrG7CBKLeHi+5+rNt1wttXQOA7cg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788894182; c=relaxed/simple;
	bh=7CYI7s8hz0RPHNQiOup/cEeACi5/dBYXDXLuT0fhesc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XihAjJdsjl2q0AEU4Bg6bW0nthHMYgxCux9LXq39oILn4Yul/tbvhi2W/DHki3Q5hSPcuB+VPyZumI8L8PMuJOicKgzYzVjCZpsg4Bu+VPbGcHTB8o4k6IEEoGRKJjP1Gpq8hRPlKRP+kkjNPtPdfUGtoEGGMvB1UJLgjsBk+Hc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=fESqjYuh; arc=none smtp.client-ip=209.85.219.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="fESqjYuh"
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-90e7c71f86eso35076966d6.1
        for <linux-usb@vger.kernel.org>; Tue, 08 Sep 2026 12:03:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1788894180; x=1789498980; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=jkL3iNqgwv25Yv+asymlRqH+60YvalE07E0U7RBkhqk=;
        b=fESqjYuhl/HK8zOIGQMqVbOoGnphmwAWGPJn7PYazSuLGbyKOhoKKuBlcFYWfgHOj3
         b95fR5JWzAHd0E2zPbI8r4KtTA2fHmZPiJgVly4qpZzv2i+qPouFoC3ncCyjrg1riFkT
         Cfzk5JLiX+fn6QgzId3ze2rtRevfDG6ZXSWJSo29lXkk1SxO6HefPnhnOmtlCgUw5y6e
         K/CZcw2vDgtiAvBthEC7dBEFspPhF9aREiuTcSVbctENcoacQgbsMsbEhBNeYx5HKfB9
         +iHy5NVnq7wmKtk8sD/mmNdrKcsqaO6tLBSREOdBlvKPs3fZ/TCo6Gb0fN7AGpecqIyk
         ZUcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788894180; x=1789498980;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jkL3iNqgwv25Yv+asymlRqH+60YvalE07E0U7RBkhqk=;
        b=iEQOARUPtszY1vjyV3O3JW3jxBw8OFqMqSMzP3OYuZ8Z0gwdCccLx46dmabUQLG8ay
         ruVwhIK/+AQwg0BhOHoafyywLzZYX+9/ErRD1deVVrgBL5UldvRt4gsZhVwsGxLbPBJ+
         hjJlF+W42/Eg4Hx3ys1Ak8BfLYj8WlxcpHOuwRicry2SI9fJcZtiDO6/ekZsJCuKUXD5
         4C+1u4IjwaFwVPY+qq1lRgaRoNqZq2DGJYuCfHiSugNSuvqUnhUHgrwUYSphBNmGN8n1
         7X2IMP8L71OU/R0gQa6pmKccijwulV9LqnO5v6yS1MZhseVRABs193gKelUwOxlHmevu
         TIRQ==
X-Forwarded-Encrypted: i=1; AKwUvBxcDra+GsGH3eid7udwEhNtNqEnT6dtL9ZVUtZSLKTNXY4pRAXE7Qxf9SP8KYzZ/L6cV/Lt/x3HYCg=@vger.kernel.org
X-Gm-Message-State: AFuF++lQ8RjImagGnbmmsFPa0PDnpNekWor6PJtLY8oNb9xBpaz46Gco
	ciW63ZeY50xpwQEk5+nAq/k4lD+cKdDwcIbUro/xKoo3VpWZ2WTltMrVM6LJ7BiQ3w==
X-Gm-Gg: AYBFou33HDuyYnNaoQHq7Fq4UJlozvcS7QEVi21P95nKXMw4xWxvaBQjbyygb95Hszv
	3LUVs5rAdYArY8gBSi908jR25xQW9YrbyWiZffM2x/eCx5IUe9mOuoamU7O1VsKGYMvu55BruC5
	3KEWlD1KseV1FngGz9S10RzeYXEu0KUMZz9m5kmumyJx4RRFB0HFZjl2AOJ5Lg140oIerVPvL/q
	4Ua76ujp3isOoModi4OmN9/roXSAyJXGokJXVMAq02JV5Cl2HtiUbzHhW6p+M2iDEykajaCl+3R
	tgD4Bn213jLMUXE2f3Gx2F5ypcOg4FwuqOEQoM1jAyxzvugdSZidDs+deDidWKgZkRBWbJ0+d3V
	4hPAld5ZedUv0KinQzhHLLf2J8dv3WJTU1D+LSMgeew9DXDVLRoIrSVpQms7zWuNmP1u7b58kj+
	+jGqRneIMARZda62jDQyxbjtcB7M+G9G6Vb1vV/cRCyoyQFd1ATF83O2FxtKcz1u1Ur68XTUp2
X-Received: by 2002:a05:620a:9633:b0:939:6b87:9a62 with SMTP id af79cd13be357-9398053658amr2618387685a.38.1788894177088;
        Tue, 08 Sep 2026 12:02:57 -0700 (PDT)
Received: from rowland.harvard.edu ([2601:19b:d01:d210::7544])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9399429b97esm919777585a.29.2026.09.08.12.02.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 12:02:56 -0700 (PDT)
Date: Tue, 8 Sep 2026 15:02:53 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Minseo Kim <neck3922@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Andrey Konovalov <andreyknvl@gmail.com>, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org, syzkaller@googlegroups.com
Subject: Re: [BUG] usb: gadgetfs: KASAN null-ptr-deref and intermittent UAF
 in ep_aio_cancel()
Message-ID: <cec9b2a0-3454-45a6-b128-51d708cc8cbc@rowland.harvard.edu>
References: <908a5b29-e6d8-4595-b451-6c328e25c60e@rowland.harvard.edu>
 <CAFmvuTU5HnBKbve=v_C7Mhw2586rR_8qsRNua2XPokgKy_o31w@mail.gmail.com>
 <0305182d-5914-4022-a0a6-1ab4221b0a6c@rowland.harvard.edu>
 <CAFmvuTULxq6O0t7FyhEwnGVdMMpbj1yZrPN6mVRDWTgF0ODJxg@mail.gmail.com>
 <1b92cd86-fe64-43eb-9539-53a559cd14e3@rowland.harvard.edu>
 <CAFmvuTWw90k+Fvs5Ve=1nxCDSQrzH7rytY-3vjGwv=edQOCBPw@mail.gmail.com>
 <fb56064c-6481-44b3-88e5-8e5ff7b85703@rowland.harvard.edu>
 <CAFmvuTXWxQJUZfAAC=vs5QM=myDLE-o0jZZ8OXdqiGioPkRwfA@mail.gmail.com>
 <f928b74b-ce57-4454-bdd4-511b823bf742@rowland.harvard.edu>
 <CAFmvuTXwUiap39-FHv6aqGbJVzORRx8tV1QfN0BDjJaPsbfKHg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFmvuTXwUiap39-FHv6aqGbJVzORRx8tV1QfN0BDjJaPsbfKHg@mail.gmail.com>

On Mon, Sep 07, 2026 at 10:00:00PM +0900, Minseo Kim wrote:
> Hi Alan,
> 
> > Is it okay to add your Tested-by: tag?
> 
> Yes, please add:
> 
> Tested-by: Minseo Kim <neck3922@gmail.com>

Will do.

> Thank you for the time and care you have put into this fix. I have learned
> a great deal while working through this issue with you.

You're welcome.

In your earlier testing, didn't you find that with the unpatched driver, 
the driver module's usage count remained elevated as long as the 
ep_user_copy_worker() was pending on the workqueue?  And therefore it 
was impossible to unload the module while a work item was still queued 
or running?

This patch introduces the possibility of that happening.  Therefore I 
would like to have a second patch, which flushes the workqueue and 
prevents the kernel from trying to run code in an unloaded module, ready 
to submit along with the first one.

My version of this second patch (meant to apply on top of the first 
patch) is below.  It is closely based on the version you wrote, the main 
difference being that it uses a single workqueue for both work routines.  
Could you test it and verify that it prevents the problem you observed 
with only the first patch installed?

Thank,

Alan Stern



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
 
@@ -597,7 +598,7 @@ static void ep_aio_complete(struct usb_e
 
 	if (new_req_state == AIO_COMPLETED) {
 		INIT_WORK(&priv->copy_work, ep_user_copy_worker);
-		schedule_work(&priv->copy_work);
+		queue_work(gadgetfs_wq, &priv->copy_work);
 	}
 	if (cancel_state != AIO_UNLINKING) {
 		usb_ep_free_request(ep, req);
@@ -1773,6 +1774,8 @@ gadgetfs_unbind (struct usb_gadget *gadg
 	spin_unlock_irq (&dev->lock);
 
 	destroy_ep_files (dev);
+	flush_workqueue(gadgetfs_wq);
+
 	gadget->ep0->driver_data = NULL;
 	set_gadget_data (gadget, NULL);
 
@@ -2245,10 +2248,17 @@ static int __init gadgetfs_init (void)
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
@@ -2257,6 +2267,7 @@ static void __exit gadgetfs_cleanup (voi
 {
 	pr_debug ("unregister %s\n", shortname);
 	unregister_filesystem (&gadgetfs_type);
+	destroy_workqueue(gadgetfs_wq);
 }
 module_exit (gadgetfs_cleanup);
 


Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C67D3FD155
	for <linux-usb@vger.kernel.org>; Thu, 16 Jul 2026 10:42:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784198554; cv=none; b=R2+Te67DGdJ38vA2SkUhUVbW1Qpls7ZHxor+TbKjSMBlS/cb5v0q4IB9W47ymWZ9NdiCbFVN4UGLY/AfHvYiMVMhgd72vK1lp42ND/uPGuFSdaDVEiMUUF0MVf6O5EOGtkG3g/GWfAPzASrPusiRXARe3kUWLKCEwPHKyTR8LyA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784198554; c=relaxed/simple;
	bh=Gk998eYN7gUwcRYe8PxnBJe6Xr7AbEqyGz3sBixO3B4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BbohL1m+Tl9ovdUhVnwZlnc1AhR72zQtNpS8CKdvy1932+YISDIIjWwGdvMSRqiZkvGGroE2jfW7g9LE41ku5hPsP+tpR3ZVYjrmrypNFfaVECrDhwAmXUvF57lOADfug5ppyOBhS7FW6lK3dl3AbAeELEIDViRGzbE4UgUtmQU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XnsQklVu; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XnsQklVu"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-383cb94f742so6099038a91.3
        for <linux-usb@vger.kernel.org>; Thu, 16 Jul 2026 03:42:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784198552; x=1784803352; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wTeYglMh2Ky0UImAmNlYDWZ+C9HdKGNWJyEuofDOr2k=;
        b=XnsQklVuQ++rpvMOCbBs31KZAAIj7Umua3AVh/yHgrLbD15zp7oFE9aV9sved6ntRR
         QJgNKMc5SrPO7RTNXMDzZKvGpj4d3MQV/CNLvRaXkrSHoG94t2NUu8reMGm0OQ6Tx1uA
         tuVolCxmI01eIksFv/iHY9lSguwXmk1LK4HtC7fKCabRJV69rizQ5eWZprACrHyMQs1R
         Q2P0lJQoR8F9UOAWgDUn6gnze8B/rFqktINhhDjexh0oOH6BVjaIs01eYNwnHYlaZPf3
         QBXNhUKNPPTPjg27LBV9UdcsPYXj7I225uACp0HSMFMoa0t3UF5cd6okznHhMdFAaYkf
         AH9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784198552; x=1784803352;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=wTeYglMh2Ky0UImAmNlYDWZ+C9HdKGNWJyEuofDOr2k=;
        b=RBC1oo3yLDiouFMIoGeQpjqZiyqIaKMkDeT09CfTdzFbqzJPyw1Q6LDPgAbJovXQol
         UYTeY0pLlRze9fnKJW2qKaljAeLvqnv0MSrkQTwCYl3brWdEGMCsO7Au1fqqO5AEWcOx
         xz/eI1p36ZkSLGvHgRRyUQu9pce3w7XgUtip8Wxtc9nSfkigUQo3jm1QkT32BKvQ1Hi7
         eTm5wxAleMqRABj9eaRuHlbpJbvlEQYmtldOUfdCcfy4HKBHuhKUsvt665CvwxozV+wD
         HxfexWHi8R8I6G76if8G4K4z0fHXfNNjEgKuv2ZGJOxFS9nL9+mrQ3JjClknqQM8LOS7
         gyzw==
X-Gm-Message-State: AOJu0YyvvPo+s0C7X45HTcNpadZj+qAZdUKjCfFkh2m3gRIdDMk9plrV
	zidmi8kRxmtBgJfizLZqZtY95THxaQ3ZmfpyprpPU2ewbRQTrzNaYZew
X-Gm-Gg: AfdE7cnKMUA9OcQ8bKuReFiPRc++IH29iXsxNH9Az2+04kfxzuSVYLkDsOKgJOmmE2N
	Vf7hYvftcJSbTneYZpU/cRBdTJvh5SdHQv/m6UiSxKoadalJvjHCNwKFwTzwADX3RN6jSzZJGDd
	PbYMC1w3d0ij2OT4olrMGveKPAKul8Fo7IjAqMv4UmfPI3z/1iAuPkVvKUqnLIy5TepbT6IWsBW
	mxIAhXpSLBbYiS4b+FxIBACS6Qi4DWPDobEImEMVcfjqzawL6MWxcqAXIqpI1KaqciPhHzTJMc2
	Jc8eWXllx7xpHuik41XPR1O6feM4paJZm82NRP3JNO7WYMRvPuHGJBy0zmsFpxAyLpPT7FlezPf
	AUzgl7kOHNIwTaOm1GGdUN176JQWp+3IbNdWI7nyS0nbreUHsOniQWZLHeFt+f/37uklTMV66nm
	11Yg==
X-Received: by 2002:a17:90b:2650:b0:37f:ef32:d444 with SMTP id 98e67ed59e1d1-38e29ff9805mr5615043a91.1.1784198551431;
        Thu, 16 Jul 2026 03:42:31 -0700 (PDT)
Received: from localhost ([144.24.58.22])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3140e6a4779sm13552089eec.17.2026.07.16.03.42.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2026 03:42:31 -0700 (PDT)
From: Jinchao Wang <wangjinchao600@gmail.com>
To: gregkh@linuxfoundation.org,
	stern@rowland.harvard.edu
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	eeodqql09@gmail.com,
	surban@surban.net,
	bigeasy@linutronix.de,
	kees@kernel.org,
	Jinchao Wang <wangjinchao600@gmail.com>,
	syzbot+faf3a6cf579fc65591ca@syzkaller.appspotmail.com,
	stable@vger.kernel.org
Subject: [PATCH v2] usb: gadget: dummy_hcd: prevent fifo_req reuse during giveback
Date: Thu, 16 Jul 2026 06:42:17 -0400
Message-ID: <5db8bba5b3499a86cd2e776f9918126b68b2508b.1784198306.git.wangjinchao600@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260714064829.172098-1-wangjinchao600@gmail.com>
References: <20260714064829.172098-1-wangjinchao600@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

dummy_hcd embeds a single shared usb_request (dum->fifo_req) that the
"emulated single-request FIFO" fast-path in dummy_queue() reuses for
small IN transfers: it copies the caller's request into it
(req->req = *_req) and queues it, treating list_empty(&fifo_req.queue)
as "the slot is free".

The completion side (dummy_timer/transfer/nuke/dummy_dequeue) follows
the standard pattern: list_del_init(&req->queue) unlinks the request,
then the lock is dropped and usb_gadget_giveback_request() invokes
req->complete().  But list_del_init() makes fifo_req.queue look empty
*before* the completion callback returns, so a concurrent dummy_queue()
on another CPU sees the slot as free, reuses fifo_req and runs
req->req = *_req -- overwriting req->complete while dummy_timer is
mid-calling it.  The indirect call then jumps to a clobbered pointer,
causing a general protection fault / page fault in dummy_timer
(syzkaller extid faf3a6cf579fc65591ca).  The clobbering write is an
in-bounds memcpy on a live shared object, so KASAN cannot flag it.

Add a fifo_req_busy bit covering the shared request's whole lifetime:
set it in dummy_queue() when the FIFO fast-path takes fifo_req (making
it the fast-path guard, replacing the list_empty(&fifo_req.queue)
test), and clear it after the completion callback has returned, via a
dummy_giveback() helper used at all four gadget-request giveback
sites.  The shared slot can no longer be reused until its completion
callback has finished.

Reported-by: syzbot+faf3a6cf579fc65591ca@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=faf3a6cf579fc65591ca
Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Cc: stable@vger.kernel.org
Signed-off-by: Jinchao Wang <wangjinchao600@gmail.com>
---
Changes in v2 (per Alan Stern's review of v1 [1]):

- Move dummy_giveback() above the "/* called with spinlock held */"
  comment so the comment is again immediately before nuke().
- Set fifo_req_busy in dummy_queue() when the FIFO fast-path takes the
  shared request (covering its whole in-use lifetime) instead of in
  dummy_giveback(), and drop the now-redundant
  list_empty(&fifo_req.queue) test from the fast-path guard.

[1] https://lore.kernel.org/all/20260714064829.172098-1-wangjinchao600@gmail.com/

 drivers/usb/gadget/udc/dummy_hcd.c | 40 ++++++++++++++++++++----------
 1 file changed, 27 insertions(+), 13 deletions(-)

diff --git a/drivers/usb/gadget/udc/dummy_hcd.c b/drivers/usb/gadget/udc/dummy_hcd.c
index f47903461ed5..c0e40fa6dde5 100644
--- a/drivers/usb/gadget/udc/dummy_hcd.c
+++ b/drivers/usb/gadget/udc/dummy_hcd.c
@@ -278,6 +278,7 @@ struct dummy {
 	unsigned			ints_enabled:1;
 	unsigned			udc_suspended:1;
 	unsigned			pullup:1;
+	unsigned			fifo_req_busy:1;
 
 	/*
 	 * HOST side support
@@ -329,6 +330,26 @@ static inline struct dummy *gadget_dev_to_dummy(struct device *dev)
 
 /* DEVICE/GADGET SIDE UTILITY ROUTINES */
 
+/*
+ * Give back a gadget request with dum->lock dropped around the callback.
+ * If @req is the shared fifo_req, clear fifo_req_busy afterward: the flag
+ * was set in dummy_queue() when the shared request was taken and must stay
+ * set until its completion callback has returned; list_del_init() alone
+ * makes the request look idle while the callback is still running.
+ * Caller holds dum->lock and has already done list_del_init() + status.
+ */
+static void dummy_giveback(struct dummy *dum, struct usb_ep *_ep,
+			   struct dummy_request *req)
+{
+	bool fifo = req == &dum->fifo_req;
+
+	spin_unlock(&dum->lock);
+	usb_gadget_giveback_request(_ep, &req->req);
+	spin_lock(&dum->lock);
+	if (fifo)
+		dum->fifo_req_busy = 0;
+}
+
 /* called with spinlock held */
 static void nuke(struct dummy *dum, struct dummy_ep *ep)
 {
@@ -339,9 +360,7 @@ static void nuke(struct dummy *dum, struct dummy_ep *ep)
 		list_del_init(&req->queue);
 		req->req.status = -ESHUTDOWN;
 
-		spin_unlock(&dum->lock);
-		usb_gadget_giveback_request(&ep->ep, &req->req);
-		spin_lock(&dum->lock);
+		dummy_giveback(dum, &ep->ep, req);
 	}
 }
 
@@ -728,10 +747,11 @@ static int dummy_queue(struct usb_ep *_ep, struct usb_request *_req,
 
 	/* implement an emulated single-request FIFO */
 	if (ep->desc && (ep->desc->bEndpointAddress & USB_DIR_IN) &&
-			list_empty(&dum->fifo_req.queue) &&
+			!dum->fifo_req_busy &&
 			list_empty(&ep->queue) &&
 			_req->length <= FIFO_SIZE) {
 		req = &dum->fifo_req;
+		dum->fifo_req_busy = 1;
 		req->req = *_req;
 		req->req.buf = dum->fifo_buf;
 		memcpy(dum->fifo_buf, _req->buf, _req->length);
@@ -785,9 +805,7 @@ static int dummy_dequeue(struct usb_ep *_ep, struct usb_request *_req)
 		dev_dbg(udc_dev(dum),
 				"dequeued req %p from %s, len %d buf %p\n",
 				req, _ep->name, _req->length, _req->buf);
-		spin_unlock(&dum->lock);
-		usb_gadget_giveback_request(_ep, _req);
-		spin_lock(&dum->lock);
+		dummy_giveback(dum, _ep, req);
 	}
 	spin_unlock_irqrestore(&dum->lock, flags);
 	return retval;
@@ -1523,9 +1541,7 @@ static int transfer(struct dummy_hcd *dum_hcd, struct urb *urb,
 		if (req->req.status != -EINPROGRESS) {
 			list_del_init(&req->queue);
 
-			spin_unlock(&dum->lock);
-			usb_gadget_giveback_request(&ep->ep, &req->req);
-			spin_lock(&dum->lock);
+			dummy_giveback(dum, &ep->ep, req);
 
 			/* requests might have been unlinked... */
 			rescan = 1;
@@ -1910,9 +1926,7 @@ static enum hrtimer_restart dummy_timer(struct hrtimer *t)
 				dev_dbg(udc_dev(dum), "stale req = %p\n",
 						req);
 
-				spin_unlock(&dum->lock);
-				usb_gadget_giveback_request(&ep->ep, &req->req);
-				spin_lock(&dum->lock);
+				dummy_giveback(dum, &ep->ep, req);
 				ep->already_seen = 0;
 				goto restart;
 			}
-- 
2.53.0


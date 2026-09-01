Received: from bm.lauterbach.com (bm.lauterbach.com [62.154.241.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36FE448CD63
	for <linux-usb@vger.kernel.org>; Tue,  1 Sep 2026 12:17:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=62.154.241.218
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788265028; cv=none; b=M5suOVq2GxhuyY0TOt5w23G98oaXPA24dh9CmH31iyzr3bcLjZC5dbJkevXffzF+q2gpsjlcNwpFppVwSCNwAKM088qpHBYnHBZXRRGAyP8QbAxA9PUz6T78hkv2HcgSqpXHCI2HGpq1TPD1xyr+wH4EBhQB3FrTeWw7QBwibz0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788265028; c=relaxed/simple;
	bh=3DDWzuouVeitphT3U119ykjAGESGGo9R6T5TrJs5+J0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jXW+jxNfANjWm1leS9kDcodQQMSCjAfViYsYSU3MGYCSUf/ygIqmhgx9Wv8ldbqmssda7e/z9U0DqUNwCCzeF+J2T88d3y3uYQFC7QZ7AGtAUqBtymhJyQ2aNnPNEwJRSMc7EOSSV+CwFDXU9bnVK4dhvI0APU35RdRkn73lgP8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lauterbach.com; spf=pass smtp.mailfrom=lauterbach.com; arc=none smtp.client-ip=62.154.241.218
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lauterbach.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lauterbach.com
Received: from ingpc2.intern.lauterbach.com (unknown [10.2.10.44])
	(Authenticated sender: ingo.rohloff@lauterbach.com)
	by bm.lauterbach.com (Postfix) with ESMTPSA id 4E1E419FACFF7;
	Tue, 01 Sep 2026 14:09:25 +0200 (CEST)
From: Ingo Rohloff <ingo.rohloff@lauterbach.com>
To: gregkh@linuxfoundation.org
Cc: viro@zeniv.linux.org.uk,
	nkapron@google.com,
	me@samcday.com,
	michael.bommarito@gmail.com,
	linux-usb@vger.kernel.org,
	Ingo Rohloff <ingo.rohloff@lauterbach.com>
Subject: [PATCH 2/3] usb: gadget: f_fs: register cancellation handler only after request queueing
Date: Tue,  1 Sep 2026 14:09:07 +0200
Message-ID: <20260901120908.14386-3-ingo.rohloff@lauterbach.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260901120908.14386-1-ingo.rohloff@lauterbach.com>
References: <20260901120908.14386-1-ingo.rohloff@lauterbach.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Bm-Milter-Handled: 166a2dfb-2e12-4590-8fa5-72e30323519f
X-Bm-Transport-Timestamp: 1788264565374

Call kiocb_set_cancel_fn() only after usb_ep_queue() completes
successfully.

This also undoes commit e78dcb1f7ec2 ("usb: gadget: f_fs: Fix
Use-After-Free in AIO error path"): The described error is avoided by
making sure the cancellation handler is only registered, if there is
something to cancel.

Registering the cancellation handler adds the kiocb to the context's
active request list (active_reqs in aio.c).  If usb_ep_queue() fails, the
request was never actually submitted to the hardware, which means the
request is not active.  The aio framework already deals with calling the
completion function ki_complete() automatically if you do not return
-EIOCBQUEUED.

Signed-off-by: Ingo Rohloff <ingo.rohloff@lauterbach.com>
---
 drivers/usb/gadget/function/f_fs.c | 50 ++++++++++++------------------
 1 file changed, 20 insertions(+), 30 deletions(-)

diff --git a/drivers/usb/gadget/function/f_fs.c b/drivers/usb/gadget/function/f_fs.c
index 76fba3085664..9dec09d06ca9 100644
--- a/drivers/usb/gadget/function/f_fs.c
+++ b/drivers/usb/gadget/function/f_fs.c
@@ -1014,8 +1014,21 @@ static struct ffs_ep *ffs_epfile_wait_ep(struct ffs_epfile *epfile, struct file
 	return ep;
 }
 
-static ssize_t ffs_epfile_io(struct file *file, struct ffs_io_data *io_data)
+static int ffs_aio_cancel(struct kiocb *kiocb)
 {
+	struct ffs_io_data *io_data = kiocb->private;
+	int value;
+
+	if (!io_data || !io_data->ep || !io_data->req)
+		return -EINVAL;
+
+	value = usb_ep_dequeue(io_data->ep, io_data->req);
+	return value;
+}
+
+static ssize_t ffs_epfile_io(struct kiocb *kiocb, struct ffs_io_data *io_data)
+{
+	struct file *file = kiocb->ki_filp;
 	struct ffs_epfile *epfile = file->private_data;
 	struct usb_request *req;
 	struct ffs_ep *ep;
@@ -1227,6 +1240,8 @@ static ssize_t ffs_epfile_io(struct file *file, struct ffs_io_data *io_data)
 	 * by ffs_user_copy_worker.
 	 */
 	data = NULL;
+	kiocb->private = io_data;
+	kiocb_set_cancel_fn(kiocb, ffs_aio_cancel);
 
 error_lock:
 	spin_unlock_irq(&epfile->ffs->eps_lock);
@@ -1266,19 +1281,6 @@ ffs_epfile_open(struct inode *inode, struct file *file)
 	return stream_open(inode, file);
 }
 
-static int ffs_aio_cancel(struct kiocb *kiocb)
-{
-	struct ffs_io_data *io_data = kiocb->private;
-	int value;
-
-	if (io_data && io_data->ep && io_data->req)
-		value = usb_ep_dequeue(io_data->ep, io_data->req);
-	else
-		value = -EINVAL;
-
-	return value;
-}
-
 static ssize_t ffs_epfile_write_iter(struct kiocb *kiocb, struct iov_iter *from)
 {
 	struct ffs_io_data io_data, *p = &io_data;
@@ -1299,21 +1301,15 @@ static ssize_t ffs_epfile_write_iter(struct kiocb *kiocb, struct iov_iter *from)
 	p->data = *from;
 	p->mm = current->mm;
 
-	kiocb->private = p;
-
-	if (p->aio) {
+	if (p->aio)
 		mmgrab(p->mm);
-		kiocb_set_cancel_fn(kiocb, ffs_aio_cancel);
-	}
 
-	res = ffs_epfile_io(kiocb->ki_filp, p);
+	res = ffs_epfile_io(kiocb, p);
 	if (res == -EIOCBQUEUED)
 		return res;
 	if (p->aio) {
-		kiocb->ki_complete(kiocb, res);
 		mmdrop(p->mm);
 		kfree(p);
-		return -EIOCBQUEUED;
 	} else {
 		*from = p->data;
 	}
@@ -1349,23 +1345,17 @@ static ssize_t ffs_epfile_read_iter(struct kiocb *kiocb, struct iov_iter *to)
 	}
 	p->mm = current->mm;
 
-	kiocb->private = p;
-
-	if (p->aio) {
+	if (p->aio)
 		mmgrab(p->mm);
-		kiocb_set_cancel_fn(kiocb, ffs_aio_cancel);
-	}
 
-	res = ffs_epfile_io(kiocb->ki_filp, p);
+	res = ffs_epfile_io(kiocb, p);
 	if (res == -EIOCBQUEUED)
 		return res;
 
 	if (p->aio) {
-		kiocb->ki_complete(kiocb, res);
 		mmdrop(p->mm);
 		kfree(p->to_free);
 		kfree(p);
-		return -EIOCBQUEUED;
 	} else {
 		*to = p->data;
 	}
-- 
2.55.0


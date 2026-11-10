Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=62.154.241.218
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794330759;
	b=CNJjaS38R2i/JhVvPsw9Uo9SkDTiW/ljs6lbLS55EISDyM8DsvJX692dBXVAHMZUURf3
	 zKaxQRGF8tP0W+lP2JsbqF+UA1LfyZN9DfSNc7I48iCbvmDrDdy2z5EUuJxs5ylCofs5O
	 F1EsKfwLSehHMaT0LUg9QqOj65Fw5RkNXqwIrREVwwTeDf2Ta2FxRSN6xSkZxKb6UbLCJ
	 8XiIO1KgSGbWV6jDfagkVvdY0RtW6Gq6KrW50zQyWYp++U+hZRxEjdNd58BEuet4coUEH
	 +m8b2cIyyLoREcVQ4nXqIqyJpBzZxy95Im5MMGNI7fxrbewzAnvWWxBMlZ1NjoWwtnQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794330759;
	h=DMARC-Filter:Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:
	 X-Bm-Milter-Handled:X-Bm-Transport-Timestamp;
	bh=HGO0kY7L1vwvuSzBcqp9pytkKWMETO8Xh2wGYXXgAQY=;
	b=TVpZyYyrRo7X6wVYm+7PCFPjG1APTulHxxX5LjhX9m+uqUvWpqv74anqrCHihlR04Xp3
	 YEQSINyQOQDwzsuGZuY45u2shrtfkWut9+qyK08buIRFWxEWuXdbj5VGQ6+DDI7gjqFPc
	 uKoEATKs2lU4ftXE39uw3jD0aBs+cBxWQOawSQawasT4OHB6Y4HjdjOq1MnZYazXOh76A
	 FiIF6sSGxm6KaaTf8Hh9EV4p4003DDje7XddoGH6U/LyrK1Q+Az2AxxODEGAvgw7FD5cE
	 CKcoWgzJyxe9SDULR0aZm0ggqIicdpwAHAFWymyiCK9DVmJnppKEqO4aejXTkADWkvA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=lauterbach.com;
	spf=pass smtp.mailfrom=lauterbach.com;
	arc=none smtp.remote-ip=62.154.241.218
Received: from bm.lauterbach.com (bm.lauterbach.com [62.154.241.218])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AE8F606A320
	for <linux-usb@vger.kernel.org>; Tue, 10 Nov 2026 17:12:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6AE8F606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lauterbach.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lauterbach.com
Received: from ingpc2.intern.lauterbach.com (unknown [10.2.10.44])
	(Authenticated sender: ingo.rohloff@lauterbach.com)
	by bm.lauterbach.com (Postfix) with ESMTPSA id AE93945D72E8;
	Tue, 10 Nov 2026 18:12:36 +0100 (CET)
From: Ingo Rohloff <ingo.rohloff@lauterbach.com>
To: gregkh@linuxfoundation.org
Cc: viro@zeniv.linux.org.uk,
	nkapron@google.com,
	me@samcday.com,
	michael.bommarito@gmail.com,
	linux-usb@vger.kernel.org,
	Ingo Rohloff <ingo.rohloff@lauterbach.com>
Subject: [PATCH v2 2/2] usb: gadget: f_fs: register cancellation handler only after request queueing
Date: Tue, 10 Nov 2026 18:12:22 +0100
Message-ID: <20261110171222.22633-3-ingo.rohloff@lauterbach.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261110171222.22633-1-ingo.rohloff@lauterbach.com>
References: <20261110171222.22633-1-ingo.rohloff@lauterbach.com>
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Bm-Milter-Handled: 166a2dfb-2e12-4590-8fa5-72e30323519f
X-Bm-Transport-Timestamp: 1794330756767

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
 drivers/usb/gadget/function/f_fs.c | 70 +++++++++++++++---------------
 1 file changed, 34 insertions(+), 36 deletions(-)

diff --git a/drivers/usb/gadget/function/f_fs.c b/drivers/usb/gadget/function/f_fs.c
index e347916923df..d40059eebd49 100644
--- a/drivers/usb/gadget/function/f_fs.c
+++ b/drivers/usb/gadget/function/f_fs.c
@@ -264,6 +264,7 @@ struct ffs_io_data {
 
 	int status;
 	struct completion done;
+	spinlock_t aio_completion_lock;
 };
 
 struct ffs_desc_helper {
@@ -887,7 +888,9 @@ static void ffs_user_copy_worker(struct work_struct *work)
 	}
 	mmdrop(io_data->mm);
 
+	spin_lock(&io_data->aio_completion_lock);
 	io_data->kiocb->ki_complete(io_data->kiocb, ret);
+	spin_unlock(&io_data->aio_completion_lock);
 
 	if (io_data->ffs->ffs_eventfd && !kiocb_has_eventfd)
 		eventfd_signal(io_data->ffs->ffs_eventfd);
@@ -1014,8 +1017,22 @@ static struct ffs_ep *ffs_epfile_wait_ep(struct ffs_epfile *epfile, struct file
 	return ep;
 }
 
-static ssize_t ffs_epfile_io(struct file *file, struct ffs_io_data *io_data)
+static int ffs_aio_cancel(struct kiocb *kiocb)
+{
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
+static ssize_t ffs_epfile_io(struct ffs_io_data *io_data)
 {
+	struct kiocb *kiocb = io_data->kiocb;
+	struct file *file = kiocb->ki_filp;
 	struct ffs_epfile *epfile = file->private_data;
 	struct usb_request *req;
 	struct ffs_ep *ep;
@@ -1210,24 +1227,30 @@ static ssize_t ffs_epfile_io(struct file *file, struct ffs_io_data *io_data)
 	io_data->ep = ep->ep;
 	io_data->req = req;
 	io_data->ffs = epfile->ffs;
+	spin_lock_init(&io_data->aio_completion_lock);
 
 	req->context  = io_data;
 	req->complete = ffs_epfile_async_io_complete;
 
+	/*
+	 * prevent ffs_user_copy_worker from calling
+	 *    io_data->kiocb->ki_complete
+	 * before kiocb_set_cancel_fn was called.
+	 */
+	spin_lock(&io_data->aio_completion_lock);
 	ret = usb_ep_queue(ep->ep, req, GFP_ATOMIC);
 	if (ret) {
 		io_data->req = NULL;
 		usb_ep_free_request(ep->ep, req);
-		goto error_lock;
+		goto aio_completion_lock;
 	}
+	kiocb->private = io_data;
+	kiocb_set_cancel_fn(kiocb, ffs_aio_cancel);
 
 	ret = -EIOCBQUEUED;
-	/*
-	 * Do not kfree the buffer in this function.  It will be freed
-	 * by ffs_user_copy_worker.
-	 */
-	data = NULL;
 
+aio_completion_lock:
+	spin_unlock(&io_data->aio_completion_lock);
 error_lock:
 	spin_unlock_irq(&epfile->ffs->eps_lock);
 error_mutex:
@@ -1266,19 +1289,6 @@ ffs_epfile_open(struct inode *inode, struct file *file)
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
@@ -1299,21 +1309,15 @@ static ssize_t ffs_epfile_write_iter(struct kiocb *kiocb, struct iov_iter *from)
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
+	res = ffs_epfile_io(p);
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
@@ -1349,23 +1353,17 @@ static ssize_t ffs_epfile_read_iter(struct kiocb *kiocb, struct iov_iter *to)
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
+	res = ffs_epfile_io(p);
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


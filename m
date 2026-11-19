Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=62.154.241.218
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795101601;
	b=wCQwIS6KUKa5kTIO5hkoN/1QU/uV/wBYu1uHuARTDRCCrUc8rnopYJe20zagQpIsZ14+
	 rdzfJiJpRyHPFsfX6qtAgDEIdyy+3AFWsihlZMd26TWwxFMLNC8UuEYKlFVONPCXJLhea
	 +bPq5uCVNWLe/kZLyhxnh/JgdX1PB4dcsI2gL5bmRW/IMkqXILjO8HeHTzVitShqyWukI
	 AV0Ltr4oJ4Xd+dWNNqitDTHWWUVX4EOWfrKKhvuHveBz9O092uvrDlfTwqwMWQZH0x9gR
	 by0+a4KRlxbk9VQ3O+/82iw8AKbjiGK4K6JB5KanZmiDHvxtrLzCrJBWLH5sIO9BYlQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795101601;
	h=DMARC-Filter:Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:
	 X-Bm-Milter-Handled:X-Bm-Transport-Timestamp;
	bh=RlF3zqOp/63yEDFYgj6trRAGkDEyw2Oqk0PoZU8NNRY=;
	b=DiIZjk1BXZkXDlOyVJcf0FyeBn1DKjZfm0vL3Sz0uhyG+fItNRwtl1NBhJx42xqPAZ3Y
	 banGTACJej7wrOeZY88hBKzwA8PY4YNmb+tEDfzOqtHALsMrrNlTefX2vPzNuq6rvhgkA
	 DofgnVhFXfntE6BVkQjIaIaFhTFM3fpeWUfyikCb9leu8AqwvlKPOSmM88ZIhqJZpQyx3
	 kFlQ1EAMJgQaVgLirBBWwzwsk5lCCmwiU/I4Uqev9w+tpf4IloOl6OTAbQM+QyxcFAHAT
	 vjMauvUnQL/1GsFi2uahom+qYO8cH6DQxh2ucF2etIki1oRX905qig75AJvuokzG00A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=lauterbach.com;
	spf=pass smtp.mailfrom=lauterbach.com;
	arc=none smtp.remote-ip=62.154.241.218
Received: from bm.lauterbach.com (bm.lauterbach.com [62.154.241.218])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49D58606A32A
	for <linux-usb@vger.kernel.org>; Thu, 19 Nov 2026 15:20:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 49D58606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lauterbach.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lauterbach.com
Received: from ingpc2.intern.lauterbach.com (unknown [10.2.10.44])
	(Authenticated sender: ingo.rohloff@lauterbach.com)
	by bm.lauterbach.com (Postfix) with ESMTPSA id 330C84303F9E;
	Thu, 19 Nov 2026 16:19:53 +0100 (CET)
From: Ingo Rohloff <ingo.rohloff@lauterbach.com>
To: gregkh@linuxfoundation.org
Cc: viro@zeniv.linux.org.uk,
	nkapron@google.com,
	me@samcday.com,
	michael.bommarito@gmail.com,
	linux-usb@vger.kernel.org,
	Ingo Rohloff <ingo.rohloff@lauterbach.com>
Subject: [PATCH v3 2/2] usb: gadget: f_fs: simplify error handling using goto
Date: Thu, 19 Nov 2026 16:19:42 +0100
Message-ID: <20261119151942.44304-3-ingo.rohloff@lauterbach.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261119151942.44304-1-ingo.rohloff@lauterbach.com>
References: <20261119151942.44304-1-ingo.rohloff@lauterbach.com>
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
X-Bm-Transport-Timestamp: 1795101593263

Refactor conditional checks to use direct error returns/gotos instead of a
long if/else chain. This makes failure paths more obvious.

At the end of the function AIO request handling is done.

Signed-off-by: Ingo Rohloff <ingo.rohloff@lauterbach.com>
---
 drivers/usb/gadget/function/f_fs.c | 98 ++++++++++++++++--------------
 1 file changed, 54 insertions(+), 44 deletions(-)

diff --git a/drivers/usb/gadget/function/f_fs.c b/drivers/usb/gadget/function/f_fs.c
index cf0287064923..723c1d57f437 100644
--- a/drivers/usb/gadget/function/f_fs.c
+++ b/drivers/usb/gadget/function/f_fs.c
@@ -1019,9 +1019,10 @@ static struct ffs_ep *ffs_epfile_wait_ep(struct ffs_epfile *epfile, struct file
 
 static int ffs_aio_cancel(struct kiocb *kiocb);
 
-static ssize_t ffs_epfile_io(struct file *file, struct ffs_io_data *io_data)
+static ssize_t ffs_epfile_io(struct ffs_io_data *io_data)
 {
 	struct kiocb *kiocb = io_data->kiocb;
+	struct file *file = kiocb->ki_filp;
 	struct ffs_epfile *epfile = file->private_data;
 	struct usb_request *req;
 	struct ffs_ep *ep;
@@ -1110,11 +1111,17 @@ static ssize_t ffs_epfile_io(struct file *file, struct ffs_io_data *io_data)
 	if (epfile->ep != ep) {
 		/* In the meantime, endpoint got disabled or changed. */
 		ret = -ESHUTDOWN;
-	} else if (halt) {
+		goto error_lock;
+	}
+
+	if (halt) {
 		ret = usb_ep_set_halt(ep->ep);
 		if (!ret)
 			ret = -EBADMSG;
-	} else if (data_len == -EINVAL) {
+		goto error_lock;
+	}
+
+	if (data_len == -EINVAL) {
 		/*
 		 * Sanity Check: even though data_len can't be used
 		 * uninitialized at the time I write this comment, some
@@ -1128,7 +1135,10 @@ static ssize_t ffs_epfile_io(struct file *file, struct ffs_io_data *io_data)
 		 */
 		WARN(1, "%s: data_len == -EINVAL\n", __func__);
 		ret = -EINVAL;
-	} else if (!io_data->aio) {
+		goto error_lock;
+	}
+
+	if (!io_data->aio) {
 		bool interrupted = false;
 
 		req = ep->req;
@@ -1182,51 +1192,51 @@ static ssize_t ffs_epfile_io(struct file *file, struct ffs_io_data *io_data)
 		else
 			ret = io_data->status;
 		goto error_mutex;
-	} else if (!(req = usb_ep_alloc_request(ep->ep, GFP_ATOMIC))) {
+	}
+
+	/* It's an AIO request */
+	req = usb_ep_alloc_request(ep->ep, GFP_ATOMIC);
+	if (!req) {
 		ret = -ENOMEM;
-	} else {
-		if (io_data->use_sg) {
-			req->buf = NULL;
-			req->sg	= io_data->sgt.sgl;
-			req->num_sgs = io_data->sgt.nents;
-		} else {
-			req->buf = data;
-			req->num_sgs = 0;
-		}
+		goto error_lock;
+	}
 
-		req->zero = !io_data->read ? epfile->zlp_enabled : 0;
-		req->length = data_len;
+	if (io_data->use_sg) {
+		req->buf = NULL;
+		req->sg	= io_data->sgt.sgl;
+		req->num_sgs = io_data->sgt.nents;
+	} else {
+		req->buf = data;
+		req->num_sgs = 0;
+	}
 
-		io_data->buf = data;
-		io_data->ep = ep->ep;
-		io_data->req = req;
-		io_data->ffs = epfile->ffs;
+	req->zero = !io_data->read ? epfile->zlp_enabled : 0;
+	req->length = data_len;
 
-		req->context  = io_data;
-		req->complete = ffs_epfile_async_io_complete;
+	io_data->buf = data;
+	io_data->ep = ep->ep;
+	io_data->req = req;
+	io_data->ffs = epfile->ffs;
 
-		ret = usb_ep_queue(ep->ep, req, GFP_ATOMIC);
-		if (ret) {
-			io_data->req = NULL;
-			usb_ep_free_request(ep->ep, req);
-			goto error_lock;
-		}
-		kiocb->private = io_data;
-		kiocb_set_cancel_fn(kiocb, ffs_aio_cancel);
-		/*
-		 * prevent ffs_user_copy_worker() from calling
-		 *    io_data->kiocb->ki_complete()
-		 * before kiocb_set_cancel_fn() was called.
-		 */
-		smp_store_release(&io_data->aio_active, true);
+	req->context = io_data;
+	req->complete = ffs_epfile_async_io_complete;
 
-		ret = -EIOCBQUEUED;
-		/*
-		 * Do not kfree the buffer in this function.  It will be freed
-		 * by ffs_user_copy_worker.
-		 */
-		data = NULL;
+	ret = usb_ep_queue(ep->ep, req, GFP_ATOMIC);
+	if (ret) {
+		io_data->req = NULL;
+		usb_ep_free_request(ep->ep, req);
+		goto error_lock;
 	}
+	kiocb->private = io_data;
+	kiocb_set_cancel_fn(kiocb, ffs_aio_cancel);
+	/*
+	 * prevent ffs_user_copy_worker() from calling
+	 *    io_data->kiocb->ki_complete()
+	 * before kiocb_set_cancel_fn() was called.
+	 */
+	smp_store_release(&io_data->aio_active, true);
+
+	ret = -EIOCBQUEUED;
 
 error_lock:
 	spin_unlock_irq(&epfile->ffs->eps_lock);
@@ -1302,7 +1312,7 @@ static ssize_t ffs_epfile_write_iter(struct kiocb *kiocb, struct iov_iter *from)
 	if (p->aio)
 		mmgrab(p->mm);
 
-	res = ffs_epfile_io(kiocb->ki_filp, p);
+	res = ffs_epfile_io(p);
 	if (res == -EIOCBQUEUED)
 		return res;
 	if (p->aio) {
@@ -1346,7 +1356,7 @@ static ssize_t ffs_epfile_read_iter(struct kiocb *kiocb, struct iov_iter *to)
 	if (p->aio)
 		mmgrab(p->mm);
 
-	res = ffs_epfile_io(kiocb->ki_filp, p);
+	res = ffs_epfile_io(p);
 	if (res == -EIOCBQUEUED)
 		return res;
 
-- 
2.55.0


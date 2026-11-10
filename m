Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=62.154.241.218
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794330758;
	b=iwK//plroRdXe5hTp0w9MJMMm6aSBg2WJpZnVhTZ5csiz8Jh/LugDKa/HcCofyMUp3Ou
	 r5zLXa25rB94VO/HT9BEQJMxPECB3NK1/dr6yro0WC5X/GKYOjYWVcgNptIKxeGqS1v5k
	 I5XysNjsBqCxUDI7zaaJ7bVj4reT9WjYhuHpmG50YOoGt+Q9btayn3ovk1snWQqTS/5uS
	 6A/Z07ny9C4rNLA22++lvYc1hoUNkB31W4MAxQygtfL3PoeAZfzLb67UCizY1FT9M2IGp
	 C2Ih9l7XPCtyB1KsjPKrZxFQEAbz5+xvP6jlBVjLxI2X87tInn7Akme9LdY/BDDsE9A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794330758;
	h=DMARC-Filter:Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:
	 X-Bm-Milter-Handled:X-Bm-Transport-Timestamp;
	bh=n7pf/UzTRZTKsxrqy72hiWP4nEzW6tzF5H5XOx09a/E=;
	b=UnlUb4xV0FeIFa9pFtQwvX9931/clup5DmR7oud+kkt16QfzR8NuM7yBGDqJqQBlTNMP
	 FBf3SLYH/LfOOCX+onnvZvu+2l7KCrUH0u1Zt51t/vT3J+PRP1Fb9OJnCphWjgf28Mrqq
	 b1RHn3uApu9OYirks4d/M3UTrmHQGaCg5HsLsCrMxcI2luz8p26wvjJ9QlsQouYS5X+qk
	 TSljGsIGKn+Eg88aBHk/GaYtUk2QFRNNTiHkmJkfR4C4JuUcIqy+LNzPelNhxetOlfKU+
	 +KJebAhR4ZZaJfz8gYcpbBpTX086hr/qtFJD/zwfwoB6vdF2NREs4flYXTPn0lXaMEg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=lauterbach.com;
	spf=pass smtp.mailfrom=lauterbach.com;
	arc=none smtp.remote-ip=62.154.241.218
Received: from bm.lauterbach.com (bm.lauterbach.com [62.154.241.218])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 966BF606A31C
	for <linux-usb@vger.kernel.org>; Tue, 10 Nov 2026 17:12:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 966BF606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lauterbach.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lauterbach.com
Received: from ingpc2.intern.lauterbach.com (unknown [10.2.10.44])
	(Authenticated sender: ingo.rohloff@lauterbach.com)
	by bm.lauterbach.com (Postfix) with ESMTPSA id D987645B7B3C;
	Tue, 10 Nov 2026 18:12:35 +0100 (CET)
From: Ingo Rohloff <ingo.rohloff@lauterbach.com>
To: gregkh@linuxfoundation.org
Cc: viro@zeniv.linux.org.uk,
	nkapron@google.com,
	me@samcday.com,
	michael.bommarito@gmail.com,
	linux-usb@vger.kernel.org,
	Ingo Rohloff <ingo.rohloff@lauterbach.com>
Subject: [PATCH v2 1/2] usb: gadget: f_fs: simplify error handling using goto
Date: Tue, 10 Nov 2026 18:12:21 +0100
Message-ID: <20261110171222.22633-2-ingo.rohloff@lauterbach.com>
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
X-Bm-Transport-Timestamp: 1794330755943

Refactor conditional checks to use direct error returns/gotos instead of a
long if/else chain. This makes failure paths more obvious.

At the end of the function AIO request handling is done.

Signed-off-by: Ingo Rohloff <ingo.rohloff@lauterbach.com>
---
 drivers/usb/gadget/function/f_fs.c | 82 +++++++++++++++++-------------
 1 file changed, 48 insertions(+), 34 deletions(-)

diff --git a/drivers/usb/gadget/function/f_fs.c b/drivers/usb/gadget/function/f_fs.c
index 704cfae49f11..e347916923df 100644
--- a/drivers/usb/gadget/function/f_fs.c
+++ b/drivers/usb/gadget/function/f_fs.c
@@ -1104,11 +1104,17 @@ static ssize_t ffs_epfile_io(struct file *file, struct ffs_io_data *io_data)
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
@@ -1122,7 +1128,10 @@ static ssize_t ffs_epfile_io(struct file *file, struct ffs_io_data *io_data)
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
@@ -1141,7 +1150,7 @@ static ssize_t ffs_epfile_io(struct file *file, struct ffs_io_data *io_data)
 		io_data->buf = data;
 
 		init_completion(&io_data->done);
-		req->context  = io_data;
+		req->context = io_data;
 		req->complete = ffs_epfile_io_complete;
 
 		ret = usb_ep_queue(ep->ep, req, GFP_ATOMIC);
@@ -1176,44 +1185,49 @@ static ssize_t ffs_epfile_io(struct file *file, struct ffs_io_data *io_data)
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
+		req->sg = io_data->sgt.sgl;
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
+	req->context  = io_data;
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
 
+	ret = -EIOCBQUEUED;
+	/*
+	 * Do not kfree the buffer in this function.  It will be freed
+	 * by ffs_user_copy_worker.
+	 */
+	data = NULL;
+
 error_lock:
 	spin_unlock_irq(&epfile->ffs->eps_lock);
 error_mutex:
-- 
2.55.0


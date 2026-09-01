Received: from bm.lauterbach.com (bm.lauterbach.com [62.154.241.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36F3748CD55
	for <linux-usb@vger.kernel.org>; Tue,  1 Sep 2026 12:17:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=62.154.241.218
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788265029; cv=none; b=SxQ4uCp7SlD9d489RA28mERnT2R1fu4dg9FdzY/9oqdfomDTQP+7amcqTwRs9AvwJ6W4UpqyZMAbNeQCzbWT6qxkbu/qE8yklQ8/HUjv0wHGgPj53IB0heIKx89m5duIcUPybthIFU8Ukw6A7aIIXYjuHA3UyIkk0oDztyIk0eU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788265029; c=relaxed/simple;
	bh=WWd59vgz+tErKoPJzHhr8MFpMfAXlGsbnBG+GftaXvM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XLUHGAHx5mgxzC8/ON7svw8cgUOT3+gamgNB6CmO3oJvC6ZUoCDeV0cqMa2AeOPSoQEBB7FZTKcvpSQAeLE/NayxW3FTIec8xyrETweLS5h07jchbOAkLdgFu3yOCe/+kg8IMUTYmk2XXyum1QvShWliv3/oYPkOIiXvWSuxW8M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lauterbach.com; spf=pass smtp.mailfrom=lauterbach.com; arc=none smtp.client-ip=62.154.241.218
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lauterbach.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lauterbach.com
Received: from ingpc2.intern.lauterbach.com (unknown [10.2.10.44])
	(Authenticated sender: ingo.rohloff@lauterbach.com)
	by bm.lauterbach.com (Postfix) with ESMTPSA id 3EA2F14C7F8FC;
	Tue, 01 Sep 2026 14:09:25 +0200 (CEST)
From: Ingo Rohloff <ingo.rohloff@lauterbach.com>
To: gregkh@linuxfoundation.org
Cc: viro@zeniv.linux.org.uk,
	nkapron@google.com,
	me@samcday.com,
	michael.bommarito@gmail.com,
	linux-usb@vger.kernel.org,
	Ingo Rohloff <ingo.rohloff@lauterbach.com>
Subject: [PATCH 1/3] usb: gadget: f_fs: simplify error handling using goto
Date: Tue,  1 Sep 2026 14:09:06 +0200
Message-ID: <20260901120908.14386-2-ingo.rohloff@lauterbach.com>
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
X-Bm-Transport-Timestamp: 1788264565270

Refactor conditional checks to use direct error returns/gotos instead of a
long if/else chain. This makes failure paths more obvious.

At the end of the function AIO request handling is done.

Signed-off-by: Ingo Rohloff <ingo.rohloff@lauterbach.com>
---
 drivers/usb/gadget/function/f_fs.c | 80 ++++++++++++++++++------------
 1 file changed, 47 insertions(+), 33 deletions(-)

diff --git a/drivers/usb/gadget/function/f_fs.c b/drivers/usb/gadget/function/f_fs.c
index 43962e05eacf..76fba3085664 100644
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
@@ -1176,44 +1185,49 @@ static ssize_t ffs_epfile_io(struct file *file, struct ffs_io_data *io_data)
 		else
 			ret = io_data->status;
 		goto error_mutex;
-	} else if (!(req = usb_ep_alloc_request(ep->ep, GFP_ATOMIC))) {
+	}
+
+	// It's an AIO request
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


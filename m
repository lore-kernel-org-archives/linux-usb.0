Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2D4336DA08;
	Mon,  1 Jun 2026 06:44:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780296266; cv=none; b=qQIdJHT7h2f1byhd9rQ1M77wlFMehOs1wPPZD/68bEfUEUKJuDsC2R25RnpU/Es96Q1YxomjWVB+9nyPv5Uj1aG1rwNorcu4Iwj+nDAEWBMyJvmsJ41AeUwxZaTEUUYuEo5eWL+ULsr2V3lWPpNwhaMZBa5x7joSAgjN1OahaOw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780296266; c=relaxed/simple;
	bh=M4PVNePiGUS3vNTiyjLrChSX97lbvgCzBbOkJ+xcEL8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QSfpkb581UaAB39+I3KiDngq1KsdUS4Ip77dTH3oKtwYhiOsRiny/77ntWOv1Ba6p52eIbxq3hwUdrBUkTSRQsj5zPvaowe9VxdYUP18WV7dTAYR4KX8pvx7pgTIHA1ppROrAoFXr0NsuDcPPCnVpyojp+aJvnPdjKAtq4iTbQs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NhzyjTOW; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NhzyjTOW"
Received: by smtp.kernel.org (Postfix) with ESMTPS id AD106C2BCC9;
	Mon,  1 Jun 2026 06:44:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1780296265;
	bh=M4PVNePiGUS3vNTiyjLrChSX97lbvgCzBbOkJ+xcEL8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=NhzyjTOW/oM1JPK+bKGC28hzzkdqwsTqvat3BAQz2x3f8kORHMi3tEYZvW8VFIp4K
	 vpvxP+imK7VyArmzMA1Fqhg9wuv+9OkTyX65kq5a5Fsr80P6WTR41znkcgcPdVALOG
	 4zPGDQ8x4ocKx1/l15o3wNad2RI1hDhvQQwQwaNkSpJ4gq/xWE9/gKa0vSgDVfqHik
	 2phhIb4ogVXNgo56J07glzVqi0O5b9oSwvkp+DvggO15KP4FaWzS2xgYOGr/V9pQFS
	 8YaU4Mxpr2H4/tIRww+vOP/tZdH88vs0MA5+dzEu4DAaQn53IdUFF3yvegg1uJdR+a
	 ve0H2N1+HceSA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D671CD5BD1;
	Mon,  1 Jun 2026 06:44:25 +0000 (UTC)
From: Gabriel Prostitis via B4 Relay <devnull+prostitisgabriel.gmail.com@kernel.org>
Date: Mon, 01 Jun 2026 08:44:11 +0200
Subject: [PATCH v2 2/2] USB: gadget: inode: fix mm lifetime handling
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260601-mm-uaf-fix-v2-2-3c942a707bce@gmail.com>
References: <20260601-mm-uaf-fix-v2-0-3c942a707bce@gmail.com>
In-Reply-To: <20260601-mm-uaf-fix-v2-0-3c942a707bce@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Alan Stern <stern@rowland.harvard.edu>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780296264; l=2287;
 i=prostitisgabriel@gmail.com; s=20260530; h=from:subject:message-id;
 bh=zX5aUkyPq0VfaywNfJGd5qPxQieZO7597nqMJ938NSY=;
 b=CuuO+XhPmqlT1WwlhxRnifyczfr7I4Ae7DKspYKwsPADj7f42CmZEnQWd0dxKBk6UCfFBUI+b
 JCs+vAVXyC2DK4UZfJRYRI5reAdp9Jj28LWSzUdBp58rq81DARyPSv5
X-Developer-Key: i=prostitisgabriel@gmail.com; a=ed25519;
 pk=FwuU+O6ZnvvnFVA45nfqkGlhSmC1P64HLtxRgBebOuY=
X-Endpoint-Received: by B4 Relay for prostitisgabriel@gmail.com/20260530
 with auth_id=800
X-Original-From: Gabriel Prostitis <prostitisgabriel@gmail.com>
Reply-To: prostitisgabriel@gmail.com

From: Gabriel Prostitis <prostitisgabriel@gmail.com>

priv stores a pointer to the submitting task's mm_struct,
but does not currently hold a reference to it while async
requests are pending.

This can result in a use-after-free if the task exits before
completion handling finishes.

Take a reference with mmgrab() when queuing the read request
and release it with mmdrop() on request completion.

Reported-by: Gabriel Prostitis <prostitisgabriel@gmail.com>
Signed-off-by: Gabriel Prostitis <prostitisgabriel@gmail.com>
Acked-by: Alan Stern <stern@rowland.harvard.edu>
---
 drivers/usb/gadget/legacy/inode.c | 17 +++++++++++++----
 1 file changed, 13 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/gadget/legacy/inode.c b/drivers/usb/gadget/legacy/inode.c
index d87a8ab51510..db961aaa3740 100644
--- a/drivers/usb/gadget/legacy/inode.c
+++ b/drivers/usb/gadget/legacy/inode.c
@@ -471,11 +471,17 @@ static void ep_user_copy_worker(struct work_struct *work)
 	struct kiocb *iocb = priv->iocb;
 	size_t ret;
 
-	kthread_use_mm(mm);
-	ret = copy_to_iter(priv->buf, priv->actual, &priv->to);
-	kthread_unuse_mm(mm);
-	if (!ret)
+	if (mmget_not_zero(mm)) {
+		kthread_use_mm(mm);
+		ret = copy_to_iter(priv->buf, priv->actual, &priv->to);
+		kthread_unuse_mm(mm);
+		mmput(mm);
+		if (!ret)
+			ret = -EFAULT;
+	} else {
 		ret = -EFAULT;
+	}
+	mmdrop(mm);
 
 	/* completing the iocb can drop the ctx and mm, don't touch mm after */
 	iocb->ki_complete(iocb, ret);
@@ -501,6 +507,7 @@ static void ep_aio_complete(struct usb_ep *ep, struct usb_request *req)
 	 * complete the aio request immediately.
 	 */
 	if (priv->to_free == NULL || unlikely(req->actual == 0)) {
+		mmdrop(priv->mm);
 		kfree(req->buf);
 		kfree(priv->to_free);
 		kfree(priv);
@@ -541,6 +548,7 @@ static ssize_t ep_aio(struct kiocb *iocb,
 	priv->epdata = epdata;
 	priv->actual = 0;
 	priv->mm = current->mm; /* mm teardown waits for iocbs in exit_aio() */
+	mmgrab(priv->mm);
 
 	/* each kiocb is coupled to one usb_request, but we can't
 	 * allocate or submit those if the host disconnected.
@@ -570,6 +578,7 @@ static ssize_t ep_aio(struct kiocb *iocb,
 
 fail:
 	spin_unlock_irq(&epdata->dev->lock);
+	mmdrop(priv->mm);
 	kfree(priv->to_free);
 	kfree(priv);
 	put_ep(epdata);

-- 
2.54.0



Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE1AB344DB5
	for <linux-usb@vger.kernel.org>; Fri, 12 Jun 2026 14:59:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781276354; cv=none; b=HJsojKMaCqdRdzfB3lfGGwxLPrbXq4Iyw/WE0c7B/kjDv1+HfGP9Z1Daf47d5yZy+47isxlalnPOYWLcCNrfN/wnvha4Hnv1OrOBzL4IuqTX0jZK9FpTgH+5u7WW0AiQf0TVNks0IJYDjZ8o2feCEItBprTKCffR+xzgjws6D4M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781276354; c=relaxed/simple;
	bh=qieEbsfXqbv7PlgC7SL3NE88zeKU/bHXLtffhSGQamo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=gWoDlkvBZSG3ZADa7HIPfvjpXYS1fOdf3dHQ0BjgQp6leZxGC1V/35+kC02O99rZdF4FbZFr+KzffXkWLJACLxHwj0WA+6KKOCNrJihB6P1JxWKBHU3xPviyxWEKk/Cd44oLjxfDBIMLX/oOrZZ3vTA/Cx36oyOyCR/BlXZd9sg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=f1cPpmbo; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="f1cPpmbo"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 71BDEC2BCB4;
	Fri, 12 Jun 2026 14:59:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1781276354;
	bh=qieEbsfXqbv7PlgC7SL3NE88zeKU/bHXLtffhSGQamo=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=f1cPpmboCCwidPbhNwfyk7eBxd3jHjF1DAy/CGhWpBNTxUzswfKnQHaGFp39ly2Hn
	 RBaokUn5Pyx00vgmciA6ghhibjcs6vjyGWc4uwzuA2VWuc9EWDUCpqyfXnv1seMx1N
	 tS0Kg1I5zFHbV0eAA54Wb5zzJpbmtusYZlLQ7H4Wv2q/1K2Qq9wGMSdNUcrXWvg+cT
	 apJdllA0f9eEv5P1o4ig4eX2+bqnyNQm1Z0tShrnXJ2yVoVwVbdhYMHwPlRm6Kg5Bn
	 6BMPugBCYCSZxPEpHtzNut/6ZwEv6X7522AMiwS3KHnhaHpeeg6F469vE8rVunuUQi
	 oCIJBBrwTQE4g==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A71ECD98CF;
	Fri, 12 Jun 2026 14:59:14 +0000 (UTC)
From: =?utf-8?q?Nuno_S=C3=A1_via_B4_Relay?= <devnull+nuno.sa.analog.com@kernel.org>
Date: Fri, 12 Jun 2026 15:57:57 +0100
Subject: [PATCH] usb: gadget: f_fs: Fix fence cleanup in
 ffs_dmabuf_transfer() error paths
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260612-fix-f_fs-fence-cleanup-v1-1-79f489b0efe9@analog.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x2MQQqAIBAAvyJ7bsEWrOgrEWG61kJYKEUQ/T3pO
 DAzD2ROwhl69UDiS7LssUBdKXCrjQuj+MJAmhrd1IRBbgxTyBg4Oka3sY3nga3tNPmZjNEWSnw
 kLuY/Hsb3/QAXluEHaAAAAA==
X-Change-ID: 20260612-fix-f_fs-fence-cleanup-7a802db2550a
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Simona Vetter <simona.vetter@ffwll.ch>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Paul Cercueil <paul@crapouillou.net>
Cc: linux-usb@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781276421; l=1859;
 i=nuno.sa@analog.com; s=20231116; h=from:subject:message-id;
 bh=BOlKoX2q6H6KtLn6NlDIY91aGSPjYvKunR5y99ZooVc=;
 b=vKY+TxEfbZripG/059i4l2KhTtY+qMtIswZq2uT69H1t5tfWc2sCBRhfwnPIG3994jtv9p0ul
 HCkY80dWVJfBnlY75/cUL46MDfw164GHmw+6OBWbmFlzn9U4VjpqwwJ
X-Developer-Key: i=nuno.sa@analog.com; a=ed25519;
 pk=3NQwYA013OUYZsmDFBf8rmyyr5iQlxV/9H4/Df83o1E=
X-Endpoint-Received: by B4 Relay for nuno.sa@analog.com/20231116 with
 auth_id=100
X-Original-From: =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>
Reply-To: nuno.sa@analog.com

From: Nuno Sá <nuno.sa@analog.com>

The error paths for endpoint-disabled (ESHUTDOWN) and request-allocation
failure (ENOMEM) in ffs_dmabuf_transfer() jump to err_fence_put which
calls dma_fence_put() on the fence. However, at that point the fence has
only been kmalloc'd — dma_fence_init() has not been called yet, so the
refcount and the fence ops are uninitialized. Calling dma_fence_put() on
such an object leads to undefined behavior.

Use kfree() instead, since the fence is just a plain allocation at this
stage, and rename the label to err_fence_free to reflect the actual
cleanup action.

Fixes: 7b07a2a7ca02 ("usb: gadget: functionfs: Add DMABUF import interface")
Signed-off-by: Nuno Sá <nuno.sa@analog.com>
---
 drivers/usb/gadget/function/f_fs.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/gadget/function/f_fs.c b/drivers/usb/gadget/function/f_fs.c
index 75912ce6ab556..ac8c53789ec20 100644
--- a/drivers/usb/gadget/function/f_fs.c
+++ b/drivers/usb/gadget/function/f_fs.c
@@ -1682,13 +1682,13 @@ static int ffs_dmabuf_transfer(struct file *file,
 	/* In the meantime, endpoint got disabled or changed. */
 	if (epfile->ep != ep) {
 		ret = -ESHUTDOWN;
-		goto err_fence_put;
+		goto err_fence_free;
 	}
 
 	usb_req = usb_ep_alloc_request(ep->ep, GFP_ATOMIC);
 	if (!usb_req) {
 		ret = -ENOMEM;
-		goto err_fence_put;
+		goto err_fence_free;
 	}
 
 	/*
@@ -1736,9 +1736,9 @@ static int ffs_dmabuf_transfer(struct file *file,
 
 	return ret;
 
-err_fence_put:
+err_fence_free:
 	spin_unlock_irq(&epfile->ffs->eps_lock);
-	dma_fence_put(&fence->base);
+	kfree(fence);
 err_resv_unlock:
 	dma_resv_unlock(dmabuf->resv);
 err_attachment_put:

---
base-commit: f176a7c3e44f80b4493d22aa12d02673243ec7d8
change-id: 20260612-fix-f_fs-fence-cleanup-7a802db2550a
--

Thanks!
- Nuno Sá



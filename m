Received: from mta1.migadu.com (out-162.mta1.migadu.com [95.215.58.162])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B991A31E823
	for <linux-usb@vger.kernel.org>; Thu,  3 Sep 2026 11:20:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.162
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788434415; cv=none; b=BLo+raadDOaJOptHwCYPiiykvbRsqqawAh7FFNTzzADQ4KMZXU6gfOuQwLqfcon1fjtCqm0dBoST1xrm4gjGLNAxaG/NYE4VfcqfYB2sEeP8NuKEfw2xEYyYB2N9YUJWPJ9okbmKX3MLMHzqflsgXol8VkEkP+h50Yo94k7HG10=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788434415; c=relaxed/simple;
	bh=wel7X99adXk24iGrOnhSBCsZXh+jx0dI/nxr0yirSB0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-type; b=lv3k9gIMnKl7TDkIJmJjcUJmpiUybJFEioK08a2471H8dlI7YIonPFEc1ILaRJg9zbGnP7Yvu0Ws0Une13yNv9StJDrPqxUCFg9ywOzRJNyUpL5Fx6Jj0lqOguVhhJvvk183rAxi+UmHRhU5zQERNqjW7mZsDwKy0HSP2ehzPbg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=linux.dev; arc=none smtp.client-ip=95.215.58.162
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
X-Envelope-To: linux-usb@vger.kernel.org
X-Envelope-To: linux-usb@vger.kernel.org
Received: by mta12.migadu.com with ESMTPS id 4d44642c917c58e5;
	Thu, 03 Sep 2026 11:20:03 +0000
X-Mizu-Trace-ID: 4d44642c917c58e5
X-Migadu-Flow: FLOW_OUT
From: Baoquan He <hebaoquan@kylinos.cn>
To: linux-mm@kvack.org
Cc: akpm@linux-foundation.org,
	hch@lst.de,
	harry@kernel.org,
	Baoquan He <hebaoquan@kylinos.cn>,
	linux-usb@vger.kernel.org
Subject: [PATCH 13/13] usb: cdns2: Don't use GFP_DMA when calling dma_alloc_coherent()
Date: Thu,  3 Sep 2026 19:18:36 +0800
Message-ID: <20260903111836.1777265-14-hebaoquan@kylinos.cn>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260903111836.1777265-1-hebaoquan@kylinos.cn>
References: <20260903111836.1777265-1-hebaoquan@kylinos.cn>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit

dma_alloc_coherent() allocates the DMA buffer with the device's
addressing limitation in mind; the DMA core picks the zone from the
device's coherent DMA mask and ignores GFP_DMA passed by the caller.
Use GFP_KERNEL instead so the allocation may reclaim as usual for
probe-time allocations.

Cc: linux-usb@vger.kernel.org
Signed-off-by: Baoquan He <hebaoquan@kylinos.cn>
---
 drivers/usb/gadget/udc/cdns2/cdns2-gadget.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/gadget/udc/cdns2/cdns2-gadget.c b/drivers/usb/gadget/udc/cdns2/cdns2-gadget.c
index 308d3c468ab1..8719f1f86e61 100644
--- a/drivers/usb/gadget/udc/cdns2/cdns2-gadget.c
+++ b/drivers/usb/gadget/udc/cdns2/cdns2-gadget.c
@@ -2341,7 +2341,7 @@ static int cdns2_gadget_start(struct cdns2_device *pdev)
 
 	/* Allocate memory for setup packet buffer. */
 	buf = dma_alloc_coherent(pdev->dev, 8, &pdev->ep0_preq.request.dma,
-				 GFP_DMA);
+				 GFP_KERNEL);
 	pdev->ep0_preq.request.buf = buf;
 
 	if (!pdev->ep0_preq.request.buf) {
-- 
2.54.0


Received: from mta1.migadu.com (out-107.mta1.migadu.com [95.215.58.107])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE23F3B1014
	for <linux-usb@vger.kernel.org>; Thu,  3 Sep 2026 11:19:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.107
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788434376; cv=none; b=K7kHuv4IurQMKq87ZJkj3Ncvcwl9407uRtXzkCm4F3kbYOP1dJfhNsK3B/UcaDxh/iRTg2jFt3DySuuU5IG5Atfdpc4nM+15f6aZqDhvbBraSb9MYcLhO51CNZgVbp4OL1TAraUjwkEfxVKjuXC8qMuSoPl01bN879zJXAdgxLk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788434376; c=relaxed/simple;
	bh=pyCTSrbc7LmpH6Y+0OZ3c5H/zi+5nODONa99Y1nsgmY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-type; b=FoQS1vifbhAMZY/fLirvWB52IHxkMX29CLGpepID+azpeehfJHKZIp3tCx7geDCJd+XEMJO0p4IeGBsy2G4OFXg+9Ogl0WjvcsJq4mhj+H3cKO209YSKdAhsYHV0NXhxLLSK1tnkLV0cqtT1Nv7XuMA3LDYR3IzR60h/nLfjOqk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=linux.dev; arc=none smtp.client-ip=95.215.58.107
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
X-Envelope-To: linux-usb@vger.kernel.org
X-Envelope-To: linux-usb@vger.kernel.org
Received: by mta12.migadu.com with ESMTPS id d1edb05fc0e93de7;
	Thu, 03 Sep 2026 11:19:26 +0000
X-Mizu-Trace-ID: d1edb05fc0e93de7
X-Migadu-Flow: FLOW_OUT
From: Baoquan He <hebaoquan@kylinos.cn>
To: linux-mm@kvack.org
Cc: akpm@linux-foundation.org,
	hch@lst.de,
	harry@kernel.org,
	Baoquan He <hebaoquan@kylinos.cn>,
	linux-usb@vger.kernel.org
Subject: [PATCH 07/13] usb: cdns3: Don't use GFP_DMA when calling dma_alloc_coherent()
Date: Thu,  3 Sep 2026 19:18:30 +0800
Message-ID: <20260903111836.1777265-8-hebaoquan@kylinos.cn>
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
 drivers/usb/cdns3/cdns3-gadget.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/cdns3/cdns3-gadget.c b/drivers/usb/cdns3/cdns3-gadget.c
index 42311c1bfada..484d3128cf08 100644
--- a/drivers/usb/cdns3/cdns3-gadget.c
+++ b/drivers/usb/cdns3/cdns3-gadget.c
@@ -3376,7 +3376,7 @@ static int cdns3_gadget_start(struct cdns *cdns)
 
 	/* allocate memory for setup packet buffer */
 	priv_dev->setup_buf = dma_alloc_coherent(priv_dev->sysdev, 8,
-						 &priv_dev->setup_dma, GFP_DMA);
+						 &priv_dev->setup_dma, GFP_KERNEL);
 	if (!priv_dev->setup_buf) {
 		ret = -ENOMEM;
 		goto err2;
-- 
2.54.0


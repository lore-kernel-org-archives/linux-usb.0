Received: from mta1.migadu.com (out-100.mta1.migadu.com [95.215.58.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B49F4457BD
	for <linux-usb@vger.kernel.org>; Thu,  3 Sep 2026 11:19:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.100
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788434374; cv=none; b=Ni5ZpD8uzQutlMvB0unRQGaiMHpX/EonN/pCZ8wlX3a8qx/SI0Fv80w9Go79zQv3Od9jEswQ855+8TjKUMbxDHMmUwBuZ282tHILwnuecNrqcW1LcZKxUdv2TIAs45QwBF7zB5fOvzlXiMdM3T3bVoTOO7Fg2yeFGQ5zWfSws5c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788434374; c=relaxed/simple;
	bh=xS3qfKnW1J8hU7Ku28HQ8iOfYWiIVxRQUG6vk4iWSNg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-type; b=NQwNmiaUDJwOZRoWnaUmpQUYPnaWzc0p9jgndmAd3H//RyzzzyjHCFa4km2Hbu73hA+jHENjUD3VvVPTaqGnt6NJwQG79rQUnwXetr767YydWEueAEAxPOazfN+l/uIszp6ZNgUZsa42A60THJB5R7nw842yfnDr6NrsqHVUTFk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=linux.dev; arc=none smtp.client-ip=95.215.58.100
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
X-Envelope-To: linux-usb@vger.kernel.org
X-Envelope-To: linux-usb@vger.kernel.org
Received: by mta12.migadu.com with ESMTPS id a19d86fc6d1e4889;
	Thu, 03 Sep 2026 11:19:21 +0000
X-Mizu-Trace-ID: a19d86fc6d1e4889
X-Migadu-Flow: FLOW_OUT
From: Baoquan He <hebaoquan@kylinos.cn>
To: linux-mm@kvack.org
Cc: akpm@linux-foundation.org,
	hch@lst.de,
	harry@kernel.org,
	Baoquan He <hebaoquan@kylinos.cn>,
	linux-usb@vger.kernel.org
Subject: [PATCH 06/13] usb: gadget: lpc32xx_udc: Don't use GFP_DMA when calling dma_alloc_coherent()
Date: Thu,  3 Sep 2026 19:18:29 +0800
Message-ID: <20260903111836.1777265-7-hebaoquan@kylinos.cn>
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
Remove the redundant GFP_DMA flag.

Cc: linux-usb@vger.kernel.org
Signed-off-by: Baoquan He <hebaoquan@kylinos.cn>
---
 drivers/usb/gadget/udc/lpc32xx_udc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/gadget/udc/lpc32xx_udc.c b/drivers/usb/gadget/udc/lpc32xx_udc.c
index 044c31869cfb..90d1eef52877 100644
--- a/drivers/usb/gadget/udc/lpc32xx_udc.c
+++ b/drivers/usb/gadget/udc/lpc32xx_udc.c
@@ -3080,7 +3080,7 @@ static int lpc32xx_udc_probe(struct platform_device *pdev)
 	/* Allocate memory for the UDCA */
 	udc->udca_v_base = dma_alloc_coherent(&pdev->dev, UDCA_BUFF_SIZE,
 					      &dma_handle,
-					      (GFP_KERNEL | GFP_DMA));
+					      GFP_KERNEL);
 	if (!udc->udca_v_base) {
 		dev_err(udc->dev, "error getting UDCA region\n");
 		retval = -ENOMEM;
-- 
2.54.0


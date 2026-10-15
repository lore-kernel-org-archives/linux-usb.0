Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C2413EB112
	for <linux-usb@vger.kernel.org>; Thu, 15 Oct 2026 03:49:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792036169; cv=none; b=AliwdYzgictCK5WBgtLBjp8d5p98nO9LYlExW6WFxeGbiDfu35N3K3Y4xpG5Tip1k6xvCjU1iA/IWGZ0H4QXTbRqTZ94UwXOC5VyNNaNl+37dSVHo6qrmdiFAPetzdz2muVgs+BClElw1EoDurl/si1XLL/2eOj6lLo/AkYMgZ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792036169; c=relaxed/simple;
	bh=9La12g5qlo3BW0g8udb9Zc50S7ZaicRK1fogOHwlSKo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=MB9/NxUlQvmbFVUTBRJsTfHNP6IReON5+BNbFFQpuHj9bFD4NhvNLgEaQ2UVR+wEWXB6sz5kTJlf0G+IbikaZfY3WdtRlVbdcw2jE/GA2tSHk72pUzyPLo4q4uY+3kxqSO3Mr7fA/Bjcq1+Efaqo1B5uCaXEHnhSxP076uskHms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VORphHEV; arc=none smtp.client-ip=209.85.219.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VORphHEV"
Received: by mail-qv1-f44.google.com with SMTP id 6a1803df08f44-91986c5cb75so11366906d6.0
        for <linux-usb@vger.kernel.org>; Wed, 14 Oct 2026 20:49:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792036163; x=1792640963; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=cgj8L8l43KRuqjoHn6Iq0rLDkoXVgfoxHPbyG5KPP/o=;
        b=VORphHEV+QpwlPXA6FoZOZaq/1CDsPF14RCoY1FI4XZS82Fa1SB4Z39Ef+oV3Pj72D
         JQeAAsOhnuZLTvXdn0iAC7RamawErxBDDh1Eho34W1t1O5F30W2GPxRuQ2/+VXHeLNaW
         /t4GNM0UozxQUwt9NPIksmMXB8P25pUdNZKg+jOanfmNaAUjy2zx+lbyykWyvK/Ul5aq
         xJFotLQsAjK3ZNtGYTcI/FOkuk4BivbL81oU5dBQ8/MRIlDTQlVBx/qzz7fYrFIUqnpt
         jOPwYDhXPolxwLcKP6b8XwCBFBUIwqjcRWvwsKNkA9zLWstSQC2qxXlWDDgpf+gxWBz0
         sv/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792036163; x=1792640963;
        h=content-transfer-encoding:mime-version:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cgj8L8l43KRuqjoHn6Iq0rLDkoXVgfoxHPbyG5KPP/o=;
        b=pLcwxXGZf4hjPkSDZAyJ5FvNaJZT9ClUsHwrGSbhjn4TTWXJ02S3Dwdx9pbj1KcBaB
         NuRoUeLoARHXaaSg352FFqEjlPLUcZtt/QQvirqCc9uuiEeDV8aXHD1iChU4wJvGR1eA
         qu2SVolE/3f2qWukhmCrjH/T12fkCFqJit8G49JAtVPu+L/71V4QH+gdfrFaOZprXvsL
         XZAagMwEHlSjBf0HybDfAyREOIxvs7XzrNqwnJNVrQk018V6/mOqdWkHcUK5DB0/G9ta
         Z4oERYP/JYk9vjt6Zo9Q0mP3BQZEf4lIyjULrr2eJriw4JSZHcVdl8zEopHYZc9HMTnA
         DZyA==
X-Gm-Message-State: AFq9FYL2WF8FANsycEaTg0DM/fgpcqfayuSHZUZn/TAh/u/Y9Mdus/ol
	b7zOa273xuWulTvL5Gm/3/vrIHQh8FhDyTHOdB5TW6stm9IM1s5cT7ih4mwhUCc=
X-Gm-Gg: AYBFou2FnpA3QmIBwAWIRIxf4G4/WR59VWIyGkeaN+2vt6L1SCJgunz7gH5+Z+sPVYk
	zD9f3akTRpMtrienx2QsV3jc7RsQv3Dv0xU0yWiCJRj50xyM6OwCq8+m1Q9Ku+BZ6s5xKV2Eeco
	XA3CS06x3a9UNAgF+g2CoOV0Pw7sFzXfnbvcxk9A2PnzgNq+Ds0GY6LhCKgwBq5dICDHS63Zh6F
	w+9xJm/SpWdCc0upUtVviQG/Kymi3u13lFUNRmlVF4D7DzqVBlvAPLU9Ui3HmLHmFdGJ/KdwxRF
	7WJyZJT0qJ3TVo9ZYjg2hVXZJenrsJgT+A6BOjNI/NCJdLsfAxZJ31j7CANrHVekZGd9RR/GPgO
	hnhQZTpKsQvo4Fb8d7RR6tAKZ7i4rKJhSvaIlKpixxNOH1I+NGVos6PXPvS2We/Q2eu5rRQf8Ue
	Vm9MiM6SIM/zhtOZEWYmJ1cgw/8GQ8VH9+kFscwZoYVVgHKhGoOWf4v908FBb0RLp/+Spx/mgzY
	mthPjqO21uCX45+18qe9c5vstah/CS8zMVR1VGvQFJkXogCAKXYJyP+dlNPzNeMgdqBm3uajUA9
	uLvvCA+373Pu+UFUNmnzU547In/KkZALODF6UWc=
X-Received: by 2002:a05:6214:20af:b0:917:a58b:3629 with SMTP id 6a1803df08f44-91b55561e5amr317123806d6.26.1792036163057;
        Wed, 14 Oct 2026 20:49:23 -0700 (PDT)
Received: from i4-gl-tmk5904-1.ad.psu.edu ([130.203.156.90])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91b97b3864dsm70540626d6.14.2026.10.14.20.49.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 20:49:22 -0700 (PDT)
From: Myeonghun Pak <mhun512@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ijae Kim <ae878000@gmail.com>,
	Vasileios Almpanis <vasilisalmpanis@gmail.com>
Subject: [PATCH 3/4] usb: gadget: pch_udc: track successful EP0 DMA mappings
Date: Wed, 14 Oct 2026 23:49:15 -0400
Message-ID: <20261015034916.2773248-4-mhun512@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261015034916.2773248-1-mhun512@gmail.com>
References: <20261015034916.2773248-1-mhun512@gmail.com>
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

DMA address zero is valid, and a failed dma_map_single() does not
create a mapping to unmap. Track successful mapping explicitly so
cleanup handles both cases correctly. Return -EIO on mapping failure
instead of returning the positive dma_mapping_error() result.

This issue was identified as part of our ongoing research while
reviewing kernel code.

Fixes: f646cf94520e ("USB device driver of Topcliff PCH")
Assisted-by: LLM
Co-developed-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
---
Compile-tested only.

 drivers/usb/gadget/udc/pch_udc.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/gadget/udc/pch_udc.c b/drivers/usb/gadget/udc/pch_udc.c
index c360bc556cdc..38b9159e2461 100644
--- a/drivers/usb/gadget/udc/pch_udc.c
+++ b/drivers/usb/gadget/udc/pch_udc.c
@@ -328,6 +328,7 @@ struct pch_vbus_gpio_data {
  * @data_requests:	DMA pool for data requests
  * @stp_requests:	DMA pool for setup requests
  * @dma_addr:		DMA pool for received
+ * @dma_mapped:		EP0 receive buffer has a valid DMA mapping
  * @setup_data:		Received setup data
  * @base_addr:		for mapped device memory
  * @bar:		PCI BAR used for mapped device memory
@@ -351,6 +352,7 @@ struct pch_udc_dev {
 	struct dma_pool		*data_requests;
 	struct dma_pool		*stp_requests;
 	dma_addr_t			dma_addr;
+	bool				dma_mapped;
 	struct usb_ctrlrequest		setup_data;
 	void __iomem			*base_addr;
 	unsigned short			bar;
@@ -2887,7 +2889,10 @@ static int init_dma_pools(struct pch_udc_dev *dev)
 	dev->dma_addr = dma_map_single(&dev->pdev->dev, ep0out_buf,
 				       UDC_EP0OUT_BUFF_SIZE * 4,
 				       DMA_FROM_DEVICE);
-	return dma_mapping_error(&dev->pdev->dev, dev->dma_addr);
+	if (dma_mapping_error(&dev->pdev->dev, dev->dma_addr))
+		return -EIO;
+	dev->dma_mapped = true;
+	return 0;
 }
 
 static int pch_udc_start(struct usb_gadget *g,
@@ -2996,7 +3001,7 @@ static void pch_udc_cleanup(struct pch_udc_dev *dev)
 		dma_pool_destroy(dev->stp_requests);
 	}
 
-	if (dev->dma_addr)
+	if (dev->dma_mapped)
 		dma_unmap_single(&dev->pdev->dev, dev->dma_addr,
 				 UDC_EP0OUT_BUFF_SIZE * 4, DMA_FROM_DEVICE);
 }

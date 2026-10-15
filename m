Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0ED5839F16B
	for <linux-usb@vger.kernel.org>; Thu, 15 Oct 2026 03:49:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792036168; cv=none; b=uZGOajU4xzolOrJICjBhXf974qLj1sAU6RU0ZAuLarjMqbwMelEAK+hGFc/pzALGwjvfy4IKD7E1ibBG1nC1CGDrr9UXErij2b1FzWgTtW1LdNY2bYoCJZHP9RS9uCq7Tw70q2DQCnBpC2U+J/D6BzOtXlsXm2yqEXLVFd0KC+I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792036168; c=relaxed/simple;
	bh=ZyEaSUcDig1wJZsjxYxZc6dyVczNomBHB68Xe/Wjz4s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=KiTgtoI2I6erI0tg5lyPLwX035t1LsUqhskFNzUh2RoWpMVgOusl3s0Zy2xUZOvzAF8ZuNXiHQEvHc/TUUXDqFE0vJFt7HBX+QY/pDPHyM+dRVuAFlo7ILRLtBMSf19nzRBP9RyhKcPH+hBnGHQaMnAB7H3xdwDwBqAxvCizLfg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TVSJ8LGD; arc=none smtp.client-ip=209.85.219.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TVSJ8LGD"
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-9178aabd30dso47932806d6.1
        for <linux-usb@vger.kernel.org>; Wed, 14 Oct 2026 20:49:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792036162; x=1792640962; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=WzXutQ/e6rJyBoq4Bg/0fBVEiN2JdTj2MgBZ/de9U34=;
        b=TVSJ8LGDYrQ5Z4R5jTpvQcNgmXg+tdsVILckmEDvayEfi38b3BtXcsNbWGH2YvjLgX
         yX2lhBJLsIKf8uxKSMXhpTBH2fq8YUoUw/dlP3mXYjJZCVMWDOw8jDCFCOyEFCpyrSLg
         tzv90hPlifYxMVKfqilEJIf76HFf/ovzDg41/jQkquheKPDl5uou+Oh4gDZWzPrCMYHJ
         BcAwRg+52Pmm4tY7vcW6B5qmiINVhw/WPmiDV70wmh/FxuSVg7BnqXD5ryfzyNJa9VKS
         RcmIGpFiLyolyRTonsqdRAhfQNhVd6iomtEENqO544kS7tHBC2sSvARW0Tu9rJJrpqFu
         VvrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792036162; x=1792640962;
        h=content-transfer-encoding:mime-version:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WzXutQ/e6rJyBoq4Bg/0fBVEiN2JdTj2MgBZ/de9U34=;
        b=HBj5op+bxns94Hyqo/FHh/z5sGabkNxrANJ+t1sUn/I+LmWW/wbZjS+xeEoCKt0Ptv
         n/8g98zM7bhJMXO3uOMFA3ymxxl+mrWNnRdM5js3sthzN1gDrnNezMT8wDZmVckcs3Pp
         +U/9Jg3I7s/14TIOrGdTAAa7lxqkoMZWkMEUYxgLj+u8tNiHmlLUMEwjO+vtZ2Sb5T8M
         SotUjCZ1D7YoZA6DIXJEBdPtMHuvLcMr8NXVkWD+TbIzHf2Hr+vNpfCTC8GQD5+nD0SC
         xrpfuVr/JgMys7VA6jTXMVgTcVJOKOJiJvTo5ufv7PX2dmcVDjB1Zk8Nic31/SW/tIAx
         F8+g==
X-Gm-Message-State: AFq9FYJz2UUV7T9m03twpJcl4nTXFxRMuii25ZX5mdOgfsTD6hwMa6IH
	DALT4WcT+DliChS/clPUPVfrWU8vdSdg42NOAvPgVCRNuawj7Cp3ZOI=
X-Gm-Gg: AYBFou1WrzwcERGm0XvE+LQuGJjIzKDHR0vHHS6N+iF9MboEzlrhKi24O9HpR1epeR1
	vMbwiUqXc+R4l4CqcKt7putNgsYmV6uLmsfBNEOIvvrijSRpfad8KWeC0eEZPhKgq7B6I9Axgbp
	sDOQJhzsZ7+7mnV9WU/tlTOqK7egwn7mf5Q0cn78BIFLPX6Nmt8MvOJMjhm5EOYdN1K3eTY7h7e
	+R8x1gRkL0Rt1SEN8rBGCEOU/+VFi8JmV+KD2xLwXRwCTcmQWB5m6TKiH6E6I2fbrmZlP+qw3wM
	2jDPG5tF8rOCaY+9vo+sRCnoSOLbbKd6lK7QdrgBw09u4b07lArq3aXfPReFelMjsfvSkCLtRy4
	GpNcxBx1nSofowqpFLOpFVVMLXC30bFRJnUoqjcn0ohyJw5XXqXNnh0bc1S1rYVi7V3pLzvUPKb
	RYdjEnnqLf7WHPFl2C4Acwn8DHoQPiX+eA0fuQuZKdYYymshZHI82q7FKMBr6e2DRwSHBFV/s9E
	Nu3iJ4fU9XB0vaCqiQGRWo9JjWbDogt+jy3OowEq1YDI8kz5DS8AGHpB8PaY0XCt7bBVctTCtf+
	Mux0ka741HqglTd1ymYOlNUfdhg8XQ==
X-Received: by 2002:ad4:574a:0:b0:919:871e:57dd with SMTP id 6a1803df08f44-91b557c3bb3mr321876186d6.44.1792036161628;
        Wed, 14 Oct 2026 20:49:21 -0700 (PDT)
Received: from i4-gl-tmk5904-1.ad.psu.edu ([130.203.156.90])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91b97b3864dsm70540626d6.14.2026.10.14.20.49.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 20:49:20 -0700 (PDT)
From: Myeonghun Pak <mhun512@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ijae Kim <ae878000@gmail.com>,
	Vasileios Almpanis <vasilisalmpanis@gmail.com>
Subject: [PATCH 2/4] usb: gadget: pch_udc: initialize DMA before registering interrupt sources
Date: Wed, 14 Oct 2026 23:49:14 -0400
Message-ID: <20261015034916.2773248-3-mhun512@gmail.com>
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

VBUS GPIO work can reconnect the controller before probe has
allocated its EP0 descriptors. Initialize the lock, endpoint state
and DMA resources before registering either interrupt source.
Keep PCI bus mastering disabled until the PCI IRQ is registered.

This issue was identified as part of our ongoing research while
reviewing kernel code.

Fixes: 637b78eb31e0 ("usb: gadget: pch_udc: Detecting VBUS through GPIO with interrupt")
Assisted-by: LLM
Co-developed-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
---
Compile-tested only.

 drivers/usb/gadget/udc/pch_udc.c | 28 +++++++++-------------------
 1 file changed, 9 insertions(+), 19 deletions(-)

diff --git a/drivers/usb/gadget/udc/pch_udc.c b/drivers/usb/gadget/udc/pch_udc.c
index 3b5c5c41c38c..c360bc556cdc 100644
--- a/drivers/usb/gadget/udc/pch_udc.c
+++ b/drivers/usb/gadget/udc/pch_udc.c
@@ -2819,25 +2819,14 @@ static void pch_udc_pcd_reinit(struct pch_udc_dev *dev)
 /**
  * pch_udc_pcd_init() - This API initializes the driver structure
  * @dev:	Reference to the driver structure
- *
- * Return codes:
- *	0:		Success
- *	-ERRNO:		All kind of errors when retrieving VBUS GPIO
  */
-static int pch_udc_pcd_init(struct pch_udc_dev *dev)
+static void pch_udc_pcd_init(struct pch_udc_dev *dev)
 {
-	int ret;
-
 	pch_udc_init(dev);
 	pch_udc_pcd_reinit(dev);
 
 	INIT_WORK(&dev->vbus_gpio.irq_work_fall, pch_vbus_gpio_work_fall);
 	INIT_WORK(&dev->vbus_gpio.irq_work_rise, pch_vbus_gpio_work_rise);
-
-	ret = pch_vbus_gpio_init(dev);
-	if (ret)
-		pch_udc_exit(dev);
-	return ret;
 }
 
 /**
@@ -3082,10 +3071,15 @@ static int pch_udc_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 
 	dev->base_addr = pcim_iomap_table(pdev)[dev->bar];
 
+	spin_lock_init(&dev->lock);
+	dev->gadget.ops = &pch_udc_ops;
+
 	/* initialize the hardware */
-	retval = pch_udc_pcd_init(dev);
+	pch_udc_pcd_init(dev);
+
+	retval = init_dma_pools(dev);
 	if (retval)
-		return retval;
+		goto finished;
 
 	pci_enable_msi(pdev);
 
@@ -3102,11 +3096,7 @@ static int pch_udc_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 	pci_set_master(pdev);
 	pci_try_set_mwi(pdev);
 
-	/* device struct setup */
-	spin_lock_init(&dev->lock);
-	dev->gadget.ops = &pch_udc_ops;
-
-	retval = init_dma_pools(dev);
+	retval = pch_vbus_gpio_init(dev);
 	if (retval)
 		goto finished;
 

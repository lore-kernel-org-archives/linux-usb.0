Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFF232E5B2D
	for <linux-usb@vger.kernel.org>; Mon,  8 Jun 2026 08:20:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780906812; cv=none; b=H0qcNKuSaDkDEY2qj8M+XRyUtAOX4v04x0fcRe3Bq9aDV46b8N5Tajio6TQakgNEyvZM8XYnI1k4IN09PqFD1ChTPe6DJuzQg/z28nSC51e1/RJPqm7qhH9CCkQKWXlxFa1J8gEQ/6oFvG2ANVUXjs0lqtdQviw+T+Jq68+wQuE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780906812; c=relaxed/simple;
	bh=PuUpW8VAfH86IoYd5Si32XGflm9Drp+C687w7ly7Sug=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=i3Ek2J2DcIA/ncRsBHGCgRy7Ewa1dKCRlqIMIaxnyMjIMpfYHVUwO1FPFeCX6Mo0D6ongvpCtClvN7chs/RBdfs3s1A+4aHa2aJ05QycKQ+4UxcsC0B8RM9QtV3O/5JPATnw8OIcrPDTPqrL0pZsWmQa58nw+2Jb46IuJyBXxKo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZS7SByb8; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZS7SByb8"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2bf237e1433so46189055ad.1
        for <linux-usb@vger.kernel.org>; Mon, 08 Jun 2026 01:20:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780906805; x=1781511605; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QaxSxNePW62N/aLYNU2ICZZcrY71w9JpJK96h4Ml418=;
        b=ZS7SByb8AOgCEG2IXbVOLn4vWo3Kzml6Z6j6mwUHzCHqu2hdbtoMlVz/pgrGTOMrLt
         hBOtf5WoE2BBNL9S4FBRhko8w+9aLtDSILVJkQOHcnRJ6S9APynwV3fzEY9O+uAWJhkh
         og7cOTbM706GKAmPniHibRwtqJhLk6EdVJvDJBJ9PGxGvyKBBdrR4Vtna5aNZA8qNFUt
         Z9aG53QmRVHi2pbuV6qQqmyVRzKVuDxfwQOKNz/GJV5If8dJ3j9caZctd9z0r9wqU6ZB
         lGfL/QGti3uo0h54q0FQModefVRC7PJUoKqMmWk5Z2SqTkEFgaV7F6A+xv4JXARWfPfg
         0YUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780906805; x=1781511605;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QaxSxNePW62N/aLYNU2ICZZcrY71w9JpJK96h4Ml418=;
        b=qzvLQAlHLZQHs4+4P6WESDh+BGeaskoeIRb3ADghcbvxp4fVhVAgTYoHezZWtONn2n
         87bpSkN9LIv2iWhOvxnBMnmOSa8sUwA3ylXhpEtiKgo/s4V1PERgsX5/3GED75xcqlVa
         FDMuhFPNKK7iPAwKgGTupU1k5HSTcqh/R03rnSutzSXSyNKPN0iiDeHhg6XqyRrM347k
         2MjSvlSSyba/wQPirPLcqUXxM87ZPuoVCmgWdYffY0NbKqKrnfHoWZEjSzEFpSUZ30aS
         Re+lp5s4QFppoSGZpl1Xjx0arAo/W/R74KuK3i81Ak2tvdFX87/G2+w93ORltMqXT5mt
         ywlQ==
X-Forwarded-Encrypted: i=1; AFNElJ/eGJ9GI6sGXTEq5X+vAirEfdL2lq1xeQoW+iEZu7Y9dXSbzLKRZJi+s2cgvatELy+1tMiwq/05GKw=@vger.kernel.org
X-Gm-Message-State: AOJu0YxVVJ8JwbphUJKN9UYCQ/lmpBLleS0sw/L8hDtbCugRQXfPrUUj
	Fn6kVbYGwoiTir/ZaJmyUFScgIzctmvZ8wlV2Ok8+zufi4HV5yyYv52G
X-Gm-Gg: Acq92OGPpnX9gkTAxw++meqCfFAtktD8aNteqQiGCid2OXo+lt4NB4kQzZlbouRhl1n
	I/iZfaPHDYRdPHB9zOd7iy2ZndxIN6raYKYF4cjn5106RDS0DNj3Xr+l0V6EBSo+Ta1AJFkFAnl
	pde15c1AM/spuXuGBxNNDnFQHebV8tWuD4Jl4WEccoYbQ/SwNi0C/EHBdDwdtefq3zOyvCZuxBv
	9Q36rjgt+BsZSLhDg+Y7637Vb7JKIxX6V/AtA1Wqza5PgHXRp5hBC2stTtw1HpOXkid4evZv37R
	zK9AYht5qJVV7sfQCTFfFTl9lUIN3ftrFmNzT/aT1309hz4aNUCI0b+QvjN4/OVpBbFFaeWI6dz
	LdTv3fsDjV0ok6DYW9dAtJVsaDXIbf+6KWL5e8DUC0K5QOUmPtU76i6DTukLmceMRguI6XDKDFZ
	vkW+TbFOANlRxURxFv00Y+pBdMAOvugWVGE2H7k+LtlVHHvSZ6NJpa
X-Received: by 2002:a17:903:3c48:b0:2c0:eee2:fc40 with SMTP id d9443c01a7336-2c1e80cede0mr162261145ad.3.1780906804922;
        Mon, 08 Jun 2026 01:20:04 -0700 (PDT)
Received: from haichao.tail057a43.ts.net ([2001:da8:e000:1206:9a2:954d:67fe:d9c2])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164fa3a5fsm183050945ad.36.2026.06.08.01.20.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 01:20:04 -0700 (PDT)
From: Ruoyu Wang <ruoyuw560@gmail.com>
To: Neal Liu <neal_liu@aspeedtech.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	linux-aspeed@lists.ozlabs.org,
	linux-usb@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Ruoyu Wang <ruoyuw560@gmail.com>
Subject: [PATCH] usb: gadget: aspeed_udc: check endpoint DMA allocation
Date: Mon,  8 Jun 2026 16:19:48 +0800
Message-ID: <20260608081948.3-1-ruoyuw560@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

ast_udc_probe() allocates a coherent DMA buffer used as the backing store
for endpoint buffers. ast_udc_init_ep() derives per-endpoint buffer
pointers from udc->ep0_buf, so a failed allocation is dereferenced during
probe.

Check the allocation before endpoint setup. The existing probe error path
called ast_udc_remove(), which unregisters the gadget unconditionally and
is not safe before usb_add_gadget_udc() succeeds. Add a local cleanup
helper for probe failures so pre-registration failures only unwind the
resources that were actually initialized.

This was found by a local static analysis checker for unchecked allocator
returns while scanning Linux 6.16. The change was checked by applying it
to current mainline and by running checkpatch. I do not have access to
Aspeed UDC hardware, so no runtime testing was performed.

Fixes: 055276c13205 ("usb: gadget: add Aspeed ast2600 udc driver")
Signed-off-by: Ruoyu Wang <ruoyuw560@gmail.com>
---
Note: a 2022 patch attempted to add only a NULL check for this
allocation:
https://lore.kernel.org/all/20221213025120.23149-1-jiasheng@iscas.ac.cn/

This version also fixes the probe unwind path so the clock is disabled
on allocation failure and usb_del_gadget_udc() is not called before the
gadget has been registered.

diff --git a/drivers/usb/gadget/udc/aspeed_udc.c b/drivers/usb/gadget/udc/aspeed_udc.c
index 7fc6696b7..809a7d5b7 100644
--- a/drivers/usb/gadget/udc/aspeed_udc.c
+++ b/drivers/usb/gadget/udc/aspeed_udc.c
@@ -1434,11 +1434,34 @@ static void ast_udc_init_hw(struct ast_udc_dev *udc)
 	ast_udc_write(udc, 0, AST_UDC_EP0_CTRL);
 }
 
+static void ast_udc_cleanup(struct platform_device *pdev)
+{
+	struct ast_udc_dev *udc = platform_get_drvdata(pdev);
+	unsigned long flags;
+	u32 ctrl;
+
+	spin_lock_irqsave(&udc->lock, flags);
+
+	/* Disable upstream port connection */
+	ctrl = ast_udc_read(udc, AST_UDC_FUNC_CTRL) & ~USB_UPSTREAM_EN;
+	ast_udc_write(udc, ctrl, AST_UDC_FUNC_CTRL);
+
+	clk_disable_unprepare(udc->clk);
+
+	spin_unlock_irqrestore(&udc->lock, flags);
+
+	if (udc->ep0_buf)
+		dma_free_coherent(&pdev->dev,
+				  AST_UDC_EP_DMA_SIZE * AST_UDC_NUM_ENDPOINTS,
+				  udc->ep0_buf,
+				  udc->ep0_buf_dma);
+
+	udc->ep0_buf = NULL;
+}
+
 static void ast_udc_remove(struct platform_device *pdev)
 {
 	struct ast_udc_dev *udc = platform_get_drvdata(pdev);
-	unsigned long flags;
-	u32 ctrl;
 
 	usb_del_gadget_udc(&udc->gadget);
 	if (udc->driver) {
@@ -1453,23 +1476,7 @@ static void ast_udc_remove(struct platform_device *pdev)
 		return;
 	}
 
-	spin_lock_irqsave(&udc->lock, flags);
-
-	/* Disable upstream port connection */
-	ctrl = ast_udc_read(udc, AST_UDC_FUNC_CTRL) & ~USB_UPSTREAM_EN;
-	ast_udc_write(udc, ctrl, AST_UDC_FUNC_CTRL);
-
-	clk_disable_unprepare(udc->clk);
-
-	spin_unlock_irqrestore(&udc->lock, flags);
-
-	if (udc->ep0_buf)
-		dma_free_coherent(&pdev->dev,
-				  AST_UDC_EP_DMA_SIZE * AST_UDC_NUM_ENDPOINTS,
-				  udc->ep0_buf,
-				  udc->ep0_buf_dma);
-
-	udc->ep0_buf = NULL;
+	ast_udc_cleanup(pdev);
 }
 
 static int ast_udc_probe(struct platform_device *pdev)
@@ -1523,6 +1530,10 @@ static int ast_udc_probe(struct platform_device *pdev)
 					  AST_UDC_EP_DMA_SIZE *
 					  AST_UDC_NUM_ENDPOINTS,
 					  &udc->ep0_buf_dma, GFP_KERNEL);
+	if (!udc->ep0_buf) {
+		rc = -ENOMEM;
+		goto err_disable_clk;
+	}
 
 	udc->gadget.speed = USB_SPEED_UNKNOWN;
 	udc->gadget.max_speed = USB_SPEED_HIGH;
@@ -1553,20 +1564,20 @@ static int ast_udc_probe(struct platform_device *pdev)
 	udc->irq = platform_get_irq(pdev, 0);
 	if (udc->irq < 0) {
 		rc = udc->irq;
-		goto err;
+		goto err_cleanup;
 	}
 
 	rc = devm_request_irq(&pdev->dev, udc->irq, ast_udc_isr, 0,
 			      KBUILD_MODNAME, udc);
 	if (rc) {
 		dev_err(&pdev->dev, "Failed to request interrupt\n");
-		goto err;
+		goto err_cleanup;
 	}
 
 	rc = usb_add_gadget_udc(&pdev->dev, &udc->gadget);
 	if (rc) {
 		dev_err(&pdev->dev, "Failed to add gadget udc\n");
-		goto err;
+		goto err_cleanup;
 	}
 
 	dev_info(&pdev->dev, "Initialized udc in USB%s mode\n",
@@ -1574,9 +1585,14 @@ static int ast_udc_probe(struct platform_device *pdev)
 
 	return 0;
 
+err_disable_clk:
+	clk_disable_unprepare(udc->clk);
+	goto err;
+err_cleanup:
+	ast_udc_cleanup(pdev);
+	goto err;
 err:
 	dev_err(&pdev->dev, "Failed to udc probe, rc:0x%x\n", rc);
-	ast_udc_remove(pdev);
 
 	return rc;
 }

-- 
2.51.0

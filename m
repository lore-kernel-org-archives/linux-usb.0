Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 441EF403AEE
	for <linux-usb@vger.kernel.org>; Wed, 10 Jun 2026 12:10:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781093432; cv=none; b=Ofu4reXT2/67byXTfcNFJM77fTU0N9B8sgo6w0a+fdkW0H/QBf/Bic//+AIVsylLn4xpvYSLgGTlyHcuPXAf86ZmMkR84cOpjuW74NvlEfL9w/7q5shGUbCAMAepTdedtgZoje67gnJFglV31lph0mdXLN23Ob5hrtUaa8XMxIE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781093432; c=relaxed/simple;
	bh=H5iTCtohKf0FpIElDEr16LF8OYvmehxN83WChl7dLzY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=A4blOaBaalNofhhCQT4rOrueYv9ax4doce/B5CfQrynGuNePpINzMttRItmyMdjrssxjX4YMusWYhgYql/1VUkx0CcIlCLwHd8ee61gVHl29zIYWoMVRZmjKhsOknmRZ8hEwedRKA1q8InQtVPGhgjvtbQbrdnbuCGJmIGrRKSM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ji5ju26j; arc=none smtp.client-ip=209.85.215.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ji5ju26j"
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-c858cc9870aso3329485a12.0
        for <linux-usb@vger.kernel.org>; Wed, 10 Jun 2026 05:10:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781093430; x=1781698230; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Bn0e0V+HEIAY5dAJYzbVBmSmbmUkCyWOZZSIYcy0Q78=;
        b=ji5ju26jnNNjLZmq4i6vCP2LL/Qf83VqUMwaRCU9NXJYmfTsG9TenrIUW4R5gAMnVo
         XbKp/sTk8/J4umCjP3S66CqR5xhqnToZh4tJCvMTBsbz5UGhVvVrLY2ro9UGbBRzxZWL
         sbTkToz256L32iNcxxyHLEvK1Xfzz91g2/mKVklVE837yt61yCf0XuEu7XhKdCVwyPui
         GgRSIjS9TM2M2/VoEAkLRnl9XnpA8XPOn7ZNEMmr2IlOuKL4aWyYsvq/azcdtHzssBDn
         SYNYI3FhXoVpRFK8rCqBDRmerW/1yuj+fPuCdYRdnkk6YctxtFiFQZL0VOC85m/0aqR0
         xHEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781093430; x=1781698230;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Bn0e0V+HEIAY5dAJYzbVBmSmbmUkCyWOZZSIYcy0Q78=;
        b=dKIn6iJm0BZHyuZeUvHwdg7gb7XzLjiorvyD8WvR2euICwMETt7XUUUeOHhGU7l0N/
         cGZEI8F7TqsNLnqosrCuI6avywPPaAh88E69RjK2cBYIQORMe85F0h1bacIAuDWIjjnb
         FttnPR2j5dLf8H1S5E8wz0ksZfyx9HBcXHjUrRS2ta9JgqtYTZZmeJFzH6RgPRZKOa8B
         z5GK3gzEgZqN4keSOkjuBkrEEnUmsKaDDQy7oDSDSjppr98fqqXEPVn2MAhGR8CfvPDp
         Ltm3f1xHIn1EJkNhHVRynaUjHii2xqo02LDBVYN8EJ0ZXM5zjkTJJKjZIk/ZzdRKuZW0
         w8bg==
X-Forwarded-Encrypted: i=1; AFNElJ/xmclZH7q/t0FQCehzz7Ew23k8clLj7I4t49bokw2P7kBjaTZfuTTwsrsA1A0IiEbHnSF2i2XeV/E=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywdz6lZNF3FQISbeqfOg3T7x/jggKfz7bm7WXEHbWdGujEplcIS
	a8vV+8tg5znd0TbPPGKHHurqYL0KC6MbZ8lqgHGdc5f4L+HGOQ5bb/tG
X-Gm-Gg: Acq92OHWzQBavIdCOFfqPwq2RqYKQPqxj8VV0s+oJeTiAtA3QLj/qEtVguoBhwcN6RP
	zfWQI52qyH327tmPokyV0YggrQS3fFvvctneZKfXFBLNLYqvIX/95P8NuQ+d03umtZrJvocS1Aj
	+s5BcEPB3ynoNPe5ayOPEXxyJJItd6S19vxuCZ9fbmL0nUupK78IpT2W6PwNo3zcjJYhCKkurH8
	F3y6IiyL0kcQK1vYUp9ogM4pnOKeX3Rv1K/1dg5gCl0sRZvK+6tByOTnG8YvHd0A/aOfCHCN2xh
	wfxyadATTQ/NFJSjftxI1+SlsfVzsbbi7pEk4xKuTKPRmERYxfDO+MUu38gBxGEfd//EyjIJjc0
	PNCumO/KAu4D9w1fTYP7aqt6zgKRyOtYbseb8xFKcMxNFARLiCuBawB/JzmAqeieHYEaA7uFpIK
	8e5s/pjgsFDegP2H5avjQt3i5YLMZocuOe1ZuP9I0B2yxWfSskwrqBAg==
X-Received: by 2002:a05:6a21:7e89:b0:3b5:530d:d980 with SMTP id adf61e73a8af0-3b5530e0518mr2279602637.20.1781093430459;
        Wed, 10 Jun 2026 05:10:30 -0700 (PDT)
Received: from haichao.tail057a43.ts.net ([2001:da8:e000:1206:b72a:532f:bb14:101c])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c85df0a4afdsm24704308a12.19.2026.06.10.05.10.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 05:10:29 -0700 (PDT)
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
Subject: [PATCH v2] usb: gadget: aspeed_udc: check endpoint DMA allocation
Date: Wed, 10 Jun 2026 20:10:22 +0800
Message-ID: <20260610121022.3-1-ruoyuw560@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260608081948.3-1-ruoyuw560@gmail.com>
References: <20260608081948.3-1-ruoyuw560@gmail.com>
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

v1:
https://lore.kernel.org/all/20260608081948.3-1-ruoyuw560@gmail.com/

Changes in v2:
- Simplify the allocation-failure cleanup path as suggested by Andrew
  Jeffery: disable the clock in the allocation-failure branch and let
  err_cleanup fall through to err.

diff --git a/drivers/usb/gadget/udc/aspeed_udc.c b/drivers/usb/gadget/udc/aspeed_udc.c
--- a/drivers/usb/gadget/udc/aspeed_udc.c
+++ b/drivers/usb/gadget/udc/aspeed_udc.c
@@ -1434,25 +1434,12 @@ static void ast_udc_init_hw(struct ast_u
 	ast_udc_write(udc, 0, AST_UDC_EP0_CTRL);
 }
 
-static void ast_udc_remove(struct platform_device *pdev)
+static void ast_udc_cleanup(struct platform_device *pdev)
 {
 	struct ast_udc_dev *udc = platform_get_drvdata(pdev);
 	unsigned long flags;
 	u32 ctrl;
 
-	usb_del_gadget_udc(&udc->gadget);
-	if (udc->driver) {
-		/*
-		 * This is broken as only some cleanup is skipped, *udev is
-		 * freed and the register mapping goes away. Any further usage
-		 * probably crashes. Also the device is unbound, so the skipped
-		 * cleanup is never catched up later.
-		 */
-		dev_alert(&pdev->dev,
-			  "Driver is busy and still going away. Fasten your seat belts!\n");
-		return;
-	}
-
 	spin_lock_irqsave(&udc->lock, flags);
 
 	/* Disable upstream port connection */
@@ -1472,6 +1459,26 @@ static void ast_udc_remove(struct platfo
 	udc->ep0_buf = NULL;
 }
 
+static void ast_udc_remove(struct platform_device *pdev)
+{
+	struct ast_udc_dev *udc = platform_get_drvdata(pdev);
+
+	usb_del_gadget_udc(&udc->gadget);
+	if (udc->driver) {
+		/*
+		 * This is broken as only some cleanup is skipped, *udev is
+		 * freed and the register mapping goes away. Any further usage
+		 * probably crashes. Also the device is unbound, so the skipped
+		 * cleanup is never catched up later.
+		 */
+		dev_alert(&pdev->dev,
+			  "Driver is busy and still going away. Fasten your seat belts!\n");
+		return;
+	}
+
+	ast_udc_cleanup(pdev);
+}
+
 static int ast_udc_probe(struct platform_device *pdev)
 {
 	enum usb_device_speed max_speed;
@@ -1524,6 +1531,12 @@ static int ast_udc_probe(struct platform
 					  AST_UDC_NUM_ENDPOINTS,
 					  &udc->ep0_buf_dma, GFP_KERNEL);
 
+	if (!udc->ep0_buf) {
+		clk_disable_unprepare(udc->clk);
+		rc = -ENOMEM;
+		goto err;
+	}
+
 	udc->gadget.speed = USB_SPEED_UNKNOWN;
 	udc->gadget.max_speed = USB_SPEED_HIGH;
 	udc->creq = udc->reg + AST_UDC_SETUP0;
@@ -1553,20 +1566,20 @@ static int ast_udc_probe(struct platform
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
@@ -1574,9 +1587,10 @@ static int ast_udc_probe(struct platform
 
 	return 0;
 
+err_cleanup:
+	ast_udc_cleanup(pdev);
 err:
 	dev_err(&pdev->dev, "Failed to udc probe, rc:0x%x\n", rc);
-	ast_udc_remove(pdev);
 
 	return rc;
 }

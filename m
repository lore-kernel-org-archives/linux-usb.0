Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BFF823ABB9;
	Mon, 22 Jun 2026 14:07:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782137251; cv=none; b=Uti8wXgLM4p4WWxyxgqJeU3glp/qnDSygRJw2uC52sysTQTW6+zJ+2KHpepQQ4uGdFfuSvqwwDLrdcDjxVmM7GYWmlC6lhIR1aLW1x7/l2Nn8nIz9hwlC+h9bvOnEZ60Wgmcj+2hX/R1im0eqU2Kh1mJX/NZ72R7mI3xThJKvxM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782137251; c=relaxed/simple;
	bh=viFzoXEhqD4wE7g35eEWpBkH+3wUmqBnRBbIPxGnUbc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=ADzGhysQHp6l1UzGXR56laAhGbaCxMyrlaGlmtnxFDzTbVqJJvdUys49pumE6mfIm/r7ey4XIVGgvVkTqeEzxYUZhkRqE/LNYh442NA6BnzMEJiXRIaCW/zSm1nGt+XwZbac6IM0W1iacJFnd2c775e9VoHboHEXyHXW5vWKJSE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=fyGBsOne; arc=none smtp.client-ip=220.197.31.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="fyGBsOne"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=Ne
	9oVkkKGKByPKqwL6AgLPGgyFLjAI/Z/ko7vMydqc0=; b=fyGBsOne++o2fYHA27
	5uE1Fvrz6apy85Hse2OxwyWPKGxEIbpP98N7GyS9YWZJCrFhQ5L4WcPR4oq0nlUy
	GuXCi/9ehcpjyxuYDbyABJE5eHcQOoIH7tvpKRcFpg2QW18NTqIlISEZIS2xfOoH
	VQ0IxDrLdd6jz8f/SdaIV6IVY=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g0-3 (Coremail) with SMTP id _____wBHxF1TQTlq9u2HFA--.33214S2;
	Mon, 22 Jun 2026 22:06:13 +0800 (CST)
From: Haoxiang Li <haoxiang_li2024@163.com>
To: gregkh@linuxfoundation.org,
	kees@kernel.org,
	balbi@ti.com,
	sebastian@breakpoint.cc
Cc: linux-usb@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	Haoxiang Li <haoxiang_li2024@163.com>,
	stable@kernel.org
Subject: [PATCH] usb: gadget: fsl_qe_udc: fix gadget lifetime on registration failure
Date: Mon, 22 Jun 2026 22:06:10 +0800
Message-Id: <20260622140610.1140558-1-haoxiang_li2024@163.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wBHxF1TQTlq9u2HFA--.33214S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxZw13tr4fXrWxGryUXw43KFg_yoW5ZFWxpF
	WkGayUGrWUArWqya17Aw1kZF1Fyws2yryS9rWxKFWSv3WrX34xX34UtF1SgF48ZFWkJF4j
	qa1DK3WrGrWkurDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0piKLvJUUUUU=
X-CM-SenderInfo: xkdr5xpdqjszblsqjki6rwjhhfrp/xtbCxRVOvGo5QVUm6wAA3o

usb_add_gadget_udc_release() drops the gadget device reference when
registration fails. This invokes qe_udc_release() while qe_udc_probe()
is still unwinding. Since udc->done is not initialized during probe,
the release callback dereferences NULL in complete(). It also frees
the qe_udc object before the remaining probe cleanup accesses it,
resulting in use-after-free and double-free risks.

Initialize the gadget device explicitly and register it with
usb_add_gadget(), which leaves the gadget reference owned by the
driver on failure. Unwind the IRQ, DMA mappings, endpoint resources
and registers before dropping that reference with usb_put_gadget().
Make the completion notification conditional because it is only
installed by the remove path.

Similarly, use usb_del_gadget() during removal so the final gadget
reference remains held while the controller resources are released.
Set the completion pointer immediately before dropping the reference,
then wait for the release callback to finish.

Fixes: d77c1198666d ("usb: gadget: fsl_qe_udc: convert to new style start/stop")
Cc: stable@kernel.org
Signed-off-by: Haoxiang Li <haoxiang_li2024@163.com>
---
 drivers/usb/gadget/udc/fsl_qe_udc.c | 17 +++++++++++------
 1 file changed, 11 insertions(+), 6 deletions(-)

diff --git a/drivers/usb/gadget/udc/fsl_qe_udc.c b/drivers/usb/gadget/udc/fsl_qe_udc.c
index bf87285ad13c..f9a59b32e272 100644
--- a/drivers/usb/gadget/udc/fsl_qe_udc.c
+++ b/drivers/usb/gadget/udc/fsl_qe_udc.c
@@ -2459,7 +2459,9 @@ static void qe_udc_release(struct device *dev)
 	struct qe_udc *udc = container_of(dev, struct qe_udc, gadget.dev);
 	int i;
 
-	complete(udc->done);
+	if (udc->done)
+		complete(udc->done);
+
 	cpm_muram_free(cpm_muram_offset(udc->ep_param[0]));
 	for (i = 0; i < USB_MAX_ENDPOINTS; i++)
 		udc->ep_param[i] = NULL;
@@ -2489,6 +2491,9 @@ static int qe_udc_probe(struct platform_device *ofdev)
 		return -ENOMEM;
 	}
 
+	usb_initialize_gadget(&ofdev->dev, &udc->gadget,
+						qe_udc_release);
+
 	udc->soc_type = (unsigned long)device_get_match_data(&ofdev->dev);
 	udc->usb_regs = of_iomap(np, 0);
 	if (!udc->usb_regs) {
@@ -2575,8 +2580,7 @@ static int qe_udc_probe(struct platform_device *ofdev)
 		goto err4;
 	}
 
-	ret = usb_add_gadget_udc_release(&ofdev->dev, &udc->gadget,
-			qe_udc_release);
+	ret = usb_add_gadget(&udc->gadget);
 	if (ret)
 		goto err5;
 
@@ -2610,7 +2614,7 @@ static int qe_udc_probe(struct platform_device *ofdev)
 err2:
 	iounmap(udc->usb_regs);
 err1:
-	kfree(udc);
+	usb_put_gadget(&udc->gadget);
 	return ret;
 }
 
@@ -2633,9 +2637,8 @@ static void qe_udc_remove(struct platform_device *ofdev)
 	unsigned int size;
 	DECLARE_COMPLETION_ONSTACK(done);
 
-	usb_del_gadget_udc(&udc->gadget);
+	usb_del_gadget(&udc->gadget);
 
-	udc->done = &done;
 	tasklet_disable(&udc->rx_tasklet);
 
 	if (udc->nullmap) {
@@ -2675,6 +2678,8 @@ static void qe_udc_remove(struct platform_device *ofdev)
 
 	iounmap(udc->usb_regs);
 
+	udc->done = &done;
+	usb_put_gadget(&udc->gadget);
 	/* wait for release() of gadget.dev to free udc */
 	wait_for_completion(&done);
 }
-- 
2.25.1


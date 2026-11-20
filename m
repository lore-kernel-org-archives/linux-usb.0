Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=45.254.49.197
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795196126;
	b=sAHGxYMbMt7x1c818wv/WFdn2+o2LdzeQaOgixvkdiEKR41EAV2MZjLdmJJjIrMV+w1j
	 eQaV43pcoke2we8ZfSAW7QYQPVNxAVi+87CzPaqcKgwi/yYCPRuI2gVxSIq4WVvbxnru6
	 hv6sCpRrjzlkGZxgPO0vQMg3+kZ231gmIVnkevh8r631d8mEwCwpBJNezrjFaEqGHAIjW
	 Ufe7cpMOn+L1XIS+UQubXo/PWnltGBaWQDPeQjkFCXmWlqwqjJlZb/1ynw/RYWVQV4tjL
	 jsS1o6oCSgsPC0gPPiRfjig2B760QA960vPRjaI45/LVRAcx7E7uNFgzePDtUY9wGiw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795196126;
	h=DMARC-Filter:Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-HM-Tid:
	 X-HM-MType:X-HM-Spam-Status:DKIM-Signature;
	bh=aVKgpEyo9X12gkovEYR8f+Svm2jMfgCmmkB0xhM4oxE=;
	b=Ul0Aqu4lRL2HQ7kTSB4ae+bhjQT2lAjmktpXuJJgX5kiBJE007fJOlmlkyKIcSj5Fy68
	 HDgj3uGh8fP2RCymd7vpNzeY3KXo8dvO+rzFQoZHlwlgShbVnk4Y8z4MIMvSCC6QIJR6w
	 HwpYk/cR5ruV2c/IF8qoCDU1z292GQrf3C09lgVOlyFexoyymWlFd+aIcuCwuJX5J2YFy
	 /DDRkH9Sn0b2BrrENZFBIGbOI8PdfOU2DFbFkvJxaoiLoSsjiYo+QaT4hLcROz2lmrU+P
	 qrpEJDXlOyIyOuKMJTDFAvHAkts7T0zu9ymWXCyoXe3j2kwvZx83Qa+J8WxAMSfztiQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mail.sdu.edu.cn;
	spf=pass smtp.mailfrom=mail.sdu.edu.cn;
	dkim=pass header.d=mail.sdu.edu.cn header.i=@mail.sdu.edu.cn header.a=rsa-sha256 header.s=default header.b=fnrZNxgr;
	arc=none smtp.remote-ip=45.254.49.197
Received: from mail-m49197.qiye.163.com (mail-m49197.qiye.163.com [45.254.49.197])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B1FE60A2612;
	Fri, 20 Nov 2026 17:35:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6B1FE60A2612
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mail.sdu.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mail.sdu.edu.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mail.sdu.edu.cn header.i=@mail.sdu.edu.cn header.a=rsa-sha256 header.s=default header.b=fnrZNxgr
Received: from lgs.. (unknown [101.76.249.61])
	by smtp.qiye.163.com (Hmail) with ESMTP id 5573c0aba;
	Sat, 21 Nov 2026 01:35:14 +0800 (GMT+08:00)
From: Guangshuo Li <liguangshuo@mail.sdu.edu.cn>
To: Neill Kapron <nkapron@google.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] usb: gadget: max3420: Fix potential thread leak on probe failure
Date: Sat, 21 Nov 2026 01:35:11 +0800
Message-ID: <20261120173512.3923833-1-liguangshuo@mail.sdu.edu.cn>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0aa1fa06d5b203a1kunmc09e1856238b6e
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVkZHkgeVk9OHkpPQh9OHh4ZSlYeHw
	5VEwETFhoSFyQUDg9ZV1kYEgtZQVlKS0pVTE1VSU9CVU1KWVdZFhoPEhUdFFlBWU9LSFVKS0lCQ0
	NMVUpLS1VLWQY+
DKIM-Signature: a=rsa-sha256;
	b=fnrZNxgrIDgw3+du3UGMEqI6BnJblMSFl6ZT8s4jIBDAThC0oEvQdv5xA+azzM/4SToqC23spkLj0WGPfT7mgW0ixvozhD3laW2uSYNUnCnrKNq7FkrzmEOkOV4ZcpsGHfHzR5k6uu+uvKEsODSkpzciJGfxHZjdZCa7ZZqP+1U=; c=relaxed/relaxed; s=default; d=mail.sdu.edu.cn; v=1;
	bh=aVKgpEyo9X12gkovEYR8f+Svm2jMfgCmmkB0xhM4oxE=;
	h=date:mime-version:subject:message-id:from;

If requesting the VBUS interrupt fails, probe unregisters the gadget
but leaves the already created thread behind. Managed cleanup then
releases the state referenced by the thread.

Unregister the gadget, disable and synchronize the UDC interrupt, then
stop the thread before returning the probe error.

This issue was found by our static analysis tool under development.

Fixes: 48ba02b2e2b1 ("usb: gadget: add udc driver for max3420")
Signed-off-by: Guangshuo Li <liguangshuo@mail.sdu.edu.cn>
---
 drivers/usb/gadget/udc/max3420_udc.c | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/gadget/udc/max3420_udc.c b/drivers/usb/gadget/udc/max3420_udc.c
index 11fd61cba5af..84309229216b 100644
--- a/drivers/usb/gadget/udc/max3420_udc.c
+++ b/drivers/usb/gadget/udc/max3420_udc.c
@@ -1198,7 +1198,7 @@ static void max3420_eps_init(struct max3420_udc *udc)
 static int max3420_probe(struct spi_device *spi)
 {
 	struct max3420_udc *udc;
-	int err, irq;
+	int err, irq, udc_irq;
 	u8 reg[8];
 
 	if (spi->controller->flags & SPI_CONTROLLER_HALF_DUPLEX) {
@@ -1252,8 +1252,8 @@ static int max3420_probe(struct spi_device *spi)
 
 	spi_set_drvdata(spi, udc);
 
-	irq = of_irq_get_byname(spi->dev.of_node, "udc");
-	err = devm_request_irq(&spi->dev, irq, max3420_irq_handler, 0,
+	udc_irq = of_irq_get_byname(spi->dev.of_node, "udc");
+	err = devm_request_irq(&spi->dev, udc_irq, max3420_irq_handler, 0,
 			       "max3420", udc);
 	if (err < 0)
 		goto del_gadget;
@@ -1283,11 +1283,17 @@ static int max3420_probe(struct spi_device *spi)
 		err = devm_request_irq(&spi->dev, irq,
 				       max3420_vbus_handler, 0, "vbus", udc);
 		if (err < 0)
-			goto del_gadget;
+			goto stop_thread;
 	}
 
 	return 0;
 
+stop_thread:
+	usb_del_gadget_udc(&udc->gadget);
+	disable_irq(udc_irq);
+	kthread_stop(udc->thread_task);
+	return err;
+
 del_gadget:
 	usb_del_gadget_udc(&udc->gadget);
 	return err;

base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4

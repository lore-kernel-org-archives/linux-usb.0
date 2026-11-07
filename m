Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794036312;
	b=LzrLGgXL+nrhzCpqaiGDizBYqxyQvuudXqpOFa0OZfkRFU0oSBj8mBYGSxkPWawQuw++
	 PbF1K4G5x+qwhymFNhnSD8GPz5XQOdfH1wc1dQtGbxVbfZ2i+c5CuO9QbzYXim7q0r/oW
	 4JFrjUlWeYmERuwUGXHQ56mrDV2ymMAtWReQCCRciYRtX9tPHM4uSD58xMXkUsuXSN6fH
	 Seatno5yysPIPcyFgzSsASf6o0wBFoVU8t2gNEaVpWKcTsDSUVwXDLoOcCZpQTTNt+3ot
	 v4r5Gdn07jfDZHEADp0+9t66Y4MZw5ajVW5vF4FCX15MeDHljjPQ9mKU0eE8jhaUD4Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794036312;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=r2dd8jRP0W945/bWYQPeHiO11p85GGQbJrWF47zymFM=;
	b=jRNek4LvwpBv2rWvJ1AQOHPBrFVrDMAtsULYZ5eX++/qAnm1Y/3JxrF7WvvIw6r63RjK
	 YiLuhwRt6A+chVxjs+U3MbDmXjohNT/zYycU8LhQtHD5K3hTP4xRHHJ0/b2PUs17Kt0CG
	 Rna+vTqtV3X8Ef4Ji2G421IKxRNAFcrcCw7yE3re9RxHcfJyb1tpowMPVAJmAIByMQNI5
	 N/+c+xihN2Bf13vbvPpDQEXBA8HHWeO1JfoArVCK2QT8J/Btsxsuzy3uMokTAQ4MmaicO
	 wydLVw+w/ELbGyEi0vsp4kuYPRKc8PDNLoETEi0Ov4aFj6bDSw2pOBh/irpjKdCN4Bg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Y1vSVoue;
	arc=none smtp.remote-ip=209.85.216.43
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A427F606A326
	for <linux-usb@vger.kernel.org>; Sat,  7 Nov 2026 07:25:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A427F606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Y1vSVoue
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-3ae6b4c669fso200513a91.0
        for <linux-usb@vger.kernel.org>; Fri, 06 Nov 2026 23:25:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794036311; x=1794641111; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=r2dd8jRP0W945/bWYQPeHiO11p85GGQbJrWF47zymFM=;
        b=Y1vSVoueTJqDLM8jA8agI6cbb4i3g5fC3JmW4R1XHEhndYMfZ6lRtD2CHTqFq5AKqQ
         KXYEFgbEsYMfDGduQAhK69Y23OAxMa72MP7M20XQwkYD+Ox4k1JwFWjhGg1R1b79nu7Y
         U5gMnr4yx+rx4JkXiWjMww5TLCmEZ8g1Wg8sw/59fMAcuMexJIfqpWt9pLhZIz4hTBX5
         0KlyCCRCG1hpOIwRRohXWvKxfTrhbnuaNPca9r4EOR/qkJlmzikAZ8r1uvkSGj7UjLuY
         hLFhxRchs1RRPUGJM3kxBKqlvkvuS3eAh6nacqNNIjyV10nsT/DQQYx7d5iInDdK635c
         iI4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794036311; x=1794641111;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=r2dd8jRP0W945/bWYQPeHiO11p85GGQbJrWF47zymFM=;
        b=OJeTI97hRdBgEmHnFBK0vHVkAj/qh/i0+HRPPEF8izfkFfmyFQDfIBlTgHZNNr0uf+
         eo92orDaDJoTisUErXp5r76+a0jPOLjkW0OUBxMCprmaPE1sOO6zNOUrwHpIWIDQFMOM
         CiP+pqbGUf+4K3IQwFlKRKn5cDmEcr7i8sNhxuV4u2xuwZWcuRIRYKyLZDOZcXBX2w9m
         9OxXKuRuIVqB5kYagfmJFfhpnzr3CBE2GnNafF7+dNfl70a7beaWPcmkGx094GHvKEhS
         NRaiSk7uGqKwN8n7wcW2IclGFg7B5EBPLWI/t/+VnU4JxsWTabsx3yJ1z0NJVsZ9kVOw
         vFXQ==
X-Forwarded-Encrypted: i=1; AL+hErESsR6aeu9KnOPwGizc+lalTsJDQvAJ1lFu/hcYVwpTkhrWGwpPJ04LAaZMhof0Q2mWJIt3B7VtLIU=@vger.kernel.org
X-Gm-Message-State: APuU4Z9UsKUN/VSnlpRjlz0SqAP/WUYQ76+ffYp/uMyehqcukBo5ynAk
	EFsyxOXhKKpJ6t1sI27QD2mOzKiJ/bdpGGLKM3PI27vMhT+wJcipQN4I
X-Gm-Gg: AYBFou2SruuGykzGjMvdFUGzVDuLXNRTUC+rslap0F9UqQQfVC+87tWpndt67bADP12
	2z63mCALVgTgcstKPBiG1HTv20TqMMMJHBermQhF9ku9B5pn3DhroL1WipEHIWkYBxowsXeyhiD
	GCKyDopHeeyjZ7+wvqzf5qrhWVHQDjhvNHZ7gKazxiWKudw0Dljywg2YrXYC2UT7VCYCbNGn7HZ
	tL0E5vCB7YSo0xVEAj/ei6sMq/CVUHULuDCUZdz8U6o8oIh0qGzOTNw1b8KTEryKeVzM4CDuEfS
	eXoQ9dUNXHRObTN7OnpCf2fkUtG1UzLl3KLG8s01ASBofGzZEO4FHpKq8+qxrQLe7IgBNlnWk2+
	Uum7lf58SMuoFIusIUxL1gNU+Ycopo8FC1s3Yaw8R04ArQlMR5KIqKP+vy3hL0xJ/ZthmrRCMa6
	OkoG1MjgKgqsjPPTuGaH8yTXKxqkxQGBGcHC/2VyOnPYV08tTWoahkcmmDgZTQmCW1MpbWyTZqK
	mqpXyi2sxUXZkjOeJKF4jjVkkr8yjXZdp8o4ByBsQhK6JLhZIhvSFAWkVfepZWm8Mhpq6NWX9HA
	J89dQOwUpV0vcdlIdDxP33cxAuPLnwDsyqjquPbiwKlPqKXh
X-Received: by 2002:a17:90b:4f42:b0:3a7:a3c8:8f4a with SMTP id 98e67ed59e1d1-3b1061d20b8mr905743a91.18.1794036310826;
        Fri, 06 Nov 2026 23:25:10 -0800 (PST)
Received: from hj.. ([163.239.22.29])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1057c2bc8sm2238847a91.3.2026.11.06.23.25.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 23:25:10 -0800 (PST)
From: hyunjungg <hj351016@gmail.com>
To: Neill Kapron <nkapron@google.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Hyunjung Ko <hj351016@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH v3] usb: gadget: pch_udc: drain vbus GPIO works before freeing the device
Date: Sat,  7 Nov 2026 16:25:01 +0900
Message-ID: <20261107072501.3434465-1-hj351016@gmail.com>
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
Content-Transfer-Encoding: 8bit

From: Hyunjung Ko <hj351016@gmail.com>

pch_vbus_gpio_irq() and pch_udc_dev_isr() schedule
dev->vbus_gpio.irq_work_fall / irq_work_rise (pch_vbus_gpio_work_fall /
pch_vbus_gpio_work_rise), whose handlers obtain the pch_udc_dev via
container_of() and dereference it. Nothing cancels these works on
teardown, and dev is allocated with devm_kzalloc(), so a work still
pending or running when devres frees dev dereferences freed memory
(use-after-free); pch_vbus_gpio_work_fall() polls for up to
PCH_VBUS_PERIOD (3s), widening the window.

The two works are armed from different sources. irq_work_rise is only
set up and scheduled once dev->vbus_gpio.intr is non-zero, from the GPIO
interrupt handler. irq_work_fall is INIT_WORK()ed whenever a VBUS GPIO is
present, and is scheduled either from the GPIO interrupt or, when
dev->vbus_gpio.intr is 0, from the UDC device interrupt
pch_udc_isr() -> pch_udc_dev_isr() on UDC_DEVINT_US.

pch_udc_remove() calls pch_vbus_gpio_free() before pch_udc_exit() masks
the UDC device interrupts, and the PCI interrupt (pch_udc_isr()) is only
released by devres after pch_udc_remove() returns. So draining the works
in pch_vbus_gpio_free() alone races the UDC interrupt: pch_udc_dev_isr()
can re-queue irq_work_fall after cancel_work_sync() has returned.

Mask the UDC device interrupts and synchronize_irq() the PCI interrupt
before draining, so neither source can schedule the works any more, then
cancel them: irq_work_fall whenever a VBUS GPIO port exists, and
irq_work_rise together with free_irq() under the intr guard. free_irq()
runs before its cancel so the GPIO interrupt cannot re-queue either.

Found by static analysis and code review; not runtime-reproduced (needs
EG20T/ML7213 pch_udc hardware with a VBUS detection GPIO and an interrupt
racing device removal).

Fixes: 637b78eb31e0 ("usb: gadget: pch_udc: Detecting VBUS through GPIO with interrupt")
Cc: stable@vger.kernel.org
Signed-off-by: Hyunjung Ko <hj351016@gmail.com>
---
v3: the UDC device interrupt (pch_udc_dev_isr(), UDC_DEVINT_US) can re-queue
    irq_work_fall after cancel_work_sync() when no VBUS GPIO IRQ is in use, so
    v2's drain alone still raced it. Mask the UDC device interrupts and
    synchronize_irq() the PCI interrupt in pch_udc_remove() before draining.
    Also corrected the teardown call-chain in the commit log
    (pch_vbus_gpio_free() runs before pch_udc_exit()). Both per Sashiko review.
v2: drain irq_work_fall under the VBUS-GPIO-port guard rather than the IRQ
    guard, since it is scheduled when vbus_gpio.intr == 0. Per Sashiko review.

 drivers/usb/gadget/udc/pch_udc.c | 18 +++++++++++++++---
 1 file changed, 15 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/gadget/udc/pch_udc.c b/drivers/usb/gadget/udc/pch_udc.c
index 99b3ce2..a22bf91 100644
--- a/drivers/usb/gadget/udc/pch_udc.c
+++ b/drivers/usb/gadget/udc/pch_udc.c
@@ -1406,8 +1406,12 @@ static int pch_vbus_gpio_init(struct pch_udc_dev *dev)
  */
 static void pch_vbus_gpio_free(struct pch_udc_dev *dev)
 {
-	if (dev->vbus_gpio.intr)
+	if (dev->vbus_gpio.intr) {
 		free_irq(dev->vbus_gpio.intr, dev);
+		cancel_work_sync(&dev->vbus_gpio.irq_work_rise);
+	}
+	if (dev->vbus_gpio.port)
+		cancel_work_sync(&dev->vbus_gpio.irq_work_fall);
 }
 
 /**
@@ -3010,9 +3014,17 @@ static void pch_udc_remove(struct pci_dev *pdev)
 		dma_unmap_single(&dev->pdev->dev, dev->dma_addr,
 				 UDC_EP0OUT_BUFF_SIZE * 4, DMA_FROM_DEVICE);
 
-	pch_vbus_gpio_free(dev);
-
+	/*
+	 * irq_work_fall can be queued from pch_udc_dev_isr() (UDC_DEVINT_US)
+	 * when no VBUS GPIO interrupt is in use, and the PCI interrupt is only
+	 * released by devres after this function returns. Mask the UDC device
+	 * interrupts and wait for any in-flight handler before draining the
+	 * VBUS GPIO works, so the interrupt can no longer re-queue them.
+	 */
 	pch_udc_exit(dev);
+	synchronize_irq(dev->pdev->irq);
+
+	pch_vbus_gpio_free(dev);
 }
 
 static int __maybe_unused pch_udc_suspend(struct device *d)
-- 
2.43.0


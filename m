Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=159.226.251.21
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793758517;
	b=wNvXwztqN73X/XXbP3FXn9JQzuKVMEIY9C/Z2SBcTUVvgcrFNF3aJVXzFiyKgN1lqSBI
	 W6e2a87l2So//jB//EQkntYCjbuh7LGlAbt0TSToW1rcVrkHbbH1hx9EcORLfe9e7rYFi
	 Op6EdsthWX6SYe2nQWwybv8s1kE29j3pvduLI5NNOBMpS+2yF4HZ/yF2Q9yAEAZ/1S2Xw
	 kij3hkpzRtjjVMvEBJM1KDkgbsKRXOnYkSk5sfCg9cxNvKnztS52zaYgk1kf8ev6tFKs7
	 U2XOA5DcHoEgJ7GkhBbqul19VDYVQnYveKbXDsDp0eevv1Xg4Ba9A8IQ/oKzsRJHlxQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793758517;
	h=DMARC-Filter:Received:From:To:Cc:Subject:Date:Message-Id:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding:X-CM-TRANSID:
	 X-Coremail-Antispam:X-Originating-IP:X-CM-SenderInfo;
	bh=URrsNRc2P4Bm/ZlumrqW2MM90xFCU+Ya4NjGToSw3Hs=;
	b=e2Q442SqQKyzL//wNkHZr7QGNW4OLCiuv4dTvI+6XHYWIVMVqhBoQUB8vyn/CRIcEkN7
	 AqJ6sS4n/S9p1Rp+92YusAfpyIMMXjt+Qo6/hjpwHiO6O9gB03dEEYRnyrxefWs4S2RBQ
	 /rlHNXimmYE9HK+PvY2F9rRf6Xuw6p2xzIGALGF38HpESsZW8WPWB1dI3QXQ2V/wHPnW8
	 t6Srr7ayNbfw80Zw/I2/9xHBW86w2NwOvOA3xqg3p1UytKE5DunMonyUv3haxBvwoKIah
	 lsu4PYszu7m5SGLMTtaB4VFcEk3tSD9UyBQ1I7tiVismPoz3l2fl5ZFNMro4T7G3AgQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=iscas.ac.cn;
	spf=pass smtp.mailfrom=iscas.ac.cn;
	arc=none smtp.remote-ip=159.226.251.21
Received: from cstnet.cn (smtp21.cstnet.cn [159.226.251.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D133C606A31B
	for <linux-usb@vger.kernel.org>; Wed,  4 Nov 2026 02:15:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D133C606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from dfae2b116770.home.arpa (unknown [36.110.52.2])
	by APP-01 (Coremail) with SMTP id qwCowAAnUfsulepqLXc+AA--.41779S2;
	Wed, 04 Nov 2026 10:15:10 +0800 (CST)
From: Wentao Liang <vulab@iscas.ac.cn>
To: Daniel Mack <daniel@zonque.org>,
	Haojian Zhuang <haojian.zhuang@gmail.com>,
	Robert Jarzmik <robert.jarzmik@free.fr>,
	Neill Kapron <nkapron@google.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-usb@vger.kernel.org
Subject: [PATCH] usb: gadget: pxa27x_udc: let devres own the transceiver reference
Date: Wed,  4 Nov 2026 02:15:19 +0000
Message-Id: <20261104021519.1468644-1-vulab@iscas.ac.cn>
X-Mailer: git-send-email 2.34.1
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
X-CM-TRANSID:qwCowAAnUfsulepqLXc+AA--.41779S2
X-Coremail-Antispam: 1UD129KBjvJXoW7uw1ktryxCFyxWF4DKFWUtwb_yoW8ur4Upa
	15Cay0kr4UAanFvay8Jws8Ja40y3ZrtFWxKrs2ka98uFWfXw17J34UXFyYga18CFZ7ZF4U
	twnFqr1fuFW3CrJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUvmb7Iv0xC_Kw4lb4IE77IF4wAFc2x0x2IEx4CE42xK8VAvwI8I
	cIk0rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2
	AK021l84ACjcxK6xIIjxv20xvE14v26F1j6w1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v2
	6r4UJVWxJr1l84ACjcxK6I8E87Iv67AKxVWxJr0_GcWl84ACjcxK6I8E87Iv6xkF7I0E14
	v26rxl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xf
	McIj6xIIjxv20xvE14v26rWY6Fy7McIj6I8E87Iv67AKxVW8Jr0_Cr1UMcvjeVCFs4IE7x
	kEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwCY1x0262kKe7AKxVWUAVWUtwCF04k20xvY0x0E
	wIxGrwCF04k20xvE74AGY7Cv6cx26r48ZrWUJr1UMxC20s026xCaFVCjc4AY6r1j6r4UMI
	8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AK
	xVWUAVWUtwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26ryj6F1UMIIF0xvE2Ix0cI
	8IcVCY1x0267AKxVW8Jr0_Cr1UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E
	87Iv67AKxVW8JVWxJwCI42IY6I8E87Iv6xkF7I0E14v26r4UJVWxJrUvcSsGvfC2KfnxnU
	UI43ZEXa7IUYbiStUUUUU==
X-CM-SenderInfo: pyxotu46lvutnvoduhdfq/1tbiBgkBA2rqY4K8GQAAsJ

pxa_udc_probe() looks up the USB2 transceiver with usb_get_phy() on
non-DT platforms.  That helper returns a reference which the caller has
to drop, and the driver only drops it in pxa_udc_remove().  Every probe
failure after the lookup (the clock lookup, clk_prepare() and all the
err labels) returns without a usb_put_phy(), so a failed probe leaks the
transceiver.

The DT path already uses devm_usb_get_phy_by_phandle(), so there devres
owns the reference.  pxa_udc_remove() nevertheless calls usb_put_phy()
for it as well, dropping the managed reference a second time.

Use devm_usb_get_phy() for the non-DT lookup, like the pxa25x UDC
driver does, so that both paths are managed, and drop the hand written
usb_put_phy() from pxa_udc_remove().

Fixes: 0c0e287d454a ("usb: gadget: pxa27x: add phy notifier event handler")
Cc: stable@vger.kernel.org
Assisted-by: DeepSeek-V4.1-Flash and OpenAI Codex
Signed-off-by: Wentao Liang <vulab@iscas.ac.cn>
---
 drivers/usb/gadget/udc/pxa27x_udc.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/gadget/udc/pxa27x_udc.c b/drivers/usb/gadget/udc/pxa27x_udc.c
index df5cca43afbe..74fc75c9d7c1 100644
--- a/drivers/usb/gadget/udc/pxa27x_udc.c
+++ b/drivers/usb/gadget/udc/pxa27x_udc.c
@@ -2393,7 +2393,7 @@ static int pxa_udc_probe(struct platform_device *pdev)
 		if (IS_ERR(udc->transceiver))
 			return PTR_ERR(udc->transceiver);
 	} else {
-		udc->transceiver = usb_get_phy(USB_PHY_TYPE_USB2);
+		udc->transceiver = devm_usb_get_phy(udc->dev, USB_PHY_TYPE_USB2);
 	}
 
 	if (udc->gpiod)
@@ -2458,10 +2458,8 @@ static void pxa_udc_remove(struct platform_device *_dev)
 	usb_del_gadget_udc(&udc->gadget);
 	pxa_cleanup_debugfs(udc);
 
-	if (!IS_ERR_OR_NULL(udc->transceiver)) {
+	if (!IS_ERR_OR_NULL(udc->transceiver))
 		usb_unregister_notifier(udc->transceiver, &pxa27x_udc_phy);
-		usb_put_phy(udc->transceiver);
-	}
 
 	udc->transceiver = NULL;
 	the_controller = NULL;
-- 
2.34.1


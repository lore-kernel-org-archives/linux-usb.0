Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=159.226.251.21
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793758492;
	b=VdaREmpK2Abqd/RsCEBKpPYE0MQzNvp3sqqpzfZTy8ganp26rREu7bwAo+giwc14A9i+
	 nWJYyFZxMcgOU/M1Kaa338GbZLVe8dQNK5zUUWn3y5Exec+te+mx/46Ce+gRTreG27iEH
	 22heaiMOlcjlncOdunN3JsOUBL3WRJ2qbiGNFexcQNpdfDIrm/GRTxVv7ulDSltKKrgSD
	 vJ7X1V42xNGbA4fhN8M57AMdy4y83dRHBxJeBY884bujwynqpcj0WxMMM+wMAt+7zMS/F
	 GZPbIuUOgauOISnFIfdLMARBCjNVYT4d9oe5Z5EZ/8TU/r7OU6uPHyXTy4A5fApVRHg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793758492;
	h=DMARC-Filter:Received:From:To:Cc:Subject:Date:Message-Id:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding:X-CM-TRANSID:
	 X-Coremail-Antispam:X-Originating-IP:X-CM-SenderInfo;
	bh=qrna6CHsX7lUIBVGrZXBx/vrG7Csg5/S5GV3ghHACmg=;
	b=tg1Ko0cVOcQ5ZBmgj+pVpR2py4Wmkq8Do8JT0lkzanQKKp/jbT0tnN3ZWZMvUdVukKBE
	 R+1ZEeC0+q8N6SfWDJs0FarBfPkqvgmP57QDx1Of7u4fvUa+nQ6zlOUIxRk0jsQZoxlkp
	 x8eQvAQ2uRg8a6HQWSHm7NYiFnkCBiNz/29ISddXDeP9mxiCIWYskvQVyBbYIZCipp+GH
	 TcXbfE7P6VPFJDLF8L9X13l7VCGkJz9RaXFBFuNJkvb1J3aHIiFaG2E6A1prR4rfkTur3
	 PYVanuCA2u3bcso1YuzZS3q8H/Njg9hQCpHwUaCVTEWCAuUH6vD2Ha/WT6hwgThTbCA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=iscas.ac.cn;
	spf=pass smtp.mailfrom=iscas.ac.cn;
	arc=none smtp.remote-ip=159.226.251.21
Received: from cstnet.cn (smtp21.cstnet.cn [159.226.251.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F49C606A331
	for <linux-usb@vger.kernel.org>; Wed,  4 Nov 2026 02:14:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5F49C606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from dfae2b116770.home.arpa (unknown [36.110.52.2])
	by APP-01 (Coremail) with SMTP id qwCowACnzvgUlepq_HU+AA--.9327S2;
	Wed, 04 Nov 2026 10:14:44 +0800 (CST)
From: Wentao Liang <vulab@iscas.ac.cn>
To: Peter Chen <peter.chen@kernel.org>,
	Pawel Laszczak <pawell@cadence.com>,
	Roger Quadros <rogerq@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org
Subject: [PATCH] usb: cdns3: drop the second function reference after use
Date: Wed,  4 Nov 2026 02:14:53 +0000
Message-Id: <20261104021453.1468443-1-vulab@iscas.ac.cn>
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
X-CM-TRANSID:qwCowACnzvgUlepq_HU+AA--.9327S2
X-Coremail-Antispam: 1UD129KBjvJXoW7CrWfWF15tFWxtr17JFW5KFg_yoW5JrW5pF
	Z5WFWrCrWkK343Jwn8Xr45uF1Fkr4Iy34xK3yxCw1j9a1Yv3W8KFy5uFyjgr4UAFWkXa4U
	Jw1jgw409F40yaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
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
X-CM-SenderInfo: pyxotu46lvutnvoduhdfq/1tbiDAQBA2rqY+S6DQAAs6

cdns3_get_second_fun() returns a struct pci_dev obtained with
pci_get_device(), which takes a reference on the device, and both
cdns3_pci_probe() and cdns3_pci_remove() keep that reference until they
return without ever dropping it.  Probing or removing either function of
the USBSS controller therefore pins the sibling PCI device and its
driver's module forever.  cdns3_get_second_fun() also leaks the
reference itself when the device it finds is not one of the two expected
functions.

Release the reference on every path that gives up ownership: in the
error return of cdns3_get_second_fun(), and at the end of the probe and
remove callbacks.

Fixes: 7733f6c32e36 ("usb: cdns3: Add Cadence USB3 DRD Driver")
Cc: stable@vger.kernel.org
Assisted-by: DeepSeek-V4.1-Flash and OpenAI Codex
Signed-off-by: Wentao Liang <vulab@iscas.ac.cn>
---
 drivers/usb/cdns3/cdns3-pci-wrap.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/cdns3/cdns3-pci-wrap.c b/drivers/usb/cdns3/cdns3-pci-wrap.c
index fd06a3d8e638..4891802a2567 100644
--- a/drivers/usb/cdns3/cdns3-pci-wrap.c
+++ b/drivers/usb/cdns3/cdns3-pci-wrap.c
@@ -59,6 +59,7 @@ static struct pci_dev *cdns3_get_second_fun(struct pci_dev *pdev)
 
 	if (func->devfn != PCI_DEV_FN_HOST_DEVICE &&
 	    func->devfn != PCI_DEV_FN_OTG) {
+		pci_dev_put(func);
 		return NULL;
 	}
 
@@ -89,6 +90,7 @@ static int cdns3_pci_probe(struct pci_dev *pdev,
 	err = pcim_enable_device(pdev);
 	if (err) {
 		dev_err(&pdev->dev, "Enabling PCI device has failed %d\n", err);
+		pci_dev_put(func);
 		return err;
 	}
 
@@ -99,12 +101,15 @@ static int cdns3_pci_probe(struct pci_dev *pdev,
 		if (!wrap) {
 			dev_err(&pdev->dev,
 				"second function not initialized, retrying\n");
+			pci_dev_put(func);
 			return -EPROBE_DEFER;
 		}
 	} else {
 		wrap = kzalloc_obj(*wrap);
-		if (!wrap)
+		if (!wrap) {
+			pci_dev_put(func);
 			return -ENOMEM;
+		}
 	}
 
 	res = wrap->dev_res;
@@ -165,11 +170,13 @@ static int cdns3_pci_probe(struct pci_dev *pdev,
 		if (IS_ERR(wrap->plat_dev)) {
 			err = PTR_ERR(wrap->plat_dev);
 			kfree(wrap);
+			pci_dev_put(func);
 			return err;
 		}
 	}
 
 	pci_set_drvdata(pdev, wrap);
+	pci_dev_put(func);
 	return err;
 }
 
@@ -186,6 +193,8 @@ static void cdns3_pci_remove(struct pci_dev *pdev)
 
 	if (!pci_is_enabled(func))
 		kfree(wrap);
+
+	pci_dev_put(func);
 }
 
 static const struct pci_device_id cdns3_pci_ids[] = {
-- 
2.34.1


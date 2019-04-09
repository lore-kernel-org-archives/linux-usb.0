Return-Path: <SRS0=+Ncr=SL=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C61A9C282CE
	for <linux-usb@archiver.kernel.org>; Tue,  9 Apr 2019 08:29:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 9410520883
	for <linux-usb@archiver.kernel.org>; Tue,  9 Apr 2019 08:29:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20150623.gappssmtp.com header.i=@bgdev-pl.20150623.gappssmtp.com header.b="rc+kTt8M"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726894AbfDII3e (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Tue, 9 Apr 2019 04:29:34 -0400
Received: from mail-wr1-f67.google.com ([209.85.221.67]:46588 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726711AbfDII3F (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 9 Apr 2019 04:29:05 -0400
Received: by mail-wr1-f67.google.com with SMTP id t17so19626285wrw.13
        for <linux-usb@vger.kernel.org>; Tue, 09 Apr 2019 01:29:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=a1ibeF6fSGxrtLocqohp3DOAYCn4qHHgfHueAd+c1xs=;
        b=rc+kTt8MY2foIoO6IjqRvTBpTQiETlG0C7fT9V7xOdJMWZEKp+lAiESGAKm99LXeXu
         T5xQLvJGPkdZatLGwgq7gk5rUuiTTglQKmV/sOshrcW29zByeTA5MPNfno0S8u/6eGuq
         3Bk9cHaoT3DXyZq/jSWydel7+s2mOogSSjxHmB593utiDAnkgd4i+VsS3Ls853Pzg2nm
         rFNO4FFcGBle4U+0Evd1zYEwZK0c+eK+EGNrD21XZSKGYovcqKxt5rF5znqRF8ong5fp
         elykfxGj6rwLp+F4N8t03WwjQMJxuIFYDt+Xx59ZRvexjbyaPin4+fO0MrMGORdLG9mV
         T1JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=a1ibeF6fSGxrtLocqohp3DOAYCn4qHHgfHueAd+c1xs=;
        b=um3OcOxIgHhjGWuq5/xB9BBgN9ZIFo2wksBlJOzJdgyhaaofWQYG+2ASeTE7ix39Fy
         ix2ZiTit444GK+JjUrRNIVkjbyjZQsQRu9Jh2/QjohxO+VYV9Bfdy/tpYlrqa+v5wh5I
         RdT6VHWtFxpBjuDXGwU5q53YdmmQAGyr9Dc2BV2rTozR1YVLo8dydHVVScv4R/KTnBTT
         Kekr9afZ04OkZA52FK2qY2ExfjTsi2/q/wFrPaCC4hqeldW/kE3D6YY7OtcMBZH7+vwu
         OdWYBtvzcP5XnuudaFqpZgNEl1dXgGTTayPE3XJnx9tWNnnQWrPtVV63Mcw8SUrDimIQ
         Q//A==
X-Gm-Message-State: APjAAAUfUM66ko/qbWwmLmUPOA2qktrkI1SJKPM6GwYPxUDDIUxmctyz
        A2Lqgb9cNEDrKc5bEtZKjIz03A==
X-Google-Smtp-Source: APXvYqysocVGytB4qAkrXJND7pGufXDa6d177/I7jwR3YsuT6GTfMd1DU/ZnHPgeW3VASAODo3gPGw==
X-Received: by 2002:adf:ff88:: with SMTP id j8mr21891334wrr.1.1554798543888;
        Tue, 09 Apr 2019 01:29:03 -0700 (PDT)
Received: from debian-brgl.home ([2a01:cb1d:af:5b00:6d6c:8493:1ab5:dad7])
        by smtp.gmail.com with ESMTPSA id c20sm59968651wre.28.2019.04.09.01.29.02
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 09 Apr 2019 01:29:03 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Sekhar Nori <nsekhar@ti.com>, Kevin Hilman <khilman@kernel.org>,
        Alan Stern <stern@rowland.harvard.edu>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH v3 3/6] usb: ohci-da8xx: disable the regulator if the overcurrent irq fired
Date:   Tue,  9 Apr 2019 10:28:52 +0200
Message-Id: <20190409082855.15373-4-brgl@bgdev.pl>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190409082855.15373-1-brgl@bgdev.pl>
References: <20190409082855.15373-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190409082852.vGokQUl14y1aVc403xA5sdt2119MmGYUqb-Q7ShkGI8@z>

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

Historically the power supply management in this driver has been handled
in two separate places in parallel. Device-tree users simply defined an
appropriate regulator, while two boards with no DT support (da830-evm and
omapl138-hawk) passed functions defined in their respective board files
over platform data. These functions simply used legacy GPIO calls to
watch the oc GPIO for interrupts and disable the vbus GPIO when the irq
fires.

Commit d193abf1c913 ("usb: ohci-da8xx: add vbus and overcurrent gpios")
updated these GPIO calls to the modern API and moved them inside the
driver.

This however is not the optimal solution for the vbus GPIO which should
be modeled as a fixed regulator that can be controlled with a GPIO.

In order to keep the overcurrent protection available once we move the
board files to using fixed regulators we need to disable the enable_reg
regulator when the overcurrent indicator interrupt fires. Since we
cannot call regulator_disable() from interrupt context, we need to
switch to using a oneshot threaded interrupt.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 drivers/usb/host/ohci-da8xx.c | 23 ++++++++++++++++++-----
 1 file changed, 18 insertions(+), 5 deletions(-)

diff --git a/drivers/usb/host/ohci-da8xx.c b/drivers/usb/host/ohci-da8xx.c
index 9c6d1f03b871..108fe0a1b962 100644
--- a/drivers/usb/host/ohci-da8xx.c
+++ b/drivers/usb/host/ohci-da8xx.c
@@ -202,12 +202,24 @@ static int ohci_da8xx_regulator_event(struct notifier_block *nb,
 	return 0;
 }
 
-static irqreturn_t ohci_da8xx_oc_handler(int irq, void *data)
+static irqreturn_t ohci_da8xx_oc_thread(int irq, void *data)
 {
 	struct da8xx_ohci_hcd *da8xx_ohci = data;
+	struct device *dev = da8xx_ohci->hcd->self.controller;
+	int ret;
 
-	if (gpiod_get_value(da8xx_ohci->oc_gpio))
-		gpiod_set_value(da8xx_ohci->vbus_gpio, 0);
+	if (gpiod_get_value_cansleep(da8xx_ohci->oc_gpio)) {
+		if (da8xx_ohci->vbus_gpio) {
+			gpiod_set_value_cansleep(da8xx_ohci->vbus_gpio, 0);
+		} else if (da8xx_ohci->vbus_reg) {
+			ret = regulator_disable(da8xx_ohci->vbus_reg);
+			if (ret)
+				dev_err(dev,
+					"Failed to disable regulator: %d\n",
+					ret);
+		}
+			
+	}
 
 	return IRQ_HANDLED;
 }
@@ -434,8 +446,9 @@ static int ohci_da8xx_probe(struct platform_device *pdev)
 		if (oc_irq < 0)
 			goto err;
 
-		error = devm_request_irq(dev, oc_irq, ohci_da8xx_oc_handler,
-				IRQF_TRIGGER_RISING | IRQF_TRIGGER_FALLING,
+		error = devm_request_threaded_irq(dev, oc_irq, NULL,
+				ohci_da8xx_oc_thread, IRQF_TRIGGER_RISING |
+				IRQF_TRIGGER_FALLING | IRQF_ONESHOT,
 				"OHCI over-current indicator", da8xx_ohci);
 		if (error)
 			goto err;
-- 
2.21.0


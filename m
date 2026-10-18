Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9C86223323
	for <linux-usb@vger.kernel.org>; Sun, 18 Oct 2026 01:57:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792288680; cv=none; b=OcjGyoLvQ7DZICG3ZdJsY4yseO+LU1QKrA5Zc6rDBnrritQO03MdMiTmte5lb2xKWguOAFGM1dYnY47H8glbSnfkhRI6y+64FLP5Zbw/YKk8Ay97yWg3QTbvucXS0HNVBRCYS/JL2Ol07XtzOZ4475mycLiGSMN+xxjx9RQIJog=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792288680; c=relaxed/simple;
	bh=AgpbGPSZBv7fIsyqDluUWGcJl0Y4LcGyVNY2R+JYg6I=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=tceW5kCHkSdDfdq4MGGVuRYs+CaJ7mJc+TMZ+f+HfkRmWtljCF7kwacyhXymUigEv68ku9l5EMFwpCLxiQvqWHUV2kYsIzUvHsWHsGHggWhvrGEO6upoE4XssY03cSu0RfT3X2gFZt5rw21Fws42O9UJUZUULlUAdlV1bg87LCA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CwBca3hj; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CwBca3hj"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-48bbb06e746so406437f8f.3
        for <linux-usb@vger.kernel.org>; Sat, 17 Oct 2026 18:57:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792288677; x=1792893477; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=tmtTQKk0AOt8SGZA4T+/LDTBNGRaKX0oU4HelRq+Lo4=;
        b=CwBca3hju0/bQ7IKnQhEiTJ5cjSUC1PI/5xJFIMY6OUrm5kJyrfHxVoy1NU0bKB9zx
         YUXDSxB331G5Oai19ePHjdKE5H2VyjxuzqlngWXTXZWmAWa5iCLwCqwMyikLoFhPOG9G
         mKE5bwqIh6RkJ3A+3wKvUrmdXv6ZiHpMFuWxGCWzx72tXZN9nTx7010FCtnrB3lxYbbP
         Pw73QIR81D8zc/uP8vpI0pYDih8mp7iQGMG/ukX8EDQdp0bFbi44V6/Z2c5smXjK4I6w
         Nc8B7sdLiRRfFhtZMlHS+c+TSjf7fTKKyRDS/NzYPvbwYYQbrmdADbrFI4fdqNpfhaNe
         8lVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792288677; x=1792893477;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tmtTQKk0AOt8SGZA4T+/LDTBNGRaKX0oU4HelRq+Lo4=;
        b=om25x9vHV719/HfNVSe+bR+zAce7vg27UxA8yXTnzDxaX1R5LthKqNrPOAsnkCi46c
         sOo9EdwiSdxQ/Vdc6GMq8x4mechvwcv/JKQcjn3/3VwT/ps7CJTpO3D59u+tKYy/ksPs
         rb8POLVZD59zZgwLqt57UV579JXywkRagBiqRUaZf/La5jCzNYqzNBVjFJ+Fb63mhCP9
         AxuAnHL5Bug0f0ghIiFt3svRcWxoZ4m8sGTXYI2gDwSTwQxTYMEHzkRSK6YvkHLSRUMp
         EJhQe9LroEiEi/4fjCOwRwicRT867yzsyiMqP3e2GhoZEXV+lLQ3UbWcklsHrW7swed+
         6Z5A==
X-Forwarded-Encrypted: i=1; AKwUvByyfOWbNcB4PLI6KaMMz9fUswWmoD1h4F2ntNqVW0mRqRAlsGLu4iXirm04gNZF9kiYpjNtTE9048Y=@vger.kernel.org
X-Gm-Message-State: AFq9FYJjLb374yN4xmgSgDTvF64qv+HTSAjBybSV3IFKkgjXe2gHS1JT
	1w03OdIzkDUozBdWxU8aJsxIreBf4SWwnJkCEMCHGF9vhtA9wVLFRmAouOSEW2bIZ3Kzlg==
X-Gm-Gg: AYBFou2/p+1c5lHhKMhJVcAmvT2uNDCr2F5siM1ZJgTFxrBzIOQHIbCwFKJPOu4ZbF6
	7sWZTx5JajrgMukQ5dfBtSN1CGtjWhC5q9gBL0/5vOWMyF1526Oys8WDkKkQm2A5h95X8vedNcS
	n7y4h43t1eaNGSctTx7x9yQkIOBaLXHyU10Gyu1UjF3GRQ2spesgD5M2aeL7ZKlFqTIH42lk/vD
	3898dTyuyFD1gunNw6DDWBIlThTqRv61Wexmev0umy9h65jvbeDp4AedoFbXaokElgd8Ml+1wMS
	ip/PSbSc0l9EVHDHi96cJM2lJljrF+ZGMWAed2an+RD0YIxx2fzQ6enziFfq5afSLBD6+yrBp7m
	DHsuqZBZjjQ8DAl/4tnxJixqWsft7YleApXCrqwAbNJqy0Wf9Vrlcwn9Xr66+ZQtyZmeGk+0ih9
	teEIGrHI3R6Hy4akIwXM4iQ21JjW+cOL7RDW8P3bQzF8O2a5Oro8kgEJpvcXH7TIGvGQ==
X-Received: by 2002:a05:600c:1d04:b0:4a1:7ed5:99e8 with SMTP id 5b1f17b1804b1-4a1d7612037mr88701355e9.22.1792288676985;
        Sat, 17 Oct 2026 18:57:56 -0700 (PDT)
Received: from fedora ([2a02:4540:50c3:8cc5:1dcc:116:906d:9d11])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1c8a81587sm322406465e9.1.2026.10.17.18.57.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 18:57:56 -0700 (PDT)
From: m-amirpour <ampr.mhd@gmail.com>
To: stern@rowland.harvard.edu
Cc: gregkh@linuxfoundation.org,
	linux-usb@vger.kernel.org,
	linux-omap@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	m-amirpour <ampr.mhd@gmail.com>
Subject: [PATCH] usb: ohci-omap: handle root hub overcurrent
Date: Sun, 18 Oct 2026 05:27:47 +0330
Message-ID: <20261018015747.246611-1-ampr.mhd@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Handle overcurrent GPIO interrupts, disable port power when
overcurrent is detected, and report the status through the
root hub port status.

Signed-off-by: m-amirpour <ampr.mhd@gmail.com>
---
 drivers/usb/host/ohci-omap.c | 212 +++++++++++++++++++++++++++++++----
 1 file changed, 191 insertions(+), 21 deletions(-)

diff --git a/drivers/usb/host/ohci-omap.c b/drivers/usb/host/ohci-omap.c
index f6e56c4b9914..2a08147dc5fa 100644
--- a/drivers/usb/host/ohci-omap.c
+++ b/drivers/usb/host/ohci-omap.c
@@ -15,6 +15,7 @@
  * This file is licenced under the GPL.
  */
 
+#include <linux/irqreturn.h>
 #include <linux/clk.h>
 #include <linux/dma-mapping.h>
 #include <linux/err.h>
@@ -33,6 +34,9 @@
 #include <linux/signal.h>
 #include <linux/usb.h>
 #include <linux/usb/hcd.h>
+#include <linux/interrupt.h>
+#include <linux/spinlock.h>
+#include <linux/usb/ch11.h>
 
 #include "ohci.h"
 
@@ -46,6 +50,10 @@ struct ohci_omap_priv {
 	struct clk *usb_dc_ck;
 	struct gpio_desc *power;
 	struct gpio_desc *overcurrent;
+	spinlock_t overcurrent_lock;
+	bool overcurrent_status;
+	bool overcurrent_changed;
+	int overcurrent_irq;
 };
 
 static const char hcd_name[] = "ohci-omap";
@@ -181,11 +189,110 @@ static int ohci_omap_reset(struct usb_hcd *hcd)
 	return 0;
 }
 
+static irqreturn_t ohci_omap_overcurrent_irq(int irq, void *data)
+{
+	struct usb_hcd *hcd = data;
+	struct ohci_omap_priv *priv = hcd_to_ohci_omap_priv(hcd);
+	unsigned long flags;
+	int status;
+
+	status = gpiod_get_value_cansleep(priv->overcurrent);
+	if (status < 0)
+		return IRQ_HANDLED;
+
+	if (status && priv->power)
+		gpiod_set_value_cansleep(priv->power, 0);
+
+	spin_lock_irqsave(&priv->overcurrent_lock, flags);
+	if (!!status != priv->overcurrent_status)
+		priv->overcurrent_changed = true;
+	priv->overcurrent_status = !!status;
+	spin_unlock_irqrestore(&priv->overcurrent_lock, flags);
+
+	usb_hcd_poll_rh_status(hcd);
+
+	return IRQ_HANDLED;
+}
+
+static int ohci_omap_hub_status_data(struct usb_hcd *hcd, char *buf)
+{
+	struct ohci_omap_priv *priv = hcd_to_ohci_omap_priv(hcd);
+	unsigned long flags;
+	bool changed;
+	int length;
+
+	length = ohci_hub_status_data(hcd, buf);
+
+	spin_lock_irqsave(&priv->overcurrent_lock, flags);
+	changed = priv->overcurrent_changed;
+	spin_unlock_irqrestore(&priv->overcurrent_lock, flags);
+
+	if (changed) {
+		if (!length) {
+			buf[0] = 0;
+			length = 1;
+		}
+		buf[0] |= BIT(1);
+	}
+
+	return length;
+}
+
+static int ohci_omap_hub_control(struct usb_hcd *hcd, u16 typeReq, u16 wValue,
+				 u16 wIndex, char *buf, u16 wLength)
+{
+	struct ohci_omap_priv *priv = hcd_to_ohci_omap_priv(hcd);
+	unsigned long flags;
+	bool status, changed;
+	__le32 *portstatus;
+	u32 value;
+	int ret;
+
+	ret = ohci_hub_control(hcd, typeReq, wValue, wIndex, buf, wLength);
+	if (ret)
+		return ret;
+
+	if (typeReq == ClearPortFeature && wIndex == 1 &&
+	    wValue == USB_PORT_FEAT_C_OVER_CURRENT) {
+		unsigned long flags;
+
+		spin_lock_irqsave(&priv->overcurrent_lock, flags);
+		priv->overcurrent_changed = false;
+		spin_unlock_irqrestore(&priv->overcurrent_lock, flags);
+		return 0;
+	}
+
+	if (typeReq != GetPortStatus || wIndex != 1)
+		return ret;
+
+	spin_lock_irqsave(&priv->overcurrent_lock, flags);
+	status = priv->overcurrent_status;
+	changed = priv->overcurrent_changed;
+	spin_unlock_irqrestore(&priv->overcurrent_lock, flags);
+
+	portstatus = (__le32 *)buf;
+	value = le32_to_cpu(*portstatus);
+
+	if (status)
+		value |= USB_PORT_STAT_OVERCURRENT;
+	else
+		value &= ~USB_PORT_STAT_OVERCURRENT;
+
+	if (changed)
+		value |= USB_PORT_STAT_C_OVERCURRENT;
+	else
+		value &= ~USB_PORT_STAT_C_OVERCURRENT;
+
+	*portstatus = cpu_to_le32(value);
+
+	return 0;
+}
+
 /*-------------------------------------------------------------------------*/
 
 /**
  * ohci_hcd_omap_probe - initialize OMAP-based HCDs
- * @pdev:	USB controller to probe
+ * @pdev: USB controller to probe
  *
  * Context: task context, might sleep
  *
@@ -196,50 +303,53 @@ static int ohci_omap_reset(struct usb_hcd *hcd)
 static int ohci_hcd_omap_probe(struct platform_device *pdev)
 {
 	int retval, irq;
-	struct usb_hcd *hcd = 0;
+	struct usb_hcd *hcd;
 	struct ohci_omap_priv *priv;
 
 	if (pdev->num_resources != 2) {
 		dev_err(&pdev->dev, "invalid num_resources: %i\n",
-		       pdev->num_resources);
+			pdev->num_resources);
 		return -ENODEV;
 	}
 
-	if (pdev->resource[0].flags != IORESOURCE_MEM
-			|| pdev->resource[1].flags != IORESOURCE_IRQ) {
+	if (pdev->resource[0].flags != IORESOURCE_MEM ||
+	    pdev->resource[1].flags != IORESOURCE_IRQ) {
 		dev_err(&pdev->dev, "invalid resource type\n");
 		return -ENODEV;
 	}
 
 	hcd = usb_create_hcd(&ohci_omap_hc_driver, &pdev->dev,
-			dev_name(&pdev->dev));
+			     dev_name(&pdev->dev));
 	if (!hcd)
 		return -ENOMEM;
 
 	hcd->rsrc_start = pdev->resource[0].start;
-	hcd->rsrc_len = pdev->resource[0].end - pdev->resource[0].start + 1;
+	hcd->rsrc_len = pdev->resource[0].end -
+			pdev->resource[0].start + 1;
 	priv = hcd_to_ohci_omap_priv(hcd);
 
-	/* Obtain two optional GPIO lines */
-	priv->power = devm_gpiod_get_optional(&pdev->dev, "power", GPIOD_ASIS);
+	spin_lock_init(&priv->overcurrent_lock);
+	priv->overcurrent_status = false;
+	priv->overcurrent_changed = false;
+	priv->overcurrent_irq = -1;
+
+	priv->power = devm_gpiod_get_optional(&pdev->dev, "power",
+					      GPIOD_ASIS);
 	if (IS_ERR(priv->power)) {
 		retval = PTR_ERR(priv->power);
 		goto err_put_hcd;
 	}
+
 	if (priv->power)
 		gpiod_set_consumer_name(priv->power, "OHCI power");
 
-	/*
-	 * This "overcurrent" GPIO line isn't really used in the code,
-	 * but has a designated hardware function.
-	 * TODO: implement proper overcurrent handling.
-	 */
-	priv->overcurrent = devm_gpiod_get_optional(&pdev->dev, "overcurrent",
-						    GPIOD_IN);
+	priv->overcurrent = devm_gpiod_get_optional(&pdev->dev,
+						    "overcurrent", GPIOD_IN);
 	if (IS_ERR(priv->overcurrent)) {
 		retval = PTR_ERR(priv->overcurrent);
 		goto err_put_hcd;
 	}
+
 	if (priv->overcurrent)
 		gpiod_set_consumer_name(priv->overcurrent, "OHCI overcurrent");
 
@@ -277,23 +387,77 @@ static int ohci_hcd_omap_probe(struct platform_device *pdev)
 	if (!hcd->regs) {
 		dev_err(&pdev->dev, "can't ioremap OHCI HCD\n");
 		retval = -ENOMEM;
-		goto err2;
+		goto err_release_mem;
 	}
 
 	irq = platform_get_irq(pdev, 0);
 	if (irq < 0) {
 		retval = irq;
-		goto err3;
+		goto err_iounmap;
 	}
+
 	retval = usb_add_hcd(hcd, irq, 0);
 	if (retval)
-		goto err3;
+		goto err_iounmap;
+
+	if (priv->overcurrent) {
+		int status;
+		unsigned long flags;
+
+		priv->overcurrent_irq = gpiod_to_irq(priv->overcurrent);
+		if (priv->overcurrent_irq < 0) {
+			retval = priv->overcurrent_irq;
+			goto err_remove_hcd;
+		}
+
+		retval = request_threaded_irq(priv->overcurrent_irq, NULL,
+					      ohci_omap_overcurrent_irq,
+					      IRQF_ONESHOT |
+					      IRQF_TRIGGER_RISING |
+					      IRQF_TRIGGER_FALLING,
+					      "ohci-omap-overcurrent", hcd);
+		if (retval) {
+			priv->overcurrent_irq = -1;
+			goto err_remove_hcd;
+		}
+
+		/*
+		 * Synchronize the initial GPIO sample with the threaded
+		 * handler so it cannot overwrite the sampled state.
+		 */
+		disable_irq(priv->overcurrent_irq);
+
+		status = gpiod_get_value_cansleep(priv->overcurrent);
+		if (status < 0) {
+			retval = status;
+			enable_irq(priv->overcurrent_irq);
+			goto err_remove_hcd;
+		}
+
+		spin_lock_irqsave(&priv->overcurrent_lock, flags);
+		priv->overcurrent_status = !!status;
+		priv->overcurrent_changed = true;
+		spin_unlock_irqrestore(&priv->overcurrent_lock, flags);
+
+		if (status && priv->power)
+			gpiod_set_value_cansleep(priv->power, 0);
+
+		enable_irq(priv->overcurrent_irq);
+		usb_hcd_poll_rh_status(hcd);
+	}
 
 	device_wakeup_enable(hcd->self.controller);
 	return 0;
-err3:
+
+err_remove_hcd:
+	if (priv->overcurrent_irq >= 0) {
+		free_irq(priv->overcurrent_irq, hcd);
+		priv->overcurrent_irq = -1;
+	}
+	usb_remove_hcd(hcd);
+err_iounmap:
 	iounmap(hcd->regs);
-err2:
+err_release_mem:
 	release_mem_region(hcd->rsrc_start, hcd->rsrc_len);
 err_unprepare_dc_ck:
 	clk_unprepare(priv->usb_dc_ck);
@@ -327,6 +491,10 @@ static void ohci_hcd_omap_remove(struct platform_device *pdev)
 	struct ohci_omap_priv *priv = hcd_to_ohci_omap_priv(hcd);
 
 	dev_dbg(hcd->self.controller, "stopping USB Controller\n");
+	if (priv->overcurrent_irq >= 0) {
+		free_irq(priv->overcurrent_irq, hcd);
+		priv->overcurrent_irq = -1;
+	}
 	usb_remove_hcd(hcd);
 	omap_ohci_clock_power(priv, 0);
 	if (!IS_ERR_OR_NULL(hcd->usb_phy)) {
@@ -413,6 +581,8 @@ static int __init ohci_omap_init(void)
 		return -ENODEV;
 
 	ohci_init_driver(&ohci_omap_hc_driver, &omap_overrides);
+	ohci_omap_hc_driver.hub_status_data = ohci_omap_hub_status_data;
+	ohci_omap_hc_driver.hub_control = ohci_omap_hub_control;
 	return platform_driver_register(&ohci_hcd_omap_driver);
 }
 module_init(ohci_omap_init);
-- 
2.55.0


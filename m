Received: from mail-ed2-f35.google.com (mail-ed2-f35.google.com [74.125.228.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97A6C4E4C21
	for <linux-usb@vger.kernel.org>; Thu, 17 Sep 2026 19:39:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.99
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789673943; cv=pass; b=LZI0X3Q2xPbY4zPKrlnGIiNuJJFC5Lz2qD8jvm8YpE2hs7wwbKNzYLfSdOLGVsIVNEq51iZ3ZS2YLai/RO+mIx06dhoNjfEritQze0uuyZLsduUMHhMIn7YBWdVx1xpQIP3lWNy+49TR6olGGJPitk/33qyQzL88ar1z1CBloKc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789673943; c=relaxed/simple;
	bh=+JojRhYj4z2/5FlQFeoDBjlhoDkwm7cc/v/3Femf6qc=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=rJOdo8PGLdDgmm13hn4Kwz1yAMMWNbLlBy1IvFfSr/P1LvOL3+9ReGjxmnnUq/X2FSQT7OnFHU0dIWSqf+U79gNeKC9OLyYwHW1v+5SIqRHQEA4UZAYWovG+tJWzOpTb3fkL+jHwM6MYF44N6tpRTQtbW8pcttBT9B22WGPcDy0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EmSOc+kR; arc=pass smtp.client-ip=74.125.228.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EmSOc+kR"
Received: by mail-ed2-f35.google.com with SMTP id 4fb4d7f45d1cf-6a60591bb18so884222a12.1
        for <linux-usb@vger.kernel.org>; Thu, 17 Sep 2026 12:39:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789673939; cv=none;
        d=google.com; s=arc-20260327;
        b=kp7IJoe4TCC8CWXBzGFvNYyLYTO0c5P8+5sYNoTuYymuWcYetHUKbNpo6eDSCVao6R
         p2gWfGuYl4+c76X9l+WZxLsuqLudziuaYUsrYMpgw0WdwwsjA5VXybzLNPnek/FcpyIv
         3SRModioH9T35o7npvhLJIfCKtEvJCwy17rDOqIDTr9/s/Ssn8VinT3b5wgh8C8YKzvs
         +ZsgY8/qvh7Ut1Y9nRLslHPynULelmDrklwDRBrlF3tQHEGGdk7QkOdeBggd19Et+uiS
         D/3tvQYgh0m927Tx8iZKzU8OBaakuRimLYUZzWGWvB84HQsOXzivIiULkhM47PpajDWE
         k8CQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=uvw66+vhRNvfqBiFRqBkRHWchTeyF82H8c57GCkb5nk=;
        fh=zTV3Dkt3TbnQp0/WaqwbiTROpirY79gg/f2ggruLVwY=;
        b=loIjwjYTzlguaSQz4ptqDISd7TD+VxMMFFEg7OCgxNWBBIOx1p2uOdAolNBEBiu1Cd
         7q4vQrceUuRoWfCbwM8F25HgzVruTOn3+1ofq4QZj4mvZzKAXWfTaaBYm3NUIgrulXLp
         GaL6GFXDG0p5nD75lCB1q/9QwoNFo+5AgQIXSN3xuu1STzQC1MEOSse7FRcyQBCA/Ouu
         Wubj9RbOZytx55CeHPo5AhbMmjBHGQ9oa6qEoRrW3Jb97U0N9+AJ9aX5KLwYmpeSMN39
         +SZl24HHrL38z3O4pVH1UCKM6M4iil7hod9VebgpMbyXkzSVSshSKr2lK6FAEwH7lp9S
         goQw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789673939; x=1790278739; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=uvw66+vhRNvfqBiFRqBkRHWchTeyF82H8c57GCkb5nk=;
        b=EmSOc+kRXc8qqZT8+0dd2nGlKeC1VIHFK6KXrpCLXmjRKVioiWwHTB4VQLI68OdB20
         gnaFlMBpVgf/XHyGV8o9YqswhmGnUnJEYFcBvXf6eunw+FZ+iDSCiFgVJr/+iaYMPHWM
         ESrE5juA6oNwr+OJ0j1yqCvyWVUI7vgIU975MZE+vAlSlFrGe86YCOCcuM48C51eh5Lx
         PKPCLhUfPo1KQgdE3CYE9aX8YVtloh1jq32++B6HYtrnqp/JQzlR5MT8x8NadKBOO5an
         gL1GhwJIuXoHH5GLRL2O+mpZs/yx1oWmp06cGN/fWJV7C5BIRBymobceL8b3znLUfwqM
         tW8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789673939; x=1790278739;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=uvw66+vhRNvfqBiFRqBkRHWchTeyF82H8c57GCkb5nk=;
        b=MSn6kglBhBHAmXRRHETY+u9UNVVX792RHlYZqswfwsYi7o1a7LYI1+JL8JMbIzyeZL
         iPH+2kc3Bcx9PMMXgF31xF5rBo2/jIK2VJmBkH00ZeIZzlkA4LaNaiaVRYbo5oX20/Ic
         qXsY0u10aezZyLE8hPkWN9+kj00wXigUjAjt2Sqexp7UsfUtl3yp7Zf6jRwwh33DUhop
         l+O7lj+c+ao12Mkb3qlVL/jdUy6ajfknDN1DRMNjIrtmJ+svg2wOJEGUpeAUy4TLuVcT
         OB34rBZ7pDE7WA7hycWXMRqr9rOPr+ZjPv5U1Fa8vUa0WSb/QD2VH2i2cD/VphNVFb+e
         ewhw==
X-Gm-Message-State: AFuF++mwkN2DgL0knc4BtsPMNly7j78QnHKegypv2gqo/acSLP6Zelq9
	blpHtb4cRINgOmpqd9cOPWThGbmOtrzxYc/xkWfh3D43nMuhzsGGpGBBSbXFBKwKR0/CNOAopxj
	0n7HKgEl9YOzAzlxRW4pK7IHkZHQf7A==
X-Gm-Gg: AYBFou2xWvdrf0SYl0YACI4Js0nBFkcaRcTcBO6CrQQ3FnyuK+n3qVGdD3oZ0kAJxs4
	n0jKBH9+85SVyl+PBYVl3BFQIIXqRkUvCYd8X4zTFp+K1e/TpTIXm/CWnFl9rTuD9SST7oWk68o
	GqbD3+ZGfR4qlO+7nfCCAF1FB5QBPQiCdNmhP1AREgQo2rtXg3sVtEMW9jeVIDGxd9rijSet07s
	WVGtmDsoYWrjgKPLH53raAr/Xn21q9OxXdUtZy4+bf/AXZ0XbPYwUK80SiE8jJviAZvuuiMc7a3
	rujNoibmG75hYNhRxVMtPDL5hDH9qKDOvDYjVwr0NI8TM8PgTvT0MaT4dKt1XhxxAjyervrHmKi
	PeDk9Qtjg9KPSNtJbKZ9KjFfU45eMglX31znfeOsi5RJquH7iqYYKZ+z/IjP48eHO
X-Received: by 2002:a17:907:e895:b0:c29:d0a8:79d3 with SMTP id
 a640c23a62f3a-c2a16555ca6mr12782666b.14.1789673938518; Thu, 17 Sep 2026
 12:38:58 -0700 (PDT)
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Thu, 17 Sep 2026 14:38:56 -0500
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Thu, 17 Sep 2026 14:38:56 -0500
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Myeonghun Pak <mhun512@gmail.com>
Date: Thu, 17 Sep 2026 14:38:56 -0500
X-Gm-Features: AcwNN1VE7wb6WhBCZTA5cbiH9rHwbsomzIyYk4514CYjmv-1kzjg1ciyy8BsNrk
Message-ID: <CAGEsz8GQR2vJ8ddedaLg=Yq_RoeTxgoXTQ4-QS8mJpDXNn36qA@mail.gmail.com>
Subject: [PATCH] usb: gadget: pch_udc: Disable VBUS work before removing the gadget
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Ijae Kim <ae878000@gmail.com>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

The GPIO IRQ can queue irq_work_fall and irq_work_rise, and the PCI IRQ
can also queue irq_work_fall. Neither work is drained during removal, so
its callback can access the gadget driver or controller state after
teardown has started, or the device structure after it has been freed.

Disable and drain both works before unregistering the gadget. Disabling
also prevents the IRQ handlers from requeuing them while their IRQs are
still registered. Initialize both works unconditionally before requesting
the GPIO IRQ so removal can disable them even without a GPIO IRQ.

This issue was identified during our ongoing static-analysis research
while reviewing kernel code.

Fixes: dd63180b758d ("usb: gadget: pch_udc: Detecting VBUS through GPIO")
Fixes: 637b78eb31e0 ("usb: gadget: pch_udc: Detecting VBUS through
GPIO with interrupt")
Cc: stable@vger.kernel.org # 6.10+
Assisted-by: LLM
Co-developed-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
---
 drivers/usb/gadget/udc/pch_udc.c |    8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/gadget/udc/pch_udc.c b/drivers/usb/gadget/udc/pch_udc.c
index 99b3ce28210f..20018c09f6f3 100644
--- a/drivers/usb/gadget/udc/pch_udc.c
+++ b/drivers/usb/gadget/udc/pch_udc.c
@@ -1372,6 +1372,8 @@ static int pch_vbus_gpio_init(struct pch_udc_dev *dev)

 	dev->vbus_gpio.port = NULL;
 	dev->vbus_gpio.intr = 0;
+	INIT_WORK(&dev->vbus_gpio.irq_work_fall, pch_vbus_gpio_work_fall);
+	INIT_WORK(&dev->vbus_gpio.irq_work_rise, pch_vbus_gpio_work_rise);

 	/* Retrieve the GPIO line from the USB gadget device */
 	gpiod = devm_gpiod_get_optional(d, NULL, GPIOD_IN);
@@ -1380,7 +1382,6 @@ static int pch_vbus_gpio_init(struct pch_udc_dev *dev)
 	gpiod_set_consumer_name(gpiod, "pch_vbus");

 	dev->vbus_gpio.port = gpiod;
-	INIT_WORK(&dev->vbus_gpio.irq_work_fall, pch_vbus_gpio_work_fall);

 	irq_num = gpiod_to_irq(gpiod);
 	if (irq_num > 0) {
@@ -1389,8 +1390,6 @@ static int pch_vbus_gpio_init(struct pch_udc_dev *dev)
 			"vbus_detect", dev);
 		if (!err) {
 			dev->vbus_gpio.intr = irq_num;
-			INIT_WORK(&dev->vbus_gpio.irq_work_rise,
-				pch_vbus_gpio_work_rise);
 		} else {
 			pr_err("%s: can't request irq %d, err: %d\n",
 				__func__, irq_num, err);
@@ -2982,6 +2981,9 @@ static void pch_udc_remove(struct pci_dev *pdev)
 {
 	struct pch_udc_dev	*dev = pci_get_drvdata(pdev);

+	disable_work_sync(&dev->vbus_gpio.irq_work_fall);
+	disable_work_sync(&dev->vbus_gpio.irq_work_rise);
+
 	usb_del_gadget_udc(&dev->gadget);

 	/* gadget driver must not be registered */

base-commit: df2908090cda368b01ff43709f51890076c56157
-- 
2.47.1

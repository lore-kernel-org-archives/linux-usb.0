Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD04B3233E8
	for <linux-usb@vger.kernel.org>; Fri,  2 Oct 2026 19:59:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790971171; cv=none; b=qPuA8I28j3dsWCI072o45i4hixUQHD+V+nqWMJyvuQJfANw/tPON+ZCnSs6uWKof27vyy6NdyUeegmk4SnlDMXt/uB3aa13yoiGXhGYd2REhI7ZOHSHLujLwKnoRPd7/zTu2bjsKnJxpyW94/DxzU39VG7cd6RfKIgE/r5knWiM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790971171; c=relaxed/simple;
	bh=hBlTehjyXtv036Ptakn2jOo9KYAnZAOOOFZRIgq3b3A=;
	h=From:Subject:Date:To:Cc:Message-ID:MIME-Version:Content-Type; b=gAoybOVzTmR4kmfn/8K/ctfR+lmBGAxB3JYcvXiAxJRUDtXjuOb8e7Zm3RjhZDq/A+aPtU/jW1EWiX5SCQ9Wti5GgOe8Knxhm8A9DD3qTWLxv/2IOpFBbQ01nEkfOFZZUHRLWFce7si/ivGiE704E8r+GP/DQJnEc9ToCavJPdI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XfYcYSFD; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XfYcYSFD"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-3a4e4e4cb0aso862860a91.1
        for <linux-usb@vger.kernel.org>; Fri, 02 Oct 2026 12:59:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790971169; x=1791575969; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:cc
         :to:date:subject:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LsHN1lyXJDgbA0VSgWXyR/kZrUQuuXTbNHaRDmIqguU=;
        b=XfYcYSFDBg+jEDCze9woBzNUWkN5q4hFCF/Qy6o5XapHmjOmUN+1ff/S3tuCUfk92N
         leu1ga7ha3H50XLNdCU8P4RvATRUksrPwuHPPWrI09g/EwsIUuibc6Er8bSBWxLqBmCJ
         WR/jGQdLhhIE6U/+2ylOkNy0FK+dnUJ7yNH9y+w9+Bbik60MO7wi8Jt3e/dZJ63NMglD
         gb+gJU40xSyQcXhWqXvKKmuGZGK0IXwMbAunglrx8YbjtzCRnkJVNmFCRROoXD89NnbQ
         /uvx2Y0lIUWpgoP4KtpNRvmz+jeYHp5zgzEGC4yCcYTbE58XdYDHxL02lXXpbVkBrgFX
         2hSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790971169; x=1791575969;
        h=content-transfer-encoding:content-type:mime-version:message-id:cc
         :to:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=LsHN1lyXJDgbA0VSgWXyR/kZrUQuuXTbNHaRDmIqguU=;
        b=O1ZtwO8q71qBdpxbIzBVGtRZc8f/GYPr3XlpiVXL9ppyFExSTDjNGBo7JStbmcP4Uf
         mntmFUSkaoF9zwnMV1B4G2gdU2ryk4G9NbZ0qHJx2RpOaqAQ2dhpk1FWJAvkG8gKd1az
         /KiQZBzE4Bf8XfxZJXqha20sQstcYBOvXVP1+cxwyIa5UcClkt3dk8Mi3o832ruWBdSA
         0TTCQVYRn7J6NfMaLoSTT9PzV/LlsWl8vFX9NhxWjvBozzL1PhI/4egKHVVw2NAF1SuE
         ugjrqdQmoVjfQzHtA57Xo2JecH1ZL9uVnuaDxtlYCkBFw5MIEPIoR2ygOqh8OwSjVhsz
         7hPA==
X-Gm-Message-State: AFq9FYLlT6+Ch+Yf2R8Sd/howJpSRk1Qx0B/0Nw4zPWfWnX1arYIDUFn
	TKo9xjGpRk5ZgexE/D/ddmGhGqX3aySqsZ+QuwLOVz0mUAYIIB9TQQA0
X-Gm-Gg: AYBFou37JJ3PuSUyJAOlB+X2lFTGd9CyqYncwdwg3vZ4e7vwUGHuUpGLwDBc6B+dXer
	u499wAFR8iNGr+01wZaasD2ucURKxVkAgmEPe/jf2ZiA6y20Ml6ezSbQ3F8raFqCOrcUuvYYL9F
	BZ/+ag6qo08x4PS0TCOfoihK+TqSyxcLTl4nCuA3/O1qt0th+vExRqmmUJm4Ttw2hvccEk+RjpT
	4i9SXpOB1CHLixZugclOWUjzMa1jqyMnbVp84gFCTyDaYQlc2jscmHA0SaW7r5cUgi03JRtNzVU
	EIuca6mDQhwEgHxxSKnORhtKibO8/kCMDnFDn3vNPOwsblb6ne/3WEERtU8T2kk4sDcapoZgR2w
	iS2GhGtKocHrJrfChuuD9suSmByjyqnGtGQZuhHXbxKWcjXKtbJYJiv8VoRV/atU42uO6zshQD9
	eimvHddRR2dEDnGNSPNdmmBN6eXC4NLqCYah9OGw3o/0WZoOzPLo+7IU0XqcGeIBPluM/QdPJdH
	JB7LIKjZO+ZRY9bLjbiHBQ=
X-Received: by 2002:a17:90a:e70f:b0:3a4:b6c2:b159 with SMTP id 98e67ed59e1d1-3a7873b0ff6mr193781a91.34.1790971169113;
        Fri, 02 Oct 2026 12:59:29 -0700 (PDT)
Received: from SANGHOON. ([1.220.132.212])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a6c8421fe4sm5419796a91.12.2026.10.02.12.59.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 12:59:28 -0700 (PDT)
From: Sang-Hoon Choi <csh0052@gmail.com>
Subject: [PATCH] usb: common: usb-conn-gpio: manage connector ID with devres
Date: Fri, 02 Oct 2026 19:47:40 +0000
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, Chance Yang <chance.yang@kneron.us>,
 Changyul Lee <lcy8047@gmail.com>
Message-ID: <20261003.final019.b1f833b54899139a@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

usb_conn_psy_register() allocates a connector ID, but usb_conn_probe()
does not release it if a later GPIO-to-IRQ conversion or IRQ request
fails. The failed probe therefore leaks the allocated ID.

Manage the ID with a devm action registered before the power supply. This
also makes the ID available only after the power supply has been
unregistered during teardown, avoiding premature reuse of its name.

Fixes: d4e5b10c5562 ("usb: common: usb-conn-gpio: use a unique name for usb connector device")
Reported-by: Changyul Lee <lcy8047@gmail.com>
Assisted-by: LLM
Signed-off-by: Sang-Hoon Choi <csh0052@gmail.com>
---
Compile-tested the affected object with x86_64 allmodconfig
and W=1 (GCC 13.3.0). Base: mainline 3b7cab693ba2bab63774bf5b988e8a61b2ef0f32.
No hardware testing or runtime failure reproduction was performed.

 drivers/usb/common/usb-conn-gpio.c | 23 ++++++++++++++---------
 1 file changed, 14 insertions(+), 9 deletions(-)

diff --git a/drivers/usb/common/usb-conn-gpio.c b/drivers/usb/common/usb-conn-gpio.c
index 421c3af38e06..128ab683f110 100644
--- a/drivers/usb/common/usb-conn-gpio.c
+++ b/drivers/usb/common/usb-conn-gpio.c
@@ -157,6 +157,13 @@ static int usb_charger_get_property(struct power_supply *psy,
 	return 0;
 }
 
+static void usb_conn_ida_free(void *data)
+{
+	struct usb_conn_info *info = data;
+
+	ida_free(&usb_conn_ida, info->conn_id);
+}
+
 static int usb_conn_psy_register(struct usb_conn_info *info)
 {
 	struct device *dev = info->dev;
@@ -164,17 +171,20 @@ static int usb_conn_psy_register(struct usb_conn_info *info)
 	struct power_supply_config cfg = {
 		.fwnode = dev_fwnode(dev),
 	};
+	int ret;
 
 	info->conn_id = ida_alloc(&usb_conn_ida, GFP_KERNEL);
 	if (info->conn_id < 0)
 		return info->conn_id;
 
+	ret = devm_add_action_or_reset(dev, usb_conn_ida_free, info);
+	if (ret)
+		return ret;
+
 	desc->name = devm_kasprintf(dev, GFP_KERNEL, "usb-charger-%d",
 				    info->conn_id);
-	if (!desc->name) {
-		ida_free(&usb_conn_ida, info->conn_id);
+	if (!desc->name)
 		return -ENOMEM;
-	}
 
 	desc->properties = usb_charger_properties;
 	desc->num_properties = ARRAY_SIZE(usb_charger_properties);
@@ -183,10 +193,8 @@ static int usb_conn_psy_register(struct usb_conn_info *info)
 	cfg.drv_data = info;
 
 	info->charger = devm_power_supply_register(dev, desc, &cfg);
-	if (IS_ERR(info->charger)) {
+	if (IS_ERR(info->charger))
 		dev_err(dev, "Unable to register charger %d\n", info->conn_id);
-		ida_free(&usb_conn_ida, info->conn_id);
-	}
 
 	return PTR_ERR_OR_ZERO(info->charger);
 }
@@ -294,9 +302,6 @@ static void usb_conn_remove(struct platform_device *pdev)
 
 	cancel_delayed_work_sync(&info->dw_det);
 
-	if (info->charger)
-		ida_free(&usb_conn_ida, info->conn_id);
-
 	if (info->last_role == USB_ROLE_HOST && info->vbus)
 		regulator_disable(info->vbus);
 

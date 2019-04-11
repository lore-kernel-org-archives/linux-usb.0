Return-Path: <SRS0=u5rC=SN=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC2DDC10F14
	for <linux-usb@archiver.kernel.org>; Thu, 11 Apr 2019 09:30:57 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 7D1F720850
	for <linux-usb@archiver.kernel.org>; Thu, 11 Apr 2019 09:30:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20150623.gappssmtp.com header.i=@bgdev-pl.20150623.gappssmtp.com header.b="pSiMv8vG"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727069AbfDKJa4 (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Thu, 11 Apr 2019 05:30:56 -0400
Received: from mail-wr1-f67.google.com ([209.85.221.67]:40854 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727048AbfDKJag (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 11 Apr 2019 05:30:36 -0400
Received: by mail-wr1-f67.google.com with SMTP id h4so6364785wre.7
        for <linux-usb@vger.kernel.org>; Thu, 11 Apr 2019 02:30:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=WkiOzqo+5E8+PTnExhJYSKG8TC17kxUDe5ZrFElD/ZE=;
        b=pSiMv8vGTnAkAA5ZD/t+q0QDKbr3hGnuC9nvm1K+lxdLwzwA9OBpFqyNp+SvYFHIjO
         HBQ210SWTcRnBO5NG7ddnauELTGKgYpN/8Xo+PBi+qhuX1EKve/mnZZ2NhZTo44JIiAX
         HBZh/hx7zRDK2ywHDeUMOleKABL8ZaqSzV7sktZB5+QJY0B3FKdrzamUw6VvXytF1bIU
         /g/6c5l1jR8BAQS0TD0FAZCsx7xa6dEBNIEfxJ7NU6Xlq2QnszCNKj4foB+dzJwH1b9W
         AdHke2zNDyt+8kjdb3UcwwAEky3BsTONWrsFcB3NQQisS7sIIDkzVFGGOovAkUdsrRS6
         hepQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=WkiOzqo+5E8+PTnExhJYSKG8TC17kxUDe5ZrFElD/ZE=;
        b=qkKNumJZwhhmh7fVSqImoPOkw9pH/MXywS9ZgQR3suCekHonXHNG1Z/twkEOZGWKfk
         RLe5ud/6617DPL0Kgps7hzN5VgmgEX+BEIkyMX5xLz5VGxVa8L3ZeNawMKhdipdKJ64T
         J3xao3SdsmFezubvEZ9euYNE/9HO7TVGQEXn/cdSyIgKwcrPnF2tfZRc1Jgmv2404ICK
         htrHzku2+bKlhQn2gLJGDzyoiv+9EEqeUoKTzqrfAMHWYdVBcWB+oGHDRyS1u5W+tLUt
         7LjpSSlvNglCe+I2ETKar6Vt+wRtyqf0JrTYYo3/qvHcAavduopAmp29GWTmjzhZMA+Y
         Z9RQ==
X-Gm-Message-State: APjAAAU4mVWT+VHjkteBAOtQOpsMYWRuJriBWi/tLUGNjX5Wj+QU5/ry
        RWvuoNuyh/RoQ+7HVBLKrfgDOQ==
X-Google-Smtp-Source: APXvYqzOpyEjB/oB5XG7AGE4nIgSzkOFteiT5lned3TjvVNYpG9wNDANqNjCiO/wKHvqabef/FXn/w==
X-Received: by 2002:a05:6000:1152:: with SMTP id d18mr29433056wrx.32.1554975034451;
        Thu, 11 Apr 2019 02:30:34 -0700 (PDT)
Received: from debian-brgl.home ([2a01:cb1d:af:5b00:6d6c:8493:1ab5:dad7])
        by smtp.gmail.com with ESMTPSA id a9sm37517228wrt.29.2019.04.11.02.30.33
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 11 Apr 2019 02:30:33 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Sekhar Nori <nsekhar@ti.com>, Kevin Hilman <khilman@kernel.org>,
        Alan Stern <stern@rowland.harvard.edu>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH v4 4/6] ARM: davinci: omapl138-hawk: add a fixed regulator for ohci-da8xx
Date:   Thu, 11 Apr 2019 11:30:22 +0200
Message-Id: <20190411093024.23555-5-brgl@bgdev.pl>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190411093024.23555-1-brgl@bgdev.pl>
References: <20190411093024.23555-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190411093022.P70ariR-JrqTpI5QZqAZL-TQaRm-JAIdCXNuqeLuSpw@z>

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

Instead of directly using the vbus GPIO we should model it as a fixed
regulator. Add all necessary fix-ups for the regulator to be registered
and configure the vbus GPIO as its enable pin.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 arch/arm/mach-davinci/board-omapl138-hawk.c | 49 +++++++++++++++++++--
 1 file changed, 46 insertions(+), 3 deletions(-)

diff --git a/arch/arm/mach-davinci/board-omapl138-hawk.c b/arch/arm/mach-davinci/board-omapl138-hawk.c
index e244c8648594..db177a6a7e48 100644
--- a/arch/arm/mach-davinci/board-omapl138-hawk.c
+++ b/arch/arm/mach-davinci/board-omapl138-hawk.c
@@ -21,6 +21,7 @@
 #include <linux/platform_data/mtd-davinci.h>
 #include <linux/platform_data/mtd-davinci-aemif.h>
 #include <linux/platform_data/ti-aemif.h>
+#include <linux/regulator/fixed.h>
 #include <linux/regulator/machine.h>
 
 #include <asm/mach-types.h>
@@ -298,15 +299,50 @@ static const short da850_hawk_usb11_pins[] = {
 	-1
 };
 
-static struct gpiod_lookup_table hawk_usb_gpio_lookup = {
+static struct regulator_consumer_supply hawk_usb_supplies[] = {
+	REGULATOR_SUPPLY("vbus", NULL),
+};
+
+static struct regulator_init_data hawk_usb_vbus_data = {
+	.consumer_supplies	= hawk_usb_supplies,
+	.num_consumer_supplies	= ARRAY_SIZE(hawk_usb_supplies),
+};
+
+static struct fixed_voltage_config hawk_usb_vbus = {
+	.supply_name		= "vbus",
+	.microvolts		= 3300000,
+	.init_data		= &hawk_usb_vbus_data,
+};
+
+static struct platform_device hawk_usb_vbus_device = {
+	.name		= "reg-fixed-voltage",
+	.id		= 0,
+	.dev		= {
+		.platform_data = &hawk_usb_vbus,
+	},
+};
+
+static struct gpiod_lookup_table hawk_usb_oc_gpio_lookup = {
 	.dev_id		= "ohci-da8xx",
 	.table = {
-		GPIO_LOOKUP("davinci_gpio", DA850_USB1_VBUS_PIN, "vbus", 0),
 		GPIO_LOOKUP("davinci_gpio", DA850_USB1_OC_PIN, "oc", 0),
 		{ }
 	},
 };
 
+static struct gpiod_lookup_table hawk_usb_vbus_gpio_lookup = {
+	.dev_id		= "reg-fixed-voltage.0",
+	.table = {
+		GPIO_LOOKUP("davinci_gpio", DA850_USB1_VBUS_PIN, NULL, 0),
+		{ }
+	},
+};
+
+static struct gpiod_lookup_table *hawk_usb_gpio_lookups[] = {
+	&hawk_usb_oc_gpio_lookup,
+	&hawk_usb_vbus_gpio_lookup,
+};
+
 static struct da8xx_ohci_root_hub omapl138_hawk_usb11_pdata = {
 	/* TPS2087 switch @ 5V */
 	.potpgt         = (3 + 1) / 2,  /* 3 ms max */
@@ -327,12 +363,19 @@ static __init void omapl138_hawk_usb_init(void)
 		pr_warn("%s: USB PHY CLK registration failed: %d\n",
 			__func__, ret);
 
+	gpiod_add_lookup_tables(hawk_usb_gpio_lookups,
+				ARRAY_SIZE(hawk_usb_gpio_lookups));
+
 	ret = da8xx_register_usb_phy();
 	if (ret)
 		pr_warn("%s: USB PHY registration failed: %d\n",
 			__func__, ret);
 
-	gpiod_add_lookup_table(&hawk_usb_gpio_lookup);
+	ret = platform_device_register(&hawk_usb_vbus_device);
+	if (ret) {
+		pr_warn("%s: Unable to register the vbus supply\n", __func__);
+		return;
+	}
 
 	ret = da8xx_register_usb11(&omapl138_hawk_usb11_pdata);
 	if (ret)
-- 
2.21.0


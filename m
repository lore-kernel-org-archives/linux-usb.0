Return-Path: <SRS0=tIEv=SZ=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15826C282DD
	for <linux-usb@archiver.kernel.org>; Tue, 23 Apr 2019 08:51:57 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id D6E4220843
	for <linux-usb@archiver.kernel.org>; Tue, 23 Apr 2019 08:51:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="ihj+o2Zm"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727094AbfDWIvv (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Tue, 23 Apr 2019 04:51:51 -0400
Received: from mail-wr1-f67.google.com ([209.85.221.67]:38795 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726991AbfDWIvg (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 23 Apr 2019 04:51:36 -0400
Received: by mail-wr1-f67.google.com with SMTP id f14so18525660wrj.5
        for <linux-usb@vger.kernel.org>; Tue, 23 Apr 2019 01:51:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=coKjxKEGXPOOgyUNg/X4oYYa6DNUzfkR3oMZh6thI8k=;
        b=ihj+o2ZmtmjS3IXh+DTe7xY3Q/wvndiKyf4IBEXxM3dQd4o8dwgq+d7GAfShEyu+Nz
         4pL6CcLuTMiwugg8guG56xbbYfpzBnbkxmv3+P9ILJXDf8fTJsNVSi/iAbJq5+PM5N1w
         Czj8BYpaIRv4O8+ATXw4kpI5ZUo5LfINnbscU2vZPI8WR3a33JmktoTZ6rXbAaGP1AeX
         cyynp7snEhs9mvji0QMwPFC3uq9ynKKaI5zXJnI6NH7HlnB9bEeugWkpP5bW1EsbEbIz
         XDyy2nqQZRgGCqjpCAEfty51r+0zICh5QjSIP2KyIrTzL6a2yzdZKJOXjiG2rbIdFaDO
         VQTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=coKjxKEGXPOOgyUNg/X4oYYa6DNUzfkR3oMZh6thI8k=;
        b=cNOCC4cWCCVgHN7tyW/vbjhHklLjD9RNojRV7sl0KumcXe1G+Kd3Qjon6yQbQaB8Qi
         x1XzTst05dtMc1MHVsXxoIp8dO+m4LEcjfPYX6aQ3DNCviz86t9UhK6suuddOrW+6SIx
         TvnZY5ZFw5nu4UZ1XbbK/WR26qXMYRWLIutBqwFYfIe9Mo0GFcccDqqQfQEYFEVfYyvQ
         X1k5mvEBz9QbbQxNuOkxCZ1Hh8OP8uA3mYIvxVoBxyGBRgQqUA17g5EXmd+UGk/jMwsY
         7vHKjNb/rCgYGZoO/i4CfIgAMaBgRzd4A5ZbEvFKQrDqjxojMAUcFwhW94bjAEc2WRsD
         mFzg==
X-Gm-Message-State: APjAAAWVqdFkft0jBHhtNCMgpCrPL/7PnmkFM9pfXP9vl6eoPcZjPaeU
        Ptm0nyA4P3HZZKI9XN5C2jHgSg==
X-Google-Smtp-Source: APXvYqyW/gIU7AhNE1eDBER3np45Wvdh3xrRnMDM4D6q4COqDjzzUTJIN8//q+XpGVfl8Whe2SDRzQ==
X-Received: by 2002:a5d:62cf:: with SMTP id o15mr9862063wrv.45.1556009494215;
        Tue, 23 Apr 2019 01:51:34 -0700 (PDT)
Received: from bender.baylibre.local (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.gmail.com with ESMTPSA id b8sm12515566wrr.64.2019.04.23.01.51.33
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Tue, 23 Apr 2019 01:51:33 -0700 (PDT)
From:   Neil Armstrong <narmstrong@baylibre.com>
To:     gregkh@linuxfoundation.org, hminas@synopsys.com, balbi@kernel.org,
        kishon@ti.com, chunfeng.yun@mediatek.com
Cc:     Neil Armstrong <narmstrong@baylibre.com>,
        linux-amlogic@lists.infradead.org, linux-usb@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH v6 3/4] usb: dwc2: Add Amlogic G12A DWC2 Params
Date:   Tue, 23 Apr 2019 10:51:26 +0200
Message-Id: <20190423085127.3863-4-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190423085127.3863-1-narmstrong@baylibre.com>
References: <20190423085127.3863-1-narmstrong@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190423085126.r6HBqul4vLW9-_suyWgooROGv8qSsb1T6rQDmvOi79U@z>

This patchs sets the params for the DWC2 Controller found in the
Amlogic G12A SoC family.

It mainly sets the settings reported incorrect by the driver,
leaving the remaining detected automatically by the driver and
provided by the DT node.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
Acked-by: Minas Harutyunyan <hminas@synopsys.com>
---
 drivers/usb/dwc2/params.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/usb/dwc2/params.c b/drivers/usb/dwc2/params.c
index 24ff5f21cb25..442113246cba 100644
--- a/drivers/usb/dwc2/params.c
+++ b/drivers/usb/dwc2/params.c
@@ -121,6 +121,16 @@ static void dwc2_set_amlogic_params(struct dwc2_hsotg *hsotg)
 	p->power_down = DWC2_POWER_DOWN_PARAM_NONE;
 }
 
+static void dwc2_set_amlogic_g12a_params(struct dwc2_hsotg *hsotg)
+{
+	struct dwc2_core_params *p = &hsotg->params;
+
+	p->lpm = false;
+	p->lpm_clock_gating = false;
+	p->besl = false;
+	p->hird_threshold_en = false;
+}
+
 static void dwc2_set_amcc_params(struct dwc2_hsotg *hsotg)
 {
 	struct dwc2_core_params *p = &hsotg->params;
@@ -167,6 +177,8 @@ const struct of_device_id dwc2_of_match_table[] = {
 	  .data = dwc2_set_amlogic_params },
 	{ .compatible = "amlogic,meson-gxbb-usb",
 	  .data = dwc2_set_amlogic_params },
+	{ .compatible = "amlogic,meson-g12a-usb",
+	  .data = dwc2_set_amlogic_g12a_params },
 	{ .compatible = "amcc,dwc-otg", .data = dwc2_set_amcc_params },
 	{ .compatible = "st,stm32f4x9-fsotg",
 	  .data = dwc2_set_stm32f4x9_fsotg_params },
-- 
2.21.0


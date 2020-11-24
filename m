Return-Path: <linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94AE8C63798
	for <linux-usb@archiver.kernel.org>; Tue, 24 Nov 2020 16:40:13 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3BE272063A
	for <linux-usb@archiver.kernel.org>; Tue, 24 Nov 2020 16:40:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="czCZnm3H"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390424AbgKXQje (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Tue, 24 Nov 2020 11:39:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35196 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726105AbgKXQjd (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 24 Nov 2020 11:39:33 -0500
Received: from mail-qv1-xf44.google.com (mail-qv1-xf44.google.com [IPv6:2607:f8b0:4864:20::f44])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A4385C0613D6
        for <linux-usb@vger.kernel.org>; Tue, 24 Nov 2020 08:39:33 -0800 (PST)
Received: by mail-qv1-xf44.google.com with SMTP id 9so6697488qvk.9
        for <linux-usb@vger.kernel.org>; Tue, 24 Nov 2020 08:39:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=s6LR8uRjQdRvLEv8j5xeCwm4vaQ8Erfd1B4yEz6MGs4=;
        b=czCZnm3HH2iQG5a5Rf0S6naa+gqkFPxBlWlSu3FXaGV2C7blqdrAClkOqrA3C2olEq
         XSWk5fBtD8Fayv6ra333tyqmn9abcCMMjgCtZhQueRAFHa0CG0tafIPKjPLZZxi4ySsw
         GKNbZzZA0M7Yl/0xXLqw4VU2lrk9FuEPoC5HrAYRwHtn+2Ueu2AS2J+8KiZ4YcBtwLiR
         4YhG+Qq9nJLctao9xcI19LdpgEPEANO+cYK/lgm80SO7tI8sBcJ4EZYE5kMt87ny0gS0
         vTQ924VrZPzGSpXASTOVjS92fSm3JUWXmH+/OBY/G3le77Pq5Q8Y7bK6hz9N+UVrWIqL
         nCkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=s6LR8uRjQdRvLEv8j5xeCwm4vaQ8Erfd1B4yEz6MGs4=;
        b=JDeU7ghkZEdUtGZJcqDWTezTUmg0PqFP04BpxJ8gjvp2lFjYhNRGt6ok2rOI2UULLz
         7hGI95Ff/JbgszXioUCvVCPcZ7q6eKFnGd5/3sfP3h9itJa49eSRqHN5fXEX+6Z9KzB9
         OiXjLJGfE1/6uy5gF+hRWhUfYGvlkwT0GFMMXf9YapAJAFhmjwG49sYOfQwC+3lpQyl+
         YRounTgxCr0fUICFzAcnDt5Te7otu7H6faujveNYXhZFK70o6lR9Tu6WxE944u8cu4Mc
         xrKx9y1zWtk7yf5WrtopA3GLLWK8FEYS6YtqxmGEWcQ8yJGkWv5fprTdQin/uy2ODNPt
         OdmA==
X-Gm-Message-State: AOAM531TrcS86GQ6wMG/SI5MuVqvrdiq9TbTEAiUvDAEMEnnV7jTybVd
        hzw1tDA7Jjo9ZlZAGOIZohpnhfR6mDBfUw==
X-Google-Smtp-Source: ABdhPJyn2N1Dxqruz58Rqn3T3jZCnbPZSNJi1Rdb8pBUh5JUZmjC9Ld8kU9lTX/jrVKJ12Vjse7Rgg==
X-Received: by 2002:a05:6214:c2d:: with SMTP id a13mr5471158qvd.23.1606235972904;
        Tue, 24 Nov 2020 08:39:32 -0800 (PST)
Received: from localhost.localdomain ([2804:14c:482:c91:9ce8:56e7:5368:ece8])
        by smtp.gmail.com with ESMTPSA id o21sm14060909qko.9.2020.11.24.08.39.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2020 08:39:32 -0800 (PST)
From:   Fabio Estevam <festevam@gmail.com>
To:     Peter.Chen@nxp.com
Cc:     gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
        Fabio Estevam <festevam@gmail.com>
Subject: [PATCH 2/3] usb: chipidea: usbmisc_imx: Use of_device_get_match_data()
Date:   Tue, 24 Nov 2020 13:39:11 -0300
Message-Id: <20201124163912.12074-2-festevam@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201124163912.12074-1-festevam@gmail.com>
References: <20201124163912.12074-1-festevam@gmail.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The retrieval of driver data via of_device_get_match_data() can make
the code simpler.

Use of_device_get_match_data() to simplify the code.

Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
 drivers/usb/chipidea/usbmisc_imx.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/usb/chipidea/usbmisc_imx.c b/drivers/usb/chipidea/usbmisc_imx.c
index 6d8331e7da99..4545b23bda3f 100644
--- a/drivers/usb/chipidea/usbmisc_imx.c
+++ b/drivers/usb/chipidea/usbmisc_imx.c
@@ -1134,11 +1134,6 @@ MODULE_DEVICE_TABLE(of, usbmisc_imx_dt_ids);
 static int usbmisc_imx_probe(struct platform_device *pdev)
 {
 	struct imx_usbmisc *data;
-	const struct of_device_id *of_id;
-
-	of_id = of_match_device(usbmisc_imx_dt_ids, &pdev->dev);
-	if (!of_id)
-		return -ENODEV;
 
 	data = devm_kzalloc(&pdev->dev, sizeof(*data), GFP_KERNEL);
 	if (!data)
@@ -1150,7 +1145,7 @@ static int usbmisc_imx_probe(struct platform_device *pdev)
 	if (IS_ERR(data->base))
 		return PTR_ERR(data->base);
 
-	data->ops = (const struct usbmisc_ops *)of_id->data;
+	data->ops = of_device_get_match_data(&pdev->dev);
 	platform_set_drvdata(pdev, data);
 
 	return 0;
-- 
2.17.1


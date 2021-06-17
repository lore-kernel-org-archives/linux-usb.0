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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D5EFC49EAF
	for <linux-usb@archiver.kernel.org>; Thu, 17 Jun 2021 16:28:06 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4BB7D613CE
	for <linux-usb@archiver.kernel.org>; Thu, 17 Jun 2021 16:28:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232405AbhFQQaL (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Thu, 17 Jun 2021 12:30:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34846 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231856AbhFQQaK (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 17 Jun 2021 12:30:10 -0400
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com [IPv6:2a00:1450:4864:20::236])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D9219C061574;
        Thu, 17 Jun 2021 09:28:01 -0700 (PDT)
Received: by mail-lj1-x236.google.com with SMTP id d2so9832874ljj.11;
        Thu, 17 Jun 2021 09:28:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=7+Z1bV4FOTanHXemOPJDEdNQl11Mbnn5WjwrTgxFZG8=;
        b=rZtfsjtjz//HOJ58os6SGx9pDu6tubGCGWZkoCII4wh4LRVejhac9iaVm6hMVn8W/G
         p+uspfmfAxziOhyCFXYBOJAOHb7JGWGMFxXmTWJwYNnyTcMOY70p87/Kc/tVvivTsmbo
         oaurNtD4FNXqdO8QRZU7UJ+SzdGybxdsqJZPrhrZ5YlnQT+TdAeOxnGjdU4z55m0A/k2
         TTF1mxJXMZlYPIltu7H3eZxmkUkrAc7vMkxGAYzueBc0N8TsYv3nsOQyHjVfxOEfcYk9
         13ERMDMc8peKRKIsjVqUY0lg5kHZyECx3KyHeQxv+r0MM5Eo3+AqKLAtnqcj2dI4FVvw
         pO7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=7+Z1bV4FOTanHXemOPJDEdNQl11Mbnn5WjwrTgxFZG8=;
        b=ha76ltnn4a1ANJJ5AsrkwEXVVEnQnB5rcqDkz72JU6VypkVKkXxef5UkbY/Yte2kca
         aB6ys948Q49LnyAVfMPqdCxd7CLsLLLaw+3pZzwPEnPQSyDQ+6Xba7KDEwwuZUatx5nd
         AY7xRlYPu28YCvhfa7mCvgZ4DrUGMUYYKVBkRpYvlKmJdfG+TuO+feSHdYn7JMlL8fWc
         uU11pAmuKhpos7Ul0znHGslzN5CV7w6CqnQy51SleotyU8RLc9YzJGK0lvdTcutnNvli
         cfbG/83kMFT0bSn/pittiE765+JPDpdpvc54aej3CxCiFKdYvAIZhwqW5yyBW9yYWYBb
         YE0Q==
X-Gm-Message-State: AOAM533YIvzUdVxa6xwT+/lEFOmIsTtaTKsfbuNLLLSbak+WRVNoHtEf
        dkAyKS+RmSylz+ktO/Lz+jo=
X-Google-Smtp-Source: ABdhPJwajEKCsQmHWuHngDG4xSYmOCNXpaXzwwD6d5I1/UQIjqzezIxD9P1BKJfnpL8V8vjrOopooA==
X-Received: by 2002:a05:651c:324:: with SMTP id b4mr5367779ljp.166.1623947280259;
        Thu, 17 Jun 2021 09:28:00 -0700 (PDT)
Received: from localhost ([195.238.92.77])
        by smtp.gmail.com with ESMTPSA id n18sm625065lfe.174.2021.06.17.09.27.58
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 17 Jun 2021 09:27:58 -0700 (PDT)
From:   Ruslan Bilovol <ruslan.bilovol@gmail.com>
To:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Fabien Chouteau <fabien.chouteau@barco.com>,
        Segiy Stetsyuk <serg_stetsuk@ukr.net>,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        stable@kernel.org
Subject: [PATCH] usb: gadget: f_hid: fix endianness issue with descriptors
Date:   Thu, 17 Jun 2021 19:27:55 +0300
Message-Id: <20210617162755.29676-1-ruslan.bilovol@gmail.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Running sparse checker it shows warning message about
incorrect endianness used for descriptor initialization:

| f_hid.c:91:43: warning: incorrect type in initializer (different base types)
| f_hid.c:91:43:    expected restricted __le16 [usertype] bcdHID
| f_hid.c:91:43:    got int

Fixing issue with cpu_to_le16() macro

Fixes: 71adf1189469 ("USB: gadget: add HID gadget driver")
Cc: Fabien Chouteau <fabien.chouteau@barco.com>
Cc: Segiy Stetsyuk <serg_stetsuk@ukr.net>
Cc: stable@kernel.org
Signed-off-by: Ruslan Bilovol <ruslan.bilovol@gmail.com>
---
 drivers/usb/gadget/function/f_hid.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/gadget/function/f_hid.c b/drivers/usb/gadget/function/f_hid.c
index 70774d8cb14e..02683ac0719d 100644
--- a/drivers/usb/gadget/function/f_hid.c
+++ b/drivers/usb/gadget/function/f_hid.c
@@ -88,7 +88,7 @@ static struct usb_interface_descriptor hidg_interface_desc = {
 static struct hid_descriptor hidg_desc = {
 	.bLength			= sizeof hidg_desc,
 	.bDescriptorType		= HID_DT_HID,
-	.bcdHID				= 0x0101,
+	.bcdHID				= cpu_to_le16(0x0101),
 	.bCountryCode			= 0x00,
 	.bNumDescriptors		= 0x1,
 	/*.desc[0].bDescriptorType	= DYNAMIC */
-- 
2.17.1


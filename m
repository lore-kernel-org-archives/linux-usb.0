Return-Path: <SRS0=qLpr=EG=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6974C388F7
	for <linux-usb@archiver.kernel.org>; Sat, 31 Oct 2020 17:19:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 972FE207DE
	for <linux-usb@archiver.kernel.org>; Sat, 31 Oct 2020 17:19:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="vMu1gXrr"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728158AbgJaRTf (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Sat, 31 Oct 2020 13:19:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57194 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726586AbgJaRTf (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 31 Oct 2020 13:19:35 -0400
Received: from mail-qk1-x744.google.com (mail-qk1-x744.google.com [IPv6:2607:f8b0:4864:20::744])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D19FBC0617A6;
        Sat, 31 Oct 2020 10:19:33 -0700 (PDT)
Received: by mail-qk1-x744.google.com with SMTP id o205so1122054qke.10;
        Sat, 31 Oct 2020 10:19:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
        bh=VQlGBb8M5jgrHCNctQCHW/goIscpJbN90wm8vcO5ynk=;
        b=vMu1gXrr4HKw49O9BvBSO+oIzPQAaXyHwaCDcXiQwH+XL3kgCNQj62lHxnMQEEkEMd
         ilPnsVXyRhvYVvDUItIfD+O3Hf2t47ARQz2auIG4rr/JyghXt8CJzWBFbKl7SwRAod2X
         7vvRjFFlQX7KwUvhg1L13qo/GUvCDbGoQH6PMYu3uXqHw0MHQCzZopJC8etk2i0zk6Ua
         aEncPepJhLDKskmFIhH2Ry+Pt3e5nM+vcO3feXaKkcpup+TL6rDzI7s4K4pXra4eX5Hs
         e4sZyadcK3q20Vt1J4rKhWOlFBKcjUBGgvyvjGRUwQB313NNV9hQx7vFT9/Un4wPOdYt
         g1Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=VQlGBb8M5jgrHCNctQCHW/goIscpJbN90wm8vcO5ynk=;
        b=fr966P/6b9sthjAlkjUXjIskh88NLZ7x2LLi6nM+kjT8cj4lvRqvlZ4KV2spLxS2bC
         tdcP+doP7Bx280gK10OlAsgRawnZR+eB6DKH/QaNo5b017fu58DAqpwpFRPFlfRm3CTQ
         aoVt2sAobNVjgyWzxM78hhXXwVdtsc/7eHWMLRdvY+1v3wa2KdYDoIF3KOeYsI8Igq4G
         FPFxaIPxEeGdHRUCf3+oIzPLzPZi6uARsHWrlz4pWy0Lzf0PC9AdSMoVutyRjUYJu06e
         FzQPbhYYxXeg41vm0oxj4juvIk5XMfpdKdIgovO5EYYehQVQu4nmY9W34S7gRRYa+b/2
         C5bQ==
X-Gm-Message-State: AOAM530yQ2HZs4b0rtKq3VL5+XqsepTtTGfNd7K9ELsjUTjBHLf8J0Ld
        aZ6VmDbUd15sf55jSd0Cuxw=
X-Google-Smtp-Source: ABdhPJxORmnEl4mCjT7RkUqG2A+iG1mPNrcKGA+6JEE/VxNkQxTmRNDz46NZUWtFi3ViCKpBzWfVqg==
X-Received: by 2002:a05:620a:2148:: with SMTP id m8mr7651515qkm.19.1604164773134;
        Sat, 31 Oct 2020 10:19:33 -0700 (PDT)
Received: from fedora-project ([2604:2000:ffc0:0:74b0:102f:8bef:7279])
        by smtp.gmail.com with ESMTPSA id r190sm4770134qkf.101.2020.10.31.10.19.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Oct 2020 10:19:32 -0700 (PDT)
Date:   Sat, 31 Oct 2020 13:19:30 -0400
From:   Nigel Christian <nigel.l.christian@gmail.com>
To:     gregkh@linuxfoundation.org, lee.jones@linaro.org
Cc:     linux-usb@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] usb: core: ledtrig-usbport: use octal permission
Message-ID: <20201031171930.GA21555@fedora-project>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Change read/write for owner permission from symbolic to octal
to enhance readability. This patch reduces checkpatch warnings 
for this file to nil.

see: https://lkml.org/lkml/2016/8/2/1945

verified via chmod(2) man page

Signed-off-by: Nigel Christian <nigel.l.christian@gmail.com>
---
 drivers/usb/core/ledtrig-usbport.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/core/ledtrig-usbport.c b/drivers/usb/core/ledtrig-usbport.c
index ba371a24ff78..8e9b1c5cc971 100644
--- a/drivers/usb/core/ledtrig-usbport.c
+++ b/drivers/usb/core/ledtrig-usbport.c
@@ -211,7 +211,7 @@ static int usbport_trig_add_port(struct usbport_trig_data *usbport_data,
 
 	sysfs_attr_init(&port->attr.attr);
 	port->attr.attr.name = port->port_name;
-	port->attr.attr.mode = S_IRUSR | S_IWUSR;
+	port->attr.attr.mode = 0600;
 	port->attr.show = usbport_trig_port_show;
 	port->attr.store = usbport_trig_port_store;
 
-- 
2.28.0


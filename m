Return-Path: <linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6784EC433DB
	for <linux-usb@archiver.kernel.org>; Tue,  9 Feb 2021 11:47:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2580A64E3B
	for <linux-usb@archiver.kernel.org>; Tue,  9 Feb 2021 11:47:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230243AbhBILqk (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Tue, 9 Feb 2021 06:46:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59500 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230148AbhBILch (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 9 Feb 2021 06:32:37 -0500
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com [IPv6:2a00:1450:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 68AA3C061788
        for <linux-usb@vger.kernel.org>; Tue,  9 Feb 2021 03:30:45 -0800 (PST)
Received: by mail-ej1-x635.google.com with SMTP id l25so13395384eja.9
        for <linux-usb@vger.kernel.org>; Tue, 09 Feb 2021 03:30:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=monstr-eu.20150623.gappssmtp.com; s=20150623;
        h=sender:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=4Cc/NxXbi0ROQmi6zjbqfj7rO7MXw50b30zClq/e2GI=;
        b=mMN8XnaALvkLObFNgyWZfPvtdpEyjnFILfDnQIu9xicD/I86YNjJz0SWh2jExSPLIg
         B9/qrXDcRLxwRIpHSzmJ3MaC28lmd3GRQAQYk2WfLKa+28KNhmlEyENjgRl4ZSMon++f
         n8cYW+cICwnCJ1jIq3HZKTK6AyZfSNL/2hfChDdu/HFT05f9361/V7I7iW7hRXUgokNn
         Lgcw8tZcg3wCDn6Axg6Knyf91+YMFmPo8FE2i4DH3YIYYxL0QmZEjEEEPp9xm66S5P+m
         DIEf68Wtu7aqgSMHg4EGoi3+eBPSE/2WQuwMVbf7TAkp1HibYQOmCC7xOoqsrwvO6rFO
         q/1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :mime-version:content-transfer-encoding;
        bh=4Cc/NxXbi0ROQmi6zjbqfj7rO7MXw50b30zClq/e2GI=;
        b=VAsQhnRzJbdz9/nonUc+Giq/5cUkx0gRE/EHDjdJmVwKSODHjTQGuPBh4suwFOhI42
         JLzxkBZhyf2MZ8yuDwh/X2ci6weUvAn+8kPEIgzch2uWUHT2hG6vZQskmL5WU39Rti4b
         BpkwHzcd0sCmKqds+ZaQJft2lNyuQnAhr2Eu/pBF6KqlYqvrBQZPqvXB+FMf3nikXtgG
         1qKSK+5vrqaSRvdiKkzgT1sfeb8676AuML1c1gRSc02/1WaDWBcoorHefPU/Srwjq4UN
         w40xwMBf+O/TyfYVaqU37tngzIuaDvbMdorDhkyHKsFOY2Lv5j1H1fzzP4KrZ7I9jCIj
         ljvw==
X-Gm-Message-State: AOAM531AOIAiCB2oNY1MB+aiyavVmiGI7bmA6/W6354RQvOAhGrK7aF+
        r6h4T9o05BzZpKDz1nxlZKWlqhhPFBdrzg==
X-Google-Smtp-Source: ABdhPJy2JdgHnVkveR0dqLGR3SGkdU3jnwwK4J4XdPiF5OX5qIuu3Rj8X9+8MloUvIYO/+xYjJciTA==
X-Received: by 2002:a17:906:8159:: with SMTP id z25mr21824242ejw.270.1612870244214;
        Tue, 09 Feb 2021 03:30:44 -0800 (PST)
Received: from localhost (nat-35.starnet.cz. [178.255.168.35])
        by smtp.gmail.com with ESMTPSA id f6sm7382871edm.15.2021.02.09.03.30.43
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 09 Feb 2021 03:30:43 -0800 (PST)
Sender: Michal Simek <monstr@monstr.eu>
From:   Michal Simek <michal.simek@xilinx.com>
To:     linux-kernel@vger.kernel.org, monstr@monstr.eu,
        michal.simek@xilinx.com, git@xilinx.com
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Paul Cercueil <paul@crapouillou.net>, linux-usb@vger.kernel.org
Subject: [PATCH] usb: misc: usb3503: Fix logic in usb3503_init()
Date:   Tue,  9 Feb 2021 12:30:42 +0100
Message-Id: <4ae929dc31c170252154352d04e89c8456d91ca3.1612870239.git.michal.simek@xilinx.com>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Based on
https://lore.kernel.org/linux-arm-kernel/YCJv59g3Tq2haDSa@kroah.com/
initialization should fail if any registration fails.

Signed-off-by: Michal Simek <michal.simek@xilinx.com>
---

 drivers/usb/misc/usb3503.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/misc/usb3503.c b/drivers/usb/misc/usb3503.c
index 48099c6bf04c..3aae83fbebae 100644
--- a/drivers/usb/misc/usb3503.c
+++ b/drivers/usb/misc/usb3503.c
@@ -409,13 +409,17 @@ static int __init usb3503_init(void)
 	int err;
 
 	err = i2c_add_driver(&usb3503_i2c_driver);
-	if (err != 0)
+	if (err) {
 		pr_err("usb3503: Failed to register I2C driver: %d\n", err);
+		return err;
+	}
 
 	err = platform_driver_register(&usb3503_platform_driver);
-	if (err != 0)
+	if (err) {
 		pr_err("usb3503: Failed to register platform driver: %d\n",
 		       err);
+		return err;
+	}
 
 	return 0;
 }
-- 
2.30.0


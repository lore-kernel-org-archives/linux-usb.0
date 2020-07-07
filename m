Return-Path: <SRS0=ACcI=AS=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F25EBC433DF
	for <linux-usb@archiver.kernel.org>; Tue,  7 Jul 2020 06:20:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C586B206B6
	for <linux-usb@archiver.kernel.org>; Tue,  7 Jul 2020 06:20:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1594102824;
	bh=ABum/Q0sarQX9kh0M9u4EA4sbEhNX4ghnaff+le3t44=;
	h=From:To:Cc:Subject:Date:List-ID:From;
	b=KNx2nQi32rl2K4GXzRl2bbfLY/+ndiKPTIWYMGo27DlqBsafq3gpoTs0Su1xN2V0G
	 4sxUTdYxDSzelso6Mg4E7PIrrHBNCbUrhcK5BUvHEBe/BJ/VlX5RnfwRPfFcySVH7B
	 HeUXSuj6PPyN/5T38d14doUJ4KzORgrbmZq/5Wz8=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727090AbgGGGUY (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Tue, 7 Jul 2020 02:20:24 -0400
Received: from mail-lj1-f193.google.com ([209.85.208.193]:39643 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726540AbgGGGUY (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 7 Jul 2020 02:20:24 -0400
Received: by mail-lj1-f193.google.com with SMTP id b25so44934200ljp.6
        for <linux-usb@vger.kernel.org>; Mon, 06 Jul 2020 23:20:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=nMW+sVMRYcDSFTbZFn9PfqFG2M9g70jfIGDRC51z9O0=;
        b=dx2VHQSyI5GI4A+ATfyUbVvYZyZRVDa1QjdZSy6qE0IRpo2rwD7Mi2sp6a6IDCy44b
         5ItS2sjh7xPL5hDq7csg/FoDxyOlYuei5Anvj1N9+qdU1tPQmN6N3WP/CtO5jN6+OxsF
         WrKVIYlVT+aGunKzxj54P7b0BL1vEJk0BRtGerViC5zTk/tAnwMKw+7ZpTVNGuzcJR2v
         vAD4jnWHzx1SVZPpMkofwOm1nxEGZaPRCD8myRDlSevP995s6taR+0e8hC3iGlWym9nA
         LmMDYY/VrSPeZyccZhxLba5rZMABv3T+zBQJ0Or1zVyhyzTpoLMEZYiI+WK694ZcWBP6
         2c0g==
X-Gm-Message-State: AOAM532rRUZA05dN3lrz8MGgbggqaFyfCkzZz9kj5f5UyiK8zK5AWfhJ
        Q5qViOrNU0Ow3RL/tyQ8PR8gbWGXQYg=
X-Google-Smtp-Source: ABdhPJwTysfw27u8FS6RWbkH6bc2iI8EfFIU3WUlNNTPCTkEykez4RoII83FgU0XenRJF+nVMRXD6A==
X-Received: by 2002:a2e:916:: with SMTP id 22mr28095122ljj.342.1594102821487;
        Mon, 06 Jul 2020 23:20:21 -0700 (PDT)
Received: from xi.terra (c-beaee455.07-184-6d6c6d4.bbcust.telenor.se. [85.228.174.190])
        by smtp.gmail.com with ESMTPSA id l26sm4556913ljc.131.2020.07.06.23.20.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2020 23:20:20 -0700 (PDT)
Received: from johan by xi.terra with local (Exim 4.93.0.4)
        (envelope-from <johan@xi.terra>)
        id 1jsgxk-0004Y7-0G; Tue, 07 Jul 2020 08:20:16 +0200
From:   Johan Hovold <johan@kernel.org>
To:     linux-usb@vger.kernel.org, Michael Hanselmann <public@hansmi.ch>
Cc:     Johan Hovold <johan@kernel.org>
Subject: [PATCH] USB: serial: ch341: fix simulated-break comment
Date:   Tue,  7 Jul 2020 08:19:57 +0200
Message-Id: <20200707061957.17425-1-johan@kernel.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On devices which do not support break signalling a break condition is
simulated by sending a NUL byte at the lowest possible speed. The break
condition will be 9 bit periods long (start bit and eight data bits),
but the transmission itself also includes the stop bit.

Signed-off-by: Johan Hovold <johan@kernel.org>
---

Hi Michael,

I reread the break-end comment and found it a bit confusing still. The
below seems more correct to me. I'm assuming you did not intend to add
an additional bit period as margin?

Johan



 drivers/usb/serial/ch341.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/serial/ch341.c b/drivers/usb/serial/ch341.c
index 011d7953f087..27a2a62777c9 100644
--- a/drivers/usb/serial/ch341.c
+++ b/drivers/usb/serial/ch341.c
@@ -604,9 +604,8 @@ static void ch341_simulate_break(struct tty_struct *tty, int break_state)
 		}
 
 		/*
-		 * Compute expected transmission duration and add a single bit
-		 * of safety margin (the actual NUL byte transmission is 8 bits
-		 * plus one stop bit).
+		 * Compute expected transmission duration (including stop
+		 * bit).
 		 */
 		priv->break_end = jiffies + (10 * HZ / CH341_MIN_BPS);
 
-- 
2.26.2


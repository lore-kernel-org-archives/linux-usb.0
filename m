Return-Path: <linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 518DEC64E8A
	for <linux-usb@archiver.kernel.org>; Thu,  3 Dec 2020 09:12:31 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E182821D91
	for <linux-usb@archiver.kernel.org>; Thu,  3 Dec 2020 09:12:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728456AbgLCJMP (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Thu, 3 Dec 2020 04:12:15 -0500
Received: from mail-lf1-f66.google.com ([209.85.167.66]:36850 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388247AbgLCJMO (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 3 Dec 2020 04:12:14 -0500
Received: by mail-lf1-f66.google.com with SMTP id v14so1666940lfo.3;
        Thu, 03 Dec 2020 01:11:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=hiHVxx96W4z2x1pL1yltWGSHglv7sYIGu+EMJa0eDKU=;
        b=nanRNQSGYYAnDPmsDAQgsjgSSLM/xuIBqT67E4SqRJhTsY21e2DcFjX50049yvVfMb
         VcamyYOIqP4vBOXzpaCuY8S3UCaNHAiU0xsv65wgFDenDGEgHpurpSg+h6KPqVg44w1n
         zI94ZQlZoQn9vy3CyM9XzNJ84Yy4gQNvOBE3m6FyfxyfroHxG6gFFtV6IjbmxiqLAw9L
         9ZP9QOCkCZE66e8Eho5r1Pz1TU/RiUiRTzDiOoI91ZapR5ThDkKMS4xyDupTaSey34MQ
         3AHec9xa7UZbojhlyuqsnjrhajFiAsO0CX6YLMtn3/r9tca8C3qGQ3U2jFbTcMEWms+r
         4Lzw==
X-Gm-Message-State: AOAM532ju3EvqD8Q6L+3lYvNxZs9P9TG+obxIA/5nwlyAkKkhANveU1p
        8IGXk81574oo3UhpAYiGSn577wLcAWl+vg==
X-Google-Smtp-Source: ABdhPJxtDA5kwdvJEbOq+XIakcwexir/Y4TavlQ7twjMjKd8xSm0EGJauK03skzHTEQfYN/m3S4ReQ==
X-Received: by 2002:ac2:5462:: with SMTP id e2mr929304lfn.552.1606986691942;
        Thu, 03 Dec 2020 01:11:31 -0800 (PST)
Received: from xi.terra (c-beaee455.07-184-6d6c6d4.bbcust.telenor.se. [85.228.174.190])
        by smtp.gmail.com with ESMTPSA id x189sm292840lfa.95.2020.12.03.01.11.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Dec 2020 01:11:31 -0800 (PST)
Received: from johan by xi.terra with local (Exim 4.93.0.4)
        (envelope-from <johan@xi.terra>)
        id 1kkkej-0003Mj-2F; Thu, 03 Dec 2020 10:12:05 +0100
From:   Johan Hovold <johan@kernel.org>
To:     linux-usb@vger.kernel.org
Cc:     Johan Hovold <johan@kernel.org>, stable@vger.kernel.org
Subject: [PATCH] USB: serial: ch341: sort device-id entries
Date:   Thu,  3 Dec 2020 10:11:59 +0100
Message-Id: <20201203091159.12896-1-johan@kernel.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Keep the device-id entries sorted to make it easier to add new ones in
the right spot.

Cc: stable@vger.kernel.org
Signed-off-by: Johan Hovold <johan@kernel.org>
---
 drivers/usb/serial/ch341.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/serial/ch341.c b/drivers/usb/serial/ch341.c
index b157a230178d..28deaaec581f 100644
--- a/drivers/usb/serial/ch341.c
+++ b/drivers/usb/serial/ch341.c
@@ -81,11 +81,11 @@
 #define CH341_QUIRK_SIMULATE_BREAK	BIT(1)
 
 static const struct usb_device_id id_table[] = {
-	{ USB_DEVICE(0x4348, 0x5523) },
-	{ USB_DEVICE(0x1a86, 0x7522) },
-	{ USB_DEVICE(0x1a86, 0x7523) },
 	{ USB_DEVICE(0x1a86, 0x5512) },
 	{ USB_DEVICE(0x1a86, 0x5523) },
+	{ USB_DEVICE(0x1a86, 0x7522) },
+	{ USB_DEVICE(0x1a86, 0x7523) },
+	{ USB_DEVICE(0x4348, 0x5523) },
 	{ },
 };
 MODULE_DEVICE_TABLE(usb, id_table);
-- 
2.26.2


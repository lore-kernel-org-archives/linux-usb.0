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
	by smtp.lore.kernel.org (Postfix) with ESMTP id B22B3C64E8A
	for <linux-usb@archiver.kernel.org>; Mon, 30 Nov 2020 01:27:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 558892076A
	for <linux-usb@archiver.kernel.org>; Mon, 30 Nov 2020 01:27:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LWir8t8g"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726660AbgK3B1A (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Sun, 29 Nov 2020 20:27:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39968 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726520AbgK3B1A (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 29 Nov 2020 20:27:00 -0500
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com [IPv6:2607:f8b0:4864:20::1043])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 196E2C0613CF;
        Sun, 29 Nov 2020 17:26:14 -0800 (PST)
Received: by mail-pj1-x1043.google.com with SMTP id t21so315393pjw.2;
        Sun, 29 Nov 2020 17:26:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=OR9wVz2vxGr4uGs0aRUSPWq5Qs/Y5o7RNeRWhP0NrZ0=;
        b=LWir8t8g7RbKCr3a0p/eiWmOWB/9H4twl/9idxXuEBCLV0BsfN+g3TZgKefOjXjJ7O
         SOhdtZUMZjLignp5n2FE88mg1ItdFovUEuI5UHlgrNlSixLmPlJ3J0PvVPpMoFmZ9TMj
         xs0tG4OSPbMQ9IWZ/fhq/i0I6beTeBoPvO5B+u8x40YSvZTMJ1nmOAymvCGKsF/IBJNj
         Yd9r9SwOFvESCR+OpH8e4Fl5imiDF1l8HsnoG3Sj34GJAc3LWG4Na8rc6Q9M0vUEcdkC
         QVRuDdmmvZpv1mOHXMFy08m0L7k31eZN2jlnEJJ0Cwi4U9X3tAehQxs6l/TsUfy6PkG4
         Y3lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=OR9wVz2vxGr4uGs0aRUSPWq5Qs/Y5o7RNeRWhP0NrZ0=;
        b=TJxOHD7k2R5Rw7yMiivqqF/g+ugeINUTSo860xR7D7S7RCmFi9fq2OXZDE6XqCHlWA
         mV5NW/Fhy1r024y/ZI0mo9CQ/cM1T5c0uafpbN3622KiWPAY1z+4NMROSWUBgUS7e5bn
         aNq4Z5ior3284Du5vrNzDKd3dYyEZ0WRhwaaYS+vOBNZ0NOd4/GphQiQgIbQPDd6A/4J
         V21/LRCPm8mh5XnPHpPltbUdjDQbGeaZjshwrorpBincT50AqTXyqhVKqzZxucHaBzHh
         gnLTGrwHbkFicgVUDeT/RL0HJ48FPNXPNz03TkWEcrP8tDKlhhqg6kaKIIYz6wphRvdN
         YtlA==
X-Gm-Message-State: AOAM533MJRaU7yv83xsoDjmedcF2oRFOeG3gwz1K3644O/OAiMb8jQy8
        84BeR9oWYUzZQz5JfeGRjqM=
X-Google-Smtp-Source: ABdhPJwWr925SmFwvuhB6QF3+8PzGho6RhqVW0tUlxCEZdRgnljdSJbl9rm3MHBUpsA6KLkKlES3JA==
X-Received: by 2002:a17:90b:3594:: with SMTP id mm20mr12032130pjb.121.1606699573510;
        Sun, 29 Nov 2020 17:26:13 -0800 (PST)
Received: from localhost.localdomain ([49.207.197.72])
        by smtp.gmail.com with ESMTPSA id a81sm14637227pfd.178.2020.11.29.17.26.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Nov 2020 17:26:12 -0800 (PST)
From:   Anant Thazhemadam <anant.thazhemadam@gmail.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Anant Thazhemadam <anant.thazhemadam@gmail.com>
Cc:     linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 02/15] usb: misc: cypress_cy7c63: update to use usb_control_msg_recv()
Date:   Mon, 30 Nov 2020 06:56:05 +0530
Message-Id: <20201130012605.2578511-1-anant.thazhemadam@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201130011819.2576481-1-anant.thazhemadam@gmail.com>
References: <20201130011819.2576481-1-anant.thazhemadam@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The newer usb_control_msg_{send|recv}() API are an improvement on the
existing usb_control_msg() as it ensures that a short read/write is treated
as an error, data can be used off the stack, and raw usb pipes need not be
created in the calling functions.
For this reason, the instance of usb_control_msg() has been replaced with
usb_control_msg_recv().

Signed-off-by: Anant Thazhemadam <anant.thazhemadam@gmail.com>
---
 drivers/usb/misc/cypress_cy7c63.c | 21 +++++----------------
 1 file changed, 5 insertions(+), 16 deletions(-)

diff --git a/drivers/usb/misc/cypress_cy7c63.c b/drivers/usb/misc/cypress_cy7c63.c
index 14faec51d7a5..76a320ef17a7 100644
--- a/drivers/usb/misc/cypress_cy7c63.c
+++ b/drivers/usb/misc/cypress_cy7c63.c
@@ -70,24 +70,15 @@ static int vendor_command(struct cypress *dev, unsigned char request,
 			  unsigned char address, unsigned char data)
 {
 	int retval = 0;
-	unsigned int pipe;
-	unsigned char *iobuf;
-
-	/* allocate some memory for the i/o buffer*/
-	iobuf = kzalloc(CYPRESS_MAX_REQSIZE, GFP_KERNEL);
-	if (!iobuf) {
-		retval = -ENOMEM;
-		goto error;
-	}
+	u8 iobuf[CYPRESS_MAX_REQSIZE] = {0};
 
 	dev_dbg(&dev->udev->dev, "Sending usb_control_msg (data: %d)\n", data);
 
 	/* prepare usb control message and send it upstream */
-	pipe = usb_rcvctrlpipe(dev->udev, 0);
-	retval = usb_control_msg(dev->udev, pipe, request,
-				 USB_DIR_IN | USB_TYPE_VENDOR | USB_RECIP_OTHER,
-				 address, data, iobuf, CYPRESS_MAX_REQSIZE,
-				 USB_CTRL_GET_TIMEOUT);
+	retval = usb_control_msg_recv(dev->udev, 0, request,
+				      USB_DIR_IN | USB_TYPE_VENDOR | USB_RECIP_OTHER,
+				      address, data, &iobuf, CYPRESS_MAX_REQSIZE,
+				      USB_CTRL_GET_TIMEOUT, GFP_KERNEL);
 
 	/* store returned data (more READs to be added) */
 	switch (request) {
@@ -107,8 +98,6 @@ static int vendor_command(struct cypress *dev, unsigned char request,
 			break;
 	}
 
-	kfree(iobuf);
-error:
 	return retval;
 }
 
-- 
2.25.1


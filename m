Return-Path: <SRS0=Q5cs=YE=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8AB4BECE58E
	for <linux-usb@archiver.kernel.org>; Fri, 11 Oct 2019 09:57:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 59A53214AF
	for <linux-usb@archiver.kernel.org>; Fri, 11 Oct 2019 09:57:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1570787858;
	bh=1But3RogdAWh2rm1p+4HlSr5KWA38uzCfjsMTa0nyrM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-ID:From;
	b=BnusiRrkpYfSnRzyHzvAQBGumSm5MzcXr9OhcS16RQDr+XJwGBDRgn1zVtCJAS/ca
	 ZMbeWHhY6ai8lClMXobdE28iCSgiUweahWge49Bl1a4F8098yLC/acHabI2y01nEMm
	 /WBdAU1WCsDUbBuG+zhlZwmtG2yrEI8785MC7COM=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727865AbfJKJ5h (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Fri, 11 Oct 2019 05:57:37 -0400
Received: from mail-lf1-f65.google.com ([209.85.167.65]:46089 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727628AbfJKJ5h (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 11 Oct 2019 05:57:37 -0400
Received: by mail-lf1-f65.google.com with SMTP id t8so6562509lfc.13
        for <linux-usb@vger.kernel.org>; Fri, 11 Oct 2019 02:57:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=0K5HwfEj/jodL29/ZVixU945Hf1+hbADNv7D78KDiHA=;
        b=meEPIPc/dggYkRWkSIm5oKqniBK1i6gYG6KHhUwflO/T+0DCdZ+80JPdbSnv/XPwk8
         mco9A5Xzwj/HGxg5FMIqLXJXeawA3SloAtVdTiJQaEq0M5EAUfUVZY/Jx19F1JuXVChO
         mUb1Tjau37ctGZl5ZOhuwy00USAsPpye5ZzQnHLE29LzricgV1icTFiXdiyZiqAiOlXe
         /6FF9Qfl4w5Wgww7Dlnf4u8YmEFzFcgCyJvRIVQdu8GAUb80/pais4gQrfiX2MydO6UF
         PB6ZZKaDBsNBgmzHW/r4nJxWXYqqsu9AQPt5yeQSarAFOB/i9qlwr86Ww/xtwVhNh+9z
         p0tg==
X-Gm-Message-State: APjAAAUSR6yZsWKctJhdbh0o4o0pIgMAQyOT2EfSUlJ92tfJSr9myMSz
        eLuYXcQUyf7or7qeLXIYileyP9Kt
X-Google-Smtp-Source: APXvYqzavRrUf9eVYpnMnuDANF8KNxNyEy/ZL6Rmqn8bG+JAZuPSGw9qQea9c3iQzL3+Bnuc+V4i6A==
X-Received: by 2002:a19:7404:: with SMTP id v4mr3398299lfe.129.1570787854975;
        Fri, 11 Oct 2019 02:57:34 -0700 (PDT)
Received: from xi.terra (c-51f1e055.07-184-6d6c6d4.bbcust.telenor.se. [85.224.241.81])
        by smtp.gmail.com with ESMTPSA id r6sm1865761lfn.29.2019.10.11.02.57.33
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 11 Oct 2019 02:57:34 -0700 (PDT)
Received: from johan by xi.terra with local (Exim 4.92.2)
        (envelope-from <johan@xi.terra>)
        id 1iIrg8-0005iZ-5L; Fri, 11 Oct 2019 11:57:44 +0200
From:   Johan Hovold <johan@kernel.org>
To:     linux-usb@vger.kernel.org
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Johan Hovold <johan@kernel.org>
Subject: [PATCH 2/2] USB: serial: ti_usb_3410_5052: clean up serial data access
Date:   Fri, 11 Oct 2019 11:57:36 +0200
Message-Id: <20191011095736.21934-2-johan@kernel.org>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191011095736.21934-1-johan@kernel.org>
References: <20191011095736.21934-1-johan@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Use the tdev pointer directly instead of going through the port data
when accessing the serial data in open().

Signed-off-by: Johan Hovold <johan@kernel.org>
---
 drivers/usb/serial/ti_usb_3410_5052.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/serial/ti_usb_3410_5052.c b/drivers/usb/serial/ti_usb_3410_5052.c
index 9174ba2e06da..ef23acc9b9ce 100644
--- a/drivers/usb/serial/ti_usb_3410_5052.c
+++ b/drivers/usb/serial/ti_usb_3410_5052.c
@@ -800,8 +800,8 @@ static void ti_close(struct usb_serial_port *port)
 							, __func__, status);
 
 	mutex_lock(&tdev->td_open_close_lock);
-	--tport->tp_tdev->td_open_port_count;
-	if (tport->tp_tdev->td_open_port_count == 0) {
+	--tdev->td_open_port_count;
+	if (tdev->td_open_port_count == 0) {
 		/* last port is closed, shut down interrupt urb */
 		usb_kill_urb(port->serial->port[0]->interrupt_in_urb);
 	}
-- 
2.23.0


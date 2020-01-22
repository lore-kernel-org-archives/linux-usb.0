Return-Path: <SRS0=IeTI=3L=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B044BC33CAF
	for <linux-usb@archiver.kernel.org>; Wed, 22 Jan 2020 10:15:57 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 86D472467F
	for <linux-usb@archiver.kernel.org>; Wed, 22 Jan 2020 10:15:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1579688157;
	bh=BUERMAOuC1Sinkg+B37Aru4DoGizQFXJw71O7d8KNcQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-ID:From;
	b=D2TdC4niNbjT0ZS4LGpKhR9IVX8+bRgQVzdt3MHUAz68MS7G/2uYJMFGddACO131Y
	 8dNMJ8GYZWeZAOXecx1yx/j/5uXLyvC0B8z+733wlr+h8d//FtF84/IB7Agwz4DVMr
	 y8sL728NhG110qnpgStpDr3ELSS86s0oCEVEGRM4=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729546AbgAVKP4 (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Wed, 22 Jan 2020 05:15:56 -0500
Received: from mail-lj1-f196.google.com ([209.85.208.196]:44939 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729527AbgAVKPy (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 22 Jan 2020 05:15:54 -0500
Received: by mail-lj1-f196.google.com with SMTP id q8so6101140ljj.11
        for <linux-usb@vger.kernel.org>; Wed, 22 Jan 2020 02:15:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=mwKxS8lXMv8Bi7mN+ImlUawO7kdYz2hgSq0PZVkhFR4=;
        b=O7SlTkY4ZDBFNrB1jRdu6o21yqB1bKAPyoHI7CDHV21r8F8OgDCcghd7N1dc/wpWko
         CfYmwHxIV4eAQMFYUAAMZ+iVI66V9HsJKKe3IrFlzh/BN2RqW7OFQ383zufkJUd9jxmT
         ltaiNWOhaE+g9x/PxpS2yz/P6GB0gPb87w5AJRs8Ue2mWgSG5gc9tOssjYcMGp7LQWAh
         7TY6eGdsjjG5sNxwPxEzFPJL7KPTFS6XIX8Fz9QS4LUXV6e8MkEjAGBgLCrgxjtZkTst
         t9cSO8awLCoujBMDro2gYGpAWrXjCR7LsV+QdaV1A0Vx58bGB6NPLNHr5E+nbRKnqikV
         zjHw==
X-Gm-Message-State: APjAAAUOAD1NHcMuQkALV277oU71nouaiBdGRlBlZl44CBS3Kvok20aZ
        PHbOAQ1f1dyM0J/k7Lz07GM=
X-Google-Smtp-Source: APXvYqyRXSuD61JfM22IXd0w+lppHSUV/80+e5vdA5pA0npV/BLLQQDCMwYd4ZxmHMoMq7zQkM4VoQ==
X-Received: by 2002:a2e:548:: with SMTP id 69mr19055598ljf.67.1579688152956;
        Wed, 22 Jan 2020 02:15:52 -0800 (PST)
Received: from xi.terra (c-14b8e655.07-184-6d6c6d4.bbcust.telenor.se. [85.230.184.20])
        by smtp.gmail.com with ESMTPSA id w9sm20003449ljh.106.2020.01.22.02.15.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jan 2020 02:15:51 -0800 (PST)
Received: from johan by xi.terra with local (Exim 4.92.3)
        (envelope-from <johan@xi.terra>)
        id 1iuD34-0007bj-Fl; Wed, 22 Jan 2020 11:15:46 +0100
From:   Johan Hovold <johan@kernel.org>
To:     Johan Hovold <johan@kernel.org>
Cc:     linux-usb@vger.kernel.org
Subject: [PATCH 4/5] USB: serial: ir-usb: make set_termios synchronous
Date:   Wed, 22 Jan 2020 11:15:29 +0100
Message-Id: <20200122101530.29176-5-johan@kernel.org>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200122101530.29176-1-johan@kernel.org>
References: <20200122101530.29176-1-johan@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Use a synchronous usb_bulk_msg() when switching link speed in
set_termios(). This way we do not need to keep track of outstanding URBs
in order to be able to stop them at close.

Note that there's no need to set URB_ZERO_PACKET as the one-byte
transfer will always be short.

Signed-off-by: Johan Hovold <johan@kernel.org>
---
 drivers/usb/serial/ir-usb.c | 50 ++++++++-----------------------------
 1 file changed, 11 insertions(+), 39 deletions(-)

diff --git a/drivers/usb/serial/ir-usb.c b/drivers/usb/serial/ir-usb.c
index 627bea7e6cfb..3cd70392e2a2 100644
--- a/drivers/usb/serial/ir-usb.c
+++ b/drivers/usb/serial/ir-usb.c
@@ -376,23 +376,15 @@ static void ir_process_read_urb(struct urb *urb)
 	tty_flip_buffer_push(&port->port);
 }
 
-static void ir_set_termios_callback(struct urb *urb)
-{
-	kfree(urb->transfer_buffer);
-
-	if (urb->status)
-		dev_dbg(&urb->dev->dev, "%s - non-zero urb status: %d\n",
-			__func__, urb->status);
-}
-
 static void ir_set_termios(struct tty_struct *tty,
 		struct usb_serial_port *port, struct ktermios *old_termios)
 {
-	struct urb *urb;
+	struct usb_device *udev = port->serial->dev;
 	unsigned char *transfer_buffer;
-	int result;
+	int actual_length;
 	speed_t baud;
 	int ir_baud;
+	int ret;
 
 	baud = tty_get_baud_rate(tty);
 
@@ -447,42 +439,22 @@ static void ir_set_termios(struct tty_struct *tty,
 	/*
 	 * send the baud change out on an "empty" data packet
 	 */
-	urb = usb_alloc_urb(0, GFP_KERNEL);
-	if (!urb)
-		return;
-
 	transfer_buffer = kmalloc(1, GFP_KERNEL);
 	if (!transfer_buffer)
-		goto err_buf;
+		return;
 
 	*transfer_buffer = ir_xbof | ir_baud;
 
-	usb_fill_bulk_urb(
-		urb,
-		port->serial->dev,
-		usb_sndbulkpipe(port->serial->dev,
-			port->bulk_out_endpointAddress),
-		transfer_buffer,
-		1,
-		ir_set_termios_callback,
-		port);
-
-	urb->transfer_flags = URB_ZERO_PACKET;
-
-	result = usb_submit_urb(urb, GFP_KERNEL);
-	if (result) {
-		dev_err(&port->dev, "%s - failed to submit urb: %d\n",
-							__func__, result);
-		goto err_subm;
+	ret = usb_bulk_msg(udev,
+			usb_sndbulkpipe(udev, port->bulk_out_endpointAddress),
+			transfer_buffer, 1, &actual_length, 5000);
+	if (ret || actual_length != 1) {
+		if (actual_length != 1)
+			ret = -EIO;
+		dev_err(&port->dev, "failed to change line speed: %d\n", ret);
 	}
 
-	usb_free_urb(urb);
-
-	return;
-err_subm:
 	kfree(transfer_buffer);
-err_buf:
-	usb_free_urb(urb);
 }
 
 static int __init ir_init(void)
-- 
2.24.1


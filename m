Return-Path: <SRS0=JW0E=SU=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	T_DKIMWL_WL_HIGH,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA2E2C10F0E
	for <linux-usb@archiver.kernel.org>; Thu, 18 Apr 2019 16:20:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 89503206B6
	for <linux-usb@archiver.kernel.org>; Thu, 18 Apr 2019 16:20:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1555604418;
	bh=QdTc3cc0Uc3tnrA+utfxODqaQmVlP04aH1b26OsGHC4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-ID:From;
	b=LTmFhQa1uFPTJc8zXfwUW0LQXrU1iV7gQ5bfNHMRUFPGCzaqL+yPTCP9FY3OKtmB5
	 Cj4erMHiG0GsK/NVicarkXZd3xudlPaH18h3AI9pmAtkawzkV7dkesip2FrpmAh2a8
	 5poJ97SpHR6dUOb2zdgLPy4h7P2k3eGhaNTOPbHA=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388495AbfDRQUS (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Thu, 18 Apr 2019 12:20:18 -0400
Received: from mail-lj1-f196.google.com ([209.85.208.196]:39545 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725888AbfDRQUR (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 18 Apr 2019 12:20:17 -0400
Received: by mail-lj1-f196.google.com with SMTP id l7so2423743ljg.6
        for <linux-usb@vger.kernel.org>; Thu, 18 Apr 2019 09:20:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=urnnXzbecz685AXtXD3Xo8I3/bPlf9IE3dOhSF7i3Eg=;
        b=jIdtDLCMkPC7QmMUcYhCBEFaQhoVkuHqOy0VvJJye7LSB4IjX6ZxuX8dihOSb9dz+Q
         UuG1vKmIeXmr+QtLhRBADj/bmMs3WTva0RrSWnm6uO2j4XEE3YV5ruhm0IREj5NdS4Qa
         tn1uAofr7MgY6RyKoKoGLedCKjgSFYWC+OMnrwKmqsFtVhl2a5se2HTrcFRPFyBozp6Z
         jyydp6go7NxNC3oFlX+tpTnSi77BC41I5lzYgMNlj3FDKKu4UOBNLnI0OdasFqhpINjB
         NpJfuyLVfBajUodtoxpVp1BKvwELj9LPAbYxTC2ootv5iMScN0GUnsfKcwDuQlo78t6J
         /hsw==
X-Gm-Message-State: APjAAAW9L2iERpf9mXyGcUlC5TWXao/vRZeVe/8fwB16p6xyLOocSprP
        tfx3KW/pax0k3ywvWM9fMERqThgK
X-Google-Smtp-Source: APXvYqwE/1U6gTBB49vVLO4SI++wq9FwU83eQS2Ph2A6Id2KK74mJMj7P6QOQHnRWSMD7ph6Yj6ksg==
X-Received: by 2002:a2e:7311:: with SMTP id o17mr35351763ljc.124.1555604415489;
        Thu, 18 Apr 2019 09:20:15 -0700 (PDT)
Received: from xi.terra (c-74bee655.07-184-6d6c6d4.bbcust.telenor.se. [85.230.190.116])
        by smtp.gmail.com with ESMTPSA id o7sm500878ljj.23.2019.04.18.09.20.14
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 18 Apr 2019 09:20:14 -0700 (PDT)
Received: from johan by xi.terra with local (Exim 4.91)
        (envelope-from <johan@xi.terra>)
        id 1hH9lx-00068u-Az; Thu, 18 Apr 2019 18:20:25 +0200
From:   Johan Hovold <johan@kernel.org>
To:     linux-usb@vger.kernel.org
Cc:     Johan Hovold <johan@kernel.org>
Subject: [PATCH 2/2] USB: serial: digi_acceleport: clean up set_termios
Date:   Thu, 18 Apr 2019 18:20:20 +0200
Message-Id: <20190418162020.23566-2-johan@kernel.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190418162020.23566-1-johan@kernel.org>
References: <20190418162020.23566-1-johan@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190418162020.X6HW4ywbHzX1NY9ZNg51dlc0msKEzd-43miUdoWZh_o@z>

Clean up set_termios() by adding missing white space around operators
and making a couple of continuation lines more readable.

Also drop a couple of redundant braces.

Signed-off-by: Johan Hovold <johan@kernel.org>
---
 drivers/usb/serial/digi_acceleport.c | 33 ++++++++++++++--------------
 1 file changed, 16 insertions(+), 17 deletions(-)

diff --git a/drivers/usb/serial/digi_acceleport.c b/drivers/usb/serial/digi_acceleport.c
index 4699e114f617..578ebdd86520 100644
--- a/drivers/usb/serial/digi_acceleport.c
+++ b/drivers/usb/serial/digi_acceleport.c
@@ -740,9 +740,9 @@ static void digi_set_termios(struct tty_struct *tty,
 	/* set parity */
 	tty->termios.c_cflag &= ~CMSPAR;
 
-	if ((cflag&(PARENB|PARODD)) != (old_cflag&(PARENB|PARODD))) {
-		if (cflag&PARENB) {
-			if (cflag&PARODD)
+	if ((cflag & (PARENB | PARODD)) != (old_cflag & (PARENB | PARODD))) {
+		if (cflag & PARENB) {
+			if (cflag & PARODD)
 				arg = DIGI_PARITY_ODD;
 			else
 				arg = DIGI_PARITY_EVEN;
@@ -755,9 +755,9 @@ static void digi_set_termios(struct tty_struct *tty,
 		buf[i++] = 0;
 	}
 	/* set word size */
-	if ((cflag&CSIZE) != (old_cflag&CSIZE)) {
+	if ((cflag & CSIZE) != (old_cflag & CSIZE)) {
 		arg = -1;
-		switch (cflag&CSIZE) {
+		switch (cflag & CSIZE) {
 		case CS5: arg = DIGI_WORD_SIZE_5; break;
 		case CS6: arg = DIGI_WORD_SIZE_6; break;
 		case CS7: arg = DIGI_WORD_SIZE_7; break;
@@ -765,7 +765,7 @@ static void digi_set_termios(struct tty_struct *tty,
 		default:
 			dev_dbg(dev,
 				"digi_set_termios: can't handle word size %d\n",
-				(cflag&CSIZE));
+				cflag & CSIZE);
 			break;
 		}
 
@@ -779,9 +779,9 @@ static void digi_set_termios(struct tty_struct *tty,
 	}
 
 	/* set stop bits */
-	if ((cflag&CSTOPB) != (old_cflag&CSTOPB)) {
+	if ((cflag & CSTOPB) != (old_cflag & CSTOPB)) {
 
-		if ((cflag&CSTOPB))
+		if ((cflag & CSTOPB))
 			arg = DIGI_STOP_BITS_2;
 		else
 			arg = DIGI_STOP_BITS_1;
@@ -794,15 +794,15 @@ static void digi_set_termios(struct tty_struct *tty,
 	}
 
 	/* set input flow control */
-	if ((iflag&IXOFF) != (old_iflag&IXOFF)
-	    || (cflag&CRTSCTS) != (old_cflag&CRTSCTS)) {
+	if ((iflag & IXOFF) != (old_iflag & IXOFF) ||
+			(cflag & CRTSCTS) != (old_cflag & CRTSCTS)) {
 		arg = 0;
-		if (iflag&IXOFF)
+		if (iflag & IXOFF)
 			arg |= DIGI_INPUT_FLOW_CONTROL_XON_XOFF;
 		else
 			arg &= ~DIGI_INPUT_FLOW_CONTROL_XON_XOFF;
 
-		if (cflag&CRTSCTS) {
+		if (cflag & CRTSCTS) {
 			arg |= DIGI_INPUT_FLOW_CONTROL_RTS;
 
 			/* On USB-4 it is necessary to assert RTS prior */
@@ -822,19 +822,18 @@ static void digi_set_termios(struct tty_struct *tty,
 	}
 
 	/* set output flow control */
-	if ((iflag & IXON) != (old_iflag & IXON)
-	    || (cflag & CRTSCTS) != (old_cflag & CRTSCTS)) {
+	if ((iflag & IXON) != (old_iflag & IXON) ||
+			(cflag & CRTSCTS) != (old_cflag & CRTSCTS)) {
 		arg = 0;
 		if (iflag & IXON)
 			arg |= DIGI_OUTPUT_FLOW_CONTROL_XON_XOFF;
 		else
 			arg &= ~DIGI_OUTPUT_FLOW_CONTROL_XON_XOFF;
 
-		if (cflag & CRTSCTS) {
+		if (cflag & CRTSCTS)
 			arg |= DIGI_OUTPUT_FLOW_CONTROL_CTS;
-		} else {
+		else
 			arg &= ~DIGI_OUTPUT_FLOW_CONTROL_CTS;
-		}
 
 		buf[i++] = DIGI_CMD_SET_OUTPUT_FLOW_CONTROL;
 		buf[i++] = priv->dp_port_num;
-- 
2.21.0


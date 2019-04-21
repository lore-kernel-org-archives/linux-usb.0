Return-Path: <SRS0=vzMr=SX=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	T_DKIMWL_WL_HIGH,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D884FC282E1
	for <linux-usb@archiver.kernel.org>; Sun, 21 Apr 2019 12:22:01 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id A260620869
	for <linux-usb@archiver.kernel.org>; Sun, 21 Apr 2019 12:22:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1555849321;
	bh=oBElL5uCsVTPXY6RX7RsdP2idgvrV6YHc5TgXh8nLHw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-ID:From;
	b=fjSSrcQiiMzr3g3GC23IR+wB88Q67JHLV4E5q8b7fvubN0iobuFZDYW3N6DLsm7S7
	 6b5+X6YMwi+JDwR+AiMSLDxbZU081FxemToWbMz/0AYLdm3N/EXAlpUnZ1MH6LEEd+
	 YqUDyJzKTgNup1PP5lR+5g08ULD6p6iBgEjSCONw=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727415AbfDUMWA (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Sun, 21 Apr 2019 08:22:00 -0400
Received: from mail-lf1-f67.google.com ([209.85.167.67]:40420 "EHLO
        mail-lf1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727370AbfDUMWA (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 21 Apr 2019 08:22:00 -0400
Received: by mail-lf1-f67.google.com with SMTP id a28so7119957lfo.7
        for <linux-usb@vger.kernel.org>; Sun, 21 Apr 2019 05:21:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=wTrJkArsFkFtMLGY1Fb7H8Jbb2cACDNX6phiIfCNxdo=;
        b=gGrcMggmOEDKaVwbPrwGfKhLwPwxKONqejoxxt086Iq37eoD+m5eR3lG1WpqAyRbzD
         uFclD/BNotqSJx2p/LE3HEwTyIBU0EuiBxjmJkGJrlSfgvUD6wQkm69W/J+EjiohyFYD
         RcYRIAgCvPgoTglIMZupb51MCC9TjDOQm6Bdb6M6vLCz+cRk4ZMNTSy6goNBsft+DJvE
         TUEq3QtPJSH3ncRplxKVCs+KmH5aC4IydNbIU3SdNwlqQV8GP+YABYDcFHc9R+dZPjTT
         /bMx4ZsU0x8+O1T+arTk9jOyP01kQZPCnEc7bTEwxuU5Pj33RciZ/8WMY0y6ITmitB6R
         Yqkg==
X-Gm-Message-State: APjAAAW8STb9RsWXF85dU2w+gMdRd3smF61Ht8PJl1TDwn7NBMXWtHEl
        DzbKwN5BO9QRWxDRQalGV8ir8mXb
X-Google-Smtp-Source: APXvYqy/rOVLHQMDWuDWa2Hkm+kAB++RB8ml/Z82Y1kPIBkWCoCT4Hs/+a998t31FR91Yog+ku+c+w==
X-Received: by 2002:ac2:4566:: with SMTP id k6mr7688967lfm.22.1555849317425;
        Sun, 21 Apr 2019 05:21:57 -0700 (PDT)
Received: from xi.terra (c-74bee655.07-184-6d6c6d4.bbcust.telenor.se. [85.230.190.116])
        by smtp.gmail.com with ESMTPSA id s3sm2447730lfc.25.2019.04.21.05.21.54
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 21 Apr 2019 05:21:55 -0700 (PDT)
Received: from johan by xi.terra with local (Exim 4.91)
        (envelope-from <johan@xi.terra>)
        id 1hIBTs-0006u9-JP; Sun, 21 Apr 2019 14:22:00 +0200
From:   Johan Hovold <johan@kernel.org>
To:     linux-usb@vger.kernel.org
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Johan Hovold <johan@kernel.org>
Subject: [PATCH 6/9] USB: serial: iuu_phoenix: drop bogus initial cflag
Date:   Sun, 21 Apr 2019 14:21:51 +0200
Message-Id: <20190421122154.26465-7-johan@kernel.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190421122154.26465-1-johan@kernel.org>
References: <20190421122154.26465-1-johan@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190421122151.Vxuaa2XuT7WqzTUurQ3V35TI7qKtIXOkSAik9DHXqnQ@z>

Drop bogus TIOCM_CTS, which is not a cflag, from the initial terminal
settings.

Note that the corresponding bit is already set by CS8.

Signed-off-by: Johan Hovold <johan@kernel.org>
---
 drivers/usb/serial/iuu_phoenix.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/usb/serial/iuu_phoenix.c b/drivers/usb/serial/iuu_phoenix.c
index 449e89db9cea..93763d3d5e56 100644
--- a/drivers/usb/serial/iuu_phoenix.c
+++ b/drivers/usb/serial/iuu_phoenix.c
@@ -943,8 +943,7 @@ static void iuu_close(struct usb_serial_port *port)
 static void iuu_init_termios(struct tty_struct *tty)
 {
 	tty->termios = tty_std_termios;
-	tty->termios.c_cflag = CLOCAL | CREAD | CS8 | B9600
-				| TIOCM_CTS | CSTOPB | PARENB;
+	tty->termios.c_cflag = CLOCAL | CREAD | CS8 | B9600 | CSTOPB | PARENB;
 	tty->termios.c_ispeed = 9600;
 	tty->termios.c_ospeed = 9600;
 	tty->termios.c_lflag = 0;
-- 
2.21.0


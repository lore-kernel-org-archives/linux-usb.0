Return-Path: <SRS0=vzMr=SX=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	T_DKIMWL_WL_HIGH,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74E56C282E1
	for <linux-usb@archiver.kernel.org>; Sun, 21 Apr 2019 12:22:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 3C30D20859
	for <linux-usb@archiver.kernel.org>; Sun, 21 Apr 2019 12:22:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1555849323;
	bh=rPsFy9T3wuGi/PUl1uE6jq3+fqXnXSvJRkKLYbh+8oU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-ID:From;
	b=PE3KQmZ4KjeitdDw8ImJPcsEbKr0NE0xwgOqhyrAlTVdcGrFIUuuuBggbopieCwFS
	 nJdcT2cBo/+f+cFNN/ODPUcThUFCe8PNzoNUatQtMqkIkRlPKQasoy6NY6c7mJObKh
	 C9cGx7/vKge2SHU4QBfOfPUs6YIoJ/JygL2bB+9A=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727485AbfDUMWC (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Sun, 21 Apr 2019 08:22:02 -0400
Received: from mail-lf1-f67.google.com ([209.85.167.67]:46473 "EHLO
        mail-lf1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727370AbfDUMWB (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 21 Apr 2019 08:22:01 -0400
Received: by mail-lf1-f67.google.com with SMTP id k18so7107387lfj.13
        for <linux-usb@vger.kernel.org>; Sun, 21 Apr 2019 05:22:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=lf72Lcsc5rS1b8VBp3IVzGKMM1jvFZhGq00X7s0X05g=;
        b=fNwW5wd3Q9Tz1Jj6vBeRfzIC+4MhCSA5dgoM+9W85HJOsE8gYrWxK9OWPzbfUWS/mS
         UU00Kmwmj0dNnLVm6g9h1v4nhlJN7J/ac/glxB2S9d410DfM1HndRhUR2oKbCIY5UoMQ
         VaMfJ4gccswpOYS0iYOEqhtBTk285IKmUKVd2MDd5WB4IIn9AMft29b9I0sSku42ln4f
         X4LUGr/W3gzgi0LM/Gs+5XMkaxBZqm2q+UxcFVkKk06SE3GpAaKWaT1OxZypQODQFUVn
         BsxpEOhHQ0L0etngRkRGtW4gErKts58LDK/t+tRcsVrpAOiNRmfU13v3h1YSu7BjOL8V
         CtIw==
X-Gm-Message-State: APjAAAWzeXA4VWHx9eypj8ijSj4hhwuw0CJGouYT5TPXy1DXw8dSV0l7
        icQEZUFln1naVACRPXX95EHaqa0m
X-Google-Smtp-Source: APXvYqyI1UR6K5EfpjEHgHczeD1H3fqdecqbq/BMFbTbf4nECJh/VFY1r8Qd/bvy24/BRT9nMbf/VA==
X-Received: by 2002:ac2:48bb:: with SMTP id u27mr7482852lfg.17.1555849319597;
        Sun, 21 Apr 2019 05:21:59 -0700 (PDT)
Received: from xi.terra (c-74bee655.07-184-6d6c6d4.bbcust.telenor.se. [85.230.190.116])
        by smtp.gmail.com with ESMTPSA id m18sm2200730ljb.35.2019.04.21.05.21.54
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 21 Apr 2019 05:21:55 -0700 (PDT)
Received: from johan by xi.terra with local (Exim 4.91)
        (envelope-from <johan@xi.terra>)
        id 1hIBTs-0006u4-Gt; Sun, 21 Apr 2019 14:22:00 +0200
From:   Johan Hovold <johan@kernel.org>
To:     linux-usb@vger.kernel.org
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Johan Hovold <johan@kernel.org>
Subject: [PATCH 5/9] USB: serial: cypress_m8: clean up initial-termios handling
Date:   Sun, 21 Apr 2019 14:21:50 +0200
Message-Id: <20190421122154.26465-6-johan@kernel.org>
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
Message-ID: <20190421122150.5v2CzP1j9TRO0x4SAgpyyGGrgm3jF4GUMiNIioObywk@z>

Now that init_termios() is only called on first use, we can clean up the
cypress_m8 initial-termios handling.

Note that only the earthmate chip type used settings different from the
defaults provided by USB serial core, and that the chip type is indeed
known when init_termios is called at tty-install time.

Signed-off-by: Johan Hovold <johan@kernel.org>
---
 drivers/usb/serial/cypress_m8.c | 36 +++++++--------------------------
 1 file changed, 7 insertions(+), 29 deletions(-)

diff --git a/drivers/usb/serial/cypress_m8.c b/drivers/usb/serial/cypress_m8.c
index f9bbbdd1a148..72d3ae1ebc64 100644
--- a/drivers/usb/serial/cypress_m8.c
+++ b/drivers/usb/serial/cypress_m8.c
@@ -98,7 +98,6 @@ struct cypress_private {
 	int write_urb_interval;            /* interval to use for write urb */
 	int read_urb_interval;             /* interval to use for read urb */
 	int comm_is_ok;                    /* true if communication is (still) ok */
-	int termios_initialized;
 	__u8 line_control;	   	   /* holds dtr / rts value */
 	__u8 current_status;	   	   /* received from last read - info on dsr,cts,cd,ri,etc */
 	__u8 current_config;	   	   /* stores the current configuration byte */
@@ -122,6 +121,7 @@ static int  cypress_write(struct tty_struct *tty, struct usb_serial_port *port,
 			const unsigned char *buf, int count);
 static void cypress_send(struct usb_serial_port *port);
 static int  cypress_write_room(struct tty_struct *tty);
+static void cypress_earthmate_init_termios(struct tty_struct *tty);
 static void cypress_set_termios(struct tty_struct *tty,
 			struct usb_serial_port *port, struct ktermios *old);
 static int  cypress_tiocmget(struct tty_struct *tty);
@@ -149,6 +149,7 @@ static struct usb_serial_driver cypress_earthmate_device = {
 	.dtr_rts =			cypress_dtr_rts,
 	.write =			cypress_write,
 	.write_room =			cypress_write_room,
+	.init_termios =			cypress_earthmate_init_termios,
 	.set_termios =			cypress_set_termios,
 	.tiocmget =			cypress_tiocmget,
 	.tiocmset =			cypress_tiocmset,
@@ -463,7 +464,6 @@ static int cypress_generic_port_probe(struct usb_serial_port *port)
 
 	priv->cmd_ctrl = 0;
 	priv->line_control = 0;
-	priv->termios_initialized = 0;
 	priv->rx_flags = 0;
 	/* Default packet format setting is determined by packet size.
 	   Anything with a size larger then 9 must have a separate
@@ -853,6 +853,11 @@ static int cypress_tiocmset(struct tty_struct *tty,
 	return cypress_write(tty, port, NULL, 0);
 }
 
+static void cypress_earthmate_init_termios(struct tty_struct *tty)
+{
+	tty_encode_baud_rate(tty, 4800, 4800);
+}
+
 static void cypress_set_termios(struct tty_struct *tty,
 	struct usb_serial_port *port, struct ktermios *old_termios)
 {
@@ -864,33 +869,6 @@ static void cypress_set_termios(struct tty_struct *tty,
 	__u8 oldlines;
 	int linechange = 0;
 
-	spin_lock_irqsave(&priv->lock, flags);
-	/* We can't clean this one up as we don't know the device type
-	   early enough */
-	if (!priv->termios_initialized) {
-		if (priv->chiptype == CT_EARTHMATE) {
-			tty->termios = tty_std_termios;
-			tty->termios.c_cflag = B4800 | CS8 | CREAD | HUPCL |
-				CLOCAL;
-			tty->termios.c_ispeed = 4800;
-			tty->termios.c_ospeed = 4800;
-		} else if (priv->chiptype == CT_CYPHIDCOM) {
-			tty->termios = tty_std_termios;
-			tty->termios.c_cflag = B9600 | CS8 | CREAD | HUPCL |
-				CLOCAL;
-			tty->termios.c_ispeed = 9600;
-			tty->termios.c_ospeed = 9600;
-		} else if (priv->chiptype == CT_CA42V2) {
-			tty->termios = tty_std_termios;
-			tty->termios.c_cflag = B9600 | CS8 | CREAD | HUPCL |
-				CLOCAL;
-			tty->termios.c_ispeed = 9600;
-			tty->termios.c_ospeed = 9600;
-		}
-		priv->termios_initialized = 1;
-	}
-	spin_unlock_irqrestore(&priv->lock, flags);
-
 	/* Unsupported features need clearing */
 	tty->termios.c_cflag &= ~(CMSPAR|CRTSCTS);
 
-- 
2.21.0


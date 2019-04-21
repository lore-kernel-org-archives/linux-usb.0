Return-Path: <SRS0=vzMr=SX=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	T_DKIMWL_WL_HIGH,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE167C10F14
	for <linux-usb@archiver.kernel.org>; Sun, 21 Apr 2019 12:22:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 81E7620869
	for <linux-usb@archiver.kernel.org>; Sun, 21 Apr 2019 12:22:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1555849320;
	bh=WJIMPGv2NxtiVl3ltzPOV5DtPPM5evK66urL6Mgq8vc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-ID:From;
	b=OOj3W6HLmMVutikR2cgPDQEngKiZMR4kyxQ66w7wCk9lg3XI5oqq64cu2ALaGq4pc
	 PDrMf6GLVvYUekxcOTNrn5TCRUC7Ug+5fkbn5efQ5Bls6hy9Vq6O3RWuq0NVa3GxQJ
	 SQvZ/H4pFICx9gIdTnlR2amdfc7imnxi63n8x4s8=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727385AbfDUMV7 (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Sun, 21 Apr 2019 08:21:59 -0400
Received: from mail-lj1-f193.google.com ([209.85.208.193]:34370 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725963AbfDUMV6 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 21 Apr 2019 08:21:58 -0400
Received: by mail-lj1-f193.google.com with SMTP id j89so8212080ljb.1
        for <linux-usb@vger.kernel.org>; Sun, 21 Apr 2019 05:21:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=YCHlwVEU1pAZwr42+V6C5g/JtxQTErLwhv+ymt5pxTk=;
        b=QFsGDSKYGfRXhAwDFAdIjvG/gkH3LG/bxyUE9WLsjRcATS3oUvPhVbhaE8swszwIrq
         DL6X+VqDYkBDfqYUhvvEmAeS1SRlR74tCocmpU5Vy8nQUpW32/uKMjRtH6l09lvec9I3
         R4na4da8EQyubW0ORO02r+r4OgJBMIaLSHlVEum5rBQ7AsBUS45CiJCbNRuxFpuqTK+j
         81d/YV6joppXl6s2d6E159e7WUjXKUaYFz4XOenIy4N+xWwgm/31riTGTYN1NiXH+Y8J
         Rau3Oj3KH2qZLGt3JGcqa82QeCZZAocTYkyrABZbd2riyetNCQRpulcDz5xXbcIM/16P
         xwLg==
X-Gm-Message-State: APjAAAWpVMrLnABZombTTyRB5clef4OCSdeDP4ZUZ7hrJcKsyrT2DtGh
        ydwLMbypVQ/ul0BoAzJp+++rV76W
X-Google-Smtp-Source: APXvYqyhsOINS1Waexhrz6q+rJZhtQkowycTJcUp93rvz8hdSrCLE6EL22N8FlhuBc8ZyMwToaC+1Q==
X-Received: by 2002:a2e:974d:: with SMTP id f13mr7445591ljj.140.1555849316325;
        Sun, 21 Apr 2019 05:21:56 -0700 (PDT)
Received: from xi.terra (c-74bee655.07-184-6d6c6d4.bbcust.telenor.se. [85.230.190.116])
        by smtp.gmail.com with ESMTPSA id r2sm2235210ljd.16.2019.04.21.05.21.54
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 21 Apr 2019 05:21:55 -0700 (PDT)
Received: from johan by xi.terra with local (Exim 4.91)
        (envelope-from <johan@xi.terra>)
        id 1hIBTs-0006tk-7A; Sun, 21 Apr 2019 14:22:00 +0200
From:   Johan Hovold <johan@kernel.org>
To:     linux-usb@vger.kernel.org
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Johan Hovold <johan@kernel.org>
Subject: [PATCH 1/9] USB: serial: fix initial-termios handling
Date:   Sun, 21 Apr 2019 14:21:46 +0200
Message-Id: <20190421122154.26465-2-johan@kernel.org>
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
Message-ID: <20190421122146.IbR8WvRaGumrGLTTOjdbQtWgONJhIxwtjfWaluStMEA@z>

The USB-serial driver init_termios callback is used to override the
default initial terminal settings provided by USB-serial core.

After a bug was fixed in the original implementation introduced by
commit fe1ae7fdd2ee ("tty: USB serial termios bits"), the init_termios
callback was no longer called just once on first use as intended but
rather on every (first) open.

This specifically meant that the terminal settings saved on (final)
close were ignored when reopening a port for drivers overriding the
initial settings.

Also update the outdated function header referring to the creation of
termios objects.

Fixes: 7e29bb4b779f ("usb-serial: fix termios initialization logic")
Signed-off-by: Johan Hovold <johan@kernel.org>
---
 drivers/usb/serial/usb-serial.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/serial/usb-serial.c b/drivers/usb/serial/usb-serial.c
index 7e89efbf2c28..676c296103a2 100644
--- a/drivers/usb/serial/usb-serial.c
+++ b/drivers/usb/serial/usb-serial.c
@@ -164,9 +164,9 @@ void usb_serial_put(struct usb_serial *serial)
  * @driver: the driver (USB in our case)
  * @tty: the tty being created
  *
- * Create the termios objects for this tty.  We use the default
+ * Initialise the termios structure for this tty.  We use the default
  * USB serial settings but permit them to be overridden by
- * serial->type->init_termios.
+ * serial->type->init_termios on first open.
  *
  * This is the first place a new tty gets used.  Hence this is where we
  * acquire references to the usb_serial structure and the driver module,
@@ -178,6 +178,7 @@ static int serial_install(struct tty_driver *driver, struct tty_struct *tty)
 	int idx = tty->index;
 	struct usb_serial *serial;
 	struct usb_serial_port *port;
+	bool init_termios;
 	int retval = -ENODEV;
 
 	port = usb_serial_port_get_by_minor(idx);
@@ -192,14 +193,16 @@ static int serial_install(struct tty_driver *driver, struct tty_struct *tty)
 	if (retval)
 		goto error_get_interface;
 
+	init_termios = (driver->termios[idx] == NULL);
+
 	retval = tty_standard_install(driver, tty);
 	if (retval)
 		goto error_init_termios;
 
 	mutex_unlock(&serial->disc_mutex);
 
-	/* allow the driver to update the settings */
-	if (serial->type->init_termios)
+	/* allow the driver to update the initial settings */
+	if (init_termios && serial->type->init_termios)
 		serial->type->init_termios(tty);
 
 	tty->driver_data = port;
-- 
2.21.0


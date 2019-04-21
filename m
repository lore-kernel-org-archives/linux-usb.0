Return-Path: <SRS0=vzMr=SX=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	T_DKIMWL_WL_HIGH,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4B04C10F14
	for <linux-usb@archiver.kernel.org>; Sun, 21 Apr 2019 12:22:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 9520420859
	for <linux-usb@archiver.kernel.org>; Sun, 21 Apr 2019 12:22:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1555849324;
	bh=K5VJC7NAiSSVnpVJD+QRLIwIScd8HIhLRwSjNGOIDt8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-ID:From;
	b=Am/NeqMcy7HsVZLL7csk62j1fY1BIVFg+sreN2lEDXMGlrsh3P6clBV2nqIYbCz4i
	 VYPEkaDbwRbzPNz59TNkCzTB7XfrFrurhOetTMmZZWJpRy/ZBrpZysT5synSrbaU1S
	 7o+K/hUqpCcvSZ3RkJg8UAINI+FLvUVeps94lot4=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727512AbfDUMWD (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Sun, 21 Apr 2019 08:22:03 -0400
Received: from mail-lf1-f68.google.com ([209.85.167.68]:36018 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725963AbfDUMWC (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 21 Apr 2019 08:22:02 -0400
Received: by mail-lf1-f68.google.com with SMTP id u17so7139767lfi.3
        for <linux-usb@vger.kernel.org>; Sun, 21 Apr 2019 05:22:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=cR4oDQjCgqBi5JCazU5MJ8A8IH0Qnc6AMKYJ6RQ6BpY=;
        b=FUu1xAtLAa8Gjs5dnONSL0vJlkqVxQR+Jdy8L60pfVZxQbqfze1jMMv7lghMv4kGq3
         pod2dP2LNmUuRoVoVs9ry2FzX0mKJtfdfcQWPbNwom6Ih3KwLxPR9ZLXUO0ER0/HLDKN
         5ddWA9wuFfUBiTFuro185a2du5Q9JMq7oTy9+e9RHKKK7h23pYSRo9adcSUHpzyCYyGT
         J48HYTMDRhKThCqatf0w/lRPeljZg+F89n1FWh4oXeRX0eF8rQCbJ9XGv33p0Fmkq113
         H7V2yX/zCn2r9DMHGHFkuYA9VJKjsru4W+NPI7TLClXPBNPTYdIRmc58azZAi1J3f49T
         S42Q==
X-Gm-Message-State: APjAAAWDY+qPJYtoe4EZQPFYkbczgri74O3NMEVKo9P735ZnwC2vqaRu
        oZis2P3qm/c9he3Xy63h+Urzu2wT
X-Google-Smtp-Source: APXvYqxIi4S0fuvp8QDZQ/+C8jQGetRggkVyvlZOVZdJDDsrN+33ZbI+C02TGeviRlRasBGQb0peXw==
X-Received: by 2002:ac2:5501:: with SMTP id j1mr7380117lfk.89.1555849320155;
        Sun, 21 Apr 2019 05:22:00 -0700 (PDT)
Received: from xi.terra (c-74bee655.07-184-6d6c6d4.bbcust.telenor.se. [85.230.190.116])
        by smtp.gmail.com with ESMTPSA id m23sm2245702ljh.93.2019.04.21.05.21.54
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 21 Apr 2019 05:21:55 -0700 (PDT)
Received: from johan by xi.terra with local (Exim 4.91)
        (envelope-from <johan@xi.terra>)
        id 1hIBTs-0006tp-9i; Sun, 21 Apr 2019 14:22:00 +0200
From:   Johan Hovold <johan@kernel.org>
To:     linux-usb@vger.kernel.org
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Johan Hovold <johan@kernel.org>
Subject: [PATCH 2/9] USB: serial: ark3116: drop redundant init_termios
Date:   Sun, 21 Apr 2019 14:21:47 +0200
Message-Id: <20190421122154.26465-3-johan@kernel.org>
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
Message-ID: <20190421122147.Cs54vSGYPCli7nVf1mVBICVnQJETrM2ftb16zanC7Bg@z>

The initial terminal settings set by the driver matches the default
settings provided by core so drop the redundant init_termios callback.

Signed-off-by: Johan Hovold <johan@kernel.org>
---
 drivers/usb/serial/ark3116.c | 11 -----------
 1 file changed, 11 deletions(-)

diff --git a/drivers/usb/serial/ark3116.c b/drivers/usb/serial/ark3116.c
index ff38aa8963cf..71a9206ea1e2 100644
--- a/drivers/usb/serial/ark3116.c
+++ b/drivers/usb/serial/ark3116.c
@@ -189,16 +189,6 @@ static int ark3116_port_remove(struct usb_serial_port *port)
 	return 0;
 }
 
-static void ark3116_init_termios(struct tty_struct *tty)
-{
-	struct ktermios *termios = &tty->termios;
-	*termios = tty_std_termios;
-	termios->c_cflag = B9600 | CS8
-				      | CREAD | HUPCL | CLOCAL;
-	termios->c_ispeed = 9600;
-	termios->c_ospeed = 9600;
-}
-
 static void ark3116_set_termios(struct tty_struct *tty,
 				struct usb_serial_port *port,
 				struct ktermios *old_termios)
@@ -645,7 +635,6 @@ static struct usb_serial_driver ark3116_device = {
 	.port_probe =		ark3116_port_probe,
 	.port_remove =		ark3116_port_remove,
 	.set_termios =		ark3116_set_termios,
-	.init_termios =		ark3116_init_termios,
 	.get_serial =		ark3116_get_serial_info,
 	.tiocmget =		ark3116_tiocmget,
 	.tiocmset =		ark3116_tiocmset,
-- 
2.21.0


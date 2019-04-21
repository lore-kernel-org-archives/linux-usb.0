Return-Path: <SRS0=vzMr=SX=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	T_DKIMWL_WL_HIGH,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45716C10F14
	for <linux-usb@archiver.kernel.org>; Sun, 21 Apr 2019 12:22:06 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 0750F20859
	for <linux-usb@archiver.kernel.org>; Sun, 21 Apr 2019 12:22:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1555849326;
	bh=sAYQIFUPeigVwBrgw4lUiW535h84FpVnUKSjeqBYXQg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-ID:From;
	b=xxkbn5bW3RmMSV5yTB5vuSWYzJ3+sQDWeM4TaPfrQHgoV9tA58IYjjhxJwtLTEUqz
	 gGNAt9n8ecpZ7SxcCNJCrwEfG+E9DZwdxVrAs6ClTVMJRZ/jn4dI1agJfUHhNmww56
	 xD3MEvBsIhXNgnPbyatUF1cmqarBgXpqY6lk+vyw=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727502AbfDUMWD (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Sun, 21 Apr 2019 08:22:03 -0400
Received: from mail-lj1-f194.google.com ([209.85.208.194]:34993 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727394AbfDUMWA (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 21 Apr 2019 08:22:00 -0400
Received: by mail-lj1-f194.google.com with SMTP id t4so8185471ljc.2
        for <linux-usb@vger.kernel.org>; Sun, 21 Apr 2019 05:21:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=p5bWSJsEz+ddv2Q+fw+xPBri0Ahm6avFqe4fG8KjMJU=;
        b=TJtQVoyQSI7SHAqkiXeYF0GovAOXp6aDjlRZJlGGnvj0Kq33mW+yTT+HwWvu0U9x4C
         SVja1OAeS2rK7MxLu5NyFCFTPhqYIqhBeaACVGpBn1VbPmR/i4YIKfMOD1vgGmLRGNZE
         8sBpKNqc7Bf0D/aESD4+8s3BmYa3n134yI7nwNLHoZIULGl7cRpzFjnnbtCYfqvSWoW0
         n3kTH2Vwmaq+ylGywRJCF0SmN3qaxAawi9TkVB5fZ1o+FPE7PzGd6uFHXERcwHQRmrz/
         npE8ssljYLXvHtUXN41WaAqtiSiy8xipJ2bSm0NWd8JfJE71FCFlfhHpL3DtBZolXYvd
         ypmA==
X-Gm-Message-State: APjAAAV9+rzSL8c0mDLXZg09u4UGMqA+x6BD/xox5+g8VjHK+tZnbouH
        SXFC2P/4RE3dp4HgMw/uCrYA8dge
X-Google-Smtp-Source: APXvYqxpKDSAAZJdbZ1hr79s9rrUcgPSTXkpmVQIMbPThcsRwTjhVmekJeVUH0svGbU7pTTnDjNsBw==
X-Received: by 2002:a2e:8050:: with SMTP id p16mr7406683ljg.160.1555849318548;
        Sun, 21 Apr 2019 05:21:58 -0700 (PDT)
Received: from xi.terra (c-74bee655.07-184-6d6c6d4.bbcust.telenor.se. [85.230.190.116])
        by smtp.gmail.com with ESMTPSA id f21sm2233538ljk.94.2019.04.21.05.21.54
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 21 Apr 2019 05:21:55 -0700 (PDT)
Received: from johan by xi.terra with local (Exim 4.91)
        (envelope-from <johan@xi.terra>)
        id 1hIBTs-0006uE-MI; Sun, 21 Apr 2019 14:22:00 +0200
From:   Johan Hovold <johan@kernel.org>
To:     linux-usb@vger.kernel.org
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Johan Hovold <johan@kernel.org>
Subject: [PATCH 7/9] USB: serial: iuu_phoenix: simplify init_termios
Date:   Sun, 21 Apr 2019 14:21:52 +0200
Message-Id: <20190421122154.26465-8-johan@kernel.org>
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
Message-ID: <20190421122152.iOVhOe1KU3V5Rprp38ObwikTBzyHEmZqNTss8asVHDw@z>

Override the initial terminal settings provided by core directly instead
of first resetting them to tty_std_termios.

Also reorder the cflags as they are usually seen (in bit order).

Signed-off-by: Johan Hovold <johan@kernel.org>
---
 drivers/usb/serial/iuu_phoenix.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/usb/serial/iuu_phoenix.c b/drivers/usb/serial/iuu_phoenix.c
index 93763d3d5e56..d5bff69b1769 100644
--- a/drivers/usb/serial/iuu_phoenix.c
+++ b/drivers/usb/serial/iuu_phoenix.c
@@ -942,8 +942,7 @@ static void iuu_close(struct usb_serial_port *port)
 
 static void iuu_init_termios(struct tty_struct *tty)
 {
-	tty->termios = tty_std_termios;
-	tty->termios.c_cflag = CLOCAL | CREAD | CS8 | B9600 | CSTOPB | PARENB;
+	tty->termios.c_cflag = B9600 | CS8 | CSTOPB | CREAD | PARENB | CLOCAL;
 	tty->termios.c_ispeed = 9600;
 	tty->termios.c_ospeed = 9600;
 	tty->termios.c_lflag = 0;
-- 
2.21.0


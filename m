Return-Path: <SRS0=vzMr=SX=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	T_DKIMWL_WL_HIGH,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2DFDC282E1
	for <linux-usb@archiver.kernel.org>; Sun, 21 Apr 2019 12:22:06 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id B8CF620859
	for <linux-usb@archiver.kernel.org>; Sun, 21 Apr 2019 12:22:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1555849326;
	bh=Qhp/CwVaFqPjuh86c8oUG3+BYAfidFJ0LwKb321S7Io=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-ID:From;
	b=zV0Z4gK317sbcwyAncvAvCHnHMGi+CbGsMKS9b2h0LAaarE0E52jUida/vpQWPalR
	 Sxh0/RzljgkLq4qCAnGmywUTqSaWkbdPSYM3Etiv+oOVFL6SwEuXH0MvJhQFzTXSYi
	 TfMTPslEIirMdt6oF/FLWhe7lPeqoTyMxNObf4k0=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727514AbfDUMWF (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Sun, 21 Apr 2019 08:22:05 -0400
Received: from mail-lf1-f65.google.com ([209.85.167.65]:33405 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727495AbfDUMWE (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 21 Apr 2019 08:22:04 -0400
Received: by mail-lf1-f65.google.com with SMTP id j11so7136771lfm.0
        for <linux-usb@vger.kernel.org>; Sun, 21 Apr 2019 05:22:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=lEsJXvjwb/PGf4av9Kna2ZrjEm18j4+1PhbIO6niJ8o=;
        b=muKhPTJkfQ4BvjPF8QFm3lj8Dh3MA0RL127PPmYxkUEX3qUVm64087aCzMc8DeUC+F
         yojmedf/3Sc5fw7Lnjre8qAa7TP5aDa1FEANCvzyTfPDKKSJ2KBg5b72DMYM/GC+MPZW
         gPrR2o3+f1tnQMwI1e84IrY3kBQL/ntZ32ANUXAZfpjFhe1G8WEB5L51DLI4ip8AE31P
         TqNMnUFnuPCobuQAr4g83GE/HUoWFoEr9d6e4uCHAAOtxDpPgU/7r2pdPeVF3DE7nbq9
         xsqsvw/8FYfl7Ab9T64GjFAaXSB0PofjH24vSfJ3luRxmG/JMmoMiZn9L+aSA59iUoI2
         MbIg==
X-Gm-Message-State: APjAAAV3iBhdbOCb+VRCZGDMC2acciZn4M1nNmQKrL6NfDvNCWDZKojN
        Vlv98bdlUsanpEjtRcAMK2NvOUN0
X-Google-Smtp-Source: APXvYqxbV2gy/SI7rV1Tpzm2vmiye0w2jrTo0CVWo+Pgtk5G31JtIxcQCVrAKn5tDZYKpY8udpqmeA==
X-Received: by 2002:a19:1dc7:: with SMTP id d190mr7569632lfd.48.1555849321660;
        Sun, 21 Apr 2019 05:22:01 -0700 (PDT)
Received: from xi.terra (c-74bee655.07-184-6d6c6d4.bbcust.telenor.se. [85.230.190.116])
        by smtp.gmail.com with ESMTPSA id k25sm2221230ljc.14.2019.04.21.05.21.54
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 21 Apr 2019 05:21:55 -0700 (PDT)
Received: from johan by xi.terra with local (Exim 4.91)
        (envelope-from <johan@xi.terra>)
        id 1hIBTs-0006uJ-PB; Sun, 21 Apr 2019 14:22:00 +0200
From:   Johan Hovold <johan@kernel.org>
To:     linux-usb@vger.kernel.org
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Johan Hovold <johan@kernel.org>
Subject: [PATCH 8/9] USB: serial: oti6858: simplify init_termios
Date:   Sun, 21 Apr 2019 14:21:53 +0200
Message-Id: <20190421122154.26465-9-johan@kernel.org>
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
Message-ID: <20190421122153.C5G-2aqOlBKrkWyuGRXRLbfNLVSxcIrG37UnnL7CvSQ@z>

Simplify init_termios which is only used to override the initial
baudrate.

Signed-off-by: Johan Hovold <johan@kernel.org>
---
 drivers/usb/serial/oti6858.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/usb/serial/oti6858.c b/drivers/usb/serial/oti6858.c
index ae9cb15ee02d..38ae0fc826cc 100644
--- a/drivers/usb/serial/oti6858.c
+++ b/drivers/usb/serial/oti6858.c
@@ -393,10 +393,7 @@ static int oti6858_chars_in_buffer(struct tty_struct *tty)
 
 static void oti6858_init_termios(struct tty_struct *tty)
 {
-	tty->termios = tty_std_termios;
-	tty->termios.c_cflag = B38400 | CS8 | CREAD | HUPCL | CLOCAL;
-	tty->termios.c_ispeed = 38400;
-	tty->termios.c_ospeed = 38400;
+	tty_encode_baud_rate(tty, 38400, 38400);
 }
 
 static void oti6858_set_termios(struct tty_struct *tty,
-- 
2.21.0


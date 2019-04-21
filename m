Return-Path: <SRS0=vzMr=SX=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	T_DKIMWL_WL_HIGH,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59201C282E1
	for <linux-usb@archiver.kernel.org>; Sun, 21 Apr 2019 12:22:01 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 2296720869
	for <linux-usb@archiver.kernel.org>; Sun, 21 Apr 2019 12:22:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1555849321;
	bh=vxfQDXarWLZbmws3NNKYD8t2s+yAlQvl2tiAEhMdKb8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-ID:From;
	b=u4E9eZRNIb7gi4kJlLto80pIYzw496a6IhClO3AbVNyRMWjDaTQaoiQr8qSgoDCH1
	 CGXglH0cKmiUOhyJnDA4Z7BoKPtfcE+Uf0m/eObrtiJC1zsPF7ePE+G//5xmj+fJOc
	 wtw99B+gmDnSQ8rC0PaLwhbMjAFrxSF2pZ8AHfgI=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727412AbfDUMWA (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Sun, 21 Apr 2019 08:22:00 -0400
Received: from mail-lf1-f65.google.com ([209.85.167.65]:40418 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727368AbfDUMV7 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 21 Apr 2019 08:21:59 -0400
Received: by mail-lf1-f65.google.com with SMTP id a28so7119954lfo.7
        for <linux-usb@vger.kernel.org>; Sun, 21 Apr 2019 05:21:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=fAhC/WX+6J0nXpY/NoNtT8XueLyId+XZUjl4jOW+1kg=;
        b=eCi5Nszj4fFxDFURQjF4NnBSBr6vi9cKfqKpoyBg1gp+JYtAaBN/qVnwmMgR1DdIFc
         MeHPsAk19MR+FFsHeCzcwzOHgMtiFcLZCxELpstqvUzqh5T3gryvMRFxfhsDOl1LgJkS
         q2O1vnKjz2f5qTOsgaJzppXMSWTVOj0v2wtfJzLHrO48tn1iss92kjR9XMEBqCgWiRW4
         3Y7is3ks/PECpzJShRR0aapeguQdxGtmPKc0emAyI272ANVyvBR46JyQBLtxGSQWUmXV
         PNgCTvPsiOuhIjLJUQaQyhoImt9BdIxbwre5bhpd8sQpv9c/VCM1BGkt4eY6z8TAfC3q
         okxA==
X-Gm-Message-State: APjAAAWJiKOPFfN5Zs7dT+Vvgvt9s2Eg2wd4YK3/XDyUNDDn/ZHsuXj2
        Dyqq0f2arVK7LZcSV8GwjPEo6qCG
X-Google-Smtp-Source: APXvYqyWiwqY1BN7fzuSJ1cTvpiShqJ/N39TqXxtNioyNa/6HRLWNlH2i/q3XyAEBk3Cuy45aQceaA==
X-Received: by 2002:a19:751a:: with SMTP id y26mr7785744lfe.47.1555849316957;
        Sun, 21 Apr 2019 05:21:56 -0700 (PDT)
Received: from xi.terra (c-74bee655.07-184-6d6c6d4.bbcust.telenor.se. [85.230.190.116])
        by smtp.gmail.com with ESMTPSA id v21sm2448520lfg.26.2019.04.21.05.21.54
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 21 Apr 2019 05:21:55 -0700 (PDT)
Received: from johan by xi.terra with local (Exim 4.91)
        (envelope-from <johan@xi.terra>)
        id 1hIBTs-0006tz-EY; Sun, 21 Apr 2019 14:22:00 +0200
From:   Johan Hovold <johan@kernel.org>
To:     linux-usb@vger.kernel.org
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Johan Hovold <johan@kernel.org>
Subject: [PATCH 4/9] USB: serial: cypress_m8: drop unused termios
Date:   Sun, 21 Apr 2019 14:21:49 +0200
Message-Id: <20190421122154.26465-5-johan@kernel.org>
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
Message-ID: <20190421122149.7xrDezV09NiCjSWl0PSxj6yWkrAUQ-l-ppl3DWG0rg0@z>

Drop driver termios structure that held a copy of the tty termios for
no good reason.

Signed-off-by: Johan Hovold <johan@kernel.org>
---
 drivers/usb/serial/cypress_m8.c | 12 +-----------
 1 file changed, 1 insertion(+), 11 deletions(-)

diff --git a/drivers/usb/serial/cypress_m8.c b/drivers/usb/serial/cypress_m8.c
index 8a06e5ffe644..f9bbbdd1a148 100644
--- a/drivers/usb/serial/cypress_m8.c
+++ b/drivers/usb/serial/cypress_m8.c
@@ -108,9 +108,6 @@ struct cypress_private {
 	int baud_rate;			   /* stores current baud rate in
 					      integer form */
 	char prev_status;		   /* used for TIOCMIWAIT */
-	/* we pass a pointer to this as the argument sent to
-	   cypress_set_termios old_termios */
-	struct ktermios tmp_termios; 	   /* stores the old termios settings */
 };
 
 /* function prototypes for the Cypress USB to serial device */
@@ -603,7 +600,7 @@ static int cypress_open(struct tty_struct *tty, struct usb_serial_port *port)
 	cypress_send(port);
 
 	if (tty)
-		cypress_set_termios(tty, port, &priv->tmp_termios);
+		cypress_set_termios(tty, port, NULL);
 
 	/* setup the port and start reading from the device */
 	usb_fill_int_urb(port->interrupt_in_urb, serial->dev,
@@ -899,13 +896,6 @@ static void cypress_set_termios(struct tty_struct *tty,
 
 	cflag = tty->termios.c_cflag;
 
-	/* check if there are new settings */
-	if (old_termios) {
-		spin_lock_irqsave(&priv->lock, flags);
-		priv->tmp_termios = tty->termios;
-		spin_unlock_irqrestore(&priv->lock, flags);
-	}
-
 	/* set number of data bits, parity, stop bits */
 	/* when parity is disabled the parity type bit is ignored */
 
-- 
2.21.0


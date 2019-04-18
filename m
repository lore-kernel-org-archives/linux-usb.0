Return-Path: <SRS0=JW0E=SU=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	T_DKIMWL_WL_HIGH,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA62EC10F0E
	for <linux-usb@archiver.kernel.org>; Thu, 18 Apr 2019 16:20:20 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 7AD83206B6
	for <linux-usb@archiver.kernel.org>; Thu, 18 Apr 2019 16:20:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1555604420;
	bh=K5GE9K66X3rAFYUZw5S1KfAXRzOdlgQTSxFEA/NsJig=;
	h=From:To:Cc:Subject:Date:List-ID:From;
	b=VwLxPnce//VOyVX5Mii7vUUPI/fEF3vglcOxSyASzp514l/3HePoMs9HMAkHXJ88Q
	 ElWzZHalqrVBEemBjeKHrdDvoUaIb6TZS96aB8lrt18bKKk1Wa7fanx9fD6JlCDeqM
	 E3CBlfE4jDv85ndg3EipWHbq/ReZ8oYmMmBQt6as=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389005AbfDRQUT (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Thu, 18 Apr 2019 12:20:19 -0400
Received: from mail-lf1-f67.google.com ([209.85.167.67]:43984 "EHLO
        mail-lf1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725888AbfDRQUT (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 18 Apr 2019 12:20:19 -0400
Received: by mail-lf1-f67.google.com with SMTP id i68so2070205lfi.10
        for <linux-usb@vger.kernel.org>; Thu, 18 Apr 2019 09:20:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=VKIh/3zfog5t/yt1HIBidUiXFtzBet2TRIjomD6FHZk=;
        b=f2G+1pUtRPNp2rvCYHPPuCdcQ9Bo4LkTXw12zy32YFdRCaMGCDQRErcnwUavisjV2D
         5+Rs7miP8Z27ztZtWYU7hpnzlO88pdM6nejKuBy0+T7NGxIddBtTchV5zovNt4T24jdC
         l4Sfn6+hiU5SOQaqjgVbIftTwjkioB0XEPTA8lKENVLa2SgOjrgPMOrEbGNjKzntLadN
         /1jcaCPb3a1IPzAUFnYMhvzYI0IVuyEfsLdr3jifbx5mE4FGEgxQjcWqI+st5quKP+L/
         xsTG5zSqhIwthQAF7zXrz6v6yekmqkMT7M5qb5vwYLlr1ONAbZf6qXJr8wYU0UT/36Nf
         OpNw==
X-Gm-Message-State: APjAAAUAemMpqs8uUYUeewNz3mctMlQtizOZuWUAuDa64udQm1emGBnE
        HKWG54SxIhOeIAWqU2aU6Z8ibgIe
X-Google-Smtp-Source: APXvYqwrsBRdmrWbUMp68O9p1S9inQCOWlImyfg5tioJ3YzooqUwpYvrhdAd3K3e8dKzBRis0sVfHQ==
X-Received: by 2002:a19:c018:: with SMTP id q24mr52514832lff.38.1555604417125;
        Thu, 18 Apr 2019 09:20:17 -0700 (PDT)
Received: from xi.terra (c-74bee655.07-184-6d6c6d4.bbcust.telenor.se. [85.230.190.116])
        by smtp.gmail.com with ESMTPSA id p18sm504130ljp.1.2019.04.18.09.20.15
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 18 Apr 2019 09:20:15 -0700 (PDT)
Received: from johan by xi.terra with local (Exim 4.91)
        (envelope-from <johan@xi.terra>)
        id 1hH9lx-00068r-6d; Thu, 18 Apr 2019 18:20:25 +0200
From:   Johan Hovold <johan@kernel.org>
To:     linux-usb@vger.kernel.org
Cc:     Johan Hovold <johan@kernel.org>
Subject: [PATCH 1/2] USB: serial: digi_acceleport: clean up modem-control handling
Date:   Thu, 18 Apr 2019 18:20:19 +0200
Message-Id: <20190418162020.23566-1-johan@kernel.org>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190418162019.p9yIbgPD5LfiEWf6LgoMmaDocNKousNHlk9K_PgB_fI@z>

Clean up modem-control handling somewhat by adding missing whitespace
around operators and splitting a long statement in two.

Signed-off-by: Johan Hovold <johan@kernel.org>
---
 drivers/usb/serial/digi_acceleport.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/serial/digi_acceleport.c b/drivers/usb/serial/digi_acceleport.c
index e7f244cf2c07..4699e114f617 100644
--- a/drivers/usb/serial/digi_acceleport.c
+++ b/drivers/usb/serial/digi_acceleport.c
@@ -569,9 +569,9 @@ static int digi_set_modem_signals(struct usb_serial_port *port,
 	ret = usb_submit_urb(oob_port->write_urb, GFP_ATOMIC);
 	if (ret == 0) {
 		oob_priv->dp_write_urb_in_use = 1;
-		port_priv->dp_modem_signals =
-			(port_priv->dp_modem_signals&~(TIOCM_DTR|TIOCM_RTS))
-			| (modem_signals&(TIOCM_DTR|TIOCM_RTS));
+		port_priv->dp_modem_signals &= ~(TIOCM_DTR | TIOCM_RTS);
+		port_priv->dp_modem_signals |=
+				modem_signals & (TIOCM_DTR | TIOCM_RTS);
 	}
 	spin_unlock(&port_priv->dp_port_lock);
 	spin_unlock_irqrestore(&oob_priv->dp_port_lock, flags);
@@ -1084,7 +1084,7 @@ static int digi_chars_in_buffer(struct tty_struct *tty)
 static void digi_dtr_rts(struct usb_serial_port *port, int on)
 {
 	/* Adjust DTR and RTS */
-	digi_set_modem_signals(port, on * (TIOCM_DTR|TIOCM_RTS), 1);
+	digi_set_modem_signals(port, on * (TIOCM_DTR | TIOCM_RTS), 1);
 }
 
 static int digi_open(struct tty_struct *tty, struct usb_serial_port *port)
-- 
2.21.0


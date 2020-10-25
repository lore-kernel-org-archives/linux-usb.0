Return-Path: <SRS0=7VGP=EA=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 014C8C5517A
	for <linux-usb@archiver.kernel.org>; Sun, 25 Oct 2020 17:48:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id BD598208A9
	for <linux-usb@archiver.kernel.org>; Sun, 25 Oct 2020 17:48:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1603648090;
	bh=ku5vLd5Iusn82tuAbgP5kPGe9nSMcfc94jRxyrE866M=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-ID:From;
	b=T9g+POVUDr3yxIiadinWigS1b28UdXWqXJKE7JMopsskiQlCJlBwhNSVamy9PNtVo
	 yZeUPZdX0RJH1bzhDGCFvvb1LYG5BOenhCYhxxNJQa2MXA04fx7YYUP1uk/B8Yu2hB
	 qTjAJLnoaNAnmzQD3RfetAwfW/OBaB7ckunBEgq4=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1417711AbgJYRqi (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Sun, 25 Oct 2020 13:46:38 -0400
Received: from mail-lf1-f65.google.com ([209.85.167.65]:33302 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1417703AbgJYRqi (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 25 Oct 2020 13:46:38 -0400
Received: by mail-lf1-f65.google.com with SMTP id l2so8946065lfk.0;
        Sun, 25 Oct 2020 10:46:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=DM3vq5KoxogYKwdBtmc66x0pBZlJ1K2bRpuSSZ/7cuI=;
        b=PV6HokVAeS0Hrokca8ZhpR5VV5hC0VgAq/HRz3BlUej8WxlwOOXhRhfO6Yo5j+B+5J
         TUpmxcPnzTXHjgiIDSAC/54Mc2x4iic0w8iG9uFWDQGuDZs2D2//Rcva90ABLgLsxLij
         x92JYF7G+cpTzbJCSnOB7UMdQYFiWj46sY0p6DoXg2Tl0rd4oq8uNX3rVyb2Cirnepbl
         m6FghfL6kWo5JCeHY5aPLgmmzr9KS9mtaYDX+d7kfTLAY8rnz8sUPzWZ2kagZ8utEtPb
         ULHz3E2Po/adGUZaLJxxTNshHCBL0lNRddfIrEfZw3sFFLKdlWh8EGBefST5yb4zqESq
         OFPw==
X-Gm-Message-State: AOAM533hm79TIuoRpKrECCM6TPc1FWaludBX6VHIb7OIA90cWjFDjMsl
        Z/Nsll1/nGzUxCayhuUBmPCbnbrrehHInw==
X-Google-Smtp-Source: ABdhPJz8eCUR10EUzfpCmmU3MRqzeq9ZIzxRab2NEJvy+Ss3yLa9zCaaM/4vWVutak0oImjYQDCWrg==
X-Received: by 2002:ac2:4a88:: with SMTP id l8mr3563444lfp.380.1603647995602;
        Sun, 25 Oct 2020 10:46:35 -0700 (PDT)
Received: from xi.terra (c-beaee455.07-184-6d6c6d4.bbcust.telenor.se. [85.228.174.190])
        by smtp.gmail.com with ESMTPSA id j10sm880891ljb.93.2020.10.25.10.46.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2020 10:46:35 -0700 (PDT)
Received: from johan by xi.terra with local (Exim 4.93.0.4)
        (envelope-from <johan@xi.terra>)
        id 1kWk6I-0007HT-S1; Sun, 25 Oct 2020 18:46:38 +0100
From:   Johan Hovold <johan@kernel.org>
To:     linux-usb@vger.kernel.org
Cc:     "Ahmed S . Darwish" <a.darwish@linutronix.de>,
        Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
        Thomas Gleixner <tglx@linutronix.de>,
        linux-kernel@vger.kernel.org, Johan Hovold <johan@kernel.org>,
        stable@vger.kernel.org
Subject: [PATCH 05/14] USB: serial: keyspan_pda: fix tx-unthrottle use-after-free
Date:   Sun, 25 Oct 2020 18:45:51 +0100
Message-Id: <20201025174600.27896-6-johan@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201025174600.27896-1-johan@kernel.org>
References: <20201025174600.27896-1-johan@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The driver's transmit-unthrottle work was never flushed on disconnect,
something which could lead to the driver port data being freed while the
unthrottle work is still scheduled.

Fix this by cancelling the unthrottle work when shutting down the port.

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Cc: stable@vger.kernel.org
Signed-off-by: Johan Hovold <johan@kernel.org>
---
 drivers/usb/serial/keyspan_pda.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/usb/serial/keyspan_pda.c b/drivers/usb/serial/keyspan_pda.c
index d91180ab5f3b..781b6723379f 100644
--- a/drivers/usb/serial/keyspan_pda.c
+++ b/drivers/usb/serial/keyspan_pda.c
@@ -647,8 +647,12 @@ static int keyspan_pda_open(struct tty_struct *tty,
 }
 static void keyspan_pda_close(struct usb_serial_port *port)
 {
+	struct keyspan_pda_private *priv = usb_get_serial_port_data(port);
+
 	usb_kill_urb(port->write_urb);
 	usb_kill_urb(port->interrupt_in_urb);
+
+	cancel_work_sync(&priv->unthrottle_work);
 }
 
 
-- 
2.26.2


Return-Path: <SRS0=vzMr=SX=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	T_DKIMWL_WL_HIGH,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3633C10F14
	for <linux-usb@archiver.kernel.org>; Sun, 21 Apr 2019 12:22:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 7A1CD20859
	for <linux-usb@archiver.kernel.org>; Sun, 21 Apr 2019 12:22:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1555849327;
	bh=PphHLM9CJLlpdvxTLEpP7ZkkO5zx71XOCjLBJVMJiKg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-ID:From;
	b=q+MuSP/3c7tWldxcW7UeqoK9IOdAxXmeFpA05GHXx5ArN/YKned1to2i8IQkxwKO/
	 b3Ve/STbpIBQh0U4B/zgumP8atQVgRjijf3AcdF0fk7zylHq5eWXnhzqFeyNVYVVTO
	 P5JK2YOvcnSEvveBV4p3zJ4lNECXSIzGIaXyGmAg=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727527AbfDUMWG (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Sun, 21 Apr 2019 08:22:06 -0400
Received: from mail-lj1-f193.google.com ([209.85.208.193]:46632 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727493AbfDUMWD (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 21 Apr 2019 08:22:03 -0400
Received: by mail-lj1-f193.google.com with SMTP id h21so8159900ljk.13
        for <linux-usb@vger.kernel.org>; Sun, 21 Apr 2019 05:22:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=/ScZUliEh9FnHx45z8707jRm5oj6HJmrw+aT4INikS0=;
        b=sIv+PDttqvPfmR3VTLQPfHlQqQjwCkQO0vZxHhWBHOHYcMPpY/JK0KpMVTrNnnboUW
         j4hDJDoohGwLAloHqBtGGbvYxLWyVn0CFJe1QBBYhCmwj90pxgrTe9jgj2g9T6kHod16
         lbJdt91/oIxYw/AIZlsci1dUWJCBDw8s5EDW96KolfpagjKbhzOILSUw+n9iP8D8FUV6
         SK+aWzSxj4JbrdABY0YM0sCSZk54HYwgPr/51KGtddMWkK6swChdQEkmp8upktLdAP8R
         3HEfnfWnvWR5P+WlxqDAwfNedja3Ho3rVh7GwFaaQLdKdHjErqDfN0/8yLXKT2xpAGO6
         hEiA==
X-Gm-Message-State: APjAAAVWm2zXETqpLqtLKG9gxJx9QxZ4HyE1Ie208PJe7jyBsAZqLUQE
        IXyyIqUl14LYte48rQ89vOB9Lt7y
X-Google-Smtp-Source: APXvYqw5ug0DLNLbpBzXz94g6DMNk2yhF5w0L7H9zGJwkNjDr9vATtqgqYM/0ybrclIZYesWnocDWQ==
X-Received: by 2002:a2e:844a:: with SMTP id u10mr7418183ljh.41.1555849321144;
        Sun, 21 Apr 2019 05:22:01 -0700 (PDT)
Received: from xi.terra (c-74bee655.07-184-6d6c6d4.bbcust.telenor.se. [85.230.190.116])
        by smtp.gmail.com with ESMTPSA id w2sm2854341lfa.63.2019.04.21.05.21.54
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 21 Apr 2019 05:21:55 -0700 (PDT)
Received: from johan by xi.terra with local (Exim 4.91)
        (envelope-from <johan@xi.terra>)
        id 1hIBTs-0006uO-RL; Sun, 21 Apr 2019 14:22:00 +0200
From:   Johan Hovold <johan@kernel.org>
To:     linux-usb@vger.kernel.org
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Johan Hovold <johan@kernel.org>
Subject: [PATCH 9/9] USB: serial: spcp8x5: simplify init_termios
Date:   Sun, 21 Apr 2019 14:21:54 +0200
Message-Id: <20190421122154.26465-10-johan@kernel.org>
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
Message-ID: <20190421122154.fIAIMJhmZNU-QeBYsrMzjNO2BADmTUihpLk5Lv0mIDA@z>

Simplify init_termios which is only used to override the initial
baudrate.

Signed-off-by: Johan Hovold <johan@kernel.org>
---
 drivers/usb/serial/spcp8x5.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/usb/serial/spcp8x5.c b/drivers/usb/serial/spcp8x5.c
index b42714855364..3bac55bd9bd9 100644
--- a/drivers/usb/serial/spcp8x5.c
+++ b/drivers/usb/serial/spcp8x5.c
@@ -281,10 +281,7 @@ static void spcp8x5_dtr_rts(struct usb_serial_port *port, int on)
 
 static void spcp8x5_init_termios(struct tty_struct *tty)
 {
-	tty->termios = tty_std_termios;
-	tty->termios.c_cflag = B115200 | CS8 | CREAD | HUPCL | CLOCAL;
-	tty->termios.c_ispeed = 115200;
-	tty->termios.c_ospeed = 115200;
+	tty_encode_baud_rate(tty, 115200, 115200);
 }
 
 static void spcp8x5_set_termios(struct tty_struct *tty,
-- 
2.21.0


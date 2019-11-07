Return-Path: <SRS0=QQLj=Y7=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE011FC6197
	for <linux-usb@archiver.kernel.org>; Thu,  7 Nov 2019 13:29:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id A465B218AE
	for <linux-usb@archiver.kernel.org>; Thu,  7 Nov 2019 13:29:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1573133376;
	bh=zbGOXK6Ej4J79e/5/pnwtezoahnhJbKLL0mCNoU0jiY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-ID:From;
	b=lWP5o/wtUpbFgWmGQl9m734pkYe/F+ufqHARIm3H/7ldpPSCqYwEQLwz1zM2hYeBv
	 ZlhidRZg8+NiuB3XtISL7tv2O9Aolc9bUjUkrQtS+1BKHhHcTX6jxMQkpBzF/VERS4
	 DNIOkrsP7NTpZd4GiARJQjSZUmHxDnvEJJwwMdC0=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388679AbfKGN3g (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Thu, 7 Nov 2019 08:29:36 -0500
Received: from mail-lf1-f67.google.com ([209.85.167.67]:35055 "EHLO
        mail-lf1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728687AbfKGN3f (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 7 Nov 2019 08:29:35 -0500
Received: by mail-lf1-f67.google.com with SMTP id y6so1616785lfj.2
        for <linux-usb@vger.kernel.org>; Thu, 07 Nov 2019 05:29:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Q5VZueLPa3LMWvRMgC3rV4Ys93H9McfqwkDOVYWZf8Q=;
        b=qNDqMYDoEZ3pSwNiV4Vf/Ov4U/lUi98terMsiIWGQmdfyNCkY90ywFY0XA51vROuW8
         DgMiYQ9jzKgGgL4ldPN8Q9FNR0O/YtqFdNBzlIPuKQxFfjvwO4p+aWRkC8l15xB+2i64
         uernuWsNdw0+8CN0Q+tlm3EdF4dmiLQpTNFKs+wjoyknN0M3YpoLftGyyC14nE0/6v8+
         elhPyzAU9zzWiBEcwi7PB7UY9wVPlDCfRp9G5jApabdI+d8wvdF5MMlfPFwzKadROQG+
         erzYzVV9saJwOr+psKLVfo19VC4IQHkOwZ3OBHGNyDdT2ZNevXTnU5Setv4h4J1egVPI
         0tmg==
X-Gm-Message-State: APjAAAXwuZXQ88GDHgVYxIYZN6n/n6zqKfXwMAMyqYnSoAcI1T9Z4oOg
        76RQLKktyYFNn+xdVj+fjGiB3XX3
X-Google-Smtp-Source: APXvYqyHCmQ9ifJTYr42CyTSds7atb78GpT4w8poKnzJKLyRmsHL4D5sZD94VXJUt2mR6eIPYDcYuQ==
X-Received: by 2002:a19:6d19:: with SMTP id i25mr2460871lfc.178.1573133373414;
        Thu, 07 Nov 2019 05:29:33 -0800 (PST)
Received: from xi.terra (c-51f1e055.07-184-6d6c6d4.bbcust.telenor.se. [85.224.241.81])
        by smtp.gmail.com with ESMTPSA id h26sm981414lfc.69.2019.11.07.05.29.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Nov 2019 05:29:28 -0800 (PST)
Received: from johan by xi.terra with local (Exim 4.92.3)
        (envelope-from <johan@xi.terra>)
        id 1iShqo-0000e8-2a; Thu, 07 Nov 2019 14:29:26 +0100
From:   Johan Hovold <johan@kernel.org>
To:     Johan Hovold <johan@kernel.org>
Cc:     linux-usb@vger.kernel.org
Subject: [PATCH 10/11] USB: serial: mos7840: drop read-urb check
Date:   Thu,  7 Nov 2019 14:29:03 +0100
Message-Id: <20191107132904.2379-11-johan@kernel.org>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191107132904.2379-1-johan@kernel.org>
References: <20191107132904.2379-1-johan@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Drop read-urb check which is always false from completion the callback.

The driver read-urb pointer is set at every open and is never cleared.

Signed-off-by: Johan Hovold <johan@kernel.org>
---
 drivers/usb/serial/mos7840.c | 11 -----------
 1 file changed, 11 deletions(-)

diff --git a/drivers/usb/serial/mos7840.c b/drivers/usb/serial/mos7840.c
index 11706f2d4145..f5c08effa3ab 100644
--- a/drivers/usb/serial/mos7840.c
+++ b/drivers/usb/serial/mos7840.c
@@ -457,12 +457,6 @@ static void mos7840_bulk_in_callback(struct urb *urb)
 		dev_dbg(&port->dev, "icount.rx is %d:\n", port->icount.rx);
 	}
 
-	if (!mos7840_port->read_urb) {
-		dev_dbg(&port->dev, "%s", "URB KILLED !!!\n");
-		mos7840_port->read_urb_busy = false;
-		return;
-	}
-
 	if (mos7840_port->has_led)
 		mos7840_led_activity(port);
 
@@ -1377,11 +1371,6 @@ static void mos7840_set_termios(struct tty_struct *tty,
 
 	mos7840_change_port_settings(tty, mos7840_port, old_termios);
 
-	if (!mos7840_port->read_urb) {
-		dev_dbg(&port->dev, "%s", "URB KILLED !!!!!\n");
-		return;
-	}
-
 	if (!mos7840_port->read_urb_busy) {
 		mos7840_port->read_urb_busy = true;
 		status = usb_submit_urb(mos7840_port->read_urb, GFP_KERNEL);
-- 
2.23.0


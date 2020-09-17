Return-Path: <SRS0=L0ZS=C2=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89E00C433E2
	for <linux-usb@archiver.kernel.org>; Thu, 17 Sep 2020 10:06:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 37374208DB
	for <linux-usb@archiver.kernel.org>; Thu, 17 Sep 2020 10:06:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=suse.com header.i=@suse.com header.b="O4EE4Sp5"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726576AbgIQKGf (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Thu, 17 Sep 2020 06:06:35 -0400
Received: from mx2.suse.de ([195.135.220.15]:37614 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726505AbgIQKGa (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 17 Sep 2020 06:06:30 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=cantorsusede;
        t=1600337188;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:in-reply-to:in-reply-to:references:references;
        bh=TkAAh4qN2sx9w0z1qXmsZmHjmzJsXUMLdDAvu1G9/ro=;
        b=O4EE4Sp5OaGlw8Dri/MZ3leyXobledDVkLffWe77fS4ckU/XtbzopOWaqKoJSTXVLGSd3R
        mo0vTauWyMrJQuttKAHbmrgoYMRjWXAe3UCllRdqvavpV2EXzuQmVCYs0Uy/McaTxV+vC5
        2WWTLH/vhxsh1SorJjmmRO8Mg6DeD1426/9vgExQ9dNdl+e4khPXxNbyZLlnWyFoCMqKRH
        ZJEvFV8WPZShM0YACnzY16uClYckW7Gy6sbZa2EHwyWhmipNBU+N6xdKZr1A/Ij4xr9rRd
        uDUKqxLo7C9e1du/OwJDhTQ7MNqmA/p78cnAqtA9SiZowfRehlRrgJtPZFW3zQ==
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id 9A59CAD5C;
        Thu, 17 Sep 2020 10:07:02 +0000 (UTC)
From:   Oliver Neukum <oneukum@suse.com>
To:     penguin-kernel@i-love.sakura.ne.jp, bjorn@mork.no,
        linux-usb@vger.kernel.org
Cc:     Oliver Neukum <oneukum@suse.com>
Subject: [RFC 1/7] CDC-WDM: fix hangs in flush()
Date:   Thu, 17 Sep 2020 12:06:08 +0200
Message-Id: <20200917100614.1010-2-oneukum@suse.com>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20200917100614.1010-1-oneukum@suse.com>
References: <20200917100614.1010-1-oneukum@suse.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

In a multithreaded scenario  a flush() and a write() may be waiting for the same
IO to complete. Hence completion of output must use wake_up_all(),
even in error handling, while a flush may be waiting for an intended but
not started Io.

Reported-by: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
Signed-off-by: Oliver Neukum <oneukum@suse.com>
---
 drivers/usb/class/cdc-wdm.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/class/cdc-wdm.c b/drivers/usb/class/cdc-wdm.c
index e3db6fbeadef..adb3fc307083 100644
--- a/drivers/usb/class/cdc-wdm.c
+++ b/drivers/usb/class/cdc-wdm.c
@@ -151,7 +151,7 @@ static void wdm_out_callback(struct urb *urb)
 	kfree(desc->outbuf);
 	desc->outbuf = NULL;
 	clear_bit(WDM_IN_USE, &desc->flags);
-	wake_up(&desc->wait);
+	wake_up_all(&desc->wait);
 }
 
 static void wdm_in_callback(struct urb *urb)
@@ -424,6 +424,7 @@ static ssize_t wdm_write
 	if (rv < 0) {
 		desc->outbuf = NULL;
 		clear_bit(WDM_IN_USE, &desc->flags);
+		wake_up_all(&desc->wait); /* for flush() */
 		dev_err(&desc->intf->dev, "Tx URB error: %d\n", rv);
 		rv = usb_translate_errors(rv);
 		goto out_free_mem_pm;
@@ -586,6 +587,7 @@ static ssize_t wdm_read
 static int wdm_flush(struct file *file, fl_owner_t id)
 {
 	struct wdm_device *desc = file->private_data;
+	int rv;
 
 	wait_event(desc->wait,
 			/*
@@ -600,11 +602,12 @@ static int wdm_flush(struct file *file, fl_owner_t id)
 	/* cannot dereference desc->intf if WDM_DISCONNECTING */
 	if (test_bit(WDM_DISCONNECTING, &desc->flags))
 		return -ENODEV;
-	if (desc->werr < 0)
+	rv = desc->werr;
+	if (rv < 0)
 		dev_err(&desc->intf->dev, "Error in flush path: %d\n",
-			desc->werr);
+			rv);
 
-	return usb_translate_errors(desc->werr);
+	return usb_translate_errors(rv);
 }
 
 static __poll_t wdm_poll(struct file *file, struct poll_table_struct *wait)
-- 
2.16.4


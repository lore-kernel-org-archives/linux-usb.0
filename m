Return-Path: <SRS0=MsX+=C7=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5890C4727D
	for <linux-usb@archiver.kernel.org>; Tue, 22 Sep 2020 11:21:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 804352388B
	for <linux-usb@archiver.kernel.org>; Tue, 22 Sep 2020 11:21:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b="s1oMw01G"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726566AbgIVLVw (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Tue, 22 Sep 2020 07:21:52 -0400
Received: from mx2.suse.de ([195.135.220.15]:37332 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726506AbgIVLVv (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 22 Sep 2020 07:21:51 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
        t=1600773710;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:in-reply-to:in-reply-to:references:references;
        bh=A1zUt81juSwPNJhRNl1BNHYKJV8/bvmy1vlgpsFmi6U=;
        b=s1oMw01GjiHG2xmptKnt9Q2lWKveDNE6c84bpQBhddT4Oq+aksN74m3nX9PllxLN+LPNup
        GNWnpTQHB85uWphy5+S+NCwYNkcpqLim4m05pysNT2wYdrXUf8R4wlO697lihuAy/lszxf
        rgPze7vEtvEGb//i677PqyBkLvs3dnE=
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id D3207AE08;
        Tue, 22 Sep 2020 11:22:26 +0000 (UTC)
From:   Oliver Neukum <oneukum@suse.com>
To:     penguin-kernel@i-love.sakura.ne.jp, bjorn@mork.no,
        linux-usb@vger.kernel.org
Cc:     Oliver Neukum <oneukum@suse.com>
Subject: [RFC 2/7] CDC-WDM: introduce a timeout in flush()
Date:   Tue, 22 Sep 2020 13:21:21 +0200
Message-Id: <20200922112126.16919-3-oneukum@suse.com>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20200922112126.16919-1-oneukum@suse.com>
References: <20200922112126.16919-1-oneukum@suse.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Malicious or defective hardware may cease communication while
flush() is running. In last consequence we need a timeout,
as hardware that remains silent must be ignored.

Making the wait for IO interruptible would not solve the
issue. While it would avoid a hang, it would not allow any progress
and we would end up with an unclosable fd.

The 30 seconds are coming out of thin air.

Reported-by: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
Signed-off-by: Oliver Neukum <oneukum@suse.com>
---
 drivers/usb/class/cdc-wdm.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/class/cdc-wdm.c b/drivers/usb/class/cdc-wdm.c
index adb3fc307083..b3a3f249a915 100644
--- a/drivers/usb/class/cdc-wdm.c
+++ b/drivers/usb/class/cdc-wdm.c
@@ -58,6 +58,9 @@ MODULE_DEVICE_TABLE (usb, wdm_ids);
 
 #define WDM_MAX			16
 
+/* flush() is uninterruptible, but we cannot wait forever */
+#define WDM_FLUSH_TIMEOUT	(30 * HZ)
+
 /* CDC-WMC r1.1 requires wMaxCommand to be "at least 256 decimal (0x100)" */
 #define WDM_DEFAULT_BUFSIZE	256
 
@@ -589,7 +592,7 @@ static int wdm_flush(struct file *file, fl_owner_t id)
 	struct wdm_device *desc = file->private_data;
 	int rv;
 
-	wait_event(desc->wait,
+	rv = wait_event_timeout(desc->wait,
 			/*
 			 * needs both flags. We cannot do with one
 			 * because resetting it would cause a race
@@ -597,11 +600,15 @@ static int wdm_flush(struct file *file, fl_owner_t id)
 			 * a disconnect
 			 */
 			!test_bit(WDM_IN_USE, &desc->flags) ||
-			test_bit(WDM_DISCONNECTING, &desc->flags));
+			test_bit(WDM_DISCONNECTING, &desc->flags),
+			WDM_FLUSH_TIMEOUT);
 
 	/* cannot dereference desc->intf if WDM_DISCONNECTING */
 	if (test_bit(WDM_DISCONNECTING, &desc->flags))
 		return -ENODEV;
+	if (!rv)
+		return -EIO;
+
 	rv = desc->werr;
 	if (rv < 0)
 		dev_err(&desc->intf->dev, "Error in flush path: %d\n",
-- 
2.16.4


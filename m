Return-Path: <SRS0=IRyt=CT=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9B90C43461
	for <linux-usb@archiver.kernel.org>; Thu, 10 Sep 2020 12:24:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 916D6206A2
	for <linux-usb@archiver.kernel.org>; Thu, 10 Sep 2020 12:24:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730067AbgIJMY3 (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Thu, 10 Sep 2020 08:24:29 -0400
Received: from mx2.suse.de ([195.135.220.15]:53666 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730522AbgIJMVc (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 10 Sep 2020 08:21:32 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id 00F3DB01F;
        Thu, 10 Sep 2020 12:21:34 +0000 (UTC)
From:   Oliver Neukum <oneukum@suse.com>
To:     penguin-kernel@i-love.sakura.ne.jp, bjorn@mork.no,
        linux-usb@vger.kernel.org
Cc:     Oliver Neukum <oneukum@suse.com>
Subject: [RFC 4/6] CDC-WDM: fix race reporting errors in flush
Date:   Thu, 10 Sep 2020 14:21:03 +0200
Message-Id: <20200910122105.13398-4-oneukum@suse.com>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20200910122105.13398-1-oneukum@suse.com>
References: <20200910122105.13398-1-oneukum@suse.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

In case a race was lost and multiple fds used,
an error could be reported multiple times. To fix
this a spinlock must be taken.

Signed-off-by: Oliver Neukum <oneukum@suse.com>
---
 drivers/usb/class/cdc-wdm.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/class/cdc-wdm.c b/drivers/usb/class/cdc-wdm.c
index eee19532e67e..930000b1d43b 100644
--- a/drivers/usb/class/cdc-wdm.c
+++ b/drivers/usb/class/cdc-wdm.c
@@ -610,10 +610,14 @@ static int wdm_flush(struct file *file, fl_owner_t id)
 		return -EIO;
 	if (rv < 0)
 		return -EINTR;
+
+	spin_lock_irq(&desc->iuspin);
 	rv = desc->werr;
+	desc->werr = 0;
+	spin_unlock_irq(&desc->iuspin);
+
 	if (rv < 0)
-		dev_err(&desc->intf->dev, "Error in flush path: %d\n",
-			rv);
+		dev_err(&desc->intf->dev, "Error in flush path: %d\n", rv);
 
 	return usb_translate_errors(rv);
 }
-- 
2.16.4


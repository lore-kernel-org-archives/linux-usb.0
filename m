Return-Path: <SRS0=g/Ju=BW=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E2BBC433DF
	for <linux-usb@archiver.kernel.org>; Wed, 12 Aug 2020 13:20:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 65AF720656
	for <linux-usb@archiver.kernel.org>; Wed, 12 Aug 2020 13:20:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728016AbgHLNUx (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Wed, 12 Aug 2020 09:20:53 -0400
Received: from mx2.suse.de ([195.135.220.15]:55736 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727854AbgHLNUs (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 12 Aug 2020 09:20:48 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id 6D2A1B76D;
        Wed, 12 Aug 2020 13:21:09 +0000 (UTC)
From:   Oliver Neukum <oneukum@suse.com>
To:     penguin-kernel@i-love.sakura.ne.jp, bjorn@mork.no,
        linux-usb@vger.kernel.org
Cc:     Oliver Neukum <oneukum@suse.com>
Subject: [RFC 3/5] CDC-WDM: making flush() interruptible
Date:   Wed, 12 Aug 2020 15:20:32 +0200
Message-Id: <20200812132034.14363-4-oneukum@suse.com>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20200812132034.14363-1-oneukum@suse.com>
References: <20200812132034.14363-1-oneukum@suse.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

There is no need for flush() to be uninterruptible. close(2)
is allowed to return -EAGAIN. Change it.

Reported-by: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
Signed-off-by: Oliver Neukum <oneukum@suse.com>
---
 drivers/usb/class/cdc-wdm.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/class/cdc-wdm.c b/drivers/usb/class/cdc-wdm.c
index 329f8d5f7c8d..f442f34f38da 100644
--- a/drivers/usb/class/cdc-wdm.c
+++ b/drivers/usb/class/cdc-wdm.c
@@ -592,7 +592,7 @@ static int wdm_flush(struct file *file, fl_owner_t id)
 	struct wdm_device *desc = file->private_data;
 	int rv;
 
-	rv = wait_event_timeout(desc->wait,
+	rv = wait_event_interruptible_timeout(desc->wait,
 			/*
 			 * needs both flags. We cannot do with one
 			 * because resetting it would cause a race
@@ -608,6 +608,8 @@ static int wdm_flush(struct file *file, fl_owner_t id)
 		return -ENODEV;
 	if (!rv)
 		return -EIO;
+	if (rv < 0)
+		return -EINTR;
 	rv = desc->werr;
 	if (rv < 0)
 		dev_err(&desc->intf->dev, "Error in flush path: %d\n",
-- 
2.16.4


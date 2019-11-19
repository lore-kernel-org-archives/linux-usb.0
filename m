Return-Path: <SRS0=Ch0a=ZL=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.2 required=3.0
	tests=HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62B16C432C0
	for <linux-usb@archiver.kernel.org>; Tue, 19 Nov 2019 14:24:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 40DB9222B0
	for <linux-usb@archiver.kernel.org>; Tue, 19 Nov 2019 14:24:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726555AbfKSOYO (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Tue, 19 Nov 2019 09:24:14 -0500
Received: from mx2.suse.de ([195.135.220.15]:45050 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726202AbfKSOYO (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 19 Nov 2019 09:24:14 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx1.suse.de (Postfix) with ESMTP id 1157EACD9;
        Tue, 19 Nov 2019 14:24:13 +0000 (UTC)
Message-ID: <1574173445.28617.15.camel@suse.com>
Subject: Re: WARNING in port100_send_cmd_async/usb_submit_urb
From:   Oliver Neukum <oneukum@suse.com>
To:     syzbot+711468aa5c3a1eabf863@syzkaller.appspotmail.com
Cc:     alexios.zavras@intel.com, linux-usb@vger.kernel.org
Date:   Tue, 19 Nov 2019 15:24:05 +0100
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.26.6 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

#syz test: https://github.com/google/kasan.git 7829a896

From 4d4036dd03e08c3169850d1c37fc6b73b9b4ba7c Mon Sep 17 00:00:00 2001
From: Oliver Neukum <oneukum@suse.com>
Date: Tue, 19 Nov 2019 15:08:53 +0100
Subject: [PATCH] nfc: port100: handle command failure cleanly

If starting the transfer of a command suceeds but the transfer for the reply
fails, it is not enough to initiate killing the transfer for the
command may still be running. You need to wait for the killing to finish
before you can reuse URB and buffer.

Signed-off-by: Oliver Neukum <oneukum@suse.com>
---
 drivers/nfc/port100.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/nfc/port100.c b/drivers/nfc/port100.c
index 145ddf3f0a45..604dba4f18af 100644
--- a/drivers/nfc/port100.c
+++ b/drivers/nfc/port100.c
@@ -783,7 +783,7 @@ static int port100_send_frame_async(struct port100 *dev, struct sk_buff *out,
 
 	rc = port100_submit_urb_for_ack(dev, GFP_KERNEL);
 	if (rc)
-		usb_unlink_urb(dev->out_urb);
+		usb_kill_urb(dev->out_urb);
 
 exit:
 	mutex_unlock(&dev->out_urb_lock);
-- 
2.16.4


Return-Path: <SRS0=6ZGB=Y6=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D84D6C5DF62
	for <linux-usb@archiver.kernel.org>; Wed,  6 Nov 2019 13:05:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id AB2A42187F
	for <linux-usb@archiver.kernel.org>; Wed,  6 Nov 2019 13:05:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731612AbfKFNFg (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Wed, 6 Nov 2019 08:05:36 -0500
Received: from mx2.suse.de ([195.135.220.15]:42150 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1731596AbfKFNFf (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 6 Nov 2019 08:05:35 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx1.suse.de (Postfix) with ESMTP id 3CEE5B347;
        Wed,  6 Nov 2019 13:05:34 +0000 (UTC)
From:   Oliver Neukum <oneukum@suse.com>
To:     alex.theissen@me.com, 2pi@mok.nu, gregkh@linuxfoundation.org,
        linux-usb@vger.kernel.org
Cc:     Oliver Neukum <oneukum@suse.com>
Subject: [PATCH] appledisplay: fix error handling in the scheduled work
Date:   Wed,  6 Nov 2019 13:49:02 +0100
Message-Id: <20191106124902.7765-2-oneukum@suse.com>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20191106124902.7765-1-oneukum@suse.com>
References: <20191106124902.7765-1-oneukum@suse.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The work item can operate on

1. stale memory left over from the last transfer
the actual length of the data transfered needs to be checked
2. memory already freed
the error handling in appledisplay_probe() needs
to cancel the work in that case

Reported-and-tested-by: syzbot+495dab1f175edc9c2f13@syzkaller.appspotmail.com
Signed-off-by: Oliver Neukum <oneukum@suse.com>
---
 drivers/usb/misc/appledisplay.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/misc/appledisplay.c b/drivers/usb/misc/appledisplay.c
index ac92725458b5..ba1eaabc7796 100644
--- a/drivers/usb/misc/appledisplay.c
+++ b/drivers/usb/misc/appledisplay.c
@@ -164,7 +164,12 @@ static int appledisplay_bl_get_brightness(struct backlight_device *bd)
 		0,
 		pdata->msgdata, 2,
 		ACD_USB_TIMEOUT);
-	brightness = pdata->msgdata[1];
+	if (retval < 2) {
+		if (retval >= 0)
+			retval = -EMSGSIZE;
+	} else {
+		brightness = pdata->msgdata[1];
+	}
 	mutex_unlock(&pdata->sysfslock);
 
 	if (retval < 0)
@@ -299,6 +304,7 @@ static int appledisplay_probe(struct usb_interface *iface,
 	if (pdata) {
 		if (pdata->urb) {
 			usb_kill_urb(pdata->urb);
+			cancel_delayed_work_sync(&pdata->work);
 			if (pdata->urbdata)
 				usb_free_coherent(pdata->udev, ACD_URB_BUFFER_LEN,
 					pdata->urbdata, pdata->urb->transfer_dma);
-- 
2.16.4


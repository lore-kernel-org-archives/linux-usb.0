Return-Path: <SRS0=L0ZS=C2=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12ED2C43461
	for <linux-usb@archiver.kernel.org>; Thu, 17 Sep 2020 10:34:48 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B20412087D
	for <linux-usb@archiver.kernel.org>; Thu, 17 Sep 2020 10:34:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=suse.com header.i=@suse.com header.b="BSeWZ7Ix"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726410AbgIQKeo (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Thu, 17 Sep 2020 06:34:44 -0400
Received: from mx2.suse.de ([195.135.220.15]:33434 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726200AbgIQKen (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 17 Sep 2020 06:34:43 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=cantorsusede;
        t=1600338881;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc; bh=Bla3SM8EE1d/RcCyOYItOCiX01fGJhJlFQzYVwmBFsY=;
        b=BSeWZ7Ixq3m5mfygQX6JYLxL1Rx6k30zOmIu/ne8vdtLqV09q90xOhBR5ydRdjPtQPjbvK
        0xwoA00NmUPJobPcKjh9QJO7KZHwObN2CSuutIMkTB/G8YyMKcKQL5xVgZizhPIfiGj+Q/
        Gu1wuPWNYldk2RDhyNx+yohWjJ+QnYW3jaPogW/t8NbpqAAU58qtvfoAGE0YjMhgIr62Ex
        3ODS18mwwT2GPBlFWl/ELTPXHUoxi8nrYQA/gYaAfOJrKM97RRlIoEYptjSmE8OkFgqF3J
        D3qzLAn6EuCahF37T9VJ8iHB0XIBk2Y/VVzmXGyDX7Fq1cJvlDR0YWjjYCZb3g==
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id 53400ABC4;
        Thu, 17 Sep 2020 10:35:15 +0000 (UTC)
From:   Oliver Neukum <oneukum@suse.com>
To:     gregKH@linuxfoundation.org, linux-usb@vger.kernel.org
Cc:     Oliver Neukum <oneukum@suse.com>
Subject: [PATCH] usblp: fix race between disconnect() and read()
Date:   Thu, 17 Sep 2020 12:34:27 +0200
Message-Id: <20200917103427.15740-1-oneukum@suse.com>
X-Mailer: git-send-email 2.16.4
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

read() needs to check whether the device has been
disconnected before it tries to talk to the device.

Signed-off-by: Oliver Neukum <oneukum@suse.com>
Reported-by: syzbot+be5b5f86a162a6c281e6@syzkaller.appspotmail.com
---
 drivers/usb/class/usblp.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/usb/class/usblp.c b/drivers/usb/class/usblp.c
index 084c48c5848f..67cbd42421be 100644
--- a/drivers/usb/class/usblp.c
+++ b/drivers/usb/class/usblp.c
@@ -827,6 +827,11 @@ static ssize_t usblp_read(struct file *file, char __user *buffer, size_t len, lo
 	if (rv < 0)
 		return rv;
 
+	if (!usblp->present) {
+		count = -ENODEV;
+		goto done;
+	}
+
 	if ((avail = usblp->rstatus) < 0) {
 		printk(KERN_ERR "usblp%d: error %d reading from printer\n",
 		    usblp->minor, (int)avail);
-- 
2.16.4


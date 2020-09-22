Return-Path: <SRS0=MsX+=C7=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8850C2D0E2
	for <linux-usb@archiver.kernel.org>; Tue, 22 Sep 2020 10:13:57 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 56E3A2395B
	for <linux-usb@archiver.kernel.org>; Tue, 22 Sep 2020 10:13:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b="It8rTNJz"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726509AbgIVKNz (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Tue, 22 Sep 2020 06:13:55 -0400
Received: from mx2.suse.de ([195.135.220.15]:57352 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726605AbgIVKNy (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 22 Sep 2020 06:13:54 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
        t=1600769633;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:in-reply-to:in-reply-to:references:references;
        bh=3J4awFmP6XNuAxKP8nvMUO9NLGMgKpv8n8B5oWGFW6o=;
        b=It8rTNJzce86wU+tUp1PnTI34w/VBTqETGCQ5NlyRgXO+iJ19TJ70cVcrcgPpGp3HiOgyv
        b1rtjSZ3TRFCn/huAi2WD3WUwhgQlAXMogv27Gy7hO9i34oROqFYAfwiWQ25LobEzyvWtE
        uXVOsZgtZiPBNklTTkSd0uNHDLIDYgM=
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id 1BDF0ABD2;
        Tue, 22 Sep 2020 10:14:30 +0000 (UTC)
From:   Oliver Neukum <oneukum@suse.com>
To:     penguin-kernel@i-love.sakura.ne.jp, bjorn@mork.no,
        linux-usb@vger.kernel.org
Cc:     Oliver Neukum <oneukum@suse.com>
Subject: [RFC 4/6] CDC-WDM: fix race reporting errors in flush
Date:   Tue, 22 Sep 2020 12:13:27 +0200
Message-Id: <20200922101329.14801-5-oneukum@suse.com>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20200922101329.14801-1-oneukum@suse.com>
References: <20200922101329.14801-1-oneukum@suse.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

In case a race was lost and multiple fds used,
an error could be reported multiple times. To fix
this a spinlock must be taken.

Signed-off-by: Oliver Neukum <oneukum@suse.com>
---
 drivers/usb/class/cdc-wdm.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/usb/class/cdc-wdm.c b/drivers/usb/class/cdc-wdm.c
index 1ca2c85a977d..5fb855404403 100644
--- a/drivers/usb/class/cdc-wdm.c
+++ b/drivers/usb/class/cdc-wdm.c
@@ -613,7 +613,10 @@ static int wdm_flush(struct file *file, fl_owner_t id)
 	if (!rv)
 		return -EIO;
 
+	spin_lock_irq(&desc->iuspin);
 	rv = desc->werr;
+	desc->werr = 0;
+	spin_unlock_irq(&desc->iuspin);
 
 	return usb_translate_errors(rv);
 }
-- 
2.16.4


Return-Path: <linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2EA8C433FE
	for <linux-usb@archiver.kernel.org>; Mon,  7 Dec 2020 13:04:42 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A0F36233FB
	for <linux-usb@archiver.kernel.org>; Mon,  7 Dec 2020 13:04:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725973AbgLGNEa (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Mon, 7 Dec 2020 08:04:30 -0500
Received: from mx2.suse.de ([195.135.220.15]:33252 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725802AbgLGNEa (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 7 Dec 2020 08:04:30 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
        t=1607346224; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
        bh=+tgbLP9kz1aXG2ksVLQMNoCgyxJudxHgL2H/YwZdEV4=;
        b=dp7zqd+MmegvnlCS2shVIA8uZ+5NbPeX83qi3SLw8TsXEOZgGqXTj/x4Dqy5vsUBpDt3Qz
        Ue9Z8EwSyAHcp4U8uTEPYM6C2DtG+U9DlKQHHZcjLUVfhjj4C2lu6bXdhtFjhrIjOyRZgN
        IkO0rZ9EI32ZZXsLllKBi3KqSTURxgc=
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id 57595AB63;
        Mon,  7 Dec 2020 13:03:44 +0000 (UTC)
From:   Oliver Neukum <oneukum@suse.com>
To:     gregkh@linuxfoundation.org, linux-usb@vger.kernel.org
Cc:     Oliver Neukum <oneukum@suse.com>
Subject: [PATCH] RESET_RESUME for Snapscan 1212
Date:   Mon,  7 Dec 2020 14:03:23 +0100
Message-Id: <20201207130323.23857-1-oneukum@suse.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

I got reports that some models of this old scanner need
this when using runtime PM.

Signed-off-by: Oliver Neukum <oneukum@suse.com>
---
 drivers/usb/core/quirks.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/usb/core/quirks.c b/drivers/usb/core/quirks.c
index a1e3a037a289..ce176eb338c0 100644
--- a/drivers/usb/core/quirks.c
+++ b/drivers/usb/core/quirks.c
@@ -342,6 +342,9 @@ static const struct usb_device_id usb_quirk_list[] = {
 	{ USB_DEVICE(0x06a3, 0x0006), .driver_info =
 			USB_QUIRK_CONFIG_INTF_STRINGS },
 
+	/* Agfa SNAPSCAN 1212U */
+	{ USB_DEVICE(0x06bd, 0x0001), .driver_info = USB_QUIRK_RESET_RESUME },
+
 	/* Guillemot Webcam Hercules Dualpix Exchange (2nd ID) */
 	{ USB_DEVICE(0x06f8, 0x0804), .driver_info = USB_QUIRK_RESET_RESUME },
 
-- 
2.26.2


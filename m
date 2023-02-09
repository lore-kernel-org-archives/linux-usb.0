Return-Path: <linux-usb-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF269C05027
	for <linux-usb@archiver.kernel.org>; Thu,  9 Feb 2023 09:44:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229791AbjBIJoQ (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Thu, 9 Feb 2023 04:44:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47132 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229468AbjBIJoP (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 9 Feb 2023 04:44:15 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A72984740F
        for <linux-usb@vger.kernel.org>; Thu,  9 Feb 2023 01:44:14 -0800 (PST)
Received: from mail.ideasonboard.com (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net [86.13.91.161])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id E454D8DD;
        Thu,  9 Feb 2023 10:44:12 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1675935853;
        bh=K2rSPq//ljj+MpeLjAQtcZkDaJ3LjpNe1LLahyvJcrY=;
        h=From:To:Cc:Subject:Date:From;
        b=MvZW4sdRMFS8UaZKUlKaXHbqtHCkIu+5VejAJ6R+p9GVynYS5m5TrQcogSpJtg8DU
         SW/6+rQNjaJqdO2kPxN2ukuQo0rNB1S6XnZCuZTISYMUvlUF3fI8Lt94bGUStwICt9
         y+dBy0+4Pwjesbtn4QECf8suWU1LXHI+2az13Xsg=
From:   Daniel Scally <dan.scally@ideasonboard.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Daniel Scally <dan.scally@ideasonboard.com>,
        linux-usb@vger.kernel.org
Cc:     kernel test robot <lkp@intel.com>
Subject: [PATCH] usb: gadget: configfs: Fix set but not used variable warning
Date:   Thu,  9 Feb 2023 09:43:59 +0000
Message-Id: <20230209094359.1549629-1-dan.scally@ideasonboard.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Fix a -Wunused-but-set-variable warning in gadget_string_s_store()

Fixes: 15a7cf8caabe ("usb: gadget: configfs: Support arbitrary string descriptors")
Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Daniel Scally <dan.scally@ideasonboard.com>
---
 drivers/usb/gadget/configfs.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/usb/gadget/configfs.c b/drivers/usb/gadget/configfs.c
index 06a0b73e0546..b9f1136aa0a2 100644
--- a/drivers/usb/gadget/configfs.c
+++ b/drivers/usb/gadget/configfs.c
@@ -821,13 +821,11 @@ static ssize_t gadget_string_s_store(struct config_item *item, const char *page,
 {
 	struct gadget_string *string = to_gadget_string(item);
 	int size = min(sizeof(string->string), len + 1);
-	int ret;
 
 	if (len > USB_MAX_STRING_LEN)
 		return -EINVAL;
 
-	ret = strscpy(string->string, page, size);
-	return len;
+	return strscpy(string->string, page, size);
 }
 CONFIGFS_ATTR(gadget_string_, s);
 
-- 
2.34.1


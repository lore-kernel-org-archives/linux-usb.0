Return-Path: <linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64E26C07E9B
	for <linux-usb@archiver.kernel.org>; Sat, 10 Jul 2021 02:42:31 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 52CA3613C5
	for <linux-usb@archiver.kernel.org>; Sat, 10 Jul 2021 02:42:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231642AbhGJCpN (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Fri, 9 Jul 2021 22:45:13 -0400
Received: from mail.kernel.org ([198.145.29.99]:33776 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235357AbhGJCnq (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 9 Jul 2021 22:43:46 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 61CCC613F2;
        Sat, 10 Jul 2021 02:39:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1625884764;
        bh=gUwThY0EYXJoMtoHlTaJafFz+jl0r42OKpAgT6CENmk=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=JrKZ8w7/ZLDbg1Vpc2CuvjsEq2RtcZ+DHFzonVkLUb/sem6wSHfpVKliyRWLp7SmB
         2jN1ctCcEBLtORHmwtZRAgPxOFh64Ik5tYWMCD6vdauMaMGm9RbOFZkLMmGojqyrLg
         KwAORS4iDm++DvvLlVlbcM+0ocZbHBplhR3deAe017NgMYe4B2NnGRZdvc2EXUpoAH
         41ScJbzFitlwNvQ8uKXXd2AYzaXloOyZdHb+QGL3//L4kY6xjnWjJ8uZOVO1E0e6ZL
         b6F5/yebrfl2R6tZq3CbFxjRHjVp3LPeroZX+6gr7KeasSOzG9ji1AmzXdVgok8wec
         yar+iMOnvzKww==
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Alan Stern <stern@rowland.harvard.edu>,
        Johan Hovold <johan@kernel.org>,
        syzbot+7dbcd9ff34dc4ed45240@syzkaller.appspotmail.com,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Sasha Levin <sashal@kernel.org>, linux-usb@vger.kernel.org
Subject: [PATCH AUTOSEL 4.4 09/23] USB: core: Avoid WARNings for 0-length descriptor requests
Date:   Fri,  9 Jul 2021 22:38:58 -0400
Message-Id: <20210710023912.3172972-9-sashal@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210710023912.3172972-1-sashal@kernel.org>
References: <20210710023912.3172972-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Alan Stern <stern@rowland.harvard.edu>

[ Upstream commit 60dfe484cef45293e631b3a6e8995f1689818172 ]

The USB core has utility routines to retrieve various types of
descriptors.  These routines will now provoke a WARN if they are asked
to retrieve 0 bytes (USB "receive" requests must not have zero
length), so avert this by checking the size argument at the start.

CC: Johan Hovold <johan@kernel.org>
Reported-and-tested-by: syzbot+7dbcd9ff34dc4ed45240@syzkaller.appspotmail.com
Reviewed-by: Johan Hovold <johan@kernel.org>
Signed-off-by: Alan Stern <stern@rowland.harvard.edu>
Link: https://lore.kernel.org/r/20210607152307.GD1768031@rowland.harvard.edu
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/usb/core/message.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/usb/core/message.c b/drivers/usb/core/message.c
index e568325cb6e1..8b6e25f11d87 100644
--- a/drivers/usb/core/message.c
+++ b/drivers/usb/core/message.c
@@ -643,6 +643,9 @@ int usb_get_descriptor(struct usb_device *dev, unsigned char type,
 	int i;
 	int result;
 
+	if (size <= 0)		/* No point in asking for no data */
+		return -EINVAL;
+
 	memset(buf, 0, size);	/* Make sure we parse really received data */
 
 	for (i = 0; i < 3; ++i) {
@@ -691,6 +694,9 @@ static int usb_get_string(struct usb_device *dev, unsigned short langid,
 	int i;
 	int result;
 
+	if (size <= 0)		/* No point in asking for no data */
+		return -EINVAL;
+
 	for (i = 0; i < 3; ++i) {
 		/* retry on length 0 or stall; some devices are flakey */
 		result = usb_control_msg(dev, usb_rcvctrlpipe(dev, 0),
-- 
2.30.2


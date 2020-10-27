Return-Path: <SRS0=zRYX=EC=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59AA8C5517A
	for <linux-usb@archiver.kernel.org>; Tue, 27 Oct 2020 16:42:40 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1086B206F7
	for <linux-usb@archiver.kernel.org>; Tue, 27 Oct 2020 16:42:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1811810AbgJ0Qmi (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Tue, 27 Oct 2020 12:42:38 -0400
Received: from aposti.net ([89.234.176.197]:47482 "EHLO aposti.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1802032AbgJ0Qmh (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 27 Oct 2020 12:42:37 -0400
From:   Paul Cercueil <paul@crapouillou.net>
To:     Bin Liu <b-liu@ti.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Tony Lindgren <tony@atomide.com>, od@zcrc.me,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        Paul Cercueil <paul@crapouillou.net>,
        Maarten ter Huurne <maarten@treewalker.org>
Subject: [RESEND PATCH 2/4] usb: musb: Fix NULL check on struct musb_request field
Date:   Tue, 27 Oct 2020 16:41:58 +0000
Message-Id: <20201027164200.18602-3-paul@crapouillou.net>
In-Reply-To: <20201027164200.18602-1-paul@crapouillou.net>
References: <20201027164200.18602-1-paul@crapouillou.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The 'request' variable is a pointer to the 'request' field of the
struct musb_request 'req' pointer. It only worked until now because
the 'request' field is the first one in the musb_request structure, but
as soon as that changes, the check will be invalid.

Fix it preventively by doing the NULL-check on the 'req' pointer
instead.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
Suggested-by: Maarten ter Huurne <maarten@treewalker.org>
---
 drivers/usb/musb/musb_gadget.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/musb/musb_gadget.c b/drivers/usb/musb/musb_gadget.c
index f62ffaede1ab..ef374d4dd94a 100644
--- a/drivers/usb/musb/musb_gadget.c
+++ b/drivers/usb/musb/musb_gadget.c
@@ -451,7 +451,7 @@ void musb_g_tx(struct musb *musb, u8 epnum)
 		return;
 	}
 
-	if (request) {
+	if (req) {
 
 		trace_musb_req_tx(req);
 
-- 
2.28.0


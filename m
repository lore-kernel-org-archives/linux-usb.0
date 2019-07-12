Return-Path: <SRS0=G3IJ=VJ=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4EDC8C742A7
	for <linux-usb@archiver.kernel.org>; Fri, 12 Jul 2019 02:55:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 30D1D20863
	for <linux-usb@archiver.kernel.org>; Fri, 12 Jul 2019 02:55:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729328AbfGLCzH (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Thu, 11 Jul 2019 22:55:07 -0400
Received: from gate.crashing.org ([63.228.1.57]:54472 "EHLO gate.crashing.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729276AbfGLCzH (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 11 Jul 2019 22:55:07 -0400
Received: from ufdda393ec48b57.ant.amazon.com (localhost.localdomain [127.0.0.1])
        by gate.crashing.org (8.14.1/8.14.1) with ESMTP id x6C2rnGf010240;
        Thu, 11 Jul 2019 21:54:02 -0500
From:   Benjamin Herrenschmidt <benh@kernel.crashing.org>
To:     linux-usb@vger.kernel.org
Cc:     balbi@kernel.org, Joel Stanley <joel@jms.id.au>,
        Alan Stern <stern@rowland.harvard.edu>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>
Subject: [PATCH v2 04/12] usb: gadget: aspeed: Improve debugging when nuking
Date:   Fri, 12 Jul 2019 12:53:40 +1000
Message-Id: <20190712025348.21019-5-benh@kernel.crashing.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190712025348.21019-1-benh@kernel.crashing.org>
References: <20190712025348.21019-1-benh@kernel.crashing.org>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

When nuking requests, it's useful to display how many were
actually nuked. It has proven handy when debugging issues
where EP0 went in a wrong state.

Signed-off-by: Benjamin Herrenschmidt <benh@kernel.crashing.org>
---
 drivers/usb/gadget/udc/aspeed-vhub/core.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/gadget/udc/aspeed-vhub/core.c b/drivers/usb/gadget/udc/aspeed-vhub/core.c
index db3628be38c0..0c77cd488c48 100644
--- a/drivers/usb/gadget/udc/aspeed-vhub/core.c
+++ b/drivers/usb/gadget/udc/aspeed-vhub/core.c
@@ -65,13 +65,16 @@ void ast_vhub_done(struct ast_vhub_ep *ep, struct ast_vhub_req *req,
 void ast_vhub_nuke(struct ast_vhub_ep *ep, int status)
 {
 	struct ast_vhub_req *req;
-
-	EPDBG(ep, "Nuking\n");
+	int count = 0;
 
 	/* Beware, lock will be dropped & req-acquired by done() */
 	while (!list_empty(&ep->queue)) {
 		req = list_first_entry(&ep->queue, struct ast_vhub_req, queue);
 		ast_vhub_done(ep, req, status);
+		count++;
+	}
+	if (count) {
+		EPDBG(ep, "Nuked %d request(s)\n", count);
 	}
 }
 
-- 
2.17.1


Return-Path: <SRS0=/GjO=VD=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0
	tests=HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C08C3C5B57D
	for <linux-usb@archiver.kernel.org>; Sat,  6 Jul 2019 00:53:57 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id A3B5F20989
	for <linux-usb@archiver.kernel.org>; Sat,  6 Jul 2019 00:53:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726005AbfGFAx5 (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Fri, 5 Jul 2019 20:53:57 -0400
Received: from gate.crashing.org ([63.228.1.57]:42776 "EHLO gate.crashing.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725776AbfGFAx4 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 5 Jul 2019 20:53:56 -0400
Received: from ufdda393ec48b57.ant.amazon.com (localhost.localdomain [127.0.0.1])
        by gate.crashing.org (8.14.1/8.14.1) with ESMTP id x660rlMI017940;
        Fri, 5 Jul 2019 19:53:50 -0500
From:   Benjamin Herrenschmidt <benh@kernel.crashing.org>
To:     linux-usb@vger.kernel.org
Cc:     balbi@kernel.org, Joel Stanley <joel@jms.id.au>,
        Alan Stern <stern@rowland.harvard.edu>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>
Subject: [PATCH 01/10] usb: gadget: aspeed: Don't set port enable change bit on reset
Date:   Sat,  6 Jul 2019 10:53:36 +1000
Message-Id: <20190706005345.18131-2-benh@kernel.crashing.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190706005345.18131-1-benh@kernel.crashing.org>
References: <20190706005345.18131-1-benh@kernel.crashing.org>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

This bit should be only set when the port enable goes down, for
example, on errors. Not when it gets set after a port reset. Some
USB stacks seem to be sensitive to this and fails enumeration.

Signed-off-by: Benjamin Herrenschmidt <benh@kernel.crashing.org>
---
 drivers/usb/gadget/udc/aspeed-vhub/hub.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/gadget/udc/aspeed-vhub/hub.c b/drivers/usb/gadget/udc/aspeed-vhub/hub.c
index 7c040f56100e..0755115fd90d 100644
--- a/drivers/usb/gadget/udc/aspeed-vhub/hub.c
+++ b/drivers/usb/gadget/udc/aspeed-vhub/hub.c
@@ -449,8 +449,15 @@ static void ast_vhub_change_port_stat(struct ast_vhub *vhub,
 		       USB_PORT_STAT_C_OVERCURRENT |
 		       USB_PORT_STAT_C_RESET |
 		       USB_PORT_STAT_C_L1;
-		p->change |= chg;
 
+		/*
+		 * We only set USB_PORT_STAT_C_ENABLE if we are disabling
+		 * the port as per USB spec, otherwise MacOS gets upset
+		 */
+		if (p->status & USB_PORT_STAT_ENABLE)
+			chg &= ~USB_PORT_STAT_C_ENABLE;
+
+		p->change = chg;
 		ast_vhub_update_hub_ep1(vhub, port);
 	}
 }
-- 
2.17.1


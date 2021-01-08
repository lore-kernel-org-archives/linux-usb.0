Return-Path: <linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11D4CC433E0
	for <linux-usb@archiver.kernel.org>; Fri,  8 Jan 2021 08:13:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id AD9AB23447
	for <linux-usb@archiver.kernel.org>; Fri,  8 Jan 2021 08:13:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727505AbhAHINm (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Fri, 8 Jan 2021 03:13:42 -0500
Received: from twspam01.aspeedtech.com ([211.20.114.71]:14203 "EHLO
        twspam01.aspeedtech.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727365AbhAHINl (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 8 Jan 2021 03:13:41 -0500
Received: from mail.aspeedtech.com ([192.168.0.24])
        by twspam01.aspeedtech.com with ESMTP id 108885Jn092448;
        Fri, 8 Jan 2021 16:08:05 +0800 (GMT-8)
        (envelope-from ryan_chen@aspeedtech.com)
Received: from localhost.localdomain (192.168.10.9) by TWMBX02.aspeed.com
 (192.168.0.24) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Fri, 8 Jan
 2021 16:12:46 +0800
From:   Ryan Chen <ryan_chen@aspeedtech.com>
To:     <BMC-SW@aspeedtech.com>, Felipe Balbi <balbi@kernel.org>,
        "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>,
        Joel Stanley <joel@jms.id.au>,
        Andrew Jeffery <andrew@aj.id.au>, <linux-usb@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-aspeed@lists.ozlabs.org>, <linux-kernel@vger.kernel.org>
CC:     Ryan Chen <ryan_chen@aspeedtech.com>
Subject: [PATCH 1/1] usb: gadget: aspeed: fix stop dma register setting.
Date:   Fri, 8 Jan 2021 16:12:38 +0800
Message-ID: <20210108081238.10199-2-ryan_chen@aspeedtech.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210108081238.10199-1-ryan_chen@aspeedtech.com>
References: <20210108081238.10199-1-ryan_chen@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [192.168.10.9]
X-ClientProxiedBy: TWMBX02.aspeed.com (192.168.0.24) To TWMBX02.aspeed.com
 (192.168.0.24)
X-DNSRBL: 
X-MAIL: twspam01.aspeedtech.com 108885Jn092448
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The vhub engine has two dma mode, one is descriptor list, another
is single stage DMA. Each mode has different stop register setting.
Descriptor list operation (bit2) : 0 disable reset, 1: enable reset
Single mode operation (bit0) : 0 : disable, 1: enable

Signed-off-by: Ryan Chen <ryan_chen@aspeedtech.com>
---
 drivers/usb/gadget/udc/aspeed-vhub/epn.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/gadget/udc/aspeed-vhub/epn.c b/drivers/usb/gadget/udc/aspeed-vhub/epn.c
index 0bd6b20435b8..02d8bfae58fb 100644
--- a/drivers/usb/gadget/udc/aspeed-vhub/epn.c
+++ b/drivers/usb/gadget/udc/aspeed-vhub/epn.c
@@ -420,7 +420,10 @@ static void ast_vhub_stop_active_req(struct ast_vhub_ep *ep,
 	u32 state, reg, loops;
 
 	/* Stop DMA activity */
-	writel(0, ep->epn.regs + AST_VHUB_EP_DMA_CTLSTAT);
+	if (ep->epn.desc_mode)
+		writel(VHUB_EP_DMA_CTRL_RESET, ep->epn.regs + AST_VHUB_EP_DMA_CTLSTAT);
+	else
+		writel(0, ep->epn.regs + AST_VHUB_EP_DMA_CTLSTAT);
 
 	/* Wait for it to complete */
 	for (loops = 0; loops < 1000; loops++) {
-- 
2.17.1


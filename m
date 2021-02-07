Return-Path: <linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC5BDC433E0
	for <linux-usb@archiver.kernel.org>; Sun,  7 Feb 2021 06:19:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A268564EA1
	for <linux-usb@archiver.kernel.org>; Sun,  7 Feb 2021 06:19:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229646AbhBGGTR (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Sun, 7 Feb 2021 01:19:17 -0500
Received: from out30-130.freemail.mail.aliyun.com ([115.124.30.130]:37433 "EHLO
        out30-130.freemail.mail.aliyun.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229561AbhBGGTN (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 7 Feb 2021 01:19:13 -0500
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R211e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=e01e04423;MF=jiapeng.chong@linux.alibaba.com;NM=1;PH=DS;RN=7;SR=0;TI=SMTPD_---0UO2rAsb_1612678698;
Received: from j63c13417.sqa.eu95.tbsite.net(mailfrom:jiapeng.chong@linux.alibaba.com fp:SMTPD_---0UO2rAsb_1612678698)
          by smtp.aliyun-inc.com(127.0.0.1);
          Sun, 07 Feb 2021 14:18:25 +0800
From:   Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
To:     balbi@kernel.org
Cc:     gregkh@linuxfoundation.org, michal.simek@xilinx.com,
        linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
Subject: [PATCH] usb: gadget: Assign boolean values to a bool variable
Date:   Sun,  7 Feb 2021 14:18:16 +0800
Message-Id: <1612678696-15794-1-git-send-email-jiapeng.chong@linux.alibaba.com>
X-Mailer: git-send-email 1.8.3.1
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Fix the following coccicheck warnings:

./drivers/usb/gadget/udc/udc-xilinx.c:846:1-17: WARNING: Assignment of
0/1 to bool variable.

Reported-by: Abaci Robot <abaci@linux.alibaba.com>
Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
---
 drivers/usb/gadget/udc/udc-xilinx.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/gadget/udc/udc-xilinx.c b/drivers/usb/gadget/udc/udc-xilinx.c
index d5e9d20..2a06519 100644
--- a/drivers/usb/gadget/udc/udc-xilinx.c
+++ b/drivers/usb/gadget/udc/udc-xilinx.c
@@ -843,8 +843,8 @@ static int __xudc_ep_enable(struct xusb_ep *ep,
 		break;
 	}
 
-	ep->buffer0ready = 0;
-	ep->buffer1ready = 0;
+	ep->buffer0ready = false;
+	ep->buffer1ready = false;
 	ep->curbufnum = 0;
 	ep->rambase = rambase[ep->epnumber];
 	xudc_epconfig(ep, udc);
@@ -868,11 +868,11 @@ static int __xudc_ep_enable(struct xusb_ep *ep,
 	if (ep->epnumber && !ep->is_in) {
 		udc->write_fn(udc->addr, XUSB_BUFFREADY_OFFSET,
 			      1 << ep->epnumber);
-		ep->buffer0ready = 1;
+		ep->buffer0ready = true;
 		udc->write_fn(udc->addr, XUSB_BUFFREADY_OFFSET,
 			     (1 << (ep->epnumber +
 			      XUSB_STATUS_EP_BUFF2_SHIFT)));
-		ep->buffer1ready = 1;
+		ep->buffer1ready = true;
 	}
 
 	return 0;
-- 
1.8.3.1


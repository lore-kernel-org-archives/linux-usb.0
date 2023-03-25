Return-Path: <linux-usb-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45850C6FD1F
	for <linux-usb@archiver.kernel.org>; Sat, 25 Mar 2023 06:41:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231211AbjCYGlx (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Sat, 25 Mar 2023 02:41:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60394 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230271AbjCYGlw (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 25 Mar 2023 02:41:52 -0400
X-Greylist: delayed 123 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Fri, 24 Mar 2023 23:41:49 PDT
Received: from unicom145.biz-email.net (unicom145.biz-email.net [210.51.26.145])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7AF8911EA9;
        Fri, 24 Mar 2023 23:41:49 -0700 (PDT)
Received: from unicom145.biz-email.net
        by unicom145.biz-email.net ((D)) with ASMTP (SSL) id UZL00134;
        Sat, 25 Mar 2023 14:38:34 +0800
Received: from localhost.localdomain (10.200.104.82) by
 jtjnmail201612.home.langchao.com (10.100.2.12) with Microsoft SMTP Server id
 15.1.2507.21; Sat, 25 Mar 2023 14:38:33 +0800
From:   Deming Wang <wangdeming@inspur.com>
To:     <hminas@synopsys.com>, <gregkh@linuxfoundation.org>
CC:     <linux-usb@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Deming Wang <wangdeming@inspur.com>
Subject: [PATCH] usb: dwc2: Fix spelling mistake "schduler" -> "scheduler"
Date:   Sat, 25 Mar 2023 02:38:32 -0400
Message-ID: <20230325063832.1642-1-wangdeming@inspur.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.200.104.82]
tUid:   2023325143834c47787e859f6e014a14e90ef5b18be89
X-Abuse-Reports-To: service@corp-email.com
Abuse-Reports-To: service@corp-email.com
X-Complaints-To: service@corp-email.com
X-Report-Abuse-To: service@corp-email.com
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

There is a spelling mistakes in dev_warn messages. Fix them.

Signed-off-by: Deming Wang <wangdeming@inspur.com>
---
 drivers/usb/dwc2/hcd_queue.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/dwc2/hcd_queue.c b/drivers/usb/dwc2/hcd_queue.c
index 0a1145592fc7..0d4495c6b9f7 100644
--- a/drivers/usb/dwc2/hcd_queue.c
+++ b/drivers/usb/dwc2/hcd_queue.c
@@ -1078,7 +1078,7 @@ static void dwc2_pick_first_frame(struct dwc2_hsotg *hsotg, struct dwc2_qh *qh)
 	earliest_frame = dwc2_frame_num_inc(frame_number, 1);
 	next_active_frame = earliest_frame;
 
-	/* Get the "no microframe schduler" out of the way... */
+	/* Get the "no microframe scheduler" out of the way... */
 	if (!hsotg->params.uframe_sched) {
 		if (qh->do_split)
 			/* Splits are active at microframe 0 minus 1 */
-- 
2.27.0


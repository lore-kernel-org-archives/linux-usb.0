Return-Path: <linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69680C63798
	for <linux-usb@archiver.kernel.org>; Fri, 20 Nov 2020 00:15:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1074B22244
	for <linux-usb@archiver.kernel.org>; Fri, 20 Nov 2020 00:15:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=mg.codeaurora.org header.i=@mg.codeaurora.org header.b="UAXZDCI7"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727181AbgKTAP3 (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Thu, 19 Nov 2020 19:15:29 -0500
Received: from z5.mailgun.us ([104.130.96.5]:16210 "EHLO z5.mailgun.us"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727111AbgKTAP3 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 19 Nov 2020 19:15:29 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1605831328; h=Content-Transfer-Encoding: MIME-Version:
 Message-Id: Date: Subject: Cc: To: From: Sender;
 bh=o9ZMTbrPjh2CQrVWamYZ1L7gO50n4I5H1yPQu3eeebc=; b=UAXZDCI7WLuvdK76zLd+vLd1gXDMM4JaeCvr5odYmuLJbZJIevmooSdBq5L9iCIvbhsay02R
 UoCRfK8zRb564Fr8KBNm3a70iUyWLKsean9JW8+bsxI5XFFlYqD8tpy507DeVGVdVWDSBQTP
 k05KBJyUmvJEezw+Mk8NIU3TAHQ=
X-Mailgun-Sending-Ip: 104.130.96.5
X-Mailgun-Sid: WyIxZTE2YSIsICJsaW51eC11c2JAdmdlci5rZXJuZWwub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n10.prod.us-east-1.postgun.com with SMTP id
 5fb70a99d64ea0b7035d0de7 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 20 Nov 2020 00:15:21
 GMT
Sender: wcheng=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 14E73C43460; Fri, 20 Nov 2020 00:15:21 +0000 (UTC)
Received: from wcheng-linux.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: wcheng)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 7CD7AC43460;
        Fri, 20 Nov 2020 00:15:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 7CD7AC43460
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=wcheng@codeaurora.org
From:   Wesley Cheng <wcheng@codeaurora.org>
To:     balbi@kernel.org, gregkh@linuxfoundation.org
Cc:     linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        Thinh.Nguyen@synopsys.com, m.tretter@pengutronix.de,
        Wesley Cheng <wcheng@codeaurora.org>
Subject: [PATCH] usb: dwc3: gadget: Restart DWC3 gadget when enabling pullup
Date:   Thu, 19 Nov 2020 16:13:21 -0800
Message-Id: <20201120001321.773-1-wcheng@codeaurora.org>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

usb_gadget_deactivate/usb_gadget_activate does not execute the UDC start
operation, which may leave EP0 disabled and event IRQs disabled when
re-activating the function. Move the enabling/disabling of USB EP0 and
device event IRQs to be performed in the pullup routine.

Fixes: ae7e86108b12 ("usb: dwc3: Stop active transfers before halting the
controller")

Reported-by: Michael Tretter <m.tretter@pengutronix.de>
Signed-off-by: Wesley Cheng <wcheng@codeaurora.org>
---
 drivers/usb/dwc3/gadget.c | 14 +++-----------
 1 file changed, 3 insertions(+), 11 deletions(-)

diff --git a/drivers/usb/dwc3/gadget.c b/drivers/usb/dwc3/gadget.c
index 5d879b7606d5..922c8b76e534 100644
--- a/drivers/usb/dwc3/gadget.c
+++ b/drivers/usb/dwc3/gadget.c
@@ -1988,6 +1988,7 @@ static int dwc3_gadget_run_stop(struct dwc3 *dwc, int is_on, int suspend)
 
 static void dwc3_gadget_disable_irq(struct dwc3 *dwc);
 static void __dwc3_gadget_stop(struct dwc3 *dwc);
+static int __dwc3_gadget_start(struct dwc3 *dwc);
 
 static int dwc3_gadget_pullup(struct usb_gadget *g, int is_on)
 {
@@ -2050,6 +2051,8 @@ static int dwc3_gadget_pullup(struct usb_gadget *g, int is_on)
 			dwc->ev_buf->lpos = (dwc->ev_buf->lpos + count) %
 						dwc->ev_buf->length;
 		}
+	} else {
+		__dwc3_gadget_start(dwc);
 	}
 
 	ret = dwc3_gadget_run_stop(dwc, is_on, false);
@@ -2224,10 +2227,6 @@ static int dwc3_gadget_start(struct usb_gadget *g,
 	}
 
 	dwc->gadget_driver	= driver;
-
-	if (pm_runtime_active(dwc->dev))
-		__dwc3_gadget_start(dwc);
-
 	spin_unlock_irqrestore(&dwc->lock, flags);
 
 	return 0;
@@ -2253,13 +2252,6 @@ static int dwc3_gadget_stop(struct usb_gadget *g)
 	unsigned long		flags;
 
 	spin_lock_irqsave(&dwc->lock, flags);
-
-	if (pm_runtime_suspended(dwc->dev))
-		goto out;
-
-	__dwc3_gadget_stop(dwc);
-
-out:
 	dwc->gadget_driver	= NULL;
 	spin_unlock_irqrestore(&dwc->lock, flags);
 
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project


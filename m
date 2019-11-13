Return-Path: <SRS0=2B3Q=ZF=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59DA1C17442
	for <linux-usb@archiver.kernel.org>; Wed, 13 Nov 2019 06:15:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 327522196E
	for <linux-usb@archiver.kernel.org>; Wed, 13 Nov 2019 06:15:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="XT2FtN7t"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726195AbfKMGPY (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Wed, 13 Nov 2019 01:15:24 -0500
Received: from us03-smtprelay2.synopsys.com ([149.117.87.133]:45616 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725866AbfKMGPY (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 13 Nov 2019 01:15:24 -0500
Received: from mailhost.synopsys.com (mdc-mailhost2.synopsys.com [10.225.0.210])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id E4B24C024B;
        Wed, 13 Nov 2019 06:15:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1573625723; bh=4BRmgL3uBKP2LiqEmVn4KEDKMbSdkT8+Abhi1j2aF8E=;
        h=Date:From:Subject:To:Cc:From;
        b=XT2FtN7tmZOZy1ODSowODl/dG4b2q4F8uVqJxNja7Hdr+ccJreZew6i3CKtwFjQZu
         xng9KKEBRmwtxJqwQQF/j6KoQDSrO1i12JCq07rcivJPhU4E4dkYzPyK8Jy8Q1inm6
         4OFVAySWE4isgwzzo2mCUJFEY2d5u14gmZR4bux7ANYStz+tWD+qQPXUCmlMTXoYcf
         WBeVXmKodN1WBLqoJAkpD1C0UKh5PU3F+GCnO+5h6Vg2i6zkNgwEjRvFlRZAedUnnl
         0KS11n0H+5ZFNseZLuy/xDvVT/Pa3I8wMbxO5iIurvTVVh3YenxUjrXY+B48kCn4VN
         PpqY+1BxCVyLg==
Received: from tejas-VirtualBox (joglekar-e7480.internal.synopsys.com [10.144.133.44])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPSA id 160E2A0075;
        Wed, 13 Nov 2019 06:15:18 +0000 (UTC)
Received: by tejas-VirtualBox (sSMTP sendmail emulation); Wed, 13 Nov 2019 11:45:16 +0530
Date:   Wed, 13 Nov 2019 11:45:16 +0530
Message-Id: <cedf287bd185a5cbe31095d74e75b392f6c5263d.1573624581.git.joglekar@synopsys.com>
From:   Tejas Joglekar <Tejas.Joglekar@synopsys.com>
Subject: [PATCH] usb: dwc3: gadget: Fix logical condition
To:     Felipe Balbi <balbi@kernel.org>, linux-usb@vger.kernel.org
Cc:     John Youn <John.Youn@synopsys.com>,
        Tejas Joglekar <Tejas.Joglekar@synopsys.com>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        stable@vger.kernel.org
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

This patch corrects the condition to kick the transfer without
giving back the requests when either request has remaining data
or when there are pending SGs. The && check was introduced during
spliting up the dwc3_gadget_ep_cleanup_completed_requests() function.

Fixes: f38e35dd84e2 ("usb: dwc3: gadget: split dwc3_gadget_ep_cleanup_completed_requests()")

Cc: stable@vger.kernel.org
Signed-off-by: Tejas Joglekar <joglekar@synopsys.com>
---
 drivers/usb/dwc3/gadget.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/dwc3/gadget.c b/drivers/usb/dwc3/gadget.c
index 86dc1db788a9..e07159e06f9a 100644
--- a/drivers/usb/dwc3/gadget.c
+++ b/drivers/usb/dwc3/gadget.c
@@ -2485,7 +2485,7 @@ static int dwc3_gadget_ep_cleanup_completed_request(struct dwc3_ep *dep,
 
 	req->request.actual = req->request.length - req->remaining;
 
-	if (!dwc3_gadget_ep_request_completed(req) &&
+	if (!dwc3_gadget_ep_request_completed(req) ||
 			req->num_pending_sgs) {
 		__dwc3_gadget_kick_transfer(dep);
 		goto out;
-- 
2.11.0


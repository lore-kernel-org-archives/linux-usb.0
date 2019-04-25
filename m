Return-Path: <SRS0=WMKl=S3=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB42FC43219
	for <linux-usb@archiver.kernel.org>; Thu, 25 Apr 2019 21:28:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id BD71120675
	for <linux-usb@archiver.kernel.org>; Thu, 25 Apr 2019 21:28:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="SQ3cSu2+"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727183AbfDYV21 (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Thu, 25 Apr 2019 17:28:27 -0400
Received: from smtprelay-out1.synopsys.com ([198.182.61.142]:47182 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726534AbfDYV20 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 25 Apr 2019 17:28:26 -0400
Received: from mailhost.synopsys.com (dc2-mailhost2.synopsys.com [10.12.135.162])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 5E07FC0B09;
        Thu, 25 Apr 2019 21:28:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1556227706; bh=Ewk9YrnQ7mLgqZnoQu3foq2pro3sq1+mU742y2MYjMc=;
        h=Date:From:Subject:To:CC:From;
        b=SQ3cSu2+yxgSQYFokAIKwU2THsjBQtKHqdPKzDKdqOrPosQBLUFxMs/13BoZ5UHbs
         AUdeB5/u7+1A3A1G0IkP5BIsDlDl+Yusvqy50i+4W41HgoJCUmTw9W7X6ICb7tGgN8
         wRxworIIxGsk3GnJN/xJpCm/RgithC+EtNm9M8CMttybaK7GenAYLhtKRve2C/tA6T
         zrmkea3zXSG/Any4GPAaGm1r0PqkY67D0JJdtz+OGcXWWaXJUySdqcexKrS+5vK52s
         MHiN+prxs/y+DvfcFdtKpVGaBw9IhfaDMGo+B4ayJB78/8PCEyr2GKCVbIMp5QoKK8
         5WjdvoGzixs9Q==
Received: from US01WXQAHTC1.internal.synopsys.com (us01wxqahtc1.internal.synopsys.com [10.12.238.230])
        (using TLSv1.2 with cipher AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPS id 612F6A0093;
        Thu, 25 Apr 2019 21:28:26 +0000 (UTC)
Received: from US01WEHTC1.internal.synopsys.com (10.12.239.236) by
 US01WXQAHTC1.internal.synopsys.com (10.12.238.230) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Thu, 25 Apr 2019 14:28:26 -0700
Received: from te-lab16 (10.13.184.19) by us01wehtc1.internal.synopsys.com
 (10.12.239.236) with Microsoft SMTP Server (TLS) id 14.3.408.0; Thu, 25 Apr
 2019 14:28:25 -0700
Received: by te-lab16 (sSMTP sendmail emulation); Thu, 25 Apr 2019 14:28:24
 -0700
Date:   Thu, 25 Apr 2019 14:28:24 -0700
Message-ID:
 <33102637228c6d8ac397ed8a9473d95e82195c46.1556227526.git.thinhn@synopsys.com>
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Subject: [PATCH] usb: dwc3: gadget: Set lpm_capable
To:     Felipe Balbi <balbi@kernel.org>
CC:     John Youn <John.Youn@synopsys.com>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        <linux-usb@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-Originating-IP: [10.13.184.19]
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org
Message-ID: <20190425212824.L0kHWWkNOgthJ4Eh8korZEPPkkULEQlFDXgvM9DycUo@z>

All DWC3 controllers are LPM capable. Report that in the
usb_gadget.lpm_capable for the gadget driver to properly output the
bcdUSB value in the descriptor.

Signed-off-by: Thinh Nguyen <thinhn@synopsys.com>
---
 drivers/usb/dwc3/gadget.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/usb/dwc3/gadget.c b/drivers/usb/dwc3/gadget.c
index 1d808d15e886..d67655384eb2 100644
--- a/drivers/usb/dwc3/gadget.c
+++ b/drivers/usb/dwc3/gadget.c
@@ -3301,6 +3301,7 @@ int dwc3_gadget_init(struct dwc3 *dwc)
 	dwc->gadget.sg_supported	= true;
 	dwc->gadget.name		= "dwc3-gadget";
 	dwc->gadget.is_otg		= dwc->dr_mode == USB_DR_MODE_OTG;
+	dwc->gadget.lpm_capable		= true;
 
 	/*
 	 * FIXME We might be setting max_speed to <SUPER, however versions
-- 
2.11.0


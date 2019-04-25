Return-Path: <SRS0=WMKl=S3=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B5F5C43219
	for <linux-usb@archiver.kernel.org>; Thu, 25 Apr 2019 21:19:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 781EF216C4
	for <linux-usb@archiver.kernel.org>; Thu, 25 Apr 2019 21:19:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="OZW+xnuK"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730372AbfDYVTX (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Thu, 25 Apr 2019 17:19:23 -0400
Received: from dc8-smtprelay2.synopsys.com ([198.182.47.102]:60028 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728469AbfDYVTX (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 25 Apr 2019 17:19:23 -0400
Received: from mailhost.synopsys.com (badc-mailhost1.synopsys.com [10.192.0.17])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 30C2DC0AF9;
        Thu, 25 Apr 2019 21:19:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1556227163; bh=3oNlX2eV7aDqzbegQN2mUw49xyNLionp7OMbz5hpA58=;
        h=Date:From:Subject:To:CC:From;
        b=OZW+xnuKskeDdSQVMO0FLROsFaopbeSUDmcAVc9p3SB1aIKAdfMXWoxIlfXN8645B
         xyAUc6j+wS/EdJVyPfVu5Xu4YLYUZVo3EL9WLjZzHg+jrO8YSsouKLnOmFeaMrgBoc
         ryr5PmCof9xjQE99ondaCVCoXrT1M80hFnOcXKNrGDNOAV3NT/u0X7C2nRiWpibeiu
         re1pqSdu5Pno8DlYP2FhoWtk5IisrwvdthaGwggHnBta62Y2fsQB6YXLj6/IZianfW
         jNlMJTUCSmi4Ab8r6chhY7PVBs8qAJz+MpsF51fxJMR0rzkUwPQ0sFt3wlH6xqzw/u
         +FJD8wctu+I2A==
Received: from US01WEHTC3.internal.synopsys.com (us01wehtc3.internal.synopsys.com [10.15.84.232])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPS id 17B0CA0071;
        Thu, 25 Apr 2019 21:19:23 +0000 (UTC)
Received: from US01WEHTC1.internal.synopsys.com (10.12.239.236) by
 US01WEHTC3.internal.synopsys.com (10.15.84.232) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Thu, 25 Apr 2019 14:19:23 -0700
Received: from te-lab16 (10.13.184.19) by us01wehtc1.internal.synopsys.com
 (10.12.239.236) with Microsoft SMTP Server (TLS) id 14.3.408.0; Thu, 25 Apr
 2019 14:19:22 -0700
Received: by te-lab16 (sSMTP sendmail emulation); Thu, 25 Apr 2019 14:19:21
 -0700
Date:   Thu, 25 Apr 2019 14:19:21 -0700
Message-ID:
 <437ae107489e7e7bb1bd2e80449b523ec8b6887e.1556227048.git.thinhn@synopsys.com>
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Subject: [PATCH] usb: dwc3: Do core validation early on probe
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
Message-ID: <20190425211921.bt3HZasu7mzO5-ZKfm-eGAG7C_n8zmI-10ZQjcEhj1Q@z>

The setting of the dr_mode may need to check the controller's revision.
The revision is set in the dwc3_core_is_valid(), which comes after
dr_mode setting. Let's move it closer to the start of the dwc3_probe()
function and before calling dwc3_get_dr_mode().

Signed-off-by: Thinh Nguyen <thinhn@synopsys.com>
---
 drivers/usb/dwc3/core.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/usb/dwc3/core.c b/drivers/usb/dwc3/core.c
index c6735f0c1424..4aff1d8dbc4f 100644
--- a/drivers/usb/dwc3/core.c
+++ b/drivers/usb/dwc3/core.c
@@ -896,12 +896,6 @@ static int dwc3_core_init(struct dwc3 *dwc)
 	u32			reg;
 	int			ret;
 
-	if (!dwc3_core_is_valid(dwc)) {
-		dev_err(dwc->dev, "this is not a DesignWare USB3 DRD Core\n");
-		ret = -ENODEV;
-		goto err0;
-	}
-
 	/*
 	 * Write Linux Version Code to our GUID register so it's easy to figure
 	 * out which kernel version a bug was found.
@@ -1429,6 +1423,11 @@ static int dwc3_probe(struct platform_device *pdev)
 	dwc->regs	= regs;
 	dwc->regs_size	= resource_size(&dwc_res);
 
+	if (!dwc3_core_is_valid(dwc)) {
+		dev_err(dwc->dev, "this is not a DesignWare USB3 DRD Core\n");
+		return -ENODEV;
+	}
+
 	dwc3_get_properties(dwc);
 
 	dwc->reset = devm_reset_control_get_optional_shared(dev, NULL);
-- 
2.11.0


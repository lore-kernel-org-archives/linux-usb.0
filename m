Return-Path: <SRS0=WMKl=S3=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35755C43218
	for <linux-usb@archiver.kernel.org>; Thu, 25 Apr 2019 20:55:33 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 3A684206BF
	for <linux-usb@archiver.kernel.org>; Thu, 25 Apr 2019 20:55:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="B7a0racb"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730860AbfDYUzb (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Thu, 25 Apr 2019 16:55:31 -0400
Received: from dc2-smtprelay2.synopsys.com ([198.182.61.142]:45860 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726360AbfDYUzb (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 25 Apr 2019 16:55:31 -0400
Received: from mailhost.synopsys.com (badc-mailhost2.synopsys.com [10.192.0.18])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 536C2C0B19;
        Thu, 25 Apr 2019 20:55:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1556225730; bh=cp0BoDUPMoEV0JUtUCY1xJGof7qBDjAR/xgEr+ilkII=;
        h=Date:From:Subject:To:CC:From;
        b=B7a0racbo3wN3DQ15Y4nVmdlza/L+RCQA9jDVmsdykaJ0wSfKCbQEPt9Ki/ot4qlN
         UY1Nkk0P5cE2K8xW1S4DNwLPC1dxlVf8no9ddaVppwTysfB1sKBNP5fN9bQXiVo4jl
         HlZkPgPQK/X0ohATPVojD/dDJDEuoFbxJi1WZGeuaHL6LBak4gEHmITacYOEbxV0Yp
         G/hx6jUmwzg35LhFEyiV6n/faalwk5VUwVR4tB+Xsa3wmMV0L4s6QeNQPk1N77DzkO
         llHeqOtqfFofXt7v+RC2tv7fc6zgAd0do+tTbO1joA3dBz44z541ehVj6FaCuQojyY
         RWpQwTNCTYilg==
Received: from US01WEHTC3.internal.synopsys.com (us01wehtc3.internal.synopsys.com [10.15.84.232])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPS id 1B459A0067;
        Thu, 25 Apr 2019 20:55:29 +0000 (UTC)
Received: from US01WEHTC1.internal.synopsys.com (10.12.239.236) by
 US01WEHTC3.internal.synopsys.com (10.15.84.232) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Thu, 25 Apr 2019 13:55:25 -0700
Received: from te-lab16 (10.13.184.19) by us01wehtc1.internal.synopsys.com
 (10.12.239.236) with Microsoft SMTP Server (TLS) id 14.3.408.0; Thu, 25 Apr
 2019 13:55:24 -0700
Received: by te-lab16 (sSMTP sendmail emulation); Thu, 25 Apr 2019 13:55:23
 -0700
Date:   Thu, 25 Apr 2019 13:55:23 -0700
Message-ID:
 <63e615de8c5fde68c036f847c65547ce7bf6c45a.1556224658.git.thinhn@synopsys.com>
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Subject: [PATCH 1/2] usb: dwc3: Fix default lpm_nyet_threshold value
To:     Felipe Balbi <balbi@kernel.org>
CC:     John Youn <John.Youn@synopsys.com>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        <stable@vger.kernel.org>, <linux-usb@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-Originating-IP: [10.13.184.19]
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org
Message-ID: <20190425205523.qpPF5CqyFEIgOGOcHPbofq0SINVbzPHM_CmXo5Ybif4@z>

The max possible value for DCTL.LPM_NYET_THRES is 15 and not 255. Change
the default value to 15.

Cc: stable@vger.kernel.org
Fixes: 80caf7d21adc ("usb: dwc3: add lpm erratum support")
Signed-off-by: Thinh Nguyen <thinhn@synopsys.com>
---
 drivers/usb/dwc3/core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/dwc3/core.c b/drivers/usb/dwc3/core.c
index 2c9110ef9865..c6735f0c1424 100644
--- a/drivers/usb/dwc3/core.c
+++ b/drivers/usb/dwc3/core.c
@@ -1221,7 +1221,7 @@ static void dwc3_get_properties(struct dwc3 *dwc)
 	u8			tx_max_burst_prd;
 
 	/* default to highest possible threshold */
-	lpm_nyet_threshold = 0xff;
+	lpm_nyet_threshold = 0xf;
 
 	/* default to -3.5dB de-emphasis */
 	tx_de_emphasis = 1;
-- 
2.11.0


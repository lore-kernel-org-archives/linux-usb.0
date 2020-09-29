Return-Path: <SRS0=WwEB=DG=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE152C2D0A8
	for <linux-usb@archiver.kernel.org>; Tue, 29 Sep 2020 01:24:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7D48E208FE
	for <linux-usb@archiver.kernel.org>; Tue, 29 Sep 2020 01:24:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="VqbZto/c"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726698AbgI2BYh (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Mon, 28 Sep 2020 21:24:37 -0400
Received: from smtprelay-out1.synopsys.com ([149.117.73.133]:49786 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725272AbgI2BYg (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 28 Sep 2020 21:24:36 -0400
Received: from mailhost.synopsys.com (sv2-mailhost2.synopsys.com [10.205.2.134])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 963FC401F6;
        Tue, 29 Sep 2020 01:24:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1601342676; bh=NB7gys4OD2wsuGWDVJQV+bsrYM2tgb5Peqfl5Py/WiM=;
        h=Date:From:Subject:To:Cc:From;
        b=VqbZto/cjwX8NC1bf9fqqeng4wXYAv4QDqITR7uTgjvBdTjkPCzO7L0df3WZxvGHv
         oXUTSjHOdoy2oJLLAC4ZNDh0tuBvVKmfHMkX2Ouc66MvPhJ2R2K0e4pLGwPuWKnfFe
         GWLjPFALmK+L5ZyMckFY7UJ8wApQHv6u1j7hkka4rM7QuqwrWoBH/T3HBeYPKS0oV1
         S618sT8N2Gw/muq20QHVjPUV2rlR3MECppGTAj62e4jvG4D6ZaCW6CMpPC8SfElX2O
         DTgkmDDYVnTjiYJNsdaOcA06txV/qEPABArb7161Gv7UCYtAeGsc3XAR6esgNf7nCv
         Eo6L1uDBXEdMg==
Received: from te-lab16 (nanobot.internal.synopsys.com [10.10.186.99])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPSA id 512C7A0099;
        Tue, 29 Sep 2020 01:24:35 +0000 (UTC)
Received: by te-lab16 (sSMTP sendmail emulation); Mon, 28 Sep 2020 18:24:35 -0700
Date:   Mon, 28 Sep 2020 18:24:35 -0700
Message-Id: <d2664c6b9cbaa091c1ce7bea25e02989fc7f6272.1601342393.git.Thinh.Nguyen@synopsys.com>
X-SNPS-Relay: synopsys.com
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Subject: [PATCH] usb: dwc3: gadget: Allow restarting a transfer
To:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org
Cc:     John Youn <John.Youn@synopsys.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

For streams, sometime host may reject a stream and the device may need
to reinitiate that stream by stopping and restarting a transfer. In this
case, all the TRBs may have already been prepared. Allow the
__dwc3_gadget_kick_transfer() to go through to reinitiate the stream.

Signed-off-by: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
---
 drivers/usb/dwc3/gadget.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/dwc3/gadget.c b/drivers/usb/dwc3/gadget.c
index 82bc075ba97c..c53a22f0d952 100644
--- a/drivers/usb/dwc3/gadget.c
+++ b/drivers/usb/dwc3/gadget.c
@@ -1327,7 +1327,7 @@ static int __dwc3_gadget_kick_transfer(struct dwc3_ep *dep)
 	u32				cmd;
 
 	ret = dwc3_prepare_trbs(dep);
-	if (ret <= 0)
+	if (ret < 0)
 		return ret;
 
 	starting = !(dep->flags & DWC3_EP_TRANSFER_STARTED);

base-commit: 53139e6fa28fa0faa0a40476b033e13da25751fe
-- 
2.28.0


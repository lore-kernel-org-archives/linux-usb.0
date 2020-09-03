Return-Path: <SRS0=pd4M=CM=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53932C433E7
	for <linux-usb@archiver.kernel.org>; Thu,  3 Sep 2020 02:06:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3014820758
	for <linux-usb@archiver.kernel.org>; Thu,  3 Sep 2020 02:06:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="bqmL3dzQ"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727944AbgICCG0 (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Wed, 2 Sep 2020 22:06:26 -0400
Received: from smtprelay-out1.synopsys.com ([149.117.73.133]:54524 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726177AbgICCGZ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 2 Sep 2020 22:06:25 -0400
Received: from mailhost.synopsys.com (sv1-mailhost2.synopsys.com [10.205.2.132])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 56CC2404A2;
        Thu,  3 Sep 2020 02:06:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1599098785; bh=oJP+qSVkgCcmEM2FmxEbfRW1vTg4mbEmuYw0mwqbQ6o=;
        h=Date:In-Reply-To:References:From:Subject:To:Cc:From;
        b=bqmL3dzQ055c9HV6dux6rRL4/hcgq59t0mQV7eUQoAt5Rem7/TaTMW1wFJpIyVh/D
         sgz0P0MdaxRtFtRkuku9H3x6Dx8cgwNlzNPNZiDN0piX274CpzuIS57sbK3LlMRlnP
         O/EigG/51veeMEFQpjDY+TCjIgU+DrhMFrqpkmkiUUry47KP7wK9+tPm4OkNPTx3/Q
         iDyxOUIRFXe6jRRqkLVdzqVSX4nrqfYviVVbf4/4ht+GQ0tf0v4Y4dH3ZgYJI1jRGl
         3Ha5OrhOl5/jFTFifwZJlZH99MovTeExIP22A/hf2KcrCfoJs/liRqR214fNlBzKSX
         NTUPUZPzToY+w==
Received: from te-lab16 (nanobot.internal.synopsys.com [10.10.186.99])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPSA id 31D20A006D;
        Thu,  3 Sep 2020 02:06:24 +0000 (UTC)
Received: by te-lab16 (sSMTP sendmail emulation); Wed, 02 Sep 2020 19:06:24 -0700
Date:   Wed, 02 Sep 2020 19:06:24 -0700
Message-Id: <55d99f7e79667497cfbdd9e3d39b8e3668180aa9.1599098161.git.thinhn@synopsys.com>
In-Reply-To: <cover.1599098161.git.thinhn@synopsys.com>
References: <cover.1599098161.git.thinhn@synopsys.com>
X-SNPS-Relay: synopsys.com
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Subject: [PATCH v3 3/4] usb: dwc3: gadget: Rename misleading function names
To:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        linux-usb@vger.kernel.org
Cc:     John Youn <John.Youn@synopsys.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The functions dwc3_prepare_one_trb_sg and dwc3_prepare_one_trb_linear
are not necessarily preparing "one" TRB, it can prepare multiple TRBs.
Rename these functions as follow:

dwc3_prepare_one_trb_sg -> dwc3_prepare_trbs_sg
dwc3_prepare_one_trb_linear -> dwc3_prepare_trbs_linear

Signed-off-by: Thinh Nguyen <thinhn@synopsys.com>
---
 Changes in v3:
 - None
 Changes in v2:
 - None

 drivers/usb/dwc3/gadget.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/usb/dwc3/gadget.c b/drivers/usb/dwc3/gadget.c
index 7c95ac3186be..692b12367d8a 100644
--- a/drivers/usb/dwc3/gadget.c
+++ b/drivers/usb/dwc3/gadget.c
@@ -1164,7 +1164,7 @@ static int dwc3_prepare_last_sg(struct dwc3_ep *dep,
 	return 0;
 }
 
-static int dwc3_prepare_one_trb_sg(struct dwc3_ep *dep,
+static int dwc3_prepare_trbs_sg(struct dwc3_ep *dep,
 		struct dwc3_request *req)
 {
 	struct scatterlist *sg = req->start_sg;
@@ -1234,7 +1234,7 @@ static int dwc3_prepare_one_trb_sg(struct dwc3_ep *dep,
 	return 0;
 }
 
-static int dwc3_prepare_one_trb_linear(struct dwc3_ep *dep,
+static int dwc3_prepare_trbs_linear(struct dwc3_ep *dep,
 		struct dwc3_request *req)
 {
 	return dwc3_prepare_last_sg(dep, req, req->request.length, 0);
@@ -1269,7 +1269,7 @@ static int dwc3_prepare_trbs(struct dwc3_ep *dep)
 	 */
 	list_for_each_entry(req, &dep->started_list, list) {
 		if (req->num_pending_sgs > 0) {
-			ret = dwc3_prepare_one_trb_sg(dep, req);
+			ret = dwc3_prepare_trbs_sg(dep, req);
 			if (ret)
 				return ret;
 		}
@@ -1297,9 +1297,9 @@ static int dwc3_prepare_trbs(struct dwc3_ep *dep)
 		req->num_pending_sgs	= req->request.num_mapped_sgs;
 
 		if (req->num_pending_sgs > 0)
-			ret = dwc3_prepare_one_trb_sg(dep, req);
+			ret = dwc3_prepare_trbs_sg(dep, req);
 		else
-			ret = dwc3_prepare_one_trb_linear(dep, req);
+			ret = dwc3_prepare_trbs_linear(dep, req);
 
 		if (ret)
 			return ret;
-- 
2.28.0


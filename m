Return-Path: <SRS0=4r/C=BQ=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32299C433E1
	for <linux-usb@archiver.kernel.org>; Thu,  6 Aug 2020 00:45:32 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0E4252250E
	for <linux-usb@archiver.kernel.org>; Thu,  6 Aug 2020 00:45:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="Azv8LvoD"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726643AbgHFApa (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Wed, 5 Aug 2020 20:45:30 -0400
Received: from smtprelay-out1.synopsys.com ([149.117.73.133]:35934 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726524AbgHFApX (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 5 Aug 2020 20:45:23 -0400
Received: from mailhost.synopsys.com (sv2-mailhost1.synopsys.com [10.205.2.133])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 8DFB4407DB;
        Thu,  6 Aug 2020 00:45:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1596674723; bh=v3C0Rp6EPxnJOTcflXNB7ZNlJ5s7ENtLTdfHRU4UXzA=;
        h=Date:In-Reply-To:References:From:Subject:To:Cc:From;
        b=Azv8LvoDok4vE36RK/2f38qC1SQnsufPLfi/+9QFi/9OuArhwxp2ebC7ja217GeRB
         StPLUhHjqBG7lbTeuL4LmwHlGEU7jUmUXpGYstVVJQUjqCo6xuDx5WPDYngP/Q8QTo
         210ZCEQm6VqyNcBaRpueR31jmoG/gTSRsdsFoVm57D16sALNYnXeTBTr5pribtCsah
         qpB29BnBZ+qs8dHhikcMhM7b7xSCjBJKvmZ+6IigVDaL6A4RGn1b7sMp87U3IkFI4B
         k6/W75BTq73MYBRPVj6LWUyxDoSHj2xkrOW17+8akw+lCIAxRku2rQdd7pwxDC+iuz
         d/jzH//5f+Orw==
Received: from te-lab16 (nanobot.internal.synopsys.com [10.10.186.99])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPSA id 783C1A0096;
        Thu,  6 Aug 2020 00:45:22 +0000 (UTC)
Received: by te-lab16 (sSMTP sendmail emulation); Wed, 05 Aug 2020 17:45:22 -0700
Date:   Wed, 05 Aug 2020 17:45:22 -0700
Message-Id: <2a20e709932682c2444494d026fb557218fff438.1596674378.git.thinhn@synopsys.com>
In-Reply-To: <cover.1596674377.git.thinhn@synopsys.com>
References: <cover.1596674377.git.thinhn@synopsys.com>
X-SNPS-Relay: synopsys.com
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Subject: [PATCH 6/7] usb: dwc3: gadget: Rename misleading function names
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
 drivers/usb/dwc3/gadget.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/usb/dwc3/gadget.c b/drivers/usb/dwc3/gadget.c
index 64c2ebacc73c..401a72b30256 100644
--- a/drivers/usb/dwc3/gadget.c
+++ b/drivers/usb/dwc3/gadget.c
@@ -1161,7 +1161,7 @@ static int dwc3_prepare_last_sg(struct dwc3_ep *dep,
 	return 0;
 }
 
-static int dwc3_prepare_one_trb_sg(struct dwc3_ep *dep,
+static int dwc3_prepare_trbs_sg(struct dwc3_ep *dep,
 		struct dwc3_request *req)
 {
 	struct scatterlist *sg = req->start_sg;
@@ -1227,7 +1227,7 @@ static int dwc3_prepare_one_trb_sg(struct dwc3_ep *dep,
 	return 0;
 }
 
-static int dwc3_prepare_one_trb_linear(struct dwc3_ep *dep,
+static int dwc3_prepare_trbs_linear(struct dwc3_ep *dep,
 		struct dwc3_request *req)
 {
 	return dwc3_prepare_last_sg(dep, req, req->request.length, 0);
@@ -1260,7 +1260,7 @@ static int dwc3_prepare_trbs(struct dwc3_ep *dep)
 	 */
 	list_for_each_entry(req, &dep->started_list, list) {
 		if (req->num_pending_sgs > 0) {
-			ret = dwc3_prepare_one_trb_sg(dep, req);
+			ret = dwc3_prepare_trbs_sg(dep, req);
 			if (ret)
 				return ret;
 		}
@@ -1288,9 +1288,9 @@ static int dwc3_prepare_trbs(struct dwc3_ep *dep)
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


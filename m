Return-Path: <SRS0=JkLY=DB=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 518EFC4346E
	for <linux-usb@archiver.kernel.org>; Thu, 24 Sep 2020 08:21:52 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0419B221EB
	for <linux-usb@archiver.kernel.org>; Thu, 24 Sep 2020 08:21:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="Ked0/xeD"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727219AbgIXIVv (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Thu, 24 Sep 2020 04:21:51 -0400
Received: from smtprelay-out1.synopsys.com ([149.117.73.133]:40378 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727244AbgIXIVv (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 24 Sep 2020 04:21:51 -0400
Received: from mailhost.synopsys.com (sv1-mailhost1.synopsys.com [10.205.2.131])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id D02FB402F6;
        Thu, 24 Sep 2020 08:21:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1600935710; bh=gEO2aUNRGHydgbcEuMsyfLCEwQoZbu+gIjaSeTTCsLg=;
        h=Date:In-Reply-To:References:From:Subject:To:Cc:From;
        b=Ked0/xeDCDmzNtSqVPCBrvaqeS13oskl0AbA9Jl4MM6oefn/aKwM1OPAWLHDe/0ze
         TZzeVoEYjNvQBtihiC2UDOD8tZtOGwz4CLJM1c2QK3ZxIpVe0WEFqjxapiHcHcaOMy
         PM33WnvSKD/oJJQw5VMMxrnj2jILsR9aGJ/p6nz0y0uHt0fTo72th06HzO87tFKVk/
         yFN07DpK+n07KZm/O6Iw1X7vQ/kb13QhKMOR0KAkBrImtdPLyIJF57UWEFgv6DMgKf
         YBVrxBxT0vKthhoARUCJY2aAPTfUWo4dWaST4c9Em6Al8Hg1OXtfupa0DX/B3ZtzSf
         unqvodJuWbR1g==
Received: from te-lab16 (nanobot.internal.synopsys.com [10.10.186.99])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPSA id A23BEA01F1;
        Thu, 24 Sep 2020 08:21:49 +0000 (UTC)
Received: by te-lab16 (sSMTP sendmail emulation); Thu, 24 Sep 2020 01:21:49 -0700
Date:   Thu, 24 Sep 2020 01:21:49 -0700
Message-Id: <c82db89cb21420a8f2ffd997baa9842b5346bc23.1600935293.git.Thinh.Nguyen@synopsys.com>
In-Reply-To: <cover.1600935293.git.Thinh.Nguyen@synopsys.com>
References: <cover.1600935293.git.Thinh.Nguyen@synopsys.com>
X-SNPS-Relay: synopsys.com
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Subject: [PATCH 06/10] usb: dwc3: gadget: Return the number of prepared TRBs
To:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thinh.Nguyen@synopsys.com, linux-usb@vger.kernel.org
Cc:     John Youn <John.Youn@synopsys.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

In preparation for fixing the check for number of remaining TRBs,
revise dwc3_prepare_one_trb_linear() and dwc3_prepare_one_trb_sg() to
return the number of prepared TRBs.

Signed-off-by: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
---
 drivers/usb/dwc3/gadget.c | 35 +++++++++++++++++++++++++++++++++--
 1 file changed, 33 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/dwc3/gadget.c b/drivers/usb/dwc3/gadget.c
index e49930a7acae..d3896657ddbd 100644
--- a/drivers/usb/dwc3/gadget.c
+++ b/drivers/usb/dwc3/gadget.c
@@ -1094,7 +1094,7 @@ static void dwc3_prepare_one_trb(struct dwc3_ep *dep,
 			stream_id, short_not_ok, no_interrupt, is_last);
 }
 
-static void dwc3_prepare_one_trb_sg(struct dwc3_ep *dep,
+static int dwc3_prepare_one_trb_sg(struct dwc3_ep *dep,
 		struct dwc3_request *req)
 {
 	struct scatterlist *sg = req->start_sg;
@@ -1105,6 +1105,7 @@ static void dwc3_prepare_one_trb_sg(struct dwc3_ep *dep,
 	unsigned int rem = length % maxp;
 	unsigned int remaining = req->request.num_mapped_sgs
 		- req->num_queued_sgs;
+	unsigned int num_trbs = req->num_trbs;
 
 	/*
 	 * If we resume preparing the request, then get the remaining length of
@@ -1131,9 +1132,15 @@ static void dwc3_prepare_one_trb_sg(struct dwc3_ep *dep,
 		if ((i == remaining - 1) || !length)
 			chain = false;
 
+		if (!dwc3_calc_trbs_left(dep))
+			break;
+
 		if (rem && usb_endpoint_dir_out(dep->endpoint.desc) && !chain) {
 			/* prepare normal TRB */
 			if (req->request.length) {
+				if (dwc3_calc_trbs_left(dep) < 2)
+					goto out;
+
 				req->needs_extra_trb = true;
 				dwc3_prepare_one_trb(dep, req, trb_length,
 					true, i, false);
@@ -1145,6 +1152,10 @@ static void dwc3_prepare_one_trb_sg(struct dwc3_ep *dep,
 		} else if (req->request.zero && req->request.length &&
 			   !usb_endpoint_xfer_isoc(dep->endpoint.desc) &&
 			   !rem && !chain) {
+
+			if (dwc3_calc_trbs_left(dep) < 2)
+				goto out;
+
 			req->needs_extra_trb = true;
 
 			/* Prepare normal TRB */
@@ -1185,18 +1196,28 @@ static void dwc3_prepare_one_trb_sg(struct dwc3_ep *dep,
 		if (!dwc3_calc_trbs_left(dep))
 			break;
 	}
+
+out:
+	return req->num_trbs - num_trbs;
 }
 
-static void dwc3_prepare_one_trb_linear(struct dwc3_ep *dep,
+static int dwc3_prepare_one_trb_linear(struct dwc3_ep *dep,
 		struct dwc3_request *req)
 {
 	unsigned int length = req->request.length;
 	unsigned int maxp = usb_endpoint_maxp(dep->endpoint.desc);
 	unsigned int rem = length % maxp;
+	unsigned int num_trbs = req->num_trbs;
+
+	if (!dwc3_calc_trbs_left(dep))
+		goto out;
 
 	if ((!length || rem) && usb_endpoint_dir_out(dep->endpoint.desc)) {
 		/* prepare normal TRB */
 		if (req->request.length) {
+			if (dwc3_calc_trbs_left(dep) < 2)
+				goto out;
+
 			req->needs_extra_trb = true;
 			dwc3_prepare_one_trb(dep, req, length, true, 0, false);
 		}
@@ -1206,6 +1227,10 @@ static void dwc3_prepare_one_trb_linear(struct dwc3_ep *dep,
 	} else if (req->request.zero && req->request.length &&
 		   !usb_endpoint_xfer_isoc(dep->endpoint.desc) &&
 		   (IS_ALIGNED(req->request.length, maxp))) {
+
+		if (dwc3_calc_trbs_left(dep) < 2)
+			goto out;
+
 		req->needs_extra_trb = true;
 
 		/* prepare normal TRB */
@@ -1215,8 +1240,14 @@ static void dwc3_prepare_one_trb_linear(struct dwc3_ep *dep,
 		dwc3_prepare_one_trb(dep, req, req->direction ? 0 : maxp,
 				false, 1, true);
 	} else {
+		if (!dwc3_calc_trbs_left(dep))
+			goto out;
+
 		dwc3_prepare_one_trb(dep, req, length, false, 0, false);
 	}
+
+out:
+	return req->num_trbs - num_trbs;
 }
 
 /*
-- 
2.28.0


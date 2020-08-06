Return-Path: <SRS0=4r/C=BQ=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7042C433DF
	for <linux-usb@archiver.kernel.org>; Thu,  6 Aug 2020 00:45:14 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C88752245C
	for <linux-usb@archiver.kernel.org>; Thu,  6 Aug 2020 00:45:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="NT0d+H0v"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726802AbgHFApK (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Wed, 5 Aug 2020 20:45:10 -0400
Received: from smtprelay-out1.synopsys.com ([149.117.87.133]:59060 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726197AbgHFApF (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 5 Aug 2020 20:45:05 -0400
Received: from mailhost.synopsys.com (sv1-mailhost2.synopsys.com [10.205.2.132])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 678A2C0BBF;
        Thu,  6 Aug 2020 00:45:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1596674705; bh=B2CaqTmgxgBVYNUsPl20YT5gQjJwQfyPhgyZTb3xa4E=;
        h=Date:In-Reply-To:References:From:Subject:To:Cc:From;
        b=NT0d+H0vHk5JnEzLXSVOFEVciIyZm3PurWEKZuLnV5hERyB3MEG3qj8N9VPgPVvAL
         ew4N6SfByYGF2iiShN+FMW2Gh+qgz+WirmGysBjU3wSZLZTX9SA7eoGhN/vmc+omA+
         gKF/7vMkAvlstufrEqVzHyaEQALu7RYRsq3HSgPHdCWzTJQ+Y0qTRKQ8hVHRryixcG
         1BmKeqeOgeKaI60J1naoz/+i/L7hU0BYLgyFq1VtjFJR/eQYT+7pcfm7KuwXFOjsf/
         AdKVczhHKcbHeKoi2301LXM9T5DrleretQde53sbn+UBZdklryeDsHC1J9oEWGG5an
         uPGlFwxM4DxAg==
Received: from te-lab16 (nanobot.internal.synopsys.com [10.10.186.99])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPSA id 372C2A0070;
        Thu,  6 Aug 2020 00:45:04 +0000 (UTC)
Received: by te-lab16 (sSMTP sendmail emulation); Wed, 05 Aug 2020 17:45:04 -0700
Date:   Wed, 05 Aug 2020 17:45:04 -0700
Message-Id: <b6813819f280fa6fdc37d98d26d8ad2fdf45cfe6.1596674377.git.thinhn@synopsys.com>
In-Reply-To: <cover.1596674377.git.thinhn@synopsys.com>
References: <cover.1596674377.git.thinhn@synopsys.com>
X-SNPS-Relay: synopsys.com
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Subject: [PATCH 3/7] usb: dwc3: gadget: Handle ZLP for sg requests
To:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        linux-usb@vger.kernel.org
Cc:     John Youn <John.Youn@synopsys.com>, stable@vger.kernel.org
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Currently dwc3 doesn't handle usb_request->zero for SG requests. This
change checks and prepares extra TRBs for the ZLP for SG requests.

Cc: stable@vger.kernel.org
Fixes: 04c03d10e507 ("usb: dwc3: gadget: handle request->zero")
Signed-off-by: Thinh Nguyen <thinhn@synopsys.com>
---
 drivers/usb/dwc3/gadget.c | 31 +++++++++++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/drivers/usb/dwc3/gadget.c b/drivers/usb/dwc3/gadget.c
index c0175dff194e..ced229aeccec 100644
--- a/drivers/usb/dwc3/gadget.c
+++ b/drivers/usb/dwc3/gadget.c
@@ -1137,6 +1137,37 @@ static void dwc3_prepare_one_trb_sg(struct dwc3_ep *dep,
 					req->request.short_not_ok,
 					req->request.no_interrupt,
 					req->request.is_last);
+		} else if (req->request.zero && req->request.length &&
+			   !usb_endpoint_xfer_isoc(dep->endpoint.desc) &&
+			   !rem && !chain) {
+			struct dwc3	*dwc = dep->dwc;
+			struct dwc3_trb	*trb;
+
+			req->needs_extra_trb = true;
+
+			/* Prepare normal TRB */
+			dwc3_prepare_one_trb(dep, req, trb_length, true, i);
+
+			/* Prepare one extra TRB to handle ZLP */
+			trb = &dep->trb_pool[dep->trb_enqueue];
+			req->num_trbs++;
+			__dwc3_prepare_one_trb(dep, trb, dwc->bounce_addr, 0,
+					       !req->direction, 1,
+					       req->request.stream_id,
+					       req->request.short_not_ok,
+					       req->request.no_interrupt,
+					       req->request.is_last);
+
+			/* Prepare one more TRB to handle MPS alignment */
+			if (!req->direction) {
+				trb = &dep->trb_pool[dep->trb_enqueue];
+				req->num_trbs++;
+				__dwc3_prepare_one_trb(dep, trb, dwc->bounce_addr, maxp,
+						       false, 1, req->request.stream_id,
+						       req->request.short_not_ok,
+						       req->request.no_interrupt,
+						       req->request.is_last);
+			}
 		} else {
 			dwc3_prepare_one_trb(dep, req, trb_length, chain, i);
 		}
-- 
2.28.0


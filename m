Return-Path: <SRS0=JN91=6U=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75722C47254
	for <linux-usb@archiver.kernel.org>; Wed,  6 May 2020 02:46:30 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 497CC20721
	for <linux-usb@archiver.kernel.org>; Wed,  6 May 2020 02:46:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="k27q1iH/"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726495AbgEFCq3 (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Tue, 5 May 2020 22:46:29 -0400
Received: from smtprelay-out1.synopsys.com ([149.117.73.133]:35308 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725915AbgEFCq2 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 5 May 2020 22:46:28 -0400
Received: from mailhost.synopsys.com (sv2-mailhost1.synopsys.com [10.205.2.133])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 4E1FF407EB;
        Wed,  6 May 2020 02:46:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1588733188; bh=ckRmBTKph7EhgNhUtFY9c7FoFMzx8WlCbW95deYWMrM=;
        h=Date:In-Reply-To:References:From:Subject:To:Cc:From;
        b=k27q1iH/kWD20MFR6h1gVBqcVA9Vzz/SqqvgEY/2cCT1NTA0JdgFIIFJTUkDAO/PI
         opyFBNE/neYr7LUZ18rcQf/h2PUCu8XaKhemKVPOqwPS4q33FbCi8KJyG0xJYAXoh+
         PpmgMT53xZO8TIVB96a55T/L2K0BYIj2VwQkDtRGUgZNSHtRtKysoD2tdbEdpPKPsd
         tQnxbHqyWEhz7rjLwfK262Z8HKRmjn9+7TqlIPnjBxx6fzXBlCUgopwWX0ClTVDLFE
         DE4PEmCxoHPl8cdeSjGsQp7h4Pp7ObitnWpVnMDc4FYd2wDLk5RjdRg7xpfgp/ARbZ
         7yjO/neZsidAw==
Received: from te-lab16 (nanobot.internal.synopsys.com [10.10.186.99])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPSA id 386B3A0259;
        Wed,  6 May 2020 02:46:27 +0000 (UTC)
Received: by te-lab16 (sSMTP sendmail emulation); Tue, 05 May 2020 19:46:27 -0700
Date:   Tue, 05 May 2020 19:46:27 -0700
Message-Id: <3cf43b3df0c0523a2ac7f853dd5c30c0c98efa49.1588732815.git.thinhn@synopsys.com>
In-Reply-To: <cover.1588732815.git.thinhn@synopsys.com>
References: <cover.1588732815.git.thinhn@synopsys.com>
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Subject: [PATCH v2 03/11] usb: dwc3: gadget: Continue to process pending requests
To:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        linux-usb@vger.kernel.org
Cc:     John Youn <John.Youn@synopsys.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

If there are still pending requests because no TRB was available,
prepare more when started requests are completed.

Introduce dwc3_gadget_ep_should_continue() to check for incomplete and
pending requests to resume updating new TRBs to the controller's TRB
cache.

Signed-off-by: Thinh Nguyen <thinhn@synopsys.com>
---
 drivers/usb/dwc3/gadget.c | 24 +++++++++++++++++++++---
 1 file changed, 21 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/dwc3/gadget.c b/drivers/usb/dwc3/gadget.c
index 4ca3e197bee4..865e6fbb7360 100644
--- a/drivers/usb/dwc3/gadget.c
+++ b/drivers/usb/dwc3/gadget.c
@@ -2605,10 +2605,8 @@ static int dwc3_gadget_ep_cleanup_completed_request(struct dwc3_ep *dep,
 
 	req->request.actual = req->request.length - req->remaining;
 
-	if (!dwc3_gadget_ep_request_completed(req)) {
-		__dwc3_gadget_kick_transfer(dep);
+	if (!dwc3_gadget_ep_request_completed(req))
 		goto out;
-	}
 
 	dwc3_gadget_giveback(dep, req, status);
 
@@ -2632,6 +2630,24 @@ static void dwc3_gadget_ep_cleanup_completed_requests(struct dwc3_ep *dep,
 	}
 }
 
+static bool dwc3_gadget_ep_should_continue(struct dwc3_ep *dep)
+{
+	struct dwc3_request	*req;
+
+	if (!list_empty(&dep->pending_list))
+		return true;
+
+	/*
+	 * We only need to check the first entry of the started list. We can
+	 * assume the completed requests are removed from the started list.
+	 */
+	req = next_request(&dep->started_list);
+	if (!req)
+		return false;
+
+	return !dwc3_gadget_ep_request_completed(req);
+}
+
 static void dwc3_gadget_endpoint_frame_from_event(struct dwc3_ep *dep,
 		const struct dwc3_event_depevt *event)
 {
@@ -2661,6 +2677,8 @@ static void dwc3_gadget_endpoint_transfer_in_progress(struct dwc3_ep *dep,
 
 	if (stop)
 		dwc3_stop_active_transfer(dep, true, true);
+	else if (dwc3_gadget_ep_should_continue(dep))
+		__dwc3_gadget_kick_transfer(dep);
 
 	/*
 	 * WORKAROUND: This is the 2nd half of U1/U2 -> U0 workaround.
-- 
2.11.0


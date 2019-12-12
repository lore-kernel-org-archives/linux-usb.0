Return-Path: <SRS0=CPD5=2C=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3BE65C43603
	for <linux-usb@archiver.kernel.org>; Thu, 12 Dec 2019 02:49:21 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 108952464B
	for <linux-usb@archiver.kernel.org>; Thu, 12 Dec 2019 02:49:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="QUkndc+4"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727842AbfLLCtU (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Wed, 11 Dec 2019 21:49:20 -0500
Received: from sv2-smtprelay2.synopsys.com ([149.117.73.133]:41526 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727811AbfLLCtU (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 11 Dec 2019 21:49:20 -0500
Received: from mailhost.synopsys.com (sv1-mailhost2.synopsys.com [10.205.2.132])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 2963F404D4;
        Thu, 12 Dec 2019 02:49:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1576118960; bh=orpV7rnYre/jLQUBFYEcMXTuyzsbGie9Lh/bwZFvRsY=;
        h=Date:In-Reply-To:References:From:Subject:To:Cc:From;
        b=QUkndc+42SvQYqBQquBi1o1URQOe3OkIeb7nPpAYdqetq1LTWfXAuDPEFGpTM4rCl
         Ko1r8W6ExvEJBmyVxa5TPXg1u3Y09KM2d3gkjQlP+zDYpcdjqNukFp3tctrTeLbbzv
         N/7cGJWyAKGEoIEIw555gnSELmmCGZ0dJu+k7AvHDIXvvJd9xsnlExyhglSWJOEZ0F
         xBGyhWGRRaaEoae+GD+qBc3D92DxDuSkwpFgXg5GvUp6TbVbIZXxY5/4nwfIni8xQo
         YU85rpKEr4I6pLtjCNfDdZmwiC4CD0QkwqUnxic69070ECveCXAtdN94aYm0WSVSdx
         rguSb7jHRuXaA==
Received: from te-lab16 (nanobot.internal.synopsys.com [10.10.186.99])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPSA id CE976A006D;
        Thu, 12 Dec 2019 02:49:18 +0000 (UTC)
Received: by te-lab16 (sSMTP sendmail emulation); Wed, 11 Dec 2019 18:49:18 -0800
Date:   Wed, 11 Dec 2019 18:49:18 -0800
Message-Id: <0ff7d475567f10e2f5051554daaa41d2ce03aa35.1576118671.git.thinhn@synopsys.com>
In-Reply-To: <cover.1576118671.git.thinhn@synopsys.com>
References: <cover.1576118671.git.thinhn@synopsys.com>
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Subject: [RFC PATCH 03/14] usb: composite: Properly report lsm
To:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        linux-usb@vger.kernel.org
Cc:     John Youn <John.Youn@synopsys.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Use the max lane speed mantisa value from the gadget and report to the
device descriptor if available.

Signed-off-by: Thinh Nguyen <thinhn@synopsys.com>
---
 drivers/usb/gadget/composite.c | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/gadget/composite.c b/drivers/usb/gadget/composite.c
index a4de5a8c0f19..cd38078d6a42 100644
--- a/drivers/usb/gadget/composite.c
+++ b/drivers/usb/gadget/composite.c
@@ -682,6 +682,11 @@ static int bos_desc(struct usb_composite_dev *cdev)
 	/* The SuperSpeedPlus USB Device Capability descriptor */
 	if (gadget_is_superspeed_plus(cdev->gadget)) {
 		struct usb_ssp_cap_descriptor *ssp_cap;
+		int lsm = 10;
+
+		if (cdev->gadget->ops->udc_set_sublink_attr &&
+		    cdev->gadget->max_lsm)
+			lsm = cdev->gadget->max_lsm;
 
 		ssp_cap = cdev->req->buf + le16_to_cpu(bos->wTotalLength);
 		bos->bNumDeviceCaps++;
@@ -709,20 +714,21 @@ static int bos_desc(struct usb_composite_dev *cdev)
 		 *   ST  = Symmetric, RX
 		 *   LSE =  3 (Gbps)
 		 *   LP  =  1 (SuperSpeedPlus)
-		 *   LSM = 10 (10 Gbps)
+		 *   LSM =  5 or 10
 		 */
 		ssp_cap->bmSublinkSpeedAttr[0] =
-			cpu_to_le32((3 << 4) | (1 << 14) | (0xa << 16));
+			cpu_to_le32((3 << 4) | (1 << 14) | (lsm << 16));
+
 		/*
 		 * bmSublinkSpeedAttr[1] =
 		 *   ST  = Symmetric, TX
 		 *   LSE =  3 (Gbps)
 		 *   LP  =  1 (SuperSpeedPlus)
-		 *   LSM = 10 (10 Gbps)
+		 *   LSM =  5 or 10
 		 */
 		ssp_cap->bmSublinkSpeedAttr[1] =
 			cpu_to_le32((3 << 4) | (1 << 14) |
-				    (0xa << 16) | (1 << 7));
+				    (lsm << 16) | (1 << 7));
 	}
 
 	return le16_to_cpu(bos->wTotalLength);
-- 
2.11.0


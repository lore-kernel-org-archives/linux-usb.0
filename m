Return-Path: <SRS0=JLdt=A3=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E8C5C433E2
	for <linux-usb@archiver.kernel.org>; Thu, 16 Jul 2020 21:58:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0E0B720760
	for <linux-usb@archiver.kernel.org>; Thu, 16 Jul 2020 21:58:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="KuWR8+Ws"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726113AbgGPV6p (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Thu, 16 Jul 2020 17:58:45 -0400
Received: from smtprelay-out1.synopsys.com ([149.117.73.133]:46070 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726002AbgGPV6p (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 16 Jul 2020 17:58:45 -0400
Received: from mailhost.synopsys.com (sv1-mailhost2.synopsys.com [10.205.2.132])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id A815E40391;
        Thu, 16 Jul 2020 21:58:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1594936724; bh=ghRdz9kYQI/CLwAkMlWYylnCNFhmwOvmxjtii0ZP2gA=;
        h=Date:In-Reply-To:References:From:Subject:To:Cc:From;
        b=KuWR8+WspumnO5LTesSsPZaDU5g8DQatm85EWXAvc4i66SgFcQzmEAcrIJb1ln14C
         ytOyEw3fABfprYpKURnD11aedl2OVJ8DwqoCjHxzkyyZGMX6+F+kwuTF10xIOTgXZh
         By/URearChoLbWAwBKZ2yKTWMu6ofs7NkmUofLQdO7/YkDa231VFx4p+W9G5oREhAm
         gFpmwe1nRfpNyi/bofbpzdW11+LmZ0UPvnfDQurc4hBnfjf7OIIeF4r2RFZI7hNuFq
         FXrMwD9GHFY0UkvXgkmWIGurfUMF/w2ZM9iJtQ9F5Mi5nAl2HtD5eUa9mUjL3NcSfq
         pDYSIGSmCAEgQ==
Received: from te-lab16 (nanobot.internal.synopsys.com [10.10.186.99])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPSA id 364C6A022C;
        Thu, 16 Jul 2020 21:58:42 +0000 (UTC)
Received: by te-lab16 (sSMTP sendmail emulation); Thu, 16 Jul 2020 14:58:42 -0700
Date:   Thu, 16 Jul 2020 14:58:42 -0700
Message-Id: <b94bbb8362043b43fec8642ee7f0c28418cf99d1.1594935978.git.thinhn@synopsys.com>
In-Reply-To: <cover.1594935978.git.thinhn@synopsys.com>
References: <cover.1594935978.git.thinhn@synopsys.com>
X-SNPS-Relay: synopsys.com
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Subject: [PATCH 02/11] usb: gadget: composite: Avoid using magic numbers
To:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        linux-usb@vger.kernel.org
Cc:     John Youn <John.Youn@synopsys.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Magic numbers are difficult to read. Use macros for super-speed-plus BOS
descriptor attributes in the composite driver. They're self-documented.
So there's no need to provide comments as we did previously for the
magic numbers.

Signed-off-by: Thinh Nguyen <thinhn@synopsys.com>
---
 drivers/usb/gadget/composite.c | 41 ++++++++++++++++++++---------------------
 1 file changed, 20 insertions(+), 21 deletions(-)

diff --git a/drivers/usb/gadget/composite.c b/drivers/usb/gadget/composite.c
index 5c1eb96a5c57..a231ae382ac3 100644
--- a/drivers/usb/gadget/composite.c
+++ b/drivers/usb/gadget/composite.c
@@ -13,6 +13,7 @@
 #include <linux/module.h>
 #include <linux/device.h>
 #include <linux/utsname.h>
+#include <linux/bitfield.h>
 
 #include <linux/usb/composite.h>
 #include <linux/usb/otg.h>
@@ -743,32 +744,30 @@ static int bos_desc(struct usb_composite_dev *cdev)
 		ssp_cap->bReserved = 0;
 		ssp_cap->wReserved = 0;
 
-		/* SSAC = 1 (2 attributes) */
-		ssp_cap->bmAttributes = cpu_to_le32(1);
+		ssp_cap->bmAttributes =
+			cpu_to_le32(FIELD_PREP(USB_SSP_SUBLINK_SPEED_ATTRIBS, 1) |
+				    FIELD_PREP(USB_SSP_SUBLINK_SPEED_IDS, 0));
 
-		/* Min RX/TX Lane Count = 1 */
 		ssp_cap->wFunctionalitySupport =
-			cpu_to_le16((1 << 8) | (1 << 12));
+			cpu_to_le16(FIELD_PREP(USB_SSP_MIN_SUBLINK_SPEED_ATTRIBUTE_ID, 0) |
+				    FIELD_PREP(USB_SSP_MIN_RX_LANE_COUNT, 1) |
+				    FIELD_PREP(USB_SSP_MIN_TX_LANE_COUNT, 1));
 
-		/*
-		 * bmSublinkSpeedAttr[0]:
-		 *   ST  = Symmetric, RX
-		 *   LSE =  3 (Gbps)
-		 *   LP  =  1 (SuperSpeedPlus)
-		 *   LSM = 10 (10 Gbps)
-		 */
 		ssp_cap->bmSublinkSpeedAttr[0] =
-			cpu_to_le32((3 << 4) | (1 << 14) | (0xa << 16));
-		/*
-		 * bmSublinkSpeedAttr[1] =
-		 *   ST  = Symmetric, TX
-		 *   LSE =  3 (Gbps)
-		 *   LP  =  1 (SuperSpeedPlus)
-		 *   LSM = 10 (10 Gbps)
-		 */
+			cpu_to_le32(FIELD_PREP(USB_SSP_SUBLINK_SPEED_SSID, 0) |
+				    FIELD_PREP(USB_SSP_SUBLINK_SPEED_LSE, USB_LSE_GBPS) |
+				    FIELD_PREP(USB_SSP_SUBLINK_SPEED_ST,
+					       USB_ST_SYMMETRIC_RX) |
+				    FIELD_PREP(USB_SSP_SUBLINK_SPEED_LP, USB_LP_SSP) |
+				    FIELD_PREP(USB_SSP_SUBLINK_SPEED_LSM, 10));
+
 		ssp_cap->bmSublinkSpeedAttr[1] =
-			cpu_to_le32((3 << 4) | (1 << 14) |
-				    (0xa << 16) | (1 << 7));
+			cpu_to_le32(FIELD_PREP(USB_SSP_SUBLINK_SPEED_SSID, 0) |
+				    FIELD_PREP(USB_SSP_SUBLINK_SPEED_LSE, USB_LSE_GBPS) |
+				    FIELD_PREP(USB_SSP_SUBLINK_SPEED_ST,
+					       USB_ST_SYMMETRIC_TX) |
+				    FIELD_PREP(USB_SSP_SUBLINK_SPEED_LP, USB_LP_SSP) |
+				    FIELD_PREP(USB_SSP_SUBLINK_SPEED_LSM, 10));
 	}
 
 	return le16_to_cpu(bos->wTotalLength);
-- 
2.11.0


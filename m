Return-Path: <SRS0=f5PK=BC=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C865C433EA
	for <linux-usb@archiver.kernel.org>; Thu, 23 Jul 2020 02:13:19 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 286A1207E8
	for <linux-usb@archiver.kernel.org>; Thu, 23 Jul 2020 02:13:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="MmZL5jAZ"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387785AbgGWCNS (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Wed, 22 Jul 2020 22:13:18 -0400
Received: from smtprelay-out1.synopsys.com ([149.117.87.133]:34976 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2387783AbgGWCNS (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 22 Jul 2020 22:13:18 -0400
Received: from mailhost.synopsys.com (sv1-mailhost2.synopsys.com [10.205.2.132])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 06D65C0089;
        Thu, 23 Jul 2020 02:13:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1595470398; bh=H7aIfhqlpEyIdQ2h9ZTMFm4HDhY4IPdImewAUIIiH5U=;
        h=Date:In-Reply-To:References:From:Subject:To:Cc:From;
        b=MmZL5jAZx9dqTJydpLjYHvvzVlfvbQLuabraHNNTzQdH2WZFC7ibL0DJ49gqbKZbo
         kzSZwCnShLfjfI39XFIGgCZasNGOpvGfLlUdPp7D+nmkX2OcburcGQR08sP8T1TrSX
         9zL++qlKy9fxsBbyAvzEJmSoHIQKrJWxKkMBpgNzq2ZOR3p0fXJIMB7RN7FRtd5Thq
         aUgMvVCiZ/O+gRqKmGkRpgols60ZiF04qD5j7rsCY/DQolGTRf+2mfZ2yjfYacgraY
         iC5dqXSAyFPYohKt4b9sif27RiSDWSGg/Ej4ms22ziOM6Q/OhB/z9yJ/aCahgL7zoz
         +xMapTlhW+zdQ==
Received: from te-lab16 (nanobot.internal.synopsys.com [10.10.186.99])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPSA id CC00AA006F;
        Thu, 23 Jul 2020 02:13:16 +0000 (UTC)
Received: by te-lab16 (sSMTP sendmail emulation); Wed, 22 Jul 2020 19:13:16 -0700
Date:   Wed, 22 Jul 2020 19:13:16 -0700
Message-Id: <8636b860422de412a954cd7b8a11ef1d73a14538.1595468673.git.thinhn@synopsys.com>
In-Reply-To: <cover.1595468673.git.thinhn@synopsys.com>
References: <cover.1595468673.git.thinhn@synopsys.com>
X-SNPS-Relay: synopsys.com
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Subject: [PATCH v2 12/12] usb: dwc3: gadget: Set speed only up to the max supported
To:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        linux-usb@vger.kernel.org
Cc:     John Youn <John.Youn@synopsys.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The setting of device speed should be limited by the device's
maximum_speed. This patch adds a check and prevent the driver from
attempting to configure higher than the maximum_speed.

Signed-off-by: Thinh Nguyen <thinhn@synopsys.com>
---
 Changes in v2:
 - None

 drivers/usb/dwc3/gadget.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/dwc3/gadget.c b/drivers/usb/dwc3/gadget.c
index 2bc29d74e75a..9094690f8258 100644
--- a/drivers/usb/dwc3/gadget.c
+++ b/drivers/usb/dwc3/gadget.c
@@ -2254,6 +2254,7 @@ static void dwc3_gadget_set_speed(struct usb_gadget *g,
 				  enum usb_device_speed speed)
 {
 	struct dwc3		*dwc = gadget_to_dwc(g);
+	enum usb_device_speed	selected_speed = speed;
 	unsigned long		flags;
 	u32			reg;
 
@@ -2278,7 +2279,10 @@ static void dwc3_gadget_set_speed(struct usb_gadget *g,
 	    !dwc->dis_metastability_quirk) {
 		reg |= DWC3_DCFG_SUPERSPEED;
 	} else {
-		switch (speed) {
+		if (speed > dwc->maximum_speed)
+			selected_speed = dwc->maximum_speed;
+
+		switch (selected_speed) {
 		case USB_SPEED_LOW:
 			reg |= DWC3_DCFG_LOWSPEED;
 			break;
@@ -2298,7 +2302,8 @@ static void dwc3_gadget_set_speed(struct usb_gadget *g,
 				reg |= DWC3_DCFG_SUPERSPEED_PLUS;
 			break;
 		default:
-			dev_err(dwc->dev, "invalid speed (%d)\n", speed);
+			dev_err(dwc->dev, "invalid speed (%d)\n",
+				selected_speed);
 
 			if (DWC3_IP_IS(DWC3))
 				reg |= DWC3_DCFG_SUPERSPEED;
@@ -2307,7 +2312,7 @@ static void dwc3_gadget_set_speed(struct usb_gadget *g,
 		}
 	}
 
-	if (DWC3_IP_IS(DWC32) && speed < USB_SPEED_SUPER_PLUS)
+	if (DWC3_IP_IS(DWC32) && selected_speed < USB_SPEED_SUPER_PLUS)
 		reg &= ~DWC3_DCFG_NUMLANES(~0);
 
 	dwc3_writel(dwc->regs, DWC3_DCFG, reg);
-- 
2.11.0


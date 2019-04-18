Return-Path: <SRS0=JW0E=SU=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB731C10F0E
	for <linux-usb@archiver.kernel.org>; Thu, 18 Apr 2019 11:45:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id BB5862183E
	for <linux-usb@archiver.kernel.org>; Thu, 18 Apr 2019 11:45:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="d15Kg8jk"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388856AbfDRLpx (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Thu, 18 Apr 2019 07:45:53 -0400
Received: from dc2-smtprelay2.synopsys.com ([198.182.61.142]:53252 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727807AbfDRLpx (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 18 Apr 2019 07:45:53 -0400
X-Greylist: delayed 302 seconds by postgrey-1.27 at vger.kernel.org; Thu, 18 Apr 2019 07:45:53 EDT
Received: from mailhost.synopsys.com (dc2-mailhost2.synopsys.com [10.12.135.162])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 6F206C0B6C;
        Thu, 18 Apr 2019 11:40:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1555587650; bh=BDlZTLLxZY1nOl7McSORdouo2nHJxoSOT8mcMBh50r8=;
        h=Date:From:Subject:To:Cc:From;
        b=d15Kg8jk++uQovjFN3XOAzDToNCJcmAxJA/XujahGvMCbRZla7VR5UHANvtP2cOk1
         4IzE98HTHMGL0PBvbxw8w3d9ydO4Ct37UU6OftXB2/i1r1GcXEHuRXxzOpvcAYIOoH
         VyHmi39ApdJHLa9ri6xco/36m5yfo0fblY/6t9l8OEuuSX6f6dK5LwBtc0QiBuoAfF
         l93EPG2E0Xe5ECM/6VLAXOBAiyvP2Prexm3qMQ86WLtWD8VlmDJ4kmTsMY8kS8A6Ty
         ccDFENGPr+Jqq7kxpzO1ZGSoSTkMuwxFvZ0KzB5jE/mxaFaiRiBigcEusIBskemdXE
         l2DWHmnlfn4rA==
Received: from hminas-z420 (hminas-z420.internal.synopsys.com [10.116.126.211])
        (using TLSv1 with cipher AES128-SHA (128/128 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPSA id 7EB3DA009D;
        Thu, 18 Apr 2019 11:40:48 +0000 (UTC)
Received: by hminas-z420 (sSMTP sendmail emulation); Thu, 18 Apr 2019 15:40:43 +0400
Date:   Thu, 18 Apr 2019 15:40:43 +0400
Message-Id:
 <b729b2ca09edc379aa83c03cf7c8a0a10a838bca.1555578524.git.hminas@synopsys.com>
From:   Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>
Subject: [PATCH] usb: dwc2: gadget: Reject LPM token during Control transfers
To:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>,
        linux-usb@vger.kernel.org
Cc:     John Youn <John.Youn@synopsys.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190418114043.3aKvRzB7x0h0RMj651JMFWYGsw-nplu0LE98TqP1V4k@z>

Avoiding switch to L1 state in any stage of control transfers.
Send NYET handshake to LPM token.

Renamed GLPMCFG_LPM_ACCEPT_CTRL_ISOC to GLPMCFG_LPM_REJECT_CTRL_CONTROL
because by setting this bit core reject LPM token.

Signed-off-by: Minas Harutyunyan <hminas@synopsys.com>
---
 drivers/usb/dwc2/gadget.c | 1 +
 drivers/usb/dwc2/hw.h     | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/dwc2/gadget.c b/drivers/usb/dwc2/gadget.c
index 6812a8a3a98b..6ac850d6ad44 100644
--- a/drivers/usb/dwc2/gadget.c
+++ b/drivers/usb/dwc2/gadget.c
@@ -5073,6 +5073,7 @@ void dwc2_gadget_init_lpm(struct dwc2_hsotg *hsotg)
 	val |= hsotg->params.lpm_clock_gating ? GLPMCFG_ENBLSLPM : 0;
 	val |= hsotg->params.hird_threshold << GLPMCFG_HIRD_THRES_SHIFT;
 	val |= hsotg->params.besl ? GLPMCFG_ENBESL : 0;
+	val |= GLPMCFG_LPM_REJECT_CTRL_CONTROL;
 	val |= GLPMCFG_LPM_ACCEPT_CTRL_ISOC;
 	dwc2_writel(hsotg, val, GLPMCFG);
 	dev_dbg(hsotg->dev, "GLPMCFG=0x%08x\n", dwc2_readl(hsotg, GLPMCFG));
diff --git a/drivers/usb/dwc2/hw.h b/drivers/usb/dwc2/hw.h
index 98af924a9a5c..1bc394dcfa9d 100644
--- a/drivers/usb/dwc2/hw.h
+++ b/drivers/usb/dwc2/hw.h
@@ -333,7 +333,7 @@
 #define GLPMCFG_SNDLPM			BIT(24)
 #define GLPMCFG_RETRY_CNT_MASK		(0x7 << 21)
 #define GLPMCFG_RETRY_CNT_SHIFT		21
-#define GLPMCFG_LPM_ACCEPT_CTRL_CONTROL	BIT(21)
+#define GLPMCFG_LPM_REJECT_CTRL_CONTROL	BIT(21)
 #define GLPMCFG_LPM_ACCEPT_CTRL_ISOC	BIT(22)
 #define GLPMCFG_LPM_CHNL_INDX_MASK	(0xf << 17)
 #define GLPMCFG_LPM_CHNL_INDX_SHIFT	17
-- 
2.11.0


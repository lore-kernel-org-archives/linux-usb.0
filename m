Return-Path: <SRS0=ZUM+=46=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59ACFC10DCE
	for <linux-usb@archiver.kernel.org>; Fri, 13 Mar 2020 02:18:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 30508206E7
	for <linux-usb@archiver.kernel.org>; Fri, 13 Mar 2020 02:18:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="N2xr6p4V"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726310AbgCMCSn (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Thu, 12 Mar 2020 22:18:43 -0400
Received: from smtprelay-out1.synopsys.com ([149.117.87.133]:59752 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726114AbgCMCSn (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 12 Mar 2020 22:18:43 -0400
Received: from mailhost.synopsys.com (sv1-mailhost2.synopsys.com [10.205.2.132])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id B9E43C0F90;
        Fri, 13 Mar 2020 02:18:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1584065923; bh=zw1X5llw0DSrO2sR715wcLRGbpkntFZELb5bvipEvkY=;
        h=Date:In-Reply-To:References:From:Subject:To:Cc:From;
        b=N2xr6p4VLN2FUDOmMnkrUx7i873VALbE3m5jw0uO1w5GpORUayNllGj5DbLvWSbo2
         lE0G95y0R1yBDmefz0g4AZqBLnaU/aYHx8o5ZwiQHyl+fQ7BSEq4U9h5pyGMyZohmq
         KMttujOYJEQWLW1zhGLCnkAeZqljk6FuyymtESXU66hs7iW+vPNswKAPI51F+Io68p
         MHFzoqvFO3br6gYi7ofMTDc68uYOP3KBFTASOK2+ZW+OxPGi5jgu8xYc9rgY/hdEwI
         0ySfokPKbprUKwUxFfwJ9TY3Zr8Fxx/yyYjEJIEJuuWehCNffvhv1G+PQ2AIXVPw9w
         pdEtwhydK5dTQ==
Received: from te-lab16 (nanobot.internal.synopsys.com [10.10.186.99])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPSA id 45C3FA0079;
        Fri, 13 Mar 2020 02:18:41 +0000 (UTC)
Received: by te-lab16 (sSMTP sendmail emulation); Thu, 12 Mar 2020 19:18:41 -0700
Date:   Thu, 12 Mar 2020 19:18:41 -0700
Message-Id: <ba8d30c4ff98388f62842ad1d0561ad7304ed380.1584065705.git.thinhn@synopsys.com>
In-Reply-To: <cover.1584065705.git.thinhn@synopsys.com>
References: <cover.1584065705.git.thinhn@synopsys.com>
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Subject: [PATCH 2/3] ute: dwc3: gadget: Store resource index of start cmd
To:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        linux-usb@vger.kernel.org
Cc:     John Youn <John.Youn@synopsys.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

As long as the START_TRANSFER command completes, it provides the
resource index of the endpoint. Use this when we need to issue
END_TRANSFER command to an isoc endpoint to retry with a new
XferNotReady event.

Signed-off-by: Thinh Nguyen <thinhn@synopsys.com>
---
 drivers/usb/dwc3/gadget.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/dwc3/gadget.c b/drivers/usb/dwc3/gadget.c
index 4cb7f9329657..f1aae4615cf1 100644
--- a/drivers/usb/dwc3/gadget.c
+++ b/drivers/usb/dwc3/gadget.c
@@ -387,9 +387,12 @@ int dwc3_send_gadget_ep_cmd(struct dwc3_ep *dep, unsigned cmd,
 
 	trace_dwc3_gadget_ep_cmd(dep, cmd, params, cmd_status);
 
-	if (ret == 0 && DWC3_DEPCMD_CMD(cmd) == DWC3_DEPCMD_STARTTRANSFER) {
-		dep->flags |= DWC3_EP_TRANSFER_STARTED;
-		dwc3_gadget_ep_get_transfer_index(dep);
+	if (DWC3_DEPCMD_CMD(cmd) == DWC3_DEPCMD_STARTTRANSFER) {
+		if (ret == 0)
+			dep->flags |= DWC3_EP_TRANSFER_STARTED;
+
+		if (ret != -ETIMEDOUT)
+			dwc3_gadget_ep_get_transfer_index(dep);
 	}
 
 	if (saved_config) {
-- 
2.11.0


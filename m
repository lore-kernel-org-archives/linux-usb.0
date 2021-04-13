Return-Path: <linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77204C433ED
	for <linux-usb@archiver.kernel.org>; Tue, 13 Apr 2021 03:00:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 49C47613AA
	for <linux-usb@archiver.kernel.org>; Tue, 13 Apr 2021 03:00:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241746AbhDMDBH (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Mon, 12 Apr 2021 23:01:07 -0400
Received: from smtprelay-out1.synopsys.com ([149.117.87.133]:51416 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S237380AbhDMDBG (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 12 Apr 2021 23:01:06 -0400
Received: from mailhost.synopsys.com (sv2-mailhost2.synopsys.com [10.205.2.134])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 87F8EC00BB;
        Tue, 13 Apr 2021 03:00:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1618282847; bh=fExnLD5+WUVWRgBBFNhlw+m4QXLOws48nNfTO00NmNw=;
        h=Date:From:Subject:To:Cc:From;
        b=f65zUfloJU46YaYSCWAxhRsMWTv23i7G6kmRakCIxZfGUN1M7+0jms3YfQE2Rv8Zu
         jXigu9LCbyz+qRtkoYb9YLGTDNFziC4OERhKMHbs7feEWtjCWeQ9HuxGrnKzoeNLLt
         RSjjho64t5rXeri821PefZ33/fCV43+dOHwNFJLqUuATB649wt8TPfL4h0FnvEmPIo
         HrRsjBCmTHtuqfN3/FnmILtOvqJGUv5cYs1QH3DuRwAVCLUlRJATEp7S6kxwfAaK7S
         t9rJvdgmQhce7F8eTi7rzYspHZp40Fah8UQa22ekYzYLW9Yl9jLlH10EosL3e8Q8yS
         lKX+C6l9NcC3g==
Received: from lab-vbox (unknown [10.205.136.177])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPSA id DC5E4A0096;
        Tue, 13 Apr 2021 03:00:45 +0000 (UTC)
Received: by lab-vbox (sSMTP sendmail emulation); Mon, 12 Apr 2021 20:00:45 -0700
Date:   Mon, 12 Apr 2021 20:00:45 -0700
Message-Id: <097ba9e104c143f7ba0195ebff29390ec3043692.1618282705.git.Thinh.Nguyen@synopsys.com>
X-SNPS-Relay: synopsys.com
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Subject: [PATCH] usb: dwc3: gadget: Ignore Packet Pending bit
To:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org
Cc:     John Youn <John.Youn@synopsys.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Currently the controller handles single stream only. So, Ignore Packet
Pending bit for stream selection and don't search for another stream if
the host sends Data Packet with PP=0 (for OUT direction) or ACK with
NumP=0 and PP=0 (for IN direction). This slightly improves the stream
performance.

Signed-off-by: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
---
 drivers/usb/dwc3/core.h   |  1 +
 drivers/usb/dwc3/gadget.c | 11 +++++++++++
 2 files changed, 12 insertions(+)

diff --git a/drivers/usb/dwc3/core.h b/drivers/usb/dwc3/core.h
index 6e9abfbccaa6..5a9b56b744c5 100644
--- a/drivers/usb/dwc3/core.h
+++ b/drivers/usb/dwc3/core.h
@@ -403,6 +403,7 @@
 #define DWC3_DCFG_NUMP(n)	(((n) >> DWC3_DCFG_NUMP_SHIFT) & 0x1f)
 #define DWC3_DCFG_NUMP_MASK	(0x1f << DWC3_DCFG_NUMP_SHIFT)
 #define DWC3_DCFG_LPM_CAP	BIT(22)
+#define DWC3_DCFG_IGNSTRMPP	BIT(23)
 
 /* Device Control Register */
 #define DWC3_DCTL_RUN_STOP	BIT(31)
diff --git a/drivers/usb/dwc3/gadget.c b/drivers/usb/dwc3/gadget.c
index e1b04c976da5..ec7aabba962d 100644
--- a/drivers/usb/dwc3/gadget.c
+++ b/drivers/usb/dwc3/gadget.c
@@ -2399,6 +2399,17 @@ static int __dwc3_gadget_start(struct dwc3 *dwc)
 
 	dwc3_gadget_setup_nump(dwc);
 
+	/*
+	 * Currently the controller handles single stream only. So, Ignore
+	 * Packet Pending bit for stream selection and don't search for another
+	 * stream if the host sends Data Packet with PP=0 (for OUT direction) or
+	 * ACK with NumP=0 and PP=0 (for IN direction). This slightly improves
+	 * the stream performance.
+	 */
+	reg = dwc3_readl(dwc->regs, DWC3_DCFG);
+	reg |= DWC3_DCFG_IGNSTRMPP;
+	dwc3_writel(dwc->regs, DWC3_DCFG, reg);
+
 	/* Start with SuperSpeed Default */
 	dwc3_gadget_ep0_desc.wMaxPacketSize = cpu_to_le16(512);
 

base-commit: 9bc46a12c53d8268392774172742aa9e5dd6953d
-- 
2.28.0


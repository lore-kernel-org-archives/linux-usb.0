Return-Path: <SRS0=WMKl=S3=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A4D7C43219
	for <linux-usb@archiver.kernel.org>; Thu, 25 Apr 2019 21:02:42 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 5D37E206BF
	for <linux-usb@archiver.kernel.org>; Thu, 25 Apr 2019 21:02:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="hnewcBQ7"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728901AbfDYVCl (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Thu, 25 Apr 2019 17:02:41 -0400
Received: from dc8-smtprelay2.synopsys.com ([198.182.47.102]:59426 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726282AbfDYVCl (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 25 Apr 2019 17:02:41 -0400
Received: from mailhost.synopsys.com (dc2-mailhost2.synopsys.com [10.12.135.162])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 1B399C0B0E;
        Thu, 25 Apr 2019 21:02:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1556226161; bh=MR/Ws/GXBakjQn3nv2u7Emb4kguqdYY365buRLz1EIY=;
        h=Date:In-Reply-To:References:From:Subject:To:CC:From;
        b=hnewcBQ7HRRAIdvvjLpKYHkMwz4P93JCWS+5V26PP+PDL4C3i0WQO33IRoApmcDTg
         5JpH2Ycxjdi7Xn242CQbKT+cXgMeyZch91HdnnO2SLyq1ZjBXy5fqAMtfATqdjcv3k
         Nc9809NIL5wrmubKws5M7tjky55sr16X46dblA/HUGD+2WowkAsZUqFrH/Td0fEV4b
         jeZEdSiXvBc/OxVpalyAaa0s5cRB5M5DyOtz573LVHsPNlP/To919ShAq5ReJeAEhe
         Zc96WK+YzNmcrTiq07QMXP2bPJMcr7DhomJEMW+BTSDu/AB7m4pdCgt/6fo41i4uzq
         fPqdt19Ce64nQ==
Received: from US01WEHTC2.internal.synopsys.com (us01wehtc2.internal.synopsys.com [10.12.239.237])
        (using TLSv1.2 with cipher AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPS id A2A44A0095;
        Thu, 25 Apr 2019 20:55:31 +0000 (UTC)
Received: from US01WEHTC1.internal.synopsys.com (10.12.239.236) by
 US01WEHTC2.internal.synopsys.com (10.12.239.237) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Thu, 25 Apr 2019 13:55:31 -0700
Received: from te-lab16 (10.13.184.19) by us01wehtc1.internal.synopsys.com
 (10.12.239.236) with Microsoft SMTP Server (TLS) id 14.3.408.0; Thu, 25 Apr
 2019 13:55:30 -0700
Received: by te-lab16 (sSMTP sendmail emulation); Thu, 25 Apr 2019 13:55:30
 -0700
Date:   Thu, 25 Apr 2019 13:55:30 -0700
Message-ID:
 <3745c5e48536b2d3e4e04006860ced7dd961dc31.1556224658.git.thinhn@synopsys.com>
In-Reply-To: <63e615de8c5fde68c036f847c65547ce7bf6c45a.1556224658.git.thinhn@synopsys.com>
References: <63e615de8c5fde68c036f847c65547ce7bf6c45a.1556224658.git.thinhn@synopsys.com>
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Subject: [PATCH 2/2] usb: dwc3: Rename DWC3_DCTL_LPM_ERRATA
To:     Felipe Balbi <balbi@kernel.org>
CC:     John Youn <John.Youn@synopsys.com>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        <linux-usb@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-Originating-IP: [10.13.184.19]
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org
Message-ID: <20190425205530.YVCsK8Az0pX_9KBzsclZE8HW6p0RnrLFInG9_S273UE@z>

The macro name DWC3_DCTL_LPM_ERRATA is uninformative and does not do
masking. Remove DWC3_DCTL_LPM_ERRATA_MASK and rename
DWC3_DCTL_LPM_ERRATA to DWC3_DCTL_NYET_THRES with proper masking.

Signed-off-by: Thinh Nguyen <thinhn@synopsys.com>
---
 drivers/usb/dwc3/core.h   | 3 +--
 drivers/usb/dwc3/gadget.c | 2 +-
 2 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/dwc3/core.h b/drivers/usb/dwc3/core.h
index 1528d395b156..f19cbeb01087 100644
--- a/drivers/usb/dwc3/core.h
+++ b/drivers/usb/dwc3/core.h
@@ -406,8 +406,7 @@
 #define DWC3_DCTL_TRGTULST_SS_INACT	(DWC3_DCTL_TRGTULST(6))
 
 /* These apply for core versions 1.94a and later */
-#define DWC3_DCTL_LPM_ERRATA_MASK	DWC3_DCTL_LPM_ERRATA(0xf)
-#define DWC3_DCTL_LPM_ERRATA(n)		((n) << 20)
+#define DWC3_DCTL_NYET_THRES(n)		(((n) & 0xf) << 20)
 
 #define DWC3_DCTL_KEEP_CONNECT		BIT(19)
 #define DWC3_DCTL_L1_HIBER_EN		BIT(18)
diff --git a/drivers/usb/dwc3/gadget.c b/drivers/usb/dwc3/gadget.c
index 2bb0ff9608d3..1d808d15e886 100644
--- a/drivers/usb/dwc3/gadget.c
+++ b/drivers/usb/dwc3/gadget.c
@@ -2863,7 +2863,7 @@ static void dwc3_gadget_conndone_interrupt(struct dwc3 *dwc)
 				"LPM Erratum not available on dwc3 revisions < 2.40a\n");
 
 		if (dwc->has_lpm_erratum && dwc->revision >= DWC3_REVISION_240A)
-			reg |= DWC3_DCTL_LPM_ERRATA(dwc->lpm_nyet_threshold);
+			reg |= DWC3_DCTL_NYET_THRES(dwc->lpm_nyet_threshold);
 
 		dwc3_writel(dwc->regs, DWC3_DCTL, reg);
 	} else {
-- 
2.11.0


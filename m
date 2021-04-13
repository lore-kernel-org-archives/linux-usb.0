Return-Path: <linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8700C433B4
	for <linux-usb@archiver.kernel.org>; Tue, 13 Apr 2021 07:17:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9A511613B7
	for <linux-usb@archiver.kernel.org>; Tue, 13 Apr 2021 07:17:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238725AbhDMHRg (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Tue, 13 Apr 2021 03:17:36 -0400
Received: from smtprelay-out1.synopsys.com ([149.117.73.133]:35734 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S238648AbhDMHRc (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 13 Apr 2021 03:17:32 -0400
Received: from mailhost.synopsys.com (mdc-mailhost1.synopsys.com [10.225.0.209])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 93CFB4023B;
        Tue, 13 Apr 2021 07:17:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1618298233; bh=ZNzirgfDk0tahsaMse8Jr7TxxkjOS5X+oRWpO/khHMQ=;
        h=Date:In-Reply-To:References:From:Subject:To:Cc:From;
        b=StYd+reCcUlS8ifoMp910fF+9Ivk6p6vg/HxIbYYb2eG/QIf6d0qLoxwwa0mOG2gC
         95EUqq0xWhzw+QP9MQrrFCvD55pCac5TL85pUJS7HDp/BTu6PlPpBIvnOFlyYw2GWO
         aS0gkfNB+qDgOGrV4EpvpSOQgOkJgUMubFJ/AxUJdwfkd4RMgydJgHpaE3aI/4dcWu
         R3KtwYkZENFlgtP6Rg+IRGwuuczaids/Xbok411vMx7TFXHb24DQdiYOY7XJ7A5gUV
         UTc+dr2dK92X23yiKPF/3pWKAgYotEehSjjsbutqtfWHXXp8hu/8WIu3IXrC6RgL5u
         zldQIRbGt9yrA==
Received: from razpc-HP (razpc-hp.internal.synopsys.com [10.116.126.207])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPSA id B33AAA022E;
        Tue, 13 Apr 2021 07:17:10 +0000 (UTC)
Received: by razpc-HP (sSMTP sendmail emulation); Tue, 13 Apr 2021 11:17:09 +0400
Date:   Tue, 13 Apr 2021 11:17:09 +0400
Message-Id: <5a43d77dfe4f1da3aca5d42dbc74be3079f4c099.1618297800.git.Arthur.Petrosyan@synopsys.com>
In-Reply-To: <cover.1618297800.git.Arthur.Petrosyan@synopsys.com>
References: <cover.1618297800.git.Arthur.Petrosyan@synopsys.com>
X-SNPS-Relay: synopsys.com
From:   Artur Petrosyan <Arthur.Petrosyan@synopsys.com>
Subject: [PATCH 08/12] usb: dwc2: Update exit clock gating when port is resumed
To:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     John Youn <John.Youn@synopsys.com>,
        Artur Petrosyan <Arthur.Petrosyan@synopsys.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Updates the implementation of exiting clock gating mode
when core receives port resume.
Instead of setting the required bit fields of the registers
inline, called the "dwc2_host_exit_clock_gating()" function.

Signed-off-by: Artur Petrosyan <Arthur.Petrosyan@synopsys.com>
---
 drivers/usb/dwc2/hcd.c | 29 ++++-------------------------
 1 file changed, 4 insertions(+), 25 deletions(-)

diff --git a/drivers/usb/dwc2/hcd.c b/drivers/usb/dwc2/hcd.c
index e1225fe6c61a..8a42675ab94e 100644
--- a/drivers/usb/dwc2/hcd.c
+++ b/drivers/usb/dwc2/hcd.c
@@ -3359,8 +3359,6 @@ int dwc2_port_suspend(struct dwc2_hsotg *hsotg, u16 windex)
 int dwc2_port_resume(struct dwc2_hsotg *hsotg)
 {
 	unsigned long flags;
-	u32 hprt0;
-	u32 pcgctl;
 	int ret = 0;
 
 	spin_lock_irqsave(&hsotg->lock, flags);
@@ -3374,33 +3372,14 @@ int dwc2_port_resume(struct dwc2_hsotg *hsotg)
 		break;
 	case DWC2_POWER_DOWN_PARAM_HIBERNATION:
 	case DWC2_POWER_DOWN_PARAM_NONE:
-	default:
 		/*
-		 * If power_down is supported, Phy clock is already resumed
-		 * after registers restore.
+		 * If not hibernation nor partial power down are supported,
+		 * port resume is done using the clock gating programming flow.
 		 */
-		if (!hsotg->params.power_down) {
-			pcgctl = dwc2_readl(hsotg, PCGCTL);
-			pcgctl &= ~PCGCTL_STOPPCLK;
-			dwc2_writel(hsotg, pcgctl, PCGCTL);
-			spin_unlock_irqrestore(&hsotg->lock, flags);
-			msleep(20);
-			spin_lock_irqsave(&hsotg->lock, flags);
-		}
-
-		hprt0 = dwc2_read_hprt0(hsotg);
-		hprt0 |= HPRT0_RES;
-		hprt0 &= ~HPRT0_SUSP;
-		dwc2_writel(hsotg, hprt0, HPRT0);
 		spin_unlock_irqrestore(&hsotg->lock, flags);
-
-		msleep(USB_RESUME_TIMEOUT);
-
+		dwc2_host_exit_clock_gating(hsotg, 0);
 		spin_lock_irqsave(&hsotg->lock, flags);
-		hprt0 = dwc2_read_hprt0(hsotg);
-		hprt0 &= ~(HPRT0_RES | HPRT0_SUSP);
-		dwc2_writel(hsotg, hprt0, HPRT0);
-		hsotg->bus_suspended = false;
+		break;
 	}
 
 	spin_unlock_irqrestore(&hsotg->lock, flags);
-- 
2.25.1


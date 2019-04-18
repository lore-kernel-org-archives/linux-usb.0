Return-Path: <SRS0=JW0E=SU=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,T_DKIMWL_WL_HIGH,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0BDB3C282DD
	for <linux-usb@archiver.kernel.org>; Thu, 18 Apr 2019 00:15:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id C133A21850
	for <linux-usb@archiver.kernel.org>; Thu, 18 Apr 2019 00:15:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="P3yGxppl"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387638AbfDRAO7 (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Wed, 17 Apr 2019 20:14:59 -0400
Received: from mail-pf1-f195.google.com ([209.85.210.195]:34992 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729331AbfDRAO6 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 17 Apr 2019 20:14:58 -0400
Received: by mail-pf1-f195.google.com with SMTP id t21so242650pfh.2
        for <linux-usb@vger.kernel.org>; Wed, 17 Apr 2019 17:14:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=kqTM4X13zllIwVukxHiG4L+ohv7hFQSZFxL4FXnl0KE=;
        b=P3yGxpplISbbAjyh5feqp9pmKDDhUZ6n4aB2skbFqXMwReC1ufBQbAsj4sCAj4J8er
         IR5cdMUZp8M57uV4tT32Slvzzrm3r3dMK4PTHr0+U7lqtR2mCKQ3YBtQAb1PcJMOTjtx
         ecFK9YRgTFNqcrrg/UnicukR/zopR1waAk/54=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=kqTM4X13zllIwVukxHiG4L+ohv7hFQSZFxL4FXnl0KE=;
        b=SsXRwteewiJGc0b/75wbZE0sDfwLywC4fbKKiYxEv5xEv8Jv7qhhN8mQ5uFZfja+Sy
         ZBAULZp+03hUBJXuU8cKs9kpbCMUwIOidGsaVKlCXSuwLLMkxKH9qwksIQ+Qo8v7ZSDC
         XylYn61gzv0kadrfy2TJiZcJ3tELdjIbA7nQabcyXc0X7CZyakARv1nhhlEI9K6JTH9q
         YIqmFhuKa36EGea9V1YZgLRrLqEuoy3bp7/v5PQ3zRroi/0FEY4J+2wYf1HG0uVr/mo9
         QXGIdlTdr9RPgDScR1O9zcbrDEXfMJnHTdX6HKrCPnk7WC4y7bZ68r9BfOFwwl51vqOn
         PVXA==
X-Gm-Message-State: APjAAAUGKVsOro4yJ+QKJLf+mgvuo48zgKLCQwkaUg8Zsc/J+8Og8CIX
        QbNS+Cf7/AOoZN+w8PxO4LZPyA==
X-Google-Smtp-Source: APXvYqyivasih9sth0BaBOc1OCWFOlMcvZv0okIVjyRZVEgbD74taE1L9rgCQIevhcQzSJ8LltJoPA==
X-Received: by 2002:aa7:884b:: with SMTP id k11mr92680149pfo.49.1555546497634;
        Wed, 17 Apr 2019 17:14:57 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com ([2620:15c:202:1:24fa:e766:52c9:e3b2])
        by smtp.gmail.com with ESMTPSA id q5sm447668pff.97.2019.04.17.17.14.56
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 17 Apr 2019 17:14:57 -0700 (PDT)
From:   Douglas Anderson <dianders@chromium.org>
To:     Minas Harutyunyan <hminas@synopsys.com>,
        Felipe Balbi <felipe.balbi@linux.intel.com>, heiko@sntech.de
Cc:     Alan Stern <stern@rowland.harvard.edu>,
        Artur Petrosyan <Arthur.Petrosyan@synopsys.com>,
        amstan@chromium.org, linux-rockchip@lists.infradead.org,
        William Wu <william.wu@rock-chips.com>,
        linux-usb@vger.kernel.org, Stefan Wahren <stefan.wahren@i2se.com>,
        Randy Li <ayaka@soulik.info>, zyw@rock-chips.com,
        mka@chromium.org, ryandcase@chromium.org,
        Amelie Delaunay <amelie.delaunay@st.com>, jwerner@chromium.org,
        dinguyen@opensource.altera.com,
        Elaine Zhang <zhangqing@rock-chips.com>,
        Douglas Anderson <dianders@chromium.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/5] usb: dwc2: bus suspend/resume for hosts with DWC2_POWER_DOWN_PARAM_NONE
Date:   Wed, 17 Apr 2019 17:13:52 -0700
Message-Id: <20190418001356.124334-2-dianders@chromium.org>
X-Mailer: git-send-email 2.21.0.593.g511ec345e18-goog
In-Reply-To: <20190418001356.124334-1-dianders@chromium.org>
References: <20190418001356.124334-1-dianders@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190418001352.JQzQHO2QIKlI1FP_yX1K_nPu5lLhg0fXnueu_qeQT-s@z>

This is an attempt to rehash commit 0cf884e819e0 ("usb: dwc2: add bus
suspend/resume for dwc2") on ToT.  That commit was reverted in commit
b0bb9bb6ce01 ("Revert "usb: dwc2: add bus suspend/resume for dwc2"")
because apparently it broke the Altera SOCFPGA.

With all the changes that have happened to dwc2 in the meantime, it's
possible that the Altera SOCFPGA will just magically work with this
change now.  ...and it would be good to get bus suspend/resume
implemented.

This change is a forward port of one that's been living in the Chrome
OS 3.14 kernel tree.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---
This patch was last posted at:

https://lkml.kernel.org/r/1446237173-15263-1-git-send-email-dianders@chromium.org

...and appears to have died the death of silence.  Maybe it could get
some bake time in linuxnext if we can't find any proactive testing?

I will also freely admit that I don't know tons about the theory
behind this patch.  I'm mostly just re-hashing the original commit
from Kever that was reverted since:
* Turning on partial power down on rk3288 doesn't "just work".  I
  don't get hotplug events.  This is despite dwc2 auto-detecting that
  we are power optimized.
* If we don't do something like this commit we don't get into as low
  of a power mode.

Changes in v2: None

 drivers/usb/dwc2/hcd.c | 84 ++++++++++++++++++++++++++----------------
 1 file changed, 53 insertions(+), 31 deletions(-)

diff --git a/drivers/usb/dwc2/hcd.c b/drivers/usb/dwc2/hcd.c
index e272d020012e..978232a9e4a8 100644
--- a/drivers/usb/dwc2/hcd.c
+++ b/drivers/usb/dwc2/hcd.c
@@ -4482,6 +4482,7 @@ static int _dwc2_hcd_suspend(struct usb_hcd *hcd)
 	unsigned long flags;
 	int ret = 0;
 	u32 hprt0;
+	u32 pcgctl;
 
 	spin_lock_irqsave(&hsotg->lock, flags);
 
@@ -4497,7 +4498,7 @@ static int _dwc2_hcd_suspend(struct usb_hcd *hcd)
 	if (hsotg->op_state == OTG_STATE_B_PERIPHERAL)
 		goto unlock;
 
-	if (hsotg->params.power_down != DWC2_POWER_DOWN_PARAM_PARTIAL)
+	if (hsotg->params.power_down > DWC2_POWER_DOWN_PARAM_PARTIAL)
 		goto skip_power_saving;
 
 	/*
@@ -4506,21 +4507,35 @@ static int _dwc2_hcd_suspend(struct usb_hcd *hcd)
 	 */
 	if (!hsotg->bus_suspended) {
 		hprt0 = dwc2_read_hprt0(hsotg);
-		hprt0 |= HPRT0_SUSP;
-		hprt0 &= ~HPRT0_PWR;
-		dwc2_writel(hsotg, hprt0, HPRT0);
-		spin_unlock_irqrestore(&hsotg->lock, flags);
-		dwc2_vbus_supply_exit(hsotg);
-		spin_lock_irqsave(&hsotg->lock, flags);
+		if (hprt0 & HPRT0_CONNSTS) {
+			hprt0 |= HPRT0_SUSP;
+			if (hsotg->params.power_down == DWC2_POWER_DOWN_PARAM_PARTIAL)
+				hprt0 &= ~HPRT0_PWR;
+			dwc2_writel(hsotg, hprt0, HPRT0);
+		}
+		if (hsotg->params.power_down == DWC2_POWER_DOWN_PARAM_PARTIAL) {
+			spin_unlock_irqrestore(&hsotg->lock, flags);
+			dwc2_vbus_supply_exit(hsotg);
+			spin_lock_irqsave(&hsotg->lock, flags);
+		} else {
+			pcgctl = readl(hsotg->regs + PCGCTL);
+			pcgctl |= PCGCTL_STOPPCLK;
+			writel(pcgctl, hsotg->regs + PCGCTL);
+		}
 	}
 
-	/* Enter partial_power_down */
-	ret = dwc2_enter_partial_power_down(hsotg);
-	if (ret) {
-		if (ret != -ENOTSUPP)
-			dev_err(hsotg->dev,
-				"enter partial_power_down failed\n");
-		goto skip_power_saving;
+	if (hsotg->params.power_down == DWC2_POWER_DOWN_PARAM_PARTIAL) {
+		/* Enter partial_power_down */
+		ret = dwc2_enter_partial_power_down(hsotg);
+		if (ret) {
+			if (ret != -ENOTSUPP)
+				dev_err(hsotg->dev,
+					"enter partial_power_down failed\n");
+			goto skip_power_saving;
+		}
+
+		/* After entering partial_power_down, hardware is no more accessible */
+		clear_bit(HCD_FLAG_HW_ACCESSIBLE, &hcd->flags);
 	}
 
 	/* Ask phy to be suspended */
@@ -4530,9 +4545,6 @@ static int _dwc2_hcd_suspend(struct usb_hcd *hcd)
 		spin_lock_irqsave(&hsotg->lock, flags);
 	}
 
-	/* After entering partial_power_down, hardware is no more accessible */
-	clear_bit(HCD_FLAG_HW_ACCESSIBLE, &hcd->flags);
-
 skip_power_saving:
 	hsotg->lx_state = DWC2_L2;
 unlock:
@@ -4545,6 +4557,7 @@ static int _dwc2_hcd_resume(struct usb_hcd *hcd)
 {
 	struct dwc2_hsotg *hsotg = dwc2_hcd_to_hsotg(hcd);
 	unsigned long flags;
+	u32 pcgctl;
 	int ret = 0;
 
 	spin_lock_irqsave(&hsotg->lock, flags);
@@ -4555,17 +4568,11 @@ static int _dwc2_hcd_resume(struct usb_hcd *hcd)
 	if (hsotg->lx_state != DWC2_L2)
 		goto unlock;
 
-	if (hsotg->params.power_down != DWC2_POWER_DOWN_PARAM_PARTIAL) {
+	if (hsotg->params.power_down > DWC2_POWER_DOWN_PARAM_PARTIAL) {
 		hsotg->lx_state = DWC2_L0;
 		goto unlock;
 	}
 
-	/*
-	 * Set HW accessible bit before powering on the controller
-	 * since an interrupt may rise.
-	 */
-	set_bit(HCD_FLAG_HW_ACCESSIBLE, &hcd->flags);
-
 	/*
 	 * Enable power if not already done.
 	 * This must not be spinlocked since duration
@@ -4577,10 +4584,23 @@ static int _dwc2_hcd_resume(struct usb_hcd *hcd)
 		spin_lock_irqsave(&hsotg->lock, flags);
 	}
 
-	/* Exit partial_power_down */
-	ret = dwc2_exit_partial_power_down(hsotg, true);
-	if (ret && (ret != -ENOTSUPP))
-		dev_err(hsotg->dev, "exit partial_power_down failed\n");
+	if (hsotg->params.power_down == DWC2_POWER_DOWN_PARAM_PARTIAL) {
+		/*
+		 * Set HW accessible bit before powering on the controller
+		 * since an interrupt may rise.
+		 */
+		set_bit(HCD_FLAG_HW_ACCESSIBLE, &hcd->flags);
+
+
+		/* Exit partial_power_down */
+		ret = dwc2_exit_partial_power_down(hsotg, true);
+		if (ret && (ret != -ENOTSUPP))
+			dev_err(hsotg->dev, "exit partial_power_down failed\n");
+	} else {
+		pcgctl = readl(hsotg->regs + PCGCTL);
+		pcgctl &= ~PCGCTL_STOPPCLK;
+		writel(pcgctl, hsotg->regs + PCGCTL);
+	}
 
 	hsotg->lx_state = DWC2_L0;
 
@@ -4592,10 +4612,12 @@ static int _dwc2_hcd_resume(struct usb_hcd *hcd)
 		spin_unlock_irqrestore(&hsotg->lock, flags);
 		dwc2_port_resume(hsotg);
 	} else {
-		dwc2_vbus_supply_init(hsotg);
+		if (hsotg->params.power_down == DWC2_POWER_DOWN_PARAM_PARTIAL) {
+			dwc2_vbus_supply_init(hsotg);
 
-		/* Wait for controller to correctly update D+/D- level */
-		usleep_range(3000, 5000);
+			/* Wait for controller to correctly update D+/D- level */
+			usleep_range(3000, 5000);
+		}
 
 		/*
 		 * Clear Port Enable and Port Status changes.
-- 
2.21.0.593.g511ec345e18-goog


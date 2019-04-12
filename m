Return-Path: <SRS0=sojL=SO=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C83BEC10F14
	for <linux-usb@archiver.kernel.org>; Fri, 12 Apr 2019 12:37:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 978F22082E
	for <linux-usb@archiver.kernel.org>; Fri, 12 Apr 2019 12:37:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20150623.gappssmtp.com header.i=@bgdev-pl.20150623.gappssmtp.com header.b="ZzNHNCwB"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728355AbfDLMgs (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Fri, 12 Apr 2019 08:36:48 -0400
Received: from mail-wm1-f66.google.com ([209.85.128.66]:39405 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727958AbfDLMgr (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 12 Apr 2019 08:36:47 -0400
Received: by mail-wm1-f66.google.com with SMTP id n25so10821924wmk.4
        for <linux-usb@vger.kernel.org>; Fri, 12 Apr 2019 05:36:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=joOQiQILwSUQpc0pTrHcK/ya5VvWQmcmFsscTsVp5Yw=;
        b=ZzNHNCwB2MHMWsVsm62DVxQ40e64KQJi/5XS/zJI3Rjuz6UiIQiQMIUYlicxAUcMyR
         wRQ2JIBoVs7/ncCvHJ8+S+E26InWJTkutfL6OgVcBXzDapJNRwkL6ud3lxmQO4+sVf4U
         yrD+9EoL68IteFtZqS3XoRyLkBvfZRS5hkK3azO7M0CKgRK+VNnHorMzdE0bDI76P7kf
         SZkyMPqvWdXwelb9aV+hp3POKqHftBQGR1+CLlP3EWsRrn86DrGUe2IkOYctdhH88lEH
         Sg149a9nAHReBS9/uCKfoRyPgwqhxf4H+pCB/ty922D4QH/Nt4/GLMfK1INdKe7RXtD5
         xnPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=joOQiQILwSUQpc0pTrHcK/ya5VvWQmcmFsscTsVp5Yw=;
        b=cpkU3I0vA8+9aF6WG2eLJXmWTBbErh0n0Gx6PWilHVuw1Rmjja/yjI5eRlUC0vBylz
         Qg82RPsNElhuxWR5PdOju5CYVEYzIMt+PRcGqWnOycBb2pAEkxVX5ISlAhFzakGME2WZ
         6uM4QJCuCHwtwue8z8cJpr2rJdVVQ+BhZaLNV1C6xKc2LTTXTde0KvPpLsSr8WUZ289s
         9FuTJSiUlT7iFwBugj+WOQqDmAKeBO5D7BzhrDZvmveHlUlIb5k9ME8zldc4fahh+O1b
         jelkMTfv66p8BL1cAzR5ZJmTWRJLs4cVmrZ1+8aabUJb+jG3G626LENesNupqNjTiz1+
         /zJQ==
X-Gm-Message-State: APjAAAXVxDgRHsOS91R4Hy2QBKPnTR2KIGlh/cucB+AMMidHMq86YnFh
        +Lk5YOgy62+iuC4wMkmQH0yZ0Q==
X-Google-Smtp-Source: APXvYqyElSWkpRR37KwhB8kBDZhyovKNUnSkJGF/0UvOx0kMpkjnAmtwpkNmPmgtdNBA9lHMZWqVSg==
X-Received: by 2002:a1c:1a4d:: with SMTP id a74mr11089006wma.50.1555072605753;
        Fri, 12 Apr 2019 05:36:45 -0700 (PDT)
Received: from localhost.localdomain (aputeaux-684-1-35-248.w90-86.abo.wanadoo.fr. [90.86.90.248])
        by smtp.gmail.com with ESMTPSA id v190sm12384030wme.18.2019.04.12.05.36.44
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 12 Apr 2019 05:36:45 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Sekhar Nori <nsekhar@ti.com>, Kevin Hilman <khilman@kernel.org>,
        Alan Stern <stern@rowland.harvard.edu>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH v5 2/6] usb: ohci-da8xx: let the regulator framework keep track of use count
Date:   Fri, 12 Apr 2019 14:36:36 +0200
Message-Id: <20190412123640.11437-3-brgl@bgdev.pl>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190412123640.11437-1-brgl@bgdev.pl>
References: <20190412123640.11437-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190412123636.BrP59Va1gybAYDNHe2FW4adJl6Gw7BBAywNs_JxKJzA@z>

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

There's no reason to have a separate variable to keep track of the
regulator state. The regulator core already does that. Remove
reg_enabled from struct da8xx_ohci_hcd.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Acked-by: Alan Stern <stern@rowland.harvard.edu>
---
 drivers/usb/host/ohci-da8xx.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/usb/host/ohci-da8xx.c b/drivers/usb/host/ohci-da8xx.c
index ca8a94f15ac0..209a262b5565 100644
--- a/drivers/usb/host/ohci-da8xx.c
+++ b/drivers/usb/host/ohci-da8xx.c
@@ -40,7 +40,6 @@ struct da8xx_ohci_hcd {
 	struct phy *usb11_phy;
 	struct regulator *vbus_reg;
 	struct notifier_block nb;
-	unsigned int reg_enabled;
 	struct gpio_desc *vbus_gpio;
 	struct gpio_desc *oc_gpio;
 };
@@ -100,21 +99,18 @@ static int ohci_da8xx_set_power(struct usb_hcd *hcd, int on)
 	if (!da8xx_ohci->vbus_reg)
 		return 0;
 
-	if (on && !da8xx_ohci->reg_enabled) {
+	if (on) {
 		ret = regulator_enable(da8xx_ohci->vbus_reg);
 		if (ret) {
 			dev_err(dev, "Failed to enable regulator: %d\n", ret);
 			return ret;
 		}
-		da8xx_ohci->reg_enabled = 1;
-
-	} else if (!on && da8xx_ohci->reg_enabled) {
+	} else {
 		ret = regulator_disable(da8xx_ohci->vbus_reg);
 		if (ret) {
 			dev_err(dev, "Failed  to disable regulator: %d\n", ret);
 			return ret;
 		}
-		da8xx_ohci->reg_enabled = 0;
 	}
 
 	return 0;
-- 
2.21.0


Return-Path: <SRS0=+Ncr=SL=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5696C282CE
	for <linux-usb@archiver.kernel.org>; Tue,  9 Apr 2019 08:29:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 7170B20883
	for <linux-usb@archiver.kernel.org>; Tue,  9 Apr 2019 08:29:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20150623.gappssmtp.com header.i=@bgdev-pl.20150623.gappssmtp.com header.b="bXDBK1K3"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726735AbfDII3k (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Tue, 9 Apr 2019 04:29:40 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:36606 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726001AbfDII3E (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 9 Apr 2019 04:29:04 -0400
Received: by mail-wr1-f66.google.com with SMTP id y13so19673550wrd.3
        for <linux-usb@vger.kernel.org>; Tue, 09 Apr 2019 01:29:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=15DBa0EnjSNcBoiq7HFAstm0qdeH35lSsLh5PK7xiEg=;
        b=bXDBK1K3t0svttcv9jzP3GIIt6Gp35JiLi41MrbUFQno0+Nwszgq72uurXsqJCPFih
         7NoFGvr5wge0VotCbiKB8m3QEx4gHpEbKZM2dHNoYU/Dr5IoPU6yi9LXmupyBgEVngXG
         gM4LxsrTetEPUwDc0RJeWTi+sHs5558quvMOyPfzZNDb8VuLqVYvrOwyQYiKyXbbcJRX
         +He54ul9Me+HdbYUxs3A+mxGc3OmFf26gMDggJ9fAFKtwaQOjCzLKloZtWaHByBF96An
         6Pt+WyQpaVDzCn3t5vBcQVQDxjIZR+OTujyWQp5IFr9ZgfZ52c6DmoWQjF5L+Sa3fG/j
         2OMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=15DBa0EnjSNcBoiq7HFAstm0qdeH35lSsLh5PK7xiEg=;
        b=Byn3azoOis7L8z7E+Xv8S7GeS3VS2QjH0eC98rn9B+/Fr+rrPXgqnMtt/tWYkZ+11j
         b6W4nCDFrKxZpn2hgK4a46BuJYjfVLE5x/k4H0qkDJ5BmaKIoe6/F4v8yBZ9B3zUVnBO
         GFmTyYaMHHI0Ru1hpr1nwXuPhEkrt5yoTvpMJh6gMzLVOvN4DeKRwsyWW/kKFdiDQiBN
         Dtie2TvhgpMS06tYFKb8v8N4bA4ErYiaRMp1/xKPMmamFGbkSxHNv9e9vRHp+mL6Aa0R
         zFXwuGQ+cAuOO9BoqFRj0DDSRNKBm/nf5NC4+Akz2QL0Hb1TXESpe1jFTcQcA+fIJCTl
         ntVA==
X-Gm-Message-State: APjAAAUbK5Nr/dRqGbN2f/EqyQucantPVZMad2BOjhfsIdZCrN81runN
        t0JFO0EdgNHXtOs0jVqEMlV9Gg==
X-Google-Smtp-Source: APXvYqyEihnGv12APLf6JtqE+drrm3qzq2sqhdNZtGeoavhnovnlsL84rkYx2+L4c0gMbIkVC8NbvQ==
X-Received: by 2002:adf:cf0e:: with SMTP id o14mr21087198wrj.182.1554798542702;
        Tue, 09 Apr 2019 01:29:02 -0700 (PDT)
Received: from debian-brgl.home ([2a01:cb1d:af:5b00:6d6c:8493:1ab5:dad7])
        by smtp.gmail.com with ESMTPSA id c20sm59968651wre.28.2019.04.09.01.29.01
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 09 Apr 2019 01:29:02 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Sekhar Nori <nsekhar@ti.com>, Kevin Hilman <khilman@kernel.org>,
        Alan Stern <stern@rowland.harvard.edu>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH v3 2/6] usb: ohci-da8xx: let the regulator framework keep track of use count
Date:   Tue,  9 Apr 2019 10:28:51 +0200
Message-Id: <20190409082855.15373-3-brgl@bgdev.pl>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190409082855.15373-1-brgl@bgdev.pl>
References: <20190409082855.15373-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190409082851.gntEZstg9vbO5VCk4qvL5upeQ1vq4m01oVhlxNipHuI@z>

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
index ca8a94f15ac0..9c6d1f03b871 100644
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
+	} else if (!on) {
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


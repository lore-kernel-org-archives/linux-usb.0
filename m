Return-Path: <SRS0=wl2X=77=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77680C433DF
	for <linux-usb@archiver.kernel.org>; Thu, 18 Jun 2020 02:42:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5901421534
	for <linux-usb@archiver.kernel.org>; Thu, 18 Jun 2020 02:42:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1592448175;
	bh=b81sBAbK71A81s+WrFLaLjIoRHBsG4x73nqY5oFinc4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-ID:From;
	b=MKx3BcKCkGwLc6cpoK9z1GGV78VwymJ+qVA5zvy9nWtfek6hO3ZiibGWdtChg9tAK
	 dkkx/9xjHXfBzs5jlIxmj7d1Z/K+YnYDrRzepoltGTM9yv5oFSlupg5HHZm+/TXhay
	 SGbl1qqS/572BB/cQWH3zycqBXHpf3bmPpdSnFJA=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387857AbgFRCmx (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Wed, 17 Jun 2020 22:42:53 -0400
Received: from mail.kernel.org ([198.145.29.99]:39880 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727073AbgFRBLr (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 17 Jun 2020 21:11:47 -0400
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net [73.47.72.35])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 73BAA21D90;
        Thu, 18 Jun 2020 01:11:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1592442707;
        bh=b81sBAbK71A81s+WrFLaLjIoRHBsG4x73nqY5oFinc4=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=rylOHO3IypF9HJHgRFmxOUWNjhoSL9PE+QrN1xiJzrf+28O+esFi2Bwd0NYucxa3R
         WMP+p7OgKn6c4HpllCl5RCPKr8c+wsMVyCxU8LiE2c0ThWOYepAmRAxtRwP2XGN6gh
         hFhCvJGXebvhc9u7jSEU4bnvOugM78GQRS+oMygw=
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Neil Armstrong <narmstrong@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Felipe Balbi <balbi@kernel.org>,
        Sasha Levin <sashal@kernel.org>, linux-usb@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org
Subject: [PATCH AUTOSEL 5.7 168/388] usb: dwc3: meson-g12a: check return of dwc3_meson_g12a_usb_init
Date:   Wed, 17 Jun 2020 21:04:25 -0400
Message-Id: <20200618010805.600873-168-sashal@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200618010805.600873-1-sashal@kernel.org>
References: <20200618010805.600873-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Neil Armstrong <narmstrong@baylibre.com>

[ Upstream commit 8f5bc1ec770c2bdc8c604ba4119a77d81d8f3529 ]

The dwc3_meson_g12a_usb_init function can return an error, check it.

Fixes: c99993376f72ca ("usb: dwc3: Add Amlogic G12A DWC3 glue")
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
Signed-off-by: Felipe Balbi <balbi@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/usb/dwc3/dwc3-meson-g12a.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/dwc3/dwc3-meson-g12a.c b/drivers/usb/dwc3/dwc3-meson-g12a.c
index b81d085bc534..2d257bdfe848 100644
--- a/drivers/usb/dwc3/dwc3-meson-g12a.c
+++ b/drivers/usb/dwc3/dwc3-meson-g12a.c
@@ -525,7 +525,9 @@ static int dwc3_meson_g12a_probe(struct platform_device *pdev)
 	/* Get dr_mode */
 	priv->otg_mode = usb_get_dr_mode(dev);
 
-	dwc3_meson_g12a_usb_init(priv);
+	ret = dwc3_meson_g12a_usb_init(priv);
+	if (ret)
+		goto err_disable_clks;
 
 	/* Init PHYs */
 	for (i = 0 ; i < PHY_COUNT ; ++i) {
-- 
2.25.1


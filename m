Return-Path: <SRS0=ET2A=BX=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 368B1C433E1
	for <linux-usb@archiver.kernel.org>; Thu, 13 Aug 2020 06:25:42 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 13C2F20838
	for <linux-usb@archiver.kernel.org>; Thu, 13 Aug 2020 06:25:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1597299942;
	bh=F6Hq+Pw4hBESaieLvWZYuv4PWYb+f/+tucoraQQDCCo=;
	h=From:To:Cc:Subject:Date:List-ID:From;
	b=xJ+n+aaasJZYZE8UXiM0ILZO9D6TdTJ4GG0Ox1J+BgaYVcySWJAwZkjWJBJqHmr97
	 FeXa/A3gLtDuFtqCbbddA6MiqAKpzpMUNIWpNfLoZSXNvJawMugukrz0fE0xHYGjxN
	 TV452wgvzr1GOg6bdJjVvi2StneJ0Ri+9Fb/G0JA=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726102AbgHMGZl (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Thu, 13 Aug 2020 02:25:41 -0400
Received: from mail.kernel.org ([198.145.29.99]:37962 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725964AbgHMGZj (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 13 Aug 2020 02:25:39 -0400
Received: from saruman.elisa-laajakaista.fi (unknown [194.34.132.57])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 6ED94206B5;
        Thu, 13 Aug 2020 06:25:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1597299939;
        bh=F6Hq+Pw4hBESaieLvWZYuv4PWYb+f/+tucoraQQDCCo=;
        h=From:To:Cc:Subject:Date:From;
        b=2JYrMe9jBJevSZPBQTLwr9Dw9n50xS4s9xKDR9grdeFJG7aS+RwAeh1+p4BZ6f9m7
         VtlLSHlInvK5bn6jrAe02ta0I/SiqTgy1rup4WV0ujXKUC3YKUzFJzgVvuixMShxJ3
         tew6tfI+xRyiMLhuorciHKyoPcUYVIjVGdD+pxWE=
From:   balbi@kernel.org
To:     Linux USB <linux-usb@vger.kernel.org>
Cc:     Felipe Balbi <balbi@kernel.org>
Subject: [PATCH 01/11] dwc3: meson: fix coccinelle WARNING
Date:   Thu, 13 Aug 2020 09:25:22 +0300
Message-Id: <20200813062532.829720-1-balbi@kernel.org>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Felipe Balbi <balbi@kernel.org>

Coccinelle suggests using PTR_ERR_OR_ZERO().

Signed-off-by: Felipe Balbi <balbi@kernel.org>
---
 drivers/usb/dwc3/dwc3-meson-g12a.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/usb/dwc3/dwc3-meson-g12a.c b/drivers/usb/dwc3/dwc3-meson-g12a.c
index 88b75b5a039c..9c50a8f2929e 100644
--- a/drivers/usb/dwc3/dwc3-meson-g12a.c
+++ b/drivers/usb/dwc3/dwc3-meson-g12a.c
@@ -626,10 +626,7 @@ static int dwc3_meson_gxl_setup_regmaps(struct dwc3_meson_g12a *priv,
 	/* GXL controls the PHY mode in the PHY registers unlike G12A */
 	priv->usb_glue_regmap = devm_regmap_init_mmio(priv->dev, base,
 					&phy_meson_g12a_usb_glue_regmap_conf);
-	if (IS_ERR(priv->usb_glue_regmap))
-		return PTR_ERR(priv->usb_glue_regmap);
-
-	return 0;
+	return PTR_ERR_OR_ZERO(priv->usb_glue_regmap);
 }
 
 static int dwc3_meson_g12a_setup_regmaps(struct dwc3_meson_g12a *priv,
-- 
2.28.0


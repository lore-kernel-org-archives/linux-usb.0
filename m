Return-Path: <SRS0=omxl=CJ=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75B6EC433E6
	for <linux-usb@archiver.kernel.org>; Mon, 31 Aug 2020 13:56:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4B4C4208A9
	for <linux-usb@archiver.kernel.org>; Mon, 31 Aug 2020 13:56:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=geanix.com header.i=@geanix.com header.b="IPIVvu+r"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727061AbgHaN4C (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Mon, 31 Aug 2020 09:56:02 -0400
Received: from first.geanix.com ([116.203.34.67]:50450 "EHLO first.geanix.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726292AbgHaN4A (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 31 Aug 2020 09:56:00 -0400
Received: from localhost (80-62-117-118-mobile.dk.customer.tdc.net [80.62.117.118])
        by first.geanix.com (Postfix) with ESMTPSA id 4D2B5F0162A;
        Mon, 31 Aug 2020 13:55:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=geanix.com; s=first;
        t=1598882158; bh=hloxyjVzWkBFR4VjurEkgyBUw4qCrAGrQew0SZ67KXE=;
        h=From:To:Cc:Subject:Date;
        b=IPIVvu+rDz0c3jO//TPF+lVd0yAfG8qtV33U7D3UPlYkr3cC7cpjEZRP/D3T/vYM/
         hxl5UHKvZ6DCZceiH8luyCNtgpkGiTEHloZdzLbCbCePfFDabpJ94ncX2x4SM1coY8
         FIGe5rHxMz51r9xN5NMzM4oEFuwdzaMqbiqhaxcavvxAUCTdSshGrn8ggYCAss1k2i
         cd7AG6NyCy1VNny1PlclVVcEqGMKDH38eKiCWemRKyxTBKvaY3rOlrHr+I3/vuu363
         FZvhKBdYWsSYlGjRxvkLSY45ZdTRrjPZW+yU2lXcFhy9l0z7q4sxRsW/Y7kdpZXj97
         ss3VnMANQnhAA==
From:   Esben Haabendal <esben@geanix.com>
To:     linux-usb@vger.kernel.org, Bin Liu <b-liu@ti.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Alexandre Bailon <abailon@baylibre.com>
Subject: [PATCH] usb: musb: Fix use without CPPI 4.1 DMA controller on DA8xx
Date:   Mon, 31 Aug 2020 15:55:57 +0200
Message-Id: <570852f0a8c9f1a778e666a26f55b9b9186182f0.1598882094.git.esben@geanix.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

In d6299b6efbf6 ("usb: musb: Add support of CPPI 4.1 DMA controller to
DA8xx") use of musb on da8xx without CPPI 4.1 DMA was broken.

Fixes: d6299b6efbf6 ("usb: musb: Add support of CPPI 4.1 DMA controller to DA8xx")
Signed-off-by: Esben Haabendal <esben@geanix.com>
---
 drivers/usb/musb/da8xx.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/musb/da8xx.c b/drivers/usb/musb/da8xx.c
index 1c023c0091c4..48b8c5d5f0bc 100644
--- a/drivers/usb/musb/da8xx.c
+++ b/drivers/usb/musb/da8xx.c
@@ -467,7 +467,10 @@ da8xx_dma_controller_create(struct musb *musb, void __iomem *base)
 
 static const struct musb_platform_ops da8xx_ops = {
 	.quirks		= MUSB_INDEXED_EP | MUSB_PRESERVE_SESSION |
-			  MUSB_DMA_CPPI41 | MUSB_DA8XX,
+#ifdef CONFIG_USB_TI_CPPI41_DMA
+			  MUSB_DMA_CPPI41 |
+#endif
+			  MUSB_DA8XX,
 	.init		= da8xx_musb_init,
 	.exit		= da8xx_musb_exit,
 
@@ -553,10 +556,12 @@ static int da8xx_probe(struct platform_device *pdev)
 	}
 	platform_set_drvdata(pdev, glue);
 
+#ifdef CONFIG_USB_TI_CPPI41_DMA
 	ret = of_platform_populate(pdev->dev.of_node, NULL,
 				   da8xx_auxdata_lookup, &pdev->dev);
 	if (ret)
 		return ret;
+#endif
 
 	memset(musb_resources, 0x00, sizeof(*musb_resources) *
 			ARRAY_SIZE(musb_resources));
-- 
2.28.0


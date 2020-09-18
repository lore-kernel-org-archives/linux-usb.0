Return-Path: <SRS0=N1Cw=C3=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E283C43465
	for <linux-usb@archiver.kernel.org>; Fri, 18 Sep 2020 02:16:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0F99F239D1
	for <linux-usb@archiver.kernel.org>; Fri, 18 Sep 2020 02:16:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1600395397;
	bh=sEnncAE7swknYM9ucIJ06y04dkrQWy4QGw1RueM3EMs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-ID:From;
	b=RSzfrx/v26UpccUPg2Pn5UDFTHYi3AgIdQM+NJllYxSqB6GaJz0kREi5HC7p7wLZ3
	 2pHGwWsI2yNgwTkd/w7GDyha+1y5wUqXBidswC2gq3F1WqO710x3Op69HPRWT9SFgb
	 70P8NjwLeKxciRWVHN5pv0AoCKeGZPAnzaI83h1k=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729400AbgIRCQZ (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Thu, 17 Sep 2020 22:16:25 -0400
Received: from mail.kernel.org ([198.145.29.99]:45986 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729390AbgIRCQV (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 17 Sep 2020 22:16:21 -0400
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net [73.47.72.35])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 5360923772;
        Fri, 18 Sep 2020 02:16:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1600395381;
        bh=sEnncAE7swknYM9ucIJ06y04dkrQWy4QGw1RueM3EMs=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Y0rscZV2ICOPv6aoGN5fmTYPKjF/F7z6710BVeoFZhxBCI8ZVxmAJmifLMpYo+VUt
         rySFLSdABv/Bn6r3EhmWH93BCZopIUUSifAiFo1PvlnSiKayxH2rwNyrtTFiWOZAEz
         eOPQvoeegaq2J8kwo5J6GACIowpcavhbd9efru88=
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Tang Bin <tangbin@cmss.chinamobile.com>,
        Zhang Shengju <zhangshengju@cmss.chinamobile.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Sasha Levin <sashal@kernel.org>, linux-usb@vger.kernel.org
Subject: [PATCH AUTOSEL 4.9 72/90] USB: EHCI: ehci-mv: fix error handling in mv_ehci_probe()
Date:   Thu, 17 Sep 2020 22:14:37 -0400
Message-Id: <20200918021455.2067301-72-sashal@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200918021455.2067301-1-sashal@kernel.org>
References: <20200918021455.2067301-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Tang Bin <tangbin@cmss.chinamobile.com>

[ Upstream commit c856b4b0fdb5044bca4c0acf9a66f3b5cc01a37a ]

If the function platform_get_irq() failed, the negative value
returned will not be detected here. So fix error handling in
mv_ehci_probe(). And when get irq failed, the function
platform_get_irq() logs an error message, so remove redundant
message here.

Signed-off-by: Zhang Shengju <zhangshengju@cmss.chinamobile.com>
Signed-off-by: Tang Bin <tangbin@cmss.chinamobile.com>
Link: https://lore.kernel.org/r/20200508114305.15740-1-tangbin@cmss.chinamobile.com
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/usb/host/ehci-mv.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/host/ehci-mv.c b/drivers/usb/host/ehci-mv.c
index 849806a75f1ce..273736e1d33fa 100644
--- a/drivers/usb/host/ehci-mv.c
+++ b/drivers/usb/host/ehci-mv.c
@@ -197,9 +197,8 @@ static int mv_ehci_probe(struct platform_device *pdev)
 	hcd->regs = ehci_mv->op_regs;
 
 	hcd->irq = platform_get_irq(pdev, 0);
-	if (!hcd->irq) {
-		dev_err(&pdev->dev, "Cannot get irq.");
-		retval = -ENODEV;
+	if (hcd->irq < 0) {
+		retval = hcd->irq;
 		goto err_disable_clk;
 	}
 
-- 
2.25.1


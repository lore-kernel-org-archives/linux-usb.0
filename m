Return-Path: <SRS0=N1Cw=C3=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0F57C43464
	for <linux-usb@archiver.kernel.org>; Fri, 18 Sep 2020 02:25:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6F44423718
	for <linux-usb@archiver.kernel.org>; Fri, 18 Sep 2020 02:25:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1600395903;
	bh=Qnb7v+IqHLj39Yydb1cSs7Vz5UOoaqF/j5QMD0w0o8Y=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-ID:From;
	b=mUv+axqXOu1jKUnlARM4oN8F1ruXZlCC1U+by0h5bJ7A3Ur5Z1Pvsxco29tXY2RQn
	 7hBJURVsrGwzmqEGeFRlxPJ5a6QL+ouUoqqYcigxb/BDha17jDXK7bMtI599rYWIly
	 zR8dUGWQotAIYU86JykqyTYkStpCyhiGtLZc2Zno=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729785AbgIRCYv (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Thu, 17 Sep 2020 22:24:51 -0400
Received: from mail.kernel.org ([198.145.29.99]:46102 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729405AbgIRCQ0 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 17 Sep 2020 22:16:26 -0400
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net [73.47.72.35])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id AEF3E23600;
        Fri, 18 Sep 2020 02:16:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1600395385;
        bh=Qnb7v+IqHLj39Yydb1cSs7Vz5UOoaqF/j5QMD0w0o8Y=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=G1kDbw6D6TctUvar7MANQK3XawHd/rddSknszMOyz8tM2W0pugqE0T+qGkxrS3zBZ
         TFY44+7GQ49HHHtLRrKExj8c9jv5NTCJ/sGf/TPkE6aiyLIXY3EJ9nMyFCMxS7qFAP
         26xdFCNEsI7u8zdzFjCu5X/lUuF5B7VzeZyuY++w=
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Colin Ian King <colin.king@canonical.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Sasha Levin <sashal@kernel.org>, linux-usb@vger.kernel.org
Subject: [PATCH AUTOSEL 4.9 76/90] USB: EHCI: ehci-mv: fix less than zero comparison of an unsigned int
Date:   Thu, 17 Sep 2020 22:14:41 -0400
Message-Id: <20200918021455.2067301-76-sashal@kernel.org>
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

From: Colin Ian King <colin.king@canonical.com>

[ Upstream commit a7f40c233a6b0540d28743267560df9cfb571ca9 ]

The comparison of hcd->irq to less than zero for an error check will
never be true because hcd->irq is an unsigned int.  Fix this by
assigning the int retval to the return of platform_get_irq and checking
this for the -ve error condition and assigning hcd->irq to retval.

Addresses-Coverity: ("Unsigned compared against 0")
Fixes: c856b4b0fdb5 ("USB: EHCI: ehci-mv: fix error handling in mv_ehci_probe()")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
Link: https://lore.kernel.org/r/20200515165453.104028-1-colin.king@canonical.com
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/usb/host/ehci-mv.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/host/ehci-mv.c b/drivers/usb/host/ehci-mv.c
index 273736e1d33fa..b29610899c9f6 100644
--- a/drivers/usb/host/ehci-mv.c
+++ b/drivers/usb/host/ehci-mv.c
@@ -196,11 +196,10 @@ static int mv_ehci_probe(struct platform_device *pdev)
 	hcd->rsrc_len = resource_size(r);
 	hcd->regs = ehci_mv->op_regs;
 
-	hcd->irq = platform_get_irq(pdev, 0);
-	if (hcd->irq < 0) {
-		retval = hcd->irq;
+	retval = platform_get_irq(pdev, 0);
+	if (retval < 0)
 		goto err_disable_clk;
-	}
+	hcd->irq = retval;
 
 	ehci = hcd_to_ehci(hcd);
 	ehci->caps = (struct ehci_caps *) ehci_mv->cap_regs;
-- 
2.25.1


Return-Path: <linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 940CCC43217
	for <linux-usb@archiver.kernel.org>; Thu, 13 Oct 2022 00:25:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230398AbiJMAZE (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Wed, 12 Oct 2022 20:25:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56092 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231357AbiJMAYV (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 12 Oct 2022 20:24:21 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0E17DAC497;
        Wed, 12 Oct 2022 17:23:50 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id EA29E616D7;
        Thu, 13 Oct 2022 00:23:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8403DC43141;
        Thu, 13 Oct 2022 00:23:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1665620629;
        bh=eeYR1pQLtcJDxO9LFF9+dLExakAoN06GkoHBkN1iWGI=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=WAsrwgh3lD3BOfIGZ3a/mCcZJk4Olo87cWsilTTWlRHQMTeBGpDdwC6NrqEHUfCiT
         rmxZ6bYBpUasETszJcO1oFNwpt5VGpk3hpsRgLuu0MinqaDCleZLxj4lxBVda67Ymz
         j2UBIa4VLaHg5Sch+YyZZ5Gccq/UOJATfHoKhAmSq7Xq/mCDOKI3GweEJiDaPisfOX
         bKZPTpXUUlk2Jlqr90hzOSdu6ieCMrupRfES6Qbr5XF6KX79m1c7eH1hROn9/XeEGO
         36h4gMg/Atg9je9gOnacr2CxqCUz4U1MtZdoZjoX6HXYPNX5+mVq4vSOA6g7xB1ftV
         5DnIC6ggZ4Rjg==
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Justin Chen <justinpopo6@gmail.com>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Sasha Levin <sashal@kernel.org>, mathias.nyman@intel.com,
        linux-usb@vger.kernel.org
Subject: [PATCH AUTOSEL 5.10 05/33] usb: host: xhci-plat: suspend/resume clks for brcm
Date:   Wed, 12 Oct 2022 20:23:04 -0400
Message-Id: <20221013002334.1894749-5-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221013002334.1894749-1-sashal@kernel.org>
References: <20221013002334.1894749-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Justin Chen <justinpopo6@gmail.com>

[ Upstream commit c69400b09e471a3f1167adead55a808f0da6534a ]

The xhci_plat_brcm xhci block can enter suspend with clock disabled to save
power and re-enable them on resume. Make use of the XHCI_SUSPEND_RESUME_CLKS
quirk to do so.

Reviewed-by: Florian Fainelli <f.fainelli@gmail.com>
Signed-off-by: Justin Chen <justinpopo6@gmail.com>
Link: https://lore.kernel.org/r/1660170455-15781-3-git-send-email-justinpopo6@gmail.com
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/usb/host/xhci-plat.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/host/xhci-plat.c b/drivers/usb/host/xhci-plat.c
index 2687662f26b6..972a44b2a7f1 100644
--- a/drivers/usb/host/xhci-plat.c
+++ b/drivers/usb/host/xhci-plat.c
@@ -134,7 +134,7 @@ static const struct xhci_plat_priv xhci_plat_renesas_rcar_gen3 = {
 };
 
 static const struct xhci_plat_priv xhci_plat_brcm = {
-	.quirks = XHCI_RESET_ON_RESUME,
+	.quirks = XHCI_RESET_ON_RESUME | XHCI_SUSPEND_RESUME_CLKS,
 };
 
 static const struct of_device_id usb_xhci_of_match[] = {
-- 
2.35.1


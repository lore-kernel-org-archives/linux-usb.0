Return-Path: <SRS0=RNjJ=WQ=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A140AC3A589
	for <linux-usb@archiver.kernel.org>; Tue, 20 Aug 2019 13:43:33 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 685E322DA7
	for <linux-usb@archiver.kernel.org>; Tue, 20 Aug 2019 13:43:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1566308613;
	bh=XUoIc2KHqVMThX9S+sl+WxBiHhZcXkyJqYSy2y8+sYE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-ID:From;
	b=zHi7rUuF11MaZZSCvHLusiy8kpea/l0X9PvipqdNrOer+9ety7sgqE+OaPriuu4Vv
	 pKcVflpP56p2TJo5/9uRGFYYGyYafv03UTJwjfql5e5FEAhN9MHVAzdiNMlVok8M7Z
	 D2egXp+/WnRed1T3AVQYk10Po6k7OldAjKkqKmNo=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730879AbfHTNnc (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Tue, 20 Aug 2019 09:43:32 -0400
Received: from mail.kernel.org ([198.145.29.99]:39308 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730871AbfHTNnb (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 20 Aug 2019 09:43:31 -0400
Received: from sasha-vm.mshome.net (unknown [12.236.144.82])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 2E8DE22DA7;
        Tue, 20 Aug 2019 13:43:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1566308610;
        bh=XUoIc2KHqVMThX9S+sl+WxBiHhZcXkyJqYSy2y8+sYE=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=nR6yUhKShAS8LAe5KMiXk8OpMq4oonNEctw1JxixqkcT/J0XrbtfuuYLtpAktCYCl
         JTN0GgMSA41Spah62eU3nYM0AtmO/O+jtZbhCLMGLekrkNNSlFgD5Iivve6ETpQZju
         lLFWxL4CeYBDh9XwG9KEDDKwpERbRAVEaC46Sa2I=
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Hans Ulli Kroll <ulli.kroll@googlemail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Sasha Levin <sashal@kernel.org>, linux-usb@vger.kernel.org
Subject: [PATCH AUTOSEL 4.4 3/4] usb: host: fotg2: restart hcd after port reset
Date:   Tue, 20 Aug 2019 09:43:24 -0400
Message-Id: <20190820134325.11825-3-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190820134325.11825-1-sashal@kernel.org>
References: <20190820134325.11825-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Hans Ulli Kroll <ulli.kroll@googlemail.com>

[ Upstream commit 777758888ffe59ef754cc39ab2f275dc277732f4 ]

On the Gemini SoC the FOTG2 stalls after port reset
so restart the HCD after each port reset.

Signed-off-by: Hans Ulli Kroll <ulli.kroll@googlemail.com>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
Link: https://lore.kernel.org/r/20190810150458.817-1-linus.walleij@linaro.org
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/usb/host/fotg210-hcd.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/usb/host/fotg210-hcd.c b/drivers/usb/host/fotg210-hcd.c
index 2341af4f34909..11b3a8c57eabc 100644
--- a/drivers/usb/host/fotg210-hcd.c
+++ b/drivers/usb/host/fotg210-hcd.c
@@ -1653,6 +1653,10 @@ static int fotg210_hub_control(struct usb_hcd *hcd, u16 typeReq, u16 wValue,
 			/* see what we found out */
 			temp = check_reset_complete(fotg210, wIndex, status_reg,
 					fotg210_readl(fotg210, status_reg));
+
+			/* restart schedule */
+			fotg210->command |= CMD_RUN;
+			fotg210_writel(fotg210, fotg210->command, &fotg210->regs->command);
 		}
 
 		if (!(temp & (PORT_RESUME|PORT_RESET))) {
-- 
2.20.1


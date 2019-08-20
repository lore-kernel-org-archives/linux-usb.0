Return-Path: <SRS0=RNjJ=WQ=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B94EC3A589
	for <linux-usb@archiver.kernel.org>; Tue, 20 Aug 2019 13:43:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 169B32339D
	for <linux-usb@archiver.kernel.org>; Tue, 20 Aug 2019 13:43:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1566308596;
	bh=+WDn8oAOmEByojJPlcQ4S36KY7Q1Vx3gD+XTkN2jkiY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-ID:From;
	b=xXRyARJmNoH20A+Zw9j6JrhOdOrr1KnPeUDgc2pRR5jahRkOjguhuZzHfE8ar4srX
	 1lQH9RW7mj04LQH8MfqPhMc33EMqGSKF5LfzazC/93xfKtIl8LwyY5yNO39jV5lMnH
	 ZBA87Yyj61oTTVttYiuLcW539Y0rwqaJmRfH+Aew=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730808AbfHTNnO (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Tue, 20 Aug 2019 09:43:14 -0400
Received: from mail.kernel.org ([198.145.29.99]:38904 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730805AbfHTNnN (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 20 Aug 2019 09:43:13 -0400
Received: from sasha-vm.mshome.net (unknown [12.236.144.82])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id F2AB522DD3;
        Tue, 20 Aug 2019 13:43:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1566308593;
        bh=+WDn8oAOmEByojJPlcQ4S36KY7Q1Vx3gD+XTkN2jkiY=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=DWA2rGnkzqFtQzHcxGZA0WQZ6Oj3e2SnrFMOdDlnh4evcCxIWyDppWt5KkV+mMU7j
         XCNcq/d+xJpSWFfyAYc1VqRShDMJkjfz7OOjZsEW2d/vLlYo7bQHPwdsW+tua7durS
         U1EWbutujzM4sGSc7cQ3CPi57JDRzA0pI8SdBHmI=
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Hans Ulli Kroll <ulli.kroll@googlemail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Sasha Levin <sashal@kernel.org>, linux-usb@vger.kernel.org
Subject: [PATCH AUTOSEL 4.14 11/12] usb: host: fotg2: restart hcd after port reset
Date:   Tue, 20 Aug 2019 09:42:52 -0400
Message-Id: <20190820134253.11562-11-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190820134253.11562-1-sashal@kernel.org>
References: <20190820134253.11562-1-sashal@kernel.org>
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
index 457cc6525abd6..aa21036828084 100644
--- a/drivers/usb/host/fotg210-hcd.c
+++ b/drivers/usb/host/fotg210-hcd.c
@@ -1652,6 +1652,10 @@ static int fotg210_hub_control(struct usb_hcd *hcd, u16 typeReq, u16 wValue,
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


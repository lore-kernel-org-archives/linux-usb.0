Return-Path: <SRS0=wl2X=77=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF859C433E0
	for <linux-usb@archiver.kernel.org>; Thu, 18 Jun 2020 01:49:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B9AEF221F6
	for <linux-usb@archiver.kernel.org>; Thu, 18 Jun 2020 01:49:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1592444981;
	bh=ycZ0ABT4QoiUOZLPu2kdhV+mHvmuwufpb1hj4VzyrQA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-ID:From;
	b=KwvXs115exjZFIZIKGe71Ifuvrl6rzah36xUM9nJvnKJGbsV/6ulxmtWI7Au2+OKC
	 Hyujv5vKxvMDGUnoHJ2StFFOn2ZHOS9m/2AlwXIGx24N5GSYNYjgC3RboD9pZxKHGt
	 Hj8+KtDnWydTbttf2OBeXukTyIKZiwFEVfKaqzdw=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732335AbgFRBtd (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Wed, 17 Jun 2020 21:49:33 -0400
Received: from mail.kernel.org ([198.145.29.99]:35832 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729855AbgFRB1h (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 17 Jun 2020 21:27:37 -0400
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net [73.47.72.35])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id C849B221F3;
        Thu, 18 Jun 2020 01:27:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1592443657;
        bh=ycZ0ABT4QoiUOZLPu2kdhV+mHvmuwufpb1hj4VzyrQA=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=aDYybvK/NxApFXTlGzhcRMsLDfwIwePeni2a+BM3Ds6WZuvhASPux3sK2E/xuJUeP
         q+i5vvcEwzc07BySSK2EBwJFXBdXR2RWSXgSV3SBwuCJpFnqpLA951gNsno9m1uMCS
         +uModXMYM3LYwfW1IeHycwQeH5Cqiu4kof2YHoeU=
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Qiushi Wu <wu000273@umn.edu>, Felipe Balbi <balbi@kernel.org>,
        Sasha Levin <sashal@kernel.org>, linux-usb@vger.kernel.org
Subject: [PATCH AUTOSEL 4.14 076/108] usb: gadget: fix potential double-free in m66592_probe.
Date:   Wed, 17 Jun 2020 21:25:28 -0400
Message-Id: <20200618012600.608744-76-sashal@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200618012600.608744-1-sashal@kernel.org>
References: <20200618012600.608744-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Qiushi Wu <wu000273@umn.edu>

[ Upstream commit 44734a594196bf1d474212f38fe3a0d37a73278b ]

m66592_free_request() is called under label "err_add_udc"
and "clean_up", and m66592->ep0_req is not set to NULL after
first free, leading to a double-free. Fix this issue by
setting m66592->ep0_req to NULL after the first free.

Fixes: 0f91349b89f3 ("usb: gadget: convert all users to the new udc infrastructure")
Signed-off-by: Qiushi Wu <wu000273@umn.edu>
Signed-off-by: Felipe Balbi <balbi@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/usb/gadget/udc/m66592-udc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/gadget/udc/m66592-udc.c b/drivers/usb/gadget/udc/m66592-udc.c
index 46ce7bc15f2b..53abad98af6d 100644
--- a/drivers/usb/gadget/udc/m66592-udc.c
+++ b/drivers/usb/gadget/udc/m66592-udc.c
@@ -1672,7 +1672,7 @@ static int m66592_probe(struct platform_device *pdev)
 
 err_add_udc:
 	m66592_free_request(&m66592->ep[0].ep, m66592->ep0_req);
-
+	m66592->ep0_req = NULL;
 clean_up3:
 	if (m66592->pdata->on_chip) {
 		clk_disable(m66592->clk);
-- 
2.25.1


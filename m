Return-Path: <SRS0=RNjJ=WQ=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D0D5C3A589
	for <linux-usb@archiver.kernel.org>; Tue, 20 Aug 2019 13:45:01 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 365F022DA7
	for <linux-usb@archiver.kernel.org>; Tue, 20 Aug 2019 13:45:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1566308701;
	bh=k3O7MUjSscexA67DQ0nS5++Cx3SqY3MkoEdMiw46Q+4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-ID:From;
	b=l1uYZAVo55UeUiFLsKtpUVkGVBjt7dyrc+ANy+BxAxGa7OOgGYvB2VZuSFnSmAp9h
	 EQa1vnMAXeKwN3aq/zj/Gx+9dQBWdvvbefhXpDgwdWBaZyZUe//UUrK/B/YOWbgKwA
	 bvWfXaljaSgmd5djcCtdU4yFO+FdehiegtHBo638=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730682AbfHTNo4 (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Tue, 20 Aug 2019 09:44:56 -0400
Received: from mail.kernel.org ([198.145.29.99]:38486 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730756AbfHTNnA (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 20 Aug 2019 09:43:00 -0400
Received: from sasha-vm.mshome.net (unknown [12.236.144.82])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 7CE7F2332A;
        Tue, 20 Aug 2019 13:42:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1566308580;
        bh=k3O7MUjSscexA67DQ0nS5++Cx3SqY3MkoEdMiw46Q+4=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=zLCK/gMLt+0MRrCoChvReygwt8u9qc1ql1LPiFcLt47APGlwfab9Jn5HPfU5hdMbD
         W8xbKT+jGIXFr0Bb87t9lyKQgsPohdrwibVyU5sBTMzm2PfHCSm5zA/c2GK5tlYuMw
         SD/CDcsAm8/skZd3WYRRvWfMh2Hn4sFAPpTTqw1o=
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Felipe Balbi <felipe.balbi@linux.intel.com>,
        Sasha Levin <sashal@kernel.org>, linux-usb@vger.kernel.org
Subject: [PATCH AUTOSEL 4.14 05/12] usb: gadget: composite: Clear "suspended" on reset/disconnect
Date:   Tue, 20 Aug 2019 09:42:46 -0400
Message-Id: <20190820134253.11562-5-sashal@kernel.org>
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

From: Benjamin Herrenschmidt <benh@kernel.crashing.org>

[ Upstream commit 602fda17c7356bb7ae98467d93549057481d11dd ]

In some cases, one can get out of suspend with a reset or
a disconnect followed by a reconnect. Previously we would
leave a stale suspended flag set.

Signed-off-by: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Signed-off-by: Felipe Balbi <felipe.balbi@linux.intel.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/usb/gadget/composite.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/usb/gadget/composite.c b/drivers/usb/gadget/composite.c
index b805962f51543..75c42393b64ba 100644
--- a/drivers/usb/gadget/composite.c
+++ b/drivers/usb/gadget/composite.c
@@ -2008,6 +2008,7 @@ void composite_disconnect(struct usb_gadget *gadget)
 	 * disconnect callbacks?
 	 */
 	spin_lock_irqsave(&cdev->lock, flags);
+	cdev->suspended = 0;
 	if (cdev->config)
 		reset_config(cdev);
 	if (cdev->driver->disconnect)
-- 
2.20.1


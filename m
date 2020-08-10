Return-Path: <SRS0=jvRu=BU=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7702EC433DF
	for <linux-usb@archiver.kernel.org>; Mon, 10 Aug 2020 19:20:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3534422BEB
	for <linux-usb@archiver.kernel.org>; Mon, 10 Aug 2020 19:20:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1597087253;
	bh=eC13ChoGeRWb9N3IW/OrT7LtsHGrOf7bsYGIWtTxk54=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-ID:From;
	b=QL/bF9WONzzbsV9tiudBJWSWdWmYRGgeZt4sXk9w3KGrTDsTUjMXkTU9utW45C0wm
	 Pz4dNidqlEWAkve5k8HOliQSKthueGL20em8EJIIhpPTc8PVL8U4IscxWru5rs7qQf
	 bJo31OVji7CnA3OYuNIFZj31qBPB87+4hTYEhNW4=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729813AbgHJTNk (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Mon, 10 Aug 2020 15:13:40 -0400
Received: from mail.kernel.org ([198.145.29.99]:44792 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729802AbgHJTNi (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 10 Aug 2020 15:13:38 -0400
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net [73.47.72.35])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id CDC9222B47;
        Mon, 10 Aug 2020 19:13:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1597086817;
        bh=eC13ChoGeRWb9N3IW/OrT7LtsHGrOf7bsYGIWtTxk54=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=H2Fue4BhG3nyzeO4FBySsWbJd+t84DxmiwJpENKdhHpBA56wZhxpi8qR1bleWaTt1
         0/ynI8aP2cgbYyr7d+amW/jFy9R8ETfZoLysRJWmgjJAyIsZGAhj1yEj47rg/erIyg
         SulP/V4tNtOHmlg96JAJW28JltWbEzrXGdbP34f4=
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Danesh Petigara <danesh.petigara@broadcom.com>,
        Al Cooper <alcooperx@gmail.com>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Felipe Balbi <balbi@kernel.org>,
        Sasha Levin <sashal@kernel.org>, linux-usb@vger.kernel.org
Subject: [PATCH AUTOSEL 4.19 26/31] usb: bdc: Halt controller on suspend
Date:   Mon, 10 Aug 2020 15:12:54 -0400
Message-Id: <20200810191259.3794858-26-sashal@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200810191259.3794858-1-sashal@kernel.org>
References: <20200810191259.3794858-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Danesh Petigara <danesh.petigara@broadcom.com>

[ Upstream commit 5fc453d7de3d0c345812453823a3a56783c5f82c ]

GISB bus error kernel panics have been observed during S2 transition
tests on the 7271t platform. The errors are a result of the BDC
interrupt handler trying to access BDC register space after the
system's suspend callbacks have completed.

Adding a suspend hook to the BDC driver that halts the controller before
S2 entry thus preventing unwanted access to the BDC register space during
this transition.

Signed-off-by: Danesh Petigara <danesh.petigara@broadcom.com>
Signed-off-by: Al Cooper <alcooperx@gmail.com>
Acked-by: Florian Fainelli <f.fainelli@gmail.com>
Signed-off-by: Felipe Balbi <balbi@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/usb/gadget/udc/bdc/bdc_core.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/gadget/udc/bdc/bdc_core.c b/drivers/usb/gadget/udc/bdc/bdc_core.c
index 4c557f3154460..e174b1b889da5 100644
--- a/drivers/usb/gadget/udc/bdc/bdc_core.c
+++ b/drivers/usb/gadget/udc/bdc/bdc_core.c
@@ -608,9 +608,14 @@ static int bdc_remove(struct platform_device *pdev)
 static int bdc_suspend(struct device *dev)
 {
 	struct bdc *bdc = dev_get_drvdata(dev);
+	int ret;
 
-	clk_disable_unprepare(bdc->clk);
-	return 0;
+	/* Halt the controller */
+	ret = bdc_stop(bdc);
+	if (!ret)
+		clk_disable_unprepare(bdc->clk);
+
+	return ret;
 }
 
 static int bdc_resume(struct device *dev)
-- 
2.25.1


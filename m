Return-Path: <linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9537FC2BB40
	for <linux-usb@archiver.kernel.org>; Mon, 14 Dec 2020 22:29:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5658322507
	for <linux-usb@archiver.kernel.org>; Mon, 14 Dec 2020 22:29:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2408328AbgLNW3B (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Mon, 14 Dec 2020 17:29:01 -0500
Received: from youngberry.canonical.com ([91.189.89.112]:39425 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390134AbgLNW26 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 14 Dec 2020 17:28:58 -0500
Received: from cpc154979-craw9-2-0-cust193.16-3.cable.virginm.net ([80.193.200.194] helo=localhost)
        by youngberry.canonical.com with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <colin.king@canonical.com>)
        id 1kowKE-0007OM-Bi; Mon, 14 Dec 2020 22:28:14 +0000
From:   Colin King <colin.king@canonical.com>
To:     Pawel Laszczak <pawell@cadence.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org
Cc:     kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH][next] usb: cdnsp: fix spelling mistake "delagete" -> "delegate"
Date:   Mon, 14 Dec 2020 22:28:13 +0000
Message-Id: <20201214222813.82727-1-colin.king@canonical.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

There is a spelling mistake in a trace message. Fix it.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/usb/cdns3/cdnsp-ep0.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/cdns3/cdnsp-ep0.c b/drivers/usb/cdns3/cdnsp-ep0.c
index d55b59ed7381..b6a06e6210ba 100644
--- a/drivers/usb/cdns3/cdnsp-ep0.c
+++ b/drivers/usb/cdns3/cdnsp-ep0.c
@@ -45,7 +45,7 @@ static int cdnsp_ep0_delegate_req(struct cdnsp_device *pdev,
 {
 	int ret;
 
-	trace_cdnsp_ep0_request("delagete");
+	trace_cdnsp_ep0_request("delegate");
 
 	spin_unlock(&pdev->lock);
 	ret = pdev->gadget_driver->setup(&pdev->gadget, ctrl);
-- 
2.29.2


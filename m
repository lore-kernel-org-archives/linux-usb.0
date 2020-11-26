Return-Path: <linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12B87C64E75
	for <linux-usb@archiver.kernel.org>; Thu, 26 Nov 2020 06:54:31 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B428620DD4
	for <linux-usb@archiver.kernel.org>; Thu, 26 Nov 2020 06:54:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="k/fhweUs"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388185AbgKZGy3 (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Thu, 26 Nov 2020 01:54:29 -0500
Received: from mail.kernel.org ([198.145.29.99]:36696 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1732132AbgKZGy2 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 26 Nov 2020 01:54:28 -0500
Received: from localhost.localdomain (unknown [180.164.155.184])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id D6FE821741;
        Thu, 26 Nov 2020 06:54:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1606373668;
        bh=T2eoTMDosMRiAyoIIhv5Zv4l1aFn/k4aPRdVUD3SLAI=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=k/fhweUsmVoKip+Pjz/F9Q+kn+aTj/J6OG6BJrb7LFh1XaB8hmpp2To0ZL5vCtNL5
         plJ3MWbI+x4i+9Q8KoZoFbTHxaIe+ZWgUPqpkHALr8WG2gJGH8Y9CckzDWo06rWoVE
         VJ0knkweQfNOJlTXWsdp2Zt1x5Kz3kqV90EdCMA0=
From:   Peter Chen <peter.chen@kernel.org>
To:     pawell@cadence.com, rogerq@ti.com
Cc:     balbi@kernel.org, linux-usb@vger.kernel.org, linux-imx@nxp.com,
        frank.li@nxp.com, Peter Chen <peter.chen@nxp.com>
Subject: [PATCH 2/2] usb: cdns3: core: fix goto label for error path
Date:   Thu, 26 Nov 2020 14:54:09 +0800
Message-Id: <20201126065409.7533-2-peter.chen@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201126065409.7533-1-peter.chen@kernel.org>
References: <20201126065409.7533-1-peter.chen@kernel.org>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Peter Chen <peter.chen@nxp.com>

The usb_role_switch_register has already called, so if the devm_request_irq
has failed, it needs to call usb_role_switch_unregister.

Fixes: b1234e3b3b26 ("usb: cdns3: add runtime PM support")
Signed-off-by: Peter Chen <peter.chen@nxp.com>
---
 drivers/usb/cdns3/core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/cdns3/core.c b/drivers/usb/cdns3/core.c
index 170deb3eacf0..039ab5d2435e 100644
--- a/drivers/usb/cdns3/core.c
+++ b/drivers/usb/cdns3/core.c
@@ -553,7 +553,7 @@ static int cdns3_probe(struct platform_device *pdev)
 
 		if (ret) {
 			dev_err(cdns->dev, "couldn't register wakeup irq handler\n");
-			goto err3;
+			goto err4;
 		}
 	}
 
-- 
2.17.1


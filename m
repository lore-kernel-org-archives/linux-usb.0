Return-Path: <linux-usb-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23434EB64DD
	for <linux-usb@archiver.kernel.org>; Thu, 15 Jun 2023 11:39:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344109AbjFOLjT (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Thu, 15 Jun 2023 07:39:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53580 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344066AbjFOLip (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 15 Jun 2023 07:38:45 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9C6C0271E;
        Thu, 15 Jun 2023 04:38:08 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 39AFE63950;
        Thu, 15 Jun 2023 11:38:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E362C433C8;
        Thu, 15 Jun 2023 11:38:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1686829087;
        bh=IT2ZpffyqEISnL6NLd+96omR6hfrvOlCcRzPt2a66jQ=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=t2razCDbJwwdwRv8tvhPWAsfybtCI/6REker0TGG7LmYsfKF93QLLoVPaG1X/OpZ1
         0GInrKa2wwWAMW3d2DRpbGyy2PHomiSzUF6PbltR5LWVLLrjPTtheb5FYRriKaFFaT
         gC8NaYE/CoyZAiBTHK3ZVRQ4vS0QVDAsvkVq2nbej7LHZvDNW4t5cYUIhyNOczzpLn
         7AwWXq/ifjbI6MIrOBTVGPmlJbI+inILm5UBLfNuY4b2Oix897OqTy/KzwshT3Yl/D
         fRT+wAyD3lK9Q5eoFqj5RL/V2hLEUb5bjrvF0uRhHPiJRXZWwfekYWrs2zIctQNyco
         4fS18MHE6zf/A==
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Dan Carpenter <dan.carpenter@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Sasha Levin <sashal@kernel.org>, linux-usb@vger.kernel.org
Subject: [PATCH AUTOSEL 6.3 14/19] usb: gadget: udc: fix NULL dereference in remove()
Date:   Thu, 15 Jun 2023 07:37:14 -0400
Message-Id: <20230615113719.648862-14-sashal@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230615113719.648862-1-sashal@kernel.org>
References: <20230615113719.648862-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.3.8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Dan Carpenter <dan.carpenter@linaro.org>

[ Upstream commit 016da9c65fec9f0e78c4909ed9a0f2d567af6775 ]

The "udc" pointer was never set in the probe() function so it will
lead to a NULL dereference in udc_pci_remove() when we do:

	usb_del_gadget_udc(&udc->gadget);

Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
Link: https://lore.kernel.org/r/ZG+A/dNpFWAlCChk@kili
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/usb/gadget/udc/amd5536udc_pci.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/usb/gadget/udc/amd5536udc_pci.c b/drivers/usb/gadget/udc/amd5536udc_pci.c
index c80f9bd51b750..a36913ae31f9e 100644
--- a/drivers/usb/gadget/udc/amd5536udc_pci.c
+++ b/drivers/usb/gadget/udc/amd5536udc_pci.c
@@ -170,6 +170,9 @@ static int udc_pci_probe(
 		retval = -ENODEV;
 		goto err_probe;
 	}
+
+	udc = dev;
+
 	return 0;
 
 err_probe:
-- 
2.39.2


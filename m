Return-Path: <SRS0=wl2X=77=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73562C433E2
	for <linux-usb@archiver.kernel.org>; Thu, 18 Jun 2020 02:49:28 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4793421D6C
	for <linux-usb@archiver.kernel.org>; Thu, 18 Jun 2020 02:49:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1592448568;
	bh=R86fNBOPfCWBpZpdNnHl8mcDcj84ClripV86DMJT7XA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-ID:From;
	b=PENKr+i8tOWG8BRriWyBZfZXXuxDi1tFoRNBk2aicV0UqBcumIFTH2PD9M/CaQUEJ
	 OGgITojEAzPLBG2L/er4QaJ2gEqkr+Rh28+KnvbZi5f716a2t8j5HZvnzxIIv3nsEm
	 L9xCzTrPhW7MwJReQrC6wUArVdJ72JkOlzXwVXYk=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387960AbgFRCtY (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Wed, 17 Jun 2020 22:49:24 -0400
Received: from mail.kernel.org ([198.145.29.99]:36118 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726925AbgFRBJh (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 17 Jun 2020 21:09:37 -0400
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net [73.47.72.35])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id E8F1B21D7A;
        Thu, 18 Jun 2020 01:09:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1592442576;
        bh=R86fNBOPfCWBpZpdNnHl8mcDcj84ClripV86DMJT7XA=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=YwPamofZKM47EeD+P6otbm2PCyqK1VrvSdWETgBrRFHsyICm5nmbjv6A+T8mYKTaN
         GAUcvnaArqMQ6KXLj44xGVmbsVzEaPeVCo9OKHNugdvCznPD3RP9IzfmTyqXPQqZFM
         hcM8FmJEEeDCaT39o6LhOnopfX2WGLreicdy7nLo=
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Dinghao Liu <dinghao.liu@zju.edu.cn>,
        Peter Chen <peter.chen@nxp.com>,
        Felipe Balbi <balbi@kernel.org>,
        Sasha Levin <sashal@kernel.org>, linux-usb@vger.kernel.org
Subject: [PATCH AUTOSEL 5.7 069/388] usb: cdns3: Fix runtime PM imbalance on error
Date:   Wed, 17 Jun 2020 21:02:46 -0400
Message-Id: <20200618010805.600873-69-sashal@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200618010805.600873-1-sashal@kernel.org>
References: <20200618010805.600873-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Dinghao Liu <dinghao.liu@zju.edu.cn>

[ Upstream commit e5b913496099527abe46e175e5e2c844367bded0 ]

pm_runtime_get_sync() increments the runtime PM usage counter even
when it returns an error code. Thus a pairing decrement is needed on
the error handling path to keep the counter balanced.

Reviewed-by: Peter Chen <peter.chen@nxp.com>
Signed-off-by: Dinghao Liu <dinghao.liu@zju.edu.cn>
Signed-off-by: Felipe Balbi <balbi@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/usb/cdns3/cdns3-ti.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/usb/cdns3/cdns3-ti.c b/drivers/usb/cdns3/cdns3-ti.c
index 5685ba11480b..e701ab56b0a7 100644
--- a/drivers/usb/cdns3/cdns3-ti.c
+++ b/drivers/usb/cdns3/cdns3-ti.c
@@ -138,7 +138,7 @@ static int cdns_ti_probe(struct platform_device *pdev)
 	error = pm_runtime_get_sync(dev);
 	if (error < 0) {
 		dev_err(dev, "pm_runtime_get_sync failed: %d\n", error);
-		goto err_get;
+		goto err;
 	}
 
 	/* assert RESET */
@@ -185,7 +185,6 @@ static int cdns_ti_probe(struct platform_device *pdev)
 
 err:
 	pm_runtime_put_sync(data->dev);
-err_get:
 	pm_runtime_disable(data->dev);
 
 	return error;
-- 
2.25.1


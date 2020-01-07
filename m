Return-Path: <SRS0=uAmH=24=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8AC6C33C8C
	for <linux-usb@archiver.kernel.org>; Tue,  7 Jan 2020 15:22:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 9A20424676
	for <linux-usb@archiver.kernel.org>; Tue,  7 Jan 2020 15:22:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="PJ9inCsP"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728325AbgAGPWW (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Tue, 7 Jan 2020 10:22:22 -0500
Received: from fllv0015.ext.ti.com ([198.47.19.141]:60834 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728156AbgAGPWW (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 7 Jan 2020 10:22:22 -0500
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 007FMLYt026425;
        Tue, 7 Jan 2020 09:22:21 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1578410541;
        bh=b6B+eGb5sPbwYxvqNqvUsWODhhPh4iCknNnfM+2f0jQ=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=PJ9inCsPHKEXsKP5ji++3u7PW7pO8klNL3wAvjTg0x0EeCuUoYvsrk4aI6ajRC317
         WLWz85/3H0aak87Fjje7ZDEMaJWrq11G0I1m8de9B58OfgqcrsN8nhguxD5rpfaE9H
         MfbHf4kaWIEMiVagOjrXqhxqf6i/jPdRCH5SkQtk=
Received: from DLEE102.ent.ti.com (dlee102.ent.ti.com [157.170.170.32])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 007FMLmE101667
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 7 Jan 2020 09:22:21 -0600
Received: from DLEE110.ent.ti.com (157.170.170.21) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Tue, 7 Jan
 2020 09:22:21 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Tue, 7 Jan 2020 09:22:21 -0600
Received: from uda0271908.dal.design.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 007FMLwn130758;
        Tue, 7 Jan 2020 09:22:21 -0600
From:   Bin Liu <b-liu@ti.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC:     <linux-usb@vger.kernel.org>, Bin Liu <b-liu@ti.com>
Subject: [PATCH 2/2] usb: musb: Disable pullup at init
Date:   Tue, 7 Jan 2020 09:26:25 -0600
Message-ID: <20200107152625.857-3-b-liu@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200107152625.857-1-b-liu@ti.com>
References: <20200107152625.857-1-b-liu@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Paul Cercueil <paul@crapouillou.net>

The pullup may be already enabled before the driver is initialized. This
happens for instance on JZ4740.

It has to be disabled at init time, as we cannot guarantee that a gadget
driver will be bound to the UDC.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
Suggested-by: Bin Liu <b-liu@ti.com>
Cc: stable@vger.kernel.org
Signed-off-by: Bin Liu <b-liu@ti.com>
---
 drivers/usb/musb/musb_core.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/usb/musb/musb_core.c b/drivers/usb/musb/musb_core.c
index 0096fc303cd4..5ebf30bd61bd 100644
--- a/drivers/usb/musb/musb_core.c
+++ b/drivers/usb/musb/musb_core.c
@@ -2318,6 +2318,9 @@ musb_init_controller(struct device *dev, int nIrq, void __iomem *ctrl)
 	musb_disable_interrupts(musb);
 	musb_writeb(musb->mregs, MUSB_DEVCTL, 0);
 
+	/* MUSB_POWER_SOFTCONN might be already set, JZ4740 does this. */
+	musb_writeb(musb->mregs, MUSB_POWER, 0);
+
 	/* Init IRQ workqueue before request_irq */
 	INIT_DELAYED_WORK(&musb->irq_work, musb_irq_work);
 	INIT_DELAYED_WORK(&musb->deassert_reset_work, musb_deassert_reset);
-- 
2.17.1


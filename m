Return-Path: <SRS0=ajTD=7H=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5403EC433DF
	for <linux-usb@archiver.kernel.org>; Mon, 25 May 2020 02:50:56 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2776B2075F
	for <linux-usb@archiver.kernel.org>; Mon, 25 May 2020 02:50:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="QXA/uboH"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388743AbgEYCuz (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Sun, 24 May 2020 22:50:55 -0400
Received: from fllv0015.ext.ti.com ([198.47.19.141]:58304 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388398AbgEYCuv (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 24 May 2020 22:50:51 -0400
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 04P2ooMh118916;
        Sun, 24 May 2020 21:50:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1590375050;
        bh=4Uwo9+q8rBh4O5RXcZCu6XFwX681ZgA1nUiH/x8aBs4=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=QXA/uboHrS+U+pdrayRmb64X7MKpU4bafDz41geTOVZrn3GWYf4zE7f4H7f1CXbFy
         kCEce/an+Y8nSxc/73QEorTY8tIp8y/NtxSm+b5kzJxVAQ9G6mZDtAXpoB7fANII2r
         sSekxVnphozA2KLc18k6NUVtaJpKpNZrN1C1Ewik=
Received: from DFLE102.ent.ti.com (dfle102.ent.ti.com [10.64.6.23])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 04P2ooBj113212
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Sun, 24 May 2020 21:50:50 -0500
Received: from DFLE115.ent.ti.com (10.64.6.36) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Sun, 24
 May 2020 21:50:49 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Sun, 24 May 2020 21:50:49 -0500
Received: from uda0271908.dal.design.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 04P2onNk023969;
        Sun, 24 May 2020 21:50:49 -0500
From:   Bin Liu <b-liu@ti.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC:     <linux-usb@vger.kernel.org>, Bin Liu <b-liu@ti.com>
Subject: [PATCH 2/6] usb: musb: start session in resume for host port
Date:   Sun, 24 May 2020 21:50:45 -0500
Message-ID: <20200525025049.3400-3-b-liu@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200525025049.3400-1-b-liu@ti.com>
References: <20200525025049.3400-1-b-liu@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Commit 17539f2f4f0b ("usb: musb: fix enumeration after resume") replaced
musb_start() in musb_resume() to not override softconnect bit, but it
doesn't restart the session for host port which was done in musb_start().
The session could be disabled in musb_suspend(), which leads the host
port doesn't stay in host mode.

So let's start the session specifically for host port in musb_resume().

Fixes: 17539f2f4f0b ("usb: musb: fix enumeration after resume")

Cc: stable@vger.kernel.org
Signed-off-by: Bin Liu <b-liu@ti.com>
---
 drivers/usb/musb/musb_core.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/usb/musb/musb_core.c b/drivers/usb/musb/musb_core.c
index d590110539ab..48178aeccf5b 100644
--- a/drivers/usb/musb/musb_core.c
+++ b/drivers/usb/musb/musb_core.c
@@ -2877,6 +2877,13 @@ static int musb_resume(struct device *dev)
 	musb_enable_interrupts(musb);
 	musb_platform_enable(musb);
 
+	/* session might be disabled in suspend */
+	if (musb->port_mode == MUSB_HOST &&
+	    !(musb->ops->quirks & MUSB_PRESERVE_SESSION)) {
+		devctl |= MUSB_DEVCTL_SESSION;
+		musb_writeb(musb->mregs, MUSB_DEVCTL, devctl);
+	}
+
 	spin_lock_irqsave(&musb->lock, flags);
 	error = musb_run_resume_work(musb);
 	if (error)
-- 
2.17.1


Return-Path: <SRS0=lM5t=SS=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A387AC10F13
	for <linux-usb@archiver.kernel.org>; Tue, 16 Apr 2019 17:28:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 73F8B2064A
	for <linux-usb@archiver.kernel.org>; Tue, 16 Apr 2019 17:28:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JXNH2KXY"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729237AbfDPR22 (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Tue, 16 Apr 2019 13:28:28 -0400
Received: from mail-pl1-f194.google.com ([209.85.214.194]:35863 "EHLO
        mail-pl1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726860AbfDPR22 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 16 Apr 2019 13:28:28 -0400
Received: by mail-pl1-f194.google.com with SMTP id ck15so10685612plb.3
        for <linux-usb@vger.kernel.org>; Tue, 16 Apr 2019 10:28:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=q7FMFBEQHyRZF1P2ORkHPWGjoTYCtNVGdWU6Cx1wWAI=;
        b=JXNH2KXYtgwf099tvCAIg+vnVjQTiJNwlXfwbGTm9oMnWLSvMWuenw/SD3oGN+t03k
         7wuqDOIPZimrOqO7XBiapiXWm82xAMvugUna+Ck/h2yr4TFbaD2Yqb/3dR1K+ejW68pM
         MfcTy+gPgQPZTimeDshzE+8tCDp0Aw9S1a8QfKD76w/q3InwaSJNAqmJhR4tewjycwS1
         8g3tIPI61OX+C+6nJybVg9L4J19nB+Jm2gxJJOkNJKqMCSTnpgqzKVV5c03xtaIX03HG
         ceBf72motjJiUa3enPAfjiko0GG54q5P3CkIIuozpFPBVj2i9Z0ZJaJlkDS6tHjhx5xv
         fxZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=q7FMFBEQHyRZF1P2ORkHPWGjoTYCtNVGdWU6Cx1wWAI=;
        b=VLU3WV83fbs+M5rVwc2KhMETexyH4SJIFsU295Tk8SCa+5E0v4Wd0EZrQ5ZK0ONyCt
         Ar8NIPucNDZQ1w/9tJ60yurtWG5bIJsSOEFOU32K07UmO9Au1JuxSrG/LfL4GVf9AKJS
         nwdVuq6W4/kkk//SBxdBBOBzTua/ldpWSDfoCKtSyrvygeByl5Rl8Kt9XJdSdt23WHJk
         4jAdtHsbHh9oaMwuaeyfQ1TMiG7/hzAOifP58vzo5wNQSI6l3HKtqXfPf8sPuljRgWEi
         gvPzeWHZMswYe5b94YMt63vBLEQOgLTOtML9PTeF20AvJyaq1yVCQ1GNmpX54zk5TrMW
         Qirw==
X-Gm-Message-State: APjAAAWK5ayXvBaLzTZg3jCZnYQcvGCnbreGBKJp3C3pFLOoyEP2DV3v
        4YtwBrMaaT6Or8Mm0hzt8Y8=
X-Google-Smtp-Source: APXvYqwusxawy//svLli2Yp5A+XoNjBOwP2Td/MVRZXCuHwgru5jXtBq0v47ju6ZJlOgv3Xm7sjxdQ==
X-Received: by 2002:a17:902:7c87:: with SMTP id y7mr29144708pll.5.1555435707182;
        Tue, 16 Apr 2019 10:28:27 -0700 (PDT)
Received: from ajayg.nvidia.com (searspoint.nvidia.com. [216.228.112.21])
        by smtp.gmail.com with ESMTPSA id k124sm85026233pgc.65.2019.04.16.10.28.26
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 16 Apr 2019 10:28:26 -0700 (PDT)
From:   Ajay Gupta <ajaykuee@gmail.com>
X-Google-Original-From: Ajay Gupta <ajayg@nvidia.com>
To:     heikki.krogerus@linux.intel.com
Cc:     linux-usb@vger.kernel.org, Ajay Gupta <ajayg@nvidia.com>
Subject: [PATCH v8 2/3] i2c: nvidia-gpu: Supply CCGx driver the fw build info
Date:   Tue, 16 Apr 2019 10:27:46 -0700
Message-Id: <20190416172747.22139-3-ajayg@nvidia.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190416172747.22139-1-ajayg@nvidia.com>
References: <20190416172747.22139-1-ajayg@nvidia.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190416172746.VJykcax5mQjsD4OB3zuhr9CDZ-GWPFz2QGcww9i9G_E@z>

From: Ajay Gupta <ajayg@nvidia.com>

Adding device property "ccgx,firmware-build" for the CCGx
device, so the CCGx driver knows which firmware binary to
use for a specific vendor.

Suggested-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Signed-off-by: Ajay Gupta <ajayg@nvidia.com>
Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
---
Changes from v7->v8
	- None

 drivers/i2c/busses/i2c-nvidia-gpu.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/i2c/busses/i2c-nvidia-gpu.c b/drivers/i2c/busses/i2c-nvidia-gpu.c
index 4e67d5ed480e..1c8f708f212b 100644
--- a/drivers/i2c/busses/i2c-nvidia-gpu.c
+++ b/drivers/i2c/busses/i2c-nvidia-gpu.c
@@ -253,6 +253,12 @@ static const struct pci_device_id gpu_i2c_ids[] = {
 };
 MODULE_DEVICE_TABLE(pci, gpu_i2c_ids);
 
+static const struct property_entry ccgx_props[] = {
+	/* Use FW built for NVIDIA (nv) only */
+	PROPERTY_ENTRY_U16("ccgx,firmware-build", ('n' << 8) | 'v'),
+	{ }
+};
+
 static int gpu_populate_client(struct gpu_i2c_dev *i2cd, int irq)
 {
 	struct i2c_client *ccgx_client;
@@ -267,6 +273,7 @@ static int gpu_populate_client(struct gpu_i2c_dev *i2cd, int irq)
 		sizeof(i2cd->gpu_ccgx_ucsi->type));
 	i2cd->gpu_ccgx_ucsi->addr = 0x8;
 	i2cd->gpu_ccgx_ucsi->irq = irq;
+	i2cd->gpu_ccgx_ucsi->properties = ccgx_props;
 	ccgx_client = i2c_new_device(&i2cd->adapter, i2cd->gpu_ccgx_ucsi);
 	if (!ccgx_client)
 		return -ENODEV;
-- 
2.17.1


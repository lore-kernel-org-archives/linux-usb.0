Return-Path: <linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1DC68C2B9F8
	for <linux-usb@archiver.kernel.org>; Tue, 25 May 2021 17:16:43 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E90EC613F5
	for <linux-usb@archiver.kernel.org>; Tue, 25 May 2021 17:16:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233068AbhEYRSM (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Tue, 25 May 2021 13:18:12 -0400
Received: from mail.kernel.org ([198.145.29.99]:54862 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232036AbhEYRSL (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 25 May 2021 13:18:11 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 527E8613F4;
        Tue, 25 May 2021 17:16:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1621963000;
        bh=KKPptmEfJXTkDtapeg7+LHm8QSHt2wQ7aYxF79ayvSo=;
        h=From:To:Cc:Subject:Date:From;
        b=xRyjlyi3Omcu/+RAq4FSMKGaRCoQC8O1qpW+OEvPDub7yZqFImYjyB8mf6oypq/kU
         H7Oljfko/H78/rwAVe45vJVxuUI5Sr+xZgdNf4whArK1QfsMP+bOGvAR5kYU7JTfg6
         NtaKxE1QyKnToPPDeHrsagdDi5Ty7a+FACT+yH8M=
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     linux-usb@vger.kernel.org
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Daniel Mack <daniel@zonque.org>,
        Haojian Zhuang <haojian.zhuang@gmail.com>,
        Robert Jarzmik <robert.jarzmik@free.fr>,
        Felipe Balbi <balbi@kernel.org>
Subject: [PATCH] USB: gadget: pxa27x_udc: remove dentry storage for debugfs file
Date:   Tue, 25 May 2021 19:16:36 +0200
Message-Id: <20210525171636.758758-1-gregkh@linuxfoundation.org>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

There is no need to store the dentry pointer for a debugfs file that we
only use to remove it when the device goes away.  debugfs can do the
lookup for us instead, saving us some trouble, and making things smaller
overall.

Cc: Daniel Mack <daniel@zonque.org>
Cc: Haojian Zhuang <haojian.zhuang@gmail.com>
Cc: Robert Jarzmik <robert.jarzmik@free.fr>
Cc: Felipe Balbi <balbi@kernel.org>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/usb/gadget/udc/pxa27x_udc.c | 4 +---
 drivers/usb/gadget/udc/pxa27x_udc.h | 4 ----
 2 files changed, 1 insertion(+), 7 deletions(-)

diff --git a/drivers/usb/gadget/udc/pxa27x_udc.c b/drivers/usb/gadget/udc/pxa27x_udc.c
index ce57961dfd2d..ebcadbfa50fd 100644
--- a/drivers/usb/gadget/udc/pxa27x_udc.c
+++ b/drivers/usb/gadget/udc/pxa27x_udc.c
@@ -208,8 +208,6 @@ static void pxa_init_debugfs(struct pxa_udc *udc)
 	struct dentry *root;
 
 	root = debugfs_create_dir(udc->gadget.name, usb_debug_root);
-	udc->debugfs_root = root;
-
 	debugfs_create_file("udcstate", 0400, root, udc, &state_dbg_fops);
 	debugfs_create_file("queues", 0400, root, udc, &queues_dbg_fops);
 	debugfs_create_file("epstate", 0400, root, udc, &eps_dbg_fops);
@@ -217,7 +215,7 @@ static void pxa_init_debugfs(struct pxa_udc *udc)
 
 static void pxa_cleanup_debugfs(struct pxa_udc *udc)
 {
-	debugfs_remove_recursive(udc->debugfs_root);
+	debugfs_remove(debugfs_lookup(udc->gadget.name, usb_debug_root));
 }
 
 #else
diff --git a/drivers/usb/gadget/udc/pxa27x_udc.h b/drivers/usb/gadget/udc/pxa27x_udc.h
index 13b2977399ab..0a6bc18a1264 100644
--- a/drivers/usb/gadget/udc/pxa27x_udc.h
+++ b/drivers/usb/gadget/udc/pxa27x_udc.h
@@ -440,7 +440,6 @@ struct udc_stats {
  * @last_interface: UDC interface of the last SET_INTERFACE host request
  * @last_alternate: UDC altsetting of the last SET_INTERFACE host request
  * @udccsr0: save of udccsr0 in case of suspend
- * @debugfs_root: root entry of debug filesystem
  * @debugfs_state: debugfs entry for "udcstate"
  * @debugfs_queues: debugfs entry for "queues"
  * @debugfs_eps: debugfs entry for "epstate"
@@ -474,9 +473,6 @@ struct pxa_udc {
 #ifdef CONFIG_PM
 	unsigned				udccsr0;
 #endif
-#ifdef CONFIG_USB_GADGET_DEBUG_FS
-	struct dentry				*debugfs_root;
-#endif
 };
 #define to_pxa(g)	(container_of((g), struct pxa_udc, gadget))
 
-- 
2.31.1


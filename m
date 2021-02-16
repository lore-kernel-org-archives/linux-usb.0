Return-Path: <linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB809C433DB
	for <linux-usb@archiver.kernel.org>; Tue, 16 Feb 2021 14:47:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A1D8364E00
	for <linux-usb@archiver.kernel.org>; Tue, 16 Feb 2021 14:47:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230144AbhBPOra (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Tue, 16 Feb 2021 09:47:30 -0500
Received: from mail.kernel.org ([198.145.29.99]:36846 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229827AbhBPOr3 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 16 Feb 2021 09:47:29 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id CCEFA64DF5;
        Tue, 16 Feb 2021 14:46:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1613486809;
        bh=V1M6DWT2xcy+/f9ZChv66lgeujvHL4iFKub1t/fixWk=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=gW7oBTKEEqAqU5M9VA1TpN2ILHey70DwR2UC9qC0t1/EbddKg/y4rRn7A8T5E/7kK
         pgnlDilwv7uE3a8aZMjpqxAomuUCc74X39oqOz/FcuJzVltYYpXCtLlgl6utJIpMuY
         5/owhuTebD99mIqJ/oZCMZbS08qsUCVQPc0f+7iQ=
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     linux-usb@vger.kernel.org
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH 2/6] USB: host: isp1362: remove dentry pointer for debugfs
Date:   Tue, 16 Feb 2021 15:46:41 +0100
Message-Id: <20210216144645.3813043-2-gregkh@linuxfoundation.org>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210216144645.3813043-1-gregkh@linuxfoundation.org>
References: <20210216144645.3813043-1-gregkh@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

There is no need to keep the dentry pointer around for the created
debugfs file, as it is only needed when removing it from the system.
When it is to be removed, ask debugfs itself for the pointer, to save on
storage and make things a bit simpler.

Cc: linux-usb@vger.kernel.org
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/usb/host/isp1362-hcd.c | 8 +++-----
 drivers/usb/host/isp1362.h     | 1 -
 2 files changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/usb/host/isp1362-hcd.c b/drivers/usb/host/isp1362-hcd.c
index 2cecb36d241b..d8610ce8f2ec 100644
--- a/drivers/usb/host/isp1362-hcd.c
+++ b/drivers/usb/host/isp1362-hcd.c
@@ -2164,15 +2164,13 @@ DEFINE_SHOW_ATTRIBUTE(isp1362);
 /* expect just one isp1362_hcd per system */
 static void create_debug_file(struct isp1362_hcd *isp1362_hcd)
 {
-	isp1362_hcd->debug_file = debugfs_create_file("isp1362", S_IRUGO,
-						      usb_debug_root,
-						      isp1362_hcd,
-						      &isp1362_fops);
+	debugfs_create_file("isp1362", S_IRUGO, usb_debug_root, isp1362_hcd,
+			    &isp1362_fops);
 }
 
 static void remove_debug_file(struct isp1362_hcd *isp1362_hcd)
 {
-	debugfs_remove(isp1362_hcd->debug_file);
+	debugfs_remove(debugfs_lookup("isp1362", usb_debug_root));
 }
 
 /*-------------------------------------------------------------------------*/
diff --git a/drivers/usb/host/isp1362.h b/drivers/usb/host/isp1362.h
index 208705b08d37..74ca4be24723 100644
--- a/drivers/usb/host/isp1362.h
+++ b/drivers/usb/host/isp1362.h
@@ -435,7 +435,6 @@ struct isp1362_hcd {
 
 	struct isp1362_platform_data *board;
 
-	struct dentry		*debug_file;
 	unsigned long		stat1, stat2, stat4, stat8, stat16;
 
 	/* HC registers */
-- 
2.30.1


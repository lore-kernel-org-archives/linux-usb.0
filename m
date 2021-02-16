Return-Path: <linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4AA5C433E0
	for <linux-usb@archiver.kernel.org>; Tue, 16 Feb 2021 10:15:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A6D3864D73
	for <linux-usb@archiver.kernel.org>; Tue, 16 Feb 2021 10:15:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229998AbhBPKPT (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Tue, 16 Feb 2021 05:15:19 -0500
Received: from mail.kernel.org ([198.145.29.99]:56044 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229912AbhBPKPQ (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 16 Feb 2021 05:15:16 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id C5BFD64D9E;
        Tue, 16 Feb 2021 10:14:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1613470475;
        bh=O2Q27hr6Q2tu0G17tEJuGJHERt9K3knkkXeOktXAfwk=;
        h=Date:From:To:Cc:Subject:From;
        b=rq+FOR4tpAi54PAjrDtBB8HMXJZjFJAvf93AwJ2ej414Fuj74SKhcUl87ZiNO0h2u
         Kb1u2ErgSpRtSTXREJUKYMYQUn0zVBGotZN+jkSkg8bKnObdffMm34RQc/zhwi3t4e
         m79KK9VAje/FbLQTSUU6eLbEJUMF6HPra14fbL+k=
Date:   Tue, 16 Feb 2021 11:14:32 +0100
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     linux-usb@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org
Subject: [PATCH] USB: core: no need to save usb_devices_root
Message-ID: <YCubCA/trHAF7PtF@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

There is no need to save the usb_devices debugfs file as we only need it
when removing it, so have the debugfs code look it up when it is needed
instead, saving the storage.

Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/usb/core/usb.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/usb/core/usb.c b/drivers/usb/core/usb.c
index 8f07b0516100..829dc8e85b00 100644
--- a/drivers/usb/core/usb.c
+++ b/drivers/usb/core/usb.c
@@ -950,17 +950,15 @@ static struct notifier_block usb_bus_nb = {
 	.notifier_call = usb_bus_notify,
 };
 
-static struct dentry *usb_devices_root;
-
 static void usb_debugfs_init(void)
 {
-	usb_devices_root = debugfs_create_file("devices", 0444, usb_debug_root,
-					       NULL, &usbfs_devices_fops);
+	debugfs_create_file("devices", 0444, usb_debug_root, NULL,
+			    &usbfs_devices_fops);
 }
 
 static void usb_debugfs_cleanup(void)
 {
-	debugfs_remove(usb_devices_root);
+	debugfs_remove(debugfs_lookup("devices", usb_debug_root));
 }
 
 /*
-- 
2.30.1


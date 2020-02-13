Return-Path: <SRS0=gmFf=4B=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F71FC2BA83
	for <linux-usb@archiver.kernel.org>; Thu, 13 Feb 2020 11:13:52 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id E171C218AC
	for <linux-usb@archiver.kernel.org>; Thu, 13 Feb 2020 11:13:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729588AbgBMLNv (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Thu, 13 Feb 2020 06:13:51 -0500
Received: from mx2.suse.de ([195.135.220.15]:44758 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726232AbgBMLNv (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 13 Feb 2020 06:13:51 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx2.suse.de (Postfix) with ESMTP id ABA6BACE0;
        Thu, 13 Feb 2020 11:13:49 +0000 (UTC)
From:   Oliver Neukum <oneukum@suse.com>
To:     hadess@hadess.net, gregkh@linuxfoundation.org,
        linux-usb@vger.kernel.org
Cc:     Oliver Neukum <oneukum@suse.com>
Subject: [PATCH] apple-mfi-fastcharge: fix endianess issue in probe
Date:   Thu, 13 Feb 2020 12:13:36 +0100
Message-Id: <20200213111336.32392-1-oneukum@suse.com>
X-Mailer: git-send-email 2.16.4
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The product ID is little endian and needs to be converted.

Signed-off-by: Oliver Neukum <oneukum@suse.com>
Reported-by: kbuild test robot <lkp@intel.com>
---
 drivers/usb/misc/apple-mfi-fastcharge.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/misc/apple-mfi-fastcharge.c b/drivers/usb/misc/apple-mfi-fastcharge.c
index f1c4461a9a3c..b403094a6b3a 100644
--- a/drivers/usb/misc/apple-mfi-fastcharge.c
+++ b/drivers/usb/misc/apple-mfi-fastcharge.c
@@ -167,11 +167,11 @@ static int mfi_fc_probe(struct usb_device *udev)
 {
 	struct power_supply_config battery_cfg = {};
 	struct mfi_device *mfi = NULL;
-	int err;
+	int err, idProduct;
 
+	idProduct = le16_to_cpu(udev->descriptor.idProduct);
 	/* See comment above mfi_fc_id_table[] */
-	if (udev->descriptor.idProduct < 0x1200 ||
-	    udev->descriptor.idProduct > 0x12ff) {
+	if (idProduct < 0x1200 || idProduct > 0x12ff) {
 		return -ENODEV;
 	}
 
-- 
2.16.4


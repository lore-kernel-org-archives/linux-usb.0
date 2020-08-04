Return-Path: <SRS0=yKoG=BO=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 659F7C433DF
	for <linux-usb@archiver.kernel.org>; Tue,  4 Aug 2020 11:38:40 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 51E3C20738
	for <linux-usb@archiver.kernel.org>; Tue,  4 Aug 2020 11:38:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728763AbgHDLij (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Tue, 4 Aug 2020 07:38:39 -0400
Received: from relay7-d.mail.gandi.net ([217.70.183.200]:57529 "EHLO
        relay7-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730118AbgHDLii (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 4 Aug 2020 07:38:38 -0400
X-Originating-IP: 82.255.60.242
Received: from localhost.localdomain (lns-bzn-39-82-255-60-242.adsl.proxad.net [82.255.60.242])
        (Authenticated sender: hadess@hadess.net)
        by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id 4776820008;
        Tue,  4 Aug 2020 11:38:36 +0000 (UTC)
From:   Bastien Nocera <hadess@hadess.net>
To:     linux-usb@vger.kernel.org
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Alan Stern <stern@rowland.harvard.edu>,
        Bastien Nocera <hadess@hadess.net>
Subject: [PATCH v7 2/3] USB: Better name for __check_usb_generic()
Date:   Tue,  4 Aug 2020 13:38:33 +0200
Message-Id: <20200804113834.6409-2-hadess@hadess.net>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200804113834.6409-1-hadess@hadess.net>
References: <20200804113834.6409-1-hadess@hadess.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

__check_usb_generic() doesn't explain very well what the
function actually does: It checks to see whether the driver is
non-generic and matches the device.

Change it to check_for_non_generic_match()

Signed-off-by: Bastien Nocera <hadess@hadess.net>
---
First version based on Alan's comment:
https://marc.info/?l=linux-usb&m=159568870400795&w=2

 drivers/usb/core/generic.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/core/generic.c b/drivers/usb/core/generic.c
index 2b2f1ab6e36a..22c887f5c497 100644
--- a/drivers/usb/core/generic.c
+++ b/drivers/usb/core/generic.c
@@ -195,7 +195,7 @@ int usb_choose_configuration(struct usb_device *udev)
 }
 EXPORT_SYMBOL_GPL(usb_choose_configuration);
 
-static int __check_usb_generic(struct device_driver *drv, void *data)
+static int __check_for_non_generic_match(struct device_driver *drv, void *data)
 {
 	struct usb_device *udev = data;
 	struct usb_device_driver *udrv;
@@ -219,7 +219,7 @@ static bool usb_generic_driver_match(struct usb_device *udev)
 	 * If any other driver wants the device, leave the device to this other
 	 * driver.
 	 */
-	if (bus_for_each_drv(&usb_bus_type, NULL, udev, __check_usb_generic))
+	if (bus_for_each_drv(&usb_bus_type, NULL, udev, __check_for_non_generic_match))
 		return false;
 
 	return true;
-- 
2.26.2


Return-Path: <SRS0=66yL=WC=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86128C433FF
	for <linux-usb@archiver.kernel.org>; Tue,  6 Aug 2019 14:45:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 4E154214C6
	for <linux-usb@archiver.kernel.org>; Tue,  6 Aug 2019 14:45:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1565102716;
	bh=ZhEt7u4OqC6CjIcRt5N05jx3q1hDz3f2g1UMq5amwqM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-ID:From;
	b=ePoyOpAsbpp3oD/Fsp1EtyWbWakSZX3Hz5veE4ZChjOz/1VNE2VWri4ijxGlyoQtv
	 SwTD5LwUrPtaO0UbF4pfH+nmSfs2BE7X8prO1bdk8WoWCYowh9ZRdzhNaE4YWIWrDt
	 AdQj01bbXA2wnJp+RPaoAt0v9FxroPbx9RtNJqq0=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733044AbfHFOpP (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Tue, 6 Aug 2019 10:45:15 -0400
Received: from mail.kernel.org ([198.145.29.99]:45844 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730289AbfHFOpP (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 6 Aug 2019 10:45:15 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 3C94120C01;
        Tue,  6 Aug 2019 14:45:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1565102714;
        bh=ZhEt7u4OqC6CjIcRt5N05jx3q1hDz3f2g1UMq5amwqM=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=laIY0ZG4qBrFERtZamRTDBqfyCE9DvH+9cdBnpt74DUCog4di/Vq4wz4VX+9+GuE4
         xNbQdklx343uX404j42+ZwFcVM0ux/wvUlWYFuLpaAoO9wiSBZx7z8n9R59xi+246u
         2axJ0xCaFUnzOZN3JubrXqwZP0V3c1uUXa82HM3s=
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     linux-usb@vger.kernel.org
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Ding Xiang <dingxiang@cmss.chinamobile.com>
Subject: [PATCH 10/12] USB: trancevibrator: convert to use dev_groups
Date:   Tue,  6 Aug 2019 16:45:00 +0200
Message-Id: <20190806144502.17792-11-gregkh@linuxfoundation.org>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190806144502.17792-1-gregkh@linuxfoundation.org>
References: <20190806144502.17792-1-gregkh@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

USB drivers now support the ability for the driver core to handle the
creation and removal of device-specific sysfs files in a race-free
manner.  Take advantage of that by converting the driver to use this by
moving the sysfs attributes into a group and assigning the dev_groups
pointer to it.

Cc: Ding Xiang <dingxiang@cmss.chinamobile.com>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/usb/misc/trancevibrator.c | 15 +++++++--------
 1 file changed, 7 insertions(+), 8 deletions(-)

diff --git a/drivers/usb/misc/trancevibrator.c b/drivers/usb/misc/trancevibrator.c
index ac357ce2d1a6..a3dfc77578ea 100644
--- a/drivers/usb/misc/trancevibrator.c
+++ b/drivers/usb/misc/trancevibrator.c
@@ -71,9 +71,14 @@ static ssize_t speed_store(struct device *dev, struct device_attribute *attr,
 	}
 	return count;
 }
-
 static DEVICE_ATTR_RW(speed);
 
+static struct attribute *tv_attrs[] = {
+	&dev_attr_speed.attr,
+	NULL,
+};
+ATTRIBUTE_GROUPS(tv);
+
 static int tv_probe(struct usb_interface *interface,
 		    const struct usb_device_id *id)
 {
@@ -89,15 +94,9 @@ static int tv_probe(struct usb_interface *interface,
 
 	dev->udev = usb_get_dev(udev);
 	usb_set_intfdata(interface, dev);
-	retval = device_create_file(&interface->dev, &dev_attr_speed);
-	if (retval)
-		goto error_create_file;
 
 	return 0;
 
-error_create_file:
-	usb_put_dev(udev);
-	usb_set_intfdata(interface, NULL);
 error:
 	kfree(dev);
 	return retval;
@@ -108,7 +107,6 @@ static void tv_disconnect(struct usb_interface *interface)
 	struct trancevibrator *dev;
 
 	dev = usb_get_intfdata (interface);
-	device_remove_file(&interface->dev, &dev_attr_speed);
 	usb_set_intfdata(interface, NULL);
 	usb_put_dev(dev->udev);
 	kfree(dev);
@@ -120,6 +118,7 @@ static struct usb_driver tv_driver = {
 	.probe =	tv_probe,
 	.disconnect =	tv_disconnect,
 	.id_table =	id_table,
+	.dev_groups =	tv_groups,
 };
 
 module_usb_driver(tv_driver);
-- 
2.22.0


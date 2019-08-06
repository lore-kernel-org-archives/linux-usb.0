Return-Path: <SRS0=66yL=WC=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 836C8C433FF
	for <linux-usb@archiver.kernel.org>; Tue,  6 Aug 2019 14:45:31 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 4C605214C6
	for <linux-usb@archiver.kernel.org>; Tue,  6 Aug 2019 14:45:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1565102731;
	bh=3PaS4HqYKW6BYTPsCIgrHSQXLDcj7T1Il/0XM9y3FeQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-ID:From;
	b=cJcqR0QvQUBw+PAC7c8D8utWB8A2BgxkUhLjA3GBKgQoelNFwh4bz1jpOAWfbBnOG
	 oyv2jnD6TCah2eW9vqTwqSZH2EQVp3aERnKM7mua2ckgV9w5Ij8bbmvwVZis68GTan
	 qhCO9cm3KoQJa4JOiCiGWV+PCeNwa5s66gqWTsC8=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733113AbfHFOpa (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Tue, 6 Aug 2019 10:45:30 -0400
Received: from mail.kernel.org ([198.145.29.99]:46054 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1733066AbfHFOpa (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 6 Aug 2019 10:45:30 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id AB19520C01;
        Tue,  6 Aug 2019 14:45:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1565102730;
        bh=3PaS4HqYKW6BYTPsCIgrHSQXLDcj7T1Il/0XM9y3FeQ=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=NRI1QHHRxLlDUqDNen1f5jiT+qSQZTl9JyOXb2zpdAerP534oMwP+j354e/rd/sA/
         iinD5EvrJiXa0LstCbFbJYs+olB4Gobr7P8cwHriB9cXje/Fb3kEgDPfy+q5K8XDUK
         dQipnarQB2r4Dzxw+P8BXiWEKiKAfUQkJkdCBvGs=
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     linux-usb@vger.kernel.org
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Pete Zaitcev <zaitcev@redhat.com>
Subject: [PATCH 05/12] USB: usblp: convert to use dev_groups
Date:   Tue,  6 Aug 2019 16:44:55 +0200
Message-Id: <20190806144502.17792-6-gregkh@linuxfoundation.org>
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

Cc: Pete Zaitcev <zaitcev@redhat.com>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/usb/class/usblp.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/drivers/usb/class/usblp.c b/drivers/usb/class/usblp.c
index 407a7a6198a2..7fea4999d352 100644
--- a/drivers/usb/class/usblp.c
+++ b/drivers/usb/class/usblp.c
@@ -1082,6 +1082,12 @@ static ssize_t ieee1284_id_show(struct device *dev, struct device_attribute *att
 
 static DEVICE_ATTR_RO(ieee1284_id);
 
+static struct attribute *usblp_attrs[] = {
+	&dev_attr_ieee1284_id.attr,
+	NULL,
+};
+ATTRIBUTE_GROUPS(usblp);
+
 static int usblp_probe(struct usb_interface *intf,
 		       const struct usb_device_id *id)
 {
@@ -1156,9 +1162,6 @@ static int usblp_probe(struct usb_interface *intf,
 
 	/* Retrieve and store the device ID string. */
 	usblp_cache_device_id_string(usblp);
-	retval = device_create_file(&intf->dev, &dev_attr_ieee1284_id);
-	if (retval)
-		goto abort_intfdata;
 
 #ifdef DEBUG
 	usblp_check_status(usblp, 0);
@@ -1189,7 +1192,6 @@ static int usblp_probe(struct usb_interface *intf,
 
 abort_intfdata:
 	usb_set_intfdata(intf, NULL);
-	device_remove_file(&intf->dev, &dev_attr_ieee1284_id);
 abort:
 	kfree(usblp->readbuf);
 	kfree(usblp->statusbuf);
@@ -1360,8 +1362,6 @@ static void usblp_disconnect(struct usb_interface *intf)
 		BUG();
 	}
 
-	device_remove_file(&intf->dev, &dev_attr_ieee1284_id);
-
 	mutex_lock(&usblp_mutex);
 	mutex_lock(&usblp->mut);
 	usblp->present = 0;
@@ -1421,6 +1421,7 @@ static struct usb_driver usblp_driver = {
 	.suspend =	usblp_suspend,
 	.resume =	usblp_resume,
 	.id_table =	usblp_ids,
+	.dev_groups =	usblp_groups,
 	.supports_autosuspend =	1,
 };
 
-- 
2.22.0


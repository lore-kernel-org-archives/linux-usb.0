Return-Path: <SRS0=9a5V=CZ=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BDF4BC43461
	for <linux-usb@archiver.kernel.org>; Wed, 16 Sep 2020 19:18:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 50FA62075E
	for <linux-usb@archiver.kernel.org>; Wed, 16 Sep 2020 19:18:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=suse.com header.i=@suse.com header.b="kPfmCLC4"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727307AbgIPTRT (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Wed, 16 Sep 2020 15:17:19 -0400
Received: from mx2.suse.de ([195.135.220.15]:45966 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727351AbgIPTQB (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 16 Sep 2020 15:16:01 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=cantorsusede;
        t=1600283759;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc; bh=IMQ3yTWOGedb0Gw2IjIHRgHrKUy+DEi23Ll3uoIDubU=;
        b=kPfmCLC45giihGWoDWly+srV5B+ydosxnXZ+5ZOFq6IDab7LFO+2tFiraNbeD8+OH3WtIj
        RB+yb4BIeBZM1aXfAFTpFl53bfSpOa9mcDhJauyxMVqusHZk4hFwlrJ3mriKG3gLctwvNy
        LcLCjjyiSWQ1FQbmnWcYzgV1vQ0hIii+GdKTLU5FQ8faR2MDezDqWKZKM2QsJ+4pFA+5jr
        WEV8zpYh0q5qY+/Jj3gf1l5ibdJEbTjL6dB94w4vzzEBkr76t5l1Q8NgYlT6lPXI8PMTIP
        k9HFp6clKdBDgsGNCZlIdGhfPoH1AVOd6Sn0iznXfMi4cQjf7Es87AJ1Teb0wA==
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id 856C5B5C7;
        Wed, 16 Sep 2020 19:16:14 +0000 (UTC)
From:   Oliver Neukum <oneukum@suse.com>
To:     gregKH@linuxfoundation.org, linux-usb@vger.kernel.org,
        stern@rowland.harvard.edu
Cc:     Oliver Neukum <oneukum@suse.com>
Subject: [PATCHv2] base: force NOIO allocations during unplug
Date:   Wed, 16 Sep 2020 21:15:44 +0200
Message-Id: <20200916191544.5104-1-oneukum@suse.com>
X-Mailer: git-send-email 2.16.4
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

There is one overlooked situation under which a driver
must not do IO to allocate memory. You cannot do that
while disconnecting a device. A device being disconnected
is no longer functional in most cases, yet IO may fail
only when the handler runs.

v2: extended section for NOIO until after second notifier chain

Signed-off-by: Oliver Neukum <oneukum@suse.com>
---
 drivers/base/core.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/base/core.c b/drivers/base/core.c
index bb5806a2bd4c..b79783454293 100644
--- a/drivers/base/core.c
+++ b/drivers/base/core.c
@@ -26,6 +26,7 @@
 #include <linux/pm_runtime.h>
 #include <linux/netdevice.h>
 #include <linux/sched/signal.h>
+#include <linux/sched/mm.h>
 #include <linux/sysfs.h>
 
 #include "base.h"
@@ -3062,6 +3063,7 @@ void device_del(struct device *dev)
 	struct device *parent = dev->parent;
 	struct kobject *glue_dir = NULL;
 	struct class_interface *class_intf;
+	unsigned int noio_flag;
 
 	device_lock(dev);
 	kill_device(dev);
@@ -3073,6 +3075,7 @@ void device_del(struct device *dev)
 	/* Notify clients of device removal.  This call must come
 	 * before dpm_sysfs_remove().
 	 */
+	noio_flag = memalloc_noio_save();
 	if (dev->bus)
 		blocking_notifier_call_chain(&dev->bus->p->bus_notifier,
 					     BUS_NOTIFY_DEL_DEVICE, dev);
@@ -3114,6 +3117,7 @@ void device_del(struct device *dev)
 	glue_dir = get_glue_dir(dev);
 	kobject_del(&dev->kobj);
 	cleanup_glue_dir(dev, glue_dir);
+	memalloc_noio_restore(noio_flag);
 	put_device(parent);
 }
 EXPORT_SYMBOL_GPL(device_del);
-- 
2.16.4


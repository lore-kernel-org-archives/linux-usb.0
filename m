Return-Path: <SRS0=xQy5=VO=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A6DDC76186
	for <linux-usb@archiver.kernel.org>; Wed, 17 Jul 2019 08:16:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id EAD442173B
	for <linux-usb@archiver.kernel.org>; Wed, 17 Jul 2019 08:16:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725932AbfGQIQC (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Wed, 17 Jul 2019 04:16:02 -0400
Received: from inva021.nxp.com ([92.121.34.21]:59366 "EHLO inva021.nxp.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725873AbfGQIQC (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 17 Jul 2019 04:16:02 -0400
Received: from inva021.nxp.com (localhost [127.0.0.1])
        by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 8D89B20023F;
        Wed, 17 Jul 2019 10:16:00 +0200 (CEST)
Received: from invc005.ap-rdc01.nxp.com (invc005.ap-rdc01.nxp.com [165.114.16.14])
        by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 7A14D200099;
        Wed, 17 Jul 2019 10:15:57 +0200 (CEST)
Received: from titan.ap.freescale.net (TITAN.ap.freescale.net [10.192.208.233])
        by invc005.ap-rdc01.nxp.com (Postfix) with ESMTP id 4CBD5402C3;
        Wed, 17 Jul 2019 16:15:53 +0800 (SGT)
From:   jun.li@nxp.com
To:     linux@roeck-us.net, heikki.krogerus@linux.intel.com
Cc:     gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
        linux-imx@nxp.com
Subject: [PATCH 1/2] usb: typec: tcpm: free log buf memory when remove debug file
Date:   Wed, 17 Jul 2019 16:06:45 +0800
Message-Id: <20190717080646.30421-1-jun.li@nxp.com>
X-Mailer: git-send-email 2.9.5
X-Virus-Scanned: ClamAV using ClamSMTP
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Li Jun <jun.li@nxp.com>

The logbuffer memory should be freed when remove debug file.

Cc: stable@vger.kernel.org # v4.15+
Fixes: 4b4e02c83167 ("typec: tcpm: Move out of staging")
Signed-off-by: Li Jun <jun.li@nxp.com>
---
 drivers/usb/typec/tcpm/tcpm.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/usb/typec/tcpm/tcpm.c b/drivers/usb/typec/tcpm/tcpm.c
index fba32d8..1249d8e 100644
--- a/drivers/usb/typec/tcpm/tcpm.c
+++ b/drivers/usb/typec/tcpm/tcpm.c
@@ -586,6 +586,15 @@ static void tcpm_debugfs_init(struct tcpm_port *port)
 
 static void tcpm_debugfs_exit(struct tcpm_port *port)
 {
+	int i;
+
+	mutex_lock(&port->logbuffer_lock);
+	for (i = 0; i < LOG_BUFFER_ENTRIES; i++) {
+		kfree(port->logbuffer[i]);
+		port->logbuffer[i] = NULL;
+	}
+	mutex_unlock(&port->logbuffer_lock);
+
 	debugfs_remove(port->dentry);
 }
 
-- 
2.7.4


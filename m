Return-Path: <SRS0=k9H8=YO=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 816B0CA9EAF
	for <linux-usb@archiver.kernel.org>; Mon, 21 Oct 2019 11:26:13 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 542F12064A
	for <linux-usb@archiver.kernel.org>; Mon, 21 Oct 2019 11:26:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728507AbfJUL0M (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Mon, 21 Oct 2019 07:26:12 -0400
Received: from mga07.intel.com ([134.134.136.100]:14014 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727620AbfJUL0M (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 21 Oct 2019 07:26:12 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 21 Oct 2019 04:26:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.67,323,1566889200"; 
   d="scan'208";a="209425881"
Received: from black.fi.intel.com (HELO black.fi.intel.com.) ([10.237.72.28])
  by fmsmga001.fm.intel.com with ESMTP; 21 Oct 2019 04:26:10 -0700
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Guenter Roeck <linux@roeck-us.net>, Ajay Gupta <ajayg@nvidia.com>,
        linux-usb@vger.kernel.org
Subject: [PATCH 18/18] usb: typec: ucsi: Optimise ucsi_unregister()
Date:   Mon, 21 Oct 2019 14:25:24 +0300
Message-Id: <20191021112524.79550-19-heikki.krogerus@linux.intel.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191021112524.79550-1-heikki.krogerus@linux.intel.com>
References: <20191021112524.79550-1-heikki.krogerus@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

There is no need to reset the PPM when the interface is
unregistered. Quietly silencing the notifications and then
unregistering everything is enough. This speeds up
ucsi_unregister() a lot.

Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
---
 drivers/usb/typec/ucsi/ucsi.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/usb/typec/ucsi/ucsi.c b/drivers/usb/typec/ucsi/ucsi.c
index 7437c527ba36..e152dd8530d7 100644
--- a/drivers/usb/typec/ucsi/ucsi.c
+++ b/drivers/usb/typec/ucsi/ucsi.c
@@ -1042,15 +1042,14 @@ EXPORT_SYMBOL_GPL(ucsi_register);
  */
 void ucsi_unregister(struct ucsi *ucsi)
 {
-	u64 command;
+	u64 cmd = UCSI_SET_NOTIFICATION_ENABLE;
 	int i;
 
 	/* Make sure that we are not in the middle of driver initialization */
 	cancel_work_sync(&ucsi->work);
 
-	/* Disable everything except command complete notification */
-	command = UCSI_SET_NOTIFICATION_ENABLE | UCSI_ENABLE_NTFY_CMD_COMPLETE;
-	ucsi_send_command(ucsi, command, NULL, 0);
+	/* Disable notifications */
+	ucsi->ops->async_write(ucsi, UCSI_CONTROL, &cmd, sizeof(cmd));
 
 	for (i = 0; i < ucsi->cap.num_connectors; i++) {
 		cancel_work_sync(&ucsi->connector[i].work);
@@ -1060,8 +1059,6 @@ void ucsi_unregister(struct ucsi *ucsi)
 		typec_unregister_port(ucsi->connector[i].port);
 	}
 
-	ucsi_reset_ppm(ucsi);
-
 	kfree(ucsi->connector);
 }
 EXPORT_SYMBOL_GPL(ucsi_unregister);
-- 
2.23.0


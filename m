Return-Path: <SRS0=TXFt=SR=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.9 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0C93C10F0E
	for <linux-usb@archiver.kernel.org>; Mon, 15 Apr 2019 12:09:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 8A7F02077C
	for <linux-usb@archiver.kernel.org>; Mon, 15 Apr 2019 12:09:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727397AbfDOMJp (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Mon, 15 Apr 2019 08:09:45 -0400
Received: from mga12.intel.com ([192.55.52.136]:10510 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727340AbfDOMJo (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 15 Apr 2019 08:09:44 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 15 Apr 2019 05:09:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.60,353,1549958400"; 
   d="scan'208";a="164850780"
Received: from black.fi.intel.com (HELO black.fi.intel.com.) ([10.237.72.28])
  by fmsmga001.fm.intel.com with ESMTP; 15 Apr 2019 05:09:42 -0700
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Ajay Gupta <ajayg@nvidia.com>, linux-usb@vger.kernel.org
Subject: [PATCH v2 6/7] usb: typec: displayport: Export probe and remove functions
Date:   Mon, 15 Apr 2019 15:09:30 +0300
Message-Id: <20190415120931.61328-7-heikki.krogerus@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190415120931.61328-1-heikki.krogerus@linux.intel.com>
References: <20190415120931.61328-1-heikki.krogerus@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190415120930.q1q0TRdSKJgJlkXlc67ap4LeOsXXkiS9siv2xCchxzo@z>

From: Ajay Gupta <ajayg@nvidia.com>

VirtualLink standard extends the DisplayPort Alt Mode by
utilizing also the USB 2 pins on the USB Type-C connector.
It uses the same messages as DisplayPort, but not the DP
SVID. At the time of writing, USB IF has not assigned a
Standard ID (SID) for VirtualLink, so the manufacturers of
VirtualLink adapters use their Vendor IDs as the SVID.

Since the SVID specific communication is exactly the same as
with DisplayPort alternate mode, there is no need to
implement separate driver for VirtualLink. We'll handle the
current VirtualLink adapters with probe drivers, and once
there is SVID assigned for it, we add it to the displayport
alt mode driver.

To support probing drivers, exporting the probe and remove
functions, and also changing the DP_HEADER helper macro to
use the SVID of the alternate mode device instead of the
DisplayPort alt mode SVID.

Suggested-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Signed-off-by: Ajay Gupta <ajayg@nvidia.com>
Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
---
 drivers/usb/typec/altmodes/displayport.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/drivers/usb/typec/altmodes/displayport.c b/drivers/usb/typec/altmodes/displayport.c
index 1b2afeb1eeb6..4092248a5936 100644
--- a/drivers/usb/typec/altmodes/displayport.c
+++ b/drivers/usb/typec/altmodes/displayport.c
@@ -14,7 +14,7 @@
 #include <linux/usb/pd_vdo.h>
 #include <linux/usb/typec_dp.h>
 
-#define DP_HEADER(cmd)			(VDO(USB_TYPEC_DP_SID, 1, cmd) | \
+#define DP_HEADER(_dp, cmd)		(VDO((_dp)->alt->svid, 1, cmd) | \
 					 VDO_OPOS(USB_TYPEC_DP_MODE))
 
 enum {
@@ -155,7 +155,7 @@ static int dp_altmode_configured(struct dp_altmode *dp)
 
 static int dp_altmode_configure_vdm(struct dp_altmode *dp, u32 conf)
 {
-	u32 header = DP_HEADER(DP_CMD_CONFIGURE);
+	u32 header = DP_HEADER(dp, DP_CMD_CONFIGURE);
 	int ret;
 
 	ret = typec_altmode_notify(dp->alt, TYPEC_STATE_SAFE, &dp->data);
@@ -193,7 +193,7 @@ static void dp_altmode_work(struct work_struct *work)
 			dev_err(&dp->alt->dev, "failed to enter mode\n");
 		break;
 	case DP_STATE_UPDATE:
-		header = DP_HEADER(DP_CMD_STATUS_UPDATE);
+		header = DP_HEADER(dp, DP_CMD_STATUS_UPDATE);
 		vdo = 1;
 		ret = typec_altmode_vdm(dp->alt, header, &vdo, 2);
 		if (ret)
@@ -507,7 +507,7 @@ static const struct attribute_group dp_altmode_group = {
 	.attrs = dp_altmode_attrs,
 };
 
-static int dp_altmode_probe(struct typec_altmode *alt)
+int dp_altmode_probe(struct typec_altmode *alt)
 {
 	const struct typec_altmode *port = typec_altmode_get_partner(alt);
 	struct dp_altmode *dp;
@@ -545,14 +545,16 @@ static int dp_altmode_probe(struct typec_altmode *alt)
 
 	return 0;
 }
+EXPORT_SYMBOL_GPL(dp_altmode_probe);
 
-static void dp_altmode_remove(struct typec_altmode *alt)
+void dp_altmode_remove(struct typec_altmode *alt)
 {
 	struct dp_altmode *dp = typec_altmode_get_drvdata(alt);
 
 	sysfs_remove_group(&alt->dev.kobj, &dp_altmode_group);
 	cancel_work_sync(&dp->work);
 }
+EXPORT_SYMBOL_GPL(dp_altmode_remove);
 
 static const struct typec_device_id dp_typec_id[] = {
 	{ USB_TYPEC_DP_SID, USB_TYPEC_DP_MODE },
-- 
2.20.1


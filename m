Return-Path: <SRS0=sojL=SO=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.9 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 609D5C10F14
	for <linux-usb@archiver.kernel.org>; Fri, 12 Apr 2019 15:57:43 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 3A8BB20869
	for <linux-usb@archiver.kernel.org>; Fri, 12 Apr 2019 15:57:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727116AbfDLP5m (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Fri, 12 Apr 2019 11:57:42 -0400
Received: from mga12.intel.com ([192.55.52.136]:29396 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727101AbfDLP5l (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 12 Apr 2019 11:57:41 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 12 Apr 2019 08:57:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.60,341,1549958400"; 
   d="scan'208";a="163892730"
Received: from black.fi.intel.com (HELO black.fi.intel.com.) ([10.237.72.28])
  by fmsmga001.fm.intel.com with ESMTP; 12 Apr 2019 08:57:40 -0700
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Ajay Gupta <ajaykuee@gmail.com>
Cc:     linux-usb@vger.kernel.org
Subject: [RFC PATCH 2/2] usb: typec: ucsi: ccgx: Read the fw build property
Date:   Fri, 12 Apr 2019 18:57:36 +0300
Message-Id: <20190412155736.17274-3-heikki.krogerus@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190412155736.17274-1-heikki.krogerus@linux.intel.com>
References: <20190412155736.17274-1-heikki.krogerus@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190412155736.qUsMrdwPnBYcTWevaBRtK_BmgZ6fzxFBrJcpMfnjo0k@z>

Ajay, please squash this into your patch if it's OK.

I took the liberty of removing one label that was not used.

Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
---
 drivers/usb/typec/ucsi/ucsi_ccg.c | 23 ++++++++++++++++-------
 1 file changed, 16 insertions(+), 7 deletions(-)

diff --git a/drivers/usb/typec/ucsi/ucsi_ccg.c b/drivers/usb/typec/ucsi/ucsi_ccg.c
index 5508beec08e3..50e5ac1d2d0a 100644
--- a/drivers/usb/typec/ucsi/ucsi_ccg.c
+++ b/drivers/usb/typec/ucsi/ucsi_ccg.c
@@ -180,6 +180,8 @@ struct ucsi_ccg {
 	int irq;
 	struct work_struct work;
 	struct mutex lock; /* to sync between user and driver thread */
+
+	u16 fw_build;
 };
 
 static int ccg_read(struct ucsi_ccg *uc, u16 rab, u8 *data, u32 len)
@@ -687,7 +689,7 @@ static bool ccg_check_vendor_version(struct ucsi_ccg *uc,
 	/* Check if the fw build is for supported vendors.
 	 * Add all supported vendors here.
 	 */
-	if (app->build != (('n' << 8) | 'v')) {
+	if (app->build != uc->fw_build) {
 		dev_info(dev, "current fw is not from supported vendor\n");
 		return false;
 	}
@@ -695,7 +697,7 @@ static bool ccg_check_vendor_version(struct ucsi_ccg *uc,
 	/* Check if the new fw build is for supported vendors
 	 * Add all supported vendors here.
 	 */
-	if (fw_cfg->app.build != (('n' << 8) | 'v')) {
+	if (fw_cfg->app.build != uc->fw_build) {
 		dev_info(dev, "new fw is not from supported vendor\n");
 		return false;
 	}
@@ -721,14 +723,14 @@ static bool ccg_check_fw_version(struct ucsi_ccg *uc, const char *fw_name,
 	 * last part of fw image is fw cfg table and signature
 	 */
 	if (fw->size < sizeof(fw_cfg) + FW_CFG_TABLE_SIG_SIZE)
-		goto not_signed_fw;
+		goto out_release_firmware;
 
 	memcpy((uint8_t *)&fw_cfg, fw->data + fw->size -
 	       sizeof(fw_cfg) - FW_CFG_TABLE_SIG_SIZE, sizeof(fw_cfg));
 
 	if (fw_cfg.identity != ('F' | 'W' << 8 | 'C' << 16 | 'T' << 24)) {
 		dev_info(dev, "not a signed image\n");
-		goto not_signed_fw;
+		goto out_release_firmware;
 	}
 
 	/* compare input version with FWCT version */
@@ -738,13 +740,12 @@ static bool ccg_check_fw_version(struct ucsi_ccg *uc, const char *fw_name,
 			fw_cfg.app.ver << 24;
 
 	if (!ccg_check_vendor_version(uc, app, &fw_cfg))
-		goto not_supported_version;
+		goto out_release_firmware;
 
 	if (new_version > cur_version)
 		is_later = true;
 
-not_supported_version:
-not_signed_fw:
+out_release_firmware:
 	release_firmware(fw);
 	return is_later;
 }
@@ -1085,6 +1086,14 @@ static int ucsi_ccg_probe(struct i2c_client *client,
 	mutex_init(&uc->lock);
 	INIT_WORK(&uc->work, ccg_update_firmware);
 
+	/* REVISIT: This probable does not need to be fatal. */
+	status = device_property_read_u16(dev, "ccgx,firmware-build",
+					  &uc->fw_build);
+	if (status) {
+		dev_err(uc->dev, "faild to get FW build\n");
+		return status;
+	}
+
 	/* reset ccg device and initialize ucsi */
 	status = ucsi_ccg_init(uc);
 	if (status < 0) {
-- 
2.20.1


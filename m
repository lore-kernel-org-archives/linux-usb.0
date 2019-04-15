Return-Path: <SRS0=TXFt=SR=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.9 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33A68C10F0E
	for <linux-usb@archiver.kernel.org>; Mon, 15 Apr 2019 12:09:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 0A70A2075B
	for <linux-usb@archiver.kernel.org>; Mon, 15 Apr 2019 12:09:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727186AbfDOMJh (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Mon, 15 Apr 2019 08:09:37 -0400
Received: from mga12.intel.com ([192.55.52.136]:10510 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726095AbfDOMJh (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 15 Apr 2019 08:09:37 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 15 Apr 2019 05:09:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.60,353,1549958400"; 
   d="scan'208";a="164850771"
Received: from black.fi.intel.com (HELO black.fi.intel.com.) ([10.237.72.28])
  by fmsmga001.fm.intel.com with ESMTP; 15 Apr 2019 05:09:35 -0700
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Ajay Gupta <ajayg@nvidia.com>, linux-usb@vger.kernel.org
Subject: [PATCH v2 2/7] usb: typec: ucsi: ccg: add get_fw_info function
Date:   Mon, 15 Apr 2019 15:09:26 +0300
Message-Id: <20190415120931.61328-3-heikki.krogerus@linux.intel.com>
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
Message-ID: <20190415120926.lAIZJknPruQsanoSaHEm9_Ump_JmrVLmin9cMEplgbU@z>

From: Ajay Gupta <ajayg@nvidia.com>

Function is to get the details of ccg firmware and device version.
It will be useful in debugging and also during firmware update.

Signed-off-by: Ajay Gupta <ajayg@nvidia.com>
Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
---
 drivers/usb/typec/ucsi/ucsi_ccg.c | 66 ++++++++++++++++++++++++++++++-
 1 file changed, 64 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/typec/ucsi/ucsi_ccg.c b/drivers/usb/typec/ucsi/ucsi_ccg.c
index de8a43bdff68..3884fb41c72e 100644
--- a/drivers/usb/typec/ucsi/ucsi_ccg.c
+++ b/drivers/usb/typec/ucsi/ucsi_ccg.c
@@ -17,15 +17,54 @@
 #include <asm/unaligned.h>
 #include "ucsi.h"
 
+enum enum_fw_mode {
+	BOOT,   /* bootloader */
+	FW1,    /* FW partition-1 (contains secondary fw) */
+	FW2,    /* FW partition-2 (contains primary fw) */
+	FW_INVALID,
+};
+
+struct ccg_dev_info {
+#define CCG_DEVINFO_FWMODE_SHIFT (0)
+#define CCG_DEVINFO_FWMODE_MASK (0x3 << CCG_DEVINFO_FWMODE_SHIFT)
+#define CCG_DEVINFO_PDPORTS_SHIFT (2)
+#define CCG_DEVINFO_PDPORTS_MASK (0x3 << CCG_DEVINFO_PDPORTS_SHIFT)
+	u8 mode;
+	u8 bl_mode;
+	__le16 silicon_id;
+	__le16 bl_last_row;
+} __packed;
+
+struct version_format {
+	__le16 build;
+	u8 patch;
+	u8 ver;
+#define CCG_VERSION_MIN_SHIFT (0)
+#define CCG_VERSION_MIN_MASK (0xf << CCG_VERSION_MIN_SHIFT)
+#define CCG_VERSION_MAJ_SHIFT (4)
+#define CCG_VERSION_MAJ_MASK (0xf << CCG_VERSION_MAJ_SHIFT)
+} __packed;
+
+struct version_info {
+	struct version_format base;
+	struct version_format app;
+};
+
 struct ucsi_ccg {
 	struct device *dev;
 	struct ucsi *ucsi;
 	struct ucsi_ppm ppm;
 	struct i2c_client *client;
+	struct ccg_dev_info info;
+	/* version info for boot, primary and secondary */
+	struct version_info version[FW2 + 1];
 };
 
-#define CCGX_RAB_INTR_REG			0x06
-#define CCGX_RAB_UCSI_CONTROL			0x39
+#define CCGX_RAB_DEVICE_MODE			0x0000
+#define CCGX_RAB_INTR_REG			0x0006
+#define CCGX_RAB_READ_ALL_VER			0x0010
+#define CCGX_RAB_READ_FW2_VER			0x0020
+#define CCGX_RAB_UCSI_CONTROL			0x0039
 #define CCGX_RAB_UCSI_CONTROL_START		BIT(0)
 #define CCGX_RAB_UCSI_CONTROL_STOP		BIT(1)
 #define CCGX_RAB_UCSI_DATA_BLOCK(offset)	(0xf000 | ((offset) & 0xff))
@@ -220,6 +259,23 @@ static irqreturn_t ccg_irq_handler(int irq, void *data)
 	return IRQ_HANDLED;
 }
 
+static int get_fw_info(struct ucsi_ccg *uc)
+{
+	int err;
+
+	err = ccg_read(uc, CCGX_RAB_READ_ALL_VER, (u8 *)(&uc->version),
+		       sizeof(uc->version));
+	if (err < 0)
+		return err;
+
+	err = ccg_read(uc, CCGX_RAB_DEVICE_MODE, (u8 *)(&uc->info),
+		       sizeof(uc->info));
+	if (err < 0)
+		return err;
+
+	return 0;
+}
+
 static int ucsi_ccg_probe(struct i2c_client *client,
 			  const struct i2c_device_id *id)
 {
@@ -248,6 +304,12 @@ static int ucsi_ccg_probe(struct i2c_client *client,
 		return status;
 	}
 
+	status = get_fw_info(uc);
+	if (status < 0) {
+		dev_err(uc->dev, "get_fw_info failed - %d\n", status);
+		return status;
+	}
+
 	status = devm_request_threaded_irq(dev, client->irq, NULL,
 					   ccg_irq_handler,
 					   IRQF_ONESHOT | IRQF_TRIGGER_HIGH,
-- 
2.20.1


Return-Path: <SRS0=tIEv=SZ=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.9 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1997C282DD
	for <linux-usb@archiver.kernel.org>; Tue, 23 Apr 2019 14:22:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 8A8AC214AE
	for <linux-usb@archiver.kernel.org>; Tue, 23 Apr 2019 14:22:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728160AbfDWOWH (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Tue, 23 Apr 2019 10:22:07 -0400
Received: from mga01.intel.com ([192.55.52.88]:63198 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728137AbfDWOWG (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 23 Apr 2019 10:22:06 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 23 Apr 2019 07:22:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.60,386,1549958400"; 
   d="scan'208";a="167140067"
Received: from black.fi.intel.com (HELO black.fi.intel.com.) ([10.237.72.28])
  by fmsmga001.fm.intel.com with ESMTP; 23 Apr 2019 07:22:04 -0700
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Ajay Gupta <ajayg@nvidia.com>, linux-usb@vger.kernel.org
Subject: [PATCH v4 7/7] usb: typec: Add driver for NVIDIA Alt Modes
Date:   Tue, 23 Apr 2019 17:21:51 +0300
Message-Id: <20190423142151.26135-8-heikki.krogerus@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190423142151.26135-1-heikki.krogerus@linux.intel.com>
References: <20190423142151.26135-1-heikki.krogerus@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190423142151._eCxPdJryrXrlx1ekRPKmbWAwpGBc8gTTXSvGkgDWvU@z>

From: Ajay Gupta <ajayg@nvidia.com>

Latest NVIDIA GPUs support VirtualLink device. Since USBIF
has not assigned a Standard ID (SID) for VirtualLink
so using NVIDA VID 0x955 as SVID.

Signed-off-by: Ajay Gupta <ajayg@nvidia.com>
Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
---
 drivers/usb/typec/altmodes/Kconfig  | 10 +++++++
 drivers/usb/typec/altmodes/Makefile |  2 ++
 drivers/usb/typec/altmodes/nvidia.c | 44 +++++++++++++++++++++++++++++
 drivers/usb/typec/ucsi/ucsi.c       |  4 ++-
 include/linux/usb/typec_dp.h        |  5 ++++
 5 files changed, 64 insertions(+), 1 deletion(-)
 create mode 100644 drivers/usb/typec/altmodes/nvidia.c

diff --git a/drivers/usb/typec/altmodes/Kconfig b/drivers/usb/typec/altmodes/Kconfig
index ef2226eb7a33..187690fd1a5b 100644
--- a/drivers/usb/typec/altmodes/Kconfig
+++ b/drivers/usb/typec/altmodes/Kconfig
@@ -12,4 +12,14 @@ config TYPEC_DP_ALTMODE
 	  To compile this driver as a module, choose M here: the
 	  module will be called typec_displayport.
 
+config TYPEC_NVIDIA_ALTMODE
+	tristate "NVIDIA Alternate Mode driver"
+	depends on TYPEC_DP_ALTMODE
+	help
+	  Latest NVIDIA GPUs support VirtualLink devices. Select this
+	  to enable support for VirtualLink devices with NVIDIA GPUs.
+
+	  To compile this driver as a module, choose M here: the
+	  module will be called typec_displayport.
+
 endmenu
diff --git a/drivers/usb/typec/altmodes/Makefile b/drivers/usb/typec/altmodes/Makefile
index eda8456f1c92..45717548b396 100644
--- a/drivers/usb/typec/altmodes/Makefile
+++ b/drivers/usb/typec/altmodes/Makefile
@@ -2,3 +2,5 @@
 
 obj-$(CONFIG_TYPEC_DP_ALTMODE)		+= typec_displayport.o
 typec_displayport-y			:= displayport.o
+obj-$(CONFIG_TYPEC_NVIDIA_ALTMODE)	+= typec_nvidia.o
+typec_nvidia-y				:= nvidia.o
diff --git a/drivers/usb/typec/altmodes/nvidia.c b/drivers/usb/typec/altmodes/nvidia.c
new file mode 100644
index 000000000000..c36769736405
--- /dev/null
+++ b/drivers/usb/typec/altmodes/nvidia.c
@@ -0,0 +1,44 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2019 NVIDIA Corporation. All rights reserved.
+ *
+ * NVIDIA USB Type-C Alt Mode Driver
+ */
+#include <linux/module.h>
+#include <linux/usb/typec_altmode.h>
+#include <linux/usb/typec_dp.h>
+#include "displayport.h"
+
+static int nvidia_altmode_probe(struct typec_altmode *alt)
+{
+	if (alt->svid == USB_TYPEC_NVIDIA_VLINK_SID)
+		return dp_altmode_probe(alt);
+	else
+		return -ENOTSUPP;
+}
+
+static void nvidia_altmode_remove(struct typec_altmode *alt)
+{
+	if (alt->svid == USB_TYPEC_NVIDIA_VLINK_SID)
+		dp_altmode_remove(alt);
+}
+
+static const struct typec_device_id nvidia_typec_id[] = {
+	{ USB_TYPEC_NVIDIA_VLINK_SID, TYPEC_ANY_MODE },
+	{ },
+};
+MODULE_DEVICE_TABLE(typec, nvidia_typec_id);
+
+static struct typec_altmode_driver nvidia_altmode_driver = {
+	.id_table = nvidia_typec_id,
+	.probe = nvidia_altmode_probe,
+	.remove = nvidia_altmode_remove,
+	.driver = {
+		.name = "typec_nvidia",
+		.owner = THIS_MODULE,
+	},
+};
+module_typec_altmode_driver(nvidia_altmode_driver);
+
+MODULE_LICENSE("GPL v2");
+MODULE_DESCRIPTION("NVIDIA USB Type-C Alt Mode Driver");
diff --git a/drivers/usb/typec/ucsi/ucsi.c b/drivers/usb/typec/ucsi/ucsi.c
index b4fb2e05d2e5..7850b851cecd 100644
--- a/drivers/usb/typec/ucsi/ucsi.c
+++ b/drivers/usb/typec/ucsi/ucsi.c
@@ -283,6 +283,7 @@ static int ucsi_register_altmode(struct ucsi_connector *con,
 
 		switch (desc->svid) {
 		case USB_TYPEC_DP_SID:
+		case USB_TYPEC_NVIDIA_VLINK_SID:
 			alt = ucsi_register_displayport(con, override, i, desc);
 			break;
 		default:
@@ -404,7 +405,8 @@ static void ucsi_unregister_altmodes(struct ucsi_connector *con, u8 recipient)
 
 	while (adev[i]) {
 		if (recipient == UCSI_RECIPIENT_SOP &&
-		    adev[i]->svid == USB_TYPEC_DP_SID) {
+		    (adev[i]->svid == USB_TYPEC_DP_SID ||
+			adev[i]->svid == USB_TYPEC_NVIDIA_VLINK_SID)) {
 			pdev = typec_altmode_get_partner(adev[i]);
 			ucsi_displayport_remove_partner((void *)pdev);
 		}
diff --git a/include/linux/usb/typec_dp.h b/include/linux/usb/typec_dp.h
index 7fa12ef8d09a..fc4c7edb2e8a 100644
--- a/include/linux/usb/typec_dp.h
+++ b/include/linux/usb/typec_dp.h
@@ -5,6 +5,11 @@
 #include <linux/usb/typec_altmode.h>
 
 #define USB_TYPEC_DP_SID	0xff01
+/* USB IF has not assigned a Standard ID (SID) for VirtualLink,
+ * so the manufacturers of VirtualLink adapters use their Vendor
+ * IDs as the SVID.
+ */
+#define USB_TYPEC_NVIDIA_VLINK_SID	0x955	/* NVIDIA VirtualLink */
 #define USB_TYPEC_DP_MODE	1
 
 /*
-- 
2.20.1


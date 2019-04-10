Return-Path: <SRS0=X9rV=SM=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6FF95C282CE
	for <linux-usb@archiver.kernel.org>; Wed, 10 Apr 2019 19:51:12 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 3ED0820820
	for <linux-usb@archiver.kernel.org>; Wed, 10 Apr 2019 19:51:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BKFY6JtG"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726794AbfDJTvL (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Wed, 10 Apr 2019 15:51:11 -0400
Received: from mail-pf1-f193.google.com ([209.85.210.193]:45746 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726856AbfDJTvK (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 10 Apr 2019 15:51:10 -0400
Received: by mail-pf1-f193.google.com with SMTP id e24so2079812pfi.12
        for <linux-usb@vger.kernel.org>; Wed, 10 Apr 2019 12:51:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=i41RtPXA9JcCVezacaHuLFatc3IsRIgnz4SFTcDTI38=;
        b=BKFY6JtGU+cAuJAM3bWam3wnfDcZ8ePoN/pUIhgYt2Jj76lkMlPbFG/LmvAafzBFX+
         TJQ7LIoi6rH2A+TOaSt9rba6zX/25V47Pq1U/abIz80RQGoS3hVFCDt1FzVD3kVt40YI
         4RVuh6PBvA/WZiLwp4uiZE8v4oKhH1+A++8NBoBAz3MGWkCUfAtkU/Wg8/bNV24m+dix
         QS0mX9t9zWGYUSXnk3wEKXSDbyEuy1bVnIgpH31QhJXOam9XofIVAhFcf7KHIuS+BWql
         Iw/ral4QPCtRlFxke/f5vkNTpka+XQ1PpAVxHKv4AS7TsbW4ifSPeG1u+CIR4lk+ydp1
         H23g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=i41RtPXA9JcCVezacaHuLFatc3IsRIgnz4SFTcDTI38=;
        b=G4vRRUzWdyJ+bDf0ADLDC3TZIDms8PYfEmVh9jlaS8y0tv9yT+XTeuboStq4IkkHZb
         FPtxRbXV1L5NLL61gKEqyGz/uY/HzeE0vdSKaRvDZLQHD2reRGE/1a5zjCMueE0XJ5zj
         lmnvaIjXK1Q9kqOufuUqItEc8bOINqgAALpC46M5ks+6N/L4JwBMfHX71Kw12Hy1MIQJ
         FKYjQmw9kKV/+LxdtyA2v0pAwZAa9jLmfVm53CCwJ/7RKvVsfBmaRjlhh4nq/ADqSucT
         lX40jOf4QYLDop92QmGTcw7d55fKRSEWboqdDgGEL2wIx7iPra+YcdL7RJx3rkQPcZtt
         ci9Q==
X-Gm-Message-State: APjAAAWVaF98QeHP5HORuNIXouitXqVd2pue6ic1F7Md+MZ/86UqIogk
        ziKgnpRQ5XQU+T0HyfE7ebowEQaU
X-Google-Smtp-Source: APXvYqwlLU1Lp/00aRAFf/FVXzoSSoraLkshjjWC7LtebImO/+aQ5hCJb5cpEHkm23l8oeqVeuXa+g==
X-Received: by 2002:a63:5b0a:: with SMTP id p10mr43206561pgb.282.1554925868878;
        Wed, 10 Apr 2019 12:51:08 -0700 (PDT)
Received: from ajayg.nvidia.com (searspoint.nvidia.com. [216.228.112.21])
        by smtp.gmail.com with ESMTPSA id g4sm4485786pfc.75.2019.04.10.12.51.07
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 10 Apr 2019 12:51:08 -0700 (PDT)
From:   Ajay Gupta <ajaykuee@gmail.com>
X-Google-Original-From: Ajay Gupta <ajayg@nvidia.com>
To:     heikki.krogerus@linux.intel.com
Cc:     linux-usb@vger.kernel.org, Ajay Gupta <ajayg@nvidia.com>
Subject: [PATCH 2/2] usb: typec: Add driver for NVIDIA Alt Modes
Date:   Wed, 10 Apr 2019 12:50:58 -0700
Message-Id: <20190410195058.9996-3-ajayg@nvidia.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190410195058.9996-1-ajayg@nvidia.com>
References: <20190410195058.9996-1-ajayg@nvidia.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190410195058.YdIobI6FmTYht8DNdBq8JtXvSdIRR_Yyx-XqXWMYUhk@z>

From: Ajay Gupta <ajayg@nvidia.com>

Latest NVIDIA GPUs support VirtualLink device. Since USBIF
has not assigned a Standard ID (SID) for VirtualLink
so using NVIDA VID 0x955 as SVID.

Signed-off-by: Ajay Gupta <ajayg@nvidia.com>
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
index 46feae074d8f..a8c8e66621ec 100644
--- a/drivers/usb/typec/ucsi/ucsi.c
+++ b/drivers/usb/typec/ucsi/ucsi.c
@@ -306,6 +306,7 @@ static int ucsi_register_altmode(struct ucsi_connector *con,
 
 		switch (desc->svid) {
 		case USB_TYPEC_DP_SID:
+		case USB_TYPEC_NVIDIA_VLINK_SID:
 			alt = ucsi_register_displayport(con, override, i, desc);
 			break;
 		default:
@@ -424,7 +425,8 @@ static void ucsi_unregister_altmodes(struct ucsi_connector *con, u8 recipient)
 
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
2.17.1


Return-Path: <SRS0=lM5t=SS=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2343C10F14
	for <linux-usb@archiver.kernel.org>; Tue, 16 Apr 2019 17:28:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id B3A4A20872
	for <linux-usb@archiver.kernel.org>; Tue, 16 Apr 2019 17:28:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gc4syPaw"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728712AbfDPR21 (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Tue, 16 Apr 2019 13:28:27 -0400
Received: from mail-pg1-f195.google.com ([209.85.215.195]:36163 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726860AbfDPR20 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 16 Apr 2019 13:28:26 -0400
Received: by mail-pg1-f195.google.com with SMTP id 85so10670574pgc.3
        for <linux-usb@vger.kernel.org>; Tue, 16 Apr 2019 10:28:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=dGMKlHn2nVjZ2qp5+13xeEBAeDuKqkfeoblCTJUD804=;
        b=gc4syPawr47TKnw/dgQcI3XlWWNaCjrmegbE/rE7JE1tunUNQFU2nutcLeaAgrFDvB
         vdRJxOBI7tUS9g+xwEfJNjlNBVzvW7hEukJ+QjS4Hh9mcCmjd3dlYBAZo8eHL4dlApiW
         l2XMsZ+pEE74N7TGXUqib7jpbxOokQF0xr8Xtef5NnxZgejua8ppcRFR3wbkvDXEdszW
         r/LqpVE6qOpyrrHUJ8xezCWsq0yW+9Vuq3kHY31/JV+OkwJXD0QtYa2zIdOjlpC/K1iA
         yvw+tWTthj9+CTZxplBgt/lMruq4iJGEr1EhUPA9HkR8W53wF8jGNT8i5cMIx+LDNikK
         A7Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=dGMKlHn2nVjZ2qp5+13xeEBAeDuKqkfeoblCTJUD804=;
        b=tv+QIvNMmJLO0OAuD5bSdWO1/a2d3V5syz1FLGgATsGvzXPvQShE5dtKPAHuWjBTUu
         mFj+mV4nxh5lA7tv4M7OcJqM3YPhhU1wAMovP6nv3KlzlZpxbrt1VMzUxntMFw4+vJcM
         N2Zs3MflL3vLNlKe0BUGUQEoT8XwWc4USdIAb84AwmqrvtTO97qymdGX5BYatXyB0nCJ
         DIhlKC+MJ2f5aScpdTaZs6PHNQrk3BkHi/EX5OucgNfPrlYEy4HRcQFv7mv+GzFPMrO/
         K0MGrtrnEJSxqrVwVw94NMRwTT5CW0wRnhUYh3GdaNTirIjknwf8iNmRYqXU1S9LVRuv
         QjGw==
X-Gm-Message-State: APjAAAWS9j9QLX13swLbVNGaCX8bfirB7fLazhOdHtCiorqCDrD6xUiS
        bVwbdtT5VIYrj1IesBK88ag=
X-Google-Smtp-Source: APXvYqzo1CwK5QQ++KmdFGg2PWvxS5VkY0oBi0cJRf7UiBBxHI8YNZcLX2+y2mKnr7eWvSbclRjCeg==
X-Received: by 2002:a63:6142:: with SMTP id v63mr79799982pgb.342.1555435706048;
        Tue, 16 Apr 2019 10:28:26 -0700 (PDT)
Received: from ajayg.nvidia.com (searspoint.nvidia.com. [216.228.112.21])
        by smtp.gmail.com with ESMTPSA id k124sm85026233pgc.65.2019.04.16.10.28.25
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 16 Apr 2019 10:28:25 -0700 (PDT)
From:   Ajay Gupta <ajaykuee@gmail.com>
X-Google-Original-From: Ajay Gupta <ajayg@nvidia.com>
To:     heikki.krogerus@linux.intel.com
Cc:     linux-usb@vger.kernel.org, Ajay Gupta <ajayg@nvidia.com>
Subject: [PATCH v8 1/3] usb: typec: ucsi: ccg: add get_fw_info function
Date:   Tue, 16 Apr 2019 10:27:45 -0700
Message-Id: <20190416172747.22139-2-ajayg@nvidia.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190416172747.22139-1-ajayg@nvidia.com>
References: <20190416172747.22139-1-ajayg@nvidia.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190416172745.mnJdy4BhtPkKOOyk_q7eVSBoN6mUBTpmbtJLdOpzQeg@z>

From: Ajay Gupta <ajayg@nvidia.com>

Function is to get the details of ccg firmware and device version.
It will be useful in debugging and also during firmware update.

Signed-off-by: Ajay Gupta <ajayg@nvidia.com>
Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
---
Changes from v7 -> v8
	- None

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
2.17.1


Return-Path: <SRS0=sojL=SO=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 333B8C10F0E
	for <linux-usb@archiver.kernel.org>; Fri, 12 Apr 2019 19:06:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 0541620818
	for <linux-usb@archiver.kernel.org>; Fri, 12 Apr 2019 19:06:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="tBLazjDq"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727011AbfDLTGp (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Fri, 12 Apr 2019 15:06:45 -0400
Received: from mail-pl1-f194.google.com ([209.85.214.194]:35477 "EHLO
        mail-pl1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726815AbfDLTGo (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 12 Apr 2019 15:06:44 -0400
Received: by mail-pl1-f194.google.com with SMTP id w24so5566129plp.2
        for <linux-usb@vger.kernel.org>; Fri, 12 Apr 2019 12:06:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=DRPocUE8WKEeXFVpYST5j7H7BWcZxEGItilfo5R/UWw=;
        b=tBLazjDqBVvIJWvEPXkOiafHrGHszojYIr9kAPCthWtRp0UigspG3PGLgryjdESG/7
         qPEzxUmLndwelr1D0jHKckyiJ/kpdnXVjUjz4cur1VmzSxxmCToNBxM6KcqhtzdnHthP
         mXbEKHx4VddaT+80HirIzBOQpmgavlxn/Od2kHvt8Th3Yza7AznFwS2FimRYhGrd17mQ
         512g+dg6UxJnJ99jTc8QFAAW7MKxJUlzuHI/AA82HHcTEzVuobxYV9wwXdZUtfoiS4k0
         +WPJTl1j3CLOd9UJbPcrLtpqpymb/8R5CrGk2Rm6ATqgdru54t/hcIpuS6slLmA/uUyl
         yC0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=DRPocUE8WKEeXFVpYST5j7H7BWcZxEGItilfo5R/UWw=;
        b=AtUbkuftJWbZgCm8tZdF/ecUr09jqD+rYBCupjyDRd3QB9sYljlQMdx0yaoYcObsTz
         XI17kKhd6QgoFetYEjrgEvtzy6CL6x2Gd3DnoTpxsbGOtpnhvFNvMjSo/t6QQvi/dFaQ
         mGOU6FaJCioGatC/NUTSnetjm53R9pSdS18TNn2XI42Nm5h+HF0euteyS+UBhtW8XFYK
         by2RGl1O4VuRcA+M7vfUxCNeyXaEaWJehgpBOhKUlJakxwAS+6w0k6QPy1MbDiwDBWeS
         8Njm5OG9G+LKz/VnS5180Z9DuS/hldgQLa/emWm4ECTb2d5hzW7DERoZLWjYFv+P6h9f
         ptKg==
X-Gm-Message-State: APjAAAWjZCU5iEnKYsm0eH5Fd4UtvVPf+Ah/K23MfPZgS8WVa21PWoea
        ZZBTaH5UqLouhtWIgNkwjOILL2zuG0g=
X-Google-Smtp-Source: APXvYqws2HXlpg3JBlcE27H7SPyvYsz/VVlZT7Ba6ozHgIKC78R3kW+kRztZzCgp6K57ObrtxQiahQ==
X-Received: by 2002:a17:902:be04:: with SMTP id r4mr60033330pls.218.1555096003960;
        Fri, 12 Apr 2019 12:06:43 -0700 (PDT)
Received: from ajayg.nvidia.com (searspoint.nvidia.com. [216.228.112.21])
        by smtp.gmail.com with ESMTPSA id c3sm58760133pfo.2.2019.04.12.12.06.42
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 12 Apr 2019 12:06:43 -0700 (PDT)
From:   Ajay Gupta <ajaykuee@gmail.com>
X-Google-Original-From: Ajay Gupta <ajayg@nvidia.com>
To:     heikki.krogerus@linux.intel.com
Cc:     linux-usb@vger.kernel.org, Ajay Gupta <ajayg@nvidia.com>
Subject: [PATCH v7 1/3] usb: typec: ucsi: ccg: add get_fw_info function
Date:   Fri, 12 Apr 2019 12:06:21 -0700
Message-Id: <20190412190623.26945-2-ajayg@nvidia.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190412190623.26945-1-ajayg@nvidia.com>
References: <20190412190623.26945-1-ajayg@nvidia.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190412190621.cyulXEC0_0scV67j_qwkkSKuh4IxcgRalJ1pLTJ1AVo@z>

Function is to get the details of ccg firmware and device version.
It will be useful in debugging and also during firmware update.

Signed-off-by: Ajay Gupta <ajayg@nvidia.com>
Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
---
Changes from v6 to v7
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


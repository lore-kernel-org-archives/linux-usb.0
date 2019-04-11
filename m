Return-Path: <SRS0=u5rC=SN=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 048E5C10F14
	for <linux-usb@archiver.kernel.org>; Thu, 11 Apr 2019 20:03:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id C308720850
	for <linux-usb@archiver.kernel.org>; Thu, 11 Apr 2019 20:03:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="J6rHDzm+"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726667AbfDKUD0 (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Thu, 11 Apr 2019 16:03:26 -0400
Received: from mail-pf1-f193.google.com ([209.85.210.193]:35681 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726577AbfDKUDZ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 11 Apr 2019 16:03:25 -0400
Received: by mail-pf1-f193.google.com with SMTP id t21so3973500pfh.2
        for <linux-usb@vger.kernel.org>; Thu, 11 Apr 2019 13:03:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=v+Tgxfcou92wUpCjGv9PntjB0Kbc9s02uFIb05N0kyM=;
        b=J6rHDzm+eH+52RXJ/u9AvCG4hduyWEqwyLxUBjM7i+lUSKlGIJ7naLyc8wcvHjBQeY
         b6CiMGVAk1e+b0SqFnpv3Tu3ZiLwQQ+83XYw/Z/bMXinpGtQv5zrzytgXr4LAmpt+R/P
         6/T9K6GdNiLbSdrtVISTKfnopStK+QVyAT36Nlg6GI6S+9H9NBcQHRgBjwXBry/qFP9k
         k2cfqrLYHqtEctGYVNitN/aWUL/jXqvZqWuPl/k6mmtSeDuCAKmObPk/TtA3lTVDYuJ+
         no6+9dk0JMcsLMFbTjayHNEecyoGjxCTaG+f9w+gjk4blGACajiotWcMx5dIquc05xDE
         Qxlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=v+Tgxfcou92wUpCjGv9PntjB0Kbc9s02uFIb05N0kyM=;
        b=Rcy0ahKt5wa47Wtb91TBtgFK8Fsmlkr3b047bqcAuoXJalap6lNWt6weJ+oKc7Ku2Y
         0Evqv8n/DqbQXb+AmWedfx/e0fFfkGVaGk/hMYkh+XTBm7Wmd+YzTdBbmcOrwQ5Z2wSA
         HlZCjC3AD4M5cjSsYHUtq82RNyVNM10ljzS3XjSHNPFdGss/slH8I3G3EGQXUv2rHwOu
         98otUn1YhnRfXRo2XP+P4fPIEyPtY5CktU44T8PqIdtOcMQxjXSOQAP++qEWaPygOKKH
         BsjHTOiKy3nGeJTjg0a96kXYsQ0WtZhHfTsUzv10N/6zyY9oQRQ1G6p4E6FgWTkPCi2k
         Cb+A==
X-Gm-Message-State: APjAAAX4yt2Z0iid+EccN350jxHJ8xCjZhovyYa6epPXjor7Cyj38K8Y
        Djz2Rb2yE+qO4F4gFgpE7Bk=
X-Google-Smtp-Source: APXvYqwDWQZwu3xAng7gn0xPpmm/6slVQbRSJtSlnMhCTn10hZeUEJYB5gFRrtWTGKahDO5TplezoQ==
X-Received: by 2002:a63:744b:: with SMTP id e11mr48573395pgn.327.1555013005042;
        Thu, 11 Apr 2019 13:03:25 -0700 (PDT)
Received: from ajayg.nvidia.com (searspoint.nvidia.com. [216.228.112.21])
        by smtp.gmail.com with ESMTPSA id n26sm107920326pfi.165.2019.04.11.13.03.24
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 11 Apr 2019 13:03:24 -0700 (PDT)
From:   Ajay Gupta <ajaykuee@gmail.com>
X-Google-Original-From: Ajay Gupta <ajayg@nvidia.com>
To:     heikki.krogerus@linux.intel.com
Cc:     linux-usb@vger.kernel.org, Ajay Gupta <ajayg@nvidia.com>
Subject: [PATCH v6 1/2] usb: typec: ucsi: ccg: add get_fw_info function
Date:   Thu, 11 Apr 2019 13:03:09 -0700
Message-Id: <20190411200310.9775-2-ajayg@nvidia.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190411200310.9775-1-ajayg@nvidia.com>
References: <20190411200310.9775-1-ajayg@nvidia.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190411200309.Q2DGxfEGRlbNGDHFKSbNfhVH-MXWLIqhFrO327kLTX0@z>

Function is to get the details of ccg firmware and device version.
It will be useful in debugging and also during firmware update.

Signed-off-by: Ajay Gupta <ajayg@nvidia.com>
Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
---
Changes from v5 to v6
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


Return-Path: <SRS0=sojL=SO=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.9 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DBA62C10F14
	for <linux-usb@archiver.kernel.org>; Fri, 12 Apr 2019 15:57:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id B042620869
	for <linux-usb@archiver.kernel.org>; Fri, 12 Apr 2019 15:57:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727112AbfDLP5k (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Fri, 12 Apr 2019 11:57:40 -0400
Received: from mga12.intel.com ([192.55.52.136]:29396 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727101AbfDLP5k (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 12 Apr 2019 11:57:40 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 12 Apr 2019 08:57:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.60,341,1549958400"; 
   d="scan'208";a="163892722"
Received: from black.fi.intel.com (HELO black.fi.intel.com.) ([10.237.72.28])
  by fmsmga001.fm.intel.com with ESMTP; 12 Apr 2019 08:57:38 -0700
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Ajay Gupta <ajaykuee@gmail.com>
Cc:     linux-usb@vger.kernel.org
Subject: [RFC PATCH 1/2] i2c: nvidia-gpu: Supply CCGx driver the firmware build information
Date:   Fri, 12 Apr 2019 18:57:35 +0300
Message-Id: <20190412155736.17274-2-heikki.krogerus@linux.intel.com>
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
Message-ID: <20190412155735.uTGmKN44T_nWpzrz2F9NScrXnRkGRQtkCOyK13EJlbc@z>

Adding device property "ccgx,firmware-build" for the CCGx
device, so the CCGx driver knows the which firmware build it
needs to be dealing with.

Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
---
 drivers/i2c/busses/i2c-nvidia-gpu.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/i2c/busses/i2c-nvidia-gpu.c b/drivers/i2c/busses/i2c-nvidia-gpu.c
index 4e67d5ed480e..5604323ee0b9 100644
--- a/drivers/i2c/busses/i2c-nvidia-gpu.c
+++ b/drivers/i2c/busses/i2c-nvidia-gpu.c
@@ -253,6 +253,11 @@ static const struct pci_device_id gpu_i2c_ids[] = {
 };
 MODULE_DEVICE_TABLE(pci, gpu_i2c_ids);
 
+static const struct property_entry ccgx_props[] = {
+	PROPERTY_ENTRY_U16("ccgx,firmware-build", 0x766e),
+	{ }
+};
+
 static int gpu_populate_client(struct gpu_i2c_dev *i2cd, int irq)
 {
 	struct i2c_client *ccgx_client;
@@ -267,6 +272,7 @@ static int gpu_populate_client(struct gpu_i2c_dev *i2cd, int irq)
 		sizeof(i2cd->gpu_ccgx_ucsi->type));
 	i2cd->gpu_ccgx_ucsi->addr = 0x8;
 	i2cd->gpu_ccgx_ucsi->irq = irq;
+	i2cd->gpu_ccgx_ucsi->properties = ccgx_props;
 	ccgx_client = i2c_new_device(&i2cd->adapter, i2cd->gpu_ccgx_ucsi);
 	if (!ccgx_client)
 		return -ENODEV;
-- 
2.20.1


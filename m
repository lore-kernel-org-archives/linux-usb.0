Return-Path: <SRS0=TXFt=SR=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.9 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3DAAC10F0E
	for <linux-usb@archiver.kernel.org>; Mon, 15 Apr 2019 12:09:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id A4DD62075B
	for <linux-usb@archiver.kernel.org>; Mon, 15 Apr 2019 12:09:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727177AbfDOMJg (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Mon, 15 Apr 2019 08:09:36 -0400
Received: from mga12.intel.com ([192.55.52.136]:10510 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726095AbfDOMJf (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 15 Apr 2019 08:09:35 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 15 Apr 2019 05:09:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.60,353,1549958400"; 
   d="scan'208";a="164850769"
Received: from black.fi.intel.com (HELO black.fi.intel.com.) ([10.237.72.28])
  by fmsmga001.fm.intel.com with ESMTP; 15 Apr 2019 05:09:33 -0700
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Ajay Gupta <ajayg@nvidia.com>, linux-usb@vger.kernel.org
Subject: [PATCH v2 1/7] i2c: nvidia-gpu: Supply CCGx driver the fw build info
Date:   Mon, 15 Apr 2019 15:09:25 +0300
Message-Id: <20190415120931.61328-2-heikki.krogerus@linux.intel.com>
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
Message-ID: <20190415120925.k73dejRlsWL41B_GmfYc62BWez3XTCLBCXAKy_xCxy4@z>

From: Ajay Gupta <ajayg@nvidia.com>

Adding device property "ccgx,firmware-build" for the CCGx
device, so the CCGx driver knows which firmware binary to
use for a specific vendor.

Suggested-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Signed-off-by: Ajay Gupta <ajayg@nvidia.com>
Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
---
 drivers/i2c/busses/i2c-nvidia-gpu.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/i2c/busses/i2c-nvidia-gpu.c b/drivers/i2c/busses/i2c-nvidia-gpu.c
index 4e67d5ed480e..1c8f708f212b 100644
--- a/drivers/i2c/busses/i2c-nvidia-gpu.c
+++ b/drivers/i2c/busses/i2c-nvidia-gpu.c
@@ -253,6 +253,12 @@ static const struct pci_device_id gpu_i2c_ids[] = {
 };
 MODULE_DEVICE_TABLE(pci, gpu_i2c_ids);
 
+static const struct property_entry ccgx_props[] = {
+	/* Use FW built for NVIDIA (nv) only */
+	PROPERTY_ENTRY_U16("ccgx,firmware-build", ('n' << 8) | 'v'),
+	{ }
+};
+
 static int gpu_populate_client(struct gpu_i2c_dev *i2cd, int irq)
 {
 	struct i2c_client *ccgx_client;
@@ -267,6 +273,7 @@ static int gpu_populate_client(struct gpu_i2c_dev *i2cd, int irq)
 		sizeof(i2cd->gpu_ccgx_ucsi->type));
 	i2cd->gpu_ccgx_ucsi->addr = 0x8;
 	i2cd->gpu_ccgx_ucsi->irq = irq;
+	i2cd->gpu_ccgx_ucsi->properties = ccgx_props;
 	ccgx_client = i2c_new_device(&i2cd->adapter, i2cd->gpu_ccgx_ucsi);
 	if (!ccgx_client)
 		return -ENODEV;
-- 
2.20.1


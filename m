Return-Path: <SRS0=sojL=SO=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1AD4C10F0E
	for <linux-usb@archiver.kernel.org>; Fri, 12 Apr 2019 19:07:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 7EA7320818
	for <linux-usb@archiver.kernel.org>; Fri, 12 Apr 2019 19:07:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gudNp+xp"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726925AbfDLTHo (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Fri, 12 Apr 2019 15:07:44 -0400
Received: from mail-pg1-f196.google.com ([209.85.215.196]:41454 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726815AbfDLTHn (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 12 Apr 2019 15:07:43 -0400
Received: by mail-pg1-f196.google.com with SMTP id f6so5628615pgs.8
        for <linux-usb@vger.kernel.org>; Fri, 12 Apr 2019 12:07:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=29QQJVkj+zdJP/T+0bm/LfPSV4BUo2ddpOGXI10rrkg=;
        b=gudNp+xpxrZJIH5EjduReh93ow0UdBhoaW3UV+AvE8pFmDY64B4BjCjPRVkmpr8sBz
         MKhRchiLUOoQm7eZgyUxyx3nlFTrbBt2RNe1vscj+vodhSP8rFZRb76mYiPuiqzQy+WO
         C6L8JDURpt/GuBovW+A7jiTJOXc890T1dl1JIoV1FL6+EBR4/aSsRSfrYGbjkcyWVWMr
         gAPgFlwrdy0xXtvpCUeXaH0qp8+wm0+oApbLPyA//dKlVyD8VUOG/7PPAFnpvP0Krp58
         dgmpAWWC3GrHAHQCj1WjqWYxEJPx6nscLz7Hpgibd7WRnTDx7ByxYR8lPm03HfkaNXWk
         cmlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=29QQJVkj+zdJP/T+0bm/LfPSV4BUo2ddpOGXI10rrkg=;
        b=OkjBqSzYcMfc9CljHje8PyzYVsSnO4+DGBPXtJgqjWQGlN3P8dMG709ioqXdRRcPPk
         UxaD7hJY3/m6lc4pn9mok7IWSV/FjJeoTuPDvMA7NefxY+SGdBjF+9yzoNHnBxFReXSq
         qckQ2izxgsB9CcnruTF7dqiwXBKzVQ3wINQrIk9L6idCV2Zjhy7tNDln/9vpAYsSH3pz
         lXJq1ZjyWOTMc/dWVjgH7lSHA9RNSi+Q2tM7ppcmjzuyFxeMXZqk4scZ6TIACM94W7w4
         6SfnyWXPvHsoYWaHfpsoBv4wTEG9vPIiLzqQ67tz6spWKEDSz2aP45TiEkX7agYmPKRH
         Ylhg==
X-Gm-Message-State: APjAAAWt31PKmnMpRnUEQFlF1lQ/kR6/nDp3xC75ip787uyjQ9HNPr7x
        jDvmj5BeTkZUgOdf05oECmLQGOltuQ4=
X-Google-Smtp-Source: APXvYqyMYcAfIhZ6efYCEwKtCOyMAo80cNYHUK3QXrFpB6AqSYDMpGLRdBkcQ0zhr4JNGfmHhpwb5Q==
X-Received: by 2002:a63:31ce:: with SMTP id x197mr54117678pgx.69.1555096062862;
        Fri, 12 Apr 2019 12:07:42 -0700 (PDT)
Received: from ajayg.nvidia.com (searspoint.nvidia.com. [216.228.112.21])
        by smtp.gmail.com with ESMTPSA id c3sm58760133pfo.2.2019.04.12.12.07.41
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 12 Apr 2019 12:07:42 -0700 (PDT)
From:   Ajay Gupta <ajaykuee@gmail.com>
X-Google-Original-From: Ajay Gupta <ajayg@nvidia.com>
To:     heikki.krogerus@linux.intel.com
Cc:     linux-usb@vger.kernel.org, heikki.krogeruslinux@intel.com,
        Ajay Gupta <ajayg@nvidia.com>
Subject: [PATCH v7 2/3] i2c: nvidia-gpu: Supply CCGx driver the fw build info
Date:   Fri, 12 Apr 2019 12:06:22 -0700
Message-Id: <20190412190623.26945-3-ajayg@nvidia.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190412190623.26945-1-ajayg@nvidia.com>
References: <20190412190623.26945-1-ajayg@nvidia.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190412190622.I9De-h8z_8ckXASzcSgasPsjmIXpaSvzQ6mhm8tcyos@z>

From: Heikki Krogerus <heikki.krogerus () linux ! intel ! com>

Adding device property "ccgx,firmware-build" for the CCGx
device, so the CCGx driver knows which firmware binary to
use for a specific vendor.

Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Signed-off-by: Ajay Gupta <ajayg@nvidia.com>
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
2.17.1


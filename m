Return-Path: <SRS0=1WfG=4H=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.7 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2DF32C34047
	for <linux-usb@archiver.kernel.org>; Wed, 19 Feb 2020 17:37:57 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 115BB2465D
	for <linux-usb@archiver.kernel.org>; Wed, 19 Feb 2020 17:37:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726677AbgBSRh4 (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Wed, 19 Feb 2020 12:37:56 -0500
Received: from comms.puri.sm ([159.203.221.185]:48354 "EHLO comms.puri.sm"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726518AbgBSRh4 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 19 Feb 2020 12:37:56 -0500
Received: from localhost (localhost [127.0.0.1])
        by comms.puri.sm (Postfix) with ESMTP id ACADCE0338;
        Wed, 19 Feb 2020 09:37:55 -0800 (PST)
Received: from comms.puri.sm ([127.0.0.1])
        by localhost (comms.puri.sm [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id jlhybjPA9pEg; Wed, 19 Feb 2020 09:37:54 -0800 (PST)
From:   Martin Kepplinger <martin.kepplinger@puri.sm>
To:     jun.li@nxp.com, peter.chen@nxp.com, mathias.nyman@intel.com
Cc:     linux-usb@vger.kernel.org, linux-imx@nxp.com, Anson.Huang@nxp.com,
        shawnguo@kernel.org, kernel@pengutronix.de
Subject: [PATCH] usb: host: xhci-plat: add XHCI_MISSING_CAS quirk
Date:   Wed, 19 Feb 2020 18:37:27 +0100
Message-Id: <20200219173727.9882-1-martin.kepplinger@puri.sm>
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Li Jun <jun.li@nxp.com>

i.MX8MQ USB3 host needs XHCI_MISSING_CAS quirk to warm reset the port to
enum the USB3 device plugged in while system sleep, as the port state is
stuck in polling mode after resume.

Signed-off-by: Li Jun <jun.li@nxp.com>
Acked-by: Peter Chen <peter.chen@nxp.com>
---

Hi,

Because resume from S3 suspend is broken for me on imx8mq, I stumbled
upon this patch in NXP's linux tree. (Please note that I'm not the
author and I've not yet put my SoB tag under it). This is just a
question:

This patch (and the docs) clearly is missing in mainline Linux because
the imx8mq devicetree description includes it (which does nothing now).

I've tested this and this particular addition doesn't fix my problem:

[   84.257538] imx8mq-usb-phy 381f0040.usb-phy: bus resume
[   84.263195] imx8mq-usb-phy 382f0040.usb-phy: bus resume
[   84.268898] dwc3 38100000.usb: driver resume

during resume from S3 suspend, here it still hangs.

What else could be missing here? I'm using mainline Linux only of course.

thanks,

                            martin



 drivers/usb/host/xhci-plat.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/usb/host/xhci-plat.c b/drivers/usb/host/xhci-plat.c
index d90cd5ec09cf..4655016eaf45 100644
--- a/drivers/usb/host/xhci-plat.c
+++ b/drivers/usb/host/xhci-plat.c
@@ -291,6 +291,10 @@ static int xhci_plat_probe(struct platform_device *pdev)
 
 		device_property_read_u32(tmpdev, "imod-interval-ns",
 					 &xhci->imod_interval);
+
+		if (device_property_read_bool(tmpdev,
+					      "usb3-resume-missing-cas"))
+			xhci->quirks |= XHCI_MISSING_CAS;
 	}
 
 	hcd->usb_phy = devm_usb_get_phy_by_phandle(sysdev, "usb-phy", 0);
-- 
2.20.1


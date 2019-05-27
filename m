Return-Path: <SRS0=tmbE=T3=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7BDC3C282E3
	for <linux-usb@archiver.kernel.org>; Mon, 27 May 2019 03:04:40 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 5E8F821707
	for <linux-usb@archiver.kernel.org>; Mon, 27 May 2019 03:04:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726072AbfE0DEj (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Sun, 26 May 2019 23:04:39 -0400
Received: from inva020.nxp.com ([92.121.34.13]:42656 "EHLO inva020.nxp.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725973AbfE0DEj (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Sun, 26 May 2019 23:04:39 -0400
Received: from inva020.nxp.com (localhost [127.0.0.1])
        by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 882361A02B5;
        Mon, 27 May 2019 05:04:37 +0200 (CEST)
Received: from invc005.ap-rdc01.nxp.com (invc005.ap-rdc01.nxp.com [165.114.16.14])
        by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 3D1801A01B2;
        Mon, 27 May 2019 05:04:32 +0200 (CEST)
Received: from localhost.localdomain (mega.ap.freescale.net [10.192.208.232])
        by invc005.ap-rdc01.nxp.com (Postfix) with ESMTP id 632B7402E6;
        Mon, 27 May 2019 11:04:25 +0800 (SGT)
From:   Peter Chen <peter.chen@nxp.com>
To:     balbi@kernel.org, shawnguo@kernel.org
Cc:     robh+dt@kernel.org, fabio.estevam@nxp.com, kernel@pengutronix.de,
        devicetree@vger.kernel.org, aisheng.dong@nxp.com,
        linux-imx@nxp.com, linux-arm-kernel@lists.infradead.org,
        linux-usb@vger.kernel.org, chunfeng.yun@mediatek.com,
        Peter Chen <peter.chen@nxp.com>
Subject: [PATCH v3 1/8] doc: dt-binding: mxs-usb-phy: add compatible for 7ulp
Date:   Mon, 27 May 2019 11:06:09 +0800
Message-Id: <20190527030616.44397-2-peter.chen@nxp.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190527030616.44397-1-peter.chen@nxp.com>
References: <20190527030616.44397-1-peter.chen@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
X-Virus-Scanned: ClamAV using ClamSMTP
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Add compatible for 7ulp USB PHY.

Reviewed-by: Rob Herring <robh@kernel.org>
Signed-off-by: Peter Chen <peter.chen@nxp.com>
---
 Documentation/devicetree/bindings/phy/mxs-usb-phy.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/phy/mxs-usb-phy.txt b/Documentation/devicetree/bindings/phy/mxs-usb-phy.txt
index 6ac98b3b5f57..32da8d17759a 100644
--- a/Documentation/devicetree/bindings/phy/mxs-usb-phy.txt
+++ b/Documentation/devicetree/bindings/phy/mxs-usb-phy.txt
@@ -7,6 +7,7 @@ Required properties:
 	* "fsl,imx6sl-usbphy" for imx6sl
 	* "fsl,vf610-usbphy" for Vybrid vf610
 	* "fsl,imx6sx-usbphy" for imx6sx
+	* "fsl,imx7ulp-usbphy" for imx7ulp
   "fsl,imx23-usbphy" is still a fallback for other strings
 - reg: Should contain registers location and length
 - interrupts: Should contain phy interrupt
-- 
2.14.1


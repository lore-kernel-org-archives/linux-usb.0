Return-Path: <SRS0=P9S4=UX=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.7 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01F97C48BE8
	for <linux-usb@archiver.kernel.org>; Mon, 24 Jun 2019 02:01:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id D8E342089F
	for <linux-usb@archiver.kernel.org>; Mon, 24 Jun 2019 02:01:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726686AbfFXCBP (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Sun, 23 Jun 2019 22:01:15 -0400
Received: from inva021.nxp.com ([92.121.34.21]:40726 "EHLO inva021.nxp.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726567AbfFXCBO (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Sun, 23 Jun 2019 22:01:14 -0400
Received: from inva021.nxp.com (localhost [127.0.0.1])
        by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 2B26420051B;
        Mon, 24 Jun 2019 04:01:13 +0200 (CEST)
Received: from invc005.ap-rdc01.nxp.com (invc005.ap-rdc01.nxp.com [165.114.16.14])
        by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 820E320050F;
        Mon, 24 Jun 2019 04:01:06 +0200 (CEST)
Received: from mega.ap.freescale.net (mega.ap.freescale.net [10.192.208.232])
        by invc005.ap-rdc01.nxp.com (Postfix) with ESMTP id 3381E4030D;
        Mon, 24 Jun 2019 10:00:58 +0800 (SGT)
From:   Peter Chen <peter.chen@nxp.com>
To:     balbi@kernel.org, shawnguo@kernel.org
Cc:     robh+dt@kernel.org, fabio.estevam@nxp.com, kernel@pengutronix.de,
        devicetree@vger.kernel.org, aisheng.dong@nxp.com,
        linux-imx@nxp.com, linux-arm-kernel@lists.infradead.org,
        linux-usb@vger.kernel.org, chunfeng.yun@mediatek.com,
        sergei.shtylyov@cogentembedded.com, Peter Chen <peter.chen@nxp.com>
Subject: [PATCH v5 3/8] doc: dt-binding: ci-hdrc-usb2: add compatible string for imx7ulp
Date:   Mon, 24 Jun 2019 10:02:53 +0800
Message-Id: <20190624020258.21690-4-peter.chen@nxp.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190624020258.21690-1-peter.chen@nxp.com>
References: <20190624020258.21690-1-peter.chen@nxp.com>
X-Virus-Scanned: ClamAV using ClamSMTP
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Add compatible string for imx7ulp.

Reviewed-by: Rob Herring <robh@kernel.org>
Signed-off-by: Peter Chen <peter.chen@nxp.com>
---
 Documentation/devicetree/bindings/usb/ci-hdrc-usb2.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/usb/ci-hdrc-usb2.txt b/Documentation/devicetree/bindings/usb/ci-hdrc-usb2.txt
index a254386a91ad..cfc9f40ab641 100644
--- a/Documentation/devicetree/bindings/usb/ci-hdrc-usb2.txt
+++ b/Documentation/devicetree/bindings/usb/ci-hdrc-usb2.txt
@@ -10,6 +10,7 @@ Required properties:
 	"fsl,imx6sx-usb"
 	"fsl,imx6ul-usb"
 	"fsl,imx7d-usb"
+	"fsl,imx7ulp-usb"
 	"lsi,zevio-usb"
 	"qcom,ci-hdrc"
 	"chipidea,usb2"
-- 
2.14.1


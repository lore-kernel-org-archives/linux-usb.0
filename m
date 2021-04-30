Return-Path: <linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C513C433ED
	for <linux-usb@archiver.kernel.org>; Fri, 30 Apr 2021 09:24:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D1F69613CA
	for <linux-usb@archiver.kernel.org>; Fri, 30 Apr 2021 09:24:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231502AbhD3JY5 (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Fri, 30 Apr 2021 05:24:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35836 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229689AbhD3JY5 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 30 Apr 2021 05:24:57 -0400
X-Greylist: delayed 510 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Fri, 30 Apr 2021 02:24:07 PDT
Received: from phobos.denx.de (phobos.denx.de [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7F4BFC06138B
        for <linux-usb@vger.kernel.org>; Fri, 30 Apr 2021 02:24:07 -0700 (PDT)
Received: from mail-internal.denx.de (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: noc@denx.de)
        by phobos.denx.de (Postfix) with ESMTPSA id B025D81EC4
        for <linux-usb@vger.kernel.org>; Fri, 30 Apr 2021 11:15:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
        s=phobos-20191101; t=1619774134;
        bh=7jNtsVgB4SG/t7bVzmOnoK100qiLWUCRQWcjzl5Jnro=;
        h=From:To:Cc:Subject:Date:From;
        b=xo2JJPHLw1ym59SE0Hm/CoHxl47d6h+8U9vwsEqVmxrMrQS47L5208fJBqUHWjInu
         6bf6VJkeqTj4Oyy60GmT6wtN7v9wMUSwwULCxoWGlaS2A2bgGI9fApYMPbGJC1gg6J
         YZL332+sU+kqaCz05e25yCLnYHIZHYQzICjulfKTfZCC9Eksa/jhFdcUApCEH8VWes
         fX+7jrppaeSTVN0wdh7p9l/dIb+MD3cOxPc1H0UIgnSl8XkwBaulvHWOO/Cb0xHi3M
         OoL13ApX4lC7HxIFpjWBklofEBn56aQnVNU8CBBRvx0eGLo6ANUNuZfXcTJt0c1Cnh
         6bRrE+Zqsz7eQ==
Received: from pollux.denx.de (pollux [192.168.1.1])
        by mail-internal.denx.de (Postfix) with ESMTP id 93C91182B81;
        Fri, 30 Apr 2021 11:15:16 +0200 (CEST)
Received: by pollux.denx.de (Postfix, from userid 515)
        id 58BCD1A8BAD; Fri, 30 Apr 2021 11:15:16 +0200 (CEST)
From:   Heiko Schocher <hs@denx.de>
To:     linux-arm-kernel@lists.infradead.org
Cc:     Heiko Schocher <hs@denx.de>, Fabio Estevam <festevam@gmail.com>,
        Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        NXP Linux Team <linux-imx@nxp.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Shawn Guo <shawnguo@kernel.org>,
        Teresa Remmet <t.remmet@phytec.de>,
        Zhen Lei <thunder.leizhen@huawei.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org
Subject: [PATCH] usb: dwc3: imx8mp: detect dwc3 child nodes with name "usb*"
Date:   Fri, 30 Apr 2021 11:15:12 +0200
Message-Id: <20210430091512.1026996-1-hs@denx.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.102.4 at phobos.denx.de
X-Virus-Status: Clean
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

commit:
d1689cd3c0f4: ("arm64: dts: imx8mp: Use the correct name for child node "snps, dwc3")

renamed "dwc3@3*" nodes in imx8mp.dtsi to "usb@3*"

glue layer dwc3-imx8mp.c searches for "dwc3" and so drop failure
on boot:
imx8mp-dwc3 32f10100.usb: failed to find dwc3 core child
imx8mp-dwc3: probe of 32f10100.usb failed with error 1
imx8mp-dwc3 32f10108.usb: failed to find dwc3 core child
imx8mp-dwc3: probe of 32f10108.usb failed with error 1

now. Fix this (and allow old style too)

Tested on "PHYTEC phyBOARD-Pollux i.MX8MP" board.

fixes: d1689cd3c0f4: ("arm64: dts: imx8mp: Use the correct name for child node "snps, dwc3")
Signed-off-by: Heiko Schocher <hs@denx.de>
---

 drivers/usb/dwc3/dwc3-imx8mp.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/dwc3/dwc3-imx8mp.c b/drivers/usb/dwc3/dwc3-imx8mp.c
index b13cfab89d532..eb85ddc50f7c7 100644
--- a/drivers/usb/dwc3/dwc3-imx8mp.c
+++ b/drivers/usb/dwc3/dwc3-imx8mp.c
@@ -165,7 +165,8 @@ static int dwc3_imx8mp_probe(struct platform_device *pdev)
 	if (err < 0)
 		goto disable_rpm;
 
-	dwc3_np = of_get_child_by_name(node, "dwc3");
+	dwc3_np = of_get_child_by_name(node, "usb") ? :
+		  of_get_child_by_name(node, "dwc3");
 	if (!dwc3_np) {
 		dev_err(dev, "failed to find dwc3 core child\n");
 		goto disable_rpm;
-- 
2.30.2


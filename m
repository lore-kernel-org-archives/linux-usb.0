Return-Path: <SRS0=ET2A=BX=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1363BC433E1
	for <linux-usb@archiver.kernel.org>; Thu, 13 Aug 2020 06:25:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C8DC320716
	for <linux-usb@archiver.kernel.org>; Thu, 13 Aug 2020 06:25:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1597299952;
	bh=PUZCkfKqM56/EMsMa6LaRKqzxfbN7vt7o481UC1U8V4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-ID:From;
	b=uV4FKQozjeRleQ+LJskOmDfOBuOLxZcF1olVl7pESD313JtCnwWZylbE5rlER1mXY
	 1fvtZoOMMsjsBbrWh9R7vBwTJVO4551Oee9hw7W+ZYc6uHesAYoO1nmBofv8SdLo6g
	 x0vgpZBFAeNq6E5DiYdXRgpW+D4fCkRr5Ye87yzY=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726427AbgHMGZw (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Thu, 13 Aug 2020 02:25:52 -0400
Received: from mail.kernel.org ([198.145.29.99]:38198 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726334AbgHMGZu (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 13 Aug 2020 02:25:50 -0400
Received: from saruman.elisa-laajakaista.fi (unknown [194.34.132.57])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id A64B320716;
        Thu, 13 Aug 2020 06:25:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1597299950;
        bh=PUZCkfKqM56/EMsMa6LaRKqzxfbN7vt7o481UC1U8V4=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=sqAiN2dQOO0dBbfnl2VxcQjxHbkqwef9eW/WnQDlVMQjHUe42wjb87PI1VX0WpT+d
         7MhOab7+V0I7QP05FnNvDESY+OUEHnsddpAQxI5iKALamOwuZGPH9PCutYyJ8NzLbi
         SJNDzMV4LrhjJKiTLJi9LRmiSrNA2+7r5P8jAueQ=
From:   balbi@kernel.org
To:     Linux USB <linux-usb@vger.kernel.org>
Cc:     Felipe Balbi <balbi@kernel.org>
Subject: [PATCH 10/11] dwc3: qcom: fix checkpatch warnings
Date:   Thu, 13 Aug 2020 09:25:31 +0300
Message-Id: <20200813062532.829720-10-balbi@kernel.org>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200813062532.829720-1-balbi@kernel.org>
References: <20200813062532.829720-1-balbi@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Felipe Balbi <balbi@kernel.org>

no functional changes

Signed-off-by: Felipe Balbi <balbi@kernel.org>
---
 drivers/usb/dwc3/dwc3-qcom.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/dwc3/dwc3-qcom.c b/drivers/usb/dwc3/dwc3-qcom.c
index fcf7f79fb983..c703d552bbcf 100644
--- a/drivers/usb/dwc3/dwc3-qcom.c
+++ b/drivers/usb/dwc3/dwc3-qcom.c
@@ -444,7 +444,9 @@ static int dwc3_qcom_setup_irq(struct platform_device *pdev)
 {
 	struct dwc3_qcom *qcom = platform_get_drvdata(pdev);
 	const struct dwc3_acpi_pdata *pdata = qcom->acpi_pdata;
-	int irq, ret;
+	int irq;
+	int ret;
+
 	irq = dwc3_qcom_get_irq(pdev, "hs_phy_irq",
 				pdata ? pdata->hs_phy_irq_index : -1);
 	if (irq > 0) {
@@ -563,7 +565,7 @@ static const struct property_entry dwc3_qcom_acpi_properties[] = {
 
 static int dwc3_qcom_acpi_register_core(struct platform_device *pdev)
 {
-	struct dwc3_qcom 	*qcom = platform_get_drvdata(pdev);
+	struct dwc3_qcom	*qcom = platform_get_drvdata(pdev);
 	struct device		*dev = &pdev->dev;
 	struct resource		*res, *child_res = NULL;
 	int			irq;
@@ -623,7 +625,7 @@ static int dwc3_qcom_acpi_register_core(struct platform_device *pdev)
 
 static int dwc3_qcom_of_register_core(struct platform_device *pdev)
 {
-	struct dwc3_qcom 	*qcom = platform_get_drvdata(pdev);
+	struct dwc3_qcom	*qcom = platform_get_drvdata(pdev);
 	struct device_node	*np = pdev->dev.of_node, *dwc3_np;
 	struct device		*dev = &pdev->dev;
 	int			ret;
-- 
2.28.0


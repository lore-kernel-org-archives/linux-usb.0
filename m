Return-Path: <linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A42AC43381
	for <linux-usb@archiver.kernel.org>; Fri, 15 Jan 2021 17:49:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D525E23A5E
	for <linux-usb@archiver.kernel.org>; Fri, 15 Jan 2021 17:49:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732808AbhAORsg (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Fri, 15 Jan 2021 12:48:36 -0500
Received: from so254-31.mailgun.net ([198.61.254.31]:29579 "EHLO
        so254-31.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732910AbhAORse (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 15 Jan 2021 12:48:34 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1610732896; h=Content-Transfer-Encoding: MIME-Version:
 References: In-Reply-To: Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=T1sm+HygDsgbzGNtPhiAqIWmLZsMWF4t4t2dBlppp4g=; b=G1oDZCaXUO9g48djLg1vQ4EiP+YNj+3+Iohr7dZWisYPI+qIEjIXcfhU9xBxPZUDaK3g2krz
 UMveg1xtxTqKVRrNHNWAxvQGvfeK3oen/EQt2OlNYvTMiHKcIDyMtUF+hWCBZ7OqSNwsukbD
 y3zMrg8iGYlrYMXO2ZFAy2VxIQc=
X-Mailgun-Sending-Ip: 198.61.254.31
X-Mailgun-Sid: WyIxZTE2YSIsICJsaW51eC11c2JAdmdlci5rZXJuZWwub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-west-2.postgun.com with SMTP id
 6001d54375e5c01cba4905cc (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 15 Jan 2021 17:47:47
 GMT
Sender: jackp=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 4F2AFC433C6; Fri, 15 Jan 2021 17:47:47 +0000 (UTC)
Received: from jackp-linux.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: jackp)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 27919C433ED;
        Fri, 15 Jan 2021 17:47:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 27919C433ED
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=jackp@codeaurora.org
From:   Jack Pham <jackp@codeaurora.org>
To:     Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Wesley Cheng <wcheng@codeaurora.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Manu Gautam <mgautam@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Jack Pham <jackp@codeaurora.org>
Subject: [PATCH v2 3/4] dt-bindings: phy: qcom,usb-snps-femto-v2: Add SM8250 and SM8350 bindings
Date:   Fri, 15 Jan 2021 09:47:22 -0800
Message-Id: <20210115174723.7424-4-jackp@codeaurora.org>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20210115174723.7424-1-jackp@codeaurora.org>
References: <20210115174723.7424-1-jackp@codeaurora.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Add the compatible strings for the USB2 PHYs found on QCOM
SM8250 & SM8350 SoCs.

Note that the SM8250 compatible is already in use in the dts and
driver implementation but was missing from the documentation.

Signed-off-by: Jack Pham <jackp@codeaurora.org>
---
 .../devicetree/bindings/phy/qcom,usb-snps-femto-v2.yaml         | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/qcom,usb-snps-femto-v2.yaml b/Documentation/devicetree/bindings/phy/qcom,usb-snps-femto-v2.yaml
index 4949a2851532..ee77c6458326 100644
--- a/Documentation/devicetree/bindings/phy/qcom,usb-snps-femto-v2.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,usb-snps-femto-v2.yaml
@@ -17,6 +17,8 @@ properties:
     enum:
       - qcom,usb-snps-hs-7nm-phy
       - qcom,sm8150-usb-hs-phy
+      - qcom,sm8250-usb-hs-phy
+      - qcom,sm8350-usb-hs-phy
       - qcom,usb-snps-femto-v2-phy
 
   reg:
-- 
2.24.0


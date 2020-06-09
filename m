Return-Path: <SRS0=f8IS=7W=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5ACAC433E1
	for <linux-usb@archiver.kernel.org>; Tue,  9 Jun 2020 20:59:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9095020734
	for <linux-usb@archiver.kernel.org>; Tue,  9 Jun 2020 20:59:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mg.codeaurora.org header.i=@mg.codeaurora.org header.b="IDOi3N+I"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728104AbgFIU7S (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Tue, 9 Jun 2020 16:59:18 -0400
Received: from mail27.static.mailgun.info ([104.130.122.27]:15073 "EHLO
        mail27.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728052AbgFIU7J (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 9 Jun 2020 16:59:09 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1591736348; h=Content-Transfer-Encoding: MIME-Version:
 References: In-Reply-To: Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=w98NvCRSqsgrCEWuhZkp5a80F1qEDmyKmBRdGBNIFfs=; b=IDOi3N+I7T9soeW1FsZFPYaxqgOulUG+Lcfkt5iTWevTiVgvA5YKpmF6ne7j02zAtYvg8Scu
 Wd7/YDbP+TQW2M93sxkhAcfMm4/W0QYGAb897vXHctxYt2b8hl5cjJkfU3IdkkT60P6Twmro
 N/jgld3HxlQ6MG3+tZJzD4dXb8A=
X-Mailgun-Sending-Ip: 104.130.122.27
X-Mailgun-Sid: WyIxZTE2YSIsICJsaW51eC11c2JAdmdlci5rZXJuZWwub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n09.prod.us-west-2.postgun.com with SMTP id
 5edff8146bebe35deb64f5c8 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 09 Jun 2020 20:59:00
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 66A01C433CB; Tue,  9 Jun 2020 20:59:00 +0000 (UTC)
Received: from wcheng-linux.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: wcheng)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 23808C433C6;
        Tue,  9 Jun 2020 20:58:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 23808C433C6
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=wcheng@codeaurora.org
From:   Wesley Cheng <wcheng@codeaurora.org>
To:     heikki.krogerus@linux.intel.com, gregkh@linuxfoundation.org,
        mark.rutland@arm.com, robh+dt@kernel.org, agross@kernel.org,
        bjorn.andersson@linaro.org
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-usb@vger.kernel.org,
        jackp@codeaurora.org, bryan.odonoghue@linaro.org,
        Wesley Cheng <wcheng@codeaurora.org>
Subject: [PATCH 3/3] arm64: boot: dts: qcom: pm8150b: Add node for USB type C block
Date:   Tue,  9 Jun 2020 13:58:51 -0700
Message-Id: <20200609205851.30113-4-wcheng@codeaurora.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200609205851.30113-1-wcheng@codeaurora.org>
References: <20200609205851.30113-1-wcheng@codeaurora.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The PM8150B has a dedicated USB type C block, which can be used for type C
orientation and role detection.  Create the reference node to this type C
block for further use.

Signed-off-by: Wesley Cheng <wcheng@codeaurora.org>
---
 arch/arm64/boot/dts/qcom/pm8150b.dtsi | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/pm8150b.dtsi b/arch/arm64/boot/dts/qcom/pm8150b.dtsi
index 40b5d75..7364d6b 100644
--- a/arch/arm64/boot/dts/qcom/pm8150b.dtsi
+++ b/arch/arm64/boot/dts/qcom/pm8150b.dtsi
@@ -22,6 +22,13 @@
 			status = "disabled";
 		};
 
+		qcom,typec@1500 {
+			compatible = "qcom,pm8150b-usb-typec";
+			reg = <0x1500>;
+			interrupts =
+				<0x2 0x15 0x5 IRQ_TYPE_EDGE_RISING>;
+		};
+
 		adc@3100 {
 			compatible = "qcom,spmi-adc5";
 			reg = <0x3100>;
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project


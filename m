Return-Path: <linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1874CC47098
	for <linux-usb@archiver.kernel.org>; Fri,  4 Jun 2021 11:04:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 033B06138C
	for <linux-usb@archiver.kernel.org>; Fri,  4 Jun 2021 11:04:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230246AbhFDLGJ (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Fri, 4 Jun 2021 07:06:09 -0400
Received: from alexa-out.qualcomm.com ([129.46.98.28]:25829 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230214AbhFDLGH (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 4 Jun 2021 07:06:07 -0400
Received: from ironmsg09-lv.qualcomm.com ([10.47.202.153])
  by alexa-out.qualcomm.com with ESMTP; 04 Jun 2021 04:04:21 -0700
X-QCInternal: smtphost
Received: from ironmsg02-blr.qualcomm.com ([10.86.208.131])
  by ironmsg09-lv.qualcomm.com with ESMTP/TLS/AES256-SHA; 04 Jun 2021 04:04:19 -0700
X-QCInternal: smtphost
Received: from c-sanm-linux.qualcomm.com ([10.206.25.31])
  by ironmsg02-blr.qualcomm.com with ESMTP; 04 Jun 2021 16:33:44 +0530
Received: by c-sanm-linux.qualcomm.com (Postfix, from userid 2343233)
        id 4F77A393F; Fri,  4 Jun 2021 16:33:43 +0530 (IST)
From:   Sandeep Maheswaram <sanm@codeaurora.org>
To:     Rob Herring <robh+dt@kernel.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Felipe Balbi <balbi@kernel.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Doug Anderson <dianders@chromium.org>,
        Matthias Kaehlcke <mka@chromium.org>
Cc:     devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        Manu Gautam <mgautam@codeaurora.org>,
        Sandeep Maheswaram <sanm@codeaurora.org>
Subject: [PATCH v4 2/2] arm64: dts: qcom: sc7280: Add USB nodes for IDP board
Date:   Fri,  4 Jun 2021 16:33:38 +0530
Message-Id: <1622804618-18480-3-git-send-email-sanm@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1622804618-18480-1-git-send-email-sanm@codeaurora.org>
References: <1622804618-18480-1-git-send-email-sanm@codeaurora.org>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Add USB nodes for sc7280 IDP board.

Signed-off-by: Sandeep Maheswaram <sanm@codeaurora.org>
Reviewed-by: Matthias Kaehlcke <mka@chromium.org>
---
 arch/arm64/boot/dts/qcom/sc7280-idp.dts | 39 +++++++++++++++++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sc7280-idp.dts b/arch/arm64/boot/dts/qcom/sc7280-idp.dts
index 3900cfc..44326d8 100644
--- a/arch/arm64/boot/dts/qcom/sc7280-idp.dts
+++ b/arch/arm64/boot/dts/qcom/sc7280-idp.dts
@@ -276,6 +276,45 @@
 	status = "okay";
 };
 
+&usb_1 {
+	status = "okay";
+};
+
+&usb_1_dwc3 {
+	dr_mode = "host";
+};
+
+&usb_1_hsphy {
+	status = "okay";
+
+	vdda-pll-supply = <&vreg_l10c_0p8>;
+	vdda33-supply = <&vreg_l2b_3p0>;
+	vdda18-supply = <&vreg_l1c_1p8>;
+};
+
+&usb_1_qmpphy {
+	status = "okay";
+
+	vdda-phy-supply = <&vreg_l6b_1p2>;
+	vdda-pll-supply = <&vreg_l1b_0p8>;
+};
+
+&usb_2 {
+	status = "okay";
+};
+
+&usb_2_dwc3 {
+	dr_mode = "peripheral";
+};
+
+&usb_2_hsphy {
+	status = "okay";
+
+	vdda-pll-supply = <&vreg_l10c_0p8>;
+	vdda33-supply = <&vreg_l2b_3p0>;
+	vdda18-supply = <&vreg_l1c_1p8>;
+};
+
 /* PINCTRL - additions to nodes defined in sc7280.dtsi */
 
 &qup_uart5_default {
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation


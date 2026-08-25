Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 176C73F5BD7;
	Tue, 25 Aug 2026 10:43:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787654584; cv=none; b=RdmCYb37Kj0zEFxO2TVhY8srHPXeQZqfTfK6yxXYrV9UXm9vSuHBJfEwyVCBkC9q23nnY5AdU4Ci8zzZy85h+jH68bKTVGK8iYnaXJJ9OIrkddu0ruwY2owJpRoxAB+WrsR6z5q4rbAcSXfwbK10vU1sgo0PlYo0YhicQQp676M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787654584; c=relaxed/simple;
	bh=6D440gF3OdEH5rrR9EIlHPMzUpdmuRP7A/ZdyzxLLx0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TvkCp1PRx5viE22HEUc/ItkF/HlduJDZzLyutEQY+0SwmKnR6oSH0A6BMvLdJEvYSyUSPO1mRN0IK1BFBIp6lqS/RvKNF35+3VQoQoePCzG1+lr2W20lK75TJisYVK+Rervgylk94W+ljgihl9GvmEPcg3gqYS61v3+odqDId+U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FIfEtTRz; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FIfEtTRz"
Received: by smtp.kernel.org (Postfix) with ESMTPS id B59E7C2BCFF;
	Tue, 25 Aug 2026 10:43:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1787654583;
	bh=6D440gF3OdEH5rrR9EIlHPMzUpdmuRP7A/ZdyzxLLx0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=FIfEtTRzNwuPSBdHeu7A0O7f+JxcesvZ58BUMjHIFmjCYl61Fi632WGEEFEPakffD
	 /lCl1IBb7jfEPQ6moy5ZlEeb0taPCk6EIBvPj7xMe+EFoLBr9eIT/FtZyubEzxKvH1
	 4wWbuEc0pFuZqBiGvI5yrCudDj5yYsFuvje9h0xfkwWoN2gjde7xtRjpWqgcHlBobE
	 hlpBPXe6Vq7Wwm2l9v9rBLwT4mbBXlHeQ8695EimZgJQRoAYtEQSuUq3Bc4dmLPvRJ
	 Q1PI/ynGXNcmblZUS9ZJbSU2Y7Ras4YGkZyc2pXqneDWsqOIqFMsNvTwwu8vVJJpUw
	 4ovt6rDXxLgkw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A19B3C61DB6;
	Tue, 25 Aug 2026 10:43:03 +0000 (UTC)
From: George Moussalem via B4 Relay <devnull+george.moussalem.outlook.com@kernel.org>
Date: Tue, 25 Aug 2026 14:42:32 +0400
Subject: [PATCH 7/9] arm64: dts: qcom: ipq6018: Flatten usb controller
 nodes
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260825-ipq-flatten-usb-v1-7-5c1f3170bbe9@outlook.com>
References: <20260825-ipq-flatten-usb-v1-0-5c1f3170bbe9@outlook.com>
In-Reply-To: <20260825-ipq-flatten-usb-v1-0-5c1f3170bbe9@outlook.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Wesley Cheng <quic_wcheng@quicinc.com>, 
 Thinh Nguyen <Thinh.Nguyen@synopsys.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>, 
 George Moussalem <george.moussalem@outlook.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787654580; l=4884;
 i=george.moussalem@outlook.com; s=20250321; h=from:subject:message-id;
 bh=aUKQ2DqvYtl1g4KXgUauo5s7uDYsNKGbePueF7ygyUQ=;
 b=fVQrZVVQLceQi065nAZAiAEV8AV1xpRLIVf0Di7GMboKktHVxciBOec8h85j0+B7XxQ0kQDZq
 zDH1hVJI47bDVgtkOId7wzIvfHCNb5Hw07OJOCvrKXQd3a79lA1+bmY
X-Developer-Key: i=george.moussalem@outlook.com; a=ed25519;
 pk=/PuRTSI9iYiHwcc6Nrde8qF4ZDhJBlUgpHdhsIjnqIk=
X-Endpoint-Received: by B4 Relay for george.moussalem@outlook.com/20250321
 with auth_id=364
X-Original-From: George Moussalem <george.moussalem@outlook.com>
Reply-To: george.moussalem@outlook.com

From: George Moussalem <george.moussalem@outlook.com>

Flatten usb controller nodes and update to using latest bindings and
flattened driver approach.

This SoC has two USB controllers of which the USB3 node had a ref clock
populated in the DWC3 child node. Add property to the USB3 node only to
select UTMI as reference clock for the DWC3 core to calculate the right
values for the period and frame length adjustment.

Signed-off-by: George Moussalem <george.moussalem@outlook.com>
---
 arch/arm64/boot/dts/qcom/ipq6018.dtsi | 99 ++++++++++++++++-------------------
 1 file changed, 46 insertions(+), 53 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/ipq6018.dtsi b/arch/arm64/boot/dts/qcom/ipq6018.dtsi
index 0701517275d4..4b39616dd899 100644
--- a/arch/arm64/boot/dts/qcom/ipq6018.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq6018.dtsi
@@ -423,12 +423,10 @@ pwm: pwm@1941010 {
 			status = "disabled";
 		};
 
-		usb2: usb@70f8800 {
-			compatible = "qcom,ipq6018-dwc3", "qcom,dwc3";
-			reg = <0x0 0x070f8800 0x0 0x400>;
-			#address-cells = <2>;
-			#size-cells = <2>;
-			ranges;
+		usb2: usb@7000000 {
+			compatible = "qcom,ipq6018-dwc3", "qcom,snps-dwc3";
+			reg = <0x0 0x07000000 0x0 0xfc100>;
+
 			clocks = <&gcc GCC_USB1_MASTER_CLK>,
 				 <&gcc GCC_USB1_SLEEP_CLK>,
 				 <&gcc GCC_USB1_MOCK_UTMI_CLK>;
@@ -441,27 +439,26 @@ usb2: usb@70f8800 {
 			assigned-clock-rates = <133330000>,
 					       <24000000>;
 
-			interrupts = <GIC_SPI 128 IRQ_TYPE_LEVEL_HIGH>,
+			interrupts = <GIC_SPI 99 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 128 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 130 IRQ_TYPE_LEVEL_HIGH>;
-			interrupt-names = "pwr_event",
+			interrupt-names = "dwc_usb3",
+					  "pwr_event",
 					  "qusb2_phy";
 
 			resets = <&gcc GCC_USB1_BCR>;
-			status = "disabled";
 
-			dwc_1: usb@7000000 {
-				compatible = "snps,dwc3";
-				reg = <0x0 0x07000000 0x0 0xcd00>;
-				interrupts = <GIC_SPI 99 IRQ_TYPE_LEVEL_HIGH>;
-				phys = <&qusb_phy_1>;
-				phy-names = "usb2-phy";
-				tx-fifo-resize;
-				snps,is-utmi-l1-suspend;
-				snps,hird-threshold = /bits/ 8 <0x0>;
-				snps,dis_u2_susphy_quirk;
-				snps,dis_u3_susphy_quirk;
-				dr_mode = "host";
-			};
+			phys = <&qusb_phy_1>;
+			phy-names = "usb2-phy";
+
+			tx-fifo-resize;
+			snps,is-utmi-l1-suspend;
+			snps,hird-threshold = /bits/ 8 <0x0>;
+			snps,dis_u2_susphy_quirk;
+			snps,dis_u3_susphy_quirk;
+			dr_mode = "host";
+
+			status = "disabled";
 		};
 
 		sdhc: mmc@7804000 {
@@ -669,21 +666,18 @@ qpic_nand: nand-controller@79b0000 {
 			status = "disabled";
 		};
 
-		usb3: usb@8af8800 {
-			compatible = "qcom,ipq6018-dwc3", "qcom,dwc3";
-			reg = <0x0 0x08af8800 0x0 0x400>;
-			#address-cells = <2>;
-			#size-cells = <2>;
-			ranges;
+		usb3: usb@8a00000 {
+			compatible = "qcom,ipq6018-dwc3", "qcom,snps-dwc3";
+			reg = <0x0 0x08a00000 0x0 0xfc100>;
 
 			clocks = <&gcc GCC_SYS_NOC_USB0_AXI_CLK>,
-				<&gcc GCC_USB0_MASTER_CLK>,
-				<&gcc GCC_USB0_SLEEP_CLK>,
-				<&gcc GCC_USB0_MOCK_UTMI_CLK>;
+				 <&gcc GCC_USB0_MASTER_CLK>,
+				 <&gcc GCC_USB0_SLEEP_CLK>,
+				 <&gcc GCC_USB0_MOCK_UTMI_CLK>;
 			clock-names = "cfg_noc",
-				"core",
-				"sleep",
-				"mock_utmi";
+				      "core",
+				      "sleep",
+				      "mock_utmi";
 
 			assigned-clocks = <&gcc GCC_SYS_NOC_USB0_AXI_CLK>,
 					  <&gcc GCC_USB0_MASTER_CLK>,
@@ -692,32 +686,31 @@ usb3: usb@8af8800 {
 					       <133330000>,
 					       <24000000>;
 
-			interrupts = <GIC_SPI 134 IRQ_TYPE_LEVEL_HIGH>,
+			interrupts = <GIC_SPI 140 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 134 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 136 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 220 IRQ_TYPE_LEVEL_HIGH>;
-			interrupt-names = "pwr_event",
+			interrupt-names = "dwc_usb3",
+					  "pwr_event",
 					  "qusb2_phy",
 					  "ss_phy_irq";
 
 			resets = <&gcc GCC_USB0_BCR>;
-			status = "disabled";
 
-			dwc_0: usb@8a00000 {
-				compatible = "snps,dwc3";
-				reg = <0x0 0x08a00000 0x0 0xcd00>;
-				interrupts = <GIC_SPI 140 IRQ_TYPE_LEVEL_HIGH>;
-				phys = <&qusb_phy_0>, <&ssphy_0>;
-				phy-names = "usb2-phy", "usb3-phy";
-				clocks = <&xo>;
-				clock-names = "ref";
-				tx-fifo-resize;
-				snps,parkmode-disable-ss-quirk;
-				snps,is-utmi-l1-suspend;
-				snps,hird-threshold = /bits/ 8 <0x0>;
-				snps,dis_u2_susphy_quirk;
-				snps,dis_u3_susphy_quirk;
-				dr_mode = "host";
-			};
+			phys = <&qusb_phy_0>, <&ssphy_0>;
+			phy-names = "usb2-phy", "usb3-phy";
+
+			qcom,select-utmi-as-ref-clk;
+
+			tx-fifo-resize;
+			snps,parkmode-disable-ss-quirk;
+			snps,is-utmi-l1-suspend;
+			snps,hird-threshold = /bits/ 8 <0x0>;
+			snps,dis_u2_susphy_quirk;
+			snps,dis_u3_susphy_quirk;
+			dr_mode = "host";
+
+			status = "disabled";
 		};
 
 		intc: interrupt-controller@b000000 {

-- 
2.53.0



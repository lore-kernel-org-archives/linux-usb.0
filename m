Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1752D3F5BD6;
	Tue, 25 Aug 2026 10:43:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787654584; cv=none; b=g+tiDdOr1f7GMxMtBkCjFHFojnoj1xRfsU3stR6N3i9Lu0wVQaUHrRd07WVlHO9c4HLKERZvPxda4Qwnw3wnhKak+OpNa++iL3ho0KJpHxOTLEXJ18ELTKsTchFsqJEq+mvXfOpTmWMdiwjcPq85bzY2LQWn02M69wcqFqh2/0o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787654584; c=relaxed/simple;
	bh=LyrvFPQkpTBk4InD+5fyYC6vatGWnkdL2Z3yVI8z5jU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SxQ61NGOAd+PadG74m595G7WeetBiMvYdB63SxU3zBK8dmFg5F0iISbS3JtmRF8elvNZLnAzbUTIVtuYkmlo+Zc3DppX+3wjzSCmx5ZFsz2BsPaLSgB1NuKeej496xg8oZMjeEMfIDbd+ff/mQIy0FFk0Z4QOegbcRD0j5JjiCY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XCdxMw2X; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XCdxMw2X"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 93211C4AF0E;
	Tue, 25 Aug 2026 10:43:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1787654583;
	bh=LyrvFPQkpTBk4InD+5fyYC6vatGWnkdL2Z3yVI8z5jU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=XCdxMw2XegH8YNVkSMrFQlWBDN89MCLfwgP/EePCFy59gIwrOr8+IxRocZ4Rsa7rF
	 PXBCH9QT0u9em0NmgQSEWaXN/t/daSbIcotKoGlZSxzcFimvkDlidiegZBXSTXkipK
	 q3rs4LTnuw6qGzd1E18e+6zsvTmkmUnuQ9Hdh+RhFTgx4UlUygLSGmZcvVTDhHhRG4
	 YUHAP1HcP+cbpvFvh2i55DvzquxGVhaNEa6N+ZwfQfPvRLX+l6GuiJi39EldyPXqnj
	 daOlQENSSugEfuOgdTHPZkJTn/WCtqscV9KDQ5JjBilx9QOz97nWwHDgMhOZ/N3P+H
	 DvMepiL5jaE1Q==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7EC72C61DBD;
	Tue, 25 Aug 2026 10:43:03 +0000 (UTC)
From: George Moussalem via B4 Relay <devnull+george.moussalem.outlook.com@kernel.org>
Date: Tue, 25 Aug 2026 14:42:30 +0400
Subject: [PATCH 5/9] arm64: dts: qcom: ipq5332: Flatten usb controller node
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260825-ipq-flatten-usb-v1-5-5c1f3170bbe9@outlook.com>
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
 George Moussalem <george.moussalem@outlook.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787654580; l=3628;
 i=george.moussalem@outlook.com; s=20250321; h=from:subject:message-id;
 bh=XcXDBw/Xz3Ce4Ry86g4nKP67j/TsjKjKAWkU4N53ZY8=;
 b=Fwwy4w2Z5iICHC/24S1k6VwH8z7gfSGjoui7lh/4FBRQbNENCNw7Psueo8VhAc7aC+9HDg0Om
 qW0D4ecq360DbyzPYFXYXBMyk6BF4W9BUPOpPv7x/bo99DKBjD0HDQE
X-Developer-Key: i=george.moussalem@outlook.com; a=ed25519;
 pk=/PuRTSI9iYiHwcc6Nrde8qF4ZDhJBlUgpHdhsIjnqIk=
X-Endpoint-Received: by B4 Relay for george.moussalem@outlook.com/20250321
 with auth_id=364
X-Original-From: George Moussalem <george.moussalem@outlook.com>
Reply-To: george.moussalem@outlook.com

From: George Moussalem <george.moussalem@outlook.com>

Flatten usb controller node and update to using latest bindings and
flattened driver approach.

Add property to select UTMI as reference clock for the DWC3 core to
calculate the right values for the period and frame length adjustment.

In addition, set the right UTMI clock rate and override any clock rate
inherited from the bootloader.

Signed-off-by: George Moussalem <george.moussalem@outlook.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/ipq5332-rdp468.dts |  6 +--
 arch/arm64/boot/dts/qcom/ipq5332.dtsi       | 58 ++++++++++++++---------------
 2 files changed, 29 insertions(+), 35 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/ipq5332-rdp468.dts b/arch/arm64/boot/dts/qcom/ipq5332-rdp468.dts
index c224ffc65b08..25a70cd884c0 100644
--- a/arch/arm64/boot/dts/qcom/ipq5332-rdp468.dts
+++ b/arch/arm64/boot/dts/qcom/ipq5332-rdp468.dts
@@ -90,11 +90,9 @@ spi_0_cs_pins: spi-0-cs-state {
 };
 
 &usb {
-	status = "okay";
-};
-
-&usb_dwc {
 	dr_mode = "host";
+
+	status = "okay";
 };
 
 &usbphy0 {
diff --git a/arch/arm64/boot/dts/qcom/ipq5332.dtsi b/arch/arm64/boot/dts/qcom/ipq5332.dtsi
index 74d9de8d7641..87579a6b0e30 100644
--- a/arch/arm64/boot/dts/qcom/ipq5332.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq5332.dtsi
@@ -493,16 +493,9 @@ qpic_nand: spi@79b0000 {
 			status = "disabled";
 		};
 
-		usb: usb@8af8800 {
-			compatible = "qcom,ipq5332-dwc3", "qcom,dwc3";
-			reg = <0x08af8800 0x400>;
-
-			interrupts = <GIC_SPI 62 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 53 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 52 IRQ_TYPE_LEVEL_HIGH>;
-			interrupt-names = "pwr_event",
-					  "dp_hs_phy_irq",
-					  "dm_hs_phy_irq";
+		usb: usb@8a00000 {
+			compatible = "qcom,ipq5332-dwc3", "qcom,snps-dwc3";
+			reg = <0x08a00000 0xfc100>;
 
 			clocks = <&gcc GCC_USB0_MASTER_CLK>,
 				 <&gcc GCC_USB0_SLEEP_CLK>,
@@ -510,34 +503,37 @@ usb: usb@8af8800 {
 			clock-names = "core",
 				      "sleep",
 				      "mock_utmi";
+			assigned-clocks = <&gcc GCC_USB0_MOCK_UTMI_CLK>;
+			assigned-clock-rates = <60000000>;
 
-			resets = <&gcc GCC_USB_BCR>;
-
-			qcom,select-utmi-as-pipe-clk;
+			interrupts = <GIC_SPI 64 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 62 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 53 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 52 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "dwc_usb3",
+					  "pwr_event",
+					  "dp_hs_phy_irq",
+					  "dm_hs_phy_irq";
 
-			#address-cells = <1>;
-			#size-cells = <1>;
-			ranges;
 			interconnects = <&gcc MASTER_SNOC_USB &gcc SLAVE_SNOC_USB>,
 					<&gcc MASTER_SNOC_USB &gcc SLAVE_SNOC_USB>;
 			interconnect-names = "usb-ddr", "apps-usb";
 
-			status = "disabled";
+			resets = <&gcc GCC_USB_BCR>;
 
-			usb_dwc: usb@8a00000 {
-				compatible = "snps,dwc3";
-				reg = <0x08a00000 0xe000>;
-				clocks = <&gcc GCC_USB0_MOCK_UTMI_CLK>;
-				clock-names = "ref";
-				interrupts = <GIC_SPI 64 IRQ_TYPE_LEVEL_HIGH>;
-				phy-names = "usb2-phy";
-				phys = <&usbphy0>;
-				tx-fifo-resize;
-				snps,is-utmi-l1-suspend;
-				snps,hird-threshold = /bits/ 8 <0x0>;
-				snps,dis_u2_susphy_quirk;
-				snps,dis_u3_susphy_quirk;
-			};
+			phys = <&usbphy0>;
+			phy-names = "usb2-phy";
+
+			qcom,select-utmi-as-pipe-clk;
+			qcom,select-utmi-as-ref-clk;
+
+			tx-fifo-resize;
+			snps,is-utmi-l1-suspend;
+			snps,hird-threshold = /bits/ 8 <0x0>;
+			snps,dis_u2_susphy_quirk;
+			snps,dis_u3_susphy_quirk;
+
+			status = "disabled";
 		};
 
 		intc: interrupt-controller@b000000 {

-- 
2.53.0



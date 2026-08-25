Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C0BC3F6C58;
	Tue, 25 Aug 2026 10:43:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787654584; cv=none; b=eK/xXoTQaO5mguI7ZKFCqd330Meqx0ff3Nd6T3ojV3kY52RQNADKaTvrKEmL4/5DtbdsdaOcVpP+Vyi0N+YAQDx/MW126KWR/+UCoM/nGIFnr7tA6kdWhr/Rcyq+CJZE8qu2DcSq1vdF1wrK9I+2alS6ehRZ0kPSPEcXIm/VI78=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787654584; c=relaxed/simple;
	bh=Z3R5fSwgRqHKxVckcxCWO1MlToHA6mHxvAclxNJUrOk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uA/mTCTnitt+YP+zDFR2AXh8qAuTof4In0D4231PmVyaEfnlVgskM2Wxp88PFDkM11LuM2Q46d1MxZ11hs6xNYOFirZi6VuSyNDQ07NIBul2dN7SJY7PydzeRTpbJ7keb5NTA+JjjuGBoF4L9CAuD+6Rpbx/RueJZGzlosFQlNk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Z6I4PNKh; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Z6I4PNKh"
Received: by smtp.kernel.org (Postfix) with ESMTPS id D887BC2BCFC;
	Tue, 25 Aug 2026 10:43:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1787654583;
	bh=Z3R5fSwgRqHKxVckcxCWO1MlToHA6mHxvAclxNJUrOk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=Z6I4PNKhfoHM4zi76v+5OaQmIGXTOcXqPhJ3lLU+JlNuUKD9jgOOcQ1mWZ1693RgQ
	 AQQUk330ohCxscxhG8h+CxP3+Yj+kfGOdz33lZhy454Z4S0rQjRZV1RLYaBAUmgaXa
	 v/hcfXacRvoD390u2ZprgVwGqb6JkpSiK5bTgn91YmYJtMmolKfBRKouULJwaf3oXd
	 FiPSEsGYOv1uOZXGkkzo/yEqkV7IcjIW6vWnoLci6V1z4z3q1DQ2d8HTdtqKZEZFNN
	 pQIHDqhG40LD2MdWk3W40UA33rbnRyghcVno8yiap60sq5/NWTvTDn0fkUm0ZxyepJ
	 /tZ8UlCSte92g==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5B07C61DBD;
	Tue, 25 Aug 2026 10:43:03 +0000 (UTC)
From: George Moussalem via B4 Relay <devnull+george.moussalem.outlook.com@kernel.org>
Date: Tue, 25 Aug 2026 14:42:34 +0400
Subject: [PATCH 9/9] arm64: dts: qcom: ipq9574: Flatten usb controller node
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260825-ipq-flatten-usb-v1-9-5c1f3170bbe9@outlook.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787654580; l=3319;
 i=george.moussalem@outlook.com; s=20250321; h=from:subject:message-id;
 bh=59gaIbwJxqd1gc9ND5BnMnViKAwQRYOhscidCPM/sVU=;
 b=56OxhOno6ncFhmyV+lLK7MyeSU90Ba7ltrTmbq8svHp4yoo7Mrg6RwBeALXCPymWUidFhAQbb
 nqGT1wG55ajAbNswsgZa9/Y4ONsIy9+dE2IA8weLqoQEiKCJ4uim7OQ
X-Developer-Key: i=george.moussalem@outlook.com; a=ed25519;
 pk=/PuRTSI9iYiHwcc6Nrde8qF4ZDhJBlUgpHdhsIjnqIk=
X-Endpoint-Received: by B4 Relay for george.moussalem@outlook.com/20250321
 with auth_id=364
X-Original-From: George Moussalem <george.moussalem@outlook.com>
Reply-To: george.moussalem@outlook.com

From: George Moussalem <george.moussalem@outlook.com>

Flatten usb controller nodes and update to using latest bindings and
flattened driver approach.

Add property to the USB node to select UTMI as reference clock for the
DWC3 core to calculate the right values for the period and frame length
adjustment.

Signed-off-by: George Moussalem <george.moussalem@outlook.com>
---
 arch/arm64/boot/dts/qcom/ipq9574-rdp-common.dtsi |  6 ++--
 arch/arm64/boot/dts/qcom/ipq9574.dtsi            | 42 +++++++++++-------------
 2 files changed, 21 insertions(+), 27 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/ipq9574-rdp-common.dtsi b/arch/arm64/boot/dts/qcom/ipq9574-rdp-common.dtsi
index 62877b46f9b3..0d06a838c233 100644
--- a/arch/arm64/boot/dts/qcom/ipq9574-rdp-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq9574-rdp-common.dtsi
@@ -252,10 +252,6 @@ flash@0 {
 	};
 };
 
-&usb_0_dwc3 {
-	dr_mode = "host";
-};
-
 &usb_0_qmpphy {
 	vdda-pll-supply = <&mp5496_l5>;
 	vdda-phy-supply = <&regulator_fixed_0p925>;
@@ -272,6 +268,8 @@ &usb_0_qusbphy {
 };
 
 &usb3 {
+	dr_mode = "host";
+
 	status = "okay";
 };
 
diff --git a/arch/arm64/boot/dts/qcom/ipq9574.dtsi b/arch/arm64/boot/dts/qcom/ipq9574.dtsi
index 5a5bda5f21a1..b56ba76e8b54 100644
--- a/arch/arm64/boot/dts/qcom/ipq9574.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq9574.dtsi
@@ -756,12 +756,9 @@ usb_0_qmpphy: phy@7d000 {
 			status = "disabled";
 		};
 
-		usb3: usb@8af8800 {
-			compatible = "qcom,ipq9574-dwc3", "qcom,dwc3";
-			reg = <0x08af8800 0x400>;
-			#address-cells = <1>;
-			#size-cells = <1>;
-			ranges;
+		usb3: usb@8a00000 {
+			compatible = "qcom,ipq9574-dwc3", "qcom,snps-dwc3";
+			reg = <0x08a00000 0xfc100>;
 
 			clocks = <&gcc GCC_SNOC_USB_CLK>,
 				 <&gcc GCC_USB0_MASTER_CLK>,
@@ -780,32 +777,31 @@ usb3: usb@8af8800 {
 			assigned-clock-rates = <200000000>,
 					       <24000000>;
 
-			interrupts-extended = <&intc GIC_SPI 134 IRQ_TYPE_LEVEL_HIGH>,
+			interrupts-extended = <&intc GIC_SPI 140 IRQ_TYPE_LEVEL_HIGH>,
+					      <&intc GIC_SPI 134 IRQ_TYPE_LEVEL_HIGH>,
 					      <&intc GIC_SPI 136 IRQ_TYPE_LEVEL_HIGH>,
 					      <&intc GIC_SPI 111 IRQ_TYPE_LEVEL_HIGH>,
 					      <&intc GIC_SPI 112 IRQ_TYPE_LEVEL_HIGH>;
-			interrupt-names = "pwr_event",
+			interrupt-names = "dwc_usb3",
+					  "pwr_event",
 					  "qusb2_phy",
 					  "dm_hs_phy_irq",
 					  "dp_hs_phy_irq";
 
 			resets = <&gcc GCC_USB_BCR>;
-			status = "disabled";
 
-			usb_0_dwc3: usb@8a00000 {
-				compatible = "snps,dwc3";
-				reg = <0x8a00000 0xcd00>;
-				clocks = <&gcc GCC_USB0_MOCK_UTMI_CLK>;
-				clock-names = "ref";
-				interrupts = <GIC_SPI 140 IRQ_TYPE_LEVEL_HIGH>;
-				phys = <&usb_0_qusbphy>, <&usb_0_qmpphy>;
-				phy-names = "usb2-phy", "usb3-phy";
-				tx-fifo-resize;
-				snps,is-utmi-l1-suspend;
-				snps,hird-threshold = /bits/ 8 <0x0>;
-				snps,dis_u2_susphy_quirk;
-				snps,dis_u3_susphy_quirk;
-			};
+			phys = <&usb_0_qusbphy>, <&usb_0_qmpphy>;
+			phy-names = "usb2-phy", "usb3-phy";
+
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



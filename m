Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B3B540DB4E;
	Wed, 12 Aug 2026 09:34:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786527285; cv=none; b=Nz3ToMkpQv5yUmQfe1czs8NMjv+Spd7esmRJCIbhDpWtfzYqzdH0yj++R8FjcrI+O1AddvWNFxPTiW9bF7Y9muVho9lX8/Oh1zPEnA6wdcoa0xsqhENYW2pDzub3+qaxCVaSI9VCk3ehOix73hNBDDkitkVqIIwy0+YOTbfH/Ro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786527285; c=relaxed/simple;
	bh=XGGg+wneQatG/AQkDerc/plwjABYtPGtPSkFlQvT5xg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EypcxGA8Sd4LHNtLSuR72QAWKPZV94YeNn3pAoUTeZ/EsC0O913llpNP35rfuFl8u9WCw85Gbr0hwuQ0Agr4sFHD5WdU2xU1OfBhO2/m4n1TcNCa6TYNarrOa9alqvjpz1Wnqw6MYJ7ayEEVMf0eJSB7zSBE5sp/JdlipqIKXPU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JPYqgSFR; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JPYqgSFR"
Received: by smtp.kernel.org (Postfix) with ESMTPS id C451CC32781;
	Wed, 12 Aug 2026 09:34:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1786527284;
	bh=XGGg+wneQatG/AQkDerc/plwjABYtPGtPSkFlQvT5xg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=JPYqgSFRPN4RWJcYIe9epi6b+3tX5uK7DxEraidISs+195I1IMhI3MdL4qssPUY6x
	 6Fh5+EWVcLKGQF7DZwDJlypnwK6OBcYr2TJ6Pb9j8j61PtfTOtMrRb/CLFIGUHP/hO
	 MnfIEn404GILL4oy2ITNCUcmsvNE1zEOU0mKs3hI/Mx1XwUOIKyr5tryc3vTTRfWqG
	 eU7bNlJZ/2B9MHEfsgdUkGct4M0f6DO+jtA1d8M8+WkOV1bLeRBkOptCS++QqxH9cA
	 zHZi9xDdZO1UydoKsPKFhAAFNsQDW1VuglhHlfBDVsgXZ2/3UlF+o60PKnkZ2xFhTL
	 Chg9boJjCRCZg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2DD7C5DF60;
	Wed, 12 Aug 2026 09:34:44 +0000 (UTC)
From: George Moussalem via B4 Relay <devnull+george.moussalem.outlook.com@kernel.org>
Date: Wed, 12 Aug 2026 13:34:39 +0400
Subject: [PATCH v2 04/14] arm64: dts: qcom: ipq5332: Flatten usb controller
 node
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260812-ipq5018-usb3-v2-4-8f355d7ff0ef@outlook.com>
References: <20260812-ipq5018-usb3-v2-0-8f355d7ff0ef@outlook.com>
In-Reply-To: <20260812-ipq5018-usb3-v2-0-8f355d7ff0ef@outlook.com>
To: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Praveenkumar I <quic_ipkumar@quicinc.com>, 
 Varadarajan Narayanan <quic_varada@quicinc.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Wesley Cheng <quic_wcheng@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-usb@vger.kernel.org, George Moussalem <george.moussalem@outlook.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786527282; l=3080;
 i=george.moussalem@outlook.com; s=20250321; h=from:subject:message-id;
 bh=xMYvxEWuaJgLI2xWvqglKjH2h3PlSr0PrD5R6v8tOEc=;
 b=uv4AZGj2RWq7I0imlu8xno7WjLPQDByBz6jufaXWzZYASpgXh4mH3jvaIJK7cq+7XM+pyjOkG
 gI554vDMcP6BMSytgCyy1BE595+REfBeg1S0FzRfmC+DCnT9D3BHcmQ
X-Developer-Key: i=george.moussalem@outlook.com; a=ed25519;
 pk=/PuRTSI9iYiHwcc6Nrde8qF4ZDhJBlUgpHdhsIjnqIk=
X-Endpoint-Received: by B4 Relay for george.moussalem@outlook.com/20250321
 with auth_id=364
X-Original-From: George Moussalem <george.moussalem@outlook.com>
Reply-To: george.moussalem@outlook.com

From: George Moussalem <george.moussalem@outlook.com>

Flatten usb controller node and update to using latest bindings and
flattened driver approach.

Signed-off-by: George Moussalem <george.moussalem@outlook.com>
---
 arch/arm64/boot/dts/qcom/ipq5332-rdp468.dts |  6 ++--
 arch/arm64/boot/dts/qcom/ipq5332.dtsi       | 51 +++++++++++++----------------
 2 files changed, 24 insertions(+), 33 deletions(-)

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
index 74d9de8d7641..83d0377455da 100644
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
+			reg = <0x08a00000 0xe000>;
 
 			clocks = <&gcc GCC_USB0_MASTER_CLK>,
 				 <&gcc GCC_USB0_SLEEP_CLK>,
@@ -513,31 +506,31 @@ usb: usb@8af8800 {
 
 			resets = <&gcc GCC_USB_BCR>;
 
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
+			phys = <&usbphy0>;
+			phy-names = "usb2-phy";
 
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
+			qcom,select-utmi-as-pipe-clk;
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



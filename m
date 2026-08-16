Received: from mx.nabladev.com (mx.nabladev.com [178.251.229.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE3FE3E3C50;
	Sun, 16 Aug 2026 21:39:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.251.229.89
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786916391; cv=none; b=Xk1RtAu9In5EhZMUTGvxDwwJZlx9j3fS2NA/kPmq5udnF00BCQwRHuZIH52Yhbx6jMcZHNf1rHOZSO8o9Gy9RRXcYM4egnasCrRVlTzfN99q2mNAKCCEIod9brzGa22iuozL1l0DmBpLvkAKIM5r0uRpbAK4HUqrDSao3rshcwY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786916391; c=relaxed/simple;
	bh=ILqOtREUc2kEgd0AwRM470TJfs46VN3Ex2W8Bjq8emw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DreN/3vALQ0dlOktNLZe3dhi6nIsjxKK5NJ07bmFfUwpT6zKK0iYDwQN+WXKXijDRntNzIKANMHssIJpJ7scHqDlcRMpp79xaWHyA6LLHY2RBLrwEjH2kKBEF8SE3RtCccXAi06vr1kdYE2vbPU9rJN428A/NWnO0/6ZdmHxZg0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com; spf=pass smtp.mailfrom=nabladev.com; dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.b=PIKW060o; arc=none smtp.client-ip=178.251.229.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nabladev.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.b="PIKW060o"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id DC79D11C1F7;
	Sun, 16 Aug 2026 23:39:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1786916384; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=+wPXHTSPpg7pnN5GVVm7Pp5S8X+a4mA3zNhwatSUP3s=;
	b=PIKW060obDZpZOMAX0SIbJ8d15pQmi/80BYG3NAbJD18G79lf90mhKG1BPk2nZ3oGw6CJ4
	JlSvINU//uFYYm3LeWDF7GUu2s8NcO0RtDxYL04XGJEGGFnChwBiqVE2K26LkKhbLFKaag
	m6wXaypaZ9vnG5yx2Vx101lpHKQ4nCItCoQGstXU0oUquHw+gySHeYC1krsgf8VHPQbUgq
	TEiR3XJiorzoo3kGzw/hvllvGUZNGu3BHZHogZLkd020gBLrhPCrfv4shhTGaCgeRYU77k
	TSPDQZMQOGwEE9wAvgrj35sLTw/Ein2l/Q6GLH8EUH9+1n5PuxNU4o+h5+caJA==
From: Marek Vasut <marex@nabladev.com>
To: linux-usb@vger.kernel.org
Cc: Marek Vasut <marex@nabladev.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Francois Choleau <francois.choleau@st.com>,
	Christian Bruel <christian.bruel@foss.st.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabrice Gasnier <fabrice.gasnier@foss.st.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Pankaj Dev <pankaj.dev@st.com>,
	Rahul Kumar <rahul.kumar05@st.com>,
	Rob Herring <robh@kernel.org>,
	Rosen Penev <rosenp@gmail.com>,
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
	Vinod Koul <vkoul@kernel.org>,
	devicetree@vger.kernel.org,
	kernel@dh-electronics.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: [PATCH v2 8/9] arm64: dts: st: Add USB nodes on stm32mp231
Date: Sun, 16 Aug 2026 23:37:10 +0200
Message-ID: <20260816213849.1044073-9-marex@nabladev.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260816213849.1044073-1-marex@nabladev.com>
References: <20260816213849.1044073-1-marex@nabladev.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

Add USB controller and PHY nodes to stm32mp231 DT.
This includes two USB 2.0 FEMTO PHYs, USB 2.0 host
controller and DWC3 DRD controller nodes. Include
missing COMBOPHY for the USB 3.0 controller.

Co-developed-by: Alexandre Torgue <alexandre.torgue@foss.st.com>
Signed-off-by: Alexandre Torgue <alexandre.torgue@foss.st.com>
Co-developed-by: Francois Choleau <francois.choleau@st.com>
Signed-off-by: Francois Choleau <francois.choleau@st.com>
Signed-off-by: Marek Vasut <marex@nabladev.com>
---
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: Christian Bruel <christian.bruel@foss.st.com>
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Pankaj Dev <pankaj.dev@st.com>
Cc: Rahul Kumar <rahul.kumar05@st.com>
Cc: Rob Herring <robh@kernel.org>
Cc: Rosen Penev <rosenp@gmail.com>
Cc: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc: Vinod Koul <vkoul@kernel.org>
Cc: devicetree@vger.kernel.org
Cc: kernel@dh-electronics.com
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-phy@lists.infradead.org
Cc: linux-stm32@st-md-mailman.stormreply.com
Cc: linux-usb@vger.kernel.org
---
V2: - Fix up Sob/Cdb lines
    - Move PHY into syscfg subnode
    - Turn st,stm32mp23-syscfg into simple-mfd
    - Use clock-cells = <1> to discern OSC and future PLL clock from the PHY
---
 arch/arm64/boot/dts/st/stm32mp231.dtsi | 81 +++++++++++++++++++++++++-
 1 file changed, 80 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/st/stm32mp231.dtsi b/arch/arm64/boot/dts/st/stm32mp231.dtsi
index 4505fc0e3b537..fd232b4241125 100644
--- a/arch/arm64/boot/dts/st/stm32mp231.dtsi
+++ b/arch/arm64/boot/dts/st/stm32mp231.dtsi
@@ -7,6 +7,7 @@
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/regulator/st,stm32mp25-regulator.h>
 #include <dt-bindings/reset/st,stm32mp25-rcc.h>
+#include <dt-bindings/phy/phy.h>
 
 / {
 	#address-cells = <2>;
@@ -769,6 +770,21 @@ dcmipp: dcmipp@48030000 {
 				status = "disabled";
 			};
 
+			combophy: phy@480c0000 {
+				compatible = "st,stm32mp25-combophy";
+				reg = <0x480c0000 0x1000>;
+				#phy-cells = <1>;
+				clocks = <&rcc CK_BUS_USB3PCIEPHY>, <&rcc CK_KER_USB3PCIEPHY>;
+				clock-names = "apb", "ker";
+				resets = <&rcc USB3PCIEPHY_R>;
+				reset-names = "phy";
+				access-controllers = <&rifsc 67>;
+				power-domains = <&cluster_pd>;
+				wakeup-source;
+				interrupts-extended = <&exti1 45 IRQ_TYPE_EDGE_FALLING>;
+				status = "disabled";
+			};
+
 			sdmmc1: mmc@48220000 {
 				compatible = "st,stm32mp25-sdmmc2", "arm,pl18x", "arm,primecell";
 				reg = <0x48220000 0x400>, <0x44230400 0x8>;
@@ -862,6 +878,47 @@ stmmac_axi_config_1: stmmac-axi-config {
 					snps,wr_osr_lmt = <0x7>;
 				};
 			};
+
+			usbh_ohci: usb@482e0000 {
+				compatible = "generic-ohci";
+				reg = <0x482e0000 0x1000>;
+				access-controllers = <&rifsc 63>;
+				clocks = <&usb2_phy1 0>, <&rcc CK_BUS_USB2OHCI>;
+				interrupts = <GIC_SPI 140 IRQ_TYPE_LEVEL_HIGH>;
+				phys = <&usb2_phy1>;
+				phy-names = "usb";
+				resets = <&rcc USBH_R>;
+				status = "disabled";
+			};
+
+			usbh_ehci: usb@482f0000 {
+				compatible = "generic-ehci";
+				reg = <0x482f0000 0x1000>;
+				access-controllers = <&rifsc 63>;
+				clocks = <&usb2_phy1 0>, <&rcc CK_BUS_USB2EHCI>;
+				companion = <&usbh_ohci>;
+				interrupts = <GIC_SPI 139 IRQ_TYPE_LEVEL_HIGH>;
+				phys = <&usb2_phy1>;
+				phy-names = "usb";
+				resets = <&rcc USBH_R>;
+				status = "disabled";
+			};
+
+			usb3dr: usb@48300000 {
+				compatible = "st,stm32mp25-dwc3";
+				reg = <0x48300000 0x100000>;
+				access-controllers = <&rifsc 66>;
+				clocks = <&rcc CK_KER_USB2PHY2>,
+					 <&rcc CK_BUS_USB3DR>,
+					 <&rcc CK_KER_USB2PHY2>;
+				clock-names = "ref", "bus_early", "suspend";
+				interrupts = <GIC_SPI 228 IRQ_TYPE_LEVEL_HIGH>;
+				phys = <&usb2_phy2>, <&combophy PHY_TYPE_USB3>;
+				phy-names = "usb2-phy", "usb3-phy";
+				resets = <&rcc USB3DR_R>;
+				st,syscfg = <&syscfg 0x4800>;
+				status = "disabled";
+			};
 		};
 
 		bsec: efuse@44000000 {
@@ -1062,9 +1119,31 @@ exti1: interrupt-controller@44220000 {
 		};
 
 		syscfg: syscon@44230000 {
-			compatible = "st,stm32mp23-syscfg", "syscon";
+			compatible = "st,stm32mp23-syscfg", "syscon", "simple-mfd";
 			reg = <0x44230000 0x10000>;
 			#clock-cells = <0>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+
+			usb2_phy1: phy@2400 {
+				compatible = "st,stm32mp25-usb2phy1";
+				reg = <0x2400 0x24>;
+				#phy-cells = <0>;
+				#clock-cells = <1>;
+				clocks = <&rcc CK_KER_USB2PHY1>;
+				resets = <&rcc USB2PHY1_R>;
+				status = "disabled";
+			};
+
+			usb2_phy2: phy@2800 {
+				compatible = "st,stm32mp25-usb2phy2";
+				reg = <0x2800 0xc>;
+				#phy-cells = <0>;
+				#clock-cells = <1>;
+				clocks = <&rcc CK_KER_USB2PHY2EN>;
+				resets = <&rcc USB2PHY2_R>;
+				status = "disabled";
+			};
 		};
 
 		pinctrl: pinctrl@44240000 {
-- 
2.53.0


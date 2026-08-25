Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FAF33F58CA;
	Tue, 25 Aug 2026 10:43:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787654584; cv=none; b=dTMoqpQJ7gZE3/Q/HzLo0X7APCPhNJFdFa/NwacKVt0/CEXX10kT1y07MaqLOiarIhuICojcscKoRt4rF2Zm9opCqfhTme6tm4CXfSQdM/eT9TqRxYy6qItqIucL45/iKEnFTPsvjEYo44+uZBFI/1s7ktwIt8qUuH0v5TX+cxg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787654584; c=relaxed/simple;
	bh=GGFica03m8yr9HOn872gixoDUBTOBUXxPapKuhj0cG0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lnvB5pWEKm3m05H0JGjPlHOh1yReDKZq4Jkv1m2Uel2Sd2zxQLII+3RPaCyNxM4QoMCvXZEIlSA6s+5NQggYhUwVM5JcOojCLpIyS3Bm3ecR7SpkCCGwaMUsvEm0QoW7yrF5Ip0jERQ4VnQvz7/hcwITJS1KdQoGz1TTJk9umNg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=e6+l73jR; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="e6+l73jR"
Received: by smtp.kernel.org (Postfix) with ESMTPS id C6912C2BD04;
	Tue, 25 Aug 2026 10:43:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1787654583;
	bh=GGFica03m8yr9HOn872gixoDUBTOBUXxPapKuhj0cG0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=e6+l73jRCReVXagZAfYOl+pdDRADsJJB4L18nglttbQths2SuYZV5/GVUaubzuej1
	 T/kjBjufnXEp1tbYaQVIfKzyd7ZAqbB53MT173j6qxKaysvIpJg52hUI2zBaHFN86J
	 NJCYNBvW7b6Yg7+39LoUJ6qp8tGQ0ZZuh+eFRhkcuPcum0gerJtnyaFsyr94uFkVS+
	 5e9wByfbiGphPV387/ohIjz/t1gp5k04ctR4IOOt/qtuG3ECeozlXwxIbF94qK1KWo
	 mrp3VoctcrRi+a9TeFPSUnwYOg6sGEWYd1IHhZ9EhKvnIRFko+sVKQapGnWEnQyO+w
	 Z0waVf5asB6nQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3A05C61DBE;
	Tue, 25 Aug 2026 10:43:03 +0000 (UTC)
From: George Moussalem via B4 Relay <devnull+george.moussalem.outlook.com@kernel.org>
Date: Tue, 25 Aug 2026 14:42:33 +0400
Subject: [PATCH 8/9] arm64: dts: qcom: ipq8074: Flatten usb controller
 nodes
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260825-ipq-flatten-usb-v1-8-5c1f3170bbe9@outlook.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787654580; l=5157;
 i=george.moussalem@outlook.com; s=20250321; h=from:subject:message-id;
 bh=hIddtiBZwT8syQLEUJVTu1O+HNgK8pUyjSoAJUmUX9Y=;
 b=xc+csD+UoB54hrKPw1ecnzhZiRJgUlsGMFHE1B9KaHxKwHuP6OWJhfwIuBffKjXb+AseKVhrg
 VmilW7cJdBdAaM9N5KhcyjEuWMdc7I9oe9cApDbgaciAsdzuDGtfxLm
X-Developer-Key: i=george.moussalem@outlook.com; a=ed25519;
 pk=/PuRTSI9iYiHwcc6Nrde8qF4ZDhJBlUgpHdhsIjnqIk=
X-Endpoint-Received: by B4 Relay for george.moussalem@outlook.com/20250321
 with auth_id=364
X-Original-From: George Moussalem <george.moussalem@outlook.com>
Reply-To: george.moussalem@outlook.com

From: George Moussalem <george.moussalem@outlook.com>

Flatten usb controller nodes and update to using latest bindings and
flattened driver approach.

In addition, fix indentation of properties in both nodes.

Signed-off-by: George Moussalem <george.moussalem@outlook.com>
---
 arch/arm64/boot/dts/qcom/ipq8074.dtsi | 112 ++++++++++++++++------------------
 1 file changed, 52 insertions(+), 60 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/ipq8074.dtsi b/arch/arm64/boot/dts/qcom/ipq8074.dtsi
index 75a5ae30d966..d4a86b3815f2 100644
--- a/arch/arm64/boot/dts/qcom/ipq8074.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq8074.dtsi
@@ -625,104 +625,96 @@ qpic_nand: nand-controller@79b0000 {
 			status = "disabled";
 		};
 
-		usb_0: usb@8af8800 {
-			compatible = "qcom,ipq8074-dwc3", "qcom,dwc3";
-			reg = <0x08af8800 0x400>;
-			#address-cells = <1>;
-			#size-cells = <1>;
-			ranges;
+		usb_0: usb@8a00000 {
+			compatible = "qcom,ipq8074-dwc3", "qcom,snps-dwc3";
+			reg = <0x08a00000 0xfc100>;
 
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
 					  <&gcc GCC_USB0_MOCK_UTMI_CLK>;
 			assigned-clock-rates = <133330000>,
-						<133330000>,
-						<19200000>;
+					       <133330000>,
+					       <19200000>;
 
-			interrupts = <GIC_SPI 134 IRQ_TYPE_LEVEL_HIGH>,
+			interrupts = <GIC_SPI 140 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 134 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 130 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 220 IRQ_TYPE_LEVEL_HIGH>;
-			interrupt-names = "pwr_event",
+			interrupt-names = "dwc_usb3",
+					  "pwr_event",
 					  "qusb2_phy",
 					  "ss_phy_irq";
 
 			power-domains = <&gcc USB0_GDSC>;
 
+			phys = <&qusb_phy_0>, <&ssphy_0>;
+			phy-names = "usb2-phy", "usb3-phy";
+
+			snps,parkmode-disable-ss-quirk;
+			snps,is-utmi-l1-suspend;
+			snps,hird-threshold = /bits/ 8 <0x0>;
+			snps,dis_u2_susphy_quirk;
+			snps,dis_u3_susphy_quirk;
+			dr_mode = "host";
+
 			resets = <&gcc GCC_USB0_BCR>;
-			status = "disabled";
 
-			dwc_0: usb@8a00000 {
-				compatible = "snps,dwc3";
-				reg = <0x8a00000 0xcd00>;
-				interrupts = <GIC_SPI 140 IRQ_TYPE_LEVEL_HIGH>;
-				phys = <&qusb_phy_0>, <&ssphy_0>;
-				phy-names = "usb2-phy", "usb3-phy";
-				snps,parkmode-disable-ss-quirk;
-				snps,is-utmi-l1-suspend;
-				snps,hird-threshold = /bits/ 8 <0x0>;
-				snps,dis_u2_susphy_quirk;
-				snps,dis_u3_susphy_quirk;
-				dr_mode = "host";
-			};
+			status = "disabled";
 		};
 
-		usb_1: usb@8cf8800 {
-			compatible = "qcom,ipq8074-dwc3", "qcom,dwc3";
-			reg = <0x08cf8800 0x400>;
-			#address-cells = <1>;
-			#size-cells = <1>;
-			ranges;
+		usb_1: usb@8c00000 {
+			compatible = "qcom,ipq8074-dwc3", "qcom,snps-dwc3";
+			reg = <0x08c00000 0xfc100>;
 
 			clocks = <&gcc GCC_SYS_NOC_USB1_AXI_CLK>,
-				<&gcc GCC_USB1_MASTER_CLK>,
-				<&gcc GCC_USB1_SLEEP_CLK>,
-				<&gcc GCC_USB1_MOCK_UTMI_CLK>;
+				 <&gcc GCC_USB1_MASTER_CLK>,
+				 <&gcc GCC_USB1_SLEEP_CLK>,
+				 <&gcc GCC_USB1_MOCK_UTMI_CLK>;
 			clock-names = "cfg_noc",
-				"core",
-				"sleep",
-				"mock_utmi";
+				      "core",
+				      "sleep",
+				      "mock_utmi";
 
 			assigned-clocks = <&gcc GCC_SYS_NOC_USB1_AXI_CLK>,
 					  <&gcc GCC_USB1_MASTER_CLK>,
 					  <&gcc GCC_USB1_MOCK_UTMI_CLK>;
 			assigned-clock-rates = <133330000>,
-						<133330000>,
-						<19200000>;
+					       <133330000>,
+					       <19200000>;
 
-			interrupts = <GIC_SPI 128 IRQ_TYPE_LEVEL_HIGH>,
+			interrupts = <GIC_SPI 99 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 128 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 136 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 225 IRQ_TYPE_LEVEL_HIGH>;
-			interrupt-names = "pwr_event",
+			interrupt-names = "dwc_usb3",
+					  "pwr_event",
 					  "qusb2_phy",
 					  "ss_phy_irq";
 
 			power-domains = <&gcc USB1_GDSC>;
 
+			phys = <&qusb_phy_1>, <&ssphy_1>;
+			phy-names = "usb2-phy", "usb3-phy";
+
+			snps,parkmode-disable-ss-quirk;
+			snps,is-utmi-l1-suspend;
+			snps,hird-threshold = /bits/ 8 <0x0>;
+			snps,dis_u2_susphy_quirk;
+			snps,dis_u3_susphy_quirk;
+			dr_mode = "host";
+
 			resets = <&gcc GCC_USB1_BCR>;
-			status = "disabled";
 
-			dwc_1: usb@8c00000 {
-				compatible = "snps,dwc3";
-				reg = <0x8c00000 0xcd00>;
-				interrupts = <GIC_SPI 99 IRQ_TYPE_LEVEL_HIGH>;
-				phys = <&qusb_phy_1>, <&ssphy_1>;
-				phy-names = "usb2-phy", "usb3-phy";
-				snps,parkmode-disable-ss-quirk;
-				snps,is-utmi-l1-suspend;
-				snps,hird-threshold = /bits/ 8 <0x0>;
-				snps,dis_u2_susphy_quirk;
-				snps,dis_u3_susphy_quirk;
-				dr_mode = "host";
-			};
+			status = "disabled";
 		};
 
 		intc: interrupt-controller@b000000 {

-- 
2.53.0



Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B1EB40DB4B;
	Wed, 12 Aug 2026 09:34:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786527285; cv=none; b=tlayDuQC7VrelFZWBdmbukH8s1ceekiSSjpd4yzpxQJG+mEZVF46XL2aSTnS1qba/4QGUPPuwqFGk7cQfd9fHMrKcSmkFHnxr5tH6CGrp5WQ4B8meeDrO62Qt66DgIwPMQYcpvvrilOki4v1yPzh95+CjGnXhJJ1Okc9mFdfNLw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786527285; c=relaxed/simple;
	bh=TxZEg/967MIvOveyPvlS6NGS5qBdrqXFzdbhFtlshy8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=epCARYkpvwTPNZltT7wt87bBON+hCNUYOGi+c8y4ljsVbkk7pWz7lUdD1ogKJAheaKbjbv653XJUg/GVj7X14vvGVAJwwvIxP1Yo5+c7V9qBRjcpO/uwa993Rp7sm/bJkn3Gf3XazmWR+i74EuN4Y2iBlP9ciGFHVPGOK6z16XU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ts/Nc7eB; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ts/Nc7eB"
Received: by smtp.kernel.org (Postfix) with ESMTPS id BDF34C4AF0C;
	Wed, 12 Aug 2026 09:34:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1786527284;
	bh=TxZEg/967MIvOveyPvlS6NGS5qBdrqXFzdbhFtlshy8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=ts/Nc7eBX8jYP6ChSXm+ZY+mqGRFE2ueBJcVhmYmrCOWqJZkUEEYOlEs9BvPPg76r
	 6r6R3XlsU/0c43qXr1DJNscFpT5KG/V97LBRVRs+V146WOgZIruUSeG3AA3JDgwW5D
	 +sop/5BzcYjR+JYSjqyHTmVTU9s702Uy64wzbo+dN3RC2g5hCp0iCBSoZTtKzfLPDf
	 68XazAAvBAMGGTl65Oz9oRZmGPIP1TIH/7FZqb/7BtiriQw2cw0xBzRMJn9O7Xe1Ar
	 pc+FFng3qQCr/CUao6FaBEzeGs8Ubuoo2UgbYP7+0v4Q1NSX8tc/1UTOULJLGbnzMe
	 kUBwc7LSckYRg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 952ABC5AD5A;
	Wed, 12 Aug 2026 09:34:44 +0000 (UTC)
From: George Moussalem via B4 Relay <devnull+george.moussalem.outlook.com@kernel.org>
Date: Wed, 12 Aug 2026 13:34:38 +0400
Subject: [PATCH v2 03/14] arm64: dts: qcom: ipq5018: Add USB Super-Speed
 PHY node
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260812-ipq5018-usb3-v2-3-8f355d7ff0ef@outlook.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786527282; l=1332;
 i=george.moussalem@outlook.com; s=20250321; h=from:subject:message-id;
 bh=riheTfE3kh2GSOSS8RnJjpesQWZx6C7ohPUXJLruDeM=;
 b=MGGdMWSaw90KDhnG0Bo2qowHXR3DKAMO2S3WqejJu/XPmdeUVGpmNtNf3IrH/nLhiKJ1nGY6o
 ZbWxBWVjBVQCYSOx3kH1wVqDZdPde9G9MX2jjE3ynywxNAKgfJWTldY
X-Developer-Key: i=george.moussalem@outlook.com; a=ed25519;
 pk=/PuRTSI9iYiHwcc6Nrde8qF4ZDhJBlUgpHdhsIjnqIk=
X-Endpoint-Received: by B4 Relay for george.moussalem@outlook.com/20250321
 with auth_id=364
X-Original-From: George Moussalem <george.moussalem@outlook.com>
Reply-To: george.moussalem@outlook.com

From: George Moussalem <george.moussalem@outlook.com>

Add USB Super-Speed UNIPHY node and populate the USB DT clock on the GCC
node for the GCC to gate the PIPE clock supplied by the USB3 PHY.

Signed-off-by: George Moussalem <george.moussalem@outlook.com>
---
 arch/arm64/boot/dts/qcom/ipq5018.dtsi | 19 ++++++++++++++++++-
 1 file changed, 18 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/ipq5018.dtsi b/arch/arm64/boot/dts/qcom/ipq5018.dtsi
index 4fc627b47fe7..d259a841ad17 100644
--- a/arch/arm64/boot/dts/qcom/ipq5018.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq5018.dtsi
@@ -179,6 +179,23 @@ usbphy0: phy@5b000 {
 			status = "disabled";
 		};
 
+		usbphy1: phy@5d000 {
+			compatible = "qcom,ipq5018-uniphy-usb-ss-phy";
+			reg = <0x0005d000 0x800>;
+
+			clocks = <&gcc GCC_USB0_PHY_CFG_AHB_CLK>,
+				 <&gcc GCC_USB0_PIPE_CLK>;
+
+			resets = <&gcc GCC_USB0_PHY_BCR>;
+
+			#clock-cells = <0>;
+			#phy-cells = <0>;
+
+			qcom,phy-usb-mux-sel = <&tcsr 0x10540>;
+
+			status = "disabled";
+		};
+
 		pcie1_phy: phy@7e000 {
 			compatible = "qcom,ipq5018-uniphy-pcie-phy";
 			reg = <0x0007e000 0x800>;
@@ -436,7 +453,7 @@ gcc: clock-controller@1800000 {
 				 <&sleep_clk>,
 				 <&pcie0_phy>,
 				 <&pcie1_phy>,
-				 <0>,
+				 <&usbphy1>,
 				 <&gephy_rx_clk>,
 				 <&gephy_tx_clk>,
 				 <0>,

-- 
2.53.0



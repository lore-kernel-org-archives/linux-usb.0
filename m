Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0456E447800;
	Tue, 25 Aug 2026 12:37:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787661456; cv=none; b=gFtsQEPaFNwA3EaXIwQg/yDeE7VpRbD0fNn0qMxt9zsnjNWs6RkNZ0VQNJrDUN6+ekElb3fqg2E7JCnpw7SZA335hpu8KThmfBMwP5MZNm21554rNbXL73oe+n/NqT1FQMMwowI/knKIl6H8nOF9wx3GQHW7K7FdWdbaAP6qFU8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787661456; c=relaxed/simple;
	bh=xEZbjkRSjge3V1gBlRIEkTNYuMWY3j9/vqhEVfhgLQ0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MZEhVB1vit5rH3gL6cXmrPbALsd94liTYIaV4bNntM+gKYb2a12oPlZmmAT+YtWJhsj8VQjo2rV1ZUorb0OZk26rnDzUfRWayY+Bxsc80jyYLQRWUJXNl+J7p3jPM3yQxczUhKFJjw+RYXjaLLdhZqqsMiOrccGqon0CXgGokrI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HiXfKtuP; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HiXfKtuP"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 58B6EC4DDE5;
	Tue, 25 Aug 2026 12:37:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1787661453;
	bh=xEZbjkRSjge3V1gBlRIEkTNYuMWY3j9/vqhEVfhgLQ0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=HiXfKtuPdCF1l6d5U/dzVLaapcmzHGu+PvPjLvqwrlOO5iQ/AzKMXLrF1Rlwgdb26
	 551kf0fS3+RwgemgxP6XG3Y2oKukoJGPSupWnoEfmRY1d54/LK+9WfDKU40W4c7wJa
	 q+CKYY4mu7Trs3TphoNJGH9uVRReYVGmIhA7vWfsezHEz1xVeOITEB7ftQhMbKrVHm
	 O1IPLO3GlRPoU7ur+pkLWlgtI1p5jyPLkH/6fmwrUwj1mXZL5AYulVQ0Xpq2JmWkf8
	 zufJ1ZpYA4SXys9qEtoH/M3W48CjFsauC+sIY78bOWERHzJ6l9dZMGXDBwQRGWPdfa
	 zWVBkj4755cfg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 442D7C61DBD;
	Tue, 25 Aug 2026 12:37:33 +0000 (UTC)
From: George Moussalem via B4 Relay <devnull+george.moussalem.outlook.com@kernel.org>
Date: Tue, 25 Aug 2026 16:37:25 +0400
Subject: [PATCH v3 08/12] arm64: dts: qcom: ipq5018: Add USB Super-Speed
 PHY node
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260825-ipq5018-usb3-v3-8-39be0955a6aa@outlook.com>
References: <20260825-ipq5018-usb3-v3-0-39be0955a6aa@outlook.com>
In-Reply-To: <20260825-ipq5018-usb3-v3-0-39be0955a6aa@outlook.com>
To: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Praveenkumar I <praveenkumar.i@oss.qualcomm.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>, 
 Nitheesh Sekar <quic_nsekar@quicinc.com>, 
 Wesley Cheng <quic_wcheng@quicinc.com>, 
 Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-usb@vger.kernel.org, George Moussalem <george.moussalem@outlook.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787661450; l=1320;
 i=george.moussalem@outlook.com; s=20250321; h=from:subject:message-id;
 bh=3gnMuvdkhkSVCiECSjDDLV0IaEe/Z6xvImu3EIsvXdQ=;
 b=Cknj3brONBxs/fkWzuFYk+noU2/5hU46dPVVx7B3IKjGcQqW/s4Vkd1ihFhRVK/WAOdVNL46K
 zO0iGzB9aGdDsirSHzKDD7mgIJjv3NzyIYU3YVMs5Nq49wCwyCE7gJI
X-Developer-Key: i=george.moussalem@outlook.com; a=ed25519;
 pk=/PuRTSI9iYiHwcc6Nrde8qF4ZDhJBlUgpHdhsIjnqIk=
X-Endpoint-Received: by B4 Relay for george.moussalem@outlook.com/20250321
 with auth_id=364
X-Original-From: George Moussalem <george.moussalem@outlook.com>
Reply-To: george.moussalem@outlook.com

From: George Moussalem <george.moussalem@outlook.com>

Add the USB3 PHY node and populate the USB DT clock on the GCC node for
the GCC to gate the PIPE clock supplied by the USB3 PHY.

Signed-off-by: George Moussalem <george.moussalem@outlook.com>
---
 arch/arm64/boot/dts/qcom/ipq5018.dtsi | 19 ++++++++++++++++++-
 1 file changed, 18 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/ipq5018.dtsi b/arch/arm64/boot/dts/qcom/ipq5018.dtsi
index 71834606535e..7638299671d8 100644
--- a/arch/arm64/boot/dts/qcom/ipq5018.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq5018.dtsi
@@ -179,6 +179,23 @@ usbphy0: phy@5b000 {
 			status = "disabled";
 		};
 
+		usbphy1: phy@5d000 {
+			compatible = "qcom,ipq5018-uniphy-usb3-phy";
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



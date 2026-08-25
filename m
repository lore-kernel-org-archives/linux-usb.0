Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24F28447816;
	Tue, 25 Aug 2026 12:37:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787661456; cv=none; b=aQelL6wMBhthyF+XdUMcxpczuxHO8rkXnAeQ8TEJ6RZgKignHE7M8KtMCmy84SsmFT9GvNFE33Y77yPmJsXuIVRXopRNe49WOrSrFNRuC9qKCZUAE0Pmcy8LKC+qDr0GGfh1xoom/Ce2qfLOtA8Dk1Nn3cS7oG4SUOlkW7vw99M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787661456; c=relaxed/simple;
	bh=RPofw7g0lz8bsVm1e38eeAfvHc5OrFMgVybkqAC5mkA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qXUTRxdwQm7BAXyR/hBSKOHHynW/UsDHFMhOemA9fleyje/32aCqDHgX7e/Gz7euHts9HEdnL5SdQHN7dqhgEaICanmvBljfxY2P0YUsf6eXeBbMiCWeZVpmcFWZRUPJ2M0hDNI29EmmllFQgNelqP2gBJy+tFBjSSlqdoShVsA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jOtefuLQ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jOtefuLQ"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 783F9C2BD01;
	Tue, 25 Aug 2026 12:37:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1787661453;
	bh=RPofw7g0lz8bsVm1e38eeAfvHc5OrFMgVybkqAC5mkA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=jOtefuLQ4Mkqz2tSfwksNRDzcSoLXjACpRCwjo2DOjqZHB6uYrPiT9U6c7pjXnySr
	 9LwLN1yzQBaay5rHF1qItKmYPSvrm0HdgQpYb/VouvQ8JKgxvvPuVvsh3WbHk6AQxH
	 h8ngl8/QFZcI9s1EAXjOLThtHmFpwOrEWt1vdrDmcfUSDy5ezVmSEQKkYBlT+P+0ha
	 YToYxVKq1ua9n+AM+OGGPnEJIftkKpK979B/DhfZIOzoODKcSST3Wb9vFanUzX0s+i
	 9tU6Cx/IOs89tHMbLgp6dSdyA0tLuFc0ZhjZqtCtV5LOLE5/flUcpkRKSO+SXMeq2p
	 ZMZaB5lIbXw7Q==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63407C61DC6;
	Tue, 25 Aug 2026 12:37:33 +0000 (UTC)
From: George Moussalem via B4 Relay <devnull+george.moussalem.outlook.com@kernel.org>
Date: Tue, 25 Aug 2026 16:37:27 +0400
Subject: [PATCH v3 10/12] arm64: dts: qcom: ipq5018: Add clocks required
 for USB3 support
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260825-ipq5018-usb3-v3-10-39be0955a6aa@outlook.com>
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
 linux-usb@vger.kernel.org, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 George Moussalem <george.moussalem@outlook.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787661450; l=1328;
 i=george.moussalem@outlook.com; s=20250321; h=from:subject:message-id;
 bh=STG2XcQgC6WNHuUCJZXxf9qTnMcaFKA0w+Hgc6UGMow=;
 b=LktWaB86JJzH2hvfz3p4tPxjnwwKE/gS5Cj4+uZODCnYfKGLIZDNyy7vsAJWRAcJb9ib1gijY
 0H25XTVm7W2DMhEuniH01uTRDx8D4bHk2OD7/iEd9Ry2AI6pTLsIhPF
X-Developer-Key: i=george.moussalem@outlook.com; a=ed25519;
 pk=/PuRTSI9iYiHwcc6Nrde8qF4ZDhJBlUgpHdhsIjnqIk=
X-Endpoint-Received: by B4 Relay for george.moussalem@outlook.com/20250321
 with auth_id=364
X-Original-From: George Moussalem <george.moussalem@outlook.com>
Reply-To: george.moussalem@outlook.com

From: George Moussalem <george.moussalem@outlook.com>

Add aux and lfps clocks to USB controller node for Super-Speed support.
These clocks are required for USB3 mode only and are not needed for USB2
mode.

In addition, set UTMI clock frequency to ensure it's parented correctly
and override the clock rate potentially set by the bootloader.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: George Moussalem <george.moussalem@outlook.com>
---
 arch/arm64/boot/dts/qcom/ipq5018.dtsi | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/ipq5018.dtsi b/arch/arm64/boot/dts/qcom/ipq5018.dtsi
index 7638299671d8..7f730c2ab763 100644
--- a/arch/arm64/boot/dts/qcom/ipq5018.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq5018.dtsi
@@ -604,11 +604,15 @@ usb: usb@8a00000 {
 			clocks = <&gcc GCC_USB0_MASTER_CLK>,
 				 <&gcc GCC_SYS_NOC_USB0_AXI_CLK>,
 				 <&gcc GCC_USB0_SLEEP_CLK>,
-				 <&gcc GCC_USB0_MOCK_UTMI_CLK>;
+				 <&gcc GCC_USB0_MOCK_UTMI_CLK>,
+				 <&gcc GCC_USB0_AUX_CLK>,
+				 <&gcc GCC_USB0_LFPS_CLK>;
 			clock-names = "core",
 				      "iface",
 				      "sleep",
-				      "mock_utmi";
+				      "mock_utmi",
+				      "aux",
+				      "lfps";
 			assigned-clocks = <&gcc GCC_USB0_MOCK_UTMI_CLK>;
 			assigned-clock-rates = <60000000>;
 

-- 
2.53.0



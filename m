Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A3A040F75B;
	Wed, 12 Aug 2026 09:34:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786527285; cv=none; b=grNPi9yCYqXd7hDqVa8XdBxA23WOUTtq+npKhnksvdsG1kHG2raGKtvc7l7/DAAUPoJS7exgq3GN+gmAVTQ+f5+laObotUmsMvTvjJfUdiIug1OHMN9YY39FaIFxNVWbD/l7ifEjh4dycLAz5O3niNahlte3O2Wvc1RLoqXsCgM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786527285; c=relaxed/simple;
	bh=aRSE+94+ryw4vz/c9r7KLtfF+Twu0O41LCXAUzIQvo0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lCseioqj2coHgnhs7s3rvGuL6SZ7cYUUTbXe71G/Y8bAtTiX+eRclYsfclid1iK6sXXdNRFp6vld6f9BnoXBeHJkenHhG48AojL2+7GYCtbKFHUwWATvEeOGT5lntWMyNDINM53OZ/DzBnlxFWrguHLTzAVugHMO9HTG5nM5Khw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rTf4fiAU; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rTf4fiAU"
Received: by smtp.kernel.org (Postfix) with ESMTPS id F06DAC4AF4D;
	Wed, 12 Aug 2026 09:34:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1786527285;
	bh=aRSE+94+ryw4vz/c9r7KLtfF+Twu0O41LCXAUzIQvo0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=rTf4fiAUCG4nLnToqhzROEZNiMaVcnDdkWDidxu/Ej/bUQie13eYfY0qxmrY0XqDb
	 orBaC4JbhnOOUGoijyMSFW1YQeRl/v5KgMowU7QDDKePnN84QdPzzVNQP2cspWjadB
	 /likiKsNrkZiOmZo12Hl0ZGJ7QV7fV8jcKbz1jAbIBSvQs9gH8M3P7mQb+ne561T+1
	 MDZA82tCMZ3Nw1dkIuH4kiNS4oxHWkyey/W7hoabp2UTjCDO2+WFSF7OzzJO3ItxEF
	 DFkQC4G7Fs966fK+kV/cSkxDhckky05wcCeKsdRww+ssZA2nXaWIY1mj3Cqnt8nqJS
	 cU5TX/02NyCeA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB51DC5B56A;
	Wed, 12 Aug 2026 09:34:44 +0000 (UTC)
From: George Moussalem via B4 Relay <devnull+george.moussalem.outlook.com@kernel.org>
Date: Wed, 12 Aug 2026 13:34:43 +0400
Subject: [PATCH v2 08/14] arm64: dts: qcom: ipq5332: Add clocks required
 for USB3 support
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260812-ipq5018-usb3-v2-8-8f355d7ff0ef@outlook.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786527282; l=984;
 i=george.moussalem@outlook.com; s=20250321; h=from:subject:message-id;
 bh=ahJs4DPyNLGX7SXzT58shCgWpJw7k4x2FzR8MZ0ny3A=;
 b=82/coOkgY6ouZWe9JkwUpLQLqRtEKxKuPfBSkHsCW6eCDPNKBPWUnE+Mk33E0s3h76cguttEL
 9vSwe7n1lf5C7V/e2dH2O988bbTC4MvaUAwgRcW1dQbgJqau0W4l9V0
X-Developer-Key: i=george.moussalem@outlook.com; a=ed25519;
 pk=/PuRTSI9iYiHwcc6Nrde8qF4ZDhJBlUgpHdhsIjnqIk=
X-Endpoint-Received: by B4 Relay for george.moussalem@outlook.com/20250321
 with auth_id=364
X-Original-From: George Moussalem <george.moussalem@outlook.com>
Reply-To: george.moussalem@outlook.com

From: Praveenkumar I <quic_ipkumar@quicinc.com>

Add aux and lfps clocks to USB controller node for Super-Speed support.

Signed-off-by: Praveenkumar I <quic_ipkumar@quicinc.com>
Signed-off-by: George Moussalem <george.moussalem@outlook.com>
---
 arch/arm64/boot/dts/qcom/ipq5332.dtsi | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/ipq5332.dtsi b/arch/arm64/boot/dts/qcom/ipq5332.dtsi
index 83d0377455da..664586979ec4 100644
--- a/arch/arm64/boot/dts/qcom/ipq5332.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq5332.dtsi
@@ -499,10 +499,14 @@ usb: usb@8a00000 {
 
 			clocks = <&gcc GCC_USB0_MASTER_CLK>,
 				 <&gcc GCC_USB0_SLEEP_CLK>,
-				 <&gcc GCC_USB0_MOCK_UTMI_CLK>;
+				 <&gcc GCC_USB0_MOCK_UTMI_CLK>,
+				 <&gcc GCC_USB0_AUX_CLK>,
+				 <&gcc GCC_USB0_LFPS_CLK>;
 			clock-names = "core",
 				      "sleep",
-				      "mock_utmi";
+				      "mock_utmi",
+				      "aux",
+				      "lfps";
 
 			resets = <&gcc GCC_USB_BCR>;
 

-- 
2.53.0



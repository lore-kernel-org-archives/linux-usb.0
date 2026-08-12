Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F39540F8D5;
	Wed, 12 Aug 2026 09:34:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786527285; cv=none; b=JDGI6LnyRJLiPndxr19OfsmfFzMGRLUuAwujQYoE8SS1VDOP7QgV9Oz7zI04ZTWKBNkR3xb/Ma/GkyuqhfzfOzK7lMiSyEqwUvRSz2xckeTSXY5zLcXi7bclJYcdDJyMJqr0U8ecOyd95xvXvO1toMkwEdfTg8fQhhQVKh5ToCc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786527285; c=relaxed/simple;
	bh=lPWoL23l+8iQd44dS0Bo1JaT1Zz2Qstnv2s1Mec3s+8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fc+JFS++LKYbopdFj7HDORpwaJjuS2OIMQrILHl52DQ4V9/OGOZF2GPtKZQ8FCXvTkuXyUY2/dXgzl276ItYAt+bjaQTuaFeOIaELoT0J8IFD11hHfQUvE0nmPdAYNvgjmQqP4rE+yTFOqU80jISPjvEROFJHTtilGHniLGHMt8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PrEiQf9Q; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PrEiQf9Q"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 161C2C4AF0F;
	Wed, 12 Aug 2026 09:34:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1786527285;
	bh=lPWoL23l+8iQd44dS0Bo1JaT1Zz2Qstnv2s1Mec3s+8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=PrEiQf9Q2MEH4HgPCGa1H2FSY8ThQN+oSr7VprdHt+ejtJvlwvZlZXNBLIa797h23
	 xiF3KISCOYEUiF+S3hrS2m6AnuFpdDqcS+/g/KibT/AJQUfX3DAUznnHWDr/8lT70q
	 QWLG3RhHPQCy1+afG9FtaqKvsauzaJrVcDJuXz5YUdEgqKfr9aUi2hslRcKwJ7+tyd
	 LtOFKNWcUgYDQVNpu3CLlTNq4q2jJ9IBkaIc44tkXxLE1vMAmBKP8VAKWVG43N01Qg
	 wLMbtDyUZu9aajfuDVjUULoowNNK84u/OM5hhOwyGAOurCM18kNROzxML61G3lhnEa
	 BC2yleAnuJxdQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01CB4C5AD5A;
	Wed, 12 Aug 2026 09:34:45 +0000 (UTC)
From: George Moussalem via B4 Relay <devnull+george.moussalem.outlook.com@kernel.org>
Date: Wed, 12 Aug 2026 13:34:45 +0400
Subject: [PATCH v2 10/14] arm64: dts: qcom: ipq5332: Add Super-Speed UNIPHY
 to USB node
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260812-ipq5018-usb3-v2-10-8f355d7ff0ef@outlook.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786527282; l=985;
 i=george.moussalem@outlook.com; s=20250321; h=from:subject:message-id;
 bh=rAa8xnID9wmdueBQ/cZWnFq7q+M1tI3cAzU0GkmPT8o=;
 b=P0a3iZfEx04ciMLlDTrFS0/R6gKS905M4fKM5nH6/RFXWzZeQUUnR3kSL9kkVYSKMTcpf5TJf
 Xq8q8ZGTzGuCW+Fga3yqhOYtaz9zv0CxTAnJ3+yrUvWoMvoefa08B63
X-Developer-Key: i=george.moussalem@outlook.com; a=ed25519;
 pk=/PuRTSI9iYiHwcc6Nrde8qF4ZDhJBlUgpHdhsIjnqIk=
X-Endpoint-Received: by B4 Relay for george.moussalem@outlook.com/20250321
 with auth_id=364
X-Original-From: George Moussalem <george.moussalem@outlook.com>
Reply-To: george.moussalem@outlook.com

From: Praveenkumar I <quic_ipkumar@quicinc.com>

Add the USB3 UNIPHY node to the USB controller node.
In addition, switch to the pipe clock supplied by the USB3 UNIPHY
instead of the UTMI clock.

Signed-off-by: Praveenkumar I <quic_ipkumar@quicinc.com>
Signed-off-by: George Moussalem <george.moussalem@outlook.com>
---
 arch/arm64/boot/dts/qcom/ipq5332.dtsi | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/ipq5332.dtsi b/arch/arm64/boot/dts/qcom/ipq5332.dtsi
index 664586979ec4..6253443c8d7f 100644
--- a/arch/arm64/boot/dts/qcom/ipq5332.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq5332.dtsi
@@ -523,10 +523,8 @@ usb: usb@8a00000 {
 					<&gcc MASTER_SNOC_USB &gcc SLAVE_SNOC_USB>;
 			interconnect-names = "usb-ddr", "apps-usb";
 
-			phys = <&usbphy0>;
-			phy-names = "usb2-phy";
-
-			qcom,select-utmi-as-pipe-clk;
+			phys = <&usbphy0>, <&usbphy1>;
+			phy-names = "usb2-phy", "usb3-phy";
 
 			tx-fifo-resize;
 			snps,is-utmi-l1-suspend;

-- 
2.53.0



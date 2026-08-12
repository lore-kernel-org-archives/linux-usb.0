Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABCDE41169F;
	Wed, 12 Aug 2026 09:34:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786527285; cv=none; b=dKL+vD4G1zrpo3y1CQTin9U2MyYyMrog0P6v+GjiVKNIz5fZAk9Q3jCUTH8m5ziYrAQWVswweRkD6tuycoj+ftZzdqNUkF1ORcJDycspHeLUF8SLuckThyMguMIKjuyF5wRjuKv+HCLuCib018n3aY5it3ZSFyFUzVOW7wQVOi0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786527285; c=relaxed/simple;
	bh=CEJImADqksx/jnXCqycUUtZetr8Js6Q6vJkHmpvfFMY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=iBWQzmQnmTBViwjBiBHvbJQjonODXQHX6nnMZQllX44Lsyx5PuAU9zpoo1YMjqu0V1fshqu355rD0njIKpagKxfHF4eIY9HqCyu8QUEvKtI9UhlcF06mJDCH2rrQZWu3xa2bTq/6NF5hXpK/e47mCIs6/8HPrwCsMQb4sDXcHXc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SglLNjLY; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SglLNjLY"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 25F3CC4AF13;
	Wed, 12 Aug 2026 09:34:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1786527285;
	bh=CEJImADqksx/jnXCqycUUtZetr8Js6Q6vJkHmpvfFMY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=SglLNjLYb7ZnTC1At5krlFVzjjPOcHrKdU1GWgBxXHO4Z4lOq9RlkjU1slYZrYHAM
	 6+y1KzcewjQlSZuzaDgu0gRhNElBz6AdPjqpRzVFZiUREKe7rxyuR3oJL4g6EphoRK
	 M51HNTh7JriSAMh4S8Z9ndmL+wpDwulZ02SmuQ5ZVmwu02BgGJk2KCS6faQ4oUf3ee
	 K31vg8y56QoDQNE8bVOGiwyIOcUgneRd+E70tL1Mw4T0fwIswaupatiivmGeHTxW9R
	 P91riIDYaHEwFr4RCp1wlM+kocg5IkMDoGoJgN/GD8g5wYApS+5Xwnda3mw8EL9itA
	 jRiVHL1fe9S+Q==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0FA52C5CFDB;
	Wed, 12 Aug 2026 09:34:45 +0000 (UTC)
From: George Moussalem via B4 Relay <devnull+george.moussalem.outlook.com@kernel.org>
Date: Wed, 12 Aug 2026 13:34:46 +0400
Subject: [PATCH v2 11/14] arm64: dts: qcom: ipq5018: Add Super-Speed UNIPHY
 to USB node
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260812-ipq5018-usb3-v2-11-8f355d7ff0ef@outlook.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786527282; l=865;
 i=george.moussalem@outlook.com; s=20250321; h=from:subject:message-id;
 bh=8bhPK8flz4g64F9hoc1dqcAmebxhDioRZihPcA2zzas=;
 b=iOasZLYsfLMSMhH9mM8vLaYok33PTvlCo51GrOdO8jsqdez68kqQWKaAJxpHPR/pO1sskcx58
 mnRboKr4eYSBm4XSpjZIl4xKcxLDwhOeFn4znV2GDxVVVaISZOc2vT1
X-Developer-Key: i=george.moussalem@outlook.com; a=ed25519;
 pk=/PuRTSI9iYiHwcc6Nrde8qF4ZDhJBlUgpHdhsIjnqIk=
X-Endpoint-Received: by B4 Relay for george.moussalem@outlook.com/20250321
 with auth_id=364
X-Original-From: George Moussalem <george.moussalem@outlook.com>
Reply-To: george.moussalem@outlook.com

From: George Moussalem <george.moussalem@outlook.com>

Add the USB3 UNIPHY node to the USB controller node.
In addition, switch to the pipe clock supplied by the USB3 UNIPHY
instead of the UTMI clock.

Signed-off-by: George Moussalem <george.moussalem@outlook.com>
---
 arch/arm64/boot/dts/qcom/ipq5018.dtsi | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/ipq5018.dtsi b/arch/arm64/boot/dts/qcom/ipq5018.dtsi
index c98889a7c26c..01b8181ffa40 100644
--- a/arch/arm64/boot/dts/qcom/ipq5018.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq5018.dtsi
@@ -631,10 +631,8 @@ usb: usb@8a00000 {
 
 			resets = <&gcc GCC_USB0_BCR>;
 
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



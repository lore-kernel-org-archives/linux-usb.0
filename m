Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23A9E447811;
	Tue, 25 Aug 2026 12:37:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787661456; cv=none; b=s3pZ//IePzqYnX2Ee+uvNFcrwffkUDV7h0/uOclmk2htpNtBJu+HXTkFELAZcfupXlm2g01hPdtyroqG5MV33QqXuWE+r+mKXi6YyaxEHg1omZo2P84pS92Dbz3+xuTMy+ZvaD/S6gCiwEYhFc+QpvWzx4YM+M3CBDKk6RDmYdk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787661456; c=relaxed/simple;
	bh=7Zgspg2cpl6a219QZ8lKlBpC1rJx9A4XKCi4EwWakz4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Fvwvzcx34mAXzOxuDYTjXc7OqyxdCJ1LpGoMcUL7f4TBG5ZyIpTByhBRdiEumxH7w/y+2i/eEy8J2kfaRT8/6YBNIQc4eS/hFce11yBrFS2ESZGRlmoM+v3+TXCsBNYfGjoUStAmcnkHj1ZRByJsWhEQMOaYt/K1AzOQPSZK6mQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bZs2GgiJ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bZs2GgiJ"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 97A99C4AF18;
	Tue, 25 Aug 2026 12:37:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1787661453;
	bh=7Zgspg2cpl6a219QZ8lKlBpC1rJx9A4XKCi4EwWakz4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=bZs2GgiJnxbXABZ7Dm/P+b9Iw3Fh549cvtzTQur8tWjK4WHzTrCyJHPNNIALjCDHy
	 KwWnhZAtJnNKo6liFOJ6d8jaSgw4odZ1ATv5ie52AUlX+qchqeHUNvw0bZtOIdfDq4
	 ixJjLdDavzcTDABdkl6k8paUNIkIce/XhdlgWch5yoVmF7XiavqQlxHFladFv0VvkE
	 HsjINhUTOgUGfGsLmsVi/uX5rhK9cTcxfA66EbkihhpqHLO131mth2RhMpK6LURtm1
	 GK0bx4LcNYc79Es2nQO80JAtEAm25u7Q0S1LywEPi3+LFy3XiyUGEJ0Lz20/C2vXRf
	 zqCbjxCep+qOA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82E91C61DC4;
	Tue, 25 Aug 2026 12:37:33 +0000 (UTC)
From: George Moussalem via B4 Relay <devnull+george.moussalem.outlook.com@kernel.org>
Date: Tue, 25 Aug 2026 16:37:29 +0400
Subject: [PATCH v3 12/12] arm64: dts: qcom: ipq5018: Enable USB Super-Speed
 PHY
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260825-ipq5018-usb3-v3-12-39be0955a6aa@outlook.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787661450; l=1078;
 i=george.moussalem@outlook.com; s=20250321; h=from:subject:message-id;
 bh=mqT4fUHiS6tNRhSdjnTI3aemIVcVL9vUJPPDNDpgcvM=;
 b=Zbh5XdZj5kfib84EvhnO+1xUv69j2kvgZlvOlgYPrI6hfVGPf812sBi6fbEFwZkzDzuN8g92X
 zu3GBxeoPA+BP2pHmBTWaCK2dYjZLRiSjy+BermATV6GSCSAqPfpC8b
X-Developer-Key: i=george.moussalem@outlook.com; a=ed25519;
 pk=/PuRTSI9iYiHwcc6Nrde8qF4ZDhJBlUgpHdhsIjnqIk=
X-Endpoint-Received: by B4 Relay for george.moussalem@outlook.com/20250321
 with auth_id=364
X-Original-From: George Moussalem <george.moussalem@outlook.com>
Reply-To: george.moussalem@outlook.com

From: George Moussalem <george.moussalem@outlook.com>

Add the 5V supply regulator and enable USB Super-Speed PHY support.

Signed-off-by: George Moussalem <george.moussalem@outlook.com>
---
 arch/arm64/boot/dts/qcom/ipq5018-rdp432-c2.dts | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/ipq5018-rdp432-c2.dts b/arch/arm64/boot/dts/qcom/ipq5018-rdp432-c2.dts
index 8efb2b21ed9e..ca29f271e673 100644
--- a/arch/arm64/boot/dts/qcom/ipq5018-rdp432-c2.dts
+++ b/arch/arm64/boot/dts/qcom/ipq5018-rdp432-c2.dts
@@ -22,6 +22,14 @@ aliases {
 	chosen {
 		stdout-path = "serial0:115200n8";
 	};
+
+	regulator_fixed_5p0: regulator-s0500 {
+		compatible = "regulator-fixed";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		regulator-name = "fixed_5p0";
+		gpios = <&tlmm 24 GPIO_ACTIVE_LOW>;
+	};
 };
 
 &blsp1_uart1 {
@@ -119,6 +127,12 @@ &usbphy0 {
 	status = "okay";
 };
 
+&usbphy1 {
+	vdd-supply = <&regulator_fixed_5p0>;
+
+	status = "okay";
+};
+
 &xo_board_clk {
 	clock-div = <4>;
 	clock-mult = <1>;

-- 
2.53.0



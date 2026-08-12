Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A769A411693;
	Wed, 12 Aug 2026 09:34:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786527285; cv=none; b=XBUhsA6ZcZ0RSP7CmYJ4y8kniVPBJ4T7HNPn2W8zKk6s24stwdO2eKLr2/v1VnUnBiiPZA3SI24UnlGFy/Lh+OYOGbTfEvBpSOo9yWhmysjLCxZBOSXTnhz+ebC8wOlK+3NhF+DuHO/Snix1DUyb0oFTP+7r5Zi93/mBLIJP878=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786527285; c=relaxed/simple;
	bh=7Zgspg2cpl6a219QZ8lKlBpC1rJx9A4XKCi4EwWakz4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QzyHRMbNaKVAXMPk4OpkWqmArzu/u523B+xpON1BvoNiz2MTpKw+A5QS3zEX92OKVhXc+aNx+ZIa1+6elE6mMTYdb2gExS/O8g1LmDibCbQhWq0N9WIsR5gyNp4A55Ox+z/qONiNtmInnIlIOGbl/PPKKUm+i+XQbSxTDEeWrVA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OerUFEAx; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OerUFEAx"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3DFA5C2BCB9;
	Wed, 12 Aug 2026 09:34:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1786527285;
	bh=7Zgspg2cpl6a219QZ8lKlBpC1rJx9A4XKCi4EwWakz4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=OerUFEAxmp1R9K2WcROdmtYEG50/RQvzrOp9B5RxAzjK3sQAIezncrTUgqZgaNn6T
	 qxVTU3ECVjgmXcNzoV9GCW06Bn+71uO1SnI75NUIox6jPoe51XFM4LiMfuBYrHD4rb
	 azWjRDDdJN7HB8yEsvr56eUzzQOyLwNnf+WQ+nERh0+6oTVklcVurW5/18rqtXtiGP
	 MssRhuMZMShcf0oasjAr8276cWR2NAZxHidzfHnENZKw4IyY6Fqlif7UYZ6GX5jcoa
	 hRrv2ZsSeoi8WNZVYIGfT3FEvALmWxtou7mcHyeR/YJKhvcvebyIpP2OrQfuzaHvYP
	 0M+NQlMDk7OcQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C3DAC5CFEE;
	Wed, 12 Aug 2026 09:34:45 +0000 (UTC)
From: George Moussalem via B4 Relay <devnull+george.moussalem.outlook.com@kernel.org>
Date: Wed, 12 Aug 2026 13:34:48 +0400
Subject: [PATCH v2 13/14] arm64: dts: qcom: ipq5018: Enable USB Super-Speed
 PHY
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260812-ipq5018-usb3-v2-13-8f355d7ff0ef@outlook.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786527282; l=1078;
 i=george.moussalem@outlook.com; s=20250321; h=from:subject:message-id;
 bh=mqT4fUHiS6tNRhSdjnTI3aemIVcVL9vUJPPDNDpgcvM=;
 b=qybIHF+s5v1NyNyS8IxUiy4ByiNmC5uvk2E2MxcCfRck+On3NOjNpbgSzSuOLekr36997faes
 fk0HgB6X4OuBweXUd68uRBwhjQAcHkf+Cp2PaeVJ1IR7k9uB1GmwqU5
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



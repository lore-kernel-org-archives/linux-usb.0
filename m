Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A929241169B;
	Wed, 12 Aug 2026 09:34:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786527285; cv=none; b=oinG9TtI9jnhtuAKB1jmwWxomiToohBbMdC8PlYo+xfPqMsZJS/jwxq5cKmh+Fh4DnP5/GGGlfldd4AlO3ZpvQ3axFfjEip1jZGHiFLvN8pTFru9TYRVTguhzowclsGzfzLROBa4AaerXD0Z5NWjqNdJHN4Fj7i0QF1zYY2LRNw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786527285; c=relaxed/simple;
	bh=1LiBzRWxvUcNljnnFnCp4vUdyAocy4/M2Upks6IqAE8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FaDitFYdqeYidJPPIVHugcCXIx3SEZqGx2fbnAtbXLA/ZCWoS7YzP5mR5v2T2R8GK3DfWRmFJkIJ38V0Ah1AkEICi8rbLCr80WqGz9T1XkDmRz6ATuG8Yb+9pTECk3iK1Qq2roWT+KB1RFjK0mzRD9gykf9UgqL9j1WRc1fY98c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pbksAYl+; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pbksAYl+"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 33941C2BCFD;
	Wed, 12 Aug 2026 09:34:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1786527285;
	bh=1LiBzRWxvUcNljnnFnCp4vUdyAocy4/M2Upks6IqAE8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=pbksAYl+69M8oASp+ZhaKqTKgWDvbGZLz/ovX6amnatOVG82BpZX4rrTFWNn0p6kb
	 a1TVH3BKWZuWhg+R5PLoDFeF1KNZxnvCY/87obFJkenLSYs1X2o5A6IP2NpJbtLwTx
	 0oyb6GR1gLs1Gsk4XJtp/plVS6ZYl5zK/VeAiZwfaJHI0ffkNjYuFtwj9HhlMLeIJ2
	 1JjeimcX1CYILKc71IJk8zx2W8zMuUlvTaL/oaF1628E9h9Z/ctROEe6yajIWVfv1h
	 KOx0WyiFYqRZs8KdxgGS47FHV3NZOiDFHuzLunA8cFw+d+i9uzu1BeMa8l6A9Vrfuu
	 zrliEOzIGWMjg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E8AAC5B56A;
	Wed, 12 Aug 2026 09:34:45 +0000 (UTC)
From: George Moussalem via B4 Relay <devnull+george.moussalem.outlook.com@kernel.org>
Date: Wed, 12 Aug 2026 13:34:47 +0400
Subject: [PATCH v2 12/14] arm64: dts: qcom: ipq5332: Enable USB Super-Speed
 PHY
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260812-ipq5018-usb3-v2-12-8f355d7ff0ef@outlook.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786527282; l=1218;
 i=george.moussalem@outlook.com; s=20250321; h=from:subject:message-id;
 bh=4QodOwLvZBFpQJh/rbVs7oulaifWDwERoBYMxDOywh0=;
 b=Or4wpv3uHdshJMeNMhiS6sXik5KdX92OhBUuazDrm9R/jcwgLPY3HZleHKz8IeA5LRLeojaFu
 VS/ybAQtauRAZF9bPyyZUdF/Ff+wsR4u0faB7W9jM25vJ3Od2w/Z6jO
X-Developer-Key: i=george.moussalem@outlook.com; a=ed25519;
 pk=/PuRTSI9iYiHwcc6Nrde8qF4ZDhJBlUgpHdhsIjnqIk=
X-Endpoint-Received: by B4 Relay for george.moussalem@outlook.com/20250321
 with auth_id=364
X-Original-From: George Moussalem <george.moussalem@outlook.com>
Reply-To: george.moussalem@outlook.com

From: Praveenkumar I <quic_ipkumar@quicinc.com>

Enable USB Super-Speed PHY support. The PCIe and USB3 PHYs share the
same MMIO address space, so override the compatible string to use the
USB3 PHY driver instead of the PCIe PHY driver and set the required
properties accordingly.

Signed-off-by: Praveenkumar I <quic_ipkumar@quicinc.com>
Signed-off-by: George Moussalem <george.moussalem@outlook.com>
---
 arch/arm64/boot/dts/qcom/ipq5332-rdp468.dts | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/ipq5332-rdp468.dts b/arch/arm64/boot/dts/qcom/ipq5332-rdp468.dts
index 25a70cd884c0..164f9a9a6c75 100644
--- a/arch/arm64/boot/dts/qcom/ipq5332-rdp468.dts
+++ b/arch/arm64/boot/dts/qcom/ipq5332-rdp468.dts
@@ -100,3 +100,22 @@ &usbphy0 {
 
 	status = "okay";
 };
+
+/* this combo PHY supports PCIe and USB3 */
+&pcie0_phy {
+	compatible = "qcom,ipq5018-uniphy-usb-ss-phy";
+
+	clocks = <&gcc GCC_PCIE3X1_PHY_AHB_CLK>,
+		 <&gcc GCC_USB0_PHY_CFG_AHB_CLK>,
+		 <&gcc GCC_USB0_PIPE_CLK>;
+
+	resets =  <&gcc GCC_USB0_PHY_BCR>;
+
+	qcom,phy-usb-mux-sel = <&tcsr 0x10540>;
+
+	vdd-supply = <&regulator_fixed_5p0>;
+
+	/delete-property/ num-lanes;
+
+	status = "okay";
+};

-- 
2.53.0



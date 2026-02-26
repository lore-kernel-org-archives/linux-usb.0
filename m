Received: from mx-relay128-hz1.antispameurope.com (mx-relay128-hz1.antispameurope.com [94.100.132.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECE9B40FDAE
	for <linux-usb@vger.kernel.org>; Thu, 26 Feb 2026 15:40:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=94.100.132.194
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772120407; cv=pass; b=KinORHHvUhWA+cArI9BXq5zepfSAtzNoyeQfWhnvgJE+9EDQUkVztLR9xyZTKtK3Z7Xp3iwU6sFk99VOHCmIfQQFGkjw5nh5xQShjzmJDFtydNsq9vYoUp9kI6ovvlyvXOMcKGpQkv6ED2SBMPc3zRY+0fRdFzp44Ink1zy/YCc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772120407; c=relaxed/simple;
	bh=ZmBNK6ovNNRYQURoOJns8PrYmpFe1BC+SKTaRc6G7Tc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RHBAkKefo1jsHOQiJ2Mu+SuKmdwGzxPrAWlTBmpOAg5OBrk+QQkMJHVlKcVjOALeh8pHj4hB6WQglC9qSvBYF56MTU+gwlZAAaNt+ZSHL1p9gBX5S+d5FeGX4pqagPdBnbdtcgfhM8iyEXdBb1+hbt72cJruYFVNdvJOqV2WUsc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=PKVtfPde; arc=pass smtp.client-ip=94.100.132.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="PKVtfPde"
ARC-Authentication-Results: i=1; mx-gate128-hz1.hornetsecurity.com 1;
 spf=pass reason=mailfrom (ip=94.100.132.6, headerfrom=ew.tq-group.com)
 smtp.mailfrom=ew.tq-group.com smtp.helo=smtp-out01-hz1.hornetsecurity.com;
 dmarc=pass header.from=ew.tq-group.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=pcFCnv0cKdWyH49bkY0HloB9Tdx8I3uW4jqI9l2KHIQ=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version:; i=1; s=hse1;
 t=1772120363;
 b=DhudLJ5rSdvr0DFX/CmlI5nqq4UUOzocwZdDDAjI4rx6sobJR/0riGn5VgDLpR2cnbz+PQcO
 URLMz0OcKpudey7svBWdpkQifmviGMlogCu1j+D2tRoX1+v38rapxzOyJw9nKyOAFRgESOe6dD7
 +wrG8EwkcUevfBOqIDrjHScL2uWrrnDTeFJrxgjKxqIVErh0XGY+J6a1turjcXmIWSgulcynXdh
 6Au7Pn+p0VL4a6iXcOVbzGv+eA/BOKjYX+S3aJ1OIz3JVQRsVU4rpEK9OrILo+uuc0/Nkl1u7xH
 m9ETq2TEaaGMYOgvBJbmUDssAOsKyBMD5NCZCshxPjH5w==
ARC-Seal: a=rsa-sha256; cv=none; d=hornetsecurity.com; i=1; s=hse1;
 t=1772120363;
 b=WfqE6yh9vf6E1//UWcvSRMhElBJ/ol89GfBok1fJhoGsKBo2dzdk096iym1hps7hwZWbc2Px
 EbxMwHeWiehrgpUVSjtMotmKbfZNaZQvOVtXQ+W+0O8IhiU6vCEIxAuRJd/egczyNCZdw/JcpCF
 JXBqLQlzB75hyM7L1jX1yfUNFoPecb9EO040u5Ytt5VfqOZDqiYQw4to+CYVAgTMWzUjFhxO418
 /JK3TyKn5xyWioKf/1WcLK6bk6dAeY+PfJZcmFhcrvZNzDw5jMpAFFuiq9vrv+JralUl8cYihvq
 Xz3DV+dhDFRoeZ0EnOIT50lC6ocjjKNjjpl3BooP+pM0g==
Received: from he-nlb01-hz1.hornetsecurity.com ([94.100.132.6]) by mx-relay128-hz1.antispameurope.com;
 Thu, 26 Feb 2026 16:39:23 +0100
Received: from steina-w.tq-net.de (host-82-135-125-110.customer.m-online.net [82.135.125.110])
	(Authenticated sender: alexander.stein@ew.tq-group.com)
	by smtp-out01-hz1.hornetsecurity.com (Postfix) with ESMTPSA id 92AA8A40AB4;
	Thu, 26 Feb 2026 16:39:04 +0100 (CET)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Peter Chen <peter.chen@kernel.org>,
	Pawel Laszczak <pawell@cadence.com>,
	Roger Quadros <rogerq@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Magnus Damm <magnus.damm@gmail.com>,
	Marek Vasut <marex@denx.de>,
	Frank Li <Frank.Li@nxp.com>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-usb@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux@ew.tq-group.com
Subject: [PATCH v3 2/5] arm64: dts: imx8qm-ss-hsio: Wire up DMA IRQ for PCIe
Date: Thu, 26 Feb 2026 16:38:51 +0100
Message-ID: <20260226153859.665901-3-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260226153859.665901-1-alexander.stein@ew.tq-group.com>
References: <20260226153859.665901-1-alexander.stein@ew.tq-group.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-cloud-security-sender:alexander.stein@ew.tq-group.com
X-cloud-security-recipient:linux-usb@vger.kernel.org
X-cloud-security-crypt: load encryption module
X-cloud-security-Mailarchiv: E-Mail archived for: alexander.stein@ew.tq-group.com
X-cloud-security-Mailarchivtype:outbound
X-cloud-security-Virusscan:CLEAN
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-relay128-hz1.antispameurope.com with 4fMFxP5yjMzvRJq
X-cloud-security-connect: he-nlb01-hz1.hornetsecurity.com[94.100.132.6], TLS=1, IP=94.100.132.6
X-cloud-security-Digest:1fde6229671282bda88180e09167ed21
X-cloud-security:scantime:1.821
DKIM-Signature: a=rsa-sha256;
 bh=pcFCnv0cKdWyH49bkY0HloB9Tdx8I3uW4jqI9l2KHIQ=; c=relaxed/relaxed;
 d=ew.tq-group.com;
 h=content-type:mime-version:subject:from:to:message-id:date; s=hse1;
 t=1772120362; v=1;
 b=PKVtfPdeDvEx2wei36L08RR4LB3ySqg5nwWLlWnPryBZ3/6JSlgUsTv5F4dzbs4qHw5kK+sX
 jctlSMkcMSalJsbqiJWdjp2rsFHIXeV1eouWbTRMoC+1Chh31vBTszBT7e7hqHrHXIrnddEzdks
 bi4/VINv7ht3vjjOX+3iGy4UPjIjIY2LSANlREUZm8a0eZRvVtsoicefh9i8eWuYcWgYsBlxkRV
 pwe8yDtGLMs/CPVebsjlLqBIPaRiHNNPTU7o6EN2AAupLuk6RnODJbsvH46snsOXm2SphnkugGS
 NdW8CVbISZj5H7c7Us9y6nUEmSZ7r9rkGl5MKzEMdIu8Q==

IRQ mapping is already present. Add the missing DMA interrupt. This is
similar to commit 0b4c46f9ad79c ("arm64: dts: imx8qm-ss-hsio: Wire up
DMA IRQ for PCIe")

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
Changes in v3:
* None

 arch/arm64/boot/dts/freescale/imx8qm-ss-hsio.dtsi | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8qm-ss-hsio.dtsi b/arch/arm64/boot/dts/freescale/imx8qm-ss-hsio.dtsi
index bd6e0aa27efe9..f2c94cdb682b9 100644
--- a/arch/arm64/boot/dts/freescale/imx8qm-ss-hsio.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8qm-ss-hsio.dtsi
@@ -20,8 +20,9 @@ pcie0: pciea: pcie@5f000000 {
 		ranges = <0x81000000 0 0x00000000 0x4ff80000 0 0x00010000>,
 			 <0x82000000 0 0x40000000 0x40000000 0 0x0ff00000>;
 		#interrupt-cells = <1>;
-		interrupts = <GIC_SPI 70 IRQ_TYPE_LEVEL_HIGH>;
-		interrupt-names = "msi";
+		interrupts = <GIC_SPI 70 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 72 IRQ_TYPE_LEVEL_HIGH>;
+		interrupt-names = "msi", "dma";
 		#address-cells = <3>;
 		#size-cells = <2>;
 		clocks = <&pciea_lpcg IMX_LPCG_CLK_6>,
-- 
2.43.0


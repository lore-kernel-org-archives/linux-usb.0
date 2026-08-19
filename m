Received: from mx.nabladev.com (mx.nabladev.com [178.251.229.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABE09484226;
	Wed, 19 Aug 2026 16:34:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.251.229.89
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787157279; cv=none; b=skvfQziTQO0nLrhjJm5h0vATRcSZCm/7Aij2MqmEnFF4qrnXKPDASYNw9ITuKoe532uI3c1l2c20Z4SSQDobIptuVVL6JFDeLgCP0I2uDf2IghahryuxHwelkjlHmuNc/VJIRWSLEyy9wCPEOymCI+2ZmaY59IV7DftMSWA0+3o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787157279; c=relaxed/simple;
	bh=E/8Wx99zxrqTmJUUR3lyV32N6eqwti7+vI0/UpfrgyM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Wzd00K560laxn1c27HOBjqDEIaKd6AUSiEISz64OA1Szgo4psyGXEL39ODu82Wc8v3VJkB4pd/c2QpNxPSP7nJxJ0kR6QvKUcWtmOrotK5q2x3zTve0pl1icOmjBXS0A9Qa76pce1cCW02D1Mu3zGHIAuCGnPE/1q60WP4SmdX8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com; spf=pass smtp.mailfrom=nabladev.com; dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.b=Ngtwb1Fh; arc=none smtp.client-ip=178.251.229.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nabladev.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.b="Ngtwb1Fh"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D2EEE11C4DB;
	Wed, 19 Aug 2026 18:34:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1787157271; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=g97MLXgboSWX3Rdmb4CPNQY862mBBRdDnTP12afVH5w=;
	b=Ngtwb1FhX1deeduOun3mMzi9ZNala3o1HWFHA8EJ3GwBrOtIJykLJy7UUEx+MeAQd43F1k
	Bc0bfh4mhN6H1TBPDGd2PxMNFPMMBoS0TT1XcEjHziqnJejZnm9Hsr6AUHg+9eEwTgVHEh
	VBcH6YGF1DOB46jovvwhrWhEkr5LcB+KlP+F9O6dl+Fo32qhPX5sTqZy0eiNRf+iSeDw1Z
	o6rMYQfbX/um2dOINdow1WtRnkX06urrSGS9p/m3uw3tKGYql0qKxKmlQ4rRp8Ds5VcJIv
	i7EDbH/M1lWedBIEHWolk1iXDspWiNjyB8NLqbE4vHRMvGI4UDUA9X0ft/Ixqg==
From: Marek Vasut <marex@nabladev.com>
To: linux-usb@vger.kernel.org
Cc: fabrice.gasnier@foss.st.com,
	Marek Vasut <marex@nabladev.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	devicetree@vger.kernel.org,
	kernel@dh-electronics.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: [PATCH 3/4] arm64: dts: st: Add UCPD node on stm32mp231
Date: Wed, 19 Aug 2026 18:33:54 +0200
Message-ID: <20260819163410.119755-3-marex@nabladev.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260819163410.119755-1-marex@nabladev.com>
References: <20260819163410.119755-1-marex@nabladev.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

Add ST UCPD Type-C block node on stm32mp231. The UCPD integrates the
physical layer of the Power Delivery (PD), with CC signaling method,
for operation with Type-C cables. Vbus and Vconn control is performed
using an external chip, usually ST TCPP01/TCPP02/TCPP03 or similar.
The UCPD Rp/Rd resistor trimming values are part of OTP, add the nvmem
subnode and include a phandle to it.

Signed-off-by: Marek Vasut <marex@nabladev.com>
---
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
Cc: Rob Herring <robh@kernel.org>
Cc: Sebastian Reichel <sebastian.reichel@collabora.com>
Cc: devicetree@vger.kernel.org
Cc: kernel@dh-electronics.com
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-stm32@st-md-mailman.stormreply.com
Cc: linux-usb@vger.kernel.org
---
 arch/arm64/boot/dts/st/stm32mp231.dtsi | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/arch/arm64/boot/dts/st/stm32mp231.dtsi b/arch/arm64/boot/dts/st/stm32mp231.dtsi
index 9e1d240888ff2..5049e031a38dd 100644
--- a/arch/arm64/boot/dts/st/stm32mp231.dtsi
+++ b/arch/arm64/boot/dts/st/stm32mp231.dtsi
@@ -715,6 +715,21 @@ dcmipp: dcmipp@48030000 {
 				status = "disabled";
 			};
 
+			ucpd: phy@480a0000 {
+				compatible = "st,stm32mp25-ucpd";
+				reg = <0x480a0000 0x1000>;
+				access-controllers = <&rifsc 69>;
+				clocks = <&rcc CK_BUS_USBTC>, <&rcc CK_KER_USBTC>;
+				clock-names = "apb", "ker";
+				interrupts-extended = <&exti1 46 IRQ_TYPE_LEVEL_HIGH>;
+				nvmem-cells = <&ucpdtrim>;
+				nvmem-cell-names = "trim";
+				power-domains = <&cluster_pd>;
+				resets = <&rcc USBTC_R>;
+				reset-names = "phy";
+				status = "disabled";
+			};
+
 			sdmmc1: mmc@48220000 {
 				compatible = "st,stm32mp25-sdmmc2", "arm,pl18x", "arm,primecell";
 				reg = <0x48220000 0x400>, <0x44230400 0x8>;
@@ -794,6 +809,11 @@ package-otp@1e8 {
 				reg = <0x1e8 0x1>;
 				bits = <0 3>;
 			};
+
+			ucpdtrim: atrim3@1e8 {
+				reg = <0x1e8 0x4>;
+				bits = <4 16>;
+			};
 		};
 
 		rcc: clock-controller@44200000 {
-- 
2.53.0


Received: from mx.nabladev.com (mx.nabladev.com [178.251.229.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D548D47FAED;
	Wed, 19 Aug 2026 16:34:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.251.229.89
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787157284; cv=none; b=lqnBorzfqatBFPSkhsxEwVZR5voalJaBkWkAu7qLH39xC8iEGVrCDslRbr65PDlwebSj6p+KjMS06Ixv6DRSLw6WMChNmlabwIG/w10ba46EG9ZZ8Kchiia0PiqAfLtYe0EtO7LwQj6bVlPp4+nPZNOua9p8IwT4jLG4v9b/5PQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787157284; c=relaxed/simple;
	bh=TmvdMLryYLdnptmx1yUmavTEm5txwMELEuP5IH8p8FE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZFocycpXlXN7NvmeAllmqy/EHr5TcIw3afWCAU5M9rCJ/b/RhmQgMHIdXpzADDAbeBEz1lRVAGvqsO8cBNuRMThguHorba5mKT53Im99dXDl9iOBlbE/Qw6wVLfJf3h8XLjLRWVgTLZboS94hirD5a8fvBcrFUHXg4fX8we9Gkw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com; spf=pass smtp.mailfrom=nabladev.com; dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.b=W3ncaqib; arc=none smtp.client-ip=178.251.229.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nabladev.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.b="W3ncaqib"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 05C9D11C4EB;
	Wed, 19 Aug 2026 18:34:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1787157276; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=2y/9nZpIAjwa+OHOLCYwxGsZMISNNbT4G7AtheLzxnk=;
	b=W3ncaqib41nqs0ZHcdm/l/+Aj5TujekXRoVxpuNZLDFQW6I9UDBZ5UilFtF/Fb+ePvGpNf
	9bheD/2axaxdduqPeJfxX0BjHkx/ndgzR5ZVQeqVhO1Q0ag7nqV6w+CSk81Yuk9meQWsTo
	hDCHhcU/Cw6fUk1DokV726lpcxPzgGUGzcE9ydMuuxlkLs1dbs2c3e2KlPOQHGtpdqdi/c
	XqXzR2DuVBDKUk2DkzV6OjnuGM8ArAisgWUeuqGcaoGOJXPFpYGfSqfaq6IDYuBKYcqNjR
	fTjeEc3/5bEuLccvGJcM2zKmv2cSCvA6WxbJp2nVRYWsAZJ2iDfe3FNfF7J5Wg==
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
Subject: [PATCH 4/4] arm64: dts: st: Add UCPD node on stm32mp251
Date: Wed, 19 Aug 2026 18:33:55 +0200
Message-ID: <20260819163410.119755-4-marex@nabladev.com>
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

Add ST UCPD Type-C block node on stm32mp251. The UCPD integrates the
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
 arch/arm64/boot/dts/st/stm32mp251.dtsi | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/arch/arm64/boot/dts/st/stm32mp251.dtsi b/arch/arm64/boot/dts/st/stm32mp251.dtsi
index 9c63fdb5a885a..0d4ce4d7e124a 100644
--- a/arch/arm64/boot/dts/st/stm32mp251.dtsi
+++ b/arch/arm64/boot/dts/st/stm32mp251.dtsi
@@ -1637,6 +1637,21 @@ dcmipp: dcmipp@48030000 {
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
+				power-domains = <&CLUSTER_PD>;
+				resets = <&rcc USBTC_R>;
+				reset-names = "phy";
+				status = "disabled";
+			};
+
 			combophy: phy@480c0000 {
 				compatible = "st,stm32mp25-combophy";
 				reg = <0x480c0000 0x1000>;
@@ -1781,6 +1796,11 @@ package-otp@1e8 {
 				reg = <0x1e8 0x1>;
 				bits = <0 3>;
 			};
+
+			ucpdtrim: atrim3@1e8 {
+				reg = <0x1e8 0x4>;
+				bits = <4 16>;
+			};
 		};
 
 		hdp: pinctrl@44090000 {
-- 
2.53.0


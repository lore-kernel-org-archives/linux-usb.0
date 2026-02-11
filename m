Received: from mx-relay24-hz1.antispameurope.com (mx-relay24-hz1.antispameurope.com [94.100.132.224])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A522C32BF42
	for <linux-usb@vger.kernel.org>; Wed, 11 Feb 2026 12:43:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=94.100.132.224
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770813786; cv=pass; b=Dg9UiEFhrsh2UvwMlGcDb4dcFVrigCTnVWIljFy4CHH6I8hbC9pHWDtmDaQZfbRFqzTFOx1ksliZhjFsTeHhhfs5NsjnSC8m+UtnCZuk/qbVxqL01fjevaJ2Oe4nen7J6eVOeQaipmYnE2CUTTxKi0RyNIFk5p+ChrHIbbTB6Kg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770813786; c=relaxed/simple;
	bh=mYfcH9xWbwIpe8Jl7XbgaXGWWaW7rRpZQJHPj+tY8U0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ckNtIcRg4AMVjlT0Ra6xqctVJ2iILtx5S0UQQtnfobLMYME0TO4xR70IrGpLin/1O15dHgBY0RtXlsFl9+et6Y9BBE0NmoxzEUu1dygDWoRF5aJzo+2Lvn8tRpZpb2ti+wRHH7bMb135B676L3mehKGADl9U5DKldeqE03RzhWM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=FltoPe1c; arc=pass smtp.client-ip=94.100.132.224
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="FltoPe1c"
ARC-Authentication-Results: i=1; mx-gate24-hz1.hornetsecurity.com 1; spf=pass
 reason=mailfrom (ip=94.100.132.6, headerfrom=ew.tq-group.com)
 smtp.mailfrom=ew.tq-group.com
 smtp.helo=hmail-p-smtp01-out04-hz1.hornetsecurity.com; dmarc=pass
 header.from=ew.tq-group.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=6py1FlyDVN3cYWCSXt10KIIllpLulnoSlCJdgJBjOeY=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version:; i=1; s=hse1;
 t=1770813747;
 b=KzOkNw1OcsQXKn92zve2GHVwAhbxighAxCx+kXWXS0y98Yhs2cR8ntd+yFuxsaI3cnP/x21h
 w+vseJ+Du0FBlHybNOavh8Gqo+uYaowfu4LOES5BqNUjzNLr9Pabn67I+MWRxfqFU1lTYtvORGZ
 hBoxYbmUyZJgw1+IHRjPTlNV8gh52AF0xldxt7HtFasKkqZTggIq9xWS5yJXI9c6FjUJ96dC3Nx
 2wjPkYenL8JffSA1Myuh2ShoUvwyZcoq8/qANlNRZGWalVM56pY8M686V54Q0G5ypeyAfF1fDG8
 /VR1l2wDmTtaF/o6JUFjP9iynQIZOyVrpWcVCh5ov3m+Q==
ARC-Seal: a=rsa-sha256; cv=none; d=hornetsecurity.com; i=1; s=hse1;
 t=1770813747;
 b=lcPaJcugYqUtUmXFT0QAbmxhbq9r8uTHvb7Xy1xQ02bF7a8ua0KkGBSZfN2LSOlxfu1V1zea
 tR9J4QBhyTRivKODQAeBaKTrQz/aGLtN15lew6BNHkKuAJiEwlYuZ+orKJLC4zlKD+8FhDiXI4w
 Zs6FADWqYylys/MH83nnoLgHEcCTatIwWu10kFn98cgHy2DQJ8CLPyHUOI8UH3HVZrheiZPpa8A
 oGDCkonU44T7L8PPcWtFMNqx79Y93ggbrGpnCTUC71TXcuwTTPj968EZAy/PAhNLQWPbXCp6XL9
 PJOfLbjFznTrTPfre+bhCegs1KIO6gJkj7nn6LpB30EvQ==
Received: from he-nlb01-hz1.hornetsecurity.com ([94.100.132.6]) by mx-relay24-hz1.antispameurope.com;
 Wed, 11 Feb 2026 13:42:27 +0100
Received: from steina-w.tq-net.de (host-82-135-125-110.customer.m-online.net [82.135.125.110])
	(Authenticated sender: alexander.stein@ew.tq-group.com)
	by hmail-p-smtp01-out04-hz1.hornetsecurity.com (Postfix) with ESMTPSA id 940A1220535;
	Wed, 11 Feb 2026 13:41:56 +0100 (CET)
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
Subject: [PATCH v2 5/5] arm64: dts: imx8qm-tqma8qm-mba8x: Disable Cortex-A72 cluster
Date: Wed, 11 Feb 2026 13:41:53 +0100
Message-ID: <20260211124154.1080135-1-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260211123436.1077513-1-alexander.stein@ew.tq-group.com>
References: <20260211123436.1077513-1-alexander.stein@ew.tq-group.com>
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
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-relay24-hz1.antispameurope.com with 4f9yjx5Qnhz2ff2J
X-cloud-security-connect: he-nlb01-hz1.hornetsecurity.com[94.100.132.6], TLS=1, IP=94.100.132.6
X-cloud-security-Digest:ebb129c93538d71a139afec21e2b08e4
X-cloud-security:scantime:1.798
DKIM-Signature: a=rsa-sha256;
 bh=6py1FlyDVN3cYWCSXt10KIIllpLulnoSlCJdgJBjOeY=; c=relaxed/relaxed;
 d=ew.tq-group.com;
 h=content-type:mime-version:subject:from:to:message-id:date; s=hse1;
 t=1770813747; v=1;
 b=FltoPe1c6d+dxNiYpqblEOz+SVSc2/B6oUd1u7jgTJAwqegnMrUo3CM4Fa/UNM99S5CeUTbn
 Uhn9bK/fD2+6ed+h7w9KnuO3f15rGnOPBAs/bBffT57Hh7QGPwj2icyvn5Sd4WjkQrxCSZLguJA
 pWtLK1wSh0VagoXc0lHft6x8TFMsAOZ1uu06axNupdpUOk8RJF9+JRkcwOrjUZkY8FvMazM7tF4
 CzVxUgpqs6rBEzD17HiwAmQRl16f3IG1QOjyNJTG1MZGZJ8V0mSwGXt29aASIKYDbcF3KMNS7Tc
 5jI/iC0A5UlvYDKb2oEqNL/KpKh7MCTZnMBF0B7pXVBqQ==

Due to missing workaround for "ERR050104: Arm/A53: Cache coherency issue"
disable the whole Cortex-A72 cluster.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
Changes in v2:
* None

 .../dts/freescale/imx8qm-tqma8qm-mba8x.dts    | 39 -------------------
 .../boot/dts/freescale/imx8qm-tqma8qm.dtsi    | 13 +++++--
 2 files changed, 10 insertions(+), 42 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8qm-tqma8qm-mba8x.dts b/arch/arm64/boot/dts/freescale/imx8qm-tqma8qm-mba8x.dts
index ce5a4657c4230..25274cc76fc56 100644
--- a/arch/arm64/boot/dts/freescale/imx8qm-tqma8qm-mba8x.dts
+++ b/arch/arm64/boot/dts/freescale/imx8qm-tqma8qm-mba8x.dts
@@ -297,45 +297,6 @@ map3 {
 				};
 			};
 		};
-
-		cpu1-thermal {
-			trips {
-				soc_active1_0: trip-active0 {
-					temperature = <40000>;
-					hysteresis = <5000>;
-					type = "active";
-				};
-
-				soc_active1_1: trip-active1 {
-					temperature = <48000>;
-					hysteresis = <3000>;
-					type = "active";
-				};
-
-				soc_active1_2: trip-active2 {
-					temperature = <60000>;
-					hysteresis = <10000>;
-					type = "active";
-				};
-			};
-
-			cooling-maps {
-				map1 {
-					trip = <&soc_active1_0>;
-					cooling-device = <&fan0 1 1>;
-				};
-
-				map2 {
-					trip = <&soc_active1_1>;
-					cooling-device = <&fan0 2 2>;
-				};
-
-				map3 {
-					trip = <&soc_active1_2>;
-					cooling-device = <&fan0 3 3>;
-				};
-			};
-		};
 	};
 };
 
diff --git a/arch/arm64/boot/dts/freescale/imx8qm-tqma8qm.dtsi b/arch/arm64/boot/dts/freescale/imx8qm-tqma8qm.dtsi
index d94605c999915..f0e398eb2aad7 100644
--- a/arch/arm64/boot/dts/freescale/imx8qm-tqma8qm.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8qm-tqma8qm.dtsi
@@ -15,6 +15,13 @@ / {
 	model = "TQ-Systems i.MX8QM TQMa8QM";
 	compatible = "tq,imx8qm-tqma8qm", "fsl,imx8qm";
 
+	/* Due to missing workaround for ERR050104 */
+	cpus {
+		/delete-node/ cpu-map;
+		/delete-node/ cpu@100;
+		/delete-node/ cpu@101;
+	};
+
 	memory@80000000 {
 		device_type = "memory";
 		/*
@@ -174,6 +181,8 @@ &mu2_m0 {
 };
 
 &thermal_zones {
+	/delete-node/ cpu1-thermal;
+
 	pmic0-thermal {
 		polling-delay-passive = <250>;
 		polling-delay = <2000>;
@@ -199,9 +208,7 @@ map0 {
 					<&A53_0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
 					<&A53_1 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
 					<&A53_2 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
-					<&A53_3 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
-					<&A72_0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
-					<&A72_1 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+					<&A53_3 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
 			};
 		};
 	};
-- 
2.43.0


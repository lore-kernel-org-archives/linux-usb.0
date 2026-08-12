Received: from mx.nabladev.com (mx.nabladev.com [178.251.229.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E75A1367B7E;
	Wed, 12 Aug 2026 01:03:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.251.229.89
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786496589; cv=none; b=ZqGWDhMtadpi9B8G6ACIs1ahf627oqhZXu0Odw7UYaYnGg+slR/5xsp4r91ml75U4AudovAWBXDutkkEoYOVFTWzXjWzONqk48LbKJeUwd1MDraVfoyPrjxg6LDW1mPLX/JuByA324UQCImtjp4s9ECORupVYGGBZECHdK36Wcc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786496589; c=relaxed/simple;
	bh=7yzkGwL2gdDR6IKMwmYcqBooNA2e1XLP1k+P/UnCGuQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XY8ULlRnSYBhvvsA79OlFoX5Qg04YRSFi3FejIBq4mEDuP7EdbBpCr+TDJxf6t1LPwKu8eYgXbne8diJJ1Uvm0jzov/VllNbVpNsSBsilZsu8MeTQ0PV0tiQFBFKeETSATlTjA7pI0TbQJzu7jjHxEYq1YmSkq0FWaKa5a5H9bw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com; spf=pass smtp.mailfrom=nabladev.com; dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.b=EkiQRK8y; arc=none smtp.client-ip=178.251.229.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nabladev.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.b="EkiQRK8y"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B6A4E11A115;
	Wed, 12 Aug 2026 03:03:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1786496582; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=ywWWWh73l0reUvhOnhGGy+QdpwP9Hf4VXVSThCJFhTo=;
	b=EkiQRK8yAz6As9vZYN6HkQYoFjvtv2usk2GyCnAjbzXOyN9Z4yDxdNE47KYggff0pwyrFs
	WW51HoHHO9iBbTX9P1OKoikQxH2Y/ANDGRQCsBF/LUUGd3rF6w7xfgTAA+xkAH0/VLjlcx
	4ZToXdZUjog66gYykrOkH37CZfgHLM8B+Hn97qCKNNwTmxHCyGlQ2htko36b/5JGO2eZ0j
	34pRKp1xe24fPtUiW14kRmLkuqbG+t1QxOSafu4DM4wHD79b8zJ+KO7ksvUZnM7ePE+v/V
	9SIK2RrEvcmKWqCoXe2iiEWgJxYCMp3YBAX7309FzO9HRqprOFk+xPEwFhbX6Q==
From: Marek Vasut <marex@nabladev.com>
To: linux-usb@vger.kernel.org
Cc: Marek Vasut <marex@nabladev.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Christian Bruel <christian.bruel@foss.st.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabrice Gasnier <fabrice.gasnier@foss.st.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Pankaj Dev <pankaj.dev@st.com>,
	Rahul Kumar <rahul.kumar05@st.com>,
	Rob Herring <robh@kernel.org>,
	Rosen Penev <rosenp@gmail.com>,
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
	Vinod Koul <vkoul@kernel.org>,
	devicetree@vger.kernel.org,
	kernel@dh-electronics.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: [PATCH 6/8] usb: dwc3: dwc3-generic-plat: Add ST STM32MP2 DWC3 xHCI USB controller glue
Date: Wed, 12 Aug 2026 02:55:46 +0200
Message-ID: <20260812010157.1772849-7-marex@nabladev.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260812010157.1772849-1-marex@nabladev.com>
References: <20260812010157.1772849-1-marex@nabladev.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

The ST STM32MP2 SoC contains one instance of DWC3 USB controller with
glue logic wrapper around it controlled by syscon. Extend the generic
DWC3 platform driver with ST STM32MP2 glue logic specifics.

Signed-off-by: Marek Vasut <marex@nabladev.com>
---
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: Christian Bruel <christian.bruel@foss.st.com>
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Pankaj Dev <pankaj.dev@st.com>
Cc: Rahul Kumar <rahul.kumar05@st.com>
Cc: Rob Herring <robh@kernel.org>
Cc: Rosen Penev <rosenp@gmail.com>
Cc: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc: Vinod Koul <vkoul@kernel.org>
Cc: devicetree@vger.kernel.org
Cc: kernel@dh-electronics.com
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-phy@lists.infradead.org
Cc: linux-stm32@st-md-mailman.stormreply.com
Cc: linux-usb@vger.kernel.org
---
 drivers/usb/dwc3/dwc3-generic-plat.c | 44 ++++++++++++++++++++++++++++
 1 file changed, 44 insertions(+)

diff --git a/drivers/usb/dwc3/dwc3-generic-plat.c b/drivers/usb/dwc3/dwc3-generic-plat.c
index ca69ac0eb07ce..0946ed61647b6 100644
--- a/drivers/usb/dwc3/dwc3-generic-plat.c
+++ b/drivers/usb/dwc3/dwc3-generic-plat.c
@@ -22,6 +22,12 @@
 #define EIC7700_HSP_AXI_LP_XM_CSYSREQ	BIT(0)
 #define EIC7700_HSP_AXI_LP_XS_CSYSREQ	BIT(16)
 
+#define STM32MP2_USB3DRCR_HOST_PORT_POWER_CONTROL_PRESENT	BIT(0)
+#define STM32MP2_USB3DRCR_OVRCUR_POLARITY			BIT(1)
+#define STM32MP2_USB3DRCR_VBUSEN_POLARITY			BIT(2)
+#define STM32MP2_USB3DRCR_USB2ONLYH				BIT(3)
+#define STM32MP2_USB3DRCR_USB2ONLYD				BIT(4)
+
 struct dwc3_generic {
 	struct device		*dev;
 	struct dwc3		dwc;
@@ -85,6 +91,38 @@ static int dwc3_spacemit_k1_init(struct dwc3_generic *dwc3g)
 	return 0;
 }
 
+static int dwc3_stm32mp25_init(struct dwc3_generic *dwc3g)
+{
+	struct device *dev = dwc3g->dev;
+	bool ovrcur_polarity_low = device_property_read_bool(dev, "st,ovrcur-active-low");
+	bool prt_pwr_ctrl = device_property_read_bool(dev, "st,enable-port-power-control");
+	bool usb2only_conf = device_property_match_string(dev, "phy-names", "usb3-phy") < 0;
+	bool vbusen_polarity_low = device_property_read_bool(dev, "st,vbusen-active-low");
+	struct regmap *regmap;
+	u32 drcr;
+
+	regmap = syscon_regmap_lookup_by_phandle_args(dev->of_node, "st,syscfg", 1, &drcr);
+	if (IS_ERR(regmap))
+		return dev_err_probe(dev, PTR_ERR(regmap), "No st,syscfg phandle specified\n");
+
+	return regmap_update_bits(regmap, drcr,
+				  STM32MP2_USB3DRCR_HOST_PORT_POWER_CONTROL_PRESENT |
+				  STM32MP2_USB3DRCR_OVRCUR_POLARITY |
+				  STM32MP2_USB3DRCR_VBUSEN_POLARITY |
+				  STM32MP2_USB3DRCR_USB2ONLYD |
+				  STM32MP2_USB3DRCR_USB2ONLYH,
+				  FIELD_PREP(STM32MP2_USB3DRCR_HOST_PORT_POWER_CONTROL_PRESENT,
+					     prt_pwr_ctrl) |
+				  FIELD_PREP(STM32MP2_USB3DRCR_OVRCUR_POLARITY,
+					     ovrcur_polarity_low) |
+				  FIELD_PREP(STM32MP2_USB3DRCR_VBUSEN_POLARITY,
+					     vbusen_polarity_low) |
+				  FIELD_PREP(STM32MP2_USB3DRCR_USB2ONLYD,
+					     !!usb2only_conf) |
+				  FIELD_PREP(STM32MP2_USB3DRCR_USB2ONLYH,
+					     !!usb2only_conf));
+}
+
 static int dwc3_generic_probe(struct platform_device *pdev)
 {
 	const struct dwc3_generic_config *plat_config;
@@ -231,12 +269,18 @@ static const struct dwc3_generic_config eic7700_dwc3 =  {
 	.properties = DWC3_DEFAULT_PROPERTIES,
 };
 
+static const struct dwc3_generic_config stm32mp25_dwc3 =  {
+	.init = dwc3_stm32mp25_init,
+	.properties = DWC3_DEFAULT_PROPERTIES,
+};
+
 static const struct of_device_id dwc3_generic_of_match[] = {
 	{ .compatible = "spacemit,k1-dwc3", &spacemit_k1_dwc3},
 	{ .compatible = "spacemit,k3-dwc3", },
 	{ .compatible = "fsl,ls1028a-dwc3", &fsl_ls1028_dwc3},
 	{ .compatible = "eswin,eic7700-dwc3", &eic7700_dwc3},
 	{ .compatible = "starfive,jhb100-dwc3", },
+	{ .compatible = "st,stm32mp25-dwc3", &stm32mp25_dwc3 },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, dwc3_generic_of_match);
-- 
2.53.0


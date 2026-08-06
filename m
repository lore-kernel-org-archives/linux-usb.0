Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 975C43876A7;
	Thu,  6 Aug 2026 05:04:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785992678; cv=none; b=PqsyTkzGz01oxSWhbyNxz65nZ3Fxy38k9DMtbTNljLbuTdyWhE9t7hiYmJvgkZPAtqtLroO0DlGV7ywCDE6OcI5E9se0dzuV4pqkylyi4nXQu4u38NRSXmeRebMQp8csCiinKvVJqQGscY5pdzOkywwCJr/BhvoFxE13vBgdGWg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785992678; c=relaxed/simple;
	bh=ZlRtWwSiWeTzc8dy1cc7138SA92tWRevsVfqE9UAQ8g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uuZ3Pmapey0DWyZios21HWYefrFUR0DUjiVT7wfuF4BMIpCVydK03dnbmmH7iMA/hO4HrcqYKd13Hgeu+LkWpx8HLd22H+C8Vi+ehdfdWPRo80fRi/jAlkbffNGNU/CqYK3lfeDN3q7Yx76ejnjwPJCIXWA8DuTqbhPqWD/veKI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=xaWYeufG; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=RAXkQDZG; arc=none smtp.client-ip=80.241.56.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="xaWYeufG";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="RAXkQDZG"
Received: from smtp102.mailbox.org (smtp102.mailbox.org [10.196.197.102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4hFwDy02RtzMlKH;
	Thu, 06 Aug 2026 07:04:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1785992674;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=X8TDEET2Zk3KpA/Nyefnm7Snzq8lcliKm3gLsr1GrFw=;
	b=xaWYeufGXYE9aPu4s5HJiS3kWXk2keVENayU7+2XpAhAs22U1l7/iB8zWXns5I/5O8n3Kg
	Vn3PHfoJxG4BUhqPDEmN/F67gkOc+OvbHRV1eDYplYAPK3bEBL5oGPeJ3ROR3ddLDNOhvQ
	usgoqSNU4m+YJ7XLFm9c4ZuQvFWAfRcXrZO4rML15wqq52oDM5VlkqrQGmuS6AIBfwirg2
	3X2SrVs/FYpQNHwT9B4qy6PBJ7hJWACzUtVdzAwEU8cWUFbOIH2oXJSaPBKo7foW4wbTX/
	fhSjisBgioTSaEZCerNPT0Cv8D/np4DzI2snjKPSOSruclwSk277hEV/K383Gw==
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1785992672;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=X8TDEET2Zk3KpA/Nyefnm7Snzq8lcliKm3gLsr1GrFw=;
	b=RAXkQDZGDL0TdwwCiTCIIsvv8OGnP1c1IKtNaytrDQN4fihMjhwrpxTpnKMHYDFJOjxt0x
	ReFN/lDxoXpe77YUYbk9BZZfN5J0almT9oC4yp6GZ7Tot1YEF2utOrcgHpyr8XKo/aMOJ7
	7oOrbzIYaPRIMLP1GkdLZVgB6Tr/xJeMN3gXt8jtGnP8QeS/YNOgK7plwnYRGM7gdzsFt0
	0lYUpyw/CaIcip54EvAxgdFjB01FO811zMYIOdZJ70vQvCo95eWcrYF3/bVkNytTljhumJ
	6iGOc/aeoQuuSX1niyaCeBEtx8TiwgS+m3I8+pEfnz0RATI23tf3eWItaC7XmQ==
To: linux-usb@vger.kernel.org
Cc: Thanh Quan <thanh.quan.xn@renesas.com>,
	Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH v2 2/2] usb: dwc3: dwc3-generic-plat: Add Renesas R-Car Gen5 DWC3 xHCI USB controller glue
Date: Thu,  6 Aug 2026 07:03:25 +0200
Message-ID: <20260806050422.324435-2-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260806050422.324435-1-marek.vasut+renesas@mailbox.org>
References: <20260806050422.324435-1-marek.vasut+renesas@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: df215bace2f44bd5069
X-MBO-RS-META: q8yi4g4amt8kutoatn37kdbb7uk1g69u

From: Thanh Quan <thanh.quan.xn@renesas.com>

The Renesas R-Car Gen5 SoC contains multiple instances of DWC3 USB
controller with glue logic wrapper around them. Extend the generic
DWC3 platform driver with Renesas R-Car Gen5 glue logic specifics.

Signed-off-by: Thanh Quan <thanh.quan.xn@renesas.com>
Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
---
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Rob Herring <robh@kernel.org>
Cc: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org
Cc: linux-usb@vger.kernel.org
---
V2: Extend dwc3-generic-plat driver instead
---
 drivers/usb/dwc3/dwc3-generic-plat.c | 52 ++++++++++++++++++++++++++++
 1 file changed, 52 insertions(+)

diff --git a/drivers/usb/dwc3/dwc3-generic-plat.c b/drivers/usb/dwc3/dwc3-generic-plat.c
index ca69ac0eb07ce..518bb40d1372c 100644
--- a/drivers/usb/dwc3/dwc3-generic-plat.c
+++ b/drivers/usb/dwc3/dwc3-generic-plat.c
@@ -71,6 +71,52 @@ static int dwc3_eic7700_init(struct dwc3_generic *dwc3g)
 	return 0;
 }
 
+static int dwc3_renesas_rcar_gen5_init(struct dwc3_generic *dwc3g)
+{
+	struct device *dev = dwc3g->dev;
+	struct platform_device *pdev = to_platform_device(dev);
+	const char *maximum_speed;
+	bool use_usb3_flow;
+	void __iomem *glue;
+	int ret;
+
+	glue = devm_platform_ioremap_resource_byname(pdev, "glue");
+	if (IS_ERR(glue))
+		return PTR_ERR(glue);
+
+	ret = of_property_read_string(dev->of_node, "maximum-speed", &maximum_speed);
+	if (ret)
+		return dev_err_probe(dev, -ENODEV, "Failed to determine maximum speed\n");
+
+	use_usb3_flow = !strcmp(maximum_speed, "super-speed-plus") ||
+			!strcmp(maximum_speed, "super-speed");
+
+	/*
+	 * The datasheet describes initialization procedure without full
+	 * information about the registers. Therefore, the source code is
+	 * based on the bare metal code shared by the board team.
+	 */
+	writew(0x211, glue + 0x26);
+
+	/* USB3 does not need additional register programming. */
+	if (use_usb3_flow)
+		return 0;
+
+	writew(0x11, glue + 0x81c);
+	writew(0x0, glue + 0x81a);
+	writew(0x1, glue + 0x802);
+
+	usleep_range(10000, 20000);
+
+	writew(0x0, glue + 0x802);
+	writew(0x1, glue + 0x2a);
+	writew(0x1, glue + 0x81a);
+
+	usleep_range(10000, 20000);
+
+	return 0;
+}
+
 static int dwc3_spacemit_k1_init(struct dwc3_generic *dwc3g)
 {
 	struct device *dev = dwc3g->dev;
@@ -231,11 +277,17 @@ static const struct dwc3_generic_config eic7700_dwc3 =  {
 	.properties = DWC3_DEFAULT_PROPERTIES,
 };
 
+static const struct dwc3_generic_config renesas_rcar_gen5_dwc3 = {
+	.init = dwc3_renesas_rcar_gen5_init,
+	.properties = DWC3_DEFAULT_PROPERTIES,
+};
+
 static const struct of_device_id dwc3_generic_of_match[] = {
 	{ .compatible = "spacemit,k1-dwc3", &spacemit_k1_dwc3},
 	{ .compatible = "spacemit,k3-dwc3", },
 	{ .compatible = "fsl,ls1028a-dwc3", &fsl_ls1028_dwc3},
 	{ .compatible = "eswin,eic7700-dwc3", &eic7700_dwc3},
+	{ .compatible = "renesas,rcar-gen5-dwc3", &renesas_rcar_gen5_dwc3},
 	{ .compatible = "starfive,jhb100-dwc3", },
 	{ /* sentinel */ }
 };
-- 
2.53.0


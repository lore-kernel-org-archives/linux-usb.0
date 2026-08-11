Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D45127E076;
	Tue, 11 Aug 2026 05:10:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786425034; cv=none; b=Y8dMMqeex4Gq3t/uAPxSyImVSykDVWe5VsBerjgbItMdLCElxkSql7SICUJkypIBMk78hqk7jgHXYwpVyq928R5r1e8hJdyozJ/67hkWSp0fLpHs3ZB7J14sEp3IbkQ62LnUflN7/o1sLXmrxbMkjbeWo+U7ltpMRzA1VLRfRXg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786425034; c=relaxed/simple;
	bh=Cya/lZhccKQZJKCT1jTL6ir0ShYdrfKIC3FG9C33928=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CAIHH3NwPjttuRO40CQS1KoXYhQwp6dbJ5XzHYKmitc4fSzhpmgBI4yuxL6Q/BqYDGYEfOTWbUgXupXgR4OqxKVjyQwsnbHjT5dOHTOYSss6zel+3lkNlAwRcJnTAc2usxmmzJNvnEwXM3SKAXYWRsxrQq0XNAcCcjJ1kCleJW0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=qJhyr26m; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=dqWjCoQG; arc=none smtp.client-ip=80.241.56.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="qJhyr26m";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="dqWjCoQG"
Received: from smtp202.mailbox.org (smtp202.mailbox.org [IPv6:2001:67c:2050:b231:465::202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4hK07T41rnzMlGk;
	Tue, 11 Aug 2026 07:10:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1786425029;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fzDWe1lBWxk2GBdnkDkRX6pu9sNXcJ33YCkvBXfrvTY=;
	b=qJhyr26mqDR3KHqEWGhmhyqw11VxOyawzO87X5mWbvpsF3ObUFU+64Pb/tZ0HhX52q9urB
	B2FW6cmXq3TI57q1WsG7vhXRpR8mT3kSCz0wUDez/5K/4+13Jqt46plVpAnOzjgF/IKQ4V
	+p07Oqy2N5M8xmrQ1v5FPq819XkiEVJhkKKQFPEyQWYhFgOJ34t/lZ5sI8kUH/95pgU2hU
	WOrzgk21lt9yHLF9xjcPskwGrYLITeESQ4EMUIxNRe0A6/+pRTCPPFzH9wLa/IejPHMlkZ
	Ij2y6YCg3okep7MsCMF4poD84cSmrFOtX0c3HwAcEkt1OL/YaRYlFh1VUIa+uw==
Authentication-Results: outgoing_mbo_mout;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=dqWjCoQG;
	spf=pass (outgoing_mbo_mout: domain of marek.vasut+renesas@mailbox.org designates 2001:67c:2050:b231:465::202 as permitted sender) smtp.mailfrom=marek.vasut+renesas@mailbox.org
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1786425027;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fzDWe1lBWxk2GBdnkDkRX6pu9sNXcJ33YCkvBXfrvTY=;
	b=dqWjCoQGdoGYueyDxQc9NFA6SH730Xf9B9pYB/dlqe6YwKTPVFPQEpWWNkoIPTSp0M3XkJ
	d9HNAT0feeiMFWDXS59sPZ8N+jbMXcYlcXQnG3pgQuhq1dxjDuxoMVpzsxmJVJVn/aDSHo
	DeT0BywNeWf4HgKSjq3zz8a0oahobj5psN3f9TGdzkVACgJCeEqg2oDQXyZu2D9k130/ig
	R9ZeFE3Jf8WuyOt5Tb6PmB/PDpzT6lYfjiggp3c9NE9NnMBjxYFrWQHAZpg+Dkld1w1+gW
	qUVOmF1OqzAQclHJmb/+jmADESL/YrhOkFTPg5Je2MtzOz696fM9Wp6+enCuLw==
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
Subject: [PATCH v3 2/2] usb: dwc3: dwc3-generic-plat: Add Renesas R-Car Gen5 DWC3 xHCI USB controller glue
Date: Tue, 11 Aug 2026 07:09:34 +0200
Message-ID: <20260811051016.1655887-2-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260811051016.1655887-1-marek.vasut+renesas@mailbox.org>
References: <20260811051016.1655887-1-marek.vasut+renesas@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: etnbyp8z1xxu5kchj99ajjtou7zy4z8p
X-MBO-RS-ID: 7fc0db0bff76b7f4e5a
X-Rspamd-Queue-Id: 4hK07T41rnzMlGk

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
V3: Handle maximum-speed as optional property, test for USB 3 PHY
    non-presence to determine whether the controller is USB 2 only,
    consider optional maximum-speed DT property, but if it is missing
    then default to maximum controller capabilities based on the
    presence of PHY phandles.
---
 drivers/usb/dwc3/dwc3-generic-plat.c | 60 ++++++++++++++++++++++++++++
 1 file changed, 60 insertions(+)

diff --git a/drivers/usb/dwc3/dwc3-generic-plat.c b/drivers/usb/dwc3/dwc3-generic-plat.c
index ca69ac0eb07ce..dec89b068291a 100644
--- a/drivers/usb/dwc3/dwc3-generic-plat.c
+++ b/drivers/usb/dwc3/dwc3-generic-plat.c
@@ -71,6 +71,60 @@ static int dwc3_eic7700_init(struct dwc3_generic *dwc3g)
 	return 0;
 }
 
+static int dwc3_renesas_rcar_gen5_init(struct dwc3_generic *dwc3g)
+{
+	struct device *dev = dwc3g->dev;
+	struct platform_device *pdev = to_platform_device(dev);
+	enum usb_device_speed speed = usb_get_maximum_speed(dev);
+	bool usb2only = false;
+	void __iomem *glue;
+
+	/* Wireless USB is not supported */
+	if (speed == USB_SPEED_WIRELESS)
+		return dev_err_probe(dev, -EINVAL, "Wireless USB not supported\n");
+
+	/* No USB 3 PHY in DT means this is surely USB 2 controller */
+	if (device_property_match_string(dev, "phy-names", "usb3-phy") < 0)
+		usb2only = true;
+
+	/*
+	 * Controller can be limited to USB 2 via optional maximum-speed DT
+	 * property. If the DT property is not present, default to maximum
+	 * controller capabilities.
+	 */
+	if (speed >= USB_SPEED_LOW && speed <= USB_SPEED_HIGH)
+		usb2only = true;
+
+	glue = devm_platform_ioremap_resource_byname(pdev, "glue");
+	if (IS_ERR(glue))
+		return PTR_ERR(glue);
+
+	/*
+	 * The datasheet describes initialization procedure without full
+	 * information about the registers. Therefore, the source code is
+	 * based on the bare metal code shared by the board team.
+	 */
+	writew(0x211, glue + 0x26);
+
+	/* USB2 does need additional register programming. */
+	if (!usb2only)
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
@@ -231,11 +285,17 @@ static const struct dwc3_generic_config eic7700_dwc3 =  {
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


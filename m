Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6337E3CF671;
	Wed,  3 Jun 2026 15:17:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780499839; cv=none; b=daGyN1uopalfykXeCJhyblLtkLyKc0p4fhOxP4EyG74pKHpj2CygnS4F+Jk8Hg2RQ0iAhpvhyAvUbyilNM2Ty+LD4QfAh7/rHu6v2hmaIstsT0qsw/Te5wql8Vr3uwFyzTHEst5IuwdFAmHr98W+ESLYTJOKSIIn3xNL9wsKtEk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780499839; c=relaxed/simple;
	bh=Liu7S2+ZsFa6gRQW6s8JsVihpfcRfp9vJIp7HKHuC6Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IuQ7QGi/BaUAx0OP8ieLIV48NJ9uaH/cwPs6l/H28TyMw9Bjf2FSO4xqHbhNeQz8hoMcmetBsD7BlRUXY406Y9PTjzflrrJHMnte9nsEvtGSc0TAgTDOAXpoLSakypKJ3XuF+IKDmuXhNHCRbwTSIH+b584DCPml1YGp0IebZhI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C1AE01F00899;
	Wed,  3 Jun 2026 15:17:16 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Mathias Nyman <mathias.nyman@intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-usb@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 2/2] usb: host: xhci-rcar: Split R-Car Gen2 and Gen3 .plat_start() handling
Date: Wed,  3 Jun 2026 17:17:10 +0200
Message-ID: <d1ee4e1bb9106f8251b061b52948434d560b4675.1780499433.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1780499433.git.geert+renesas@glider.be>
References: <cover.1780499433.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Currently, R-Car Gen2 and Gen3 share the same .plat_start() callback.
However, this single callback performs different operations, after
checking the XHCI's controller compatible value.

Avoid repeated checking of compatible values and reduce kernel size by
splitting this method in two separate functions.  Update
xhci_rcar_resume_quirk() to dispatch to the correct method by calling it
through the .plat_start() function pointer, too.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/usb/host/xhci-rcar.c | 53 ++++++++++++++++--------------------
 1 file changed, 24 insertions(+), 29 deletions(-)

diff --git a/drivers/usb/host/xhci-rcar.c b/drivers/usb/host/xhci-rcar.c
index d2efc98090ce0053..d747c0905827661e 100644
--- a/drivers/usb/host/xhci-rcar.c
+++ b/drivers/usb/host/xhci-rcar.c
@@ -32,29 +32,6 @@
 MODULE_FIRMWARE(XHCI_RCAR_FIRMWARE_NAME_V1);
 MODULE_FIRMWARE(XHCI_RCAR_FIRMWARE_NAME_V3);
 
-static void xhci_rcar_start_gen2(struct usb_hcd *hcd)
-{
-	/* LCLK Select */
-	writel(RCAR_USB3_LCLK_ENA_VAL, hcd->regs + RCAR_USB3_LCLK);
-	/* USB3.0 Configuration */
-	writel(RCAR_USB3_CONF1_VAL, hcd->regs + RCAR_USB3_CONF1);
-	writel(RCAR_USB3_CONF2_VAL, hcd->regs + RCAR_USB3_CONF2);
-	writel(RCAR_USB3_CONF3_VAL, hcd->regs + RCAR_USB3_CONF3);
-	/* USB3.0 Polarity */
-	writel(RCAR_USB3_RX_POL_VAL, hcd->regs + RCAR_USB3_RX_POL);
-	writel(RCAR_USB3_TX_POL_VAL, hcd->regs + RCAR_USB3_TX_POL);
-}
-
-static int xhci_rcar_is_gen2(struct device *dev)
-{
-	struct device_node *node = dev->of_node;
-
-	return of_device_is_compatible(node, "renesas,xhci-r8a7790") ||
-		of_device_is_compatible(node, "renesas,xhci-r8a7791") ||
-		of_device_is_compatible(node, "renesas,xhci-r8a7793") ||
-		of_device_is_compatible(node, "renesas,rcar-gen2-xhci");
-}
-
 static void xhci_rcar_start(struct usb_hcd *hcd)
 {
 	u32 temp;
@@ -64,8 +41,23 @@ static void xhci_rcar_start(struct usb_hcd *hcd)
 		temp = readl(hcd->regs + RCAR_USB3_INT_ENA);
 		temp |= RCAR_USB3_INT_ENA_VAL;
 		writel(temp, hcd->regs + RCAR_USB3_INT_ENA);
-		if (xhci_rcar_is_gen2(hcd->self.controller))
-			xhci_rcar_start_gen2(hcd);
+	}
+}
+
+static void xhci_rcar_gen2_start(struct usb_hcd *hcd)
+{
+	if (hcd->regs != NULL) {
+		xhci_rcar_start(hcd);
+
+		/* LCLK Select */
+		writel(RCAR_USB3_LCLK_ENA_VAL, hcd->regs + RCAR_USB3_LCLK);
+		/* USB3.0 Configuration */
+		writel(RCAR_USB3_CONF1_VAL, hcd->regs + RCAR_USB3_CONF1);
+		writel(RCAR_USB3_CONF2_VAL, hcd->regs + RCAR_USB3_CONF2);
+		writel(RCAR_USB3_CONF3_VAL, hcd->regs + RCAR_USB3_CONF3);
+		/* USB3.0 Polarity */
+		writel(RCAR_USB3_RX_POL_VAL, hcd->regs + RCAR_USB3_RX_POL);
+		writel(RCAR_USB3_TX_POL_VAL, hcd->regs + RCAR_USB3_TX_POL);
 	}
 }
 
@@ -192,13 +184,16 @@ static int xhci_rcar_init_quirk(struct usb_hcd *hcd)
 
 static int xhci_rcar_resume_quirk(struct usb_hcd *hcd)
 {
+	struct xhci_plat_priv *priv;
 	int ret;
 
 	ret = xhci_rcar_download_firmware(hcd);
-	if (!ret)
-		xhci_rcar_start(hcd);
+	if (ret)
+		return ret;
 
-	return ret;
+	priv = hcd_to_xhci_priv(hcd);
+	priv->plat_start(hcd);
+	return 0;
 }
 
 /*
@@ -217,7 +212,7 @@ static const struct xhci_plat_priv xhci_plat_renesas_rcar_gen2 = {
 	.firmware_name = XHCI_RCAR_FIRMWARE_NAME_V1,
 	.quirks = XHCI_NO_64BIT_SUPPORT |  XHCI_SLOW_SUSPEND,
 	.init_quirk = xhci_rcar_init_quirk,
-	.plat_start = xhci_rcar_start,
+	.plat_start = xhci_rcar_gen2_start,
 	.resume_quirk = xhci_rcar_resume_quirk,
 };
 
-- 
2.43.0


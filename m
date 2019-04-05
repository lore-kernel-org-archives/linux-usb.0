Return-Path: <SRS0=hNA8=SH=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 499E6C4360F
	for <linux-usb@archiver.kernel.org>; Fri,  5 Apr 2019 13:36:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 0ED9E2186A
	for <linux-usb@archiver.kernel.org>; Fri,  5 Apr 2019 13:36:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=kalray.eu header.i=@kalray.eu header.b="FKzmcUYz"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730587AbfDENgD (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Fri, 5 Apr 2019 09:36:03 -0400
Received: from zimbra2.kalray.eu ([92.103.151.219]:44708 "EHLO
        zimbra2.kalray.eu" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730283AbfDENgC (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 5 Apr 2019 09:36:02 -0400
Received: from localhost (localhost [127.0.0.1])
        by zimbra2.kalray.eu (Postfix) with ESMTP id 0AC1227E0360;
        Fri,  5 Apr 2019 15:36:00 +0200 (CEST)
Received: from zimbra2.kalray.eu ([127.0.0.1])
        by localhost (zimbra2.kalray.eu [127.0.0.1]) (amavisd-new, port 10032)
        with ESMTP id JONSDoF5_j6N; Fri,  5 Apr 2019 15:35:58 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
        by zimbra2.kalray.eu (Postfix) with ESMTP id 1C16927E034B;
        Fri,  5 Apr 2019 15:35:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.10.3 zimbra2.kalray.eu 1C16927E034B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kalray.eu;
        s=32AE1B44-9502-11E5-BA35-3734643DEF29; t=1554471358;
        bh=oV9/igsCDs/+isfcngvOtjUIxUTg6sOFeUZ9imN1txA=;
        h=From:To:Date:Message-Id:MIME-Version;
        b=FKzmcUYzHYpF0c+GF0hdNfEjhfqtadfOAqTvYYIj0gpt9uUVyweWqlIZdkb7Ad6vX
         aNcf61YY1s8DwT/WhKGmLWW8t5lMcQRtfq6bCT+vl8cmK/0IT4FAFtcwHbZ9ITefkX
         41dhMnZIv7UWKb9D0c/aE41HAYSjTr+UXGKvH9Fo=
X-Virus-Scanned: amavisd-new at zimbra2.kalray.eu
Received: from zimbra2.kalray.eu ([127.0.0.1])
        by localhost (zimbra2.kalray.eu [127.0.0.1]) (amavisd-new, port 10026)
        with ESMTP id MrxEfeaCIkyh; Fri,  5 Apr 2019 15:35:57 +0200 (CEST)
Received: from tellis.lin.mbt.kalray.eu (unknown [192.168.36.206])
        by zimbra2.kalray.eu (Postfix) with ESMTPSA id D612027E034F;
        Fri,  5 Apr 2019 15:35:57 +0200 (CEST)
From:   Jules Maselbas <jmaselbas@kalray.eu>
To:     Minas Harutyunyan <hminas@synopsys.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Pierre-Yves Kerbrat <pkerbrat@kalray.eu>,
        linux-usb@vger.kernel.org, Jules Maselbas <jmaselbas@kalray.eu>
Subject: [PATCH v2 4/5] usb: dwc2: Move phy init into core
Date:   Fri,  5 Apr 2019 15:35:32 +0200
Message-Id: <20190405133533.2203-5-jmaselbas@kalray.eu>
X-Mailer: git-send-email 2.21.0.196.g041f5ea
In-Reply-To: <20190405133533.2203-1-jmaselbas@kalray.eu>
References: <20190405133533.2203-1-jmaselbas@kalray.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190405133532.itIpthzbATlOnWSL51ooYjE9MqVyCZq7wh4bA_19yJw@z>

As the phy initialization is almost the same in host and gadget
mode. This only move the phy initialization functions into core.c
for now, the goal is to share theses functions between the two modes.

Signed-off-by: Jules Maselbas <jmaselbas@kalray.eu>
---
 drivers/usb/dwc2/core.c | 190 ++++++++++++++++++++++++++++++++++++++++
 drivers/usb/dwc2/core.h |   2 +
 drivers/usb/dwc2/hcd.c  | 190 ----------------------------------------
 3 files changed, 192 insertions(+), 190 deletions(-)

diff --git a/drivers/usb/dwc2/core.c b/drivers/usb/dwc2/core.c
index 55d5ae2a7ec7..01ac4a064feb 100644
--- a/drivers/usb/dwc2/core.c
+++ b/drivers/usb/dwc2/core.c
@@ -1020,6 +1020,196 @@ int dwc2_hsotg_wait_bit_clear(struct dwc2_hsotg *=
hsotg, u32 offset, u32 mask,
 	return -ETIMEDOUT;
 }
=20
+/*
+ * Initializes the FSLSPClkSel field of the HCFG register depending on t=
he
+ * PHY type
+ */
+void dwc2_init_fs_ls_pclk_sel(struct dwc2_hsotg *hsotg)
+{
+	u32 hcfg, val;
+
+	if ((hsotg->hw_params.hs_phy_type =3D=3D GHWCFG2_HS_PHY_TYPE_ULPI &&
+	     hsotg->hw_params.fs_phy_type =3D=3D GHWCFG2_FS_PHY_TYPE_DEDICATED =
&&
+	     hsotg->params.ulpi_fs_ls) ||
+	    hsotg->params.phy_type =3D=3D DWC2_PHY_TYPE_PARAM_FS) {
+		/* Full speed PHY */
+		val =3D HCFG_FSLSPCLKSEL_48_MHZ;
+	} else {
+		/* High speed PHY running at full speed or high speed */
+		val =3D HCFG_FSLSPCLKSEL_30_60_MHZ;
+	}
+
+	dev_dbg(hsotg->dev, "Initializing HCFG.FSLSPClkSel to %08x\n", val);
+	hcfg =3D dwc2_readl(hsotg, HCFG);
+	hcfg &=3D ~HCFG_FSLSPCLKSEL_MASK;
+	hcfg |=3D val << HCFG_FSLSPCLKSEL_SHIFT;
+	dwc2_writel(hsotg, hcfg, HCFG);
+}
+
+static int dwc2_fs_phy_init(struct dwc2_hsotg *hsotg, bool select_phy)
+{
+	u32 usbcfg, ggpio, i2cctl;
+	int retval =3D 0;
+
+	/*
+	 * core_init() is now called on every switch so only call the
+	 * following for the first time through
+	 */
+	if (select_phy) {
+		dev_dbg(hsotg->dev, "FS PHY selected\n");
+
+		usbcfg =3D dwc2_readl(hsotg, GUSBCFG);
+		if (!(usbcfg & GUSBCFG_PHYSEL)) {
+			usbcfg |=3D GUSBCFG_PHYSEL;
+			dwc2_writel(hsotg, usbcfg, GUSBCFG);
+
+			/* Reset after a PHY select */
+			retval =3D dwc2_core_reset(hsotg, false);
+
+			if (retval) {
+				dev_err(hsotg->dev,
+					"%s: Reset failed, aborting", __func__);
+				return retval;
+			}
+		}
+
+		if (hsotg->params.activate_stm_fs_transceiver) {
+			ggpio =3D dwc2_readl(hsotg, GGPIO);
+			if (!(ggpio & GGPIO_STM32_OTG_GCCFG_PWRDWN)) {
+				dev_dbg(hsotg->dev, "Activating transceiver\n");
+				/*
+				 * STM32F4x9 uses the GGPIO register as general
+				 * core configuration register.
+				 */
+				ggpio |=3D GGPIO_STM32_OTG_GCCFG_PWRDWN;
+				dwc2_writel(hsotg, ggpio, GGPIO);
+			}
+		}
+	}
+
+	/*
+	 * Program DCFG.DevSpd or HCFG.FSLSPclkSel to 48Mhz in FS. Also
+	 * do this on HNP Dev/Host mode switches (done in dev_init and
+	 * host_init).
+	 */
+	if (dwc2_is_host_mode(hsotg))
+		dwc2_init_fs_ls_pclk_sel(hsotg);
+
+	if (hsotg->params.i2c_enable) {
+		dev_dbg(hsotg->dev, "FS PHY enabling I2C\n");
+
+		/* Program GUSBCFG.OtgUtmiFsSel to I2C */
+		usbcfg =3D dwc2_readl(hsotg, GUSBCFG);
+		usbcfg |=3D GUSBCFG_OTG_UTMI_FS_SEL;
+		dwc2_writel(hsotg, usbcfg, GUSBCFG);
+
+		/* Program GI2CCTL.I2CEn */
+		i2cctl =3D dwc2_readl(hsotg, GI2CCTL);
+		i2cctl &=3D ~GI2CCTL_I2CDEVADDR_MASK;
+		i2cctl |=3D 1 << GI2CCTL_I2CDEVADDR_SHIFT;
+		i2cctl &=3D ~GI2CCTL_I2CEN;
+		dwc2_writel(hsotg, i2cctl, GI2CCTL);
+		i2cctl |=3D GI2CCTL_I2CEN;
+		dwc2_writel(hsotg, i2cctl, GI2CCTL);
+	}
+
+	return retval;
+}
+
+static int dwc2_hs_phy_init(struct dwc2_hsotg *hsotg, bool select_phy)
+{
+	u32 usbcfg, usbcfg_old;
+	int retval =3D 0;
+
+	if (!select_phy)
+		return 0;
+
+	usbcfg =3D dwc2_readl(hsotg, GUSBCFG);
+	usbcfg_old =3D usbcfg;
+
+	/*
+	 * HS PHY parameters. These parameters are preserved during soft reset
+	 * so only program the first time. Do a soft reset immediately after
+	 * setting phyif.
+	 */
+	switch (hsotg->params.phy_type) {
+	case DWC2_PHY_TYPE_PARAM_ULPI:
+		/* ULPI interface */
+		dev_dbg(hsotg->dev, "HS ULPI PHY selected\n");
+		usbcfg |=3D GUSBCFG_ULPI_UTMI_SEL;
+		usbcfg &=3D ~(GUSBCFG_PHYIF16 | GUSBCFG_DDRSEL);
+		if (hsotg->params.phy_ulpi_ddr)
+			usbcfg |=3D GUSBCFG_DDRSEL;
+
+		/* Set external VBUS indicator as needed. */
+		if (hsotg->params.oc_disable)
+			usbcfg |=3D (GUSBCFG_ULPI_INT_VBUS_IND |
+				   GUSBCFG_INDICATORPASSTHROUGH);
+		break;
+	case DWC2_PHY_TYPE_PARAM_UTMI:
+		/* UTMI+ interface */
+		dev_dbg(hsotg->dev, "HS UTMI+ PHY selected\n");
+		usbcfg &=3D ~(GUSBCFG_ULPI_UTMI_SEL | GUSBCFG_PHYIF16);
+		if (hsotg->params.phy_utmi_width =3D=3D 16)
+			usbcfg |=3D GUSBCFG_PHYIF16;
+		break;
+	default:
+		dev_err(hsotg->dev, "FS PHY selected at HS!\n");
+		break;
+	}
+
+	if (usbcfg !=3D usbcfg_old) {
+		dwc2_writel(hsotg, usbcfg, GUSBCFG);
+
+		/* Reset after setting the PHY parameters */
+		retval =3D dwc2_core_reset(hsotg, false);
+		if (retval) {
+			dev_err(hsotg->dev,
+				"%s: Reset failed, aborting", __func__);
+			return retval;
+		}
+	}
+
+	return retval;
+}
+
+int dwc2_phy_init(struct dwc2_hsotg *hsotg, bool select_phy)
+{
+	u32 usbcfg;
+	int retval =3D 0;
+
+	if ((hsotg->params.speed =3D=3D DWC2_SPEED_PARAM_FULL ||
+	     hsotg->params.speed =3D=3D DWC2_SPEED_PARAM_LOW) &&
+	    hsotg->params.phy_type =3D=3D DWC2_PHY_TYPE_PARAM_FS) {
+		/* If FS/LS mode with FS/LS PHY */
+		retval =3D dwc2_fs_phy_init(hsotg, select_phy);
+		if (retval)
+			return retval;
+	} else {
+		/* High speed PHY */
+		retval =3D dwc2_hs_phy_init(hsotg, select_phy);
+		if (retval)
+			return retval;
+	}
+
+	if (hsotg->hw_params.hs_phy_type =3D=3D GHWCFG2_HS_PHY_TYPE_ULPI &&
+	    hsotg->hw_params.fs_phy_type =3D=3D GHWCFG2_FS_PHY_TYPE_DEDICATED &=
&
+	    hsotg->params.ulpi_fs_ls) {
+		dev_dbg(hsotg->dev, "Setting ULPI FSLS\n");
+		usbcfg =3D dwc2_readl(hsotg, GUSBCFG);
+		usbcfg |=3D GUSBCFG_ULPI_FS_LS;
+		usbcfg |=3D GUSBCFG_ULPI_CLK_SUSP_M;
+		dwc2_writel(hsotg, usbcfg, GUSBCFG);
+	} else {
+		usbcfg =3D dwc2_readl(hsotg, GUSBCFG);
+		usbcfg &=3D ~GUSBCFG_ULPI_FS_LS;
+		usbcfg &=3D ~GUSBCFG_ULPI_CLK_SUSP_M;
+		dwc2_writel(hsotg, usbcfg, GUSBCFG);
+	}
+
+	return retval;
+}
+
 MODULE_DESCRIPTION("DESIGNWARE HS OTG Core");
 MODULE_AUTHOR("Synopsys, Inc.");
 MODULE_LICENSE("Dual BSD/GPL");
diff --git a/drivers/usb/dwc2/core.h b/drivers/usb/dwc2/core.h
index ac5805eac75c..64e6bc30693e 100644
--- a/drivers/usb/dwc2/core.h
+++ b/drivers/usb/dwc2/core.h
@@ -1281,6 +1281,8 @@ int dwc2_exit_partial_power_down(struct dwc2_hsotg =
*hsotg, bool restore);
 int dwc2_enter_hibernation(struct dwc2_hsotg *hsotg, int is_host);
 int dwc2_exit_hibernation(struct dwc2_hsotg *hsotg, int rem_wakeup,
 		int reset, int is_host);
+void dwc2_init_fs_ls_pclk_sel(struct dwc2_hsotg *hsotg);
+int dwc2_phy_init(struct dwc2_hsotg *hsotg, bool select_phy);
=20
 void dwc2_force_mode(struct dwc2_hsotg *hsotg, bool host);
 void dwc2_force_dr_mode(struct dwc2_hsotg *hsotg);
diff --git a/drivers/usb/dwc2/hcd.c b/drivers/usb/dwc2/hcd.c
index 3f087962f498..9733f2177d39 100644
--- a/drivers/usb/dwc2/hcd.c
+++ b/drivers/usb/dwc2/hcd.c
@@ -97,196 +97,6 @@ static void dwc2_enable_common_interrupts(struct dwc2=
_hsotg *hsotg)
 	dwc2_writel(hsotg, intmsk, GINTMSK);
 }
=20
-/*
- * Initializes the FSLSPClkSel field of the HCFG register depending on t=
he
- * PHY type
- */
-static void dwc2_init_fs_ls_pclk_sel(struct dwc2_hsotg *hsotg)
-{
-	u32 hcfg, val;
-
-	if ((hsotg->hw_params.hs_phy_type =3D=3D GHWCFG2_HS_PHY_TYPE_ULPI &&
-	     hsotg->hw_params.fs_phy_type =3D=3D GHWCFG2_FS_PHY_TYPE_DEDICATED =
&&
-	     hsotg->params.ulpi_fs_ls) ||
-	    hsotg->params.phy_type =3D=3D DWC2_PHY_TYPE_PARAM_FS) {
-		/* Full speed PHY */
-		val =3D HCFG_FSLSPCLKSEL_48_MHZ;
-	} else {
-		/* High speed PHY running at full speed or high speed */
-		val =3D HCFG_FSLSPCLKSEL_30_60_MHZ;
-	}
-
-	dev_dbg(hsotg->dev, "Initializing HCFG.FSLSPClkSel to %08x\n", val);
-	hcfg =3D dwc2_readl(hsotg, HCFG);
-	hcfg &=3D ~HCFG_FSLSPCLKSEL_MASK;
-	hcfg |=3D val << HCFG_FSLSPCLKSEL_SHIFT;
-	dwc2_writel(hsotg, hcfg, HCFG);
-}
-
-static int dwc2_fs_phy_init(struct dwc2_hsotg *hsotg, bool select_phy)
-{
-	u32 usbcfg, ggpio, i2cctl;
-	int retval =3D 0;
-
-	/*
-	 * core_init() is now called on every switch so only call the
-	 * following for the first time through
-	 */
-	if (select_phy) {
-		dev_dbg(hsotg->dev, "FS PHY selected\n");
-
-		usbcfg =3D dwc2_readl(hsotg, GUSBCFG);
-		if (!(usbcfg & GUSBCFG_PHYSEL)) {
-			usbcfg |=3D GUSBCFG_PHYSEL;
-			dwc2_writel(hsotg, usbcfg, GUSBCFG);
-
-			/* Reset after a PHY select */
-			retval =3D dwc2_core_reset(hsotg, false);
-
-			if (retval) {
-				dev_err(hsotg->dev,
-					"%s: Reset failed, aborting", __func__);
-				return retval;
-			}
-		}
-
-		if (hsotg->params.activate_stm_fs_transceiver) {
-			ggpio =3D dwc2_readl(hsotg, GGPIO);
-			if (!(ggpio & GGPIO_STM32_OTG_GCCFG_PWRDWN)) {
-				dev_dbg(hsotg->dev, "Activating transceiver\n");
-				/*
-				 * STM32F4x9 uses the GGPIO register as general
-				 * core configuration register.
-				 */
-				ggpio |=3D GGPIO_STM32_OTG_GCCFG_PWRDWN;
-				dwc2_writel(hsotg, ggpio, GGPIO);
-			}
-		}
-	}
-
-	/*
-	 * Program DCFG.DevSpd or HCFG.FSLSPclkSel to 48Mhz in FS. Also
-	 * do this on HNP Dev/Host mode switches (done in dev_init and
-	 * host_init).
-	 */
-	if (dwc2_is_host_mode(hsotg))
-		dwc2_init_fs_ls_pclk_sel(hsotg);
-
-	if (hsotg->params.i2c_enable) {
-		dev_dbg(hsotg->dev, "FS PHY enabling I2C\n");
-
-		/* Program GUSBCFG.OtgUtmiFsSel to I2C */
-		usbcfg =3D dwc2_readl(hsotg, GUSBCFG);
-		usbcfg |=3D GUSBCFG_OTG_UTMI_FS_SEL;
-		dwc2_writel(hsotg, usbcfg, GUSBCFG);
-
-		/* Program GI2CCTL.I2CEn */
-		i2cctl =3D dwc2_readl(hsotg, GI2CCTL);
-		i2cctl &=3D ~GI2CCTL_I2CDEVADDR_MASK;
-		i2cctl |=3D 1 << GI2CCTL_I2CDEVADDR_SHIFT;
-		i2cctl &=3D ~GI2CCTL_I2CEN;
-		dwc2_writel(hsotg, i2cctl, GI2CCTL);
-		i2cctl |=3D GI2CCTL_I2CEN;
-		dwc2_writel(hsotg, i2cctl, GI2CCTL);
-	}
-
-	return retval;
-}
-
-static int dwc2_hs_phy_init(struct dwc2_hsotg *hsotg, bool select_phy)
-{
-	u32 usbcfg, usbcfg_old;
-	int retval =3D 0;
-
-	if (!select_phy)
-		return 0;
-
-	usbcfg =3D dwc2_readl(hsotg, GUSBCFG);
-	usbcfg_old =3D usbcfg;
-
-	/*
-	 * HS PHY parameters. These parameters are preserved during soft reset
-	 * so only program the first time. Do a soft reset immediately after
-	 * setting phyif.
-	 */
-	switch (hsotg->params.phy_type) {
-	case DWC2_PHY_TYPE_PARAM_ULPI:
-		/* ULPI interface */
-		dev_dbg(hsotg->dev, "HS ULPI PHY selected\n");
-		usbcfg |=3D GUSBCFG_ULPI_UTMI_SEL;
-		usbcfg &=3D ~(GUSBCFG_PHYIF16 | GUSBCFG_DDRSEL);
-		if (hsotg->params.phy_ulpi_ddr)
-			usbcfg |=3D GUSBCFG_DDRSEL;
-
-		/* Set external VBUS indicator as needed. */
-		if (hsotg->params.oc_disable)
-			usbcfg |=3D (GUSBCFG_ULPI_INT_VBUS_IND |
-				   GUSBCFG_INDICATORPASSTHROUGH);
-		break;
-	case DWC2_PHY_TYPE_PARAM_UTMI:
-		/* UTMI+ interface */
-		dev_dbg(hsotg->dev, "HS UTMI+ PHY selected\n");
-		usbcfg &=3D ~(GUSBCFG_ULPI_UTMI_SEL | GUSBCFG_PHYIF16);
-		if (hsotg->params.phy_utmi_width =3D=3D 16)
-			usbcfg |=3D GUSBCFG_PHYIF16;
-		break;
-	default:
-		dev_err(hsotg->dev, "FS PHY selected at HS!\n");
-		break;
-	}
-
-	if (usbcfg !=3D usbcfg_old) {
-		dwc2_writel(hsotg, usbcfg, GUSBCFG);
-
-		/* Reset after setting the PHY parameters */
-		retval =3D dwc2_core_reset(hsotg, false);
-		if (retval) {
-			dev_err(hsotg->dev,
-				"%s: Reset failed, aborting", __func__);
-			return retval;
-		}
-	}
-
-	return retval;
-}
-
-static int dwc2_phy_init(struct dwc2_hsotg *hsotg, bool select_phy)
-{
-	u32 usbcfg;
-	int retval =3D 0;
-
-	if ((hsotg->params.speed =3D=3D DWC2_SPEED_PARAM_FULL ||
-	     hsotg->params.speed =3D=3D DWC2_SPEED_PARAM_LOW) &&
-	    hsotg->params.phy_type =3D=3D DWC2_PHY_TYPE_PARAM_FS) {
-		/* If FS/LS mode with FS/LS PHY */
-		retval =3D dwc2_fs_phy_init(hsotg, select_phy);
-		if (retval)
-			return retval;
-	} else {
-		/* High speed PHY */
-		retval =3D dwc2_hs_phy_init(hsotg, select_phy);
-		if (retval)
-			return retval;
-	}
-
-	if (hsotg->hw_params.hs_phy_type =3D=3D GHWCFG2_HS_PHY_TYPE_ULPI &&
-	    hsotg->hw_params.fs_phy_type =3D=3D GHWCFG2_FS_PHY_TYPE_DEDICATED &=
&
-	    hsotg->params.ulpi_fs_ls) {
-		dev_dbg(hsotg->dev, "Setting ULPI FSLS\n");
-		usbcfg =3D dwc2_readl(hsotg, GUSBCFG);
-		usbcfg |=3D GUSBCFG_ULPI_FS_LS;
-		usbcfg |=3D GUSBCFG_ULPI_CLK_SUSP_M;
-		dwc2_writel(hsotg, usbcfg, GUSBCFG);
-	} else {
-		usbcfg =3D dwc2_readl(hsotg, GUSBCFG);
-		usbcfg &=3D ~GUSBCFG_ULPI_FS_LS;
-		usbcfg &=3D ~GUSBCFG_ULPI_CLK_SUSP_M;
-		dwc2_writel(hsotg, usbcfg, GUSBCFG);
-	}
-
-	return retval;
-}
-
 static int dwc2_gahbcfg_init(struct dwc2_hsotg *hsotg)
 {
 	u32 ahbcfg =3D dwc2_readl(hsotg, GAHBCFG);
--=20
2.21.0.196.g041f5ea


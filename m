Return-Path: <SRS0=hNA8=SH=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A52ABC10F00
	for <linux-usb@archiver.kernel.org>; Fri,  5 Apr 2019 13:36:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 73DC32186A
	for <linux-usb@archiver.kernel.org>; Fri,  5 Apr 2019 13:36:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=kalray.eu header.i=@kalray.eu header.b="n1sA/RhW"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730565AbfDENgC (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Fri, 5 Apr 2019 09:36:02 -0400
Received: from zimbra2.kalray.eu ([92.103.151.219]:44680 "EHLO
        zimbra2.kalray.eu" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730024AbfDENgB (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 5 Apr 2019 09:36:01 -0400
Received: from localhost (localhost [127.0.0.1])
        by zimbra2.kalray.eu (Postfix) with ESMTP id E659227E0356;
        Fri,  5 Apr 2019 15:35:59 +0200 (CEST)
Received: from zimbra2.kalray.eu ([127.0.0.1])
        by localhost (zimbra2.kalray.eu [127.0.0.1]) (amavisd-new, port 10032)
        with ESMTP id AY0P5QTrxNJP; Fri,  5 Apr 2019 15:35:58 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
        by zimbra2.kalray.eu (Postfix) with ESMTP id 28DF027E034C;
        Fri,  5 Apr 2019 15:35:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.10.3 zimbra2.kalray.eu 28DF027E034C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kalray.eu;
        s=32AE1B44-9502-11E5-BA35-3734643DEF29; t=1554471358;
        bh=Z2+zimA0AXfFfxJ29dJe2SrBlAfKre/HOI2BsAPL5T8=;
        h=From:To:Date:Message-Id:MIME-Version;
        b=n1sA/RhWd4tjOsZsKGfykcSRvKIiBg2roe/OMVzVRfiJNIsfLoDrbEMxx3FNIOhlk
         lFk+cL/cuiXY47Y5Gi7NhhAGPBx+ZgbZxCcUPW0OoYHdVI0Tigp7SESeW51GcQPKiP
         hGL4ev9nJmqZspT1QlqHfL2Dr67kMOeFwklV+vfE=
X-Virus-Scanned: amavisd-new at zimbra2.kalray.eu
Received: from zimbra2.kalray.eu ([127.0.0.1])
        by localhost (zimbra2.kalray.eu [127.0.0.1]) (amavisd-new, port 10026)
        with ESMTP id Y9ztJYk2osBH; Fri,  5 Apr 2019 15:35:57 +0200 (CEST)
Received: from tellis.lin.mbt.kalray.eu (unknown [192.168.36.206])
        by zimbra2.kalray.eu (Postfix) with ESMTPSA id E052027E0351;
        Fri,  5 Apr 2019 15:35:57 +0200 (CEST)
From:   Jules Maselbas <jmaselbas@kalray.eu>
To:     Minas Harutyunyan <hminas@synopsys.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Pierre-Yves Kerbrat <pkerbrat@kalray.eu>,
        linux-usb@vger.kernel.org, Jules Maselbas <jmaselbas@kalray.eu>
Subject: [PATCH v2 5/5] usb: dwc2: gadget: Move gadget phy init into core phy init
Date:   Fri,  5 Apr 2019 15:35:33 +0200
Message-Id: <20190405133533.2203-6-jmaselbas@kalray.eu>
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
Message-ID: <20190405133533.isLb-YzVIohAfc2SSB3nwYgIBXMqnV-SBfx-OBESHks@z>

Most of the phy initialization is shared between host and gadget,
this adds the turnaround configuration only used by gadgets to
the global phy init.

Signed-off-by: Jules Maselbas <jmaselbas@kalray.eu>
---
 drivers/usb/dwc2/core.c   |  9 +++++++++
 drivers/usb/dwc2/gadget.c | 25 +++++--------------------
 2 files changed, 14 insertions(+), 20 deletions(-)

diff --git a/drivers/usb/dwc2/core.c b/drivers/usb/dwc2/core.c
index 01ac4a064feb..8b499d643461 100644
--- a/drivers/usb/dwc2/core.c
+++ b/drivers/usb/dwc2/core.c
@@ -1152,6 +1152,15 @@ static int dwc2_hs_phy_init(struct dwc2_hsotg *hso=
tg, bool select_phy)
 		usbcfg &=3D ~(GUSBCFG_ULPI_UTMI_SEL | GUSBCFG_PHYIF16);
 		if (hsotg->params.phy_utmi_width =3D=3D 16)
 			usbcfg |=3D GUSBCFG_PHYIF16;
+
+		/* Set turnaround time */
+		if (dwc2_is_device_mode(hsotg)) {
+			usbcfg &=3D ~GUSBCFG_USBTRDTIM_MASK;
+			if (hsotg->params.phy_utmi_width =3D=3D 16)
+				usbcfg |=3D 5 << GUSBCFG_USBTRDTIM_SHIFT;
+			else
+				usbcfg |=3D 9 << GUSBCFG_USBTRDTIM_SHIFT;
+		}
 		break;
 	default:
 		dev_err(hsotg->dev, "FS PHY selected at HS!\n");
diff --git a/drivers/usb/dwc2/gadget.c b/drivers/usb/dwc2/gadget.c
index a92171c22406..0f9086dd43e1 100644
--- a/drivers/usb/dwc2/gadget.c
+++ b/drivers/usb/dwc2/gadget.c
@@ -3314,29 +3314,14 @@ void dwc2_hsotg_core_init_disconnected(struct dwc=
2_hsotg *hsotg,
=20
 	/* keep other bits untouched (so e.g. forced modes are not lost) */
 	usbcfg =3D dwc2_readl(hsotg, GUSBCFG);
-	/* remove the HNP/SRP */
-	usbcfg &=3D ~(GUSBCFG_TOUTCAL_MASK | GUSBCFG_PHYIF16 | GUSBCFG_SRPCAP |
-		GUSBCFG_HNPCAP);
+	usbcfg &=3D ~GUSBCFG_TOUTCAL_MASK;
 	usbcfg |=3D GUSBCFG_TOUTCAL(7);
=20
-	if (hsotg->params.phy_type =3D=3D DWC2_PHY_TYPE_PARAM_FS &&
-	    (hsotg->params.speed =3D=3D DWC2_SPEED_PARAM_FULL ||
-	     hsotg->params.speed =3D=3D DWC2_SPEED_PARAM_LOW)) {
-		/* FS/LS Dedicated Transceiver Interface */
-		usbcfg |=3D GUSBCFG_PHYSEL;
-	} else if (hsotg->params.phy_type =3D=3D DWC2_PHY_TYPE_PARAM_UTMI) {
-		if (hsotg->params.phy_utmi_width =3D=3D 16)
-			usbcfg |=3D GUSBCFG_PHYIF16;
-
-		/* Set turnaround time */
-		usbcfg &=3D ~GUSBCFG_USBTRDTIM_MASK;
-		if (hsotg->params.phy_utmi_width =3D=3D 16)
-			usbcfg |=3D 5 << GUSBCFG_USBTRDTIM_SHIFT;
-		else
-			usbcfg |=3D 9 << GUSBCFG_USBTRDTIM_SHIFT;
-	}
+	/* remove the HNP/SRP and set the PHY */
+	usbcfg &=3D ~(GUSBCFG_SRPCAP | GUSBCFG_HNPCAP);
+        dwc2_writel(hsotg, usbcfg, GUSBCFG);
=20
-	dwc2_writel(hsotg, usbcfg, GUSBCFG);
+	dwc2_phy_init(hsotg, true);
=20
 	dwc2_hsotg_init_fifo(hsotg);
=20
--=20
2.21.0.196.g041f5ea


Return-Path: <SRS0=hNA8=SH=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05015C4360F
	for <linux-usb@archiver.kernel.org>; Fri,  5 Apr 2019 13:36:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id C55772186A
	for <linux-usb@archiver.kernel.org>; Fri,  5 Apr 2019 13:36:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=kalray.eu header.i=@kalray.eu header.b="oXJY7rF7"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730424AbfDENgB (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Fri, 5 Apr 2019 09:36:01 -0400
Received: from zimbra2.kalray.eu ([92.103.151.219]:44690 "EHLO
        zimbra2.kalray.eu" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729994AbfDENgB (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 5 Apr 2019 09:36:01 -0400
Received: from localhost (localhost [127.0.0.1])
        by zimbra2.kalray.eu (Postfix) with ESMTP id EFDE427E034C;
        Fri,  5 Apr 2019 15:35:59 +0200 (CEST)
Received: from zimbra2.kalray.eu ([127.0.0.1])
        by localhost (zimbra2.kalray.eu [127.0.0.1]) (amavisd-new, port 10032)
        with ESMTP id iGV0gne_4_s1; Fri,  5 Apr 2019 15:35:58 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
        by zimbra2.kalray.eu (Postfix) with ESMTP id 119B527E0347;
        Fri,  5 Apr 2019 15:35:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.10.3 zimbra2.kalray.eu 119B527E0347
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kalray.eu;
        s=32AE1B44-9502-11E5-BA35-3734643DEF29; t=1554471358;
        bh=Uo9zISZOBo2Qgdwt+II+kK5hCYtFsC5M0Ql5MB0kV1I=;
        h=From:To:Date:Message-Id:MIME-Version;
        b=oXJY7rF7656CO6rk79D1hTfu2b+kvfTDyj6gk1+rYb60OoYB8wI4H1vK5jLS0GKQN
         u1UWULADox+0FK8YM6ePngWoIL5FCdguqRlN+BTguLJ8fd/Ps9CULVD0BVNSMaC5IR
         xJCIIjaq9nIkBAGvOlRpRGRzdjkTBDXEv8xOnrb8=
X-Virus-Scanned: amavisd-new at zimbra2.kalray.eu
Received: from zimbra2.kalray.eu ([127.0.0.1])
        by localhost (zimbra2.kalray.eu [127.0.0.1]) (amavisd-new, port 10026)
        with ESMTP id D0kUxHgxrzkY; Fri,  5 Apr 2019 15:35:57 +0200 (CEST)
Received: from tellis.lin.mbt.kalray.eu (unknown [192.168.36.206])
        by zimbra2.kalray.eu (Postfix) with ESMTPSA id C6C0C27E034C;
        Fri,  5 Apr 2019 15:35:57 +0200 (CEST)
From:   Jules Maselbas <jmaselbas@kalray.eu>
To:     Minas Harutyunyan <hminas@synopsys.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Pierre-Yves Kerbrat <pkerbrat@kalray.eu>,
        linux-usb@vger.kernel.org, Jules Maselbas <jmaselbas@kalray.eu>
Subject: [PATCH v2 3/5] usb: dwc2: gadget: Replace phyif with phy_utmi_width
Date:   Fri,  5 Apr 2019 15:35:31 +0200
Message-Id: <20190405133533.2203-4-jmaselbas@kalray.eu>
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
Message-ID: <20190405133531.2BkIAt2v5c8LmMMN13Kv-Yne-SblfhJGFkn9klnX4tY@z>

The phy utmi width information is already set in hsotg params,
phyif is only used in few places and I don't see any reason to
not use hsotg's params.

Moreover the utmi width was being forced to 16 bits by platform
initialization which doesn't take in account HW configuration.

Signed-off-by: Jules Maselbas <jmaselbas@kalray.eu>
---
 drivers/usb/dwc2/core.h     |  2 --
 drivers/usb/dwc2/gadget.c   | 20 ++++++++++++++------
 drivers/usb/dwc2/platform.c |  5 +----
 3 files changed, 15 insertions(+), 12 deletions(-)

diff --git a/drivers/usb/dwc2/core.h b/drivers/usb/dwc2/core.h
index 30bab8463c96..ac5805eac75c 100644
--- a/drivers/usb/dwc2/core.h
+++ b/drivers/usb/dwc2/core.h
@@ -869,7 +869,6 @@ struct dwc2_hregs_backup {
  *                      removed once all SoCs support usb transceiver.
  * @supplies:           Definition of USB power supplies
  * @vbus_supply:        Regulator supplying vbus.
- * @phyif:              PHY interface width
  * @lock:		Spinlock that protects all the driver data structures
  * @priv:		Stores a pointer to the struct usb_hcd
  * @queuing_high_bandwidth: True if multiple packets of a high-bandwidth
@@ -1052,7 +1051,6 @@ struct dwc2_hsotg {
 	struct dwc2_hsotg_plat *plat;
 	struct regulator_bulk_data supplies[DWC2_NUM_SUPPLIES];
 	struct regulator *vbus_supply;
-	u32 phyif;
=20
 	spinlock_t lock;
 	void *priv;
diff --git a/drivers/usb/dwc2/gadget.c b/drivers/usb/dwc2/gadget.c
index 36ba391a715f..a92171c22406 100644
--- a/drivers/usb/dwc2/gadget.c
+++ b/drivers/usb/dwc2/gadget.c
@@ -3314,20 +3314,28 @@ void dwc2_hsotg_core_init_disconnected(struct dwc=
2_hsotg *hsotg,
=20
 	/* keep other bits untouched (so e.g. forced modes are not lost) */
 	usbcfg =3D dwc2_readl(hsotg, GUSBCFG);
+	/* remove the HNP/SRP */
 	usbcfg &=3D ~(GUSBCFG_TOUTCAL_MASK | GUSBCFG_PHYIF16 | GUSBCFG_SRPCAP |
-		GUSBCFG_HNPCAP | GUSBCFG_USBTRDTIM_MASK);
+		GUSBCFG_HNPCAP);
+	usbcfg |=3D GUSBCFG_TOUTCAL(7);
=20
 	if (hsotg->params.phy_type =3D=3D DWC2_PHY_TYPE_PARAM_FS &&
 	    (hsotg->params.speed =3D=3D DWC2_SPEED_PARAM_FULL ||
 	     hsotg->params.speed =3D=3D DWC2_SPEED_PARAM_LOW)) {
 		/* FS/LS Dedicated Transceiver Interface */
 		usbcfg |=3D GUSBCFG_PHYSEL;
-	} else {
-		/* set the PLL on, remove the HNP/SRP and set the PHY */
-		val =3D (hsotg->phyif =3D=3D GUSBCFG_PHYIF8) ? 9 : 5;
-		usbcfg |=3D hsotg->phyif | GUSBCFG_TOUTCAL(7) |
-			(val << GUSBCFG_USBTRDTIM_SHIFT);
+	} else if (hsotg->params.phy_type =3D=3D DWC2_PHY_TYPE_PARAM_UTMI) {
+		if (hsotg->params.phy_utmi_width =3D=3D 16)
+			usbcfg |=3D GUSBCFG_PHYIF16;
+
+		/* Set turnaround time */
+		usbcfg &=3D ~GUSBCFG_USBTRDTIM_MASK;
+		if (hsotg->params.phy_utmi_width =3D=3D 16)
+			usbcfg |=3D 5 << GUSBCFG_USBTRDTIM_SHIFT;
+		else
+			usbcfg |=3D 9 << GUSBCFG_USBTRDTIM_SHIFT;
 	}
+
 	dwc2_writel(hsotg, usbcfg, GUSBCFG);
=20
 	dwc2_hsotg_init_fifo(hsotg);
diff --git a/drivers/usb/dwc2/platform.c b/drivers/usb/dwc2/platform.c
index c0b64d483552..f126591f06b0 100644
--- a/drivers/usb/dwc2/platform.c
+++ b/drivers/usb/dwc2/platform.c
@@ -230,9 +230,6 @@ static int dwc2_lowlevel_hw_init(struct dwc2_hsotg *h=
sotg)
=20
 	reset_control_deassert(hsotg->reset_ecc);
=20
-	/* Set default UTMI width */
-	hsotg->phyif =3D GUSBCFG_PHYIF16;
-
 	/*
 	 * Attempt to find a generic PHY, then look for an old style
 	 * USB PHY and then fall back to pdata
@@ -280,7 +277,7 @@ static int dwc2_lowlevel_hw_init(struct dwc2_hsotg *h=
sotg)
 		 * width is 8-bit and set the phyif appropriately.
 		 */
 		if (phy_get_bus_width(hsotg->phy) =3D=3D 8)
-			hsotg->phyif =3D GUSBCFG_PHYIF8;
+			hsotg->params.phy_utmi_width =3D 8;
 	}
=20
 	/* Clock */
--=20
2.21.0.196.g041f5ea


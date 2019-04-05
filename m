Return-Path: <SRS0=hNA8=SH=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C773C10F00
	for <linux-usb@archiver.kernel.org>; Fri,  5 Apr 2019 13:36:02 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 0B8C5218A6
	for <linux-usb@archiver.kernel.org>; Fri,  5 Apr 2019 13:36:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=kalray.eu header.i=@kalray.eu header.b="bArccud3"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730329AbfDENgB (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Fri, 5 Apr 2019 09:36:01 -0400
Received: from zimbra2.kalray.eu ([92.103.151.219]:44700 "EHLO
        zimbra2.kalray.eu" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726027AbfDENgB (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 5 Apr 2019 09:36:01 -0400
Received: from localhost (localhost [127.0.0.1])
        by zimbra2.kalray.eu (Postfix) with ESMTP id 0400F27E0347;
        Fri,  5 Apr 2019 15:36:00 +0200 (CEST)
Received: from zimbra2.kalray.eu ([127.0.0.1])
        by localhost (zimbra2.kalray.eu [127.0.0.1]) (amavisd-new, port 10032)
        with ESMTP id eMQHF_6fsZH1; Fri,  5 Apr 2019 15:35:58 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
        by zimbra2.kalray.eu (Postfix) with ESMTP id F215D27E0345;
        Fri,  5 Apr 2019 15:35:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.10.3 zimbra2.kalray.eu F215D27E0345
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kalray.eu;
        s=32AE1B44-9502-11E5-BA35-3734643DEF29; t=1554471358;
        bh=tqa10usoaFM3skIl4kZa6ZNKXQBfn4BN7WQOtgt3HiI=;
        h=From:To:Date:Message-Id:MIME-Version;
        b=bArccud3PYmX6eOvAP85aSxq9q21KUEsOt4MvAhr8YARsctxaXxqEzew/c+rsPhfL
         WP88mWQ/O4i3mgvI9ciDbUn6uaS+HP0OjptCYUkm2fV5lWBAX/XBqOeF4nks9z9Sqk
         xkhZlN0IqbavQc+Kf1COE7Upstqziwl0MVVZNdtI=
X-Virus-Scanned: amavisd-new at zimbra2.kalray.eu
Received: from zimbra2.kalray.eu ([127.0.0.1])
        by localhost (zimbra2.kalray.eu [127.0.0.1]) (amavisd-new, port 10026)
        with ESMTP id 11n78J_giJqM; Fri,  5 Apr 2019 15:35:57 +0200 (CEST)
Received: from tellis.lin.mbt.kalray.eu (unknown [192.168.36.206])
        by zimbra2.kalray.eu (Postfix) with ESMTPSA id B918927E034B;
        Fri,  5 Apr 2019 15:35:57 +0200 (CEST)
From:   Jules Maselbas <jmaselbas@kalray.eu>
To:     Minas Harutyunyan <hminas@synopsys.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Pierre-Yves Kerbrat <pkerbrat@kalray.eu>,
        linux-usb@vger.kernel.org, Jules Maselbas <jmaselbas@kalray.eu>
Subject: [PATCH v2 2/5] usb: dwc2: gadget: Remove duplicated phy init
Date:   Fri,  5 Apr 2019 15:35:30 +0200
Message-Id: <20190405133533.2203-3-jmaselbas@kalray.eu>
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
Message-ID: <20190405133530.KFyJd8zJbrkFFX0e_QrD8asRqiEVJQx0_kwJs5QevY8@z>

The function dwc2_hsotg_init is only called once just before calling
dwc2_hsotg_core_init_disconnected which does the same initialization:
setting the usbcfg register with turnaround time, timeout calibration
and phy width.

Signed-off-by: Jules Maselbas <jmaselbas@kalray.eu>
---
 drivers/usb/dwc2/gadget.c | 13 -------------
 1 file changed, 13 deletions(-)

diff --git a/drivers/usb/dwc2/gadget.c b/drivers/usb/dwc2/gadget.c
index 6812a8a3a98b..36ba391a715f 100644
--- a/drivers/usb/dwc2/gadget.c
+++ b/drivers/usb/dwc2/gadget.c
@@ -4328,8 +4328,6 @@ static const struct usb_ep_ops dwc2_hsotg_ep_ops =3D=
 {
  */
 static void dwc2_hsotg_init(struct dwc2_hsotg *hsotg)
 {
-	u32 trdtim;
-	u32 usbcfg;
 	/* unmask subset of endpoint interrupts */
=20
 	dwc2_writel(hsotg, DIEPMSK_TIMEOUTMSK | DIEPMSK_AHBERRMSK |
@@ -4353,17 +4351,6 @@ static void dwc2_hsotg_init(struct dwc2_hsotg *hso=
tg)
=20
 	dwc2_hsotg_init_fifo(hsotg);
=20
-	/* keep other bits untouched (so e.g. forced modes are not lost) */
-	usbcfg =3D dwc2_readl(hsotg, GUSBCFG);
-	usbcfg &=3D ~(GUSBCFG_TOUTCAL_MASK | GUSBCFG_PHYIF16 | GUSBCFG_SRPCAP |
-		GUSBCFG_HNPCAP | GUSBCFG_USBTRDTIM_MASK);
-
-	/* set the PLL on, remove the HNP/SRP and set the PHY */
-	trdtim =3D (hsotg->phyif =3D=3D GUSBCFG_PHYIF8) ? 9 : 5;
-	usbcfg |=3D hsotg->phyif | GUSBCFG_TOUTCAL(7) |
-		(trdtim << GUSBCFG_USBTRDTIM_SHIFT);
-	dwc2_writel(hsotg, usbcfg, GUSBCFG);
-
 	if (using_dma(hsotg))
 		dwc2_set_bit(hsotg, GAHBCFG, GAHBCFG_DMA_EN);
 }
--=20
2.21.0.196.g041f5ea


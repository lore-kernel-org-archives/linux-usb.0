Return-Path: <SRS0=VYZK=UD=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7754BC28CC3
	for <linux-usb@archiver.kernel.org>; Tue,  4 Jun 2019 04:14:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 52249223CB
	for <linux-usb@archiver.kernel.org>; Tue,  4 Jun 2019 04:14:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726295AbfFDEOe (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Tue, 4 Jun 2019 00:14:34 -0400
Received: from relmlor1.renesas.com ([210.160.252.171]:9219 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725933AbfFDEOe (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 4 Jun 2019 00:14:34 -0400
X-IronPort-AV: E=Sophos;i="5.60,549,1549897200"; 
   d="scan'208";a="17745268"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 04 Jun 2019 13:14:32 +0900
Received: from localhost.localdomain (unknown [10.166.17.210])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 7368E4002645;
        Tue,  4 Jun 2019 13:14:32 +0900 (JST)
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     gregkh@linuxfoundation.org
Cc:     linux-usb@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH 1/2] usb: renesas_usbhs: remove sudmac support
Date:   Tue,  4 Jun 2019 13:09:34 +0900
Message-Id: <1559621375-5436-2-git-send-email-yoshihiro.shimoda.uh@renesas.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1559621375-5436-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
References: <1559621375-5436-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

SUDMAC featurer was supported in v3.10, but was never used by
any platform. So, this patch removes it.

Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
 drivers/usb/renesas_usbhs/fifo.c  | 5 +----
 include/linux/usb/renesas_usbhs.h | 1 -
 2 files changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/usb/renesas_usbhs/fifo.c b/drivers/usb/renesas_usbhs/fifo.c
index 452b456..53f8e2f 100644
--- a/drivers/usb/renesas_usbhs/fifo.c
+++ b/drivers/usb/renesas_usbhs/fifo.c
@@ -325,10 +325,7 @@ static int usbhsf_fifo_select(struct usbhs_pipe *pipe,
 	}
 
 	/* "base" will be used below  */
-	if (usbhs_get_dparam(priv, has_sudmac) && !usbhsf_is_cfifo(priv, fifo))
-		usbhs_write(priv, fifo->sel, base);
-	else
-		usbhs_write(priv, fifo->sel, base | MBW_32);
+	usbhs_write(priv, fifo->sel, base | MBW_32);
 
 	/* check ISEL and CURPIPE value */
 	while (timeout--) {
diff --git a/include/linux/usb/renesas_usbhs.h b/include/linux/usb/renesas_usbhs.h
index 3f53043..a2481f4d 100644
--- a/include/linux/usb/renesas_usbhs.h
+++ b/include/linux/usb/renesas_usbhs.h
@@ -187,7 +187,6 @@ struct renesas_usbhs_driver_param {
 	 * option:
 	 */
 	u32 has_otg:1; /* for controlling PWEN/EXTLP */
-	u32 has_sudmac:1; /* for SUDMAC */
 	u32 has_usb_dmac:1; /* for USB-DMAC */
 	u32 runtime_pwctrl:1;
 	u32 has_cnen:1;
-- 
2.7.4


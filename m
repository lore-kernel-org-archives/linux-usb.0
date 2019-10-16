Return-Path: <SRS0=ub7o=YJ=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D19C7ECE59E
	for <linux-usb@archiver.kernel.org>; Wed, 16 Oct 2019 04:14:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id B1C822168B
	for <linux-usb@archiver.kernel.org>; Wed, 16 Oct 2019 04:14:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388615AbfJPEOw (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Wed, 16 Oct 2019 00:14:52 -0400
Received: from relmlor1.renesas.com ([210.160.252.171]:33614 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726155AbfJPEOw (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 16 Oct 2019 00:14:52 -0400
X-IronPort-AV: E=Sophos;i="5.67,302,1566831600"; 
   d="scan'208";a="29205641"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 16 Oct 2019 13:14:49 +0900
Received: from localhost.localdomain (unknown [10.166.17.210])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id DA08241B058E;
        Wed, 16 Oct 2019 13:14:33 +0900 (JST)
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     balbi@kernel.org
Cc:     gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH] usb: renesas_usbhs: Fix warnings in usbhsg_recip_handler_std_set_device()
Date:   Wed, 16 Oct 2019 13:14:33 +0900
Message-Id: <1571199273-5312-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
X-Mailer: git-send-email 2.7.4
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

This patch fixes the following sparse warnings by shifting 8-bits after
le16_to_cpu().

drivers/usb/renesas_usbhs/mod_gadget.c:268:47: warning: restricted __le16 degrades to integer
drivers/usb/renesas_usbhs/mod_gadget.c:268:47: warning: cast to restricted __le16

Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
 drivers/usb/renesas_usbhs/mod_gadget.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/renesas_usbhs/mod_gadget.c b/drivers/usb/renesas_usbhs/mod_gadget.c
index 0b1fa6d..22f882c 100644
--- a/drivers/usb/renesas_usbhs/mod_gadget.c
+++ b/drivers/usb/renesas_usbhs/mod_gadget.c
@@ -265,7 +265,7 @@ static int usbhsg_recip_handler_std_set_device(struct usbhs_priv *priv,
 	case USB_DEVICE_TEST_MODE:
 		usbhsg_recip_handler_std_control_done(priv, uep, ctrl);
 		udelay(100);
-		usbhs_sys_set_test_mode(priv, le16_to_cpu(ctrl->wIndex >> 8));
+		usbhs_sys_set_test_mode(priv, le16_to_cpu(ctrl->wIndex) >> 8);
 		break;
 	default:
 		usbhsg_recip_handler_std_control_done(priv, uep, ctrl);
-- 
2.7.4


Return-Path: <SRS0=Ypd4=B7=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9EBCEC433E4
	for <linux-usb@archiver.kernel.org>; Fri, 21 Aug 2020 08:56:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 830AD2087D
	for <linux-usb@archiver.kernel.org>; Fri, 21 Aug 2020 08:56:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728228AbgHUI4g (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Fri, 21 Aug 2020 04:56:36 -0400
Received: from relmlor2.renesas.com ([210.160.252.172]:58277 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726062AbgHUI4e (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 21 Aug 2020 04:56:34 -0400
X-IronPort-AV: E=Sophos;i="5.76,335,1592838000"; 
   d="scan'208";a="54949013"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 21 Aug 2020 17:56:33 +0900
Received: from localhost.localdomain (unknown [10.166.252.89])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 32FE44221738;
        Fri, 21 Aug 2020 17:56:33 +0900 (JST)
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     balbi@kernel.org
Cc:     gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH] usb: gadget: u_serial: clear suspended flag when discnnecting
Date:   Fri, 21 Aug 2020 17:56:19 +0900
Message-Id: <1598000179-28417-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
X-Mailer: git-send-email 2.7.4
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The commit aba3a8d01d62 ("usb: gadget: u_serial: add suspend resume
callbacks") set/cleared the suspended flag in USB bus suspend/resume
only. But, when a USB cable is disconnected in the suspend, since some
controllers will not detect USB bus resume, the suspended flag is not
cleared. After that, user cannot send any data. To fix the issue,
clears the suspended flag in the gserial_disconnect().

Fixes: aba3a8d01d62 ("usb: gadget: u_serial: add suspend resume callbacks")
Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Tested-by: Linh Phung <linh.phung.jy@renesas.com>
Tested-by: Tam Nguyen <tam.nguyen.xa@renesas.com>
---
 drivers/usb/gadget/function/u_serial.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/usb/gadget/function/u_serial.c b/drivers/usb/gadget/function/u_serial.c
index 127ecc2..2caccbb 100644
--- a/drivers/usb/gadget/function/u_serial.c
+++ b/drivers/usb/gadget/function/u_serial.c
@@ -1391,6 +1391,7 @@ void gserial_disconnect(struct gserial *gser)
 		if (port->port.tty)
 			tty_hangup(port->port.tty);
 	}
+	port->suspended = false;
 	spin_unlock_irqrestore(&port->port_lock, flags);
 
 	/* disable endpoints, aborting down any active I/O */
-- 
2.7.4


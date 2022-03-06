Return-Path: <linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 429CBC433F5
	for <linux-usb@archiver.kernel.org>; Sun,  6 Mar 2022 07:57:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232127AbiCFH5t (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Sun, 6 Mar 2022 02:57:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60208 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232115AbiCFH5s (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 6 Mar 2022 02:57:48 -0500
Received: from smtp.smtpout.orange.fr (smtp01.smtpout.orange.fr [80.12.242.123])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 74A545677A
        for <linux-usb@vger.kernel.org>; Sat,  5 Mar 2022 23:56:57 -0800 (PST)
Received: from localhost.localdomain ([106.133.32.90])
        by smtp.orange.fr with ESMTPA
        id Qljkni9jQu3WEQll7nB7tk; Sun, 06 Mar 2022 08:56:56 +0100
X-ME-Helo: localhost.localdomain
X-ME-Auth: MDU0YmViZGZmMDIzYiBlMiM2NTczNTRjNWZkZTMwOGRiOGQ4ODf3NWI1ZTMyMzdiODlhOQ==
X-ME-Date: Sun, 06 Mar 2022 08:56:56 +0100
X-ME-IP: 106.133.32.90
From:   Vincent Mailhol <mailhol.vincent@wanadoo.fr>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org
Cc:     Vincent Mailhol <mailhol.vincent@wanadoo.fr>,
        Rui Miguel Silva <rui.silva@linaro.org>
Subject: [PATCH v2 02/10] usb: isp1760: remove redundant max_packet() macro
Date:   Sun,  6 Mar 2022 16:55:16 +0900
Message-Id: <20220306075524.706660-3-mailhol.vincent@wanadoo.fr>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220306075524.706660-1-mailhol.vincent@wanadoo.fr>
References: <20220304105420.1059585-1-mailhol.vincent@wanadoo.fr>
 <20220306075524.706660-1-mailhol.vincent@wanadoo.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The function usb_endpoint_maxp() (called by usb_maxpacket()) already
does the sanitazation of the USB endpoint max packet size. The call to
max_packet() does the same thing and is thus removed.

The macro max_packet() not being used anymore also gets removed.

CC: Rui Miguel Silva <rui.silva@linaro.org>
Signed-off-by: Vincent Mailhol <mailhol.vincent@wanadoo.fr>
---
 drivers/usb/isp1760/isp1760-hcd.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/isp1760/isp1760-hcd.c b/drivers/usb/isp1760/isp1760-hcd.c
index 79d571f1429b..893becb077d3 100644
--- a/drivers/usb/isp1760/isp1760-hcd.c
+++ b/drivers/usb/isp1760/isp1760-hcd.c
@@ -1768,7 +1768,6 @@ static void qtd_list_free(struct list_head *qtd_list)
  * Packetize urb->transfer_buffer into list of packets of size wMaxPacketSize.
  * Also calculate the PID type (SETUP/IN/OUT) for each packet.
  */
-#define max_packet(wMaxPacketSize) ((wMaxPacketSize) & 0x07ff)
 static void packetize_urb(struct usb_hcd *hcd,
 		struct urb *urb, struct list_head *head, gfp_t flags)
 {
@@ -1809,8 +1808,8 @@ static void packetize_urb(struct usb_hcd *hcd,
 			packet_type = IN_PID;
 	}
 
-	maxpacketsize = max_packet(usb_maxpacket(urb->dev, urb->pipe,
-						usb_pipeout(urb->pipe)));
+	maxpacketsize = usb_maxpacket(urb->dev, urb->pipe,
+				      usb_pipeout(urb->pipe));
 
 	/*
 	 * buffer gets wrapped in one or more qtds;
-- 
2.34.1


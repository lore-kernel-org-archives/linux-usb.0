Return-Path: <linux-usb-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E3CBC6FA8F
	for <linux-usb@archiver.kernel.org>; Thu, 24 Aug 2023 16:46:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240733AbjHXQqG (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Thu, 24 Aug 2023 12:46:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43028 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242748AbjHXQqB (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 24 Aug 2023 12:46:01 -0400
Received: from mailout1.hostsharing.net (mailout1.hostsharing.net [IPv6:2a01:37:1000::53df:5fcc:0])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C90C310FE
        for <linux-usb@vger.kernel.org>; Thu, 24 Aug 2023 09:45:59 -0700 (PDT)
Received: from h08.hostsharing.net (h08.hostsharing.net [IPv6:2a01:37:1000::53df:5f1c:0])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256
         client-signature RSA-PSS (4096 bits) client-digest SHA256)
        (Client CN "*.hostsharing.net", Issuer "RapidSSL Global TLS RSA4096 SHA256 2022 CA1" (verified OK))
        by mailout1.hostsharing.net (Postfix) with ESMTPS id 246FE101920CB;
        Thu, 24 Aug 2023 18:45:58 +0200 (CEST)
Received: from localhost (unknown [89.246.108.87])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by h08.hostsharing.net (Postfix) with ESMTPSA id 00A5A603DADA;
        Thu, 24 Aug 2023 18:45:57 +0200 (CEST)
X-Mailbox-Line: From 6049bb86ed80691312dbaac50d219721717ef29e Mon Sep 17 00:00:00 2001
Message-Id: <6049bb86ed80691312dbaac50d219721717ef29e.1692892942.git.lukas@wunner.de>
In-Reply-To: <cover.1692892942.git.lukas@wunner.de>
References: <cover.1692892942.git.lukas@wunner.de>
From:   Lukas Wunner <lukas@wunner.de>
Date:   Thu, 24 Aug 2023 18:15:07 +0200
Subject: [PATCH v2 07/10] xhci: Expose segment numbers in debugfs
To:     Mathias Nyman <mathias.nyman@intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org,
        Jonathan Bell <jonathan@raspberrypi.org>,
        Phil Elwell <phil@raspberrypi.com>,
        Nicolas Saenz Julienne <nsaenz@kernel.org>,
        Stefan Wahren <stefan.wahren@i2se.com>,
        Philipp Rosenberger <p.rosenberger@kunbus.com>,
        Lino Sanfilippo <LinoSanfilippo@gmx.de>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Ring segments have just been amended with a monotonically increasing
number.

To allow developers to inspect the segment numbers and ensure
correctness in particular after ring expansion, expose them in each
ring's "trbs" file in debugfs.

Signed-off-by: Lukas Wunner <lukas@wunner.de>
---
 drivers/usb/host/xhci-debugfs.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/host/xhci-debugfs.c b/drivers/usb/host/xhci-debugfs.c
index 99baa60ef50f..6d142cd61bd6 100644
--- a/drivers/usb/host/xhci-debugfs.c
+++ b/drivers/usb/host/xhci-debugfs.c
@@ -204,7 +204,7 @@ static void xhci_ring_dump_segment(struct seq_file *s,
 	for (i = 0; i < TRBS_PER_SEGMENT; i++) {
 		trb = &seg->trbs[i];
 		dma = seg->dma + i * sizeof(*trb);
-		seq_printf(s, "%pad: %s\n", &dma,
+		seq_printf(s, "%2u %pad: %s\n", seg->num, &dma,
 			   xhci_decode_trb(str, XHCI_MSG_MAX, le32_to_cpu(trb->generic.field[0]),
 					   le32_to_cpu(trb->generic.field[1]),
 					   le32_to_cpu(trb->generic.field[2]),
-- 
2.39.2


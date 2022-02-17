Return-Path: <linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE09EC433EF
	for <linux-usb@archiver.kernel.org>; Thu, 17 Feb 2022 13:36:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237435AbiBQNgN (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Thu, 17 Feb 2022 08:36:13 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:43784 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236145AbiBQNgM (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 17 Feb 2022 08:36:12 -0500
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E42032AEDB0
        for <linux-usb@vger.kernel.org>; Thu, 17 Feb 2022 05:35:57 -0800 (PST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out1.suse.de (Postfix) with ESMTPS id A474821991;
        Thu, 17 Feb 2022 13:35:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
        t=1645104956; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
        bh=TGc4zK163Br4oJw2PySTPX78mkcYTNVIqSE9bsq6sZA=;
        b=JB2cBO2rx58cOkiJybyTiKjdJspVG+46puRh6RliJZvDGbWpKrcOVPpiljYgjBFqDe69Ed
        eN0fd+S2h0x91S81ljzTN6j28uYi0mBaZZKripsSqr3rGcwuROzfG3YlS+jztQ+YNFaUUN
        +1CJMXq0N2hRIdm+HYgGhxI5H5YNe4Q=
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 7E46C13C0D;
        Thu, 17 Feb 2022 13:35:56 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id OrQNHTxPDmJzIAAAMHmgww
        (envelope-from <oneukum@suse.com>); Thu, 17 Feb 2022 13:35:56 +0000
From:   Oliver Neukum <oneukum@suse.com>
To:     mathias.nyman@intel.com, linux-usb@vger.kernel.org
Cc:     Oliver Neukum <oneukum@suse.com>
Subject: [PATCH] xhci: omit mem read just after allocation of trb
Date:   Thu, 17 Feb 2022 14:35:49 +0100
Message-Id: <20220217133549.27961-1-oneukum@suse.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

This has been allocated just a few lines earlier with a
zalloc(). The value is known and "|=" is a waste of memory
cycles.

Signed-off-by: Oliver Neukum <oneukum@suse.com>
---
 drivers/usb/host/xhci-mem.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/host/xhci-mem.c b/drivers/usb/host/xhci-mem.c
index 0e312066c5c6..99a3ce689235 100644
--- a/drivers/usb/host/xhci-mem.c
+++ b/drivers/usb/host/xhci-mem.c
@@ -57,7 +57,7 @@ static struct xhci_segment *xhci_segment_alloc(struct xhci_hcd *xhci,
 	/* If the cycle state is 0, set the cycle bit to 1 for all the TRBs */
 	if (cycle_state == 0) {
 		for (i = 0; i < TRBS_PER_SEGMENT; i++)
-			seg->trbs[i].link.control |= cpu_to_le32(TRB_CYCLE);
+			seg->trbs[i].link.control = cpu_to_le32(TRB_CYCLE);
 	}
 	seg->dma = dma;
 	seg->next = NULL;
-- 
2.34.1


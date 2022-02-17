Return-Path: <linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C780C433F5
	for <linux-usb@archiver.kernel.org>; Thu, 17 Feb 2022 13:10:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240698AbiBQNLE (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Thu, 17 Feb 2022 08:11:04 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:48670 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237006AbiBQNLD (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 17 Feb 2022 08:11:03 -0500
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9464A2AE285;
        Thu, 17 Feb 2022 05:10:49 -0800 (PST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out1.suse.de (Postfix) with ESMTPS id 4A7CF2110B;
        Thu, 17 Feb 2022 13:10:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
        t=1645103448; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
        bh=0LDLjTNWLnYZMITaKhDb5tJJYHZI5a1TwIC1kbhLDgA=;
        b=CEq5GpQzvFTZtWGGSwa3xuQZCTt5w5rYtFUJissVlpRNEVQRG7xQbkdDdJ6Nfh3wNzuEvX
        pELHi37vVgnxkFuIyVS3L+s5a/kGr4LHAeKX6PAddDm5BvEWqqpUBn4x888p749M5E05w/
        I9VmCiOwY6VO3mWYcmM19MhhMHzVNTQ=
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id DE77713C02;
        Thu, 17 Feb 2022 13:10:47 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id ycSQNFdJDmJOEwAAMHmgww
        (envelope-from <oneukum@suse.com>); Thu, 17 Feb 2022 13:10:47 +0000
From:   Oliver Neukum <oneukum@suse.com>
To:     davem@davemloft.net, kuba@kernel.org, grundler@chromium.org,
        andrew@lunn.ch, jgg@ziepe.ca, linux-usb@vger.kernel.org,
        arnd@arndb.de, netdev@vger.kernel.org
Cc:     Oliver Neukum <oneukum@suse.com>
Subject: [PATCH] sr9700: sanity check for packet length
Date:   Thu, 17 Feb 2022 14:10:44 +0100
Message-Id: <20220217131044.26983-1-oneukum@suse.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

A malicious device can leak heap data to user space
providing bogus frame lengths. Introduce a sanity check.

Signed-off-by: Oliver Neukum <oneukum@suse.com>
---
 drivers/net/usb/sr9700.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/usb/sr9700.c b/drivers/net/usb/sr9700.c
index b658510cc9a4..5a53e63d33a6 100644
--- a/drivers/net/usb/sr9700.c
+++ b/drivers/net/usb/sr9700.c
@@ -413,7 +413,7 @@ static int sr9700_rx_fixup(struct usbnet *dev, struct sk_buff *skb)
 		/* ignore the CRC length */
 		len = (skb->data[1] | (skb->data[2] << 8)) - 4;
 
-		if (len > ETH_FRAME_LEN)
+		if (len > ETH_FRAME_LEN || len > skb->len)
 			return 0;
 
 		/* the last packet of current skb */
-- 
2.34.1


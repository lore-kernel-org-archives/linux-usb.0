Return-Path: <linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D69BC433F5
	for <linux-usb@archiver.kernel.org>; Tue, 15 Feb 2022 10:35:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236519AbiBOKgE (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Tue, 15 Feb 2022 05:36:04 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:41054 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229448AbiBOKgD (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 15 Feb 2022 05:36:03 -0500
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0FC1666214;
        Tue, 15 Feb 2022 02:35:51 -0800 (PST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out2.suse.de (Postfix) with ESMTPS id 922A01F382;
        Tue, 15 Feb 2022 10:35:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
        t=1644921350; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
        bh=bjQyZx2BeeeI92C3uWAw5ZaRVSGV8WLXWINZ2BNlaJ0=;
        b=eWOeofmUj2+bZNsQyINhNtZEIHsDDRl+A2+308j3wvqSBqbgPynjlu1LnjslstNwoyj0dt
        Z/Y//2qFUpZoBkzsBC8p3feRLCJifSGloMiFSOKFavQGuIbp4BAL1X+bSvbu3Paqq7qywg
        q9uNXuEUuc8kuAyFVHqn/dT+eAKBMBk=
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 5272913C16;
        Tue, 15 Feb 2022 10:35:50 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id +rBXEgaCC2I1IwAAMHmgww
        (envelope-from <oneukum@suse.com>); Tue, 15 Feb 2022 10:35:50 +0000
From:   Oliver Neukum <oneukum@suse.com>
To:     davem@davemloft.net, kuba@kernel.org, gregKH@linuxfoundation.org,
        netdev@vger.kernel.org, linux-usb@vger.kernel.org
Cc:     Oliver Neukum <oneukum@suse.com>
Subject: [PATCH] CDC-NCM: avoid overflow in sanity checking
Date:   Tue, 15 Feb 2022 11:35:47 +0100
Message-Id: <20220215103547.29599-1-oneukum@suse.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

A broken device may give an extreme offset like 0xFFF0
and a reasonable length for a fragment. In the sanity
check as formulated now, this will create an integer
overflow, defeating the sanity check. Both offset
and offset + len need to be checked in such a manner
that no overflow can occur.
And those quantities should be unsigned.

Signed-off-by: Oliver Neukum <oneukum@suse.com>
---
 drivers/net/usb/cdc_ncm.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/net/usb/cdc_ncm.c b/drivers/net/usb/cdc_ncm.c
index e303b522efb5..15f91d691bba 100644
--- a/drivers/net/usb/cdc_ncm.c
+++ b/drivers/net/usb/cdc_ncm.c
@@ -1715,10 +1715,10 @@ int cdc_ncm_rx_fixup(struct usbnet *dev, struct sk_buff *skb_in)
 {
 	struct sk_buff *skb;
 	struct cdc_ncm_ctx *ctx = (struct cdc_ncm_ctx *)dev->data[0];
-	int len;
+	unsigned int len;
 	int nframes;
 	int x;
-	int offset;
+	unsigned int offset;
 	union {
 		struct usb_cdc_ncm_ndp16 *ndp16;
 		struct usb_cdc_ncm_ndp32 *ndp32;
@@ -1790,8 +1790,8 @@ int cdc_ncm_rx_fixup(struct usbnet *dev, struct sk_buff *skb_in)
 			break;
 		}
 
-		/* sanity checking */
-		if (((offset + len) > skb_in->len) ||
+		/* sanity checking - watch out for integer wrap*/
+		if ((offset > skb_in->len) || (len > skb_in->len - offset) ||
 				(len > ctx->rx_max) || (len < ETH_HLEN)) {
 			netif_dbg(dev, rx_err, dev->net,
 				  "invalid frame detected (ignored) offset[%u]=%u, length=%u, skb=%p\n",
-- 
2.34.1


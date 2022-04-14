Return-Path: <linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31C65C433F5
	for <linux-usb@archiver.kernel.org>; Thu, 14 Apr 2022 11:02:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241091AbiDNLEi (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Thu, 14 Apr 2022 07:04:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35494 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238053AbiDNLEh (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 14 Apr 2022 07:04:37 -0400
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 367CE3C4B7
        for <linux-usb@vger.kernel.org>; Thu, 14 Apr 2022 04:02:13 -0700 (PDT)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out1.suse.de (Postfix) with ESMTPS id BB5F321616;
        Thu, 14 Apr 2022 11:02:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
        t=1649934131; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
        bh=q5TykUprMphVemzLHWKE3YzGn08eagQq5Z8QGXkgC2Q=;
        b=J+1seKhFCSWdV2pvvx84ma4lhNJZZ5I4os0IXxxBz0qf3Bz1sqdFoCP++MOVv0IA8kJhP/
        GHg+WWFdJgVC1XqOzHUQWnVMnW5l1+ohOW/hOJJn3GuzduYNpe48AfS0ngKPD10f5yPEms
        o/O12b0Qq5gamrtr++uNugNih0dv8WQ=
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 87CBB132C0;
        Thu, 14 Apr 2022 11:02:11 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id DYVhHzP/V2KaCwAAMHmgww
        (envelope-from <oneukum@suse.com>); Thu, 14 Apr 2022 11:02:11 +0000
From:   Oliver Neukum <oneukum@suse.com>
To:     linux-usb@vger.kernel.org, gregKH@linuxfoundation.org
Cc:     Oliver Neukum <oneukum@suse.com>
Subject: [PATCH] quirks: add a Realtek card reader
Date:   Thu, 14 Apr 2022 13:02:09 +0200
Message-Id: <20220414110209.30924-1-oneukum@suse.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

This device is reported to stall when enummerated.

Signed-off-by: Oliver Neukum <oneukum@suse.com>
---
 drivers/usb/core/quirks.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/usb/core/quirks.c b/drivers/usb/core/quirks.c
index d3c14b5ed4a1..8ce8c0d06c66 100644
--- a/drivers/usb/core/quirks.c
+++ b/drivers/usb/core/quirks.c
@@ -404,6 +404,9 @@ static const struct usb_device_id usb_quirk_list[] = {
 	{ USB_DEVICE(0x0b05, 0x17e0), .driver_info =
 			USB_QUIRK_IGNORE_REMOTE_WAKEUP },
 
+	/* Realtek Semiconductor Corp. Mass Storage Device (Multicard Reader)*/
+	{ USB_DEVICE(0x0bda, 0x0151), .driver_info = USB_QUIRK_CONFIG_INTF_STRINGS },
+
 	/* Realtek hub in Dell WD19 (Type-C) */
 	{ USB_DEVICE(0x0bda, 0x0487), .driver_info = USB_QUIRK_NO_LPM },
 
-- 
2.34.1


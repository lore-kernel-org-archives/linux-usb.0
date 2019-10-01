Return-Path: <SRS0=EQXy=X2=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35B7BC352AA
	for <linux-usb@archiver.kernel.org>; Tue,  1 Oct 2019 16:57:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 00E7221783
	for <linux-usb@archiver.kernel.org>; Tue,  1 Oct 2019 16:57:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1569949036;
	bh=hDT39oXpPfsh9HY8HnQFrhdfgpcobOmZ6jTV4HOfkBs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-ID:From;
	b=vhIpfKB+ImQcvk4UxXakSgqMt/1dv9mlz7AY0DZUqWbKxRKnlDIc9qkdpX9kJFZ+3
	 +HU4GyYS31BCexuRpkuzCo0QbO0Ym+s7ep4gC5Pg8geJD6dyikZA27El9l3BpjA8nj
	 MjVWft4cwmK3RHnh6BqRCcHg7Yd6Mw85aVpEOiSY=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730693AbfJAQ5G (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Tue, 1 Oct 2019 12:57:06 -0400
Received: from mail.kernel.org ([198.145.29.99]:53742 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731527AbfJAQl7 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 1 Oct 2019 12:41:59 -0400
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net [73.47.72.35])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id F39C921855;
        Tue,  1 Oct 2019 16:41:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1569948118;
        bh=hDT39oXpPfsh9HY8HnQFrhdfgpcobOmZ6jTV4HOfkBs=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=sO9Vr5EqyIzWNOEqtkahYzonwn+i3I7/pOAeVwikrC3TGhFB+WEe3r4MosqQgcuzZ
         nquXZeHqrcqox4lz7SM5B9pWMNUOviajxyCMvT2LGFVXM1L8ED3qppj+sWmDDeY1sw
         BEsO3c4Egk+xxLq04t8ewElEjL7617reOEOb5UTc=
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     =?UTF-8?q?Bj=C3=B8rn=20Mork?= <bjorn@mork.no>,
        syzbot+ce366e2b8296e25d84f5@syzkaller.appspotmail.com,
        Jakub Kicinski <jakub.kicinski@netronome.com>,
        Sasha Levin <sashal@kernel.org>, linux-usb@vger.kernel.org,
        netdev@vger.kernel.org
Subject: [PATCH AUTOSEL 5.2 24/63] cdc_ncm: fix divide-by-zero caused by invalid wMaxPacketSize
Date:   Tue,  1 Oct 2019 12:40:46 -0400
Message-Id: <20191001164125.15398-24-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191001164125.15398-1-sashal@kernel.org>
References: <20191001164125.15398-1-sashal@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Bjørn Mork <bjorn@mork.no>

[ Upstream commit 3fe4b3351301660653a2bc73f2226da0ebd2b95e ]

Endpoints with zero wMaxPacketSize are not usable for transferring
data. Ignore such endpoints when looking for valid in, out and
status pipes, to make the driver more robust against invalid and
meaningless descriptors.

The wMaxPacketSize of the out pipe is used as divisor. So this change
fixes a divide-by-zero bug.

Reported-by: syzbot+ce366e2b8296e25d84f5@syzkaller.appspotmail.com
Signed-off-by: Bjørn Mork <bjorn@mork.no>
Signed-off-by: Jakub Kicinski <jakub.kicinski@netronome.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/net/usb/cdc_ncm.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/net/usb/cdc_ncm.c b/drivers/net/usb/cdc_ncm.c
index 50c05d0f44cb3..00cab3f43a4ca 100644
--- a/drivers/net/usb/cdc_ncm.c
+++ b/drivers/net/usb/cdc_ncm.c
@@ -681,8 +681,12 @@ cdc_ncm_find_endpoints(struct usbnet *dev, struct usb_interface *intf)
 	u8 ep;
 
 	for (ep = 0; ep < intf->cur_altsetting->desc.bNumEndpoints; ep++) {
-
 		e = intf->cur_altsetting->endpoint + ep;
+
+		/* ignore endpoints which cannot transfer data */
+		if (!usb_endpoint_maxp(&e->desc))
+			continue;
+
 		switch (e->desc.bmAttributes & USB_ENDPOINT_XFERTYPE_MASK) {
 		case USB_ENDPOINT_XFER_INT:
 			if (usb_endpoint_dir_in(&e->desc)) {
-- 
2.20.1


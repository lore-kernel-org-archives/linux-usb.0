Return-Path: <linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A42DEC6FA82
	for <linux-usb@archiver.kernel.org>; Mon,  5 Sep 2022 01:02:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234311AbiIEBCX (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Sun, 4 Sep 2022 21:02:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39786 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229702AbiIEBCW (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 4 Sep 2022 21:02:22 -0400
Received: from unicom146.biz-email.net (unicom146.biz-email.net [210.51.26.146])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2C37219288;
        Sun,  4 Sep 2022 18:02:20 -0700 (PDT)
Received: from ([60.208.111.195])
        by unicom146.biz-email.net ((D)) with ASMTP (SSL) id ZAH00116;
        Mon, 05 Sep 2022 09:02:16 +0800
Received: from guoweibin00.home.langchao.com (10.180.162.54) by
 Jtjnmail201614.home.langchao.com (10.100.2.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Mon, 5 Sep 2022 09:02:15 +0800
Date:   Mon, 5 Sep 2022 09:02:12 +0800
From:   guoweibin <guoweibin@inspur.com>
To:     "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>
CC:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: [PATCH] usb: musb: Fix musb_gadget.c rxstate overflow bug
Message-ID: <20220905090212.f0118580ec37bf0aababb53d@inspur.com>
X-Mailer: Sylpheed 3.7.0beta1 (GTK+ 2.24.30; i686-pc-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.180.162.54]
X-ClientProxiedBy: Jtjnmail201615.home.langchao.com (10.100.2.15) To
 Jtjnmail201614.home.langchao.com (10.100.2.14)
tUid:   202290509021662a3e525d8cc98769b5b2a0e91bcf34c
X-Abuse-Reports-To: service@corp-email.com
Abuse-Reports-To: service@corp-email.com
X-Complaints-To: service@corp-email.com
X-Report-Abuse-To: service@corp-email.com
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: guoweibin <guoweibin@inspur.com>
Date: Mon, 25 Jul 2022 19:27:49 +0800
Subject: [PATCH] usb: musb: Fix musb_gadget.c rxstate overflow bug

when the rxstate function executes the 'goto buffer_aint_mapped' code
branch, it will always copy the fifocnt bytes data to request->buf,
which may cause request->buf out of bounds..

Fix it by add the length check :
fifocnt = min_t(unsigned, request->length - request->actual, fifocnt);

Signed-off-by: guoweibin <guoweibin@inspur.com>
---
 drivers/usb/musb/musb_gadget.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/usb/musb/musb_gadget.c b/drivers/usb/musb/musb_gadget.c
index 51274b87f46c..dc67fff8e941 100644
--- a/drivers/usb/musb/musb_gadget.c
+++ b/drivers/usb/musb/musb_gadget.c
@@ -760,6 +760,9 @@ static void rxstate(struct musb *musb, struct musb_request *req)
 			musb_writew(epio, MUSB_RXCSR, csr);
 
 buffer_aint_mapped:
+			fifo_count = min_t(unsigned int,
+					request->length - request->actual,
+					(unsigned int)fifo_count);
 			musb_read_fifo(musb_ep->hw_ep, fifo_count, (u8 *)
 					(request->buf + request->actual));
 			request->actual += fifo_count;
-- 
2.17.1

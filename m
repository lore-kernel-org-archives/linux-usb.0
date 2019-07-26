Return-Path: <SRS0=r4gL=VX=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5F7DC76190
	for <linux-usb@archiver.kernel.org>; Fri, 26 Jul 2019 05:06:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id AA0CC21734
	for <linux-usb@archiver.kernel.org>; Fri, 26 Jul 2019 05:06:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726087AbfGZFGP (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Fri, 26 Jul 2019 01:06:15 -0400
Received: from gate.crashing.org ([63.228.1.57]:51682 "EHLO gate.crashing.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725836AbfGZFGO (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 26 Jul 2019 01:06:14 -0400
Received: from ufdda393ec48b57.ant.amazon.com (localhost.localdomain [127.0.0.1])
        by gate.crashing.org (8.14.1/8.14.1) with ESMTP id x6Q55j3X017580;
        Fri, 26 Jul 2019 00:06:08 -0500
From:   Benjamin Herrenschmidt <benh@kernel.crashing.org>
To:     Linux USB List <linux-usb@vger.kernel.org>
Cc:     Felipe Balbi <felipe.balbi@linux.intel.com>,
        Alan Stern <stern@rowland.harvard.edu>,
        Greg KH <gregkh@linuxfoundation.org>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>
Subject: [PATCH v3 09/10] usb: Add definitions for the USB2.0 hub TT requests
Date:   Fri, 26 Jul 2019 15:05:38 +1000
Message-Id: <20190726050539.7875-10-benh@kernel.crashing.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190726050539.7875-1-benh@kernel.crashing.org>
References: <20190726050539.7875-1-benh@kernel.crashing.org>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Signed-off-by: Benjamin Herrenschmidt <benh@kernel.crashing.org>
---
 include/linux/usb/hcd.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/include/linux/usb/hcd.h b/include/linux/usb/hcd.h
index bab27ccc8ff5..367f9b39ac56 100644
--- a/include/linux/usb/hcd.h
+++ b/include/linux/usb/hcd.h
@@ -591,6 +591,10 @@ extern void usb_ep0_reinit(struct usb_device *);
 #define GetPortStatus		HUB_CLASS_REQ(USB_DIR_IN, USB_RT_PORT, USB_REQ_GET_STATUS)
 #define SetHubFeature		HUB_CLASS_REQ(USB_DIR_OUT, USB_RT_HUB, USB_REQ_SET_FEATURE)
 #define SetPortFeature		HUB_CLASS_REQ(USB_DIR_OUT, USB_RT_PORT, USB_REQ_SET_FEATURE)
+#define ClearTTBuffer		HUB_CLASS_REQ(USB_DIR_OUT, USB_RT_PORT, HUB_CLEAR_TT_BUFFER)
+#define ResetTT			HUB_CLASS_REQ(USB_DIR_OUT, USB_RT_PORT, HUB_RESET_TT)
+#define GetTTState		HUB_CLASS_REQ(USB_DIR_IN, USB_RT_PORT, HUB_GET_TT_STATE)
+#define StopTT			HUB_CLASS_REQ(USB_DIR_OUT, USB_RT_PORT, HUB_STOP_TT)
 
 
 /*-------------------------------------------------------------------------*/
-- 
2.17.1


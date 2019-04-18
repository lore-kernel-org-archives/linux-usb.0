Return-Path: <SRS0=JW0E=SU=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.9 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0FE88C10F0E
	for <linux-usb@archiver.kernel.org>; Thu, 18 Apr 2019 15:28:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id C9A6520869
	for <linux-usb@archiver.kernel.org>; Thu, 18 Apr 2019 15:28:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388457AbfDRP2k (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Thu, 18 Apr 2019 11:28:40 -0400
Received: from szxga04-in.huawei.com ([45.249.212.190]:6645 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S2388299AbfDRP2k (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 18 Apr 2019 11:28:40 -0400
Received: from DGGEMS410-HUB.china.huawei.com (unknown [172.30.72.59])
        by Forcepoint Email with ESMTP id 35162D8CB0041C3F437E;
        Thu, 18 Apr 2019 23:28:32 +0800 (CST)
Received: from suse12-sp2.huawei.com (10.67.189.94) by
 DGGEMS410-HUB.china.huawei.com (10.3.19.210) with Microsoft SMTP Server id
 14.3.408.0; Thu, 18 Apr 2019 23:28:23 +0800
From:   zhuyan <zhuyan34@huawei.com>
To:     <stern@rowland.harvard.edu>, <gregkh@linuxfoundation.org>,
        <zhuyan34@huawei.com>
CC:     <anton@enomsg.org>, <linux-usb@vger.kernel.org>
Subject: [PATCH v3] usb: host: use usb_endpoint_maxp instead of usb_maxpacket
Date:   Thu, 18 Apr 2019 23:25:21 +0800
Message-ID: <1555601121-81611-1-git-send-email-zhuyan34@huawei.com>
X-Mailer: git-send-email 1.8.5.6
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-Originating-IP: [10.67.189.94]
X-CFilter-Loop: Reflected
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org
Message-ID: <20190418152521.lRe5FRNME726J5QGvym5eFCuPGQ3t96RAuE6EQbZO4s@z>

From: Yan Zhu <zhuyan34@huawei.com>

fhci_queue_urb() shouldn't use urb->pipe to compute the maxpacket
size anyway.It should use usb_endpoint_maxp(&urb->ep->desc).

Signed-off-by: Yan Zhu <zhuyan34@huawei.com>
---
 drivers/usb/host/fhci-sched.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/drivers/usb/host/fhci-sched.c b/drivers/usb/host/fhci-sched.c
index 3d12cdd..3235d53 100644
--- a/drivers/usb/host/fhci-sched.c
+++ b/drivers/usb/host/fhci-sched.c
@@ -727,8 +727,7 @@ void fhci_queue_urb(struct fhci_hcd *fhci, struct urb *urb)
 		}
 		ed->speed = (urb->dev->speed == USB_SPEED_LOW) ?
 			FHCI_LOW_SPEED : FHCI_FULL_SPEED;
-		ed->max_pkt_size = usb_maxpacket(urb->dev,
-			urb->pipe, usb_pipeout(urb->pipe));
+		ed->max_pkt_size = usb_endpoint_maxp(&urb->ep->desc);
 		urb->ep->hcpriv = ed;
 		fhci_dbg(fhci, "new ep speed=%d max_pkt_size=%d\n",
 			 ed->speed, ed->max_pkt_size);
@@ -768,8 +767,7 @@ void fhci_queue_urb(struct fhci_hcd *fhci, struct urb *urb)
 		if (urb->transfer_flags & URB_ZERO_PACKET &&
 				urb->transfer_buffer_length > 0 &&
 				((urb->transfer_buffer_length %
-				usb_maxpacket(urb->dev, urb->pipe,
-				usb_pipeout(urb->pipe))) == 0))
+				usb_endpoint_maxp(&urb->ep->desc)) == 0))
 			urb_state = US_BULK0;
 		while (data_len > 4096) {
 			td = fhci_td_fill(fhci, urb, urb_priv, ed, cnt,
@@ -807,8 +805,8 @@ void fhci_queue_urb(struct fhci_hcd *fhci, struct urb *urb)
 		break;
 	case FHCI_TF_CTRL:
 		ed->dev_addr = usb_pipedevice(urb->pipe);
-		ed->max_pkt_size = usb_maxpacket(urb->dev, urb->pipe,
-			usb_pipeout(urb->pipe));
+		ed->max_pkt_size = usb_endpoint_maxp(&urb->ep->desc);
+
 		/* setup stage */
 		td = fhci_td_fill(fhci, urb, urb_priv, ed, cnt++, FHCI_TA_SETUP,
 			USB_TD_TOGGLE_DATA0, urb->setup_packet, 8, 0, 0, true);
-- 
1.8.5.6


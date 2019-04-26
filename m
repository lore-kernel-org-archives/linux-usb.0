Return-Path: <SRS0=7cGN=S4=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.9 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 962D9C43218
	for <linux-usb@archiver.kernel.org>; Fri, 26 Apr 2019 13:21:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 72F822077B
	for <linux-usb@archiver.kernel.org>; Fri, 26 Apr 2019 13:21:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726267AbfDZNVP (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Fri, 26 Apr 2019 09:21:15 -0400
Received: from mga03.intel.com ([134.134.136.65]:37102 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726138AbfDZNVO (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 26 Apr 2019 09:21:14 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 26 Apr 2019 06:21:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.60,397,1549958400"; 
   d="scan'208";a="168185698"
Received: from mattu-haswell.fi.intel.com ([10.237.72.164])
  by fmsmga001.fm.intel.com with ESMTP; 26 Apr 2019 06:21:13 -0700
From:   Mathias Nyman <mathias.nyman@linux.intel.com>
To:     <gregkh@linuxfoundation.org>
Cc:     <linux-usb@vger.kernel.org>,
        Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH 3/4] xhci: Add tracing for input control context
Date:   Fri, 26 Apr 2019 16:23:31 +0300
Message-Id: <1556285012-28186-4-git-send-email-mathias.nyman@linux.intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1556285012-28186-1-git-send-email-mathias.nyman@linux.intel.com>
References: <1556285012-28186-1-git-send-email-mathias.nyman@linux.intel.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190426132331.zWm3D1uwRGGesuOXwUbswjs_vU3RzsuO1ALRsWilRj4@z>

Add tracing for the add and drop bits in the input control context
used in Address device, configure endpoint, evaluate context commands.

The add and drop bits tell xHC which enpoints are added and dropped.

Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
---
 drivers/usb/host/xhci-trace.h | 25 +++++++++++++++++++++++++
 drivers/usb/host/xhci.c       |  3 +++
 drivers/usb/host/xhci.h       | 29 +++++++++++++++++++++++++++++
 3 files changed, 57 insertions(+)

diff --git a/drivers/usb/host/xhci-trace.h b/drivers/usb/host/xhci-trace.h
index 88b4274..9b0e641 100644
--- a/drivers/usb/host/xhci-trace.h
+++ b/drivers/usb/host/xhci-trace.h
@@ -432,6 +432,31 @@ DEFINE_EVENT(xhci_log_slot_ctx, xhci_configure_endpoint,
 	TP_ARGS(ctx)
 );
 
+DECLARE_EVENT_CLASS(xhci_log_ctrl_ctx,
+	TP_PROTO(struct xhci_input_control_ctx *ctrl_ctx),
+	TP_ARGS(ctrl_ctx),
+	TP_STRUCT__entry(
+		__field(u32, drop)
+		__field(u32, add)
+	),
+	TP_fast_assign(
+		__entry->drop = le32_to_cpu(ctrl_ctx->drop_flags);
+		__entry->add = le32_to_cpu(ctrl_ctx->add_flags);
+	),
+	TP_printk("%s", xhci_decode_ctrl_ctx(__entry->drop, __entry->add)
+	)
+);
+
+DEFINE_EVENT(xhci_log_ctrl_ctx, xhci_address_ctrl_ctx,
+	TP_PROTO(struct xhci_input_control_ctx *ctrl_ctx),
+	TP_ARGS(ctrl_ctx)
+);
+
+DEFINE_EVENT(xhci_log_ctrl_ctx, xhci_configure_endpoint_ctrl_ctx,
+	TP_PROTO(struct xhci_input_control_ctx *ctrl_ctx),
+	TP_ARGS(ctrl_ctx)
+);
+
 DECLARE_EVENT_CLASS(xhci_log_ring,
 	TP_PROTO(struct xhci_ring *ring),
 	TP_ARGS(ring),
diff --git a/drivers/usb/host/xhci.c b/drivers/usb/host/xhci.c
index cdccbdf..2ab76a5 100644
--- a/drivers/usb/host/xhci.c
+++ b/drivers/usb/host/xhci.c
@@ -2771,6 +2771,8 @@ static int xhci_configure_endpoint(struct xhci_hcd *xhci,
 	}
 
 	slot_ctx = xhci_get_slot_ctx(xhci, command->in_ctx);
+
+	trace_xhci_configure_endpoint_ctrl_ctx(ctrl_ctx);
 	trace_xhci_configure_endpoint(slot_ctx);
 
 	if (!ctx_change)
@@ -4036,6 +4038,7 @@ static int xhci_setup_device(struct usb_hcd *hcd, struct usb_device *udev,
 	trace_xhci_address_ctx(xhci, virt_dev->in_ctx,
 				le32_to_cpu(slot_ctx->dev_info) >> 27);
 
+	trace_xhci_address_ctrl_ctx(ctrl_ctx);
 	spin_lock_irqsave(&xhci->lock, flags);
 	trace_xhci_setup_device(virt_dev);
 	ret = xhci_queue_address_device(xhci, command, virt_dev->in_ctx->dma,
diff --git a/drivers/usb/host/xhci.h b/drivers/usb/host/xhci.h
index abbd481..a450a99 100644
--- a/drivers/usb/host/xhci.h
+++ b/drivers/usb/host/xhci.h
@@ -2401,6 +2401,35 @@ static inline const char *xhci_decode_trb(u32 field0, u32 field1, u32 field2,
 	return str;
 }
 
+static inline const char *xhci_decode_ctrl_ctx(unsigned long drop,
+					       unsigned long add)
+{
+	static char	str[1024];
+	unsigned int	bit;
+	int		ret = 0;
+
+	if (drop) {
+		ret = sprintf(str, "Drop:");
+		for_each_set_bit(bit, &drop, 32)
+			ret += sprintf(str + ret, " %d%s",
+				       bit / 2,
+				       bit % 2 ? "in":"out");
+		ret += sprintf(str + ret, ", ");
+	}
+
+	if (add) {
+		ret += sprintf(str + ret, "Add:%s%s",
+			       (add & SLOT_FLAG) ? " slot":"",
+			       (add & EP0_FLAG) ? " ep0":"");
+		add &= ~(SLOT_FLAG | EP0_FLAG);
+		for_each_set_bit(bit, &add, 32)
+			ret += sprintf(str + ret, " %d%s",
+				       bit / 2,
+				       bit % 2 ? "in":"out");
+	}
+	return str;
+}
+
 static inline const char *xhci_decode_slot_context(u32 info, u32 info2,
 		u32 tt_info, u32 state)
 {
-- 
2.7.4


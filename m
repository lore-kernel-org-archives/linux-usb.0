Return-Path: <SRS0=7cGN=S4=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.9 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9213AC43218
	for <linux-usb@archiver.kernel.org>; Fri, 26 Apr 2019 13:21:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 60E432077B
	for <linux-usb@archiver.kernel.org>; Fri, 26 Apr 2019 13:21:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726295AbfDZNVQ (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Fri, 26 Apr 2019 09:21:16 -0400
Received: from mga03.intel.com ([134.134.136.65]:37102 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726138AbfDZNVQ (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 26 Apr 2019 09:21:16 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 26 Apr 2019 06:21:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.60,397,1549958400"; 
   d="scan'208";a="168185702"
Received: from mattu-haswell.fi.intel.com ([10.237.72.164])
  by fmsmga001.fm.intel.com with ESMTP; 26 Apr 2019 06:21:15 -0700
From:   Mathias Nyman <mathias.nyman@linux.intel.com>
To:     <gregkh@linuxfoundation.org>
Cc:     <linux-usb@vger.kernel.org>,
        Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH 4/4] usb: xhci: add endpoint context tracing when an endpoint is added
Date:   Fri, 26 Apr 2019 16:23:32 +0300
Message-Id: <1556285012-28186-5-git-send-email-mathias.nyman@linux.intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1556285012-28186-1-git-send-email-mathias.nyman@linux.intel.com>
References: <1556285012-28186-1-git-send-email-mathias.nyman@linux.intel.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190426132332.QHNe7Gw89F6RW038TTZkQqUzx-6vto6OGae2O4hfiQ4@z>

The configure endpoint command configures all the endpoints that were
flagged to be added or dropped.

To know the content of each of the added endpoints we need to add tracing
to the .add_endpoint() callback, just after initializing all the context
values.

Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
---
 drivers/usb/host/xhci-trace.h | 5 +++++
 drivers/usb/host/xhci.c       | 4 ++++
 2 files changed, 9 insertions(+)

diff --git a/drivers/usb/host/xhci-trace.h b/drivers/usb/host/xhci-trace.h
index 9b0e641..052a269 100644
--- a/drivers/usb/host/xhci-trace.h
+++ b/drivers/usb/host/xhci-trace.h
@@ -366,6 +366,11 @@ DEFINE_EVENT(xhci_log_ep_ctx, xhci_handle_cmd_config_ep,
 	TP_ARGS(ctx)
 );
 
+DEFINE_EVENT(xhci_log_ep_ctx, xhci_add_endpoint,
+	TP_PROTO(struct xhci_ep_ctx *ctx),
+	TP_ARGS(ctx)
+);
+
 DECLARE_EVENT_CLASS(xhci_log_slot_ctx,
 	TP_PROTO(struct xhci_slot_ctx *ctx),
 	TP_ARGS(ctx),
diff --git a/drivers/usb/host/xhci.c b/drivers/usb/host/xhci.c
index 2ab76a5..a9bb796 100644
--- a/drivers/usb/host/xhci.c
+++ b/drivers/usb/host/xhci.c
@@ -1807,6 +1807,7 @@ static int xhci_add_endpoint(struct usb_hcd *hcd, struct usb_device *udev,
 	struct xhci_container_ctx *in_ctx;
 	unsigned int ep_index;
 	struct xhci_input_control_ctx *ctrl_ctx;
+	struct xhci_ep_ctx *ep_ctx;
 	u32 added_ctxs;
 	u32 new_add_flags, new_drop_flags;
 	struct xhci_virt_device *virt_dev;
@@ -1897,6 +1898,9 @@ static int xhci_add_endpoint(struct usb_hcd *hcd, struct usb_device *udev,
 	/* Store the usb_device pointer for later use */
 	ep->hcpriv = udev;
 
+	ep_ctx = xhci_get_ep_ctx(xhci, virt_dev->in_ctx, ep_index);
+	trace_xhci_add_endpoint(ep_ctx);
+
 	xhci_debugfs_create_endpoint(xhci, virt_dev, ep_index);
 
 	xhci_dbg(xhci, "add ep 0x%x, slot id %d, new drop flags = %#x, new add flags = %#x\n",
-- 
2.7.4


Return-Path: <SRS0=Rs4M=45=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB91CC10DCE
	for <linux-usb@archiver.kernel.org>; Thu, 12 Mar 2020 14:43:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id AC64F20724
	for <linux-usb@archiver.kernel.org>; Thu, 12 Mar 2020 14:43:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727758AbgCLOnC (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Thu, 12 Mar 2020 10:43:02 -0400
Received: from mga09.intel.com ([134.134.136.24]:50332 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727753AbgCLOnB (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 12 Mar 2020 10:43:01 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 12 Mar 2020 07:43:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,545,1574150400"; 
   d="scan'208";a="443955773"
Received: from mattu-haswell.fi.intel.com ([10.237.72.170])
  by fmsmga006.fm.intel.com with ESMTP; 12 Mar 2020 07:43:00 -0700
From:   Mathias Nyman <mathias.nyman@linux.intel.com>
To:     <gregkh@linuxfoundation.org>
Cc:     <linux-usb@vger.kernel.org>,
        Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH 2/9] xhci: Add a separate debug message for split transaction errors.
Date:   Thu, 12 Mar 2020 16:45:10 +0200
Message-Id: <20200312144517.1593-3-mathias.nyman@linux.intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200312144517.1593-1-mathias.nyman@linux.intel.com>
References: <20200312144517.1593-1-mathias.nyman@linux.intel.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Don't show the same error message for transaction errors and split
transaction errors. It's very confusing while debugging.

Transaction errors are often due to electrical interference.
Split transaction errors are about xHC not being able to
schedule start and complete split transactions needed to address
low- and full-speed devices behind high-speed hubs.

Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
---
 drivers/usb/host/xhci-ring.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
index d23f7408c81f..efcddc0c0991 100644
--- a/drivers/usb/host/xhci-ring.c
+++ b/drivers/usb/host/xhci-ring.c
@@ -2413,6 +2413,10 @@ static int handle_tx_event(struct xhci_hcd *xhci,
 		status = -EPIPE;
 		break;
 	case COMP_SPLIT_TRANSACTION_ERROR:
+		xhci_dbg(xhci, "Split transaction error for slot %u ep %u\n",
+			 slot_id, ep_index);
+		status = -EPROTO;
+		break;
 	case COMP_USB_TRANSACTION_ERROR:
 		xhci_dbg(xhci, "Transfer error for slot %u ep %u on endpoint\n",
 			 slot_id, ep_index);
-- 
2.17.1


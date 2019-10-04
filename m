Return-Path: <SRS0=WE58=X5=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48877C47404
	for <linux-usb@archiver.kernel.org>; Fri,  4 Oct 2019 11:57:49 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 1B8AF20862
	for <linux-usb@archiver.kernel.org>; Fri,  4 Oct 2019 11:57:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730144AbfJDL5s (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Fri, 4 Oct 2019 07:57:48 -0400
Received: from mga14.intel.com ([192.55.52.115]:33448 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726002AbfJDL5s (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 4 Oct 2019 07:57:48 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 04 Oct 2019 04:57:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.67,256,1566889200"; 
   d="scan'208";a="186229447"
Received: from mattu-haswell.fi.intel.com ([10.237.72.170])
  by orsmga008.jf.intel.com with ESMTP; 04 Oct 2019 04:57:45 -0700
From:   Mathias Nyman <mathias.nyman@linux.intel.com>
To:     <gregkh@linuxfoundation.org>
Cc:     <linux-usb@vger.kernel.org>, Rick Tseng <rtseng@nvidia.com>,
        stable@vger.kernel.org,
        Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH 5/8] usb: xhci: wait for CNR controller not ready bit in xhci resume
Date:   Fri,  4 Oct 2019 14:59:30 +0300
Message-Id: <1570190373-30684-6-git-send-email-mathias.nyman@linux.intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1570190373-30684-1-git-send-email-mathias.nyman@linux.intel.com>
References: <1570190373-30684-1-git-send-email-mathias.nyman@linux.intel.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Rick Tseng <rtseng@nvidia.com>

NVIDIA 3.1 xHCI card would lose power when moving power state into D3Cold.
Thus we need to wait for CNR bit to clear in xhci resume, just as in
xhci init.

[Minor changes to comment and commit message -Mathias]
Cc: <stable@vger.kernel.org>
Signed-off-by: Rick Tseng <rtseng@nvidia.com>
Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
---
 drivers/usb/host/xhci.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/usb/host/xhci.c b/drivers/usb/host/xhci.c
index aec69d294973..fe8f9ff58015 100644
--- a/drivers/usb/host/xhci.c
+++ b/drivers/usb/host/xhci.c
@@ -1108,6 +1108,18 @@ int xhci_resume(struct xhci_hcd *xhci, bool hibernated)
 		hibernated = true;
 
 	if (!hibernated) {
+		/*
+		 * Some controllers might lose power during suspend, so wait
+		 * for controller not ready bit to clear, just as in xHC init.
+		 */
+		retval = xhci_handshake(&xhci->op_regs->status,
+					STS_CNR, 0, 10 * 1000 * 1000);
+		if (retval) {
+			xhci_warn(xhci, "Controller not ready at resume %d\n",
+				  retval);
+			spin_unlock_irq(&xhci->lock);
+			return retval;
+		}
 		/* step 1: restore register */
 		xhci_restore_registers(xhci);
 		/* step 2: initialize command ring buffer */
-- 
2.7.4


Return-Path: <linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E7A4C433E0
	for <linux-usb@archiver.kernel.org>; Fri, 15 Jan 2021 16:19:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D13D3238EB
	for <linux-usb@archiver.kernel.org>; Fri, 15 Jan 2021 16:19:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729384AbhAOQTI (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Fri, 15 Jan 2021 11:19:08 -0500
Received: from mga07.intel.com ([134.134.136.100]:57456 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728020AbhAOQTI (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 15 Jan 2021 11:19:08 -0500
IronPort-SDR: 7Ewwgms6leusm5vbtesLgWw8ZNJO863fumzBrFpG5W1ZYaoII0ek8sq0jJXttW+AwSzio4JDrS
 a/K8e8bZhUwA==
X-IronPort-AV: E=McAfee;i="6000,8403,9864"; a="242638645"
X-IronPort-AV: E=Sophos;i="5.79,349,1602572400"; 
   d="scan'208";a="242638645"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jan 2021 08:17:16 -0800
IronPort-SDR: xPNZdf8OhXGDQE59eTSTCMhCOSqjrvK7p5k3EBoIwcsYfjFRHJ/saomieipw2JrLiXpdUFs3yg
 JNb5bKq+XlKg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.79,349,1602572400"; 
   d="scan'208";a="465626805"
Received: from mattu-haswell.fi.intel.com ([10.237.72.170])
  by fmsmga001.fm.intel.com with ESMTP; 15 Jan 2021 08:17:15 -0800
From:   Mathias Nyman <mathias.nyman@linux.intel.com>
To:     <gregkh@linuxfoundation.org>
Cc:     <linux-usb@vger.kernel.org>,
        Mathias Nyman <mathias.nyman@linux.intel.com>,
        stable@vger.kernel.org, Ross Zwisler <zwisler@google.com>
Subject: [PATCH 1/2] xhci: make sure TRB is fully written before giving it to the controller
Date:   Fri, 15 Jan 2021 18:19:06 +0200
Message-Id: <20210115161907.2875631-2-mathias.nyman@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210115161907.2875631-1-mathias.nyman@linux.intel.com>
References: <20210115161907.2875631-1-mathias.nyman@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Once the command ring doorbell is rung the xHC controller will parse all
command TRBs on the command ring that have the cycle bit set properly.

If the driver just started writing the next command TRB to the ring when
hardware finished the previous TRB, then HW might fetch an incomplete TRB
as long as its cycle bit set correctly.

A command TRB is 16 bytes (128 bits) long.
Driver writes the command TRB in four 32 bit chunks, with the chunk
containing the cycle bit last. This does however not guarantee that
chunks actually get written in that order.

This was detected in stress testing when canceling URBs with several
connected USB devices.
Two consecutive "Set TR Dequeue pointer" commands got queued right
after each other, and the second one was only partially written when
the controller parsed it, causing the dequeue pointer to be set
to bogus values. This was seen as error messages:

"Mismatch between completed Set TR Deq Ptr command & xHCI internal state"

Solution is to add a write memory barrier before writing the cycle bit.

Cc: <stable@vger.kernel.org>
Tested-by: Ross Zwisler <zwisler@google.com>
Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
---
 drivers/usb/host/xhci-ring.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
index 5677b81c0915..cf0c93a90200 100644
--- a/drivers/usb/host/xhci-ring.c
+++ b/drivers/usb/host/xhci-ring.c
@@ -2931,6 +2931,8 @@ static void queue_trb(struct xhci_hcd *xhci, struct xhci_ring *ring,
 	trb->field[0] = cpu_to_le32(field1);
 	trb->field[1] = cpu_to_le32(field2);
 	trb->field[2] = cpu_to_le32(field3);
+	/* make sure TRB is fully written before giving it to the controller */
+	wmb();
 	trb->field[3] = cpu_to_le32(field4);
 
 	trace_xhci_queue_trb(ring, trb);
-- 
2.25.1


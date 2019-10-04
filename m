Return-Path: <SRS0=WE58=X5=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C854C47404
	for <linux-usb@archiver.kernel.org>; Fri,  4 Oct 2019 11:57:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 3A3A020862
	for <linux-usb@archiver.kernel.org>; Fri,  4 Oct 2019 11:57:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730329AbfJDL5y (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Fri, 4 Oct 2019 07:57:54 -0400
Received: from mga14.intel.com ([192.55.52.115]:33448 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726002AbfJDL5y (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 4 Oct 2019 07:57:54 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 04 Oct 2019 04:57:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.67,256,1566889200"; 
   d="scan'208";a="186229470"
Received: from mattu-haswell.fi.intel.com ([10.237.72.170])
  by orsmga008.jf.intel.com with ESMTP; 04 Oct 2019 04:57:52 -0700
From:   Mathias Nyman <mathias.nyman@linux.intel.com>
To:     <gregkh@linuxfoundation.org>
Cc:     <linux-usb@vger.kernel.org>,
        Mathias Nyman <mathias.nyman@linux.intel.com>,
        "# v5 . 3" <stable@vger.kernel.org>
Subject: [PATCH 8/8] xhci: Fix NULL pointer dereference in xhci_clear_tt_buffer_complete()
Date:   Fri,  4 Oct 2019 14:59:33 +0300
Message-Id: <1570190373-30684-9-git-send-email-mathias.nyman@linux.intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1570190373-30684-1-git-send-email-mathias.nyman@linux.intel.com>
References: <1570190373-30684-1-git-send-email-mathias.nyman@linux.intel.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

udev stored in ep->hcpriv might be NULL if tt buffer is cleared
due to a halted control endpoint during device enumeration

xhci_clear_tt_buffer_complete is called by hub_tt_work() once it's
scheduled,  and by then usb core might have freed and allocated a
new udev for the next enumeration attempt.

Fixes: ef513be0a905 ("usb: xhci: Add Clear_TT_Buffer")
Cc: <stable@vger.kernel.org> # v5.3
Reported-by: Johan Hovold <johan@kernel.org>
Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
---
 drivers/usb/host/xhci.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/usb/host/xhci.c b/drivers/usb/host/xhci.c
index 00f3804f7aa7..517ec3206f6e 100644
--- a/drivers/usb/host/xhci.c
+++ b/drivers/usb/host/xhci.c
@@ -5238,8 +5238,16 @@ static void xhci_clear_tt_buffer_complete(struct usb_hcd *hcd,
 	unsigned int ep_index;
 	unsigned long flags;
 
+	/*
+	 * udev might be NULL if tt buffer is cleared during a failed device
+	 * enumeration due to a halted control endpoint. Usb core might
+	 * have allocated a new udev for the next enumeration attempt.
+	 */
+
 	xhci = hcd_to_xhci(hcd);
 	udev = (struct usb_device *)ep->hcpriv;
+	if (!udev)
+		return;
 	slot_id = udev->slot_id;
 	ep_index = xhci_get_endpoint_index(&ep->desc);
 
-- 
2.7.4


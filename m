Return-Path: <linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CCF3DC433EF
	for <linux-usb@archiver.kernel.org>; Tue,  8 Feb 2022 19:39:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1377587AbiBHTjt (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Tue, 8 Feb 2022 14:39:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41666 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229536AbiBHTjs (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 8 Feb 2022 14:39:48 -0500
Received: from mxout03.lancloud.ru (mxout03.lancloud.ru [45.84.86.113])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BBEF1C0613CB
        for <linux-usb@vger.kernel.org>; Tue,  8 Feb 2022 11:39:46 -0800 (PST)
Received: from LanCloud
DKIM-Filter: OpenDKIM Filter v2.11.0 mxout03.lancloud.ru DFF1B20A289F
Received: from LanCloud
Received: from LanCloud
Received: from LanCloud
From:   Sergey Shtylyov <s.shtylyov@omp.ru>
Subject: [PATCH v2] usb: host: xhci: drop redundant checks
To:     Mathias Nyman <mathias.nyman@intel.com>,
        <linux-usb@vger.kernel.org>,
        "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Organization: Open Mobile Platform
Message-ID: <4faac4cb-7940-9133-6255-ff9df13bf87d@omp.ru>
Date:   Tue, 8 Feb 2022 22:39:43 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [192.168.11.198]
X-ClientProxiedBy: LFEXT01.lancloud.ru (fd00:f066::141) To
 LFEX1907.lancloud.ru (fd00:f066::207)
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

In xhci_endpoint_{disable|reset}() the expression '&vdev->eps[ep_index]'
just cannot be NULL, so the checks have no sense at all...

Found by Linux Verification Center (linuxtesting.org) with the SVACE static
analysis tool.

Signed-off-by: Sergey Shtylyov <s.shtylyov@omp.ru>

---
This patch is against the 'usb-next' branch of Greg KH's 'usb.git' repo.

Changes in version 2:
- fixed up the function name in the patch sdescription.

 drivers/usb/host/xhci.c |    4 ----
 1 file changed, 4 deletions(-)

Index: usb/drivers/usb/host/xhci.c
===================================================================
--- usb.orig/drivers/usb/host/xhci.c
+++ usb/drivers/usb/host/xhci.c
@@ -3150,8 +3150,6 @@ rescan:
 
 	ep_index = xhci_get_endpoint_index(&host_ep->desc);
 	ep = &vdev->eps[ep_index];
-	if (!ep)
-		goto done;
 
 	/* wait for hub_tt_work to finish clearing hub TT */
 	if (ep->ep_state & EP_CLEARING_TT) {
@@ -3209,8 +3207,6 @@ static void xhci_endpoint_reset(struct u
 		return;
 	ep_index = xhci_get_endpoint_index(&host_ep->desc);
 	ep = &vdev->eps[ep_index];
-	if (!ep)
-		return;
 
 	/* Bail out if toggle is already being cleared by a endpoint reset */
 	spin_lock_irqsave(&xhci->lock, flags);

Return-Path: <linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6FC7C433F5
	for <linux-usb@archiver.kernel.org>; Thu, 10 Feb 2022 11:59:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240602AbiBJL7p (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Thu, 10 Feb 2022 06:59:45 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:54000 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237367AbiBJL7o (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 10 Feb 2022 06:59:44 -0500
Received: from mxout01.lancloud.ru (mxout01.lancloud.ru [45.84.86.81])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E78CA262F
        for <linux-usb@vger.kernel.org>; Thu, 10 Feb 2022 03:59:43 -0800 (PST)
Received: from LanCloud
DKIM-Filter: OpenDKIM Filter v2.11.0 mxout01.lancloud.ru A3BB320CF794
Received: from LanCloud
Received: from LanCloud
Received: from LanCloud
From:   Sergey Shtylyov <s.shtylyov@omp.ru>
Subject: [PATCH] usb: host: xhci-mem: drop useless loop increment
To:     Mathias Nyman <mathias.nyman@intel.com>,
        <linux-usb@vger.kernel.org>,
        "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Organization: Open Mobile Platform
Message-ID: <c3695403-b19a-470d-b2b4-80d648ab2c02@omp.ru>
Date:   Thu, 10 Feb 2022 14:59:39 +0300
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

The 'tt_info' local variable is assigned to a result of kzalloc_node() call
in the body of the *for* loop in xhci_alloc_tt_info() and then incremented
after that body is executed for no apparent reason -- drop that increment.

Found by Linux Verification Center (linuxtesting.org) with the SVACE static
analysis tool.

Signed-off-by: Sergey Shtylyov <s.shtylyov@omp.ru>

---
This patch is against the 'usb-next' branch of Greg KH's 'usb.git' repo.

 drivers/usb/host/xhci-mem.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

Index: usb/drivers/usb/host/xhci-mem.c
===================================================================
--- usb.orig/drivers/usb/host/xhci-mem.c
+++ usb/drivers/usb/host/xhci-mem.c
@@ -836,7 +836,7 @@ int xhci_alloc_tt_info(struct xhci_hcd *
 	else
 		num_ports = hdev->maxchild;
 
-	for (i = 0; i < num_ports; i++, tt_info++) {
+	for (i = 0; i < num_ports; i++) {
 		struct xhci_interval_bw_table *bw_table;
 
 		tt_info = kzalloc_node(sizeof(*tt_info), mem_flags,

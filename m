Return-Path: <linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5DF1DC433F5
	for <linux-usb@archiver.kernel.org>; Mon, 14 Feb 2022 21:28:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231294AbiBNV2N (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Mon, 14 Feb 2022 16:28:13 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:40566 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231282AbiBNV2N (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 14 Feb 2022 16:28:13 -0500
Received: from mxout01.lancloud.ru (mxout01.lancloud.ru [45.84.86.81])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 74927121686
        for <linux-usb@vger.kernel.org>; Mon, 14 Feb 2022 13:28:02 -0800 (PST)
Received: from LanCloud
DKIM-Filter: OpenDKIM Filter v2.11.0 mxout01.lancloud.ru ACF342091F17
Received: from LanCloud
Received: from LanCloud
Received: from LanCloud
From:   Sergey Shtylyov <s.shtylyov@omp.ru>
Subject: [PATCH v2] usb: host: xhci-hub: drop redundant PORTSC register read
To:     Mathias Nyman <mathias.nyman@intel.com>,
        <linux-usb@vger.kernel.org>,
        "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Organization: Open Mobile Platform
Message-ID: <0668fd05-6617-633e-e208-a0060efa05ba@omp.ru>
Date:   Mon, 14 Feb 2022 22:00:48 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [192.168.11.198]
X-ClientProxiedBy: LFEXT02.lancloud.ru (fd00:f066::142) To
 LFEX1907.lancloud.ru (fd00:f066::207)
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

In xhci_hub_control(), there are many PORTSC register readbacks in several
branches of the *switch* statement which get duplicated right after that
*switch* by reading back that register once more -- which is done to flush
the posted writes.  Drop that redundant PORTSC readback...

Found by Linux Verification Center (linuxtesting.org) with the SVACE static
analysis tool.

Signed-off-by: Sergey Shtylyov <s.shtylyov@omp.ru>

---
This patch is against the 'usb-next' branch of Greg KH's 'usb.git' repo.

Changes in version 2:
- dropped the register readback after the *switch* not inside it, updated
  the patch description/subject accordingly;
- added the reigster name in the patch description/subject.

 drivers/usb/host/xhci-hub.c |    2 --
 1 file changed, 2 deletions(-)

Index: usb/drivers/usb/host/xhci-hub.c
===================================================================
--- usb.orig/drivers/usb/host/xhci-hub.c
+++ usb/drivers/usb/host/xhci-hub.c
@@ -1522,8 +1522,6 @@ int xhci_hub_control(struct usb_hcd *hcd
 		default:
 			goto error;
 		}
-		/* unblock any posted writes */
-		temp = readl(ports[wIndex]->addr);
 		break;
 	case ClearPortFeature:
 		if (!wIndex || wIndex > max_ports)

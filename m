Return-Path: <linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98897C4332F
	for <linux-usb@archiver.kernel.org>; Tue,  8 Feb 2022 22:24:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1387418AbiBHWXz (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Tue, 8 Feb 2022 17:23:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46756 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1386279AbiBHT6j (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 8 Feb 2022 14:58:39 -0500
Received: from mxout03.lancloud.ru (mxout03.lancloud.ru [45.84.86.113])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EDEF9C0613CB
        for <linux-usb@vger.kernel.org>; Tue,  8 Feb 2022 11:58:37 -0800 (PST)
Received: from LanCloud
DKIM-Filter: OpenDKIM Filter v2.11.0 mxout03.lancloud.ru 77D0720A2BEE
Received: from LanCloud
Received: from LanCloud
Received: from LanCloud
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        <linux-usb@vger.kernel.org>
From:   Sergey Shtylyov <s.shtylyov@omp.ru>
Subject: [PATCH] usb: core: devices: drop unreachable code in
 usb_dump_endpoint_descriptor()
Organization: Open Mobile Platform
Message-ID: <dac675d4-2dbd-e16d-622a-0471f31f2aca@omp.ru>
Date:   Tue, 8 Feb 2022 22:58:35 +0300
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

The *switch* statement in usb_dump_endpoint_descriptor() does handle all
possible endpoint types expilictly, so the *defaut* label is unreachable.

Found by Linux Verification Center (linuxtesting.org) with the SVACE static
analysis tool.

Signed-off-by: Sergey Shtylyov <s.shtylyov@omp.ru>

---
This patch is against the 'usb-next' branch of Greg KH's 'usb.git' repo.

 drivers/usb/core/devices.c |    2 --
 1 file changed, 2 deletions(-)

Index: usb/drivers/usb/core/devices.c
===================================================================
--- usb.orig/drivers/usb/core/devices.c
+++ usb/drivers/usb/core/devices.c
@@ -168,8 +168,6 @@ static char *usb_dump_endpoint_descripto
 	case USB_ENDPOINT_XFER_INT:
 		type = "Int.";
 		break;
-	default:	/* "can't happen" */
-		return start;
 	}
 
 	interval = usb_decode_interval(desc, speed);

Return-Path: <linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA12FC433F5
	for <linux-usb@archiver.kernel.org>; Wed,  9 Feb 2022 11:54:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229714AbiBILyr (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Wed, 9 Feb 2022 06:54:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56568 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229480AbiBILyq (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 9 Feb 2022 06:54:46 -0500
Received: from mxout02.lancloud.ru (mxout02.lancloud.ru [45.84.86.82])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D4DEDE0B2AAA
        for <linux-usb@vger.kernel.org>; Wed,  9 Feb 2022 02:45:18 -0800 (PST)
Received: from LanCloud
DKIM-Filter: OpenDKIM Filter v2.11.0 mxout02.lancloud.ru DD02422F730C
Received: from LanCloud
Received: from LanCloud
Received: from LanCloud
From:   Sergey Shtylyov <s.shtylyov@omp.ru>
Subject: [PATCH v2] usb: core: devices: drop unreachable code in
 usb_dump_endpoint_descriptor()
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        <linux-usb@vger.kernel.org>
Organization: Open Mobile Platform
Message-ID: <558d5094-64b5-f870-9b18-3451c0b44337@omp.ru>
Date:   Wed, 9 Feb 2022 13:45:15 +0300
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

The *switch* statement in usb_dump_endpoint_descriptor() does handle
all possible endpoint types expilicitly, so the *default* label is
unreachable...

Found by Linux Verification Center (linuxtesting.org) with the SVACE static
analysis tool.

Signed-off-by: Sergey Shtylyov <s.shtylyov@omp.ru>

---
This patch is against the 'usb-next' branch of Greg KH's 'usb.git' repo.

Changes in version 2:
- fixed typos in the patch description;
- reformatted the patch description.

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

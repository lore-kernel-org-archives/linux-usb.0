Return-Path: <linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E38AEC433F5
	for <linux-usb@archiver.kernel.org>; Fri, 22 Apr 2022 22:23:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232447AbiDVW0T (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Fri, 22 Apr 2022 18:26:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43942 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232800AbiDVW0J (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 22 Apr 2022 18:26:09 -0400
Received: from mxout01.lancloud.ru (mxout01.lancloud.ru [45.84.86.81])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 83C0E1D1192
        for <linux-usb@vger.kernel.org>; Fri, 22 Apr 2022 14:17:58 -0700 (PDT)
Received: from LanCloud
DKIM-Filter: OpenDKIM Filter v2.11.0 mxout01.lancloud.ru 20D5E20D567C
Received: from LanCloud
Received: from LanCloud
Received: from LanCloud
From:   Sergey Shtylyov <s.shtylyov@omp.ru>
Subject: [PATCH] usb: core: devices: drop redundant buffer overflow checks
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        <linux-usb@vger.kernel.org>
Organization: Open Mobile Platform
Message-ID: <0453cb0d-7b2b-25e6-50e3-091610951e58@omp.ru>
Date:   Fri, 22 Apr 2022 22:23:55 +0300
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

The USB device dump code often checks for the buffer overflow just before
calling the functions that do that first thing anyways.  Such checks are
redundant and may be dropped...

Signed-off-by: Sergey Shtylyov <s.shtylyov@omp.ru>

---
This patch is against the 'usb-next' branch of Greg KH's 'usb.git' repo.

 drivers/usb/core/devices.c |   12 ------------
 1 file changed, 12 deletions(-)

Index: usb/drivers/usb/core/devices.c
===================================================================
--- usb.orig/drivers/usb/core/devices.c
+++ usb/drivers/usb/core/devices.c
@@ -228,8 +228,6 @@ static char *usb_dump_interface(int spee
 
 	start = usb_dump_interface_descriptor(start, end, intfc, iface, setno);
 	for (i = 0; i < desc->desc.bNumEndpoints; i++) {
-		if (start > end)
-			return start;
 		start = usb_dump_endpoint_descriptor(speed,
 				start, end, &desc->endpoint[i].desc);
 	}
@@ -302,8 +300,6 @@ static char *usb_dump_config(int speed,
 		intfc = config->intf_cache[i];
 		interface = config->interface[i];
 		for (j = 0; j < intfc->num_altsetting; j++) {
-			if (start > end)
-				return start;
 			start = usb_dump_interface(speed,
 				start, end, intfc, interface, j);
 		}
@@ -369,19 +365,11 @@ static char *usb_dump_desc(char *start,
 {
 	int i;
 
-	if (start > end)
-		return start;
-
 	start = usb_dump_device_descriptor(start, end, &dev->descriptor);
 
-	if (start > end)
-		return start;
-
 	start = usb_dump_device_strings(start, end, dev);
 
 	for (i = 0; i < dev->descriptor.bNumConfigurations; i++) {
-		if (start > end)
-			return start;
 		start = usb_dump_config(dev->speed,
 				start, end, dev->config + i,
 				/* active ? */

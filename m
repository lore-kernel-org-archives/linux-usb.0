Return-Path: <SRS0=DXCd=VN=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B87DC7618F
	for <linux-usb@archiver.kernel.org>; Tue, 16 Jul 2019 19:02:13 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 298D420665
	for <linux-usb@archiver.kernel.org>; Tue, 16 Jul 2019 19:02:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728672AbfGPTCM (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Tue, 16 Jul 2019 15:02:12 -0400
Received: from lisa.dawes.za.net ([178.63.77.189]:51364 "EHLO
        lisa.dawes.za.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728137AbfGPTCM (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 16 Jul 2019 15:02:12 -0400
Received: by lisa.dawes.za.net (Postfix, from userid 1000)
        id 4C9DF14054E; Tue, 16 Jul 2019 21:02:10 +0200 (SAST)
Date:   Tue, 16 Jul 2019 21:02:10 +0200
From:   Rogan Dawes <rogan@dawes.za.net>
To:     linux-usb@vger.kernel.org
Cc:     Johan Hovold <johan@kernel.org>, Lars Melin <larsm17@gmail.com>,
        Dan Williams <dcbw@redhat.com>
Subject: [PATCH v4] USB: serial: option: add D-Link DWM-222 device ID
Message-ID: <20190716190210.GA27056@lisa.dawes.za.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAOYdKdjBtYt_2CuBxaTYKXCt7En+ESdOKeJ+kEEvvcNhkYs_7w@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Add device id for D-Link DWM-222.

Cc: stable@vger.kernel.org
---
Added the reserved interface 0, as suggested by Johan and Lars.

 drivers/usb/serial/option.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/usb/serial/option.c b/drivers/usb/serial/option.c
index a0aaf0635359..db6f76bbb471 100644
--- a/drivers/usb/serial/option.c
+++ b/drivers/usb/serial/option.c
@@ -1951,6 +1951,8 @@ static const struct usb_device_id option_ids[] = {
 	  .driver_info = RSVD(4) },
 	{ USB_DEVICE_INTERFACE_CLASS(0x2001, 0x7e35, 0xff),			/* D-Link DWM-222 */
 	  .driver_info = RSVD(4) },
+	{ USB_DEVICE_INTERFACE_CLASS(0x2001, 0x7e3d, 0xff),			/* D-Link DWM-222 A2 */
+	  .driver_info = RSVD(0) | RSVD(4) },
 	{ USB_DEVICE_AND_INTERFACE_INFO(0x07d1, 0x3e01, 0xff, 0xff, 0xff) },	/* D-Link DWM-152/C1 */
 	{ USB_DEVICE_AND_INTERFACE_INFO(0x07d1, 0x3e02, 0xff, 0xff, 0xff) },	/* D-Link DWM-156/C1 */
 	{ USB_DEVICE_AND_INTERFACE_INFO(0x07d1, 0x7e11, 0xff, 0xff, 0xff) },	/* D-Link DWM-156/A3 */
-- 
2.17.1


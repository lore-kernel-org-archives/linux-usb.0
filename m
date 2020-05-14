Return-Path: <SRS0=M0dr=64=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2966DC433E1
	for <linux-usb@archiver.kernel.org>; Thu, 14 May 2020 13:46:40 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 09A3E20727
	for <linux-usb@archiver.kernel.org>; Thu, 14 May 2020 13:46:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="BmaWqTb8"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726142AbgENNqj (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Thu, 14 May 2020 09:46:39 -0400
Received: from esa5.microchip.iphmx.com ([216.71.150.166]:62113 "EHLO
        esa5.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726073AbgENNqj (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 14 May 2020 09:46:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1589464000; x=1621000000;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version;
  bh=tJKksn5Xr0ro+6lb57CFH3u/OX0PnYqchb5vz4CQkJk=;
  b=BmaWqTb8Y8JSuO9oBXN0urbet2V5dD+uLqoZp0TceJcBXp9Jp2ZbutIv
   j7SguzHNv85h/WbFAu7bm2gR+tC+f6Opr0AL3Cq/e1XuAAuVS/N9zVg7Q
   MKjfOlMdo0WOvrePCjoMXLciG9uC6kyuwegJXuy8Fn7nw9uFsoeXjBGBI
   GXU26UmftYImnUHBpE5fZ4MK0ErsJmVlBDUt8CcH0w+aoLEM76NlMLcVB
   AShsYzPAyng/uBIUCpcx9EWA98XghoXDwrgAUQ0GvXVTR78fZyNkRdCPz
   xpZJxVhv9q8ThuwUFoZB/fOFCHB+03d9cTYnrhWqWfp6vyzsJlVVk2eTY
   g==;
IronPort-SDR: GDUH6Rx/XizZ0dK4SiFg4KnrMLmRndorBGOggcEE+nCKKWfHLD7Hos8C7bH4Bki27SKqpvmtVP
 6ymeUviP/uAkLakSvTmZNt2ncF2mVl6ZumZql0TSrVxdFibfOdCMFKIn2P/IZIZ/SAaXnXdKYK
 SasrTGYd7xBBznsbxdAmfik9fBGx/rn/5unzxykrvFNtPb9DaE6XQg3tfj7hE1E/u340DJsoHO
 IXDil8ckq6xJyAC/ASNJBt588j1QwfJJPo11vdvlj0/aszbImT/D5QXJLFx3jhuUVZWC1kQAHm
 MW8=
X-IronPort-AV: E=Sophos;i="5.73,391,1583218800"; 
   d="scan'208";a="75894428"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 14 May 2020 06:46:37 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Thu, 14 May 2020 06:46:35 -0700
Received: from localhost.localdomain (10.10.115.15) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.1713.5 via Frontend Transport; Thu, 14 May 2020 06:46:37 -0700
From:   Christian Gromm <christian.gromm@microchip.com>
To:     <gregkh@linuxfoundation.org>
CC:     <driverdev-devel@linuxdriverproject.org>,
        <linux-usb@vger.kernel.org>,
        Christian Gromm <christian.gromm@microchip.com>
Subject: [PATCH 2/7] staging: most: usb: remove reference to USB error codes
Date:   Thu, 14 May 2020 15:46:24 +0200
Message-ID: <1589463989-30029-3-git-send-email-christian.gromm@microchip.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1589463989-30029-1-git-send-email-christian.gromm@microchip.com>
References: <1589463989-30029-1-git-send-email-christian.gromm@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

This patch removes the reference to the driver API file for USB error
codes.

Signed-off-by: Christian Gromm <christian.gromm@microchip.com>
Reported-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/staging/most/usb/usb.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/staging/most/usb/usb.c b/drivers/staging/most/usb/usb.c
index 85d4fa0..76963c0 100644
--- a/drivers/staging/most/usb/usb.c
+++ b/drivers/staging/most/usb/usb.c
@@ -477,8 +477,6 @@ static void hdm_write_completion(struct urb *urb)
  * controller use to indicate a transfer has failed because of device
  * disconnect.  In the interval before the hub driver starts disconnect
  * processing, devices may receive such fault reports for every request.
- *
- * See <https://www.kernel.org/doc/Documentation/driver-api/usb/error-codes.rst>
  */
 static void hdm_read_completion(struct urb *urb)
 {
-- 
2.7.4


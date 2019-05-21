Return-Path: <SRS0=yIgR=TV=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F47AC04AAF
	for <linux-usb@archiver.kernel.org>; Tue, 21 May 2019 15:38:09 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 75EFF21743
	for <linux-usb@archiver.kernel.org>; Tue, 21 May 2019 15:38:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728488AbfEUPiJ (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Tue, 21 May 2019 11:38:09 -0400
Received: from iolanthe.rowland.org ([192.131.102.54]:33576 "HELO
        iolanthe.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1728137AbfEUPiI (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 21 May 2019 11:38:08 -0400
Received: (qmail 5764 invoked by uid 2102); 21 May 2019 11:38:07 -0400
Received: from localhost (sendmail-bs@127.0.0.1)
  by localhost with SMTP; 21 May 2019 11:38:07 -0400
Date:   Tue, 21 May 2019 11:38:07 -0400 (EDT)
From:   Alan Stern <stern@rowland.harvard.edu>
X-X-Sender: stern@iolanthe.rowland.org
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
cc:     kbuild test robot <lkp@intel.com>, <kbuild-all@01.org>,
        USB list <linux-usb@vger.kernel.org>,
        Johan Hovold <johan@kernel.org>
Subject: [PATCH] media: usb: siano: Fix false-positive "uninitialized variable"
 warning
In-Reply-To: <20190521140805.GA24615@kroah.com>
Message-ID: <Pine.LNX.4.44L0.1905211136260.1634-100000@iolanthe.rowland.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

GCC complains about an apparently uninitialized variable recently
added to smsusb_init_device().  It's a false positive, but to silence
the warning this patch adds a trivial initialization.

Signed-off-by: Alan Stern <stern@rowland.harvard.edu>
Reported-by: kbuild test robot <lkp@intel.com>
CC: <stable@vger.kernel.org>

---

 drivers/media/usb/siano/smsusb.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

Index: usb-devel/drivers/media/usb/siano/smsusb.c
===================================================================
--- usb-devel.orig/drivers/media/usb/siano/smsusb.c
+++ usb-devel/drivers/media/usb/siano/smsusb.c
@@ -400,7 +400,7 @@ static int smsusb_init_device(struct usb
 	struct smsusb_device_t *dev;
 	void *mdev;
 	int i, rc;
-	int in_maxp;
+	int in_maxp = 0;
 
 	/* create device object */
 	dev = kzalloc(sizeof(struct smsusb_device_t), GFP_KERNEL);


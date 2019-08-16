Return-Path: <SRS0=REG0=WM=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB01AC3A59C
	for <linux-usb@archiver.kernel.org>; Fri, 16 Aug 2019 17:10:02 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id B61CF21721
	for <linux-usb@archiver.kernel.org>; Fri, 16 Aug 2019 17:10:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726947AbfHPRKC (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Fri, 16 Aug 2019 13:10:02 -0400
Received: from iolanthe.rowland.org ([192.131.102.54]:58322 "HELO
        iolanthe.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1726690AbfHPRKC (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 16 Aug 2019 13:10:02 -0400
Received: (qmail 4225 invoked by uid 2102); 16 Aug 2019 13:10:00 -0400
Received: from localhost (sendmail-bs@127.0.0.1)
  by localhost with SMTP; 16 Aug 2019 13:10:00 -0400
Date:   Fri, 16 Aug 2019 13:10:00 -0400 (EDT)
From:   Alan Stern <stern@rowland.harvard.edu>
X-X-Sender: stern@iolanthe.rowland.org
To:     Jiri Kosina <jikos@kernel.org>, Oliver Neukum <oneukum@suse.com>
cc:     USB list <linux-usb@vger.kernel.org>
Subject: Duplicated code in hiddev_open()
Message-ID: <Pine.LNX.4.44L0.1908161228310.1525-100000@iolanthe.rowland.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Oliver and Jiri:

Why is there duplicated code in
drivers/hid/usbhid/hiddev.c:hiddev_open()?

Line 267:
	/*
	 * no need for locking because the USB major number
	 * is shared which usbcore guards against disconnect
	 */
	if (list->hiddev->exist) {
		if (!list->hiddev->open++) {
			res = hid_hw_open(hiddev->hid);
			if (res < 0)
				goto bail;
		}
	} else {
		res = -ENODEV;
		goto bail;
	}

Line 286:
	mutex_lock(&hiddev->existancelock);
	if (!list->hiddev->open++)
		if (list->hiddev->exist) {
			struct hid_device *hid = hiddev->hid;
			res = hid_hw_power(hid, PM_HINT_FULLON);
			if (res < 0)
				goto bail_unlock;
			res = hid_hw_open(hid);
			if (res < 0)
				goto bail_normal_power;
		}
	mutex_unlock(&hiddev->existancelock);

The second part can never execute, because the first part ensures that 
list->hiddev->open > 0 by the time the second part runs.

Even more disturbing, why is one of these code sections protected by a 
mutex and the other not?

Note: The second section was added in commit 0361a28d3f9a ("HID: 
autosuspend support for USB HID") over ten years ago!

Alan Stern


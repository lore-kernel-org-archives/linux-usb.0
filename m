Return-Path: <SRS0=WMKl=S3=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	T_DKIMWL_WL_HIGH,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70905C43219
	for <linux-usb@archiver.kernel.org>; Thu, 25 Apr 2019 16:06:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id B95BE2088F
	for <linux-usb@archiver.kernel.org>; Thu, 25 Apr 2019 16:06:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1556208360;
	bh=3JgZsCuvaheDUdPCK8Du9Mbq3Ry3153ruW4FcGJ6cPc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-ID:From;
	b=vVphttptNfmJ6WwQT+mbJt9w/RsfmoB9N1iRnuNNKhSA6OAcEzKVjIsqSG2YwFV7z
	 3fS3dIk6kLzGebtUfxQjImskQiEregiH/csTHA4aTEIbPiwQ07DDB0cdPbv4/5oVXI
	 kdU11XZriX0CSMJJ9Iy+mG2glgmGdTP39HJU7OyQ=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726896AbfDYQF7 (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Thu, 25 Apr 2019 12:05:59 -0400
Received: from mail-lf1-f65.google.com ([209.85.167.65]:35886 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726402AbfDYQF7 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 25 Apr 2019 12:05:59 -0400
Received: by mail-lf1-f65.google.com with SMTP id u17so197192lfi.3
        for <linux-usb@vger.kernel.org>; Thu, 25 Apr 2019 09:05:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=jH+B5GnM61cAUeL6Upm3Ak3lJ7oLat4CM9piCjk6n50=;
        b=iNBSYhHPamRcbCgXc+KAxdYMMPWKF1ByH5EEw0ZM0L6hCZOcdR9+CD1/tFW3g/qisR
         BLXi9jAQvUHjuv2BRC9JybrBywMHlQ8YNkNcFPiY4rNtsmZ0eJcwTqzvQGvyiDb31e/M
         lD7TGB1Snmf+QOqvjNM5nod6TEfjS4qyL53NSY0KGvk2XU/CALnEa582OxLdRseSdigO
         vzQUkn75Y4GKXgBLrpwbOHYIrIMsK7qqfqseVZRZMWtEX2lgZ80aXJm90Dz1AKY69alo
         2YBHNWBfRYQR1r/MNditkuiMmIdbJKMkmEsRl8pw756JPBq2Tuci2C+e9MFv+czpFoB5
         E40A==
X-Gm-Message-State: APjAAAWj8umivpHFGywsDAVcAlA8Zic39rLbQaGGLwd0gFnkoZcRDQu3
        BSa2wQDm5ktRXYL2qKRYZLs=
X-Google-Smtp-Source: APXvYqw/c1hJwjfjGJRhwG5s42NHZJMYY0m5YpteZ+is7Zw0Cl0C8wpUh1C7WUVy82Htgxs1r/y6Cw==
X-Received: by 2002:ac2:4301:: with SMTP id l1mr5318832lfh.54.1556208357086;
        Thu, 25 Apr 2019 09:05:57 -0700 (PDT)
Received: from xi.terra (c-74bee655.07-184-6d6c6d4.bbcust.telenor.se. [85.230.190.116])
        by smtp.gmail.com with ESMTPSA id w22sm4636730ljd.42.2019.04.25.09.05.55
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 25 Apr 2019 09:05:55 -0700 (PDT)
Received: from johan by xi.terra with local (Exim 4.91)
        (envelope-from <johan@xi.terra>)
        id 1hJgsl-0002ci-Iq; Thu, 25 Apr 2019 18:05:55 +0200
From:   Johan Hovold <johan@kernel.org>
To:     Alan Stern <stern@rowland.harvard.edu>,
        Oliver Neukum <oneukum@suse.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org, Johan Hovold <johan@kernel.org>
Subject: [PATCH 1/5] USB: serial: fix unthrottle races
Date:   Thu, 25 Apr 2019 18:05:36 +0200
Message-Id: <20190425160540.10036-2-johan@kernel.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190425160540.10036-1-johan@kernel.org>
References: <20190425160540.10036-1-johan@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190425160536.lr2suO_m7yhzBE-DZrZyO_l07D-Qn-g-d-rPWJF45mk@z>

Fix two long-standing bugs which could potentially lead to memory
corruption or leave the port throttled until it is reopened (on weakly
ordered systems), respectively, when read-URB completion races with
unthrottle().

First, the URB must not be marked as free before processing is complete
to prevent it from being submitted by unthrottle() on another CPU.

	CPU 1				CPU 2
	================		================
	complete()			unthrottle()
	  process_urb();
	  smp_mb__before_atomic();
	  set_bit(i, free);		  if (test_and_clear_bit(i, free))
	  					  submit_urb();

Second, the URB must be marked as free before checking the throttled
flag to prevent unthrottle() on another CPU from failing to observe that
the URB needs to be submitted if complete() sees that the throttled flag
is set.

	CPU 1				CPU 2
	================		================
	complete()			unthrottle()
	  set_bit(i, free);		  throttled = 0;
	  smp_mb__after_atomic();	  smp_mb();
	  if (throttled)		  if (test_and_clear_bit(i, free))
	  	  return;			  submit_urb();

Note that test_and_clear_bit() only implies barriers when the test is
successful. To handle the case where the URB is still in use an explicit
barrier needs to be added to unthrottle() for the second race condition.

Fixes: d83b405383c9 ("USB: serial: add support for multiple read urbs")
Signed-off-by: Johan Hovold <johan@kernel.org>
---
 drivers/usb/serial/generic.c | 39 +++++++++++++++++++++++++++++-------
 1 file changed, 32 insertions(+), 7 deletions(-)

diff --git a/drivers/usb/serial/generic.c b/drivers/usb/serial/generic.c
index 2274d9625f63..0fff4968ea1b 100644
--- a/drivers/usb/serial/generic.c
+++ b/drivers/usb/serial/generic.c
@@ -376,6 +376,7 @@ void usb_serial_generic_read_bulk_callback(struct urb *urb)
 	struct usb_serial_port *port = urb->context;
 	unsigned char *data = urb->transfer_buffer;
 	unsigned long flags;
+	bool stopped = false;
 	int status = urb->status;
 	int i;
 
@@ -383,33 +384,51 @@ void usb_serial_generic_read_bulk_callback(struct urb *urb)
 		if (urb == port->read_urbs[i])
 			break;
 	}
-	set_bit(i, &port->read_urbs_free);
 
 	dev_dbg(&port->dev, "%s - urb %d, len %d\n", __func__, i,
 							urb->actual_length);
 	switch (status) {
 	case 0:
+		usb_serial_debug_data(&port->dev, __func__, urb->actual_length,
+							data);
+		port->serial->type->process_read_urb(urb);
 		break;
 	case -ENOENT:
 	case -ECONNRESET:
 	case -ESHUTDOWN:
 		dev_dbg(&port->dev, "%s - urb stopped: %d\n",
 							__func__, status);
-		return;
+		stopped = true;
+		break;
 	case -EPIPE:
 		dev_err(&port->dev, "%s - urb stopped: %d\n",
 							__func__, status);
-		return;
+		stopped = true;
+		break;
 	default:
 		dev_dbg(&port->dev, "%s - nonzero urb status: %d\n",
 							__func__, status);
-		goto resubmit;
+		break;
 	}
 
-	usb_serial_debug_data(&port->dev, __func__, urb->actual_length, data);
-	port->serial->type->process_read_urb(urb);
+	/*
+	 * Make sure URB processing is done before marking as free to avoid
+	 * racing with unthrottle() on another CPU. Matches the barriers
+	 * implied by the test_and_clear_bit() in
+	 * usb_serial_generic_submit_read_urb().
+	 */
+	smp_mb__before_atomic();
+	set_bit(i, &port->read_urbs_free);
+	/*
+	 * Make sure URB is marked as free before checking the throttled flag
+	 * to avoid racing with unthrottle() on another CPU. Matches the
+	 * smp_mb() in unthrottle().
+	 */
+	smp_mb__after_atomic();
+
+	if (stopped)
+		return;
 
-resubmit:
 	/* Throttle the device if requested by tty */
 	spin_lock_irqsave(&port->lock, flags);
 	port->throttled = port->throttle_req;
@@ -484,6 +503,12 @@ void usb_serial_generic_unthrottle(struct tty_struct *tty)
 	port->throttled = port->throttle_req = 0;
 	spin_unlock_irq(&port->lock);
 
+	/*
+	 * Matches the smp_mb__after_atomic() in
+	 * usb_serial_generic_read_bulk_callback().
+	 */
+	smp_mb();
+
 	if (was_throttled)
 		usb_serial_generic_submit_read_urbs(port, GFP_KERNEL);
 }
-- 
2.21.0


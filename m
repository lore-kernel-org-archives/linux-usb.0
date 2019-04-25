Return-Path: <SRS0=WMKl=S3=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	T_DKIMWL_WL_HIGH,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC677C43218
	for <linux-usb@archiver.kernel.org>; Thu, 25 Apr 2019 16:06:01 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 1F4212088F
	for <linux-usb@archiver.kernel.org>; Thu, 25 Apr 2019 16:06:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1556208362;
	bh=OnldwEDCa9Bdn9AaOXVhHn9jv1MkhISIRiZMMVt21hA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-ID:From;
	b=vRnU0wmHdA266kiDAFFs8P+KH04DPMuIb7RL+RbYk7+Farv29W+vYsXEOnl4yNjK8
	 yeUg8xN6HL7z+p1scdiUeZxmaNNm4UZcXXGi58oJ5dqdRoQX6QrsxOa9EtIVLKpwlu
	 Jy4ZCJp2Nxab3PPGXyuqc8DBUJC1cjSTNtSzlqjo=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726924AbfDYQGA (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Thu, 25 Apr 2019 12:06:00 -0400
Received: from mail-lf1-f66.google.com ([209.85.167.66]:35810 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726058AbfDYQGA (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 25 Apr 2019 12:06:00 -0400
Received: by mail-lf1-f66.google.com with SMTP id j20so201286lfh.2
        for <linux-usb@vger.kernel.org>; Thu, 25 Apr 2019 09:05:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=njCj2//bdeddp1PVnNNWH8PanEmLZ08pHEu90xXrCjg=;
        b=WB4OYwQd+jbumoHRpWgjHs5re78QB7FmG8Mc+3vNjadtIsTyDbPTaGLt1NkswMMdu7
         PxLlOeIlnkDHWYK3q+4G8vZL4B3KIC1/rUJyWZCg0E40K568Zv4D58+SOTvg21P10EPR
         xdgHT1OZgqzadIDt4n2T67gFCAhAgmlQE8LPtHxdabiF5jV+pmWOFVANPp53dnsyIby9
         UHXh+08MSevTzSviD2fZdseEQ4fQmCWX2k+EBGdcwWJk0etBIK92S5DtxnMI2rVYv2CD
         B9zdc+V2/Z4CQ/DgtI3x/nNqjGLpzPQsb2wMcbTsSwVTnVLjf6DNNzBQmgMHY+P67Mis
         0lBA==
X-Gm-Message-State: APjAAAXqjrIniGxfSGuhrSjy9xdxuhLLUcy+5dZ33Z66VCRzuMry7DdT
        qfxeNSVphACt2AmOvRUyBy4=
X-Google-Smtp-Source: APXvYqyD8MPhip/tE4oFNK3U/TQBu9W/MSEOvY8jeg3OVNs9cTtxMWfuH1a3cFGpWa8ZZMt8ARkuHQ==
X-Received: by 2002:a19:5507:: with SMTP id n7mr10694lfe.140.1556208357892;
        Thu, 25 Apr 2019 09:05:57 -0700 (PDT)
Received: from xi.terra (c-74bee655.07-184-6d6c6d4.bbcust.telenor.se. [85.230.190.116])
        by smtp.gmail.com with ESMTPSA id j6sm5863103ljc.0.2019.04.25.09.05.55
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 25 Apr 2019 09:05:55 -0700 (PDT)
Received: from johan by xi.terra with local (Exim 4.91)
        (envelope-from <johan@xi.terra>)
        id 1hJgsl-0002co-M9; Thu, 25 Apr 2019 18:05:55 +0200
From:   Johan Hovold <johan@kernel.org>
To:     Alan Stern <stern@rowland.harvard.edu>,
        Oliver Neukum <oneukum@suse.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org, Johan Hovold <johan@kernel.org>
Subject: [PATCH 2/5] USB: serial: clean up throttle handling
Date:   Thu, 25 Apr 2019 18:05:37 +0200
Message-Id: <20190425160540.10036-3-johan@kernel.org>
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
Message-ID: <20190425160537.hShxciSxMoKv8X0_CqOsUhLOTgnL00vyHt13NQcLZL0@z>

Clean up the throttle implementation by dropping the redundant
throttle_req flag which was a remnant from back when there was only a
single read URB.

Also convert the throttled flag to an atomic bit flag.

Signed-off-by: Johan Hovold <johan@kernel.org>
---
 drivers/usb/serial/generic.c | 34 ++++++++--------------------------
 include/linux/usb/serial.h   |  5 +----
 2 files changed, 9 insertions(+), 30 deletions(-)

diff --git a/drivers/usb/serial/generic.c b/drivers/usb/serial/generic.c
index 0fff4968ea1b..67cef3ef1e5f 100644
--- a/drivers/usb/serial/generic.c
+++ b/drivers/usb/serial/generic.c
@@ -106,12 +106,8 @@ void usb_serial_generic_deregister(void)
 int usb_serial_generic_open(struct tty_struct *tty, struct usb_serial_port *port)
 {
 	int result = 0;
-	unsigned long flags;
 
-	spin_lock_irqsave(&port->lock, flags);
-	port->throttled = 0;
-	port->throttle_req = 0;
-	spin_unlock_irqrestore(&port->lock, flags);
+	clear_bit(USB_SERIAL_THROTTLED, &port->flags);
 
 	if (port->bulk_in_size)
 		result = usb_serial_generic_submit_read_urbs(port, GFP_KERNEL);
@@ -375,7 +371,6 @@ void usb_serial_generic_read_bulk_callback(struct urb *urb)
 {
 	struct usb_serial_port *port = urb->context;
 	unsigned char *data = urb->transfer_buffer;
-	unsigned long flags;
 	bool stopped = false;
 	int status = urb->status;
 	int i;
@@ -429,15 +424,10 @@ void usb_serial_generic_read_bulk_callback(struct urb *urb)
 	if (stopped)
 		return;
 
-	/* Throttle the device if requested by tty */
-	spin_lock_irqsave(&port->lock, flags);
-	port->throttled = port->throttle_req;
-	if (!port->throttled) {
-		spin_unlock_irqrestore(&port->lock, flags);
-		usb_serial_generic_submit_read_urb(port, i, GFP_ATOMIC);
-	} else {
-		spin_unlock_irqrestore(&port->lock, flags);
-	}
+	if (test_bit(USB_SERIAL_THROTTLED, &port->flags))
+		return;
+
+	usb_serial_generic_submit_read_urb(port, i, GFP_ATOMIC);
 }
 EXPORT_SYMBOL_GPL(usb_serial_generic_read_bulk_callback);
 
@@ -485,23 +475,16 @@ EXPORT_SYMBOL_GPL(usb_serial_generic_write_bulk_callback);
 void usb_serial_generic_throttle(struct tty_struct *tty)
 {
 	struct usb_serial_port *port = tty->driver_data;
-	unsigned long flags;
 
-	spin_lock_irqsave(&port->lock, flags);
-	port->throttle_req = 1;
-	spin_unlock_irqrestore(&port->lock, flags);
+	set_bit(USB_SERIAL_THROTTLED, &port->flags);
 }
 EXPORT_SYMBOL_GPL(usb_serial_generic_throttle);
 
 void usb_serial_generic_unthrottle(struct tty_struct *tty)
 {
 	struct usb_serial_port *port = tty->driver_data;
-	int was_throttled;
 
-	spin_lock_irq(&port->lock);
-	was_throttled = port->throttled;
-	port->throttled = port->throttle_req = 0;
-	spin_unlock_irq(&port->lock);
+	clear_bit(USB_SERIAL_THROTTLED, &port->flags);
 
 	/*
 	 * Matches the smp_mb__after_atomic() in
@@ -509,8 +492,7 @@ void usb_serial_generic_unthrottle(struct tty_struct *tty)
 	 */
 	smp_mb();
 
-	if (was_throttled)
-		usb_serial_generic_submit_read_urbs(port, GFP_KERNEL);
+	usb_serial_generic_submit_read_urbs(port, GFP_KERNEL);
 }
 EXPORT_SYMBOL_GPL(usb_serial_generic_unthrottle);
 
diff --git a/include/linux/usb/serial.h b/include/linux/usb/serial.h
index 1c19f77ed541..d8bdab8f3c26 100644
--- a/include/linux/usb/serial.h
+++ b/include/linux/usb/serial.h
@@ -28,6 +28,7 @@
 
 /* USB serial flags */
 #define USB_SERIAL_WRITE_BUSY	0
+#define USB_SERIAL_THROTTLED	1
 
 /**
  * usb_serial_port: structure for the specific ports of a device.
@@ -67,8 +68,6 @@
  * @flags: usb serial port flags
  * @write_wait: a wait_queue_head_t used by the port.
  * @work: work queue entry for the line discipline waking up.
- * @throttled: nonzero if the read urb is inactive to throttle the device
- * @throttle_req: nonzero if the tty wants to throttle us
  * @dev: pointer to the serial device
  *
  * This structure is used by the usb-serial core and drivers for the specific
@@ -115,8 +114,6 @@ struct usb_serial_port {
 	unsigned long		flags;
 	wait_queue_head_t	write_wait;
 	struct work_struct	work;
-	char			throttled;
-	char			throttle_req;
 	unsigned long		sysrq; /* sysrq timeout */
 	struct device		dev;
 };
-- 
2.21.0


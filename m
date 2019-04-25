Return-Path: <SRS0=WMKl=S3=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	T_DKIMWL_WL_HIGH,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66F7AC43219
	for <linux-usb@archiver.kernel.org>; Thu, 25 Apr 2019 16:06:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id AE61E2088F
	for <linux-usb@archiver.kernel.org>; Thu, 25 Apr 2019 16:06:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1556208364;
	bh=gOBgAvrGs36c+m4K79C8LadHIZyXWDmeQTI6yBpmHcA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-ID:From;
	b=emD0H4mfL9zxjFIl8Iatu0vjPlffyFgfaVmDC8UDSvSCg2tKwSHfIP2BpdcLJSLz5
	 thiWGk/lPWjsZJ/nyT0OOubhbMJz1xkEiTV8rIpSCwdho3az1B8DITz2hIYk8sARUG
	 7gXYitdDRZK+BMUpa5tZm14WidZWDxowWn/7AJKo=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726402AbfDYQGD (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Thu, 25 Apr 2019 12:06:03 -0400
Received: from mail-lf1-f66.google.com ([209.85.167.66]:39346 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726859AbfDYQGC (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 25 Apr 2019 12:06:02 -0400
Received: by mail-lf1-f66.google.com with SMTP id d12so180212lfk.6
        for <linux-usb@vger.kernel.org>; Thu, 25 Apr 2019 09:06:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=jCrLocsed8C23l/Qz2ceGAv+q7KSLARapoD49XZWHrQ=;
        b=iovlPOjODV4vxWQrn3RW2HU+TJP6scdGSFr/OpDMux3KrA0s+ZGzOZN7qsTvLu3JeW
         s40nan/Uv9ze5IVzOkaslSRrDAAOc1N2dxFdSvfVwvQM8hzfCoOYw864IQnI++2CloyQ
         Shcnb71nK0p2H3HbY4pacmY0WJXhF0xCwAAHyKYgVecVjSIzZK5JnScYwQ3vYLbA03zs
         8cEGJq9FVSLvW2ihOl7mMCuwctbeqi2d1YVmvOZv6BYfOyiGtqGaURv1xmf/rVkdv2KI
         LZpCjpzgVFe+RpbqmkXbWqJpAVjiNwWcXRyy3YYFakGP1+q6F05+qxXLyuaNE6gLQHfT
         stYQ==
X-Gm-Message-State: APjAAAWVUFF2h7QTYkvpqdnDIxBEQlCFwyMuVs+KbU0GJkxuNBZBXy3Z
        brGUBCiiq1tN2ePiEVqtQZs=
X-Google-Smtp-Source: APXvYqzsI6XUtV5eu1qIxgC62mhxzk54ojfu5u/J12gYUrY1ZvdurG1U4EaGK6nxAwIUMe60LA+Nqg==
X-Received: by 2002:ac2:558d:: with SMTP id v13mr14895265lfg.76.1556208359981;
        Thu, 25 Apr 2019 09:05:59 -0700 (PDT)
Received: from xi.terra (c-74bee655.07-184-6d6c6d4.bbcust.telenor.se. [85.230.190.116])
        by smtp.gmail.com with ESMTPSA id l16sm4733160ljb.24.2019.04.25.09.05.55
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 25 Apr 2019 09:05:57 -0700 (PDT)
Received: from johan by xi.terra with local (Exim 4.91)
        (envelope-from <johan@xi.terra>)
        id 1hJgsl-0002d3-UK; Thu, 25 Apr 2019 18:05:55 +0200
From:   Johan Hovold <johan@kernel.org>
To:     Alan Stern <stern@rowland.harvard.edu>,
        Oliver Neukum <oneukum@suse.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org, Johan Hovold <johan@kernel.org>
Subject: [PATCH 5/5] USB: cdc-acm: clean up throttle handling
Date:   Thu, 25 Apr 2019 18:05:40 +0200
Message-Id: <20190425160540.10036-6-johan@kernel.org>
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
Message-ID: <20190425160540.2RkjxLSb7ydhrd8t0-typaBnS4-ITdK6aQEcUZmaBSc@z>

Clean up the throttle implementation by dropping the redundant
throttle_req flag which was a remnant from back when USB serial had only
a single read URB, something which was later carried over to cdc-acm.

Also convert the throttled flag to an atomic bit flag.

Signed-off-by: Johan Hovold <johan@kernel.org>
---
 drivers/usb/class/cdc-acm.c | 33 ++++++++-------------------------
 drivers/usb/class/cdc-acm.h |  3 +--
 2 files changed, 9 insertions(+), 27 deletions(-)

diff --git a/drivers/usb/class/cdc-acm.c b/drivers/usb/class/cdc-acm.c
index c03aa8550980..183b41753c98 100644
--- a/drivers/usb/class/cdc-acm.c
+++ b/drivers/usb/class/cdc-acm.c
@@ -468,7 +468,6 @@ static void acm_read_bulk_callback(struct urb *urb)
 {
 	struct acm_rb *rb = urb->context;
 	struct acm *acm = rb->instance;
-	unsigned long flags;
 	int status = urb->status;
 	bool stopped = false;
 	bool stalled = false;
@@ -525,15 +524,10 @@ static void acm_read_bulk_callback(struct urb *urb)
 		return;
 	}
 
-	/* throttle device if requested by tty */
-	spin_lock_irqsave(&acm->read_lock, flags);
-	acm->throttled = acm->throttle_req;
-	if (!acm->throttled) {
-		spin_unlock_irqrestore(&acm->read_lock, flags);
-		acm_submit_read_urb(acm, rb->index, GFP_ATOMIC);
-	} else {
-		spin_unlock_irqrestore(&acm->read_lock, flags);
-	}
+	if (test_bit(ACM_THROTTLED, &acm->flags))
+		return;
+
+	acm_submit_read_urb(acm, rb->index, GFP_ATOMIC);
 }
 
 /* data interface wrote those outgoing bytes */
@@ -670,10 +664,7 @@ static int acm_port_activate(struct tty_port *port, struct tty_struct *tty)
 	/*
 	 * Unthrottle device in case the TTY was closed while throttled.
 	 */
-	spin_lock_irq(&acm->read_lock);
-	acm->throttled = 0;
-	acm->throttle_req = 0;
-	spin_unlock_irq(&acm->read_lock);
+	clear_bit(ACM_THROTTLED, &acm->flags);
 
 	retval = acm_submit_read_urbs(acm, GFP_KERNEL);
 	if (retval)
@@ -841,27 +832,19 @@ static void acm_tty_throttle(struct tty_struct *tty)
 {
 	struct acm *acm = tty->driver_data;
 
-	spin_lock_irq(&acm->read_lock);
-	acm->throttle_req = 1;
-	spin_unlock_irq(&acm->read_lock);
+	set_bit(ACM_THROTTLED, &acm->flags);
 }
 
 static void acm_tty_unthrottle(struct tty_struct *tty)
 {
 	struct acm *acm = tty->driver_data;
-	unsigned int was_throttled;
 
-	spin_lock_irq(&acm->read_lock);
-	was_throttled = acm->throttled;
-	acm->throttled = 0;
-	acm->throttle_req = 0;
-	spin_unlock_irq(&acm->read_lock);
+	clear_bit(ACM_THROTTLED, &acm->flags);
 
 	/* Matches the smp_mb__after_atomic() in acm_read_bulk_callback(). */
 	smp_mb();
 
-	if (was_throttled)
-		acm_submit_read_urbs(acm, GFP_KERNEL);
+	acm_submit_read_urbs(acm, GFP_KERNEL);
 }
 
 static int acm_tty_break_ctl(struct tty_struct *tty, int state)
diff --git a/drivers/usb/class/cdc-acm.h b/drivers/usb/class/cdc-acm.h
index 515aad0847ee..ca1c026382c2 100644
--- a/drivers/usb/class/cdc-acm.h
+++ b/drivers/usb/class/cdc-acm.h
@@ -108,6 +108,7 @@ struct acm {
 	unsigned long flags;
 #		define EVENT_TTY_WAKEUP	0
 #		define EVENT_RX_STALL	1
+#		define ACM_THROTTLED	2
 	struct usb_cdc_line_coding line;		/* bits, stop, parity */
 	struct work_struct work;			/* work queue entry for line discipline waking up */
 	unsigned int ctrlin;				/* input control lines (DCD, DSR, RI, break, overruns) */
@@ -122,8 +123,6 @@ struct acm {
 	unsigned int ctrl_caps;				/* control capabilities from the class specific header */
 	unsigned int susp_count;			/* number of suspended interfaces */
 	unsigned int combined_interfaces:1;		/* control and data collapsed */
-	unsigned int throttled:1;			/* actually throttled */
-	unsigned int throttle_req:1;			/* throttle requested */
 	u8 bInterval;
 	struct usb_anchor delayed;			/* writes queued for a device about to be woken */
 	unsigned long quirks;
-- 
2.21.0


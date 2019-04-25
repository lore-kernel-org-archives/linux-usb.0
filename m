Return-Path: <SRS0=WMKl=S3=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	T_DKIMWL_WL_HIGH,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36A57C43218
	for <linux-usb@archiver.kernel.org>; Thu, 25 Apr 2019 16:06:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 7CE462088F
	for <linux-usb@archiver.kernel.org>; Thu, 25 Apr 2019 16:06:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1556208363;
	bh=U/m39r4hcDoeXujjyqxCqsrpRPWzKEm20uZJVwcAkKQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-ID:From;
	b=ZCA3u2deoawmndEzMRLvg8hrERP1ak+3bDL/jW5bbY1pc9NMI/AbNZHplbWwwTlfZ
	 TRdgoWFXqs4RlbeTHVXfD93Jt34XYqkCFBZ+K10SE/AdRjoqRbSEfc+02C+57NQzwH
	 T7fuGCwSkX2EzL/RH+TizS6/WOPsINqsi5KglytU=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727032AbfDYQGB (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Thu, 25 Apr 2019 12:06:01 -0400
Received: from mail-lj1-f193.google.com ([209.85.208.193]:41257 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726402AbfDYQGB (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 25 Apr 2019 12:06:01 -0400
Received: by mail-lj1-f193.google.com with SMTP id k8so121469lja.8
        for <linux-usb@vger.kernel.org>; Thu, 25 Apr 2019 09:06:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ghd5sen29/Bi74U3Gibs4OW/k3IhJ+8hQMPkcoDoczs=;
        b=sULMexuYYmaTkwh2n5yNuiT0uTmKAqGvYLxBSzyOdM2oAyNJMOGdwVovp+Gf2L+iC+
         QnIeLttSIuzxtwBwSoqtZ1OoNBSjYgl41eMCf7MLqxr0pwqU7JaKGpmP3zXlgyBN5SVu
         enq6jk89abUDC6vmW1tj8p370BJTie3kx81fJXDVyZDbEfN7hc2kpP+/nb4u23Zl1XNM
         kU1BhPT/oaJbVrklqz8+xOn/fFHlI91bIplaiieuF9EgqMgiED//3AWDoqdZnVVowInF
         gvZ77nik6RFepkcMYBjwxXv7mfYIf6YXa0qUy1qFh/iLvrxd9udb+aTIEqhw9idDKwfd
         iWIQ==
X-Gm-Message-State: APjAAAVicnayG+wl4j+zzVmSCGxu0huYwa0KdPOoS9GcDT3Ch5PzV9LI
        5HTHsfexpFZ1AZcVorTb49aT9R0c
X-Google-Smtp-Source: APXvYqxmXUVq7EWVhdoLUxvlv9dd1RbbpxAbKfu+86pX1OFvSdR6a2/y1P5bJ/Sj1sUC9inQKCsMjw==
X-Received: by 2002:a2e:7503:: with SMTP id q3mr21024994ljc.190.1556208359444;
        Thu, 25 Apr 2019 09:05:59 -0700 (PDT)
Received: from xi.terra (c-74bee655.07-184-6d6c6d4.bbcust.telenor.se. [85.230.190.116])
        by smtp.gmail.com with ESMTPSA id 63sm5132277lfz.2.2019.04.25.09.05.55
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 25 Apr 2019 09:05:57 -0700 (PDT)
Received: from johan by xi.terra with local (Exim 4.91)
        (envelope-from <johan@xi.terra>)
        id 1hJgsl-0002cy-Ru; Thu, 25 Apr 2019 18:05:55 +0200
From:   Johan Hovold <johan@kernel.org>
To:     Alan Stern <stern@rowland.harvard.edu>,
        Oliver Neukum <oneukum@suse.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org, Johan Hovold <johan@kernel.org>
Subject: [PATCH 4/5] USB: cdc-acm: fix unthrottle races
Date:   Thu, 25 Apr 2019 18:05:39 +0200
Message-Id: <20190425160540.10036-5-johan@kernel.org>
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
Message-ID: <20190425160539.DLAvTsDT8Yv8ZemAmHmCjgHqKeccuOwavp4iW83PfmQ@z>

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

Also note that the first race was fixed by 36e59e0d70d6 ("cdc-acm: fix
race between callback and unthrottle") back in 2015, but the bug was
reintroduced a year later.

Fixes: 1aba579f3cf5 ("cdc-acm: handle read pipe errors")
Fixes: 088c64f81284 ("USB: cdc-acm: re-write read processing")
Signed-off-by: Johan Hovold <johan@kernel.org>
---
 drivers/usb/class/cdc-acm.c | 32 +++++++++++++++++++++++++-------
 1 file changed, 25 insertions(+), 7 deletions(-)

diff --git a/drivers/usb/class/cdc-acm.c b/drivers/usb/class/cdc-acm.c
index ec666eb4b7b4..c03aa8550980 100644
--- a/drivers/usb/class/cdc-acm.c
+++ b/drivers/usb/class/cdc-acm.c
@@ -470,12 +470,12 @@ static void acm_read_bulk_callback(struct urb *urb)
 	struct acm *acm = rb->instance;
 	unsigned long flags;
 	int status = urb->status;
+	bool stopped = false;
+	bool stalled = false;
 
 	dev_vdbg(&acm->data->dev, "got urb %d, len %d, status %d\n",
 		rb->index, urb->actual_length, status);
 
-	set_bit(rb->index, &acm->read_urbs_free);
-
 	if (!acm->dev) {
 		dev_dbg(&acm->data->dev, "%s - disconnected\n", __func__);
 		return;
@@ -488,15 +488,16 @@ static void acm_read_bulk_callback(struct urb *urb)
 		break;
 	case -EPIPE:
 		set_bit(EVENT_RX_STALL, &acm->flags);
-		schedule_work(&acm->work);
-		return;
+		stalled = true;
+		break;
 	case -ENOENT:
 	case -ECONNRESET:
 	case -ESHUTDOWN:
 		dev_dbg(&acm->data->dev,
 			"%s - urb shutting down with status: %d\n",
 			__func__, status);
-		return;
+		stopped = true;
+		break;
 	default:
 		dev_dbg(&acm->data->dev,
 			"%s - nonzero urb status received: %d\n",
@@ -505,10 +506,24 @@ static void acm_read_bulk_callback(struct urb *urb)
 	}
 
 	/*
-	 * Unthrottle may run on another CPU which needs to see events
-	 * in the same order. Submission has an implict barrier
+	 * Make sure URB processing is done before marking as free to avoid
+	 * racing with unthrottle() on another CPU. Matches the barriers
+	 * implied by the test_and_clear_bit() in acm_submit_read_urb().
 	 */
 	smp_mb__before_atomic();
+	set_bit(rb->index, &acm->read_urbs_free);
+	/*
+	 * Make sure URB is marked as free before checking the throttled flag
+	 * to avoid racing with unthrottle() on another CPU. Matches the
+	 * smp_mb() in unthrottle().
+	 */
+	smp_mb__after_atomic();
+
+	if (stopped || stalled) {
+		if (stalled)
+			schedule_work(&acm->work);
+		return;
+	}
 
 	/* throttle device if requested by tty */
 	spin_lock_irqsave(&acm->read_lock, flags);
@@ -842,6 +857,9 @@ static void acm_tty_unthrottle(struct tty_struct *tty)
 	acm->throttle_req = 0;
 	spin_unlock_irq(&acm->read_lock);
 
+	/* Matches the smp_mb__after_atomic() in acm_read_bulk_callback(). */
+	smp_mb();
+
 	if (was_throttled)
 		acm_submit_read_urbs(acm, GFP_KERNEL);
 }
-- 
2.21.0


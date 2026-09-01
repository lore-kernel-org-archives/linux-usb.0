Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E044D388E61
	for <linux-usb@vger.kernel.org>; Tue,  1 Sep 2026 19:31:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788291079; cv=none; b=tg/4RAZ+RNqFFxLLNPIABqjytxL+BuOMsN+2Ii6v9WlD14rjjbfz41oTMcTHKKQWkk/Cu6KiWEt+O7Eymfa9/3EOoEthcnG6uUx1OGq5a+iJGxeBi/YCKPOQd83oV/B0ijLlWyyXQqJRvcTROzRZBc3w+UAiun1+Is2EKdOZKF0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788291079; c=relaxed/simple;
	bh=HPaWff7ad15+/qqYBb80wqQI440qqNuTh1fgXKQhG7E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PQXJ6aZqrdZp6jBWgN/K2LN3yYpWig85hj/OeBG+I4hvHDMzmFAuDrPjhLbYOxErn6mxAYF35cVPTh9n5q5atYiPpSVAr7H+W3EFiqE/YqPlq56uuf+8RF+Ji018MtOAyV7oR3u7Hph0sIiLtuHe+99M6juElpBoFyoYKvHxuR8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hB1NDn2q; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hB1NDn2q"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-49b0d78a801so1449695e9.2
        for <linux-usb@vger.kernel.org>; Tue, 01 Sep 2026 12:31:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788291076; x=1788895876; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HXWnWPL9Jm6Pf/hUBZqLJE4XryHGv8N8tEe8FygrKng=;
        b=hB1NDn2qub/pkLjnlxhqsFqbt4+5rj05IuqsKgZPyU2McJWoT6ZmGGdlEsg2NY1Lwy
         rfAWEGP+ZdCbA3OxHMNJNMlB32jqBIY5tAn86Al0dsjIDpBHY1lQhv9B7s8FQmk5FHaS
         4tAi/mSZIE1KFSs4Nv7MBDYKLxCrQJ44kn7hgoFJ6IFc5KfabQKilPA0M9tB1H4+ZMcK
         HxkeHeR8O9hncJ8lReCExG2cxX87DkJA6UQMFoc1K6F27xU0MOkF5gKnwUhPf+6DDr17
         5qN7h5cxj6VcWRY4bJ5BN8PlQWH9xJSKY5dq8nUYsXuIY3AQie8MNNLT92j3DJSgyHVB
         HnZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788291076; x=1788895876;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=HXWnWPL9Jm6Pf/hUBZqLJE4XryHGv8N8tEe8FygrKng=;
        b=rbvlfYMcfNUS0FL/kHGAv2gyOQAIW+hX8bX/ZupVf/aSFMrFZAhoNCDs/Cx6AdJm/A
         g4+8s6ykrMLonRMWJsOpCmFQz9bHS9/hX9SMsHzF99gZUDtWFhzBwfEsfko2tYqJOqNs
         VXHl3nW+6i/FXNaljDKQmsgsLqnB4ml7kp0/SFXjwsrWWwfQkpm0WM/ZboPJH2OBZn1B
         J8UfNcsT8fpfe9viRYIN8vVQfAxYPu3iqfW7UBnySCVcajaXbns3dMutCCTqCFMe3ZqU
         nlM96KEPx/5kbBLvJl0ZJSAdqqg9Z52BEMn4pCHGiaG+mHc/lvRgfNUdF0FcQi0tDUyP
         4HVA==
X-Gm-Message-State: AFuF++miAQ2jtSVwFOIqRuLH1BgRRfBS4U88VuLK740fgNbXcF1Dhk6q
	clMSKiXBepGNS6rmSAYdxDDmaJYkXj/J82kFwT0SDspgqk7zuszlJRSAA1PDM0OW
X-Gm-Gg: AYBFou2RHncyAzGjE91+EHAM18k70+vOs3itR5CDg0RQYbv/+YdzP2Q796iUs5dBTxe
	Y3EDJAXhSE/vuDQk/yYiehXtzSOOOHvZ9QHzTMZ4tEBqPE57hWYwWXTbdEoDoMUhrv/p/APvqvG
	8HnQiKdRIRhsPS4Byh5M1msXMNIQwz3R7PE7kLyjcDquVZ3fdk4tnXBcaNi81OVO2umT0fUGgKs
	yGRpTaxSJvOrRk4s56EYUA0bsgcDrF6+90JQBZ3td2CNr1YklUsPKmqW592boRo4osq42sIZPkI
	EVi7wqwTaaacPAATPa0paolE87WIgWPjKYDi/NizSRAUtNNivvgdlKfaq6HN+k0LlYeJvJR5voC
	K5yd8bL42aGZvxCS9z10BrXzHUtr+1K8+8X8tvetL8+PV+Zo5MwkHz3kTufUKrdrX8S1ScRsE2A
	deUzGv6hIz70pcZfqC7wbOwbC6D6ptAD+EtUFE2qhNcWLhpXydroIrMtyR2KHq5Du6jgQZQo5Qz
	M9c1qLSTwkyyojBdf7wKDA2cfHhHHEOshiE5Yp0TwA3pjegLfX8AKZ0aF7w4GOLpwHAjpeKEUeC
	BfhC7A==
X-Received: by 2002:a05:6000:4a07:b0:484:3317:a19 with SMTP id ffacd0b85a97d-48449f818edmr884955f8f.26.1788291075936;
        Tue, 01 Sep 2026 12:31:15 -0700 (PDT)
Received: from center.jhjvjihww5qejoy14qwv1cc4td.frax.internal.cloudapp.net ([131.189.143.225])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48448e7315bsm1113106f8f.7.2026.09.01.12.31.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 12:31:14 -0700 (PDT)
From: Orgad Shaneh <orgads@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 3/3] usb: octeon-hcd: sleep on an hrtimer for far-off periodic transfers
Date: Tue,  1 Sep 2026 19:30:29 +0000
Message-ID: <20260901193100.1352110-3-orgads@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260901193100.1352110-1-orgads@gmail.com>
References: <20260827175703.1549-1-orgads@gmail.com>
 <20260901193100.1352110-1-orgads@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

cvmx_usb_schedule() enables the SOF interrupt whenever any pipe has
next_tx_frame in the future, and leaves it enabled until the transfer
is due. An interrupt endpoint keeps such a deadline pending
permanently, so a single attached hub (status pipe polled every 256ms)
costs an interrupt on every SOF - 8000/s in high-speed mode, forever.
On a 300MHz CN5020 that is measurably ~20% of one core spent counting
frames.

The frame counter is resynchronized from HFNUM at the top of every
poll, so the driver does not actually need to see every SOF to know
when a deadline arrives. Sleep on an hrtimer when the nearest deadline
is more than a few frames away (one high-speed frame is 125us) and
keep SOF interrupts only for deadlines that are imminent - or far
enough away to risk the 16383-frame HFNUM wrap, where the interrupt
path still tracks the counter extension.

Measured on a CN5020 board with one 4-port hub attached and idle:
8200 -> 4 USB interrupts/s, with no change in enumeration or transfer
behavior.

Assisted-by: Claude:claude-opus-5
Signed-off-by: Orgad Shaneh <orgads@gmail.com>
---

v2: corrected the core clock in the commit message - the board is a
    300MHz CN5020, the 500MHz number belongs to a different board here;
    added the Assisted-by tag (Documentation/process/coding-assistants.rst).
    No code change.

diff --git a/drivers/usb/host/octeon-hcd.c b/drivers/usb/host/octeon-hcd.c
--- a/drivers/usb/host/octeon-hcd.c
+++ b/drivers/usb/host/octeon-hcd.c
@@ -378,8 +378,22 @@
 	struct cvmx_usb_transaction *active_split;
 	struct cvmx_usb_tx_fifo periodic;
 	struct cvmx_usb_tx_fifo nonperiodic;
+	struct hrtimer sof_timer;
 };
 
+static int cvmx_usb_poll(struct octeon_hcd *usb);
+
+static enum hrtimer_restart octeon_usb_sof_timer(struct hrtimer *t)
+{
+	struct octeon_hcd *usb = container_of(t, struct octeon_hcd, sof_timer);
+	unsigned long flags;
+
+	spin_lock_irqsave(&usb->lock, flags);
+	cvmx_usb_poll(usb);
+	spin_unlock_irqrestore(&usb->lock, flags);
+	return HRTIMER_NORESTART;
+}
+
 /*
  * This macro logically sets a single field in a CSR. It does the sequence
  * read, modify, and write
@@ -1908,6 +1922,7 @@
 	int channel;
 	struct cvmx_usb_pipe *pipe;
 	int need_sof;
+	u64 min_due;
 	enum cvmx_usb_transfer ttype;
 
 	if (usb->init_flags & CVMX_USB_INITIALIZE_FLAGS_NO_DMA) {
@@ -1948,15 +1963,33 @@
 	 * future that might need to be scheduled
 	 */
 	need_sof = 0;
+	min_due = ~0ull;
 	for (ttype = CVMX_USB_TRANSFER_CONTROL;
 	     ttype <= CVMX_USB_TRANSFER_INTERRUPT; ttype++) {
 		list_for_each_entry(pipe, &usb->active_pipes[ttype], node) {
-			if (pipe->next_tx_frame > usb->frame_number) {
-				need_sof = 1;
-				break;
-			}
+			if (pipe->next_tx_frame > usb->frame_number &&
+			    pipe->next_tx_frame < min_due)
+				min_due = pipe->next_tx_frame;
 		}
 	}
+	if (min_due != ~0ull) {
+		u64 delta = min_due - usb->frame_number;
+
+		/*
+		 * frame_number is resynced from HFNUM on every poll, so a
+		 * deadline that is many frames away does not need an
+		 * interrupt on every SOF to count them down - sleep on the
+		 * timer instead and keep SOF interrupts for deadlines within
+		 * a few frames. Stay well below the 16383-frame wrap of
+		 * HFNUM. One (micro)frame is 125us in high-speed mode.
+		 */
+		if (delta <= 4 || delta > 8000)
+			need_sof = 1;
+		else
+			hrtimer_start(&usb->sof_timer,
+				      ns_to_ktime((delta - 2) * 125000),
+				      HRTIMER_MODE_REL);
+	}
 	USB_SET_FIELD32(CVMX_USBCX_GINTMSK(usb->index),
 			cvmx_usbcx_gintmsk, sofmsk, need_sof);
 }
@@ -3646,6 +3679,8 @@
 	usb = (struct octeon_hcd *)hcd->hcd_priv;
 
 	spin_lock_init(&usb->lock);
+	hrtimer_setup(&usb->sof_timer, octeon_usb_sof_timer, CLOCK_MONOTONIC,
+		      HRTIMER_MODE_REL);
 
 	usb->init_flags = initialize_flags;
 
@@ -3696,6 +3731,7 @@
 	unsigned long flags;
 
 	usb_remove_hcd(hcd);
+	hrtimer_cancel(&usb->sof_timer);
 	spin_lock_irqsave(&usb->lock, flags);
 	status = cvmx_usb_shutdown(usb);
 	spin_unlock_irqrestore(&usb->lock, flags);
-- 
2.47.0

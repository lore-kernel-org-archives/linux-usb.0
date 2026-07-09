Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CB4A3E0098
	for <linux-usb@vger.kernel.org>; Thu,  9 Jul 2026 20:56:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783630589; cv=none; b=uucFH2P7shAkCPG8ms4K1k5aoOzRgrHU6ZyJPfNtIO35YOW6NaC997qdeefgtUn2cqMEH5mm1r0QRMqkLBKGsaoEEKQs8REi36SM8laTx/WCFE3TpuEOksX1rs9DlMBTnfXJo87Uk7O1IS/8qDeBvqUkitdr84oZDhxDjRjhry4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783630589; c=relaxed/simple;
	bh=3j4syLrTH3ss+LT1uFL+xIlIo+tKkPs2LMGlAzDqXgU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=scuxxaxNr5seJDXy94lnqDEVQIbgb7i+HJp7vE7HUhBN1Me0fpH1b341ryV3SNCgGU9901YmftaFXSA6v9EAouLtYkG6QgFl991/Wz8I/pECxSLR834sJN0z43Wtdtht+AgK3lvilbHMN2ZMlid5NSWV2wgXj22yobGGidjmZV0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ECXp4Z38; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ECXp4Z38"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-47d6c634f45so194174f8f.3
        for <linux-usb@vger.kernel.org>; Thu, 09 Jul 2026 13:56:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783630586; x=1784235386; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FyQ2SYryPffIKXgX/hPe6feFKCE/nZgCPpWlF8Eq6IM=;
        b=ECXp4Z38357s8n3YE3StUPVwlIm8EOi8+0zbJD2MCl4ucPQpK0bdeUpYOYUSn1y5FW
         xy5/XsNWdXVvElOKSoAMZJ9AZmV0meLuQfm9b2NJWbxelCaXs/8VcsiXalU/XbqjmbTJ
         sgsthA0PS3lw8VkRnG8LHZ0toWj1VW/G1h+q/TEDeH2w2LfUgF8OIJQwQyMaaDajg27N
         pMQXvjxF9E6OQKGm+GH1nIdHNyI9HEyWJ8X5//YoP1dGbruz4S1KDG0Qb3u9/KdBdyIP
         Vh8cxJhEMRFl1GFLIhXcuN44SB8RuiKt8xwLEkeb6KXZ+O0ArDiiROMCs5sXh8oF7+7G
         V1SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783630586; x=1784235386;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=FyQ2SYryPffIKXgX/hPe6feFKCE/nZgCPpWlF8Eq6IM=;
        b=UkdXNCeiUwZEFYwEg6WbFW+6efPx0ev20V3jBaLozVra1mKubz+Ox6S3AJqzWabmo3
         g1PSA9gAq4whAzwKygQRVHgIitCTxqOMxuSmJb5OKtmkEQCa9CIc6urAFsFZQK6u8wSW
         vC1OKBBa4POaPhb3Zna5cCnxYuwDRB0ActOHI2O5oVYhfQgOKCHmtuJ0oc8HZ+tWNet/
         2ySegHYDbtsfYN4VhXA2pQpcLzBJsMb9CyNKNrjhMK9hX3Py8Qdsx9rYGYhrFfhY38mH
         2alFAEuo/pab717cPLY90nIxqH7eSiRnULDAmo2TeT4DIzW2Yb33HVEUVx8J0o5/nMdh
         BpmA==
X-Forwarded-Encrypted: i=1; AHgh+RoUY7kEsy9896mGpeNmAhpK3M8CuwHTzbD2Hvw1ZFySVmOrsp6QrS+UkYn1mCj6pb9GNBVIPoCvnjQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YzvviHTpHa0/QLef/A+85X/6rxEDKBjPaaaXWGYplxGY6qT/2gB
	DjPIg73InnUU1EmMXaNeShqHXfi8NgpdgnJYxt+ml0mFGyif7TkqHpWb
X-Gm-Gg: AfdE7cmpToBHKtTqgbJiw/alqni1LPGwQQWDTYk7P2AvbnNtQw2uaWJ+esz4BCcgFx+
	3DYAi8AyNeKv9qBNOylXrhWYO6tz9Mtq1IQewxvShnrCOmhGLB54Jc015Kmuqh//K75k9J3Liv9
	Raw8F0utbZzwSHOlZuN3fPjImm+eyhi0XOwXmkwDXgpl3+o5DxxYFdFbXag56aMf0WGpRVNg/+e
	+vzeZMoL2ZbHFFuPRM/t1l6bD8A4gDjYkFNFQJG5yTWgxDjDSYkag14Wr5WfTniKUkjQ6wU3eCP
	7IEHY8ABH4V5E9hddqhSaq1YRrfXGjgm7CT3oO/YVX+W/16SZUahORZG/8/MRQF7VFwWHS0Dabz
	O+bJEGYGuY0xYwdaeRsP8+wA1N0P+UUS2gYHvnWkZtju4sAvmV16y3LXJOzpJpryvmrIokqfulH
	vgHYZwd0TELrMvyTDpIX34Q2QXUkW3nrdFwjjvZ7qPQWsAva08ZAXHd4AosmDHYCpQ0TqN/OBvL
	Jmr0jGqAhOiLeKa/OfAPjnI/y5sHo/Np7/RjjbP
X-Received: by 2002:a05:6000:24c5:b0:46e:8f0e:2f02 with SMTP id ffacd0b85a97d-47df075e410mr9661610f8f.33.1783630585822;
        Thu, 09 Jul 2026 13:56:25 -0700 (PDT)
Received: from DESKTOP-O40ECIK (108.228-30-62.static.virginmediabusiness.co.uk. [62.30.228.108])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47aa039b0cesm55210785f8f.22.2026.07.09.13.56.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 13:56:25 -0700 (PDT)
From: Melbin K Mathew <mlbnkm1@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Peter Chen <peter.chen@kernel.org>,
	stable@vger.kernel.org
Subject: [PATCH v3] usb: gadget: printer: fix infinite loop in printer_read()
Date: Thu,  9 Jul 2026 21:56:22 +0100
Message-ID: <20260709205622.55700-1-mlbnkm1@gmail.com>
X-Mailer: git-send-email 2.52.0.windows.1
In-Reply-To: <20260703075429.302687-1-mlbnkm1@gmail.com>
References: <20260703075429.302687-1-mlbnkm1@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

printer_read() uses the same variable for the requested copy size and
the number of bytes actually copied to user space. copy_to_user()
returns the number of bytes not copied, so when it fails to copy
anything, the computed copied length becomes zero.

In that case len, buf, current_rx_bytes and current_rx_buf are left
unchanged. If RX data is available and the user buffer remains
unwritable, the read loop can repeat indefinitely.

Track the copied length separately and return -EFAULT, or the number of
bytes already copied, if an iteration makes no progress.

Fixes: b185f01a9ab7 ("usb: gadget: printer: factor out f_printer")
Cc: stable@vger.kernel.org
Reviewed-by: Peter Chen <peter.chen@kernel.org>
Signed-off-by: Melbin K Mathew <mlbnkm1@gmail.com>
---
Changes in v3:
- Regenerate the patch to fix the corrupted v2 diff.

Changes in v2:
- Drop unrelated comment wording change.
- Add Reviewed-by tag from Peter Chen.

 drivers/usb/gadget/function/f_printer.c | 23 ++++++++++++++++++-----
 1 file changed, 18 insertions(+), 5 deletions(-)

diff --git a/drivers/usb/gadget/function/f_printer.c b/drivers/usb/gadget/function/f_printer.c
index e4f7828ae75d..a22e2a6ea14b 100644
--- a/drivers/usb/gadget/function/f_printer.c
+++ b/drivers/usb/gadget/function/f_printer.c
@@ -432,7 +432,7 @@ printer_read(struct file *fd, char __user *buf, size_t len, loff_t *ptr)
 {
 	struct printer_dev		*dev = fd->private_data;
 	unsigned long			flags;
-	size_t				size;
+	size_t				size, not_copied, copied;
 	size_t				bytes_copied;
 	struct usb_request		*req;
 	/* This is a pointer to the current USB rx request. */
@@ -525,10 +525,12 @@ printer_read(struct file *fd, char __user *buf, size_t len, loff_t *ptr)
 		else
 			size = len;
 
-		size -= copy_to_user(buf, current_rx_buf, size);
-		bytes_copied += size;
-		len -= size;
-		buf += size;
+		not_copied = copy_to_user(buf, current_rx_buf, size);
+		copied = size - not_copied;
+
+		bytes_copied += copied;
+		len -= copied;
+		buf += copied;
 
 		spin_lock_irqsave(&dev->lock, flags);
 
@@ -543,6 +545,17 @@ printer_read(struct file *fd, char __user *buf, size_t len, loff_t *ptr)
 		if (dev->interface < 0)
 			goto out_disabled;
 
+		if (!copied) {
+			dev->current_rx_req = current_rx_req;
+			dev->current_rx_bytes = current_rx_bytes;
+			dev->current_rx_buf = current_rx_buf;
+			spin_unlock_irqrestore(&dev->lock, flags);
+			mutex_unlock(&dev->lock_printer_io);
+			return bytes_copied ? bytes_copied : -EFAULT;
+		}
+
+		size = copied;
+
 		/* If we not returning all the data left in this RX request
 		 * buffer then adjust the amount of data left in the buffer.
 		 * Othewise if we are done with this RX request buffer then
-- 
2.43.0


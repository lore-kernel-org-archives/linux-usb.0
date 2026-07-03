Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 050D4341050
	for <linux-usb@vger.kernel.org>; Fri,  3 Jul 2026 07:54:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783065275; cv=none; b=nNEMSRlh3p8UFvguscyh51fg4r1m4Apv7qfjE3vtRVAzx5g5VNOK4yPOZ7m1Dn0g5jB9VrivEJeyXUojvsejWDslY80WLfQiQqsLCf+eZwHkwORunHsg0LtjDjL52gdxjhCaIlBGmv4Ghx0dxNybbs9QszG/5nirhtRtC/vcdms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783065275; c=relaxed/simple;
	bh=uUEaGr257SVcEghz/VrSWTnDL6TlG6Mg+al6N5GpqDM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ndEA6BCWGvdclasyVJQBXVLku0N0y/A3fZmJkM2v0+hfVnUrN2MTncksZx2h/m1UigyYyW+Zmu2c/wbdyMldOrdybMx5640DZpAaLTncNq7l4iHavIImTalNaXNJY8A31Bu+G9iPlrv25yV3AWUNVXlC8B+9qNmY9j20Ga2Juwg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cFb1tIMs; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cFb1tIMs"
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5aeb8c19017so329453e87.0
        for <linux-usb@vger.kernel.org>; Fri, 03 Jul 2026 00:54:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783065272; x=1783670072; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N0uc9u/smgtycisGY64visu/9W154DzGDHnBARqQPUc=;
        b=cFb1tIMsIhpgVHLSScCl6MNZtqfZPl9bpUvqT1HafhXU7CNHe4/mHl6KmmT/47WpJ/
         rx9wO02iIfFd+imkKIs2jT4Xvxk1hmo+pZT2H7CAyIrt/n8ZwAf8UtFnbnksnMdROoAu
         gPRw8ddATUbZK5z87sivuizKhEoY9v3RlHF+/NsoUcFh/beVh9UvPVS/F3fgB6cEWAS6
         y0Cd4PO1dw8jn0SVy+QmdTY+kMWEtGmCkaii1h6P9XEOqo8XmbOQuIXNcLpU7jif12gP
         fBvntK/BF/CtFO5qdybest2i/INeJvrdiqoOmda6SzhNO06pyzwPqgdx3Y0/W0frQnjf
         gMgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783065272; x=1783670072;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=N0uc9u/smgtycisGY64visu/9W154DzGDHnBARqQPUc=;
        b=j7TPiOsSMvsdFQCt1v9EbQy3sNw3mGxhZ5sC09BbOW3RjQLYjgTltcRo3cXGSjQCQn
         rRHTPMFp3Yr/TSb1+XlnFi1nb9ravjZfno4PtjAkfyyUyinoXIS60vQ+dZrI+ZtpLEAP
         7dU/fu9CMBvbTD1re6wSltPEbSKcWNUmbhq53dPZuW4LVB1pB0zdjV3A1VbG8/2dHzBb
         iNW/px00dZRm6Y2PBAKIx14H9Lp6Dip9ia//RXLPNYLBGbtWx/Ha/rNvVbL7FQ0U6l1L
         1R+blgaorpinYDZMynydpfYg1xuqRD7NVU9bCD0VLhe1pKwE0wxJUAtAC2gVzvutZ3rj
         76RA==
X-Forwarded-Encrypted: i=1; AHgh+Rq3NI5nn7j6nNWmk/hmqpv7HXLQ+i59pPeyj6G5NYaPM2o8ISky9e9XBG3qdk3V6wQUXfOI5L+Aqng=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzd4V59naF0Aj80ktRjf0oSDKcsdDrcfr0rBa3T2rW1W/lyt2xX
	KoBrZ0rd34lkA27YrxilFJfbx4hPxLD/BsFaQGOqfr8CUcipEv7XDTXc
X-Gm-Gg: AfdE7cnSCbeon34abt3n/79p03zPwqb0gArDgB0e2qKuhDEyuhTuyfLEcvKRJQVpznx
	ZPRDisJP0AWkx809tc/ketunrygpGCW0OKlld2pIobz345OHQqoAcn1YSeXVxJRXsas0uQObPOO
	eA6rClpggWZ7w7fxk4SJqrSRypmJlwpRm0lMac4gRx9FcWNHAIRAyZNDLrZ00t4KSyh7eG7vocG
	mUgOX0sP4pvL4IXPCEd0y6U8J4ouZisj4gA3oGLBBDmPD4onvN7iUEpHGAOmqBPNi74UvSwobco
	x9dRmdoM2Be49FHRI0aITTIFCoHM50YXAs3Ig1IhGRgElkzW/nWW3AvvvCn9be/Qeci71IGX/EQ
	y946UueO3HTo8/kHJpm9aorlyiuUFzmpkfF05MpFa2tQ6ZxLZMJRW73SfOaw7zbS2GUSvr4fwFH
	fEJKbY9fM//6sauLfdn/z3QT/SulSWeYk=
X-Received: by 2002:a05:6512:a354:b0:5aa:6c66:e343 with SMTP id 2adb3069b0e04-5aec68b72f8mr1670652e87.38.1783065272010;
        Fri, 03 Jul 2026 00:54:32 -0700 (PDT)
Received: from localhost.localdomain ([2a01:4f9:2a:1c13::2])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aed13bb768sm285986e87.52.2026.07.03.00.54.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 00:54:30 -0700 (PDT)
From: Melbin K Mathew <mlbnkm1@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Peter Chen <peter.chen@kernel.org>,
	stable@vger.kernel.org,
	Melbin K Mathew <mlbnkm1@gmail.com>
Subject: [PATCH v2] usb: gadget: printer: fix infinite loop in printer_read()
Date: Fri,  3 Jul 2026 09:54:29 +0200
Message-Id: <20260703075429.302687-1-mlbnkm1@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260701205320.227791-1-mlbnkm1@gmail.com>
References: <20260701205320.227791-1-mlbnkm1@gmail.com>
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
Changes in v2:
- Drop unrelated comment wording change.
- Add Reviewed-by tag from Peter Chen.

 drivers/usb/gadget/function/f_printer.c | 25 +++++++++++++++++++------
 1 file changed, 19 insertions(+), 6 deletions(-)

diff --git a/drivers/usb/gadget/function/f_printer.c b/drivers/usb/gadget/function/f_printer.c
index e4f7828ae7..e346e4c26e 100644
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
@@ -525,14 +525,16 @@ printer_read(struct file *fd, char __user *buf, size_t len, loff_t *ptr)
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
 
 		if (dev->reset_printer) {
 			list_add(&current_rx_req->list, &dev->rx_reqs);
 			spin_unlock_irqrestore(&dev->lock, flags);
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
2.39.5


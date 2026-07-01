Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D3283A7F6B
	for <linux-usb@vger.kernel.org>; Wed,  1 Jul 2026 20:53:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782939205; cv=none; b=A20NJAsUJF/VJmwNDXQIi1cDwvmT+C6ODTjbEZSzbAbxeBJGsbLPyboca6jk+E3/7/qe9eMzI1KHv1X15VWjS+CEmfDwA3MWr7yaopyoUU5wem5P20WpqXJRN8TTBCEb56VXL07sOXRN8/VK/606+iRs+8ne9VK8p0m1x8d2w1g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782939205; c=relaxed/simple;
	bh=+ytVn4F8B82MF7fCTwoeLkSOK6REUhITxK2y1XWLzJ8=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=E8IB18TKY4Rx8NVpcKv8YNrtp4GYkGTWbBX7gjJqZnpTM3DiAh+OscNdN6PYaDmco5wftlRFfGuPqsoTak4LTMHBibaDaOf6CLon0GCWO8S4Vu/OTRIGDBNH6D8tz/pWdfYQ7i43tqUujCIZx+BBpc8gbgPcKNR479R4D/KaJ04=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CJBjvnl3; arc=none smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CJBjvnl3"
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-39af87c4589so11570431fa.2
        for <linux-usb@vger.kernel.org>; Wed, 01 Jul 2026 13:53:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782939202; x=1783544002; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=JTEVuNHRith4UNmKhVedI/AI7ZCuYkzxvsw4lmOysQk=;
        b=CJBjvnl3HjhG4mVGoRhvnR2KvXPhBDoUJgm/dJheH49tIlfqQ5AxABjfzi+1Y9USaV
         GjCNyJH2/bgtI/JrFm6X55r0rkcqW+w1r4YOdNN4ACnRaptjEhS6m+Gq/Ewb4HUaHtfC
         SXLs6j8csv6A4yeTwD2PpVYSC+iItImivZ4jUKCfdJ9xqAeJj+jpL9v0UXPG86is0QoB
         qDS1xM6+fQ+qUoBDx2+XNgIBGyj9LWRHgMFFuRH+utTtR0P9zgk8YyrJz/SIb1MoTc5m
         K2Bu4YcJA6B31JnYRBUPfOeLtNXjihMJb5ygWkVdGQCMqdlz8FNwYjHEsbIfJDOynwAn
         2gCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782939202; x=1783544002;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JTEVuNHRith4UNmKhVedI/AI7ZCuYkzxvsw4lmOysQk=;
        b=JRiuY+6byYNIyKGyRZBqTl1SSufOCPatrJPgPjG95cveGZJot0hRikT3cRJHFRM7kQ
         jRCP17ghH0OrQTkS5gyXS0A2VaJ7b6nFwH8bbQ5veJIbWAupKvZ/gHcTLphr/OWO2VZZ
         xqTFsO2uKUV7XbBXSXztsGC3s4rdcltG7tyH+7njgsKElrHOx32JQ2xcIFGQHnurJUej
         AOEcv9iFW4hJsd0neQikncbC9dvLn9cp0zG/QaRYqhOmmD5wfI5shHqK1Fw4CW24YkVX
         Va4mIQvMOOlAh9A0j9ny9FlqP0M1PMPE51OwUuTkfqyDUJYsMlJkmpDThLc4OyJbiRGp
         nQmw==
X-Gm-Message-State: AOJu0Yw0zBo4SqNqTJwJKGwflpAvOvgo209H8EHbPjoCcQ9wlZ+Y6pUi
	QAEtTSmtoFkD0xJRVtOr48ZAb11Thhf4sRFUwKAV0nIX2NEOCcPhEzaYRenRC1lbH1w=
X-Gm-Gg: AfdE7ckakfJiXk/ci3C/JNp6570QVVvD+5xewLFlGMy8+4wod4O3aw2gEqu4lRLRGQ7
	EdTZJq3iZvbyr6ctrnQ2P5Q/3VWgK9WWYRReABWnAa9MV0579n1aZgY4C9KUoJ1HAlOriY3Dm2a
	rtSC9IAxun3yeVaRMunPWBeaXVDWDWxtzSaVfiP08mtetK40ryJRu3ADaJoovq1MDik8EeRnNn8
	4QYAgdEodGCibXZ6zEjgYpeMwb/ujx+iiowf4u8BJQW66GmRbnz2kV1jwVYPYUU4hHt6WxEbA+E
	4/1Q5FEUxmXdBKGPhUKMVSC4/SRxLilXvYRp3yjp2dRmSU1QNYZ0j/fKFjK7/RhA9HARJf60OKG
	hcpcXANhAnO3v6/ljqNeyB+MSmgKveeJ4eScYzAEjrylWluVuVfMosZlMzE0eggpo6uejUKJtWX
	RMZEvVeezBnUihlp5e/RU6Jn7sR5b4VF8=
X-Received: by 2002:a2e:a99f:0:b0:39a:e7f6:49a7 with SMTP id 38308e7fff4ca-39b340d4031mr8050511fa.28.1782939201478;
        Wed, 01 Jul 2026 13:53:21 -0700 (PDT)
Received: from localhost.localdomain ([2a01:4f9:2a:1c13::2])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39b37fe594fsm2237911fa.31.2026.07.01.13.53.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2026 13:53:20 -0700 (PDT)
From: Melbin K Mathew <mlbnkm1@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	security@kernel.org,
	Melbin K Mathew <mlbnkm1@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] usb: gadget: printer: fix infinite loop in printer_read()
Date: Wed,  1 Jul 2026 22:53:20 +0200
Message-Id: <20260701205320.227791-1-mlbnkm1@gmail.com>
X-Mailer: git-send-email 2.39.5
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
Signed-off-by: Melbin K Mathew <mlbnkm1@gmail.com>
---
A small userspace model/reproducer is available to maintainers on request.

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
 
-		/* We've disconnected or reset so return. */
+		/* We have disconnected or reset so return. */
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


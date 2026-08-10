Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF8233D3334
	for <linux-usb@vger.kernel.org>; Mon, 10 Aug 2026 12:12:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786363938; cv=none; b=TIErlVatSan3qEr/vobmTTemRdsXnFIlBeIhuvTukHTP5y/KHdsAkTRXu+wgwU58g3xmkQrzDqmsvDGNC3HOADLGSpZs77C/z4seZvx7WXPQE3RRb0QtdK0OTb/tHBfXrO6u60/aeXtJFYdQkX9+Sq+m9zonVXRnybXEcvhywX8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786363938; c=relaxed/simple;
	bh=n5t0F7BzvSgZNkQJ/YimmEsQrhjAMXpb16NZlz8/d+c=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=aYwRAYCVPG+EwWwO+gnpgiRt5xR8r0QrQc0CzNpuxae2Fh3Axqd87FJ1h3/C7R1xofMKvwmJdQA77wuc+7bZ94cv4xNZ+RaA4hqHMlXL/Lhqx2HAwOkmNhgnBCVn0Rf0aMxS9CBb2TcVn6AeUyWfhgjf51VcQ2TuO7lEeabcK5I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PhUxFIVc; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PhUxFIVc"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-496bb7cdf51so25620865e9.2
        for <linux-usb@vger.kernel.org>; Mon, 10 Aug 2026 05:12:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786363935; x=1786968735; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vSwL7aNN7hYKFTp1kfxgml5r4vyPUCqPEJX0Du3qOqU=;
        b=PhUxFIVc/mq3gr7q9AmqhOvZQtBz0K1YA/0aKVNE0v1fb5VW8l8scvoXwYb9sz4TO+
         BTb6ywr2TppJpXQLZH59MjvBV62FoAhC2+bvamOwi95lzLgnvSfYb1onSM8oU7uRJ6lW
         6Il1v1cEDr6xNz7K2CdaJ+mIzbJGFqsM5RI+a9Shlj0xYOSyR1GF8lSAZQeDSXTe0Tvg
         Z2wY/kk7z+/2Z1PXiirXOWHK6N1Gj51n1IOoRkzKJ/eaE0mMe0pkNeULaJZbva/hKv0n
         8BayK+k3/RKc2YKldjkoTE+HAI5OSRAe6RRXQ+K9mKl4KqUQfyrqrPfwgN03Ea8Hfhyc
         fxtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786363935; x=1786968735;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vSwL7aNN7hYKFTp1kfxgml5r4vyPUCqPEJX0Du3qOqU=;
        b=Gp6hkGcstkTHnDUZESsXmKDY/cayXRlujs9CPf6H2Xtm6rjxK6hqNeOPAfBy/nc8Jp
         g+d6UBY4xA7+dXgKYk00GLk34093mwFCYoIkBPAw0yIf3hjmXQHHhGBqorpd/P/AkCMd
         ZyCJrOxnoEEwTdethOQOyqZ+7Nzxi2IGR0bfvvnz7aO4z6uLcIkOhfCFP0D2Yc/WkwBA
         65vCEBOhV77Xq52P+EkSsvw4/956y5cLNm5eqlI4tkwLvpeqB24Mf+ioDwDsenpiHz8y
         +57tvHuUjnlJPQgGpE6wR9rcfldE2oLDP8lzilabMXX/hWKPf4JZRqWboMTHQSelefLJ
         AumA==
X-Gm-Message-State: AOJu0YzBzrjEQkFvG7vLjYTAlPeVvPNJ16FRzMb76ypENnKQCbwUgZN1
	5cxQQ+RCWpo9vvn+p09g+ve6/ZfYNruOYmjVkbciPrRj++9Kt4qpT9jW9f0V0qRQFOCP+Q==
X-Gm-Gg: AR+sD10f41wzXvh80efnKHRIA/QTTr7gn/lrslJDIwB1CadidtKefh7g5DSOYO8k/oZ
	eE42b1GX4Q2znHBmGCgF5LITdYH64uJ/5mZnyd2YI1ouQNXnP65aD1fvptY0lp8t+SDCDSDS4hk
	uAVLZi9TH037s9X5aAgQv8QZiKPEt3IwBgh69mPlThHNpC9DkMigqWqdUZuA+Wdcl4GBkgkxOnv
	uM0mvrjdn0GOs80J0lXN0F6O0znRyGFt1byAXFoWno62s4GnQXmzVS3yyrgyhc8DHoozTU7jKdc
	u5yOj5RMJ6V+Y0Jrq4ZX+YAxzkBfYwgGQJVd9JPwvdetJkcCxTcGkm5mpvxW4TI8dZxRlNf0DgL
	cT/5P0s/G0nxDhNeEql0yQa59NfUSJ0+dqLAqF/GlXAm0fQ+NX1+xblONDw1Un65aUmEnvVlKbx
	771uNtRSQvW3sNgbF/l83PdfdHgDbeN/O7ZTCt2kLZbt2P6r94nPKe4Mq5EA==
X-Received: by 2002:a05:600c:840f:b0:496:c1f3:e8fb with SMTP id 5b1f17b1804b1-4994e71ffafmr549042025e9.8.1786363934643;
        Mon, 10 Aug 2026 05:12:14 -0700 (PDT)
Received: from kali ([135.136.16.250])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4995e9f9424sm254883645e9.8.2026.08.10.05.12.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 05:12:14 -0700 (PDT)
From: =?UTF-8?q?Miguel=20Pe=C3=B1aranda?= <mig.penaranda07@gmail.com>
To: linux-usb@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	gregkh@linuxfoundation.org
Subject: [PATCH] usb: usbfs: fix use-after-free of usb_device in usbdev_release()
Date: Mon, 10 Aug 2026 14:12:09 +0200
Message-ID: <20260810121209.795089-1-mig.penaranda07@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

usbdev_release() drops its reference to the struct usb_device before
draining the list of completed async URBs, but that drain path reads back
through the same object: free_async() calls dec_usb_memory_use_count()
for any URB whose buffer came from the usbfs mmap() region, and its first
statement is bus_to_hcd(ps->dev->bus).

After a disconnect the usbfs reference can be the last one, in which case
usb_put_dev() frees the device and the subsequent loop reads offset 80 of
freed memory and uses the result as a struct usb_hcd *, which
hcd_buffer_free_pages() then dereferences.

This is reachable by an unprivileged process that has read/write access to
a /dev/bus/usb node: mmap() the fd, submit one URB with a buffer inside the
mapping, wait for the device to be unplugged, then munmap() and close().
It reproduces on every attempt rather than being a race, because a live
MAP_SHARED vma holds a reference on the struct file, so usbdev_release()
cannot run until the last vma is gone and the freeing branch of
dec_usb_memory_use_count() is always taken.

  BUG: KASAN: slab-use-after-free in dec_usb_memory_use_count+0x3ae/0x410
  Read of size 8 at addr ffff8880122ee050 by task poc/769
  CPU: 1 UID: 1000 PID: 769 Comm: poc Tainted: G    B    6.12.94 #3

  Call Trace:
   dec_usb_memory_use_count+0x3ae/0x410
   free_async+0x2aa/0x4f0
   usbdev_release+0x375/0x460
   __fput+0x3ea/0xb50
   __x64_sys_close+0x86/0x100

  Allocated by task 11:
   usb_alloc_dev+0x55/0xd90
   hub_event+0x2524/0x43d0

  Freed by task 769:
   kfree+0x121/0x360
   device_release+0xd2/0x280
   usb_put_dev+0x23/0x30
   usbdev_release+0x2d8/0x460

Release the device reference after the drain loop instead. Nothing between
the two points requires it to have been dropped.

Fixes: f7d34b445abc ("USB: Add support for usbfs zerocopy.")
Cc: stable@vger.kernel.org
Assisted-by: Claude:claude-opus-5
Signed-off-by: Miguel Peñaranda <mig.penaranda07@gmail.com>
---
 drivers/usb/core/devio.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/core/devio.c b/drivers/usb/core/devio.c
index e191934..486ced7 100644
--- a/drivers/usb/core/devio.c
+++ b/drivers/usb/core/devio.c
@@ -1113,7 +1113,6 @@ static int usbdev_release(struct inode *inode, struct file *file)
 	if (!ps->suspend_allowed)
 		usb_autosuspend_device(dev);
 	usb_unlock_device(dev);
-	usb_put_dev(dev);
 	put_pid(ps->disc_pid);
 	put_cred(ps->cred);
 
@@ -1122,6 +1121,7 @@ static int usbdev_release(struct inode *inode, struct file *file)
 		free_async(as);
 		as = async_getcompleted(ps);
 	}
+	usb_put_dev(dev);
 
 	kfree(ps);
 	return 0;
-- 
2.53.0


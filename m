Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A04454A7C6
	for <linux-usb@vger.kernel.org>; Tue,  8 Sep 2026 13:50:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788875415; cv=none; b=gNbqk/mERdU46pBrFg8493MkTGfVMiwSRn4NhxwJhi/VkcObzZcdiiTGxyh9v/c12w2OuDngXlb7v7usJx9CB1bXJMtSkTeUFQxmlnnL3h3f88mGvYIvrsv4iryHq1k+IrEAunH6gvAB27pz4xgRmEf/w/9Al86hLBUFBrP4HMA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788875415; c=relaxed/simple;
	bh=ar+43dOz2VmIYxEzbU/l1wzEmSyVzI2Ez00niz1s1oQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Brkl+IwBh4T7lD39tuXec3iAmP5Rdff/f0zoWv6Edi26or8ISQV3Akh27AKy9ReSW+ipSutoElUhaTAlO07ALyhMQudX/5rz+G33sP8yGYn/iV4Ds/wTr6jyV0qqSRMOtWGhkdg2A5HApjNxGN67CTs+B9xfzXx+zYDwAYBbqVM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BY6rLeTc; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BY6rLeTc"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4956869750eso41716965e9.2
        for <linux-usb@vger.kernel.org>; Tue, 08 Sep 2026 06:50:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788875399; x=1789480199; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=CwxOcnlvcy9U0HQiJwkZMzbvB1txUIVhCVffQoriU+0=;
        b=BY6rLeTcGX80rOeajVwyXLN41Xcnj81oMvb07r1CEN0QEnEYwATqX0MbTe7zL2He2k
         2niDN40DprTmDlPtcrOk+mVu14M/RTb9jiY6JMR08b2xqIrFqyjmvHFoTwNMA2HEcWsE
         CBHKTFz+n2bJS/EExgqTJYNQ+JcUKuW+COCupeU3CWOvLjDxMHR5C3cAKV4TxjAzJjIR
         udra7JtfL4l+d46U09DxwFYzg/y+uYnS3JUIBVVxgjP+dap1dA0YNn8waUZFuwyI3uLS
         tMRU+98AHGtubjM9sqySAw17VQn+kKrOhqpGAJ2EFdVEktHCBf5GnLT/ia2soq++dx65
         Dkfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788875399; x=1789480199;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CwxOcnlvcy9U0HQiJwkZMzbvB1txUIVhCVffQoriU+0=;
        b=pdni0sPYvwJ/XGlS/mJUBxkZTnvUkZ9xTU1VA/4Kxr0OGFI0ZQTxfnqz+BRmoBDZKc
         7WZJk7HZtJw3CBof6a6OYkCD1YlXFb5MH5yC+44bEJknTVldN1gLZGIhO8uvQ3YZGcWo
         qeYd4xyMykVjt0s/ZceKr9YNEeTqBKJ5oFRYyxdowxZlWmi6kSN+KGL8fzMb0H5UKbEn
         nWxiE4Bq/Q+WEJU3TlCKTgrjKJIzx/2IeUrC535T0jA+elOj2slAHc4gWNwGVD5ZmWMe
         O4UsnbmDCuyADOOrDw4ln6rtDz1RcqdEiO8M1mV0c07JIDseAKg2JiogO21pcktrIXF+
         G7KA==
X-Forwarded-Encrypted: i=1; AKwUvBwDFG8eEqViQQkUhEJCXFnrPAGBbV5Zhg362PIZcD2/HDJ6YRIiYmO3jIg6LfbESf697xSw/c2cgxg=@vger.kernel.org
X-Gm-Message-State: AFuF++nFzxjI5Q6T1FDnrPhAxxu2DFr2HxV/G389ZHt7wRfVGij/X2ie
	ifyYTjti2GL802H1kdG7uSwI3PxAd7oT/miY1HoDT83/3bcTEYc2vhKouwxN1hJW5sI=
X-Gm-Gg: AYBFou1+56w48lSYbaHHnqIqIx4k4DuvEPifsRE9G6V1LuknmOzsSpuOcEDHOWVbhWI
	VCqDMxJ+X8NLeGRotp2QORXnGQ0F28mfELuUclRLKxlVdsnmrcVrpQ1AFuVIdlZu2/hvKCt4P4z
	jOtpaE24fCkFgeIRYM3lInSzAiam8mqRM/+4s7215EjAczp7OjiBCR485R75XS1zjBBGLoqjkox
	T4oaTk3hta63gV7k4Px7ZbJ/jRzPmhVyEinGdk2ADojOGtJ+0NZmLHWF4SSHzrStB7tRVcPXa7S
	r1gao3vi9+hVBCXUKiCeeI+y0ZYOMDrSe+QNsCnW09aLtPMipJAmPOv6Tyra+hf3xsDaQ9XSlpL
	c6VTkwj6f4Rf1WfStEGnp9YeJLKpSafuoquvoVJ3NtyNtUw0izdI9x/NJcznD2GFLengr7vJx/D
	L35W+FcfSyZ0o8uA4GF13n/JBmQRMFDQeK6LpTPU+EZ9V6csZ/SXnIiFFDREvsH/zsw7rMbU458
	Y7uWaiYNHm9OIQ9OF3Dp6q0H3nRaBVg
X-Received: by 2002:a7b:cc91:0:b0:49c:ff9f:f6b6 with SMTP id 5b1f17b1804b1-49cffa00196mr188444915e9.6.1788875399076;
        Tue, 08 Sep 2026 06:49:59 -0700 (PDT)
Received: from LS-Tayyab-Farooq.dreambig.corp ([125.209.88.14])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cf7736132sm389144795e9.12.2026.09.08.06.49.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 06:49:58 -0700 (PDT)
From: Syed Tayyab Farooq <syedtayyabfarooq08@gmail.com>
To: Valentina Manea <valentina.manea.m@gmail.com>,
	Shuah Khan <shuah@kernel.org>,
	Hongren Zheng <i@zenithal.me>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Nobuo Iwata <nobuo.iwata@fujixerox.co.jp>,
	linux-usb@vger.kernel.org (open list:USB OVER IP DRIVER),
	linux-kernel@vger.kernel.org (open list)
Cc: Syed Tayyab Farooq <syedtayyabfarooq08@gmail.com>,
	syzbot+31117fde582fe6a0cd62@syzkaller.appspotmail.com,
	stable@vger.kernel.org
Subject: [PATCH] usbip: fix use-after-free in usbip_stop_eh()
Date: Tue,  8 Sep 2026 18:49:02 +0500
Message-ID: <20260908134914.3169-1-syedtayyabfarooq08@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

During device teardown (e.g. when unbinding a device), vhci_stop()
calls usbip_stop_eh() to wait for the event_handler workqueue to
finish processing shutdown events. usbip_stop_eh() uses
wait_event_interruptible(), so if the user-space process triggering
the teardown receives a signal, the wait is aborted immediately.

Since the return value is ignored, the teardown path proceeds to
free the vhci_hcd (and the embedded usbip_device) while the
event_handler is still actively using it, resulting in a
use-after-free:

  BUG: KASAN: slab-use-after-free in vhci_shutdown_connection

Fix this by switching to the uninterruptible wait_event(), so the
wait cannot be short-circuited by a signal and always completes
after the event handler has finished processing pending events for
this device.

Reported-by: syzbot+31117fde582fe6a0cd62@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=31117fde582fe6a0cd62
Fixes: bb7871ad99ea ("usbip: event handler as one thread")
Cc: stable@vger.kernel.org
Signed-off-by: Syed Tayyab Farooq <syedtayyabfarooq08@gmail.com>
---
 drivers/usb/usbip/usbip_event.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/usbip/usbip_event.c b/drivers/usb/usbip/usbip_event.c
index 0e00c2d000f8..81d761891184 100644
--- a/drivers/usb/usbip/usbip_event.c
+++ b/drivers/usb/usbip/usbip_event.c
@@ -115,7 +115,7 @@ void usbip_stop_eh(struct usbip_device *ud)
 	if (pending)
 		usbip_dbg_eh("usbip_eh waiting completion %lx\n", pending);
 
-	wait_event_interruptible(ud->eh_waitq, !(ud->event & ~USBIP_EH_BYE));
+	wait_event(ud->eh_waitq, !(ud->event & ~USBIP_EH_BYE));
 	usbip_dbg_eh("usbip_eh has stopped\n");
 }
 EXPORT_SYMBOL_GPL(usbip_stop_eh);
-- 
2.43.0


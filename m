Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 604C716F288
	for <linux-usb@vger.kernel.org>; Thu,  8 Oct 2026 00:34:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791419679; cv=none; b=lM2lt3tuuLq64ORJpTb1H4Oe8oCVnkdw5PYQj+4oOyMylDWntdd2rVQVyb3qVJJumaL2ZY6BTGcd4Lxvh7ZWXAtN19cUxK6FzkWq7ngz963mT8tWsJLJ1Yu4902rDTAG8bdEBBAltm4ASoS48dBW71rawkDFHkHvlEh1teS3y3w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791419679; c=relaxed/simple;
	bh=tOx1nEU5HsywsGyX3YhjHOQTmaL0UfLjuC7MsW973WE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=F8Z/4gWmj0bmsw74rtyt3xmbc3pfIzXrK9gkyb7vhczLEA57ijQeXk0BN9f7Iuau2KYDF4RLWtbXMgNu3spSf8UVyFMFYx46qWrFFvOZHDlbDFfULyYLwZ8rqF2cKBEvgun7WoqfMLUjITsx/S3EiqeyLSVVblthuNRrvw6RnYA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Pl2z1t/4; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Pl2z1t/4"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2e608cd460eso8662855ad.3
        for <linux-usb@vger.kernel.org>; Wed, 07 Oct 2026 17:34:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791419677; x=1792024477; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=98AWZAZuc9VdjoCVD8NZ7AG4j/XWa1qw2xn1gi50RyQ=;
        b=Pl2z1t/4fUGUTa+d7hF5yScMeqhP99nDiz8Byw2yeAFXafK48N2T2ERKDOifUcgRg9
         /lMwif6TLjCpWe//GMcrw7qWn4TvwN62ClcKEVwa6vmBg7MqCJMtDc7MeqRMyHdZ8pOa
         RiBWIHy4GxMGncvKxlsSi2ealIf6H/g09nlA79/Ev3gxIAv1l2g0MWumkG4ye7yZ8H8b
         oHdQlevdobargCwXFaAU9y8rb3bBPOf+xtSLKw3qShcYzDgzV/fxTmHkHoz0DIjROUPy
         Prit7J8w8huisIK6QLyeLu1aBwYr5/cZjYLyeGydSXE4DvBKKlfQiDdfgm5GkM+xMuHY
         dQJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791419677; x=1792024477;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=98AWZAZuc9VdjoCVD8NZ7AG4j/XWa1qw2xn1gi50RyQ=;
        b=0IMP/U/XSJ/GakLlIK8CMCMJfPE1pxGK5ngRkrk2pH6/n0Oh5EurfUrKoeSYqAijxy
         cZGLRy5iaY1y3wCM+C9EUPqM9zouRk/Dy09jmfiqn62rUFmRTmi8Pw6duy1FZr0CT0r9
         sTkorrXvly955T/D8ZzXT9fVkJmI+Z6dl94YZvYzDSyPSVZNPYmJi5rzkllfOLS4Gwo5
         0XYmDDwmqtqqz/Hw6U0E+ecAulOf9G76oAqkiW7sXzluGRPxYg3ABX1E3mec8QfzTMv1
         m4zgMHfS09wB7xa5Swe+fIrydb82FxTHPI4M18pYL0HgGPZv7MQtKLOOYLBx1kH4L5B9
         mFQg==
X-Gm-Message-State: AFq9FYLaWTkcIkZ3aUk83uWwciSXE1pljaH0uNxxhalUZ2zuiB8ML19j
	5nl+hFyKctTxfgcJcyhMWMeSJP+qNfdX/6tv++Q3sd6jIx3fKqavrQB7
X-Gm-Gg: AYBFou2qUIFANNw1koAvisJlU1zGTAZJqCpXQNSIhCOzyN22djearlmHDMwtuwjhAQY
	TbIvk4ugS/qmrndKtyjzI9Utf0XRZOsZaZmujJK0d9ADbJCxQ53rOC0hvNjWC0i0oWX5AKaWSKi
	J4XyYiTJVHdK8M9EEJ40o2/NlZ17bBXjqQ9V01BB0NwgObgABFYhBxyEp2qpqHzkN1A/paLA8eu
	0sdc4hwEgSNDNmdALLGkjZRU6kzhzqYiFx9g+uzrAlGPeEhZrkGX5CQxKLSQrYanjq1cpmRMsaU
	VB4bjoeb75McJulbY2C1NaL+zEnehfbg4OzQNVl7IYfFE47LLkRDoLsaF5MOL7kq5aXzurC6kDw
	GpPUWipBxkw+tKfbKAR/iTkiJSHtayzWvYIC6EtqqsBtYOX9A8fTXwiZ0KSZBngUwJyfoGyxt1y
	kgpPPBA2BswQtuJlk2cghZl4dZ6dcIZm5gTimTGgzIDHEI83Zhrw+svMlAJ4n7E3JMpKVdvoSO
X-Received: by 2002:a17:902:d54c:b0:2dd:ad73:5b68 with SMTP id d9443c01a7336-2e60036c99cmr32985705ad.24.1791419677195;
        Wed, 07 Oct 2026 17:34:37 -0700 (PDT)
Received: from thangnn-ASUS.. ([2a09:bac5:d45a:2646::3d0:58])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e60482d33esm17883235ad.52.2026.10.07.17.34.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 17:34:36 -0700 (PDT)
From: Nguyen Ngoc Thang <ngocthang2710.1999@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	syzbot+863936f50214e843ae0c@syzkaller.appspotmail.com,
	Nguyen Ngoc Thang <ngocthang2710.1999@gmail.com>
Subject: [PATCH] USB: core: don't release an unbound claimed interface via the driver core
Date: Thu,  8 Oct 2026 07:34:31 +0700
Message-ID: <20261008003431.145352-1-ngocthang2710.1999@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

usb_driver_claim_interface() sets dev->driver on an interface and only
calls device_bind_driver() if the interface is already registered.
Otherwise the later device_add() is expected to bind it, but with
bus drivers_autoprobe disabled bus_probe_device() skips the attach, so
the interface ends up with dev->driver set while it was never added to
the driver's klist.

usb_driver_release_interface() then sees a registered device and calls
device_release_driver(), which does klist_remove() on a node that is
not attached and dereferences a NULL klist:

  KASAN: null-ptr-deref in range [0x58-0x5f]
  RIP: klist_put+0x4d/0x1d0
   klist_remove+0x14c/0x2e0
   device_release_driver_internal+0x4fb/0x620
   usb_driver_release_interface+0x10e/0x190
   cdc_ncm_unbind+0x2ac/0x350
   usbnet_disconnect+0x1e2/0x300
   usb_unbind_interface+0x1dd/0x9e0

Decide on device_is_bound() instead of device_is_registered(): only go
through the driver core if it really bound the interface, otherwise use
the same direct unbind as for an unregistered interface.

Reported-by: syzbot+863936f50214e843ae0c@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=863936f50214e843ae0c
Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Cc: stable@vger.kernel.org
Signed-off-by: Nguyen Ngoc Thang <ngocthang2710.1999@gmail.com>
---
Root cause: cdc_ncm claims its data interface from probe of the control
interface, before the data interface is registered, so only dev->driver
is set and the bind is left to device_add().  With drivers_autoprobe=0
that bind never happens, so release goes through device_release_driver()
on an interface that was never put on the driver's klist.

Tested with the syzbot C reproducer in QEMU (KASAN, dummy_hcd) on
111dc5487a4e: the baseline oopses in klist_put() in 2 of 6 runs (the
reproducer is racy), the patched kernel in 0 of 10.  A temporary
pr_info confirmed the new path is taken in a run that would otherwise
crash.  The Fixes tag points at the start of git history, as the code
predates it.

 drivers/usb/core/driver.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/core/driver.c b/drivers/usb/core/driver.c
index 7f33fe5ba03b..c7922875dd59 100644
--- a/drivers/usb/core/driver.c
+++ b/drivers/usb/core/driver.c
@@ -636,10 +636,11 @@ void usb_driver_release_interface(struct usb_driver *driver,
 		return;
 	iface->condition = USB_INTERFACE_UNBINDING;
 
-	/* Release via the driver core only if the interface
-	 * has already been registered
+	/* Release via the driver core only if the interface has been
+	 * bound by it.  A claimed interface is not bound if it was
+	 * registered with drivers_autoprobe disabled.
 	 */
-	if (device_is_registered(dev)) {
+	if (device_is_bound(dev)) {
 		device_release_driver(dev);
 	} else {
 		device_lock(dev);
-- 
2.43.0


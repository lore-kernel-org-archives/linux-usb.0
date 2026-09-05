Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 446C217D6
	for <linux-usb@vger.kernel.org>; Sat,  5 Sep 2026 19:37:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788637033; cv=none; b=sryMnppQwiTnjH5dL00FRycyG1/WpGusGduEdCZgcxYjwLwTLULFD7YNo1KlZaOZwRLi3+vFcUEwH8tsAXM5Qz/n9DM/m1FuJNqTFwXXBW5En3LRLYz2nWIkQI5Px9XOptwWil9qCuuOTBJBbeZkXAinKglYbyduSU//V29UV5A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788637033; c=relaxed/simple;
	bh=xZ6KsdW5f2NpTo9qehbK8CWOfXcHtshoKlG78wErm7M=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=j/a5F45w9X7OOK/rb5ncNzl9xWUF9I0QclXE1TNv6v3ObF/DKYkppY/Suta3iv57Ya6yURf8uQ2g2Lu/zDUlhFmMbNXXccQuke/ZLzgxf+Riccxvhw0jvkVXj8fM+JQ8tbSY8B9sw3qM8DR4xLEziXMBoxD90YR3p+Z5bFVmjHM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TJ+aFrp3; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TJ+aFrp3"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-383b4a3755fso2056015a91.3
        for <linux-usb@vger.kernel.org>; Sat, 05 Sep 2026 12:37:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788637031; x=1789241831; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=0xM5jhzzXry0h+e/i2joKohtDwwRTLaxUZrU8veNd6E=;
        b=TJ+aFrp3VsV2zLVXzcf4EdoUGe6+SnMTxSvIgYX7v6NrBqAxHYwVkD906Q5HKXZGvj
         Dl7EI6kqBky3J347SaClBBkMMZC+5V2hhaQzthjuzMQYiM5XYUTisooplKA8Is+RTSBv
         RD3bL/aHnbLd1maX91Hww/15kWGuo0sdDUAle0uGegdhlp5yhBnVB1e5p3lHMZX3uJRh
         OnmTCKM15AHK5Ci1Jl96VRZLEqKp6OZ3CZuFvQEzj4xIImMHrUc2VGyQ3OJVshFgUi/l
         dvloS4KogkUs6ISr+mAz0hgfUioEYBT/akcJ7DW8Ab4yMU4j7zjXDpBj6fbiHavj8bb8
         HaSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788637031; x=1789241831;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0xM5jhzzXry0h+e/i2joKohtDwwRTLaxUZrU8veNd6E=;
        b=rh4CsdlVU11ejk1Wsy2xa8QZM6uQ70rk1yeYbnmW/CNVGNVEUdn+924YGNZclPc5n4
         1gBBNzLa95qEe4vDlZYI7iKAzNoCWrBB+3hqPQMmrZ2BBOvadC16bMXqrBmwfNA4ImrK
         9G4YcY4gpJgyw7oNiumhAr6oqPRCkVcBOe9KGj4ugNuzFriLuINeJtlVSjMhJy/dscO2
         XetGWCF87dtuzc6QcLwrEpZujfP6WNMpZMlyAABvGoIMiWGXOBEIQ4GpVeHtozOy8Qgp
         VoCQl5XzDOOaK2yTpFiJZR9CDFHM0MtdLxdW6pXmf/aXLH0m1E6KUegqDV/gQvMEoOKf
         904g==
X-Forwarded-Encrypted: i=1; AKwUvByk0hIMr7BF54A6N9RQApbEAXFjy9hfqF4pjanvRyE6GYg1orcI1vrWVWlOf+bAgKEvRoXjru3nfYc=@vger.kernel.org
X-Gm-Message-State: AFuF++nJ/XYdV0OvMKAnBO3Vs4W7OZMd/Cdefv+GEclxS2fhKhjtizb3
	Q5UDm7wcDOKS6LXSlcwH5ayKbAPsx4rs6P8SStMQ+7ZdYjYqJIaCgul8
X-Gm-Gg: AYBFou2dSHbEWkI6zZ7k9OAqA0DZgUUgklqXrj0jPelTuoR08x3NVe9HDnFr+F2Qr2q
	7cXH2+IBgfDBdXy1Lmy8TaRP40dsIpdUK90Z8cZ6Siuh4QfIQn/IvSLPYMYOZ5IXuSlybsqcc5a
	kK24yaDiUC2EVJre1ihFp3NiBqXHgE6X/mn/7hBAe2M6PFII12gR7wtzkkhvtZYJyg3BKWaQCEG
	U/JKGfS7LbvmNJVIm6ZIjYNkVvBfil4mVauOsS6s7Cc107LTD8F57W5hoEVeQkAflWGsDKWRrEz
	VGEftVpa3JXwCsCW/sW7RkgmPJDrF5XxZ4GLv1eUMIUPuz8DZgPcjHuuRjI9SWedGO7pRtcK4mb
	agG2M7NqvT+Io/4rXMMvYJIk3Cvc6skQGmWeHmg6QF6do41mpkzzQcb/xF1q+EYdXwvG/LwwQsL
	0PXhC+/6UdtRCT6AEuBWSuNxMImsBlff9jqjcYWvfzLt8VvxBeyQ==
X-Received: by 2002:a17:90b:2f46:b0:396:6344:3b63 with SMTP id 98e67ed59e1d1-39b260de5c6mr22999111a91.2.1788637031444;
        Sat, 05 Sep 2026 12:37:11 -0700 (PDT)
Received: from evangelion-g ([2a09:bac5:40e2:a82::10c:6b])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b08bcc081sm17597757a91.6.2026.09.05.12.37.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Sep 2026 12:37:10 -0700 (PDT)
From: Ayush <ayush37735@gmail.com>
To: Thomas Winischhofer <thomas@winischhofer.net>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ayush <ayush37735@gmail.com>,
	syzbot+3bc656a9271e7c8a5c6b@syzkaller.appspotmail.com
Subject: [PATCH v1] USB: sisusbvga: avoid initializing device in open
Date: Sun,  6 Sep 2026 01:06:34 +0530
Message-ID: <20260905193634.160600-1-ayush37735@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The USB core holds minor_rwsem while invoking a USB character
device's open callback. sisusb_open() can currently initialize the
device while holding sisusb->lock, and that initialization performs
synchronous USB I/O.

High-speed devices are already initialized during probe. Treat a
probe-time initialization failure as a probe failure instead of
retrying initialization from open, so the open callback no longer
performs blocking device initialization.

Reported-by: syzbot+3bc656a9271e7c8a5c6b@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=3bc656a9271e7c8a5c6b
Signed-off-by: Ayush <ayush37735@gmail.com>
---
 drivers/usb/misc/sisusbvga/sisusbvga.c | 29 ++++++++++++--------------
 1 file changed, 13 insertions(+), 16 deletions(-)

diff --git a/drivers/usb/misc/sisusbvga/sisusbvga.c b/drivers/usb/misc/sisusbvga/sisusbvga.c
index 3e75a7c24828..6723a65b12b8 100644
--- a/drivers/usb/misc/sisusbvga/sisusbvga.c
+++ b/drivers/usb/misc/sisusbvga/sisusbvga.c
@@ -2223,20 +2223,10 @@ static int sisusb_open(struct inode *inode, struct file *file)
 	}
 
 	if (!sisusb->devinit) {
-		if (sisusb->sisusb_dev->speed == USB_SPEED_HIGH ||
-				sisusb->sisusb_dev->speed >= USB_SPEED_SUPER) {
-			if (sisusb_init_gfxdevice(sisusb, 0)) {
-				mutex_unlock(&sisusb->lock);
-				dev_err(&sisusb->sisusb_dev->dev,
-						"Failed to initialize device\n");
-				return -EIO;
-			}
-		} else {
-			mutex_unlock(&sisusb->lock);
-			dev_err(&sisusb->sisusb_dev->dev,
-					"Device not attached to USB 2.0 hub\n");
-			return -EIO;
-		}
+		mutex_unlock(&sisusb->lock);
+		dev_err(&sisusb->sisusb_dev->dev,
+			"Device not initialized\n");
+		return -EIO;
 	}
 
 	/* Increment usage count for our sisusb */
@@ -2880,9 +2870,16 @@ static int sisusb_probe(struct usb_interface *intf,
 
 	if (dev->speed == USB_SPEED_HIGH || dev->speed >= USB_SPEED_SUPER) {
 		int initscreen = 1;
-		if (sisusb_init_gfxdevice(sisusb, initscreen))
+
+		if (sisusb_init_gfxdevice(sisusb, initscreen)) {
 			dev_err(&sisusb->sisusb_dev->dev,
-					"Failed to early initialize device\n");
+				"Failed to early initialize device\n");
+			sisusb->present = 0;
+			usb_set_intfdata(intf, NULL);
+			usb_put_dev(sisusb->sisusb_dev);
+			retval = -EIO;
+			goto error_4;
+		}
 
 	} else
 		dev_info(&sisusb->sisusb_dev->dev,
-- 
2.53.0


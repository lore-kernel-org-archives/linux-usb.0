Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B461937FF50
	for <linux-usb@vger.kernel.org>; Fri, 19 Jun 2026 15:03:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781881432; cv=none; b=MsZP+YuPMGLJHsX3TWseGjQU0zZRt1tKPNsfhye4jVxhmoi53TEDjmdU/u+CSvH3C+jNRtPrfW9jxbNk2j8WQuQ0ZGoarVljvhCRG7H7EU9gifhfhoxzVDrBJxyoq2jqV2j/c3NMIrX09+EjJNQRd86ZFVj+XuVpELkgGtDrwfM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781881432; c=relaxed/simple;
	bh=JormiDBFlQAyp+V29xM8gPCDfAHS9ZmMDBYT696xbYU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=MNnqMI/QjM8Y28jzO1998akpMGMipqV2QyfgMXGmz6F/jVgo8A5sJ1zxl8cdsyvNKF3D7je4Ig9lRJBggkRO1I2QewGJ/88fwJOPDZBA5ssQSDupMzn0SL4my3SwXj1ctHoobt8vY02L0LrDBkc3N/PlYDo4RIxQ7yzoOcovNf0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SdM0hxXn; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SdM0hxXn"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2c6bdb8a8bdso12547835ad.1
        for <linux-usb@vger.kernel.org>; Fri, 19 Jun 2026 08:03:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781881430; x=1782486230; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=w9Fob+RGKZ6nU9HFu5yaRULjj6OpWiXjaViAAqz66iA=;
        b=SdM0hxXn7h8cSCVdCnB67jVFNdY9zF/KZKI/8MDCFFeL6w64GmN2lFu8OffPisWuTF
         41xMekUcffEPeluQGnPRIhT80jxICwbB3UR2igvzZcP6pf3cHWvC1aycp168ofpucq63
         OOJ1xKHA5IbWN5BBWD3TTQJHMHRm5DHNZTuxQ1LP1DSbBkNzJpFKen00Hf1LTMDLDnfW
         fFZ8vE7XbaOlM2xz7HFpAGGIif3Ru/vh/l2PUwbq3gpzHmdmAEehF60BJLy8OeuXKxt8
         Ed+s3EoahglUm+LUNYZZcO07gCz7dSGtYUs7Ztq0a1Oxw9mj7PtLzHrTXpfRJoH/x8lM
         PpwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781881430; x=1782486230;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w9Fob+RGKZ6nU9HFu5yaRULjj6OpWiXjaViAAqz66iA=;
        b=sS251afZU2eGhPc9yfWZiRdlw12ncp2T4M/YefdqEEXlgANRugMpf7awEaTIyR8sQl
         qCtolajBovV3qutOcOqqvk3d1I1FNkkKKU0l1phZCxC/DuOPygFfhitmJvW9TmexsHFg
         bhUCiDXK/03LSaR1mEV8/pQWAgO1PQyAxJADEYcVGMi0PtjbgLBXQwxMg101yo5C6LKj
         Kngbhw5ZNMgV2lZK4Nt/4aewLl1vIw6ABkn7OFma6zETnucRIlGR5tjLitM3eLOr2ka5
         9PF0DGmTbNKXj3o7NDn9vTUDd0s3fXKL2m54GndXm1mrMymVs2aY6BQiWaXZWw6U5v4c
         KCsg==
X-Forwarded-Encrypted: i=1; AFNElJ8WnInSxC7qqQ/nN8G1TS5rNj+TmV7KVulY+bpio4ST23Jv4KnbVwoUwQf6IxYBnw//JJT+UKKNZdo=@vger.kernel.org
X-Gm-Message-State: AOJu0YzFgF11Mi+rKgrnbV2QukIXcGsQTKiWyCJvBre/85/nf0kz2mfJ
	U4SW1Ma2OpYCPt0YBauzRVyq2y0W4qUGPQaA42XmgvSlH9eAHL+evwyU
X-Gm-Gg: AfdE7clj9Ut8CFA/tA2r5wxNT950ALfBdjJetPl//a2XJBuxuGpvRG8meBiSWgZ5Y5l
	5sCl10oyK95p6rhrThWCPefTH+7AHs+LSwHx19qXgv3cmM/LproxmUJoSSk6AcLoQ/gCttZOPDP
	CBESVOIko8D87PRBJA6L0nrlMqAx6/6rrs4WQrpYFJiXToebHgE9oWFc+ou5GbfpnMfxPIQ52ZS
	PjNF4119px+vnpVYsn//BKrLoJFwZoUjqlmC0tfqGSr8BGsgR4oOBpl9sL6wMx+ohn/453QHgQL
	wyanO/lgQXAaUJZoXEdEKGivjWtZWCuH/1a3IzTnTplsr2CaJw+276m/IUR7npY71f3NTwG0MnP
	12DuWaFGbW6dtNSe81xO8fZDZv8VtN8Zv5Kb4u6bSmWVe56sXfqNVorFgvjvGjf+sN6LeC7udR9
	jBGqIgYcQhKEQIB0IgFpU=
X-Received: by 2002:a17:902:e787:b0:2c6:afa8:c181 with SMTP id d9443c01a7336-2c725a65917mr32307925ad.1.1781881429487;
        Fri, 19 Jun 2026 08:03:49 -0700 (PDT)
Received: from gmail.com (vps-787f8425.vps.ovh.us. [2604:2dc0:202:300::17a])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c72089a149sm26675655ad.9.2026.06.19.08.03.47
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 19 Jun 2026 08:03:49 -0700 (PDT)
From: Yue Sun <samsun1006219@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Oliver Neukum <oneukum@suse.com>
Cc: Sam Sun <samsun1006219@gmail.com>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] USB: misc: iowarrior: fix use-after-free in release
Date: Fri, 19 Jun 2026 23:03:37 +0800
Message-ID: <20260619150340.65058-1-samsun1006219@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Sam Sun <samsun1006219@gmail.com>

iowarrior_release() clears dev->opened while holding dev->mutex and then
unlocks the mutex before freeing the device when it has already been
disconnected. If iowarrior_disconnect() is waiting for the same mutex, it
can acquire it while mutex_unlock() in release is still in progress,
observe dev->opened == 0, and free the same object. This violates the
mutex_unlock() lifetime rule because the mutex storage can be freed before
mutex_unlock() has returned.

Fix this by adding a kref to struct iowarrior and holding one reference
for the USB interface, one for each opened file, and one for each
in-flight asynchronous write URB. Release, disconnect and write completion
now only drop their references after they are done using the object, and
the object is freed only after all users have released it.

Reported-by: Sam Sun <samsun1006219@gmail.com>
Closes: https://lore.kernel.org/r/20260618080204.38322-1-samsun1006219@gmail.com
Signed-off-by: Sam Sun <samsun1006219@gmail.com>
---
 drivers/usb/misc/iowarrior.c | 29 ++++++++++++++++++++---------
 1 file changed, 20 insertions(+), 9 deletions(-)

diff --git a/drivers/usb/misc/iowarrior.c b/drivers/usb/misc/iowarrior.c
index 22504c0a2841..abeed76379d7 100644
--- a/drivers/usb/misc/iowarrior.c
+++ b/drivers/usb/misc/iowarrior.c
@@ -20,6 +20,7 @@
 #include <linux/slab.h>
 #include <linux/sched.h>
 #include <linux/mutex.h>
+#include <linux/kref.h>
 #include <linux/poll.h>
 #include <linux/hid.h>
 #include <linux/usb/iowarrior.h>
@@ -73,6 +74,7 @@ static struct usb_driver iowarrior_driver;
 /* Structure to hold all of our device specific stuff */
 struct iowarrior {
 	struct mutex mutex;			/* locks this structure */
+	struct kref kref;
 	struct usb_device *udev;		/* save off the usb device pointer */
 	struct usb_interface *interface;	/* the interface for this device */
 	struct usb_endpoint_descriptor *int_out_endpoint;	/* endpoint for reading (needed for IOW56 only) */
@@ -95,6 +97,10 @@ struct iowarrior {
 	struct usb_anchor submitted;
 };
 
+#define to_iowarrior_dev(d) container_of(d, struct iowarrior, kref)
+
+static void iowarrior_delete(struct kref *kref);
+
 /*--------------*/
 /*    globals   */
 /*--------------*/
@@ -235,13 +241,16 @@ static void iowarrior_write_callback(struct urb *urb)
 	/* tell a waiting writer the interrupt-out-pipe is available again */
 	atomic_dec(&dev->write_busy);
 	wake_up_interruptible(&dev->write_wait);
+	kref_put(&dev->kref, iowarrior_delete);
 }
 
 /*
  *	iowarrior_delete
  */
-static inline void iowarrior_delete(struct iowarrior *dev)
+static void iowarrior_delete(struct kref *kref)
 {
+	struct iowarrior *dev = to_iowarrior_dev(kref);
+
 	kfree(dev->int_in_buffer);
 	usb_free_urb(dev->int_in_urb);
 	kfree(dev->read_queue);
@@ -454,12 +463,14 @@ static ssize_t iowarrior_write(struct file *file,
 			goto error;
 		}
 		usb_anchor_urb(int_out_urb, &dev->submitted);
+		kref_get(&dev->kref);
 		retval = usb_submit_urb(int_out_urb, GFP_KERNEL);
 		if (retval) {
 			dev_dbg(&dev->interface->dev,
 				"submit error %d for urb nr.%d\n",
 				retval, atomic_read(&dev->write_busy));
 			usb_unanchor_urb(int_out_urb);
+			kref_put(&dev->kref, iowarrior_delete);
 			goto error;
 		}
 		/* submit was ok */
@@ -637,6 +648,7 @@ static int iowarrior_open(struct inode *inode, struct file *file)
 	}
 	/* increment our usage count for the driver */
 	++dev->opened;
+	kref_get(&dev->kref);
 	/* save our object in the file's private structure */
 	file->private_data = dev;
 	retval = 0;
@@ -657,13 +669,13 @@ static int iowarrior_release(struct inode *inode, struct file *file)
 	dev = file->private_data;
 	if (!dev)
 		return -ENODEV;
+	file->private_data = NULL;
 
 	/* lock our device */
 	mutex_lock(&dev->mutex);
 
 	if (dev->opened <= 0) {
 		retval = -ENODEV;	/* close called more than once */
-		mutex_unlock(&dev->mutex);
 	} else {
 		dev->opened = 0;	/* we're closing now */
 		retval = 0;
@@ -675,13 +687,11 @@ static int iowarrior_release(struct inode *inode, struct file *file)
 			usb_kill_urb(dev->int_in_urb);
 			wake_up_interruptible(&dev->read_wait);
 			wake_up_interruptible(&dev->write_wait);
-			mutex_unlock(&dev->mutex);
-		} else {
-			/* The device was unplugged, cleanup resources */
-			mutex_unlock(&dev->mutex);
-			iowarrior_delete(dev);
 		}
 	}
+	mutex_unlock(&dev->mutex);
+
+	kref_put(&dev->kref, iowarrior_delete);
 	return retval;
 }
 
@@ -768,6 +778,7 @@ static int iowarrior_probe(struct usb_interface *interface,
 		return retval;
 
 	mutex_init(&dev->mutex);
+	kref_init(&dev->kref);
 
 	atomic_set(&dev->intr_idx, 0);
 	atomic_set(&dev->read_idx, 0);
@@ -885,7 +896,7 @@ static int iowarrior_probe(struct usb_interface *interface,
 	return retval;
 
 error:
-	iowarrior_delete(dev);
+	kref_put(&dev->kref, iowarrior_delete);
 	return retval;
 }
 
@@ -918,8 +929,8 @@ static void iowarrior_disconnect(struct usb_interface *interface)
 	} else {
 		/* no process is using the device, cleanup now */
 		mutex_unlock(&dev->mutex);
-		iowarrior_delete(dev);
 	}
+	kref_put(&dev->kref, iowarrior_delete);
 }
 
 /* usb specific object needed to register this driver with the usb subsystem */
-- 
2.34.1


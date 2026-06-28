Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA43B270EC1
	for <linux-usb@vger.kernel.org>; Sun, 28 Jun 2026 09:33:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782639212; cv=none; b=PAr8wCk3F6FNGMOC/HhSIjN3YuoCOuEuI9KbuplSTkr68obofPVR8RTW0psPxiLpcRbeSF52c9qHmQ7DrVgmupASRDshkli0AgzL4cjZAMMwdRcOungDTQBMAtNZp+Y1sefsB3ZiOGLmRBMrftMXD2vuJesf67eapiRvknMeErY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782639212; c=relaxed/simple;
	bh=DJTHZvl6S11OOfAQB6lqm5ikN8o5iBUg99YfgfnT5U4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=tMBNFOK1ERnnO5X+WtbG6Mlh/m3hzwa6kdtBAZYTUEQJADxEMA61WtGFAX14lsnvERQYIyhQY/ORgjvmh+M8A6QgGL5jszjvnEvJAZkeXdlENpORgkKQYrkgLuecM9IhoCyCH6hTSkQeP2PPHmMSec7LrVt6M4zbUyFdU+SFIo4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oQquA0RP; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oQquA0RP"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-493a54b80a5so8112065e9.2
        for <linux-usb@vger.kernel.org>; Sun, 28 Jun 2026 02:33:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782639209; x=1783244009; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=TFWzc7Dr8BMNziQC19/fthox8mYezwUWhmmBeBzJP4M=;
        b=oQquA0RP0lsFOz19uEGAteLaWKqrTQ1mr9j7/7B6iMjf85lJUOHPGrDBMWIflgCmHF
         FEUnyJEDnr+Bk34YxqYj7u3CV1X/ZV1TyYGogm54P8/wZUJhArzJecDItwEkPYuYvBhK
         1LB544qAgmSqThiXB+WRR4xjb/fbkDn6/3y34Cm01lQq6fo8rtGD4PP7VYJlq2hULcud
         nEIcX5tUz48WVuYfnOJlbb+4dU23uxEit5iiXTVK449uvbwhFVbua8V0JuGxRvmMZsOi
         12OQqt5hLF9FHZKKmHisUNiFjQUIM8ZooWRz0miybxsh5tIuoG9tRD9RKXVWJLaN5uDl
         QfpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782639209; x=1783244009;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TFWzc7Dr8BMNziQC19/fthox8mYezwUWhmmBeBzJP4M=;
        b=Mat8x1MPN0JsIaS6ovfbvxCT7zMHHJuCjmALIOzJNT9aQhl4BDUp10RwzLCs0zJHMz
         8GeepNlqA5VnrZAMWAdPxC1nb/KeugADs9YOsqUzlYU+O1uxyDkXAPdyZkuhdhAiedhC
         IqbRB5dRfY72saJdgCvgSRHA8maYRgOQPMH/nPAmGsbMCYbaLExqxwh43um4jXR4mRzo
         27HvpGJfAN1ff1AD/zPpSm/tXjZxfdtgxyDQStUK6tsxMQ73ubP6L3151xuFviOPNIUh
         O7JEH+y0c2IjtjNdskRAPQ/9aMxovPoaE3rZcgDLNfaJAHzbVsHzRPQy93BtgwWzxNip
         hEjA==
X-Forwarded-Encrypted: i=1; AFNElJ9WXx+h74Dg5sJVA7z8xM0Bb2Mwpmb5eYXv35eIUlRaMv0L3iKDRttNFKF8o9rwTEGcd+seFqAZO3Y=@vger.kernel.org
X-Gm-Message-State: AOJu0YznmJxv+sHN8a9MpzSkC3vcEQxsn1j7z8zVFHcX72XMmhDyEWFM
	5MlyFANB56BLp0Zh/DMq1KLokiSoMSydXF8pNC1Ymedg67+Ft+kUK3wv
X-Gm-Gg: AfdE7cn6iDzROS9kgZtYbPAgaJsTVZekbT6eKptaqzRWKmY16k8WzOU5fyGzmhoIRfL
	0Yw5NAgz5303OjHXog6tdyAWulb5yju9gJhTSDyM8B6GNwmUDMQR4kntD8USex+FJOu7tDHyWs6
	QfA0mznOQ/LcLiCza9lzTap2U3eiVQ4RkBjdGPbz2N7gVJS5XiBtKNiqPP3Akhn9td3FPPVhdSv
	vn2DUYX7UW5kVhfPxVj55116R6qwMc+/1zZn0FJA/b2xhw0oIzu/g719vxbSj6rx1Dq71eiudk7
	bmBTMskdb0jpyqTa88zpRHSYiCMGwIpBHzRIhDqxVYXR1/4P/t+J8L46WHI8vuodO7AfE87ay+x
	By7AINs1GOnRyXmigbclXjNgjBr2ERQm1FPA3QtVcg5S4HCTH6EbRYoM3t/ZXSOysH8hnKD4WlJ
	dKH6s3HTE8S4hxzDADpgfzNKNWvQ==
X-Received: by 2002:a05:600c:1d1b:b0:492:4caa:e2f4 with SMTP id 5b1f17b1804b1-492668ad885mr198132705e9.36.1782639209171;
        Sun, 28 Jun 2026 02:33:29 -0700 (PDT)
Received: from Dev-Null-MSI ([2a0d:3344:52ac:a808:98a4:4381:be45:536f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-46c2279bc77sm37461059f8f.32.2026.06.28.02.33.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Jun 2026 02:33:28 -0700 (PDT)
From: Yousef Alhouseen <alhouseenyousef@gmail.com>
To: Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>
Cc: linux-input@vger.kernel.org,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	syzbot+563191a4939ddbfe73d4@syzkaller.appspotmail.com,
	Yousef Alhouseen <alhouseenyousef@gmail.com>
Subject: [PATCH] HID: hiddev: keep state alive through disconnect unlock
Date: Sun, 28 Jun 2026 11:32:45 +0200
Message-ID: <20260628093245.42065-1-alhouseenyousef@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

hiddev_disconnect() drops existancelock before freeing the hiddev state,
but a waiting final file release can run as soon as the mutex becomes
available. On PREEMPT_RT, that waiter may free hiddev while the disconnect
thread is still executing the mutex slow-unlock path, causing a
use-after-free in the mutex implementation.

Give the connection and each open file an explicit reference. Drop each
reference only after its existancelock critical section has completed, so
the state cannot be freed from the other unlock path.

Fixes: 079034073faf ("HID: hiddev cleanup -- handle all error conditions properly")
Reported-by: syzbot+563191a4939ddbfe73d4@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=563191a4939ddbfe73d4
Cc: stable@vger.kernel.org
Signed-off-by: Yousef Alhouseen <alhouseenyousef@gmail.com>
---
 drivers/hid/usbhid/hiddev.c | 37 +++++++++++++++++++------------------
 include/linux/hiddev.h      |  2 ++
 2 files changed, 21 insertions(+), 18 deletions(-)

diff --git a/drivers/hid/usbhid/hiddev.c b/drivers/hid/usbhid/hiddev.c
index 6378801b22c6..21396481995b 100644
--- a/drivers/hid/usbhid/hiddev.c
+++ b/drivers/hid/usbhid/hiddev.c
@@ -46,6 +46,12 @@ struct hiddev_list {
 	struct mutex thread_lock;
 };
 
+static void hiddev_put(struct hiddev *hiddev)
+{
+	if (refcount_dec_and_test(&hiddev->refcount))
+		kfree(hiddev);
+}
+
 /*
  * Find a report, given the report's type and ID.  The ID can be specified
  * indirectly by REPORT_ID_FIRST (which returns the first report of the given
@@ -216,26 +222,21 @@ static int hiddev_fasync(int fd, struct file *file, int on)
 static int hiddev_release(struct inode * inode, struct file * file)
 {
 	struct hiddev_list *list = file->private_data;
+	struct hiddev *hiddev = list->hiddev;
 	unsigned long flags;
 
-	spin_lock_irqsave(&list->hiddev->list_lock, flags);
+	spin_lock_irqsave(&hiddev->list_lock, flags);
 	list_del(&list->node);
-	spin_unlock_irqrestore(&list->hiddev->list_lock, flags);
+	spin_unlock_irqrestore(&hiddev->list_lock, flags);
 
-	mutex_lock(&list->hiddev->existancelock);
-	if (!--list->hiddev->open) {
-		if (list->hiddev->exist) {
-			hid_hw_close(list->hiddev->hid);
-			hid_hw_power(list->hiddev->hid, PM_HINT_NORMAL);
-		} else {
-			mutex_unlock(&list->hiddev->existancelock);
-			kfree(list->hiddev);
-			vfree(list);
-			return 0;
-		}
+	mutex_lock(&hiddev->existancelock);
+	if (!--hiddev->open && hiddev->exist) {
+		hid_hw_close(hiddev->hid);
+		hid_hw_power(hiddev->hid, PM_HINT_NORMAL);
 	}
 
-	mutex_unlock(&list->hiddev->existancelock);
+	mutex_unlock(&hiddev->existancelock);
+	hiddev_put(hiddev);
 	vfree(list);
 
 	return 0;
@@ -270,6 +271,7 @@ static int __hiddev_open(struct hiddev *hiddev, struct file *file)
 	spin_unlock_irq(&hiddev->list_lock);
 
 	file->private_data = list;
+	refcount_inc(&hiddev->refcount);
 
 	return 0;
 
@@ -897,6 +899,7 @@ int hiddev_connect(struct hid_device *hid, unsigned int force)
 	INIT_LIST_HEAD(&hiddev->list);
 	spin_lock_init(&hiddev->list_lock);
 	mutex_init(&hiddev->existancelock);
+	refcount_set(&hiddev->refcount, 1);
 	hid->hiddev = hiddev;
 	hiddev->hid = hid;
 	hiddev->exist = 1;
@@ -937,9 +940,7 @@ void hiddev_disconnect(struct hid_device *hid)
 	if (hiddev->open) {
 		hid_hw_close(hiddev->hid);
 		wake_up_interruptible(&hiddev->wait);
-		mutex_unlock(&hiddev->existancelock);
-	} else {
-		mutex_unlock(&hiddev->existancelock);
-		kfree(hiddev);
 	}
+	mutex_unlock(&hiddev->existancelock);
+	hiddev_put(hiddev);
 }
diff --git a/include/linux/hiddev.h b/include/linux/hiddev.h
index 2164c03d2c72..8e9f8a33e359 100644
--- a/include/linux/hiddev.h
+++ b/include/linux/hiddev.h
@@ -13,6 +13,7 @@
 #ifndef _HIDDEV_H
 #define _HIDDEV_H
 
+#include <linux/refcount.h>
 #include <uapi/linux/hiddev.h>
 
 
@@ -24,6 +25,7 @@ struct hiddev {
 	int minor;
 	int exist;
 	int open;
+	refcount_t refcount;
 	struct mutex existancelock;
 	wait_queue_head_t wait;
 	struct hid_device *hid;
-- 
2.54.0


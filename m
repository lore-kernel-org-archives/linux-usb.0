Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795216040;
	b=39eRj1dnDbAOGzUPoxAHyOrp6NccMYCU9hGyTvhkH9RXk/1KzUEBjtFKquILO8pjS6x4
	 dZri0l4hayHitx1hVllGiumsjVwwE4uMAJdr5QZ98Pz7YzO718PL5dB4T+/MUtHPPM9iB
	 JxahCr5uW0VS5wnIKXIz7L72PE0ic/QhNVIgjDhyUWtkhSr+mNPlO61StmDDQ/hsBbPgn
	 xjHT4tsKnjbfwLRtMq5pD7ht6F0zKd/yi2BUP6TQyS1Zg5rrkWQumbS89FomAg7mlvn/i
	 Hq9L5AguIYa4HKMsGXCn/S6p2UTLTJ/QH5cc3QZyV72K19X5/lRpPZIkTPjYRYuGPkA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795216040;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=A7lVlF6eAYb1EWlptLfI5ak3vIP6pO8uIB3MP+Hp924=;
	b=NFH2qaoy6fCwJyO0KyHyrgkZ16dX9C/kMtscGNuyO/mN8WvEOHqHhF0zbrmvhYnwGzzv
	 EdINGUh6JassWtufpZbRocVITT3MPnCENpDuTkuUzaApeltR9+Hd2Z+BPYFTOezQ+7h60
	 NKD7o8hlPpCqaao3jUrOZMbY+dFIYWGhGbOWaJL+ar2XZZIJDOpjk6ClOMSPpm7Q1Z9zG
	 mj0m92F06cJLb6NLP1mAZhuHrGXYvG5pq4mQuzOB9oeGBHFvUGRNC/10pjzui3k2FDygY
	 q7NoCyHywFrbfwLWTQHgSAv7mwlADxNesyUAULkiKfyj7RWP4hYcgkLKEqvydY3IBtA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YYXXXwQy;
	arc=none smtp.remote-ip=209.85.221.43
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FF62606A32C
	for <linux-usb@vger.kernel.org>; Fri, 20 Nov 2026 23:07:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3FF62606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YYXXXwQy
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-49412eb1474so880299f8f.3
        for <linux-usb@vger.kernel.org>; Fri, 20 Nov 2026 15:07:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795216034; x=1795820834; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=A7lVlF6eAYb1EWlptLfI5ak3vIP6pO8uIB3MP+Hp924=;
        b=YYXXXwQyZWgE9rOV0urd0gLkPcuhRXU6AkTzJNx556VbAWKGoJGm/RJT80ZsosiqvK
         Fsior3n5yayuEKRGyjX8IggataSP1ymu+0H0lf2B9qJLVb6OHpbRxdL4PwLPCiSkEYhF
         jHRKmS8eC6fBDpyhFMogXBA/UAXlymcVr7X9Y58w0cH9iwMX+hFIEpJ++D310EGtp/Lm
         K0NdDPdUSLs4WZ2CTVlZowB2HjvLbsJ0RwMJEa7CIhTCdnjA4tm5tjx5aoFAeTxlpmA9
         TI0X8KB0utc0u9BXqBBIyjBOBYw8wqt+iXyZLZEbQjWaLXYI59zCKzxr38XemM6XCUBX
         Wp/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795216034; x=1795820834;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=A7lVlF6eAYb1EWlptLfI5ak3vIP6pO8uIB3MP+Hp924=;
        b=r0AUbOROWah6QihnfBvn3Mq7xBJM8V2j/rQmhCnEZDZKm60jG7Xmg+PPWx77oialkS
         s2k7z8GUivRm47gX1w5l7CkvX39SfdrqRjX2sV3INarwi83PxqwBm2hFooRM58dSYVLj
         nfweHHdT67GOWXAZioU87Em7J0zYHN43OkHGs+YGkEVyavwUMOTCSOKJwC0LRZ6fPrxq
         9viYqRI0uRZT7np/leSkmBSoFjQmqqYsGwQcwR73e7CHwYL4otbD2eY6lvhkdbE0FO14
         LgLZEZpENYyZFQ+9Y0Pk3LI2Vsyf0OBXp+pI0KhtkWR7FOW6xiIkHZ1zVvvarPYrtnSc
         7/aA==
X-Gm-Message-State: APuU4Z8cCpyIdL8AfELjN4xpUSxDpyahaHwf976N2Y/AEXFSLiPXaxnS
	u8TWHhYSt4SRFZcu192TJuWJcz5/3UkGEx38dEfrwwihxFIpbXNkHJ2R
X-Gm-Gg: AZFdTZeIH+bXV/PBtH2WfFoItBQ5q/2e2sG3hF+PQePBFeWeZ05Cb97Hr9HcoJCMFDx
	2I5fv9Q4aFxrnHe/ArzKOwEG4/utcC8YjXRKbNoyfkLhTNBlSIVbmaQnej7KHKMASmGw2gyePej
	iFd1nTWaXGkHes7nabOStVgH86VQfrKEW4hSKTzsMALT+pmzoKzfeetPD7IZrO2/1d8/osJxsAi
	bKE+4B8okfX/RaNPCm2aWaTPtOKFkS8wnyp2WIwLgRiNu2am2UaiwbybAngY3O1ziwwuf44XXwA
	3ZmG3y+I1RvChrgelpU7PR2he8ovUKpbtpMKwW7r/qnX62anXYqgKlZrm4ORjQwLkFuYTJNzNrT
	3+dQgvPxYXEX6TSPFUCkgshc2X++urYqZIYGzOJqPCdRyNFBunldcWemOiabn2oqHi8op4eNBJn
	4exe1Y79s10lwBP2NOuJ28scDUJbN3cmwPSRD/l3i5+KnLq+ZGWlZu4Vgk5IdV3oB4v5WveEWt8
	DtX5oYrwNbKtRKGO3ez/Mm2G7jeFAhELONOqOOi5AZrfwdEJCqeVzFhPMxMp/66XN+XWgsowpJA
	AlUZKsMKaBarGYg3UwqhOQ0ceF7/61/rP6GDOH7Ng7T6uLnzNodIR9q8COQ88XTu2Prbj2xVCo0
	foUtXEthDoTk0am4rBMYfisxW8N6kg+XfVafjpa8YvVk=
X-Received: by 2002:a05:6000:4a0e:b0:48b:451:4f19 with SMTP id ffacd0b85a97d-4abb7971c1dmr9888353f8f.51.1795216034439;
        Fri, 20 Nov 2026 15:07:14 -0800 (PST)
Received: from Raghu007.. (sgyl-44-b2-v4wan-174108-cust110.vm6.cable.virginm.net. [80.1.81.111])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6ae2dcf9sm7945502f8f.32.2026.11.20.15.07.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 15:07:13 -0800 (PST)
From: Palla Raghunath <raghunathpalla.0209@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org,
	Neill Kapron <nkapron@google.com>,
	=?UTF-8?q?Micha=C5=82=20Nazarewicz?= <mina86@mina86.com>,
	Shuah Khan <shuah@kernel.org>,
	Brigham Campbell <me@brighamcampbell.com>,
	linux-kernel-mentees@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	raghunathpalla.0209@gmail.com,
	stable@vger.kernel.org,
	syzbot+6227549bd2c8a1ec8ba0@syzkaller.appspotmail.com
Subject: [PATCH v2] usb: gadget: f_fs: fix use-after-free of ffs_dev in ffs_free_inst()
Date: Fri, 20 Nov 2026 23:07:11 +0000
Message-Id: <20261120230711.14330-1-raghunathpalla.0209@gmail.com>
X-Mailer: git-send-email 2.34.1
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

When a function instance is removed through configfs, ffs_free_inst()
first calls ffs_release_dev(), which takes ffs_dev_lock, detaches the
dev from its mount and drops the lock again. Only then does it retake
the lock and free the dev with _ffs_free_dev().

Between those two steps the dev is still on the ffs_devices list. If
someone mounts functionfs with the same instance name right then,
ffs_acquire_dev() finds the dev, marks it mounted and points the new
ffs_data at it. The dev is freed a moment later, and when that mount
is torn down, ffs_closed() writes to freed memory. syzbot hit this:

  BUG: KASAN: slab-use-after-free in ffs_closed drivers/usb/gadget/function/f_fs.c:4427 [inline]
  BUG: KASAN: slab-use-after-free in ffs_data_clear+0x543/0x5b0 drivers/usb/gadget/function/f_fs.c:2305
  Write of size 1 at addr ffff8880237b1e4a by task syz-executor/11910
  Call Trace:
   ffs_closed drivers/usb/gadget/function/f_fs.c:4427 [inline]
   ffs_data_clear+0x543/0x5b0 drivers/usb/gadget/function/f_fs.c:2305
   ffs_data_reset drivers/usb/gadget/function/f_fs.c:2336 [inline]
   ffs_fs_kill_sb+0x84/0x370 drivers/usb/gadget/function/f_fs.c:2180
   deactivate_locked_super+0xbe/0x110 fs/super.c:586
   cleanup_mnt+0x3d3/0x460 fs/namespace.c:1329
  ...
  Freed by task 17408:
   kfree+0x1c5/0x650 mm/slub.c:6923
   _ffs_free_dev drivers/usb/gadget/function/f_fs.c:4336 [inline]
   ffs_free_inst+0x233/0x2c0 drivers/usb/gadget/function/f_fs.c:4152
   usb_put_function_instance+0x95/0xc0 drivers/usb/gadget/functions.c:77
   config_item_release+0x13a/0x2d0 fs/configfs/item.c:137
   configfs_rmdir+0x885/0x950 fs/configfs/dir.c:1580

Fix it by doing the release and the free while holding the lock once.
To allow that, move the body of ffs_release_dev() into a new
_ffs_release_dev() that expects ffs_lock to be held already, annotated
with __must_hold() so the compiler can check that, and keep
ffs_release_dev() as a wrapper for ffs_data_put(). A racing mount now
either gets the dev before ffs_free_inst() runs, in which case the
release clears its pointer, or doesn't find the dev at all.

I was able to reproduce this in QEMU with a small program that keeps
creating and removing an ffs function directory in configfs while a
second thread mounts and unmounts functionfs with the same name. On an
unpatched kernel it hit the same KASAN report within about ten
minutes. With this patch applied, the same program ran for 30 minutes
without any problem.

Fixes: ecfbd7b9054b ("usb: gadget: f_fs: Fix setting of device and driver data cross-references")
Cc: stable@vger.kernel.org
Reported-by: syzbot+6227549bd2c8a1ec8ba0@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=6227549bd2c8a1ec8ba0
Acked-by: Michał Nazarewicz <mina86@mina86.com>
Signed-off-by: Palla Raghunath <raghunathpalla.0209@gmail.com>
---
v2:
 - Annotate _ffs_release_dev() with __must_hold(&ffs_lock) so the
   locking rule is checked by the compiler (Greg)
 - Fix the comment to name ffs_lock, the actual mutex
 - Add Michał's Acked-by

v1: https://lore.kernel.org/all/20261006204202.59604-1-raghunathpalla.0209@gmail.com/

 drivers/usb/gadget/function/f_fs.c | 17 +++++++++++++----
 1 file changed, 13 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/gadget/function/f_fs.c b/drivers/usb/gadget/function/f_fs.c
index c64a268e98a4..996fa0767de2 100644
--- a/drivers/usb/gadget/function/f_fs.c
+++ b/drivers/usb/gadget/function/f_fs.c
@@ -288,6 +288,8 @@ static struct ffs_dev *_ffs_find_dev(const char *name);
 static struct ffs_dev *_ffs_alloc_dev(void);
 static void _ffs_free_dev(struct ffs_dev *dev);
 static int ffs_acquire_dev(const char *dev_name, struct ffs_data *ffs_data);
+static void _ffs_release_dev(struct ffs_dev *ffs_dev)
+	__must_hold(&ffs_lock);
 static void ffs_release_dev(struct ffs_dev *ffs_dev);
 static int ffs_ready(struct ffs_data *ffs);
 static void ffs_closed(struct ffs_data *ffs);
@@ -4147,8 +4149,8 @@ static void ffs_free_inst(struct usb_function_instance *f)
 	struct f_fs_opts *opts;
 
 	opts = to_f_fs_opts(f);
-	ffs_release_dev(opts->dev);
 	ffs_dev_lock();
+	_ffs_release_dev(opts->dev);
 	_ffs_free_dev(opts->dev);
 	ffs_dev_unlock();
 	kfree(opts);
@@ -4363,10 +4365,12 @@ static int ffs_acquire_dev(const char *dev_name, struct ffs_data *ffs_data)
 	return ret;
 }
 
-static void ffs_release_dev(struct ffs_dev *ffs_dev)
+/*
+ * Same as ffs_release_dev(), for callers that already hold ffs_lock.
+ */
+static void _ffs_release_dev(struct ffs_dev *ffs_dev)
+	__must_hold(&ffs_lock)
 {
-	ffs_dev_lock();
-
 	if (ffs_dev && ffs_dev->mounted) {
 		ffs_dev->mounted = false;
 		if (ffs_dev->ffs_data) {
@@ -4377,7 +4381,12 @@ static void ffs_release_dev(struct ffs_dev *ffs_dev)
 		if (ffs_dev->ffs_release_dev_callback)
 			ffs_dev->ffs_release_dev_callback(ffs_dev);
 	}
+}
 
+static void ffs_release_dev(struct ffs_dev *ffs_dev)
+{
+	ffs_dev_lock();
+	_ffs_release_dev(ffs_dev);
 	ffs_dev_unlock();
 }
 
-- 
2.34.1


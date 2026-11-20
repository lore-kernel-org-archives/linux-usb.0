Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795204034;
	b=xs5iUfCLn3KzulqUyzBFxPK2cILMdzC7CoqT/dLGfFSXRSMw5BiM7cS/lt322P1itbu3
	 81Lhbaz1O0xu3BR7bDfgTSihx9RtJaLRAhjw7p0ClurLSRf7fXziQeT1AjeDpiip6LdJk
	 JTpYKnE8QobxbG9MFqseVmZAFlLcDA96HVuF1UTS9xwtGejwsxHEUgX/MnYj0IQKurOeO
	 Qq2F/5zPZcGeO9ZjLKN0M4iTI2r2jvp6XRnQPQ8ve1VcJgTFLRnNOAHCU8ZqBEvxS9fwM
	 xBpkCoEI1NeiH8HqjZ380MNxXHM2Ka29t6B5xtICFMqE6HHRaC03KvNSq2EcGD8vDmQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795204034;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=klNUj0mCBfOOb/rIIQtEdnzdvHp4cxJXFctmuxUH578=;
	b=jLVTn3KtkXqnNWAMR1rMwzSl+hq5u9pDzgT8mGO+wc0FZ3+4Y1HuMDyRxKjyAdZlJeJp
	 SO4VX0c6wQXFLVEbnRms7v8HrnVlD/opiz9FGlMjqftrWP6JDgCh0G5kHPBNRuYB3gFN2
	 gN4WpQk6JA0HhnUb32FXy/x5HQp3SbLEqohrvyuenOOTUMDR8MqRF95a6c9/4aPzzf7J2
	 C/SFbuip70Y0wywHHBbVzDm6TskLusGIwHFlv2Oup9EPqU7mpddfQNCx5PMqJBDyMfawj
	 sM/NcYfLr5qpdxIxXxyEu9Yr7XjOPhICgLUvlptcAGyCEdGoomIG0WMwdp2AvEynvlA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pAPcsBsj;
	arc=none smtp.remote-ip=209.85.161.41
Received: from mail-oo1-f41.google.com (mail-oo1-f41.google.com [209.85.161.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B25C8606A6C2
	for <linux-usb@vger.kernel.org>; Fri, 20 Nov 2026 19:47:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B25C8606A6C2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pAPcsBsj
Received: by mail-oo1-f41.google.com with SMTP id 006d021491bc7-71aea92f666so873249eaf.2
        for <linux-usb@vger.kernel.org>; Fri, 20 Nov 2026 11:47:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795204031; x=1795808831; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=klNUj0mCBfOOb/rIIQtEdnzdvHp4cxJXFctmuxUH578=;
        b=pAPcsBsj3SaRl6TCz9RR3uwmfFe4dDwwxyp6VSwwjXqtLgI+X2TAYxx1HVFyFfsu1G
         ISU3qKnJ4ICxWcubM9Qoum0XORbuadMXHJ+XzlT9UUV8E5dZA03vPES8nVnYwpg0NZSP
         Px8ykrAsZK0xznbKUZKH/10OLg1XYOZZYxWOV5YX55+Ln8V5iPU6ToARRd7u6DMRmRMm
         UXgLiOuHCHzUBEOXxCKskVnuNsiLHMHzxvhP4k0786iVc8Q7RnUp0FPurToQTJ1Hwk7B
         2raDOIpZXnEkb9m85pefXpjgfgGkE44mA9LeZhE4nPi2cnwTXDZDrL87aupiaxvO0kBV
         Xpiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795204031; x=1795808831;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=klNUj0mCBfOOb/rIIQtEdnzdvHp4cxJXFctmuxUH578=;
        b=vzHcVPTSRnZs8+dEhW8SfNaZWlTtoDwISDKFfQ9YTUz/6J4WhYrb1/4TR1CpHRDrdb
         9DEe6p/lA7vGQHwS5avAC7t5sN/LjP66d565hCmbpy1en5P3pUi6iuoDR3UK+LcE/UX2
         MkP53j3uHJPKdvGQwGMqaw0ZRrNgRLYbbHn3V30bqtRi/5prpS8Sld8wVN5YTEYuDqfI
         xdxt4Nuf2eP6YoJvlNervYImMrlGv2Kju9egsJC+u4hms4zh8w+cRYP2WSSROK+6Q42A
         MyaEUE5nm978vSEXIUslHyNd5Uegdm/dvYsc/aY0wi5QRQRk1+KcVgluW2dl8I7pt/Hc
         NGYg==
X-Gm-Message-State: APuU4Z/nyK/X8ifOSaT4b6fej011yT6XlIY+2VzVCHzGajS1U4ybd/8H
	b03feTIqj5CFXwk8aSX+ZH6fdLrwvYaQ8qrFeAlQbq/23Bkb8XCXGScA
X-Gm-Gg: AYBFou14mtTEGD7j0XWd9U7uogOaKMp32LMCDgm+4pbStQ7SqXpD+aYba7syFvg/fyu
	cnN1j/P2OvHwPqA9yr7G95kDFuzeCIG8K+QhAQgaz5dV9MfS4UrM4aoyKtkKsGgV0NsBi1c1E/0
	dzETkmECQ0c0NOS1/6lgHEYSBSasqd9pp//wZdYLMCeK3wJUiHUFAbVOaDWg7D7j/vHb3H7OU4+
	HNWOk+ns70YcxOx/2+sAdhvQu6SL46lFIu5DcTfhdBxdNW0vnRgMGe9s8PDCp9GC77eVMCq/h3a
	LXk9C6RHZ6welTCuYRC8K0V0imQwb1jYgXcxngBn1T6wG3w0tGWU0e71UC5Ys/6HpYoK8rCn8AJ
	5IoYpDoos/7ddZ/48spfcLu1QUm+RswDzg7PqH9GM1jbKXRvCISEIj/E59cS0/fpjn2JRAS74PJ
	IPIIbP9icJ4tq+kbhA2x9G6rZszj53VrxqmJesfsPwrmrTxwb64QSTR/S1JNdXnoPu+fmCK6PFp
	ebGA/WNB2Z3Cu+SBSs6Aex2hCwSOD5dxe+g6o09WA5f5iV2gBeggZtW0A6j97A+6Wq19oyRhAoG
	zEGcyDYqNuj71ZR0UQU7Z5sn+tJ9vSPaCNTWu755RQyw9SAkTHcEEFaYeXKici6Vn3xSQER+Gl4
	H/V2v5Rpaf/9OYVjQ+NfXENlKD670HuoQrMVEB/zswa7ZIHo69AIpHis3qYqo77HZDC20sRt1DV
	WWOEmaIoaFGPDs3Tfwrjot6dT0/oBp12Kbl8gKfXsfWAk+YW3ySWRWVPqNv+cLLKEewamB
X-Received: by 2002:a05:6820:1990:b0:71b:187f:1d05 with SMTP id 006d021491bc7-71b395557e8mr3175251eaf.68.1795204030591;
        Fri, 20 Nov 2026 11:47:10 -0800 (PST)
Received: from node0.jspace.cloudfaas-pg0.wisc.cloudlab.us ([128.105.146.42])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-71b380bdff9sm2583069eaf.11.2026.11.20.11.47.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 11:47:09 -0800 (PST)
From: Mohammad Mosafer <mohsafer@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	syzbot+6227549bd2c8a1ec8ba0@syzkaller.appspotmail.com,
	Mohammad Mosafer <mohsafer@gmail.com>
Subject: [PATCH v4] usb: gadget: f_fs: fix use-after-free in ffs_closed() on umount
Date: Fri, 20 Nov 2026 13:46:56 -0600
Message-Id: <20261120194656.336875-1-mohsafer@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <sashiko-outbox-225940@kernel.org>
References: <sashiko-outbox-225940@kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

ffs_free_inst() releases the ffs_dev with ffs_release_dev() and only
then re-acquires ffs_dev_lock to free it with _ffs_free_dev().  In
between, the dev is still linked on the ffs_devices list while already
marked unmounted, so a concurrent mount(2) of functionfs finds it by
name in ffs_acquire_dev() and links a fresh ffs_data to the doomed dev
(ffs_data->private_data = dev).  _ffs_free_dev() then kfrees the dev,
and when that mount is torn down, ffs_closed() dereferences the stale
ffs->private_data:

  BUG: KASAN: slab-use-after-free in ffs_data_clear+0x438/0x530
  Write of size 1 at addr ffff88810594664a by task repro/116
    ffs_data_clear+0x438/0x530
    ffs_fs_kill_sb+0x7b/0x510
    deactivate_locked_super+0xa9/0x200
    cleanup_mnt+0x255/0x380
    ... reached via umount(2)
  Freed by task 112:
    kfree+0x127/0x3b0
    ffs_free_inst+0x10c/0x1a0
    usb_put_function_instance+0x8a/0xc0
    configfs_rmdir+0x773/0x9c0
  Allocated by task 113:
    ffs_alloc_inst+0x109/0x360
    function_make+0x138/0x330
    configfs_mkdir+0x48b/0x1090

Hold ffs_dev_lock across the release and the free so that a released
dev is never findable, splitting ffs_release_dev() into a lock-assuming
_ffs_release_dev() (matching the _ffs_* convention in this file) and
enforcing its caller-holds-the-lock contract with lockdep_assert_held().
For the same reason, re-read ffs->private_data under ffs_dev_lock in
ffs_data_put(): the argument read there was unlocked, so a concurrent
ffs_free_inst() could unlink and free the dev while the putter waited
on the mutex, and the subsequent ffs_release_dev() would dereference
the freed dev.  The now unreached ffs_release_dev() wrapper is dropped;
its remaining callers use _ffs_release_dev() with the lock held.

The race was reproduced with a multi-threaded harness racing configfs
mkdir/rmdir of the ffs instance against mount/umount of functionfs on
a KASAN kernel: the unpatched kernel reports the use-after-free
reliably (2/2 runs), the patched kernel survives an extended soak with
identical churn (2/2 runs clean).

Reported-by: syzbot+6227549bd2c8a1ec8ba0@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=6227549bd2c8a1ec8ba0
Fixes: ecfbd7b9054b ("usb: gadget: f_fs: Fix setting of device and driver data cross-references")
Signed-off-by: Mohammad Mosafer <mohsafer@gmail.com>
---

Hi Greg,

Right - the comment duplicated the commit message, so it is gone.  The
lock contract is now enforced with lockdep_assert_held(&ffs_lock)
instead of the comment; ffs_lock is the mutex behind the
ffs_dev_lock()/ffs_dev_unlock() wrappers.

The Fixes tag is corrected in this version: the release-then-free
window in ffs_free_inst() and the unlocked ffs->private_data read in
ffs_data_put() were introduced by ecfbd7b9054b, not by 5920cda627688c
which predates the bug.

Changes in v4:
- Fix the Fixes tag: the defective shape (the release-then-free window
  in ffs_free_inst() and the unlocked ffs->private_data read in
  ffs_data_put()) was introduced by ecfbd7b9054b ("usb: gadget: f_fs:
  Fix setting of device and driver data cross-references"), not by
  5920cda627688c, which predates the bug (Sashiko review bot).

Link to v3: https://lore.kernel.org/r/20261120192415.335646-1-mohsafer@gmail.com

Changes in v3:
- Drop the explanatory comment in ffs_free_inst(); it duplicated the
  commit message (Greg KH).
- Enforce the caller-holds-the-lock contract of _ffs_release_dev()
  with lockdep_assert_held(&ffs_lock) instead of a comment (Greg KH).

Link to v2: https://lore.kernel.org/r/20261006214940.158352-1-mohsafer@gmail.com

Changes in v2:
- Re-read ffs->private_data under ffs_dev_lock in ffs_data_put(): the
  unlocked argument read raced with a concurrent ffs_free_inst() freeing
  the dev while the putter waited on ffs_dev_lock (flagged by the
  Sashiko review bot).
- Drop the now-unused ffs_release_dev() wrapper.

 drivers/usb/gadget/function/f_fs.c | 19 +++++++++++++-------
 1 file changed, 12 insertions(+), 7 deletions(-)

diff --git a/drivers/usb/gadget/function/f_fs.c b/drivers/usb/gadget/function/f_fs.c
index c64a268e98a4..3aab4c28e310 100644
--- a/drivers/usb/gadget/function/f_fs.c
+++ b/drivers/usb/gadget/function/f_fs.c
@@ -288,7 +288,7 @@ static struct ffs_dev *_ffs_find_dev(const char *name);
 static struct ffs_dev *_ffs_alloc_dev(void);
 static void _ffs_free_dev(struct ffs_dev *dev);
 static int ffs_acquire_dev(const char *dev_name, struct ffs_data *ffs_data);
-static void ffs_release_dev(struct ffs_dev *ffs_dev);
+static void _ffs_release_dev(struct ffs_dev *ffs_dev);
 static int ffs_ready(struct ffs_data *ffs);
 static void ffs_closed(struct ffs_data *ffs);
 static void ffs_reset_work(struct work_struct *work);
@@ -2231,7 +2231,14 @@ static void ffs_data_put(struct ffs_data *ffs)
 	if (refcount_dec_and_test(&ffs->ref)) {
 		pr_info("%s(): freeing\n", __func__);
 		ffs_data_clear(ffs);
-		ffs_release_dev(ffs->private_data);
+		/*
+		 * ffs->private_data must be re-read under ffs_dev_lock:
+		 * a concurrent ffs_free_inst() may have NULLed it and
+		 * freed the dev it pointed to.
+		 */
+		ffs_dev_lock();
+		_ffs_release_dev(ffs->private_data);
+		ffs_dev_unlock();
 		BUG_ON(waitqueue_active(&ffs->ev.waitq) ||
 		       swait_active(&ffs->ep0req_completion.wait) ||
 		       waitqueue_active(&ffs->wait));
@@ -4147,8 +4154,8 @@ static void ffs_free_inst(struct usb_function_instance *f)
 	struct f_fs_opts *opts;
 
 	opts = to_f_fs_opts(f);
-	ffs_release_dev(opts->dev);
 	ffs_dev_lock();
+	_ffs_release_dev(opts->dev);
 	_ffs_free_dev(opts->dev);
 	ffs_dev_unlock();
 	kfree(opts);
@@ -4363,9 +4370,9 @@ static int ffs_acquire_dev(const char *dev_name, struct ffs_data *ffs_data)
 	return ret;
 }
 
-static void ffs_release_dev(struct ffs_dev *ffs_dev)
+static void _ffs_release_dev(struct ffs_dev *ffs_dev)
 {
-	ffs_dev_lock();
+	lockdep_assert_held(&ffs_lock);
 
 	if (ffs_dev && ffs_dev->mounted) {
 		ffs_dev->mounted = false;
@@ -4377,8 +4384,6 @@ static void ffs_release_dev(struct ffs_dev *ffs_dev)
 		if (ffs_dev->ffs_release_dev_callback)
 			ffs_dev->ffs_release_dev_callback(ffs_dev);
 	}
-
-	ffs_dev_unlock();
 }
 
 static int ffs_ready(struct ffs_data *ffs)
-- 
2.34.1

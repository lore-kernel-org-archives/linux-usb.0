Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6959E3B27D6
	for <linux-usb@vger.kernel.org>; Tue,  6 Oct 2026 21:05:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791320740; cv=none; b=n4crhPRXpzqgKqsgVsO3/EZMMJH+p/Tf2LdSJQMvrRZs0F/3lqrLerU6KYqAgVVZOxQ1BM3FSzpDlSJdnfsBiaQnv1+K5wn9AZiw5SUhtD5xJPtP/mHmt5dieWbY2tjbjNJ7UcBXQs1hRcSAeyR2DE+TVN6PjBzuz03doApjRck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791320740; c=relaxed/simple;
	bh=+F0+ycc+xbb/1CkSZnHs7maND8qCtOZY/lTKM/XfP9Y=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=GgEmJi+WY/R/ch8OLMAZ1cOoftPcfWAbJkzE17BPtNkyu3WucuQ3IjHuxsEb7wgmbBUKRY2gUkvefiqfCV+FSVk+z6riBptKZhmUWOR0TwugxefYF7S4SFmjkqqQRihJv1zZEnq7ck0rPLAx2sZ4CosqpQHFncLHEbm9gQOlSVg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VnikeRBx; arc=none smtp.client-ip=209.85.160.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VnikeRBx"
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-5351e6a2230so8402391cf.3
        for <linux-usb@vger.kernel.org>; Tue, 06 Oct 2026 14:05:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791320737; x=1791925537; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=mDB2cI4J8xwjSaPq9adlxmBRHUe++IzDkzyJihE7Ky4=;
        b=VnikeRBxmfAsSxStveIR1o5xUJrerr8MvIsz7C42egaU36MR/EJaT25qGm0Bwy+C4x
         QEWlfKeMLkCUzZDnfBqe3LnUqMGmXPxykVGK4dgtM2gg2gv4zQmlkdFwBuOq3IEyTX7d
         w92s8H28qANxW3zubbHc14mOvQRgXpst2mch2Is/fm0QVpZh2sffSyvy9NfwU1weKaDH
         bg2XsmClAaGCy79kfLG+atU1bqO90dG0uvv4eZRnQLQZSXOtlSqoFUqB6EElhD5+/bLC
         srPwRG2fvyteNi7WlNTKBRVl3qtgNQRkAA99vuyr4S0Mb/pk6oK87fyYVdbD+3TDWIJO
         Uy9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791320737; x=1791925537;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mDB2cI4J8xwjSaPq9adlxmBRHUe++IzDkzyJihE7Ky4=;
        b=a5M5ZZcCnnf26SIZvORO62nWlMxenxWT6YQ//OVoC/3FBwRMXZaHfo5JaW2H5Swb4c
         vn6SCkDJa3BAces8FJAz48u6Z/tgFsNT/8mg1xg45ZAAi20CdBLUprMswBKTGePpQc+T
         9dFtjetfptIbIEYCPY/retZHHJSR3L+z6GX1A2lq+3rINl/J3dtQMX+wcPB6lSWIpONi
         OJ9xhjNYIAg4QSCMfxOwWlr0XjCB9RBIWhyGLyHjVFrjqSTE74l4Nr4lXkmQKM6didkE
         /5mwQ2YqYf5mZp44Ufr/q+k4PDA/RkC1Xa+8X1DhnJI5QAiwPe+5YL7qhmYF31CRNWmY
         ysPQ==
X-Gm-Message-State: AFuF++lrNnGoJzV85BJza+VlrqjWJgAJlYBLBYvSWVpcfjbniX0oOL1k
	ULaBgFnLl+0NacJaTx115d1QMzi38YxfWAnbiZEjPgEaL3f1ZpDYle0EZA6XM+viqGs=
X-Gm-Gg: AYBFou2Gi7Hrq3xF0Nq+PGhSXrIQjHwSLaQrvIhRy6IwHnHhwIucLBLo0SwL0Vr6aMM
	bkZyLsFLGyMqfqRcPCytCKL2ADTxCngFw6iWoau4l9ghZbvYO8I+V+4ZxqVNle25JZdkcAQbPOf
	oLqFMG6tr9SMNheVpsqBcarVdgJ4CyXJD1fUh3iZuyxuax76NqmCa0sQFzLwclHGpiWjeHrPj/G
	D8APC6FibVpoYo/oCw7He05UF6qvjdBvT3Zt0kkeOQmXJrxe/5IbwFQkIoFUWss5/5lVqgK4vvE
	AypgAN63KSAkXDvYZ9kMA0PkiPdtQAJop1ged5za83tI8FK9w0ibmXoLoiY1hKfSRG7RamGHQVT
	lhkcFivbms/4ikg1RiD7h2J/NQJpDGMrmhhBHjvioKG4uAFs3+qXB6scoZ2ExNni9lfaVnaXmDU
	DnIYE/h42+hbu3YJZGx6F+OgG8xQYvd1SnHMUGkIa+hbo0bhnpytkCUs4UIAxt5AcJ4/LvgiNis
	PNixREOeFLgeSEPuO0JPfxF+d0+ZXJ+ECDqJ2/RGBYZGEe55Vt8YoQIzWULN6xRjfRsMhJZHWgB
	NmdQMrIncx5Lf2Sgl3eIbqOTJ2X9sggaq5zk5vyipqrORFnwv2e7CJRh5sk7MJBxdY9tZ17AqQQ
	hsfo4n5JjhawlmV2VOFTfTQnPTfQ/TWPqGtGSA3pFq6tcRhoj
X-Received: by 2002:a05:622a:a58b:b0:533:9825:a713 with SMTP id d75a77b69052e-5357512bb50mr1810231cf.4.1791320737088;
        Tue, 06 Oct 2026 14:05:37 -0700 (PDT)
Received: from node0.quickhttpnode15.cloudfaas-pg0.wisc.cloudlab.us ([128.105.144.50])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-535720e71d2sm4789271cf.11.2026.10.06.14.05.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 14:05:36 -0700 (PDT)
From: Mohammad Mosafer <mohsafer@gmail.com>
To: linux-usb@vger.kernel.org
Cc: gregkh@linuxfoundation.org,
	linux-kernel@vger.kernel.org,
	syzbot+6227549bd2c8a1ec8ba0@syzkaller.appspotmail.com
Subject: [PATCH] usb: gadget: f_fs: fix use-after-free in ffs_closed() on umount
Date: Tue,  6 Oct 2026 16:05:23 -0500
Message-Id: <20261006210523.150724-1-mohsafer@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
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
_ffs_release_dev() (matching the _ffs_* convention in this file) plus a
locking wrapper for the remaining callers.

The race was reproduced with a multi-threaded harness racing configfs
mkdir/rmdir of the ffs instance against mount/umount of functionfs on
a KASAN kernel: the unpatched kernel reports the use-after-free
reliably (2/2 runs), the patched kernel survives an extended soak with
identical churn (2/2 runs clean).

Reported-by: syzbot+6227549bd2c8a1ec8ba0@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=6227549bd2c8a1ec8ba0
Fixes: 5920cda627688c ("usb: gadget: FunctionFS: convert to new function interface with backward compatibility")
Signed-off-by: Mohammad Mosafer <mohsafer@gmail.com>
---
 drivers/usb/gadget/function/f_fs.c | 24 ++++++++++++++++++++----
 1 file changed, 20 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/gadget/function/f_fs.c b/drivers/usb/gadget/function/f_fs.c
index c64a268e98a4..5e7179b4250e 100644
--- a/drivers/usb/gadget/function/f_fs.c
+++ b/drivers/usb/gadget/function/f_fs.c
@@ -288,6 +288,7 @@ static struct ffs_dev *_ffs_find_dev(const char *name);
 static struct ffs_dev *_ffs_alloc_dev(void);
 static void _ffs_free_dev(struct ffs_dev *dev);
 static int ffs_acquire_dev(const char *dev_name, struct ffs_data *ffs_data);
+static void _ffs_release_dev(struct ffs_dev *ffs_dev);
 static void ffs_release_dev(struct ffs_dev *ffs_dev);
 static int ffs_ready(struct ffs_data *ffs);
 static void ffs_closed(struct ffs_data *ffs);
@@ -4147,8 +4148,17 @@ static void ffs_free_inst(struct usb_function_instance *f)
 	struct f_fs_opts *opts;
 
 	opts = to_f_fs_opts(f);
-	ffs_release_dev(opts->dev);
+
+	/*
+	 * Release and free the dev under a single ffs_dev_lock critical
+	 * section. Between ffs_release_dev() and _ffs_free_dev() the dev
+	 * would still be on the ffs_devices list while already unmounted,
+	 * so a concurrent ffs_acquire_dev() could link a fresh ffs_data to
+	 * the doomed dev, leaving it with a dangling ->private_data that is
+	 * dereferenced in ffs_closed() when that mount is torn down.
+	 */
 	ffs_dev_lock();
+	_ffs_release_dev(opts->dev);
 	_ffs_free_dev(opts->dev);
 	ffs_dev_unlock();
 	kfree(opts);
@@ -4363,10 +4373,11 @@ static int ffs_acquire_dev(const char *dev_name, struct ffs_data *ffs_data)
 	return ret;
 }
 
-static void ffs_release_dev(struct ffs_dev *ffs_dev)
+/*
+ * ffs_dev_lock must be taken by the caller
+ */
+static void _ffs_release_dev(struct ffs_dev *ffs_dev)
 {
-	ffs_dev_lock();
-
 	if (ffs_dev && ffs_dev->mounted) {
 		ffs_dev->mounted = false;
 		if (ffs_dev->ffs_data) {
@@ -4377,7 +4388,12 @@ static void ffs_release_dev(struct ffs_dev *ffs_dev)
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


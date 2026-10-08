Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64F4E13FEE
	for <linux-usb@vger.kernel.org>; Thu,  8 Oct 2026 00:40:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791420053; cv=none; b=FX1AMtS1AHUbfB3lTe+7xNSAlnE+nqdekCu9+XcUq1AhjV465PUYFgpmQic7Oy5KgapI117MYASlSHG3qMgkluSPWdfz30ac6OaoclDzZQSjdhfWuYn+PcAgax5+X2//QXYpttyTmfAUdhQW+r4wcJwIFvXNpSXLBhO1k4y/Dfw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791420053; c=relaxed/simple;
	bh=AR9mnZZE9REsi2FD0Bp06itG5jMc6EBLfesW+rPNyhY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=K4Fqk0nrphBYg1Qj0cr1KsF6gEAzBTkTqmzr/JLZOmk2Nv6epZZr6pnmre5HKFYMyw3efWoZ5X45mQ2YDHX1uviE4QvKEw52o8zywXIAW650mwgZ4MUtbn+Ok3x/+mR93yEpQ72YVIFKyMpyhugaJB3UL5Z+9OizfiwPL+YjvRQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XKr5YUiT; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XKr5YUiT"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a061a13884so21036515e9.3
        for <linux-usb@vger.kernel.org>; Wed, 07 Oct 2026 17:40:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791420051; x=1792024851; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=csSaxc4KsfFBpQCYUgerNMao5r5HoCxkPC/E+Xae5iA=;
        b=XKr5YUiTOCZDwvFdNnFAulTpzPxxSRqPVBZz15sDiWaH3ObG65F8Cue0f8E4oyrXxj
         RRa5YUTUvZY/IhD2e7fe0eW7Gj5lAXZ2Q6yMsXU6tG7YgAmSwHc/u6Yvac7NL2EXQGOQ
         whoR3nuj1Xqs/li8XCOa9rqzjODc+HykNV9PyjmCmQzttuOcFKSbTRqT9UuN2Xiu7ZtQ
         1KAYFFhkoHCm6hqzQJmOvxJJ2QTVld4Gxd3Pisxd2GYEJFcmSyKzstAkVb0qCkue/fCp
         nbOZ4w8LqM5KSUKm9pSAgEfnacLeI2oUKY6LcRSPfPXLwHFfAV7znu/PUxYDGrpfrUVI
         tE0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791420051; x=1792024851;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=csSaxc4KsfFBpQCYUgerNMao5r5HoCxkPC/E+Xae5iA=;
        b=rwSHjyM6nPPNJyC1EoeQcLagbF6GZ2M8R5hcG0B3mpxkRDOcg04d/1pGgodSdA7rsq
         r30hkS31B8tI0FLMLbbaSrFIATRlFLzBtJVsCbnM0p1sK8S0xYgXqGz65Fm1TKJY8/vN
         7obo8eLZrDRCiI4eYXGnS6HexYbrli2JkE96YYK0QWPDP7edwAxTHMN16Y3XCI7S2dt+
         d6spBAeJqLViQGq37fxFgBlkq7ZFpSllh23XcZ8G6TYUXQVEbnWJw17kaYvLKn3pzupy
         fn5KD/U28St/Gfc8RngSS6tayjZjxIKbvXjEwmvHzfnGNe5g2M8JdKWboJUPKbOc/oGI
         mkTw==
X-Gm-Message-State: AFuF++kR/9qnSw8jU9Dz2Hw64I8YRSeWMqskN47H9HVbpCztIC9UzmqO
	olh6nHCADb8NpZSsR0pzLp4XwSyIzmqbh9amSHTBQnVFnv98PQv2jYjF
X-Gm-Gg: AYBFou1WYJT2bV+fdKI+ZiiOUoSu64ALrhbDoxgMglXQ51B4D7toToENhBF1BOMXLBE
	xCcbeFPvp2AA5unQI9gDbv4fA0Fl80N7eokZLAWe3bnbtfWsl9eVYjoymmOeaqgOqGdb1DsoQh/
	Klh7Xe5kzznTp7vb4j/xT0dqtLg/fF4ez2mZbz3x0IOSLxBBR4H+7eDdHt6kacFnMrQLQ/ADsaY
	OWvp9oJEwsiS0D+2+4WpjeYhKLVajyP4N6Jsbjy8I+NKnPnm7mnAaF2u/E0SeibXgFcWy/6TEQQ
	+mUKiO/lwbRSWX+h67Q4FYuIWmFL7x/WtRm/YWnGZPRat1gfWFPGwJ7ZYLIQuahJDFHteHjawNb
	5NAngTKGK0iGvSml0D9AbboD1CFUjNjULTkQI9EGWMpqFjRZXQmqWQODhFLeR7x8SGMIFWnkLIY
	QA48kfLlSy01RmlsMaxXWNlukTk1PcE65SwzuUnf7CxIsOP+Ly+2HnMXHUjzst9xdPd8GAvSOB
X-Received: by 2002:a05:600c:154a:b0:49f:ce78:3562 with SMTP id 5b1f17b1804b1-4a18043c1f2mr70039715e9.19.1791420050472;
        Wed, 07 Oct 2026 17:40:50 -0700 (PDT)
Received: from localhost.net ([84.75.40.48])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1842abfbdsm29007945e9.4.2026.10.07.17.40.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 17:40:50 -0700 (PDT)
From: Eduard Zateev <hackerowskiy@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] usb: gadget: f_fs: fix use-after-free on umount
Date: Thu,  8 Oct 2026 02:39:55 +0200
Message-ID: <20261008003955.1191-1-hackerowskiy@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

ffs_free_inst() releases a device and drops ffs_dev_lock before it
removes and frees the device. A concurrent FunctionFS mount can find
the released device in that window, attach a new ffs_data to it, and
then use the freed device from ffs_closed() during unmount.

Keep ffs_dev_lock held across release and free so a new mount cannot
attach to a device being torn down. In ffs_data_put(), read
ffs->private_data only after acquiring the same lock, since a concurrent
ffs_free_inst() may clear and free the referenced device while the
putter waits for the lock.

Fixes: ecfbd7b9054b ("usb: gadget: f_fs: Fix setting of device and driver data cross-references")

Reported-by: syzbot+6227549bd2c8a1ec8ba0@syzkaller.appspotmail.com

Link: https://syzkaller.appspot.com/bug?extid=6227549bd2c8a1ec8ba0
Signed-off-by: Eduard Zateev <hackerowskiy@gmail.com>
---
 drivers/usb/gadget/function/f_fs.c | 21 ++++++++++++++-------
 1 file changed, 14 insertions(+), 7 deletions(-)

diff --git a/drivers/usb/gadget/function/f_fs.c b/drivers/usb/gadget/function/f_fs.c
index c64a268e9..791425390 100644
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
@@ -4363,10 +4370,11 @@ static int ffs_acquire_dev(const char *dev_name, struct ffs_data *ffs_data)
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
@@ -4378,7 +4386,6 @@ static void ffs_release_dev(struct ffs_dev *ffs_dev)
 			ffs_dev->ffs_release_dev_callback(ffs_dev);
 	}
 
-	ffs_dev_unlock();
 }
 
 static int ffs_ready(struct ffs_data *ffs)
-- 
2.56.0


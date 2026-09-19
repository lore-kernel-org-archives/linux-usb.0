Received: from mail-pz2-f41.google.com (mail-pz2-f41.google.com [74.125.228.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4902E3DB994
	for <linux-usb@vger.kernel.org>; Sat, 19 Sep 2026 09:07:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789808848; cv=none; b=Nr9zjAGAOx2RTRCC7ZJ+6wv3ogi/F3p6/53jbpsZ0vVr9Z3Ys34aUcML45R4NpRmx0lD6b9IvgmTWJWcXh9Im0ehiejKmC1SiItN4Ehmrbg1x4eTFAqp8hMyrhI58XMpYgFS1MNOnKaaInhX2Q2nkvthaQFmTDKntqrvKSSCOFA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789808848; c=relaxed/simple;
	bh=EP2SoyZGj6b2KWeXxjQftCCohXQZzLIQweKoUaIbghc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=U1xcWG0/C80JGnm5u9KZ7b7nHoDTeZCDwHQ6fFEHyz9Awa2ZTQdDhOa9nxqiOFlButcf5vuRkJWz7F2SxL9x001s8AwyX9DDARWHpZ5LOKNpZzYNCAH4sr54vAyJth3HJe8qErFydTJJfCI0hzfZ3qUKiM7hTA7DGiDwMrw+2uQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DjkwgmCJ; arc=none smtp.client-ip=74.125.228.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DjkwgmCJ"
Received: by mail-pz2-f41.google.com with SMTP id d2e1a72fcca58-85469b355ffso965367b3a.1
        for <linux-usb@vger.kernel.org>; Sat, 19 Sep 2026 02:07:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789808846; x=1790413646; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9cjbYUiYXdBEw6XGGY0QG3g1uWd3EidgA6q8KwE4+1g=;
        b=DjkwgmCJsHlNA7xRReeZMe+sfKgJRX+jz2G7qBLA/DYQAmEFBX1E1OtLka/gvCKspy
         lGEhn4L3WYp4CzcCEOUJKuL6Mqsm1MEL2tyFgPgigGxFXKlGzVz2DjEmab9avZah1wAQ
         c+BEjNcZimRGOocPfIauExjXA7/htizDjDy/3UJZifGQV+qiOaRh5GKmH/dZF74Tw+jI
         TabiUO+4IRTq1dIAPUjQ29nAEll5F952O4A0u9Y4LaIk8oINPv6oBjFQafm+ThLobg9p
         pL9PkbIy8l5URLqddUX02XZXNclWI//2qDxywyr7YpLbDvLFos5FJT2NPVJEH7R4HNB/
         AKdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789808846; x=1790413646;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=9cjbYUiYXdBEw6XGGY0QG3g1uWd3EidgA6q8KwE4+1g=;
        b=h1ecO4hoWI66EjphtK/V38A2m/50yW24PbvzZ08NHzPWq26KNe1RetOwP6oTW9iXWx
         rBcR7q2BZA4KrUDxtKS9RwtGqs3U/gEBxvZImSdj+4TfCv5AbJ7qZ97xQ6pMCZoORvaJ
         FscmL0TQV/fT2DkDlxirkHCsm5gbqUFAfvIIpkzOGdc0pEsqCUTmoDQeCj/ohLmI7xps
         Hm+IFp7XWvdSlpiTbmoo+qyyvzCyZjYlj3VbpSfwmLnc9JX13peXZe/Mg34mHX8nE1iK
         hDau0XSvFJnmJiMn8wTb+d68cL39KugVp19nXO1RMivvZaL7GyLJw6C9u/3UqEQj2TmX
         csrQ==
X-Gm-Message-State: AFuF++mNs798BAl2DKHIGMvTXZ9LK7PucYM3SI6rcFmSmK4b7aVeD+EB
	WlviNxR06hORvzYF8Z8jVqhAsZrsyzz0T2f1rXdHCtnGx5QIXf3S3OGOmk+YqTBc
X-Gm-Gg: AYBFou2JJrMvCTDfnD5dXSs0J9QZPq2g2zy/AfuOJC7YKkiFAY0eKW9Dpd4Jbrmbe9B
	ymdU9H1n9B3mjZW4jeSH0a3mzDCtGtt15ovQmx6jIIuSyoAgJSUueMSXO/7D+dQ9i79ECREcv22
	p1ity0mr1FSSHcZBvDGBHu9Ko8afPDtBZ2chiMcfXq0VSy2iBtfutWJu9o5PW94Q7sVESvh1IKh
	yQWZc+uH6E8R6SLkf7Lwv1G4dgcrTpz4KN9KPD7fBZjEEriPlbr8tbQIucpw84tZ30p8sH0+qJE
	9wOuBt9sSDC6952iED0fkxKSCV0S0iS7tG4/mFcIMUDd2vRRnfDlbpPzy5rEfUgmMGg7mXI90RM
	rGRN6CrAN798R10wB2+RofrrKdyrDGGYsarmJcZZWvOD9QJMpPfZ9t5vEwKg7DDm8dZ3vZ+y6e3
	j+D0Mviv3eZPjxwF501g290VYOWVsP1anKov8SS5v4K3uq8IjSSBu1HijzH6HdB0hqVci/a8Vl3
	+svcUn+91eG61S5J/vNxoyq6R1v2rblP16o1kLGN6+TtWEvF0QhzXMXpqfcnKKzj8nVg0fGpNxb
	BmRS4tSVqA==
X-Received: by 2002:a05:6a21:2d91:b0:3dd:a195:dd59 with SMTP id adf61e73a8af0-3dda195e57emr3783433637.59.1789808846496;
        Sat, 19 Sep 2026 02:07:26 -0700 (PDT)
Received: from phui-2.c.googlers.com.com (78.123.83.34.bc.googleusercontent.com. [34.83.123.78])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc72a26d5casm754712a12.0.2026.09.19.02.07.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Sep 2026 02:07:26 -0700 (PDT)
From: Hui Peng <benquike@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Hui Peng <benquike@gmail.com>
Subject: [PATCH 2/2] usb: gadget: f_hid: fix use-after-free of hidg->func.config after unbind
Date: Sat, 19 Sep 2026 09:07:24 +0000
Message-ID: <20260919090724.3256109-2-benquike@gmail.com>
X-Mailer: git-send-email 2.55.0.1082.g2b9226bbc0-goog
In-Reply-To: <20260919090724.3256109-1-benquike@gmail.com>
References: <20260919090724.3256109-1-benquike@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The /dev/hidgN character device stays open across function unbind: a
process can open it, then remove the configfs gadget (echo "" > UDC,
unlink the function from the config, rmdir the config directory), and
keep using the still open file descriptor.

hidg_unbind() does not clear hidg->func.config, so the file operations
continue to dereference the struct usb_configuration that configfs has
already freed. f_hidg_get_report() does so unconditionally on entry:

	struct usb_composite_dev *cdev = hidg->func.config->cdev;

which gives a use-after-free read on the first ioctl() after the config
directory is removed:

 ==================================================================
 BUG: KASAN: slab-use-after-free in f_hidg_get_report.isra.0+0x401/0x4a0
 Read of size 8 at addr ffff8881073d7950 by task init/172

 CPU: 2 UID: 0 PID: 172 Comm: init Not tainted 7.3.0-rc3-g5dd1818b15d9 #1 PREEMPT(lazy)
 Hardware name: QEMU Standard PC (i440FX + PIIX, 1996)
 Call Trace:
  <TASK>
  dump_stack_lvl+0x70/0xa0
  print_report+0x153/0x4c6
  kasan_report+0xf1/0x120
  f_hidg_get_report.isra.0+0x401/0x4a0
  f_hidg_ioctl+0xe1/0x110
  __x64_sys_ioctl+0x184/0x1d0
  do_syscall_64+0xda/0x4b0
  entry_SYSCALL_64_after_hwframe+0x77/0x7f
  </TASK>

 Allocated by task 1:
  __kmalloc_cache_noprof+0x16a/0x380
  config_desc_make+0x1e6/0x590
  configfs_mkdir+0x4e9/0xe10
  vfs_mkdir+0x2ed/0x790
  __x64_sys_mkdir+0x6f/0xa0

 Freed by task 1:
  kfree+0x159/0x420
  config_item_cleanup+0x148/0x1e0
  config_item_put+0x90/0xb0
  configfs_rmdir+0x816/0xa50
  vfs_rmdir+0x2e6/0x810
  __x64_sys_rmdir+0x4b/0x70

 The buggy address belongs to the object at 0xffff8881073d7800
  which belongs to the cache kmalloc-1k of size 1024
 ==================================================================

A second splat follows from the ERROR() call in the same function.

Clear hidg->func.config in hidg_unbind() and check it in the paths that
are reachable from an open file descriptor - f_hidg_read(),
f_hidg_write() and f_hidg_get_report() - returning -ENODEV once the
function is gone. f_hidg_req_complete() only uses the pointer to emit an
error message, so guard that dereference as well.

While at it, drop the report_list entries in hidg_unbind(). They are
allocated by f_hidg_get_report() and were only ever freed when the
whole f_hidg was released, so reports queued before an unbind leaked.

Assisted-by: LLM
Signed-off-by: Hui Peng <benquike@gmail.com>
---
No Fixes: tag: I could not identify a single commit that introduced
the problem with confidence, so I have left it out rather than guess.

Reproduced on Linux 7.3.0-rc3 (5dd1818b15d9) with KASAN under QEMU using
dummy_hcd: set up a HID gadget through configfs, bind it to dummy_udc.0,
open /dev/hidg0, unbind and rmdir the gadget, then call
ioctl(fd, GADGET_HID_WRITE_GET_REPORT). With this patch applied the same
sequence returns -ENODEV and produces no KASAN splat.

 drivers/usb/gadget/function/f_hid.c | 21 ++++++++++++++++++---
 1 file changed, 18 insertions(+), 3 deletions(-)

--- a/drivers/usb/gadget/function/f_hid.c
+++ b/drivers/usb/gadget/function/f_hid.c
@@ -426,6 +426,9 @@ static ssize_t f_hidg_read(struct file *
 {
 	struct f_hidg *hidg = file->private_data;
 
+	if (!hidg->func.config || !hidg->func.config->cdev)
+		return -ENODEV;
+
 	if (hidg->use_out_ep)
 		return f_hidg_intout_read(file, buffer, count, ptr);
 	else
@@ -437,7 +440,7 @@ static void f_hidg_req_complete(struct u
 	struct f_hidg *hidg = (struct f_hidg *)ep->driver_data;
 	unsigned long flags;
 
-	if (req->status != 0) {
+	if (req->status != 0 && hidg->func.config && hidg->func.config->cdev) {
 		ERROR(hidg->func.config->cdev,
 			"End Point Request ERROR: %d\n", req->status);
 	}
@@ -456,6 +459,9 @@ static ssize_t f_hidg_write(struct file
 	unsigned long flags;
 	ssize_t status = -ENOMEM;
 
+	if (!hidg->func.config || !hidg->func.config->cdev)
+		return -ENODEV;
+
 	spin_lock_irqsave(&hidg->write_spinlock, flags);
 
 	if (!hidg->req) {
@@ -644,12 +650,16 @@ static int f_hidg_get_report_id(struct f
 static int f_hidg_get_report(struct file *file, struct usb_hidg_report __user *buffer)
 {
 	struct f_hidg			*hidg = file->private_data;
-	struct usb_composite_dev	*cdev = hidg->func.config->cdev;
+	struct usb_composite_dev	*cdev;
 	unsigned long	flags;
 	struct report_entry *entry;
 	struct report_entry *ptr;
 	__u8 report_id;
 
+	if (!hidg->func.config || !hidg->func.config->cdev)
+		return -ENODEV;
+	cdev = hidg->func.config->cdev;
+
 	entry = kmalloc_obj(*entry);
 	if (!entry)
 		return -ENOMEM;
@@ -1582,10 +1592,19 @@ static void hidg_free(struct usb_functio
 static void hidg_unbind(struct usb_configuration *c, struct usb_function *f)
 {
 	struct f_hidg *hidg = func_to_hidg(f);
+	struct report_entry *entry, *tmp;
+	unsigned long flags;
 
 	cdev_device_del(hidg->cdev, &hidg->dev);
 	destroy_workqueue(hidg->workqueue);
+	spin_lock_irqsave(&hidg->get_report_spinlock, flags);
+	list_for_each_entry_safe(entry, tmp, &hidg->report_list, node) {
+		list_del(&entry->node);
+		kfree(entry);
+	}
+	spin_unlock_irqrestore(&hidg->get_report_spinlock, flags);
 	usb_free_all_descriptors(f);
+	hidg->func.config = NULL;
 }
 
 static struct usb_function *hidg_alloc(struct usb_function_instance *fi)
-- 
2.43.0

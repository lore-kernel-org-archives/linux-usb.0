Received: from mail-pj2-f43.google.com (mail-pj2-f43.google.com [74.125.227.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86D7127C162
	for <linux-usb@vger.kernel.org>; Sat, 19 Sep 2026 11:00:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789815653; cv=none; b=ICVwJXLs6PcMa4S18lUl7mM3r7Jfvq4odMH8oM7YrRgdhRS5xLOok6EwLXg7XjqeNlYKmMcWI889IZ5IU0HHlYdBMjb6KG8IGFyJEmwpKZiiW51/OMXDb1qNcZa9igeu/+K/j7+n4KhFmWgM4rHWbsAmQIwUGJTeZy+WVhRccR4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789815653; c=relaxed/simple;
	bh=Yb9lyah0hVvbFAxaceBoHYbYyMGvCMkRtMc5A5qtj1Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=X5NuMtNxXyUQLK4MIyv2N3xbee0E4bbLv47fJ/5TBIqIHmNkch/OXK3danaLUbTlELx+2LWNK9W1Cxcv6LL4PZrYdD8iRsTod6L5RlRHmNhZ8X0FMH00i6dihsabkd+RRJmL6oOOJjtva0zFLflvYzVDKMGzdkVMKSS7AmWt0rQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pG+S+qK/; arc=none smtp.client-ip=74.125.227.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pG+S+qK/"
Received: by mail-pj2-f43.google.com with SMTP id 98e67ed59e1d1-396ccb1a98dso1249409a91.0
        for <linux-usb@vger.kernel.org>; Sat, 19 Sep 2026 04:00:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789815652; x=1790420452; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FqklTuy8TqvsTGNaHv++UDyWLIaY+KUMBZFRCQ6IO0k=;
        b=pG+S+qK/BCw7QDay0HoXnT80gBKSNDYmq8sQDc5gi0SLaqEX+oy8jz9//CGTfLJqv+
         Jf9ip5PYIjlCcPKLCaLFCVxsnWPyFmuSxCWlSNTmIucYTKlqqxwIR1xQ4jCJ0Rcy2mV0
         iHPzMtElom+zC/aw9DqnkhaXoBX6qlBc+hTpLo9qF+MfDO+xjhQLteNGq5e15BuoHSYb
         4z31xkYDu+PQVN7VKSDr91d7Di69ORjtM/nxHGGLsIMd1c0Y/sKqnebLyt0Ww06pm5ns
         LspEYtEfGOMIZEwCo4MCWgnXEhP62Lh1B1uJ+mWuEE1FBNyEkckMdvBuu1PJ39+Ccjll
         jrjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789815652; x=1790420452;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=FqklTuy8TqvsTGNaHv++UDyWLIaY+KUMBZFRCQ6IO0k=;
        b=pNFU7hjUilQe4kvhFRqScjIntZ9MNwFaxVbrgmJzNdBa3etLZzq0Gt3c++55MwUIa7
         GjcTv1A3brZtIDzcOEQOT4lORW4cMx2YACd2/BDa/GBwpo/7GMmvqzMjq9xNuw1HRzX1
         j20oJN2i5qTU6sEGxhllt3ZHXXvgeEs6HrPv5fUdEW4/NW69IQe2S2W/IgUwi95dGNPQ
         9vfMAlERCbmfMSCBNVQy0ft43WYtwzuNPSON5Kr5uO4hyK0GZU50dK4p2b1Mwh4bYMp5
         xiPHb2iMaES9RxmsMaqGb+vyw6htXPe/+McF0uvkj3j8FACb2/dxn3Z+gKIKYvYgq13F
         4bLQ==
X-Gm-Message-State: AFuF++lWT2hWqggkGGzQbxX//ElgbeToyfffD6txK2qkGmaVT6qqSZzE
	iy5jpzfyRdv9MN1Octs1SXU7J47U+XsKP8a5yus8RFtlsb84R94aMqlX7jVkMg+/
X-Gm-Gg: AYBFou0jt+nLMJ31O4PHxKmPBqkhuUomrFYi3eDZLNdoZtUBzwqGAGGeNXnbULjfjZl
	E+jPNcu2/vP2EVKuvx1w48p3B+BuFyh17b/QgorvqpJHXeoZpD1SPSp4kM86bUZpcppTAvseOhz
	6bkLZ+qO3GH5R/1Ds2W8DqAGU/xNQYqISZdAFDhG93nwDa1G2OcxqeEZJ4nmKujTpUoMj+/joUU
	xNfzoufn7lFwQWWMXTKIp8U13av1dvFp9wfIF3XKjtUriNzuF6U4aklEimPvpJZYbXK6FdxXTbS
	4PPwJGJVMTW/nulkTAAeINSYSpegjZJSlIoo6SEJc1ESqJiQagUU4X9mBvxvTsMsBBh+zWWIrxb
	Vu0d/neCiM72307YHhX3S6+HpWEbbe3h7keQab3jV5Uzp9YSZj9/gXiD4KGaDreK3ww0SdRxd/L
	DRYKEbRoHmhN2+GlNmB4Ps7KDh/6p0gZf/0nP0RGAZIkPgqENr8yAtyBk7r20/VQvNT/uMcbipC
	y49jx68TtiqRbxUA5P5tAJnZWsx4JyVP5n3wPSm8GjGWvRD/TsnepadWtvGzMkkoNyivmkEalQp
	bqRakElbIzA=
X-Received: by 2002:a17:90b:2e48:b0:39e:6c6a:6573 with SMTP id 98e67ed59e1d1-39e6c6a6824mr3387804a91.54.1789815651660;
        Sat, 19 Sep 2026 04:00:51 -0700 (PDT)
Received: from phui-2.c.googlers.com.com (78.123.83.34.bc.googleusercontent.com. [34.83.123.78])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e6cb427casm4105972a91.17.2026.09.19.04.00.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Sep 2026 04:00:51 -0700 (PDT)
From: Hui Peng <benquike@gmail.com>
To: gregkh@linuxfoundation.org,
	Chris.Wulff@biamp.com,
	david.sands@biamp.com
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/2] usb: gadget: f_hid: fix use-after-free of hidg->func.config after unbind
Date: Sat, 19 Sep 2026 11:00:50 +0000
Message-ID: <20260919110050.3764064-2-benquike@gmail.com>
In-Reply-To: <20260919110050.3764064-1-benquike@gmail.com>
References: <2026091905-humbling-swooned-c371@gregkh>
 <20260919110050.3764064-1-benquike@gmail.com>
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

Fixes: a139c98f760e ("USB: gadget: f_hid: Add GET_REPORT via userspace IOCTL")
Assisted-by: LLM
Signed-off-by: Hui Peng <benquike@gmail.com>
---
v2: Add the Fixes: tag Greg asked for.

    The unconditional dereference at function entry,

        struct usb_composite_dev *cdev = hidg->func.config->cdev;

    which is the one KASAN catches above, came in with a139c98f760e
    ("USB: gadget: f_hid: Add GET_REPORT via userspace IOCTL"), first
    released in v6.12, so I have used that.

    For completeness: the exposure itself is older. hidg_unbind() has
    never cleared hidg->func.config, and the struct usb_configuration
    only became something userspace can free out from under an open
    /dev/hidgN with cb382536052f ("usb: gadget: f_hid: convert to new
    function interface with backward compatibility") in v3.19. Before
    a139c98f760e, though, the stale pointer was only reachable through
    the ERROR() calls on the write and completion error paths, and I
    have not reproduced a splat there. Tagging cb382536052f would also
    send this to stable trees where f_hidg_get_report() does not exist
    and the patch will not apply. Happy to re-tag if you prefer the
    older commit.

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

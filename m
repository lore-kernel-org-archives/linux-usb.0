Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DE943B6360
	for <linux-usb@vger.kernel.org>; Fri, 31 Jul 2026 23:06:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785539174; cv=none; b=C+JIgYIaB/RX8JB2LqN36cLlmlY1s8ORAax9BUwCZc8OeKgZ5PV3AFqbqgXrMxIitObeiaRYMC02DOIVS3mSYAQr8DpVrAS7ay1nJslpLk8saNEfpsAuzc/WoLW90/h91WwNNmWB0S5BzgNtfNr/HzobBUGT1+OdyFouFqInPcw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785539174; c=relaxed/simple;
	bh=vTS5fABI4Si4pXLP98k+xMuVt7ofecoAxFjwM9il9dg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=mZiysvniZ5Eb6MN9ZLo8UA/CLJtX72uXX19Qn0yW/Y58O2az0V5s+KkEOxIUdB3mAsNZDDbRHG1vFW2hHHANqogo/Lb4AHSyJGuSKC9VSg9Dtr9JyBWGHRZbceWUnUydgD8A0OT9PP+YjwommIyFVzAzV03XbOdr1cDaGKtuaEk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UhFnMk4Z; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UhFnMk4Z"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2cc61541f8cso27704605ad.0
        for <linux-usb@vger.kernel.org>; Fri, 31 Jul 2026 16:06:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785539173; x=1786143973; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=t/+wptgQI/4wuhlfg1bZeWkE5qmDQxqgmBrLggWs8oE=;
        b=UhFnMk4ZAwyTROKO9JFbDUGVmh+H55SAR6+oDgQm3On2oi+KsmA4Tw988gphamCvCN
         vujBlMlqG6eiYY3XhL2pW1l3a4Bf5cTndZWoopUOOy5+12noEZ83GIwRUu1mBvT5x3kk
         3hcPH5IxubX36nTL6tLdPiXb+2oZP/BT/JksmleOBMQ5Loq+2EROVy0JYDap/Cqv5PxU
         KTJiq5tSjo/v06wz+SQ3B9o36bQuZ1X0bb0yJdjV+J9SS9roEzSke+scZR7Evx3ZO3XL
         D4ngF3HFL6rDUeAbgtFpaLxtj3rB/LgCtexVNCszcAP1rMitVms4SD+8ibzhW0JPajQJ
         QNMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785539173; x=1786143973;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=t/+wptgQI/4wuhlfg1bZeWkE5qmDQxqgmBrLggWs8oE=;
        b=dmU9g1wTFk/rKX9T18ESzoDpAHMMZVEhlj74jSCgNm8LkZrrfKA21nIX8EPW3pcVB/
         /Y7tS2Bj453qT1YXhEKdWXztzH9tIFzDIi634H5Vwq2bvLP3M5PDSw2BpEd3cT8PUVVA
         pW28U9/2eQC2Ka1rTu7bzRr5sZxxzI4dOAH2SvnHCiHr6uNALP+CKZ5gIcxAUrZEobpl
         OdbGwSHVmZ6FeKkf3A5Sel5e8q0EIOEFGtxTnZFCv2138b81KfuYJkqQb7bhmEHkYgVG
         cL3zYl0XCkq6Ys2sJ12bdm7/p4vaqLqtrvmY1CZO31KoQbZxjaBSyvDctjjC1S4WFT5b
         hQ7Q==
X-Forwarded-Encrypted: i=1; AHgh+RqzoL+25rtd9XcOodBQAsZv3wzUWC8SCtTiBCl+FXBTnlGDQ595d53JWqILkyzweGhXmp2pkrTCazE=@vger.kernel.org
X-Gm-Message-State: AOJu0YyPkWo01k+2yyuEHTKxNqJ6Q8nXcy8cIUWh4md7ymTCUYwsuLvW
	85RIZY/zYKsuoOjVvxH9oEso+zk1RgAA3mN2RQYJa2nREhgzCGb3hCp7
X-Gm-Gg: AR+sD10yyVqnhpZKlJFgGO+Yn9GzkG42rO0dBxiGCvAhp/YRse3W97aujpMsZAJtfLA
	zcvVzark1AZJJGHTXlN+k5q85gHsyE2X9WYz+hz3iYLweCPuxGqAuMUxRJIOlhHEk1SaEMib2pM
	1Ld2dBOJMY700OLdT+83y75AOcZf9gbDEUv1XvIc4OXv6p5L2KRx4j38TGQa13sC5D3ysHFEJYi
	GmiYHlinuglbjR8NgskdESHTrIPUq6fuMwxMxOtRtKZVaokNWOTvzVVb9eOHayxrTkZOvkjSIor
	gD1xcwl8z7FMXa7WPWXC/TYw++GIgRpPSUOBQqKvRQxasEraqh5z5of7WsPVkrFH5QLcwWZVjVx
	jB/VP2UovXvSIb8noc2TUR8qn2o4+ZMvRmn+nbm8nhzn18RixI85sMoCctl1YiISf5g60zq8j4x
	w6JtRtQ5ZPvjEcf7MjqgiYOs9OTmBISr0TpsWMiRdlHPCfPfU7WAVUQYLYb83hxweQJiXbpjR9x
	UoaGz2HXt4P1cmEUHVwQmMgolDmWhY/fAehcXl2WSk=
X-Received: by 2002:a17:90b:48c9:b0:369:7491:7b24 with SMTP id 98e67ed59e1d1-38fb2441d4fmr3449982a91.6.1785539172700;
        Fri, 31 Jul 2026 16:06:12 -0700 (PDT)
Received: from deepanshu-kernel-hacker.. ([2405:201:682f:383f:d0a0:b78b:9d8:d130])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3153ddda5d9sm12756358eec.13.2026.07.31.16.06.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jul 2026 16:06:11 -0700 (PDT)
From: Deepanshu Kartikey <kartikey406@gmail.com>
To: gregkh@linuxfoundation.org
Cc: viro@zeniv.linux.org.uk,
	jack@suse.cz,
	mjguzik@gmail.com,
	brauner@kernel.org,
	kees@kernel.org,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Deepanshu Kartikey <kartikey406@gmail.com>,
	syzbot+df9e891bf8ea586f846b@syzkaller.appspotmail.com
Subject: [PATCH v2] usb: gadgetfs: fix use-after-free in ep_open()
Date: Sat,  1 Aug 2026 04:36:03 +0530
Message-ID: <20260731230603.4637-1-kartikey406@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

ep_open() dereferenced inode->i_private and locked its embedded
mutex before checking whether the underlying ep_data was still
alive. destroy_ep_files(), called from gadgetfs_unbind(), can free
that same ep_data concurrently, since nothing prevented an in-flight
open() from racing the teardown. KASAN reports a slab-use-after-free
in ep_open(), with the object freed by a concurrent gadgetfs_unbind()
-> destroy_ep_files() -> put_ep() -> kfree().

Fix it by adding an inode back-pointer to ep_data, having
destroy_ep_files() clear inode->i_private to NULL under dev->lock
before the object can be freed, and having ep_open() read
inode->i_private and pin the result with get_ep() under that same
lock, bailing out with -ENOENT if it finds NULL. This makes liveness
self-evident at the point of use instead of being inferred from
device state, so it holds regardless of which path frees the
endpoint.

dev is derived from inode->i_sb->s_fs_info, set in
gadgetfs_fill_super(), rather than from the file's the_device
singleton, so ep_open() is correctly scoped to the specific mount
the inode belongs to.

gadgetfs_create_file() now returns the created inode (or an
ERR_PTR) directly instead of taking an output parameter, so
activate_ep_files() can store it in data->inode without an
unexplained NULL at call sites that don't need it.

Reported-by: syzbot+df9e891bf8ea586f846b@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=df9e891bf8ea586f846b
Fixes: 1da177e4c3f41524e886b7f1b8a0c1fc7321cac2 ("Linux-2.6.12-rc2")
Tested-by: syzbot+df9e891bf8ea586f846b@syzkaller.appspotmail.com
Signed-off-by: Deepanshu Kartikey <kartikey406@gmail.com>
---
v2:
 - Added Fixes: tag; git blame traces the bug to the 2005 git
   import boundary, confirmed no later commit changed the ordering
 - Derive dev from inode->i_sb->s_fs_info instead of the new
   the_device singleton, so the lookup is scoped to the inode's
   own mount instead of a global (Greg)
 - gadgetfs_create_file() now returns struct inode * / ERR_PTR
   instead of taking an inode_out output parameter, so call sites
   don't need an unexplained NULL argument (Greg)
---
 drivers/usb/gadget/legacy/inode.c | 61 ++++++++++++++++++++-----------
 1 file changed, 39 insertions(+), 22 deletions(-)

diff --git a/drivers/usb/gadget/legacy/inode.c b/drivers/usb/gadget/legacy/inode.c
index d87a8ab51510..e5a316777db2 100644
--- a/drivers/usb/gadget/legacy/inode.c
+++ b/drivers/usb/gadget/legacy/inode.c
@@ -207,6 +207,7 @@ struct ep_data {
 	struct usb_endpoint_descriptor	desc, hs_desc;
 	struct list_head		epfiles;
 	wait_queue_head_t		wait;
+	struct inode                    *inode;
 };
 
 static inline void get_ep (struct ep_data *data)
@@ -235,6 +236,7 @@ static void put_ep (struct ep_data *data)
 
 static const char *CHIP;
 static DEFINE_MUTEX(sb_mutex);		/* Serialize superblock operations */
+static struct dev_data *the_device;
 
 /*----------------------------------------------------------------------*/
 
@@ -817,25 +819,39 @@ ep_config (struct ep_data *data, const char *buf, size_t len)
 static int
 ep_open (struct inode *inode, struct file *fd)
 {
-	struct ep_data		*data = inode->i_private;
-	int			value = -EBUSY;
+	struct dev_data *dev = inode->i_sb->s_fs_info;
+	struct ep_data *data;
+	int value = -ENODEV;
+
+	spin_lock_irq(&dev->lock);
+	data = inode->i_private;
+	if (data == NULL) {
+		spin_unlock_irq(&dev->lock);
+		return -ENOENT;
+	}
+	get_ep(data);
+	spin_unlock_irq(&dev->lock);
 
-	if (mutex_lock_interruptible(&data->lock) != 0)
+	if (mutex_lock_interruptible(&data->lock) != 0) {
+		put_ep(data);
 		return -EINTR;
-	spin_lock_irq (&data->dev->lock);
-	if (data->dev->state == STATE_DEV_UNBOUND)
+	}
+
+	value = -EBUSY;
+	spin_lock_irq(&dev->lock);
+	if (dev->state == STATE_DEV_UNBOUND)
 		value = -ENOENT;
 	else if (data->state == STATE_EP_DISABLED) {
 		value = 0;
 		data->state = STATE_EP_READY;
-		get_ep (data);
 		fd->private_data = data;
-		VDEBUG (data->dev, "%s ready\n", data->name);
+		VDEBUG(dev, "%s ready\n", data->name);
 	} else
-		DBG (data->dev, "%s state %d\n",
-			data->name, data->state);
-	spin_unlock_irq (&data->dev->lock);
+		DBG(dev, "%s state %d\n", data->name, data->state);
+	spin_unlock_irq(&dev->lock);
 	mutex_unlock(&data->lock);
+	if (value)
+		put_ep(data);
 	return value;
 }
 
@@ -1563,6 +1579,7 @@ static void destroy_ep_files (struct dev_data *dev)
 		/* break link to FS */
 		ep = list_first_entry (&dev->epfiles, struct ep_data, epfiles);
 		list_del_init (&ep->epfiles);
+		ep->inode->i_private = NULL;
 		spin_unlock_irq (&dev->lock);
 
 		/* break link to controller */
@@ -1587,14 +1604,13 @@ static void destroy_ep_files (struct dev_data *dev)
 }
 
 
-static int gadgetfs_create_file (struct super_block *sb, char const *name,
+static struct inode *gadgetfs_create_file(struct super_block *sb, char const *name,
 		void *data, const struct file_operations *fops);
 
 static int activate_ep_files (struct dev_data *dev)
 {
 	struct usb_ep	*ep;
 	struct ep_data	*data;
-	int err;
 
 	gadget_for_each_ep (ep, dev->gadget) {
 
@@ -1617,9 +1633,9 @@ static int activate_ep_files (struct dev_data *dev)
 		if (!data->req)
 			goto enomem1;
 
-		err = gadgetfs_create_file (dev->sb, data->name,
+		data->inode = gadgetfs_create_file(dev->sb, data->name,
 				data, &ep_io_operations);
-		if (err)
+		if (IS_ERR(data->inode))
 			goto enomem2;
 		list_add_tail (&data->epfiles, &dev->epfiles);
 	}
@@ -1663,8 +1679,6 @@ gadgetfs_unbind (struct usb_gadget *gadget)
 	put_dev (dev);
 }
 
-static struct dev_data		*the_device;
-
 static int gadgetfs_bind(struct usb_gadget *gadget,
 		struct usb_gadget_driver *driver)
 {
@@ -1983,7 +1997,7 @@ gadgetfs_make_inode (struct super_block *sb,
 /* creates in fs root directory, so non-renamable and non-linkable.
  * so inode and dentry are paired, until device reconfig.
  */
-static int gadgetfs_create_file (struct super_block *sb, char const *name,
+static struct inode *gadgetfs_create_file(struct super_block *sb, char const *name,
 		void *data, const struct file_operations *fops)
 {
 	struct dentry	*dentry;
@@ -1992,18 +2006,18 @@ static int gadgetfs_create_file (struct super_block *sb, char const *name,
 	inode = gadgetfs_make_inode (sb, data, fops,
 			S_IFREG | (default_perm & S_IRWXUGO));
 	if (!inode)
-		return -ENOMEM;
+		return ERR_PTR(-ENOMEM);
 
 	dentry = simple_start_creating(sb->s_root, name);
 	if (IS_ERR(dentry)) {
 		iput(inode);
-		return PTR_ERR(dentry);
+		return ERR_CAST(dentry);
 	}
 
 	d_make_persistent(dentry, inode);
 
 	simple_done_creating(dentry);
-	return 0;
+	return inode;
 }
 
 static const struct super_operations gadget_fs_operations = {
@@ -2056,8 +2070,11 @@ gadgetfs_fill_super (struct super_block *sb, struct fs_context *fc)
 		goto Enomem;
 
 	dev->sb = sb;
-	rc = gadgetfs_create_file(sb, CHIP, dev, &ep0_operations);
-	if (rc) {
+	sb->s_fs_info = dev;
+	inode = gadgetfs_create_file(sb, CHIP, dev, &ep0_operations);
+	if (IS_ERR(inode)) {
+		rc = PTR_ERR(inode);
+		sb->s_fs_info = NULL;
 		put_dev(dev);
 		goto Enomem;
 	}
-- 
2.43.0


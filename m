Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AE4A1917FB
	for <linux-usb@vger.kernel.org>; Fri, 31 Jul 2026 09:13:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785489215; cv=none; b=KULXlB1MWN/Hne38Bf3b0SWJOqH+f9XRsb7xI9HB97H5JvcEbiHCUc2o7bgWvvl0wI66oamfmqbDq3XHTegfcEbZQ4qrGWPgcg6N7bnC0EDcQU7w5hWQT3aGC8GBYUTNIM0IcPi02W/GsFupYE0tP0vtLsNHv5lRPqQ/Owzq8BM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785489215; c=relaxed/simple;
	bh=zkISZcecvWcC2DciH/X8ZTE0/tlfg0Mv3H1koueyi5E=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=EL5UEnd/a2fF7sjp7VZ1te/nDg3BZlS+Lon8bmiJhFp0i/EJja+Ijjlv93lkqXGhWr49vkOtuUR6d9LXoIpom3JVvMwdababmLwOOY9fUPbSINPJ4NIJUl/5li93mf2UAhWPRspWLb6XIzHZqAXvXey1h2cu9v9qIP0iToPq0rg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lzaFAcCH; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lzaFAcCH"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-84830c774a0so816507b3a.1
        for <linux-usb@vger.kernel.org>; Fri, 31 Jul 2026 02:13:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785489213; x=1786094013; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=4dSY1hd4FWd9g4XRMCtzxi58VPEsS+PfOka1Ddvlms4=;
        b=lzaFAcCH13stELC2ahAFSuD8wmEk6bn2J6Wcz/wcpPRpExHuJl/wHAM/c2JjtKlg1v
         rsin/RPZhJs5F3KUBcTBfg5HHMCg9WSYRXbhyQLATYknuAbQT+dmRWPV8fBfA6zEjjqA
         KSAatpmcQjDWxwRgIwJvas1cImdbiDW5Q6IifhEiFHBNoRzY9m1euLq1IiPVZw/On5j8
         zwGqPyFQXODeOtoIEUm5KcA52+qntnMVd0r4bTzm1tE7Jb8yvtcEFxgBgPlI41+v33/P
         2PoT5yaZiB02kSwi29T7yOYJrqH8E9zWHqkHV6BDhGkKtaB3F3ZABMgfhxTBWZgxuGVo
         L4YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785489213; x=1786094013;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4dSY1hd4FWd9g4XRMCtzxi58VPEsS+PfOka1Ddvlms4=;
        b=EE2c8ve+ujw5IPdbExpgDWv26y8P26JSxl/rEXjxmLrbXcqEC49okWghx1y2fCBR+J
         PRo0gJ/bL20lT/vHCaAz7foH8QG/iniyL25CKDXN02m2E5h+lkG4OGEl8fMwcvdnnuBP
         tBSBdhUOrxYNcp4gpnIfrI5GJa0UEfm+Mf730CRcWwOluvEt2hu7107F4P8Wy1ReXx2B
         /SsLTTm7pLsxF2i2zxJZ0LUAfuZ36N0TP0xyEOpV4WxtrUI20zDh3glBdKX+0U6djCYG
         WkgHQBt+6lKu7acZJVpuoq53eV8WW2DNrq0jexGcoCAt0i3SPYA2KbwWN91TzYH7QfED
         +PAA==
X-Forwarded-Encrypted: i=1; AHgh+RrOFDlJo0t2Lynbs0KAphBEAnZE3LI1KcvgCB3iy54oxl1qorxDFYeqSrTIUBLA0D2xACn3ByWErvk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz7ynyP0rA+Ipe70B4WCrksQeZJlU6MX84jBeFOWgGcpEvPGLiU
	o9dNhgzudjOinP6Dxa8/MQ49N4AXXz+rKMlntrdGWbIWG1kZOJitgttJ
X-Gm-Gg: AR+sD10HsiMU8OpJuY1oMa2oi1HM/HHSflCwtwXkLpNKMr4BjaHDqKYmv5zspH/0GPs
	3yCdaon/5axDET7xZjgmXG839v5zj5CtQHPi9DFgIAE1aSheOQD/IEZ1/2Ot97AA9kp6XnZfJ3s
	lbhL3Jq6QrMJJ7rc/t4ELfBpEa4QgTRtLOEg0NPS/iIuz2XJDxo6lySCO3uXYfb0QrwK4cxmUyx
	MYKl0JAy3R8dGohG9U7+MHdHb7oa/BJFdk1rzOQ4m6Ujmtlx5rrsqtqScg/qIpKqg43naAesSK7
	QTR0ETHqt/qvHMc+7sb0Sdw4Kr4LT6PlehKds9vwJNmaLlT7rL/XBkVA/NObnTPS4c+OB5U/NuU
	1F4QvUug0p2+uueRBJNVUcmYVEna35H7wb8c2W9VyIZoNi8JmkEANkbgiqVYJtL40b5yoP+lATT
	Jb//dJSwP4B/YY+6sr0rSj3H84SW5NSvwg6U0Vawv8iGhUnnRNjcNRNn///lgLEw4SoRcCNVMN8
	Zp7Y9HXLeTDcFo4Ut7Lm2Yi+TrM1Fd4MAimXiQ3vbt/
X-Received: by 2002:a05:6a21:6b85:b0:3b3:4406:202c with SMTP id adf61e73a8af0-3c91b1283e6mr1339904637.10.1785489212497;
        Fri, 31 Jul 2026 02:13:32 -0700 (PDT)
Received: from deepanshu-kernel-hacker.. ([2405:201:682f:383f:e530:e1cf:b5ff:83e4])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3153e044912sm4182791eec.15.2026.07.31.02.13.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jul 2026 02:13:31 -0700 (PDT)
From: Deepanshu Kartikey <kartikey406@gmail.com>
To: gregkh@linuxfoundation.org
Cc: viro@zeniv.linux.org.uk,
	jack@suse.cz,
	brauner@kernel.org,
	mjguzik@gmail.com,
	kees@kernel.org,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Deepanshu Kartikey <kartikey406@gmail.com>,
	syzbot+df9e891bf8ea586f846b@syzkaller.appspotmail.com
Subject: [PATCH] usb: gadgetfs: fix use-after-free in ep_open()
Date: Fri, 31 Jul 2026 14:43:16 +0530
Message-ID: <20260731091316.14145-1-kartikey406@gmail.com>
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

gadgetfs_create_file() gains an optional inode-out parameter so
activate_ep_files() can capture the inode it creates; the ep0 caller
in gadgetfs_fill_super() passes NULL, since dev_data is unaffected
by this fix.

Reported-by: syzbot+df9e891bf8ea586f846b@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=df9e891bf8ea586f846b
Signed-off-by: Deepanshu Kartikey <kartikey406@gmail.com>
---
 drivers/usb/gadget/legacy/inode.c | 51 +++++++++++++++++++++----------
 1 file changed, 35 insertions(+), 16 deletions(-)

diff --git a/drivers/usb/gadget/legacy/inode.c b/drivers/usb/gadget/legacy/inode.c
index d87a8ab51510..f566b2ec7c38 100644
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
+	struct dev_data *dev = the_device;
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
@@ -1588,7 +1605,8 @@ static void destroy_ep_files (struct dev_data *dev)
 
 
 static int gadgetfs_create_file (struct super_block *sb, char const *name,
-		void *data, const struct file_operations *fops);
+		void *data, const struct file_operations *fops,
+		struct inode **inode_out);
 
 static int activate_ep_files (struct dev_data *dev)
 {
@@ -1618,7 +1636,7 @@ static int activate_ep_files (struct dev_data *dev)
 			goto enomem1;
 
 		err = gadgetfs_create_file (dev->sb, data->name,
-				data, &ep_io_operations);
+				data, &ep_io_operations, &data->inode);
 		if (err)
 			goto enomem2;
 		list_add_tail (&data->epfiles, &dev->epfiles);
@@ -1663,8 +1681,6 @@ gadgetfs_unbind (struct usb_gadget *gadget)
 	put_dev (dev);
 }
 
-static struct dev_data		*the_device;
-
 static int gadgetfs_bind(struct usb_gadget *gadget,
 		struct usb_gadget_driver *driver)
 {
@@ -1984,7 +2000,7 @@ gadgetfs_make_inode (struct super_block *sb,
  * so inode and dentry are paired, until device reconfig.
  */
 static int gadgetfs_create_file (struct super_block *sb, char const *name,
-		void *data, const struct file_operations *fops)
+		void *data, const struct file_operations *fops, struct inode **inode_out)
 {
 	struct dentry	*dentry;
 	struct inode	*inode;
@@ -1994,6 +2010,9 @@ static int gadgetfs_create_file (struct super_block *sb, char const *name,
 	if (!inode)
 		return -ENOMEM;
 
+	if (inode_out)
+		*inode_out = inode;
+
 	dentry = simple_start_creating(sb->s_root, name);
 	if (IS_ERR(dentry)) {
 		iput(inode);
@@ -2056,7 +2075,7 @@ gadgetfs_fill_super (struct super_block *sb, struct fs_context *fc)
 		goto Enomem;
 
 	dev->sb = sb;
-	rc = gadgetfs_create_file(sb, CHIP, dev, &ep0_operations);
+	rc = gadgetfs_create_file(sb, CHIP, dev, &ep0_operations, NULL);
 	if (rc) {
 		put_dev(dev);
 		goto Enomem;
-- 
2.43.0


Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71C2D1B87C9
	for <linux-usb@vger.kernel.org>; Sun, 16 Aug 2026 01:51:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786845064; cv=none; b=oYUBTm8vizgUhtugm/tmGMNffIimN2ex6lJfyU/JkjwqwFhF1AM+cIAUCcRRRX/h55SdcaZgKvMu5TYsjzckslSUuLvq+nAPSrJR2RBSXZugsA//8XNYtIm2HpZDkTbMCVY0Pli7LIugomQNZZYNfCH2CVFqW/YpfmvrO78b5oE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786845064; c=relaxed/simple;
	bh=cDG6xbGBB1Q6HD8KWNX0mKFDkU4XDCW4OjydblpZztM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=HgeAyjAOi9X8GosO3NJUG6nqKIbCAsDrWPENViCQfShUKpfqjXx2BvcS+9npHSr7OpssNkLpBqH4HHBifOI9XpkO/8LX4/gbPXeI426QzrwEV2WQJ2YAw4rPEWdzdiA7KZx5HW6ROHNFgm6kcR11Mea5ABl6O4XUqKIgVNN8goo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IMNvTB0I; arc=none smtp.client-ip=209.85.215.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IMNvTB0I"
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-cbedbaba5fdso1353433a12.0
        for <linux-usb@vger.kernel.org>; Sat, 15 Aug 2026 18:51:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786845063; x=1787449863; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=sdHeuNc+4OiiLS7L+qB4spbVxvdD70YZATlcnvpSMhg=;
        b=IMNvTB0I9WaLLKX+5u9OaUtBtvA+TrcIcUO4hxy9C0nxZ3K+NEFq6Wc5Prm0MDWx+K
         gHwiOfjLbQ9DBqCqO5gHnSDdIETtI1WDmvJdC39nrbbdEAutGk4lJtEF3vR2xHmCy9qR
         iwbBg5Rk0Hp96lFMSYPuIxIaq4DVzlXFUrINZqbLigjmdgZ8YuvE8yyXQU7VDs+kHS0Z
         kUt0GXF/giJTc2DMgu4M9ILCl5Ws5xqksuQq3kIKV3Nh6UOhZXYnMSEXUhdx/EF6RCxx
         dg41ztQhETaXNHWobvuOtJr8Ip8SWHeBukAQX25flC3/9Ogar6GFKm3AnSNDSdoZUsoz
         HlWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786845063; x=1787449863;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sdHeuNc+4OiiLS7L+qB4spbVxvdD70YZATlcnvpSMhg=;
        b=myyL3KNNrOa+bNdud70sEi0shwbWzBgvePFUWHY9abCZAV9WXuECBWaLi5HEBHVJtq
         tVxcyOdATROpGa1e3Y0dKSUojsAHop30H8goJjsA9ZcoUyi2i66peguzPEO/z9gHruVp
         +TdemlFC70JY3HwdlwVwAks2QJ6mGmb95kvxzXHGoyTbHvcVw3j8AZjPNoYK5sHjPleF
         8Zzk8WT2qABYmgnk/s8BbXOP5lHrosN9Ap9ywmPWSCIk1lzY/VI7Q/4CcI+tOrA407Vt
         NpEJgDCZy5sHrEMucQG/1qradrLT5zaS7w6wCu52pScuboS7Dc0NfRAFweS4BKNRb8Fs
         yecQ==
X-Forwarded-Encrypted: i=1; AHgh+RrHKgfiyTZLsTJwx6AWiVJ0jq4Hzo/iE3E/TZuyk2T7QxcwGKOxTGH1R7bXA8SDogCo5KMnP4DDpM4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw2TmPCkee4GjJGj+F4ICP61VN9I2XeXZ/7Ls7Af8AhfdgGpg6G
	bry6MnAVc0ZdOsp4QD4wmeiGY1E5e7ruSV1rykNJW+wfv/qIEaRk6Wl/
X-Gm-Gg: AR+sD10iVwcm7YEhuoweBQhsluGLI8KgYx9/RuIFKRECABFcnPY877iIoel4iR1+izB
	8R+DZphBQBo5jfnVnAMr8zp6WAss3JGvvqrV9xNJv5jk59k1VZH6UaNbVkBp31tbLnvNpQr1WsO
	sq2dWeMyLu+acSg/6MCGjC+XMRJBY07QoegwjEPeO+ZdRJAYknhneFD3Q7UGZn6r0MLmIKu1zy+
	301RD7InEwwYjd67Wkm9wu9WhKFRVTHUav9upFLfAIdLHvzyZIeEqGTXf3I1jVd1szEjZ9Qom12
	hPzXQBKvHIxv4j6egOyBlZSr0qjDN4auOZ46e47zVNToXhk5aS52qhKGCDADFdi/uFLv5PGaBRf
	Mfb52U1Oy8I2uP8R4Tpu/okEaO0Meugtui/vDZF/numCah09nnlnnn+56yzm/AWGOoW4r50lB8w
	KyHmOZ81lAXV6QHsRrnYvnxgaSe5ZeHYftrVaoeKawnduq9p/BjRe8eZRXF81aiEQruHYwZspNA
	8v0A+UXVyxnOozjJZdvGDVtV1RJ6YxcJvyP9XLHy9fjsZ8qDb5qPg==
X-Received: by 2002:a05:6a20:d48e:b0:3c0:b943:f984 with SMTP id adf61e73a8af0-3cc71992308mr17334851637.3.1786845062547;
        Sat, 15 Aug 2026 18:51:02 -0700 (PDT)
Received: from deepanshu-Legion-Pro-5-16AFR10.. ([2405:201:682f:383f:3194:7c7d:e0ca:9186])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-320ea8fe3cdsm20661673eec.28.2026.08.15.18.50.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Aug 2026 18:51:01 -0700 (PDT)
From: Deepanshu Kartikey <kartikey406@gmail.com>
To: valentina.manea.m@gmail.com,
	shuah@kernel.org,
	i@zenithal.me,
	gregkh@linuxfoundation.org
Cc: yuyang.du@intel.com,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Deepanshu Kartikey <kartikey406@gmail.com>,
	syzbot+8753715f05759f1a10de@syzkaller.appspotmail.com
Subject: [PATCH v2] usbip: vhci_hcd: let the driver core manage the sysfs attributes
Date: Sun, 16 Aug 2026 07:20:51 +0530
Message-ID: <20260816015051.13184-1-kartikey406@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The vhci attribute group is created in vhci_start() and removed in
vhci_stop(), guarded by usb_hcd_is_primary_hcd(). Both run from
usb_add_hcd()/usb_remove_hcd(), which are called once per hcd, so the
attach attribute is live while only one of the two hcds exists: it is
created during the first usb_add_hcd() before vhci_hcd_ss is set, and it
survives the first usb_put_hcd() on removal. A concurrent write to attach
can therefore reach a NULL or freed vhci_hcd_ss.

Register the group as dev_groups on the platform driver instead, so the
driver core creates the files before probe and removes them after remove
returns, and drop the sysfs_create_group()/sysfs_remove_group() calls from
the driver. The attributes have always been created only on vhci_hcd.0;
an is_visible() callback keeps them there.

vhci_init_attr_group() is moved into vhci_hcd_init() ahead of
platform_driver_register() so the group is populated before the core
reads it. The attribute array is still built at runtime because the
number of status attributes comes from CONFIG_USBIP_VHCI_NR_HCS and the
preprocessor cannot emit a variable number of __ATTR() declarations. If
statically declaring all 32 and hiding the unused ones with is_visible()
is preferred, I can respin that way.

Reported-by: syzbot+8753715f05759f1a10de@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=8753715f05759f1a10de
Fixes: 1c9de5bf4286 ("usbip: vhci-hcd: Add USB3 SuperSpeed support")
Link: https://lore.kernel.org/all/20260815143241.19047-1-kartikey406@gmail.com/T/ [v1]
Tested-by: syzbot+8753715f05759f1a10de@syzkaller.appspotmail.com
Signed-off-by: Deepanshu Kartikey <kartikey406@gmail.com>
---
v2:
 - use dev_groups instead of moving sysfs_create_group() into probe (Greg)
 - add is_visible() to keep the attributes on vhci_hcd.0 only
 - move vhci_init_attr_group() into vhci_hcd_init()
---
 drivers/usb/usbip/vhci.h       |  1 +
 drivers/usb/usbip/vhci_hcd.c   | 37 ++++++++++------------------------
 drivers/usb/usbip/vhci_sysfs.c | 19 +++++++++++++++++
 3 files changed, 31 insertions(+), 26 deletions(-)

diff --git a/drivers/usb/usbip/vhci.h b/drivers/usb/usbip/vhci.h
index 5659dce1526e..844500e3b0ea 100644
--- a/drivers/usb/usbip/vhci.h
+++ b/drivers/usb/usbip/vhci.h
@@ -121,6 +121,7 @@ struct vhci_hcd {
 extern int vhci_num_controllers;
 extern struct vhci *vhcis;
 extern struct attribute_group vhci_attr_group;
+extern const struct attribute_group *vhci_groups[];
 
 /* vhci_hcd.c */
 void rh_port_connect(struct vhci_device *vdev, enum usb_device_speed speed);
diff --git a/drivers/usb/usbip/vhci_hcd.c b/drivers/usb/usbip/vhci_hcd.c
index 39e8faf4c18c..4bace5b8b879 100644
--- a/drivers/usb/usbip/vhci_hcd.c
+++ b/drivers/usb/usbip/vhci_hcd.c
@@ -1199,7 +1199,6 @@ static int vhci_start(struct usb_hcd *hcd)
 {
 	struct vhci_hcd *vhci_hcd = hcd_to_vhci_hcd(hcd);
 	int id, rhport;
-	int err;
 
 	usbip_dbg_vhci_hc("enter vhci_start\n");
 
@@ -1230,40 +1229,17 @@ static int vhci_start(struct usb_hcd *hcd)
 		return -EINVAL;
 	}
 
-	/* vhci_hcd is now ready to be controlled through sysfs */
-	if (id == 0 && usb_hcd_is_primary_hcd(hcd)) {
-		err = vhci_init_attr_group();
-		if (err) {
-			dev_err(hcd_dev(hcd), "init attr group failed, err = %d\n", err);
-			return err;
-		}
-		err = sysfs_create_group(&hcd_dev(hcd)->kobj, &vhci_attr_group);
-		if (err) {
-			dev_err(hcd_dev(hcd), "create sysfs files failed, err = %d\n", err);
-			vhci_finish_attr_group();
-			return err;
-		}
-		dev_info(hcd_dev(hcd), "created sysfs %s\n", hcd_name(hcd));
-	}
-
 	return 0;
 }
 
 static void vhci_stop(struct usb_hcd *hcd)
 {
 	struct vhci_hcd *vhci_hcd = hcd_to_vhci_hcd(hcd);
-	int id, rhport;
+	int rhport;
 
 	usbip_dbg_vhci_hc("stop VHCI controller\n");
 
-	/* 1. remove the userland interface of vhci_hcd */
-	id = hcd_name_to_id(hcd_name(hcd));
-	if (id == 0 && usb_hcd_is_primary_hcd(hcd)) {
-		sysfs_remove_group(&hcd_dev(hcd)->kobj, &vhci_attr_group);
-		vhci_finish_attr_group();
-	}
-
-	/* 2. shutdown all the ports of vhci_hcd */
+	/* shutdown all the ports of vhci_hcd */
 	for (rhport = 0; rhport < VHCI_HC_PORTS; rhport++) {
 		struct vhci_device *vdev = &vhci_hcd->vdev[rhport];
 
@@ -1513,6 +1489,7 @@ static struct platform_driver vhci_driver = {
 	.resume	= vhci_hcd_resume,
 	.driver	= {
 		.name = driver_name,
+		.dev_groups = vhci_groups,
 	},
 };
 
@@ -1541,6 +1518,10 @@ static int __init vhci_hcd_init(void)
 	if (vhcis == NULL)
 		return -ENOMEM;
 
+	ret = vhci_init_attr_group();
+	if (ret)
+		goto err_init_attr_group;
+
 	ret = platform_driver_register(&vhci_driver);
 	if (ret)
 		goto err_driver_register;
@@ -1565,9 +1546,12 @@ static int __init vhci_hcd_init(void)
 
 	return 0;
 
+
 err_add_hcd:
 	platform_driver_unregister(&vhci_driver);
 err_driver_register:
+	vhci_finish_attr_group();
+err_init_attr_group:
 	kfree(vhcis);
 	return ret;
 }
@@ -1576,6 +1560,7 @@ static void __exit vhci_hcd_exit(void)
 {
 	del_platform_devices();
 	platform_driver_unregister(&vhci_driver);
+	vhci_finish_attr_group();
 	kfree(vhcis);
 }
 
diff --git a/drivers/usb/usbip/vhci_sysfs.c b/drivers/usb/usbip/vhci_sysfs.c
index a7ede6fb3da9..8c0bff2ddabb 100644
--- a/drivers/usb/usbip/vhci_sysfs.c
+++ b/drivers/usb/usbip/vhci_sysfs.c
@@ -497,8 +497,27 @@ static void finish_status_attrs(void)
 	kfree(status_attrs);
 }
 
+static umode_t vhci_attr_is_visible(struct kobject *kobj,
+				    struct attribute *attr, int n)
+{
+	struct platform_device *pdev = to_platform_device(kobj_to_dev(kobj));
+	/*
+	 * The attributes control every controller and have always lived on
+	 * vhci_hcd.0 only.  Keep them there now that the driver core creates
+	 * the group for each device.
+	 */
+	return pdev->id == 0 ? attr->mode : 0;
+}
+
+
 struct attribute_group vhci_attr_group = {
 	.attrs = NULL,
+	.is_visible = vhci_attr_is_visible,
+};
+
+const struct attribute_group *vhci_groups[] = {
+	&vhci_attr_group,
+	NULL,
 };
 
 int vhci_init_attr_group(void)
-- 
2.43.0


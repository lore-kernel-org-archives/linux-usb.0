Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC52637F012
	for <linux-usb@vger.kernel.org>; Sun, 16 Aug 2026 06:10:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786860649; cv=none; b=Z80dGa9pjGrysEGXolgAXeq9v3Q7Q/sCaPgH3wtX01i2Nur4LbPgjuEhwujQ3AGC14a0YJ735BsysCh/eCxMDFF0ef/Y8X+q09ABmYdoyvslqTdd/zbbPRm3HqbgW4OwWJa0GhkaBQlCI4CmQrwzho0uygvaWHbKIhIsGSRtJf4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786860649; c=relaxed/simple;
	bh=pADuOxacJnTHwrHtkrmdVozGJLOeSupAXJKQC5gcLsM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=r5ZR5ZaBQMGKjd2HnnGrAJ5DczVh8ar7Ah+9rXsnLU2ZHPnFIhK6bezKBr1cv3oi1yj2LSfBP5jS3/mftiROi62ZJz+eAZkDa64O+SOS34fj1G3rlZptGcfZFbeMQNfqQvmVQgQ6yRwO02FHKft33N7J/lwRx7GYhUJyXFSXerA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aKeO/vZ0; arc=none smtp.client-ip=209.85.215.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aKeO/vZ0"
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-cbb8b54fcf8so2167756a12.0
        for <linux-usb@vger.kernel.org>; Sat, 15 Aug 2026 23:10:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786860647; x=1787465447; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=gyqEbTMRd9wX1xPjM5E/0/4/pSFcRr8u6PE3K4PaLWo=;
        b=aKeO/vZ0nXyc3XSaZM/T0muHEH7wy6F5Gz0fh0A19Gr8lBD895N0OnXf3maO/Dd4lp
         2yiL30z5oFebf3s4fW5mD6yIH6FiStKABq7L002+0szGC/gKyinbhJvOSZrLlnGyUmty
         GugwpeF4exyE2zOsJm1Scnpxn496sJc1mjLmCONDhcszzkQ9VBPLTGz/c1AYX3+PLYjk
         4YIW6S9HsIgzI/tp5eYHI4eJEA0g9vKGlTUdLpNcKbGBcGml8/Wl5i58rHEclteeuqsV
         qS5BjQRBRY6yAeXIEddbICUB/sgMtdwhyuPGVYCeP6d4MTlT9YKBieFpbwn293w4hFv6
         Pjnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786860647; x=1787465447;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gyqEbTMRd9wX1xPjM5E/0/4/pSFcRr8u6PE3K4PaLWo=;
        b=ox9pTlB/kGf2OjEpafRv09G43EwxoySarbrdRZwO3BtE6CNxDXeWbI2UmbB1b2nB7+
         YKKy4LHsr3GD+SZaUdlzrq3kVYdoU6EaDBDXoS30D7khPWt9caZESbFrKuYhst2gSwyG
         qsk91GT2vcsO74t+XhWLngG/u4r+pQArEVqTKHQwuFRN1kH93/vk7eQf5KHZtoriNqyM
         9OTvX95phoS6ZKsThaSn8rHqhMCyqgxfBfJv+ZpThSpj5gL23UxVLXJU8ZXkiEdo/fIC
         wifCIC7RXR8js3u9DGvNKkz8u1OUw58BLjE1NOsT0/opj1Hx9k1T0NRIH8udJU9ZyTpc
         hlTw==
X-Forwarded-Encrypted: i=1; AHgh+RozLi1Q0HKOM0Ca/ZCuoDy3nO/o/v+x9SmVhHE9onXaA8UcOS+oz4mpOhUyFrWlck1Fsvsr2PmDlxg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yytbj6GVL6vnn4xfXOiZAQSR35sJeshq41u7Vv9c0RzlbxEuVZf
	oEh6FTnqzfoS5dTFocTxM8w+mSr5qwaovEFf62pkaYLABuDkqdfzifD9
X-Gm-Gg: AR+sD10WNvqHbxQkhFT1AcBUdpFDaz9JRvHBq/iVmrBkFf2CCGqZMlYBOMkKPiLRmKA
	AJDbB1e0htd1xGVFO1GaWCAEErIp9O8gvRyzrWYfl6CvkDCf00XfuHkR2O1aHLB6LcAe7c7UwXK
	EN0xgjjHFQAxYBTsmQ89gpFDEHqvQqweAAbZfA/ac35doIyAlH6xyJVYJBfrjU78ARn1lNUB2mu
	n2iHjTLAx6aQCcq1nmBS4xvgZkMna9OF4GLz4GpXV7z3ElE+81XjnVoY54+zeekWfCvc4hkS/4D
	9UaPLOqUkBObn4Ng8DXtZLr6ZuEYFAS83Zt9o4kjIr3Zq6F6S8kIhTqR1mT+UEudTi/xxG/T1vl
	E/G/YMyWiQwpCI7OYhRkXs4tjDcjbe0juvUJQOwq+LW7rgtA7NxXFZTgXLLFLARkJa8L3vBeL52
	DCE6e0gTpYCqPbFM82WPAD61UhTnPjp3ll9xojvmDHGs9ZoGrOcKWoX/0Bw1cFE03siVrI6z1HY
	rY0sKqgg8r8kRe7593q8zyLqs/QLOoxerUUBQIEYjx1pXK9MiU6CQ==
X-Received: by 2002:a05:6a20:431b:b0:3c3:a3fd:db0a with SMTP id adf61e73a8af0-3cc71ba62bdmr18773591637.16.1786860647251;
        Sat, 15 Aug 2026 23:10:47 -0700 (PDT)
Received: from deepanshu-Legion-Pro-5-16AFR10.. ([2405:201:682f:383f:3194:7c7d:e0ca:9186])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-320d5bdc5c4sm23752567eec.5.2026.08.15.23.10.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Aug 2026 23:10:46 -0700 (PDT)
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
Subject: [PATCH v3] usbip: vhci_hcd: let the driver core manage the sysfs attributes
Date: Sun, 16 Aug 2026 11:40:34 +0530
Message-ID: <20260816061034.17769-1-kartikey406@gmail.com>
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
preprocessor cannot emit a variable number of __ATTR() declarations.

Fixes: 1c9de5bf4286 ("usbip: vhci-hcd: Add USB3 SuperSpeed support")
Reported-by: syzbot+8753715f05759f1a10de@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=8753715f05759f1a10de
Tested-by: syzbot+8753715f05759f1a10de@syzkaller.appspotmail.com
Link: https://lore.kernel.org/all/20260815143427.19066-1-kartikey406@gmail.com/T/ [v1]
Link: https://lore.kernel.org/all/20260816015051.13184-1-kartikey406@gmail.com/T/ [v2]
Signed-off-by: Deepanshu Kartikey <kartikey406@gmail.com>
---
v3:
 - make vhci_attr_group static, drop its extern from vhci.h (Greg)
 - drop stray blank line in vhci_hcd_init()
 - fix indentation in vhci_sysfs.c

v2:
 - use dev_groups instead of moving sysfs_create_group() into probe (Greg)
 - add is_visible() to keep the attributes on vhci_hcd.0 only
 - move vhci_init_attr_group() into vhci_hcd_init()

 drivers/usb/usbip/vhci.h       |  2 +-
 drivers/usb/usbip/vhci_hcd.c   | 36 ++++++++++------------------------
 drivers/usb/usbip/vhci_sysfs.c | 21 +++++++++++++++++++-
 3 files changed, 31 insertions(+), 28 deletions(-)

diff --git a/drivers/usb/usbip/vhci.h b/drivers/usb/usbip/vhci.h
index 5659dce1526e..f3993238f91d 100644
--- a/drivers/usb/usbip/vhci.h
+++ b/drivers/usb/usbip/vhci.h
@@ -120,7 +120,7 @@ struct vhci_hcd {
 
 extern int vhci_num_controllers;
 extern struct vhci *vhcis;
-extern struct attribute_group vhci_attr_group;
+extern const struct attribute_group *vhci_groups[];
 
 /* vhci_hcd.c */
 void rh_port_connect(struct vhci_device *vdev, enum usb_device_speed speed);
diff --git a/drivers/usb/usbip/vhci_hcd.c b/drivers/usb/usbip/vhci_hcd.c
index 39e8faf4c18c..22b9bad7ca31 100644
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
@@ -1568,6 +1549,8 @@ static int __init vhci_hcd_init(void)
 err_add_hcd:
 	platform_driver_unregister(&vhci_driver);
 err_driver_register:
+	vhci_finish_attr_group();
+err_init_attr_group:
 	kfree(vhcis);
 	return ret;
 }
@@ -1576,6 +1559,7 @@ static void __exit vhci_hcd_exit(void)
 {
 	del_platform_devices();
 	platform_driver_unregister(&vhci_driver);
+	vhci_finish_attr_group();
 	kfree(vhcis);
 }
 
diff --git a/drivers/usb/usbip/vhci_sysfs.c b/drivers/usb/usbip/vhci_sysfs.c
index a7ede6fb3da9..d87d9e449d72 100644
--- a/drivers/usb/usbip/vhci_sysfs.c
+++ b/drivers/usb/usbip/vhci_sysfs.c
@@ -497,8 +497,27 @@ static void finish_status_attrs(void)
 	kfree(status_attrs);
 }
 
-struct attribute_group vhci_attr_group = {
+static umode_t vhci_attr_is_visible(struct kobject *kobj,
+				    struct attribute *attr, int n)
+{
+	struct platform_device *pdev = to_platform_device(kobj_to_dev(kobj));
+
+	/*
+	 * The attributes control every controller and have always lived on
+	 * vhci_hcd.0 only.  Keep them there now that the driver core creates
+	 * the group for each device.
+	 */
+	return pdev->id == 0 ? attr->mode : 0;
+}
+
+static struct attribute_group vhci_attr_group = {
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


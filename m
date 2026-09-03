Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 795474A0EEB
	for <linux-usb@vger.kernel.org>; Thu,  3 Sep 2026 12:19:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788438001; cv=none; b=ZTRQcdJX+W13+fkH/q0pOsi5KhTLgnAG/Czn6fQYTkSsTp94Bv6JsQ54abbd6VEsdWQneSH4ZoMCn6dLMMiuRd9X6rFdCEwKBOfeksSmYLmeq689FeDDUxhsriI17dHnIteD8N4nIffxf6OiiI+Jb6lpYs9CyPLAPthOGzgyQDE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788438001; c=relaxed/simple;
	bh=IPoP1ujHUk9VAUmKycpgSLHGWxb9gHi9sH2bqHUrxX4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=S5ekrAFy5xZfOPWlDkK+9bhA/CajLc54B4q1HJj7DD+2M38ELEQ/5jkJwz7b9d81+Bqa72qbu/lsS892FaPN+ZWNlyywg+7Q4zNXzowr0toXZZoCWJ71KkyfvwgEbbvPDxVqKVTBmg5M3C31nzSpU+g9/+t+6lkRH0fwVzo/Qhw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cnqT9XQE; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cnqT9XQE"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-3964dfb5a69so3225598a91.1
        for <linux-usb@vger.kernel.org>; Thu, 03 Sep 2026 05:19:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788437999; x=1789042799; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=77BNTVqgC1Z2OdVFKoom+8RxQdD5brnKOMVuDrWHP/Y=;
        b=cnqT9XQEFmpDdDCKUPONbZaHr/LActep/Xn50lW9wlFWfhI41gwyQ+U9+ArgHCV1oE
         txRhJV4nVNwKu5wLEj/wxNLrfqvLXBanVA0FnXUjKF2/wTuF/bB/s62BhpsCDKmUJUDU
         OJFsmZdIccW8IQFTx4oc6Dm+SIqHnTIY9giNrZgTc4KAuQ2fgha1aE+qYx6xO9QT+P6Z
         txEK9VaDkKnCOvu6FjsSCMcpsSni6ShOVrHDcw+dVR6YGNNLFpJY8SFcW6NxXkIYbmdZ
         VEW5dMggg4sEOAEYCbcGseFnHzt+mo/amcKoTtPAs2d6GMMz4N3RiVvNg9mrzg0H6rfZ
         pHIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788437999; x=1789042799;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=77BNTVqgC1Z2OdVFKoom+8RxQdD5brnKOMVuDrWHP/Y=;
        b=M6t0NpSmiZOBxDK3bvc47Fl8JIQinLN/KccFv/o+sPQ8rbErTr14AmruxhGgHIz3cD
         bq9O0PrhaWbEha0+V9GGT98U0/H0At9U0CZKMvWXpk1IWhjPZrQUhFwIhw38B+9M1/z9
         LAt5BPsCaOjup5hzGwWuC2T78jh00UUpvQgnCBWsNNNHhshi97hUqE+Nysp3jA0neiPI
         PJCYqbRezddS6RM3kdQMK6Ihyfd19MqssZlTytrUraEWvDPRYBic0WW1zOlG9ba30wTe
         qoHTAZqLKVDLJTwmNLAFn1dKAIskqT+r7PYYOoAvsJMF4NlWOWDaR/+RBRZdr4iNYVpd
         saiw==
X-Forwarded-Encrypted: i=1; AKwUvBx9GbsAlNGxyPflHyFVuoFERviHXP4VI4SqxHh0UWQfn2aPC5EFLNgOv+IhO7VkZ83tmYRZTmogcVw=@vger.kernel.org
X-Gm-Message-State: AFuF++mBWDTc4tiqEuW20LdPJ5e7RqMQ09kBbetQC57puzoOYqXsX9E3
	5bkAdmMkUv6gAMXaPqP+5BJyQqSLHHwYYNMmNYTpw80HBNAYdA4f4alx
X-Gm-Gg: AYBFou1OfaB6ngp3DNBrpixUjJd4dwKXMuD/lRjGCp/8UqFNxtiAqMeewecdN2rBdG8
	P0d1Pk+S/C9EuSFLwH9rIJ+mumYxzxaCS1sCCS2qzQTq3yPLAK1CYMcbIvRNq9rHYshX/Enkltx
	Mq8DikbiMywM3m8iINN7PUEJBkTcTQOZHfiAvhlUeaJO1he/zCkiXpO4befJmmuu6+atcY7hBh9
	wjtJTu6vf0PJU4qlx0NL97KDN+TDCVTm9yUJqNFRPE/sYOrfeiaMbuXpMgVzdWe8e/KiMkaVdrP
	+GPSMXwVaPNjFItE0biMzMVMQ5pcjLqBiBaGlKXe5YjX6N/16LvshlhYPIdxNSzRD6JoheZTkTd
	8fpeR4t46XRFAVYpnGk4/uufiBaO1FWMQzMXzIQd/IJqa7C6480Z0OFL2vAgIlFE2AS5fBiFPiU
	3bQPq9lr36PjsCum/Y2s1KWm+PzadyaOguEzGcgopvzicwYecMr3CpXKnDcz8BhgZfETj3dFdBm
	/dAyS8YRKF3YRR0SesUrZokPCB7UP3zdyJET8mHcgtf/GOmdVlFWg==
X-Received: by 2002:a17:90b:3d81:b0:398:c150:e7b3 with SMTP id 98e67ed59e1d1-39aedf5d923mr18578664a91.4.1788437989277;
        Thu, 03 Sep 2026 05:19:49 -0700 (PDT)
Received: from deepanshu-Legion-Pro-5-16AFR10.. ([2405:201:682f:383f:d01b:7a44:ef5d:7899])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b08bcc090sm5361270a91.4.2026.09.03.05.19.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 05:19:48 -0700 (PDT)
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
Subject: [PATCH v4] usbip: vhci_hcd: let the driver core manage the sysfs attributes
Date: Thu,  3 Sep 2026 17:49:38 +0530
Message-ID: <20260903121938.7661-1-kartikey406@gmail.com>
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
Link: https://lore.kernel.org/all/20260816061034.17769-1-kartikey406@gmail.com/T/ [v3]
Assisted-by: Claude (Anthropic)
Signed-off-by: Deepanshu Kartikey <kartikey406@gmail.com>
---

v4:
 - add Assisted-by: tag (Greg)

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


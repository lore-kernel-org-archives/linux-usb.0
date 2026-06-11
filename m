Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBB2D386576
	for <linux-usb@vger.kernel.org>; Thu, 11 Jun 2026 22:11:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781215878; cv=none; b=FYUhM3SVyFrhN8YsVSXwAcbNq2otHnNcikVL4LVG/neZdDNJRCt5hl1Pw3cFiBpaI+qBgLvTFkypBQ9uURe7ajShIsUTQfZRdeoPmixAr2nzo9Cm9znBrroqtu8y1sO48tQ1fXIhTTZCX+yFHsQxOIaNz0lSLErON1iUdpnBoVc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781215878; c=relaxed/simple;
	bh=+599kUFZuejz8HnMOy6Vp6ov9lnzaweEsHpFhvkaLDw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bfMf3bxxZ0Em6vOWJsmvTX4n9KU10Glz+19uuyprDEfLnv7kpRecLsqK0lww96J0rg3UA7kePIhzjmUDBUTPYMwV94gVsUsvoq4gcnVKMh2dh04aJCnSP1/UNXkBPxIoGLesV4A3ucSmgwsy5mBjji/sd19cg4FTveXTF2o33ZE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VbuQWAMd; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VbuQWAMd"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-68bd9fce347so602508a12.2
        for <linux-usb@vger.kernel.org>; Thu, 11 Jun 2026 15:11:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781215874; x=1781820674; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7VygpZMQdW2uZLK9DcJsNv0FcSOm1qz9YevFAN9r2fg=;
        b=VbuQWAMdaigssCYr/5GAMjwPLhvCALp8DP3LInG6/I13Is9FwCizSvqsy6DeGtuq4O
         5eIXTuRjtnsW4G0PcNQLdxjvVPO0d5S22VSdqlf8tnEpdC8DWJeLiTN5w353OvBnCh1K
         GK+CBuCIC6HgAEUxays5TAw2u+kAN/FMk92qpOiR/h3/OlYc8KQASzipYg6YSnoZZG4p
         MhA6K8dvO7l9R2lhd8yINysZBfpJV3jqcYPAcvBcozlLZHUVjFWnFsImgz5Rsuq2jph4
         KX4QvLuq1Ksbv9VFzvYgY33mwY3o6rPFtwXo5Z5zC5jTGqx6ZBVDJI5AhXMC0ZVutGY9
         MLYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781215874; x=1781820674;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=7VygpZMQdW2uZLK9DcJsNv0FcSOm1qz9YevFAN9r2fg=;
        b=qh8PLYLFZYYLdrhn0L+U8ef8Y1AjYJe+f922TtLulF4BdJ5qNKRD5uUAWdH99/57pK
         7C3kgYPHWROCwBsHCEOK9fbsU2++/iIOEbaU02IPsP+9Wmx2WlJzk9Bb7TXmNBiQ8+Tm
         cRclaP7xwdEoVh6PBZ2G9vpWR3zfcUc2g8SU6Qj+6pOcvNpU6Hi6+oPUK1nhGm6c7b/S
         aalBb2WuWXO9m4KqnyknQHpPJwcAK5V1qIodq9PWP5+5c3XpCHl+nj2dzFbR9DZASJiO
         7gfMtzf5OM+Z+Q93KQkyEUxywE5MbrahhgaN7XENmXTv3MqE5Oru1ZyrxBp0k3Mfv0Oi
         7HUg==
X-Gm-Message-State: AOJu0YyC3OtMuuCFW9Sp0HYejcNbU+5ROx+y7E5VCL1MN5u7hsEOTwlU
	6pVxqJ5n74uLaXTJ2Ub1eRhSwTqNJZkOY0ZjFl4MHBfc47BIVjFy7bcM
X-Gm-Gg: Acq92OEeUaRXoJO1gsaVbS4tIuPtxXUAzE3x8m66LbzMtZEX1tVrfKJzzrdlRUHoQ6R
	ahh9BQaxh2bnA8IVCiQBwIJtIY4XjicxYGp5qtlJ2rY4bzNq9tiG+GySvosfjCbJ+4OxRvOgHE0
	rWMI5zRefAGgQ1NsNkwaddek0wPkhQoncublK1Q5j3WxyCJkzMpm/bvQxC1OP/ouCA9JAYXTpEG
	ecQEIHRWmEC06J4jLE9PyDjXMoJR8dGus2GHoIcWWVfe+kuvPCpn1mMvDwNDhV3dYG9yB/PAsM5
	7x5+LxXh/NEtGdx5eYFu4r0/47dmbL/9tTb/LpNGgPxhmSpWZu5XXyrPjreaiDysiIPStMDcoZ0
	9FPSwPSrRLbfvwnBGEa4SPgIM6FCX25iTZ4rWXI8nv4OmpHRxhgLiOM4JM1CChzX9ZpS24k4SdO
	zLwIm4enA2hhmOvKR2HL9yx3tjmYmUEjFs3gbIMEtBwjOYNR9mL3c4OqKyNI7ewgXrnO8XbRWEh
	uTRUWUdyWNxgTU8HiUfX2AkjKU=
X-Received: by 2002:a05:6402:388a:b0:693:ed2:3f7f with SMTP id 4fb4d7f45d1cf-69377e0d6a6mr33342a12.13.1781215874102;
        Thu, 11 Jun 2026 15:11:14 -0700 (PDT)
Received: from [127.0.1.1] ([2a02:2a40:17ee:2900:654c:3df2:2fd9:9b68])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-693751bac6esm41564a12.10.2026.06.11.15.11.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jun 2026 15:11:13 -0700 (PDT)
From: Jakub Lecki <lec.jakub@gmail.com>
Date: Fri, 12 Jun 2026 00:10:58 +0200
Subject: [PATCH 1/2] usbip: Convert usbip_debug to driver attribute.
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260612-usbip-attribute-cleanup-v1-1-8de3aa76867e@gmail.com>
References: <20260612-usbip-attribute-cleanup-v1-0-8de3aa76867e@gmail.com>
In-Reply-To: <20260612-usbip-attribute-cleanup-v1-0-8de3aa76867e@gmail.com>
To: Valentina Manea <valentina.manea.m@gmail.com>, 
 Shuah Khan <shuah@kernel.org>, Hongren Zheng <i@zenithal.me>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Jakub Lecki <lec.jakub@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=4663; i=lec.jakub@gmail.com;
 h=from:subject:message-id; bh=+599kUFZuejz8HnMOy6Vp6ov9lnzaweEsHpFhvkaLDw=;
 b=owEBbQKS/ZANAwAKAXFnMxNuLeadAcsmYgBqKzJ8ZetpwDUZs4zdeSdigh2Js5vVp044v8o6w
 84pNf3LYTiJAjMEAAEKAB0WIQTignGL6YrBw4GbwvJxZzMTbi3mnQUCaisyfAAKCRBxZzMTbi3m
 nXjgEACFv6ATi4kHxcd6S5KeI+8X9+5NeEEUKJpM6iWP6zGX4+zuo2ddy9AWxuE9TfDio80Df0O
 lYoGUXYOTf4XvdBRBi2gmjxxzAl8YsEGZ7sOSrvjWX4GKNMLJ1dryY3HOYPKk24lDGeHSj7m0pY
 FvVVZ4j0KiNU+beFMV3r6/xpca0OeRybGtMibHzZ3Lqc4Kc1cIV+fU2ZMv/ygh8Il3xkFZzzbND
 s/fT21zA28yqeTbLoz+816PJ/+bZE0xDUmH5ICZCr34WRSLv9VQlbIQd0EobA9GKDpS9Wc49S7u
 wHit6fCA1X0PaGd8dk673UcJW1A5BxYLIn/gfE9EEek+yq5FJzUxCh1nZT24VXa1r/8gglH/WAD
 YRPJ62NGkI4iBk4Au9RccUXelypGbBuTMTZXvfQDpRAsLFuJh2O7KXePvmj/E5Ju1f9r4aONdjM
 tsgutgheq2vo3hiHSfWsK4pe1RkzHI4rvpU9W2yV9JQOex4K5t4H9GBLOW8MR0Q0Y9NAhL6ZMTW
 Q6+Hvsw7P58jBj1y/Jjj4dn95YDRIHb4hBxkgepqccKBjvVhcg9xWQcpFcppIJ/5XhtnvlbkNl4
 QzsIwA9TBF5VExrEite9FSe3SzWas4ohhlPfDvck/Vg8BlGpYeVJjHZdMjg1nl9UAfFJpMXv/jR
 EB5gBZzV6GIO/1w==
X-Developer-Key: i=lec.jakub@gmail.com; a=openpgp;
 fpr=E282718BE98AC1C3819BC2F2716733136E2DE69D

Changing configuration of the debug flag affects all of devices debug
prints. Move the attribute to a driver level to prevent duplication.

The attribute for given drivers is located under:
* /sys/bus/platform/drivers/vhci_hcd/usbip_debug
* /sys/bus/usb/drivers/usbip-host/usbip_debug

Signed-off-by: Jakub Lecki <lec.jakub@gmail.com>
---
 drivers/usb/usbip/stub_dev.c     | 10 +++++++++-
 drivers/usb/usbip/usbip_common.c | 14 ++++++--------
 drivers/usb/usbip/usbip_common.h |  2 +-
 drivers/usb/usbip/vhci_hcd.c     |  7 +++++++
 drivers/usb/usbip/vhci_sysfs.c   |  3 +--
 5 files changed, 24 insertions(+), 12 deletions(-)

diff --git a/drivers/usb/usbip/stub_dev.c b/drivers/usb/usbip/stub_dev.c
index abfa11d6bde7..653d582de181 100644
--- a/drivers/usb/usbip/stub_dev.c
+++ b/drivers/usb/usbip/stub_dev.c
@@ -145,11 +145,16 @@ static DEVICE_ATTR_WO(usbip_sockfd);
 static struct attribute *usbip_attrs[] = {
 	&dev_attr_usbip_status.attr,
 	&dev_attr_usbip_sockfd.attr,
-	&dev_attr_usbip_debug.attr,
 	NULL,
 };
 ATTRIBUTE_GROUPS(usbip);
 
+static struct attribute *usbip_drv_attrs[] = {
+	&driver_attr_usbip_debug.attr,
+	NULL,
+};
+ATTRIBUTE_GROUPS(usbip_drv);
+
 static void stub_shutdown_connection(struct usbip_device *ud)
 {
 	struct stub_device *sdev = container_of(ud, struct stub_device, ud);
@@ -531,4 +536,7 @@ struct usb_device_driver stub_driver = {
 #endif
 	.supports_autosuspend	=	0,
 	.dev_groups	= usbip_groups,
+	.driver = {
+		.groups		= usbip_drv_groups,
+	}
 };
diff --git a/drivers/usb/usbip/usbip_common.c b/drivers/usb/usbip/usbip_common.c
index a5837c0feb05..6920c12f2863 100644
--- a/drivers/usb/usbip/usbip_common.c
+++ b/drivers/usb/usbip/usbip_common.c
@@ -30,24 +30,22 @@ module_param(usbip_debug_flag, ulong, S_IRUGO|S_IWUSR);
 MODULE_PARM_DESC(usbip_debug_flag, "debug flags (defined in usbip_common.h)");
 
 /* FIXME */
-struct device_attribute dev_attr_usbip_debug;
-EXPORT_SYMBOL_GPL(dev_attr_usbip_debug);
+struct driver_attribute driver_attr_usbip_debug;
+EXPORT_SYMBOL_GPL(driver_attr_usbip_debug);
 
-static ssize_t usbip_debug_show(struct device *dev,
-				struct device_attribute *attr, char *buf)
+static ssize_t usbip_debug_show(struct device_driver *driver, char *buf)
 {
 	return sprintf(buf, "%lx\n", usbip_debug_flag);
 }
 
-static ssize_t usbip_debug_store(struct device *dev,
-				 struct device_attribute *attr, const char *buf,
-				 size_t count)
+static ssize_t usbip_debug_store(struct device_driver *driver,
+				 const char *buf, size_t count)
 {
 	if (sscanf(buf, "%lx", &usbip_debug_flag) != 1)
 		return -EINVAL;
 	return count;
 }
-DEVICE_ATTR_RW(usbip_debug);
+DRIVER_ATTR_RW(usbip_debug);
 
 static void usbip_dump_buffer(char *buff, int bufflen)
 {
diff --git a/drivers/usb/usbip/usbip_common.h b/drivers/usb/usbip/usbip_common.h
index 282efca64a01..ee4114e44935 100644
--- a/drivers/usb/usbip/usbip_common.h
+++ b/drivers/usb/usbip/usbip_common.h
@@ -57,7 +57,7 @@ enum {
 #define usbip_dbg_flag_vhci_sysfs  (usbip_debug_flag & usbip_debug_vhci_sysfs)
 
 extern unsigned long usbip_debug_flag;
-extern struct device_attribute dev_attr_usbip_debug;
+extern struct driver_attribute driver_attr_usbip_debug;
 
 #define usbip_dbg_with_flag(flag, fmt, args...)		\
 	do {						\
diff --git a/drivers/usb/usbip/vhci_hcd.c b/drivers/usb/usbip/vhci_hcd.c
index 39e8faf4c18c..bff752ac3183 100644
--- a/drivers/usb/usbip/vhci_hcd.c
+++ b/drivers/usb/usbip/vhci_hcd.c
@@ -1506,6 +1506,12 @@ static int vhci_hcd_resume(struct platform_device *pdev)
 
 #endif
 
+static struct attribute *vhci_attrs[] = {
+	&driver_attr_usbip_debug.attr,
+	NULL
+};
+ATTRIBUTE_GROUPS(vhci);
+
 static struct platform_driver vhci_driver = {
 	.probe	= vhci_hcd_probe,
 	.remove = vhci_hcd_remove,
@@ -1513,6 +1519,7 @@ static struct platform_driver vhci_driver = {
 	.resume	= vhci_hcd_resume,
 	.driver	= {
 		.name = driver_name,
+		.groups = vhci_groups,
 	},
 };
 
diff --git a/drivers/usb/usbip/vhci_sysfs.c b/drivers/usb/usbip/vhci_sysfs.c
index 5bc8c47788d4..2742ab12f309 100644
--- a/drivers/usb/usbip/vhci_sysfs.c
+++ b/drivers/usb/usbip/vhci_sysfs.c
@@ -512,9 +512,8 @@ int vhci_init_attr_group(void)
 	*attrs = &dev_attr_nports.attr;
 	*(attrs + 1) = &dev_attr_detach.attr;
 	*(attrs + 2) = &dev_attr_attach.attr;
-	*(attrs + 3) = &dev_attr_usbip_debug.attr;
 	for (i = 0; i < vhci_num_controllers; i++)
-		*(attrs + i + 4) = &((status_attrs + i)->attr.attr);
+		*(attrs + i + 3) = &((status_attrs + i)->attr.attr);
 	vhci_attr_group.attrs = attrs;
 	return 0;
 }

-- 
2.53.0


Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE0F838F953
	for <linux-usb@vger.kernel.org>; Thu, 11 Jun 2026 22:11:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781215881; cv=none; b=o+hJMLRHCn72jkqMuo+cFypQah72iTkjfLdq8DSs70DWIFUzaKOoRvSExYVLi2TFN80iFV2fXqXBhMWp/TMRP+SSSXWmWL5E9m0OqMfyc+LcjbZltKPhOkfw2EqF2TyZQdDOInC3VOA8tFsJq/RVwET3mihXPCAiX6BvuSlLQ9c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781215881; c=relaxed/simple;
	bh=uAzVGmyFfnNt7+JgAxAupFli7/se2G+b61mCB8mKxdM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=E8OAwiH/rx5HDHCe0rcENgMc0lb2eQjkMN+LZgkaXsGRuNNl9nXE2kFDiLO9OAH8LVhHYcFtJvSCbUBskBs6flV+IF315WYkLJPsUOR9RaRLgHyfEK+hKlTcK3RN5HX1yA48gaj2ldIBl4mUW2RX6iEh5nE3xYEw7GaUNSbyhOI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YmPJO1sE; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YmPJO1sE"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-69170548d0eso472690a12.2
        for <linux-usb@vger.kernel.org>; Thu, 11 Jun 2026 15:11:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781215876; x=1781820676; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SdjuzNOZ2BOIYAXHolTtgLxwz5xENCLg7GkXr0UcVx0=;
        b=YmPJO1sEgqzBraT18jK3lAERt3EIO9p3E+fGbbRVz2FWJAmt0+2tLQon85Ep22qakV
         MkeLyjGvPlLiOvFNOhM3sellvCO6cs2KLaY0aPqHP9eMUHpA7yft2lN96fvjemxFXDb6
         59pbzgrNLfxSU5apFtBxIsLsCJSX16+EkoeNDVliegNIBtL6Xm23TSwvH5yDo/dkPJX6
         x1dinSk+uEq2kWqZk+wB2ak8jSeEAXbLAKf8W4aBdm+ZhfUtGgEE+O3YeVBsAyBG34jV
         srRE+dGFH5s9zG3Dc2vR9b9qQIClNyI818b5Dy1pGsMcH63A1BvKT26rsPh2fVYT14FG
         vHug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781215876; x=1781820676;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=SdjuzNOZ2BOIYAXHolTtgLxwz5xENCLg7GkXr0UcVx0=;
        b=NWLTA2cB8ALOTmr/M/LUYfK/8SUUwsjuwFm9lMzx8eGuPPv+pwgB/4S3PeHr75PQMA
         6GtDrP3gBO24HnjTDjQ0IaKQ8hakEUwLQcrRXjOPN75vE1enFFy52P4zbWdCsTT8woqq
         XMqRiaYZPrtQHCuA1CegXwAUEuyH/hf71fiq0xT7XWzsMXNNCKBGFaJFvShGJ+oNoxuu
         JthSZziaqON88ZJsM6RgG7Wb55vv+Dy/odTRgywmYF7KIL3nYWbu+BjE/GEuVOY7bi6U
         oOwDh5C2X7DQiOQ02DR10+whDsLgSlioWt3IHFXW1VokncMUIXTy2tAaN5PDv5so4Ffn
         Yclw==
X-Gm-Message-State: AOJu0YzdmNxfhbQsM/thTLHx4DF0aTC/+AbX9lHPuOKKrJgYvyCNZ0uz
	K0TTo+YQT4j2JDyDPq2kQb0C1oX04vKZRB2hAlAOhR1a5r3IFWIkHtWJ
X-Gm-Gg: Acq92OHKFkFB/5YC2YOth0x9Y0fh4cr9ceSLk/s+3wx4aZqFx2FR/Lht25qitgAOl7w
	wte55i08mu2U5HYS7ubNc1nifA3PWwHXey0ZNn8zXvuz9Md0wwBx+BRqm+Wep/WHhDC67HQVllk
	M6OTgv1hAfMJ6E31C7p/2HX1CI6zeaWxYqiQ4amiITYny5+NtfPG9cZf4XZW4OWu7Ar8eI0OOcX
	fedNcbgWadfW858TZ9mhXVBtAwHlNCtsovr0vKGJcYIuHxmzUTrBted1w8pImy6V2VuFvCtpa1+
	eVZ5TlnPtKsFM5qJHJazx6C6UPwLMYLQKNjrOh/RU0c/fyqu1nzYw5kMv7TviEV6rD/EIVOOhVa
	r+sYTRaSgnvjHt8vQpw5toSnfjDKrUJLWjO8DwQij9pS4Wiu127jos1ulhfvdISVJne1YomuzDO
	VaWykbs/EdxVWPPgiDKNVshlXzGUzBqJ5C2Sujh1vVFD/rcdkYwdpCaWrxuvBgeKtJ3KUZYcTLR
	p2O13MPJPH0TwU7
X-Received: by 2002:a05:6402:5484:b0:68d:aee2:752d with SMTP id 4fb4d7f45d1cf-69378604010mr16448a12.5.1781215876209;
        Thu, 11 Jun 2026 15:11:16 -0700 (PDT)
Received: from [127.0.1.1] ([2a02:2a40:17ee:2900:654c:3df2:2fd9:9b68])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-693751bac6esm41564a12.10.2026.06.11.15.11.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jun 2026 15:11:15 -0700 (PDT)
From: Jakub Lecki <lec.jakub@gmail.com>
Date: Fri, 12 Jun 2026 00:10:59 +0200
Subject: [PATCH 2/2] usbip: Cleanup of vhci_hcd attributes.
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260612-usbip-attribute-cleanup-v1-2-8de3aa76867e@gmail.com>
References: <20260612-usbip-attribute-cleanup-v1-0-8de3aa76867e@gmail.com>
In-Reply-To: <20260612-usbip-attribute-cleanup-v1-0-8de3aa76867e@gmail.com>
To: Valentina Manea <valentina.manea.m@gmail.com>, 
 Shuah Khan <shuah@kernel.org>, Hongren Zheng <i@zenithal.me>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Jakub Lecki <lec.jakub@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=17956; i=lec.jakub@gmail.com;
 h=from:subject:message-id; bh=uAzVGmyFfnNt7+JgAxAupFli7/se2G+b61mCB8mKxdM=;
 b=owEBbQKS/ZANAwAKAXFnMxNuLeadAcsmYgBqKzJ8faKU3DxkxqUGQW3TNEPh9PzVVOiMQXoIh
 uzkItDu/ZSJAjMEAAEKAB0WIQTignGL6YrBw4GbwvJxZzMTbi3mnQUCaisyfAAKCRBxZzMTbi3m
 nfEOD/0QJ6TrmaT0kdOSVOKwr0+NM7P5H/DGKSMkFpQuSYxBnQ0MOEKkGn623D5u1EqhloltDEl
 wH1Hi9vYS0fNfxL2f9Ga8VgpX52foG/D4mAeRoqx0nurHiGjs1Urw3EuS3jtNCPxDUl65qnruI7
 392fQLknq0GJSC1tuXaow4QwdZFa7bYauppbPIrgkUPa0jdIvSIFVprqkIRNnxPEe5LTwEiVdEP
 sb34d/m2RzxwCrh4u8zx1hHYRujgxzBRLDwklaZluq4oS3lFA7muxMKqolOzuQdYUg1SEUi5SJ4
 amTjXB+rPCeHqYHwpvhxt/bed2ArRHC3luVrwgErqjKf1UGS2nXm41TIQFjzGZDaS9ww5RVrQJ1
 OYYAQpVRpFQsnA0s35pwurrdnC5fBvpq763KVT2VQ4ADagh7o/qbkgHjQrC+nxq8wRiNySZaHdQ
 GUy6m5LQZS2Lkd1eMKxl3tyuSMTzTMUxdhW0Vs9Gqqs5rOJ0hCm+jenpi5IseAgglo5KUxF1kba
 m/jSzYcLCteXmAoqE0ETnKs2zmiHE26htPWImfq0uR5wEPxHkZrLrVlwHl8LPM01D5mWBFsG0xE
 S6DxVXlvgrMCwhSTLeTyW3TUr/6CFaESNVv4i8Q9PyWqxTGfA5DYJ02gDye0B3+yDxRDE6rin9i
 aR+1SFpxOAuuXmw==
X-Developer-Key: i=lec.jakub@gmail.com; a=openpgp;
 fpr=E282718BE98AC1C3819BC2F2716733136E2DE69D

`nports`, `detach` and`attach` attibutes are common to all of
vhci devices, therefore should not exist in a single specific device.
Move them to the driver level. They can be found under
`/sys/bus/platform/drivers/vhci_hcd/`.

On the other hand, status attribute is specific to a device, thus it is
registered as a device attribute and created for each of vhci devices.
`status` attribute can be found under
`/sys/devices/platform/vhci_hcd.<n>/status`.

usbip userspace application sources are adjusted accordingly to the new
placement of attributes.

Signed-off-by: Jakub Lecki <lec.jakub@gmail.com>
---
 drivers/usb/usbip/vhci.h              |   6 +-
 drivers/usb/usbip/vhci_hcd.c          |  64 ++++-------------
 drivers/usb/usbip/vhci_sysfs.c        | 131 +++++-----------------------------
 tools/usb/usbip/libsrc/sysfs_utils.c  |  23 ++++++
 tools/usb/usbip/libsrc/sysfs_utils.h  |   1 +
 tools/usb/usbip/libsrc/usbip_common.h |   2 +
 tools/usb/usbip/libsrc/vhci_driver.c  |  61 ++++++++++------
 7 files changed, 103 insertions(+), 185 deletions(-)

diff --git a/drivers/usb/usbip/vhci.h b/drivers/usb/usbip/vhci.h
index 5659dce1526e..3bee1c0109e3 100644
--- a/drivers/usb/usbip/vhci.h
+++ b/drivers/usb/usbip/vhci.h
@@ -126,8 +126,10 @@ extern struct attribute_group vhci_attr_group;
 void rh_port_connect(struct vhci_device *vdev, enum usb_device_speed speed);
 
 /* vhci_sysfs.c */
-int vhci_init_attr_group(void);
-void vhci_finish_attr_group(void);
+extern struct device_attribute dev_attr_status;
+extern struct driver_attribute driver_attr_nports;
+extern struct driver_attribute driver_attr_detach;
+extern struct driver_attribute driver_attr_attach;
 
 /* vhci_rx.c */
 struct urb *pickup_urb_and_free_priv(struct vhci_device *vdev, __u32 seqnum);
diff --git a/drivers/usb/usbip/vhci_hcd.c b/drivers/usb/usbip/vhci_hcd.c
index bff752ac3183..f1941a2b85dd 100644
--- a/drivers/usb/usbip/vhci_hcd.c
+++ b/drivers/usb/usbip/vhci_hcd.c
@@ -46,6 +46,7 @@ static const char driver_desc[] = "USB/IP Virtual Host Controller";
 
 int vhci_num_controllers = VHCI_NR_HCS;
 struct vhci *vhcis;
+static struct platform_driver vhci_driver;
 
 static const char * const bit_desc[] = {
 	"CONNECTION",		/*0*/
@@ -1150,23 +1151,6 @@ static void vhci_device_init(struct vhci_device *vdev)
 	usbip_start_eh(&vdev->ud);
 }
 
-static int hcd_name_to_id(const char *name)
-{
-	char *c;
-	long val;
-	int ret;
-
-	c = strchr(name, '.');
-	if (c == NULL)
-		return 0;
-
-	ret = kstrtol(c+1, 10, &val);
-	if (ret < 0)
-		return ret;
-
-	return val;
-}
-
 static int vhci_setup(struct usb_hcd *hcd)
 {
 	struct vhci *vhci = *((void **)dev_get_platdata(hcd->self.controller));
@@ -1198,8 +1182,7 @@ static int vhci_setup(struct usb_hcd *hcd)
 static int vhci_start(struct usb_hcd *hcd)
 {
 	struct vhci_hcd *vhci_hcd = hcd_to_vhci_hcd(hcd);
-	int id, rhport;
-	int err;
+	int rhport;
 
 	usbip_dbg_vhci_hc("enter vhci_start\n");
 
@@ -1224,46 +1207,17 @@ static int vhci_start(struct usb_hcd *hcd)
 	hcd->self.otg_port = 1;
 #endif
 
-	id = hcd_name_to_id(hcd_name(hcd));
-	if (id < 0) {
-		dev_err(hcd_dev(hcd), "invalid vhci name %s\n", hcd_name(hcd));
-		return -EINVAL;
-	}
-
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
 
@@ -1507,11 +1461,20 @@ static int vhci_hcd_resume(struct platform_device *pdev)
 #endif
 
 static struct attribute *vhci_attrs[] = {
+	&driver_attr_nports.attr,
+	&driver_attr_detach.attr,
+	&driver_attr_attach.attr,
 	&driver_attr_usbip_debug.attr,
 	NULL
 };
 ATTRIBUTE_GROUPS(vhci);
 
+static struct attribute *vhci_dev_attrs[] = {
+	&dev_attr_status.attr,
+	NULL,
+};
+ATTRIBUTE_GROUPS(vhci_dev);
+
 static struct platform_driver vhci_driver = {
 	.probe	= vhci_hcd_probe,
 	.remove = vhci_hcd_remove,
@@ -1520,6 +1483,7 @@ static struct platform_driver vhci_driver = {
 	.driver	= {
 		.name = driver_name,
 		.groups = vhci_groups,
+		.dev_groups = vhci_dev_groups,
 	},
 };
 
diff --git a/drivers/usb/usbip/vhci_sysfs.c b/drivers/usb/usbip/vhci_sysfs.c
index 2742ab12f309..5baf9ccef625 100644
--- a/drivers/usb/usbip/vhci_sysfs.c
+++ b/drivers/usb/usbip/vhci_sysfs.c
@@ -127,23 +127,6 @@ static ssize_t status_show_not_ready(int pdev_nr, char *out)
 	return out - s;
 }
 
-static int status_name_to_id(const char *name)
-{
-	char *c;
-	long val;
-	int ret;
-
-	c = strchr(name, '.');
-	if (c == NULL)
-		return 0;
-
-	ret = kstrtol(c+1, 10, &val);
-	if (ret < 0)
-		return ret;
-
-	return val;
-}
-
 static ssize_t status_show(struct device *dev,
 			   struct device_attribute *attr, char *out)
 {
@@ -153,7 +136,7 @@ static ssize_t status_show(struct device *dev,
 	out += sprintf(out,
 		       "hub port sta spd dev      sockfd local_busid\n");
 
-	pdev_nr = status_name_to_id(attr->attr.name);
+	pdev_nr = container_of(dev, struct platform_device, dev)->id;
 	if (pdev_nr < 0)
 		out += status_show_not_ready(pdev_nr, out);
 	else
@@ -161,9 +144,9 @@ static ssize_t status_show(struct device *dev,
 
 	return out - s;
 }
+DEVICE_ATTR_RO(status);
 
-static ssize_t nports_show(struct device *dev, struct device_attribute *attr,
-			   char *out)
+static ssize_t nports_show(struct device_driver *driver, char *out)
 {
 	char *s = out;
 
@@ -174,7 +157,7 @@ static ssize_t nports_show(struct device *dev, struct device_attribute *attr,
 	out += sprintf(out, "%d\n", VHCI_PORTS * vhci_num_controllers);
 	return out - s;
 }
-static DEVICE_ATTR_RO(nports);
+DRIVER_ATTR_RO(nports);
 
 /* Sysfs entry to shutdown a virtual connection */
 static int vhci_port_disconnect(struct vhci_hcd *vhci_hcd, __u32 rhport)
@@ -230,7 +213,7 @@ static int valid_port(__u32 *pdev_nr, __u32 *rhport)
 	return 1;
 }
 
-static ssize_t detach_store(struct device *dev, struct device_attribute *attr,
+static ssize_t detach_store(struct device_driver *driver,
 			    const char *buf, size_t count)
 {
 	__u32 port = 0, pdev_nr = 0, rhport = 0;
@@ -249,7 +232,7 @@ static ssize_t detach_store(struct device *dev, struct device_attribute *attr,
 
 	hcd = platform_get_drvdata(vhcis[pdev_nr].pdev);
 	if (hcd == NULL) {
-		dev_err(dev, "port is not ready %u\n", port);
+		pr_err("port is not ready %u\n", port);
 		return -EAGAIN;
 	}
 
@@ -268,7 +251,7 @@ static ssize_t detach_store(struct device *dev, struct device_attribute *attr,
 
 	return count;
 }
-static DEVICE_ATTR_WO(detach);
+DRIVER_ATTR_WO(detach);
 
 static int valid_args(__u32 *pdev_nr, __u32 *rhport,
 		      enum usb_device_speed speed)
@@ -306,7 +289,7 @@ static int valid_args(__u32 *pdev_nr, __u32 *rhport,
  *
  * write() returns 0 on success, else negative errno.
  */
-static ssize_t attach_store(struct device *dev, struct device_attribute *attr,
+static ssize_t attach_store(struct device_driver *driver,
 			    const char *buf, size_t count)
 {
 	struct socket *socket;
@@ -343,7 +326,7 @@ static ssize_t attach_store(struct device *dev, struct device_attribute *attr,
 
 	hcd = platform_get_drvdata(vhcis[pdev_nr].pdev);
 	if (hcd == NULL) {
-		dev_err(dev, "port %d is not ready\n", port);
+		pr_err("port %d is not ready\n", port);
 		return -EAGAIN;
 	}
 
@@ -360,13 +343,13 @@ static ssize_t attach_store(struct device *dev, struct device_attribute *attr,
 	/* Extract socket from fd. */
 	socket = sockfd_lookup(sockfd, &err);
 	if (!socket) {
-		dev_err(dev, "failed to lookup sock");
+		pr_err("failed to lookup sock");
 		err = -EINVAL;
 		goto unlock_mutex;
 	}
 	if (socket->type != SOCK_STREAM) {
-		dev_err(dev, "Expecting SOCK_STREAM - found %d",
-			socket->type);
+		pr_err("Expecting SOCK_STREAM - found %d",
+		       socket->type);
 		sockfd_put(socket);
 		err = -EINVAL;
 		goto unlock_mutex;
@@ -404,7 +387,7 @@ static ssize_t attach_store(struct device *dev, struct device_attribute *attr,
 		kthread_stop_put(tcp_rx);
 		kthread_stop_put(tcp_tx);
 
-		dev_err(dev, "port %d already used\n", rhport);
+		pr_err("port %d already used\n", rhport);
 		/*
 		 * Will be retried from userspace
 		 * if there's another free port.
@@ -413,10 +396,10 @@ static ssize_t attach_store(struct device *dev, struct device_attribute *attr,
 		goto unlock_mutex;
 	}
 
-	dev_info(dev, "pdev(%u) rhport(%u) sockfd(%d)\n",
-		 pdev_nr, rhport, sockfd);
-	dev_info(dev, "devid(%u) speed(%u) speed_str(%s)\n",
-		 devid, speed, usb_speed_string(speed));
+	pr_info("pdev(%u) rhport(%u) sockfd(%d)\n",
+		pdev_nr, rhport, sockfd);
+	pr_info("devid(%u) speed(%u) speed_str(%s)\n",
+		devid, speed, usb_speed_string(speed));
 
 	vdev->devid         = devid;
 	vdev->speed         = speed;
@@ -436,7 +419,7 @@ static ssize_t attach_store(struct device *dev, struct device_attribute *attr,
 
 	rh_port_connect(vdev, speed);
 
-	dev_info(dev, "Device attached\n");
+	pr_info("Device attached\n");
 
 	mutex_unlock(&vdev->ud.sysfs_lock);
 
@@ -446,80 +429,4 @@ static ssize_t attach_store(struct device *dev, struct device_attribute *attr,
 	mutex_unlock(&vdev->ud.sysfs_lock);
 	return err;
 }
-static DEVICE_ATTR_WO(attach);
-
-#define MAX_STATUS_NAME 16
-
-struct status_attr {
-	struct device_attribute attr;
-	char name[MAX_STATUS_NAME+1];
-};
-
-static struct status_attr *status_attrs;
-
-static void set_status_attr(int id)
-{
-	struct status_attr *status;
-
-	status = status_attrs + id;
-	if (id == 0)
-		strscpy(status->name, "status");
-	else
-		snprintf(status->name, MAX_STATUS_NAME+1, "status.%d", id);
-	status->attr.attr.name = status->name;
-	status->attr.attr.mode = S_IRUGO;
-	status->attr.show = status_show;
-	sysfs_attr_init(&status->attr.attr);
-}
-
-static int init_status_attrs(void)
-{
-	int id;
-
-	status_attrs = kzalloc_objs(struct status_attr, vhci_num_controllers);
-	if (status_attrs == NULL)
-		return -ENOMEM;
-
-	for (id = 0; id < vhci_num_controllers; id++)
-		set_status_attr(id);
-
-	return 0;
-}
-
-static void finish_status_attrs(void)
-{
-	kfree(status_attrs);
-}
-
-struct attribute_group vhci_attr_group = {
-	.attrs = NULL,
-};
-
-int vhci_init_attr_group(void)
-{
-	struct attribute **attrs;
-	int ret, i;
-
-	attrs = kzalloc_objs(struct attribute *, (vhci_num_controllers + 5));
-	if (attrs == NULL)
-		return -ENOMEM;
-
-	ret = init_status_attrs();
-	if (ret) {
-		kfree(attrs);
-		return ret;
-	}
-	*attrs = &dev_attr_nports.attr;
-	*(attrs + 1) = &dev_attr_detach.attr;
-	*(attrs + 2) = &dev_attr_attach.attr;
-	for (i = 0; i < vhci_num_controllers; i++)
-		*(attrs + i + 3) = &((status_attrs + i)->attr.attr);
-	vhci_attr_group.attrs = attrs;
-	return 0;
-}
-
-void vhci_finish_attr_group(void)
-{
-	finish_status_attrs();
-	kfree(vhci_attr_group.attrs);
-}
+DRIVER_ATTR_WO(attach);
diff --git a/tools/usb/usbip/libsrc/sysfs_utils.c b/tools/usb/usbip/libsrc/sysfs_utils.c
index 14d5e67d398a..3e7bd8ee1b32 100644
--- a/tools/usb/usbip/libsrc/sysfs_utils.c
+++ b/tools/usb/usbip/libsrc/sysfs_utils.c
@@ -30,3 +30,26 @@ int write_sysfs_attribute(const char *attr_path, const char *new_value,
 
 	return 0;
 }
+
+int read_sysfs_attribute(const char *attr_path, char *value, size_t len)
+{
+	int fd;
+	int length;
+
+	fd = open(attr_path, O_RDONLY);
+	if (fd < 0) {
+		dbg("error opening attribute %s", attr_path);
+		return -1;
+	}
+
+	length = read(fd, value, len - 1);
+	if (length < 0) {
+		dbg("error reading from attribute %s", attr_path);
+		close(fd);
+		return -1;
+	}
+
+	value[length] = '\0';
+	close(fd);
+	return 0;
+}
diff --git a/tools/usb/usbip/libsrc/sysfs_utils.h b/tools/usb/usbip/libsrc/sysfs_utils.h
index 0cd5f17e7eb2..6c34b0c88cf6 100644
--- a/tools/usb/usbip/libsrc/sysfs_utils.h
+++ b/tools/usb/usbip/libsrc/sysfs_utils.h
@@ -5,5 +5,6 @@
 
 int write_sysfs_attribute(const char *attr_path, const char *new_value,
 			  size_t len);
+int read_sysfs_attribute(const char *attr_path, char *value, size_t len);
 
 #endif
diff --git a/tools/usb/usbip/libsrc/usbip_common.h b/tools/usb/usbip/libsrc/usbip_common.h
index 73a367a7fa10..424bd90bcd34 100644
--- a/tools/usb/usbip/libsrc/usbip_common.h
+++ b/tools/usb/usbip/libsrc/usbip_common.h
@@ -42,6 +42,8 @@
 
 #define SYSFS_PATH_MAX		256
 #define SYSFS_BUS_ID_SIZE	32
+#define SYSFS_NPORTS_SIZE	32
+#define SYSFS_DEVICE_NAME_SIZE	32
 
 /* Defines for op_code status in server/client op_common PDUs */
 #define ST_OK	0x00
diff --git a/tools/usb/usbip/libsrc/vhci_driver.c b/tools/usb/usbip/libsrc/vhci_driver.c
index 8159fd98680b..11738699fcd2 100644
--- a/tools/usb/usbip/libsrc/vhci_driver.c
+++ b/tools/usb/usbip/libsrc/vhci_driver.c
@@ -106,28 +106,38 @@ static int parse_status(const char *value)
 	return 0;
 }
 
-#define MAX_STATUS_NAME 18
-
 static int refresh_imported_device_list(void)
 {
 	const char *attr_status;
-	char status[MAX_STATUS_NAME+1] = "status";
+	char status[] = "status";
 	int i, ret;
+	struct udev_device *hc_device;
+	char hc_device_name[SYSFS_DEVICE_NAME_SIZE];
 
 	for (i = 0; i < vhci_driver->ncontrollers; i++) {
-		if (i > 0)
-			snprintf(status, sizeof(status), "status.%d", i);
-
-		attr_status = udev_device_get_sysattr_value(vhci_driver->hc_device,
+		snprintf(hc_device_name, sizeof(hc_device_name), "%s.%d",
+			 "vhci_hcd", i);
+		hc_device =
+		udev_device_new_from_subsystem_sysname(udev_context,
+						       USBIP_VHCI_BUS_TYPE,
+						       hc_device_name);
+		if (!hc_device) {
+			err("udev_device_new_from_subsystem_sysname failed: %s",
+			    hc_device_name);
+			return -1;
+		}
+		attr_status = udev_device_get_sysattr_value(hc_device,
 							    status);
 		if (!attr_status) {
 			err("udev_device_get_sysattr_value failed");
+			udev_device_unref(hc_device);
 			return -1;
 		}
 
 		dbg("controller %d", i);
 
 		ret = parse_status(attr_status);
+		udev_device_unref(hc_device);
 		if (ret != 0)
 			return ret;
 	}
@@ -135,13 +145,21 @@ static int refresh_imported_device_list(void)
 	return 0;
 }
 
-static int get_nports(struct udev_device *hc_device)
+static int get_nports(void)
 {
-	const char *attr_nports;
+	char attr_nports[SYSFS_NPORTS_SIZE];
+	char bus_type[] = "platform";
+	char nports_attr_name[] = "nports";
+	char nports_attr_path[SYSFS_PATH_MAX];
+	int ret;
+
+	snprintf(nports_attr_path, sizeof(nports_attr_path), "%s/%s/%s/%s/%s/%s",
+		 SYSFS_MNT_PATH, SYSFS_BUS_NAME, bus_type, SYSFS_DRIVERS_NAME,
+		 USBIP_VHCI_DRV_NAME, nports_attr_name);
 
-	attr_nports = udev_device_get_sysattr_value(hc_device, "nports");
-	if (!attr_nports) {
-		err("udev_device_get_sysattr_value nports failed");
+	ret = read_sysfs_attribute(nports_attr_path, attr_nports, sizeof(attr_nports));
+	if (ret < 0) {
+		err("error reading nports attribute");
 		return -1;
 	}
 
@@ -261,7 +279,7 @@ int usbip_vhci_driver_open(void)
 		goto err;
 	}
 
-	nports = get_nports(hc_device);
+	nports = get_nports();
 	if (nports <= 0) {
 		err("no available ports");
 		goto err;
@@ -359,16 +377,17 @@ int usbip_vhci_attach_device2(uint8_t port, int sockfd, uint32_t devid,
 	char buff[200]; /* what size should be ? */
 	char attach_attr_path[SYSFS_PATH_MAX];
 	char attr_attach[] = "attach";
-	const char *path;
+	char bus_type[] = "platform";
 	int ret;
 
 	snprintf(buff, sizeof(buff), "%u %d %u %u",
 			port, sockfd, devid, speed);
 	dbg("writing: %s", buff);
 
-	path = udev_device_get_syspath(vhci_driver->hc_device);
-	snprintf(attach_attr_path, sizeof(attach_attr_path), "%s/%s",
-		 path, attr_attach);
+	snprintf(attach_attr_path, sizeof(attach_attr_path), "%s/%s/%s/%s/%s/%s",
+		 SYSFS_MNT_PATH, SYSFS_BUS_NAME, bus_type, SYSFS_DRIVERS_NAME,
+		 USBIP_VHCI_DRV_NAME, attr_attach);
+
 	dbg("attach attribute path: %s", attach_attr_path);
 
 	ret = write_sysfs_attribute(attach_attr_path, buff, strlen(buff));
@@ -400,16 +419,16 @@ int usbip_vhci_detach_device(uint8_t port)
 {
 	char detach_attr_path[SYSFS_PATH_MAX];
 	char attr_detach[] = "detach";
+	char bus_type[] = "platform";
 	char buff[200]; /* what size should be ? */
-	const char *path;
 	int ret;
 
 	snprintf(buff, sizeof(buff), "%u", port);
 	dbg("writing: %s", buff);
 
-	path = udev_device_get_syspath(vhci_driver->hc_device);
-	snprintf(detach_attr_path, sizeof(detach_attr_path), "%s/%s",
-		 path, attr_detach);
+	snprintf(detach_attr_path, sizeof(detach_attr_path), "%s/%s/%s/%s/%s/%s",
+		 SYSFS_MNT_PATH, SYSFS_BUS_NAME, bus_type, SYSFS_DRIVERS_NAME,
+		 USBIP_VHCI_DRV_NAME, attr_detach);
 	dbg("detach attribute path: %s", detach_attr_path);
 
 	ret = write_sysfs_attribute(detach_attr_path, buff, strlen(buff));

-- 
2.53.0


Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9F734657CD
	for <linux-usb@vger.kernel.org>; Tue, 28 Jul 2026 19:52:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785268334; cv=none; b=fkVzYjAEhjHD7EdOjlE13+82VFDNfqOWdGEtJn7xZC6UdMWZ7Fr7MrwK8LSdURFC1ZM4SyKvveXyoCYWaTrOXM623Gc3VcacleODsfXH/XTPEMPS+E5kLZ4gCnpUI/11WjKa7l5YCY91c8pUAMlJCM759podPGJOXfaE9+QTrH0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785268334; c=relaxed/simple;
	bh=Nj8Uu4X/8wvVYZY4l0Sd8MNETHKyAv52T2oSotFNfRQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CB/mplM2Xx6bhe6RUHACpzytrJLH5bONudhkEIpBOudxN6RG0YTB5U4hkRD0ORU1HRQ3UcOJkOjjiH7nVlCyy8zfl7G8EPyMGkLLm/j9l4xP6TWZypRHTiLDLc1EVxiD6vanLbmCNvxnA/5W41TZo5D8Tayg0bBl0cEiZU+4+6k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gkd4pSvp; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gkd4pSvp"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2caea3f742bso3620515ad.0
        for <linux-usb@vger.kernel.org>; Tue, 28 Jul 2026 12:52:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785268332; x=1785873132; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NLQ5jvybCf/zGwa1IealBNI//5/h9wcvMKi+jtTkRd4=;
        b=gkd4pSvpCaC1gGxUiGgtCx9OHV9ypJ48wjAk6aInZqJYQQ8JC2GU2wx86OoGmfQr6Q
         x/quCLMGvtxOxrgpN2qTEgTi9ff93p0Ffi2pla4OvtDZQmKiJ6+gJuKvNMstXkK/hJ03
         Q2VgS5fHgkdw/OPfDOaBUEZcyBV2nJMlEkHkEFQe+v+q6xHstJkXph8ogunFftvWUFsJ
         03KixhpEGk2o239GT6aZzFnE3dKGeJ6wr2Q6+NLxLSNmnDULQIn27wRoJBgk/l+5iQuU
         hXg/m4weLcLAjf9AawecEPWnzIB7o+cqDyyIwlQej2rdJT7XWo2yyWn5EDVCNPMRln/m
         HCOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785268332; x=1785873132;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=NLQ5jvybCf/zGwa1IealBNI//5/h9wcvMKi+jtTkRd4=;
        b=siHt+vh8F7RgKurISrcS1fHPvj93velzaKOy1ixvVAnGmXH/UUndH/xA4+HuxKe26f
         +5DOhYlbT5SvJzL9pnB9YAX+eGAgAjiaEyktaM6T6zRzN25saG9rkHI+b4/UmLBCiadD
         q6xW2jo3HIOsY+Aw0KMd0aQPffOVdDTUie0mV41wRudbJvEyGJGvf0Z28juz/Pa50XGo
         l7NMkhuFHbKWB9QOcAznOe+5eNhflSTgtuiQg+00Qz/haEgIhhhWiT8ivz28MiMwqF3K
         fbZhkDUFfWNeRZWpayLl9xLZuZrUIB48fdOtwrFnlcCOIYMTDUr+APlWd8Tq4xQk6FPG
         H65g==
X-Gm-Message-State: AOJu0YxOjN7Gfm7T61pIGithCKU4LH/gcl098xemB7OQ1gvJdOaTk6tr
	CvA8YjytmW6ULpIo0ZKkhq18/dLPLylUtNIkUV7Yty0O552kFZ6Ff8ROWQX/FIFD
X-Gm-Gg: AR+sD13JQgOn2TMng0B6J17fbetUJhTPvHsvn0FfbqlJGQjJjqS+8mnXEN6Q4K2uFbo
	7OJ30OzJKKh0lULScT9T7STFsWes/P3QFEBaNXqn5NUKA6I4hLJ6aWngwr6Flzlqf+wBPaUbjJo
	B89EHEmKQzQhNNfoihO/llTDGnqe2CExw1ioo7BrqWDEUZ/ZtRxidsmmXIwR3Z0Wz3zguPRq/4l
	xUYE4fQjUIIOBcPR3XoY+HhmmPbs/ja+/Nc2ZGcoWOk0rp4zvs1/Xc6H+01NRCSng5HWRh7iu11
	eBLGtxVY1TtWumX2l6WJFMaWsMvtMOmzaju3DlvxYEwpgd/fdyShBkwJ7ohd6mJQHOgm2RuuD73
	HpothR6NNP+nA9PwosZ1X8PEeWbZt9s80c9vrsUAwniws/vdGOEmYbqD3a8UmLnWUDT5x3rnl8k
	N5UjFPRvTSjNBerBSrn4ctvaLyP+h0yidQGY2VFQSYSvFD6Cnv/tuuntDD4YOUWt/l3p6Ts9hpa
	4Dmvh22spmkNSBx45C08uxz73wAbEk7Af/6cJjKWa5nhcicgcp35A==
X-Received: by 2002:a17:903:2ca:b0:2c6:9f66:d573 with SMTP id d9443c01a7336-2d015acd4c1mr45653945ad.2.1785268332085;
        Tue, 28 Jul 2026 12:52:12 -0700 (PDT)
Received: from localhost ([103.170.252.6])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31504d480c5sm2525348eec.25.2026.07.28.12.52.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 12:52:11 -0700 (PDT)
From: Nikhil Solanke <nikhilsolanke5@gmail.com>
To: linux-usb@vger.kernel.org
Cc: gregkh@linuxfoundation.org,
	linux-kernel@vger.kernel.org,
	stern@rowland.harvard.edu,
	michal.pecio@gmail.com,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	stable@vger.kernel.org,
	linux-doc@vger.kernel.org,
	ishaan.dandekar@gmail.com,
	Nikhil Solanke <nikhilsolanke5@gmail.com>
Subject: [PATCH v5 1/2] usb: core: Add quirk for 255-bytes initial config read
Date: Wed, 29 Jul 2026 01:21:57 +0530
Message-ID: <20260728195158.65162-2-nikhilsolanke5@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260728195158.65162-1-nikhilsolanke5@gmail.com>
References: <20260728195158.65162-1-nikhilsolanke5@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Certain third-party USB game controllers exposing (or spoofing) an Xbox
360-compatible interface (VID:PID 045e:028e) fail to enumerate under Linux.
The device disconnects from the bus without responding to the initial
GET_DESCRIPTOR(CONFIGURATION) request, and the kernel logs 'unable to read
config index 0 descriptor/start: -71'.

The device then falls back to a secondary Android HID mode (with a
different VID:PID), losing XInput functionality including rumble support.
The failure reproduces across multiple machines, host controller types, and
kernel versions including current mainline and LTS. The device enumerates
correctly and remains in XInput mode under Windows. Notably, the device
enumerates correctly in Android mode when the same 9-byte request
is issued for that mode's configuration descriptor, confirming the firmware
bug is specific to the XInput mode.

usbmon traces from Linux and Wireshark/USBPcap traces from Windows are
identical up to the point of failure, with no visible protocol-level
difference explaining the divergence. The root cause was identified when
Michal Pecio discovered via a QEMU bus-level capture that Windows does not
use wLength=9 for the initial config descriptor request; it uses
wLength=255. Alan Stern subsequently confirmed this with a bus
analyzer on a different USB 2.0 device, and Michal verified the behavior
goes back to Windows 95 OSR2.1.

So, add a new quirk flag USB_QUIRK_WINDOWS_CONFIG_REQ_SIZE which causes
usb_get_configuration() to issue a 255 byte sized configuration request
instead of USB_DT_CONFIG_SIZE (9) for the initial
GET_DESCRIPTOR(CONFIGURATION) request, mimicking long-standing Windows
behavior.

This patch intentionally does not add any new VID:PID entries using this
quirk. Some affected Xbox 360-compatible controllers spoof Microsoft's
VID:PID, while genuine Microsoft controllers already enumerate correctly
and do not require this quirk. Other affected clone devices use their own
VID:PID pairs and can be added individually as they are identified.

Suggested-by: Alan Stern <stern@rowland.harvard.edu>
Suggested-by: Michal Pecio <michal.pecio@gmail.com>
Closes: https://lore.kernel.org/linux-usb/CAFgddh+JWdT4LLwMc5qjM8q_pBu-fRo2qADR5ovAKoGHWMQrRw@mail.gmail.com/
Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Cc: stable@vger.kernel.org
Acked-by: Alan Stern <stern@rowland.harvard.edu>
Signed-off-by: Nikhil Solanke <nikhilsolanke5@gmail.com>
---
 .../admin-guide/kernel-parameters.txt         |  5 +++
 drivers/usb/core/config.c                     | 32 ++++++++++++++-----
 drivers/usb/core/quirks.c                     |  4 +++
 include/linux/usb/quirks.h                    |  3 ++
 4 files changed, 36 insertions(+), 8 deletions(-)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index b5493a7f8f22..3d35270dddef 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -8169,6 +8169,11 @@ Kernel parameters
 				q = USB_QUIRK_FORCE_ONE_CONFIG (Device
 					claims zero configurations,
 					forcing to 1);
+				r = USB_QUIRK_WINDOWS_CONFIG_REQ_SIZE (Device
+					fails during initialization when asked for
+					9-bytes configuration descriptor request.
+					Ask for 255-bytes request instead to mirror
+					Windows' behavior);
 			Example: quirks=0781:5580:bk,0a5c:5834:gij
 
 	usbhid.mousepoll=
diff --git a/drivers/usb/core/config.c b/drivers/usb/core/config.c
index 45e20c6d76c0..346a2faa9bb8 100644
--- a/drivers/usb/core/config.c
+++ b/drivers/usb/core/config.c
@@ -912,6 +912,18 @@ int usb_get_configuration(struct usb_device *dev)
 	unsigned char *bigbuffer;
 	struct usb_config_descriptor *desc;
 	int result;
+	size_t usb_config_req_size;
+
+	/*
+	 * We usually start by grabbing the first 9-bytes descriptor so we know
+	 * how long the whole configuration is. Some devices with quirky
+	 * firmware will fail enumeration, so if the quirk is set, use 255 instead,
+	 * mirroring the behavior of Windows.
+	 */
+	if (dev->quirks & USB_QUIRK_WINDOWS_CONFIG_REQ_SIZE)
+		usb_config_req_size = 255;
+	else
+		usb_config_req_size = USB_DT_CONFIG_SIZE;
 
 	if (ncfg > USB_MAXCONFIG) {
 		dev_notice(ddev, "too many configurations: %d, "
@@ -938,15 +950,13 @@ int usb_get_configuration(struct usb_device *dev)
 	if (!dev->rawdescriptors)
 		return -ENOMEM;
 
-	desc = kmalloc(USB_DT_CONFIG_SIZE, GFP_KERNEL);
+	desc = kmalloc(usb_config_req_size, GFP_KERNEL);
 	if (!desc)
 		return -ENOMEM;
 
 	for (cfgno = 0; cfgno < ncfg; cfgno++) {
-		/* We grab just the first descriptor so we know how long
-		 * the whole configuration is */
 		result = usb_get_descriptor(dev, USB_DT_CONFIG, cfgno,
-		    desc, USB_DT_CONFIG_SIZE);
+		    desc, usb_config_req_size);
 		if (result < 0) {
 			dev_err(ddev, "unable to read config index %d "
 			    "descriptor/%s: %d\n", cfgno, "start", result);
@@ -956,16 +966,14 @@ int usb_get_configuration(struct usb_device *dev)
 			dev->descriptor.bNumConfigurations = cfgno;
 			break;
 		} else if (result < 4) {
-			dev_err(ddev, "config index %d descriptor too short "
-			    "(expected %i, got %i)\n", cfgno,
-			    USB_DT_CONFIG_SIZE, result);
+			dev_err(ddev, "config index %d descriptor too short (asked for %zu, got %i)\n",
+			    cfgno, usb_config_req_size, result);
 			result = -EINVAL;
 			goto err;
 		}
 		length = max_t(int, le16_to_cpu(desc->wTotalLength),
 		    USB_DT_CONFIG_SIZE);
 
-		/* Now that we know the length, get the whole thing */
 		bigbuffer = kmalloc(length, GFP_KERNEL);
 		if (!bigbuffer) {
 			result = -ENOMEM;
@@ -975,6 +983,13 @@ int usb_get_configuration(struct usb_device *dev)
 		if (dev->quirks & USB_QUIRK_DELAY_INIT)
 			msleep(200);
 
+		/* Skip the second read if we already got everything */
+		if (result >= length) {
+			memcpy(bigbuffer, desc, length);
+			goto store_and_parse;
+		}
+
+		/* Get the whole thing */
 		result = usb_get_descriptor(dev, USB_DT_CONFIG, cfgno,
 		    bigbuffer, length);
 		if (result < 0) {
@@ -989,6 +1004,7 @@ int usb_get_configuration(struct usb_device *dev)
 			length = result;
 		}
 
+store_and_parse:
 		dev->rawdescriptors[cfgno] = bigbuffer;
 
 		result = usb_parse_configuration(dev, cfgno,
diff --git a/drivers/usb/core/quirks.c b/drivers/usb/core/quirks.c
index 87ee2d938bc0..f5a60ccf21d3 100644
--- a/drivers/usb/core/quirks.c
+++ b/drivers/usb/core/quirks.c
@@ -142,6 +142,10 @@ static int quirks_param_set(const char *value, const struct kernel_param *kp)
 				break;
 			case 'q':
 				flags |= USB_QUIRK_FORCE_ONE_CONFIG;
+				break;
+			case 'r':
+				flags |= USB_QUIRK_WINDOWS_CONFIG_REQ_SIZE;
+				break;
 			/* Ignore unrecognized flag characters */
 			}
 		}
diff --git a/include/linux/usb/quirks.h b/include/linux/usb/quirks.h
index b3cc7beab4a3..a4043b33c2c2 100644
--- a/include/linux/usb/quirks.h
+++ b/include/linux/usb/quirks.h
@@ -81,4 +81,7 @@
 /* Device claims zero configurations, forcing to 1 */
 #define USB_QUIRK_FORCE_ONE_CONFIG		BIT(18)
 
+/* Use a 255 bytes config descriptor request mirroring windows behavior */
+#define USB_QUIRK_WINDOWS_CONFIG_REQ_SIZE	BIT(19)
+
 #endif /* __LINUX_USB_QUIRKS_H */
-- 
2.54.0


Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 446BA30D3F4
	for <linux-usb@vger.kernel.org>; Tue, 23 Jun 2026 16:11:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782231100; cv=none; b=N7BSVa2M6p34kNfp2KisfWs3bQC4wsdagPtapQFzJ6NM2R0B6sYUGItBIqwVdUC1RCGAP1JdZuDCdVjg2pi3m2SZqU4YKhN7GqHrMpoH5lb/3VR5pGDMLh4pzWzz2dZHp5Ebo9pJ1iEaUIc4OdW+4XeNxECF2kQjkWkSty4RMCE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782231100; c=relaxed/simple;
	bh=qP2A45XHeigsc50z2NRl3N8MoNSLsNeXh6qpsSvTXwY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ShCQctIycS3XW/0vHjsGlVSfVXI9KFouDnj1rfEGXxVfVcZ7hmgL6+vDG8p6dNBUbeb9y84FH62wT4VyaBfoEk6+we6+oXpNrq5ObfmYtRHVFe7wHSz0mDFnm5ogkTKzcvPpqZWjtRD0xk1dksm7HLSL1KkhhqRmwOl6OcmHtKw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gLRWqm4P; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gLRWqm4P"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-84536e2857eso113280b3a.0
        for <linux-usb@vger.kernel.org>; Tue, 23 Jun 2026 09:11:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782231097; x=1782835897; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wAFwf8/CB3x/IMM6sy/hMiOP4TcKkclpq4tmZax049Y=;
        b=gLRWqm4PagbDBqJTMdIVELexqK/KzrdsUBgZSQioDYUHX5RrJd1GqyiZsTgSlEjYwH
         lW1Hj9s/7e9O/EfeikTMYT4m9UZnkyiuVJ8cuIZV2+S60Pc8FCr/liN1mJNob2Nux9y/
         DdnChEv0YNectSd8mDzAT3hLOuJ+tRzxXoIgG7tBtCgscYn/blni0yi1vvD78fbwmTfZ
         G8O5ZRaOKX3nc+DXy4xF1nrWCFxBfcgaqK9dFswi81/lPoDQvBFCvbD0SAXA0UVHA+wf
         339um8lMuCX3KnMDazRzHhQF7RbbGvdo4OSzuYTfbqZRgLrY08Fe/iWU28re4qsZt3g+
         b/RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782231097; x=1782835897;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wAFwf8/CB3x/IMM6sy/hMiOP4TcKkclpq4tmZax049Y=;
        b=GhihCfLbSx1tQeiggvw6mPPY2br3NGDEIXdP3UEPENGASHrdhzS25AgYw2Z1HpEK9r
         cJORc7q4fvTN57zvnYw30QEb5IzHWzbHC+8FZUkYTQyiYCPCSj1Ye/B5sjMTAU0oehWY
         QIeprVOMMfdaZ+Yo6TuY+ptlMFK32SWCVraiG5EOISfbR5O6wgGmfYR+z2JNJSxheJR4
         BroKKMO4kgskXJQAf1egMmHJyF6VQ5mihtXUm6HiGoC6FL09f6NXkHjjsO9u8ftY52cu
         XUBgCFXO2UaSi02FV7PjA30aC9KmJ6E9J4zC52xmtVdg5SFd+7BaT22O35GZHIZpbZoa
         lzmg==
X-Gm-Message-State: AOJu0YxCkr0+oOOsdfkeKGw6NKOW056Z/pRDDp4f1UEAlyCiRRASWF/A
	B0aAdTXGQUIwsPzD3H8QeKlaaABKcKaKVWwGaIHpDsmfJRPflbVNVieG
X-Gm-Gg: AfdE7ckPQzHO6zV9mnQmXLRgtDsgXcrCl2i5g9MNjMQympfNkgEaIXQjvKNAPrTf90v
	MBdxpwU48fU4XSJVOd7WGp5ygSZdApZm4x8N2pRKTMx8fE0o21JCE5Ps/7o+/rFtxRb1o4+5VEW
	2xlYiLFy4Z/ETHSG0CCm36mhJuibiq5N2i0+9pwJRgl51M/4J6RMmPDXLe1fgbfL349JQM4ArhS
	jirDfqMWfVtFo75naiJXWX7jGjAsVFbsHeDLxyYWgBYLFThBf0LXixVM3Wqs7gW+0AvCEY5UQF2
	bMQAN3iMf6b0G8W/5kdMCFVlo42ex017KFLgtjnuHJPJzmpGeKutiD6k4/qxW1xw3CKxCk8R0Zf
	mF2mVkCA2A/L5zzG0nLeE5dPe6odWpgs222/iIM1OEMuE5ig6OCQPo8AgDw1V3gDV3tgDLx6oXo
	5iaNbiH7pR6ljdMg5GQ3ZBZPf4D2c2dg==
X-Received: by 2002:a05:6a21:6010:b0:3aa:ec1c:84e5 with SMTP id adf61e73a8af0-3bb34c70756mr22581821637.43.1782231097148;
        Tue, 23 Jun 2026 09:11:37 -0700 (PDT)
Received: from ghost.localdomain ([2409:40c2:6046:3a5a:d63c:7e5c:918c:274d])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c8bc5a1d07csm10153841a12.24.2026.06.23.09.11.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jun 2026 09:11:36 -0700 (PDT)
Received: from ghost.localdomain (localhost [127.0.0.1])
	by ghost.localdomain (OpenSMTPD) with ESMTP id c03d682e;
	Tue, 23 Jun 2026 16:11:28 +0000 (UTC)
From: Nikhil Solanke <nikhilsolanke5@gmail.com>
To: linux-usb@vger.kernel.org
Cc: gregkh@linuxfoundation.org,
	linux-kernel@vger.kernel.org,
	stern@rowland.harvard.edu,
	michal.pecio@gmail.com,
	stable@vger.kernel.org,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	linux-doc@vger.kernel.org,
	Nikhil Solanke <nikhilsolanke5@gmail.com>
Subject: [PATCH v2] usbcore: Add quirk for 255-bytes initial config read
Date: Tue, 23 Jun 2026 21:40:35 +0530
Message-ID: <20260623161035.5792-1-nikhilsolanke5@gmail.com>
X-Mailer: git-send-email 2.54.0
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

So, add a new quirk flag USB_QUIRK_CONFIG_SIZE which causes
usb_get_configuration() to issue a 255 byte sized configuration request
instead of USB_DT_CONFIG_SIZE (9) for the initial
GET_DESCRIPTOR(CONFIGURATION) request, mimicking long-standing Windows
behavior.

Suggested-by: Alan Stern <stern@rowland.harvard.edu>
Suggested-by: Michal Pecio <michal.pecio@gmail.com>
Closes: https://lore.kernel.org/linux-usb/CAFgddh+JWdT4LLwMc5qjM8q_pBu-fRo2qADR5ovAKoGHWMQrRw@mail.gmail.com/
Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Cc: stable@vger.kernel.org

Signed-off-by: Nikhil Solanke <nikhilsolanke5@gmail.com>
---
Changes in v2:
- Add Documentation
- Naming changes
- Refactored to have a better flow with existing code.

 .../admin-guide/kernel-parameters.txt         |  9 +++
 drivers/usb/core/config.c                     | 61 ++++++++++++++-----
 drivers/usb/core/hub.c                        |  6 +-
 drivers/usb/core/quirks.c                     |  4 ++
 include/linux/usb/quirks.h                    |  3 +
 5 files changed, 67 insertions(+), 16 deletions(-)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index 97007f4f69d4..af4bf0ef2c7b 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -8158,6 +8158,15 @@ Kernel parameters
 				q = USB_QUIRK_FORCE_ONE_CONFIG (Device
 					claims zero configurations,
 					forcing to 1);
+                r = USB_QUIRK_WINDOWS_CONFIG_REQ_SIZE (Device
+                    fails during initialization when asked for
+                    9-bytes configuration desciptor request. Ask
+                    for 255-bytes request instead to mirror
+                    Windows' behavior. This quirk is originally
+                    meant to fix some quirky gamepads that refuse
+                    to connect in their XInput mode. But it can also
+                    potentially fix issues with other USB devices
+                    that work on Windows but not on Linux)
 			Example: quirks=0781:5580:bk,0a5c:5834:gij
 
 	usbhid.mousepoll=
diff --git a/drivers/usb/core/config.c b/drivers/usb/core/config.c
index 45e20c6d76c0..4fc3145404d6 100644
--- a/drivers/usb/core/config.c
+++ b/drivers/usb/core/config.c
@@ -19,6 +19,9 @@
 
 #define USB_MAXCONFIG			8	/* Arbitrary limit */
 
+/* config req size if USB_QUIRK_WINDOWS_CONFIG_REQ_SIZE is set */
+#define USB_CONFIG_WINDOWS_REQ_SIZE	255
+
 static int find_next_descriptor(unsigned char *buffer, int size,
     int dt1, int dt2, int *num_skipped)
 {
@@ -912,6 +915,13 @@ int usb_get_configuration(struct usb_device *dev)
 	unsigned char *bigbuffer;
 	struct usb_config_descriptor *desc;
 	int result;
+	/*
+	 * Devices with quirky firmware will stall or reset when asked only for
+	 * the configuration header. This variable decides which size to use in
+	 * that case, if the quirk for that device was set.
+	 */
+	size_t usb_config_req_size = (dev->quirks & USB_QUIRK_WINDOWS_CONFIG_REQ_SIZE)
+		? USB_CONFIG_WINDOWS_REQ_SIZE : USB_DT_CONFIG_SIZE;
 
 	if (ncfg > USB_MAXCONFIG) {
 		dev_notice(ddev, "too many configurations: %d, "
@@ -938,18 +948,27 @@ int usb_get_configuration(struct usb_device *dev)
 	if (!dev->rawdescriptors)
 		return -ENOMEM;
 
-	desc = kmalloc(USB_DT_CONFIG_SIZE, GFP_KERNEL);
+	desc = kmalloc(usb_config_req_size, GFP_KERNEL);
+
 	if (!desc)
 		return -ENOMEM;
 
 	for (cfgno = 0; cfgno < ncfg; cfgno++) {
-		/* We grab just the first descriptor so we know how long
-		 * the whole configuration is */
+
+		if (dev->quirks & USB_QUIRK_DELAY_INIT)
+			msleep(200);
+
+		/*
+		 * Grab just the first descriptor so we know how long the whole
+		 * configuration is. In case of quirky firmware, try to grab the
+		 * whole thing in one go by asking for a 255-bytes sized buffer
+		 * mirroring Windows behavior.
+		 */
 		result = usb_get_descriptor(dev, USB_DT_CONFIG, cfgno,
-		    desc, USB_DT_CONFIG_SIZE);
+						desc, usb_config_req_size);
 		if (result < 0) {
 			dev_err(ddev, "unable to read config index %d "
-			    "descriptor/%s: %d\n", cfgno, "start", result);
+				"descriptor/%s: %d\n", cfgno, "start", result);
 			if (result != -EPIPE)
 				goto err;
 			dev_notice(ddev, "chopping to %d config(s)\n", cfgno);
@@ -957,13 +976,25 @@ int usb_get_configuration(struct usb_device *dev)
 			break;
 		} else if (result < 4) {
 			dev_err(ddev, "config index %d descriptor too short "
-			    "(expected %i, got %i)\n", cfgno,
-			    USB_DT_CONFIG_SIZE, result);
+				"(asked for %zu, got %i, expected at least %i)\n",
+				cfgno, usb_config_req_size, result, 4);
 			result = -EINVAL;
 			goto err;
 		}
+
 		length = max_t(int, le16_to_cpu(desc->wTotalLength),
-		    USB_DT_CONFIG_SIZE);
+				USB_DT_CONFIG_SIZE);
+
+		/*
+		 * If the device returns the full length configuration
+		 * descriptor, skip the second read. Otherwise, send a second
+		 * request asking for the full length.
+		 */
+		if (result >= le16_to_cpu(desc->wTotalLength)) {
+			bigbuffer = (unsigned char *) desc;
+			desc = NULL;
+			goto store_and_parse;
+		}
 
 		/* Now that we know the length, get the whole thing */
 		bigbuffer = kmalloc(length, GFP_KERNEL);
@@ -972,23 +1003,25 @@ int usb_get_configuration(struct usb_device *dev)
 			goto err;
 		}
 
-		if (dev->quirks & USB_QUIRK_DELAY_INIT)
-			msleep(200);
-
 		result = usb_get_descriptor(dev, USB_DT_CONFIG, cfgno,
-		    bigbuffer, length);
+						bigbuffer, length);
+
 		if (result < 0) {
 			dev_err(ddev, "unable to read config index %d "
-			    "descriptor/%s\n", cfgno, "all");
+				"descriptor/%s\n", cfgno, "all");
 			kfree(bigbuffer);
 			goto err;
 		}
+
 		if (result < length) {
 			dev_notice(ddev, "config index %d descriptor too short "
-			    "(expected %i, got %i)\n", cfgno, length, result);
+				"(asked for %i, got %i)\n",
+				cfgno, length, result);
 			length = result;
 		}
 
+store_and_parse:
+		krealloc(bigbuffer, length, GFP_KERNEL);
 		dev->rawdescriptors[cfgno] = bigbuffer;
 
 		result = usb_parse_configuration(dev, cfgno,
diff --git a/drivers/usb/core/hub.c b/drivers/usb/core/hub.c
index 24960ba9caa9..9acd278666fc 100644
--- a/drivers/usb/core/hub.c
+++ b/drivers/usb/core/hub.c
@@ -2527,8 +2527,10 @@ static int usb_enumerate_device(struct usb_device *udev)
 		err = usb_get_configuration(udev);
 		if (err < 0) {
 			if (err != -ENODEV)
-				dev_err(&udev->dev, "can't read configurations, error %d\n",
-						err);
+				dev_err(&udev->dev, "can't read configurations, "
+					"for device %04x:%04x, error %d\n",
+					le16_to_cpu(udev->descriptor.idVendor),
+					le16_to_cpu(udev->descriptor.idProduct), err);
 			return err;
 		}
 	}
diff --git a/drivers/usb/core/quirks.c b/drivers/usb/core/quirks.c
index 87810eff974e..df670b0b66fe 100644
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


Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E942391E73
	for <linux-usb@vger.kernel.org>; Fri, 17 Jul 2026 19:54:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784318056; cv=none; b=WNvk8zMilfCfnIwnF4YEWLri9N5oT1sodQuUoHedpjEsK5RTf7J84MldyQmPQSmTTDareLwt4/dENqFaXbBpWYjQTFgcbNWZF2wkYpHc8C+7BgiyzRs7XbpobzljKOItt6q7TJFTC0FA3pn2E/vJd1ILLz/yliQML6SsrXGF/5A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784318056; c=relaxed/simple;
	bh=OovEX5j8oO9dt0RWb+VLsO7EVU4CwpJSCIQyuF/rK64=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=n/PhWEgqee5hoWgOi8MVXZJfLRg0lwkszpZ7IMWWyWBHBY5f5gHUpSf0B2LO1OM8U4zF+380jUcztgUmCeTyfMYtLMcRRGDrn8YRqH5d3eENBGkL1GEFtAiU5LxvvCPeJxjy4yhde2HCFiM0Muz6A3DD+XyjF6FpPUkSkBPh8PM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=j42IAOvK; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="j42IAOvK"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2ceaf8a1265so77963445ad.2
        for <linux-usb@vger.kernel.org>; Fri, 17 Jul 2026 12:54:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784318054; x=1784922854; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=V/QRLXFyC7iudgBp/aY0Qb4ATVQXu8Baj1/SfCLrVxo=;
        b=j42IAOvKxqnZj3n5K8PPiEyEA0/rceoW371CuW5G9lu3f/qPSxND06blwGg7s4FZbS
         EQaV2I4h1lKfnlVTC6EbUpi1Ktie8lvo7X2FmTAzBXdyfA0Yq6vrAZFVja0Hh6BKWx7P
         5S663aYfl0Gn90Nurqh0STxP6pjYiRs1MRAytFPo6mNSe4IH5YqZ5csFbO9YVZ3JkAfo
         D9h74oJehVUcMpmtW6/rqIB7zqcHridhd/4OnUGN1C4fpknbS59mMjhFwhIOhMRH7Pei
         k8stnFdnz47EhWaZnCPZ8+eaZT0rvXkJ4ZxAFsbDdCQv6MxPB3N9tS6Af1mHQZ4XU9wW
         IhJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784318054; x=1784922854;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=V/QRLXFyC7iudgBp/aY0Qb4ATVQXu8Baj1/SfCLrVxo=;
        b=n6MOHhCBF06h74DmRdc12IZgSYZR5TXGLdnJIdM12c6fH47nmhEfsgucWQ68yPgKwF
         34B9jb42OwsIAm00FMgvcwx4R5uqHk1GNmdN+L8oh+wjdEJIKv3NNgCBt7hZF7vEXEHZ
         aeGxj2BFT7c28BKlLIKcqvqvWZfXp2Z3mWOCOspGcKyGdn5X0YBaGQYrW8oFxZed5lBt
         8z38Kukcnh7K94rSWs/eln4AaDhnDpgoIdUsi0+nHJtAt6su0cZQaMOSnR/Ii5ivWM0m
         XPNYD5kYZzCOUH0ynC30JDI/cgJqvIOizjD2V0j8/1UsyGmKa3FQckYcO2GZ2spTCYI7
         2nMQ==
X-Gm-Message-State: AOJu0YyhJ62anbsg/0wqX75xUOFuPWffgEOYEFtAYoP1vRRBfY5on6Tn
	uMXHnVdjWEygwsI8oMp3k8USok21oIOwhSiTBAgkk9hLSHi5w6t1Ljjx
X-Gm-Gg: AfdE7cnOooxME3HnUQWN/pnAlPB0Z1oawC45Ql2yiqdI9zyN8uL3SSbmOU2xjo92H7A
	8ioocoXsyXmnQ6cMLMBgXIfJxuQCZ1my6OB1l4FucjXIp8u+sQnmQ7CySNAjdG70PQq/zLTdNqz
	Jgjt36irqu3pUWk4QzoDhzpv+DEYgZsIPzi/QBl3lCZcxvrdWkal60omv7+5edtxLMHZPZkDJBG
	Lr0PETWmfEGpKuGY7taIy78n1t7R8M9PFyImZ5tLjqeIm38eTTxnATM9GYolSGMwAYWQWAMyFdZ
	X/Q3fQt9qX5yL65xvvV0tlmlpaukMMZlYi/407TJCUaPAOHRzqI3Iv7YRi+c/MRgxXHJenJmIn9
	/Hq8EJwpA2Nk4YzaqiiqWLS+NCDuELw7y69V5ThfSXATjk6xagHDvQv2kaKUMAoPOE5YnFJQ3Np
	SrI8d9SKxFzF7foFiap0TepHtYUVGNvz051XmVEe6EMWy8uCibwHYwOwAbMsgp6gLfOZKPypeLr
	MDg
X-Received: by 2002:a17:903:3d0f:b0:2cf:477d:8a87 with SMTP id d9443c01a7336-2cf477d8f76mr5826235ad.10.1784318054611;
        Fri, 17 Jul 2026 12:54:14 -0700 (PDT)
Received: from ghost.localdomain ([103.170.252.7])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13ce29c2dcdsm7103119c88.1.2026.07.17.12.54.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2026 12:54:14 -0700 (PDT)
Received: from ghost.localdomain (ip6-localhost [::1])
	by ghost.localdomain (OpenSMTPD) with ESMTP id be1d25cf;
	Fri, 17 Jul 2026 19:54:03 +0000 (UTC)
From: Nikhil Solanke <nikhilsolanke5@gmail.com>
To: linux-usb@vger.kernel.org
Cc: gregkh@linuxfoundation.org,
	linux-kernel@vger.kernel.org,
	stern@rowland.harvard.edu,
	michal.pecio@gmail.com,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	linux-doc@vger.kernel.org,
	stable@vger.kernel.org,
	Nikhil Solanke <nikhilsolanke5@gmail.com>
Subject: [PATCH 2/2] USB: hub: Split announce_device() to log device identity before enumeration
Date: Sat, 18 Jul 2026 01:23:36 +0530
Message-ID: <20260717195336.98500-3-nikhilsolanke5@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260717195336.98500-1-nikhilsolanke5@gmail.com>
References: <20260717195336.98500-1-nikhilsolanke5@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

announce_device() currently logs the device VID:PID and string
descriptors only after successful enumeration. This means that if
enumeration fails, no identifying information about the device appears
in the kernel log, making it difficult to diagnose failures.

Split announce_device() into announce_device_ids(), which logs the
VID:PID and bcdDevice immediately after the device descriptor is read,
and announce_device_strings(), which logs the product, manufacturer,
and serial number strings after successful enumeration. This ensures
that a device's identity is always visible in the log regardless of
whether enumeration succeeds or fails.

Suggested-by: Michal Pecio <michal.pecio@gmail.com>
Signed-off-by: Nikhil Solanke <nikhilsolanke5@gmail.com>
---
 drivers/usb/core/hub.c | 16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/core/hub.c b/drivers/usb/core/hub.c
index 5262e11c12cd..d92bf887739d 100644
--- a/drivers/usb/core/hub.c
+++ b/drivers/usb/core/hub.c
@@ -2401,7 +2401,7 @@ static void show_string(struct usb_device *udev, char *id, char *string)
 	dev_info(&udev->dev, "%s: %s\n", id, string);
 }
 
-static void announce_device(struct usb_device *udev)
+static void announce_device_ids(struct usb_device *udev)
 {
 	u16 bcdDevice = le16_to_cpu(udev->descriptor.bcdDevice);
 
@@ -2410,6 +2410,10 @@ static void announce_device(struct usb_device *udev)
 		le16_to_cpu(udev->descriptor.idVendor),
 		le16_to_cpu(udev->descriptor.idProduct),
 		bcdDevice >> 8, bcdDevice & 0xff);
+}
+
+static void announce_device_strings(struct usb_device *udev)
+{
 	dev_info(&udev->dev,
 		"New USB device strings: Mfr=%d, Product=%d, SerialNumber=%d\n",
 		udev->descriptor.iManufacturer,
@@ -2420,7 +2424,8 @@ static void announce_device(struct usb_device *udev)
 	show_string(udev, "SerialNumber", udev->serial);
 }
 #else
-static inline void announce_device(struct usb_device *udev) { }
+static inline void announce_device_ids(struct usb_device *udev) { }
+static inline void announce_device_strings(struct usb_device *udev) { }
 #endif
 
 
@@ -2651,6 +2656,9 @@ int usb_new_device(struct usb_device *udev)
 		device_init_wakeup(&udev->dev, 0);
 	}
 
+	/* Announce the device identity */
+	announce_device_ids(udev);
+
 	/* Tell the runtime-PM framework the device is active */
 	pm_runtime_set_active(&udev->dev);
 	pm_runtime_get_noresume(&udev->dev);
@@ -2672,8 +2680,8 @@ int usb_new_device(struct usb_device *udev)
 	udev->dev.devt = MKDEV(USB_DEVICE_MAJOR,
 			(((udev->bus->busnum-1) * 128) + (udev->devnum-1)));
 
-	/* Tell the world! */
-	announce_device(udev);
+	/* Announce the device's product, manufacturer and serial number */
+	announce_device_strings(udev);
 
 	if (udev->serial)
 		add_device_randomness(udev->serial, strlen(udev->serial));
-- 
2.55.0


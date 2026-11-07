Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794019015;
	b=wm7SEDSIcufgHEGM3yOJs/cHI/PWOaPZYfBu77ZeIrtOstosfRWSUAR32/n6FNlf220Z
	 cOz2L0sKxParAypMNatuYGNZanw0j3GTANuScBzZujPIEFU2PNH3eI7yAcxoJxanrseIc
	 HqT/VTrA79zUG8AAV1i8UmMpAzC/hUxYs0zE2aV23Us3U/fnfRY3mrsI98/xJGtkf7xgS
	 3FiQ6pQoL4va93ogyXBWuHtk/1ZMV7MZsSSGZF+Ts3je4bL7gnO7Sg1/MAFkg+tD5OOGi
	 vQJi44k8lSNy+TOnMkuSXqVcpHIEVOoMKtZ/fHDJK/jP17Kn6ZTLrRDGgcAeYwxoiag==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794019015;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Dn3AqjSXpF37B635ypQSZqFBFcyclLjzRAmOQAMpPOk=;
	b=fqYn0OIbcL82+0wRx+80ZMnulDHwI6q+6JlRp9MiBdQnepnxhhWb6Hrwi29XuGaVOXMx
	 aaJrmOeQ9t5DeDfPj6xeKQ+Fukj4LPvoLio3acQ942n0hOc9k6NrbURlt9T4eWAO4iSaC
	 NqczNnvHxQI+t+8K0vLzs1ug+phSA5pMU+oQfYczG3j26EKdzf5FDO46BxkKXIWHpXbES
	 +J5Mpu2fRzAfMS/1ilV1ATIGjgWt4tYXGvRisl1vyAqQHMR6ZZJvlioooAHfga1tf90Sx
	 FFbZZWd2sUXqRA9V2T7KKz5hZfNKjoqkH6fWbxntsCs4vjFfB/8+2L15c+8iO5SmGYw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=jclark.com;
	spf=pass smtp.mailfrom=jclark.com;
	dkim=pass header.d=jclark-com.20260707.gappssmtp.com header.i=@jclark-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=X2ZOw9fw;
	arc=none smtp.remote-ip=74.125.82.172
Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39B23606A335
	for <linux-usb@vger.kernel.org>; Sat,  7 Nov 2026 02:36:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 39B23606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jclark.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jclark.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=jclark-com.20260707.gappssmtp.com header.i=@jclark-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=X2ZOw9fw
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-36a315ed211so267503eec.0
        for <linux-usb@vger.kernel.org>; Fri, 06 Nov 2026 18:36:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jclark-com.20260707.gappssmtp.com; s=20260707; t=1794019014; x=1794623814; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Dn3AqjSXpF37B635ypQSZqFBFcyclLjzRAmOQAMpPOk=;
        b=X2ZOw9fwHFA67uVlTAvdTMcF+/zT+VJIax05tROfyWOSitFsIK+FsOQw4b6faKCN6V
         ztW8RE2vLYPdcvL36TJCsKOqAcsuUkOCje3DVJ+WqvkJeqqkM5Un1lzqpyO95ydJbTDi
         Jmc3iuRofw20g0sv3UYRTx+lZw9OwDWn4U3+Q3LYp9kHBhSNZl31pyqrYGlz51BPy1gt
         ll+guHl71pSg3Ov0jP587mEjwTmtipAJiqt+AVImZxAR85f0XYcFAqqkTrBDGtDeWQyh
         4dXSujgANu7bGp63e3cvSU8BCI0BjNUqECQaVJ4Nd+ouo69htu+9O9T16C0e9z1rJjm2
         pgCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794019014; x=1794623814;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Dn3AqjSXpF37B635ypQSZqFBFcyclLjzRAmOQAMpPOk=;
        b=WCaXQiuPW7JYUFPzz3TqG6uY0T0SIuPZT5G6U94Saqu839vI3MjIEuMR43Ofu67IYA
         44DfZoQTffC3nz6QwPWwPnLCJ2hjn8+a3oNuDuZIfoV42DMdcHZzxRZv127eRaREbLe7
         S6JjGn/LCu3t3iOcBgxf4IEeodfO4BFEUJMejYvKSIqKBVhOTbB3zIC0pxlc9wJZcbUI
         6Qpmrwo3miDN85W6v+ZJ2pr6lGVB+C0jgc87QRqId18RrhxBmpB8zFUEi3wYFlymDnS2
         YRL0MfWFTCt+PvbQ7egXrZBeVlCyIpmVDrAGUk4x01XoD7gImOtdczQ93+MCyEq2dWzT
         q7ig==
X-Forwarded-Encrypted: i=1; AL+hErGEm0WGru4hfYQ9NgnyXebXPAhmhns0oQByGjJ8PhsZ5tN7lTz2XcAV5q3W85RF++rWOhMUkNTs/gA=@vger.kernel.org
X-Gm-Message-State: APuU4Z+6XQt3TB64CYmcJU3BnYel2O9xkxSb/kjzXkMOGdhwcLENVqvb
	7yF6mo23DSc0h5W+jxxW4Wc22+/Glilv0bPMWJwUkRqxJaS1ejVm0Xl2C7lAFUEIvA==
X-Gm-Gg: AYBFou0V82vBgYjEDGP4lqaajsf1WpLEXnQas3P0s4IRO5B1V6BJapOnrQgUn15vGEl
	Tf6ZDugruIXnOLiT5iwWYyKvFo+T448Vu/2JC9iIZklk/Co2B1WfLAHKpkc9wg67kZAclhMlRzt
	HgUOnoIkPkQo8UApFH5wxjnok4pvck/Nuo9kTKIZonSUvDS+llObSgGHOf/mFnUk5mLeTXDm+00
	aDZwVkMP2m6cYf3Tbw5g2/aQiHxfZtJS4BJGuy1QMLteS+qNaWZS8U/o8m8ZaNpwcCdgYZFbFme
	tVsZqyvJgOW6fkTL6rXM/tLDlfltYqKeUQthLKi/W7vUcGrtBBQOVD0H7UNGW2RmjP21cUElw0i
	wq5xezmnY1VCiWKXNByQqWSZKTyPd2Ta2qdZ1xbWmihq7TluURfvVTsu5NNR9SYk0NfAsqHjMS+
	TZcMwGka4RjHgbOBGvYKmSoHOZNrkEv9DQyzaVylCSGeltV8Ji+3wCQ1Lr4tKOEeyu4UpTaUDDM
	76V5Lp8ysDFD5uL0UXoiPK7Jd6sjN8bXgoerVvOI6HNDWOtaJi6vhfNxvyydI2MGsBxt8vmVxAf
	gdnu0mbCkxt2MOg4CWxKILV6CoFo3U/KkeuNkHXn/9L8MlREpqBYPlg8bXxgYS+BE5UIX9C5NJc
	Lfkfnhw4iVTHhNdYh4A==
X-Received: by 2002:a05:693c:69c8:b0:35e:af84:bf1e with SMTP id 5a478bee46e88-370f4c6234bmr1091383eec.7.1794019014061;
        Fri, 06 Nov 2026 18:36:54 -0800 (PST)
Received: from cantal.lan ([58.136.77.237])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36faa4b4680sm10421618eec.20.2026.11.06.18.36.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 18:36:53 -0800 (PST)
From: James Clark <jjc@jclark.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Alan Stern <stern@rowland.harvard.edu>,
	Matthias Kaehlcke <mka@chromium.org>
Cc: Johan Hovold <johan@kernel.org>,
	Bastien Nocera <hadess@hadess.net>,
	Arnd Bergmann <arnd@arndb.de>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	Douglas Anderson <dianders@chromium.org>,
	Robert Nelson <robertcnelson@gmail.com>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	regressions@lists.linux.dev
Subject: [PATCH v5 2/2] usb: misc: onboard_usb_dev: don't defer probing after the device is configured
Date: Sat,  7 Nov 2026 09:36:38 +0700
Message-ID: <e0e60a57c500ffbdb6addc268d41b7dcc4cf6c4a.1794018128.git.jjc@jclark.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <cover.1794018128.git.jjc@jclark.com>
References: <cover.1794018128.git.jjc@jclark.com>
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

onboard_usb_dev breaks the rule that a driver must not return
-EPROBE_DEFER from its probe after it has registered child devices (see
commit fbc35b45f9f6 ("Add documentation on meaning of -EPROBE_DEFER")).
Its USB device driver sets generic_subclass, so the generic probe runs
first and registers the device's interfaces. onboard_dev_usbdev_probe()
then returns -EPROBE_DEFER until the platform device for the onboard
device has probed. On the BeagleY-AI, this results in a probe loop,
which has broken booting since commit f918e3804498 ("arm64: enable
HAVE_SHARED_GPIOS for all ARM64 platforms").

Call the generic driver's operations from the driver itself instead of
relying on generic_subclass, so that the probe is deferred before the
device is configured. The device now stays unconfigured while the probe
is deferred, including when the platform device never probes. Before, it
was configured and unconfigured repeatedly until the platform device
probed.

Make onboard_dev_usbdev_match() not match a device when neither its
node nor its peer hub's node has a platform device, so that the generic
driver binds it instead. If the platform device goes away between match
and probe, return -ENODEV instead of -EINVAL, so that usb_probe_device()
falls back to the generic driver.

Fixes: 8bc063641ceb ("usb: misc: Add onboard_usb_hub driver")
Suggested-by: Johan Hovold <johan@kernel.org>
Signed-off-by: James Clark <jjc@jclark.com>
---
Changes in v5:
- Stopped matching a device when neither its node nor its peer hub's
  node has a platform device, so that the generic driver binds it
  (Sashiko)
- Split the platform device lookup out of _find_onboard_dev() into
  onboard_dev_find_pdev(), and dropped the "failed to find device node
  for peer hub" error
- Commit message: explained the -ENODEV

Changes in v4:
- Switched to calling the generic driver's operations instead of
  setting generic_subclass, replacing pre_probe in the USB core

 drivers/usb/misc/onboard_usb_dev.c | 67 +++++++++++++++++++++---------
 1 file changed, 48 insertions(+), 19 deletions(-)

diff --git a/drivers/usb/misc/onboard_usb_dev.c b/drivers/usb/misc/onboard_usb_dev.c
index c60406240416..299e39b55e73 100644
--- a/drivers/usb/misc/onboard_usb_dev.c
+++ b/drivers/usb/misc/onboard_usb_dev.c
@@ -576,6 +576,25 @@ static struct platform_driver onboard_dev_driver = {
 #define VENDOR_ID_VIA		0x2109
 #define VENDOR_ID_XMOS		0x20B1
 
+static struct platform_device *onboard_dev_find_pdev(struct device *dev)
+{
+	struct platform_device *pdev;
+	struct device_node *np;
+
+	pdev = of_find_device_by_node(dev->of_node);
+	if (pdev)
+		return pdev;
+
+	np = of_parse_phandle(dev->of_node, "peer-hub", 0);
+	if (!np)
+		return NULL;
+
+	pdev = of_find_device_by_node(np);
+	of_node_put(np);
+
+	return pdev;
+}
+
 /*
  * Returns the onboard_dev platform device that is associated with the USB
  * device passed as parameter.
@@ -583,23 +602,11 @@ static struct platform_driver onboard_dev_driver = {
 static struct onboard_dev *_find_onboard_dev(struct device *dev)
 {
 	struct platform_device *pdev;
-	struct device_node *np;
 	struct onboard_dev *onboard_dev;
 
-	pdev = of_find_device_by_node(dev->of_node);
-	if (!pdev) {
-		np = of_parse_phandle(dev->of_node, "peer-hub", 0);
-		if (!np) {
-			dev_err(dev, "failed to find device node for peer hub\n");
-			return ERR_PTR(-EINVAL);
-		}
-
-		pdev = of_find_device_by_node(np);
-		of_node_put(np);
-
-		if (!pdev)
-			return ERR_PTR(-ENODEV);
-	}
+	pdev = onboard_dev_find_pdev(dev);
+	if (!pdev)
+		return ERR_PTR(-ENODEV);
 
 	onboard_dev = dev_get_drvdata(&pdev->dev);
 	put_device(&pdev->dev);
@@ -619,8 +626,22 @@ static struct onboard_dev *_find_onboard_dev(struct device *dev)
 
 static bool onboard_dev_usbdev_match(struct usb_device *udev)
 {
-	/* Onboard devices using this driver must have a device tree node */
-	return !!udev->dev.of_node;
+	struct platform_device *pdev;
+
+	/*
+	 * Onboard devices using this driver must have a device tree node with
+	 * a platform device, its own or its peer hub's. Leave any other device
+	 * to the generic driver.
+	 */
+	if (!udev->dev.of_node)
+		return false;
+
+	pdev = onboard_dev_find_pdev(&udev->dev);
+	if (!pdev)
+		return false;
+
+	put_device(&pdev->dev);
+	return true;
 }
 
 static int onboard_dev_usbdev_probe(struct usb_device *udev)
@@ -639,7 +660,11 @@ static int onboard_dev_usbdev_probe(struct usb_device *udev)
 	if (err)
 		return err;
 
-	return 0;
+	err = usb_generic_driver_probe(udev);
+	if (err)
+		onboard_dev_remove_usbdev(onboard_dev, udev);
+
+	return err;
 }
 
 static void onboard_dev_usbdev_disconnect(struct usb_device *udev)
@@ -647,6 +672,7 @@ static void onboard_dev_usbdev_disconnect(struct usb_device *udev)
 	struct onboard_dev *onboard_dev = dev_get_drvdata(&udev->dev);
 
 	onboard_dev_remove_usbdev(onboard_dev, udev);
+	usb_generic_driver_disconnect(udev);
 }
 
 static const struct usb_device_id onboard_dev_id_table[] = {
@@ -697,7 +723,10 @@ static struct usb_device_driver onboard_dev_usbdev_driver = {
 	.match = onboard_dev_usbdev_match,
 	.probe = onboard_dev_usbdev_probe,
 	.disconnect = onboard_dev_usbdev_disconnect,
-	.generic_subclass = 1,
+#ifdef CONFIG_PM
+	.suspend = usb_generic_driver_suspend,
+	.resume = usb_generic_driver_resume,
+#endif
 	.supports_autosuspend =	1,
 	.id_table = onboard_dev_id_table,
 };
-- 
2.56.0


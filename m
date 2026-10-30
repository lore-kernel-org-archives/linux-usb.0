Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793360834;
	b=2eJL3gD6039ePrNAuXtonphJjXUwCNBXeIaOvP9rtb+49QUjmOJFQUo4pfIUtWqfFQ2V
	 KgXXQGviwlIkh38+n2EIpV8SDv1SzSKycWGcwGDWyY7wIoRqoC13b+EQ5EyLfYiHRDbG+
	 NHQPjqacFXszpEy7VmRZoAekRztblrSYM0o7iCYoP9JEh+DN1zWL/sFzEUy43znu65gf2
	 68FmIqo/59nXEz6JDH2BnQr1BMwjpojCUrRYEecPNKvHVCOAttfyxTbjD02DqAF+yCi/p
	 oi0gZDIs0K0heR9rYnKUbpY3MTUcVlfEF2PNq1tMooUurvkG0d+BokoEqFSLk9MG4Eg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793360834;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=nbz/Vjri7OOyBPqFDAm2yR3HQ9KSPqNqIywAM0GHwt8=;
	b=4WJx72NCRDH4OyEmV1ughPJV6YU6O5E3NH1/01o1l6Hp71obxH/ZSeSxmJznXNYVxVbB
	 7aI73k3icHJFInG1/pjzH/NP33NoZKqW3tSSiIKiz1FURsioSZlV6V9Dod06k0gMhyvJq
	 rDmGK1f4iI0lzS30e/+gKGzjpAZI3VNNj/xJb68siTNN9xIcx8ANH3C90DQ54IwCC+BQv
	 9W5Ne6oSeWA24Vt6NgO/k+Paz9XYzwIg4kAZeb4jTzhbZCILTj2+og/y0AddlXeMo7ZaO
	 1CugMDLsiZswE4qJnnIsRDBY3/ABb4Tii17bQXBnPdSUkS+EiSlUu3SioOl47yki4Hw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=jclark.com;
	spf=pass smtp.mailfrom=jclark.com;
	dkim=pass header.d=jclark-com.20260707.gappssmtp.com header.i=@jclark-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=me6KKni+;
	arc=none smtp.remote-ip=209.85.214.179
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6130606A31A
	for <linux-usb@vger.kernel.org>; Fri, 30 Oct 2026 11:47:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E6130606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jclark.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jclark.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=jclark-com.20260707.gappssmtp.com header.i=@jclark-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=me6KKni+
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2e9e53d011eso5425995ad.1
        for <linux-usb@vger.kernel.org>; Fri, 30 Oct 2026 04:47:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jclark-com.20260707.gappssmtp.com; s=20260707; t=1793360833; x=1793965633; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=nbz/Vjri7OOyBPqFDAm2yR3HQ9KSPqNqIywAM0GHwt8=;
        b=me6KKni+y5jQl0eqMOFJYUaWQNTL3kewbOTUsbbEjTCdl5uMB1oDszxhD86U2hYlSK
         z2avVrm6AuD8o3CqmMkj+k1MbFK6t+uwQPJoIpPE9zyi7ZU/vTIoqJoP1PtT2VFOx/VP
         dzG6l8AMKADqVDy3P/whtrlFdLss7qbPXIdYiuzEKG4CNTx33YhUmEdOmL+ICFiy4ato
         Jk1CFrzN9awcUfuezxTU8PTBejtkL7v5r39xmF23Ran7SDUZjKe8BCcW3PQVZUKwxazd
         +4C3ocx+lRSAvAzyxcCBCkS9lWFg8mKwyWMwLnMTV7015P17KI83v8jXFEZ81w6MC/C4
         Kgqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793360833; x=1793965633;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nbz/Vjri7OOyBPqFDAm2yR3HQ9KSPqNqIywAM0GHwt8=;
        b=AWwN1MSXXPg4A9z0tDN8S3KrUDm30FJEl9FxwOkhaoVoNc9ev+QwWjJMJ54h7qSBlP
         432v4VkXCYEEBEq7yK1hRt2LxFog/2P5UCBbODs/xekEJ2E35vypqtWgDNf9teim198o
         m2gQbKSs0Z4EXYlynf/1uq4RupKgQJFeA7byLDsMKSVAu9qscT2PuPRhjE/S5VnFQr17
         SmLHpJUcvhVrKX0/pwrsmkUxcLr33CUt4t/a+D3u6HCB94ckPeB2/6Mmd7ds8fGrAx6z
         PPrEQvzp1f0Kd12WbANFlrk9nvgVs7rh+TC3mQOqm4MQHM/nj2J2QqmFmLbPZLZwn/8i
         3i1Q==
X-Gm-Message-State: AFq9FYKigRNuhyn78Vsf0c4XNrnIDbmSgpEXY8xbzGSnBBg8b82ogZak
	G6vG9HkjcZ5nFkcNc5ITCmz8iSTNUixzKiXSVeBrMv5lgmKAsmon8YpxRTd84Jjgpw==
X-Gm-Gg: AYBFou19M78FU7lmeqsf/qGkHHFyyJCxN93MFggwJlOb6ZfIYi/zusniRg1ny5JnTsq
	Qfk1feUVvF4DzISz20B75tRQC+w7STF9nrOFdjbLv4YW4MDnwfFUzZqXHpT6peh4t5ZLZBbJmVt
	H1HyrVBOBmIInDhs/w40FaX42OeS4ddKzgjs3JYIa6HYan1e3Vrk8mOnXa0AxrDFoQx1ZQ74w/5
	aSkGlIiIamO4OAnH9CyUY1KdUM5anCCSf5W7pZVptFgdpUWOpD17gOt9fa1K3kxBhAgN7ZP78IZ
	Asluu9EeITcvs6ADErUtc6SzyIPiM0SCBGIYDH0VQUzUbRKpGD6TBddtBWKQiftx71u4kuWLvsH
	j7KRf7pWsAj986FT7TSTiJGbIJYF7T25LyfcjBRMyENWX/H4tulcI3WHXb3X/G0hVrMdCCWiCZ6
	uBH1FerSkqvgSoKG7a8arKk/GNfJ7X47snLk1XAEWN2NMm5EUw2WyyENIglZoOx5VBb3J9lLNk0
	AVvpdUGSzjQ4c+cmxlA8b/8AwWzdGOCrrYgnTiqQinLPH/pTkkq0k3NsvIQ4U7DhaPMyy901mip
	eHpl9T7u3iJtY7K7+5GmfyaN8tb9MavtsNOWE2a98xoPIXlEE6tmg17NmGdWfEFOyWn8lrgvdGF
	oRWqMwZJ7TzG8TU9y
X-Received: by 2002:a17:903:124a:b0:2cc:6018:f030 with SMTP id d9443c01a7336-2eb36495fe9mr21504985ad.14.1793360832911;
        Fri, 30 Oct 2026 04:47:12 -0700 (PDT)
Received: from cantal.lan ([58.136.77.93])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eb392ba7d3sm6025725ad.75.2026.10.30.04.47.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 04:47:11 -0700 (PDT)
From: James Clark <jjc@jclark.com>
To: Matthias Kaehlcke <mka@chromium.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Douglas Anderson <dianders@chromium.org>,
	Ravi Chandra Sadineni <ravisadineni@chromium.org>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	Arnd Bergmann <arnd@arndb.de>,
	linux-gpio@vger.kernel.org,
	regressions@lists.linux.dev
Subject: [PATCH] usb: misc: onboard_usb_dev: don't defer the USB device probe
Date: Fri, 30 Oct 2026 18:47:05 +0700
Message-ID: <20261030114705.3159093-1-jjc@jclark.com>
X-Mailer: git-send-email 2.56.0
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

On a BeagleY-AI with BeagleBoard's device tree, kernels since commit
f918e3804498 ("arm64: enable HAVE_SHARED_GPIOS for all ARM64 platforms")
no longer boot to a usable system. The log repeats "hub 1-1:1.0: USB hub
found" for the on-board TUSB8041 hub every few milliseconds, with no USB
disconnect in between. The flood of uevents stalls udev and the boot ends
in emergency mode. Reverting that commit makes the board boot normally
again.

The underlying problem is in onboard_usb_dev. Both peer hub nodes in this
device tree carry the same reset-gpios, so the GPIO is now a shared one,
and with CONFIG_GPIO_SHARED_PROXY=m (the default) the hub's platform
probe is legitimately deferred until udev has loaded that module. The
bootloader leaves the hub running, so the USB core enumerates it long
before, and the USB device probe finds the platform device without
driver data.

At that point, onboard_dev_usbdev_probe() returns -EPROBE_DEFER. This is
what causes the problem. The driver has generic_subclass set, so
usb_probe_device() has already run the generic probe, which configured
the device and bound the interface drivers. Each binding is a
deferred-probe trigger, and the driver core re-triggers when a trigger
happened during a probe that then deferred. So the device is re-probed
straight away, reconfigured, its interfaces bound again, and so on for
as long as the platform device remains unbound. This is not specific to
shared GPIOs: it happens whenever the platform probe is deferred, and
briefly whenever onboard_usb_dev is a module.

Bind to the USB device anyway, with NULL drvdata. When the platform
probe finishes, it already schedules attach_usb_driver_work to
re-attach the USB driver; extend it to also walk the USB devices and
attach the ones that are bound to this driver but have no drvdata. This
ensures the USB device always has a driver.

It doesn't work to return -ENXIO: the driver core takes this as the
driver declining the device, but the device is then left without a
driver, and a device without a driver can't be resumed once it has
autosuspended, which a hub with empty ports does right away. Nor does
it work to return -ENODEV: the USB core then binds the generic driver,
and driver_attach() doesn't rebind a device that already has one.

With this change the BeagleY-AI boots normally with that commit in
place.

Fixes: 8bc063641ceb ("usb: misc: Add onboard_usb_hub driver")
Cc: stable@vger.kernel.org
Signed-off-by: James Clark <jjc@jclark.com>
---
I found this by booting commit 85b4bc79dde7 (net/main during the 7.4
merge window) on a BeagleY-AI with BeagleBoard's device tree. A coding
agent identified the problem, explained it to me and proposed an initial
fix, which was revised multiple times on the basis of local Sashiko
reviews. I verified that the patch fixed the problem on top of commit
d89e1d186ec9.

On this board the platform probe asserts the hub's reset line, so the
hubs re-enumerate and are probed with the platform device already
bound. The path where attach_usb_driver_work adopts a USB device that
was bound with NULL drvdata has therefore not been exercised. It needs a
board whose platform probe does not reset the hub.

#regzbot introduced: f918e3804498

 drivers/usb/misc/onboard_usb_dev.c | 76 ++++++++++++++++++++++++++----
 1 file changed, 67 insertions(+), 9 deletions(-)

diff --git a/drivers/usb/misc/onboard_usb_dev.c b/drivers/usb/misc/onboard_usb_dev.c
index c60406240416..aac4e29c8233 100644
--- a/drivers/usb/misc/onboard_usb_dev.c
+++ b/drivers/usb/misc/onboard_usb_dev.c
@@ -43,6 +43,7 @@
 #define USB5744_CREG_BYPASS_UDC_SUSPEND		BIT(3)
 
 static void onboard_dev_attach_usb_driver(struct work_struct *work);
+static struct onboard_dev *_find_onboard_dev(struct device *dev);
 
 static struct usb_device_driver onboard_dev_usbdev_driver;
 static DECLARE_WORK(attach_usb_driver_work, onboard_dev_attach_usb_driver);
@@ -301,6 +302,47 @@ static const struct attribute_group onboard_dev_group = {
 __ATTRIBUTE_GROUPS(onboard_dev);
 
 
+/*
+ * Attach a USB device that was bound by onboard_dev_usbdev_probe() while its
+ * platform device was still unbound. The device lock serialises this with
+ * the probe and with an unbind. This walks the USB bus, not the driver's
+ * device list: unbinding a device holds its lock while it waits for all
+ * references to its node on the driver's list to be dropped, so an iterator
+ * over that list that takes the device lock would deadlock with it.
+ */
+static int onboard_dev_attach_usbdev(struct usb_device *udev, void *data)
+{
+	struct device *dev = &udev->dev;
+	struct onboard_dev *onboard_dev;
+	int err;
+
+	/* Unlocked pre-check, so as not to wait for every USB device's lock. */
+	if (READ_ONCE(dev->driver) != &onboard_dev_usbdev_driver.driver)
+		return 0;
+
+	device_lock(dev);
+
+	if (dev->driver != &onboard_dev_usbdev_driver.driver ||
+	    dev_get_drvdata(dev))
+		goto out;
+
+	onboard_dev = _find_onboard_dev(dev);
+	if (IS_ERR_OR_NULL(onboard_dev))
+		goto out;
+
+	err = onboard_dev_add_usbdev(onboard_dev, udev);
+	if (err)
+		dev_err(dev, "failed to attach to %s: %pe\n",
+			dev_name(onboard_dev->dev), ERR_PTR(err));
+	else
+		dev_set_drvdata(dev, onboard_dev);
+
+out:
+	device_unlock(dev);
+
+	return 0;
+}
+
 static void onboard_dev_attach_usb_driver(struct work_struct *work)
 {
 	int err;
@@ -308,6 +350,8 @@ static void onboard_dev_attach_usb_driver(struct work_struct *work)
 	err = driver_attach(&onboard_dev_usbdev_driver.driver);
 	if (err)
 		pr_err("Failed to attach USB driver: %pe\n", ERR_PTR(err));
+
+	usb_for_each_dev(NULL, onboard_dev_attach_usbdev);
 }
 
 #if IS_ENABLED(CONFIG_USB_ONBOARD_DEV_USB5744)
@@ -497,7 +541,10 @@ static int onboard_dev_probe(struct platform_device *pdev)
 	/*
 	 * The USB driver might have been detached from the USB devices by
 	 * onboard_dev_remove() (e.g. through an 'unbind' by userspace),
-	 * make sure to re-attach it if needed.
+	 * make sure to re-attach it if needed. The work also attaches USB
+	 * devices that were probed while this platform device was still
+	 * unbound (e.g. because this probe was deferred), see
+	 * onboard_dev_usbdev_probe().
 	 *
 	 * This needs to be done deferred to avoid self-deadlocks on systems
 	 * with nested onboard hubs.
@@ -606,14 +653,9 @@ static struct onboard_dev *_find_onboard_dev(struct device *dev)
 
 	/*
 	 * The presence of drvdata indicates that the platform driver finished
-	 * probing. This handles the case where (conceivably) we could be
-	 * running at the exact same time as the platform driver's probe. If
-	 * we detect the race we request probe deferral and we'll come back and
-	 * try again.
+	 * probing. Without it the USB device can't be attached to the platform
+	 * device yet; return NULL and let the caller decide what to do.
 	 */
-	if (!onboard_dev)
-		return ERR_PTR(-EPROBE_DEFER);
-
 	return onboard_dev;
 }
 
@@ -635,6 +677,21 @@ static int onboard_dev_usbdev_probe(struct usb_device *udev)
 
 	dev_set_drvdata(dev, onboard_dev);
 
+	/*
+	 * The platform device may not be bound yet (e.g. because its probe
+	 * was deferred). Bind to the USB device anyway, with NULL drvdata,
+	 * and let the platform driver attach it once it has probed (see
+	 * attach_usb_driver_work). Requesting probe deferral here wouldn't
+	 * work: the generic probe has already bound the interface drivers,
+	 * which triggers deferred probing, so the device would be re-probed
+	 * in a loop until the platform device is bound. Returning -ENXIO
+	 * doesn't work either: the device is then left without a driver and
+	 * can't be resumed once it has autosuspended. Returning -ENODEV
+	 * hands it to the generic driver for good.
+	 */
+	if (!onboard_dev)
+		return 0;
+
 	err = onboard_dev_add_usbdev(onboard_dev, udev);
 	if (err)
 		return err;
@@ -646,7 +703,8 @@ static void onboard_dev_usbdev_disconnect(struct usb_device *udev)
 {
 	struct onboard_dev *onboard_dev = dev_get_drvdata(&udev->dev);
 
-	onboard_dev_remove_usbdev(onboard_dev, udev);
+	if (onboard_dev)
+		onboard_dev_remove_usbdev(onboard_dev, udev);
 }
 
 static const struct usb_device_id onboard_dev_id_table[] = {

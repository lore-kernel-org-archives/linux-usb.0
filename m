Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793945586;
	b=ysd3RQkXljS2K+DYTY9ZooWO0LEi0DvMh4B+euhFTjrqF42f68QBJSRHTdd27Cl4vvN+
	 u/evI90Sg0xCJpHtPZCSgh1lp4j9I9sx94+EPGIGEibuCltBUjTn+rZyNlLmgQAq4xZ3J
	 sWZvXYEgVgi/3fiqxU5Vt+nhsEn4YQnaDPVvb08/Zu8rFIccf7BllvCBCYPhM9nNXI1ll
	 /Lay45Pi3FINV9W4ODkNqZecUL1J5rboR5IMuLN3AIWNnZieebCaGhftz5qMHKPXT5RKO
	 KrQrTyibVEjDSH39fdfI4d+jY5VeUMt0XP2rOPefSBNaYwFiOQ8ajMC7W5a+bhvFDNA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793945586;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=ydVqyV0aRoJDaWfDPtWBdic6N/4Yozo7V/PmjjVO7QY=;
	b=0hOmBtJEBJELYWFwhyFjBZaSfccjs7/NeYLlawx2ubCXKq56v9BtiRdVR4AVirH+W84r
	 /ZISEAE/VpuJ7eeV7lgf0r3HmHHsBIghJqrK8oP0pFLSB5bAeqv82NtBxQ/yiNdGennzj
	 bZ0mc6qTr7P9yJiecQIj5plevmZYu4o5UnJp9b7XCxy1BcSpb2X19nPF9X2NmKURIXPQ4
	 TnZWPSsYWLgBbqbrZL+Qwh8oAavpWj1kKsw/MQpdzHmNcfb/xSf0jlOrlDOgzauLDvLKi
	 GWpSlKDXJexsm/j4efhcS4Irh5nuilYq0urbwI73CeK0XT/5bDsVJxwEDmgJPswlBiA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=jclark.com;
	spf=pass smtp.mailfrom=jclark.com;
	dkim=pass header.d=jclark-com.20260707.gappssmtp.com header.i=@jclark-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=QCLPKEfN;
	arc=none smtp.remote-ip=74.125.82.174
Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A205606A336
	for <linux-usb@vger.kernel.org>; Fri,  6 Nov 2026 06:13:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8A205606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jclark.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jclark.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=jclark-com.20260707.gappssmtp.com header.i=@jclark-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=QCLPKEfN
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-36eb1cb7aabso424152eec.0
        for <linux-usb@vger.kernel.org>; Thu, 05 Nov 2026 22:13:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jclark-com.20260707.gappssmtp.com; s=20260707; t=1793945586; x=1794550386; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ydVqyV0aRoJDaWfDPtWBdic6N/4Yozo7V/PmjjVO7QY=;
        b=QCLPKEfNFBTyIMCl1dj2v+zqSSbSLitFj4Xi7Nv0VJYbPr59+g6B5LTulPqi0lF+La
         Tj4swyU3Cti/Jt+xOGFYd52pn1ZiUBI2ooWFEu8x42hqm26flSJQczxH8972SA+lXgHA
         +Xgvw6ywBlIJNpNNGftYSzaKamiFQ0YlM7IkawmKRcPCy0HPFFQ+p37NLZEXA8rp7DXk
         YLmmDkS2S98RZE2y58OlrVemb6l+VXAfHHQlQpELuR2EeCdMxmfHINL24ahOk/lfqPeN
         KLixePl2FM42xXWyItpU+ltPQLk/MTX9/GFk0kkF5KJ5zKtyIl1AP2EVjj0m8QK7hd6C
         WEQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793945586; x=1794550386;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ydVqyV0aRoJDaWfDPtWBdic6N/4Yozo7V/PmjjVO7QY=;
        b=MYl+O+AeloxCQBB5us/nl4KjGxrX3AND1M2zK53S/Yze3SmBUq4l/7Z4K1I0ilwQoj
         shf+Jfk2X50alF29XsoI1pmYXAI+aEqQKmTfbRBsa9MoA0mmq1wfLHbebmScLSR+yiBC
         O+Sctll/su9UArNWeS08Yde0/RMDESR0fcfzqkQXdihfZ2dXHhxlvqUd8UM8tSQCc1nX
         4DDxk38rjT5fQFxIUclj5LGUKiTFoCH+ELXppknFHltOrFUjshf9/zNZ+LfFpi6LTHrr
         L6EUtU+AphkLWBFKjHX63WvDh8OOcESRx1F7QhIlaazrVGvDZv9gBUrw/orDHD7F6HUX
         gYaw==
X-Forwarded-Encrypted: i=1; AKwUvBzBw5qhd7IiGLP3obIFPlgDCTyR42ZG8jGrNdDad2ap/HldhbDP6+9NznXEyKnvlOrYl+O7Tv2mRxE=@vger.kernel.org
X-Gm-Message-State: APuU4Z+gJeOhqdHXtZkxkuevnijZxfBhxd4CDTa0sM/k9Qa8EK54yABu
	vpgRHv86A1WO8bWtgI32MY3L1ZwxItwm/71miuvCwIr/hlB5wO+hwImKFp2T8UpPYA==
X-Gm-Gg: AYBFou0P8nPLZv3pCkdKvfF65mKUHNGWTI9V8n89RgVAEYyezrxWD/qpmD1Sco+mdPF
	FxxeS/SDEp84/pnXTH2AJPY5FJEznlrm+3I8+D8vIrFqkX/AZl6115sxvlJxSwEVnNEX/qYSL5a
	jCrmZtbd0CJVDN1n+yROFif1eeywmbMi4rdHWvatVZwtXt32qDmik5oqAa8cMmgb2Nz1xHL49W0
	/W0JHHeIIl7WrRmEfAWP0GiilCEbSGndPsDOYpv9NtXcbsqfnG5ao3+LFVonGpDk69axy2N3LZN
	TmwKaod0xKnJkbEiiV7ThsiBf1OAqN2wMi61MqoPu0KMgDEjCYbPkAjv1/HM5k5sBOCiWoQC8t3
	3XSujmZA3jumNutz4Rpchx1byBcTtOz3IaeWD1RXVXywnQ64Bmey74h/u8+LwS4K16GTW+AGfQQ
	vFUAAABqeKsDyLY6L+faXPGqGYAwwXiDUWDZGJ56ry7BRgpf4SbHOad78Xde60qIZSXSee50F6W
	ywnhPYPgrnPZY+VcHkti+P5M5pL1ZC6fa1sfzfBMaJ4MjDvlD9l6LsCoXh1RlC4E8PFaiSuvabX
	yLVYGJcNAZKOL3mu2153efD4EaVaSPygnjVDXozAA5QQGKk6Ecm01oVKzOW+/ErdYiZltHoqOHP
	hluzytVHUa5nZBstN0Q==
X-Received: by 2002:a05:693c:8843:b0:36f:6d81:3fa6 with SMTP id 5a478bee46e88-36f75443270mr2213138eec.6.1793945585471;
        Thu, 05 Nov 2026 22:13:05 -0800 (PST)
Received: from cantal.lan ([58.136.77.237])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36fa922c6c7sm3755879eec.10.2026.11.05.22.13.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 22:13:05 -0800 (PST)
From: James Clark <jjc@jclark.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Alan Stern <stern@rowland.harvard.edu>
Cc: Johan Hovold <johan@kernel.org>,
	Bastien Nocera <hadess@hadess.net>,
	Matthias Kaehlcke <mka@chromium.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	Douglas Anderson <dianders@chromium.org>,
	Robert Nelson <robertcnelson@gmail.com>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	regressions@lists.linux.dev
Subject: [PATCH v4 2/2] usb: misc: onboard_usb_dev: don't defer probing after the device is configured
Date: Fri,  6 Nov 2026 13:12:51 +0700
Message-ID: <f24b025cde0c3af37a958042d9deb96ae4494994.1793941292.git.jjc@jclark.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <cover.1793941292.git.jjc@jclark.com>
References: <cover.1793941292.git.jjc@jclark.com>
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
-EPROBE_DEFER from its probe after it has registered child devices,
because that causes a probe loop (see commit fbc35b45f9f6 ("Add
documentation on meaning of -EPROBE_DEFER")). Its USB device driver
sets generic_subclass, so the generic probe runs first and registers
the device's interfaces. onboard_dev_usbdev_probe() then returns
-EPROBE_DEFER until the platform device for the onboard device has
probed. On a BeagleY-AI, the resulting loop has broken booting since
commit f918e3804498 ("arm64: enable HAVE_SHARED_GPIOS for all ARM64
platforms").

Call the generic driver's operations from the driver itself instead of
relying on generic_subclass.

When the device's node has neither a platform device nor a peer hub,
return -ENODEV instead of -EINVAL, so that the device is still
configured. The device now stays unconfigured while the probe is
deferred.

Fixes: 8bc063641ceb ("usb: misc: Add onboard_usb_hub driver")
Suggested-by: Johan Hovold <johan@kernel.org>
Signed-off-by: James Clark <jjc@jclark.com>
---
 drivers/usb/misc/onboard_usb_dev.c | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/misc/onboard_usb_dev.c b/drivers/usb/misc/onboard_usb_dev.c
index c60406240416..51985e3473ad 100644
--- a/drivers/usb/misc/onboard_usb_dev.c
+++ b/drivers/usb/misc/onboard_usb_dev.c
@@ -591,7 +591,7 @@ static struct onboard_dev *_find_onboard_dev(struct device *dev)
 		np = of_parse_phandle(dev->of_node, "peer-hub", 0);
 		if (!np) {
 			dev_err(dev, "failed to find device node for peer hub\n");
-			return ERR_PTR(-EINVAL);
+			return ERR_PTR(-ENODEV);
 		}
 
 		pdev = of_find_device_by_node(np);
@@ -639,7 +639,11 @@ static int onboard_dev_usbdev_probe(struct usb_device *udev)
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
@@ -647,6 +651,7 @@ static void onboard_dev_usbdev_disconnect(struct usb_device *udev)
 	struct onboard_dev *onboard_dev = dev_get_drvdata(&udev->dev);
 
 	onboard_dev_remove_usbdev(onboard_dev, udev);
+	usb_generic_driver_disconnect(udev);
 }
 
 static const struct usb_device_id onboard_dev_id_table[] = {
@@ -697,7 +702,10 @@ static struct usb_device_driver onboard_dev_usbdev_driver = {
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


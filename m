Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DA0A39A7E0
	for <linux-usb@vger.kernel.org>; Sun, 18 Oct 2026 03:17:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792293432; cv=none; b=Xz8ZAA7DTza7XcT/B1C+Y9akwW1pTIycJhLqIJa8KcX19qRpRd4CEHYvs355sYTSIvjnpjXX5VVrni1GHX8eIRB1p/XM95uQRwm3SwWMl7Tvx87S4IsX0X1Vsppx7UEY07ZA6q3L3CCRAxrMU31SSUPwSQOZmNpnCzksDblI6Sw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792293432; c=relaxed/simple;
	bh=M/ePt7/U6Z/+EQ9IoyhoFmwghwbLF6fwPZWbqDxG7UY=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=MlqmiiUtCT2MOZvPoPAFLaHKHrL3CVxMXKm199EBGLZZ11TbyxZ76eUyNTeF5o8BPxIzXH5mJSdlazeohKR+E3SWGNd/YY7sWYhY3+Y7+6Jq1qSK10oaEljgNWE01IznEq0+fED1FV+UU78P9KfHPbi12t3Wx7HzFZ9dETglwZo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FtUex8dj; arc=none smtp.client-ip=209.85.219.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FtUex8dj"
Received: by mail-qv1-f43.google.com with SMTP id 6a1803df08f44-91befbcad6dso4563366d6.3
        for <linux-usb@vger.kernel.org>; Sat, 17 Oct 2026 20:17:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792293430; x=1792898230; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:content-type:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8TbMma2hCgHlI583VdajsztpYXQFI08NX68+gXwkEaE=;
        b=FtUex8djQFaREvcrP2G7uO8ACMLPi28pWUIpeq3VpZ15M902V1qxFOTVtoyHeVBArj
         l2sehH+my5YNa3TorPYxQ2g/y4K4qiDCYx018QJn6rGf6DwsjAn3rbBAj/9M8LXFURpN
         GoCGdAfWgS7CGlSg59CgH2YhWR/T5ezFkRXLmXq7o+CqvuiN8osayLTWlH7K8hYjrHgb
         WTFIkILdwsZG9wk42/0vs2Wa6unC2Va0W5k136NwnOP/9+YL2tc9s+SXyJV9qdAqZ33M
         sc+ECAWKhHjH7owbjfUjw5a6rv7fNuB2HUyAMTB8ZhDQ1xRq01njNv9ELzgbpB1csRU6
         jGBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792293430; x=1792898230;
        h=content-transfer-encoding:mime-version:content-type:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=8TbMma2hCgHlI583VdajsztpYXQFI08NX68+gXwkEaE=;
        b=CbYZ8so4qzkfPm99/Mu+WKjh/Wx8Si1QHl/Om5i+csIh19IqYTMS276ZDf4cYZJp+M
         VwHf6w/RXQui1F+zrHYVkc9qRHjiWKjSWhRIf5Uj43e+Ktp+qm3bHbONM3PxY0Q1Cfi4
         iYDWRFB+L0k2JlYhKHGFBR48pC1eYtglh/GbyGX5cwF0qeMDRs3SoiT6c5KNmHNuDMDa
         Cv+/1J8H8v0VrkxJugFU6FUR5YrfWm7g0ZsWk50mMCnQygsR17tTCsV3HsIV1RStQS48
         D8FYM0CvSHR3L9QlHi46BC4JXba4Zfr8nN6HawRmXUPysMgs2mOwPPu9DFqObWjrTUmP
         PDRw==
X-Gm-Message-State: AFq9FYKvnIvX99wlCiroipoFKT4wAQrIIrgAmtB3YicwBx/vsIKxzrEs
	8ZdsRqIffTzUoT1ikt627IoidiB9t55lWU68/yDdn9bmLJcKlA+wKBw=
X-Gm-Gg: AYBFou1vBMVMyYAPlMbwf2MotBAJ/bbhNS3IrQ5q68GIA+zcxREwpjQZOyB3i+BGk8v
	h3dzDDjKghgg3grP8VkFcTfHtodsg4uHC5UDU7cYKyLE/Sjooyzxz4+OAkFuCYxjHV6kJoUxpJW
	spjiGEBbgWicu9P5vsUb0KnjmTmPmzsO2IkgppDYsxu5mdhJBx06eJF+Pcj102ygOGQmXny8esX
	PCtOmo8H1WdwW9z7yZzZwQSuIlE3X3HpyIysGyntiIiHA5wJMM3Ht1B9EItEoniGUkOLkECkUOM
	8mpvr+n/bUmg4RoxGH3JA/PSTi6CgSW7l/6mSpyP9v29iiG15dXa4/2iwgVSf7Q+WQJNLZNeSe8
	Tll9zM2nJZgxpwyb2hgmOo0qiZflUaXCMVg7t+ufhbkjpZJfr6OEC+BYYb9T8RzY3wktmF9EwvW
	CLKr4iKMA8AVzPl/v3otdpQvIIOILTtWjLK92lMpj7KDmUZ2OK3KsWtBeYC0A4XRZ5Q2VVOGJ4M
	Z6aruow52tputguwvUNCSOsYKPDpH8wX8IpUFrdLcZpI4CmKQCrHrT2YebbPiWNZGbzHcPxPys6
	EOVmR1QNXtTxS4kRuniv9HXmBhd8
X-Received: by 2002:a05:620a:4042:b0:93e:fa30:f1ef with SMTP id af79cd13be357-93f29dc4771mr744477085a.67.1792293429834;
        Sat, 17 Oct 2026 20:17:09 -0700 (PDT)
Received: from i4-gl-tmk5904-1.ad.psu.edu ([130.203.156.90])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93f1a0cf974sm611181385a.1.2026.10.17.20.17.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 20:17:09 -0700 (PDT)
From: Myeonghun Pak <mhun512@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ijae Kim <ae878000@gmail.com>
Subject: [PATCH] usb: phy: gpio-vbus: disable VBUS work during removal
Date: Sat, 17 Oct 2026 23:17:06 -0400
Message-ID: <179229341073.3942822.17212567068599854952.gpio-vbus@gmail.com>
X-Mailer: git-send-email 2.53.0
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Legacy users such as PXA UDC obtain this PHY through usb_get_phy(),
which does not create a supplier device link. A sysfs unbind of the PHY
can therefore run while the gadget consumer remains bound.

The VBUS IRQ remains registered until devres cleanup, after
gpio_vbus_remove() returns. With the gadget still registered, an IRQ
after cancel_delayed_work_sync() returns can queue another instance of
the delayed work. The 100 ms delay lets devres release the GPIO, OTG and
driver state before that instance runs.

Disable and drain the delayed work during removal so late IRQs cannot
queue it again. This also rejects work queued by set_peripheral(), which
calls the IRQ handler directly. The managed IRQ is released before the
GPIO and driver state accessed by its handler are freed.

This issue was identified as part of our ongoing research while
reviewing kernel code.

Fixes: c2344f13b59e ("USB: gpio_vbus: add delayed vbus_session calls")
Co-developed-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Myeonghun Pak <mhun512@gmail.com>

---
Compile-tested with Clang, W=1. No hardware runtime testing.

Based on mainline 0fcb05b72344f40806cbe810de8872f1698bf053.

diff --git a/drivers/usb/phy/phy-gpio-vbus-usb.c b/drivers/usb/phy/phy-gpio-vbus-usb.c
index ce09e78..80216af 100644
--- a/drivers/usb/phy/phy-gpio-vbus-usb.c
+++ b/drivers/usb/phy/phy-gpio-vbus-usb.c
@@ -330,7 +330,7 @@ static void gpio_vbus_remove(struct platform_device *pdev)
 	struct gpio_vbus_data *gpio_vbus = platform_get_drvdata(pdev);
 
 	device_init_wakeup(&pdev->dev, 0);
-	cancel_delayed_work_sync(&gpio_vbus->work);
+	disable_delayed_work_sync(&gpio_vbus->work);
 
 	usb_remove_phy(&gpio_vbus->phy);
 }

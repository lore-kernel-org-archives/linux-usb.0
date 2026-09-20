Received: from mail-pj2-f43.google.com (mail-pj2-f43.google.com [74.125.227.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6875E47011C
	for <linux-usb@vger.kernel.org>; Sun, 20 Sep 2026 21:14:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789938844; cv=none; b=tcV+cxozRxHm7Qv2d54IcYm00xOoLx/MXwOloZX5zXrtxn1Bdxy22lnkNVcRmNf+TKoXT98mmZhUuA/vHaFG0KcpDBzF4z4CFsmqrbMSU4nK99TX/n7zxunmb1A5Q8haSB1SDWwN4GpTdFwF4VyB10Em26ClUvvs+3vVX1SVh1Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789938844; c=relaxed/simple;
	bh=l/UUepTpO0Qk/KuhJ2sVwmu3RIKJO4nGvtoqYcUOboE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=E61zr0NNN9g3nrHs5jwQlTC0/Gnh4B77gjo27wgGWajggtqsGjmICsrA8qmYYMLGM+sTuMw+U06HbozlSIG4rZfCgmum9cBMMp8ZuL5o5j/oXYIs2uJWPDkFwZeuxl6E9JXEtC9O18/iWmvfDC69URzUG0Hnw0bBlbsL/DL57ec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pxFlvGKN; arc=none smtp.client-ip=74.125.227.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pxFlvGKN"
Received: by mail-pj2-f43.google.com with SMTP id 98e67ed59e1d1-396ccb1a98fso2134732a91.1
        for <linux-usb@vger.kernel.org>; Sun, 20 Sep 2026 14:14:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789938843; x=1790543643; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dNN8eipdLX6K7kQkCh1wCd5ubolRJmwOq01XK22sELg=;
        b=pxFlvGKNAut0zXGIPps6QBo76SaIvaP7LupGHFbdTwfXziQDT44b8XI6fb2l/G9k5w
         xI8hRPfj4b4ZbtYtsKQOP5j9UfMgnQ286YfRGQ7ogNrJiYVjP8lQpK/aglktywhdZ+c2
         Xr1CG10uhDdUVRKEUfNPWlvh8bNY7YEhZ5cXSFnwAiV0s3nvVCBf7O87ETJcM7AdJu5g
         XmUSieJwPZNCLDFlv/4jvb+r5QKsregXenfmPdC+CdqcmYk56X8MtMEtBtIVcJHiRY2R
         YJEjL+5/mleRaMCXA/nD0+eH9uKPdwjnJqwvrY9E0w7zlSuEqb5jE/hVE4RRgpjOVHP0
         qPWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789938843; x=1790543643;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=dNN8eipdLX6K7kQkCh1wCd5ubolRJmwOq01XK22sELg=;
        b=gpwL93FMZL6rx3aUh+HqfSxUwbEYZZpRlK6hBMdV2m3a0/gsy/cjoikxqk1//YOYRf
         aFnI8WSSayU6i/x6d2NQBRAh0GJgJaatIIjmnSXW0rqKgtm8ALB4jdRpyNNLhqg7Ztbf
         unL9ARXzhEAPqp/JUXgMELexbO5k5ZKLMdzbRHapPL58SrXLGZ/hQHXYlL5BR9fr/u+U
         idcztNGmosqDwlWSHes//Nxqcn0XW8O5izOzJt7xQ0g+88cbnnIv58lgHW7KLmtyaDPR
         oRuX0YyvSsnfFM2GVyU4u4DBk9xI49m3EGYeN/M/ZpKo7hce6GXxOdQ0bbazl+JT89fb
         Lkrg==
X-Forwarded-Encrypted: i=1; AKwUvBzQPf8sAvEs8EUHvT9CdszpFxrYuzYNeeWxi8iRhCPDYLjmFy8wXRYNqttWe1jcN6Si1xJDXNY6RnA=@vger.kernel.org
X-Gm-Message-State: AFuF++mHHbpi6AmfYjhRaH/J3jAwHxoVDWT07sbCd/WhewEvR+WbuXsS
	S2E5hcYKuz8YZG6nHZojSU66E6HMH3QbAE7r+m4cU7PA07iTLRwmuhD6
X-Gm-Gg: AYBFou1J3FVb1216VgbrymuqCtifOZCY6HAuk8fGUrY8uIkuKEGolckzUuzcNxUf01l
	P3Bgj1qAWtY9/bXTmaIsB8Axo8Iwu3O4Pp8GmYQZe+WGPW961BmroHAEpv5qk8Sl9cbLyMJlKJa
	/OOzl6zvzLytnNaYSoezBeyqV0S3x/WEaWUJseWUWB2kXWhY0ifgNClPPvZ5JVZ5uwrvN9kt+wq
	03PABWU0WS3tK9T87Kj2ic0khB1cTf1cXYE3fCRKOVOWKi02DU3ujMT1e7EZBNd+e2c9U7X53yR
	AekGLSdHYDnCpazsoGegSUfoCUqGTGVt+ZjDNZZgM1autzgjdqgkoyv0qvcB6BpziUNES6Uia2A
	QSB3Ygct9OlefJoslVXyf4/R3xCdKqz2dQTAYqpwMpmv72aBpiBipACAny3wo3GS8YneUgA7wpv
	2X0FFEfEhDWYeBQoA/VNLfRmDjXjp/DgjT3DNqpyY1tIxBvCD7Zyplh8KAMeYC7tf7ognfBAmcU
	Te/SHGEu2yUiP6unfK/gWZ3hJ3tFg6FQr6vEj4Za5Owlj/PBn7AIS1A+c+d1d8KUJvYVyeiFvAB
	UkhnY/PfeZldiuOBHrpkSKOrz2Yew1IAjKrnec9rWbCxxo7i
X-Received: by 2002:a17:90a:d40e:b0:39e:6c6a:656f with SMTP id 98e67ed59e1d1-39e6c6a6787mr7048137a91.50.1789938842656;
        Sun, 20 Sep 2026 14:14:02 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e35])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e6c3145dasm10609743a91.4.2026.09.20.14.14.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Sep 2026 14:14:02 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: devicetree@vger.kernel.org
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
	Hauke Mehrtens <hauke@hauke-m.de>,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	linux-arm-kernel@lists.infradead.org (moderated list:BROADCOM BCM5301X ARM ARCHITECTURE),
	linux-kernel@vger.kernel.org (open list),
	linux-usb@vger.kernel.org (open list:USB SUBSYSTEM)
Subject: [PATCH 1/2] usb: bcma: control VBUS via a regulator instead of a GPIO
Date: Sun, 20 Sep 2026 14:13:55 -0700
Message-ID: <20260920211356.186967-2-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260920211356.186967-1-rosenp@gmail.com>
References: <20260920211356.186967-1-rosenp@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

bcma-hcd drives the USB power line by grabbing the undocumented
"vcc-gpio" from the controller node and poking it through gpiolib.
Besides relying on a non-standard binding, this cannot work on boards
such as the NETGEAR R7000 and R8000 where one chipcommon GPIO powers
both the USB2 and USB3 cores: the two controllers each request that
GPIO exclusively, so the second one fails with -EBUSY and its port
stays dead.

Use the standard regulator interface instead. Each core obtains its
(shared) VBUS supply through devm_regulator_get_optional() and the
regulator core reference-counts the enable/disable requests, allowing
both controllers to drive one GPIO without conflicts.

Assisted-by: LLM
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/usb/host/bcma-hcd.c | 45 +++++++++++++++++++++++++------------
 1 file changed, 31 insertions(+), 14 deletions(-)

diff --git a/drivers/usb/host/bcma-hcd.c b/drivers/usb/host/bcma-hcd.c
index 519386255886..394ba9e5a7f7 100644
--- a/drivers/usb/host/bcma-hcd.c
+++ b/drivers/usb/host/bcma-hcd.c
@@ -20,12 +20,12 @@
  */
 #include <linux/bcma/bcma.h>
 #include <linux/delay.h>
-#include <linux/gpio/consumer.h>
 #include <linux/platform_device.h>
 #include <linux/module.h>
 #include <linux/slab.h>
 #include <linux/of.h>
 #include <linux/of_platform.h>
+#include <linux/regulator/consumer.h>
 #include <linux/usb/ehci_pdriver.h>
 #include <linux/usb/ohci_pdriver.h>
 
@@ -40,7 +40,7 @@ struct bcma_hcd_device {
 	struct bcma_device *core;
 	struct platform_device *ehci_dev;
 	struct platform_device *ohci_dev;
-	struct gpio_desc *gpio_desc;
+	struct regulator *regulator;
 };
 
 /* Wait for bitmask in a register to get set or cleared.
@@ -280,14 +280,20 @@ static int bcma_hcd_usb20_ns_init(struct bcma_hcd_device *bcma_hcd)
 	return 0;
 }
 
-static void bcma_hci_platform_power_gpio(struct bcma_device *dev, bool val)
+static int bcma_hci_platform_power(struct bcma_device *dev, bool on)
 {
 	struct bcma_hcd_device *usb_dev = bcma_get_drvdata(dev);
+	int err;
+
+	if (!usb_dev->regulator)
+		return 0;
 
-	if (!usb_dev->gpio_desc)
-		return;
+	if (on)
+		err = regulator_enable(usb_dev->regulator);
+	else
+		err = regulator_disable(usb_dev->regulator);
 
-	gpiod_set_value(usb_dev->gpio_desc, val);
+	return err;
 }
 
 static const struct usb_ehci_pdata ehci_pdata = {
@@ -405,11 +411,14 @@ static int bcma_hcd_probe(struct bcma_device *core)
 		return -ENOMEM;
 	usb_dev->core = core;
 
-	usb_dev->gpio_desc = devm_gpiod_get_optional(&core->dev, "vcc",
-						     GPIOD_OUT_HIGH);
-	if (IS_ERR(usb_dev->gpio_desc))
-		return dev_err_probe(&core->dev, PTR_ERR(usb_dev->gpio_desc),
-				     "error obtaining VCC GPIO");
+	usb_dev->regulator = devm_regulator_get_optional(&core->dev, "vbus");
+	if (IS_ERR(usb_dev->regulator)) {
+		return PTR_ERR(usb_dev->regulator);
+
+	err = regulator_enable(usb_dev->regulator);
+	if (err)
+		return dev_err_probe(&core->dev, err,
+				     "error enabling VCC regulator");
 
 	switch (core->id.id) {
 	case BCMA_CORE_USB20_HOST:
@@ -452,7 +461,7 @@ static void bcma_hcd_remove(struct bcma_device *dev)
 
 static void bcma_hcd_shutdown(struct bcma_device *dev)
 {
-	bcma_hci_platform_power_gpio(dev, false);
+	bcma_hci_platform_power(dev, false);
 	bcma_core_disable(dev, 0);
 }
 
@@ -460,7 +469,11 @@ static void bcma_hcd_shutdown(struct bcma_device *dev)
 
 static int bcma_hcd_suspend(struct bcma_device *dev)
 {
-	bcma_hci_platform_power_gpio(dev, false);
+	int err;
+
+	err = bcma_hci_platform_power(dev, false);
+	if (err)
+		return err;
 	bcma_core_disable(dev, 0);
 
 	return 0;
@@ -468,7 +481,11 @@ static int bcma_hcd_suspend(struct bcma_device *dev)
 
 static int bcma_hcd_resume(struct bcma_device *dev)
 {
-	bcma_hci_platform_power_gpio(dev, true);
+	int err;
+
+	err = bcma_hci_platform_power(dev, true);
+	if (err)
+		return err;
 	bcma_core_enable(dev, 0);
 
 	return 0;
-- 
2.55.0


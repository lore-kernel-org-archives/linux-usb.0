Received: from mail-pz2-f17.google.com (mail-pz2-f17.google.com [74.125.228.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 844944D5983
	for <linux-usb@vger.kernel.org>; Thu, 24 Sep 2026 23:38:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790293117; cv=none; b=X7aobyqlzfk5PVezKHl/rPOUmBbCotKANjRioVpwe6BtdaCRE3ioLWnVVwMNfZAy0JrwlNY0e391qRsugw8r+1GsCZ+umEezdeq7h7ZVIfRcBOJ/pOV662fzJxNwUR3FUh9d+Hmu+es/Q57dAlGQOBP9DkneSKfrVTStR/cc2pg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790293117; c=relaxed/simple;
	bh=CwqVpfW5z2yOmptdAsDoPF46KOoDDSI+MVi0EV/la8E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cSEpOKIGrZlaxpN6ckCOejQMzAo8BrvCoqNom79u/FocpLLfHJsH4/CXxof1C6nwjtizugd0t4sTcssJnKWFrlFm4uqcL+fBlUXQD/Zkpgw6ZM7TBp2YNbHgOcpnEqypARv4sWhgyKrpVJVdm16A5twiQ2qJ9aFam6TE+x/8dIs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Dlmss0YO; arc=none smtp.client-ip=74.125.228.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Dlmss0YO"
Received: by mail-pz2-f17.google.com with SMTP id 41be03b00d2f7-cc4c3304784so97982a12.3
        for <linux-usb@vger.kernel.org>; Thu, 24 Sep 2026 16:38:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790293116; x=1790897916; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/NkUiZl+VXWJ7LnfDyzh1qcCSWVwBQESldFOBOhNixg=;
        b=Dlmss0YOREW63N6yfr3mJBCvg7MxhY3ItCAVrfpuwXrJdFLv8iK2BjIkeA3wzy/S/Y
         +GuKf9Cn1yqSRizu3mB5dFZc3WF7fL9c89ijaGhUYHkKkSZU0JHmhypibdeVnuxXGb6K
         dnuf2Ejezaz9jTakI6e1FGbeWQ0if0e0mvi1GiE8IbRzIoemkFghaa2gfY3arywuj4zi
         eeplU4lzuRiAhZd4BRnuh4eS4IMdkoBWx5UMqGT5tAag8l+IYJ4trtcuHz3sRk7QyuxN
         il0/9/xCjiJh4lFQrgvREQsjyXBaZNxPBasvxijbtponEclF1dgUzL1NAUap2/rDEf5Q
         F78Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790293116; x=1790897916;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/NkUiZl+VXWJ7LnfDyzh1qcCSWVwBQESldFOBOhNixg=;
        b=NEnK7RUtuuCNyn+ryFhEIBuN+hq5Gz7QUVF4lJbMMNhebu2yAAoZPEIwQHuxPWwa60
         c6KtLpnOsI6jri1sLqc1wVsUKiRFJveT66c0oRbvwTX25EMDs1sFaqOCBDMWwsOBMLxz
         4/g5AoLLqZN/+/PCXqnXmccE43h6ph0mr5iKK2PhACNGQR1s7c5RIywyg/n6zqBB4KqW
         Bnzp1MZ/szBYx9dKYC4rtLUEFQ+ovBP1Ias1MlmDVCT7xFMjiZXAowxzbi7Fy++y4xxp
         vv4B4RjxEgUyPXZT5eHn2+ZJlXnmfo903bux/mqWZnS1EVlPUqJbBA/rO7fA0zeKjJL9
         48Ug==
X-Gm-Message-State: AFuF++k51uVkXJpDAiuQ5Os7xC55B4BBRHgOVajaOniyt1Ho60XOBnQO
	ExfON0mikorW+2xn/4+olHern+cwYILAIcvehq6cowsZkY2nWdVnW4pr1Zmetg==
X-Gm-Gg: AYBFou1VaBBvbs5XreCydPkNGkMuKaYg+k19grPN5j/fm7Ds6zUZKSpkRJ95+IhG8qr
	ar1X1jSU92kQHfKJ8vifphYuA/JzfOMona4uw+pzf3BkrZB7YZyHHkS4fCZiRU6G2dusTttB+Yv
	FBJ+38kJ3KKcKu6NFIjJ9021rUKOR2ccsNx51BjTRJ3j6UeTxL/twp3ZumulHRXLeO/iWKdV4O8
	qTV9E5Y6GEw6bXFor78Sxu+codbdtczR51TkAYNTp30WtQfxtt1OmyKCq1GGOlyAc1IBhwsB+MC
	34dlMYf/jV1qOZP6n/PH50MKuj5u0u7XTNOAn2llOxGm7XPDC+x5raFO/u2+MJ+CmKy+4CCY+jq
	GPkzihkdHgg3qhXi0tv4j0ckqHiICaIkdfHySLAXYgVf0MSLmb7xDCPaQ75/q5h90Sxk7FiSVF2
	7qwTol5dG57yuUUUz56sk7ADh/1yneZaCcDSQd8CUYso3wtASIF9oybyA5Aqwkw0HHlMOl37xPO
	glE8RDudEDZBRl3uHWPWyM5YIrEWvSj7I+UOiVGMWD99+nPYVDAe4RfJB1x+pCK1sIK/Ym9h9Xa
	XpgQJP8oX1JKUJDbDceB6JdWNoCFejuIttCs34k1JUBIHDkYBQ==
X-Received: by 2002:a17:90a:d44b:b0:39e:218c:d47c with SMTP id 98e67ed59e1d1-3a098587430mr3610558a91.9.1790293115660;
        Thu, 24 Sep 2026 16:38:35 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e34])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a0b7d11124sm1307931a91.10.2026.09.24.16.38.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 16:38:35 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-usb@vger.kernel.org
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
	Hauke Mehrtens <hauke@hauke-m.de>,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-arm-kernel@lists.infradead.org (moderated list:BROADCOM BCM5301X ARM ARCHITECTURE),
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCHv3 1/2] usb: bcma: add regulator support
Date: Thu, 24 Sep 2026 16:38:30 -0700
Message-ID: <20260924233831.127617-2-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260924233831.127617-1-rosenp@gmail.com>
References: <20260924233831.127617-1-rosenp@gmail.com>
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

Add support for the standard regulator interface. Each core obtains its
(shared) VBUS supply through devm_regulator_get() and the regulator core
reference-counts the enable/disable requests, allowing both controllers to
drive one GPIO without conflicts.

Assisted-by: LLM
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/usb/host/bcma-hcd.c | 55 +++++++++++++++++++++++++++++--------
 1 file changed, 43 insertions(+), 12 deletions(-)

diff --git a/drivers/usb/host/bcma-hcd.c b/drivers/usb/host/bcma-hcd.c
index 519386255886..cb253cae29ae 100644
--- a/drivers/usb/host/bcma-hcd.c
+++ b/drivers/usb/host/bcma-hcd.c
@@ -26,6 +26,7 @@
 #include <linux/slab.h>
 #include <linux/of.h>
 #include <linux/of_platform.h>
+#include <linux/regulator/consumer.h>
 #include <linux/usb/ehci_pdriver.h>
 #include <linux/usb/ohci_pdriver.h>
 
@@ -41,6 +42,7 @@ struct bcma_hcd_device {
 	struct platform_device *ehci_dev;
 	struct platform_device *ohci_dev;
 	struct gpio_desc *gpio_desc;
+	struct regulator *regulator;
 };
 
 /* Wait for bitmask in a register to get set or cleared.
@@ -280,14 +282,23 @@ static int bcma_hcd_usb20_ns_init(struct bcma_hcd_device *bcma_hcd)
 	return 0;
 }
 
-static void bcma_hci_platform_power_gpio(struct bcma_device *dev, bool val)
+static int bcma_hci_platform_power(struct bcma_device *dev, bool on)
 {
 	struct bcma_hcd_device *usb_dev = bcma_get_drvdata(dev);
+	int err;
+
+	if (usb_dev->gpio_desc)
+		return gpiod_set_value(usb_dev->gpio_desc, on);
 
-	if (!usb_dev->gpio_desc)
-		return;
+	if (!usb_dev->regulator)
+		return 0;
 
-	gpiod_set_value(usb_dev->gpio_desc, val);
+	if (on)
+		err = regulator_enable(usb_dev->regulator);
+	else
+		err = regulator_disable(usb_dev->regulator);
+
+	return err;
 }
 
 static const struct usb_ehci_pdata ehci_pdata = {
@@ -395,12 +406,12 @@ static int bcma_hcd_usb30_init(struct bcma_hcd_device *bcma_hcd)
 static int bcma_hcd_probe(struct bcma_device *core)
 {
 	int err;
+	struct device *dev = &core->dev;
 	struct bcma_hcd_device *usb_dev;
 
 	/* TODO: Probably need checks here; is the core connected? */
 
-	usb_dev = devm_kzalloc(&core->dev, sizeof(struct bcma_hcd_device),
-			       GFP_KERNEL);
+	usb_dev = devm_kzalloc(dev, sizeof(*usb_dev), GFP_KERNEL);
 	if (!usb_dev)
 		return -ENOMEM;
 	usb_dev->core = core;
@@ -409,7 +420,15 @@ static int bcma_hcd_probe(struct bcma_device *core)
 						     GPIOD_OUT_HIGH);
 	if (IS_ERR(usb_dev->gpio_desc))
 		return dev_err_probe(&core->dev, PTR_ERR(usb_dev->gpio_desc),
-				     "error obtaining VCC GPIO");
+				     "error obtaining VBUS GPIO");
+
+	usb_dev->regulator = devm_regulator_get(dev, "vbus");
+	if (IS_ERR(usb_dev->regulator))
+		return dev_err_probe(dev, PTR_ERR(usb_dev->regulator), "error obtaining VBUS regulator");
+
+	err = regulator_enable(usb_dev->regulator);
+	if (err)
+		return dev_err_probe(dev, err, "error enabling VBUS regulator");
 
 	switch (core->id.id) {
 	case BCMA_CORE_USB20_HOST:
@@ -427,13 +446,16 @@ static int bcma_hcd_probe(struct bcma_device *core)
 		err = bcma_hcd_usb30_init(usb_dev);
 		break;
 	default:
-		return -ENODEV;
+		err = -ENODEV;
 	}
 	if (err)
-		return err;
+		goto error;
 
 	bcma_set_drvdata(core, usb_dev);
 	return 0;
+error:
+	regulator_disable(usb_dev->regulator);
+	return err;
 }
 
 static void bcma_hcd_remove(struct bcma_device *dev)
@@ -447,12 +469,13 @@ static void bcma_hcd_remove(struct bcma_device *dev)
 	if (ehci_dev)
 		platform_device_unregister(ehci_dev);
 
+	regulator_disable(usb_dev->regulator);
 	bcma_core_disable(dev, 0);
 }
 
 static void bcma_hcd_shutdown(struct bcma_device *dev)
 {
-	bcma_hci_platform_power_gpio(dev, false);
+	bcma_hci_platform_power(dev, false);
 	bcma_core_disable(dev, 0);
 }
 
@@ -460,7 +483,11 @@ static void bcma_hcd_shutdown(struct bcma_device *dev)
 
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
@@ -468,7 +495,11 @@ static int bcma_hcd_suspend(struct bcma_device *dev)
 
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


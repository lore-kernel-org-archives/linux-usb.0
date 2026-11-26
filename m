Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795675907;
	b=Q0V7DqfqEG9nBLU8S3JbpaxVdbKv5KPvowq6gBk4xB3+KAp3r6TyH2r/4rrDFB7LB76+
	 mxkeZWLnygstPhWzq68YmrBahYNdg5HlHPRQKBV+QFt5rbIzoL+hh+kDQJavlwWGa5uE/
	 44WX4YQ2ifnufNmxiJJ/PCoftOdBeo/IB/xBvgGdgPplNcmu4vABuVgFOU6xwm99xHFfM
	 eL2IIITgrwCbQZ3BcLMoWoFKq4bW4BuyejPVeseEXtzaSVpYl08xK5PN/V1lLCZ4LRN0K
	 bK5ynvKWWhN4NKSYGoe9f5MDGhj+nwR/LvQvQkOv5uveBXlhbrcrLMfi7F1H8CilLsA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795675907;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=2BppQ3jU5OncwED0Bv8UIvkdFXg3MIQgk7zc4gTIqe0=;
	b=DknZlF9NOuuBL1UIg41CLuBH6uRmyotvXWUqDPzYyJZMDNrhjM+YiWHrLm5B/kC/ykZW
	 raL+7hXgpjkFhfFk5FU+rbblAtSdpOkeySj7ev0IfWURcmvBZkOQlW8mQ5QZDq9tnxwje
	 OKz0MGRXK19GovB7J61cgbyvD2m5kswFuqLxI08RCxUYmck9RwZGpwaiflpWH1ZzfLFep
	 GaljYiaLCmlKclA/JCKyCFFzambI5jCauuifnOb3yx35rH6uosxk9ABgvwZ24byZagGgM
	 UhzV1xY3QE+heEINFXfRvBfuYHWfE47A1YK05sFSy07L17I8FXCZ1ACfWAuz897/hsA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=R28l8zOM;
	arc=none smtp.remote-ip=209.85.214.176
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BED9A606A681
	for <linux-usb@vger.kernel.org>; Thu, 26 Nov 2026 06:51:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BED9A606A681
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=R28l8zOM
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2f0458cc9easo53926605ad.3
        for <linux-usb@vger.kernel.org>; Wed, 25 Nov 2026 22:51:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795675906; x=1796280706; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=2BppQ3jU5OncwED0Bv8UIvkdFXg3MIQgk7zc4gTIqe0=;
        b=R28l8zOMUqGgFv4TiT31BV3/hk1GeI2VM0sepDvfQmPEQz1RlCBCjEtOnJCENWrVOr
         dQmFEuOUpVIOGlntdEwxC1Hg9EG12lrQem+F6tOXbXXGMrZdE3W6GB5iV9ZHfUFyFQko
         EVuZet0XpewNG6DrfjZZCubc52SFPLvP3KwCNAlDWmkgZaMbM/RdfYzKkJSkzShbp/2D
         uqNYPdgyCngW5rLBdxl9bDByUEDsApFIhBlpuOnd1bWN+x7M1WncBBsuK4+k9rZN1lrp
         38YRnVuyil7H0lVoAtjI0mttts9k7jZ6CFgCw3XixJJZ2eWusVKSmkriPHq7SFM3P5wt
         QVkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795675906; x=1796280706;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2BppQ3jU5OncwED0Bv8UIvkdFXg3MIQgk7zc4gTIqe0=;
        b=hHbDebHawmSNngE1uR4JbICJRBiDVNqw7OH3vuK/vtKY7OoPZsa1AOJl2cu0r6x4mJ
         kd4VCJQ8jojI3/po58wP+G5GypDRKvxFVYw6Gj0ui0kMLfpkklRPyWeb4IzxKi1a1iJW
         MV4SJgBNbDqKHL6MtgNOC4kEi5CHx2d4tMuNFysyZkm2dCQvdOZctBSqwm52Wu9hGYJB
         TgouJkktgwzYw+Z8SLxGj3qeCaRpE6NfOpoVrfFqtz/eyO+H3goIVtwGeX75gmKLspRQ
         NUSR4bLtnUqkW9Cqq0ouCwOW4CxbW2roqEtnDl+u7ciZq2RCXwtuEXzr7xB7mslLnroq
         OTDw==
X-Gm-Message-State: APuU4Z/cnXigCSPeu1mV3akoVB3Blw2AKZX6fEVn4AsytbpUqhG6Jaj9
	1CwP2t7nVdImzoxE0EFpD2zfBX7mIdAU06u1eD2tHvDHSl9LNyxNSYNnyRCV7qti53fARmLDPBc
	=
X-Gm-Gg: AZFdTZeXWjLD9BUN7dnbh+KNg3fpi6gXmZnusP+71FLSvXEvgMxnJOGbSrK8YPmwUUW
	wV5537BvHcnE7kvK3uigdBtr6r8+eQ19c6S7TiCar7Q1TSrd9HwcKfGhQnPHHSu46LD9CRPHi51
	lSe8726X0/PnaH1LPgGDlCyCjzaA0NWV8MQExD3I9fTu0eZ0JCDQjuKoQuQoUoBzP4l85Oe57uf
	hZYyCwR5Cs8sJZ0UW8EnLzFR1KKCMjF3jd7bX/jT1tSQJyKfwt4/0VXz8GaGG+qUeQwVrgTlyxd
	9ImNbM7c0oMbvzrfjcCEAqyJVZYUqMTLrraABcNMVVJDnw9kKDSooraHS+3A2YiZ/UNBCPt3GAS
	Mijs6T5UN1zWMWpnFY0zEkU53DJlTw+e2P7IcFEHBWV9ZtFkU4vY/QErB3jq7sO4vT1eiGmIXUO
	7S9RE46mqgfZbRWTY3kAlr5POxrJ/lItGXGs5L/sxa7zguQfhRuAvRC9ClriOWXmDY2fBwVfwUj
	EPF9gEQN9cyVv/wsXEZfAizsCc8Ng6n6sw52KZIUjeYuFNz31NreeNAyrfMAygadykihXnEBJ0P
	LBEXfeuMEerr+637bsQuV4B+yUkb/FkgPsSAuSiOS9d4et7v9GnLcxITrOMf9Vflv175Veq8as6
	vx3Dr54rxFx/q53fQ07NbY2zgrMGxDxSuOGM2Ue/2sfg5WVQh1k0Hgu7OVeVTHuVkSP1B7JKyAB
	j/z/yruesTWg89AWBcFwmLl42TFuWAm20OtbvHQ+px
X-Received: by 2002:a17:90b:4490:b0:3ae:a531:4e73 with SMTP id 98e67ed59e1d1-3b41c7b606cmr19992479a91.7.1795675906092;
        Wed, 25 Nov 2026 22:51:46 -0800 (PST)
Received: from LAPTOP-3B99V33A (ec2-3-38-183-164.ap-northeast-2.compute.amazonaws.com. [3.38.183.164])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b44b776a14sm13997686a91.2.2026.11.25.22.51.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 22:51:45 -0800 (PST)
From: "Bin Luo (University of Electronic Science and Technology of China)" <luob87709@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] usb: phy: twl6030: init work before comparator and clear comparator on teardown
Date: Thu, 26 Nov 2026 14:51:39 +0800
Message-ID: <20261126065139.127-1-luob87709@gmail.com>
X-Mailer: git-send-email 2.51.0.windows.1
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

twl6030_usb_probe() publishes &twl->comparator via
omap_usb2_set_comparator() before initializing twl->set_vbus_work and
twl->lock. If the OMAP USB2 PHY invokes twl6030_set_vbus() before
INIT_WORK() runs, schedule_work(&twl->set_vbus_work) operates on an
uninitialized work_struct.

In addition, neither the probe error paths nor twl6030_usb_remove()
clears the comparator via omap_usb2_set_comparator(NULL). Because twl
is devm-allocated, a subsequent VBUS callback from the OMAP USB2 PHY
dereferences freed twl memory and schedules set_vbus_work after
teardown.

Initialize twl->lock and work items before registering the comparator,
and clear the comparator with omap_usb2_set_comparator(NULL) before
canceling set_vbus_work in both probe failure paths and
twl6030_usb_remove().

Fixes: 0e98de67bacb ("usb: otg: make twl6030_usb as a comparator driver to omap_usb2")
Signed-off-by: Bin Luo (University of Electronic Science and Technology of China) <luob87709@gmail.com>
---
Found by code inspection; not compile-tested on ARM/OMAP or runtime-tested on TWL6030 hardware.

 drivers/usb/phy/phy-twl6030-usb.c | 18 +++++++++++-------
 1 file changed, 11 insertions(+), 7 deletions(-)

diff --git a/drivers/usb/phy/phy-twl6030-usb.c b/drivers/usb/phy/phy-twl6030-usb.c
index 9bfcb2c..a9da7aa 100644
--- a/drivers/usb/phy/phy-twl6030-usb.c
+++ b/drivers/usb/phy/phy-twl6030-usb.c
@@ -355,26 +355,26 @@ static int twl6030_usb_probe(struct platform_device *pdev)
 	twl->comparator.set_vbus	= twl6030_set_vbus;
 	twl->comparator.start_srp	= twl6030_start_srp;
 
+	/* init spinlock and work items before publishing comparator */
+	spin_lock_init(&twl->lock);
+	INIT_WORK(&twl->set_vbus_work, otg_set_vbus_work);
+	INIT_DELAYED_WORK(&twl->get_status_work, twl6030_status_work);
+
 	ret = omap_usb2_set_comparator(&twl->comparator);
 	if (ret == -ENODEV) {
 		dev_info(&pdev->dev, "phy not ready, deferring probe");
 		return -EPROBE_DEFER;
 	}
 
-	/* init spinlock for workqueue */
-	spin_lock_init(&twl->lock);
-
 	err = twl6030_usb_ldo_init(twl);
 	if (err) {
 		dev_err(&pdev->dev, "ldo init failed\n");
-		return err;
+		status = err;
+		goto err_clear_comparator;
 	}
 
 	platform_set_drvdata(pdev, twl);
 
-	INIT_WORK(&twl->set_vbus_work, otg_set_vbus_work);
-	INIT_DELAYED_WORK(&twl->get_status_work, twl6030_status_work);
-
 	status = request_threaded_irq(twl->irq1, NULL, twl6030_usbotg_irq,
 			IRQF_TRIGGER_FALLING | IRQF_TRIGGER_RISING | IRQF_ONESHOT,
 			"twl6030_usb", twl);
@@ -404,6 +404,9 @@ err_free_irq1:
 	free_irq(twl->irq1, twl);
 err_put_regulator:
 	regulator_put(twl->usb3v3);
+err_clear_comparator:
+	omap_usb2_set_comparator(NULL);
+	cancel_work_sync(&twl->set_vbus_work);
 
 	return status;
 }
@@ -412,6 +415,7 @@ static void twl6030_usb_remove(struct platform_device *pdev)
 {
 	struct twl6030_usb *twl = platform_get_drvdata(pdev);
 
+	omap_usb2_set_comparator(NULL);
 	cancel_delayed_work_sync(&twl->get_status_work);
 	twl6030_interrupt_mask(TWL6030_USBOTG_INT_MASK,
 		REG_INT_MSK_LINE_C);
-- 
2.43.0


Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795335932;
	b=wGALE6JNHxx1C5mTbkMdCOhBE9YaK279ttC4WFtW5/9MsLunSZ/jKDnirstvYqiZVWFP
	 xvRGQHu2o/AclyJiji7slqYOYis1kEBItF2PPKmVb4byh94caXRAqeO2JIdMgYX6cBoFa
	 LUBY9NPiBOAiOQCiCWEXjlQcYz5TmSgdYJ5Fh3PBr2g+IFyl8tQ4TTWnJjHj+tO3JEtXu
	 qZKs8EMrHcLoIvnTwComPYWvPio1tpLAz+IPzUVIb8qdBEFGbp3AyJv4Vcpx1VF1bnNKW
	 qUTIQ1Ijf6tHwNP37shseR8Xyo6I9vfoyoAH41Qj2CAxb3uPVSYZv08Z9HQQ9hO1nmA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795335932;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=bKejfDl0TR5tOHV0HrkVJmB2rh7rbM0WGFOnvl0w6ck=;
	b=LllyyRiviuarci8bZr2azHbj5jWA0d/v17aWpc6dixWXKzpS6+CLLchVsbS5UKaT/hJH
	 /lYUFbn9oCPLKBFxDe0VxPZuw5lxCLeV8lBQO+3xQOmImG101NaudX+MeDKtuLq+FJZDx
	 FPcW9n2ITTq2eXMEMN8RBBxLacgR0lczsUZadWeujPtiOdaYekagcDXh1d21ZUquXip1Z
	 JAvcsBjU1v5H4wgbGG+t70a8CrQ1CHFb3yRXyQ6Gu/ROtUTHN1HRnVBUHpNA3g65NDweP
	 23gS7XbQ8s99pHEvAamYkvvKC2YmndLEH6Bgv6HS15yn/15X0bhUlofHmqG2+mp9Bfg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Xw50pjoy;
	arc=none smtp.remote-ip=209.85.218.44
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24854606A683
	for <linux-usb@vger.kernel.org>; Sun, 22 Nov 2026 08:25:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 24854606A683
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Xw50pjoy
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-c5133831027so325924266b.2
        for <linux-usb@vger.kernel.org>; Sun, 22 Nov 2026 00:25:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795335930; x=1795940730; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bKejfDl0TR5tOHV0HrkVJmB2rh7rbM0WGFOnvl0w6ck=;
        b=Xw50pjoyrUSjrMX1UIMnoqik2agbejMnMYibFwTaOqN2T8SNBjpOZp1ZjjAW5NVsdM
         0j+YIW6lwK6vOvHhj1jjcbrI9bZQyQZt185OttTDYIB0IbL5dnATkdqdFcxhCssYBky4
         4BH7aONjDzVj046Q9Q+SiIwAtwJkrIDOkn5D4moMIiJ7Z3JNbMDCRMajGDf48NAaloWf
         fLiLAequOClRJsfGqRRrHiZqBiyKHPW08Df+c3AFt1hi85y2zeBFyLoRjPeS2FeI9Vr+
         lPW2HZmwGLQrOL9mdWIo0eGbn+Hh7Ww7M6Z4n/zTDwVZaBEJNig2odQf05XvZsLCSusG
         emKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795335930; x=1795940730;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=bKejfDl0TR5tOHV0HrkVJmB2rh7rbM0WGFOnvl0w6ck=;
        b=qINPW+U87HZlP7n/nQDrH+CsyrqJZFEOqy0Iuwkgqtx3WwrbIzfhZ4yJjEARWO7Ts8
         VFao2XMN3HmBrXzNNkaNHjJkIHOFI4K5+LkScbEnA/l9juTBejrmNzBUB6LMXC/x5zes
         vzgMDxpJwh9s7sgygRvNTfQspvbQ/EzC/G74+zh5a/ItnPnE6PHa+KJ6WFNY2QiqMYlP
         MzyFNJo8K4Md5t1ACl3/1wmcl5h6zSYC+R9LD3IkORKSufrzvdJ2bSJsWWHQQ10hPUw6
         xuUi57kHyfD7UBTEmRFvcfoEAvE/YpFTKzDcDcgowCDd48ndqDxu+GIt3SCpyr3R83yv
         136A==
X-Gm-Message-State: APuU4Z+4HFFhj6r4GS8FlSJth0kYIQOnUsrggcBdEaXaVhUYqSEyYCeD
	/l5XGWsgtRWlEGzT7T1kIfpyGzZVVriyzLnWz3byOdd8W88nEYl7Thdq
X-Gm-Gg: AZFdTZd+V51xxHTB7SLwjeW1osU7gYhRNVpe2g/PspbKf/Btgs3zo7Pxhgp2kv2e2c6
	GO0RTOoTdbTEeZ925Rf8GHKuQbUkOOmYnAAR6GL4ih56jEczMGUfSVyDDGmrBTVepsRxdmMJF13
	g3ntdE+sd0wsRcQRpM3kprZjYmavz+CAdJvD/lz0YlmOJb+8L2mhB5VV00EhG2pDNdmnO4udSK7
	4b/fQaVVn4U6hEUi2YzIMjOTKW7dQO0bhZvdNdolkpjfqqo7neMH3gW7lIdNZXI7G3ktxvIz1zU
	/wbKUzisblUJWG0yKiSoPewHCGsXOWNc+m22gyYRsLARklIgFrWbyTWWe/uRaqpG6amQyB9GRGi
	RFlBkK+vA6E+XHq5v6raMhcsGQKHuClB35VCISzuy9jr2Gt0GlbuaEuI9XbCsSLBspwxeYjcuQX
	eU2QfX2liJqXYk/MGAbwrAoc9uV4/BQYN9tk2z+Xm24G1Iv8tmRDzkqh/BtryFOvoMhneCkLGyI
	Kp9CGYAeT1x0+mL4w2Rw0nNdXf4wHPBv5pwEG+7ao2OMMj0/k9P53jkWBNx86MmGFiKyo4cWdA2
	61FatCsAkdUOz6R2wL6icV8KuP176enA3yHFkdCmkTRbRQRk5i/47KHE+wzSAWjX/h7RCqSDiU5
	UypwHsbUmwQ==
X-Received: by 2002:a05:6402:1ec9:b0:6ba:38c1:57e7 with SMTP id 4fb4d7f45d1cf-6ba38c16228mr5590577a12.24.1795335930340;
        Sun, 22 Nov 2026 00:25:30 -0800 (PST)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6ba6f8fa5b9sm2116187a12.37.2026.11.22.00.25.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 00:25:28 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Matthias Kaehlcke <mka@chromium.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 2/2] usb: misc: onboard_usb_dev: Add USBest Technology SiS HID Touch Controller support
Date: Sun, 22 Nov 2026 10:25:12 +0200
Message-ID: <20261122082512.64304-3-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261122082512.64304-1-clamor95@gmail.com>
References: <20261122082512.64304-1-clamor95@gmail.com>
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

The USBest Technology SiS HID Touch Controller is built in Asus Portable
AiO P1801-T and attached on the USB controller via integrated Genesys
Logic 4-port USB2.0 Hub. Add the support for these device for the power
supply and reset.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/usb/misc/onboard_usb_dev.c | 2 ++
 drivers/usb/misc/onboard_usb_dev.h | 9 +++++++++
 2 files changed, 11 insertions(+)

diff --git a/drivers/usb/misc/onboard_usb_dev.c b/drivers/usb/misc/onboard_usb_dev.c
index f846d7fe331ea..5435e2b1f535f 100644
--- a/drivers/usb/misc/onboard_usb_dev.c
+++ b/drivers/usb/misc/onboard_usb_dev.c
@@ -574,6 +574,7 @@ static struct platform_driver onboard_dev_driver = {
 #define VENDOR_ID_REALTEK	0x0bda
 #define VENDOR_ID_TERMINUS	0x1a40
 #define VENDOR_ID_TI		0x0451
+#define VENDOR_ID_USBEST	0x0457
 #define VENDOR_ID_VIA		0x2109
 #define VENDOR_ID_XMOS		0x20B1
 
@@ -687,6 +688,7 @@ static const struct usb_device_id onboard_dev_id_table[] = {
 	{ USB_DEVICE(VENDOR_ID_TI, 0x8142) }, /* TI USB8041 2.0 HUB */
 	{ USB_DEVICE(VENDOR_ID_TI, 0x8440) }, /* TI USB8044 3.0 HUB */
 	{ USB_DEVICE(VENDOR_ID_TI, 0x8442) }, /* TI USB8044 2.0 HUB */
+	{ USB_DEVICE(VENDOR_ID_USBEST, 0x0817) }, /* USBest Technology SiS HID Touch Controller */
 	{ USB_DEVICE(VENDOR_ID_VIA, 0x0817) }, /* VIA VL817 3.1 HUB */
 	{ USB_DEVICE(VENDOR_ID_VIA, 0x2817) }, /* VIA VL817 2.0 HUB */
 	{ USB_DEVICE(VENDOR_ID_XMOS, 0x0013) }, /* XMOS XVF3500 Voice Processor */
diff --git a/drivers/usb/misc/onboard_usb_dev.h b/drivers/usb/misc/onboard_usb_dev.h
index 10f010fb57c07..8c218c8a82fca 100644
--- a/drivers/usb/misc/onboard_usb_dev.h
+++ b/drivers/usb/misc/onboard_usb_dev.h
@@ -66,6 +66,14 @@ static const struct onboard_dev_pdata ti_tusb8020b_data = {
 	.is_hub = true,
 };
 
+static const struct onboard_dev_pdata usbest_hidtouch_data = {
+	.reset_us = 1000,
+	.power_on_delay_us = 100000,
+	.num_supplies = 1,
+	.supply_names = { "vdd" },
+	.is_hub = false,
+};
+
 static const struct onboard_dev_pdata bison_intcamera_data = {
 	.reset_us = 1000,
 	.num_supplies = 1,
@@ -147,6 +155,7 @@ static const struct of_device_id onboard_dev_match[] = {
 	{ .compatible = "usb451,8142", .data = &ti_tusb8020b_data, },
 	{ .compatible = "usb451,8440", .data = &ti_tusb8020b_data, },
 	{ .compatible = "usb451,8442", .data = &ti_tusb8020b_data, },
+	{ .compatible = "usb457,817", .data = &usbest_hidtouch_data, },
 	{ .compatible = "usb4b4,6504", .data = &cypress_hx3_data, },
 	{ .compatible = "usb4b4,6506", .data = &cypress_hx3_data, },
 	{ .compatible = "usb4b4,6570", .data = &microchip_usb424_data, },
-- 
2.53.0


Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795786775;
	b=nVXIW9hXWi1wXv2QHAd0BfKTlro1LL+jOBwTJmcl4+p7+Y45aBz3Bw2tReBZHcMtb3pb
	 4Qz+xPS7Ndn9pmKoAzJ7xBEXnEmhw91uJPyt1LqkC8Nv6B+WLQi9fzAzWmZMNtwqOQkXr
	 nBIiMhDhgpB5yu9IMdwzYEgijerME6Jm+dtS0fa1IT4/y0/35j/W1H6nHYZ16oYLz8DJX
	 0XtCWOqM1nr55ii1xXxnxyI0W3JUDU5uuNK+qNS1x0MZubIz1d1m4MpKbW3KB5rHUtHrH
	 yu9NOHzUv8X34W/tWdF2I56Y21l0ABgXyopmBYCTPjYuyGjrEs2XW/ThYJMKLol5fcQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795786775;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=VQHz/sZ19BwFcXleDCEwH4FlS++v4bbxGG2PqYD3WfI=;
	b=5B25lOyGhS3Gg1AZ2Js/wdls0fzt9PmtoRQO3r3ntAngDm+wQC4lW7/Qn2gksiej6jjq
	 Wg3ABH1yEmA5ufgEXSYVlBD58B0QvK9rGZ0/Y5qAcrJ+4tXWVEbLvYUf+nUpu2tgCpk4c
	 y0tXzFC4Ws2WwLACnNQoUR0HH+J0Pc44VDq1RCHUUNVbca1HwLj8l6q/UPHCTLGc6Ia5R
	 WTGmOMDquscDd4S2sZqpXRce/B2TKDJZtTYXVqHT7Ocogcw+Li//Zc0r+VYlykbxEi6ir
	 voiK6Nr4OwTr2pl9rneRA9bGTxFL+KAZy5cws7ty4xYp5yHVwrbe4uShGgGuW55jrCg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="h/5+zgZQ";
	arc=none smtp.remote-ip=209.85.215.179
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 272F1606A31E
	for <linux-usb@vger.kernel.org>; Fri, 27 Nov 2026 13:39:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 272F1606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=h/5+zgZQ
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-cde5a7d79b0so4179009a12.2
        for <linux-usb@vger.kernel.org>; Fri, 27 Nov 2026 05:39:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795786774; x=1796391574; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VQHz/sZ19BwFcXleDCEwH4FlS++v4bbxGG2PqYD3WfI=;
        b=h/5+zgZQAiBrAWbAFRpZI/xS16gFdRUwpKefrULxrrbkK0gz42wl+aWE+1IxOLcSP9
         PBOi3xKSfeM4BYYiCvIBh8SvqjvJfOo6Kf3PSY0nFJqUMGMmFYGuIUWc1XCE7LhPkf03
         g4rvBljFBB5lXeiLWkWC4oGls4bkeyiOYHOC/6JXpXuqMn8e7UiFFTLfvNVjzmj82uOj
         EugooJOgUxm489N40rcE/dorSYPIuZxBHjk/QShTpvMmYJYW+SsIGo+9lMzgq0qnOaMM
         ftUMomdDRNM2sQ5isHW1fZLx74lXNmJwhXF1MvcCmCVfl4W1OQTuowbqAFGeNc66hrA7
         CjnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795786774; x=1796391574;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=VQHz/sZ19BwFcXleDCEwH4FlS++v4bbxGG2PqYD3WfI=;
        b=hcvIB91MfjnvsE7SFeI6I5gK6YMBcFUO1v3/0K4/iICOUHcZury6srxrS6GvPoOIiC
         kwod97gll7nJuDbJgC1W6C2emQbHD2idshKziEiqWFyjI+fxhCCFs4CBhPzHoK1jX4uj
         g7PbsEnNybfHjp2gj0D+BBeUrnQxMayn/KWBr42ooK2nUp391W+2iC8TPzg1i9J9U0g9
         MYfBB0k3egnUZPTDK6/wRoZ9zMG/x7IQeyJaOshg6m/nQzTnixY+tC/eM+C1ZM6/jESQ
         C+Dj0LV3Ox3xaUFo9rAQWWkCsACEfvmWkqNL5WLXINaSf3NNZ5I4Ad6sY0sIFqCoXQzc
         fmmQ==
X-Gm-Message-State: APuU4Z/oRV38+1HNbXOp3zjK0S3UzGhNHH2v3Acdyt0dYaCJYbK+aguy
	qvJ0uw8QOBqWmC7buOc58aaGHreKj4lHaPVeMLeiiDK87KWlxDA8yrdIHJaSRt3Wcsv08SlM
X-Gm-Gg: AZFdTZfpYoWsP9HpqoHVP6ML3VHFJeaX8ieb1QpITjOWpkIrYwC50RL4e1WrlczTk6k
	6ll7C4rY9q7s5s0BBbfpGhxYtf/VQ7yrMD0UU086oH1sDAPU7urhDdngienR+O4Vs75dY5MZOLD
	jNxHxRba5/LQacIqg98pNj675X7sQ7Acyd3KW6uOgk/NamScuCuTU9WEMSbg/MVC2kWybheGk8l
	Hg6Bbmv3UG006DnGqphSAudfU1lfUBCSgHM3hhcMO1dGY2md8KrbUsX4Y1L2UgKYbw3x6fWjz0f
	U4O/6rg7LdGTUkggs22LZKpmxXy50j7u9B4PAyMPlQcMIYj9s/wDga2jNQQMHIZFLprG+XhwLZT
	V3j0fVU1YDIWq2sVXPWbZcoTHvqKc9PfGCz2lzD5yw4O83Oo9/tbXsznU0yYC3f1t2vyn2iinYT
	rEgJszKOPFDmbDdmA3wTQtUaEnNmx77GPMpD9N8e29q8wBk3STV2SgIvJrRt3sywV0qcijrWD5U
	mNcuSKm38gx4KE3debj8qey8uZlx+76j5w0XsDXNTHVHm+JJG+4Umpo8i28CDM7FyC9muLB+iBX
	lPVpg3na2PaaTWUj8c4CsO0bDftHQjAn7ecAaKDRzzhRyPF999KjAtl7BrlBAPLeQyMospO7fvC
	Xr5PDxkwH4tnUFvf+WQZfcitz7OuDJHX6YB5ksvc6bBiG26jpYT+nCrnTCEnv+iRelJsvUK6sZv
	z1jkcziaF+qXvLuHdfqRY05qXrFGqvgRxyc+DJf2k=
X-Received: by 2002:a05:6a20:748e:b0:3d3:aec2:4dcd with SMTP id adf61e73a8af0-4014c251613mr27551606637.25.1795786774414;
        Fri, 27 Nov 2026 05:39:34 -0800 (PST)
Received: from LAPTOP-3B99V33A (ec2-18-138-229-8.ap-southeast-1.compute.amazonaws.com. [18.138.229.8])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cdebb45c972sm4091144a12.20.2026.11.27.05.39.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 05:39:34 -0800 (PST)
From: "Bin Luo (University of Electronic Science and Technology of China)" <luob87709@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/2] usb: phy: twl6030: initialize lock and work before registering comparator
Date: Fri, 27 Nov 2026 21:39:22 +0800
Message-ID: <20261127133923.1452-2-luob87709@gmail.com>
X-Mailer: git-send-email 2.51.0.windows.1
In-Reply-To: <20261127133923.1452-1-luob87709@gmail.com>
References: <20261127133923.1452-1-luob87709@gmail.com>
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
omap_usb2_set_comparator() before initializing twl->lock,
twl->set_vbus_work, and twl->get_status_work. If the OMAP USB2 PHY
invokes twl6030_set_vbus() in that window, schedule_work() operates on
an uninitialized work_struct.

Initialize twl->lock and the work items before calling
omap_usb2_set_comparator().

Found by static code audit.

Fixes: 0e98de67bacb ("usb: otg: make twl6030_usb as a comparator driver to omap_usb2")
Signed-off-by: Bin Luo (University of Electronic Science and Technology of China) <luob87709@gmail.com>
---
 drivers/usb/phy/phy-twl6030-usb.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/drivers/usb/phy/phy-twl6030-usb.c b/drivers/usb/phy/phy-twl6030-usb.c
index 9bfcb2c..b28a94b 100644
--- a/drivers/usb/phy/phy-twl6030-usb.c
+++ b/drivers/usb/phy/phy-twl6030-usb.c
@@ -355,15 +355,16 @@ static int twl6030_usb_probe(struct platform_device *pdev)
 	twl->comparator.set_vbus	= twl6030_set_vbus;
 	twl->comparator.start_srp	= twl6030_start_srp;
 
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
@@ -372,9 +373,6 @@ static int twl6030_usb_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, twl);
 
-	INIT_WORK(&twl->set_vbus_work, otg_set_vbus_work);
-	INIT_DELAYED_WORK(&twl->get_status_work, twl6030_status_work);
-
 	status = request_threaded_irq(twl->irq1, NULL, twl6030_usbotg_irq,
 			IRQF_TRIGGER_FALLING | IRQF_TRIGGER_RISING | IRQF_ONESHOT,
 			"twl6030_usb", twl);
-- 
2.51.0.windows.1


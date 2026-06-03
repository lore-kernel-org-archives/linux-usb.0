Received: from mail-vk1-f182.google.com (mail-vk1-f182.google.com [209.85.221.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 708E028F948
	for <linux-usb@vger.kernel.org>; Wed,  3 Jun 2026 11:36:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780486616; cv=none; b=sm19p46/QWGFHoJ+1qPrhJRIc+KJuvUaKOnvYQ+NxizGGgcfFyTUl6ONSxACUGuBTSCslQjd10KIcU6eAO7dUqvlueygFWSVxiioE6ekyyXGheVSmpcnD7kfj8N8gM/LHXaA+VQSYBllyHF0nPQRNt/WUQP1Ejfzaa/hw3nJ3qA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780486616; c=relaxed/simple;
	bh=eVVpjat/onGdYwFwM9z/fcRVTssS1K9TnMFHu8K+1AE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Gam8mfrtWskZvFJwQYu+LO2HM+gPH9jYaqYWAKSt/+hpSlZK4waZ0OHS7qPIh4yzzixj9p4J6t+aUKbJkhLEpfc9JfEiUDcVZTqoBlvxQb9RB4WJ9guQzZ9161OG9pi8o/NBFh+PjyKbplTsI9mSn+2VqFiPoyqpxt08X5TCpcs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SVWLrXm9; arc=none smtp.client-ip=209.85.221.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SVWLrXm9"
Received: by mail-vk1-f182.google.com with SMTP id 71dfb90a1353d-59bbe027424so4155036e0c.3
        for <linux-usb@vger.kernel.org>; Wed, 03 Jun 2026 04:36:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780486614; x=1781091414; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=FbSeHI2/IWIY7jYjmNlVHQbRjzH6dm0md1w7ZleWjRg=;
        b=SVWLrXm9Za5wEXXplUrS0WHSuQ+ZUJ4fk0PHPSlHKOIPZ/kQuYl5hndek0GMcNWtD9
         OkfOWkDKCcRUxvqGomnR+eP1n1guMZGi4AezeqOp09VHytDu7hRAvh0r+9vChydhY8eQ
         OUISfcuJnxm4MRUOOmqVPwl9ja8qKlW6d5VzYJfqX+HN7fZpr8Tyrn8ckTsbh2UkQqQe
         isCTcu5nBbAlKUlyIT2cKbo4tmc9/SzvnHJlg2FWk/HVdoEfuvuUp+NnC5SsN3NOXeD4
         NTUBcZ+ncJPjRG8sSa5U+ficYCGvX9IzAOOo/ndmSb6UqEJW0EBzR2YKujIz8clBzctz
         FmTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780486614; x=1781091414;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FbSeHI2/IWIY7jYjmNlVHQbRjzH6dm0md1w7ZleWjRg=;
        b=JZYA6FuOa/gTc4rlc3GJGgAgisn/kFVN43IR/odPacxMHf8CoZSnL9UQZ9Z0ncHEiD
         /x0h6SeEQuyA67U8OK0dBWaZR9TTzYL+zZuA/jicAf8ASPAd/rQz5HwwJT8M5fr8srW+
         gd26P9XNNl/d9CqfsfE/+TjCxEV2C7iBJ8x3M989i6LKh6TV9MCTEeC0elLThphR0rUU
         m0h8Hw/4g1IzlLsIeW1EDnT8gwClQMpTKoXd+AoVKCDbMrjw20rOUFq+YX5zUzLTkef/
         /ouJDg/NnY6MfQIgtya88wkS1tAlZZMwEK0O92mXu2cBHIXkL7p1/eetQ36zcEAf9LPu
         Yp+Q==
X-Gm-Message-State: AOJu0Yw5alkR94zgd5cuXXyVsNKVGIkojqKLR8q3Kp6JglBiqes5JHVd
	NrK639Jen0CWkRSmp2F+xO+MdS30z11qqIbYNmrvS/cK9BZFLPUvlDc+
X-Gm-Gg: Acq92OHwDXS9y8rIaj1woMlhlrPdE+fLdNOUWKcReU9qUrIs13EaQRck/BS5N4DafLe
	p0pF3oP71foI4iUJX3uYvJtwgTWlEnClaKP5Hd7tn8hSD745GGmyzMV5FBYDTbutMelGvS6behF
	HUvMOR50jI3PZ8FJShNoFiRTX9SaKvZ/0WaXYGNuo2owMKGcADrP+M2SvIInyM1bNxcBeER/jqE
	HrL5wlUgOANv3r44EJfbtxcU7zeXZHu1fFJKi/04ajBusu1c/Lk8qZZXid1ATuIAnRpOtSx2aqb
	RltBlyuPHErgYFrnVfuCJmdSHiBn5Pi+yZcZDRP2L6TX+gVNqWrZvDytF4WN9bDbMCkj2n/+9/J
	x56VHbp/N9WSDXia7eKWdGYrH2NkiajM4Si4eVpsHwp7vj+7aYRPfTaqsHRhRA4Lgu4dU7nsdH7
	Q9qwqBojqbNNM624OHo9t89NG8qTIzPYbqsgsred2HKqlAQxdvBU8Xm2cnGjdyiB06aiDk8DeWP
	8Dr
X-Received: by 2002:a05:6122:e14e:b0:5a0:3d17:f939 with SMTP id 71dfb90a1353d-5a6e7e57815mr1618377e0c.9.1780486614555;
        Wed, 03 Jun 2026 04:36:54 -0700 (PDT)
Received: from lugathe ([2804:13c:4617:4c00:2c1b:7c0a:e342:3a7e])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5a6dd501a90sm2108219e0c.17.2026.06.03.04.36.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 04:36:53 -0700 (PDT)
From: =?UTF-8?q?Rodrigo=20Lugathe=20da=20Concei=C3=A7=C3=A3o=20Alves?= <lugathe2@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org,
	=?UTF-8?q?Rodrigo=20Lugathe=20da=20Concei=C3=A7=C3=A3o=20Alves?= <lugathe2@gmail.com>
Subject: [PATCH] USB: core: add USB_QUIRK_NO_LPM for VIA Labs USB 2.0 hub
Date: Wed,  3 Jun 2026 08:36:26 -0300
Message-ID: <20260603113626.395612-1-lugathe2@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The VIA Labs, Inc. USB 2.0 hub controller (2109:2817), 
found in a KVM switch, fails to enumerate high-power devices during 
cold boot and system restart. 

Applying the kernel parameter 
  usbcore.quirks=2109:2817:k 
resolves the issue. 

Enumeration failure log: 
  usb 1-1.2.3: device descriptor read/64, error -32 
  usb 1-1.2.3: Device not responding to setup address. 
  usb 1-1.2.3: device not accepting address 11, error -71 
  usb 1-1.2-port3: unable to enumerate USB device 

Add USB_QUIRK_NO_LPM for this device.

Signed-off-by: Rodrigo Lugathe da Conceição Alves <lugathe2@gmail.com>
---
 drivers/usb/core/quirks.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/usb/core/quirks.c b/drivers/usb/core/quirks.c
index 87810eff974e..a72c8cdf9777 100644
--- a/drivers/usb/core/quirks.c
+++ b/drivers/usb/core/quirks.c
@@ -576,6 +576,9 @@ static const struct usb_device_id usb_quirk_list[] = {
 	/* VLI disk */
 	{ USB_DEVICE(0x2109, 0x0711), .driver_info = USB_QUIRK_NO_LPM },
 
+	/* VIA Labs, Inc. USB2.0 Hub */
+	{ USB_DEVICE(0x2109, 0x2817), .driver_info = USB_QUIRK_NO_LPM },
+
 	/* Raydium Touchscreen */
 	{ USB_DEVICE(0x2386, 0x3114), .driver_info = USB_QUIRK_NO_LPM },
 
-- 
2.54.0


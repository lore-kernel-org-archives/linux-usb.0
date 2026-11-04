Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793833107;
	b=shlyW9ppPKED+Z6VMaZcpppFpVeTEvvxrhLXeTZFx8w4wigALyvrnH8n26FDf8y44W6h
	 bCeJaVEuzEJh85F5l2fIAYKW1nlLJJMi8fmoEKaPZyub/SNKWCV0HHvw85IxfepHOUyAu
	 TusyEAfydBtiZ1Xk0Sy8K5fTbKtMuR009TexMQ7D+HYs04IhXrk1iekSV6dYJvBYFl4NL
	 4uSpZNWwYVvfnARCOqvp61+PRoXEkVC/Utz0eayyhRAt6Osww7NYD0FeFb2kLfI/jYQC3
	 4ISy0iQ4c6SUUNN+cc9vQTt6Dg7nlWHnx/s+cqGJIadMeoLVDCL089a8XjYSs0rfWKA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793833107;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Subject:Date:Message-ID:MIME-Version:
	 Content-Transfer-Encoding:Content-Type;
	bh=4I/Of0MqaFIwlQipyrMVyhxTIsJLgwA6WtB7dsntB6E=;
	b=bDwGlw9GXc92DC9fNwLTttf4lSGOtYTJvhNo0aF9oC7tfRAOHzAhSuSCVPhhHRu6n/Mz
	 6sBPwzyVBx4TgyRM2UaGmF3FWwEmfFzaKvCpq+I1BWJWrPtk+HqyoTguLcaYXj2E/mdOE
	 rDtHr3ulL8kvwBScFNRw5gJu3OV9GZKCgKZB71/RV9YVb7KfqOBAPnDgTkeclPqlVrFVt
	 E5r4A1/v7pGbFGpMyze/fMnP2GH7QDdM0tn+l+Smlts5W7TDzYyZWMAaz4ZaR3AI8x8B/
	 EQ7spPcM/mIymYVSvKntgaM7uvnTHjxejHhWyBjtVHdhwIiPZFd+1CDg5+AhRuKJLuQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Q9QjrPru;
	arc=none smtp.remote-ip=209.85.222.171
Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85EF5606A326
	for <linux-usb@vger.kernel.org>; Wed,  4 Nov 2026 22:58:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 85EF5606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Q9QjrPru
Received: by mail-qk1-f171.google.com with SMTP id af79cd13be357-93f1e5d7450so123444785a.2
        for <linux-usb@vger.kernel.org>; Wed, 04 Nov 2026 14:58:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793833106; x=1794437906; darn=vger.kernel.org;
        h=content-type:content-transfer-encoding:mime-version:message-id:date
         :subject:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4I/Of0MqaFIwlQipyrMVyhxTIsJLgwA6WtB7dsntB6E=;
        b=Q9QjrPru7WqUp5k7qiTAyJ7BHKv8Qot0va6Sh1tJO+Kte7MSH+b8g0w5ECiNxebFnk
         jz1UPaN87xoVtk8iuMOyAuq8IIh/V66b9dtpF9ORdmUVWIxJLNeuP896qbDDaW76rcv/
         cLP3lV4sH7rRsA+44sSK1uY3s+D4gsI0XBHHB2xVmstq8i2P6F6h933acQF5D1QKHz0o
         ZtPavjA6cN8WqF7Y5rrzGzixGE3497yxgUcK7nRvzSyeAMb/2fcORI5MBvxzibvwgJLP
         FaNzGuOxLKVJ6gwx+mUqIzJ3Eu6sL/JlCkqXNbPegBqEdUKXBuNV0AoKWCkddMv5mo/q
         fABw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793833106; x=1794437906;
        h=content-type:content-transfer-encoding:mime-version:message-id:date
         :subject:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4I/Of0MqaFIwlQipyrMVyhxTIsJLgwA6WtB7dsntB6E=;
        b=Rve0YgoxhReFBgbJsInNFgC18BYeDEjalZ9evPeYBc3ta/MWMYb8IglmWm3pMoekyj
         elxf5IPoO8b6jVnrfwEF/A3HnCoq/jGjNKCVY62V+MFrH6HbIA17/2mbijvupbsxbGcp
         bwoK1r5Kju8lkGbLn4AJoTxD7WXnmyn0fJAyrWrtBx2W1x3KKAGiuRnLNwCuxDEGudoU
         3y1DwSWSLR2hwfrDw1b7Ll599VtHdViL4nBbIayc080Jteg5te4uyikf1nNI/2xksh9C
         rfnskjil4rYtPMX8JOwqyEgTRiUPiIQ1YwWH4adk1cDKg+JFckoy+pZ2qwM4A/SUgVGt
         Pv7Q==
X-Forwarded-Encrypted: i=1; AKwUvBwQHR00vCz7tqfGnRs1O+uWmpwDxGwLFKd2mMmI4QaSuUIQX9LGn8riERs0Ofy99W/uN3QpQVdMgzs=@vger.kernel.org
X-Gm-Message-State: APuU4Z+3JHYF/CkyLUni2nZIzvqFtI27w23fEKT6rLc6xXXRSkBev230
	FUZ2K1Sfe+pjUKCH25sDhf2UTTxm2auMq/yZ7iQA0nqSq6yO9zcMzj0L
X-Gm-Gg: AYBFou1usYmzzuUa6oCfZJjknRV1elqgCmO448Hg35s/BEtmZdmX9nqZxCfzVMwwwua
	+L/NED+XKbQZ0l6S1BIhfANQoDavlz2K0gcFE2RkRr5cezwPl7w+x7R/xXNsXBl2IMBcR8z7p/A
	O/ZWm6xsQcKJYEgq53I77PDkIpU2qNh5z0o+Qy3cCINShp0n/UiR/ybgi2gFcrK2xLHhOiO9EWB
	/cg7lspjbMJm0jCpk520QnddNV+T3j3PCUoU1TOeM6ykIyD9yD105isDWYIefunSsseJ+WggYGO
	KLNTB6wsQOhK3PB81tu+hicGJa3sJYTQxNBLw/sqW/H/xYV/m0VkSwMnMkW7ZlOlPeovjMT81GA
	c1BXRAKoSN6o4ydM6y5LpnmsQl7bONb2bunccTSreKi4DPsgtAcISse7MOBJ0qCT5lVfObqtKJ4
	yqbrebSU9cFQqXa6u5H5GPy6RyZB66s/McWEiTnSPTDsZYiuqUdQ+iumlQbB2kiaxvj8v10P9en
	uwSztQkhRTXyY3LuwumCC8RUSaemliUg0RuZU2TXpKp61EFFvvZ7YeWOze191UE/gqAboCEbcCs
	063i1RV3p4sQkU+rCXGYV9XDAKoQy62goSzyOKyNlpDsICehxw==
X-Received: by 2002:a05:620a:3720:b0:93f:38c7:70f9 with SMTP id af79cd13be357-944216f2318mr3136951585a.14.1793833106272;
        Wed, 04 Nov 2026 14:58:26 -0800 (PST)
Received: from nerdopolis2.localnet ([2600:4040:5e70:4900:c81b:95a5:d93f:b197])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-945d488f183sm317811085a.39.2026.11.04.14.58.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 14:58:25 -0800 (PST)
From: Adam Simonelli <adamsimonelli@gmail.com>
To: Johan Hovold <johan@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject:
 [PATCH] USB: visor add vendor/device IDs for PalmSource devices from the
 PalmUSBD.inf file in Palm Desktop 6.2
Date: Wed, 04 Nov 2026 17:58:24 -0500
Message-ID: <ciHDthUGQaulSODjTZQ9wg@gmail.com>
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"

From fed0bc0868dd1e0dfe98ec84fcd7c1208cb076c3 Mon Sep 17 00:00:00 2001 
From: Adam Simonelli <adamsimonelli@gmail.com> 
Date: Wed, 4 Nov 2026 16:56:50 -0500 
Subject: [PATCH] USB: visor add vendor/device IDs for PalmSource devices from 
the PalmUSBD.inf file in Palm Desktop 6.2 
--- 
drivers/usb/serial/visor.c | 6 ++++++ 
drivers/usb/serial/visor.h | 4 ++++ 
2 files changed, 10 insertions(+) 
diff --git a/drivers/usb/serial/visor.c b/drivers/usb/serial/visor.c 
index 5706c46c49c2..5a289c566ba6 100644 
--- a/drivers/usb/serial/visor.c 
+++ b/drivers/usb/serial/visor.c 
@@ -75,6 +75,10 @@ static const struct usb_device_id id_table[] = { 
               .driver_info = (kernel_ulong_t)&palm_os_4_probe }, 
       { USB_DEVICE(PALM_VENDOR_ID, PALM_ZIRE_ID), 
               .driver_info = (kernel_ulong_t)&palm_os_4_probe }, 
+       { USB_DEVICE(PALMSOURCE_VENDOR_ID, PALMSOURCE_DEVICES_1_ID), 
+               .driver_info = (kernel_ulong_t)&palm_os_4_probe }, 
+       { USB_DEVICE(PALMSOURCE_VENDOR_ID, PALMSOURCE_DEVICES_2_ID), 
+               .driver_info = (kernel_ulong_t)&palm_os_4_probe }, 
       { USB_DEVICE(SONY_VENDOR_ID, SONY_CLIE_4_0_ID), 
               .driver_info = (kernel_ulong_t)&palm_os_4_probe }, 
       { USB_DEVICE(SONY_VENDOR_ID, SONY_CLIE_S360_ID), 
@@ -133,6 +137,8 @@ static const struct usb_device_id id_table_combined[] = { 
       { USB_DEVICE(PALM_VENDOR_ID, PALM_TREO_650) }, 
       { USB_DEVICE(PALM_VENDOR_ID, PALM_TUNGSTEN_Z_ID) }, 
       { USB_DEVICE(PALM_VENDOR_ID, PALM_ZIRE_ID) }, 
+       { USB_DEVICE(PALMSOURCE_VENDOR_ID, PALMSOURCE_DEVICES_1_ID) }, 
+       { USB_DEVICE(PALMSOURCE_VENDOR_ID, PALMSOURCE_DEVICES_2_ID) }, 
       { USB_DEVICE(SONY_VENDOR_ID, SONY_CLIE_3_5_ID) }, 
       { USB_DEVICE(SONY_VENDOR_ID, SONY_CLIE_4_0_ID) }, 
       { USB_DEVICE(SONY_VENDOR_ID, SONY_CLIE_S360_ID) }, 
diff --git a/drivers/usb/serial/visor.h b/drivers/usb/serial/visor.h 
index 622d639ce74e..0f86bd06c4fe 100644 
--- a/drivers/usb/serial/visor.h 
+++ b/drivers/usb/serial/visor.h 
@@ -32,6 +32,10 @@ 
#define PALM_ZIRE_ID                   0x0070 
#define PALM_M100_ID                   0x0080 
 
+#define PALMSOURCE_VENDOR_ID           0x13e8 
+#define PALMSOURCE_DEVICE_1_ID         0x0600 
+#define PALMSOURCE_DEVICE_2_ID         0xff00 
+ 
#define GSPDA_VENDOR_ID                0x115e 
#define GSPDA_XPLORE_M68_ID            0xf100 
 
--  
2.55.0




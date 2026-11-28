Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.224.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795824974;
	b=Lg0FzND0K5d4B14oIKFh6WeEwIvz3m1izhEJ9B/e5r+z6x6rnrV7SV5qFAog6bjWWcdg
	 Ahyp8FElLoPIuxuy2w7G6XADBEwaMVAeKElj0Pqg5jMyL0+1gt4Kpoi1O+8xN/wYPkopJ
	 uCUW8oekoouSBwtA7G2CWE9pe5YXYU9P7pk21+PH4WX8WFtxjYH+d8vlP0vh1irU2wIy7
	 v2to4TXoJcez58ejN4ueiTdv9DNDcsN6a1dBv5O8V8HuHD4rQ+br82UlhjnKQmfNyHh4d
	 ImG4aFjIN0Tp1MDsBJMMhFUBaXY1Y9VFX+OTrkQkPOdUL64WXZIeLp1qJi5zlj3QlEw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795824974;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=tTWe7d/JA8UqJTHQt7KWcT8ojN0qEryOEBsHqx2uc5w=;
	b=wtKCcVVVi8kECDUfv0VtVKKTJL8C0RgK78W11680gI38Sl2qsrAuMqD4TnQE8ZbBay4J
	 0ahOKJV4coLwIV2T7NSgutkuXwRD8go4esQ/Ad+gXQXYHiHEhzBNMyTHAKQJN+FvasZB3
	 wA1/UHXqcZY0ybQCNkKpC9sSjNL9ZwAiuKc9WCQElVLFa4Vft3VNlekUuPeOw1pQCXdgI
	 6V+/kLew7LqoJ74nCWwCKOM6kDRVCrp+mtr+QeIrP/KWJKK1wAZJdMnD8AZjHee9poj9m
	 cj3L+CJxtORfFbL3KVOstbl4pW4qj455H9rPXqEKTWjVFEFn7Omxe2bEkudrQRgNivA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=skotT+C3;
	arc=none smtp.remote-ip=74.125.224.41
Received: from mail-yx1-f41.google.com (mail-yx1-f41.google.com [74.125.224.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0BBD606A31E
	for <linux-usb@vger.kernel.org>; Sat, 28 Nov 2026 00:16:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E0BBD606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=skotT+C3
Received: by mail-yx1-f41.google.com with SMTP id 956f58d0204a3-67db8985419so10777564d50.1
        for <linux-usb@vger.kernel.org>; Fri, 27 Nov 2026 16:16:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795824973; x=1796429773; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=tTWe7d/JA8UqJTHQt7KWcT8ojN0qEryOEBsHqx2uc5w=;
        b=skotT+C3nKiMFIjYCgLoX+K04+IPDVrfDkzyeoVapCOW/THhiTZiuTWZA5KRtid6Zt
         nxhUap5Z/RKR3IwBjwmq7KSsw8v2egcRhhcySY5i7KAZFykbuuR5FZQcblCQOIyGD2Vj
         fpG9xwsD4r2wgSjMtRB+aPG9EvcKtMpAAyM/1lq59/d6MCCcTJdgr0GOVPORDy0HOBJH
         fG7EAJovTqQXksA+E0iQOtWNXCm8+fg/xZuabTHGu0xp7essix2GnybfW/nzQqF+h1tr
         eniMp1qSB9cHcBcDf3Ng6ubnFvS3x7GASSwrb2p7F7QNB7SJiRmOk7SjBqXL5t3xh6on
         V07Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795824973; x=1796429773;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tTWe7d/JA8UqJTHQt7KWcT8ojN0qEryOEBsHqx2uc5w=;
        b=q568I7X8/gcLnjQ1fui5Rg+kksesJ6E67FVctG2R7U0Xox/bqd8WOfHzO4P3c00nhL
         mS9pM/81WHgZeHDXz1J87T7um8KDBCKkt66oGmp/4q71lZAgMBBzqhwsmaAoFhwyisLl
         VaX2o6Yt6DO2Kfy03UFTpYsVPyKb7T1iYnYxqhJrbmcrnwnwO2wET7Lqr4eU7C2+C17Y
         E4NhrxHt/6NdWVmSE7CrBuxX+tIgnOe0wKGkka1TVRwJvTdRdc9220RzepI/pMt4bqq2
         4rxCvy4pEQxEO30+/xJIEKkFFxnAzBQ7k8oxesMY1b09thwEzI/T9i/Hdq7Qshnecp0a
         63TQ==
X-Forwarded-Encrypted: i=1; AL+hErGsQmvGkQNUgWEkbFwmUrb2OFe8NBKtTlhHaKr+IeX2CgHQJi2yVsGhGErU5SP5ip4r3p/S1FgWoVM=@vger.kernel.org
X-Gm-Message-State: APuU4Z9RmZMMSx13g7Yj0hmyVfvWeVVYNEmzUazY3mNhz1XRZsVLm1Fg
	IzUbZY4Vih14wYM0Hlj1fG8HulLTinLZGkieDA+VVnRmiN6eRpSdjNc2
X-Gm-Gg: AZFdTZd50EAg2+F52PXs/Gg4IbIjNHKJizhxhtWqIws8uEFitUtw05c82tBv/b7+9BC
	15jDsKwGwC6XUjuxd/grueyr44yIw5aV5I+gtKp8A8Kqz1Ls3qc8/5GSzcAxU5bFyeQisHXa9ZY
	2iktKYkDLbberCBKOfzxvWGxCFEvsewZ8MviTvXm+6ec8xBet5yJVJRa9FXZq+TANHEu7xn/1Ep
	AqMPuYDHtY0OAvDCO0bSheybivtPzmMLuNof1mBXq6bUrTj7MgipATydCvQaibt9hFsseXn40FE
	N9XJplPqpKBMLnGCQ+yWUDO0irEjrHQgSS11ucXS2f695x9gOuO0Z/lkjqHyJqwYqsEr3CHrQpj
	qE/yS3PdjXXHes0H/4XPMkuJyp5B7uYPOOKsg5RoyAv8bC+4sLQJXvty82ieJa2sEUOuUyM/JP3
	raxIV6sITQSkVaPSN36aAmLj1IoSr13NDs0X00jNTrJyZ/dWUx3ZW5VsPP7io9ZkCSGgprWKNMV
	Rj885hhkOAO22XskcNgy1YHpLs9WmjDSFtmEr/0TpD4M3CguS6tbXQ8Q/v/6s/WN3h/HsW1Bm1x
	+aMtADZhxO/SMxPx49T/Qp5xEjtrZNnYY//KgGNhcXEbWNrlpbD1PPwJ0nTi/VqRlms=
X-Received: by 2002:a05:690e:80a:10b0:67d:bcde:a150 with SMTP id 956f58d0204a3-67df448bbd7mr8243684d50.65.1795824972729;
        Fri, 27 Nov 2026 16:16:12 -0800 (PST)
Received: from nerdopolis2.mynetworksettings.com ([2600:4040:5e70:4900:b224:6226:2e9d:e3b2])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9217efd0637sm74422316d6.42.2026.11.27.16.16.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 16:16:12 -0800 (PST)
From: Adam Simonelli <adamsimonelli@gmail.com>
To: Johan Hovold <johan@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Adam Simonelli <adamsimonelli@gmail.com>
Subject: [PATCH v5] USB: serial: visor: add vendor/device IDs for PalmSource devices from inf file
Date: Fri, 27 Nov 2026 19:15:57 -0500
Message-ID: <20261128001557.452362-1-adamsimonelli@gmail.com>
X-Mailer: git-send-email 2.55.0
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

PalmUSBD.inf from Palm Desktop 6.2's driver defines two PalmSource 'devices'.

Vendor ID 0x13e8 in the inf file indicates PalmSource as the vendor.

PALMSOURCE_DEVICE_1_ID (0x0600) appears to indicate PalmOS 6.0 Cobalt. No
devices were actually released with PalmOS Cobalt, but a development ROM from
a Tungsten T3 made its way onto the Internet. This ROM can now be loaded and
booted into RAM on a T3, which once loaded, the T3 now presents this deviceid.

PALMSOURCE_DEVICE_2_ID (0xff00) is also defined in the .inf file, but there is
no known device or ROM with this id for PalmSource.

Signed-off-by: Adam Simonelli <adamsimonelli@gmail.com>
---
Changes since v1:
 * Fix compile error when changing from 
   PALMSOURCE_DEVICES_2_ID to PALMSOURCE_DEVICE_2_ID
Changes since v2:
 * Add note for what changed in v2
Changes since v3:
 * Fix up commit message
Changes since v4:
 * Don't handle PALMSOURCE_DEVICE_2_ID

 drivers/usb/serial/visor.c | 3 +++
 drivers/usb/serial/visor.h | 3 +++
 2 files changed, 6 insertions(+)

diff --git a/drivers/usb/serial/visor.c b/drivers/usb/serial/visor.c
index 5706c46c49c2..b985f9c53e1c 100644
--- a/drivers/usb/serial/visor.c
+++ b/drivers/usb/serial/visor.c
@@ -75,6 +75,8 @@ static const struct usb_device_id id_table[] = {
 		.driver_info = (kernel_ulong_t)&palm_os_4_probe },
 	{ USB_DEVICE(PALM_VENDOR_ID, PALM_ZIRE_ID),
 		.driver_info = (kernel_ulong_t)&palm_os_4_probe },
+	{ USB_DEVICE(PALMSOURCE_VENDOR_ID, PALMSOURCE_DEVICE_1_ID),
+		.driver_info = (kernel_ulong_t)&palm_os_4_probe },
 	{ USB_DEVICE(SONY_VENDOR_ID, SONY_CLIE_4_0_ID),
 		.driver_info = (kernel_ulong_t)&palm_os_4_probe },
 	{ USB_DEVICE(SONY_VENDOR_ID, SONY_CLIE_S360_ID),
@@ -133,6 +135,7 @@ static const struct usb_device_id id_table_combined[] = {
 	{ USB_DEVICE(PALM_VENDOR_ID, PALM_TREO_650) },
 	{ USB_DEVICE(PALM_VENDOR_ID, PALM_TUNGSTEN_Z_ID) },
 	{ USB_DEVICE(PALM_VENDOR_ID, PALM_ZIRE_ID) },
+	{ USB_DEVICE(PALMSOURCE_VENDOR_ID, PALMSOURCE_DEVICE_1_ID) },
 	{ USB_DEVICE(SONY_VENDOR_ID, SONY_CLIE_3_5_ID) },
 	{ USB_DEVICE(SONY_VENDOR_ID, SONY_CLIE_4_0_ID) },
 	{ USB_DEVICE(SONY_VENDOR_ID, SONY_CLIE_S360_ID) },
diff --git a/drivers/usb/serial/visor.h b/drivers/usb/serial/visor.h
index 622d639ce74e..c99b8b8f999b 100644
--- a/drivers/usb/serial/visor.h
+++ b/drivers/usb/serial/visor.h
@@ -32,6 +32,9 @@
 #define PALM_ZIRE_ID			0x0070
 #define PALM_M100_ID			0x0080
 
+#define PALMSOURCE_VENDOR_ID		0x13e8
+#define PALMSOURCE_DEVICE_1_ID		0x0600
+
 #define GSPDA_VENDOR_ID		0x115e
 #define GSPDA_XPLORE_M68_ID		0xf100
 
-- 
2.55.0


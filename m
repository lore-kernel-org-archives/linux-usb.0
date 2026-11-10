Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794281716;
	b=kZxlUjWzaLhJAYkXD5y8WGihLPp+zyVIx4IgShnoITntekwCFp3C49tE4bMLAsOdbhGp
	 mWNH883TiVQQnpkzd1ux5jPFuyukaUMirGPosomdbPtZTseiNk+iCqNCHHd5lxA4zn6ZS
	 8/byD2a454bNlS8Gqk5mRUPqzBY/SmVKA8132btPlzAG6BNHpFbWxa4axoTfCMaKtHfYB
	 Dwt+jDrG4qhFThy8VKTZ4Xaf7SIE2/Ml/zcT8vqEPkydFi1LlkbqtsCE+Wrr+lx+S/Y58
	 6oq0Inkw4+bZapkS0T28Vwuxa3QqSR0jXL8usMHPSeBIS4Hf2zfCQ0eDK+uQFOh3KIg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794281716;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=t111Z5ZVS7PeCXQdsj8l6nyoiLjplHZhuxx+kxKc2aQ=;
	b=Sezuu/sx6ajl6IS3oZgpa3Cj/Aia6e1sP3X4OYmF56kmDy3Dteh+k90UDDhec3RdBD1a
	 Knl8svjSP7CwCeZ+RIVkw96y5q+KKGiuvBlsBWTB+WSz6ARlblJWSJ7xtXvdZWbxIUypr
	 nSGaO7yw4U89DbCPsP81IiXG9DCjZo81l4Cf5FiXUXpyZX9oamZ7qlnTtZMtc30iGUbAe
	 JkVNp2rDzjyBRMKGTiBae8yAgt/rcEYuAQactbP5YNJfKpE8PTTJ5S9NbxEpFK4+/Vxg4
	 4HjQ1HNium0HHQ1BXx890qsBkusPbwNKytMo2C6KGn7rmpC8+5MTm6EnnylxTtHnH3w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vcHuEEPG;
	arc=none smtp.remote-ip=209.85.222.175
Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69758606A31C
	for <linux-usb@vger.kernel.org>; Tue, 10 Nov 2026 03:35:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 69758606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vcHuEEPG
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-93ece7a73b9so172194885a.3
        for <linux-usb@vger.kernel.org>; Mon, 09 Nov 2026 19:35:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794281715; x=1794886515; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=t111Z5ZVS7PeCXQdsj8l6nyoiLjplHZhuxx+kxKc2aQ=;
        b=vcHuEEPGEfS9GtHdi1oSomu34fd2QFM5OBHgNS/GrPPOfyFLmWZUAF6xrjz+9wFZmE
         cJlmqTGzsmKPzjsLZ1bGn3ZfftvGChh6fjP1TgutcGSfDtMX8uZ+ch7yp8EPXwbPT0Hq
         U6T5CZAR5dJLHpjOAqLwBw7QjzFmM6rRFgrLaZwUifXZIL9DyPBxpb5e52p03r4AfNTm
         Ws2CdoHm+eLYIDShdbcU9DpSEjCD7iEkFF86Fe10fY+SiD2unK22Kvp9GWvohEWuVHFy
         mxvCr6R1/9edUkg/C7CslJKekIYZKe+CC/fTYmmT726MDOTgUEmcYgY6CCbVT3L6kM0E
         Bviw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794281715; x=1794886515;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=t111Z5ZVS7PeCXQdsj8l6nyoiLjplHZhuxx+kxKc2aQ=;
        b=vDv7YCpc7rbHvW35KSptUTYMcAejX1KFAnU2mZIr+pAbwhj+XY9G8niNALnf4NZOC4
         bm/mWcF/sNzxx5qMpEFZ9F8pjXxc8GJOSxbOkiahagh2VzZPAcJ0kmPjnkAOwyaIiR0f
         bH0rwan6lm8A9c7NdDDcxcgSdOeeoeb2FArhKrK1K8ziHuHwKIlIyNG4R4+x/n3DdG3x
         LjcBL5+xNwKTOqGs0tOZ7dVA26wipOGUtCqUTbmDNlX6U1Tm1WYUS/LNXigRg1WORSFM
         QlxQ4CSjd11Mp/yZV3YA4bfPCtZIR7EMtZvqR7drZexPWw5PEywM0hVqIHGn+vDF+tho
         kTvw==
X-Forwarded-Encrypted: i=1; AL+hErGDGI4VvBg+8dW0Qdu+R9G9AnM3cdJZQsuKLAsRIqGm+8HXHudDGLW3aauCTSytjepYj4psDMnT4sM=@vger.kernel.org
X-Gm-Message-State: APuU4Z+uJF8kFWbOyCH2ouvuzer9E+WyfkfKFad9EicA11EwHNri5ipv
	NybCnBWByOyRNmQZT/blcHbpj4nTNHIXesB4pnWuRya3YQ5fv4PPIuNC
X-Gm-Gg: AYBFou0qy1Pb28bkgITG5uy3n8N6CVkfDu8KKIZs6R9S6+mBxl442nw2qJ/h2IPr+XB
	nCOfXwgkbsU1USIecj3do8r/QJRrc9o05INmF4wY8mhJdhE1rsjVG9VZwaFKuWuzrdrY95pnOvl
	Toa/OJ+bZD5W0iHr/4Naz2kYrZHSzyDVsiGRu0/Fnv/InozYEJo2NB1e/ebpEcvl+rha0opoERq
	VFYYXy88OIhcgL1L6G6GzuI3uqNtFmchmlAHGHQrnaxYuvFyxLvso5mjFz3yGO3hUXU9a9Artxt
	vQrDkaNyuLR34Ur4nsV7wEWSiRwcCn1gcsZHngvXOKnejNYKzKkwcljZatqaZEY7MivrsDcU8iW
	KTyj2fRl7UsxxeVqLf+WSHcgKvAk5ZvcbKuXVZJ2yyC0lQO4MJisi4WxmO/zXaLSra74WYceCs9
	NbinL3zQxjCylsWnKK25I+PlNcw/tWMkRa+j1FQU3edsqfFFQ4k2euyUyqRN++Mp/GMJL88qApM
	tQ5XlIc7GCyOOxIHh9Md0qw2c1BmUcjqNwx85mDrKh1UIXAGJvzp5yhSxX7LQnZY0zSr/zRJHrT
	EVEOCloN323IsGSQ611r1/mntKJXOfFHky0kIjeMqD4iUqqcol51EGe1qLg3AyFRHBQ=
X-Received: by 2002:a05:620a:4385:b0:93e:d1d0:67f with SMTP id af79cd13be357-9479f3bf9damr224060085a.51.1794281715382;
        Mon, 09 Nov 2026 19:35:15 -0800 (PST)
Received: from nerdopolis2.mynetworksettings.com ([2600:4040:5e70:4900:9dc4:9216:4f52:6891])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9479e7ffa11sm125282585a.43.2026.11.09.19.35.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 19:35:14 -0800 (PST)
From: Adam Simonelli <adamsimonelli@gmail.com>
To: Johan Hovold <johan@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Adam Simonelli <adamsimonelli@gmail.com>
Subject: [PATCH v4] USB: serial: visor: add vendor/device IDs for PalmSource devices from inf file
Date: Mon,  9 Nov 2026 22:34:52 -0500
Message-ID: <20261110033452.306269-1-adamsimonelli@gmail.com>
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

PALMSOURCE_DEVICE_2_ID (0xff00) is just included for completeness since the
INF file from the driver also defines this one.

Signed-off-by: Adam Simonelli <adamsimonelli@gmail.com>
---
Changes since v1:
 * Fix compile error when changing from 
   PALMSOURCE_DEVICES_2_ID to PALMSOURCE_DEVICE_2_ID
Changes since v2:
 * Add note for what changed in v2
Changes since v3
 * Fix up commit message

 drivers/usb/serial/visor.c | 6 ++++++
 drivers/usb/serial/visor.h | 4 ++++
 2 files changed, 10 insertions(+)

diff --git a/drivers/usb/serial/visor.c b/drivers/usb/serial/visor.c
index 5706c46c49c2..18c586d552d7 100644
--- a/drivers/usb/serial/visor.c
+++ b/drivers/usb/serial/visor.c
@@ -75,6 +75,10 @@ static const struct usb_device_id id_table[] = {
 		.driver_info = (kernel_ulong_t)&palm_os_4_probe },
 	{ USB_DEVICE(PALM_VENDOR_ID, PALM_ZIRE_ID),
 		.driver_info = (kernel_ulong_t)&palm_os_4_probe },
+	{ USB_DEVICE(PALMSOURCE_VENDOR_ID, PALMSOURCE_DEVICE_1_ID),
+		.driver_info = (kernel_ulong_t)&palm_os_4_probe },
+	{ USB_DEVICE(PALMSOURCE_VENDOR_ID, PALMSOURCE_DEVICE_2_ID),
+		.driver_info = (kernel_ulong_t)&palm_os_4_probe },
 	{ USB_DEVICE(SONY_VENDOR_ID, SONY_CLIE_4_0_ID),
 		.driver_info = (kernel_ulong_t)&palm_os_4_probe },
 	{ USB_DEVICE(SONY_VENDOR_ID, SONY_CLIE_S360_ID),
@@ -133,6 +137,8 @@ static const struct usb_device_id id_table_combined[] = {
 	{ USB_DEVICE(PALM_VENDOR_ID, PALM_TREO_650) },
 	{ USB_DEVICE(PALM_VENDOR_ID, PALM_TUNGSTEN_Z_ID) },
 	{ USB_DEVICE(PALM_VENDOR_ID, PALM_ZIRE_ID) },
+	{ USB_DEVICE(PALMSOURCE_VENDOR_ID, PALMSOURCE_DEVICE_1_ID) },
+	{ USB_DEVICE(PALMSOURCE_VENDOR_ID, PALMSOURCE_DEVICE_2_ID) },
 	{ USB_DEVICE(SONY_VENDOR_ID, SONY_CLIE_3_5_ID) },
 	{ USB_DEVICE(SONY_VENDOR_ID, SONY_CLIE_4_0_ID) },
 	{ USB_DEVICE(SONY_VENDOR_ID, SONY_CLIE_S360_ID) },
diff --git a/drivers/usb/serial/visor.h b/drivers/usb/serial/visor.h
index 622d639ce74e..0f86bd06c4fe 100644
--- a/drivers/usb/serial/visor.h
+++ b/drivers/usb/serial/visor.h
@@ -32,6 +32,10 @@
 #define PALM_ZIRE_ID			0x0070
 #define PALM_M100_ID			0x0080
 
+#define PALMSOURCE_VENDOR_ID		0x13e8
+#define PALMSOURCE_DEVICE_1_ID		0x0600
+#define PALMSOURCE_DEVICE_2_ID		0xff00
+
 #define GSPDA_VENDOR_ID		0x115e
 #define GSPDA_XPLORE_M68_ID		0xf100
 
-- 
2.55.0


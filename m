Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794007994;
	b=GY1eFQayW6K1k3qu9Dzl4Vbd09gtyvq79oCaUlpzGl2+06yiZ3oIYbGcd1S2kGImxK29
	 33ebOrg9TvVkGYUUtPV0KMjSLDS6EYVV+zMvvTNrGDP5C5M1a5Abw74oxoZxpnUFP5WHk
	 /sl7/i7dW5qy8wNKBvz1UrpxWkZX5DRcriOy+39Zgd709Uhrl+vfhg6+mhRzX+TdKJ358
	 tzAsn9pFgYY+Z04tHdxjzhV70DudVx5yfFu16dw2/v7HlTxispXvPGFr3WJ7XJYm+qZ+i
	 2WSuprqL0/WonC0A1CXeHnRP8Awr8HsrMKn2JFxcGh1rPr7Qr3drOXNNQ0KJx55krKw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794007994;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=zxfYVvH5G04u6i4PPEDKV6DF5oBNEBfWKzG/rxdV9B0=;
	b=KG3Wopbguel6IM71/6GkXUvS9zOAQTrhKueIc2c/TqM7owuT7i2d+S/hx0U7MyOG1IPU
	 vq0p8Lm27pL9RlzIL0/cDShAp7r1oIyNHuFZRN7iAxud7UbjYxKG2AYOLy4sRN+mBAN6B
	 lqL5rZnKpaR3aT/9ZFWS50uT28sb3OAU8GL0EM1lw/jEwKwN8IDOUN/IdjbcUe+U/eqOt
	 IveTE/7j4ittcFDTHxwWGl9My1An48oBNKcvtNwKYjpg0tJEUBFBiid7YUMAzohUnsVGP
	 7C3fZQbewEWhqUUD7leNFhBlpjG7e4ml9NU38ZAXCtsQDacfHVK/3drko8rQmrxL4pg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dtE7RUna;
	arc=none smtp.remote-ip=209.85.219.44
Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 332DB606A32C
	for <linux-usb@vger.kernel.org>; Fri,  6 Nov 2026 23:33:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 332DB606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dtE7RUna
Received: by mail-qv1-f44.google.com with SMTP id 6a1803df08f44-91eb3fea2a9so8468776d6.3
        for <linux-usb@vger.kernel.org>; Fri, 06 Nov 2026 15:33:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794007993; x=1794612793; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=zxfYVvH5G04u6i4PPEDKV6DF5oBNEBfWKzG/rxdV9B0=;
        b=dtE7RUnaeY8tP9khziSLkFTMz9CrC7KCDdxq2hMm5VDXP35abZlI6zOM9Dr7M3GHN9
         h8Vidq7aBOXKQcn1zk3lVgqD1gMtxL1AYC9xeM6kqniioVnpnoUDgB6EJeiTLSu9Ls3z
         TZeTLJCt5Awwyak9g08AyRxsJos+R5yhWxt5FOX84fv/BOo+hfXtXqPBWPCATSOz9sqd
         5vDkMYubVFmwc/7llxi59qUf5VHA2yWh5z5872LJzS9uJpSnC+Gazz0IsXAc79QBieJP
         amb9H26pi3sDtGHNRnsBjzIVga/Livxj3kk6S7hvmqmWOh8ZqRW0sPW7vqSOowLGXu2x
         6oGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794007993; x=1794612793;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zxfYVvH5G04u6i4PPEDKV6DF5oBNEBfWKzG/rxdV9B0=;
        b=HWGSy0u6CweEcaWVLENBOUtFs54gfwyDtURXrPjPMsU7poAHcBd9b9bxXqilIkq74B
         qojAi3zy8iupJ1sObFNth+Gn4tUAH1pZKjaPYv5wnAf468Emr2A8m+DRXE+cmL70XhvA
         VTCyAH4ngK2ZhlCpPg7XVfeVU0eaGdafCyce5+21/txBBZUBDqAHsfP2oE680lygbuuH
         lKz3ZMIgXVOdIzkMtUaJeuNewa+L3m9H10VLgsaJjpj5SPkBWTS8FE0wbdC+qEl1QSkC
         wlC7WDNftUHSKLYzYIuRyDisBOLEStMyCzesTWJU2g59IZyFbKts5rsLZeo+cPn9l43/
         4xOQ==
X-Forwarded-Encrypted: i=1; AL+hErFhO4pTr50Lvdv0JcIlXiHSVmhHd2J1obm/8O8btQQUcgxsXwdg7ULEQs/ILZ/SOR2+dVgrztnpN2o=@vger.kernel.org
X-Gm-Message-State: APuU4Z+ou9Lb14nfIkPcJP7NPHtm6F9rOZoVG0U/MfC5zjFG8Gc9l82n
	5hJ0Bra1RzJQF4QMXkkGLk/k73oCXg5YQJNI5p5G2d5UvXdEjl7WKtoBGhU182xY
X-Gm-Gg: AYBFou1xS/7hkml+f36pxTNT9+T3HgQLzvnpjJagoVsUuvhhHtHIFdeDIkSPqBHDqWE
	uohAB6frCoEtr9/41mOFevLAkzHEpdGjw/19J93tDtqGoWUT3GP1Y10XJWii36zVTWDdmku8Cgu
	pSZyA1YJ4G7Yp3/gMJaF3SEB3i8U0tVeL2dXGsffxrG0VBVjv49Yqx23HjHXAoqHMtQCefAZmkr
	U83xPhvwePJzqQ4uf8X13RYd0WnXckU7K07LBN/Y/Nn0sq+gsWVnMs7jJihooIODU0W+T06Lc8B
	ixJYryhLTJ59MBWl/o6GRuDlDdJrkp57K5eFzeTYvj6wNz+KzRFwRdmIkfB7H6cOo3BLPhFVrLX
	qMv2BI8DYLR4Po7U6fAdusBiOumVZYuR/fm84z5ApuuEc520+CR7e/TJTfdCKAGUmEKhzORIXbS
	7PGSOzs/GX3un+DcvV7ldY8bcZeDIPlo61IP0mzJEDPSgN2CUnuQ3E+PcywFcevYSzCZqn1HEWS
	h1wvSW2kwZibB17zaFSR/GJWNytPpCk7B88ujMaTwT9+8dCL1DEtQRIpZjqFaZjVLiZvUzuUAht
	GYo8SEYzueF7X3u/UCLSkLkAvO2wy6Z1aTzOpmphy6MyFEAxUPxUJfdbjXT0Rvml/i1nf21WZkm
	IhuksJaERuy3Y
X-Received: by 2002:ad4:5769:0:b0:91c:9086:ee29 with SMTP id 6a1803df08f44-91ea97502c0mr61821976d6.40.1794007993077;
        Fri, 06 Nov 2026 15:33:13 -0800 (PST)
Received: from nerdopolis2.mynetworksettings.com ([2600:4040:5e70:4900:f826:3fc4:9d57:a627])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91ea6a870dcsm31066286d6.30.2026.11.06.15.33.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 15:33:11 -0800 (PST)
From: Adam Simonelli <adamsimonelli@gmail.com>
To: Johan Hovold <johan@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Adam Simonelli <adamsimonelli@gmail.com>
Subject: [PATCH v2] USB: visor add vendor/device IDs for PalmSource devices from the PalmUSBD.inf file in Palm Desktop 6.2
Date: Fri,  6 Nov 2026 18:33:02 -0500
Message-ID: <20261106233301.3267777-2-adamsimonelli@gmail.com>
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

PalmUSBD.inf from Palm Desktop 6.2's driver defines two PalmSource
devices. While PalmSource only developed the PalmOS, and never made
actualy hardware, as it was Palm Inc. made the Palm hardware, there
is a bootable ROM containing PalmOS 6.1 that can be booted into RAM
on the Tungsten T3. When this ROM is running, when plugged in, the
device will then present the PalmSource vendorid that is defined in
the INI filem and the deviceid then becomes PALMSOURCE_DEVICES_1_ID
the PALMSOURCE_DEVICES_2_ID is also defined for completeness.

Signed-off-by: Adam Simonelli <adamsimonelli@gmail.com>
---
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


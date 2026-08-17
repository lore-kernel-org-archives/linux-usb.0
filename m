Received: from out162-62-57-49.mail.qq.com (out162-62-57-49.mail.qq.com [162.62.57.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 506E776026;
	Mon, 17 Aug 2026 01:41:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.62.57.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786930877; cv=none; b=ZyHGKN12E5OE1xyGW27mc8UU6uCTNVgmW+OU6XVf5nDBHco2FcwFEfYJB12liM9iOQ+yrxLN5JT2TiLqQlOWMOC/hHsAAXZOsoTsC4xDnULuXqWPzT4ExEjhnwhThcyrN4PHGy+Wwm/dkkTrQc3ALJfkKHhJyGfzedkKw536Ff0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786930877; c=relaxed/simple;
	bh=6BIm7BMByHKj7zyqcfFg/yFZLkCAd+wsMYbugSKk2Wc=;
	h=Message-ID:From:To:Cc:Subject:Date:MIME-Version; b=a0+QRd0ZTtwrknLoJIZ9Ibk3wThUXLya6NuxkNIackPnJeqyXtOgzQTWGH06JLabCI8R+pnQT/m5L81/0ShXc/hHVpo7OUHKuaU5NK2zv/BHm+1BB7xUTFUyKg2/0OVge0icc8g99afvwS3K76GObS98sp25FW+ILuX1OEJY31c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foxmail.com; spf=pass smtp.mailfrom=foxmail.com; dkim=pass (1024-bit key) header.d=foxmail.com header.i=@foxmail.com header.b=QeSUXKQC; arc=none smtp.client-ip=162.62.57.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foxmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foxmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=foxmail.com header.i=@foxmail.com header.b="QeSUXKQC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foxmail.com;
	s=s201512; t=1786930867;
	bh=l6RNkkgRF3Lz/nqmXo9xNBfItShcbdgyV1uj50wqTgc=;
	h=From:To:Cc:Subject:Date;
	b=QeSUXKQCvE9HfH5OwHJ2T4NHdci7SwQ7r0X4bZmDvvjUHloGb2fKGn+CRSr5+1ubq
	 Dfute3GLoiRr9Uhknw7aL2/Cm8Uzoq/RR/enJ5bPvHLMg9/L/fbQZvLQJbniGqjLQF
	 hRSNsGsDSVn4e9c2dcvqAvLvkFdrvlM/t+UOfaSs=
Received: from localhost.localdomain ([116.128.244.169])
	by newxmesmtplogicsvrsza63-0.qq.com (NewEsmtp) with SMTP
	id A45B42DF; Mon, 17 Aug 2026 09:41:05 +0800
X-QQ-mid: xmsmtpt1786930865twnr5muz6
Message-ID: <tencent_E58647B4DE1D2583D785AFDDE58EB278FD05@qq.com>
X-QQ-XMAILINFO: MRMtjO3A6C9XaqsAvpKqWuTmqE8xEhtPwRlfcl2QxYgiIp5Phn9yR9DhGszEAz
	 nWxzEiVHzIaDn2y3Pnp9LlfZcrCW22w9AmG0N1viNgY59tu7rJPFzur8TeUBZSWDs23CMC86UaAc
	 CEtz2y9t+si+4Zx3y2X/lF9MaMovdOud9jrU2BH7R3Zbmn18XZsmfoVEXGsk0iW+RFLAZHMmJ9yC
	 TWYqTtKDN92y6E4dwK29Mz5RXsRBhQEk1DEKmkW3YE4ZAunVqhBR2yqWgS6/QxD5AVG3vpGfFrP2
	 r2o1Ph1Q4c8Xfl32cAAojt4rnQOuYMf6EESejgHZMisF9hgOuNz871fqRCo1hBUKgh6tLYXbaCRv
	 97TgTjW9aYmNPPCzfbK5QQgOVmDKDuvqWlXgbaoXvwbgPv3o8jvinyQR+3Mq33eQlR95f+nf5ylI
	 MaZpJ4NsCvjSCF8alCkj44Y1oSrOhzl+Yk6XlaYLg8A0eA2yQ0Dm7iNeMfQf7TLn4soeEngeqWgS
	 UGmJIbMDHR27kfYs4GTBDDOfAZH25nY9iwOygtF3YBJ5qS0q+m+sftqqVx26S1MecQjGJrrB4REh
	 bue1UZSR7eudoj3nE9bb6t8S8zbvb4IkSVqnjLJNPvFcDhKlFdEtHSmoJYhkcCej6n+FdmqqFnLT
	 Hhl6gPodk1KcgR9N0/b76K1nj7G1VYXU7cyj0FLFRS5E0z2MyfqzVy8rjDdjXRLHLKQV5OBJwklC
	 zXaCjHfGFKT7R2/FX3jLoL/UABZXoqsg8uMx3wGBzcsQFqhBw0Hobqujuyu7NDVeP7w5Wlc0Og7Z
	 AKnE9Xtic6KBw0JWQMzX8JsjXCSYn8pNnGlxL+MGGY1NPLjeT5Trt4PogIQxFFik16aY9lPRvxs/
	 fo/ypndHsNQ5A8dqIFwC/RyHsDlrWH3EgrLi/NgE/1aqYYo5jIAFbgtMd7lDX+zgugWUEBFe1UMy
	 npHBWGSTlL17l0r9pjZVWkyzltxK/5H4KyZreP62dYV4VRvBEYv7jagDmyRJLgywkHFsQQQzlwdd
	 wHOJEP+3dK6o5BoEXQbJvPGJtI5VzCgOZH1Rhiowmz80imYeSZozp4CPi3FtfQ4WZsFJdxGEfy0v
	 lENTTH
X-QQ-XMRINFO: MSVp+SPm3vtSI1QTLgDHQqIV1w2oNKDqfg==
From: Zhao Dongdong <winter91@foxmail.com>
To: johan@kernel.org,
	gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Zhao Dongdong <zhaodongdong@kylinos.cn>
Subject: [PATCH v2] USB: serial: option: add support for SIMCom SIM8260C
Date: Mon, 17 Aug 2026 09:40:05 +0800
X-OQ-MSGID: <20260817014005.61213-1-winter91@foxmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Zhao Dongdong <zhaodongdong@kylinos.cn>

Add support for SIMCom SIM8260C (1e0e:902b).

T:  Bus=08 Lev=01 Prnt=01 Port=00 Cnt=01 Dev#=  2 Spd=5000 MxCh= 0
D:  Ver= 3.20 Cls=00(>ifc ) Sub=00 Prot=00 MxPS= 9 #Cfgs=  1
P:  Vendor=1e0e ProdID=902b Rev= 5.04
S:  Manufacturer=SIMCOM
S:  Product=SDXLEMUR-LITE-MTP _SN:120696AB
S:  SerialNumber=0123456789ABCDEF
C:* #Ifs= 8 Cfg#= 1 Atr=a0 MxPwr=896mA
A:  FirstIf#= 5 IfCount= 3 Cls=01(audio) Sub=00 Prot=20
I:* If#= 0 Alt= 0 #EPs= 2 Cls=ff(vend.) Sub=ff Prot=30 Driver=option
E:  Ad=01(O) Atr=02(Bulk) MxPS=1024 Ivl=0ms
E:  Ad=81(I) Atr=02(Bulk) MxPS=1024 Ivl=0ms
I:* If#= 1 Alt= 0 #EPs= 3 Cls=ff(vend.) Sub=ff Prot=60 Driver=option
E:  Ad=83(I) Atr=03(Int.) MxPS=  10 Ivl=32ms
E:  Ad=82(I) Atr=02(Bulk) MxPS=1024 Ivl=0ms
E:  Ad=02(O) Atr=02(Bulk) MxPS=1024 Ivl=0ms
I:* If#= 2 Alt= 0 #EPs= 3 Cls=ff(vend.) Sub=ff Prot=40 Driver=option
E:  Ad=85(I) Atr=03(Int.) MxPS=  10 Ivl=32ms
E:  Ad=84(I) Atr=02(Bulk) MxPS=1024 Ivl=0ms
E:  Ad=03(O) Atr=02(Bulk) MxPS=1024 Ivl=0ms
I:* If#= 3 Alt= 0 #EPs= 3 Cls=ff(vend.) Sub=ff Prot=40 Driver=option
E:  Ad=87(I) Atr=03(Int.) MxPS=  10 Ivl=32ms
E:  Ad=86(I) Atr=02(Bulk) MxPS=1024 Ivl=0ms
E:  Ad=04(O) Atr=02(Bulk) MxPS=1024 Ivl=0ms
I:* If#= 4 Alt= 0 #EPs= 3 Cls=ff(vend.) Sub=ff Prot=50 Driver=qmi_wwan_simcom
E:  Ad=88(I) Atr=03(Int.) MxPS=   8 Ivl=32ms
E:  Ad=8e(I) Atr=02(Bulk) MxPS=1024 Ivl=0ms
E:  Ad=0f(O) Atr=02(Bulk) MxPS=1024 Ivl=0ms
I:* If#= 5 Alt= 0 #EPs= 0 Cls=01(audio) Sub=01 Prot=20 Driver=snd-usb-audio
I:* If#= 6 Alt= 0 #EPs= 0 Cls=01(audio) Sub=02 Prot=20 Driver=snd-usb-audio
I:  If#= 6 Alt= 1 #EPs= 1 Cls=01(audio) Sub=02 Prot=20 Driver=snd-usb-audio
E:  Ad=05(O) Atr=0d(Isoc) MxPS=  34 Ivl=1ms
I:* If#= 7 Alt= 0 #EPs= 0 Cls=01(audio) Sub=02 Prot=20 Driver=option
I:  If#= 7 Alt= 1 #EPs= 1 Cls=01(audio) Sub=02 Prot=20 Driver=option
E:  Ad=89(I) Atr=0d(Isoc) MxPS=  34 Ivl=1ms

Signed-off-by: Zhao Dongdong <zhaodongdong@kylinos.cn>
---
v2: Modify the order.
v1: https://lore.kernel.org/all/tencent_CDB9F0B44FDD051447DCF48862B8E764E80A@qq.com/
---
---
 drivers/usb/serial/option.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/usb/serial/option.c b/drivers/usb/serial/option.c
index 580f06f5ce5e..e52f3fe6ccd9 100644
--- a/drivers/usb/serial/option.c
+++ b/drivers/usb/serial/option.c
@@ -2168,6 +2168,8 @@ static const struct usb_device_id option_ids[] = {
 	{ USB_DEVICE_INTERFACE_CLASS(0x1e0e, 0x9003, 0xff) },	/* Simcom SIM7500/SIM7600 MBIM mode */
 	{ USB_DEVICE_INTERFACE_CLASS(0x1e0e, 0x9011, 0xff),	/* Simcom SIM7500/SIM7600 RNDIS mode */
 	  .driver_info = RSVD(7) },
+	{ USB_DEVICE(0x1e0e, 0x902b),
+	  .driver_info = RSVD(4) | RSVD(5) | RSVD(6) },
 	{ USB_DEVICE(0x1e0e, 0x9071),				/* Simcom SIM8230 RMNET mode */
 	  .driver_info = RSVD(3) | RSVD(4) },
 	{ USB_DEVICE_INTERFACE_CLASS(0x1e0e, 0x9078, 0xff),	/* Simcom SIM8230 ECM mode */
-- 
2.25.1


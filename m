Received: from out162-62-57-137.mail.qq.com (out162-62-57-137.mail.qq.com [162.62.57.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27D7143F09F;
	Fri, 14 Aug 2026 09:01:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.62.57.137
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786698118; cv=none; b=JL5qqB/AMyV4M1bDVyHQoinzQTyy2eCaOSVM8HmNMN9qeU6rV0bzSCpHkqHm33Qpe7oXgtmkktvlIW+sch52jjbLmkh7rjrdc9dV/RWcAGBSN9DZbjVbV7+jwDQY+h7hhPcfLDT6AoWoEhMgrmpiZaytDP2bMP1HOMm7cHcUx/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786698118; c=relaxed/simple;
	bh=W7RRVKDxUzp/LNaA6cizI/lvbS7caktsn0OtU1MzZ1w=;
	h=Message-ID:From:To:Cc:Subject:Date:MIME-Version; b=Yo6NzNoRCprGy/ej9uqL3jg2dTSAUZfaJGFZlyZ3A9N57Mf87fzuf1kB798A5FXfDdBaL5Jg3wJUIyuVl6Jo+mXZt7SFzqtpPU1hzP1Ea+TatySYmWEz+bIfq2g92rr/6fxh3/8hk2H7riz2QwuxMpTKM0p9M4WAqkANv0vDqHo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foxmail.com; spf=pass smtp.mailfrom=foxmail.com; dkim=pass (1024-bit key) header.d=foxmail.com header.i=@foxmail.com header.b=PaI3Sr0O; arc=none smtp.client-ip=162.62.57.137
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foxmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foxmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=foxmail.com header.i=@foxmail.com header.b="PaI3Sr0O"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foxmail.com;
	s=s201512; t=1786698110;
	bh=gQhfEsgDo3TVMl5SLLpkFzxDyd+go7Ru4f+rG0WUlzM=;
	h=From:To:Cc:Subject:Date;
	b=PaI3Sr0ObIkCS3XgUPMEm2OEVojGcC+KztC5j6a7pLhExBpr9VLWj4k2ls66f28CZ
	 uyPqW/vnYJa/ZDd6tBZiLHDd5x0kdSMLubY9Q5wILgWOhFHVzZ0w/NsDHvMI2E6R9f
	 yARkd/JX6dUmMaKJaUMXYRqEtRCKuIWvwkFrGwb0=
Received: from localhost.localdomain ([116.128.244.169])
	by newxmesmtplogicsvrszc56-0.qq.com (NewEsmtp) with SMTP
	id 70364F7; Fri, 14 Aug 2026 17:01:48 +0800
X-QQ-mid: xmsmtpt1786698108tqq6wwhx0
Message-ID: <tencent_CDB9F0B44FDD051447DCF48862B8E764E80A@qq.com>
X-QQ-XMAILINFO: OIJV+wUmQOUAaqdIdQ4VP9gv19r1/+L2aap0O56COsbO6RowBMekMWsCXBOliz
	 r4XWzdMNwkyLEZk8PzcXGtsEqw8OnpSA2VkAUAwDoOVlT+lz5bfqk3iwuqSXlHp+NW/qpZqvNhX7
	 YPtlT0V2b1OHmGkGxxTMgWvCw9TjoHrAe/erUE1fyFxFVQy34Hb82bV5xv0Cu8X175m1u3mtGiin
	 GxT+CZ1gANeFXiTvyQVD53twVy+DmRgc1jvGUhQXN/v61TJGNZK5PI4nO3ATd8nJ3f46qAxYQMPo
	 6bypqaRfPoNAsRDVEMbscLa0wBCWzDsV9zSAYngG/lhl9CO0fHYLWGKmzWFbQGnwScw7695PQJhG
	 fCVdq8zvDqij4Zk28LbG6Gek0PIKPaymo0C02hth6u8EQcjGdEViBE6MLApM7TWh22+upMG2CAs0
	 VAxHzaoJgjiAnM0sGnwdUSeKp10inyJ0IZL6Y1eOmVgMXkTNSDCihslwwH699fm1fsUpjOhtQciW
	 7/fGdN4yhEwIk4VMGNmub6FhNtaIPWCSALBs2CnLjj6CK4+lo4DG6c/B+eM/Regh+Gz0JEmpiuhl
	 P5UpETFeta1u4vT7eFPyDDH+P+IaBGh+s0pvRxFD3HgphMPKF/VPMGngS7qBatwdAwd+hKOWbFS1
	 rQY9tRyddtu7g9rjf6+sH2nKUki4Wk5r8MTRd+LzCqINEHonuyuiVCtaOJf5Rry8cE2pk7I4PYti
	 qNdHYHr1B0LKCTOHzbfHFA7YthZg3bfKVddx+nZjO/JrX6kNk7Rf38ANG0CpC5GYsDSDShNTrEDA
	 F4ak2vSr3C9Q4L7XkWytS0yYZPPHCZi8RFvheI/y6MBNw0mpD95OxuRnH0aHhE8FsldEXXMKjD8M
	 c1s0lKAfGnHLrfg6LP+Ns/0c4ea1MOl36vowkke8BeaWOFBxxz3bd2kXhL6gU2NtUYHRk1YfVqHr
	 TBmdxXOxuFP8cnagxh6pk6ziKKqXnJfyGXAJozGgciHyRfNZNXAXKEE3sUrHZGwSIeZ+t8grrVTO
	 OQiUvAcQPlb0LBpC9QmkriArZkIAxhcr8K1ouxbA+SP/X3bHRDrLxjBT4+tkw=
X-QQ-XMRINFO: NI4Ajvh11aEjEMj13RCX7UuhPEoou2bs1g==
From: Zhao Dongdong <winter91@foxmail.com>
To: johan@kernel.org,
	gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Zhao Dongdong <zhaodongdong@kylinos.cn>
Subject: [PATCH] USB: serial: option: add support for SIMCom SIM8260C
Date: Fri, 14 Aug 2026 17:01:15 +0800
X-OQ-MSGID: <20260814090115.380882-1-winter91@foxmail.com>
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
 drivers/usb/serial/option.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/usb/serial/option.c b/drivers/usb/serial/option.c
index 580f06f5ce5e..9c1444af2c61 100644
--- a/drivers/usb/serial/option.c
+++ b/drivers/usb/serial/option.c
@@ -2165,6 +2165,8 @@ static const struct usb_device_id option_ids[] = {
 	{ USB_DEVICE_AND_INTERFACE_INFO(ALINK_VENDOR_ID, ALINK_PRODUCT_3GU, 0xff, 0xff, 0xff) },
 	{ USB_DEVICE(ALINK_VENDOR_ID, SIMCOM_PRODUCT_SIM7100E),
 	  .driver_info = RSVD(5) | RSVD(6) },
+	{ USB_DEVICE(0x1e0e, 0x902b),
+	  .driver_info = RSVD(4) | RSVD(5) | RSVD(6) },
 	{ USB_DEVICE_INTERFACE_CLASS(0x1e0e, 0x9003, 0xff) },	/* Simcom SIM7500/SIM7600 MBIM mode */
 	{ USB_DEVICE_INTERFACE_CLASS(0x1e0e, 0x9011, 0xff),	/* Simcom SIM7500/SIM7600 RNDIS mode */
 	  .driver_info = RSVD(7) },
-- 
2.25.1


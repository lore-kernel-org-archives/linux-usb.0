Received: from out162-62-57-87.mail.qq.com (out162-62-57-87.mail.qq.com [162.62.57.87])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EFC73B6BE5;
	Mon, 17 Aug 2026 07:14:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.62.57.87
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786950892; cv=none; b=S5huj1+xiiH+8Vq8fgZuYyCfzdebD7ckuY2UQTD2mFGlRtojAu6eIQcJBl8YzM5etvfOMtcYQGndMiFL6KwDHqKAvV37l6oz1CVDSg4vQ2Man9m5z++IQlCEG3nURL/tmNwtDwea/E4L7oHJG9PWh4y2ghY8bzzSqV2IIanGSxY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786950892; c=relaxed/simple;
	bh=rnydk5Txrxj71eCs9H0DE2YjGBofRGNvwbQ0gt3xwqo=;
	h=Message-ID:From:To:Cc:Subject:Date:MIME-Version; b=Wa52nG9j1bnoRxjQGqnRoD+G+OnosUsfIhVxDoZi2Ml7mtmhjev5TZG30MrG2AuOEJCmrzps5XikNWxVTsd56y3YbipN/e8XZXxcNZmJJhB9If/VZvioVIrHJfhkN/n3FdgoHXbiRKK/+vzSRioLORA36/2SKM6WAOPmEY+fk/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foxmail.com; spf=pass smtp.mailfrom=foxmail.com; dkim=pass (1024-bit key) header.d=foxmail.com header.i=@foxmail.com header.b=malREd1l; arc=none smtp.client-ip=162.62.57.87
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foxmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foxmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=foxmail.com header.i=@foxmail.com header.b="malREd1l"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foxmail.com;
	s=s201512; t=1786950885;
	bh=kn6wjVFUdsBZr5tCqB4ZpqGoynsm3Ky9wo6vHAV/szA=;
	h=From:To:Cc:Subject:Date;
	b=malREd1l8RgnJPSjKy9UqssdQlOmGVEHYV9dwgiv3J8/1BKaBjMghHkouw+vcIZle
	 TcsHbZWu91hqmifBDe2vCWN2EFijsy32gYylgSJY0h0CuJ3khhMzK0cCiCbR7hLnvb
	 ikkCEH6bZg1RJ2at6DOqPX0/NBNUiUq++lPsLDL8=
Received: from localhost.localdomain ([116.128.244.169])
	by newxmesmtplogicsvrszc43-0.qq.com (NewEsmtp) with SMTP
	id 3ABB42A5; Mon, 17 Aug 2026 15:14:43 +0800
X-QQ-mid: xmsmtpt1786950883tha0fpvke
Message-ID: <tencent_B18DE28D9B60D11077C30C3297EDF6CF3B07@qq.com>
X-QQ-XMAILINFO: Mf9AnuMDDCXXU6aLLHlp2q+937mnv4/0WIkMyXrudInKxbeerr76xzTE/ULw3I
	 +NIhjW4o/7gNp0WiZd7r+zJdwiyQZqc4kILVEZ3d//Rtg9xhUdRdzhHVUNOPk6DhZO8sZFc59sDY
	 A6gLTY0/+MnArHa/AtXceAObOex5WnoPLlUVJjQ2ACLi2klHWmvczPZ4cV7rDjRQ+2270IMUs6VF
	 rcKsFxhBGWlJUDKyGQuZ7f62kcnE+R1VtPIsTqvH3aUmb88Fjbyc+y8E94J4M/lbUAhZaQDTctd7
	 0UX7oqurW1ZRnMEl9x44eIMIbVt6bYoHfcP8hVSTu+Q7ms2rfwAwiMequimb4/twPT41KwCRVFPI
	 h7zZFwDuthfdtgIz8JOdaJMWIhhxUFztr9ahvzsj3sgxiAF32EVqaIW3v/34lNsgcgWCYKXdb+Lo
	 Re1nlfhGywXOa3W5/AFcTlOhDEeWHEGfJQuHWlWia6r6cz6LKU/EBTTb7drOa7jSDCo/OfDQ7xJZ
	 Rs8nISz9C3adjWijBM+IaXf8YkHoXHC3EF8Supu8CgIiDVxjzuYzKrT6updEhu9f4hgyRjX0mNRn
	 bAWhRRZe4R//ZAuBpcU3kw/oQJAFbhUl0TA1oXfgNa2NJPR9GkFd2if7tyOcAz9n9Ht63idiLJWr
	 diyKtYoM1xG/RdoySMb4zbVGXJVR6kUo8brZQUz1/hZpMkeaSTT7w1tZG9YIyhVfKh8Txo4tfnOl
	 IYApB3nAWveOsIaJCM8Kb3yc8ZMSsVfDvt4SyoaLMhwOTARvgTa9e3VDVWrIIYlWk3AN+wLnGhEw
	 BW+aq+vDFzhM5F+B3notJ282r5naOat40ZOSzXHS4Gkf7m3LiUFnsvN1cTIveYOvezCg8y4BaCuo
	 7DlKSlR62ynP6iCC6xZeSFILlnPputppA4gGjfG6w+6i6FiEsz14mAks0i/zLGaBuMhg2VIyuv7g
	 jHMX8sEEW6LpIJgBnaNgSmKPGVX7oqB131xOR1LCM6EgLWIfO8kv02tQyBo8/PSLg+eHH/1Z0ZJP
	 RiTRWSfRY2Vi17mdzj0T9fvCYvHFyUU0KmpfycbkE/9lO2ilRXUQqF9eiFZDm2P/Ajyu3/zyETb8
	 vT+G2cIuK99vXxIXIOAkNoLtHMKZAriRnA8FkvjmtoduLSWHdH3u9nU0q8DC/qAHPtOLauwhz5ky
	 0h55o=
X-QQ-XMRINFO: MPJ6Tf5t3I/ylTmHUqvI8+Wpn+Gzalws3A==
From: Zhao Dongdong <winter91@foxmail.com>
To: johan@kernel.org,
	gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Zhao Dongdong <zhaodongdong@kylinos.cn>
Subject: [PATCH v3] USB: serial: option: add support for SIMCom SIM8260C
Date: Mon, 17 Aug 2026 15:14:27 +0800
X-OQ-MSGID: <20260817071427.302548-1-winter91@foxmail.com>
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
v3: Use USB_DEVICE_INTERFACE_CLASS.
v2: https://lore.kernel.org/all/tencent_E58647B4DE1D2583D785AFDDE58EB278FD05@qq.com/
v1: https://lore.kernel.org/all/tencent_CDB9F0B44FDD051447DCF48862B8E764E80A@qq.com/
---
 drivers/usb/serial/option.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/usb/serial/option.c b/drivers/usb/serial/option.c
index 580f06f5ce5e..06a8e26afdff 100644
--- a/drivers/usb/serial/option.c
+++ b/drivers/usb/serial/option.c
@@ -2168,6 +2168,8 @@ static const struct usb_device_id option_ids[] = {
 	{ USB_DEVICE_INTERFACE_CLASS(0x1e0e, 0x9003, 0xff) },	/* Simcom SIM7500/SIM7600 MBIM mode */
 	{ USB_DEVICE_INTERFACE_CLASS(0x1e0e, 0x9011, 0xff),	/* Simcom SIM7500/SIM7600 RNDIS mode */
 	  .driver_info = RSVD(7) },
+	{ USB_DEVICE_INTERFACE_CLASS(0x1e0e, 0x902b, 0xff),
+	  .driver_info = RSVD(4) },
 	{ USB_DEVICE(0x1e0e, 0x9071),				/* Simcom SIM8230 RMNET mode */
 	  .driver_info = RSVD(3) | RSVD(4) },
 	{ USB_DEVICE_INTERFACE_CLASS(0x1e0e, 0x9078, 0xff),	/* Simcom SIM8230 ECM mode */
-- 
2.25.1


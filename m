Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=111.22.67.139
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795155674;
	b=otrIlo9SfWemZx+/fVAkuIa32eWF7IYYdEdijTu4Sq50vrUyjo6Ed+zOiz25+zHO0753
	 PC419bdysx2fVBdD5k62A40MzcNOC6pBSR411xre3qUf6gMiPZ6ZXynEl4/zTBiOGei6+
	 da/09GTfkYVhCmGGHSFURTllQmemx1rauA+OZj/XA2QkySPVjmtYGmfWWt4Bt2OS+nx8m
	 bax79UHtdcKBcoo+19JM6omkk64TCOBxb/16b3Mihf4Y9ga0zCiHULs7d8gEcHxA3Zt1w
	 uacmf9wwgXQ+DW2SaO9+JoN3DkpOX0uGkcWhrMa9bX2rE6Qx5btIyR1SzQSBxARJIag==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795155674;
	h=DMARC-Filter:DKIM-Signature:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:
	 X-RM-TRANSID:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:X-RM-TRANSID:From:
	 To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=fO65YrUlgiZbB6FPzGtb5sCE5LevnpUS70IZd3Rj1zI=;
	b=4QX0LGOsIurcAuifC7O0jNWugnqykddzFMhvFGrqWPOZN9YiArBufVB/zjO8unAJu9T7
	 7PrnbrvXjyWW4N95sgHwjsa/RI0JxTD8TXu1XjsF/59sEQBq2JqK+tKdvlz3/qEYtm1SS
	 nL9tHAn1QZM1DyKRNOvNfS01jWp7Qr603sEzetGwUS2APCw0xeoOQe1ZJvTLRXUUuqggK
	 UWk9gsduEzhXYokmcqBn3WJoKxy0fQ5qUCVdien1t5Esoo3/4978HiSif35Y6+iDlZ9XW
	 aGLMHsq34kOXXztP7wYRHXfuSmKRH/GNBPsK++UcmQZXNnhB3CFVo8wriIQ1Wvv353Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cmss.chinamobile.com;
	spf=pass smtp.mailfrom=cmss.chinamobile.com;
	dkim=pass header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=hHZvRKTj;
	arc=none smtp.remote-ip=111.22.67.139
Received: from cmccmta6.chinamobile.com (cmccmta6.chinamobile.com [111.22.67.139])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E0FF60A2602
	for <linux-usb@vger.kernel.org>; Fri, 20 Nov 2026 06:21:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8E0FF60A2602
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=hHZvRKTj
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cmss.chinamobile.com; s=default; l=0;
	h=from:subject:message-id:to:cc:mime-version;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	b=hHZvRKTjs7EE4OWd2tXCmBVnz13n5b8TxDFBvOJEkceRDCU3ZSq+YD6e1UelqA0wk9JfCUIAlF1p5
	 5+pwNoMqwJiUaN2jLLxN9HDTFy6YPSZW8L11d2Gtz/1DUgezBcZiDWS4n7ywEHh2XFLXZD2Ijk5fK2
	 Lkc7H2xYb8DoYeMY=
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app09-12009 (RichMail) with SMTP id 2ee96affe6d8b8d-2a5cb;
	Fri, 20 Nov 2026 14:21:12 +0800 (CST)
X-RM-TRANSID:2ee96affe6d8b8d-2a5cb
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from devin-VMware-Virtual-Platform.localdomain (unknown[10.55.1.71])
	by rmsmtp-syy-appsvr07-12007 (RichMail) with SMTP id 2ee76affe6d72ae-182b5;
	Fri, 20 Nov 2026 14:21:12 +0800 (CST)
X-RM-TRANSID:2ee76affe6d72ae-182b5
From: Zhu Jun <zhujun2@cmss.chinamobile.com>
To: valentina.manea.m@gmail.com
Cc: shuah@kernel.org,
	i@zenithal.me,
	gregkh@linuxfoundation.org,
	linux-usb@vger.kernel.org,
	Zhu Jun <zhujun2@cmss.chinamobile.com>
Subject: [PATCH] usbip: tools: Check allocation of exported devices
Date: Fri, 20 Nov 2026 14:21:11 +0800
Message-ID: <20261120062111.98404-1-zhujun2@cmss.chinamobile.com>
X-Mailer: git-send-email 2.51.0
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

usbip_exported_device_new() dereferences edev immediately after calloc()
without checking whether the allocation succeeded. An allocation failure
therefore crashes the tool instead of allowing its caller to skip the
device.

Return NULL before accessing edev when calloc() fails.

Fixes: 021aed845303 ("staging: usbip: userspace: migrate usbip_host_driver to libudev")
Signed-off-by: Zhu Jun <zhujun2@cmss.chinamobile.com>
---
 tools/usb/usbip/libsrc/usbip_host_common.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tools/usb/usbip/libsrc/usbip_host_common.c b/tools/usb/usbip/libsrc/usbip_host_common.c
index 01599cb2fa7b..bec6c42e29c8 100644
--- a/tools/usb/usbip/libsrc/usbip_host_common.c
+++ b/tools/usb/usbip/libsrc/usbip_host_common.c
@@ -71,6 +71,8 @@ struct usbip_exported_device *usbip_exported_device_new(
 	int i;
 
 	edev = calloc(1, sizeof(struct usbip_exported_device));
+	if (!edev)
+		return NULL;
 
 	edev->sudev =
 		udev_device_new_from_syspath(udev_context, sdevpath);



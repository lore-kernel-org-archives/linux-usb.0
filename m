Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=51.250.60.161
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793279650;
	b=fiJvIZ6OGZD9U2GQ7MBXYFRygPbo6YGS5k1+qDpoa/ZeT+KBSC0+6LXk8fO8yIX42cYo
	 YJ160OO0vODMErHhEWnizSrNHPJQXvrQjvj+7LvobSMi74qhQYeGsaj84cxeMzyB6m5Rs
	 za1l08ULYLbWFxEKM/YYj3DRD6kowMWBqAZYsWh0mRkXIQFiCbTC/JYhUaYtkqYpPXfY/
	 uO/MfjVFzLJ7Rqg2IvKbwSKmhPpqzkTBVCU2aaC5AXmPJB0SUzGarCJeeP8PmNON/UBvr
	 u8VE5B1VEWR2ARgX0G1ThmGgTfe2znOfR6Wss+K8z5wyb4UX2Arm+fIcWKU2XWZCxzg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793279650;
	h=DMARC-Filter:Received:Received:X-Yandex-Fwd:DKIM-Signature:From:To:
	 Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=9oI3FznU5PhUF3Ty/8HXE/OKKEmVJonW0MmNVTWJV0I=;
	b=xUoOwO+xh8TRc6BmCu9up6t0sxCM4UR1lvqdmi7Z2TiBVne9K3wQYn2763aP9XDCqgrU
	 GQC6UrVH4nF+mcLBs2VtVZJB2yca64/03C1ZBYLe1VYhLfr5q/UcszY/MnXf1a+SmoTul
	 tJ67HGY5XL06f0tNboi/ypwMNZeAdFwon0Rg45lLBMUBgCt0S0fKUxjxIm4Lw9KIzKlP5
	 fSSQn1OwVqvJPJVtd8ulpVxP0hJz9uxILKX/7XmE+DBCWwHul/CH5PbkzH7Tt5qxLhLeu
	 mu1zj7HzfssgclPN+8+XuIeiAn7avedZ5DWm8gtSc5qCfxqzz0vYk8b2sdklEgywOPw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=yandex.ru;
	spf=pass smtp.mailfrom=yandex.ru;
	dkim=pass header.d=yandex.ru header.i=@yandex.ru header.a=rsa-sha256 header.s=mail header.b=rgoPstyv;
	arc=none smtp.remote-ip=51.250.60.161
Received: from forward101d.mail.yandex.net (forward101d.mail.yandex.net [51.250.60.161])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 781B9606A331
	for <linux-usb@vger.kernel.org>; Thu, 29 Oct 2026 13:14:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 781B9606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yandex.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yandex.ru
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=yandex.ru header.i=@yandex.ru header.a=rsa-sha256 header.s=mail header.b=rgoPstyv
Received: from mail-nwsmtp-smtp-production-main-62 (mail-nwsmtp-smtp-production-main-62.klg.yp-c.yandex.net [IPv6:2a02:6b8:c42:cca7:0:640:7438:0])
	by forward101d.mail.yandex.net (postfix) with ESMTPS id 2E8A9C008F;
	Thu, 29 Oct 2026 16:14:04 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-62 with ESMTPSA id 2EjHSoRjtCg0-yrC2UL15;
	Thu, 29 Oct 2026 16:14:03 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex.ru; s=mail;
	t=1793279643; bh=9oI3FznU5PhUF3Ty/8HXE/OKKEmVJonW0MmNVTWJV0I=;
	h=Message-ID:Date:In-Reply-To:Cc:Subject:References:To:From;
	b=rgoPstyvENwmM7wJzpSol5y84rILCudel7DSLpzZdMhUBxWtlgfHEN3m+DRxWvDzs
	 7G6GVBQt52M08sybage8vT66aT4WlXm+ZhNarfXrZMh8daVq2bN3ioYK9rD8Tk9Anh
	 LrkNTapJ3v3dJ5R18HJkWnVhfynhjAeqAfx8+JjQ=
Authentication-Results: mail-nwsmtp-smtp-production-main-62; dkim=pass header.i=@yandex.ru
From: Dmitry Antipov <dmantipov@yandex.ru>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Johan Hovold <johan@kernel.org>,
	linux-usb@vger.kernel.org,
	Dmitry Antipov <dmantipov@yandex.ru>
Subject: [PATCH v2] USB: usbsevseg: cleanup sysfs show handlers
Date: Thu, 29 Oct 2026 16:14:01 +0300
Message-ID: <20261029131401.676734-1-dmantipov@yandex.ru>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <sashiko-outbox-189323@kernel.org>
References: <sashiko-outbox-189323@kernel.org>
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

Prefer the convenient sysfs_emit() and sysfs_emit_at() over
sprintf() and strcat()-based quirks in sysfs show handlers.

Signed-off-by: Dmitry Antipov <dmantipov@yandex.ru>
---
v2: fix off-by-one error in textmode_show() (Sashiko)
---
 drivers/usb/misc/usbsevseg.c | 26 ++++++++++----------------
 1 file changed, 10 insertions(+), 16 deletions(-)

diff --git a/drivers/usb/misc/usbsevseg.c b/drivers/usb/misc/usbsevseg.c
index 89d25fcef642..1140ca4fbd8d 100644
--- a/drivers/usb/misc/usbsevseg.c
+++ b/drivers/usb/misc/usbsevseg.c
@@ -145,7 +145,7 @@ static ssize_t name##_show(struct device *dev,			\
 	struct usb_interface *intf = to_usb_interface(dev);	\
 	struct usb_sevsegdev *mydev = usb_get_intfdata(intf);	\
 								\
-	return sprintf(buf, "%u\n", mydev->name);		\
+	return sysfs_emit(buf, "%u\n", mydev->name);		\
 }								\
 								\
 static ssize_t name##_store(struct device *dev,			\
@@ -246,25 +246,19 @@ static ssize_t textmode_show(struct device *dev,
 {
 	struct usb_interface *intf = to_usb_interface(dev);
 	struct usb_sevsegdev *mydev = usb_get_intfdata(intf);
-	int i;
-
-	buf[0] = 0;
+	int i, ret = 0;
 
 	for (i = 0; i < ARRAY_SIZE(display_textmodes); i++) {
-		if (mydev->textmode == i) {
-			strcat(buf, " [");
-			strcat(buf, display_textmodes[i]);
-			strcat(buf, "] ");
-		} else {
-			strcat(buf, " ");
-			strcat(buf, display_textmodes[i]);
-			strcat(buf, " ");
-		}
+		if (mydev->textmode == i)
+			ret += sysfs_emit_at(buf, ret, " [%s] ",
+					     display_textmodes[i]);
+		else
+			ret += sysfs_emit_at(buf, ret, " %s ",
+					     display_textmodes[i]);
 	}
-	strcat(buf, "\n");
-
 
-	return strlen(buf);
+	sysfs_emit_at(buf, ret - 1, "\n");
+	return ret;
 }
 
 static ssize_t textmode_store(struct device *dev,
-- 
2.56.0


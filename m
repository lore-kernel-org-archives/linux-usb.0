Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=93.77.172.67
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793278089;
	b=HiE5y3n7fghp1fXoB/izPYrD2KbzGo4xd+UaieLpru0AZFwsA7tnQMHpGttthHrWGrAq
	 8UaPp4ZajL8XxiwI4Eaav4AXgHNtZWPMvqT8ghNzl8mSJDrgpsgwpa93w4dRPAAH7/ULs
	 3O6PbTPbsVzjolleRWzWGHAvtKkjNA3oX+EqWfiTYEA7XpaaFRIX12gxeBVIjRkIT7qrk
	 Sm837yM3MXUbMGepl67zMp6fSdrpl9qdimL1xcCUA7H2pGAYbr7P8IBC7808+idRL1YLF
	 SJ9fRObIseYL63iKR1RmitJBLqnDSRUCYCE4FHzrNg1IzweT4cn3FEvp0L3KzlN4p/A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793278089;
	h=DMARC-Filter:Received:Received:X-Yandex-Fwd:DKIM-Signature:From:To:
	 Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=u+kzNtQ1EtLUrrc2XUnkX9VPNYb6Sar71nuzph2Jjvc=;
	b=WInCylXFvKg1C1GbTLNWc/pfy4XJvF03nXrYgl8QxHilWgos/VcAK9kmR8PYhQYhF+J6
	 4K331vQIM1F7YVXlRIyQES7qXZqHRyYtQN6sPIz3tI6jtPI/uCykz/IoTRPFU2SH5llV6
	 ckDAwxD2X1kWXMI2zxZfY+SpWuW0o8liY+vY6uTwhrZT6r9EX2MGrCsPgaOZRonskOeTu
	 O3qFYPV8ilwirqyI/Iq+7Vl0B/h3nZdCIFneiTq2i1Xc1h9bBwgBmb6pAXPYkfCho5GcT
	 YVdXYJQK55LWHZ1YO3bT8yQU02ooRj0IjYje6a8RYQplhQ0CuuiT5wM9Gx5ETYQ69bQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=yandex.ru;
	spf=pass smtp.mailfrom=yandex.ru;
	dkim=pass header.d=yandex.ru header.i=@yandex.ru header.a=rsa-sha256 header.s=mail header.b=wKXWp4pW;
	arc=none smtp.remote-ip=93.77.172.67
Received: from forward103e.mail.yandex.net (forward103e.mail.yandex.net [93.77.172.67])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74E57606A31D
	for <linux-usb@vger.kernel.org>; Thu, 29 Oct 2026 12:48:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 74E57606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yandex.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yandex.ru
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=yandex.ru header.i=@yandex.ru header.a=rsa-sha256 header.s=mail header.b=wKXWp4pW
Received: from mail-nwsmtp-smtp-production-main-71 (mail-nwsmtp-smtp-production-main-71.iva.yp-c.yandex.net [IPv6:2a02:6b8:c0c:2486:0:640:a562:0])
	by forward103e.mail.yandex.net (postfix) with ESMTPS id 8CA3BC03B1;
	Thu, 29 Oct 2026 15:47:55 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-71 with ESMTPSA id rlijPCQhHiE0-RlWLB6yA;
	Thu, 29 Oct 2026 15:47:55 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex.ru; s=mail;
	t=1793278075; bh=u+kzNtQ1EtLUrrc2XUnkX9VPNYb6Sar71nuzph2Jjvc=;
	h=Message-ID:Date:Cc:Subject:To:From;
	b=wKXWp4pWadeNu3c5OHMgRbZrbrXarJaK8Ik5YjpfRxARqr4dT/XkLOx7wXz2l9/o7
	 I/kNBg7CKa0MFwcL9ZRYDLL0bCTX1uxKoYSM4Y6pbwiSZJAltMPgckqzre0BglNL4f
	 eLofoQBpEkljJMiei3GrOZRo1n03viHLprnZ20kU=
Authentication-Results: mail-nwsmtp-smtp-production-main-71; dkim=pass header.i=@yandex.ru
From: Dmitry Antipov <dmantipov@yandex.ru>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Johan Hovold <johan@kernel.org>,
	linux-usb@vger.kernel.org,
	Dmitry Antipov <dmantipov@yandex.ru>
Subject: [PATCH] USB: usbsevseg: cleanup sysfs show handlers
Date: Thu, 29 Oct 2026 15:47:16 +0300
Message-ID: <20261029124716.611540-1-dmantipov@yandex.ru>
X-Mailer: git-send-email 2.56.0
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
 drivers/usb/misc/usbsevseg.c | 26 ++++++++++----------------
 1 file changed, 10 insertions(+), 16 deletions(-)

diff --git a/drivers/usb/misc/usbsevseg.c b/drivers/usb/misc/usbsevseg.c
index 89d25fcef642..f456a7161a26 100644
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
+	ret += sysfs_emit_at(buf, ret - 1, "\n");
+	return ret;
 }
 
 static ssize_t textmode_store(struct device *dev,
-- 
2.56.0


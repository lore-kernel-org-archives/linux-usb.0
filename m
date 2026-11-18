Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795013800;
	b=Af/vuSJbBF6a9RWrjnuWVYDCIdrgAijR+4Fr1Wg53q/O/HDC0gFQooBBAdKfiAId877Y
	 8HNyewFVtYq/KeIsb/mmFA5IqsXUXFuG1G3eF4DoeFv+23JkLub7QmiMs6Lqwdgvd5omm
	 7K50gThUE6fnRYqnNckMOy1hcaznzrS8XCdPSEGAiqBFVu84/XA4UYhtgeMUM8N/etgaC
	 9ekmZfU0uzjZbqEzDWiYgW8CO44JEr0W0+HH3ib8StteQf1ISUVbLWOHZi5AYT540bLYG
	 gISG0C2oZddvRpId0PclP48oqXQKaW6RCQ8/yeRGhBbEsxxwAdCbkYtbQ834ZzCPhng==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795013800;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=5+NHJybFkYZ5rmq65hdGu5soNWFQnp+bSzJUXt6Wgcs=;
	b=aNIQwJb+cViqWCmBqscAAPvk0VvQ1KH3ZnoQy2xKC6HoWIqGMJsWW4GtoNqtj0iEntsJ
	 n7yEVPb8AphnKAkEvJYmryRCs5uZkto9+7yYUSUWng4np+/nxgbGSVpJo3dnc8+PNkTJb
	 v1g2jGINN8F5lz/Cwk6EAgLLXxo+ffIEptIlgs0Pt/9iPl+N4HWcumYKAEXs/zHwUmVYF
	 0+OdVgITh55mEwWy4SiBXQoaDusnHjTEETLZxKutWWrHfu91ngjPPTtIgbm1rzQeWs76T
	 vZ8ptZNEfuzYD22BCr6o/p1VTPxjrC1E73+WTAstCt3LES5DRd6c6S++9TqIJd5bpNQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=wkennington.com;
	spf=none smtp.mailfrom=wkennington.com;
	dkim=pass header.d=wkennington-com.20260707.gappssmtp.com header.i=@wkennington-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=fCqarqvC;
	arc=none smtp.remote-ip=209.85.216.45
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69A19606A31C
	for <linux-usb@vger.kernel.org>; Wed, 18 Nov 2026 14:56:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 69A19606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=wkennington.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=wkennington.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=wkennington-com.20260707.gappssmtp.com header.i=@wkennington-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=fCqarqvC
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-3ad41b47541so794433a91.1
        for <linux-usb@vger.kernel.org>; Wed, 18 Nov 2026 06:56:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=wkennington-com.20260707.gappssmtp.com; s=20260707; t=1795013799; x=1795618599; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=5+NHJybFkYZ5rmq65hdGu5soNWFQnp+bSzJUXt6Wgcs=;
        b=fCqarqvCcDR5rXgEHLq7dQ0rF1bO7a8DYl3E4BrkJwvABK7+Hm6X6fYkXE+VkLvZxp
         YY7akXggWY6dvDjNjoStIv1a9g5eSotSDt3qTpgmjf6f53shSD8S0mgOwhMqQ/VS6XrK
         EKhYteHZqPiOf3iUAx+qKxMqZmYoscmCNnrGrPI94BjIcuncr6JNScjJ19VVZ6uvGIuw
         abJpj1nVx4qu/YPwAfmXxfcb9vkey9LchlGJqwtnM2n5j+iLPYbKUIeheOTlmd8IT6N4
         +wwY5OEf6WE5V/3RX2GpbuUYDbgz55eI1EMD2y09vFiHdBIBFX4ieECtv1cZq4YMhRq4
         yUFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795013799; x=1795618599;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5+NHJybFkYZ5rmq65hdGu5soNWFQnp+bSzJUXt6Wgcs=;
        b=BsyIAmcv3ieQuTVfgBrUaIC8O6Yvm0iOgrsXCslDeZqiNzi6ZyblYcorSwOl7+UVcY
         DKDR470VvtD2Q6Pk9v/FQ3gF2IPjWcV2oBvw6iTPPb8tOBAkTbcAuBQCpDGjmLaRsrPM
         6dEbeV/asYS9QIfJKFk2Zw6ZZ1n+t6jGSd1FH5yeL/gF7GDc6QzW+Rviutx2EeE9TGFT
         flgkSYzFltWDiKbeydlCXOp2Yr90lb1cVoWS6QNbDtMiuCc29BSyMq9ZH2f2dSiq2T9V
         ZjbnL7JK+Zn47V26tJYg/37LqMHGy/P+kpaU05dimomR0lb8OGtrp1XD50dqlFS4Pqgj
         ZERg==
X-Forwarded-Encrypted: i=1; AL+hErHF/rHsr61B0jJ9kqgn9eqs60xAeH08rz2fMd7unCwfgk7yq0ry0IaE4K7fNHQL8FeDSm+y5869HpI=@vger.kernel.org
X-Gm-Message-State: APuU4Z+xr6LHb3b4RPAqRN+PRIsXYXizbVvxOCQvgPeColsTjy4u0c1W
	HeNNPoAqeewrMmTNpojdbwch8G83VJkXuNB73ec4jzjrj0w8kWv8fnvPq8iNHZv6wGo=
X-Gm-Gg: AZFdTZedWEGxDjoPprMY/IzrP5IgiRTQqNh2LK8awniKArO29aXN0oZMuamjuTRSyy+
	NoXKtV0Y+YTYHQERL0iZbjg0HjlZNObaOhuhumPltKPhxTXm3DZ3jzARbPegK4gvKidoEFAA7Hv
	Ccc07RGAzFw7igVCPS1XMQvDtz/l3GqKs7z8su6RVciu0B7YQiE8xRrsSlZsJe43TPGbVClDg6j
	VAocO6kHYtotSaPPYyNexSbf5mWMvdkkdpV+n8cZ+BQPSz0MWhr0qIRVWtvgMYEyzQU1k64NJWi
	NNOjed+3Bf+tyw5Es1rgMrmfy80G5az6JailD0hRf7hXFQwpI/6uY/7ZHvFqcBTkONGwn6hDfGc
	nTzFq5nchCwgWNwOipPOgAYR9VQO4rs2zq8Daz+ELL23W5Mm3xE6EMcy13Uek0JxQLZDuf245RD
	AtlS5KZY4ISMuPO1JY9USqpLWylfsU99P30RsfSJGT3AcTup/cBwwp6soffwZzPVLtaQJDcLy3F
	Mgg9TI4P3RlFN+KVbxcxacp3eNIL2b0COc08iSVyp1JswvrGRtgs0L7VYvvcSJqBWnNUYU/2XPI
	eVJpPHwYiunkDEFzUC2j5aE5p/yLKyO9cKodoqMV5RRhcMsf03XRy5fzhHJxB+IYY8iOvZBZLrD
	4jd5rJQd7KvUn5g==
X-Received: by 2002:a17:90a:e70d:b0:3b3:b151:f425 with SMTP id 98e67ed59e1d1-3b3d07aa7d7mr2814324a91.40.1795013798624;
        Wed, 18 Nov 2026 06:56:38 -0800 (PST)
Received: from wak.c.googlers.com.com (246.21.127.34.bc.googleusercontent.com. [34.127.21.246])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eff6115f28sm15344135ad.19.2026.11.18.06.56.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 06:56:38 -0800 (PST)
From: "William A. Kennington III" <william@wkennington.com>
To: Oliver Neukum <oneukum@suse.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Havard Skinnemoen <hskinnemoen@google.com>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	"William A. Kennington III" <william@wkennington.com>
Subject: [PATCH] USB: cdc-acm: refuse writes after disconnect
Date: Wed, 18 Nov 2026 14:56:36 +0000
Message-ID: <20261118145636.3534234-1-william@wkennington.com>
X-Mailer: git-send-email 2.56.0.567.gdb80ae8cd5-goog
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

Commit 7fb57a019f94 ("USB: cdc-acm: Fix potential deadlock (lockdep
warning)") stopped clearing acm->dev in acm_disconnect() and replaced
ACM_READY() with acm->disconnected, but left the write path checking
!acm->dev and dropped the disconnect check from acm_tty_write_room().
Because acm_disconnect() frees the write buffers with
usb_free_coherent() and acm_probe() only pins acm->control, a late
acm_tty_write() call dereferences freed memory.

This can happen when a CDC-ACM device disconnects while a file
descriptor remains open with a line discipline such as mctp-serial
attached. Hangup closes the line discipline, but a subsequent reopen of
the hung-up TTY calls tty_reopen() -> tty_ldisc_reinit() from the saved
c_line before acm_tty_open() fails with -ENODEV. Because the original
descriptor keeps tty->count non-zero, the reinitialized mctp-serial
instance stays attached and faults in memcpy() inside acm_tty_write() on
the freed wb->buf when transmitting.

Pin acm->data alongside acm->control until acm_port_destruct() so the
unlocked dev_vdbg() in acm_tty_write() stays valid across disconnect,
check acm->disconnected at the start of the write_lock critical section,
report zero room in acm_tty_write_room() once disconnected, and set
acm->disconnected under write_lock in acm_disconnect() so any concurrent
writer finishes before the URBs are poisoned and the buffers are freed.

Fixes: 7fb57a019f94 ("USB: cdc-acm: Fix potential deadlock (lockdep warning)")
Cc: stable@vger.kernel.org
Signed-off-by: William A. Kennington III <william@wkennington.com>
---
 drivers/usb/class/cdc-acm.c | 20 +++++++++++++-------
 1 file changed, 13 insertions(+), 7 deletions(-)

diff --git a/drivers/usb/class/cdc-acm.c b/drivers/usb/class/cdc-acm.c
index 666969ffd194..77951cd34846 100644
--- a/drivers/usb/class/cdc-acm.c
+++ b/drivers/usb/class/cdc-acm.c
@@ -762,6 +762,7 @@ static void acm_port_destruct(struct tty_port *port)
 	if (acm->minor != ACM_MINOR_INVALID)
 		acm_release_minor(acm);
 	usb_put_intf(acm->control);
+	usb_put_intf(acm->data);
 	kfree(acm->country_codes);
 	kfree(acm);
 }
@@ -848,6 +849,11 @@ static ssize_t acm_tty_write(struct tty_struct *tty, const u8 *buf,
 	dev_vdbg(&acm->data->dev, "%zu bytes from tty layer\n", count);
 
 	spin_lock_irqsave(&acm->write_lock, flags);
+	if (acm->disconnected) {
+		spin_unlock_irqrestore(&acm->write_lock, flags);
+		return -ENODEV;
+	}
+
 	wbn = acm_wb_alloc(acm);
 	if (wbn < 0) {
 		spin_unlock_irqrestore(&acm->write_lock, flags);
@@ -855,12 +861,6 @@ static ssize_t acm_tty_write(struct tty_struct *tty, const u8 *buf,
 	}
 	wb = &acm->wb[wbn];
 
-	if (!acm->dev) {
-		wb->use = false;
-		spin_unlock_irqrestore(&acm->write_lock, flags);
-		return -ENODEV;
-	}
-
 	count = (count > acm->writesize) ? acm->writesize : count;
 	dev_vdbg(&acm->data->dev, "writing %zu bytes\n", count);
 	memcpy(wb->buf, buf, count);
@@ -890,6 +890,9 @@ static ssize_t acm_tty_write(struct tty_struct *tty, const u8 *buf,
 static unsigned int acm_tty_write_room(struct tty_struct *tty)
 {
 	struct acm *acm = tty->driver_data;
+
+	if (READ_ONCE(acm->disconnected))
+		return 0;
 	/*
 	 * Do not let the line discipline to know that we have a reserve,
 	 * or it might get too enthusiastic.
@@ -1400,6 +1403,7 @@ static int acm_probe(struct usb_interface *intf,
 	acm->data = data_interface;
 
 	usb_get_intf(acm->control); /* undone in destruct() */
+	usb_get_intf(acm->data);
 
 	minor = acm_alloc_minor(acm);
 	if (minor < 0) {
@@ -1627,7 +1631,9 @@ static void acm_disconnect(struct usb_interface *intf)
 	if (!acm)
 		return;
 
-	acm->disconnected = true;
+	spin_lock_irq(&acm->write_lock);
+	WRITE_ONCE(acm->disconnected, true);
+	spin_unlock_irq(&acm->write_lock);
 	/*
 	 * there is a circular dependency. acm_softint() can resubmit
 	 * the URBs in error handling so we need to block any

base-commit: f11fe7603df07fbb9fa02b0d385c1696c87a6dab
-- 
2.56.1.703.gf848ed807c-goog


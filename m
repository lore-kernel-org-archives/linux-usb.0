Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795158236;
	b=pPSLNDQtLL16EbUOfJilmL3WzOq9XGpgTEF62E1juu0N3ZCQYLZEx5YuHNMInMFeCX61
	 U0lBru0lsmwFRayI+yw+CPGVkK6SVonC1SJzpEgq7661ORkoG1KXo01EsAHtxe6SYaGOg
	 VAkySB0h4sQFgaI8GmsqvU4qyQ9c/OYtI6K/9oSK4Yd7l6Jf8btw28mlK4JCLDsGzY4na
	 vFmh8UdsvvZUPTJl2N+VIdFMUYZG6QNU41kQRv4TUCq7PHRprdXAxoQbBe/BliupIdA7H
	 DXOJYUKcyH+I005Qc03WWGro707/WxErhtFWwaUCsrN+7Y5ZX2OBDf4toDJYdIWABDQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795158236;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=ZR4A6YUH4hCv1AIMj7A+LPbhIN+DuoZDEw4O6M9OAVM=;
	b=GlkuubGSSeYMqy2BBFHS0Fm6PEyCN55Dd2zWORtwXKCgkvCgb92UFrSFY3D+7QmSD308
	 c+qTyAnJj3Bi+mTevrYsO4vdILspZ3bxaTW9YY+jgshqNHlJ/CwCMiUAHV7IAs+U1RD7b
	 qxYgaiUSG7MdFHykjISBlSuG0Deftut+QrK+kBjtmjJGxOeUeUqWKEu5kQb6y64z99YQ3
	 DU6xI4zuQHJGv5q3Av1k4A8tWHjAfTqT0dnlJ/rE2rvfBA73CsmqFUD54yZIwKGKWpetE
	 e7+/DZ6SbqySHXSLQxoTVPpE86D29xFB+wu6GCaRvFTa0zh+rteR9/oHUB+nIP8fibQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=wkennington.com;
	spf=none smtp.mailfrom=wkennington.com;
	dkim=pass header.d=wkennington-com.20260707.gappssmtp.com header.i=@wkennington-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=nj9ywtiZ;
	arc=none smtp.remote-ip=209.85.214.172
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF78B606A320
	for <linux-usb@vger.kernel.org>; Fri, 20 Nov 2026 07:03:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DF78B606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=wkennington.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=wkennington.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wkennington-com.20260707.gappssmtp.com header.i=@wkennington-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=nj9ywtiZ
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2f0213202fdso2923915ad.3
        for <linux-usb@vger.kernel.org>; Thu, 19 Nov 2026 23:03:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=wkennington-com.20260707.gappssmtp.com; s=20260707; t=1795158235; x=1795763035; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZR4A6YUH4hCv1AIMj7A+LPbhIN+DuoZDEw4O6M9OAVM=;
        b=nj9ywtiZS2EuwcSsgBzz4ba4pM3CQiOPTIbo3sADrS3FLCDXMtI+bZQKRJT2g+APeG
         FigZ8jXZuaLKrVogkOIYteQVFb+lDZRpecRRfMfKpcWZcz6diK9yD2xwj/MNUwONcWSH
         TLdMKpoZw4XhlJYy08mu4X7knrpc/5T/BRhx7jHXYyIVykFVcUmyHFkzXvwEsMghOAGO
         WO3TVUgk/Nc8z59XfZcJx2tHXV+dtxZJjIKxyPtppu63MsfT9YgbhiACVUl9ICUizZJU
         NpHCh1etz/FvUSU1Yn9mu6WERV19UNoS0dQ8P5wKud7F/WmbJVWdWSn6H9KTuQnuOrdw
         W6jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795158235; x=1795763035;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZR4A6YUH4hCv1AIMj7A+LPbhIN+DuoZDEw4O6M9OAVM=;
        b=RWD7DbTx3Zyy9STBnEA0tFq2X4Fe36ZqHH2AXn+7OqxloeiQXVefXnEWh4hRFOA08z
         DRIVyuZUTXFA50U1e4pG4cacPAx9UF7dHgvIKkmcA3Q6Fc4tkWAyAj04Ok69luL5RLfK
         a55iCJT8J2tpDoI4/97JiYi2Ei7rGrQoVk86Zvlhdg08wMCydVL/dHG+kdhyH9z0xDUt
         eg/SBzCGLjgM41G5e0z8keGRICsGpanpxJaksS1uTrXVzk07LbERKf754UuBEVhibNyb
         S1IGaRecSYFoudFR1rOKgZaZeeOVzMXAahg8b4ZwmyBI5f3xamxzTBagljRMhAsiWSQu
         KGQA==
X-Forwarded-Encrypted: i=1; AL+hErF4ZXRAUPnbZKJJuMuhs1tWaEHAPtWc9KsqvB3MrAOfIANBIp9dcSsn6R9QWapDdKV9O2L8Sgtk70Q=@vger.kernel.org
X-Gm-Message-State: APuU4Z/UB6a7o/QOSf95dPzzhhcGzCiGbMCGgB2o7fzpRW+5MIJpjgId
	w/UXp4gdm9g/8GOvwDqrP3ThPeFZbCv0/UvIUllyLjHQfjlFI3ijHhF1nZpziPLxA7E=
X-Gm-Gg: AZFdTZf7nFwCxsuH7/FVtUCZSSyBE7KOFi53y+tgweaxR5GU0679rFvzC8k5AVaPheX
	GuMImJwTG5rTWwwPXNTV5mt12PY4z5cXLIHxNEGScb5ZaE3W1IxWBCT7Hlh+zd8MJOTJZZBvxy4
	EpNFePOBLAmAn0oNWBYFfMH+WIUPidHSAVX2Xt2MDsI7+VBVuGGZ27jl4xC7wRR1dm75i/zIF0k
	pTefjN+HNcL/S4LapCPfF5R7Vut9lQNM0Rdwzdl+qpHKGyJq3kXzrpdQlVIlBlUYTuYiST4hYQk
	w1aM0OW3NxgZHwB6JYY1V6ygwAsLLoMDjHwc6OHj45BNnmqY/QSyN0pwVbYDLX2IhktU2iOKC0M
	G5vwqP6Bv5Vwtlpo+eGOi7iRxaVvhcOTot4lAPmlrNZn1JaKhiSLGaAi1l6MRLtFXMh8D5asv/9
	IeWr8RJZADucQV+tX5FoQ4UGKSMaON4QKUmt4TrdStoPGonUVhs9gM1uKWdiEv6bKzhTep7TvBx
	bQEA4udc78PIkdIPsxjUNXx2aApNcR3gpEhWznG8gCul6qQ6h4HBxpkjqKoquE9LiJ6NdTZ8Czc
	VQLir/WcstsZ4znUMrUiETVPg+VGhnnxXlMdtLRIxoNv5LpCn0yFUi9czC5c37+JMuB5RMT8nt4
	qKNoFIGWHLo5lsTy6D6PY4ci49n2XhgstuFo=
X-Received: by 2002:a17:902:eccf:b0:2e9:64b9:a333 with SMTP id d9443c01a7336-2f03f17c766mr24418635ad.19.1795158235021;
        Thu, 19 Nov 2026 23:03:55 -0800 (PST)
Received: from wak.c.googlers.com.com (246.21.127.34.bc.googleusercontent.com. [34.127.21.246])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03ee844acsm10434305ad.2.2026.11.19.23.03.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 23:03:54 -0800 (PST)
From: "William A. Kennington III" <william@wkennington.com>
To: Oliver Neukum <oneukum@suse.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Havard Skinnemoen <hskinnemoen@google.com>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	"William A. Kennington III" <william@wkennington.com>
Subject: [PATCH v2] USB: cdc-acm: refuse writes after disconnect
Date: Fri, 20 Nov 2026 07:03:53 +0000
Message-ID: <20261120070353.956978-1-william@wkennington.com>
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
Changes in v2:
- Drop READ_ONCE() and WRITE_ONCE() on acm->disconnected to match the
  rest of the driver (Oliver Neukum).
- Link to v1: https://lore.kernel.org/linux-usb/20261118145636.3534234-1-william@wkennington.com/

 drivers/usb/class/cdc-acm.c | 18 ++++++++++++------
 1 file changed, 12 insertions(+), 6 deletions(-)

diff --git a/drivers/usb/class/cdc-acm.c b/drivers/usb/class/cdc-acm.c
index 666969ffd194..1d594ddabfaf 100644
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
+	if (acm->disconnected)
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
 
+	spin_lock_irq(&acm->write_lock);
 	acm->disconnected = true;
+	spin_unlock_irq(&acm->write_lock);
 	/*
 	 * there is a circular dependency. acm_softint() can resubmit
 	 * the URBs in error handling so we need to block any

base-commit: f11fe7603df07fbb9fa02b0d385c1696c87a6dab
-- 
2.56.1.750.gf70dc682cf-goog


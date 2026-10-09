Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F08D63D79E5
	for <linux-usb@vger.kernel.org>; Fri,  9 Oct 2026 05:05:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791522303; cv=none; b=AJXl3JDtrvAXka2f4FwsO3GC00YuOr/2LHwcPonqjc767qjnT53yQoJ0Wo+ny4K8TnmgEDQlX0j2A0jR54xUvbld5LZpjGD0KojKlPISc6L2yAMtfv1bSgYiZyC2QLvoyWE1vPVr8YE9BYr7++71tk4FAlVm6t0YXhMC5LWb8Xg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791522303; c=relaxed/simple;
	bh=bZxLCwanPVCt7fTYXMHOHM3p9tdM8lOdphND76v9MSA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=qZSHDxxgoEEftPXWxotD9nGl79FxOhe8hYt1aFZRsv9bR+vSmxgS/EQR+e+uWyX/SdIdDNmTgAcl8Ne/3MLgJ70Pwx1BesdUlbCOy+arxwkmBm9q3qzxa3z3/r16Ctu69B0UHwX/6rk91fmjAqRtuWnmpVvtCE+R8uSFmJPNW2E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=T/JPCTbC; arc=none smtp.client-ip=74.125.82.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="T/JPCTbC"
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-3115c4451c8so5151692eec.1
        for <linux-usb@vger.kernel.org>; Thu, 08 Oct 2026 22:05:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791522301; x=1792127101; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=9nzcEWRTzfm59zGLMlJVKe3ebiLwVSDP7QGjSAIGyLc=;
        b=T/JPCTbCGBeEZSIuFSJ8QazTGIEwZSGQe9k0Pai3pptJe81vZaJYjgxaqL1SzPdVSa
         UDJFILO1UZrYGx6yFSRMXu52fmydk+PpB2VRCYNhneUItdUDmSwJt2r4cTleL+12hIbR
         briBNtg3O5uHDjywk7rxWQ+fSH8FArSt3hCIn4oFeDe/45G6H9+kYM7Axlv7CwTxDCuu
         wyWzwGImUsZgW07m5VugqA1mP+4iSN1PRYFbj4DTy5z+vLgdNVrb0D0/clAsj8HisjL5
         dQ02IbnnTZXDY1eFIa23L+W04aUB/8GPq5EqcM+d8fKxdca6ESZK+AehgNPKrOYcL+Ch
         GQlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791522301; x=1792127101;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9nzcEWRTzfm59zGLMlJVKe3ebiLwVSDP7QGjSAIGyLc=;
        b=ocvhcv5V7IG+CZj7sPUcUCZWVXIp4whHJ6MsBurtQ3gnttINcOFQYFqyjTtUGqw+eN
         N+i1g1KhuRfjDCsOQ6wQEhnT+vSiE0TfElalSZOXBcg51+RNyEIg5rLB/jO1i8cXvXUo
         j2diNyM/bSDP/GWOf3AdnxYTX+x32BTAM8VupGH//j6wdQKwhjOpcWPK2pN+p/TiRjZ0
         LJvYzy++8wRfEA0f3yljc2mMcGg6Qr2qdn6DZ8k1TX7o/tM8rSieDqTjoYzck7tz7E4L
         pSuSGiRE7n5zo5mneoh7029NmHQnpYTdKOUJPcZS+Ky7KHZIz6V7VL5D9DUPy9hsY2H9
         Hq8Q==
X-Gm-Message-State: AFq9FYL8e9uSfBpHj7Y/zpOW4Y3cutld1i+FFOnokBKw/KL47+Jcff25
	orcWci0a0sAvt6DAfb5jpDaHg9Me5Z6wwf6W/0CRTAPn0jId4PQuexMA
X-Gm-Gg: AYBFou3cQtNNrVpj3HoQUBQIXzPEfV3mS1ch6rbiRaIt8iKRRaMDQUq6mA7LQ9aB7H9
	IZXdcmp6ibX6+4Xz/fWVHJzvN7wCGtrPDL2rGffL+6Rnp/udHsEvcwO4eMwV7mcY+uauZ/LW6ZT
	5zOSAeuoXevCEeZTwJOiLLhse/mUTxOQN3ovWjOefIEnd8HUXJC/ZLtOzIBGXMRdYW24MAW7lE7
	oQMQFzhhuhxaXrC685A4GHaVJCOylRF3B8nNx/Qo75ep745Avb0jarhMjybPM/+JK3LUe3k+qJa
	Ke0Ze43owY7CzB2V8V5VOuW87Yqey+ggLqLisqUX/wsyqgfQ1AEVg36qfnVGeNWtD7cuhbSIYDK
	TnsxyyQzLUNUU8pO5XwxS1NYV7F4Hok0nJ0/sWOh95cC4CiopXMwiSXFFRSdUA3nhsj2RTh3poV
	tEpQ6jA2IK/rBzkoZ31iL30ez6QAbn9a8imX9bbhPRGLhfj61Cs7GALULrsmjTqMAEvNrTE5sYh
	+VrqSjy
X-Received: by 2002:a05:7301:190a:b0:33b:ecf4:7f80 with SMTP id 5a478bee46e88-3536c5e54a0mr1837405eec.22.1791522300872;
        Thu, 08 Oct 2026 22:05:00 -0700 (PDT)
Received: from amd.ban-spse ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3537ca6d20dsm3416926eec.12.2026.10.08.22.04.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 22:05:00 -0700 (PDT)
From: Priyanka Mani <priyankamani2100@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	syzkaller-bugs@googlegroups.com,
	syzbot+baf3cbba7dd980984f0d@syzkaller.appspotmail.com
Subject: [PATCH] ihex: reject firmware images smaller than a single record
Date: Fri,  9 Oct 2026 05:03:30 +0000
Message-ID: <10da8e7f7c7070fc9a9da1d274b78f1d3f379703.1791521373.git.priyankamani2100@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

ihex_validate_fw() computes the end of the record area as

	end = (const void *)&fw->data[fw->size - sizeof(*end)];

Both fw->size and sizeof(*end) are size_t, so when the firmware image
is smaller than a single struct ihex_binrec (6 bytes) the subtraction
wraps around. 'end' then points far beyond the buffer, the

	for (; rec <= end; rec = __ihex_next_binrec(rec))

loop condition is satisfied, and the body dereferences 'rec' while
walking records that do not exist.

This is trivially reachable from userspace via the sysfs firmware
fallback: loading an empty image (write "1" then "0" to .../loading
without writing any data) leaves fw->size == 0 and fw->data == NULL, so
the first ihex_binrec_size() reads rec->len at NULL + 4:

  Oops: general protection fault, probably for non-canonical address ...
  KASAN: null-ptr-deref in range [0x0000000000000000-0x0000000000000007]
  RIP: 0010:ihex_binrec_size include/linux/ihex.h:26 [inline]
  RIP: 0010:__ihex_next_binrec include/linux/ihex.h:35 [inline]
  RIP: 0010:ihex_validate_fw include/linux/ihex.h:54 [inline]
  RIP: 0010:request_ihex_firmware include/linux/ihex.h:74 [inline]
  RIP: 0010:emi26_load_firmware drivers/usb/misc/emi26.c:86 [inline]
  RIP: 0010:emi26_probe+0x283/0x1690 drivers/usb/misc/emi26.c:232

A valid ihex image must contain at least the mandatory zero-length
terminating record, so anything smaller than sizeof(struct ihex_binrec)
cannot be valid. Reject it up front before the wrapping subtraction.

Fixes: f1485f3deb89 ("ihex: request_ihex_firmware() function to load and validate firmware")
Reported-by: syzbot+baf3cbba7dd980984f0d@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=baf3cbba7dd980984f0d
Signed-off-by: Priyanka Mani <priyankamani2100@gmail.com>
---
 include/linux/ihex.h | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/include/linux/ihex.h b/include/linux/ihex.h
index b824877e6d1b..61f1df4f7819 100644
--- a/include/linux/ihex.h
+++ b/include/linux/ihex.h
@@ -48,6 +48,16 @@ static inline int ihex_validate_fw(const struct firmware *fw)
 {
 	const struct ihex_binrec *end, *rec;
 
+	/*
+	 * The firmware must be large enough to hold at least the mandatory
+	 * zero-length terminating record. Without this check a short (e.g.
+	 * empty) image makes the fw->size - sizeof(*end) subtraction below
+	 * wrap around, yielding a bogus 'end' pointer and an out-of-bounds
+	 * walk over the records.
+	 */
+	if (fw->size < sizeof(*end))
+		return -EINVAL;
+
 	rec = (const void *)fw->data;
 	end = (const void *)&fw->data[fw->size - sizeof(*end)];
 
-- 
2.43.0


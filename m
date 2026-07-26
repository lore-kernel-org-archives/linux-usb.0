Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97F491EEA54
	for <linux-usb@vger.kernel.org>; Sun, 26 Jul 2026 08:04:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785053065; cv=none; b=C58/UI3ASVHiwpFK88Fws3g3zq1KKAWRLwgpWFIqX9GrOVBgvHfCJWQipwtG4u1xc0JWnBRPzKk6ahxPhGYFWHrocBhFVaF7tAOnM/DYLOFWXIA1uyRSWtpi7Nh4HKjc81oKLjZ1g+Stf8RR4VNgCLpvpk4d1j3dexEm0hbamBQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785053065; c=relaxed/simple;
	bh=Y7HcoRerzsbgTMKBHjGeBjlXnASBY1wVnyZiToHg+S0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=UY63bTrqtnq1GrW54mlsEdtAsGD5MiMb9+5lDYzDy2N2JMrmSI/kQvjitOBV2lr/59nLWycZl1mHBcaP9l27oSa9XkrgPvQM0GhATcO7ZS529zJvQAK6KRaxUZabsiinld1swwdOF26arkfGHLEgjzb1kaURbUgr/OfqLHOAFQo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XMS4EqwQ; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XMS4EqwQ"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2cab973140bso24203695ad.3
        for <linux-usb@vger.kernel.org>; Sun, 26 Jul 2026 01:04:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785053063; x=1785657863; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Pc+LLUxUsAlG4VNPUy+0mBD+EfmSxjlMd8BD9q3fDIk=;
        b=XMS4EqwQRmWWEEy+kDeohTo3n9a4hZth8paKV+SoVvM6v5nXx8lI+3CvLpyh5aYmKq
         sQy7YOTXODIOp7zPLxoJyhS1rx0hjM9HbPtKIGtEefU0BSfcrTI5MIeT7fwxaYrLdInX
         HbrxEnRDrcDDuLZTnE3PMifKdX6VYys+gVJgm4qq2ZBZXc88Lo4rT6uxRohsoKu3S5+w
         YqTKgsBXY1uEnHdf/t75nI+WPsj39r+2fAR4jF8NaKsZs5Ba2GApq1IacpKdwDYzpnNo
         46H/iw/afEE47cy7Hh3ktmjHnJzDKyYFCj+VAxlgxGLzfEZq2JwvzqPZtJ0ciUkeNfUH
         hphg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785053063; x=1785657863;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Pc+LLUxUsAlG4VNPUy+0mBD+EfmSxjlMd8BD9q3fDIk=;
        b=N9S8ASVPIabTIVPvYEKafy5WC1gFxRpZknirBboevsLVr7d9IMwSl4+9FQ1c6VknKb
         sOKJPoDaqiDcdHIYDR6ItfASBPGFzOf8NZAZE69ZK103PZK3B0YBCd5a2/ye084SYWk0
         oM/WmHqdonkMWdF6T30HGiSLFNnyMOiIyw5xxVLdkX+V+y/eBKSnQhr3RjS4kEg53lTR
         fiOkrVvOAVu81OEw2ugv1G4gcotcimz3lofxD4MAs6kwo8Dggh55ek+KHaBy5o6rbfqK
         utco9MfI2Vvu0sNcS/O0qNsfT8gCcYMmwixCCeg3UqXU87Jo8cF9kKFANEaOzUqyCHZv
         dzmg==
X-Forwarded-Encrypted: i=1; AHgh+Rq9ijO7rUeZjvMPWz1zRQiQ0WCEyOFFBE5mgBKWoqz2R2o/1SEQzb0JjADIkc7vDbmPKSniXrE+ziw=@vger.kernel.org
X-Gm-Message-State: AOJu0YzzHUWT3SBM2cUJHJn3B7ShQN8CXPvV2cJdzrsbfSfn63hgJ0JY
	h3A6B/nHzDUEkI04oP8N/PD2yv+rAiZ9r6soWtdeM4XvtzmLuLcyrvht
X-Gm-Gg: AR+sD10/f6htzPL4Kx3pJhsrcDD+oXKglumzhhTWXT8yI518xFVBStnGDO2OVnHr7d5
	XEIlabU491h5SjcKGDu6+mdw8KiBZ9A9j21AhWUFDNTgiACKAfOtcL5/dNNWjnGBAvya6tgXsQr
	Dl3IL1CMroRUmlRpAN9GXwaXot3Slr9WO/eQMFUfp7QCJuPFtJRkQxrEyj13gUHotTE2USl8iHP
	MjSct65J1se6T5eHYHS/+VCFLJwdwVoxZjFSF28L1t0BhszXQ4bzVJ+a/Hfu6FaDIKpl1NhN4hC
	vaSy7RlkOYvNkQfkOo/4DdGBzSCGpUXZGRQyEIOD4qS2KVsSYawlkkOZfXWpeYjOC4rtiFvzeq7
	lAgN0gzyWNuipko21Qr99WbPbb8NSwJapj7ZP5WvZO2ORnik/lXv/Vx7ynSvM9zorZSsfEBngTM
	Ax9AeuIGT7WhP2rqWKueQVf7MnmWdpl2lQcGec90WNmvMs1UWkpDwohGYsIw2MhoI=
X-Received: by 2002:a17:902:c402:b0:2cf:a2d2:84c0 with SMTP id d9443c01a7336-2cfde55bb4amr44610785ad.0.1785053062892;
        Sun, 26 Jul 2026 01:04:22 -0700 (PDT)
Received: from localhost.localdomain (211-20-143-81.hinet-ip.hinet.net. [211.20.143.81])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cfde5e2b8esm17503365ad.31.2026.07.26.01.04.19
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 26 Jul 2026 01:04:22 -0700 (PDT)
From: =?UTF-8?q?HE=20WEI=20=28=E3=82=AE=E3=82=AB=E3=82=AF=29?= <skyexpoc@gmail.com>
To: Israel Cepeda <israel.a.cepeda.lopez@intel.com>,
	Hans de Goede <hansg@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Andi Shyti <andi.shyti@kernel.org>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-usb@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	HE WEI <skyexpoc@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH 3/3] usb: misc: usbio: bound the debug hex dumps by the received length
Date: Sun, 26 Jul 2026 16:59:13 +0900
Message-ID: <20260726080129.44969-4-skyexpoc@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260726080129.44969-1-skyexpoc@gmail.com>
References: <20260726080129.44969-1-skyexpoc@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

usbio_ctrl_msg() and usbio_bulk_msg() hex dump the reply with "%*phN",
using a length the device supplied and that has not been validated yet:

	ret = usb_control_msg(usbio->udev, pipe, 0, request | USB_DIR_IN, 0, 0,
			      cpkt, cpkt_len, USBIO_CTRLXFER_TIMEOUT);
	dev_dbg(usbio->dev, "control in %d hdr %*phN data %*phN\n", ret,
		(int)sizeof(*cpkt), cpkt, (int)cpkt->len, cpkt->data);

cpkt->len is a u8 read back out of usbio->ctrlbuf after the IN transfer,
and bpkt_len in usbio_bulk_msg() is le16_to_cpu(bpkt->len) read out of
usbio->rxbuf.  Both are handed to "%*phN" as the field width.
hex_string() in lib/vsprintf.c caps that at 64, and dereferences every
byte up to that cap regardless of how much room the output buffer has:

	if (spec.field_width > 0)
		len = min(spec.field_width, 64);

	for (i = 0; i < len; ++i) {
		if (buf < end)
			*buf = hex_asc_hi(addr[i]);

So the dump reads up to byte 67 of ctrlbuf and byte 68 of rxbuf.  Both
buffers are sized from the endpoint packet sizes, so this is out of
bounds whenever ep0 wMaxPacketSize is below 68 and whenever the bulk in
endpoint is below 69.  That covers every low, full and high speed ep0
(8, 16, 32 or 64) and the bulk sizes the supported bridges actually use
(64, or 63 for the Synaptics Sabre via USBIO_QUIRK_BULK_MAXP_63).

A device answering one of the five usbio_ctrl_msg() calls in
usbio_probe() with cpkt->len = 255 therefore leaks up to 60 bytes of
adjacent slab memory into the kernel log during enumeration, before any
user space is involved.  On the bulk path a reply claiming
bpkt->len = 0xffff reads 5 bytes past a 64 byte rxbuf.

Unlike the endpoint size issues this needs no malformed descriptor at
all; it only needs the dev_dbg() calls to be enabled.  When they are, it
is a slab-out-of-bounds read under KASAN and the bytes reach dmesg.

Bound both dumps by the number of bytes actually received.  That is in
bounds by construction and also stops the dump printing stale bytes left
over from an earlier transfer.  The matching dumps on the two OUT paths
are left alone: they use lengths the driver itself just wrote, which the
size checks above them already bound.

Found by code review.  The out-of-bounds read was reproduced under
AddressSanitizer with a userspace model of the two dev_dbg() call sites
and of hex_string()'s field-width handling; it has not been exercised on
hardware or on dummy_hcd.

Fixes: 121a0f839dbb ("usb: misc: Add Intel USBIO bridge driver")
Cc: stable@vger.kernel.org
Signed-off-by: HE WEI (ギカク) <skyexpoc@gmail.com>
---
--- a/drivers/usb/misc/usbio.c
+++ b/drivers/usb/misc/usbio.c
@@ -14,6 +14,7 @@
 #include <linux/dev_printk.h>
 #include <linux/device.h>
 #include <linux/lockdep.h>
+#include <linux/minmax.h>
 #include <linux/mutex.h>
 #include <linux/string.h>
 #include <linux/types.h>
@@ -141,7 +142,7 @@
 	struct usbio_ctrl_packet *cpkt;
 	unsigned int pipe;
 	u16 cpkt_len;
-	int ret;
+	int dbg_len, ret;
 
 	lockdep_assert_held(&usbio->ctrl_mutex);
 
@@ -181,8 +182,15 @@
 	cpkt_len = sizeof(*cpkt) + ibuf_len;
 	ret = usb_control_msg(usbio->udev, pipe, 0, request | USB_DIR_IN, 0, 0,
 			      cpkt, cpkt_len, USBIO_CTRLXFER_TIMEOUT);
+	/*
+	 * cpkt->len has just been written by the device and is not validated
+	 * until below, while %*phN dereferences up to 64 bytes of whatever
+	 * field width it is handed.  Bound the dump by what was received.
+	 */
+	dbg_len = (ret > (int)sizeof(*cpkt)) ?
+		  min_t(int, cpkt->len, ret - (int)sizeof(*cpkt)) : 0;
 	dev_dbg(usbio->dev, "control in %d hdr %*phN data %*phN\n", ret,
-		(int)sizeof(*cpkt), cpkt, (int)cpkt->len, cpkt->data);
+		(int)sizeof(*cpkt), cpkt, dbg_len, cpkt->data);
 
 	if (ret < sizeof(*cpkt)) {
 		dev_err(usbio->dev, "USB control in failed: %d\n", ret);
@@ -258,7 +266,7 @@
 	struct usbio_client *client = adev_to_client(adev);
 	struct usbio_device *usbio = client->bridge;
 	struct usbio_bulk_packet *bpkt;
-	int ret, act = 0;
+	int ret, act = 0, dbg_len;
 	u16 bpkt_len;
 
 	lockdep_assert_held(&client->mutex);
@@ -314,8 +322,14 @@
 	act = usbio->rxdat_len;
 	bpkt = usbio->rxbuf;
 	bpkt_len = le16_to_cpu(bpkt->len);
+	/*
+	 * Same as in usbio_ctrl_msg(): bpkt_len is device supplied and is only
+	 * validated below, so bound the dump by what was received.
+	 */
+	dbg_len = (act > (int)sizeof(*bpkt)) ?
+		  min_t(int, bpkt_len, act - (int)sizeof(*bpkt)) : 0;
 	dev_dbg(usbio->dev, "bulk in %d hdr %*phN data %*phN\n", act,
-		(int)sizeof(*bpkt), bpkt, bpkt_len, bpkt->data);
+		(int)sizeof(*bpkt), bpkt, dbg_len, bpkt->data);
 
 	/*
 	 * Unsupported bulk commands get only an usbio_packet_header with
-- 
2.51.0


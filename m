Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794064739;
	b=TtrWMPjaR2CxduaeZIbMkw+Q05/Lt5w91xfBVolHvXp3kRzFcqaVdvxHA46UeawcKNYQ
	 GXV2cEB6ZS5wUa70IMY+tIBGwzZSFnPk+yX6rogq/abMiwlTMNjcPDrdXBOguwqwmDLNR
	 1jtqpj5DBpyiDYyuMmFiDluwOvmSbYdGwdRs772ZgyAyseeHZF0xUjMfkVjs6uVQWUH9Y
	 ImnQIBlm7a/NZAqamSTt2fe71ca7GkqhR8+5CsB/C0Ipk2oHQ4kfsmBVShhc7iLh1f6q+
	 RameYIawNGgtgUgpzsSR8i8C3sCXf712fTqHBTg7VfQyN1w+QJfyc67ksZWBSWiPUPw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794064739;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=/FMecL4/Be4U19AOcEGGR/s5+PksX0yjLPbC5lOfnWY=;
	b=MXx6X2E/N6tXXv9lz60ad0HwifPkZtqipS/BUKuta4YJufmYIHwd8hOhL5CAfK19HLb2
	 WBjYYUHJobZXU2HnMgQeT0X6OFNj5it9ikrMtPvYidofcZcnMFFQcE4+OZilN5PjUi4Cl
	 ykIVKrmYTB3FldRtr8ThRQgXW5rYal9/40+DqRfsFKNY/JFtfXpeADwfZj2ex32leKuB0
	 qQvPgqf2Y8ivI63xYfw3aF9P/o4dKS3vmgMnz7/TRece4bnTIxKAblRTXHfElZ5XHeRGY
	 DveZFfzwyx6jgJ6vXomHNxxa/G0J2PlnAod2FGHEBaGEM8WOxnzmhHPiFI3OLRM1aCg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TWbKXYbx;
	arc=none smtp.remote-ip=74.125.82.175
Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E2BF606D81B
	for <linux-usb@vger.kernel.org>; Sat,  7 Nov 2026 15:18:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2E2BF606D81B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TWbKXYbx
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-36eb1cb7aabso2517655eec.0
        for <linux-usb@vger.kernel.org>; Sat, 07 Nov 2026 07:18:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794064738; x=1794669538; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=/FMecL4/Be4U19AOcEGGR/s5+PksX0yjLPbC5lOfnWY=;
        b=TWbKXYbx7w/Wom34yDTrCrj66CgMASixb1QRY5kDrAsLcQ+8GeRlWZbp8QjFk2HMXr
         8xPcv5OfkRP5wOz7qON0ZaB1RVFi1MEInGfO/7IfI/7JctuED/yIOd/G2ft83jl9h42M
         VDx7pxhGLdebmulu9qy+mLr0C8dmbB3vvKhc9uKrjNP9XToGBkUYlOJ/gy0eaWp5Tl0h
         bNtJkwjUWsuUTOofmv5qnNYpn2fPy0SfabTHOY4alEGj16k5cMdABmT3dvuzZkvIpXhv
         55DdxZqMXdUwM0v1YTco9INseeLN1gfvEq8Y8TFC0zNYMt30qeghkT8Fq/xrprEf3Qeo
         1IDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794064738; x=1794669538;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/FMecL4/Be4U19AOcEGGR/s5+PksX0yjLPbC5lOfnWY=;
        b=r5ncI+SXEHBHxLiJEFzaxUIqv5qSxHZIm2YO1+UNUUGvG+7Rg+jTCGIooJcK+IT0/e
         p/YQ+uteasT5Y2kB6VGUWIcV21NiB4eItERVreTDcYqEgApC31oD5jK0hFlKPK9xxWBq
         RwId2duNJI5Tux/T7sZpiv8h20n28YZWcwfRKgeOWMslCbx6/M/1I1s9ZTbYh+xmLNEA
         OuOMCwFhRCPWiLJrNbF6wYo+SLB4NWsiX2NsPKPLE+pfQRXcWdiJCvG2m9z92Lgp0K7Y
         ThLraIkG2W3lb0aDan+OlWjkn5LQTO4hWGacgKxrI3E4xKXZuuZtiZGYSTSPvy6WJppj
         3PVw==
X-Forwarded-Encrypted: i=1; AL+hErHN5TeWg9ANDBUxB0Z4yQNOhG3Sf5l5d363EtMudT2iFd0F5X0s25J77f9pzDg/LfRX0PNHv8097Q8=@vger.kernel.org
X-Gm-Message-State: APuU4Z9i52yBC90ML9nhHJEmfILbY1iDq47kjqhCvTonU7WM3mhDNGK6
	G51VtF5j/pc5VccNeLly+iUCBnEzimy74I9sMG5iau93lBUr4fu7mGWa7xOGi8i6
X-Gm-Gg: AYBFou28SlGS5cZKVR7eqUgxkzpGIcMiNP+BU+Kjv0qmJq6MYx4EhRdtcAUasDUyeKo
	pNz92CYnE2WkYJtmx1bbmh7yXMIS7GujDsV1ZCKY8KgCF70mH6i7JofFsf3OlZRWi6y0LGpeBeS
	UW6wKRUQruxFVIZHjWG7H0AcX8ndT9qmtBK357Yclawh1w4bYL6JurJVK5tb1A55c3+cHvPPtkZ
	wPwCwZ3MV+8aK9HG3CfIV2LdgP+v+wl41Lr0EdlKJCiQOaTfmudRp7AQHOtpowOp2omg27sfJip
	/KzXbdkXh9nmqJgTO7b+G/ARMBDWhDTBoK0i0sFYLJf0chFmTzn7JI6GZOMD2nEjPB4N/J6D9Kj
	dX3lcKqALcRSiofzHNb8J4Uvc1dFPpUQ1Rwp059waO3wVUT2/4GQqqun5dirqD7VCq3goNmaTZC
	P456KBXqjX7xOndgcx02sXICv9Mmz2J4eaGtb8egnxSY5sgkcKLuj1x3QaW0BECrOOtXFJyiggz
	WQ7iMJTB2arli0sw4FLbWTsPHmOmOP7Xscszw16DrnxdNurtgRcLjyOnW1aRTkZrFqdO6x4LOUx
	tgq4kCRZJhcAtfNu3pdHraRqiUWnZBy4+xjo37YZ1hHc5+PF
X-Received: by 2002:a05:7300:dd05:b0:36c:9af3:22eb with SMTP id 5a478bee46e88-36f76e0ff40mr8378888eec.34.1794064737923;
        Sat, 07 Nov 2026 07:18:57 -0800 (PST)
Received: from hj.. ([163.239.22.29])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36fa922c6c7sm22259736eec.10.2026.11.07.07.18.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 07:18:57 -0800 (PST)
From: hyunjungg <hj351016@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org
Cc: Alan Stern <stern@rowland.harvard.edu>,
	linux-kernel@vger.kernel.org,
	Hyunjung Ko <hj351016@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] usb: sl811-hcd: delete the driver timer on stop to avoid use-after-free
Date: Sun,  8 Nov 2026 00:18:46 +0900
Message-ID: <20261107151847.3754846-1-hj351016@gmail.com>
X-Mailer: git-send-email 2.43.0
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

From: Hyunjung Ko <hj351016@gmail.com>

sl811h_hub_control() arms sl811->timer (sl811h_timer) with mod_timer()
for port reset/resume timing; the timer callback dereferences the
hcd-private struct sl811 (sl811->ctrl1, sl811->lock, sl811->port1, and
register I/O via sl811).

sl811h_stop() deletes only the USB core's root-hub timer
(hcd->rh_timer); it never deletes sl811->timer, and nothing else does
either. struct sl811 lives in the HCD private area and is freed by
usb_put_hcd() after sl811h_remove() calls usb_remove_hcd(). If
sl811->timer is still pending when the controller is stopped and the HCD
is freed, sl811h_timer() runs against the freed struct sl811
(use-after-free).

Delete sl811->timer at the start of sl811h_stop(), next to the existing
hcd->rh_timer teardown and before port_power(sl811, 0) halts the
controller, so any pending sl811h_timer() is drained before the hardware
is halted and cannot re-enable it afterwards. usb_remove_hcd() has
already stopped root-hub activity before sl811h_stop() runs, so the timer
cannot be re-armed, and sl811h_timer() does not re-arm itself, so a
single timer_delete_sync() drains it.

Found by static analysis and code review; not tested on real hardware
(needs an SL811HS USB host controller).

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Cc: stable@vger.kernel.org
Signed-off-by: Hyunjung Ko <hj351016@gmail.com>
---
v2: delete sl811->timer BEFORE port_power(sl811, 0) (top of sl811h_stop(),
    next to hcd->rh_timer) instead of after it, so a pending sl811h_timer()
    is drained before the controller is halted and cannot re-enable it in
    the window after the lock is dropped. Corrected the log: only
    sl811h_hub_control() arms sl811->timer (not the transfer scheduler).
    Both per Sashiko AI review.

 drivers/usb/host/sl811-hcd.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/usb/host/sl811-hcd.c b/drivers/usb/host/sl811-hcd.c
index b044977..b667732 100644
--- a/drivers/usb/host/sl811-hcd.c
+++ b/drivers/usb/host/sl811-hcd.c
@@ -1516,6 +1516,7 @@ sl811h_stop(struct usb_hcd *hcd)
 	unsigned long	flags;
 
 	timer_delete_sync(&hcd->rh_timer);
+	timer_delete_sync(&sl811->timer);
 
 	spin_lock_irqsave(&sl811->lock, flags);
 	port_power(sl811, 0);
-- 
2.43.0


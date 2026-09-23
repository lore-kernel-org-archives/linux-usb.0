Received: from mail-qk2-f42.google.com (mail-qk2-f42.google.com [74.125.230.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC8C9331200
	for <linux-usb@vger.kernel.org>; Wed, 23 Sep 2026 02:20:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.234
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790130042; cv=none; b=tUFCU1r9z8RuKE0lODJLM8EvKbL3qLHS9g0i5WgnBESiWnt9d4ISzCqbNnIOREveQ+eOj51d06WwhEk28XED4kkoKCUtAOnb7u7eTJJDykFpt7xGU6DP1sRVSbAfb4Mi9hDWjNzBSx4YZhuRJq2IypvlfWTmNBHhnwnhdd9VhXw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790130042; c=relaxed/simple;
	bh=BU14Eadnytj6nuGngvJJCAtwg6ur6ANUyu39bQoUxlU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=rKxOdhadXIpMtJ/w1MuD6pUH0FyHG92pxSbuXNzBEEtcA/ZmYPYIk5D+AZtwKrrL2xzwQ83+G6TUkjKetkNXQp2XWutPx5wfGg12g/6dnIRXCAUnj6wgLrqO/HMAdVuPNkXncsKXDRMmV+hjaKpJzgqT1mfnPwn1BNb0HGIT+mE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=g2H6E5rA; arc=none smtp.client-ip=74.125.230.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="g2H6E5rA"
Received: by mail-qk2-f42.google.com with SMTP id af79cd13be357-93bef17c191so39243385a.2
        for <linux-usb@vger.kernel.org>; Tue, 22 Sep 2026 19:20:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790130039; x=1790734839; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=pvoJSjzoTZiGd82xGNgm1yrZlodKS/2nAN2tuYG+izw=;
        b=g2H6E5rAE4fDiighnoMv+Vi0PvF7ubsH7WNAeg85sBaVJ7aShoTQPiXXV/zsQL9i6Z
         nM74vMjTaSp22xzJIGkE7S8PsxlmD8qpeTHYTofJvPBeFE+8Xhz27ubsnb+eVgBSBrHS
         A450YORSatYoSW1CuaCDmFXSkzTlbJtG1AB0rWrAZZ9qFPvqu1LS8dYaDd/f6s7qn5QE
         S4pnEm5Dn0XnuoCIxt4XulkoLFMcwRyT/2dwO1yZ0qEKsX58JP+ySxNHgKzOLE3D3oKK
         0sQf8VvhYcOJ/ZYK/6vtomvO4FMwAjVFH7xMaq3uli3Mevd0Pny0mSqLj5VrTAwv7e1Z
         s+Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790130039; x=1790734839;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pvoJSjzoTZiGd82xGNgm1yrZlodKS/2nAN2tuYG+izw=;
        b=VNCpa317x054cg8ulNuXPF3j3hhlH/Uuq0hh7ui5WW3VDqTC+bM2xpl8mPf/HYb8lC
         vaCYiNJ96C1EpabjYfuphPMVFOSuyfGw8S3LcfzeMIOJmf9hSr/XqORGbBkh6H0H8DZX
         tkEx5PWuGl60aUVj03KZWZp3wM6EUWJGYsSLGbT4krho7R35rcsdAcMEhf9jaIFvCDzl
         Itc7k25b3t69+ymL4a5lFu7wblqdC6/jyIyIJQVma4hxJw7d8mvdo1O9hGt2P3gwNU17
         +PXtcaGgv7JmbdIZdsIsK/A2+AzA0q+wRyWGqQI5EbsCVF4UYGGnfKlvMpL++84HzPI+
         AHwQ==
X-Forwarded-Encrypted: i=1; AKwUvBxVUeGz+dJOZgs5h2iMYQWUbc0e9GyEF9sJSnxep1nQMq5T4zOw+llaMD1YD264OZymnnS1oI2s9D8=@vger.kernel.org
X-Gm-Message-State: AFuF++n4k0ksasiuGJDCeiyjC0zflrf+5Gvb0nFRoONxDROXfYmV34jo
	mkC00xjNLEiSu6TIEAFGK38VliM0J2+8xR9H7Ut28TYUT1S9Q5m2cDQ=
X-Gm-Gg: AYBFou3773Jjw+yiRhEN3kzpAdEheIj+8V7vug0c4PECtMgolgnZYUxnyeJ0B6oE5cS
	wraTAukokEchkTtGJqFkfPsIL1+d8o3VYxFZyeeCGiGaqgYgEr9mGv5flN1+3UYssf7e5JePQA0
	eqOQ3Fv4iJ5i+w1rYqtBVzqL2+6MdxSAVhcEBYAkD535OQJFm7hpx/AKTJGOxfpLZAZ+ce8kHvT
	vUcyf/XD6eirZGakEhgpVs2U3XVyp1B1owg/9MkzQff+Hp7KSfeN5DtgFvUu+7CRbr7PB9E93PC
	2fiu9GoJ6MAOHgjhSIvpp+qjDJND3MTfNEmGAHiVfo+8xSgxGlQoZhv3uZEvh7EKqx6Afo8+Wtb
	7r+iBmWzn0NlKqQctEInW0YqhCKcqWzQIRgjtA+ozpAcF5fImF9RRyjhKRva6Md4IGm+irv9Hhf
	rQR3FneWy7rBDhgUv96sDkT0N1wk3KgUudgjvTruNIFeNqC2v4EBxy5qrZQ0TBvpHtp4Fv35LpU
	J1y/2onkoai4szZDyUtsGPnYGaJvggDJ3iGsWCmIZ4cOjUvqXF1sB/YQ+IydYnlnO/LW6H2QQGi
	LuYwIVoX85vr+SskTdHxraYPoHVszQ==
X-Received: by 2002:a05:620a:3912:b0:93a:9ef5:d370 with SMTP id af79cd13be357-93c25082c96mr220891185a.1.1790130039518;
        Tue, 22 Sep 2026 19:20:39 -0700 (PDT)
Received: from i4-gl-tmk5904-1.ad.psu.edu ([130.203.156.90])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93c29e070dbsm26226485a.14.2026.09.22.19.20.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 19:20:38 -0700 (PDT)
From: Myeonghun Pak <mhun512@gmail.com>
To: Valentina Manea <valentina.manea.m@gmail.com>,
	Shuah Khan <shuah@kernel.org>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Hongren Zheng <i@zenithal.me>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Ijae Kim <ae878000@gmail.com>,
	Michael Bommarito <michael.bommarito@gmail.com>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH v2] usbip: vudc: Prevent transfer timer rearm during teardown
Date: Tue, 22 Sep 2026 22:20:33 -0400
Message-ID: <20260923022033.957777-1-mhun512@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Commit d96209626a29 ("usbip: vudc: Fix use after free bug in
vudc_remove due to race condition") deletes the transfer timer before
vudc_remove() frees the vudc, but the receive thread keeps running
until usb_del_gadget_udc().  v_kick_timer() calls mod_timer() for
CMD_SUBMIT and CMD_UNLINK even in VUDC_TR_STOPPED, so a packet after
timer_delete_sync() rearms the timer and v_timer() uses the freed
vudc.

Use timer_shutdown_sync(), which ignores later arming.  The transfer
state is freed with the timer.  Annotate v_start_timer() and
v_kick_timer() with __must_hold(&udc->lock).

A KASAN and DEBUG_OBJECTS x86_64 QEMU guest reproduced the free-active
timer warning and the use-after-free in v_timer().  The same harness
completed 4000 iterations with this change.

Fixes: d96209626a29 ("usbip: vudc: Fix use after free bug in vudc_remove due to race condition")
Link: https://lore.kernel.org/all/20230316180940.1601515-1-zyytlz.wz@163.com/
Cc: stable@vger.kernel.org
Assisted-by: LLM
Co-developed-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
---
Changes in v2:
- Drop the lock-held comment and mark v_start_timer() and
  v_kick_timer() with __must_hold(&udc->lock), on the prototypes and
  the definitions (Greg Kroah-Hartman).

 drivers/usb/usbip/vudc.h          | 6 ++++--
 drivers/usb/usbip/vudc_transfer.c | 8 +++-----
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/usb/usbip/vudc.h b/drivers/usb/usbip/vudc.h
index 5ef0e7d9b23a..c129f4c56e8a 100644
--- a/drivers/usb/usbip/vudc.h
+++ b/drivers/usb/usbip/vudc.h
@@ -157,8 +157,10 @@ int v_rx_loop(void *data);
 /* vudc_transfer.c */
 
 void v_init_timer(struct vudc *udc);
-void v_start_timer(struct vudc *udc);
-void v_kick_timer(struct vudc *udc, unsigned long time);
+void v_start_timer(struct vudc *udc)
+	__must_hold(&udc->lock);
+void v_kick_timer(struct vudc *udc, unsigned long time)
+	__must_hold(&udc->lock);
 void v_stop_timer(struct vudc *udc);
 
 /* vudc_dev.c */
diff --git a/drivers/usb/usbip/vudc_transfer.c b/drivers/usb/usbip/vudc_transfer.c
index d4ce85c4c6a2..ba625622975e 100644
--- a/drivers/usb/usbip/vudc_transfer.c
+++ b/drivers/usb/usbip/vudc_transfer.c
@@ -441,8 +441,6 @@ static void v_timer(struct timer_list *t)
 	spin_unlock_irqrestore(&udc->lock, flags);
 }
 
-/* All timer functions are run with udc->lock held */
-
 void v_init_timer(struct vudc *udc)
 {
 	struct transfer_timer *t = &udc->tr_timer;
@@ -452,6 +450,7 @@ void v_init_timer(struct vudc *udc)
 }
 
 void v_start_timer(struct vudc *udc)
+	__must_hold(&udc->lock)
 {
 	struct transfer_timer *t = &udc->tr_timer;
 
@@ -470,6 +469,7 @@ void v_start_timer(struct vudc *udc)
 }
 
 void v_kick_timer(struct vudc *udc, unsigned long time)
+	__must_hold(&udc->lock)
 {
 	struct transfer_timer *t = &udc->tr_timer;
 
@@ -490,8 +490,6 @@ void v_stop_timer(struct vudc *udc)
 {
 	struct transfer_timer *t = &udc->tr_timer;
 
-	/* Delete the timer synchronously before teardown frees udc. */
 	dev_dbg(&udc->pdev->dev, "timer stop");
-	timer_delete_sync(&t->timer);
-	t->state = VUDC_TR_STOPPED;
+	timer_shutdown_sync(&t->timer);
 }

base-commit: 238650ef6c7c7cca08e032527329424c9fbd70e5
-- 
2.53.0

Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6149371897
	for <linux-usb@vger.kernel.org>; Mon, 27 Jul 2026 12:34:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785155663; cv=none; b=SEZOqPeeRyRbw/qqwQP86PGSqwsiYYSX3thqYkCIro4HKDij+y0x70EYTXiIqQR72wDQnbxH4QFTPTez9J/2iYZAp6bIj3RjB4/drz2BMgVJO5Ij9U7Tqjn+KSAPA9aQROloEMKD7sdW7QH9H8CGdS3fohY1E+LtRFFdcfaSfec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785155663; c=relaxed/simple;
	bh=tnL9O9Z7eVZ+EFi12OyJIwP3KzopoQRB3H0/5ZGueNY=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Dzh1alaTXsHbvfXpDKSMIStpXfUVzH92AQ+pbWLQROdCrIODkqr2v8ZFvVa5usON/icSqoR6NuNoeMkt688YOPXbzRd5nXt+uAOxNyKXUtT44NygX1+IsdOqjMXDpl5GQszy4cBBs3qo5TXqinSjyYYmmCUNGx7z3JX2xhGtgyA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SDncjdFY; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SDncjdFY"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-38e3efab7e0so2074939a91.0
        for <linux-usb@vger.kernel.org>; Mon, 27 Jul 2026 05:34:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785155661; x=1785760461; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ad864FHAlhdgy4F9Sp08C6CuMiqJx6RHQkPj5GQwqjE=;
        b=SDncjdFYndxVcFvM4eSwH7OQqOIvZnH4dVWQvnlBgY+EFIih2pmUc15WrN9F9salVr
         j76hgjufrGZy8QIz+lKdhIMEYIdvzMGT1Qo/39OH9OJlU2uo7uYCGRTpMEKra119DmNJ
         uSQzZTA/YXLsD4ZuO7Yi2K/CKIbw7gwCv5GBeHzLdXfje4aquWX98TsibJLxAWKI/7bX
         bfnHGZUVws3ZOe/4EkxTtLyOcNA7/Ik3fqDo8U5FEHk2m/Hu2dbEtJWJcCtzHnYGt/Cd
         SzcAkTdLh1sHlBsSyB8P4k+Ka9A5LX6ic7ZHiYPxEPzKEwxw9xrPqBPH09NSU9aknPds
         aRfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785155661; x=1785760461;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ad864FHAlhdgy4F9Sp08C6CuMiqJx6RHQkPj5GQwqjE=;
        b=aOZx0PFU55ZowS8U5YpS3EL1f3vrdNrn/ZKyejQgyGAgCY8/6Cx3hwCHXuXc8uW1Fw
         qfWyFaWDz/hZF4OsmxB98BN0zQGruFuSyBu+uYhW1iSRDuAuLBcSIDfpFiMZbC7g9Tl+
         v3k+v9UixI1HSxvpEY0laPkkMccBPo/JaqPZByrvkbzc3I3cWkQL3DGuXp0bT1LwNZAk
         f1bImn0sHbf4t49plSydURFAuf/zDRFYxZAghb0P70Cu/PVbadSc6P3JWG2U1iUnx09X
         wWNzn5Q2ykQFQ/HofV48iHfhGo8gRZp/zSgiAgX45fZ5Upqovn4SrubngPhj76C3/KNe
         xClw==
X-Forwarded-Encrypted: i=1; AHgh+RqFNJmVGUZT1IZjczbf/gfUwFL+Y7OBVRQJv9D13YYPAgw+P41EELCFASrIkdTZHMem54PATV+wG+A=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy4rn4S1Q3QThLD4SjadwfCM+tmc/luLS10gq7eE68lj5Ly03PV
	Qyew/kALL4qOVK/+CeXhscBqKx4+K8sxO//thzDnTDLq8USNaMkZYIs=
X-Gm-Gg: AR+sD12uC943gAE/iU35CL+J3zgNGdaMvd8jHjerQ822nv7D4+RUUc/3/dCyKilhJnQ
	mhxPCGbmC+auFqNQwvphzEeLD1GiaSi+XuGU0+Fdha4Krt8TY0BzSfOjtXUxcexNroAwNXt8jeE
	vhWj5Du6CUMpmWwV/JmK50BnAACDKAgPpMMvtKWxgGRrkoCQAQSO+t0svNiofgg+N4UIh5Cfvc7
	z++4xYxkJzNmZsqXR+ULKfeO9A9oA3zZFgIlsa4wtBTXLmfYK52p8sVuWA+x4YA4sQTM7hJabhK
	vivm2TjSZJFrLfsgmeb915tcq+OGySrO1Q6qfGWt/QivVtTNx8sHhk/jVi3/mMdL4/9yQFccjyS
	Ajl1wYdw3aeRylGxw8zhJIF1UasJzOK35IEdeIWE0kgaBjXhMJvuAjwXEOJQkCoAnBcD3Z9KpmY
	zsGkCaAoATIA+s0YTgr8+G1qmtkvGf5Y90T284wiGrgQ3Dv1t5sVdDHhYyoRrhyqsVxj6vO9ecC
	zsUAQVCccaUd5JmhJmJtVZMKIcyGw3lSfAyo3XaEU+xU5jvx2C19tY=
X-Received: by 2002:a17:90b:554f:b0:387:d5bd:6231 with SMTP id 98e67ed59e1d1-38f2aacfdadmr5837955a91.20.1785155661178;
        Mon, 27 Jul 2026 05:34:21 -0700 (PDT)
Received: from localhost.localdomain ([121.147.145.153])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38f03ad817esm4956993a91.4.2026.07.27.05.34.18
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 27 Jul 2026 05:34:20 -0700 (PDT)
From: Myeonghun Pak <mhun512@gmail.com>
To: Alan Stern <stern@rowland.harvard.edu>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	edwin_rong <edwin_rong@realsil.com.cn>,
	Ijae Kim <ae878000@gmail.com>,
	linux-usb@vger.kernel.org,
	usb-storage@lists.one-eyed-alien.net,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH] usb: storage: realtek_cr: fix use-after-free on disconnect
Date: Mon, 27 Jul 2026 21:34:14 +0900
Message-Id: <20260727123414.44700-1-mhun512@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

realtek_cr_destructor() calls timer_delete() before the chip containing
the timer is freed. The timer callback may still be running and can
rearm itself, resulting in a use-after-free.

Use timer_shutdown_sync() to wait for the callback and prevent further
rearming. Do this unconditionally because ss_en may be changed after
the timer is armed.

Move timer_setup() into init_realtek_cr() so the timer is initialized
before any failure path can invoke the destructor.

Found by static analysis.

Fixes: e931830bb877 ("Realtek cr: Add autosuspend function.")
Cc: stable@vger.kernel.org
Co-developed-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
---
 drivers/usb/storage/realtek_cr.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/usb/storage/realtek_cr.c b/drivers/usb/storage/realtek_cr.c
index af038b897c6b..c4b28744693b 100644
--- a/drivers/usb/storage/realtek_cr.c
+++ b/drivers/usb/storage/realtek_cr.c
@@ -916,7 +916,6 @@ static int realtek_cr_autosuspend_setup(struct us_data *us)
 	us->proto_handler = rts51x_invoke_transport;
 
 	chip->timer_expires = 0;
-	timer_setup(&chip->rts51x_suspend_timer, rts51x_suspend_timer_fn, 0);
 	fw5895_init(us);
 
 	/* enable autosuspend function of the usb device */
@@ -934,10 +933,7 @@ static void realtek_cr_destructor(void *extra)
 		return;
 
 #ifdef CONFIG_REALTEK_AUTOPM
-	if (ss_en) {
-		timer_delete(&chip->rts51x_suspend_timer);
-		chip->timer_expires = 0;
-	}
+	timer_shutdown_sync(&chip->rts51x_suspend_timer);
 #endif
 	kfree(chip->status);
 }
@@ -982,6 +978,9 @@ static int init_realtek_cr(struct us_data *us)
 
 	us->extra = chip;
 	us->extra_destructor = realtek_cr_destructor;
+#ifdef CONFIG_REALTEK_AUTOPM
+	timer_setup(&chip->rts51x_suspend_timer, rts51x_suspend_timer_fn, 0);
+#endif
 	us->max_lun = chip->max_lun = rts51x_get_max_lun(us);
 	chip->us = us;
 
-- 
2.47.1


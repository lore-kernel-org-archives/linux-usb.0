Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794034990;
	b=MV3NlIUmdtvma0HEp2bYq+WW8YZmKNC34vNZpr1Dc+epi7lx3sqjWaVxcmH3G9RFPFcb
	 kc0ADTGAf9Np3lKNO31t6p3HG68z89x4tckmPwsJzqiCM3tJSn+xiimDrTTfzUKfLAyBc
	 T7mqHmQHMnXuYOeyTJIJjUyQ6qU6B0Sn0txotZJboH6pYbvBKPWOP0fp10dSMn0q/3ibl
	 JW8fD0GmKQbwY8U9sP4qj2sbAc8QAAG9s9wMG8lRvjU8swjSPvXDJhhw4ah2FBeDgi6wX
	 4Pww+32Z410J8NM0HQu8BK0mX2EUfbAudx3HLdSKffZ8ReqrXtAO6v2ZC0bQicOxsDA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794034990;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=bFEfHL+TsS1kVBZGSFsslYDN/djqa+P4kfXVi1Yph7g=;
	b=yYqUiJZgKpge9jG/Ig/2qQShi2y/EyE4P0L8TcsswcG91DU/aPlN+Jf4BtCEVsCPWLde
	 5lXpVI8sC3K+tjDcGi1jml+RwMP4NtsMkngDh90WxOQq8SEhFQKLZVsK+Ob48QXzOXsiO
	 N+oqm7N+FVJq/cvLEV5Zd2Y1riGKuHSS3f0LUOZ6kRGPtgB6TBL4PoUWm+0nUdWxvgA8N
	 HcW9gmUiUO6gXhuY0cNnEgVmYITN5RZwpO2hQHI4UhwWnBf0C1Cy+BvO9Ncj3xeGuYk/b
	 byhL7lV4N/m3swGv3byvDaLkfWLGEM1H1sWtg1xbrbx4Nv9BKijXfEPH4XqBR9ddrfQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GcmYpw6e;
	arc=none smtp.remote-ip=209.85.216.41
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9345F606A32C
	for <linux-usb@vger.kernel.org>; Sat,  7 Nov 2026 07:03:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9345F606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GcmYpw6e
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-3b09a83d12aso900726a91.2
        for <linux-usb@vger.kernel.org>; Fri, 06 Nov 2026 23:03:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794034990; x=1794639790; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=bFEfHL+TsS1kVBZGSFsslYDN/djqa+P4kfXVi1Yph7g=;
        b=GcmYpw6eafQhXUAXEwA8jwummuHvOzaIwSi0Y74SZr4ARQSCpITqDEnVzsgzgEsFFK
         8XA3N+FlcWdCRo6cxvHhjVmbXoQCBTMnvihWtnebvnUL3NP3Kkpim/1OsujmN6CK+fW1
         geLraiZRO6B8jG4UZdjv+zwi43Jlr2aXeZgNaBPowHqPglGKqkButi623n2sV2Bvqsrv
         t+disbEPHRq8Qd0BP166jNXPM9Gqr5OHyQmNU0ce3pgBHLxLRP9CqDP2hWoTHyRYQzdY
         0oQlaX9hiO5XM3aPoarRtrL9S76WG92mEJ3+29HAyk72Et5dbOW6rKyGY9BwwARORPD6
         pEWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794034990; x=1794639790;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bFEfHL+TsS1kVBZGSFsslYDN/djqa+P4kfXVi1Yph7g=;
        b=ghdXwOBfpDQll5Yhw2a0vTfa6K40LHZhBwesTOydJsbWJBBCi3DVSNpSk16V8HEf3d
         fJUN3YLq1yP/E1KcAtlejJDFRo90kx1r2EUrZlEzOJ+c2Wwh4rlCQNZqM6ioUlit7loo
         R3sz41VllRINgoouzMF7dtK0/dxpDpO+l7MQRWvMmCrZXXyoz6U1uxBGz5R/F/996SCS
         yCyyEZ9i/bRKhHisMjT8POG1matJcyaFyKi8koXJSjSiOzhZ9GWOICtAnJ8llc6M7n+U
         csCDkiawaX1ecJDxzGNzQdub9mPCN6QKeoXU4IfK1UGY6SGtcTJRLeQ92yG4tdq7+Yb/
         oIQA==
X-Forwarded-Encrypted: i=1; AL+hErFZfxOqgxeoAtSF9JpTT2+HkgQiGZDTnpfr802mubev48c74M+ytlCcAC/K3IWYGWYpj5CYBo9lhMw=@vger.kernel.org
X-Gm-Message-State: APuU4Z/zR5F+BHnaafUBetzfzaM3fJOEAPyHYchnVVUYWkVCvMFty5sg
	dVi9MltYWfHcbax5eMuEXSYW0BKGaDjShubSR6d/nsuOfgb9prSpwHuxcBdn5fqh
X-Gm-Gg: AYBFou3t79mDomzsFNzLResq4LP2Nmv3E3/OQzKCn4/gas5e1BsZ+tEO5+KVySKFu1V
	NuWaAuuaICPB4cyih72tbwCLUUzZFP0xF8BJ7We2noO0QYBtQUoMavdLJP/y18YTgLCoeePdpAZ
	qxOH3WGdgM1XDU0yE3ywPL25PhskFSOvZdAyRGudWK7t1BP3Y60AZtNclmC45LYu6GljHSpstB8
	1Q/CQfrf/hVb/wbvXe7pAVDUcI5N0S7g+iC7WT6hGmEw0+lBBx6QEghlUN8dIJB99D15oFMuFdM
	xjDC/PmbdMfi9e22gUfCaXt/J8fraF2QVXkBgar93wAzAfyvWttArvJlIKi9UiV5sjAs3q7c4Bm
	sYyiREb2W5AkNvPn8/6rMfekwonDxF7OX0Otlp9xNR77Buo3SZACBWUnFmeoJYerSFhq8Ljiv4i
	2pxSgWJG9e04BrQi6c1UMaUnaKv0vzZXJXJJPzih1xghh5L+gj3sYY3oTCHUYLpwloo7W0rQZH8
	+FbnE3SAecCwb9imTEgOrwYo3RPKC4f7I95F5L9K+PD6yKLKJDx9s+dFSP25AfGwssSvqgtDNj5
	k6z5iE/a1pHRtzCAhonByrGnHnYmJznT6Cj31bkYRo2o2hub
X-Received: by 2002:a17:90b:2792:b0:3b0:cc6f:1046 with SMTP id 98e67ed59e1d1-3b0db7109d1mr4442933a91.67.1794034989765;
        Fri, 06 Nov 2026 23:03:09 -0800 (PST)
Received: from hj.. ([163.239.22.29])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1057c1c2csm2220866a91.2.2026.11.06.23.03.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 23:03:08 -0800 (PST)
From: hyunjungg <hj351016@gmail.com>
To: Neill Kapron <nkapron@google.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Hyunjung Ko <hj351016@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH v2] usb: gadget: pch_udc: drain vbus GPIO works before freeing the device
Date: Sat,  7 Nov 2026 16:02:58 +0900
Message-ID: <20261107070258.3413402-1-hj351016@gmail.com>
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

pch_vbus_gpio_irq() and pch_udc_dev_isr() schedule
dev->vbus_gpio.irq_work_fall / irq_work_rise (pch_vbus_gpio_work_fall /
pch_vbus_gpio_work_rise), whose handlers obtain the pch_udc_dev via
container_of() and dereference it (dev->driver, dev->pdev, and
pch_udc_init()/pch_udc_reconnect()). Nothing cancels these works on
teardown.

pch_udc_remove() -> pch_udc_exit() -> pch_vbus_gpio_free() previously
only called free_irq() for the VBUS GPIO interrupt; dev is allocated with
devm_kzalloc() and is freed by devres after removal. free_irq() only
waits for the interrupt handler to finish, it does not cancel a work the
handler has already queued, so a pending or running work then runs
against the freed pch_udc_dev (use-after-free). pch_vbus_gpio_work_fall()
polls for up to PCH_VBUS_PERIOD (3s), widening the window.

The two works are armed differently. pch_vbus_gpio_init() assigns
dev->vbus_gpio.port and INIT_WORK()s irq_work_fall *before* request_irq()
sets dev->vbus_gpio.intr, and pch_udc_dev_isr() schedules irq_work_fall
exactly when dev->vbus_gpio.intr is 0; irq_work_rise is only initialised
and scheduled once intr is non-zero. Cancelling both only under
"if (dev->vbus_gpio.intr)" therefore misses irq_work_fall whenever the
GPIO is present but the IRQ was not acquired (gpiod_to_irq()/request_irq()
failure, or a device interrupt racing removal before interrupts are
masked).

Drain each work according to how it is armed: cancel irq_work_fall
whenever a VBUS GPIO port exists, and cancel irq_work_rise next to
free_irq() under the intr guard. free_irq() runs first so the GPIO
interrupt can no longer schedule work before it is drained.

Found by static analysis and code review; not runtime-reproduced (needs
EG20T/ML7213 pch_udc hardware with a VBUS detection GPIO and an interrupt
racing device removal).

Fixes: 637b78eb31e0 ("usb: gadget: pch_udc: Detecting VBUS through GPIO with interrupt")
Cc: stable@vger.kernel.org
Signed-off-by: Hyunjung Ko <hj351016@gmail.com>
---
v2: drain irq_work_fall under the GPIO-port guard rather than the IRQ
    guard. irq_work_fall is scheduled from pch_udc_dev_isr() when
    dev->vbus_gpio.intr == 0, so the v1 "if (intr)" placement skipped it.
    Spotted by Sashiko AI review. The separate pre-existing missing
    cancellation in pch_udc_shutdown() that the review also flagged is
    left for its own patch.

 drivers/usb/gadget/udc/pch_udc.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/gadget/udc/pch_udc.c b/drivers/usb/gadget/udc/pch_udc.c
index 99b3ce2..5351bd9 100644
--- a/drivers/usb/gadget/udc/pch_udc.c
+++ b/drivers/usb/gadget/udc/pch_udc.c
@@ -1406,8 +1406,12 @@ static int pch_vbus_gpio_init(struct pch_udc_dev *dev)
  */
 static void pch_vbus_gpio_free(struct pch_udc_dev *dev)
 {
-	if (dev->vbus_gpio.intr)
+	if (dev->vbus_gpio.intr) {
 		free_irq(dev->vbus_gpio.intr, dev);
+		cancel_work_sync(&dev->vbus_gpio.irq_work_rise);
+	}
+	if (dev->vbus_gpio.port)
+		cancel_work_sync(&dev->vbus_gpio.irq_work_fall);
 }
 
 /**
-- 
2.43.0


Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794033423;
	b=Dm8Eyar/FBpkBdlyrMSCUOhvhDfeptqLvf7O3p/AHoPU6b3juN81c+KIipFAFdThQ85q
	 27cDJHWqhw5uDncMRkVFUEMrlhZ56S13LvGuXC3tjC6oQs28+Cn1lTMIu5bNWKB/Fgewo
	 vXeFOd+Brl/flUordGaUc+g8kYqYmzgVPWcT5fO1AfrXg9C15eXVo4YRCtXI9fWFa1aZh
	 NyFVz8i58T3xixClZFE5QVj2l5mMaaD7Sl0yB7t6FsdGkfiTfMh8eRp8KbBhttNueBlpi
	 ZINlM3llU7Gk5e6eiNvoAoFbOHummh4q9yP1LMFCTORNaJNWl3oUKO6XMvlJkUUcOuw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794033423;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Nfma+fKmOvB8Kb+wDc6iuXdg0uKJemcmpk9R9n5B7+o=;
	b=YmSEFeZTh/vcisPLOZn8h/iCzBllXnxH90kqie7lLyGUWUQykRpBGAf3hyOKSwl55eGr
	 HwVg29W3XKF1MGugaBicxI4qqKvy0berkGAdsiZ5Q4e/s9Yf4PTgK4UBhVY7GVi8FM3/k
	 r4AVJKUT3InuWy1gWswbZGU6uHJRpDRkdKrQ3x0wmAA5c8+s04SnlC6LnvrdN9lZ3VLui
	 BfLvKQreBlKPYVLkl+m7sg594/5oOeoBveVcYLiWUrfDb8QKPP7uGUEcVsVoSV3fe5fIS
	 RUmEL3Ztm6+oZn6wu6W/PpnuriX5VveliPdB/BG4GVRfgdJEuTJbGKBE/hV8lj8zLRQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cOzjfxWL;
	arc=none smtp.remote-ip=209.85.214.175
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51156606A32D
	for <linux-usb@vger.kernel.org>; Sat,  7 Nov 2026 06:37:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 51156606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cOzjfxWL
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2e8da6ef7ddso7723475ad.3
        for <linux-usb@vger.kernel.org>; Fri, 06 Nov 2026 22:37:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794033422; x=1794638222; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Nfma+fKmOvB8Kb+wDc6iuXdg0uKJemcmpk9R9n5B7+o=;
        b=cOzjfxWL+j9lSpENTzhuwl27q9nHgq3B7LCdrsD34x25y4TBbS2/8Vsl29m2s8uwEE
         vqyuph5P2EplS/EpcfLSJEvAL/ujYPVeG3HiMR7R/6bM36fg8FddRBep3gYnW/rZj+wW
         7HcQ4iOEaWpB8JzQKogSwuS4hv70LY574AIYyYZa5QzADQbdBpmr7q8KDLL8h2GwSSCV
         lVVDlHUnIu6eAlQhBprgS3bcwylYKMlec59qSPMXEj7bOy1k/VO3LvWlWVnguFHZKEWU
         yyhVX+KYGY8tJPtNzxB4QDcMiIQmzQE7qEZfyrkFMauESXp+Epvt5xHlVSTQdvrY6VJo
         UOoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794033422; x=1794638222;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Nfma+fKmOvB8Kb+wDc6iuXdg0uKJemcmpk9R9n5B7+o=;
        b=ZAhb3U3J6EQFiTBdaR5NYmuWT4Oj/fLeouwrx0ivP9d6q795EBnO3/CLQSFOZmp4Mw
         ujSU71yX8DxHDCyzHjg/mPi6HpGOYJjH/sakvuZ4nC4cWLGP+grc+LuKcuR0gUj4Rq+j
         BlyTodC8zeMJtKE8zOo6Z97a1x3GOO8L5kLp2VHfaFYsaMiAReyo2r46sATx/tiSqP41
         a8UXoNkGU40lLyzeIpinwgtPtrpvsBEpII6NvOvV2v+tjp8LUM4DR+/fGaQhuUyrbiYX
         RE0u/niwBVDyeRtDcFbT4pVedNkws5xL3U9Il2EFMrSo4onlzu5419wNSMpe5EwVZfoi
         wlQw==
X-Forwarded-Encrypted: i=1; AL+hErHslWX/KWb9VUxF9tp78Cbtwl6rhY84snUMt0O5Jrl4AbRdFF8sxzxbn+ohYdhwBpHVSV/qGZ/l8F8=@vger.kernel.org
X-Gm-Message-State: APuU4Z/seyMPLQbrR8e38v9B7PU39pWgGmTO5nmHvrUlWqIFxScK7xvE
	SriW2Sk/j/yWGfyQ32o/yA9F1oMcOze1tULU2goRO7puDeLKbNd18Nkn
X-Gm-Gg: AYBFou0XSYi+K9O4IY5xmXTqxyCkzoaiOwtPftSG1bKssw8Rc590iYcHUVJmM24kZ83
	YwV+DTy4/5FDiwGQ7ItmrGKI71SVsvxIHo2ZXTHn5SlqvLZR0QBr11UfHek1m/hFlkEv4PcEifG
	kXUhrdh4UIoRpwUVbJGKvRM+P1qoTN9KhmmWcfXudFOSwZMh/bRjnZgIfUSOA0g7RNED+pnHC1A
	Kd4b7eLeXX8VEWQoiZkGFQ0p/VNF1FQb4ZO7ofEdsl6O149fUR8zFUQhSxLSu210jlKzdnXK8HD
	2m/Ek3ErRzYKuuGThwH5gIO4/Dpm4lWf5Tj2DdsZ4hMDwEF5pGApRxCFX/2NnlQxggQA6HoYdkK
	m8xyQzk94Sp2SYeU6dU7RDhRFwdHHAhPoBBgY3Idf1gfMHPNdXOd+Vdi9f57wP6G6Jgapzv3OMu
	WgKwoTPkX4B0Pyc3Mg71WRjeDIK3xcT3pyurvepAVxL5R0bCwrA8oqqRLc3B3E4PaI0lyL29OEA
	FW+xzbyyHNrxpugL7pcT8rz0tGq7VI0w7PtyLq65B1/Sx3tEmiybk5y+N3ced+Fd6KQideY6hJA
	3+csXibrqvPd46mDmB0TmOAzK/ZsVtEe2Sm2olpPjh7AVkdU
X-Received: by 2002:a17:902:d503:b0:2e9:79db:449c with SMTP id d9443c01a7336-2ed40deee43mr57053455ad.47.1794033422254;
        Fri, 06 Nov 2026 22:37:02 -0800 (PST)
Received: from hj.. ([163.239.22.29])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ed47d5f792sm11115735ad.47.2026.11.06.22.36.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 22:37:01 -0800 (PST)
From: hyunjungg <hj351016@gmail.com>
To: Neill Kapron <nkapron@google.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Hyunjung Ko <hj351016@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] usb: gadget: pch_udc: drain vbus GPIO works before freeing the device
Date: Sat,  7 Nov 2026 15:36:52 +0900
Message-ID: <20261107063652.3387873-1-hj351016@gmail.com>
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

pch_vbus_gpio_irq() schedules dev->vbus_gpio.irq_work_fall /
irq_work_rise (pch_vbus_gpio_work_fall/_rise), whose handlers obtain the
pch_udc_dev via container_of() and dereference it.

pch_vbus_gpio_free() frees the VBUS GPIO interrupt on teardown but never
cancels those works:

	if (dev->vbus_gpio.intr)
		free_irq(dev->vbus_gpio.intr, dev);

free_irq() only waits for the interrupt handler to finish; it does not
cancel a work the handler has already queued. dev is allocated with
devm_kzalloc() and is freed by devres after pch_udc_remove() returns, so
a VBUS GPIO interrupt arriving shortly before removal can leave
irq_work_fall/rise pending and have pch_vbus_gpio_work_fall()/_rise() run
against the freed pch_udc_dev -> use-after-free.

Cancel both works after free_irq() (so the interrupt can no longer
re-queue them) and before dev is freed. Both are INIT_WORK()'d on the
path that sets vbus_gpio.intr, so the existing intr guard also covers the
cancels.

Found by code review; not reproduced (needs the EG20T/ML7213 pch_udc
hardware with a VBUS detection GPIO and an interrupt racing device
removal).

Fixes: 637b78eb31e0 ("usb: gadget: pch_udc: Detecting VBUS through GPIO with interrupt")
Cc: stable@vger.kernel.org
Signed-off-by: Hyunjung Ko <hj351016@gmail.com>
---
 drivers/usb/gadget/udc/pch_udc.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/gadget/udc/pch_udc.c b/drivers/usb/gadget/udc/pch_udc.c
index 99b3ce2..5531094 100644
--- a/drivers/usb/gadget/udc/pch_udc.c
+++ b/drivers/usb/gadget/udc/pch_udc.c
@@ -1406,8 +1406,11 @@ static int pch_vbus_gpio_init(struct pch_udc_dev *dev)
  */
 static void pch_vbus_gpio_free(struct pch_udc_dev *dev)
 {
-	if (dev->vbus_gpio.intr)
+	if (dev->vbus_gpio.intr) {
 		free_irq(dev->vbus_gpio.intr, dev);
+		cancel_work_sync(&dev->vbus_gpio.irq_work_fall);
+		cancel_work_sync(&dev->vbus_gpio.irq_work_rise);
+	}
 }
 
 /**
-- 
2.43.0


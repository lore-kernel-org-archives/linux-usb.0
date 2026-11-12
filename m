Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794499524;
	b=47A6XJfO9QJICbrQZpBy2Al+e/v3qPaphHd65b7xpTf4UsLqAJ1dFd0bZQkLyBsBpUZr
	 5Kdn7xLPniKhw4xQxk/PEl5qGC5IvToCCvqX11L5TKTFeMHn1cO8278udVzh0P8k385pb
	 tgY3HDNvObbamAwtSQlcR6SGUPObll5EOjRYapXbKKmtXdB/ZLPOnHpNhC3DB9LaLU2Vq
	 x4lWiyB6Hsqx32v1yFeXyhry0zgWe8yaSrUeuNA//0aMDqkpbYPjdNcs375G3RlMnW1yj
	 Eis1z3F+OMVzsQQiO91SNOYdzTq4w1g1/0Z7jfzGbu7O+kyYm75ItUhwBGH2gKGM2vA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794499524;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=tE76MrQH8XJvj1ul1v3QW0sYF6230jiCP1A1lYdk1PE=;
	b=DOqG0WFzTnjBVFvquWklRIGR1uu73He/0DeujpeBb3QyewF9WfI9Locjyn1TIFWGawqZ
	 WG0cASze2pjPRO1bH0iJ7/yjSs+PNftUUKJoY4bI5YinDFbMY4zmXsF9uMvjxRmmQUq6r
	 RwX5VE9zmt32s1zzU064GXoGyaHXPVOEet/F8ojgxxPl4SLvfZc/vCtkdjDGgAn5879yv
	 2+Vg2+9cAXkbktzB9yk+e3A95Y1Nuzb9tlxjtBc8cxmCjrlwfcGCLKV3jdxR4xuVVnqOL
	 74wq+A2m8uY60Q/i0AUYgygrLC+wLF8RIbEQYm3v71/WqwI3xYCpYvhjEPp2p/p/dOA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="lA/WgH/8";
	arc=none smtp.remote-ip=74.125.82.172
Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80F5B606A327
	for <linux-usb@vger.kernel.org>; Thu, 12 Nov 2026 16:05:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 80F5B606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lA/WgH/8
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-37123334649so1866eec.1
        for <linux-usb@vger.kernel.org>; Thu, 12 Nov 2026 08:05:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794499524; x=1795104324; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tE76MrQH8XJvj1ul1v3QW0sYF6230jiCP1A1lYdk1PE=;
        b=lA/WgH/8VpTAAvkenjCckrLDv6u+z8zGa6rBI28SHmsRN2iQKYpA17c7IHozKLle+o
         LC0Zv+ldNOygUQfalmvImLv3i7vNbmdfc7vB7E+b7S087kyVhfOjg7hwHi5TH7JZOUO/
         Xz8g+xlOleZCWbZPmGZtldPlHzyHhUvgvf9iwWGJeCAwAujBncP1pOySJpBJQLqVuI+t
         ddfh6Vv4W/1Q5K0lh7Rb6U7e4hKg51jCl3zHSRMO+m2LjOe75YcxlpJc6qZ5TmxFVRTm
         6ERHSpyxJqx464i6bhI59V1EDLIZ9+KpzrTCt921OdiDxdiIIzniWcEUa+ZOttdSJWci
         vJ6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794499524; x=1795104324;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=tE76MrQH8XJvj1ul1v3QW0sYF6230jiCP1A1lYdk1PE=;
        b=nX/PEMlrZoCX+VZlpDcDTZ+syjqhfwVaPGxgpZHhWSBxR+ajwdbDzOo1HgEQofeEms
         rspkUDkBxDUyVx3yrbzmX08PoouswFflDMLQcNVtm5bKMFsa5Icopu86F8FK5V8xOMKj
         CI2nH2EgUCIuCQ7Hfrxm6+rSx2m+NODc+8n8/LMestn1lP3EFjE+FmIZrGh7A0jfYpNw
         /3wtE3LaunBMatIp4RMVA/27S+o3B89ehQyXY1p7TG3J+eAd3eGKgTnCRgPD2d2+cm2S
         dDQCdaDUoswUGb53fKlRVYza27BzkUY4y1WxW0oW8l7TK/JLEqXxuRcGi9I0UI4v2yMc
         hXAA==
X-Gm-Message-State: APuU4Z8/Puozn/0ivKwXwvAkN2Jbna95GyPiaoJG4krpBCyX8w1KEEGu
	tNY8A5q+uVL66jbKotw5QMo+GVaBg1lOsWgXgAdv4W834oQk5rpYeZIOkTvE4BEIkY0=
X-Gm-Gg: AYBFou0klCBitFW1lRS5CbjCaEyyijyGHMjM1zJr3kFeALDKF7a1rhfoUac9xn3w6qf
	QOdWx0VskMjP8on88RZd3HUUSEF1py+3hpNkLPDt9noNopI5DKuWu747BH6IJPNtsGQR+Ek52cx
	87Bl8IKDSDtbjO0RXqUM6JAoNqvW7PeQFNWNRp7q/VgFFeaHNceQPXRPZYzLlaB6qcSuh2216L+
	JMs0A1kRymclirew2wnNpKZXz8ORP+q5VILV+KnXri1c3DVzFEvXFR8PpCvKYf1Qouw09z9SXlN
	Wb5XuV24TEsWag9X0nU4/dHWC2+1uR76sE1Vv7QSQsiOO+VHfhmn9/X/c2DfR7Qap+XVQ4U65KQ
	c0tR9FJVgXtjmQRVGEr2BAyVik0au9AEeFnIjPCv/VHlDIysn8FURuTocYh84L48WBqVtRiXstX
	jHjtnnr2l0uJI9T4oYOs5kmRIg2nSNMdmhZ13SxaNsyl+6F3HAqkLHutwt1h5O9QS6ckLSUkFQn
	yWTSmOtzEfypbQstbCWvqYUHbSEo1T4dFsxc3cLDmyrINFuLnTbvvhR8OSLKJosIiRxbcV90Cd9
	o2RBvFIuo/D0Z8WIvz3l3buOHpFmrES7NAZ7oV2lRQ==
X-Received: by 2002:a05:693c:8113:b0:35f:ea17:d171 with SMTP id 5a478bee46e88-37684ceea1emr10292277eec.2.1794499523507;
        Thu, 12 Nov 2026 08:05:23 -0800 (PST)
Received: from CRASHEDROM.localdomain ([142.249.36.161])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37922d49049sm613673eec.1.2026.11.12.08.05.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 08:05:21 -0800 (PST)
From: Chengyu Liu <lui2012qwq@gmail.com>
To: linux-usb@vger.kernel.org
Cc: b-liu@ti.com,
	gregkh@linuxfoundation.org,
	nkapron@google.com,
	tony@atomide.com,
	bigeasy@linutronix.de,
	balbi@ti.com,
	shimoda.yoshihiro@renesas.com,
	robert.jarzmik@free.fr,
	Chengyu Liu <lui2012qwq@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH 4/4] usb: phy: gpio-vbus: free the interrupt before cancelling the work
Date: Fri, 13 Nov 2026 00:04:48 +0800
Message-Id: <20261112160448.41566-5-lui2012qwq@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20261112160448.41566-1-lui2012qwq@gmail.com>
References: <20261112160448.41566-1-lui2012qwq@gmail.com>
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

gpio_vbus_remove() cancels gpio_vbus->work while the VBUS sensing GPIO
interrupt is still live: it is devm-managed and freed only at detach,
and gpio_vbus_irq() schedules the work with a 100 ms debounce delay.
A plug event landing after the cancel re-arms the work, and its timer
then fires on the freed gpio_vbus_data.

Free the interrupt first, which also waits for any running handler,
so nothing can re-arm the work past the cancel.

Found by static analysis and confirmed with a KASAN reproducer:
slab-use-after-free write in __run_timer_base() within one debounce
interval of unregistering the device while its VBUS GPIO is toggled
(object allocated by gpio_vbus_probe() via devm_kmalloc(), freed by
devres_release_all() at unbind).

Fixes: c2344f13b59e ("USB: gpio_vbus: add delayed vbus_session calls")
Cc: stable@vger.kernel.org
Signed-off-by: Chengyu Liu <lui2012qwq@gmail.com>
---
The reproducer instantiates the unmodified driver on a gpio-sim
chip in QEMU and toggles the line while the device is unregistered;
it widens the remove()-to-detach window with a 500 ms sleep, logic
otherwise unmodified.  Repeated runs: 5/5 KASAN splats without the
fix, 0/5 with it.  The KASAN report and the reproducer kit follow
in this thread.  Also build-tested on x86_64 (USB_GPIO_VBUS).
Fix written with AI assistance.

 drivers/usb/phy/phy-gpio-vbus-usb.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/usb/phy/phy-gpio-vbus-usb.c b/drivers/usb/phy/phy-gpio-vbus-usb.c
index 60b7c1219dd2..82d2301c3804 100644
--- a/drivers/usb/phy/phy-gpio-vbus-usb.c
+++ b/drivers/usb/phy/phy-gpio-vbus-usb.c
@@ -325,6 +325,14 @@ static void gpio_vbus_remove(struct platform_device *pdev)
 	struct gpio_vbus_data *gpio_vbus = platform_get_drvdata(pdev);
 
 	device_init_wakeup(&pdev->dev, 0);
+
+	/*
+	 * The VBUS sensing GPIO interrupt is devm-managed and freed only
+	 * at detach, and its handler schedules the work with a 100ms
+	 * delay; free the interrupt before cancelling the work so a
+	 * late plug event cannot re-arm it past the cancel.
+	 */
+	devm_free_irq(&pdev->dev, gpio_vbus->irq, pdev);
 	cancel_delayed_work_sync(&gpio_vbus->work);
 
 	usb_remove_phy(&gpio_vbus->phy);
-- 
2.25.1


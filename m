Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38202237713
	for <linux-usb@vger.kernel.org>; Wed,  8 Jul 2026 13:03:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783515806; cv=none; b=SlEOSOTFp9lsvxF3k0Gs5S4+8bKCpQVrcMH1YA8VlOwDbfIcGdKG31jkuAA12MO9/rxnmsGQFHfHh58k1eVSwVR3yglJbV7e65MnoVyxsLgFUdrTGDNiJt7LNpBmmTZr306Po9ESjwRBsanwoGHvT70obg6VHOp/Pg0aJdDryZ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783515806; c=relaxed/simple;
	bh=wMkut5Uy6GFC4Y5/NaoSdfyJqTh3lHwtlX1ZgbYQWro=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=p2pfuNeAdMPaX+fGJ24r2M2dui6rjLBwREAsgFlJAZt7/pJv+/VTzRgJHy3tNn1PRdBqC5+fvSyfjZFEIAMmbCQtPjmrrsrqyT1ivnkA1iD0h9wwH1mCw/I8gipkGCKmZFinvoqMDaITEv0TVhCGTvVSLQjkSjB5M7fQ09Qdd28=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=R/8IheB2; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="R/8IheB2"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-8471013fac2so628494b3a.1
        for <linux-usb@vger.kernel.org>; Wed, 08 Jul 2026 06:03:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783515804; x=1784120604; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=VVFvYB1ZTF1YFVgXCjhA5ZAF2SkXYiQcnsQlb9i8bfU=;
        b=R/8IheB2HTeglK6hEG7WiUwHs33rUFOE8jB2ljxe+lgTaPw12//9xvyVZQ6jj9Kv2q
         al56DWh7XKVVg0JYNK4AHZqGJX3vxdmV8T2K6ylPNN41bW7HK+qwuYqx76cMymwVWsqQ
         i9wR/7ca+xkFKaJnLpPX5YkW6Zt6/b2DxytasCd8h7mNZvAuDVVs3q1E7nfEfvvr9Dc9
         4OdZUyGvNrIZGhhdnvv+C1KQyCjehKM1MFErqCqzVxKGvZo3IIqxECOvAQM6mRD0LWAo
         0XeVMpKvcCNw7d4HjjcJGqmLZ+2o2wnG2hcNdi2cZjcBLZAmJcgfZMqHKti2IeWNiPKW
         mVtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783515804; x=1784120604;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=VVFvYB1ZTF1YFVgXCjhA5ZAF2SkXYiQcnsQlb9i8bfU=;
        b=EzLvtGTCNw3MimApzX4/p5TOUxAQ7+SV+VMBzSiYEW5oQDQvNq8rVYH+ZZSnLSK1Qd
         mpPPZ79QHiWwzivDutdkxxD9yxWiRKurn8G/8wLHWvwmeFrANTP46+PvLjB1DO38akoU
         Ir5aQJ/ysxqmka+eUe8g4O+j9ZqmrYVX1Tlrmaw44wsSjOpHT+4xOifElQ6xyufRUl/j
         2hekjToeC1bPEwcp8S38d4V1j6CoomdM4xj3CtdJCWILHPsnuK1KWzf09yLc5lc5qUXn
         R1eICncIf2N9KlWcrmG2QhAEt63jkOIdAIzpbjOtZj6aCcVX94NddM8n6kZ91ySwc3NK
         sOvQ==
X-Forwarded-Encrypted: i=1; AHgh+RpZAW2inOEX6ym61GGRGnVypQoUFWudnrrJI0fCUvORMtb60pVtyaR56couo3B70i/rRTk9QMzanfU=@vger.kernel.org
X-Gm-Message-State: AOJu0YyTr+YsYL6Zqv0rEJ2PSmI5hEe3YNMFm26fG4PcrQqRGdK2uX5o
	3sJZW07jRcB9HjgrSpd8RUkbTInhvSTrSmFt67xRaCCQiBfvWeXGJilG
X-Gm-Gg: AfdE7cnTOkwSs37SYKGStWFFKhCRnB1a0TERINa2BNvIPRQsErc5MgN5lnnAZiCvSM5
	UPfnvqKH1f5goiaTvLMiHZSH4UIjuc0H0lbnSZK4xym9qb420B/pJr4+JwMS0RJ58WIP+HsZlna
	ifQsl01YkVGUDO4NwUHrvGQBu62Rfv0AA9UjYJdbRL3SzHe552MEtdkWQKM2SOkiQs6X9TbwLoi
	moBIPUNOv/13sVaYMjJgE67/iVcaIrGL29KE7GExNxlveAwK8HGhiE0eDEXXDAZgZKNmwPNNze8
	8wxFe8q6wUdJ+nFpEZ85cxSfh5EYXQvgYHjz60DUx1U9D9pPBgD1yJfjBuiErJBf1HbryHe/Smf
	4wxltP7wPXxjpeJj1LE63bbn0xLHIi1zX9wFBryZJ/YPTxeO0j6YstQZisFaDpsr3djoAmvrVut
	D/K+CVDPqosrsQcxO7GEll
X-Received: by 2002:a05:6a00:6f0f:b0:848:4d1a:9554 with SMTP id d2e1a72fcca58-8484d1a9805mr775638b3a.38.1783515804381;
        Wed, 08 Jul 2026 06:03:24 -0700 (PDT)
Received: from lgs.. ([101.76.249.46])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84847d4134fsm764286b3a.0.2026.07.08.06.03.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 06:03:23 -0700 (PDT)
From: Guangshuo Li <lgs201920130244@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Guangshuo Li <lgs201920130244@gmail.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Fan Wu <fanwu01@zju.edu.cn>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] usb: renesas_usbhs: free IRQ before probe failure cleanup
Date: Wed,  8 Jul 2026 21:03:15 +0800
Message-ID: <20260708130315.766999-1-lgs201920130244@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

usbhs_mod_probe() registers the interrupt handler with devm_request_irq().
If a later step in usbhs_probe() fails, the driver tears down the module,
FIFO and pipe state before returning from probe.

The devm-managed IRQ is only released after usbhs_probe() returns, so the
interrupt handler is still live while the manual probe failure cleanup is
running. If an interrupt arrives after the pipe state has been removed but
before devres releases the IRQ, the ISR can access freed resources.

Free and synchronize the IRQ before tearing down the resources used by
the interrupt handler, matching the ordering used by the remove path.

Fixes: f1407d5c6624 ("usb: renesas_usbhs: Add Renesas USBHS common code")
Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
---
 drivers/usb/renesas_usbhs/common.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/usb/renesas_usbhs/common.c b/drivers/usb/renesas_usbhs/common.c
index 8c93bde4b816..047f9f90c874 100644
--- a/drivers/usb/renesas_usbhs/common.c
+++ b/drivers/usb/renesas_usbhs/common.c
@@ -786,6 +786,7 @@ static int usbhs_probe(struct platform_device *pdev)
 probe_assert_rest:
 	reset_control_assert(priv->rsts);
 probe_fail_rst:
+	devm_free_irq(&pdev->dev, priv->irq, priv);
 	usbhs_mod_remove(priv);
 probe_end_fifo_exit:
 	usbhs_fifo_remove(priv);
-- 
2.43.0


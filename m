Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C769B377A8D
	for <linux-usb@vger.kernel.org>; Sun, 18 Oct 2026 03:17:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792293436; cv=none; b=D3aDhZP9lXKrH7VC4qURuoszzo34YRSKDGRwrnAQZ5P/joAiIIBoSUmfzk56EIR1CVeP9X1frLR7QHeJNwAe7gxsVONIWaJSnXo5h5NHyM8iKS7Slzm9Lk6oGSCc0UEPPx+iuqI/sHqRPP5HOWtlX5vm6X+NjZPpk0PIP/b52VY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792293436; c=relaxed/simple;
	bh=Dqx7bjnJ9ljoxyRAQVnpEUe+0UkIBf/9p0mvgs9N0O4=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=oFEWzxUYNhU6csT+5VZEgqS184xI8/Uo9nbX+nUTWg8Hm3ldquH4g2yAUdMNTrvh4fg6kwBW8/W5NQB/UYJj21JUAc5XeacZIQnrFu3svz7d3dn+wDG/NaZGQANb5+UPte3PzE72PPnBP+Vxqc2ztPVjiqEh/EnvC7O6ojAws9Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fQ6GSPMq; arc=none smtp.client-ip=209.85.222.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fQ6GSPMq"
Received: by mail-qk1-f174.google.com with SMTP id af79cd13be357-93f2b8cf037so73858785a.1
        for <linux-usb@vger.kernel.org>; Sat, 17 Oct 2026 20:17:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792293432; x=1792898232; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:content-type:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Gw9rUTlrYem7cQv596Vt7Cu3AvgaFkq7BPIa8azNfUM=;
        b=fQ6GSPMqDoX/tmCPchJRPG7ST6C5dNUmthZnTJ7WQJ0v/YNr8xdO40r9ujacGz4LK3
         V11V7U39s/QLeQ8P23Etr8fFJidCX3Oz4tNTiHtZvRVRAggXFkiv4DtGEJ4ar4VijU+p
         KV53XZqif3KiveG7Dziji1gMqLyfEVvNbV1Pknb2gJxo/vb8Mg+UB25fLXwmIjhntaaM
         s0u1QGK8D8Zc2z1hmsB6SNZPzTl8KY0ZVPT7fAq4vBS5vDqc9w0a7IfWQ8YlVOYB2EIr
         XVAbhaOKo8cybM9NAMOPYXGnk4habannJno2Fzf1dZs3HvKdnB516+bEsOH2a7laVCbq
         hWaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792293432; x=1792898232;
        h=content-transfer-encoding:mime-version:content-type:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Gw9rUTlrYem7cQv596Vt7Cu3AvgaFkq7BPIa8azNfUM=;
        b=mQJXx9OEX2LMt4jkwSKAxqR6newoMKH22EjqezHxqWZ8h5JAmFWu3d85gmvDuMYjdg
         UBMPWK3HygBYnT1fUjQ+BbWtwi0xuJ63CrQyuTJhXrEQDsWMcvneKU5hpasn6RiTxwRh
         ZOK4a1rYktOMecU6eEk96yFGk7t9Uzbpq2O9geyiAJl1cJf46xtd3I7RD4zbkvgZFBnT
         lvPR53fxjbHIIPvwYK9uFVbAyBSsJDoABlyg7gRpTn/kC6G+zlbHo6lIQs1ucRmfLBYX
         07b+0oKzTRpITwYou4LcOxhGMOlq6Vlg0oQyARRFyjP9McyQZJrGpGD7oAEJFzQ5K3JZ
         nPCw==
X-Gm-Message-State: AFq9FYLwFJMWbgrsKVAHfsWXvTofC0vHZyriPFbBrux6aptzO23bFoEW
	BhzdOuGAoeoGaNZWrJCASXSkkk9RB49bxzY+XuoyphBWY/YCf5EBOHKWtSpodI4=
X-Gm-Gg: AYBFou28KyQ6056RXSuq2hEM6JRfUJL/gGjhtNlDVo1IJAsG2wXSxH4gTty4gbO5Oj/
	X1YaKj68AxGVCAW9oDyVWrKut9BH6DojAzEEHvGd7QZlUv1Fh2s9GtAxiRs2wA7AjQPWc6q02T9
	FrPUU3kpRo+xefqvIjeYWnsgWHKjHjQhaNjpAhIHbf7n3O8sEUM08JZ98K1Ix/Pqi6HQehmyiKa
	A0LPIjMif7UfhM9Ve7OacllbFoLdEc1E3l9MzXHXFSxugCNtVxucLyAT4wMJPKH/6YI+lQacq6z
	OR+QTSZNPrzfHQu3cMZXZKymKYeSktDWQwu7YUUY2p1xTVXFGn5HtD11twp5dzDycb0YUlsT42L
	J3mX28k4NyUWDwDlYl9Y2jdaPDBCrpouJ4Tc8sg6UJLLb7RaaKspVr/nO6La65R5TLgw0FZ5gqS
	Iu56B0vA56pqwOREOtILTxROwDWbLI5paKuZDNoDmSIN3l2s7ezAl6RAgJ8RkjiyoyfyiXBmpV5
	20GCiPdMMwjHXy53gJlBPbniH1YSiv7ka5rRSj2U3oYVqMxEChfUsO1rGDlo00P/fK5FlaKMP+s
	MelmZ97DCwdC1T2DYymYo+B7ciMS
X-Received: by 2002:a05:620a:4109:b0:93f:35fc:5266 with SMTP id af79cd13be357-93f35fc586emr276156485a.44.1792293432462;
        Sat, 17 Oct 2026 20:17:12 -0700 (PDT)
Received: from i4-gl-tmk5904-1.ad.psu.edu ([130.203.156.90])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93f1a1688aesm602519385a.8.2026.10.17.20.17.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 20:17:11 -0700 (PDT)
From: Myeonghun Pak <mhun512@gmail.com>
To: Rui Miguel Silva <rui.silva@linaro.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ijae Kim <ae878000@gmail.com>
Subject: [PATCH] usb: isp1760: shut down the VBUS timer before unregistering the UDC
Date: Sat, 17 Oct 2026 23:17:09 -0400
Message-ID: <179229341115.3942822.5484449075463010207.isp1760@gmail.com>
X-Mailer: git-send-email 2.53.0
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The VBUS interrupt handler can arm vbus_timer until its IRQ is freed.
Although isp1760_udc_stop() deletes the timer synchronously, it does so
before disabling the controller. An interrupt in that window can rearm
the timer, leaving it pending after usb_del_gadget_udc() and free_irq().
The timer then accesses the devm-allocated controller state after
removal.

Shut down the timer before unregistering the gadget so that pending
callbacks are drained while the gadget is still registered and further
IRQ-driven rearming is ignored. Also shut it down on registration
failure after releasing the IRQ. Keep the temporary stop operation
unchanged so that a gadget driver can subsequently be bound again.

This issue was identified as part of our ongoing research while
reviewing kernel code.

Fixes: 0316ca6319b9 ("usb: isp1760: Add device controller support")
Co-developed-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Myeonghun Pak <mhun512@gmail.com>

---
Compile-tested with Clang, W=1. No hardware runtime testing.

Based on mainline 0fcb05b72344f40806cbe810de8872f1698bf053.

diff --git a/drivers/usb/isp1760/isp1760-udc.c b/drivers/usb/isp1760/isp1760-udc.c
index e45a54c..7b60bd9 100644
--- a/drivers/usb/isp1760/isp1760-udc.c
+++ b/drivers/usb/isp1760/isp1760-udc.c
@@ -1581,6 +1581,7 @@ int isp1760_udc_register(struct isp1760_device *isp, int irq,
 error:
 	if (udc->irq >= 0)
 		free_irq(udc->irq, udc);
+	timer_shutdown_sync(&udc->vbus_timer);
 	kfree(udc->irqname);
 
 	return ret;
@@ -1593,6 +1594,9 @@ void isp1760_udc_unregister(struct isp1760_device *isp)
 	if (!udc->isp)
 		return;
 
+	/* The IRQ handler can rearm the timer until free_irq() below. */
+	timer_shutdown_sync(&udc->vbus_timer);
+
 	usb_del_gadget_udc(&udc->gadget);
 
 	free_irq(udc->irq, udc);

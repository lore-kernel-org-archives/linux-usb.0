Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CF4B3D75C9
	for <linux-usb@vger.kernel.org>; Mon, 27 Jul 2026 19:49:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785181792; cv=none; b=aWLybh/WQwCyJBVXC5uHfwl+Bgr6Ff46Fl+Zze4rdCEWjPnmatLD4eNV7chiLPlpteuX9U4JXJIpmiUQ/ehQCXYL1QO+ZBJBvNKr8iEMo+KjaE4/iXHCX+uEDloLYDfqGob+oNfA2keJKUwM5WpeDPXZPnQra79WnIEYeF424Go=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785181792; c=relaxed/simple;
	bh=BRQMwae0Lj5J72anr9l1FJ5BVmWq41OUaDFBJx92swM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=RSCqYIJIm+X6RhDiV/RHdN5WXDbJ7a0HV6lOq7kiPWgIzeneYIS9QGvgF2CDvYKeUms/9dPzESMv05myytMLANnqxIkZj6RxcNmT/9urXD8qvJFhQeeo7xL1upHRnsVkbxNPxtMLQWExYpYDKa6rQxssFYDkueplYFppNLg/qbg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UoBfalOj; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UoBfalOj"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2cf52d15d88so31647575ad.2
        for <linux-usb@vger.kernel.org>; Mon, 27 Jul 2026 12:49:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785181790; x=1785786590; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=zRaEv6hGRWocOtrE7AchWcpxUOZ3D0iIjgKbMAmvVyk=;
        b=UoBfalOjvPtfqvys7h1LnoA5At9/4LJKq83tSO3gFgGnYnxUKCEHcnBDaxXOjLwryv
         Y2wjgypM+YIhPqkfDPq0gtV70SuoFgYxXpK1Xt0Taw5NAsPJmAoEpPQ34eKeMl1KD9aN
         DTdQclJGgxjM6JO4EAPlpA/PmHM/8hcJNBs3POLQQJaVQY8oW35TxWaZCuXZiBre/YRD
         sXt0a1z1kamj/ryO2gcUSdAKMZrqHQbpV802fJzS5/euvVAOsjS4Eh7IJnUUeNtF0Yww
         +f20dfY4DS04L0eGWSGXtDm9qYwLv6IwNOIjfxq5jlcDfQzT8R4JoxRZm/BZI0j2jVOo
         p5SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785181790; x=1785786590;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zRaEv6hGRWocOtrE7AchWcpxUOZ3D0iIjgKbMAmvVyk=;
        b=sEJZm3ejBjFm4cTLBC0lwT7kBCKD0b51TzJGJYeyb9pMrAHZQong3MkfqZkXzevAJd
         rn00nWczNKVwidao55EQdx6UN9q/GFX3HO7gbXmLKl835wZ1LmO+pM+1ZHbkMjFmqQ2u
         /RR14ZdU55KOAfdotfScCA8FPgIRZtK8oO0B1Mfsy0DXArKD1hbo9cNZ5EWjWK9fmYNR
         KSc1xEjAn6mPZ8AGmPB385r+Ybqaji8j29uNj2BtKB5XZm3j5BwoSdssg1r6zX5qrVjF
         5SkS6MxS0ddIrUmP/+B1ZFRWXAlLB0bf2b0dS2oFyPrSvVf0VBt2UKhO8m69CPmcqbVt
         kOLw==
X-Gm-Message-State: AOJu0YwX+aDIgxZlAiltrLWRdRPA39FR8vTzYzLL81Lo8CwC9MAJWVVo
	ChmN7FnnOIWpy3EFsAFpCmz9ES45cnlKMcs+rwPz404QBY23kgTWKJEXfEHxVcax
X-Gm-Gg: AR+sD11xt4MCJB463e6EPfXuLv+k/OEG1Y8VYJN5eT70xOh89630PCRpkobIj1Vf4dv
	WMmh2MkmCdVcCJW7G2MMNacEiJorILSCEirOXzYszW5rY2hpMsfD9j2f36dxOqkUiFaCi7ODs4b
	nahpQNw7/ACsNJg/cP5hBQwTBcq3h7xGq7iPgR9Ucum44lk6ky1L74wwT3cYu21CB1IlcZeVHPo
	wp3SxV1INLvDD52L3b6T1TMVrPBvlV/vfVuzJsaSKV0ceOtLQnpcAXENSx259RRY9KWpUxqxo0a
	uvq6FMTYumfANXMK+CxWxyiEBi3LwZUzVwwnIdCOblcxPHnAlVfMsC62kZUi6ip7KQ39BHD6MU8
	YHw5nGl1YjuLzGzBIMnDfJm6nsA0eChI2yU93dR7RNbPRvzfpbXBl7Kr5AEqhjkMdKxF2aBmvV9
	rTFJuFEonQvPqonSwsYK3/HiaXl8fsXDP/UP7aZbI6Ik4uBCuMEj7nwz48ITbEPPv9As/HMabAx
	4z/HMuXYrSNjsa+PrIATLsXHfVYL6DnbB1VmbpN0qU9UmVoXK6LLmOY3I7gL9VsDA==
X-Received: by 2002:a17:903:230d:b0:2c0:e2ea:6b0c with SMTP id d9443c01a7336-2cfde7afdb0mr96154625ad.21.1785181790406;
        Mon, 27 Jul 2026 12:49:50 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e34])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cfde7eea52sm41116395ad.61.2026.07.27.12.49.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 12:49:49 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-usb@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] usb: fhci-hcd: use platform_get_irq and simplify error paths
Date: Mon, 27 Jul 2026 12:49:48 -0700
Message-ID: <20260727194948.11986-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace irq_of_parse_and_map() with platform_get_irq() to obtain the
USB host interrupt, and move the IRQ lookup earlier in the probe
function before any resources are allocated.

Simplify the error handling by removing the now-unnecessary
irq_dispose_mapping() call and collapsing several error labels
(err_add_hcd, err_clocks, err_get_timer) into fewer targets since
the resource ordering has been streamlined.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/usb/host/fhci-hcd.c | 27 ++++++++++-----------------
 1 file changed, 10 insertions(+), 17 deletions(-)

diff --git a/drivers/usb/host/fhci-hcd.c b/drivers/usb/host/fhci-hcd.c
index 71e785f445a3..f3c7dae5b5b0 100644
--- a/drivers/usb/host/fhci-hcd.c
+++ b/drivers/usb/host/fhci-hcd.c
@@ -568,6 +568,11 @@ static int of_fhci_probe(struct platform_device *ofdev)
 	if (usb_disabled())
 		return -ENODEV;
 
+	/* USB Host interrupt. */
+	usb_irq = platform_get_irq(ofdev, 0);
+	if (usb_irq < 0)
+		return usb_irq;
+
 	sprop = of_get_property(node, "mode", NULL);
 	if (sprop && strcmp(sprop, "host"))
 		return -ENODEV;
@@ -656,7 +661,7 @@ static int of_fhci_probe(struct platform_device *ofdev)
 	if (IS_ERR(fhci->timer)) {
 		ret = PTR_ERR(fhci->timer);
 		dev_err(dev, "failed to request qe timer: %i", ret);
-		goto err_get_timer;
+		goto err_pins;
 	}
 
 	ret = request_irq(fhci->timer->irq, fhci_frame_limit_timer_irq,
@@ -666,14 +671,6 @@ static int of_fhci_probe(struct platform_device *ofdev)
 		goto err_timer_irq;
 	}
 
-	/* USB Host interrupt. */
-	usb_irq = irq_of_parse_and_map(node, 0);
-	if (!usb_irq) {
-		dev_err(dev, "could not get usb irq\n");
-		ret = -EINVAL;
-		goto err_usb_irq;
-	}
-
 	/* Clocks. */
 	sprop = of_get_property(node, "fsl,fullspeed-clock", NULL);
 	if (sprop) {
@@ -681,7 +678,7 @@ static int of_fhci_probe(struct platform_device *ofdev)
 		if (fhci->fullspeed_clk == QE_CLK_DUMMY) {
 			dev_err(dev, "wrong fullspeed-clock\n");
 			ret = -EINVAL;
-			goto err_clocks;
+			goto err_usb_irq;
 		}
 	}
 
@@ -691,7 +688,7 @@ static int of_fhci_probe(struct platform_device *ofdev)
 		if (fhci->lowspeed_clk == QE_CLK_DUMMY) {
 			dev_err(dev, "wrong lowspeed-clock\n");
 			ret = -EINVAL;
-			goto err_clocks;
+			goto err_usb_irq;
 		}
 	}
 
@@ -699,7 +696,7 @@ static int of_fhci_probe(struct platform_device *ofdev)
 			fhci->lowspeed_clk == QE_CLK_NONE) {
 		dev_err(dev, "no clocks specified\n");
 		ret = -EINVAL;
-		goto err_clocks;
+		goto err_usb_irq;
 	}
 
 	dev_info(dev, "at 0x%p, irq %d\n", hcd->regs, usb_irq);
@@ -721,7 +718,7 @@ static int of_fhci_probe(struct platform_device *ofdev)
 
 	ret = usb_add_hcd(hcd, usb_irq, 0);
 	if (ret < 0)
-		goto err_add_hcd;
+		goto err_usb_irq;
 
 	device_wakeup_enable(hcd->self.controller);
 
@@ -729,14 +726,10 @@ static int of_fhci_probe(struct platform_device *ofdev)
 
 	return 0;
 
-err_add_hcd:
-err_clocks:
-	irq_dispose_mapping(usb_irq);
 err_usb_irq:
 	free_irq(fhci->timer->irq, hcd);
 err_timer_irq:
 	gtm_put_timer16(fhci->timer);
-err_get_timer:
 err_pins:
 	while (--j >= 0)
 		qe_pin_free(fhci->pins[j]);
-- 
2.55.0


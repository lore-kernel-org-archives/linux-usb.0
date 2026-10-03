Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4B6C313277
	for <linux-usb@vger.kernel.org>; Sat,  3 Oct 2026 03:49:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790999354; cv=none; b=Gv9M5OlIkmCWkgBpMdwzVnWGrCbj1GB4LzGvsYpvh+NQwvvjG2IPEFWAfyO/PovWtE9318+u8meZ6Pi6PViNdZCqBGon9dP4uiWcaCABNLuCCD2z3LQPO9E9t8gMYJmjZl7DXd+GDNC9swoFyzFPWdVJtDCYrftA5bvFZy0BTnM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790999354; c=relaxed/simple;
	bh=RiFd/x4ob4XGPmjfMU8mx5CYpJ1plwMS3Baxsk/pST0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=j91tsiTt3819Us3J/ZyKksp5asy+LIZO6nbPE38UdwCwG8QrqwNpUnJqGg5/vQPfDkXBUMXv8QLan6Iok/vcrZgpANcDnEEM/drbStekenfuoJrrUctxFoHvqCvibc2Uy3+Gf5uOx89yrbaDZsS9GKfe/sqKQNOF/4vP37SfsVU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nMalJ4SS; arc=none smtp.client-ip=209.85.160.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nMalJ4SS"
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-5338c1197easo1156211cf.0
        for <linux-usb@vger.kernel.org>; Fri, 02 Oct 2026 20:49:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790999351; x=1791604151; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=zBUh/Tqq/D2AVY5T0bHA/kdjx2FRaXb1oddCR7mF7Q8=;
        b=nMalJ4SSStLa1aDatdDLaWTFuE8wIoBwYKEcYLStAh/t5ptzKJdaOa/3svkbBdIklS
         c5u3Q0kqVSa0hpakYiXKBtAnBGSnvAl0AfnzN1lHONKcRTRp6G8TI0WCHMZJFkZSOSmL
         EaDTzER5iGjirBzni0WzV5piHykpN1aqWaW5rIrxWk2esSQxkP1mUkjk3OccM9dA8uEn
         nD1qFOMP4A7COSeIleSH9fvw7QyjYi05Fll5xb+yrtyXAv/TcOJzYbJJ8Uuyslr/AeOs
         PVOADm1kP7/zfjEO6DXTIZy3yLDoVWRd5nb1zbKILKdM8OgMpIzp8HYgNkLLB32A0LO9
         CH4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790999351; x=1791604151;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zBUh/Tqq/D2AVY5T0bHA/kdjx2FRaXb1oddCR7mF7Q8=;
        b=IzcImLh7h+gOMJPnGbgbXNd6Ao0B7LJ2PVUpaOUB2oi2NoIhznQHpQZKnsGINqy5ST
         bRGzqjSqNXfbRQyvFE1AjT1/KRGe1pZsskhVPRgXnoxOcS/YSYMx6bOyuiPsrhkqve4L
         gCJwxnCStAtucvJCbkEPdLfJMkNp0K1MICnuZooOUu9zhrbRleGKJrdhiFH44k7H55kC
         Y0eUj/TJpzOzozTGFcMdA+whTiJJvvljeO9Z6Poc1Y8c2mxji00wZwCGEem63Skv/44F
         btcLwxh8ca8/c82HcacC47OG6Mr7eSTdScZppV4qfAfZNB8aIzPFI/qOjDr7ddTWZvjN
         psEw==
X-Gm-Message-State: AFuF++nTegsGcjpo7xA5LahGWswihi+JEDtfP0OMx2L37sMLlCZK3Sue
	RVcNYMytYB+l5tV5vywMzLp8pan2M4X9Dr1ZKu1sKGHcRhAJScNampI=
X-Gm-Gg: AYBFou3rdiL9y2gY7e7ruMa48p1GPz5DUvdK2k8a5dQBHVhz36No/zmu80voYF41Bfq
	DFJ9J4RihPAvhPAZGQAyuKq5eMRQOQntwfrKP5SDLm8yp84rpyViX/FkafwRSsF51xqxOP6KcOu
	wtmxOLXENrIZX9o0jTg+VkuQTM3feJqoqblwzhWsjvEAHy5ySo2Kzneyt0OwMr6XnZhCAStmEca
	A8jAnm7CCSWL+GKFLiCoSliWkXC/6LHuTbPQAU0M5VjlRx9OefX7m7Vfh8zFD7pcoKZd9F2ut85
	/rXpO5tG0JBHXFTBOtf+s61fSC4BieAZ4QyvSC1Sy5ZDI/O/gOVua+ioqcTzTZM4FsYqJsmfMFI
	ILCX7kWDY5XUAHX7yKspl6dHHg+vX3l1HxT2ZceN/CctIXBDuBXY7BOoIg4IF2Tk4LxyRj0RqZV
	jBuRswQaXE/YMDAopF+Sqyvxb8cwd08jPngtp2F0NA9jtlkgViRc+Hqk8XcHhaDO6tmvR0YavM4
	zxVtakrbROsyf6xy4h/tEgAxtwq6DH88jvoVCp9hFwH7ecx9NdA15fHme9YfQLNo3yDDFOijX4X
	+E6Zi03hMgFd1sotpaCjYGerac0MVQ==
X-Received: by 2002:a05:622a:1481:b0:533:42e0:a1ee with SMTP id d75a77b69052e-53511e79842mr24892281cf.37.1790999350628;
        Fri, 02 Oct 2026 20:49:10 -0700 (PDT)
Received: from i4-gl-tmk5904-1.ad.psu.edu ([130.203.156.90])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5339883034csm43209541cf.3.2026.10.02.20.49.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 20:49:09 -0700 (PDT)
From: Myeonghun Pak <mhun512@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Ijae Kim <ae878000@gmail.com>
Subject: [PATCH] usb: gadget: m66592-udc: Free the IRQ before unmapping registers
Date: Fri,  2 Oct 2026 23:49:08 -0400
Message-ID: <20261003034908.619696-1-mhun512@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

m66592_remove() unmaps the controller registers before removing its shared
IRQ handler. Another device on the same IRQ can invoke m66592_irq() in
that interval, and the handler reads and writes registers even when the
controller has no enabled interrupt pending. CONFIG_DEBUG_SHIRQ can also
invoke the handler from free_irq() after the mapping has gone away.

Shut down the sampling timer and mask the controller interrupt sources
before unregistering the gadget. The timer can enable interrupts and
invoke the gadget driver's disconnect callback, while gadget teardown
clears the driver pointer and disables the controller's internal clocks.
Then free the IRQ before unmapping the registers so the handler finishes
while its MMIO mapping and private data are still valid.

This issue was identified during our ongoing static-analysis research
while reviewing kernel code.

Fixes: 4cf2503c6801 ("USB: m66592-udc: peripheral controller driver for M66592")
Cc: stable@vger.kernel.org
Assisted-by: LLM
Co-developed-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
---
 drivers/usb/gadget/udc/m66592-udc.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/gadget/udc/m66592-udc.c b/drivers/usb/gadget/udc/m66592-udc.c
index d77c11c4eb38..773cd00fbf1d 100644
--- a/drivers/usb/gadget/udc/m66592-udc.c
+++ b/drivers/usb/gadget/udc/m66592-udc.c
@@ -1515,12 +1515,16 @@ static const struct usb_gadget_ops m66592_gadget_ops = {
 static void m66592_remove(struct platform_device *pdev)
 {
 	struct m66592		*m66592 = platform_get_drvdata(pdev);
-
-	usb_del_gadget_udc(&m66592->gadget);
+	unsigned long flags;
 
 	timer_shutdown_sync(&m66592->timer);
-	iounmap(m66592->reg);
+	spin_lock_irqsave(&m66592->lock, flags);
+	m66592_write(m66592, 0, M66592_INTENB0);
+	spin_unlock_irqrestore(&m66592->lock, flags);
+
+	usb_del_gadget_udc(&m66592->gadget);
 	free_irq(platform_get_irq(pdev, 0), m66592);
+	iounmap(m66592->reg);
 	m66592_free_request(&m66592->ep[0].ep, m66592->ep0_req);
 	if (m66592->pdata->on_chip) {
 		clk_disable(m66592->clk);
-- 
2.53.0


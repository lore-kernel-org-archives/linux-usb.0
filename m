Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794551665;
	b=U2I/2Qg4rEYf3EuPeeS+L3w3DQ92iq1WarBZg2gCDwKLDgio3vpVZuSctsesmsX/Tks8
	 r6A4rEqdxlrJsFPweNfgSDfuEVwA0Rf2zp7my0gIGSynx5sKcsYnA5TwztwCUKHLrnDkk
	 0nmXLOAp1Uuul1iU1x55wpPW7Yt7hzffUJ0i63g5MEWq7ylYiDYpmrT6YN8Em72kobVPb
	 Hh41my+//tjs35GGwul4VI7VVdxZtUOBeC/EwuQhtRgbSQCIKiUinsABCEZfj83VTTeXX
	 m2VDGDq6Ec+17x/BSF2nhgSmJoib9v2sNnpf6BXIsGzVfHV/7udud8PPoBI3ioNLTmQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794551665;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=HdXa32DySaS9SpkXLA+JWGuqMHC26ZuT90ihSRHVW/c=;
	b=cDupiRHSjTyU+KWSBY3mzzYCnopsVgy6h2iw3LwAgXcMvTxyCtaj8RXO37gsw7STRFL4
	 jkHLqWtpNZo40PaS4Z/0UnsfX1Qz9KAGrKiY/2kqdHeMJ00svEOchyxZRkkSYp7IqR8qx
	 z9doUuDHtJd39YipBcFkZ2rsoaNV9eSOIGIhqXju9nyIQfBAzcUidex63y0cLJ68J4eh9
	 9pnhPFjxzcEh/7HNcbadjtl2l2exXFlRoTCT+ID9D3D3HDdgECgv6E9q5QKi1DhLjDSAN
	 1c5dmqGgXLhb0EIVut8um/aGyOANvx6IRJer8OQoWzNTxhZBYkX7DywZeV4Pmnhqe+g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CqIg10sB;
	arc=none smtp.remote-ip=74.125.82.178
Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B6B8606A321
	for <linux-usb@vger.kernel.org>; Fri, 13 Nov 2026 06:34:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9B6B8606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CqIg10sB
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-378915168c7so88090eec.3
        for <linux-usb@vger.kernel.org>; Thu, 12 Nov 2026 22:34:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794551664; x=1795156464; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=HdXa32DySaS9SpkXLA+JWGuqMHC26ZuT90ihSRHVW/c=;
        b=CqIg10sBV5rifT+goFLPth1rSZeuLsRydGKO/n0uzRiCabsEmUxwu6H4zF3lqSxGuL
         vD7eHDVWa54Gfen6aNvbKUxx9NT1tIVFH0WkNyXTrYtctzsak+P1lvQyan62fWTqT4dv
         qZm1NFg2scCG6DMSWD//QC8dAJEwbdHB7zRlNSc0nGpXWe699WTHJIG/rzrKFDL/ER3L
         pLMjWMtRMCkay9Z51TLG4hmyyrm/M/yl6DhOiFbe45C9vM1ws0iHj+4W5c+FccmlXauE
         e07HhyIF/3NuB54thQc6nyifFw5n2XShdtr6jXTxyupIMHr8OCNc5sKUd+es9W3wtKzu
         Umuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794551664; x=1795156464;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HdXa32DySaS9SpkXLA+JWGuqMHC26ZuT90ihSRHVW/c=;
        b=idPR+KUM9QeJBPxMDG5qy30OpvFoJALFFSWlym0JVOWaK6VCFOA9umT3511lMA/f0l
         Zl20BOwpB3AndMwwyFna3WBpq+EyXXYeLI2NNqEhhymOa2ruxPxBo8FWGX8qtZmYUTVE
         Ld+XVFJHufr9teZavquOAOR2JkC7QJpug+mthMC4pbXJGPZBOs67uu445r7ImUP82J1Q
         9D0MXEQ0fNLbVkZI99d6VeMht38rpinMjN9tHd9mli/jehNq6cpHqNi7lrrwoD2uzxeE
         dmMjl6MM9OXEOfHzxv4SalMqSlBMSyvMIfJHsLEw7RVUp1Xg2SDtoYKbhShKIQBNKehK
         EJOw==
X-Gm-Message-State: APuU4Z8UKrOcjCh9/Ytrkcg5xGkHHUuh4gWl3wS0m10iSMwMsjX5NxjO
	/oO/096Y1lV1Ppbo7eM4HwihnKJnnuW74DJ8LZFz63c/50i2wHS5wR1HINEavCjICN8=
X-Gm-Gg: AYBFou3kZqL3Nh6h/8EKrKCg5N4+92Xfwo0b/m/HXeUH58ja3+lc81i6ryWSXPWIyVS
	XARZt4Pwwz8gqvSBmeIeKB2IxoyQUibTILPO/70uDrlaOnMpktc2dXh1YdjjP8yEkekFfFpzTjg
	aorJazOY0O3O7eDKIYHCOp3yNDlMl/xm8gO3vuRrBxS6Agj5AaFGrIvlKYTC+wGm1lHKD+rXyWG
	Ya/Xf9slywkX4fkavHU2NqLFl457Bk8crUcy/qFQFNEeDW18RKlTP5FK+s8hBDiuxxcXlc8XSdz
	dTTZMw8zBM1FtI26EbWM0KGt+Kl+apn8MLS6Dvdz0HqjzNd7JNliMugxJpR+O2wc2isOfJjC9de
	mfPGTHc8oh/89YtQmEjl4cz+VaLBsgXQH677q8vvPqbKjMqySuh2mWs+P5TPeHJKx2xBWm33o1P
	n6E9ixY26De26nXzP3WAj3MkGAYiQQ2sczAT5Z1vB4bNgdUW0n8xmPCs0MQg6jlpi1E/MliTbYt
	YeFrKouO/6nxNok9+NhcdeDHDxdgORFRz57TWlQ/KcHYZwUfO58fDp7oCwE63lD0voKsPVVU4sp
	ayFsL2LN613k+adp/e/o/Y+5IbWKmp8v75jRS35ieQ==
X-Received: by 2002:a05:7300:6da8:b0:36a:e7a:e89 with SMTP id 5a478bee46e88-379659c6815mr2758249eec.2.1794551663564;
        Thu, 12 Nov 2026 22:34:23 -0800 (PST)
Received: from CRASHEDROM.localdomain ([142.249.36.161])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379569b8389sm6745027eec.25.2026.11.12.22.34.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 22:34:23 -0800 (PST)
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
	Chengyu Liu <lui2012qwq@gmail.com>
Subject: [PATCH v2 0/4] usb: stop timers/works left armed on teardown
Date: Fri, 13 Nov 2026 14:34:05 +0800
Message-Id: <20261113063409.47485-1-lui2012qwq@gmail.com>
X-Mailer: git-send-email 2.25.1
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

The teardown paths in these four drivers do not quiesce every producer
of asynchronous work before draining it: an interrupt handler may still
queue or re-arm a timer or work item after the cancellation, while the
corresponding object is being torn down.  In three of them the IRQ is
devm-managed and freed only at detach, after remove() returns; in musb
the plain free_irq() happens later in the same remove path.  Either way
a late interrupt re-arms the callback, which then runs on freed memory:

  [1/4] musb core: musb_stage0_irq() can schedule irq_work (and
        finish_resume_work on remote wakeup) from interrupt context,
        irq_work can also re-arm itself from the session recheck path,
        and musb_hub_control() can arm finish_resume_work and
        deassert_reset_work until the root hub is torn down;
        musb_remove() cancelled all three too early.
  [2/4] musb dsps glue: the devm VBUS interrupt outlives the child
        teardown that deletes musb->dev_timer; its handler re-arms
        the timer via dsps_mod_timer().
  [3/4] r8a66597: r8a66597_remove() deletes the timer while the devm
        IRQ can still re-arm it from the VBINT path.
  [4/4] gpio-vbus: gpio_vbus_remove() cancels the work while the devm
        GPIO interrupt can still re-arm it (100 ms debounce delay).

Two further instances of this defect class found in the same sweep -
pch_udc and lpc32xx_udc - are being handled in Hyunjung Ko's
"usb: gadget: pch_udc: drain vbus GPIO works before freeing the
device" and "usb: gadget: lpc32xx_udc: drain the pullup work on
removal" threads, so they are not part of this series.

Testing:
  [1-3/4] build-tested on x86_64 (COMPILE_TEST where needed); they
        require hardware we do not have, so no runtime reproducer.
  [4/4] additionally confirmed with a KASAN reproducer: the driver
        probed on a gpio-sim chip in QEMU, slab-use-after-free write
        in __run_timer_base() after unregister (5/5 runs), clean with
        the fix (0/5).  The KASAN report and the reproducer kit follow
        in this thread.

All found by static analysis.  Fixes written with AI assistance.

Changelog:
v2:
- [1/4] also move the finish_resume_work and deassert_reset_work
        cancels behind the interrupt quiesce, per Neill Kapron's
        review; finish_resume_work is armed from interrupt context as
        well (musb_handle_intr_resume()), and both it and
        deassert_reset_work can additionally be re-armed via
        musb_hub_control() until musb_host_cleanup() tears the host
        down.  Suggested-by added; Fixes tag corrected to
        commit f730f205cc51 ("usb: musb: Split PM runtime between wrapper IP and musb core")
- [2-4/4] unchanged; collected Neill Kapron's Reviewed-by.
v1: https://lore.kernel.org/linux-usb/20261112160448.41566-1-lui2012qwq@gmail.com/

Chengyu Liu (4):
  usb: musb: cancel the delayed works after quiescing the interrupt
  usb: musb: dsps: free the VBUS interrupt before the child teardown
  usb: gadget: r8a66597: free the IRQ before deleting the timer
  usb: phy: gpio-vbus: free the interrupt before cancelling the work

 drivers/usb/gadget/udc/r8a66597-udc.c  |  8 ++++++++
 drivers/usb/gadget/udc/r8a66597-udc.h  |  1 +
 drivers/usb/musb/musb_core.c           | 15 ++++++++++++---
 drivers/usb/musb/musb_dsps.c           | 11 +++++++++++
 drivers/usb/phy/phy-gpio-vbus-usb.c    |  8 ++++++++
 5 files changed, 40 insertions(+), 3 deletions(-)


Signed-off-by: Chengyu Liu <lui2012qwq@gmail.com>
-- 
2.25.1

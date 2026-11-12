Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794499500;
	b=b1EW3N0tBjLNkINGC+Rp+RINsIbPK3sDUFbIGnnsxpQiSv+aTakP4LWm/XaHL2ov+F2Q
	 OWwV2zsX7bNhzbwRXX6J2IaFIb/I7dVTtmHbuubSivgk6B3YShJoakh24sNih7/Nd8nUe
	 4XK7egGVrbCLbiu1rO6QodqylB2EHj1r+zfLhjtnLLKQqBBpUzATJ16091YCGqmEsqn9t
	 v5NaVlUAiEitLvpDeARI+G4LpoqtHp5xVxmyVgOa3Rx4vXT3CWkjpchUoWwu1fOtAstcq
	 nbkuPaKLJkcd0NqA/D9olW3hEskPwYbg5bQGVfPLmAuEbS4o2p06op5mHd3jxpdXrmw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794499500;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=wKqAQnSZo4d/f9DGtiUOaklFgDl2eC6vfZB7cQf92HE=;
	b=I3XQm3VDUPMKCrTzRC/Bwzd7oVZwkjq7GoCLEgghYhAWKb4DEgpDzFY8kIrEZnIgd3f/
	 UrQ7TVlMJbD+B0p9fc+GfwOZaYuceJeaecREAEN3JTkcCGO0j3KRBeApPFXbrJwI1FlXZ
	 ypKWAcD578lFp8s4oqaX00VpGgNgsXBLTqL0/x3D5UVY9wpzcUL7vtQ9Ivuok2deqKpr7
	 v6+whRd62T0gB3bY9fifRvauf1ThxBm7oea/cTV9x6LjXC9xNoVguG4zQArN7H/dd8/Zk
	 dnqotLoShb+UARTSn3RpBzLLxgl8VdkbkrdESOcKE1d18MpGiokwTjfIN4nYIZ9+iuQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gjiEIydu;
	arc=none smtp.remote-ip=74.125.82.178
Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DF22606A331
	for <linux-usb@vger.kernel.org>; Thu, 12 Nov 2026 16:04:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9DF22606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gjiEIydu
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-372cba0ecf9so972eec.2
        for <linux-usb@vger.kernel.org>; Thu, 12 Nov 2026 08:04:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794499499; x=1795104299; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=wKqAQnSZo4d/f9DGtiUOaklFgDl2eC6vfZB7cQf92HE=;
        b=gjiEIyduk3mRfnkV7hoRdr667Lg3q7D+XVDIgZgNZo2MIeYIyUaKuN9Oz4ILWxy3/U
         toyMWuExwCgPWufnL/BX/v7zTfuMMbwwOGomUULkNbck+p1ORs6lXes8VyOnuNUjvAgx
         r4Y8uZMzNODQS9KfxSVtRMuoZ9jm1lu7rSg+o5uYjfbYToxRp8cXjCFTDBeFl9rMNn+0
         aS4HMFDN2bo0RBvBIefmooPEwhz/UL6HWbmIURNXpB9iu5Ypb2tF2HYkc6NBuo0JP0hp
         AyRkKgMKb3Ef+MGLuR/+FZfEC7LO53DeBt3cCQKwdUPTWEw5DHBhEcDU7vDoYy3EQoz7
         +ilg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794499499; x=1795104299;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wKqAQnSZo4d/f9DGtiUOaklFgDl2eC6vfZB7cQf92HE=;
        b=W9nxIWQd+y1KduP+4YBlixTbg+ztgAhCnk2lmhQkLSU5F4EqG2RfgTUX6sqpi6/DC4
         Ou2uFrRJcTB2hqp88jUfWO61N7Mpzy7cqzPaMgbk/OlTi73q12t1qZKJrfrZV/y1SO9Z
         awBiChBkfwnH9QDS9+7sf613US77KKgmKpaKUAl3b0HwldukT5OPzCLUqm0RveasgNUL
         8jdAyJczm1bC2vJKrJGp6iLhOajAkI1K0/Iit2COWw8HrBChGCuUhNNLUFWAw8ZtznFn
         vjzAGuXH4AuXKmZja0YyMKihGNqgT5aYDj9XHvGWktTkW7jYai1G4yqo+SCGKqO+toVk
         Dxlg==
X-Gm-Message-State: APuU4Z9ReEuzU+FOpIYU/qJiS8x7w+M3tWxVTQPRzcoWCSQQAzBmLF1i
	dS9BM8G3oXUIUAKckBAzrdic0CV/ehdo9CBMgay66OQ8iI61mDaAgzNv1VFtGRAlghE=
X-Gm-Gg: AYBFou2bMSQmAq77Tdib4tEoCjntLv/Gg1x/UlE7rBGLHYqAqW7BGNop+XYmvbED9Pp
	LR+2gUQfrGJpd7Dj/Bp3qjqBcb+YhrhfQCk0T3tVO9PNM0LCgNz0+Iy+QWfVGyj1jNcZfurg3Yu
	iJJNOSrqerUYiwk8i1BJNrXnCd66JL5qPMGGUD5ZhQwe7AotieEjclB9J9qm5TYo1x6z4YMWadX
	XxoSOX+ov3IXIKjSfP0YlA0D4kNeIgFHE3cKmO8wXROKHxjO5jR13Q9JXhvN4sBjHxRL4i0gIN7
	itZ+q/yrom1xk6FcXP27jGp34Ezmkz23y9BmMhzcVxv9RSE43glWno8xfy0IPoDekqevFJOo1Rg
	kO4u8+1ecq/jLYcTGuC/UubwIb+NyTFscbyVsxQoEwegbWqUnmpGW1GbfZko/3Kv9Vvl/lemSei
	m2CXo2M/nmDQp2StqmYgACb8320YUpvgJMU/hF9zAZAZ7D2IPsaIVI+Q8cGh4ibyPfi7v3kqouX
	P2SBMu6/39DMfUzLov9JrTTokbK9rr6yMhsFL/qeYk24Gl63nGzWtMnZ46AFUHTmWgknOo8p3PZ
	cLY8JR57le6pN0p+x6AwujdMUlCaORDF7udwDhRCbA==
X-Received: by 2002:a05:701b:4508:20b0:147:d430:7322 with SMTP id a92af1059eb24-1b5030d2df3mr39762c88.1.1794499498442;
        Thu, 12 Nov 2026 08:04:58 -0800 (PST)
Received: from CRASHEDROM.localdomain ([142.249.36.161])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37922d49049sm613673eec.1.2026.11.12.08.04.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 08:04:57 -0800 (PST)
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
Subject: [PATCH 0/4] usb: stop timers/works left armed on teardown
Date: Fri, 13 Nov 2026 00:04:44 +0800
Message-Id: <20261112160448.41566-1-lui2012qwq@gmail.com>
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

  [1/4] musb core: musb_stage0_irq() can schedule irq_work while
        handling stage-0 USB interrupts, and the work can also re-arm
        itself from the session recheck path; musb_remove() cancels it
        before masking the interrupts and before free_irq().
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

Chengyu Liu (4):
  usb: musb: cancel irq_work after masking interrupts in musb_remove()
  usb: musb: dsps: free the VBUS interrupt before the child teardown
  usb: gadget: r8a66597: free the IRQ before deleting the timer
  usb: phy: gpio-vbus: free the interrupt before cancelling the work

 drivers/usb/gadget/udc/r8a66597-udc.c  |  8 ++++++++
 drivers/usb/gadget/udc/r8a66597-udc.h  |  1 +
 drivers/usb/musb/musb_core.c           | 10 +++++++++-
 drivers/usb/musb/musb_dsps.c           | 11 +++++++++++
 drivers/usb/phy/phy-gpio-vbus-usb.c    |  8 ++++++++
 5 files changed, 37 insertions(+), 1 deletion(-)


Signed-off-by: Chengyu Liu <lui2012qwq@gmail.com>
-- 
2.25.1

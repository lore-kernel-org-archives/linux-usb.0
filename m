Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F1C73C10B5
	for <linux-usb@vger.kernel.org>; Thu, 18 Jun 2026 10:41:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781779293; cv=none; b=S/qpbPGcqu5XmXEQ6l4tB/KFAX/U10BDFQtvobofLBrInHcW7Gvqwulw2EZs0G6Sls7hOddymwYpE+pnQWAZYPCjYUixYTCZdqRnOp+GZNFCwkgOaYd70BEyDF3aDAFiKSpapdDNs6j0mDbYUeRyB0AKxbsNa5nawg6SdLXfQhE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781779293; c=relaxed/simple;
	bh=wwu124Z93/eo/2JlNn7WiA7dXFxEBfkU8xWVt2ZEsuY=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=BbRoggyIpefTKqb4Yqfe29lveSeh69Mki7hgbJZhzXThpvpy5V6uwyti+rJLq0LWEBAf8TtCPHdSRvWXCi3OGe9Ivkh1ItwBV3+YNKUYBQLI2bOc8B3IIRGOQ8x1mDA62KjJJaIJeOHWcmL3422LeZE/rV3AutgxgJM92kEAVT4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=tLNV3rKZ; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="tLNV3rKZ"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-36dd65b95f2so486238a91.0
        for <linux-usb@vger.kernel.org>; Thu, 18 Jun 2026 03:41:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781779292; x=1782384092; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QkzjRb13gcgFF7cEHBuTSZtrK83ODBAFURJBQLRisLk=;
        b=tLNV3rKZLNt5BPlhspatn8rbj6Xl78c2v5XtHMUYB53uNcsfFEOmviL1zRZ/ue7I7E
         M6alDCuvo/qjm8KbpgwOt0CKQ+Gew6rlv51jUJr7935XGEG5V1bV1UIQrCeRZ79Xa4b1
         50VF7KRuhdVnnlGCpck/m51U+cc7bjJzhRztdQVbMzsn9TenaQk0TSf6Z8I+pgHfaAop
         ZbUzrG/pQ0a6SlQWT04X44wDPajQA/j3wLDRcvVAevXZIx/1GpxoeXn5FXcvNzktH4H0
         T/K3gNDeyLUODBe1K8OIObWKV8EU53cbwsQ5hmzOaBr9wRtisaQGffsHheZoZURSndFg
         PZqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781779292; x=1782384092;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QkzjRb13gcgFF7cEHBuTSZtrK83ODBAFURJBQLRisLk=;
        b=rPPvQSTW1yBWU8lwVVS7fmc9ck2AgeG1YTJuCbxepVZ+N2LxpMyMzkCpoU9ThGb75v
         VZBjWpxa6gEn45y1b/0mqtAf1TqjMJ5DqnFrrZ7RCTa2k7BQGrJxRUAAM1dKxC9NlMzP
         gnzivPzcF4lOsHsjuHdPPnE/XyX8uC+glS3lnhpQDyOT00HXoPG1KNFcmoierthtGyih
         Ni9lCHMXoiYZvsUioVpTLLVi3qSwl/wuMCEMaFUKsN0alyrK+dI1cNgsHBW9lcmWm0tF
         uAswkKJWwSmzH/TsNHqSLf1Vln41XC9JEOT6ISc+HCWLJbe9jf5mXxwOVeniXh9v9m3/
         yA9w==
X-Gm-Message-State: AOJu0YxwS+hyFVEoeN8CHaoQgb8UCWO6PAjJ0ZOxn/PwkiDh21CYAwJW
	SlU5jDWpuKPzUBKL6LOTNsUobkMxXx2zkwgESKAxPZrDTR16YpmLI1gn
X-Gm-Gg: AfdE7cl26J4QnChMNmrdcOqZxsA55NuzT89fbKhvA7gjmDzoexlBU7l6BHYJJ2Z18bI
	pZoDriYPKm4DDZL9c+1O4nnrAPOOqrZu7kpfWJq1fPi/oJWFYnoWc/v7TR5xC5UndUPmB81tqaj
	RbDS8YOn3jaCnPKqvV8ZuE6nyjErARpezQw65YDehGmbGtYy2wyeiwFyvHvX0KEQOE4Afh7RTGr
	+tK0f+rAy9iMim9rRU0fpaP/xj2GNU1ClYrAVS2nWQD7SHuRA+5iOAktPpv6/GYT+6/1LDRV/PA
	IqB2FxF7nZg9tG/AtetEJN7Mjk8bX743KKvC4MBPcdvCWjrbKwYsSH5ybD2gVOY5ex/Lhv8cqIy
	gmaNTBqSk2fQjXIbQzxxebIqKmZ3K2yoJRRGbCC6TViySjlQ4fP6rq5RrOcb2E80faPGbgE4RKu
	OBu0ZZz9Y=
X-Received: by 2002:a17:90b:2ecb:b0:36b:9798:4f68 with SMTP id 98e67ed59e1d1-37cdbdb8e21mr2936015a91.9.1781779291821;
        Thu, 18 Jun 2026 03:41:31 -0700 (PDT)
Received: from localhost ([111.228.63.84])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-37c521aa047sm10755687a91.3.2026.06.18.03.41.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jun 2026 03:41:31 -0700 (PDT)
From: Cen Zhang <zzzccc427@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	baijiaju1990@gmail.com,
	zzzccc427@gmail.com
Subject: [PATCH] USB: iowarrior: kill async writes before freeing on disconnect
Date: Thu, 18 Jun 2026 18:41:26 +0800
Message-Id: <20260618104126.3392136-1-zzzccc427@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

IOWarrior write() uses anchored interrupt URBs for async-capable
devices and passes struct iowarrior as the completion context.
release() can close the file while those URBs are still outstanding; it
only stops the interrupt-in URB when the device is still present.

disconnect() already kills the submitted write URBs when the device is
still opened, but skips that step when opened is clear and then frees
struct iowarrior. That allows a close-before-disconnect sequence to free
the embedded anchor and completion context while giveback is still using
them.

The buggy scenario involves two paths, with each column showing the order
within that path:

file write and close path:          disconnect and giveback path:
1. write() submits an anchored      1. USB disconnect sets present to 0.
   interrupt-out URB.
2. release() sets opened to 0       2. Because opened is 0, disconnect
   and returns without draining        skips the write-anchor drain and
   dev->submitted.                     frees dev.
3. The write URB remains in         3. Giveback unanchors the URB and
   flight after close.                 runs iowarrior_write_callback()
                                       with the freed dev.

Kill the submitted write URBs in the opened == 0 disconnect branch before
dropping the device mutex and freeing the device. usb_kill_anchored_urbs()
waits for any completion window covered by the anchor, so the embedded
anchor and callback context remain live until write giveback is done.

Validation reproduced this kernel report:
KASAN slab-use-after-free in iowarrior_write_callback+0x7d/0xf0
RIP: 0010:pv_native_safe_halt+0xf/0x20
Write of size 4
Call trace:
  dump_stack_lvl+0x66/0xa0
  print_report+0xce/0x630
  fixup_red_left+0x9/0x30
  complete_report_info+0x83/0x110
  iowarrior_write_callback+0x7d/0xf0 (drivers/usb/misc/iowarrior.c:220)
  kasan_report+0xe0/0x110
  kasan_check_range+0x105/0x1b0
  __usb_hcd_giveback_urb+0x112/0x1d0
  dummy_timer+0xaaa/0x19a0
  dummy_timer+0x4/0x19a0
  srso_alias_return_thunk+0x5/0xfbef5
  __hrtimer_run_queues+0xeb/0x510
  __hrtimer_run_queues+0x102/0x510
  hrtimer_run_softirq+0xd0/0x130
  handle_softirqs+0x155/0x650
  do_raw_spin_unlock+0x9a/0x100
  do_raw_spin_unlock+0x8b/0x100
  __irq_exit_rcu+0xc4/0x160
  irq_exit_rcu+0xe/0x20
  sysvec_apic_timer_interrupt+0x6c/0x80
  asm_sysvec_apic_timer_interrupt+0x1a/0x20
Allocated by task stack:
  kasan_save_stack+0x33/0x60
  kasan_save_track+0x14/0x30
  __kasan_kmalloc+0x8f/0xa0
  __device_attach_driver+0xf1/0x1a0
  bus_for_each_drv+0xf9/0x160
  __device_attach+0x133/0x2a0
  device_add+0x9b9/0xc10
  usb_set_configuration+0xb64/0xf20
  usb_new_device+0x492/0x870
  hub_event+0x1b10/0x29c0
  process_one_work+0x4d7/0xb90
  worker_thread+0x2d8/0x570
  kthread+0x1ad/0x1f0
  ret_from_fork+0x3c9/0x540
  ret_from_fork_asm+0x1a/0x30

Fixes: 946b960d13c1 ("USB: add driver for iowarrior devices.")
Assisted-by: Codex:gpt-5.5
Signed-off-by: Cen Zhang <zzzccc427@gmail.com>
---
 drivers/usb/misc/iowarrior.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/usb/misc/iowarrior.c b/drivers/usb/misc/iowarrior.c
index 22504c0a2841..07406ec7aabe 100644
--- a/drivers/usb/misc/iowarrior.c
+++ b/drivers/usb/misc/iowarrior.c
@@ -917,6 +917,7 @@ static void iowarrior_disconnect(struct usb_interface *interface)
 		mutex_unlock(&dev->mutex);
 	} else {
 		/* no process is using the device, cleanup now */
+		usb_kill_anchored_urbs(&dev->submitted);
 		mutex_unlock(&dev->mutex);
 		iowarrior_delete(dev);
 	}
-- 
2.43.0


Received: from mail-vs1-f44.google.com (mail-vs1-f44.google.com [209.85.217.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D3CB3BF676
	for <linux-usb@vger.kernel.org>; Fri, 26 Jun 2026 21:26:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782509166; cv=none; b=Y2gsy+nasOYOaJ0iu6/0Mmvn1VQNf/X/Jqr+LmLx0QENlB1vtlFzZSz56Gbe9K7o875XqDHnyWHKmfPChtR3tZcVar5sK5R+2ZtIGmsd58Ghcy+l9kR0GPWegAqvfW1JGz/CpJ4swFiDSUTMSXJpcB+82weonqF/6UI5DK68c3A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782509166; c=relaxed/simple;
	bh=WZRUHxSxB8g4psTh9ZiB1OLTbpG9QypM2MkQRgaclfM=;
	h=Message-ID:Date:Subject:To:Cc:Content-Type:MIME-Version:From; b=IqcjfIPSE2jUo2eKoxwtjLf+7iMtytvjGIjt0JkiZOvL1ZON97xkfdQTB4zpsVgeIU+fNmF+7n7sjYLYgYNtQ5xj0t4hfIuPml1Ma8BfEfJ6CcTSI7pfzVE1TXZ2i8+kEAi6NZ1r1H4Ujktt4lRJ/uN3YKA3jpWP6jExF4X55z0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AUIYY5Ph; arc=none smtp.client-ip=209.85.217.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AUIYY5Ph"
Received: by mail-vs1-f44.google.com with SMTP id ada2fe7eead31-73531dfb95cso72251137.2
        for <linux-usb@vger.kernel.org>; Fri, 26 Jun 2026 14:26:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782509163; x=1783113963; darn=vger.kernel.org;
        h=from:mime-version:content-transfer-encoding:content-type:cc:to
         :subject:date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3yA7PEaAZplsOG+IODluDgWXb/GywcjZbNAieGW5ryk=;
        b=AUIYY5Ph5JpulJhc5000ryd6VA0qRkIujTCv6X0ISSpGNFe/WiHpJN11IFT1Axy/9D
         9FahatLmD1kT6azFVsn4bjjsUABa817CxpWAcMQSFtGDaprCBcvDotvPqVUjq50YKQQ/
         KgwD/geHfJm1J+22WV7NTWETQXhgocDbJQ2mN2S3mkYnVLMYpdYj1Y9hSat76Vx2MnNI
         C50QI2pw5n62HwKHeaihnJ8yRjZ6KqCu9HjlqFo3In02wIaDQE6OIfPUNo/aH42TeXmi
         CoCad2gAQdCJnuVVCsR8pGPR2AVpVkOZKxVpBMJlssXZWhB7wvLLeKXyXpQ6gVYRltgL
         yZrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782509163; x=1783113963;
        h=from:mime-version:content-transfer-encoding:content-type:cc:to
         :subject:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=3yA7PEaAZplsOG+IODluDgWXb/GywcjZbNAieGW5ryk=;
        b=jJwaqURAa9xKuCmttk3fAoPG4kw42FqtyZgkbGIFPptJ2BcBt8cpoc4pi28p0oqczI
         pzvw6h0/fUqDHR18u+DVtn2YgErdeuTXd6aW+sRtTCktBiGFbJ3T8XVZaUh/m5G+EjeF
         XWYGLDhD6KX7Exr7HXccVb9poZWr7/dR6W4tsPUPIU7RLWPVxB1xmOLKq5fay2DOrKE5
         jz27sN5edq5GrCavEZtV6Ths7C51w32/A9dEfGEvpVJFP0xu9zwDBC6vfSGrEn9CZhKG
         THKhkR39dH3m8irAeKsUS56Zt2YlTDNIPmvDcTGP671JUjct3LBBSUXtE/4uQBA3B/E9
         fGdA==
X-Forwarded-Encrypted: i=1; AHgh+Rpqp6xHn2DIhwjKS4O1eqtYtuiQmK25T1RwjgWw+hnj8I6PCt8NMbiTpw2U1KGVGGsHH2er5g7o7NY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy1COTLDIG85ATv8fgwDp2KNFjyx1Yf1444WDJJKbBwzIUqt9e+
	jnAW+bHlqmHCbVaRjWQvhAs1YHhye3fHuJsMJHqDarY4LWis5RQrRSE6
X-Gm-Gg: AfdE7ck+9ViJU0Q6ALJMPb4e43Cviw1QfgZSs1lk/KmruEycH/B5zZ8ufC4AgtdLRlE
	80tpm7nmVVEYe9aOXhJs1rV96EYOKMiGaRVRmzLKBwfNgUeABjAs794pFPvZMgPqKnSalLcj3hC
	EVJCo8QPqZRUKMfHslmTJD7WaeVD3NOJDDJeaWKWOf2YgcHANi+Bt7G9bJayOutB7M5ZkwQipe7
	Uy0ssdJ3bYYPQvIHDeuCI/mkf4HWMEA/xLfDF/RZy58bQG92ZOe2kBtYDQC7H72Sgkmvf9bVzsK
	GgZCeaB1xhxWZpZB0fK5rdAdAGp08ctCQyLQM15brJKfYHnWjsmpJJWVVdPmoxYKtwEuOj8ZIlE
	EyTQVFVS4j+PSCTLOVOrCEQXK7kg25RIsmGO1lk5gl4Olxcx1zMv9Yty/RiJv8/iC9TtlG4cBfx
	RUnaLCCkaFCuHYU9n83jnYRL1vBWzXSIiWWf0GIdtW4hNl+JFuhPCPV+25dc8zHNRU5ot4SZGI6
	5iAFatb0KaV2rb7b+ReYJ8=
X-Received: by 2002:a05:6102:440f:b0:6d1:8f7:18a5 with SMTP id ada2fe7eead31-73433e3dc72mr1563090137.1.1782509162922;
        Fri, 26 Jun 2026 14:26:02 -0700 (PDT)
Received: from [192.168.10.115] ([132.170.207.48])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-96916e88e59sm1898626241.6.2026.06.26.14.26.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jun 2026 14:26:02 -0700 (PDT)
Message-ID: <6a3eee6a.87857ece.10923b.6588@mx.google.com>
Date: Fri, 26 Jun 2026 14:26:02 -0700 (PDT)
Subject:
 BUG: sleeping function called from invalid context in submit_async_request
To: gregkh@linuxfoundation.org, kees@kernel.org, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org
Cc: syzkaller@googlegroups.com, contact@pgazz.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: sanan.hasanou@gmail.com

Good day, dear maintainers,

We found a bug using a modified version of syzkaller.

Kernel Branch: 7.0-rc1
Kernel Config: <https://drive.google.com/open?id=1SkS9U2y8MGrnaXhjJJI5n5SymSSMyYnS>
Unfortunately, we don't have any reproducer for this bug yet.
Thank you!

Best regards,
Sanan Hasanov

BUG: sleeping function called from invalid context at ./include/linux/sched/mm.h:323
in_atomic(): 0, irqs_disabled(): 0, non_block: 0, pid: 11047, name: kworker/0:7
preempt_count: 0, expected: 0
RCU nest depth: 1, expected: 0
8 locks held by kworker/0:7/11047:
 #0: ffff8880183efd38 ((wq_completion)usb_hub_wq){+.+.}-{0:0}, at: process_one_work kernel/workqueue.c:3250 [inline]
 #0: ffff8880183efd38 ((wq_completion)usb_hub_wq){+.+.}-{0:0}, at: process_scheduled_works+0x968/0x15e0 kernel/workqueue.c:3358
 #1: ffffc9000eecfc40 ((work_completion)(&hub->events)){+.+.}-{0:0}, at: process_one_work kernel/workqueue.c:3251 [inline]
 #1: ffffc9000eecfc40 ((work_completion)(&hub->events)){+.+.}-{0:0}, at: process_scheduled_works+0x9a8/0x15e0 kernel/workqueue.c:3358
 #2: ffff88801f1d0188 (&dev->mutex){....}-{4:4}, at: device_lock include/linux/device.h:895 [inline]
 #2: ffff88801f1d0188 (&dev->mutex){....}-{4:4}, at: hub_event+0x189/0x4f20 drivers/usb/core/hub.c:5899
 #3: ffff88803bf3c188 (&dev->mutex){....}-{4:4}, at: device_lock include/linux/device.h:895 [inline]
 #3: ffff88803bf3c188 (&dev->mutex){....}-{4:4}, at: __device_attach+0x8d/0x3f0 drivers/base/dd.c:1008
 #4: ffff88806754c150 (&dev->mutex){....}-{4:4}, at: device_lock include/linux/device.h:895 [inline]
 #4: ffff88806754c150 (&dev->mutex){....}-{4:4}, at: __device_attach+0x8d/0x3f0 drivers/base/dd.c:1008
 #5: ffffffff8de73c38 (registration_lock#2){+.+.}-{4:4}, at: parport_announce_port+0x6a/0x3c0 drivers/parport/share.c:518
 #6: ffffffff8e16f5d8 (pprt_lock){+.+.}-{3:3}, at: spin_lock_irq include/linux/spinlock_rt.h:96 [inline]
 #6: ffffffff8e16f5d8 (pprt_lock){+.+.}-{3:3}, at: lcd_write_cmd_p8+0x31/0x7f0 drivers/auxdisplay/panel.c:750
 #7: ffffffff8d558ce0 (rcu_read_lock){....}-{1:3}, at: rcu_lock_acquire include/linux/rcupdate.h:312 [inline]
 #7: ffffffff8d558ce0 (rcu_read_lock){....}-{1:3}, at: rcu_read_lock include/linux/rcupdate.h:850 [inline]
 #7: ffffffff8d558ce0 (rcu_read_lock){....}-{1:3}, at: __rt_spin_lock kernel/locking/spinlock_rt.c:50 [inline]
 #7: ffffffff8d558ce0 (rcu_read_lock){....}-{1:3}, at: rt_spin_lock+0x18d/0x360 kernel/locking/spinlock_rt.c:57
CPU: 0 UID: 0 PID: 11047 Comm: kworker/0:7 Tainted: G             L      7.0.0-rc1 #1 PREEMPT_{RT,(full)} 
Tainted: [L]=SOFTLOCKUP
Hardware name: QEMU Ubuntu 24.04 PC v2 (i440FX + PIIX, arch_caps fix, 1996), BIOS 1.16.3-debian-1.16.3-2 04/01/2014
Workqueue: usb_hub_wq hub_event
Call Trace:
 <TASK>
 __dump_stack+0x21/0x30 lib/dump_stack.c:94
 dump_stack_lvl+0xee/0x150 lib/dump_stack.c:120
 dump_stack+0x19/0x20 lib/dump_stack.c:129
 __might_resched+0x35b/0x4d0 kernel/sched/core.c:8884
 __might_sleep+0x41/0x70 kernel/sched/core.c:8813
 might_alloc include/linux/sched/mm.h:323 [inline]
 slab_pre_alloc_hook mm/slub.c:4452 [inline]
 slab_alloc_node mm/slub.c:4807 [inline]
 __kmalloc_cache_noprof+0x7f/0x5c0 mm/slub.c:5334
 kmalloc_noprof include/linux/slab.h:962 [inline]
 kzalloc_noprof include/linux/slab.h:1200 [inline]
 submit_async_request+0xd2/0x9c0 drivers/usb/misc/uss720.c:137
 set_1284_register drivers/usb/misc/uss720.c:237 [inline]
 parport_uss720_write_data+0x70/0x130 drivers/usb/misc/uss720.c:337
 lcd_write_cmd_p8+0x94/0x7f0 drivers/auxdisplay/panel.c:752
 hd44780_common_init_display+0x188/0x4f0 drivers/auxdisplay/hd44780_common.c:124
 charlcd_init drivers/auxdisplay/charlcd.c:585 [inline]
 charlcd_register+0x1e6/0x320 drivers/auxdisplay/charlcd.c:652
 panel_attach+0x19f9/0x1f20 drivers/auxdisplay/panel.c:1644
 driver_check+0x51/0x60 drivers/parport/share.c:158
 bus_for_each_drv+0x252/0x2e0 drivers/base/bus.c:500
 attach_driver_chain drivers/parport/share.c:172 [inline]
 parport_announce_port+0x2e8/0x3c0 drivers/parport/share.c:529
 uss720_probe+0x6e0/0xbf0 drivers/usb/misc/uss720.c:746
 usb_probe_interface+0x692/0xcf0 drivers/usb/core/driver.c:396
 call_driver_probe drivers/base/dd.c:-1 [inline]
 really_probe+0x264/0xaf0 drivers/base/dd.c:661
 __driver_probe_device+0x19a/0x340 drivers/base/dd.c:803
 driver_probe_device+0x58/0x250 drivers/base/dd.c:833
 __device_attach_driver+0x2c8/0x4b0 drivers/base/dd.c:961
 bus_for_each_drv+0x252/0x2e0 drivers/base/bus.c:500
 __device_attach+0x2b6/0x3f0 drivers/base/dd.c:1033
 device_initial_probe+0x9e/0xd0 drivers/base/dd.c:1088
 bus_probe_device+0x136/0x210 drivers/base/bus.c:574
 device_add+0x798/0xb40 drivers/base/core.c:3689
 usb_set_configuration+0x1ae9/0x2160 drivers/usb/core/message.c:2208
 usb_generic_driver_probe+0x9a/0x160 drivers/usb/core/generic.c:250
 usb_probe_device+0x1cb/0x3d0 drivers/usb/core/driver.c:291
 call_driver_probe drivers/base/dd.c:-1 [inline]
 really_probe+0x264/0xaf0 drivers/base/dd.c:661
 __driver_probe_device+0x19a/0x340 drivers/base/dd.c:803
 driver_probe_device+0x58/0x250 drivers/base/dd.c:833
 __device_attach_driver+0x2c8/0x4b0 drivers/base/dd.c:961
 bus_for_each_drv+0x252/0x2e0 drivers/base/bus.c:500
 __device_attach+0x2b6/0x3f0 drivers/base/dd.c:1033
 device_initial_probe+0x9e/0xd0 drivers/base/dd.c:1088
 bus_probe_device+0x136/0x210 drivers/base/bus.c:574
 device_add+0x798/0xb40 drivers/base/core.c:3689
 usb_new_device+0xa29/0x1710 drivers/usb/core/hub.c:2695
 hub_port_connect drivers/usb/core/hub.c:5567 [inline]
 hub_port_connect_change drivers/usb/core/hub.c:5707 [inline]
 port_event drivers/usb/core/hub.c:5871 [inline]
 hub_event+0x2a21/0x4f20 drivers/usb/core/hub.c:5953
 process_one_work kernel/workqueue.c:3275 [inline]
 process_scheduled_works+0xa5a/0x15e0 kernel/workqueue.c:3358
 worker_thread+0xab9/0xff0 kernel/workqueue.c:3439
 kthread+0x355/0x410 kernel/kthread.c:467
 ret_from_fork+0x49c/0xa10 arch/x86/kernel/process.c:158
 ret_from_fork_asm+0x11/0x20 arch/x86/entry/entry_64.S:245
 </TASK>
usb 6-1: USB disconnect, device number 19
usb 6-1: submit_async_request submit_urb failed with -19
usb 6-1: set_1284_register(0,1) failed
usb 6-1: submit_async_request submit_urb failed with -19
usb 6-1: set_1284_register(2,10) failed
usb 6-1: submit_async_request submit_urb failed with -19
usb 6-1: set_1284_register(2,11) failed
usb 6-1: submit_async_request submit_urb failed with -19
usb 6-1: set_1284_register(0,128) failed
usb 6-1: submit_async_request submit_urb failed with -19
usb 6-1: set_1284_register(2,10) failed
usb 6-1: submit_async_request submit_urb failed with -19
usb 6-1: set_1284_register(2,11) failed
usb 6-1: submit_async_request submit_urb failed with -19
usb 6-1: set_1284_register(0,76) failed
usb 6-1: submit_async_request submit_urb failed with -19
usb 6-1: set_1284_register(2,8) failed
usb 6-1: submit_async_request submit_urb failed with -19
usb 6-1: set_1284_register(2,9) failed
usb 6-1: submit_async_request submit_urb failed with -19
usb 6-1: set_1284_register(0,67) failed
usb 6-1: submit_async_request submit_urb failed with -19
usb 6-1: set_1284_register(2,8) failed
usb 6-1: submit_async_request submit_urb failed with -19
usb 6-1: set_1284_register(2,9) failed
usb 6-1: submit_async_request submit_urb failed with -19
usb 6-1: set_1284_register(0,68) failed
usb 6-1: submit_async_request submit_urb failed with -19
usb 6-1: set_1284_register(2,8) failed
usb 6-1: submit_async_request submit_urb failed with -19
usb 6-1: set_1284_register(2,9) failed
usb 6-1: submit_async_request submit_urb failed with -19
usb 6-1: set_1284_register(0,32) failed
usb 6-1: submit_async_request submit_urb failed with -19
usb 6-1: set_1284_register(2,8) failed
usb 6-1: submit_async_request submit_urb failed with -19
usb 6-1: set_1284_register(2,9) failed
usb 6-1: submit_async_request submit_urb failed with -19
usb 6-1: set_1284_register(0,100) failed
usb 6-1: submit_async_request submit_urb failed with -19
usb 6-1: set_1284_register(2,8) failed
usb 6-1: submit_async_request submit_urb failed with -19
usb 6-1: set_1284_register(2,9) failed
usb 6-1: submit_async_request submit_urb failed with -19
usb 6-1: set_1284_register(0,114) failed
usb 6-1: submit_async_request submit_urb failed with -19
usb 6-1: set_1284_register(2,8) failed
usb 6-1: submit_async_request submit_urb failed with -19
usb 6-1: set_1284_register(2,9) failed
usb 6-1: submit_async_request submit_urb failed with -19
usb 6-1: set_1284_register(0,105) failed
usb 6-1: submit_async_request submit_urb failed with -19
usb 6-1: set_1284_register(2,8) failed
usb 6-1: submit_async_request submit_urb failed with -19
usb 6-1: set_1284_register(2,9) failed
usb 6-1: submit_async_request submit_urb failed with -19
usb 6-1: set_1284_register(0,118) failed
usb 6-1: submit_async_request submit_urb failed with -19
usb 6-1: set_1284_register(2,8) failed
usb 6-1: submit_async_request submit_urb failed with -19
usb 6-1: set_1284_register(2,9) failed
usb 6-1: submit_async_request submit_urb failed with -19
usb 6-1: set_1284_register(0,101) failed
usb 6-1: submit_async_request submit_urb failed with -19
usb 6-1: set_1284_register(2,8) failed
usb 6-1: submit_async_request submit_urb failed with -19
usb 6-1: set_1284_register(2,9) failed
usb 6-1: submit_async_request submit_urb failed with -19
usb 6-1: set_1284_register(0,114) failed
usb 6-1: submit_async_request submit_urb failed with -19
usb 6-1: set_1284_register(2,8) failed
usb 6-1: submit_async_request submit_urb failed with -19
usb 6-1: set_1284_register(2,9) failed
usb 6-1: submit_async_request submit_urb failed with -19
usb 6-1: set_1284_register(0,32) failed
usb 6-1: submit_async_request submit_urb failed with -19
usb 6-1: set_1284_register(2,8) failed
usb 6-1: submit_async_request submit_urb failed with -19
usb 6-1: set_1284_register(2,9) failed
usb 6-1: submit_async_request submit_urb failed with -19
usb 6-1: set_1284_register(0,117) failed
usb 6-1: submit_async_request submit_urb failed with -19
usb 6-1: set_1284_register(2,8) failed
usb 6-1: submit_async_request submit_urb failed with -19
usb 6-1: set_1284_register(2,9) failed
usb 6-1: submit_async_request submit_urb failed with -19
usb 6-1: set_1284_register(0,110) failed
usb 6-1: submit_async_request submit_urb failed with -19
usb 6-1: set_1284_register(2,8) failed
usb 6-1: submit_async_request submit_urb failed with -19
usb 6-1: set_1284_register(2,9) failed
usb 6-1: submit_async_request submit_urb failed with -19
usb 6-1: set_1284_register(0,108) failed
usb 6-1: submit_async_request submit_urb failed with -19
usb 6-1: set_1284_register(2,8) failed
usb 6-1: submit_async_request submit_urb failed with -19
usb 6-1: set_1284_register(2,9) failed
usb 6-1: submit_async_request submit_urb failed with -19
usb 6-1: set_1284_register(0,111) failed
usb 6-1: submit_async_request submit_urb failed with -19
usb 6-1: set_1284_register(2,8) failed
usb 6-1: submit_async_request submit_urb failed with -19
usb 6-1: set_1284_register(2,9) failed
usb 6-1: submit_async_request submit_urb failed with -19
usb 6-1: set_1284_register(0,97) failed
usb 6-1: submit_async_request submit_urb failed with -19
usb 6-1: set_1284_register(2,8) failed
usb 6-1: submit_async_request submit_urb failed with -19
usb 6-1: set_1284_register(2,9) failed
usb 6-1: submit_async_request submit_urb failed with -19
usb 6-1: set_1284_register(0,100) failed
usb 6-1: submit_async_request submit_urb failed with -19
usb 6-1: set_1284_register(2,8) failed
usb 6-1: submit_async_request submit_urb failed with -19
usb 6-1: set_1284_register(2,9) failed
usb 6-1: submit_async_request submit_urb failed with -19
usb 6-1: set_1284_register(0,101) failed
usb 6-1: submit_async_request submit_urb failed with -19
usb 6-1: set_1284_register(2,8) failed
usb 6-1: submit_async_request submit_urb failed with -19
usb 6-1: set_1284_register(2,9) failed
usb 6-1: submit_async_request submit_urb failed with -19
usb 6-1: set_1284_register(0,100) failed
usb 6-1: submit_async_request submit_urb failed with -19
usb 6-1: set_1284_register(2,8) failed
usb 6-1: submit_async_request submit_urb failed with -19
usb 6-1: set_1284_register(2,9) failed
usb 6-1: submit_async_request submit_urb failed with -19
usb 6-1: set_1284_register(0,46) failed
usb 6-1: submit_async_request submit_urb failed with -19
usb 6-1: set_1284_register(2,8) failed
usb 6-1: submit_async_request submit_urb failed with -19
usb 6-1: set_1284_register(2,9) failed

<<<<<<<<<<<<<<< tail report >>>>>>>>>>>>>>>

usb 6-1: async_complete: urb error -71
usb 6-1: async_complete: urb error -71
usb 6-1: async_complete: urb error -71
usb 6-1: async_complete: urb error -71
get_1284_register timeout
BUG: sleeping function called from invalid context at ./include/linux/sched/mm.h:323
in_atomic(): 0, irqs_disabled(): 0, non_block: 0, pid: 16, name: ktimers/0
preempt_count: 0, expected: 0
RCU nest depth: 3, expected: 0
7 locks held by ktimers/0/16:
 #0: ffffffff8d3ff980 (local_bh){.+.+}-{1:3}, at: __local_bh_disable_ip+0x38/0x410
 #1: ffffffff8d558ce0 (rcu_read_lock){....}-{1:3}, at: __local_bh_disable_ip+0x38/0x410
 #2: ffff88806b22ea20 (&base->expiry_lock){+...}-{3:3}, at: __run_timer_base+0x102/0x830
 #3: ffffffff8d558ce0 (rcu_read_lock){....}-{1:3}, at: rt_spin_lock+0x18d/0x360
 #4: ffffc9000010faa0 ((&scan_timer)){+...}-{0:0}, at: call_timer_fn+0xc5/0x520
 #5: ffffffff8e16f5d8 (pprt_lock){+.+.}-{3:3}, at: panel_scan_timer+0x4f/0x1980
 #6: ffffffff8d558ce0 (rcu_read_lock){....}-{1:3}, at: rt_spin_trylock+0x117/0x2b0
CPU: 0 UID: 0 PID: 16 Comm: ktimers/0 Tainted: G        W    L      7.0.0-rc1 #1 PREEMPT_{RT,(full)} 
Tainted: [W]=WARN, [L]=SOFTLOCKUP
Hardware name: QEMU Ubuntu 24.04 PC v2 (i440FX + PIIX, arch_caps fix, 1996), BIOS 1.16.3-debian-1.16.3-2 04/01/2014
Call Trace:
 <TASK>
 __dump_stack+0x21/0x30
 dump_stack_lvl+0xee/0x150
 dump_stack+0x19/0x20
 __might_resched+0x35b/0x4d0
 __might_sleep+0x41/0x70
 __kmalloc_cache_noprof+0x7f/0x5c0
 submit_async_request+0xd2/0x9c0
 parport_uss720_write_data+0x70/0x130
 panel_scan_timer+0x164/0x1980
 call_timer_fn+0x148/0x520
 __run_timer_base+0x5e9/0x830
 run_timer_softirq+0xc5/0x180
 handle_softirqs+0x1c7/0x690
 run_ktimerd+0x70/0xb0
 smpboot_thread_fn+0x547/0xa20
 kthread+0x355/0x410
 ret_from_fork+0x49c/0xa10
 ret_from_fork_asm+0x11/0x20
 </TASK>
usb 6-1: submit_async_request submit_urb failed with -19
usb 6-1: set_1284_register(0,0) failed
usb 6-1: submit_async_request submit_urb failed with -19
usb 6-1: get_1284_register(1) failed
usb 6-1: submit_async_request submit_urb failed with -19
usb 6-1: set_1284_register(0,63) failed
usb 6-1: submit_async_request submit_urb failed with -19
usb 6-1: get_1284_register(1) failed
usb 6-1: async_complete: urb error -104

<<<<<<<<<<<<<<< tail report >>>>>>>>>>>>>>>

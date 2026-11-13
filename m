Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794551784;
	b=TzWa8/ACGwzYJOdDO2zNp6xl3F/JMoSUtZvOj5gQAFZoLvymKT3Hj7/ngLF0BN8gPrQp
	 Os0f4NrsjkRyTPunSZDSv1ci/kOppd4275GZB6oEg1dLMdCShlraIU0DBT5nF3QAncmZ3
	 59BmV59Le1HZzphwrQZLho+g3GR2N469P+YGOeec2j5TfL1lh+268lDT+s0tEVI9GJZqg
	 vTxKzmpoXes87xN0v0ItxnK+QU+YOhV+qi5sDAkNiRDr4X/YpnDVFJgazWjC7EAlLCFdm
	 9czMagZ11GdSsFA/ExcdttVSsDJ4KlfJ4szBn533sB6+E68Dm4vCWkxOMoNsu7J9A5Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794551784;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=deY8HLt5cqSe/XEbd5Sk/Esab1PpE1leBpnoeyEu9y8=;
	b=MZGX3IlmNW73LA+xUt/oLaW88kVzvCsjjhowHSNvBOPIPYq9Zuqjxb+oTJuGXO6/O3iU
	 S3ux6QEX2DsGEViXXb+Lt7TtndEnweuYD4FaxNqs/Wj2MlJs8pRljCj3ENU7zyDWSCqe6
	 rPDaqntWQ2XmUZOk03lrmxQJvbc7+5AdY4qIeiOHG2HnTOTiKYynV1TUMI8DB5I178qqb
	 Dlv4TI5H8cIQDWV64JpeA6ok0/OIrmrYYVa80Mnb4sbxUQhmggi32ppSLfcrEiQAJxFer
	 Kq/+8mk70L+/s4VyLGUwv+aDAya39mJWiBe2WvBkDpFZsSPPy562enhycUPqrUyjbUA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bAyCvZ3t;
	arc=none smtp.remote-ip=74.125.82.170
Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E6CA606A321
	for <linux-usb@vger.kernel.org>; Fri, 13 Nov 2026 06:36:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0E6CA606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bAyCvZ3t
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-36dc4797082so74549eec.2
        for <linux-usb@vger.kernel.org>; Thu, 12 Nov 2026 22:36:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794551783; x=1795156583; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=deY8HLt5cqSe/XEbd5Sk/Esab1PpE1leBpnoeyEu9y8=;
        b=bAyCvZ3tAmIa2KsWRIHIql/d7kxKtwFjBz6TniAD2Lb8YKA10bIqp9pCaQrvNlsRwn
         E/9+40rsbUnrM3Un41gMmfff7vvxwx5v/YKJSH7GQJb6a2eOO2p+D8rfWsTa6voWze0X
         BeuCvc5Bl2NaYieWgPn3PNAW+8IqTQkqbDKf9D33656GiMBvV0yJg1oeyQMu9HVIXfbS
         Y+1VE/VBA0Xbar1kAws+LCp84T+/ccgJWWdnM3Fuu/vrFEgAD+v3+qdll30Xtrb7qk1+
         fqxNc3qkMJYM0/BTWQhVQ+6r0/lAgDrU2DYn8Z+nh8BEmqXTksBgveH44XtxfBazWPQt
         cg+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794551783; x=1795156583;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=deY8HLt5cqSe/XEbd5Sk/Esab1PpE1leBpnoeyEu9y8=;
        b=QVgP8z1YYSh+VpxsNGB8v9C3sVIjccrktUrPFoo/HBmy5KOlaL01FrSj+TxYP1fsQM
         7gV/TjzOp0sP35QOzK/FmM2kb6eIR8pdYCkdrt5gisLvPzZMYKJOhx4+FC9viLBUipTj
         9B8Ex3da1YB3K6eSMCi1Y+wz7b53Dy8QEcTaO2MBFn7xLvqrFTekx9rCSkdCT/2Qx56J
         y+fHJ/U4i1PUb5fCP2EEFeZJ2IS7r7CpxWgY8LJECzpvzvMf5wjj+1/cbzFciQk7cTcB
         OJ4Uq85j6YB2OmMTcK3XBgvm/bOIK3B0hjTzAOuatif9biT5dC9p4IJUFk/hIYoUarEB
         UzxA==
X-Gm-Message-State: APuU4Z9xyk0bHGT4cyMCSo9R5XfZNCLquhSncQVTnZT5XmRUSWqFnnV+
	1xqgQGj9rTqr4OX2FA5DGtwbcGYXpp/jdPawrTkDJnfdT61QVwmK+/gKGcnYBnvoIe0=
X-Gm-Gg: AYBFou1YMSvQ3zEUg/mEQ+YZKysSuMxoEFgBtKhR0hK/yXxeTX+yjLFtDjdrJgScthR
	B6N2DS7gXZ1lOU6mPkGRSOCfqoBTsVCc1zZc/WYYcQ+vDjwk3nDxJF6iB2F6uREv4Vskzfuxf/F
	m+Ya65TyhZZmEsiXG7JN0hZrkHVbcrll7rACWuQclfxIp93aGxMGTklDpNiqEmCQK2KXqxc+wZd
	NkaYQ3L47ZgSw4PoviuPLol8Rm017orFXMyYm3C/NIMWxmZIA2zNffB5EiPUyu0Pvkh9eRdqL9q
	KubZ90jXeKgb3Rkv2OKaWEcnOtmQrNOmLbSLd3QvFAcuFuaamZMKYc0JYeqy5Al/oEaeCnYqiiZ
	JARflmneF2AQ1j55TDjm6nTOSa/qliwBLfK+Ld7HoEDvqmT6xpCK+mltD0n5SYMyCV/7qZoSwU6
	a/OXX4Rr06eevktCUYWD08pjXYq4SC3vEb9X7WdJfgUvBQf4GAIAUHxVT4CHKMT9Ij+QkgYlwoR
	DjKgdlRd0nU4jonidhxkik5RYE9uumC/ztsT7S3gXTvV0xXeoJQDhPTBScJ36VNvWjhYK7snS/E
	oDdfYlE1ZnV1XA461SXqBCDDt674bFT763GKIaM98A==
X-Received: by 2002:a05:7300:6da8:b0:36a:e7a:e89 with SMTP id 5a478bee46e88-379659c6815mr2765962eec.2.1794551782918;
        Thu, 12 Nov 2026 22:36:22 -0800 (PST)
Received: from CRASHEDROM.localdomain ([142.249.36.161])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379563df84fsm7303942eec.20.2026.11.12.22.36.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 22:36:22 -0800 (PST)
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
Subject: Re: [PATCH v2 0/4] usb: stop timers/works left armed on teardown
Date: Fri, 13 Nov 2026 14:36:14 +0800
Message-Id: <20261113063614.47540-1-lui2012qwq@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20261113063409.47485-1-lui2012qwq@gmail.com>
References: <20261113063409.47485-1-lui2012qwq@gmail.com>
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

The KASAN report and the reproducer kit for the gpio-vbus instance
[4/4], as promised in the cover letter.  [4/4] is unchanged in v2,
so this is the same report and kit as posted in the v1 thread.

Environment: QEMU x86_64, generic KASAN kernel (v7.3-rc7 plus unrelated
local commits; config: KASAN/KASAN_GENERIC=y, GPIOLIB=y, GPIO_SIM=y,
CONFIGFS_FS=y, USB_GADGET=m, USB_GPIO_VBUS=m),
phy-gpio-vbus-usb built as a module.  The driver under test is
unmodified except for the disclosed 500 ms sleep widening the
remove()-to-detach window.

Setup: a one-line gpio-sim chip labelled "vbus-sim" stands in for the
VBUS sense GPIO; writing its "pull" sysfs attribute generates real GPIO
edge interrupts.  The vbus_rig module registers a gpiod lookup table and
the "gpio-vbus" platform device, so the real driver probes it, and
attaches a dummy usb_gadget to phy->otg->gadget so gpio_vbus_irq() takes
its normal schedule_delayed_work() path (a UDC provides this on real
hardware); the module fails to load if the phy cannot be attached, so a
clean run cannot be a setup artifact.  rmmod vbus_rig runs the real
gpio_vbus_remove() while the line is being toggled.

Results over repeated runs of the same script:

    vulnerable kernel: 5/5 runs, KASAN slab-use-after-free each time
    patched kernel:    5/5 runs, clean

Representative vulnerable splat (VBUS edges toggle at max rate while the
device is unregistered; an interrupt lands after the
cancel_delayed_work_sync(), re-arms the 100 ms debounce work, and the
work's timer fires after the devm release has freed gpio_vbus_data):

[    3.571772] BUG: KASAN: slab-use-after-free in __run_timer_base.part.0+0x80c/0x900
[    3.571779] Write of size 8 at addr ffff8880033291d8 by task sh/89
[    3.571781] 
[    3.571784] CPU: 0 UID: 0 PID: 89 Comm: sh Tainted: G        W  O        7.3.0-rc7-00036-gf9532d351e12-dirty #29 PREEMPT(lazy) 
[    3.571788] Tainted: [W]=WARN, [O]=OOT_MODULE
[    3.571788] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.13.0-1ubuntu1.1 04/01/2014
[    3.571790] Call Trace:
[    3.571791]  <IRQ>
[    3.571792]  dump_stack_lvl+0x55/0x70
[    3.571808]  print_report+0x10d/0x5d0
[    3.571811]  ? __run_timer_base.part.0+0x80c/0x900
[    3.571813]  kasan_report+0x96/0xd0
[    3.571815]  ? __run_timer_base.part.0+0x80c/0x900
[    3.571817]  __run_timer_base.part.0+0x80c/0x900
[    3.571819]  ? __pfx___run_timer_base.part.0+0x10/0x10
[    3.571821]  ? __pfx___hrtimer_get_next_event+0x10/0x10
[    3.571825]  ? kvm_clock_read+0x15/0x30
[    3.571827]  ? __hrtimer_run_queues+0x2aa/0x580
[    3.571829]  ? clockevents_program_event+0x2b0/0x7c0
[    3.571833]  ? hrtimer_update_next_event+0x8a/0x100
[    3.571835]  run_timer_softirq+0xd6/0x190
[    3.571837]  handle_softirqs+0x184/0x5c0
[    3.571840]  ? __hrtimer_rearm_deferred+0x15d/0x460
[    3.571841]  irq_exit_rcu+0x6e/0x150
[    3.571843]  sysvec_apic_timer_interrupt+0x70/0x80
[    3.571845]  </IRQ>
[    3.571846]  <TASK>
[    3.571846]  asm_sysvec_apic_timer_interrupt+0x1a/0x20
[    3.571849] RIP: 0010:stack_depot_save_flags+0x61/0x830
[    3.571852] Code: 70 05 05 00 74 16 48 83 c4 30 44 89 e8 5b 5d 41 5c 41 5d 41 5e 41 5f c3 cc cc cc cc 89 c1 48 01 c9 89 cf 8d 04 8d 7b 71 f5 75 <83> f9 03 0f 86 36 01 00 00 89 c3 89 c1 4c 89 fe 03 5e 08 03 06 83
[    3.571854] RSP: 0018:ffff888002207a08 EFLAGS: 00000216
[    3.571856] RAX: 0000000075f571cb RBX: ffff888003880988 RCX: 0000000000000014
[    3.571858] RDX: ffffffffb3000130 RSI: 000000000000000a RDI: 0000000000000014
[    3.571859] RBP: ffff888001041640 R08: 0000000000000000 R09: ffffffffb87baec6
[    3.571859] R10: ffff888002207978 R11: ffff888002207f50 R12: 0000000000000001
[    3.571860] R13: 0000000000000000 R14: 000000000000000a R15: ffff888002207a70
[    3.571862]  ? entry_SYSCALL_64_after_hwframe+0x77/0x7f
[    3.571864]  ? stack_depot_save_flags+0x2d/0x830
[    3.571866]  ? kernfs_fop_write_iter+0x168/0x480
[    3.571868]  kasan_save_stack+0x34/0x50
[    3.571870]  ? kasan_save_stack+0x24/0x50
[    3.571871]  ? kasan_save_track+0x14/0x30
[    3.571872]  ? kasan_save_free_info+0x3a/0x60
[    3.571874]  ? __kasan_slab_free+0x43/0x70
[    3.571875]  ? kfree+0x18e/0x3c0
[    3.571877]  ? kernfs_fop_write_iter+0x168/0x480
[    3.571878]  ? vfs_write+0x87a/0xd40
[    3.571880]  ? ksys_write+0xf3/0x1c0
[    3.571881]  ? do_syscall_64+0xee/0x500
[    3.571883]  ? entry_SYSCALL_64_after_hwframe+0x77/0x7f
[    3.571885]  ? do_sys_openat2+0x308/0x450
[    3.571886]  ? kasan_save_stack+0x34/0x50
[    3.571888]  ? kasan_save_stack+0x24/0x50
[    3.571889]  ? kasan_save_track+0x14/0x30
[    3.571890]  ? kasan_save_free_info+0x3a/0x60
[    3.571892]  ? __kasan_slab_free+0x43/0x70
[    3.571893]  ? kmem_cache_free+0x1d4/0x3c0
[    3.571895]  ? do_sys_openat2+0x308/0x450
[    3.571896]  ? do_sys_open+0x8d/0xe0
[    3.571898]  ? __x64_sys_openat+0x9d/0x110
[    3.571899]  ? do_syscall_64+0xee/0x500
[    3.571901]  ? entry_SYSCALL_64_after_hwframe+0x77/0x7f
[    3.571902]  ? __pfx_path_openat+0x10/0x10
[    3.571905]  ? kasan_save_stack+0x34/0x50
[    3.571906]  ? kasan_save_stack+0x24/0x50
[    3.571907]  ? mutex_unlock+0x82/0xd0
[    3.571909]  ? __pfx_mutex_unlock+0x10/0x10
[    3.571911]  ? _raw_spin_lock_irqsave+0x8b/0xf0
[    3.571913]  ? gpio_sim_apply_pull+0x1c8/0x4e0
[    3.571915]  ? __pfx_gpio_sim_apply_pull+0x10/0x10
[    3.571917]  ? kasan_save_track+0x14/0x30
[    3.571918]  kasan_save_track+0x14/0x30
[    3.571920]  kasan_save_free_info+0x3a/0x60
[    3.571921]  __kasan_slab_free+0x43/0x70
[    3.571923]  kfree+0x18e/0x3c0
[    3.571925]  ? __pfx_sysfs_kf_write+0x10/0x10
[    3.571926]  kernfs_fop_write_iter+0x168/0x480
[    3.571928]  vfs_write+0x87a/0xd40
[    3.571929]  ? alloc_fd+0x2c6/0x5d0
[    3.571932]  ? __pfx_vfs_write+0x10/0x10
[    3.571933]  ? __do_sys_wait4+0xf2/0x100
[    3.571935]  ? fdget_pos+0x1cd/0x4c0
[    3.571937]  ksys_write+0xf3/0x1c0
[    3.571939]  ? __pfx_ksys_write+0x10/0x10
[    3.571940]  do_syscall_64+0xee/0x500
[    3.571942]  entry_SYSCALL_64_after_hwframe+0x77/0x7f
[    3.571944] RIP: 0033:0x49a227
[    3.571945] Code: 64 89 02 48 c7 c0 ff ff ff ff eb bb 0f 1f 80 00 00 00 00 f3 0f 1e fa 64 8b 04 25 18 00 00 00 85 c0 75 10 b8 01 00 00 00 0f 05 <48> 3d 00 f0 ff ff 77 51 c3 48 83 ec 28 48 89 54 24 18 48 89 74 24
[    3.571947] RSP: 002b:00007ffd89cad1e8 EFLAGS: 00000246 ORIG_RAX: 0000000000000001
[    3.571948] RAX: ffffffffffffffda RBX: 0000000000000001 RCX: 000000000049a227
[    3.571949] RDX: 000000000000000a RSI: 000000003e0afe50 RDI: 0000000000000001
[    3.571951] RBP: 000000003e0afe50 R08: 000000003e0afe50 R09: 006e776f642d6c6c
[    3.571952] R10: 0000000000000000 R11: 0000000000000246 R12: 000000000000000a
[    3.571953] R13: 000000003e0ad8a0 R14: 0000000000609c01 R15: 00007ffd89cad250
[    3.571955]  </TASK>
[    3.571955] 
[    3.571956] Allocated by task 86:
[    3.571957]  kasan_save_stack+0x24/0x50
[    3.571959]  kasan_save_track+0x14/0x30
[    3.571960]  __kasan_kmalloc+0x7f/0x90
[    3.571961]  __kmalloc_node_track_caller_noprof+0x1d4/0x4a0
[    3.571963]  devm_kmalloc+0x81/0x240
[    3.571965]  gpio_vbus_probe+0x30/0x670 [phy_gpio_vbus_usb]
[    3.571968]  platform_probe+0x9e/0x140
[    3.571970]  really_probe+0x1cf/0x5c0
[    3.571972]  __driver_probe_device+0x1a1/0x3b0
[    3.571974]  driver_probe_device+0x49/0xd0
[    3.571975]  __device_attach_driver+0x183/0x200
[    3.571977]  bus_for_each_drv+0x105/0x190
[    3.571979]  __device_attach+0x20b/0x380
[    3.571981]  device_initial_probe+0x7d/0xa0
[    3.571982]  bus_probe_device+0x5a/0x130
[    3.571983]  device_add+0xd6f/0x14c0
[    3.571984]  platform_device_add+0x253/0x5a0
[    3.571986]  platform_device_register_full+0x3c3/0x560
[    3.571988]  0xffffffffc02250aa
[    3.571989]  do_one_initcall+0x89/0x350
[    3.571990]  do_init_module+0x2a1/0x890
[    3.571992]  load_module+0x5166/0x6750
[    3.571994]  init_module_from_file+0x162/0x190
[    3.571996]  idempotent_init_module+0x325/0x680
[    3.571997]  __x64_sys_finit_module+0xc2/0x130
[    3.571999]  do_syscall_64+0xee/0x500
[    3.572001]  entry_SYSCALL_64_after_hwframe+0x77/0x7f
[    3.572002] 
[    3.572002] Freed by task 91:
[    3.572003]  kasan_save_stack+0x24/0x50
[    3.572004]  kasan_save_track+0x14/0x30
[    3.572005]  kasan_save_free_info+0x3a/0x60
[    3.572007]  __kasan_slab_free+0x43/0x70
[    3.572008]  kfree+0x18e/0x3c0
[    3.572009]  release_nodes+0xbe/0x120
[    3.572011]  devres_release_all+0x127/0x1a0
[    3.572012]  device_unbind_cleanup+0x76/0x260
[    3.572014]  device_release_driver_internal+0x163/0x210
[    3.572015]  bus_remove_device+0x256/0x3e0
[    3.572017]  device_del+0x3a8/0x960
[    3.572019]  platform_device_del.part.0+0x1f/0x1e0
[    3.572020]  platform_device_unregister+0x20/0x40
[    3.572022]  0xffffffffc022008c
[    3.572023]  __x64_sys_delete_module+0x32c/0x4a0
[    3.572025]  do_syscall_64+0xee/0x500
[    3.572026]  entry_SYSCALL_64_after_hwframe+0x77/0x7f
[    3.572027] 
[    3.572028] Last potentially related work creation:
[    3.572028]  kasan_save_stack+0x24/0x50
[    3.572029]  kasan_record_aux_stack+0x89/0xa0
[    3.572031]  insert_work+0x2d/0x240
[    3.572033]  __queue_work+0x44e/0xd70
[    3.572034]  call_timer_fn+0x27/0x210
[    3.572035]  __run_timer_base.part.0+0x3cc/0x900
[    3.572037]  run_timer_softirq+0xd6/0x190
[    3.572039]  handle_softirqs+0x184/0x5c0
[    3.572040]  irq_exit_rcu+0x6e/0x150
[    3.572041]  sysvec_apic_timer_interrupt+0x70/0x80
[    3.572042]  asm_sysvec_apic_timer_interrupt+0x1a/0x20
[    3.572044] 
[    3.572044] Second to last potentially related work creation:
[    3.572045]  kasan_save_stack+0x24/0x50
[    3.572046]  kasan_record_aux_stack+0x89/0xa0
[    3.572047]  insert_work+0x2d/0x240
[    3.572048]  __queue_work+0x44e/0xd70
[    3.572050]  call_timer_fn+0x27/0x210
[    3.572051]  __run_timer_base.part.0+0x3cc/0x900
[    3.572052]  run_timer_softirq+0xd6/0x190
[    3.572054]  handle_softirqs+0x184/0x5c0
[    3.572055]  irq_exit_rcu+0x6e/0x150
[    3.572056]  sysvec_apic_timer_interrupt+0x39/0x80
[    3.572058]  asm_sysvec_apic_timer_interrupt+0x1a/0x20
[    3.572059] 
[    3.572059] The buggy address belongs to the object at ffff888003329000
[    3.572059]  which belongs to the cache kmalloc-1k of size 1024
[    3.572061] The buggy address is located 472 bytes inside of
[    3.572061]  freed 1024-byte region [ffff888003329000, ffff888003329400)
[    3.572062] 
[    3.572063] The buggy address belongs to the physical page:
[    3.572064] page: refcount:0 mapcount:0 mapping:0000000000000000 index:0xffff888003328000 pfn:0x3328
[    3.572066] head: order:3 mapcount:0 entire_mapcount:0 nr_pages_mapped:0 pincount:0
[    3.572067] flags: 0x100000000000240(workingset|head|node=0|zone=1)
[    3.572069] page_type: f5(slab)
[    3.572071] raw: 0100000000000240 ffff888001041dc0 ffff888001040590 ffffea0000110610
[    3.572073] raw: ffff888003328000 000000000010000f 00000000f5000000 0000000000000000
[    3.572075] head: 0100000000000240 ffff888001041dc0 ffff888001040590 ffffea0000110610
[    3.572076] head: ffff888003328000 000000000010000f 00000000f5000000 0000000000000000
[    3.572077] head: 0100000000000003 fffffffffffffe01 00000000ffffffff 00000000ffffffff
[    3.572078] head: 0000000000000000 0000000000000000 00000000ffffffff 0000000000000000
[    3.572078] page dumped because: kasan: bad access detected
[    3.572079] 
[    3.572079] Memory state around the buggy address:
[    3.572080]  ffff888003329080: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
[    3.572081]  ffff888003329100: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
[    3.572082] >ffff888003329180: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
[    3.572083]                                                     ^
[    3.572084]  ffff888003329200: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
[    3.572084]  ffff888003329280: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
[    3.572085] ==================================================================

(The "gpiod_get_value can_sleep" WARNINGs earlier in the boot are a
gpio-sim artifact - simulated chips set can_sleep - and are unrelated
to the bug.  One of the five runs faulted in gpio_vbus_work() itself
instead of __run_timer_base(); same object, same free site.)

Reproducer kit (against the KASAN kernel tree above):

vbus_rig.c:

// SPDX-License-Identifier: GPL-2.0
/*
 * vbus_rig - PoC rig for the gpio-vbus teardown UAF (F-138).
 *
 * Instantiates a "gpio-vbus" platform device wired via a gpiod lookup
 * table to line 0 of a gpio-sim chip labelled "vbus-sim", so the real
 * phy-gpio-vbus-usb platform driver probes it.  Attaches a dummy
 * usb_gadget to phy->otg->gadget so the driver's IRQ handler takes its
 * normal schedule_delayed_work() path (it skips scheduling when no
 * gadget is attached - on real hardware a UDC provides the gadget).
 * rmmod vbus_rig runs the real gpio_vbus_remove() path.  Contains no
 * vulnerable logic itself.
 */
#include <linux/module.h>
#include <linux/platform_device.h>
#include <linux/gpio/machine.h>
#include <linux/usb/phy.h>
#include <linux/usb/gadget.h>
#include <linux/usb/otg.h>

static struct gpiod_lookup_table vbus_lookup = {
	.dev_id = "gpio-vbus.0",
	.table = {
		GPIO_LOOKUP("vbus-sim", 0, "vbus", GPIO_ACTIVE_HIGH),
		{ }
	},
};

static const struct usb_gadget_ops vbus_rig_gadget_ops; /* all NULL */
static struct usb_gadget vbus_rig_gadget = {
	.ops	= (struct usb_gadget_ops *)&vbus_rig_gadget_ops,
	.name	= "vbus_rig",
};

static struct platform_device *vbus_pdev;
static struct usb_phy *rig_phy;

static int __init vbus_rig_init(void)
{
	gpiod_add_lookup_table(&vbus_lookup);
	vbus_pdev = platform_device_register_simple("gpio-vbus", 0, NULL, 0);
	if (IS_ERR(vbus_pdev)) {
		gpiod_remove_lookup_table(&vbus_lookup);
		return PTR_ERR(vbus_pdev);
	}

	rig_phy = usb_get_phy(USB_PHY_TYPE_USB2);
	if (IS_ERR(rig_phy)) {
		pr_err("vbus_rig: no phy found (%ld) - setup broken\n",
		       PTR_ERR(rig_phy));
		goto fail;
	}
	if (!rig_phy->otg) {
		pr_err("vbus_rig: phy has no otg - setup broken\n");
		usb_put_phy(rig_phy);
		goto fail;
	}
	rig_phy->otg->gadget = &vbus_rig_gadget;
	pr_info("vbus_rig: gpio-vbus.0 registered, phy attached\n");
	return 0;

fail:
	platform_device_unregister(vbus_pdev);
	gpiod_remove_lookup_table(&vbus_lookup);
	return -ENODEV;
}

static void __exit vbus_rig_exit(void)
{
	/*
	 * Drop our phy reference first; the driver module stays put via
	 * the bound device.  Keep the gadget attached across the
	 * unregister: the driver's IRQ handler must keep taking its
	 * normal schedule_delayed_work() path all the way through
	 * remove().
	 */
	usb_put_phy(rig_phy);
	platform_device_unregister(vbus_pdev);
	gpiod_remove_lookup_table(&vbus_lookup);
	pr_info("vbus_rig: gpio-vbus.0 unregistered\n");
}

module_init(vbus_rig_init);
module_exit(vbus_rig_exit);
MODULE_LICENSE("GPL");
MODULE_DESCRIPTION("gpio-vbus teardown UAF PoC rig");

Makefile:

obj-m += vbus_rig.o

guest init script (packed into a busybox initramfs with udc-core.ko,
phy-gpio-vbus-usb.ko and vbus_rig.ko):

#!/bin/sh
# PoC init: gpio-vbus teardown re-arm UAF (F-138)
#
# mode=vuln    : kernel has the unpatched gpio_vbus_remove() + a 500ms
#                POC-WITNESS msleep() after cancel_delayed_work_sync().
# mode=fixed   : kernel has the fix (devm_free_irq before the cancel)
#                plus the same witness sleep.
#
# A busy toggler flips the gpio-sim line pull (= VBUS edges) while
# rmmod runs the real remove path.  In vuln mode an edge lands after
# the cancel, re-arms the 100ms debounce work, and the work fires on
# the freed gpio_vbus_data -> KASAN slab-use-after-free.
#
# The toggler prints nothing; the console between "rmmod starts" and
# the verdict carries only kernel output.  If a run comes out clean,
# just run it again (IRQ delivery timing varies).
mount -t proc proc /proc
mount -t sysfs sysfs /sys
mount -t devtmpfs dev /dev
mount -t configfs none /sys/kernel/config

# 1. one-line gpio-sim chip labelled "vbus-sim"
SIM=/sys/kernel/config/gpio-sim/sim0
mkdir -p $SIM/bank0
echo vbus-sim > $SIM/bank0/label
echo 1 > $SIM/bank0/num_lines
echo 1 > $SIM/live
PULL=$(echo /sys/devices/platform/gpio-sim.0/gpiochip*/sim_gpio0/pull)

# 2. load the gadget core, the real driver + rig (probe runs now)
insmod /udc-core.ko || { echo "SETUP FAIL: udc-core"; poweroff -f; }
insmod /phy-gpio-vbus-usb.ko || { echo "SETUP FAIL: phy module"; poweroff -f; }
insmod /vbus_rig.ko || { echo "SETUP FAIL: rig (phy attach broken)"; poweroff -f; }
ls /sys/bus/platform/drivers/gpio-vbus/
grep -i vbus /proc/interrupts || { echo "SETUP FAIL: no vbus irq"; poweroff -f; }

# 3. toggle VBUS edges at max rate, then run the real remove path
( while :; do echo pull-up > $PULL; echo pull-down > $PULL; done ) &
T=$!
sleep 1
echo "=== rmmod vbus_rig: remove path ==="
rmmod vbus_rig
sleep 2
kill $T

# 4. verdict
if dmesg | grep -q 'BUG: KASAN'; then
	echo "=== RESULT: KASAN SPLAT (vuln confirmed) ==="
else
	echo "=== RESULT: clean (no KASAN splat) ==="
fi
poweroff -f

run.sh (QEMU wrapper; its first argument is only a log label, the
vulnerable/fixed state comes from which witness diff was applied at
build time):

#!/bin/bash
# run.sh -- boot the PoC in QEMU.  usage: run.sh <label> [logfile]
#
# NOTE: <label> is only a name for the log; it does NOT switch kernel
# state.  The vulnerable/fixed state comes from which witness diff is
# applied to the kernel tree when the modules and initramfs were last
# built (see README.md: vuln = witness-vuln.diff, fixed =
# witness-fixed.diff).
set -o pipefail
cd "$(dirname "$0")"
K=${KDIR:-$HOME/patternmine/worktrees/vm-hdlc}
MODE=${1:-vuln}
LOG=${2:-/tmp/f138-$MODE.log}

timeout 120 qemu-system-x86_64 -enable-kvm -cpu host -smp 2 -m 1024 \
	-kernel "$K/arch/x86/boot/bzImage" \
	-initrd initramfs.cpio \
	-append "console=ttyS0 loglevel=8 panic_on_oops=0" \
	-nographic -no-reboot 2>&1 | tee "$LOG"

matrix.sh (repeated runs):

#!/bin/bash
# matrix.sh -- run N VMs with the current build, print the tally.
# usage: matrix.sh <N> <label>   (label is only for log naming; the
# vulnerable/fixed state comes from which witness diff was applied at
# build time -- see README.md)
cd "$(dirname "$0")"
N=${1:-5}
MODE=${2:-vuln}
HIT=0
for i in $(seq 1 "$N"); do
	./run.sh "$MODE" "/tmp/f138-matrix-$MODE-$i.log" >/dev/null 2>&1
	if grep -q 'BUG: KASAN' "/tmp/f138-matrix-$MODE-$i.log"; then
		HIT=$((HIT+1))
	elif grep -q 'SETUP FAIL' "/tmp/f138-matrix-$MODE-$i.log"; then
		echo "run $i: SETUP FAIL - do not count"; continue
	fi
	echo "run $i: $(grep -m1 'RESULT' "/tmp/f138-matrix-$MODE-$i.log" | sed 's/.*=== //;s/ ===//')"
done
echo "== $MODE: $HIT/$N KASAN splats =="

witness diff applied to the vulnerable kernel (window widening only,
logic unchanged):

diff --git a/drivers/usb/phy/phy-gpio-vbus-usb.c b/drivers/usb/phy/phy-gpio-vbus-usb.c
index ce09e789afd8..f3e1c3f3b125 100644
--- a/drivers/usb/phy/phy-gpio-vbus-usb.c
+++ b/drivers/usb/phy/phy-gpio-vbus-usb.c
@@ -332,6 +332,12 @@ static void gpio_vbus_remove(struct platform_device *pdev)
 	device_init_wakeup(&pdev->dev, 0);
 	cancel_delayed_work_sync(&gpio_vbus->work);
 
+	/* POC-WITNESS: widen the re-arm window so the reproducer's
+	 * interrupt lands reliably between the cancel and the devm
+	 * release.  Not part of the bug; logic unchanged.
+	 */
+	msleep(500);
+
 	usb_remove_phy(&gpio_vbus->phy);
 }

and for the patched control run, the fix plus the same window:

diff --git a/drivers/usb/phy/phy-gpio-vbus-usb.c b/drivers/usb/phy/phy-gpio-vbus-usb.c
index ce09e789afd8..25e0dcd36b34 100644
--- a/drivers/usb/phy/phy-gpio-vbus-usb.c
+++ b/drivers/usb/phy/phy-gpio-vbus-usb.c
@@ -330,8 +330,15 @@ static void gpio_vbus_remove(struct platform_device *pdev)
 	struct gpio_vbus_data *gpio_vbus = platform_get_drvdata(pdev);
 
 	device_init_wakeup(&pdev->dev, 0);
+
+	devm_free_irq(&pdev->dev, gpio_vbus->irq, pdev);
 	cancel_delayed_work_sync(&gpio_vbus->work);
 
+	/* POC-WITNESS: same artificial window as the vuln run, to show
+	 * the fix closes it.
+	 */
+	msleep(500);
+
 	usb_remove_phy(&gpio_vbus->phy);
 }

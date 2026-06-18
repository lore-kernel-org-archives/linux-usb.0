Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5C563EE1D6;
	Thu, 18 Jun 2026 10:31:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781778685; cv=none; b=PZV2f4Eu5iccPX3UPEAJpOfXyXsNhFp31BEsi/7tf3QiKaIZjQVasV4aWGoBbyuqTg9QpvSJo8LT/I1SjlBbByL3a1XXxutwVqnLrMaR0e7q5biNOGPLNQSD1guEfKi9opCAs5j/YyNbKGYX3hF4M49TAbmMlqUJxmmhsFCGxq4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781778685; c=relaxed/simple;
	bh=ZExVmpqJJOTF2SzP7Wp3BvflZl7cOEZkqGXVKZl1YrA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uLTw8sVxOILtBDjzS25q8O4kDmvidOO1Cc6ss4DeG61KLhdIbQE5REbjhQYLWTD2faZVs/0WnYgOO/bShsp2FNbxfDWDJvnFEoP93UvW9hP1JcGeZeDcCV0MCWt1+cADKx3iZLgJRfWo6HlAlJ6wG9TjKD2J+QDRjg1DA9XhXGY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=0daqihh3; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="0daqihh3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5887A1F000E9;
	Thu, 18 Jun 2026 10:31:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1781778679;
	bh=dYbSQiPv7l/OGFTh2XQKuRySccfha0qxOj/Lg5DWCj4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=0daqihh3dqrxB5uzri4YRnberXMsJIwTzQUPfWklFWJFmUmMk7X2KgTgJsc6uek8L
	 o3MVAEkr4Ns8wQT8+QsWDXTuJ8oxdbgYdx3hrMqTCY7ryP83dUfq2i+1W1pB9zRo54
	 QM7fSIsq1h7jFVnoGJWGQ+3nUyacmR5u99SWTbPs=
Date: Thu, 18 Jun 2026 12:31:33 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Yue Sun <samsun1006219@gmail.com>
Cc: Oliver Neukum <oneukum@suse.com>, Kees Cook <kees@kernel.org>,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	syzkaller@googlegroups.com
Subject: Re: [Bug]KASAN: slab-use-after-free Read in iowarrior_release
Message-ID: <2026061821-wilder-curable-0619@gregkh>
References: <20260618080204.38322-1-samsun1006219@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260618080204.38322-1-samsun1006219@gmail.com>

On Thu, Jun 18, 2026 at 04:02:04PM +0800, Yue Sun wrote:
> Hello,
> 
> I would like to report a use-after-free in the iowarrior USB misc
> driver. The crash was found by local syzkaller testing with USB gadget
> emulation. Although the crash was collected on an older kernel, I also
> confirmed that the same issue is still present on the latest kernel
> commit I checked, 6b5a2b7d9bc1 (v7.1-2765-g6b5a2b7d9bc1).
> 
> Observed kernel/configuration
> =============================
> 
> Relevant config:
> 
>   CONFIG_USB_IOWARRIOR=y
>   CONFIG_USB_RAW_GADGET=y
>   CONFIG_USB_DUMMY_HCD=y
>   CONFIG_KASAN=y
>   CONFIG_KASAN_GENERIC=y
>   CONFIG_PREEMPT=y
> 
> Test environment:
> 
>   QEMU 6.2.0, x86_64, 2 CPUs, 4096 MB RAM
> 
> The following is the raw KASAN report excerpt from the syzkaller crash:
> 
> ==================================================================
> BUG: KASAN: slab-use-after-free in __raw_spin_lock_irqsave include/linux/spinlock_api_smp.h:132 [inline]
> BUG: KASAN: slab-use-after-free in _raw_spin_lock_irqsave+0x3d/0x60 kernel/locking/spinlock.c:166
> Read of size 1 at addr ff110000238d3020 by task syz.0.924/37593
> 
> CPU: 0 UID: 0 PID: 37593 Comm: syz.0.924 Tainted: G             L      7.1.0-rc3-00362-g6916d5703ddf-dirty #35 PREEMPT(full)
> Tainted: [L]=SOFTLOCKUP
> Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.15.0-1 04/01/2014
> Call Trace:
>  <TASK>
>  __dump_stack lib/dump_stack.c:94 [inline]
>  dump_stack_lvl+0x116/0x1b0 lib/dump_stack.c:120
>  print_address_description mm/kasan/report.c:378 [inline]
>  print_report+0xf1/0x5c0 mm/kasan/report.c:482
>  kasan_report+0xca/0x100 mm/kasan/report.c:595
>  __kasan_check_byte+0x3a/0x50 mm/kasan/common.c:574
>  kasan_check_byte include/linux/kasan.h:402 [inline]
>  lock_acquire kernel/locking/lockdep.c:5842 [inline]
>  lock_acquire+0x132/0x360 kernel/locking/lockdep.c:5825
>  __raw_spin_lock_irqsave include/linux/spinlock_api_smp.h:132 [inline]
>  _raw_spin_lock_irqsave+0x3d/0x60 kernel/locking/spinlock.c:166
>  __mutex_unlock_slowpath+0x182/0x880 kernel/locking/mutex.c:1015
>  iowarrior_release+0x231/0x2c0 drivers/usb/misc/iowarrior.c:678
>  __fput+0x402/0xb60 fs/file_table.c:510
>  task_work_run+0x16b/0x260 kernel/task_work.c:233
>  resume_user_mode_work include/linux/resume_user_mode.h:50 [inline]
>  __exit_to_user_mode_loop kernel/entry/common.c:67 [inline]
>  exit_to_user_mode_loop+0x121/0x570 kernel/entry/common.c:98
>  __exit_to_user_mode_prepare include/linux/irq-entry-common.h:207 [inline]
>  syscall_exit_to_user_mode_prepare include/linux/irq-entry-common.h:238 [inline]
>  syscall_exit_to_user_mode include/linux/entry-common.h:318 [inline]
>  do_syscall_64+0x737/0xf80 arch/x86/entry/syscall_64.c:100
>  entry_SYSCALL_64_after_hwframe+0x77/0x7f
> RIP: 0033:0x7f9eb63b561d
> Code: 02 b8 ff ff ff ff c3 66 0f 1f 44 00 00 f3 0f 1e fa 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 a8 ff ff ff f7 d8 64 89 01 48
> RSP: 002b:00007f9eb8356f68 EFLAGS: 00000246 ORIG_RAX: 0000000000000128
> RAX: ffffffffffffffb9 RBX: 00007f9eb76b0020 RCX: 00007f9eb63b561d
> RDX: 0000000000000001 RSI: 0000200000000240 RDI: 0000000000000005
> RBP: 0000000000000056 R08: 0000000000000004 R09: 0000000000000000
> R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000000
> R13: 0000000000000000 R14: 00007f9eb6351640 R15: 00007f9eb8337000
>  </TASK>
> 
> Allocated by task 10489:
>  kasan_save_stack+0x24/0x50 mm/kasan/common.c:57
>  kasan_save_track+0x14/0x30 mm/kasan/common.c:78
>  poison_kmalloc_redzone mm/kasan/common.c:398 [inline]
>  __kasan_kmalloc+0xaa/0xb0 mm/kasan/common.c:415
>  kmalloc_noprof include/linux/slab.h:950 [inline]
>  kzalloc_noprof include/linux/slab.h:1188 [inline]
>  iowarrior_probe+0x87/0x13a0 drivers/usb/misc/iowarrior.c:766
>  usb_probe_interface+0x30e/0xac0 drivers/usb/core/driver.c:396
>  call_driver_probe drivers/base/dd.c:631 [inline]
>  really_probe+0x252/0xb20 drivers/base/dd.c:709
>  __driver_probe_device+0x3d3/0x4f0 drivers/base/dd.c:871
>  driver_probe_device+0x4c/0x1a0 drivers/base/dd.c:901
>  __device_attach_driver+0x1db/0x340 drivers/base/dd.c:1029
>  bus_for_each_drv+0x14b/0x1d0 drivers/base/bus.c:500
>  __device_attach+0x1ee/0x4f0 drivers/base/dd.c:1101
>  device_initial_probe+0xaa/0xc0 drivers/base/dd.c:1156
>  bus_probe_device+0x64/0x150 drivers/base/bus.c:613
>  device_add+0x1169/0x1930 drivers/base/core.c:3706
>  usb_set_configuration+0x1346/0x1e90 drivers/usb/core/message.c:2268
>  usb_generic_driver_probe+0xb7/0x110 drivers/usb/core/generic.c:250
>  usb_probe_device+0xed/0x400 drivers/usb/core/driver.c:291
>  call_driver_probe drivers/base/dd.c:631 [inline]
>  really_probe+0x252/0xb20 drivers/base/dd.c:709
>  __driver_probe_device+0x3d3/0x4f0 drivers/base/dd.c:871
>  driver_probe_device+0x4c/0x1a0 drivers/base/dd.c:901
>  __device_attach_driver+0x1db/0x340 drivers/base/dd.c:1029
>  bus_for_each_drv+0x14b/0x1d0 drivers/base/bus.c:500
>  __device_attach+0x1ee/0x4f0 drivers/base/dd.c:1101
>  device_initial_probe+0xaa/0xc0 drivers/base/dd.c:1156
>  bus_probe_device+0x64/0x150 drivers/base/bus.c:613
>  device_add+0x1169/0x1930 drivers/base/core.c:3706
>  usb_new_device+0xd2c/0x1ac0 drivers/usb/core/hub.c:2695
>  hub_port_connect drivers/usb/core/hub.c:5567 [inline]
>  hub_port_connect_change drivers/usb/core/hub.c:5707 [inline]
>  port_event drivers/usb/core/hub.c:5871 [inline]
>  hub_event+0x2eff/0x5030 drivers/usb/core/hub.c:5953
>  process_one_work+0xc57/0x2240 kernel/workqueue.c:3594
>  process_scheduled_works kernel/workqueue.c:3703 [inline]
>  worker_thread+0x693/0xeb0 kernel/workqueue.c:3784
>  kthread+0x38d/0x4a0 kernel/kthread.c:436
>  ret_from_fork+0xb09/0xdb0 arch/x86/kernel/process.c:158
>  ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245
> 
> Freed by task 48:
>  kasan_save_stack+0x24/0x50 mm/kasan/common.c:57
>  kasan_save_track+0x14/0x30 mm/kasan/common.c:78
>  kasan_save_free_info+0x3b/0x60 mm/kasan/generic.c:584
>  poison_slab_object mm/kasan/common.c:253 [inline]
>  __kasan_slab_free+0x61/0x80 mm/kasan/common.c:285
>  kasan_slab_free include/linux/kasan.h:235 [inline]
>  slab_free_hook mm/slub.c:2689 [inline]
>  slab_free mm/slub.c:6250 [inline]
>  kfree+0x2d6/0x6d0 mm/slub.c:6565
>  iowarrior_delete drivers/usb/misc/iowarrior.c:249 [inline]
>  iowarrior_disconnect+0x210/0x270 drivers/usb/misc/iowarrior.c:921
>  usb_unbind_interface+0x1e8/0x9e0 drivers/usb/core/driver.c:458
>  device_remove drivers/base/dd.c:621 [inline]
>  device_remove+0x125/0x170 drivers/base/dd.c:613
>  __device_release_driver drivers/base/dd.c:1352 [inline]
>  device_release_driver_internal+0x45e/0x630 drivers/base/dd.c:1375
>  bus_remove_device+0x2ba/0x570 drivers/base/bus.c:657
>  device_del+0x396/0x9d0 drivers/base/core.c:3895
>  usb_disable_device+0x35c/0x810 drivers/usb/core/message.c:1478
>  usb_disconnect+0x2df/0xa00 drivers/usb/core/hub.c:2345
>  hub_port_connect drivers/usb/core/hub.c:5407 [inline]
>  hub_port_connect_change drivers/usb/core/hub.c:5707 [inline]
>  port_event drivers/usb/core/hub.c:5871 [inline]
>  hub_event+0x1ece/0x5030 drivers/usb/core/hub.c:5953
>  process_one_work+0xc57/0x2240 kernel/workqueue.c:3594
>  process_scheduled_works kernel/workqueue.c:3703 [inline]
>  worker_thread+0x693/0xeb0 kernel/workqueue.c:3784
>  kthread+0x38d/0x4a0 kernel/kthread.c:436
>  ret_from_fork+0xb09/0xdb0 arch/x86/kernel/process.c:158
>  ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245
> 
> The buggy address belongs to the object at ff110000238d3000
>  which belongs to the cache kmalloc-1k of size 1024
> The buggy address is located 32 bytes inside of
>  freed 1024-byte region [ff110000238d3000, ff110000238d3400)
> 
> Memory state around the buggy address:
>  ff110000238d2f00: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
>  ff110000238d2f80: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
> >ff110000238d3000: fa fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
>                                ^
>  ff110000238d3080: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
>  ff110000238d3100: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
> ==================================================================
> 
> Root cause analysis
> ===================
> 
> iowarrior_open() stores a raw struct iowarrior pointer in
> file->private_data. The object lifetime is controlled only by the
> dev->opened and dev->present state flags. These flags are not sufficient
> to protect the object across the file release path and the USB disconnect
> path.
> 
> In the observed crash, iowarrior_release() is still returning through
> mutex_unlock(&dev->mutex) while iowarrior_disconnect(), running from the
> USB hub worker, observes dev->opened == 0 and frees the same object via
> iowarrior_delete(). KASAN then reports a use-after-free on dev->mutex
> inside __mutex_unlock_slowpath().
> 
> This matches the mutex_unlock() lifetime rule documented in
> kernel/locking/mutex.c:
> 
>   The caller must ensure that the mutex stays alive until this function has
>   returned - mutex_unlock() can NOT directly be used to release an object such
>   that another concurrent task can free it.
>   Mutexes are different from spinlocks & refcounts in this aspect.
> 
> The iowarrior release/disconnect paths can violate this rule because
> iowarrior_disconnect() can free dev while iowarrior_release() is still
> inside mutex_unlock(&dev->mutex).
> 
> One interleaving matching the KASAN report is:
> 
>   CPU 0: close()/__fput()/iowarrior_release()
>   CPU 1: USB hub workqueue/iowarrior_disconnect()
> 
>   CPU 0                                      CPU 1
>   -----                                      -----
>   dev = file->private_data
>   mutex_lock(&dev->mutex)
>   dev->opened = 0
>   if (dev->present) {
>     usb_kill_urb(dev->int_in_urb)
>     wake_up_interruptible(&dev->read_wait)
>     wake_up_interruptible(&dev->write_wait)
>     mutex_unlock(&dev->mutex)
>       enters __mutex_unlock_slowpath()
>       // while still releasing/waking a waiter
>                                              mutex_lock(&dev->mutex)
>                                              dev->present = 0
>                                              if (!dev->opened) {
>                                                mutex_unlock(&dev->mutex)
>                                                iowarrior_delete(dev)
>                                                  kfree(dev)
>                                              }
>       // continues touching dev->mutex
>       KASAN reports UAF in _raw_spin_lock_irqsave()
>       from __mutex_unlock_slowpath()
> 
> The freed-by stack confirms that the object is freed from the asynchronous
> USB disconnect path running as hub_event on a worker thread. Unfortunately,
> I do not have a minimized standalone reproducer yet.
> 
> If you have any questions, please let me know.

Great, can you please submit a patch to fix this?

thanks,

greg k-h

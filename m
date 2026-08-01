Received: from mail-oi1-f206.google.com (mail-oi1-f206.google.com [209.85.167.206])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5587C33F8C5
	for <linux-usb@vger.kernel.org>; Sat,  1 Aug 2026 00:24:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.206
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785543872; cv=none; b=jec+g1+NnxzPKLflV1MLBJ4nrR/GAzKPtMqVjJ5dyZV0oqx64BbjH9oFKjttIjspV0LJqm612Yg7r+if51j3j/uy6hHyuFsNefq3pT0BnYWEED+4uFay9gQs7Db+dC6Qi0MuJDsHU15ow0omjmgZCuLJTWjrvJPPO0L9ODwmYUk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785543872; c=relaxed/simple;
	bh=xGuSoMt/0fmzRrseouhd33NWU3VYiJBfvZQ15/oS6xA=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=K4Vu8RFJrSkSua9mDoRAk3S5rtiGq00sBxcZpZ4ICKo2nguJJX/izh7b+l0i/wAh/n/RCols+85xNkAKGadySdQ4CIpmmCPs4PZxQFTi/9mZHWV9yn/XdU12Rr66RU2vD0TowZT3KC9FJHXbM6i2li6BAXR2xTIw8OWGlYEAKJg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.206
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f206.google.com with SMTP id 5614622812f47-4a7de733fa9so1793386b6e.3
        for <linux-usb@vger.kernel.org>; Fri, 31 Jul 2026 17:24:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785543869; x=1786148669;
        h=content-type:to:from:subject:message-id:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=P9V+IkoJbSXBhrdZDjEQ2Pwb/PNKarUMAWxgcEzEI9s=;
        b=Azrk9BCuXifjeAa/oQqCyF6xTeZjSgoUuxJYwHixhNYGNPKHa1E9GBwrTte1/YOkBy
         9qPhC379CYqGb1lZ9KVGrXXutv5/IZmH9YHgvvwQRmXkbqbP8l5RRA4Es9KbdkOq8T72
         MyrKENrYYCUuJsZoctOJEPfuCl4ljTHfBLq3PrHfuTa0IXQLEHyHKu1t4LW0UImvN9ms
         TKXKBZDc710Go1+8/symvXc4UpyPMjGWZRxpaM1X1+dW143DEdBsSOSqRCo+NAK0Nl+O
         fN6EcHBth0KHUWGlwvofkN4weMhvEJEi0lWyYbjK4hb0MrQUJMlEG/xSajMoFimmAs4G
         zJ1w==
X-Forwarded-Encrypted: i=1; AHgh+RqKdiTJx3yWu0FfODPg6OvGj5dr4bROhvX6U2Bh1VKEcn3MNmW2EtLnuKOrebACz/jrGSPHCpQ7OEk=@vger.kernel.org
X-Gm-Message-State: AOJu0YzMR2U8PFd3LOi860rjc2KmeL8kIGFCtIAEl5BkhyA0voShIxQ/
	xskc+oyYjYCQ3BHlnOt6qaVZfPHR+fTraVyCl6FMZWAbYeRezPTcT/jCjMFSHIwnKvf7fVzo6cu
	8jMTfVk7Mt5VsrfvFH6A/ZVDoV/xv7thKg52PbVwr0KReKSbQj8do73qpabM=
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:d46:b0:495:d7ec:b6ae with SMTP id
 5614622812f47-4af5e337fd4mr3650515b6e.16.1785543869300; Fri, 31 Jul 2026
 17:24:29 -0700 (PDT)
Date: Fri, 31 Jul 2026 17:24:29 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6a6d3cbd.6ce73036.24301b.000c.GAE@google.com>
Subject: [syzbot] [usb?] KASAN: slab-use-after-free Read in vhci_cleanup_unlink_list
From: syzbot <syzbot+f4518ac0a3dd3aafde38@syzkaller.appspotmail.com>
To: gregkh@linuxfoundation.org, i@zenithal.me, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org, shuah@kernel.org, syzkaller-bugs@googlegroups.com, 
	valentina.manea.m@gmail.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    f5098b6bae76 Linux 7.2-rc5
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=1500249e580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=4e38b15c29e6a1d9
dashboard link: https://syzkaller.appspot.com/bug?extid=f4518ac0a3dd3aafde38
compiler:       Debian clang version 22.1.8 (++20260613092233+e80beda6e255-1~exp1~20260613092250.77), Debian LLD 22.1.8
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=1772e449580000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/7d76d25427fa/disk-f5098b6b.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/b2a3f9e7cb3e/vmlinux-f5098b6b.xz
kernel image: https://storage.googleapis.com/syzbot-assets/e4d49cdcd799/bzImage-f5098b6b.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+f4518ac0a3dd3aafde38@syzkaller.appspotmail.com

vhci_hcd vhci_hcd.0: stop threads
vhci_hcd vhci_hcd.0: release socket
==================================================================
BUG: KASAN: slab-use-after-free in vdev_to_vhci_hcd drivers/usb/usbip/vhci.h:171 [inline]
BUG: KASAN: slab-use-after-free in vhci_cleanup_unlink_list+0x452/0x460 drivers/usb/usbip/vhci_hcd.c:985
Read of size 4 at addr ffff88802664c450 by task kworker/u8:2/37

CPU: 0 UID: 0 PID: 37 Comm: kworker/u8:2 Not tainted syzkaller #0 PREEMPT(full) 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 07/16/2026
Workqueue: usbip_event event_handler
Call Trace:
 <TASK>
 dump_stack_lvl+0xe8/0x150 lib/dump_stack.c:120
 print_address_description+0x55/0x1e0 mm/kasan/report.c:378
 print_report+0x58/0x70 mm/kasan/report.c:482
 kasan_report+0x117/0x150 mm/kasan/report.c:595
 vdev_to_vhci_hcd drivers/usb/usbip/vhci.h:171 [inline]
 vhci_cleanup_unlink_list+0x452/0x460 drivers/usb/usbip/vhci_hcd.c:985
 vhci_device_unlink_cleanup drivers/usb/usbip/vhci_hcd.c:1028 [inline]
 vhci_shutdown_connection+0x2af/0x650 drivers/usb/usbip/vhci_hcd.c:1069
 event_handler+0x2a4/0x4b0 drivers/usb/usbip/usbip_event.c:79
 process_one_work kernel/workqueue.c:3322 [inline]
 process_scheduled_works+0xa8e/0x14e0 kernel/workqueue.c:3405
 worker_thread+0xa47/0xfb0 kernel/workqueue.c:3486
 kthread+0x388/0x470 kernel/kthread.c:436
 ret_from_fork+0x514/0xb70 arch/x86/kernel/process.c:158
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245
 </TASK>

Allocated by task 1:
 kasan_save_stack mm/kasan/common.c:57 [inline]
 kasan_save_track+0x3e/0x80 mm/kasan/common.c:78
 poison_kmalloc_redzone mm/kasan/common.c:398 [inline]
 __kasan_kmalloc+0x93/0xb0 mm/kasan/common.c:415
 kasan_kmalloc include/linux/kasan.h:263 [inline]
 __do_kmalloc_node mm/slub.c:5334 [inline]
 __kmalloc_noprof+0x375/0x720 mm/slub.c:5359
 _kmalloc_noprof include/linux/slab.h:992 [inline]
 _kzalloc_noprof include/linux/slab.h:1309 [inline]
 __usb_create_hcd+0x67/0x900 drivers/usb/core/hcd.c:2566
 vhci_hcd_probe+0x104/0x3e0 drivers/usb/usbip/vhci_hcd.c:1378
 platform_probe+0xf9/0x190 drivers/base/platform.c:1439
 call_driver_probe drivers/base/dd.c:-1 [inline]
 really_probe+0x254/0xae0 drivers/base/dd.c:706
 __driver_probe_device+0x1e8/0x360 drivers/base/dd.c:868
 driver_probe_device+0x4f/0x240 drivers/base/dd.c:898
 __device_attach_driver+0x270/0x410 drivers/base/dd.c:1026
 bus_for_each_drv+0x258/0x2f0 drivers/base/bus.c:500
 __device_attach+0x2c4/0x450 drivers/base/dd.c:1098
 device_initial_probe+0xa1/0xd0 drivers/base/dd.c:1153
 bus_probe_device+0x12a/0x220 drivers/base/bus.c:620
 device_add+0x7d7/0xb80 drivers/base/core.c:3772
 platform_device_add+0x4bd/0x860 drivers/base/platform.c:762
 platform_device_register_full+0x62d/0x710 drivers/base/platform.c:902
 vhci_hcd_init+0x227/0x360 drivers/usb/usbip/vhci_hcd.c:1557
 do_one_initcall+0x250/0x870 init/main.c:1347
 do_initcall_level+0x10a/0x1a0 init/main.c:1409
 do_initcalls+0x59/0xa0 init/main.c:1425
 kernel_init_freeable+0x29d/0x3e0 init/main.c:1658
 kernel_init+0x1d/0x1d0 init/main.c:1548
 ret_from_fork+0x514/0xb70 arch/x86/kernel/process.c:158
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245

Freed by task 6051:
 kasan_save_stack mm/kasan/common.c:57 [inline]
 kasan_save_track+0x3e/0x80 mm/kasan/common.c:78
 kasan_save_free_info+0x40/0x50 mm/kasan/generic.c:584
 poison_slab_object mm/kasan/common.c:253 [inline]
 __kasan_slab_free+0x5c/0x80 mm/kasan/common.c:285
 kasan_slab_free include/linux/kasan.h:235 [inline]
 slab_free_hook mm/slub.c:2677 [inline]
 slab_free mm/slub.c:6377 [inline]
 kfree+0x1c5/0x640 mm/slub.c:6692
 vhci_hcd_remove+0xe4/0x110 drivers/usb/usbip/vhci_hcd.c:1434
 device_remove drivers/base/dd.c:616 [inline]
 __device_release_driver drivers/base/dd.c:1349 [inline]
 device_release_driver_internal+0x48b/0x880 drivers/base/dd.c:1372
 unbind_store+0x1a1/0x1d0 drivers/base/bus.c:244
 kernfs_fop_write_iter+0x3a4/0x540 fs/kernfs/file.c:345
 new_sync_write fs/read_write.c:595 [inline]
 vfs_write+0x612/0xba0 fs/read_write.c:687
 ksys_write+0x150/0x270 fs/read_write.c:739
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0x174/0x580 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f

Last potentially related work creation:
 kasan_save_stack+0x3e/0x60 mm/kasan/common.c:57
 kasan_record_aux_stack+0xbd/0xd0 mm/kasan/generic.c:556
 insert_work+0x3d/0x330 kernel/workqueue.c:2226
 __queue_work+0xcd8/0x10a0 kernel/workqueue.c:2401
 queue_work_on+0x106/0x1d0 kernel/workqueue.c:2452
 usb_rh_urb_dequeue drivers/usb/core/hcd.c:845 [inline]
 unlink1+0x344/0x3e0 drivers/usb/core/hcd.c:1580
 usb_hcd_unlink_urb+0xe6/0x1e0 drivers/usb/core/hcd.c:1617
 usb_kill_urb+0x10b/0x2f0 drivers/usb/core/urb.c:716
 hub_quiesce+0x211/0x330 drivers/usb/core/hub.c:1412
 hub_suspend+0x904/0xad0 drivers/usb/core/hub.c:4008
 usb_suspend_interface drivers/usb/core/driver.c:1323 [inline]
 usb_suspend_both+0x285/0x1040 drivers/usb/core/driver.c:1446
 usb_runtime_suspend+0x58/0x110 drivers/usb/core/driver.c:2000
 __rpm_callback+0x2c7/0x950 drivers/base/power/runtime.c:406
 rpm_callback drivers/base/power/runtime.c:460 [inline]
 rpm_suspend+0x8a0/0x17b0 drivers/base/power/runtime.c:698
 __pm_runtime_suspend+0x12f/0x1a0 drivers/base/power/runtime.c:1167
 pm_runtime_put_sync_autosuspend include/linux/pm_runtime.h:740 [inline]
 usb_new_device+0xadf/0x1620 drivers/usb/core/hub.c:2727
 register_root_hub+0x250/0x5c0 drivers/usb/core/hcd.c:990
 usb_add_hcd+0xac7/0xf80 drivers/usb/core/hcd.c:2987
 vhci_hcd_probe+0x141/0x3e0 drivers/usb/usbip/vhci_hcd.c:1388
 platform_probe+0xf9/0x190 drivers/base/platform.c:1439
 call_driver_probe drivers/base/dd.c:-1 [inline]
 really_probe+0x254/0xae0 drivers/base/dd.c:706
 __driver_probe_device+0x1e8/0x360 drivers/base/dd.c:868
 driver_probe_device+0x4f/0x240 drivers/base/dd.c:898
 __device_attach_driver+0x270/0x410 drivers/base/dd.c:1026
 bus_for_each_drv+0x258/0x2f0 drivers/base/bus.c:500
 __device_attach+0x2c4/0x450 drivers/base/dd.c:1098
 device_initial_probe+0xa1/0xd0 drivers/base/dd.c:1153
 bus_probe_device+0x12a/0x220 drivers/base/bus.c:620
 device_add+0x7d7/0xb80 drivers/base/core.c:3772
 platform_device_add+0x4bd/0x860 drivers/base/platform.c:762
 platform_device_register_full+0x62d/0x710 drivers/base/platform.c:902
 vhci_hcd_init+0x227/0x360 drivers/usb/usbip/vhci_hcd.c:1557
 do_one_initcall+0x250/0x870 init/main.c:1347
 do_initcall_level+0x10a/0x1a0 init/main.c:1409
 do_initcalls+0x59/0xa0 init/main.c:1425
 kernel_init_freeable+0x29d/0x3e0 init/main.c:1658
 kernel_init+0x1d/0x1d0 init/main.c:1548
 ret_from_fork+0x514/0xb70 arch/x86/kernel/process.c:158
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245

Second to last potentially related work creation:
 kasan_save_stack+0x3e/0x60 mm/kasan/common.c:57
 kasan_record_aux_stack+0xbd/0xd0 mm/kasan/generic.c:556
 insert_work+0x3d/0x330 kernel/workqueue.c:2226
 __queue_work+0xcd8/0x10a0 kernel/workqueue.c:2401
 queue_work_on+0x106/0x1d0 kernel/workqueue.c:2452
 rh_call_control drivers/usb/core/hcd.c:706 [inline]
 rh_urb_enqueue drivers/usb/core/hcd.c:817 [inline]
 usb_hcd_submit_urb+0xa3b/0x1b60 drivers/usb/core/hcd.c:1538
 usb_start_wait_urb+0x13f/0x5b0 drivers/usb/core/message.c:62
 usb_internal_control_msg drivers/usb/core/message.c:117 [inline]
 usb_control_msg+0x234/0x3e0 drivers/usb/core/message.c:167
 get_port_status drivers/usb/core/hub.c:607 [inline]
 hub_ext_port_status+0x114/0x810 drivers/usb/core/hub.c:624
 usb_hub_port_status drivers/usb/core/hub.c:674 [inline]
 hub_activate+0x740/0x1b20 drivers/usb/core/hub.c:1185
 process_one_work kernel/workqueue.c:3322 [inline]
 process_scheduled_works+0xa8e/0x14e0 kernel/workqueue.c:3405
 worker_thread+0xa47/0xfb0 kernel/workqueue.c:3486
 kthread+0x388/0x470 kernel/kthread.c:436
 ret_from_fork+0x514/0xb70 arch/x86/kernel/process.c:158
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245

The buggy address belongs to the object at ffff88802664c000
 which belongs to the cache kmalloc-8k of size 8192
The buggy address is located 1104 bytes inside of
 freed 8192-byte region [ffff88802664c000, ffff88802664e000)

The buggy address belongs to the physical page:
page: refcount:0 mapcount:0 mapping:0000000000000000 index:0x0 pfn:0x26648
head: order:3 mapcount:0 entire_mapcount:0 nr_pages_mapped:0 pincount:0
flags: 0xfff00000000040(head|node=0|zone=1|lastcpupid=0x7ff)
page_type: f5(slab)
raw: 00fff00000000040 ffff88801b005280 dead000000000122 0000000000000000
raw: 0000000000000000 0000000800020002 00000000f5000000 0000000000000000
head: 00fff00000000040 ffff88801b005280 dead000000000122 0000000000000000
head: 0000000000000000 0000000800020002 00000000f5000000 0000000000000000
head: 00fff00000000003 fffffffffffffe01 00000000ffffffff 00000000ffffffff
head: ffffffffffffffff 0000000000000000 00000000ffffffff 0000000000000008
page dumped because: kasan: bad access detected
page_owner tracks the page as allocated
page last allocated via order 3, migratetype Unmovable, gfp_mask 0xd20c0(__GFP_IO|__GFP_FS|__GFP_NOWARN|__GFP_NORETRY|__GFP_COMP|__GFP_NOMEMALLOC), pid 1, tgid 1 (swapper/0), ts 5903042109, free_ts 0
 set_page_owner include/linux/page_owner.h:32 [inline]
 post_alloc_hook+0x1f9/0x250 mm/page_alloc.c:1859
 prep_new_page mm/page_alloc.c:1867 [inline]
 get_page_from_freelist+0x21fa/0x2270 mm/page_alloc.c:3946
 __alloc_frozen_pages_noprof+0x18d/0x380 mm/page_alloc.c:5304
 alloc_slab_page mm/slub.c:3266 [inline]
 allocate_slab+0x79/0x5e0 mm/slub.c:3380
 new_slab mm/slub.c:3426 [inline]
 refill_objects+0x2d5/0x350 mm/slub.c:7310
 refill_sheaf mm/slub.c:2804 [inline]
 __pcs_replace_empty_main+0x2bf/0x6b0 mm/slub.c:4675
 alloc_from_pcs mm/slub.c:4773 [inline]
 slab_alloc_node mm/slub.c:4905 [inline]
 __do_kmalloc_node mm/slub.c:5333 [inline]
 __kmalloc_noprof+0x485/0x720 mm/slub.c:5359
 _kmalloc_noprof include/linux/slab.h:992 [inline]
 _kzalloc_noprof include/linux/slab.h:1309 [inline]
 scsi_host_alloc+0x30/0x11c0 drivers/scsi/hosts.c:412
 virtscsi_probe+0x217/0x1180 drivers/scsi/virtio_scsi.c:931
 virtio_dev_probe+0xdf6/0x10c0 drivers/virtio/virtio.c:347
 call_driver_probe drivers/base/dd.c:-1 [inline]
 really_probe+0x254/0xae0 drivers/base/dd.c:706
 __driver_probe_device+0x1e8/0x360 drivers/base/dd.c:868
 driver_probe_device+0x4f/0x240 drivers/base/dd.c:898
 __driver_attach+0x339/0x600 drivers/base/dd.c:1292
 bus_for_each_dev+0x23b/0x2c0 drivers/base/bus.c:383
 bus_add_driver+0x345/0x670 drivers/base/bus.c:763
page_owner free stack trace missing

Memory state around the buggy address:
 ffff88802664c300: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
 ffff88802664c380: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
>ffff88802664c400: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
                                                 ^
 ffff88802664c480: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
 ffff88802664c500: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
==================================================================


---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this issue. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.

If the report is already addressed, let syzbot know by replying with:
#syz fix: exact-commit-title

If you want syzbot to run the reproducer, reply with:
#syz test: git://repo/address.git branch-or-commit-hash
If you attach or paste a git patch, syzbot will apply it before testing.

If you want to overwrite report's subsystems, reply with:
#syz set subsystems: new-subsystem
(See the list of subsystem names on the web dashboard)

If the report is a duplicate of another one, reply with:
#syz dup: exact-subject-of-another-report

If you want to undo deduplication, reply with:
#syz undup

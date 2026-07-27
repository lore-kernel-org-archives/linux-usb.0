Received: from mail-oi1-f208.google.com (mail-oi1-f208.google.com [209.85.167.208])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEA693CB56C
	for <linux-usb@vger.kernel.org>; Mon, 27 Jul 2026 19:56:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.208
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785182203; cv=none; b=Z1oF4yqNIlPJ+Dq67QqTUKcbQzfJnwVmoc7eT8TkewPgbP0FixZeRURMGwqZ1f90wR4mDPsfkDmwqVN7mrrFj+121dtRlXH8LmFQ7NC7CvFIFF7BwubfoQxEE7Z+/GMIE3pnBP5K7ORI647gLAqfvM4q1wIqlVezEOLyXIA2XSI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785182203; c=relaxed/simple;
	bh=OejF7urEx6fi5rHgujaXsJqa3K73sQFacqf8sOdXYRE=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=ueoyvN+jgcD13U34GqV0vVJ988KKhOW/DWezKIP9fgbUWfepOV5f0AYHt9Uq5cq2l69V9D15ObUeQY6LNOFv/aBdRArc0EAc3SDM2nxQRCtjgBAGE/rOQYSv9l17IKpt/nlwanaw+nfML41RYITyh3Uzc3Kiavrm4aaJJPyQ3IU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.208
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f208.google.com with SMTP id 5614622812f47-495b8b30310so4220701b6e.1
        for <linux-usb@vger.kernel.org>; Mon, 27 Jul 2026 12:56:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785182200; x=1785787000;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=N4uEZzUeSpl5X8VLPcVbObuW12/Ujw7zQJ/fMctxC7o=;
        b=eANbh+8mWYVqs1JY7CNELd5RsRHYEypOoZ3dXheovxqQvSQuAVolMJ1xne1vt0zq8c
         S2B9wMU9pDit+lfG540WjTLCc2HjkIogqGfeQUK1S84qJt4OPngaG53jBTlk9VFx+Kek
         2U6LfBGgEYxIwuHm92MGbbb/xfIAxQQpq4AaJbMypL0E9TbcwGV4MCC9rmFJogWy2Y3T
         AJmYdqiTTnx0NxfmGaV/4GYdw8yYQvIl4GXHUbLwaJRKwrmJfYnq/7iJY+DMuu5ji9lw
         7g4FM3HDRI6bSFGoOQRkY+wxn1DyaaeYdGocBwdZIh5Gw1/QNMPvcKMciBQg01FnG+gD
         n4Jw==
X-Forwarded-Encrypted: i=1; AHgh+Rpp1ZCdREnCIRMAEPRenykwvSClrHo5ldprRPsA+B3RYsBpFXMly85KsPZoFCfR2B8wynx5sCUvEmI=@vger.kernel.org
X-Gm-Message-State: AOJu0YzdyQJmiszxgmKBa1oqAJcOdhsNeD7kRJ8aTS0NANr55f9P/JuZ
	+lMF2LMB8kGrTqb2bmqfRiElcztIYgNuxAV6oDmUHIXUz+iM3rT/f+O0O2KSv0fYagWotiJFYvL
	98UaOxCcs2/8tt6xO7/PJdLjvEy6QZnHbreoJWxwaKduXzRPdhpK0hMCkdxk=
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:1797:b0:497:d3d6:6a40 with SMTP id
 5614622812f47-4ab69f50fd5mr8988957b6e.3.1785182200657; Mon, 27 Jul 2026
 12:56:40 -0700 (PDT)
Date: Mon, 27 Jul 2026 12:56:40 -0700
In-Reply-To: <696f6807.050a0220.4cb9c.0010.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6a67b7f8.a2ea2cc8.fbad6.0057.GAE@google.com>
Subject: Re: [syzbot] [usb?] KASAN: slab-use-after-free Read in event_handler
From: syzbot <syzbot+62c1aa73226b3ac3b107@syzkaller.appspotmail.com>
To: gregkh@linuxfoundation.org, halves@igalia.com, i@zenithal.me, 
	kernel-dev@igalia.org, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org, nobuo.iwata@fujixerox.co.jp, shuah@kernel.org, 
	stable@kernel.org, syzkaller-bugs@googlegroups.com, 
	valentina.manea.m@gmail.com
Content-Type: text/plain; charset="UTF-8"

syzbot has found a reproducer for the following issue on:

HEAD commit:    f5098b6bae76 Linux 7.2-rc5
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=16fa67b1580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=145fa60d73086782
dashboard link: https://syzkaller.appspot.com/bug?extid=62c1aa73226b3ac3b107
compiler:       gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=13ce7fde580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=179c16b9580000

Downloadable assets:
disk image (non-bootable): https://storage.googleapis.com/syzbot-assets/d900f083ada3/non_bootable_disk-f5098b6b.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/5cb9b4ace7bc/vmlinux-f5098b6b.xz
kernel image: https://storage.googleapis.com/syzbot-assets/2b85acfa194b/bzImage-f5098b6b.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+62c1aa73226b3ac3b107@syzkaller.appspotmail.com

vhci_hcd vhci_hcd.0: disconnect device
==================================================================
BUG: KASAN: slab-use-after-free in __raw_spin_lock_irqsave include/linux/spinlock_api_smp.h:132 [inline]
BUG: KASAN: slab-use-after-free in _raw_spin_lock_irqsave+0x3a/0x60 kernel/locking/spinlock.c:166
Read of size 1 at addr ffff8880551a94a8 by task kworker/u32:2/5599

CPU: 2 UID: 0 PID: 5599 Comm: kworker/u32:2 Not tainted syzkaller #0 PREEMPT(full) 
Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.3-debian-1.16.3-2 04/01/2014
Workqueue: usbip_event event_handler
Call Trace:
 <TASK>
 __dump_stack lib/dump_stack.c:94 [inline]
 dump_stack_lvl+0x100/0x190 lib/dump_stack.c:120
 print_address_description mm/kasan/report.c:378 [inline]
 print_report+0x13d/0x4b0 mm/kasan/report.c:482
 kasan_report+0xdf/0x1c0 mm/kasan/report.c:595
 __kasan_check_byte+0x36/0x50 mm/kasan/common.c:574
 kasan_check_byte include/linux/kasan.h:402 [inline]
 lock_acquire kernel/locking/lockdep.c:5842 [inline]
 lock_acquire+0x132/0x370 kernel/locking/lockdep.c:5825
 __raw_spin_lock_irqsave include/linux/spinlock_api_smp.h:132 [inline]
 _raw_spin_lock_irqsave+0x3a/0x60 kernel/locking/spinlock.c:166
 unset_event drivers/usb/usbip/usbip_event.c:35 [inline]
 event_handler+0x21e/0x570 drivers/usb/usbip/usbip_event.c:80
 process_one_work+0xa23/0x1940 kernel/workqueue.c:3322
 process_scheduled_works kernel/workqueue.c:3405 [inline]
 worker_thread+0x5ef/0xe50 kernel/workqueue.c:3486
 kthread+0x370/0x450 kernel/kthread.c:436
 ret_from_fork+0x72b/0xd50 arch/x86/kernel/process.c:158
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245
 </TASK>

Allocated by task 13421:
 kasan_save_stack+0x30/0x50 mm/kasan/common.c:57
 kasan_save_track+0x14/0x30 mm/kasan/common.c:78
 poison_kmalloc_redzone mm/kasan/common.c:398 [inline]
 __kasan_kmalloc+0xaa/0xb0 mm/kasan/common.c:415
 kasan_kmalloc include/linux/kasan.h:263 [inline]
 __do_kmalloc_node mm/slub.c:5334 [inline]
 __kmalloc_noprof+0x322/0x820 mm/slub.c:5359
 _kmalloc_noprof include/linux/slab.h:992 [inline]
 _kzalloc_noprof include/linux/slab.h:1309 [inline]
 __usb_create_hcd+0x5e/0xac0 drivers/usb/core/hcd.c:2566
 vhci_hcd_probe+0xf3/0x4e0 drivers/usb/usbip/vhci_hcd.c:1378
 platform_probe+0x106/0x1d0 drivers/base/platform.c:1439
 call_driver_probe drivers/base/dd.c:628 [inline]
 really_probe+0x241/0xa60 drivers/base/dd.c:706
 __driver_probe_device+0x20e/0x450 drivers/base/dd.c:868
 device_driver_attach+0xd1/0x220 drivers/base/dd.c:1203
 bind_store+0xf4/0x190 drivers/base/bus.c:267
 drv_attr_store+0x74/0xb0 drivers/base/bus.c:125
 sysfs_kf_write+0xf2/0x150 fs/sysfs/file.c:145
 kernfs_fop_write_iter+0x3e0/0x5f0 fs/kernfs/file.c:345
 new_sync_write fs/read_write.c:595 [inline]
 vfs_write+0x6ac/0x1050 fs/read_write.c:687
 ksys_write+0x12a/0x250 fs/read_write.c:739
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0x115/0x870 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f

Freed by task 13423:
 kasan_save_stack+0x30/0x50 mm/kasan/common.c:57
 kasan_save_track+0x14/0x30 mm/kasan/common.c:78
 kasan_save_free_info+0x3b/0x70 mm/kasan/generic.c:584
 poison_slab_object mm/kasan/common.c:253 [inline]
 __kasan_slab_free+0x5f/0x80 mm/kasan/common.c:285
 kasan_slab_free include/linux/kasan.h:235 [inline]
 slab_free_hook mm/slub.c:2677 [inline]
 slab_free mm/slub.c:6377 [inline]
 kfree+0x22b/0x6c0 mm/slub.c:6692
 hcd_release drivers/usb/core/hcd.c:2690 [inline]
 kref_put include/linux/kref.h:65 [inline]
 usb_put_hcd drivers/usb/core/hcd.c:2704 [inline]
 usb_put_hcd+0x149/0x1f0 drivers/usb/core/hcd.c:2701
 vhci_hcd_remove+0x107/0x1b0 drivers/usb/usbip/vhci_hcd.c:1434
 platform_remove+0x5f/0x80 drivers/base/platform.c:1456
 device_remove+0xcb/0x180 drivers/base/dd.c:616
 __device_release_driver drivers/base/dd.c:1349 [inline]
 device_release_driver_internal+0x44e/0x620 drivers/base/dd.c:1372
 unbind_store+0xf8/0x110 drivers/base/bus.c:244
 drv_attr_store+0x74/0xb0 drivers/base/bus.c:125
 sysfs_kf_write+0xf2/0x150 fs/sysfs/file.c:145
 kernfs_fop_write_iter+0x3e0/0x5f0 fs/kernfs/file.c:345
 new_sync_write fs/read_write.c:595 [inline]
 vfs_write+0x6ac/0x1050 fs/read_write.c:687
 ksys_write+0x12a/0x250 fs/read_write.c:739
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0x115/0x870 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f

Last potentially related work creation:
 kasan_save_stack+0x30/0x50 mm/kasan/common.c:57
 kasan_record_aux_stack+0xa7/0xc0 mm/kasan/generic.c:556
 insert_work+0x36/0x230 kernel/workqueue.c:2226
 __queue_work+0x9bc/0x12b0 kernel/workqueue.c:2401
 queue_work_on+0x1a9/0x1e0 kernel/workqueue.c:2452
 queue_work include/linux/workqueue.h:699 [inline]
 usb_hcd_giveback_urb+0x330/0x4a0 drivers/usb/core/hcd.c:1758
 usb_rh_urb_dequeue drivers/usb/core/hcd.c:845 [inline]
 unlink1+0x418/0x510 drivers/usb/core/hcd.c:1580
 usb_hcd_unlink_urb+0x131/0x210 drivers/usb/core/hcd.c:1617
 usb_kill_urb drivers/usb/core/urb.c:716 [inline]
 usb_kill_urb+0x121/0x320 drivers/usb/core/urb.c:703
 hub_quiesce+0x1e9/0x320 drivers/usb/core/hub.c:1412
 hub_suspend+0x4ab/0x9e0 drivers/usb/core/hub.c:4008
 usb_suspend_interface drivers/usb/core/driver.c:1323 [inline]
 usb_suspend_both+0x288/0x950 drivers/usb/core/driver.c:1446
 usb_runtime_suspend+0x49/0x120 drivers/usb/core/driver.c:2000
 __rpm_callback+0xc8/0x620 drivers/base/power/runtime.c:406
 rpm_callback+0x16a/0x1b0 drivers/base/power/runtime.c:460
 rpm_suspend+0x2f4/0x11a0 drivers/base/power/runtime.c:698
 __pm_runtime_suspend+0xba/0x1a0 drivers/base/power/runtime.c:1167
 pm_runtime_put_sync_autosuspend include/linux/pm_runtime.h:740 [inline]
 usb_new_device.cold+0xd61/0x115c drivers/usb/core/hub.c:2727
 register_root_hub+0x4e6/0x639 drivers/usb/core/hcd.c:990
 usb_add_hcd.cold+0xccd/0x1158 drivers/usb/core/hcd.c:2987
 vhci_hcd_probe+0x14b/0x4e0 drivers/usb/usbip/vhci_hcd.c:1388
 platform_probe+0x106/0x1d0 drivers/base/platform.c:1439
 call_driver_probe drivers/base/dd.c:628 [inline]
 really_probe+0x241/0xa60 drivers/base/dd.c:706
 __driver_probe_device+0x20e/0x450 drivers/base/dd.c:868
 device_driver_attach+0xd1/0x220 drivers/base/dd.c:1203
 bind_store+0xf4/0x190 drivers/base/bus.c:267
 drv_attr_store+0x74/0xb0 drivers/base/bus.c:125
 sysfs_kf_write+0xf2/0x150 fs/sysfs/file.c:145
 kernfs_fop_write_iter+0x3e0/0x5f0 fs/kernfs/file.c:345
 new_sync_write fs/read_write.c:595 [inline]
 vfs_write+0x6ac/0x1050 fs/read_write.c:687
 ksys_write+0x12a/0x250 fs/read_write.c:739
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0x115/0x870 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f

Second to last potentially related work creation:
 kasan_save_stack+0x30/0x50 mm/kasan/common.c:57
 kasan_record_aux_stack+0xa7/0xc0 mm/kasan/generic.c:556
 insert_work+0x36/0x230 kernel/workqueue.c:2226
 __queue_work+0x9bc/0x12b0 kernel/workqueue.c:2401
 queue_work_on+0x1a9/0x1e0 kernel/workqueue.c:2452
 queue_work include/linux/workqueue.h:699 [inline]
 usb_hcd_giveback_urb+0x3b8/0x4a0 drivers/usb/core/hcd.c:1760
 rh_call_control drivers/usb/core/hcd.c:706 [inline]
 rh_urb_enqueue drivers/usb/core/hcd.c:817 [inline]
 usb_hcd_submit_urb+0xab7/0x2150 drivers/usb/core/hcd.c:1538
 usb_submit_urb+0x827/0x19b0 drivers/usb/core/urb.c:586
 usb_start_wait_urb+0x10e/0x580 drivers/usb/core/message.c:62
 usb_internal_control_msg drivers/usb/core/message.c:117 [inline]
 usb_control_msg+0x328/0x4b0 drivers/usb/core/message.c:167
 get_port_status drivers/usb/core/hub.c:607 [inline]
 hub_ext_port_status+0x152/0x600 drivers/usb/core/hub.c:624
 usb_hub_port_status drivers/usb/core/hub.c:674 [inline]
 hub_activate+0x6e5/0x1c40 drivers/usb/core/hub.c:1185
 process_one_work+0xa23/0x1940 kernel/workqueue.c:3322
 process_scheduled_works kernel/workqueue.c:3405 [inline]
 worker_thread+0x5ef/0xe50 kernel/workqueue.c:3486
 kthread+0x370/0x450 kernel/kthread.c:436
 ret_from_fork+0x72b/0xd50 arch/x86/kernel/process.c:158
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245

The buggy address belongs to the object at ffff8880551a8000
 which belongs to the cache kmalloc-8k of size 8192
The buggy address is located 5288 bytes inside of
 freed 8192-byte region [ffff8880551a8000, ffff8880551aa000)

The buggy address belongs to the physical page:
page: refcount:0 mapcount:0 mapping:0000000000000000 index:0x0 pfn:0x551a8
head: order:3 mapcount:0 entire_mapcount:0 nr_pages_mapped:0 pincount:0
flags: 0xfff00000000040(head|node=0|zone=1|lastcpupid=0x7ff)
page_type: f5(slab)
raw: 00fff00000000040 ffff88801bc43180 dead000000000100 dead000000000122
raw: 0000000000000000 0000000800020002 00000000f5000000 0000000000000000
head: 00fff00000000040 ffff88801bc43180 dead000000000100 dead000000000122
head: 0000000000000000 0000000800020002 00000000f5000000 0000000000000000
head: 00fff00000000003 fffffffffffffe01 00000000ffffffff 00000000ffffffff
head: ffffffffffffffff 0000000000000000 00000000ffffffff 0000000000000008
page dumped because: kasan: bad access detected
page_owner tracks the page as allocated
page last allocated via order 3, migratetype Unmovable, gfp_mask 0xd20c0(__GFP_IO|__GFP_FS|__GFP_NOWARN|__GFP_NORETRY|__GFP_COMP|__GFP_NOMEMALLOC), pid 13322, tgid 13320 (syz.1.2421), ts 499968291131, free_ts 263312866515
 set_page_owner include/linux/page_owner.h:32 [inline]
 post_alloc_hook+0xfd/0x120 mm/page_alloc.c:1859
 prep_new_page mm/page_alloc.c:1867 [inline]
 get_page_from_freelist+0xf48/0x3530 mm/page_alloc.c:3946
 __alloc_frozen_pages_noprof+0x299/0x2dc0 mm/page_alloc.c:5304
 alloc_slab_page mm/slub.c:3266 [inline]
 allocate_slab mm/slub.c:3380 [inline]
 new_slab+0xa2/0x640 mm/slub.c:3426
 refill_objects+0xe3/0x410 mm/slub.c:7310
 refill_sheaf mm/slub.c:2804 [inline]
 __pcs_replace_empty_main+0x376/0x680 mm/slub.c:4675
 alloc_from_pcs mm/slub.c:4773 [inline]
 slab_alloc_node mm/slub.c:4905 [inline]
 __do_kmalloc_node mm/slub.c:5333 [inline]
 __kmalloc_noprof+0x66d/0x820 mm/slub.c:5359
 _kmalloc_noprof include/linux/slab.h:992 [inline]
 _kzalloc_noprof include/linux/slab.h:1309 [inline]
 __usb_create_hcd+0x5e/0xac0 drivers/usb/core/hcd.c:2566
 vhci_hcd_probe+0x1a5/0x4e0 drivers/usb/usbip/vhci_hcd.c:1394
 platform_probe+0x106/0x1d0 drivers/base/platform.c:1439
 call_driver_probe drivers/base/dd.c:628 [inline]
 really_probe+0x241/0xa60 drivers/base/dd.c:706
 __driver_probe_device+0x20e/0x450 drivers/base/dd.c:868
 device_driver_attach+0xd1/0x220 drivers/base/dd.c:1203
 bind_store+0xf4/0x190 drivers/base/bus.c:267
 drv_attr_store+0x74/0xb0 drivers/base/bus.c:125
 sysfs_kf_write+0xf2/0x150 fs/sysfs/file.c:145
page last free pid 37 tgid 37 stack trace:
 reset_page_owner include/linux/page_owner.h:25 [inline]
 __free_pages_prepare mm/page_alloc.c:1406 [inline]
 __free_frozen_pages+0x79f/0x1090 mm/page_alloc.c:2950
 qlink_free mm/kasan/quarantine.c:163 [inline]
 qlist_free_all+0x47/0xf0 mm/kasan/quarantine.c:179
 kasan_quarantine_reduce+0x1a0/0x1f0 mm/kasan/quarantine.c:286
 __kasan_slab_alloc+0x69/0x90 mm/kasan/common.c:350
 kasan_slab_alloc include/linux/kasan.h:253 [inline]
 slab_post_alloc_hook mm/slub.c:4584 [inline]
 slab_alloc_node mm/slub.c:4917 [inline]
 kmem_cache_alloc_noprof+0x26b/0x6a0 mm/slub.c:4931
 alloc_filename fs/namei.c:147 [inline]
 do_getname_kernel+0x5d/0x250 fs/namei.c:266
 getname_kernel fs/namei.c:289 [inline]
 class_filename_kernel_constructor include/linux/fs.h:2565 [inline]
 start_removing_path+0x8a/0x350 fs/namei.c:2964
 handle_remove drivers/base/devtmpfs.c:325 [inline]
 handle drivers/base/devtmpfs.c:386 [inline]
 devtmpfs_work_loop+0x5c4/0xae4 drivers/base/devtmpfs.c:399
 devtmpfsd+0x3f/0x50 drivers/base/devtmpfs.c:441
 kthread+0x370/0x450 kernel/kthread.c:436
 ret_from_fork+0x72b/0xd50 arch/x86/kernel/process.c:158
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245

Memory state around the buggy address:
 ffff8880551a9380: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
 ffff8880551a9400: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
>ffff8880551a9480: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
                                  ^
 ffff8880551a9500: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
 ffff8880551a9580: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
==================================================================


---
If you want syzbot to run the reproducer, reply with:
#syz test: git://repo/address.git branch-or-commit-hash
If you attach or paste a git patch, syzbot will apply it before testing.

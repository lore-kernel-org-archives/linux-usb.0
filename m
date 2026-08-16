Received: from mail-oo1-f71.google.com (mail-oo1-f71.google.com [209.85.161.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A749B351C2E
	for <linux-usb@vger.kernel.org>; Sun, 16 Aug 2026 16:12:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.71
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786896751; cv=none; b=P5eLgwNnFPwDO71COKsxn/v9LNDy/am3CmOgDioG5C9Ls21QgZWKmXZyOLE4HKoiRnCXoWf0YiEaajGATIraoJ1phtoO7B+hWujXPxKxRQiguM7wR6YwhxXnr9X/Z7NdnMJ4aqF5FjZQRTDYSaZZBxGW65BDs7W+svDcypaAlhk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786896751; c=relaxed/simple;
	bh=SPPGxlHgl+d1tSfrZbhkrT+ab2jP9G3XtkDEMMnKiRM=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=HUFIti9SSpMnJLv0qZW4IKxE0HI1+Fs6uSljAeG0dufuHbBypQ80+zuHgEtSQKtg7hHcmZ9nkcxeTqTxik9/RsCvYIA70Jugz7yxK8u5BAHPCMBwGRAmVbjyobY9ji6+2GSzwJqfa1pYDAsAMWKiD5YvKQcSKRr1Hf8vf+IOnJk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.161.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oo1-f71.google.com with SMTP id 006d021491bc7-6b0597e2448so2420816eaf.1
        for <linux-usb@vger.kernel.org>; Sun, 16 Aug 2026 09:12:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786896748; x=1787501548;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=g2hw1bv8Su7LtMJMUhHwfpQqSg+5B1Z710ZHvFmenBU=;
        b=HYXIH4j/YJh92QxT/wX/cSlWlqScqrysqnJ98+ASXmwPKjfpb8d7W6Y+UEzyf5qTH3
         uNfKyyJrOF9SH7awFAnu2tTLh0ZD1B/Iaa3HK3QfHzoSwWohe+U8uoEiEz6NKJbXRsOH
         2PE4CF42U9OuV5n4pHRbKsMvIvULGMipJ9Wbnrqc8c6+pe94hhuipvCV8eNxuW94whuU
         WyBDft/1vabFRTGG+2/4+alXE9pS65HouOWRq6AQGVPCYCWst/AMSljw6A1+2vc714tX
         j1kqepnmwUP9K6+LC7qTjgY/JRdm/oL3Vo9d1SEai8Ibdyyd9TsaM0KqF97W2wUHxDZr
         tNEg==
X-Forwarded-Encrypted: i=1; AHgh+RoVCbhcYjjXvovoQBxOrWx4BdbDqRvUoXH7wVk+rUl51fGHTR9sPQEYIKOKRt7c2zgwPHoD53cHbVM=@vger.kernel.org
X-Gm-Message-State: AOJu0YygSJt3E1nLo3xOE00pdecKyeFwM5ncFkEnynuTzeDAtufeWwfO
	fK1s1rvMHUmmGHa45aj+RG95VOiOaARDvF1hYxPQLQM8iVROL3ATXB3sZuYPQJqmMHRKb7R6n9E
	SZPOngaXB4gQB6zyaT42a84s4RKTe+6G6KJbhFSyhArLYPR8eMtfUsYc6CTk=
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:824:b0:6ae:33fb:4556 with SMTP id
 006d021491bc7-6b0d613f35cmr18118929eaf.8.1786896748627; Sun, 16 Aug 2026
 09:12:28 -0700 (PDT)
Date: Sun, 16 Aug 2026 09:12:28 -0700
In-Reply-To: <6a7e6fb9.ec5dc6cc.21cb3f.00c0.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6a81e16c.f7a79266.2f965f.0016.GAE@google.com>
Subject: Re: [syzbot] [usb?] KASAN: slab-use-after-free Read in usa49_glocont_callback
From: syzbot <syzbot+e5e28c3e953b2eebb16e@syzkaller.appspotmail.com>
To: gregkh@linuxfoundation.org, johan@kernel.org, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

syzbot has found a reproducer for the following issue on:

HEAD commit:    3eb40771c00a Merge tag 'soc-fixes-7.2-3' of git://git.kern..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=146196c6580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=1d67342c314f228d
dashboard link: https://syzkaller.appspot.com/bug?extid=e5e28c3e953b2eebb16e
compiler:       gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=158a5a79580000

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+e5e28c3e953b2eebb16e@syzkaller.appspotmail.com

==================================================================
BUG: KASAN: slab-use-after-free in usa49_glocont_callback+0x232/0x260 drivers/usb/serial/keyspan.c:1045
Read of size 4 at addr ffff88801fe9c9b0 by task syz-executor414/6031

CPU: 0 UID: 0 PID: 6031 Comm: syz-executor414 Not tainted syzkaller #0 PREEMPT(full) 
Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.3-debian-1.16.3-2 04/01/2014
Call Trace:
 <IRQ>
 __dump_stack lib/dump_stack.c:94 [inline]
 dump_stack_lvl+0x100/0x190 lib/dump_stack.c:120
 print_address_description mm/kasan/report.c:378 [inline]
 print_report+0x13d/0x4b0 mm/kasan/report.c:482
 kasan_report+0xdf/0x1c0 mm/kasan/report.c:595
 usa49_glocont_callback+0x232/0x260 drivers/usb/serial/keyspan.c:1045
 __usb_hcd_giveback_urb+0x38d/0x610 drivers/usb/core/hcd.c:1657
 usb_hcd_giveback_urb+0x3ca/0x4a0 drivers/usb/core/hcd.c:1741
 dummy_timer+0xdb2/0x36f0 drivers/usb/gadget/udc/dummy_hcd.c:2019
 __run_hrtimer kernel/time/hrtimer.c:2032 [inline]
 __hrtimer_run_queues+0x462/0x9c0 kernel/time/hrtimer.c:2096
 hrtimer_run_softirq+0x17d/0x2c0 kernel/time/hrtimer.c:2113
 handle_softirqs+0x1ea/0x9b0 kernel/softirq.c:622
 __do_softirq kernel/softirq.c:656 [inline]
 invoke_softirq kernel/softirq.c:496 [inline]
 __irq_exit_rcu+0x162/0x210 kernel/softirq.c:735
 irq_exit_rcu+0x9/0x30 kernel/softirq.c:752
 instr_sysvec_apic_timer_interrupt arch/x86/kernel/apic/apic.c:1062 [inline]
 sysvec_apic_timer_interrupt+0xa3/0xc0 arch/x86/kernel/apic/apic.c:1062
 </IRQ>
 <TASK>
 asm_sysvec_apic_timer_interrupt+0x1a/0x20 arch/x86/include/asm/idtentry.h:674
RIP: 0010:console_flush_one_record+0xac3/0xe50 kernel/printk/printk.c:3270
Code: 00 e8 91 26 2a 00 9c 5d 81 e5 00 02 00 00 31 ff 48 89 ee e8 df d1 21 00 48 85 ed 0f 85 d7 01 00 00 e8 31 d7 21 00 fb 4c 89 e8 <48> c1 e8 03 42 80 3c 38 00 0f 85 64 03 00 00 48 8b 0c 24 48 8b 6b
RSP: 0018:ffffc900034a7310 EFLAGS: 00000293
RAX: ffffffff8fbaca18 RBX: ffffffff8fbac9c0 RCX: ffffffff81e89c41
RDX: ffff88802bbd4a80 RSI: ffffffff81e89c4f RDI: ffff88802bbd4a80
RBP: 0000000000000000 R08: 0000000000000007 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000000 R12: 0000000000000d63
R13: ffffffff8fbaca18 R14: ffffc900034a7390 R15: dffffc0000000000
 console_flush_all kernel/printk/printk.c:3343 [inline]
 __console_flush_and_unlock kernel/printk/printk.c:3373 [inline]
 console_unlock+0x103/0x260 kernel/printk/printk.c:3413
 vprintk_emit+0x407/0x6b0 kernel/printk/printk.c:2479
 dev_vprintk_emit+0x391/0x3e0 drivers/base/core.c:4996
 dev_printk_emit+0xd2/0x10d drivers/base/core.c:5007
 __dev_printk+0xcb/0x100 drivers/base/core.c:5019
 _dev_info+0xef/0x127 drivers/base/core.c:5065
 usb_serial_device_remove.cold+0x34/0xb8 drivers/usb/serial/bus.c:99
 device_remove+0xcb/0x180 drivers/base/dd.c:616
 __device_release_driver drivers/base/dd.c:1349 [inline]
 device_release_driver_internal+0x44e/0x620 drivers/base/dd.c:1372
 bus_remove_device+0x2bc/0x560 drivers/base/bus.c:664
 device_del+0x376/0x9b0 drivers/base/core.c:3961
 usb_serial_disconnect+0x21e/0x490 drivers/usb/serial/usb-serial.c:1195
 usb_unbind_interface+0x1dd/0x9e0 drivers/usb/core/driver.c:458
 device_remove drivers/base/dd.c:618 [inline]
 device_remove+0x12a/0x180 drivers/base/dd.c:610
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
RIP: 0033:0x7fe5f5fe8e1e
Code: 08 0f 85 f5 e2 ff ff 49 89 fb 48 89 f0 48 89 d7 48 89 ce 4c 89 c2 4d 89 ca 4c 8b 44 24 08 4c 8b 4c 24 10 4c 89 5c 24 08 0f 05 <c3> 90 41 57 41 56 4d 89 c6 41 55 4d 89 cd 41 54 55 53 48 83 ec 08
RSP: 002b:00007fffdd685de8 EFLAGS: 00000246 ORIG_RAX: 0000000000000001
RAX: ffffffffffffffda RBX: 0000555562386400 RCX: 00007fe5f5fe8e1e
RDX: 0000000000000007 RSI: 00007fffdd685f80 RDI: 0000000000000005
RBP: 00000013c52a7a0a R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 00007fffdd685e70
R13: 0000000000000006 R14: 00007fffdd685f80 R15: 0000000000000004
 </TASK>

Allocated by task 6031:
 kasan_save_stack+0x30/0x50 mm/kasan/common.c:57
 kasan_save_track+0x14/0x30 mm/kasan/common.c:78
 poison_kmalloc_redzone mm/kasan/common.c:398 [inline]
 __kasan_kmalloc+0xaa/0xb0 mm/kasan/common.c:415
 kasan_kmalloc include/linux/kasan.h:263 [inline]
 __kmalloc_cache_noprof+0x2e5/0x6c0 mm/slub.c:5489
 _kmalloc_noprof include/linux/slab.h:988 [inline]
 _kzalloc_noprof include/linux/slab.h:1309 [inline]
 keyspan_port_probe+0xbc/0xdd0 drivers/usb/serial/keyspan.c:2891
 usb_serial_device_probe+0x106/0x3e0 drivers/usb/serial/bus.c:47
 call_driver_probe drivers/base/dd.c:628 [inline]
 really_probe+0x241/0xa60 drivers/base/dd.c:706
 __driver_probe_device+0x20e/0x450 drivers/base/dd.c:868
 driver_probe_device+0x4a/0x140 drivers/base/dd.c:898
 __device_attach_driver+0x1df/0x320 drivers/base/dd.c:1026
 bus_for_each_drv+0x159/0x1e0 drivers/base/bus.c:500
 __device_attach+0x1e4/0x4d0 drivers/base/dd.c:1098
 device_initial_probe+0xaf/0xd0 drivers/base/dd.c:1153
 bus_probe_device+0x64/0x160 drivers/base/bus.c:620
 device_add+0x121d/0x1970 drivers/base/core.c:3772
 usb_serial_probe.cold+0x257e/0x29f8 drivers/usb/serial/usb-serial.c:1147
 usb_probe_interface+0x303/0x8f0 drivers/usb/core/driver.c:396
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

Freed by task 6031:
 kasan_save_stack+0x30/0x50 mm/kasan/common.c:57
 kasan_save_track+0x14/0x30 mm/kasan/common.c:78
 kasan_save_free_info+0x3b/0x70 mm/kasan/generic.c:584
 poison_slab_object mm/kasan/common.c:253 [inline]
 __kasan_slab_free+0x5f/0x80 mm/kasan/common.c:285
 kasan_slab_free include/linux/kasan.h:235 [inline]
 slab_free_hook mm/slub.c:2677 [inline]
 slab_free mm/slub.c:6377 [inline]
 kfree+0x22b/0x6c0 mm/slub.c:6692
 usb_serial_device_remove+0x146/0x1a0 drivers/usb/serial/bus.c:97
 device_remove+0xcb/0x180 drivers/base/dd.c:616
 __device_release_driver drivers/base/dd.c:1349 [inline]
 device_release_driver_internal+0x44e/0x620 drivers/base/dd.c:1372
 bus_remove_device+0x2bc/0x560 drivers/base/bus.c:664
 device_del+0x376/0x9b0 drivers/base/core.c:3961
 usb_serial_disconnect+0x21e/0x490 drivers/usb/serial/usb-serial.c:1195
 usb_unbind_interface+0x1dd/0x9e0 drivers/usb/core/driver.c:458
 device_remove drivers/base/dd.c:618 [inline]
 device_remove+0x12a/0x180 drivers/base/dd.c:610
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

The buggy address belongs to the object at ffff88801fe9c900
 which belongs to the cache kmalloc-192 of size 192
The buggy address is located 176 bytes inside of
 freed 192-byte region [ffff88801fe9c900, ffff88801fe9c9c0)

The buggy address belongs to the physical page:
page: refcount:0 mapcount:0 mapping:0000000000000000 index:0x0 pfn:0x1fe9c
flags: 0xfff00000000000(node=0|zone=1|lastcpupid=0x7ff)
page_type: f5(slab)
raw: 00fff00000000000 ffff88801c0423c0 dead000000000100 dead000000000122
raw: 0000000000000000 0000000800100010 00000000f5000000 0000000000000000
page dumped because: kasan: bad access detected
page_owner tracks the page as allocated
page last allocated via order 0, migratetype Unmovable, gfp_mask 0xd2cc0(GFP_KERNEL|__GFP_NOWARN|__GFP_NORETRY|__GFP_COMP|__GFP_NOMEMALLOC), pid 1, tgid 1 (swapper/0), ts 2697413350, free_ts 0
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
 __kmalloc_cache_node_noprof+0x542/0x6c0 mm/slub.c:5504
 _kmalloc_node_noprof include/linux/slab.h:1193 [inline]
 mempool_create_node_noprof+0xb9/0x1b0 mm/mempool.c:319
 sg_pool_init+0x179/0x2b0 lib/sg_pool.c:158
 do_one_initcall+0x11d/0x700 init/main.c:1347
 do_initcall_level init/main.c:1409 [inline]
 do_initcalls init/main.c:1425 [inline]
 do_basic_setup init/main.c:1445 [inline]
 kernel_init_freeable+0x6ea/0x7b0 init/main.c:1658
 kernel_init+0x1f/0x1e0 init/main.c:1548
 ret_from_fork+0x72b/0xd50 arch/x86/kernel/process.c:158
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245
page_owner free stack trace missing

Memory state around the buggy address:
 ffff88801fe9c880: fb fb fb fb fb fb fb fb fc fc fc fc fc fc fc fc
 ffff88801fe9c900: fa fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
>ffff88801fe9c980: fb fb fb fb fb fb fb fb fc fc fc fc fc fc fc fc
                                     ^
 ffff88801fe9ca00: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
 ffff88801fe9ca80: 00 00 fc fc fc fc fc fc fc fc fc fc fc fc fc fc
==================================================================
----------------
Code disassembly (best guess):
   0:	00 e8                	add    %ch,%al
   2:	91                   	xchg   %eax,%ecx
   3:	26 2a 00             	es sub (%rax),%al
   6:	9c                   	pushf
   7:	5d                   	pop    %rbp
   8:	81 e5 00 02 00 00    	and    $0x200,%ebp
   e:	31 ff                	xor    %edi,%edi
  10:	48 89 ee             	mov    %rbp,%rsi
  13:	e8 df d1 21 00       	call   0x21d1f7
  18:	48 85 ed             	test   %rbp,%rbp
  1b:	0f 85 d7 01 00 00    	jne    0x1f8
  21:	e8 31 d7 21 00       	call   0x21d757
  26:	fb                   	sti
  27:	4c 89 e8             	mov    %r13,%rax
* 2a:	48 c1 e8 03          	shr    $0x3,%rax <-- trapping instruction
  2e:	42 80 3c 38 00       	cmpb   $0x0,(%rax,%r15,1)
  33:	0f 85 64 03 00 00    	jne    0x39d
  39:	48 8b 0c 24          	mov    (%rsp),%rcx
  3d:	48                   	rex.W
  3e:	8b                   	.byte 0x8b
  3f:	6b                   	.byte 0x6b


---
If you want syzbot to run the reproducer, reply with:
#syz test: git://repo/address.git branch-or-commit-hash
If you attach or paste a git patch, syzbot will apply it before testing.

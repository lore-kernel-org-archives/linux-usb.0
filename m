Received: from mail-oi1-f206.google.com (mail-oi1-f206.google.com [209.85.167.206])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A747323394B
	for <linux-usb@vger.kernel.org>; Fri, 31 Jul 2026 06:35:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.206
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785479740; cv=none; b=uE+ugXoL/9gzXqJCWkwyBw8UtFXxNDFckWFAAILUZK+Rn84o530fUhnCahDQkane3oiXEiQeiwWnv7/5/gY/f+lJdJLIdAIE/cOYKfYNOrZvB7oK4WjkmCd9iUy7xqXitMYWvtwYU6riHrSt03aPe5fWiDIpHKvzB+F7QoiSLFU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785479740; c=relaxed/simple;
	bh=Bkkm9t4z68GEUQsauiquJA5TVKa6NvKmZnMkiuKU5M4=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=fdY33v9R/gbAtky7Wsq5zp70LfrLewBek/KHG7wiLUNhQa1M0NdXVrzpuY0olrzOdBcY6G/eogcod1+yOuif1fOjTJComiONN5/c+4Gm4OfQeUz9OKvXMcfOaVciEep5u9qQlnaP60nuMFEkIlow5A9v7CdgoYAv93qEsUyBuJk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.206
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f206.google.com with SMTP id 5614622812f47-4a7c64fbbc6so475118b6e.2
        for <linux-usb@vger.kernel.org>; Thu, 30 Jul 2026 23:35:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785479737; x=1786084537;
        h=content-type:to:from:subject:message-id:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=U8YHHPnUlkNa5VRgrtQKaf57ukA4LT5Oj+cASiv46VU=;
        b=G0FauSZ17kCw5lUN8DUoUaIsEXhqIkiNkCxwEQXwlcmBT94mdtDHi5XZAnkqJfAKfj
         qmbclM78BkJUdWmfx5v8h4/zTFdnm/CDsNbOSZahhTyMcuqdS/ogdZhNrH+z7FugyBy7
         YtqQZwy+y9r07BjJqcAPng8emkUwOXpi1i4sNfI674EvJk5bWK/TfsNcBXwAFFGSoyte
         jCUPoVa/O1al8eL5UKjP0qaKZcyvII1inPwWhmfSKfm26BTyvznhWOBhSBPaPD68JpJX
         raK6Ly7A+U7z2sTUaHe5hEAeMbhNLr4V5jpgengHWE3gP4gJFcAvTzGqjHFN9YPsD67c
         hUzw==
X-Forwarded-Encrypted: i=1; AHgh+RomZMEjbeuUT/PZWOpla0afm/2AxcwfuMyGJy9wYKP4lB4PM48sSwy9fmmqF0r3NPLzKinSzAlfCCM=@vger.kernel.org
X-Gm-Message-State: AOJu0YzEHeR9Ig1UvLnmOeO+BAM/iWF4j6eHQUIJSVKhX413/zDHjDEe
	YgnQrWf8wOcgQ8WxXtKlFGOodLSaTLngHb51MmmP9pHqyHK/2lpaeq2w5HiPrMO98Fb2ImNtWHj
	HRlYi4egJKRcXsih0WNZSRrPiiPEOqAc6UY4r71xaq4NVyG98kFWfZbXJWDM=
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:1305:b0:495:fb79:7712 with SMTP id
 5614622812f47-4ae31931d75mr763781b6e.0.1785479737604; Thu, 30 Jul 2026
 23:35:37 -0700 (PDT)
Date: Thu, 30 Jul 2026 23:35:37 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6a6c4239.5cf34cee.28a846.0009.GAE@google.com>
Subject: [syzbot] [usb?] KASAN: slab-use-after-free Read in find_endpoint
From: syzbot <syzbot+599d4e8994a656eafe15@syzkaller.appspotmail.com>
To: gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    f5098b6bae76 Linux 7.2-rc5
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=12597fde580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=145fa60d73086782
dashboard link: https://syzkaller.appspot.com/bug?extid=599d4e8994a656eafe15
compiler:       gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/2113dcf433f6/disk-f5098b6b.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/413e673b7de4/vmlinux-f5098b6b.xz
kernel image: https://storage.googleapis.com/syzbot-assets/fc40c1b83e80/bzImage-f5098b6b.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+599d4e8994a656eafe15@syzkaller.appspotmail.com

==================================================================
BUG: KASAN: slab-use-after-free in find_endpoint+0x2a3/0x2c0 drivers/usb/gadget/udc/dummy_hcd.c:1618
Read of size 1 at addr ffff8880359f2912 by task kworker/0:5/18466

CPU: 0 UID: 0 PID: 18466 Comm: kworker/0:5 Tainted: G             L      syzkaller #0 PREEMPT(full) 
Tainted: [L]=SOFTLOCKUP
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 07/16/2026
Workqueue: events request_firmware_work_func
Call Trace:
 <IRQ>
 __dump_stack lib/dump_stack.c:94 [inline]
 dump_stack_lvl+0x100/0x190 lib/dump_stack.c:120
 print_address_description mm/kasan/report.c:378 [inline]
 print_report+0x13d/0x4b0 mm/kasan/report.c:482
 kasan_report+0xdf/0x1c0 mm/kasan/report.c:595
 find_endpoint+0x2a3/0x2c0 drivers/usb/gadget/udc/dummy_hcd.c:1618
 dummy_timer+0x500/0x36f0 drivers/usb/gadget/udc/dummy_hcd.c:1890
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
RIP: 0010:__orc_find+0xae/0xf0 arch/x86/kernel/unwind_orc.c:111
Code: 63 13 48 01 da 49 39 d5 73 af 4c 8d 63 fc 49 39 ec 73 b2 4d 29 f7 49 c1 ff 02 4b 8d 14 7f 48 8d 04 50 48 83 c4 08 5b 5d 41 5c <41> 5d 41 5e 41 5f e9 87 f5 05 0a 48 83 c4 08 31 c0 5b 5d 41 5c 41
RSP: 0018:ffffc900041ef628 EFLAGS: 00000292
RAX: ffffffff92308310 RBX: 0000000000000001 RCX: dffffc0000000000
RDX: 000000000000000f RSI: 0000000000000000 RDI: ffffffff91836d10
RBP: ffffc900041ef700 R08: ffffffff92308340 R09: 0000000000000007
R10: 0000000000000200 R11: 00000000000680ae R12: ffffc900041ef708
R13: ffffffff8780ae85 R14: ffffffff91836d10 R15: 0000000000000005
 orc_find arch/x86/kernel/unwind_orc.c:238 [inline]
 unwind_next_frame+0x2ec/0x2090 arch/x86/kernel/unwind_orc.c:510
 arch_stack_walk+0x94/0xf0 arch/x86/kernel/stacktrace.c:25
 stack_trace_save+0x8e/0xc0 kernel/stacktrace.c:122
 kasan_save_stack+0x30/0x50 mm/kasan/common.c:57
 kasan_save_track+0x14/0x30 mm/kasan/common.c:78
 poison_kmalloc_redzone mm/kasan/common.c:398 [inline]
 __kasan_kmalloc+0xaa/0xb0 mm/kasan/common.c:415
 kasan_kmalloc include/linux/kasan.h:263 [inline]
 __do_kmalloc_node mm/slub.c:5334 [inline]
 __kmalloc_noprof+0x322/0x820 mm/slub.c:5359
 _kmalloc_noprof include/linux/slab.h:992 [inline]
 usb_alloc_urb+0x66/0xa0 drivers/usb/core/urb.c:75
 ath9k_hif_usb_alloc_rx_urbs drivers/net/wireless/ath/ath9k/hif_usb.c:897 [inline]
 ath9k_hif_usb_alloc_urbs+0x5e4/0xfa0 drivers/net/wireless/ath/ath9k/hif_usb.c:1034
 ath9k_hif_usb_dev_init drivers/net/wireless/ath/ath9k/hif_usb.c:1124 [inline]
 ath9k_hif_usb_firmware_cb+0x146/0x530 drivers/net/wireless/ath/ath9k/hif_usb.c:1252
 request_firmware_work_func+0x13f/0x440 drivers/base/firmware_loader/main.c:1164
 process_one_work+0xa23/0x1940 kernel/workqueue.c:3322
 process_scheduled_works kernel/workqueue.c:3405 [inline]
 worker_thread+0x5ef/0xe50 kernel/workqueue.c:3486
 kthread+0x370/0x450 kernel/kthread.c:436
 ret_from_fork+0x72b/0xd50 arch/x86/kernel/process.c:158
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245
 </TASK>

Allocated by task 29727:
 kasan_save_stack+0x30/0x50 mm/kasan/common.c:57
 kasan_save_track+0x14/0x30 mm/kasan/common.c:78
 unpoison_slab_object mm/kasan/common.c:340 [inline]
 __kasan_slab_alloc+0x89/0x90 mm/kasan/common.c:366
 kasan_slab_alloc include/linux/kasan.h:253 [inline]
 slab_post_alloc_hook mm/slub.c:4584 [inline]
 kmem_cache_alloc_bulk_noprof+0x352/0x890 mm/slub.c:7435
 __io_alloc_req_refill+0x9e/0x330 io_uring/io_uring.c:988
 io_alloc_req io_uring/io_uring.h:536 [inline]
 io_submit_sqes.cold+0xf6/0x301 io_uring/io_uring.c:2046
 __do_sys_io_uring_enter+0xa88/0x1b10 io_uring/io_uring.c:2646
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0x115/0x870 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f

Freed by task 27397:
 kasan_save_stack+0x30/0x50 mm/kasan/common.c:57
 kasan_save_track+0x14/0x30 mm/kasan/common.c:78
 kasan_save_free_info+0x3b/0x70 mm/kasan/generic.c:584
 poison_slab_object mm/kasan/common.c:253 [inline]
 __kasan_slab_free+0x5f/0x80 mm/kasan/common.c:285
 kasan_slab_free include/linux/kasan.h:235 [inline]
 slab_free_hook mm/slub.c:2677 [inline]
 slab_free_after_rcu_debug+0xdf/0x170 mm/slub.c:6439
 rcu_do_batch kernel/rcu/tree.c:2645 [inline]
 rcu_core+0x5a2/0x10d0 kernel/rcu/tree.c:2897
 handle_softirqs+0x1ea/0x9b0 kernel/softirq.c:622
 do_softirq kernel/softirq.c:523 [inline]
 do_softirq+0xac/0xe0 kernel/softirq.c:510
 __local_bh_enable_ip+0xf8/0x120 kernel/softirq.c:450
 local_bh_enable include/linux/bottom_half.h:33 [inline]
 __alloc_skb+0x5db/0x710 net/core/skbuff.c:699
 alloc_skb include/linux/skbuff.h:1384 [inline]
 alloc_uevent_skb+0x7d/0x210 lib/kobject_uevent.c:289
 uevent_net_broadcast_untagged lib/kobject_uevent.c:326 [inline]
 kobject_uevent_net_broadcast lib/kobject_uevent.c:410 [inline]
 kobject_uevent_env+0xd2d/0x18b0 lib/kobject_uevent.c:611
 device_del+0x605/0x9b0 drivers/base/core.c:3979
 device_unregister+0x1d/0xe0 drivers/base/core.c:4002
 hci_conn_del_sysfs+0xb9/0x1a0 net/bluetooth/hci_sysfs.c:79
 hci_conn_cleanup net/bluetooth/hci_conn.c:170 [inline]
 hci_conn_del+0x506/0x1180 net/bluetooth/hci_conn.c:1306
 hci_abort_conn_sync+0x7d9/0xb20 net/bluetooth/hci_sync.c:5850
 abort_conn_sync+0x142/0x350 net/bluetooth/hci_conn.c:3163
 hci_cmd_sync_work+0x1c0/0x470 net/bluetooth/hci_sync.c:332
 process_one_work+0xa23/0x1940 kernel/workqueue.c:3322
 process_scheduled_works kernel/workqueue.c:3405 [inline]
 worker_thread+0x5ef/0xe50 kernel/workqueue.c:3486
 kthread+0x370/0x450 kernel/kthread.c:436
 ret_from_fork+0x72b/0xd50 arch/x86/kernel/process.c:158
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245

Last potentially related work creation:
 kasan_save_stack+0x30/0x50 mm/kasan/common.c:57
 kasan_record_aux_stack+0xa7/0xc0 mm/kasan/generic.c:556
 slab_free_hook mm/slub.c:2638 [inline]
 slab_free mm/slub.c:6377 [inline]
 kmem_cache_free+0x427/0x6b0 mm/slub.c:6504
 __io_req_caches_free+0x1a6/0x220 io_uring/io_uring.c:2148
 io_req_caches_free io_uring/io_uring.c:2160 [inline]
 io_ring_exit_work+0x42a/0xd7a io_uring/io_uring.c:2363
 process_one_work+0xa23/0x1940 kernel/workqueue.c:3322
 process_scheduled_works kernel/workqueue.c:3405 [inline]
 worker_thread+0x5ef/0xe50 kernel/workqueue.c:3486
 kthread+0x370/0x450 kernel/kthread.c:436
 ret_from_fork+0x72b/0xd50 arch/x86/kernel/process.c:158
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245

The buggy address belongs to the object at ffff8880359f28c0
 which belongs to the cache io_kiocb of size 248
The buggy address is located 82 bytes inside of
 freed 248-byte region [ffff8880359f28c0, ffff8880359f29b8)

The buggy address belongs to the physical page:
page: refcount:0 mapcount:0 mapping:0000000000000000 index:0x0 pfn:0x359f2
memcg:ffff8880359f2f01
flags: 0xfff00000000000(node=0|zone=1|lastcpupid=0x7ff)
page_type: f5(slab)
raw: 00fff00000000000 ffff888142ef6c80 dead000000000100 dead000000000122
raw: 0000000000000000 00000008000c000c 00000000f5000000 ffff8880359f2f01
page dumped because: kasan: bad access detected
page_owner tracks the page as allocated
page last allocated via order 0, migratetype Unmovable, gfp_mask 0x52cc0(GFP_KERNEL|__GFP_NOWARN|__GFP_NORETRY|__GFP_COMP), pid 29727, tgid 29719 (syz.0.6860), ts 1428916787567, free_ts 1428553365645
 set_page_owner include/linux/page_owner.h:32 [inline]
 post_alloc_hook+0xfd/0x120 mm/page_alloc.c:1859
 prep_new_page mm/page_alloc.c:1867 [inline]
 get_page_from_freelist+0xf48/0x3530 mm/page_alloc.c:3946
 __alloc_frozen_pages_noprof+0x299/0x2dc0 mm/page_alloc.c:5304
 alloc_slab_page mm/slub.c:3266 [inline]
 allocate_slab mm/slub.c:3380 [inline]
 new_slab+0xa2/0x640 mm/slub.c:3426
 refill_objects+0xe3/0x410 mm/slub.c:7310
 __kmem_cache_alloc_bulk+0x3c/0x120 mm/slub.c:7346
 kmem_cache_alloc_bulk_noprof+0x48b/0x890 mm/slub.c:7413
 __io_alloc_req_refill+0x9e/0x330 io_uring/io_uring.c:988
 io_alloc_req io_uring/io_uring.h:536 [inline]
 io_submit_sqes.cold+0xf6/0x301 io_uring/io_uring.c:2046
 __do_sys_io_uring_enter+0xa88/0x1b10 io_uring/io_uring.c:2646
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0x115/0x870 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
page last free pid 29721 tgid 29719 stack trace:
 reset_page_owner include/linux/page_owner.h:25 [inline]
 __free_pages_prepare mm/page_alloc.c:1406 [inline]
 __free_frozen_pages+0x79f/0x1090 mm/page_alloc.c:2950
 __pagetable_free include/linux/mm.h:3695 [inline]
 pagetable_free include/linux/mm.h:3719 [inline]
 pagetable_dtor_free include/linux/mm.h:3818 [inline]
 __tlb_remove_table include/asm-generic/tlb.h:221 [inline]
 __tlb_remove_table_free mm/mmu_gather.c:228 [inline]
 tlb_remove_table_rcu+0x2cf/0x380 mm/mmu_gather.c:291
 rcu_do_batch kernel/rcu/tree.c:2645 [inline]
 rcu_core+0x5a2/0x10d0 kernel/rcu/tree.c:2897
 handle_softirqs+0x1ea/0x9b0 kernel/softirq.c:622
 __do_softirq kernel/softirq.c:656 [inline]
 invoke_softirq kernel/softirq.c:496 [inline]
 __irq_exit_rcu+0x162/0x210 kernel/softirq.c:735
 irq_exit_rcu+0x9/0x30 kernel/softirq.c:752
 instr_sysvec_apic_timer_interrupt arch/x86/kernel/apic/apic.c:1062 [inline]
 sysvec_apic_timer_interrupt+0xa3/0xc0 arch/x86/kernel/apic/apic.c:1062
 asm_sysvec_apic_timer_interrupt+0x1a/0x20 arch/x86/include/asm/idtentry.h:674

Memory state around the buggy address:
 ffff8880359f2800: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fc
 ffff8880359f2880: fc fc fc fc fc fc fc fc fa fb fb fb fb fb fb fb
>ffff8880359f2900: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
                         ^
 ffff8880359f2980: fb fb fb fb fb fb fb fc fc fc fc fc fc fc fc fc
 ffff8880359f2a00: fa fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
==================================================================
----------------
Code disassembly (best guess):
   0:	63 13                	movsxd (%rbx),%edx
   2:	48 01 da             	add    %rbx,%rdx
   5:	49 39 d5             	cmp    %rdx,%r13
   8:	73 af                	jae    0xffffffb9
   a:	4c 8d 63 fc          	lea    -0x4(%rbx),%r12
   e:	49 39 ec             	cmp    %rbp,%r12
  11:	73 b2                	jae    0xffffffc5
  13:	4d 29 f7             	sub    %r14,%r15
  16:	49 c1 ff 02          	sar    $0x2,%r15
  1a:	4b 8d 14 7f          	lea    (%r15,%r15,2),%rdx
  1e:	48 8d 04 50          	lea    (%rax,%rdx,2),%rax
  22:	48 83 c4 08          	add    $0x8,%rsp
  26:	5b                   	pop    %rbx
  27:	5d                   	pop    %rbp
  28:	41 5c                	pop    %r12
* 2a:	41 5d                	pop    %r13 <-- trapping instruction
  2c:	41 5e                	pop    %r14
  2e:	41 5f                	pop    %r15
  30:	e9 87 f5 05 0a       	jmp    0xa05f5bc
  35:	48 83 c4 08          	add    $0x8,%rsp
  39:	31 c0                	xor    %eax,%eax
  3b:	5b                   	pop    %rbx
  3c:	5d                   	pop    %rbp
  3d:	41 5c                	pop    %r12
  3f:	41                   	rex.B


---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this issue. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.

If the report is already addressed, let syzbot know by replying with:
#syz fix: exact-commit-title

If you want to overwrite report's subsystems, reply with:
#syz set subsystems: new-subsystem
(See the list of subsystem names on the web dashboard)

If the report is a duplicate of another one, reply with:
#syz dup: exact-subject-of-another-report

If you want to undo deduplication, reply with:
#syz undup

Received: from mail-ot1-f79.google.com (mail-ot1-f79.google.com [209.85.210.79])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AADC6371860
	for <linux-usb@vger.kernel.org>; Fri, 14 Aug 2026 01:30:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.79
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786671075; cv=none; b=mcHN8fDV8oyfgmNdqZQ2SoYJEDJ7GTDKoWq1iGIYRWD4WlOrqB3Qf9CEge+e3wnFojNCI65GC2c26P3+53mdSJJu6MFAPZ3TDmFmbb1chJhbcSHJwHn+T1TYLAooVjBBZHM1qEupdqKUe7Z691R2jfHalZ9gxzeUxFGGDLmvMPU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786671075; c=relaxed/simple;
	bh=wl4uQ66+JnS80/lRhQvjHQTjJM5eykqXOx0hVf/hvHc=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=aRsrk5ZSWltKyQVqALhswCJ3tpvE0jVL3aoDJRd5MP4atCtul6YFF5Ujwot371xuCBgUlJpptABvfVGOfLIQXqm6ebqhqrBLoOrKjsudwFtwxBMg3+QKKBW8Qc0Bg/Rczs4HZwfU/cTPxTtvbwnOAuRYfX78XvC7h1nkvX7pnyQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.210.79
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-ot1-f79.google.com with SMTP id 46e09a7af769-7e9e741693bso574169a34.0
        for <linux-usb@vger.kernel.org>; Thu, 13 Aug 2026 18:30:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786671033; x=1787275833;
        h=content-type:to:from:subject:message-id:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rcpoGaDeBajLl91GaPRS5EUQYoMTA1UqbRG74luG1mM=;
        b=czWusKbvcnXX+GQZBHsktf1nruKQTRv/HfwyJH319WPBrQRU+5G8bJTO7BRxVV+0K8
         nzmzZzhL+1LEqNy/JXhTmGz1aahDbyMivQnS8/Qr5/KeNmo2nmAokl+Y6r14pIUQSfdL
         RG9XqhStwzzGM5BQskGWX3ic9BS1FB1tzEQ2CL9No/RjGifEIHzNK0VZcnTPRKWnCETy
         FLI9x4TZ4VAyxxciUfz0GXC7iXU6R3gQ55mb5sgD1nj/+0tm7vK6hALU4LTnCfxEBSca
         jHfvNBK0+Fg1CvAEHDfcjQxoqSFQknQTHGBAJzvGujRfT6KGLRMLFBYntC0rA2rqsj+Y
         PSRQ==
X-Forwarded-Encrypted: i=1; AHgh+RqWCiAl0XKRUSTMUK3UucjCmoqK+CSOA5UiEsYid0RdLw4WQBNxsO670L+qpZLFO3VQV3YcxtyRa40=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy2jGMejjM7du1O0EpEtnRAm1wr501ClhwUD0xLyn0DltX4zIkP
	IXm29tf41WzUfsngj1AE0LwoYMiDWDWcRFVrr9HxDV9t6N3027ekAsMNmfaV1kjbVx4M602pQBZ
	NXUiIZ3IxhGywSUr6WYQPkfi+LLcZiX+qf/2YNQ81Qoe7h5aWa8x+LhT4hQs=
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:1889:b0:6aa:9be1:4844 with SMTP id
 006d021491bc7-6b0d5fdaca2mr2397617eaf.5.1786671033039; Thu, 13 Aug 2026
 18:30:33 -0700 (PDT)
Date: Thu, 13 Aug 2026 18:30:32 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6a7e6fb9.ec5dc6cc.21cb3f.00c0.GAE@google.com>
Subject: [syzbot] [usb?] KASAN: slab-use-after-free Read in usa49_glocont_callback
From: syzbot <syzbot+e5e28c3e953b2eebb16e@syzkaller.appspotmail.com>
To: gregkh@linuxfoundation.org, johan@kernel.org, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    06cf61899d64 Merge tag 'x86-urgent-2026-08-08' of git://gi..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=14094079580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=c44651ea7dd2f307
dashboard link: https://syzkaller.appspot.com/bug?extid=e5e28c3e953b2eebb16e
compiler:       gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/260ea970a68e/disk-06cf6189.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/0005e8a7195f/vmlinux-06cf6189.xz
kernel image: https://storage.googleapis.com/syzbot-assets/f061ed2152ca/bzImage-06cf6189.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+e5e28c3e953b2eebb16e@syzkaller.appspotmail.com

==================================================================
BUG: KASAN: slab-use-after-free in usa49_glocont_callback+0x232/0x260 drivers/usb/serial/keyspan.c:1045
Read of size 4 at addr ffff888028940cb0 by task syz.4.480/7762

CPU: 0 UID: 0 PID: 7762 Comm: syz.4.480 Tainted: G             L      syzkaller #0 PREEMPT(full) 
Tainted: [L]=SOFTLOCKUP
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 07/16/2026
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
RIP: 0010:rcu_read_unlock+0x26/0x60 include/linux/rcupdate.h:869
Code: 90 90 90 90 e8 8b 74 37 09 85 c0 75 18 48 c7 c7 00 82 be 8e 48 8d 35 00 00 00 00 e8 94 bb 62 ff e9 ff 1c 6c ff e8 0a 28 6b ff <84> c0 75 df e8 61 74 37 09 85 c0 74 d6 80 3d 45 f6 85 0e 00 75 cd
RSP: 0018:ffffc9000611f428 EFLAGS: 00000286
RAX: 0000000000000001 RBX: ffff888036ba3700 RCX: 0000000000000000
RDX: 0000000000000000 RSI: ffffffff8c400300 RDI: ffffffff8e470920
RBP: dffffc0000000000 R08: 0000000085239a3f R09: 0000000000000007
R10: 0000000000000200 R11: 0000000000000000 R12: ffff8880447b8cc0
R13: ffffed10088f72fa R14: ffffffff8283cbb9 R15: ffff8880368b0800
 percpu_ref_tryget_many include/linux/percpu-refcount.h:250 [inline]
 percpu_ref_tryget include/linux/percpu-refcount.h:266 [inline]
 css_tryget include/linux/cgroup_refcnt.h:45 [inline]
 css_tryget include/linux/cgroup_refcnt.h:42 [inline]
 get_mem_cgroup_from_mm+0x29c/0x5e0 mm/memcontrol.c:1145
 __mem_cgroup_charge+0x1a/0x1c0 mm/memcontrol.c:5142
 mem_cgroup_charge include/linux/memcontrol.h:657 [inline]
 shmem_alloc_and_add_folio+0x451/0xd40 mm/shmem.c:1969
 shmem_get_folio_gfp+0x6ad/0x1910 mm/shmem.c:2512
 shmem_fault+0x1f9/0xa20 mm/shmem.c:2713
 __do_fault+0x10b/0x440 mm/memory.c:5425
 do_read_fault mm/memory.c:5860 [inline]
 do_fault+0xa99/0x1750 mm/memory.c:5994
 do_pte_missing mm/memory.c:4566 [inline]
 handle_pte_fault mm/memory.c:6379 [inline]
 __handle_mm_fault+0x187d/0x2a00 mm/memory.c:6517
 handle_mm_fault+0x37b/0xa30 mm/memory.c:6686
 faultin_page mm/gup.c:1126 [inline]
 __get_user_pages+0x1178/0x32a0 mm/gup.c:1428
 populate_vma_page_range+0x267/0x3f0 mm/gup.c:1860
 __mm_populate+0x107/0x3a0 mm/gup.c:1963
 mm_populate include/linux/mm.h:4171 [inline]
 vm_mmap_pgoff+0x37f/0x470 mm/util.c:586
 ksys_mmap_pgoff+0xe4/0x610 mm/mmap.c:606
 __do_sys_mmap arch/x86/kernel/sys_x86_64.c:89 [inline]
 __se_sys_mmap arch/x86/kernel/sys_x86_64.c:82 [inline]
 __x64_sys_mmap+0x125/0x190 arch/x86/kernel/sys_x86_64.c:82
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0x115/0x870 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f9fce59e0d9
Code: ff c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 44 00 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 e8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007f9fcf481028 EFLAGS: 00000246 ORIG_RAX: 0000000000000009
RAX: ffffffffffffffda RBX: 00007f9fce826270 RCX: 00007f9fce59e0d9
RDX: b635773f06ebbeee RSI: 0000000000b36000 RDI: 0000200000000000
RBP: 00007f9fce635024 R08: ffffffffffffffff R09: 0000000000000000
R10: 0000000000008031 R11: 0000000000000246 R12: 0000000000000000
R13: 00007f9fce826308 R14: 00007f9fce826270 R15: 00007ffcd6d18da8
 </TASK>

Allocated by task 24:
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
 driver_probe_device+0x4a/0x140 drivers/base/dd.c:898
 __device_attach_driver+0x1df/0x320 drivers/base/dd.c:1026
 bus_for_each_drv+0x159/0x1e0 drivers/base/bus.c:500
 __device_attach+0x1e4/0x4d0 drivers/base/dd.c:1098
 device_initial_probe+0xaf/0xd0 drivers/base/dd.c:1153
 bus_probe_device+0x64/0x160 drivers/base/bus.c:620
 device_add+0x121d/0x1970 drivers/base/core.c:3772
 usb_set_configuration+0xd97/0x1c60 drivers/usb/core/message.c:2268
 usb_generic_driver_probe+0xa1/0xe0 drivers/usb/core/generic.c:250
 usb_probe_device+0xef/0x400 drivers/usb/core/driver.c:291
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
 usb_new_device.part.0+0xcc2/0x1686 drivers/usb/core/hub.c:2703
 usb_new_device include/linux/workqueue.h:714 [inline]
 hub_port_connect drivers/usb/core/hub.c:5575 [inline]
 hub_port_connect_change drivers/usb/core/hub.c:5715 [inline]
 port_event drivers/usb/core/hub.c:5879 [inline]
 hub_event.cold+0x1e3/0xe90 drivers/usb/core/hub.c:5961
 process_one_work+0xa23/0x1940 kernel/workqueue.c:3322
 process_scheduled_works kernel/workqueue.c:3405 [inline]
 worker_thread+0x5ef/0xe50 kernel/workqueue.c:3486
 kthread+0x370/0x450 kernel/kthread.c:436
 ret_from_fork+0x72b/0xd50 arch/x86/kernel/process.c:158
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245

Freed by task 24:
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
 bus_remove_device+0x2bc/0x560 drivers/base/bus.c:664
 device_del+0x376/0x9b0 drivers/base/core.c:3961
 usb_disable_device+0x367/0x810 drivers/usb/core/message.c:1478
 usb_disconnect+0x2e2/0x9a0 drivers/usb/core/hub.c:2345
 hub_port_connect drivers/usb/core/hub.c:5415 [inline]
 hub_port_connect_change drivers/usb/core/hub.c:5715 [inline]
 port_event drivers/usb/core/hub.c:5879 [inline]
 hub_event+0x1bb1/0x4420 drivers/usb/core/hub.c:5961
 process_one_work+0xa23/0x1940 kernel/workqueue.c:3322
 process_scheduled_works kernel/workqueue.c:3405 [inline]
 worker_thread+0x5ef/0xe50 kernel/workqueue.c:3486
 kthread+0x370/0x450 kernel/kthread.c:436
 ret_from_fork+0x72b/0xd50 arch/x86/kernel/process.c:158
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245

The buggy address belongs to the object at ffff888028940c00
 which belongs to the cache kmalloc-192 of size 192
The buggy address is located 176 bytes inside of
 freed 192-byte region [ffff888028940c00, ffff888028940cc0)

The buggy address belongs to the physical page:
page: refcount:0 mapcount:0 mapping:0000000000000000 index:0x0 pfn:0x28940
flags: 0xfff00000000000(node=0|zone=1|lastcpupid=0x7ff)
page_type: f5(slab)
raw: 00fff00000000000 ffff88813fe213c0 dead000000000100 dead000000000122
raw: 0000000000000000 0000000800100010 00000000f5000000 0000000000000000
page dumped because: kasan: bad access detected
page_owner tracks the page as allocated
page last allocated via order 0, migratetype Unmovable, gfp_mask 0xd2cc0(GFP_KERNEL|__GFP_NOWARN|__GFP_NORETRY|__GFP_COMP|__GFP_NOMEMALLOC), pid 1, tgid 1 (swapper/0), ts 4807713744, free_ts 4805273634
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
 alloc_worker kernel/workqueue.c:2706 [inline]
 init_rescuer+0x19f/0x550 kernel/workqueue.c:5706
 __alloc_workqueue+0xe4e/0x1940 kernel/workqueue.c:5906
 alloc_workqueue_va kernel/workqueue.c:5946 [inline]
 alloc_workqueue_noprof+0xc7/0x130 kernel/workqueue.c:5962
 nvmet_init+0x14a/0x240 drivers/nvme/target/core.c:1970
 do_one_initcall+0x11d/0x700 init/main.c:1347
 do_initcall_level init/main.c:1409 [inline]
 do_initcalls init/main.c:1425 [inline]
 do_basic_setup init/main.c:1445 [inline]
 kernel_init_freeable+0x6ea/0x7b0 init/main.c:1658
 kernel_init+0x1f/0x1e0 init/main.c:1548
 ret_from_fork+0x72b/0xd50 arch/x86/kernel/process.c:158
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245
page last free pid 2 tgid 2 stack trace:
 reset_page_owner include/linux/page_owner.h:25 [inline]
 __free_pages_prepare mm/page_alloc.c:1406 [inline]
 __free_frozen_pages+0x79f/0x1090 mm/page_alloc.c:2950
 __kasan_populate_vmalloc_do mm/kasan/shadow.c:393 [inline]
 __kasan_populate_vmalloc+0x1ea/0x210 mm/kasan/shadow.c:424
 kasan_populate_vmalloc include/linux/kasan.h:580 [inline]
 alloc_vmap_area+0x95d/0x2bb0 mm/vmalloc.c:2145
 __get_vm_area_node+0x1ca/0x330 mm/vmalloc.c:3248
 __vmalloc_node_range_noprof+0x228/0x1630 mm/vmalloc.c:4064
 __vmalloc_node_noprof+0xad/0xf0 mm/vmalloc.c:4165
 alloc_thread_stack_node kernel/fork.c:359 [inline]
 dup_task_struct kernel/fork.c:929 [inline]
 copy_process+0x7fb/0x8030 kernel/fork.c:2115
 kernel_clone+0x176/0x9d0 kernel/fork.c:2748
 kernel_thread+0xdb/0x120 kernel/fork.c:2809
 create_kthread kernel/kthread.c:459 [inline]
 kthreadd+0x498/0x7a0 kernel/kthread.c:817
 ret_from_fork+0x72b/0xd50 arch/x86/kernel/process.c:158
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245

Memory state around the buggy address:
 ffff888028940b80: fb fb fb fb fb fb fb fb fc fc fc fc fc fc fc fc
 ffff888028940c00: fa fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
>ffff888028940c80: fb fb fb fb fb fb fb fb fc fc fc fc fc fc fc fc
                                     ^
 ffff888028940d00: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
 ffff888028940d80: 00 00 00 00 00 00 fc fc fc fc fc fc fc fc fc fc
==================================================================
----------------
Code disassembly (best guess):
   0:	90                   	nop
   1:	90                   	nop
   2:	90                   	nop
   3:	90                   	nop
   4:	e8 8b 74 37 09       	call   0x9377494
   9:	85 c0                	test   %eax,%eax
   b:	75 18                	jne    0x25
   d:	48 c7 c7 00 82 be 8e 	mov    $0xffffffff8ebe8200,%rdi
  14:	48 8d 35 00 00 00 00 	lea    0x0(%rip),%rsi        # 0x1b
  1b:	e8 94 bb 62 ff       	call   0xff62bbb4
  20:	e9 ff 1c 6c ff       	jmp    0xff6c1d24
  25:	e8 0a 28 6b ff       	call   0xff6b2834
* 2a:	84 c0                	test   %al,%al <-- trapping instruction
  2c:	75 df                	jne    0xd
  2e:	e8 61 74 37 09       	call   0x9377494
  33:	85 c0                	test   %eax,%eax
  35:	74 d6                	je     0xd
  37:	80 3d 45 f6 85 0e 00 	cmpb   $0x0,0xe85f645(%rip)        # 0xe85f683
  3e:	75 cd                	jne    0xd


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

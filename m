Received: from mail-oi1-f207.google.com (mail-oi1-f207.google.com [209.85.167.207])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A1133F1AAD
	for <linux-usb@vger.kernel.org>; Tue,  4 Aug 2026 02:08:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.207
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785809312; cv=none; b=B+9YeRs1cHT/qbhJdmFg4owcyF6Sgh+QCUCHptioHOFeJU2AKUcc4UzRKqRi20KHX/p7/ePdVcZ6U8CU+2BC5Ku5kNRNPwUH9KDuPKpAuvnV+8cNpTICAk9ERWuYEXn/ldKuIwffZrkz+EzYSRa6DRhEh5bWoPdn3QsnAPhPFaA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785809312; c=relaxed/simple;
	bh=6QWo6MdD5tywMe9+lYDiH6BM0L0gqUeetSus7XRwJDA=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=qfmmyCwHV+TvSbmd2UIAnhLNUBx6JLew3HzFUNaOXhjIrZTH00LgtSOj12vaon7TvpO/MN2uK1K+XerZhgTLR6igbgMxN4k3M0V56pnHJAUl0bVtMT0oC3CTO18q35GafoORciwHMJZ7ftXS7NemEc74A4RYvZyWHFh0NoXkvRA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.207
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f207.google.com with SMTP id 5614622812f47-4ab4af22d09so5573963b6e.0
        for <linux-usb@vger.kernel.org>; Mon, 03 Aug 2026 19:08:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785809305; x=1786414105;
        h=content-type:to:from:subject:message-id:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7Kdi3er8cXYU5ksbEZAcJhfTisqpNuVXKJCBnFnRknw=;
        b=bXzV4KwlIhi5DFGxEYNWJuU6ArBkfukSQS99CdANFDqusKaGuDjD/CYEtkIChsY4so
         aMlWcpibZIZgnGLbAt8hrGJHr36jxyYaJm6vlfJ6v70l4lkLMfSXiiWrfVPyP/1E1y1g
         wlxPyrO5ntoM1JPqqqoeoFF3nYK+05XD8RE3s8v9n63mRgF2e/vODlREDyrhtPdwB1rn
         WVPWCeSJVeY26lufFS5y1W/VnBUSPpycXstKbzkfWKWSyCTAGvvDpKBXkeP12NMpAVJE
         gA7+VRyhaGg/5ouo7BFoLVSWGfjE5Gz+Qt3Xl4jVaT6err6LXu+rQISxQJE/O/7rKGZh
         eU6w==
X-Forwarded-Encrypted: i=1; AHgh+RqgwD/+gdb/9UzTyy5fXG9CpJC4s2rbRjPV32onDgzfOvUy65sfC82Bdk0aMS1oxMukjN+FY++Bvqo=@vger.kernel.org
X-Gm-Message-State: AOJu0YzHT3WOruj/wAmqEULhwMAwt8VpXIqw+k46sx+ZGvgBYBcu5eN5
	DJKK5BZpwCRsuCMW+la4Z7cEYc13FWRS34lQE0YhiIjctNbtMGdfpL0N3qyIr4310M9KBCjHPJQ
	aIxY7ehw7F9XYAKY7znGmduSIVtGn7X7aFU7Wc20GOijmJ2HmpV6ER9KndjA=
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:2384:b0:496:e0:a47b with SMTP id
 5614622812f47-4af5e329e27mr19332443b6e.20.1785809305229; Mon, 03 Aug 2026
 19:08:25 -0700 (PDT)
Date: Mon, 03 Aug 2026 19:08:25 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6a714999.13623e66.bdc14.0009.GAE@google.com>
Subject: [syzbot] [usb?] KASAN: slab-use-after-free Write in gadgetfs_kill_sb
From: syzbot <syzbot+4a5c87a01894ca37f25c@syzkaller.appspotmail.com>
To: gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    11028ab62899 Merge tag 'probes-fixes-v7.2-rc5' of git://gi..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=15b8b561580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=cb17729fb04b1e3a
dashboard link: https://syzkaller.appspot.com/bug?extid=4a5c87a01894ca37f25c
compiler:       Debian clang version 22.1.8 (++20260613092233+e80beda6e255-1~exp1~20260613092250.77), Debian LLD 22.1.8

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/0afad3dd27f4/disk-11028ab6.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/2e1441f9c31d/vmlinux-11028ab6.xz
kernel image: https://storage.googleapis.com/syzbot-assets/5f0b8bdf00cd/bzImage-11028ab6.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+4a5c87a01894ca37f25c@syzkaller.appspotmail.com

==================================================================
BUG: KASAN: slab-use-after-free in instrument_atomic_read_write include/linux/instrumented.h:112 [inline]
BUG: KASAN: slab-use-after-free in atomic_fetch_sub_release include/linux/atomic/atomic-instrumented.h:400 [inline]
BUG: KASAN: slab-use-after-free in __refcount_sub_and_test include/linux/refcount.h:389 [inline]
BUG: KASAN: slab-use-after-free in __refcount_dec_and_test include/linux/refcount.h:432 [inline]
BUG: KASAN: slab-use-after-free in refcount_dec_and_test include/linux/refcount.h:450 [inline]
BUG: KASAN: slab-use-after-free in put_dev drivers/usb/gadget/legacy/inode.c:165 [inline]
BUG: KASAN: slab-use-after-free in gadgetfs_kill_sb+0x46/0x110 drivers/usb/gadget/legacy/inode.c:2104
Write of size 4 at addr ffff88803bfae880 by task syz-executor/5596

CPU: 1 UID: 0 PID: 5596 Comm: syz-executor Not tainted syzkaller #0 PREEMPT_{RT,(full)} 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 07/24/2026
Call Trace:
 <TASK>
 dump_stack_lvl+0xe8/0x150 lib/dump_stack.c:120
 print_address_description+0x55/0x1e0 mm/kasan/report.c:378
 print_report+0x58/0x70 mm/kasan/report.c:482
 kasan_report+0x117/0x150 mm/kasan/report.c:595
 check_region_inline mm/kasan/generic.c:-1 [inline]
 kasan_check_range+0x264/0x2c0 mm/kasan/generic.c:200
 instrument_atomic_read_write include/linux/instrumented.h:112 [inline]
 atomic_fetch_sub_release include/linux/atomic/atomic-instrumented.h:400 [inline]
 __refcount_sub_and_test include/linux/refcount.h:389 [inline]
 __refcount_dec_and_test include/linux/refcount.h:432 [inline]
 refcount_dec_and_test include/linux/refcount.h:450 [inline]
 put_dev drivers/usb/gadget/legacy/inode.c:165 [inline]
 gadgetfs_kill_sb+0x46/0x110 drivers/usb/gadget/legacy/inode.c:2104
 deactivate_locked_super+0xbc/0x130 fs/super.c:477
 cleanup_mnt+0x3d3/0x460 fs/namespace.c:1317
 task_work_run+0x1d9/0x270 kernel/task_work.c:233
 exit_task_work include/linux/task_work.h:40 [inline]
 do_exit+0x73a/0x2360 kernel/exit.c:1009
 do_group_exit+0x22d/0x2f0 kernel/exit.c:1152
 __do_sys_exit_group kernel/exit.c:1163 [inline]
 __se_sys_exit_group kernel/exit.c:1161 [inline]
 __x64_sys_exit_group+0x3f/0x40 kernel/exit.c:1161
 x64_sys_call+0x221a/0x2240 arch/x86/include/generated/asm/syscalls_64.h:232
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0x174/0x580 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7fbce50adf99
Code: Unable to access opcode bytes at 0x7fbce50adf6f.
RSP: 002b:00007ffcd063bfe8 EFLAGS: 00000246 ORIG_RAX: 00000000000000e7
RAX: ffffffffffffffda RBX: 0000000000000000 RCX: 00007fbce50adf99
RDX: 0000000000000000 RSI: 0000000000000000 RDI: 0000000000000043
RBP: 00007fbce5145dfc R08: 0000000000000000 R09: 00000000000927c0
R10: 0000000000000000 R11: 0000000000000246 R12: 000000000000001c
R13: 00000000000927c0 R14: 0000000000028fe2 R15: 00007ffcd063c1a0
 </TASK>

Allocated by task 1029:
 kasan_save_stack mm/kasan/common.c:57 [inline]
 kasan_save_track+0x3e/0x80 mm/kasan/common.c:78
 poison_kmalloc_redzone mm/kasan/common.c:398 [inline]
 __kasan_kmalloc+0x93/0xb0 mm/kasan/common.c:415
 kasan_kmalloc include/linux/kasan.h:263 [inline]
 __do_kmalloc_node mm/slub.c:5334 [inline]
 __kmalloc_node_track_caller_noprof+0x57f/0x7c0 mm/slub.c:5471
 kmalloc_reserve net/core/skbuff.c:637 [inline]
 pskb_expand_head+0x22c/0x13a0 net/core/skbuff.c:2306
 __skb_cow include/linux/skbuff.h:3880 [inline]
 skb_cow_head include/linux/skbuff.h:3914 [inline]
 batadv_skb_head_push+0x169/0x200 net/batman-adv/mesh-interface.c:73
 batadv_send_skb_packet+0xc8/0x650 net/batman-adv/send.c:81
 batadv_iv_ogm_send_to_if net/batman-adv/bat_iv_ogm.c:400 [inline]
 batadv_iv_ogm_emit net/batman-adv/bat_iv_ogm.c:428 [inline]
 batadv_iv_send_outstanding_bat_ogm_packet+0x5e8/0x790 net/batman-adv/bat_iv_ogm.c:1795
 process_one_work kernel/workqueue.c:3322 [inline]
 process_scheduled_works+0xa8e/0x14e0 kernel/workqueue.c:3405
 worker_thread+0xa47/0xfb0 kernel/workqueue.c:3486
 kthread+0x388/0x470 kernel/kthread.c:436
 ret_from_fork+0x514/0xb70 arch/x86/kernel/process.c:158
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245

Freed by task 1029:
 kasan_save_stack mm/kasan/common.c:57 [inline]
 kasan_save_track+0x3e/0x80 mm/kasan/common.c:78
 kasan_save_free_info+0x40/0x50 mm/kasan/generic.c:584
 poison_slab_object mm/kasan/common.c:253 [inline]
 __kasan_slab_free+0x5c/0x80 mm/kasan/common.c:285
 kasan_slab_free include/linux/kasan.h:235 [inline]
 slab_free_hook mm/slub.c:2677 [inline]
 slab_free mm/slub.c:6377 [inline]
 kfree+0x1c5/0x6c0 mm/slub.c:6692
 skb_kfree_head net/core/skbuff.c:1077 [inline]
 skb_free_head net/core/skbuff.c:1089 [inline]
 skb_release_data+0x85e/0xab0 net/core/skbuff.c:1116
 skb_release_all net/core/skbuff.c:1191 [inline]
 __kfree_skb+0x5d/0x210 net/core/skbuff.c:1205
 kfree_skb_reason include/linux/skbuff.h:1323 [inline]
 __netif_receive_skb_core+0x2b5c/0x30b0 net/core/dev.c:6186
 __netif_receive_skb_one_core net/core/dev.c:6210 [inline]
 __netif_receive_skb net/core/dev.c:6325 [inline]
 process_backlog+0x351/0xc50 net/core/dev.c:6676
 __napi_poll+0xae/0x550 net/core/dev.c:7735
 napi_poll net/core/dev.c:7798 [inline]
 net_rx_action+0x621/0xd70 net/core/dev.c:7955
 handle_softirqs+0x1d9/0x6c0 kernel/softirq.c:622
 __do_softirq kernel/softirq.c:656 [inline]
 __local_bh_enable_ip+0x170/0x2b0 kernel/softirq.c:302
 local_bh_enable include/linux/bottom_half.h:33 [inline]
 rcu_read_unlock_bh include/linux/rcupdate.h:914 [inline]
 __dev_queue_xmit+0x1ee9/0x3880 net/core/dev.c:4913
 dev_queue_xmit include/linux/netdevice.h:3446 [inline]
 batadv_send_skb_packet+0x400/0x650 net/batman-adv/send.c:100
 batadv_iv_ogm_send_to_if net/batman-adv/bat_iv_ogm.c:400 [inline]
 batadv_iv_ogm_emit net/batman-adv/bat_iv_ogm.c:428 [inline]
 batadv_iv_send_outstanding_bat_ogm_packet+0x5e8/0x790 net/batman-adv/bat_iv_ogm.c:1795
 process_one_work kernel/workqueue.c:3322 [inline]
 process_scheduled_works+0xa8e/0x14e0 kernel/workqueue.c:3405
 worker_thread+0xa47/0xfb0 kernel/workqueue.c:3486
 kthread+0x388/0x470 kernel/kthread.c:436
 ret_from_fork+0x514/0xb70 arch/x86/kernel/process.c:158
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245

The buggy address belongs to the object at ffff88803bfae800
 which belongs to the cache kmalloc-1k of size 1024
The buggy address is located 128 bytes inside of
 freed 1024-byte region [ffff88803bfae800, ffff88803bfaec00)

The buggy address belongs to the physical page:
page: refcount:0 mapcount:0 mapping:0000000000000000 index:0x0 pfn:0x3bfa8
head: order:3 mapcount:0 entire_mapcount:0 nr_pages_mapped:0 pincount:0
flags: 0x80000000000040(head|node=0|zone=1)
page_type: f5(slab)
raw: 0080000000000040 ffff88813ffb1dc0 dead000000000100 dead000000000122
raw: 0000000000000000 0000000800100010 00000000f5000000 0000000000000000
head: 0080000000000040 ffff88813ffb1dc0 dead000000000100 dead000000000122
head: 0000000000000000 0000000800100010 00000000f5000000 0000000000000000
head: 0080000000000003 fffffffffffffe01 00000000ffffffff 00000000ffffffff
head: 0000000000000000 0000000000000000 00000000ffffffff 0000000000000008
page dumped because: kasan: bad access detected
page_owner tracks the page as allocated
page last allocated via order 3, migratetype Unmovable, gfp_mask 0xd20c0(__GFP_IO|__GFP_FS|__GFP_NOWARN|__GFP_NORETRY|__GFP_COMP|__GFP_NOMEMALLOC), pid 5381, tgid 5381 (dhcpcd-run-hook), ts 55321250949, free_ts 55230640080
 set_page_owner include/linux/page_owner.h:32 [inline]
 post_alloc_hook+0x1f9/0x250 mm/page_alloc.c:1859
 prep_new_page mm/page_alloc.c:1867 [inline]
 get_page_from_freelist+0x262a/0x26a0 mm/page_alloc.c:3946
 __alloc_frozen_pages_noprof+0x18d/0x380 mm/page_alloc.c:5304
 alloc_slab_page mm/slub.c:3266 [inline]
 allocate_slab+0x79/0x5e0 mm/slub.c:3380
 new_slab mm/slub.c:3426 [inline]
 refill_objects+0x2d8/0x350 mm/slub.c:7310
 refill_sheaf mm/slub.c:2804 [inline]
 __pcs_replace_empty_main+0x330/0x690 mm/slub.c:4675
 alloc_from_pcs mm/slub.c:4773 [inline]
 slab_alloc_node mm/slub.c:4905 [inline]
 __do_kmalloc_node mm/slub.c:5333 [inline]
 __kmalloc_noprof+0x544/0x780 mm/slub.c:5359
 _kmalloc_noprof include/linux/slab.h:992 [inline]
 load_elf_phdrs+0x13e/0x240 fs/binfmt_elf.c:540
 load_elf_binary+0xa2f/0x2970 fs/binfmt_elf.c:969
 search_binary_handler fs/exec.c:1694 [inline]
 exec_binprm fs/exec.c:1726 [inline]
 bprm_execve+0x926/0x14b0 fs/exec.c:1778
 do_execveat_common+0x4f4/0x670 fs/exec.c:1876
 __do_sys_execve fs/exec.c:1949 [inline]
 __se_sys_execve fs/exec.c:1943 [inline]
 __x64_sys_execve+0x97/0xc0 fs/exec.c:1943
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0x174/0x580 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
page last free pid 5377 tgid 5377 stack trace:
 reset_page_owner include/linux/page_owner.h:25 [inline]
 __free_pages_prepare mm/page_alloc.c:1406 [inline]
 __free_frozen_pages+0x10e7/0x11c0 mm/page_alloc.c:2950
 __slab_free+0x252/0x2a0 mm/slub.c:5741
 qlink_free mm/kasan/quarantine.c:163 [inline]
 qlist_free_all+0x99/0x100 mm/kasan/quarantine.c:179
 kasan_quarantine_reduce+0x148/0x160 mm/kasan/quarantine.c:286
 __kasan_slab_alloc+0x22/0x80 mm/kasan/common.c:350
 kasan_slab_alloc include/linux/kasan.h:253 [inline]
 slab_post_alloc_hook mm/slub.c:4584 [inline]
 slab_alloc_node mm/slub.c:4917 [inline]
 kmem_cache_alloc_noprof+0x355/0x650 mm/slub.c:4931
 alloc_filename fs/namei.c:147 [inline]
 do_getname+0x2e/0x250 fs/namei.c:187
 class_filename_flags_constructor include/linux/fs.h:2566 [inline]
 do_sys_openat2+0xcc/0x200 fs/open.c:1367
 do_sys_open fs/open.c:1374 [inline]
 __do_sys_openat fs/open.c:1390 [inline]
 __se_sys_openat fs/open.c:1385 [inline]
 __x64_sys_openat+0x138/0x170 fs/open.c:1385
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0x174/0x580 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f

Memory state around the buggy address:
 ffff88803bfae780: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
 ffff88803bfae800: fa fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
>ffff88803bfae880: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
                   ^
 ffff88803bfae900: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
 ffff88803bfae980: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
==================================================================


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

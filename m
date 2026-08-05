Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com [209.85.167.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D032337F303
	for <linux-usb@vger.kernel.org>; Wed,  5 Aug 2026 18:51:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785955902; cv=none; b=R/i0doN4zyYhR2jdhGtmYR0ZQzz0/xqtHNh1QeNN714xRAOu2DrqmtsS+mN5oAiNdT4d3EESVVPGOQQ+MgiiFLzzsRQ4uc7YzyLVuaSxnVo0TzF9oYK7S6xz2uzY7WN/CG0bCmVopwtDfquLSXnDVGgIjN5v8Jz/8O/OwzKvgYc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785955902; c=relaxed/simple;
	bh=eHnY/giIcUsajRYTWmCQLHOqo8rzWGU4tLBiWNaXs+U=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=bC135sMjw8OcKDgDHK7wXrxMQM34u+1S+FNhsR2mjueMHfrRf/txLGl3cq+3PiOn2wg5CrWgHn2kGJgxz+o9m4vktwGPy72iY7FV+Mf5fpUezxwGTXw5TxNR8uQtQWxsp8Nmy+kv0KZSWLj47V2miR0dbzLl/SIJv59YSIee4Z0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f198.google.com with SMTP id 5614622812f47-4a7c64fbbc6so745796b6e.2
        for <linux-usb@vger.kernel.org>; Wed, 05 Aug 2026 11:51:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785955900; x=1786560700;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=myUSEuv5OsVn+gs3S2ybaqKB7b3dFBFaLx4qnx5QayQ=;
        b=Qzz8VOpCH8w9pdWkrOiaf1OBVpx6nyxW/3OerKF5lMgpMCRZQ3CpmrhbwyVxpZgA8O
         xZd5hilNLNsJiNAYbSlemuoZqtnIREOtmBkOK9hHEws+mwdiZ7uQzcixsBV/xHppO4X7
         V7E0rnYcCxrJ0kp3ZZ59DYa+mVJ4BHzvrzUHcnl2b/Zoc2xKQMpQ9adhvJTF6D/aoG+H
         oqJAb6NXYCW8Rtioq8VPq/BLxepjnGypIgpprR/tMwkInqRXdlqG+C82JpcsGk7HhKIA
         quTpbtoRiu1b4dwXxhYoPFqkKN4R4n4LB34+Fun4+3Z0iiYUPru+HBHsJ1kT41MMhwKC
         wsgA==
X-Forwarded-Encrypted: i=1; AHgh+RoR/yzNlMQVJeBdlVtZsywVol6bfjQ4xqw+amULktWRZRJXukYuBJlW2yQdOlvC7/rh9Cj3Epow/iw=@vger.kernel.org
X-Gm-Message-State: AOJu0YxP8YyTeDv3B85WJo0DlRssyDfcr2ob13nO4Kxp9Cn7zTx87t/n
	QyJHCZLGE48juNHUuNFAOs+WzvAq9DPKiLh0UdI5xizsQWNCZEgCfnUFvLmdvs0acyV/pxWaiN6
	UNn+yxKZP4PWXR97p4ZuGdLhYcj7T8IUiCez/m/7BgH1KbUxC+4I3lxyvn7E=
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:98d:b0:69e:b8:ffe4 with SMTP id
 006d021491bc7-6ae9702dfa4mr4582891eaf.32.1785955899811; Wed, 05 Aug 2026
 11:51:39 -0700 (PDT)
Date: Wed, 05 Aug 2026 11:51:39 -0700
In-Reply-To: <6a714999.13623e66.bdc14.0009.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6a73863b.01d0871a.3a0d52.0000.GAE@google.com>
Subject: Re: [syzbot] [usb?] KASAN: slab-use-after-free Write in gadgetfs_kill_sb
From: syzbot <syzbot+4a5c87a01894ca37f25c@syzkaller.appspotmail.com>
To: gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

syzbot has found a reproducer for the following issue on:

HEAD commit:    0d8395707651 Merge tag 'soc-fixes-7.2-2' of git://git.kern..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=13d52bb9580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=cb17729fb04b1e3a
dashboard link: https://syzkaller.appspot.com/bug?extid=4a5c87a01894ca37f25c
compiler:       Debian clang version 22.1.8 (++20260613092233+e80beda6e255-1~exp1~20260613092250.77), Debian LLD 22.1.8
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=14da0132580000

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+4a5c87a01894ca37f25c@syzkaller.appspotmail.com

 </TASK>
udc dummy_udc.0: failed to start USB Gadget filesystem: -12
gadgetfs gadget.0: probe with driver gadgetfs failed with error -12
gadgetfs: bound to dummy_udc driver
==================================================================
BUG: KASAN: slab-use-after-free in instrument_atomic_read_write include/linux/instrumented.h:112 [inline]
BUG: KASAN: slab-use-after-free in atomic_fetch_sub_release include/linux/atomic/atomic-instrumented.h:400 [inline]
BUG: KASAN: slab-use-after-free in __refcount_sub_and_test include/linux/refcount.h:389 [inline]
BUG: KASAN: slab-use-after-free in __refcount_dec_and_test include/linux/refcount.h:432 [inline]
BUG: KASAN: slab-use-after-free in refcount_dec_and_test include/linux/refcount.h:450 [inline]
BUG: KASAN: slab-use-after-free in put_dev drivers/usb/gadget/legacy/inode.c:165 [inline]
BUG: KASAN: slab-use-after-free in gadgetfs_kill_sb+0x46/0x110 drivers/usb/gadget/legacy/inode.c:2104
Write of size 4 at addr ffff888034069080 by task syz-executor187/5951

CPU: 0 UID: 0 PID: 5951 Comm: syz-executor187 Not tainted syzkaller #0 PREEMPT_{RT,(full)} 
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
 resume_user_mode_work include/linux/resume_user_mode.h:50 [inline]
 __exit_to_user_mode_loop kernel/entry/common.c:70 [inline]
 exit_to_user_mode_loop+0x1fa/0x730 kernel/entry/common.c:101
 __exit_to_user_mode_prepare include/linux/irq-entry-common.h:207 [inline]
 syscall_exit_to_user_mode_prepare include/linux/irq-entry-common.h:230 [inline]
 syscall_exit_to_user_mode include/linux/entry-common.h:318 [inline]
 do_syscall_64+0x353/0x580 arch/x86/entry/syscall_64.c:100
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f9c403c3027
Code: a2 c7 05 54 b0 08 00 00 00 00 00 eb 96 e8 a1 08 00 00 90 31 f6 e9 09 00 00 00 66 0f 1f 84 00 00 00 00 00 b8 a6 00 00 00 0f 05 <48> 3d 00 f0 ff ff 77 01 c3 48 c7 c2 d8 ff ff ff f7 d8 64 89 02 b8
RSP: 002b:00007ffc402c5578 EFLAGS: 00000246 ORIG_RAX: 00000000000000a6
RAX: 0000000000000000 RBX: 0000000000000003 RCX: 00007f9c403c3027
RDX: 0000000000000000 RSI: 0000000000000000 RDI: 00007f9c4041d05e
RBP: 00007f9c4041d05e R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 00007f9c4041d623
R13: 00007ffc402c56d0 R14: 00007f9c4041f510 R15: 00007f9c4041f4e8
 </TASK>

Allocated by task 5951:
 kasan_save_stack mm/kasan/common.c:57 [inline]
 kasan_save_track+0x3e/0x80 mm/kasan/common.c:78
 poison_kmalloc_redzone mm/kasan/common.c:398 [inline]
 __kasan_kmalloc+0x93/0xb0 mm/kasan/common.c:415
 kasan_kmalloc include/linux/kasan.h:263 [inline]
 __kmalloc_cache_noprof+0x3d2/0x6b0 mm/slub.c:5489
 _kmalloc_noprof include/linux/slab.h:988 [inline]
 _kzalloc_noprof include/linux/slab.h:1309 [inline]
 dev_new drivers/usb/gadget/legacy/inode.c:176 [inline]
 gadgetfs_fill_super+0x27b/0x7a0 drivers/usb/gadget/legacy/inode.c:2054
 vfs_get_super fs/super.c:1273 [inline]
 get_tree_single+0xc0/0x150 fs/super.c:1300
 vfs_get_tree+0x92/0x2a0 fs/super.c:1700
 fc_mount fs/namespace.c:1198 [inline]
 do_new_mount_fc fs/namespace.c:3765 [inline]
 do_new_mount+0x319/0xdc0 fs/namespace.c:3841
 do_mount fs/namespace.c:4174 [inline]
 __do_sys_mount fs/namespace.c:4390 [inline]
 __se_sys_mount+0x31d/0x420 fs/namespace.c:4367
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0x174/0x580 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f

Freed by task 5951:
 kasan_save_stack mm/kasan/common.c:57 [inline]
 kasan_save_track+0x3e/0x80 mm/kasan/common.c:78
 kasan_save_free_info+0x40/0x50 mm/kasan/generic.c:584
 poison_slab_object mm/kasan/common.c:253 [inline]
 __kasan_slab_free+0x5c/0x80 mm/kasan/common.c:285
 kasan_slab_free include/linux/kasan.h:235 [inline]
 slab_free_hook mm/slub.c:2677 [inline]
 slab_free mm/slub.c:6377 [inline]
 kfree+0x1c5/0x6c0 mm/slub.c:6692
 put_dev drivers/usb/gadget/legacy/inode.c:169 [inline]
 dev_release+0x173/0x210 drivers/usb/gadget/legacy/inode.c:1215
 __fput+0x42a/0xa80 fs/file_table.c:512
 fput_close_sync+0x11f/0x240 fs/file_table.c:617
 __do_sys_close fs/open.c:1511 [inline]
 __se_sys_close fs/open.c:1496 [inline]
 __x64_sys_close+0x7e/0x110 fs/open.c:1496
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0x174/0x580 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f

The buggy address belongs to the object at ffff888034069000
 which belongs to the cache kmalloc-1k of size 1024
The buggy address is located 128 bytes inside of
 freed 1024-byte region [ffff888034069000, ffff888034069400)

The buggy address belongs to the physical page:
page: refcount:0 mapcount:0 mapping:0000000000000000 index:0xffff888034069800 pfn:0x34068
head: order:3 mapcount:0 entire_mapcount:0 nr_pages_mapped:0 pincount:0
flags: 0x80000000000240(workingset|head|node=0|zone=1)
page_type: f5(slab)
raw: 0080000000000240 ffff88813ffb2dc0 ffffea0000d33e10 ffffea0000a85210
raw: ffff888034069800 0000000800100007 00000000f5000000 0000000000000000
head: 0080000000000240 ffff88813ffb2dc0 ffffea0000d33e10 ffffea0000a85210
head: ffff888034069800 0000000800100007 00000000f5000000 0000000000000000
head: 0080000000000003 fffffffffffffe01 00000000ffffffff 00000000ffffffff
head: 0000000000000000 0000000000000000 00000000ffffffff 0000000000000008
page dumped because: kasan: bad access detected
page_owner tracks the page as allocated
page last allocated via order 3, migratetype Unmovable, gfp_mask 0xd20c0(__GFP_IO|__GFP_FS|__GFP_NOWARN|__GFP_NORETRY|__GFP_COMP|__GFP_NOMEMALLOC), pid 5659, tgid 5659 (syz-executor), ts 91566899744, free_ts 90984522889
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
 __kmalloc_cache_noprof+0x468/0x6b0 mm/slub.c:5485
 _kmalloc_noprof include/linux/slab.h:988 [inline]
 _kzalloc_noprof include/linux/slab.h:1309 [inline]
 afs_alloc_call+0x79/0x580 fs/afs/rxrpc.c:171
 afs_charge_preallocation+0x273/0x570 fs/afs/rxrpc.c:755
 afs_open_socket+0x33c/0x3f0 fs/afs/rxrpc.c:112
 afs_net_init+0x6ce/0x8f0 fs/afs/main.c:116
 ops_init+0x35d/0x5d0 net/core/net_namespace.c:137
 setup_net+0x118/0x350 net/core/net_namespace.c:446
 copy_net_ns+0x4f9/0x720 net/core/net_namespace.c:579
 create_new_namespaces+0x3f0/0x6b0 kernel/nsproxy.c:132
 unshare_nsproxy_namespaces+0x149/0x190 kernel/nsproxy.c:234
page last free pid 10 tgid 10 stack trace:
 reset_page_owner include/linux/page_owner.h:25 [inline]
 __free_pages_prepare mm/page_alloc.c:1406 [inline]
 __free_frozen_pages+0x10e7/0x11c0 mm/page_alloc.c:2950
 kasan_depopulate_vmalloc_pte+0x6d/0x90 mm/kasan/shadow.c:484
 apply_to_pte_range mm/memory.c:3338 [inline]
 apply_to_pmd_range mm/memory.c:3382 [inline]
 apply_to_pud_range mm/memory.c:3418 [inline]
 apply_to_p4d_range mm/memory.c:3454 [inline]
 __apply_to_page_range+0xbd8/0x1420 mm/memory.c:3490
 __kasan_release_vmalloc+0xa2/0xd0 mm/kasan/shadow.c:602
 kasan_release_vmalloc include/linux/kasan.h:593 [inline]
 kasan_release_vmalloc_node mm/vmalloc.c:2284 [inline]
 purge_vmap_node+0x220/0x960 mm/vmalloc.c:2306
 __purge_vmap_area_lazy+0x783/0xb40 mm/vmalloc.c:2396
 drain_vmap_area_work+0x27/0x40 mm/vmalloc.c:2430
 process_one_work kernel/workqueue.c:3322 [inline]
 process_scheduled_works+0xa8e/0x14e0 kernel/workqueue.c:3405
 worker_thread+0xa47/0xfb0 kernel/workqueue.c:3486
 kthread+0x388/0x470 kernel/kthread.c:436
 ret_from_fork+0x514/0xb70 arch/x86/kernel/process.c:158
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245

Memory state around the buggy address:
 ffff888034068f80: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
 ffff888034069000: fa fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
>ffff888034069080: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
                   ^
 ffff888034069100: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
 ffff888034069180: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
==================================================================


---
If you want syzbot to run the reproducer, reply with:
#syz test: git://repo/address.git branch-or-commit-hash
If you attach or paste a git patch, syzbot will apply it before testing.

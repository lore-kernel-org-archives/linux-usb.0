Received: from mail-oi1-f207.google.com (mail-oi1-f207.google.com [209.85.167.207])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26AA948987D
	for <linux-usb@vger.kernel.org>; Thu, 30 Jul 2026 00:09:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.207
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785370166; cv=none; b=NEMl5cPfDbJTC00//5OqSoD5icNYeGYUi9D/rQaLurECfZN+MxwomHJ0xFaPE28mbpRqG3UpZalxZUGOIKArIG7voPzy9a8ky0n9jVrmWt23Mg30X8ac5FxKc87gxk6erUbz+fZ+kUxEq3kTQIQPsPiM/RJ8CGuHdlGG4P7qGUA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785370166; c=relaxed/simple;
	bh=lAAYqDbIPuCYnSPHteNODapGhW04ZC37JIkvaf1moXs=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=pmi3iy94ZvrAJAq7mYTCPMGddbpfEMTcH6CtSLSw3fWyf27sCW/LU2VNu1gyi6ul3tIx4iNMlZ5t1cFsPcayvXDUxXFyYNaGjbdVxlK1udK61H76hHaOy5ezSURqvG0b8m+vpXcEyjDlT6PQRrOKje9pZ+E5Wf5pf9z8aVLFW8Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.207
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f207.google.com with SMTP id 5614622812f47-4a41f46d629so1486567b6e.3
        for <linux-usb@vger.kernel.org>; Wed, 29 Jul 2026 17:09:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785370164; x=1785974964;
        h=content-type:to:from:subject:message-id:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oL5x4uH947nR+JyoMZHE7IrCybRaB9g++DbekDwZSS0=;
        b=ohGQqVZXQsxd8H4RvaH6JGhmq0l+WV4hxu8Y4z+PM2sQ9QuJ1rdar7SBdeH/HeJGiZ
         wVsggwJdw/1CKVs/UfLmACiDbfcewYJ8Ec6oM3OtBEoovNYwlHn6k/6F+xTSDuBOIK/H
         oIppEET4sMJbfXxYGIF3Jsj+Z/6FNIG8ZQc6QkmJNBJGYoilMdd2z0gkddtGiUPki6ZI
         G+je3PyW/T0PqXDiI/aI5KqLXLFqMhoepaDdKfJ5zLiXaT6spJ3tLCWiX8l6qP0gXkHb
         1KnaZQumtY0iIVf1kdVGycebhYNXWIrpiwn5CgFIu48aZjmQqeMqckHAXS2qeBLq4mee
         kwtw==
X-Forwarded-Encrypted: i=1; AHgh+RrGx/puiRGViHzeHwKJ8h1bWz/oREicXO790mCtg/KaR2XSTHsJufB16iZcNxfR/i8rfq+AWNVN/1w=@vger.kernel.org
X-Gm-Message-State: AOJu0YzOKMXkHLzni4lFMgjOI8lEveysdZ7KHz7LepbVbNykNfa5ojxW
	wi8j6LqFCAmqWX74S3qxP9SGxr+L4eoZVmBrrd8ZWzJgXQ0kZwX2kc6r/koDz4BY7oM9+yXyFmc
	dhSmOIL1AcNqfITWPBrZpKaY47v74IjafNhevXhYKfBOTXhwtQxECXbm2moc=
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:1905:b0:496:7ba:89c5 with SMTP id
 5614622812f47-4ad87a19665mr339274b6e.41.1785370164035; Wed, 29 Jul 2026
 17:09:24 -0700 (PDT)
Date: Wed, 29 Jul 2026 17:09:24 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6a6a9634.57649fcc.360844.0009.GAE@google.com>
Subject: [syzbot] [usb?] KASAN: invalid-free in f_uac2_opts_p_srate_store
From: syzbot <syzbot+38bab69d2760cc99cfbe@syzkaller.appspotmail.com>
To: gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    fc02acf6ac0c Merge tag 'platform-drivers-x86-v7.2-4' of gi..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=15e7f8c6580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=cb17729fb04b1e3a
dashboard link: https://syzkaller.appspot.com/bug?extid=38bab69d2760cc99cfbe
compiler:       Debian clang version 22.1.8 (++20260613092233+e80beda6e255-1~exp1~20260613092250.77), Debian LLD 22.1.8
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=144dc561580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=16c309b9580000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/b3bff1d63ddf/disk-fc02acf6.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/04efa97b7fb6/vmlinux-fc02acf6.xz
kernel image: https://storage.googleapis.com/syzbot-assets/be724b7ea80c/bzImage-fc02acf6.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+38bab69d2760cc99cfbe@syzkaller.appspotmail.com

==================================================================
BUG: KASAN: invalid-free in f_uac2_opts_p_srate_store+0x225/0x2b0 drivers/usb/gadget/function/f_uac2.c:2087
Free of addr ffff8880360a68c6 by task syz.0.17/5957

CPU: 1 UID: 0 PID: 5957 Comm: syz.0.17 Not tainted syzkaller #0 PREEMPT_{RT,(full)} 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 07/16/2026
Call Trace:
 <TASK>
 dump_stack_lvl+0xe8/0x150 lib/dump_stack.c:120
 print_address_description+0x55/0x1e0 mm/kasan/report.c:378
 print_report+0x58/0x70 mm/kasan/report.c:482
 kasan_report_invalid_free+0xea/0x110 mm/kasan/report.c:557
 check_slab_allocation mm/kasan/common.c:-1 [inline]
 __kasan_slab_pre_free+0x104/0x120 mm/kasan/common.c:261
 kasan_slab_pre_free include/linux/kasan.h:199 [inline]
 slab_free_hook mm/slub.c:2622 [inline]
 slab_free mm/slub.c:6377 [inline]
 kfree+0x173/0x6c0 mm/slub.c:6692
 f_uac2_opts_p_srate_store+0x225/0x2b0 drivers/usb/gadget/function/f_uac2.c:2087
 flush_write_buffer fs/configfs/file.c:207 [inline]
 configfs_write_iter+0x33a/0x430 fs/configfs/file.c:229
 new_sync_write fs/read_write.c:595 [inline]
 vfs_write+0x61e/0xbb0 fs/read_write.c:687
 ksys_write+0x156/0x270 fs/read_write.c:739
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0x174/0x580 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f8571a7de99
Code: ff c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 44 00 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 e8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007ffd19d11828 EFLAGS: 00000246 ORIG_RAX: 0000000000000001
RAX: ffffffffffffffda RBX: 00007f8571d05fa0 RCX: 00007f8571a7de99
RDX: 0000000000000020 RSI: 0000200000000040 RDI: 0000000000000003
RBP: 00007f8571b13eaf R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000000
R13: 00007f8571d05fac R14: 00007f8571d05fa0 R15: 00007f8571d05fa0
 </TASK>

Allocated by task 5957:
 kasan_save_stack mm/kasan/common.c:57 [inline]
 kasan_save_track+0x3e/0x80 mm/kasan/common.c:78
 poison_kmalloc_redzone mm/kasan/common.c:398 [inline]
 __kasan_kmalloc+0x93/0xb0 mm/kasan/common.c:415
 kasan_kmalloc include/linux/kasan.h:263 [inline]
 __do_kmalloc_node mm/slub.c:5334 [inline]
 __kmalloc_node_track_caller_noprof+0x57f/0x7c0 mm/slub.c:5471
 __kmemdup_nul mm/util.c:64 [inline]
 kstrdup+0x42/0x100 mm/util.c:84
 f_uac2_opts_p_srate_store+0x11f/0x2b0 drivers/usb/gadget/function/f_uac2.c:2087
 flush_write_buffer fs/configfs/file.c:207 [inline]
 configfs_write_iter+0x33a/0x430 fs/configfs/file.c:229
 new_sync_write fs/read_write.c:595 [inline]
 vfs_write+0x61e/0xbb0 fs/read_write.c:687
 ksys_write+0x156/0x270 fs/read_write.c:739
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0x174/0x580 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f

The buggy address belongs to the object at ffff8880360a68c0
 which belongs to the cache kmalloc-32 of size 32
The buggy address is located 6 bytes inside of
 32-byte region [ffff8880360a68c0, ffff8880360a68e0)

The buggy address belongs to the physical page:
page: refcount:0 mapcount:0 mapping:0000000000000000 index:0xffff8880360a6000 pfn:0x360a6
flags: 0x80000000000200(workingset|node=0|zone=1)
page_type: f5(slab)
raw: 0080000000000200 ffff88813ffb1780 ffffea0000e30c50 ffffea0000d95110
raw: ffff8880360a6000 000000080040003a 00000000f5000000 0000000000000000
page dumped because: kasan: bad access detected
page_owner tracks the page as allocated
page last allocated via order 0, migratetype Unmovable, gfp_mask 0xd2c40(GFP_NOFS|__GFP_NOWARN|__GFP_NORETRY|__GFP_COMP|__GFP_NOMEMALLOC), pid 5617, tgid 5617 (udevd), ts 90717372327, free_ts 90687047252
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
 _kzalloc_noprof include/linux/slab.h:1309 [inline]
 tomoyo_encode2 security/tomoyo/realpath.c:45 [inline]
 tomoyo_encode+0x2ad/0x570 security/tomoyo/realpath.c:80
 tomoyo_realpath_from_path+0x5fa/0x640 security/tomoyo/realpath.c:283
 tomoyo_get_realpath security/tomoyo/file.c:151 [inline]
 tomoyo_check_open_permission+0x229/0x470 security/tomoyo/file.c:776
 security_file_open+0xa9/0x240 security/security.c:2739
 do_dentry_open+0x4be/0x1420 fs/open.c:924
 vfs_open+0x3b/0x350 fs/open.c:1052
 do_open fs/namei.c:4700 [inline]
 path_openat+0x2e60/0x3850 fs/namei.c:4863
 do_file_open+0x23e/0x4a0 fs/namei.c:4892
 do_sys_openat2+0x115/0x200 fs/open.c:1368
page last free pid 20 tgid 20 stack trace:
 reset_page_owner include/linux/page_owner.h:25 [inline]
 __free_pages_prepare mm/page_alloc.c:1406 [inline]
 __free_frozen_pages+0x10e7/0x11c0 mm/page_alloc.c:2950
 __tlb_remove_table_free mm/mmu_gather.c:228 [inline]
 tlb_remove_table_rcu+0x85/0x100 mm/mmu_gather.c:291
 rcu_do_batch kernel/rcu/tree.c:2645 [inline]
 rcu_core kernel/rcu/tree.c:2897 [inline]
 rcu_cpu_kthread+0x950/0x1480 kernel/rcu/tree.c:2985
 smpboot_thread_fn+0x57c/0xa80 kernel/smpboot.c:160
 kthread+0x388/0x470 kernel/kthread.c:436
 ret_from_fork+0x514/0xb70 arch/x86/kernel/process.c:158
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245

Memory state around the buggy address:
 ffff8880360a6780: fa fb fb fb fc fc fc fc fa fb fb fb fc fc fc fc
 ffff8880360a6800: fa fb fb fb fc fc fc fc fa fb fb fb fc fc fc fc
>ffff8880360a6880: fa fb fb fb fc fc fc fc 00 00 00 00 fc fc fc fc
                                           ^
 ffff8880360a6900: 00 00 03 fc fc fc fc fc fa fb fb fb fc fc fc fc
 ffff8880360a6980: 00 00 00 00 fc fc fc fc fa fb fb fb fc fc fc fc
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

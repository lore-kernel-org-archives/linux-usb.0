Received: from mail-oo1-f79.google.com (mail-oo1-f79.google.com [209.85.161.79])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CD1F2D8376
	for <linux-usb@vger.kernel.org>; Wed, 29 Jul 2026 05:27:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.79
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785302851; cv=none; b=GPMsD1+DREzA42Fhut6WMKY9qElccAz+17lT/HghDoCN3hkriV/ZMVkqm0Lbo9PaEkCnRiibfQ5fEBVZmJY+QCCwthaOXvQ93xiz9havvDG2E3JCHjkTX8t09ThsCigd7tr+BP71pKLZSY1u5yi0gqHTNISIc2r7cMq1S6MxMa8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785302851; c=relaxed/simple;
	bh=wpx7lMdpMSZJhkaSOhm/0ZtyMHnzjxDsu5vQh8KMxyU=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=awthKUzjGXnXPXcOnJAYMspOUOxOQgmLShBIPdG4/Px2cteIhng7QXekxv4m9Qbd/LD2bYo6w03WuJ2/Anhzajvph8ul3WzEOC1C3UC6LXhtR+Wp9urfH/Z16n0poeifx7S1bjUyqO1sMzOVa6Pgc4KarNFFTE9hsBMdIYG9USE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.161.79
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oo1-f79.google.com with SMTP id 006d021491bc7-6a3a3151b3fso401791eaf.1
        for <linux-usb@vger.kernel.org>; Tue, 28 Jul 2026 22:27:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785302849; x=1785907649;
        h=content-type:to:from:subject:message-id:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=y6qQWu0scSRBlCzcYu8f441cc4q4XDfoGjKNjI1ISV0=;
        b=p2rIe6Ggj0naQDAitHwjWrNEo+RWQit7iZnKO/ONjOhfedZbRL6ylrUeoKVThfCvzg
         ytfidfACSulTd1CGXzRIYLuWnIdQ+vSyqSJxYIAd0G5XvjLWU47faE/whkmaq20CoFJ/
         3jwoHy+9UC85mqs/YCd8al01RDQrFiIgyryOVXybX6eiuS7J6hLbm00dO8MGhdMLXM0u
         BsoJyeL+7a3c9fGfOh0mS2bw4KQk2FvPbGhoumYdNVoTz7w9gp4V2muxK0gef7qxXF5F
         lcIz87PaQPK9vx5ojzGx8n4oERQC7B+ZCSYiXKl04Ni6E5KRhHlBVA0iH4CVW+DVReMt
         Ii6Q==
X-Forwarded-Encrypted: i=1; AHgh+RpTREntdi+wX6WepQIl7tq8hNV9QvpCK9WSg02r1gxCO6rgisnwrsa59JdFaU7QN+emY3eaG1KSKEw=@vger.kernel.org
X-Gm-Message-State: AOJu0YxFtI0he1AQoG7psuif5ngOVIJXg0BKhh3ikXRszx4pPFoLcv41
	Gzs7xrbNaUJQ9VWtGqP5DLwGo3STAcRcAs50AENXmkY6O+1TqODJGlZ5akYfYbt3JFFQx+FE98S
	hEcX/yZ3uSewgy6joPXm3E0MIpeNiT5q6XkZ0TyoOrzoI4xMs/OupTkBPRrA=
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a4a:ee87:0:b0:6a1:50f0:ccc9 with SMTP id
 006d021491bc7-6ac96d20d75mr2519200eaf.62.1785302849139; Tue, 28 Jul 2026
 22:27:29 -0700 (PDT)
Date: Tue, 28 Jul 2026 22:27:29 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6a698f41.d9e86bb5.297b12.0051.GAE@google.com>
Subject: [syzbot] [usb?] KASAN: invalid-free in f_uac2_opts_c_srate_store
From: syzbot <syzbot+a4f65284f1451010b0a8@syzkaller.appspotmail.com>
To: gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    3dab139d4795 Merge tag 'rust-fixes-7.2-2' of git://git.ker..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=10e2b746580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=145fa60d73086782
dashboard link: https://syzkaller.appspot.com/bug?extid=a4f65284f1451010b0a8
compiler:       gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=1466a449580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=12d83fde580000

Downloadable assets:
disk image (non-bootable): https://storage.googleapis.com/syzbot-assets/d900f083ada3/non_bootable_disk-3dab139d.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/2b5a401a9dc7/vmlinux-3dab139d.xz
kernel image: https://storage.googleapis.com/syzbot-assets/7ed2d255bd44/bzImage-3dab139d.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+a4f65284f1451010b0a8@syzkaller.appspotmail.com

==================================================================
BUG: KASAN: invalid-free in f_uac2_opts_c_srate_store+0x1d4/0x260 drivers/usb/gadget/function/f_uac2.c:2091
Free of addr ffff88802a89370c by task syz.0.17/5924

CPU: 0 UID: 0 PID: 5924 Comm: syz.0.17 Not tainted syzkaller #0 PREEMPT(full) 
Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.3-debian-1.16.3-2 04/01/2014
Call Trace:
 <TASK>
 __dump_stack lib/dump_stack.c:94 [inline]
 dump_stack_lvl+0x100/0x190 lib/dump_stack.c:120
 print_address_description mm/kasan/report.c:378 [inline]
 print_report+0x13d/0x4b0 mm/kasan/report.c:482
 kasan_report_invalid_free+0xb8/0x190 mm/kasan/report.c:557
 check_slab_allocation+0xe1/0xf0 mm/kasan/common.c:230
 kasan_slab_pre_free include/linux/kasan.h:199 [inline]
 slab_free_hook mm/slub.c:2622 [inline]
 slab_free mm/slub.c:6377 [inline]
 kfree+0x1b6/0x6c0 mm/slub.c:6692
 f_uac2_opts_c_srate_store+0x1d4/0x260 drivers/usb/gadget/function/f_uac2.c:2091
 flush_write_buffer fs/configfs/file.c:207 [inline]
 configfs_write_iter+0x302/0x4e0 fs/configfs/file.c:229
 new_sync_write fs/read_write.c:595 [inline]
 vfs_write+0x6ac/0x1050 fs/read_write.c:687
 ksys_write+0x12a/0x250 fs/read_write.c:739
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0x115/0x870 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7fc39579de99
Code: ff c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 44 00 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 e8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007ffc94f16318 EFLAGS: 00000246 ORIG_RAX: 0000000000000001
RAX: ffffffffffffffda RBX: 00007fc395a25fa0 RCX: 00007fc39579de99
RDX: 00000000000000f7 RSI: 0000200000000d40 RDI: 0000000000000003
RBP: 00007fc395833eaf R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000000
R13: 00007fc395a25fac R14: 00007fc395a25fa0 R15: 00007fc395a25fa0
 </TASK>

Allocated by task 5924:
 kasan_save_stack+0x30/0x50 mm/kasan/common.c:57
 kasan_save_track+0x14/0x30 mm/kasan/common.c:78
 poison_kmalloc_redzone mm/kasan/common.c:398 [inline]
 __kasan_kmalloc+0xaa/0xb0 mm/kasan/common.c:415
 kasan_kmalloc include/linux/kasan.h:263 [inline]
 __do_kmalloc_node mm/slub.c:5334 [inline]
 __kmalloc_node_track_caller_noprof+0x331/0x830 mm/slub.c:5471
 __kmemdup_nul mm/util.c:64 [inline]
 kstrdup+0x51/0xe0 mm/util.c:84
 f_uac2_opts_c_srate_store+0x113/0x260 drivers/usb/gadget/function/f_uac2.c:2091
 flush_write_buffer fs/configfs/file.c:207 [inline]
 configfs_write_iter+0x302/0x4e0 fs/configfs/file.c:229
 new_sync_write fs/read_write.c:595 [inline]
 vfs_write+0x6ac/0x1050 fs/read_write.c:687
 ksys_write+0x12a/0x250 fs/read_write.c:739
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0x115/0x870 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f

The buggy address belongs to the object at ffff88802a893700
 which belongs to the cache kmalloc-32 of size 32
The buggy address is located 12 bytes inside of
 18-byte region [ffff88802a893700, ffff88802a893712)

The buggy address belongs to the physical page:
page: refcount:0 mapcount:0 mapping:0000000000000000 index:0x0 pfn:0x2a893
flags: 0xfff00000000000(node=0|zone=1|lastcpupid=0x7ff)
page_type: f5(slab)
raw: 00fff00000000000 ffff88801bc42780 dead000000000100 dead000000000122
raw: 0000000000000000 0000000800400040 00000000f5000000 0000000000000000
page dumped because: kasan: bad access detected
page_owner tracks the page as allocated
page last allocated via order 0, migratetype Unmovable, gfp_mask 0xd2800(GFP_NOWAIT|__GFP_NORETRY|__GFP_COMP|__GFP_NOMEMALLOC), pid 1489, tgid 1489 (kworker/u33:2), ts 8170009835, free_ts 0
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
 __kmalloc_cache_noprof+0x479/0x6c0 mm/slub.c:5485
 _kmalloc_noprof include/linux/slab.h:988 [inline]
 slab_free_hook mm/slub.c:2629 [inline]
 slab_free mm/slub.c:6377 [inline]
 kmem_cache_free+0x412/0x6b0 mm/slub.c:6504
 __cleanup_sighand kernel/fork.c:1705 [inline]
 __cleanup_sighand+0x6a/0xa0 kernel/fork.c:1697
 __exit_signal kernel/exit.c:223 [inline]
 release_task+0xc31/0x1ab0 kernel/exit.c:270
 exit_notify kernel/exit.c:810 [inline]
 do_exit+0x13ba/0x2ae0 kernel/exit.c:1021
 call_usermodehelper_exec_async+0x35d/0x4b0 kernel/umh.c:122
 ret_from_fork+0x72b/0xd50 arch/x86/kernel/process.c:158
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245
page_owner free stack trace missing

Memory state around the buggy address:
 ffff88802a893600: 00 00 00 00 fc fc fc fc fa fb fb fb fc fc fc fc
 ffff88802a893680: fa fb fb fb fc fc fc fc fa fb fb fb fc fc fc fc
>ffff88802a893700: 00 00 02 fc fc fc fc fc fa fb fb fb fc fc fc fc
                      ^
 ffff88802a893780: fa fb fb fb fc fc fc fc fa fb fb fb fc fc fc fc
 ffff88802a893800: fa fb fb fb fc fc fc fc fa fb fb fb fc fc fc fc
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

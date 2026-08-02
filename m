Received: from mail-oi1-f208.google.com (mail-oi1-f208.google.com [209.85.167.208])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D66A61FC8
	for <linux-usb@vger.kernel.org>; Sun,  2 Aug 2026 03:46:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.208
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785642402; cv=none; b=bzS6pOgp12KE0EfG5AGqdsRN3qgqFjgaaRABWl/ThElsm7QD/VC2MKKLq3V2nW1tbD6og9CY9NC497zEA9ibPv2yqR8U1/Z96wpyOdqzSbeCneWSVywCJZEOsnZfGReTmQTauZol9un2tm3oaSEUQ9orqOj61p69yYFJov+NgSU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785642402; c=relaxed/simple;
	bh=cE+1I8gVoL2KenS7hKfvcynM2YUZz3p25BxMo7yXmRw=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=oKVNiRjG5Q1HbUkqyfZKvV+6Nm0DkqGUWditIqguLdMvxtyv7EQ9uVGpKQRtZV3y1LJQ4HoIZggy5XwS/zRWnKq5+1Z2vmZXI4Rv83KXIFRRmWTqLwsaX5D4xsQGw53UINJjTfknd1gAzlkoYb3kspc39gx8461Q29o4RZ+VIbo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.208
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f208.google.com with SMTP id 5614622812f47-4a7de733fa9so2963775b6e.3
        for <linux-usb@vger.kernel.org>; Sat, 01 Aug 2026 20:46:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785642399; x=1786247199;
        h=content-type:to:from:subject:message-id:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9FiBLZ24jSzhjwpa11dVXwhZHUwLteFOyqTKxSXcRYs=;
        b=jZMhFeq/JT33bfW+w/RYk2v2+FXRzB0MsoEkTpP0V3lONLK0kQKw2boj54w1cCXAY9
         N1faRJVNULnu8t41ybzWXkcegI2XlPUCf5yqrUR1y74o9UCKiyqZjL9cvikZdqKAC7Dg
         VNltJlvCMnSrcTdfwH8OWu/g574EYuGpHi4+z5oRGQ6OoHBwRCy2nOZRwWtwuDymYsIb
         790k4NbqQD6mAK6wfqrhYCuELnt+EUWZnG9pkRLqyLA+w0ek1DL3gm4YBbL2HbB1W9RW
         TDr8YfInmChEnARrxWjnuazn99rhs+JHJj16VKPmY1YDplx/STNcjJVDRwEJKnzEct+G
         bm+Q==
X-Forwarded-Encrypted: i=1; AHgh+RpoWENZGYLXj3chCkXbYvWs57g5V7ljO+sWe/w1tK8CDCTVvvA+8hGb6ffoA1Ej3MoVolYhRNiFD54=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywb2S92+Kw3ceM0911yvy7cCli+jRrDdj6RZNMkBTvKhGjoihIW
	hInuS/JPaBUMvFHy0acaLhX2NRCHR5h1OWHcGG43tQKAm8DapiGDBs+mx9iqKUsWvZ2Zs5RiN4x
	/mIwRbEMjdDzEHets2NFSLGk2h44AceuPqK2aOkOk6H90HQU68ABrW6gToqk=
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:244f:b0:4a4:9e18:607a with SMTP id
 5614622812f47-4af5e3d7eeemr9224068b6e.21.1785642398810; Sat, 01 Aug 2026
 20:46:38 -0700 (PDT)
Date: Sat, 01 Aug 2026 20:46:38 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6a6ebd9e.2d659fcc.1d46f5.01cc.GAE@google.com>
Subject: [syzbot] [usb?] KASAN: invalid-free in f_uac1_opts_c_srate_store
From: syzbot <syzbot+2532c7901f590afd0c3a@syzkaller.appspotmail.com>
To: gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    02dc699f83d0 Merge tag 'kbuild-fixes-7.2-1' of git://git.k..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=16870649580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=145fa60d73086782
dashboard link: https://syzkaller.appspot.com/bug?extid=2532c7901f590afd0c3a
compiler:       gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=1348e5b9580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=11aa0db9580000

Downloadable assets:
disk image (non-bootable): https://storage.googleapis.com/syzbot-assets/d900f083ada3/non_bootable_disk-02dc699f.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/faf03a1fb300/vmlinux-02dc699f.xz
kernel image: https://storage.googleapis.com/syzbot-assets/a48e50ceca1d/bzImage-02dc699f.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+2532c7901f590afd0c3a@syzkaller.appspotmail.com

==================================================================
BUG: KASAN: invalid-free in f_uac1_opts_c_srate_store+0x1d4/0x260 drivers/usb/gadget/function/f_uac1.c:1666
Free of addr ffff88803ea06993 by task syz.0.17/5915

CPU: 0 UID: 0 PID: 5915 Comm: syz.0.17 Not tainted syzkaller #0 PREEMPT(full) 
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
 f_uac1_opts_c_srate_store+0x1d4/0x260 drivers/usb/gadget/function/f_uac1.c:1666
 flush_write_buffer fs/configfs/file.c:207 [inline]
 configfs_write_iter+0x302/0x4e0 fs/configfs/file.c:229
 new_sync_write fs/read_write.c:595 [inline]
 vfs_write+0x6ac/0x1050 fs/read_write.c:687
 ksys_write+0x12a/0x250 fs/read_write.c:739
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0x115/0x870 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f964059e019
Code: ff c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 44 00 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 e8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007ffe2077f218 EFLAGS: 00000246 ORIG_RAX: 0000000000000001
RAX: ffffffffffffffda RBX: 00007f9640825fa0 RCX: 00007f964059e019
RDX: 0000000000000029 RSI: 0000200000000040 RDI: 0000000000000003
RBP: 00007f964063500c R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000000
R13: 00007f9640825fac R14: 00007f9640825fa0 R15: 00007f9640825fa0
 </TASK>

Allocated by task 5915:
 kasan_save_stack+0x30/0x50 mm/kasan/common.c:57
 kasan_save_track+0x14/0x30 mm/kasan/common.c:78
 poison_kmalloc_redzone mm/kasan/common.c:398 [inline]
 __kasan_kmalloc+0xaa/0xb0 mm/kasan/common.c:415
 kasan_kmalloc include/linux/kasan.h:263 [inline]
 __do_kmalloc_node mm/slub.c:5334 [inline]
 __kmalloc_node_track_caller_noprof+0x331/0x830 mm/slub.c:5471
 __kmemdup_nul mm/util.c:64 [inline]
 kstrdup+0x51/0xe0 mm/util.c:84
 f_uac1_opts_c_srate_store+0x113/0x260 drivers/usb/gadget/function/f_uac1.c:1666
 flush_write_buffer fs/configfs/file.c:207 [inline]
 configfs_write_iter+0x302/0x4e0 fs/configfs/file.c:229
 new_sync_write fs/read_write.c:595 [inline]
 vfs_write+0x6ac/0x1050 fs/read_write.c:687
 ksys_write+0x12a/0x250 fs/read_write.c:739
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0x115/0x870 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f

The buggy address belongs to the object at ffff88803ea06980
 which belongs to the cache kmalloc-64 of size 64
The buggy address is located 19 bytes inside of
 42-byte region [ffff88803ea06980, ffff88803ea069aa)

The buggy address belongs to the physical page:
page: refcount:0 mapcount:0 mapping:0000000000000000 index:0xffff88803ea06880 pfn:0x3ea06
flags: 0xfff00000000200(workingset|node=0|zone=1|lastcpupid=0x7ff)
page_type: f5(slab)
raw: 00fff00000000200 ffff88801bc428c0 ffffea0000d8b290 ffffea0000b89150
raw: ffff88803ea06880 000000080020001d 00000000f5000000 0000000000000000
page dumped because: kasan: bad access detected
page_owner tracks the page as allocated
page last allocated via order 0, migratetype Unmovable, gfp_mask 0xd2c40(GFP_NOFS|__GFP_NOWARN|__GFP_NORETRY|__GFP_COMP|__GFP_NOMEMALLOC), pid 5794, tgid 5794 (syz-executor), ts 78142281665, free_ts 78139864775
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
 tomoyo_encode2+0xfb/0x3c0 security/tomoyo/realpath.c:45
 tomoyo_encode+0x29/0x50 security/tomoyo/realpath.c:80
 tomoyo_realpath_from_path+0x18c/0x690 security/tomoyo/realpath.c:283
 tomoyo_mount_acl+0x1b6/0x8b0 security/tomoyo/mount.c:107
 tomoyo_mount_permission+0x214/0x460 security/tomoyo/mount.c:239
 security_sb_mount+0xdd/0x270 security/security.c:1088
 path_mount+0x158/0x23d0 fs/namespace.c:4103
 do_mount fs/namespace.c:4174 [inline]
 __do_sys_mount fs/namespace.c:4390 [inline]
 __se_sys_mount fs/namespace.c:4367 [inline]
 __x64_sys_mount+0x293/0x310 fs/namespace.c:4367
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0x115/0x870 arch/x86/entry/syscall_64.c:94
page last free pid 5794 tgid 5794 stack trace:
 reset_page_owner include/linux/page_owner.h:25 [inline]
 __free_pages_prepare mm/page_alloc.c:1406 [inline]
 __free_frozen_pages+0x79f/0x1090 mm/page_alloc.c:2950
 selinux_genfs_get_sid security/selinux/hooks.c:1364 [inline]
 inode_doinit_with_dentry+0x99d/0x1320 security/selinux/hooks.c:1563
 selinux_d_instantiate+0x26/0x40 security/selinux/hooks.c:6678
 security_d_instantiate+0x14c/0x1b0 security/security.c:3704
 d_splice_alias_ops+0xd7/0x15c0 fs/dcache.c:3244
 proc_sys_lookup+0x319/0x430 fs/proc/proc_sysctl.c:544
 __lookup_slow+0x155/0x320 fs/namei.c:1919
 lookup_slow+0x50/0x70 fs/namei.c:1936
 walk_component fs/namei.c:2282 [inline]
 lookup_last fs/namei.c:2789 [inline]
 path_lookupat+0x5e8/0xc40 fs/namei.c:2813
 filename_lookup+0x202/0x590 fs/namei.c:2842
 user_path_at+0x3c/0x60 fs/namei.c:3641
 do_mount fs/namespace.c:4171 [inline]
 __do_sys_mount fs/namespace.c:4390 [inline]
 __se_sys_mount fs/namespace.c:4367 [inline]
 __x64_sys_mount+0x1fb/0x310 fs/namespace.c:4367
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0x115/0x870 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f

Memory state around the buggy address:
 ffff88803ea06880: fa fb fb fb fb fb fb fb fc fc fc fc fc fc fc fc
 ffff88803ea06900: fa fb fb fb fb fb fb fb fc fc fc fc fc fc fc fc
>ffff88803ea06980: 00 00 00 00 00 02 fc fc fc fc fc fc fc fc fc fc
                         ^
 ffff88803ea06a00: fa fb fb fb fb fb fb fb fc fc fc fc fc fc fc fc
 ffff88803ea06a80: fa fb fb fb fb fb fb fb fc fc fc fc fc fc fc fc
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

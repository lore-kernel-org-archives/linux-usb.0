Received: from mail-oi1-f205.google.com (mail-oi1-f205.google.com [209.85.167.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B66FA1EDA32
	for <linux-usb@vger.kernel.org>; Sun,  2 Aug 2026 01:09:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785632971; cv=none; b=HXee0i+yrTqZlUoyfGWEEa+vGajTrauXvbnRxoB1Pb6HLy5YEPrdLse3/ZKwZUhXbFxMZRQnL9Kr1AQZGhSSmCyA87uthRE38y6XtmLJyqUzqnrwe9zGVv4UL8suJuqruiyLLxrX9u09GrKVk3sUgxp6UTIjcGzkNabVPI/n17M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785632971; c=relaxed/simple;
	bh=AmJ9AZtBnwBSiOPIGQ3N+ht1API/fwXAgFu1tTDPU+U=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=LrjGgTv39d8osxdPATALlgJCbmLD9ELIPQzi742VVNjI9bKMd/mQ77uqEG7w/K5RTucZcM2tDOPhclaZluBH2ab2E1Uj3ldZHiQPX6tQHWkOEm1bYch6VBVopkUSFb/emnAlCv/jUJlQ5JieN0393QZTyA90udjQ+iJXEeMfdsM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f205.google.com with SMTP id 5614622812f47-495b8120909so2997797b6e.1
        for <linux-usb@vger.kernel.org>; Sat, 01 Aug 2026 18:09:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785632968; x=1786237768;
        h=content-type:to:from:subject:message-id:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CFSuDAhO23eYsBTJTvMFuNH+SK3D1VZMHyqBwdBZtUc=;
        b=Qf9BEsI5o/OdRQiWz67O1JualSeLkfLY9dPgCRQLMkGB8puG/mRu/5Pyo1+Hftd88m
         R2ITerm73cHZshUCUKil/dKsQKX+M4ZZvspH50CIaF+8CqerPG+ONP/W4VDFMZg2o+at
         eiP5/RgkqPNVYZrCD0jYTDZ1P0LRdQ5Gks0//eDPqMFokZ8f3nqCReSK6gG8QuPkW8xa
         LcwW9Tqk1w/NakavxCYGrV96wrf+NJAiDaHBdcM226Mx3zU7lK+G22q7b5dlhMGcgk2C
         C7eR3g1qt6y+suWBOHJ2ewviJCcHfqY3LPJb83J1N4LuRq0D1PKWZi28Rc1/Tj7dJcbT
         xA4g==
X-Forwarded-Encrypted: i=1; AHgh+Ro1aSFCRvjC4MUC3W2gz988lhunTD2Cy54kSwZ0X4cXjTc6zK3rLMh83ZvrgUEyHuvXcwREkMVaqaA=@vger.kernel.org
X-Gm-Message-State: AOJu0YwYaNds6Pi1AjYTcNPMfXgXfpG6BeowHlK1rUYaMQJNlnQdOj9T
	phrPwY7tAzVk71G2Xpy/a4LHYy73HHpnb9epcj2bA7omN3dPVR4a3O/QCEmHUkrKcnQuPBsb6M0
	PBlJdz+stL0bxmOplVsfgVKSvoRDyHpu2u723KFUwtUIPOYmUrotr/izaB+U=
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:6c85:b0:495:f8a6:81f8 with SMTP id
 5614622812f47-4af5e29cd37mr9661807b6e.13.1785632968713; Sat, 01 Aug 2026
 18:09:28 -0700 (PDT)
Date: Sat, 01 Aug 2026 18:09:28 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6a6e98c8.6ce73036.24301b.001a.GAE@google.com>
Subject: [syzbot] [usb?] KASAN: slab-use-after-free Read in uvcg_extension_drop
From: syzbot <syzbot+f093afc4e90b1908abdc@syzkaller.appspotmail.com>
To: gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    11028ab62899 Merge tag 'probes-fixes-v7.2-rc5' of git://gi..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=118eb03e580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=cb17729fb04b1e3a
dashboard link: https://syzkaller.appspot.com/bug?extid=f093afc4e90b1908abdc
compiler:       Debian clang version 22.1.8 (++20260613092233+e80beda6e255-1~exp1~20260613092250.77), Debian LLD 22.1.8

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/0afad3dd27f4/disk-11028ab6.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/2e1441f9c31d/vmlinux-11028ab6.xz
kernel image: https://storage.googleapis.com/syzbot-assets/5f0b8bdf00cd/bzImage-11028ab6.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+f093afc4e90b1908abdc@syzkaller.appspotmail.com

==================================================================
BUG: KASAN: slab-use-after-free in __list_del_entry_valid_or_report+0x31/0x190 lib/list_debug.c:49
Read of size 8 at addr ffff8880343c1158 by task syz.4.33/5952

CPU: 0 UID: 0 PID: 5952 Comm: syz.4.33 Not tainted syzkaller #0 PREEMPT_{RT,(full)} 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 07/24/2026
Call Trace:
 <TASK>
 dump_stack_lvl+0xe8/0x150 lib/dump_stack.c:120
 print_address_description+0x55/0x1e0 mm/kasan/report.c:378
 print_report+0x58/0x70 mm/kasan/report.c:482
 kasan_report+0x117/0x150 mm/kasan/report.c:595
 __list_del_entry_valid_or_report+0x31/0x190 lib/list_debug.c:49
 __list_del_entry_valid include/linux/list.h:132 [inline]
 __list_del_entry include/linux/list.h:246 [inline]
 list_del include/linux/list.h:260 [inline]
 uvcg_extension_drop+0x81/0x1f0 drivers/usb/gadget/function/uvc_configfs.c:1260
 configfs_mkdir+0x7e9/0x9e0 fs/configfs/dir.c:1443
 vfs_mkdir+0x402/0x620 fs/namei.c:5276
 filename_mkdirat+0x289/0x520 fs/namei.c:5309
 __do_sys_mkdirat fs/namei.c:5330 [inline]
 __se_sys_mkdirat+0x35/0x150 fs/namei.c:5327
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0x174/0x580 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f3013e4df99
Code: ff c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 44 00 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 e8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007f30120a6028 EFLAGS: 00000246 ORIG_RAX: 0000000000000102
RAX: ffffffffffffffda RBX: 00007f30140d5fa0 RCX: 00007f3013e4df99
RDX: 00000000000001c0 RSI: 0000200000000340 RDI: ffffffffffffff9c
RBP: 00007f3013ee4ec4 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000000
R13: 00007f30140d6038 R14: 00007f30140d5fa0 R15: 00007ffc51c27a98
 </TASK>

Allocated by task 5952:
 kasan_save_stack mm/kasan/common.c:57 [inline]
 kasan_save_track+0x3e/0x80 mm/kasan/common.c:78
 poison_kmalloc_redzone mm/kasan/common.c:398 [inline]
 __kasan_kmalloc+0x93/0xb0 mm/kasan/common.c:415
 kasan_kmalloc include/linux/kasan.h:263 [inline]
 __kmalloc_cache_noprof+0x3d2/0x6b0 mm/slub.c:5489
 _kmalloc_noprof include/linux/slab.h:988 [inline]
 _kzalloc_noprof include/linux/slab.h:1309 [inline]
 uvcg_extension_make+0x95/0x300 drivers/usb/gadget/function/uvc_configfs.c:1276
 configfs_mkdir+0x580/0x9e0 fs/configfs/dir.c:1369
 vfs_mkdir+0x402/0x620 fs/namei.c:5276
 filename_mkdirat+0x289/0x520 fs/namei.c:5309
 __do_sys_mkdirat fs/namei.c:5330 [inline]
 __se_sys_mkdirat+0x35/0x150 fs/namei.c:5327
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0x174/0x580 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f

Freed by task 5952:
 kasan_save_stack mm/kasan/common.c:57 [inline]
 kasan_save_track+0x3e/0x80 mm/kasan/common.c:78
 kasan_save_free_info+0x40/0x50 mm/kasan/generic.c:584
 poison_slab_object mm/kasan/common.c:253 [inline]
 __kasan_slab_free+0x5c/0x80 mm/kasan/common.c:285
 kasan_slab_free include/linux/kasan.h:235 [inline]
 slab_free_hook mm/slub.c:2677 [inline]
 slab_free mm/slub.c:6377 [inline]
 kfree+0x1c5/0x6c0 mm/slub.c:6692
 config_item_cleanup fs/configfs/item.c:128 [inline]
 config_item_release+0x13a/0x2d0 fs/configfs/item.c:137
 uvcg_extension_drop+0x75/0x1f0 drivers/usb/gadget/function/uvc_configfs.c:1259
 configfs_mkdir+0x7e9/0x9e0 fs/configfs/dir.c:1443
 vfs_mkdir+0x402/0x620 fs/namei.c:5276
 filename_mkdirat+0x289/0x520 fs/namei.c:5309
 __do_sys_mkdirat fs/namei.c:5330 [inline]
 __se_sys_mkdirat+0x35/0x150 fs/namei.c:5327
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0x174/0x580 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f

The buggy address belongs to the object at ffff8880343c1100
 which belongs to the cache kmalloc-192 of size 192
The buggy address is located 88 bytes inside of
 freed 192-byte region [ffff8880343c1100, ffff8880343c11c0)

The buggy address belongs to the physical page:
page: refcount:0 mapcount:0 mapping:0000000000000000 index:0x0 pfn:0x343c1
flags: 0x80000000000000(node=0|zone=1)
page_type: f5(slab)
raw: 0080000000000000 ffff88813ffb13c0 dead000000000100 dead000000000122
raw: 0000000000000000 0000000800100010 00000000f5000000 0000000000000000
page dumped because: kasan: bad access detected
page_owner tracks the page as allocated
page last allocated via order 0, migratetype Unmovable, gfp_mask 0xd2cc0(GFP_KERNEL|__GFP_NOWARN|__GFP_NORETRY|__GFP_COMP|__GFP_NOMEMALLOC), pid 1, tgid 1 (swapper/0), ts 28098951672, free_ts 0
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
 call_usermodehelper_setup+0x8e/0x270 kernel/umh.c:362
 kobject_uevent_env+0x665/0x9e0 lib/kobject_uevent.c:631
 kernel_add_sysfs_param+0xb1/0xe0 kernel/params.c:801
 param_sysfs_builtin+0x199/0x250 kernel/params.c:836
 param_sysfs_builtin_init+0x23/0x30 kernel/params.c:972
 do_one_initcall+0x250/0x870 init/main.c:1347
 do_initcall_level+0x10a/0x1a0 init/main.c:1409
 do_initcalls+0x59/0xa0 init/main.c:1425
 kernel_init_freeable+0x29d/0x3e0 init/main.c:1658
page_owner free stack trace missing

Memory state around the buggy address:
 ffff8880343c1000: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
 ffff8880343c1080: 00 00 00 00 fc fc fc fc fc fc fc fc fc fc fc fc
>ffff8880343c1100: fa fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
                                                    ^
 ffff8880343c1180: fb fb fb fb fb fb fb fb fc fc fc fc fc fc fc fc
 ffff8880343c1200: fa fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
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

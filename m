Received: from mail-oa1-f80.google.com (mail-oa1-f80.google.com [209.85.160.80])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5644C31283E
	for <linux-usb@vger.kernel.org>; Sat,  1 Aug 2026 00:13:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.80
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785543221; cv=none; b=kVU6cGhR2PCfKKrypR4O7EEqT1eYsXAEuZN3Icfz/k8IOZavb4z6LIVlaipO029+Ayngf3UV0A3/kD6TY9vERdvPTAEEn21XQ3rhD9809uSPqP+Q0+Wvndx8VB4WdEun7rux//jffDUoB0subFOiTGq4qC+iii0lsn9+iNrH5/E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785543221; c=relaxed/simple;
	bh=LL3hh4Vfnyd19Brb8SBtu5jwWFE2RUzFYc711L9C7Jc=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=NLzjnGLrqGn9ofgksOAHimU2q5ICHPjjm8UOPV5OuIJvkIB0e3zUJdjg2UbQTDfZxYkbKB5zDNCK9WxFxBowuVVKIWIHLhpNsxYJxV8MCnO6S0s3O4kXwXXaqE4cppH7cqezhstMOCbvXvHqd1QffmI8F8eLRtZikf9/KTjukm8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.160.80
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oa1-f80.google.com with SMTP id 586e51a60fabf-44d0960fb5bso1215819fac.2
        for <linux-usb@vger.kernel.org>; Fri, 31 Jul 2026 17:13:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785543215; x=1786148015;
        h=content-type:to:from:subject:message-id:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4P2uOFtKPlYU/PV3e6no9v980i/QB2PWOqgAbvuoan0=;
        b=XhJdexjVYXV/VeJVQzhp01N8wwVgwhOuGOBK9DoAZMG/3dN2pLVDZpP6YH7drrV4Y2
         Mh8TAi5A4Tlc2HKUmxBgsw7e2bNh02uzfiS5kjQn+5g3hE12sv4f6N1AdOUhVIqZwBzq
         CbKw2Qj2ElJNkzlpcDPfoJesVtPoQu5W9XBMypa98Bd0fAxEO/hMB1f9ldWPdb+XI/MS
         7823uUdSo/ewbyn108bAzD5HQZq5bJGsxkElvSmP0z3/zFdPURBuZqtaLh1EoSMPtYt6
         G7IP6uZgJkITStwRiCtnWjcIddP0F/C1EbjnG5aRPqk3oknX50oFQiOn9az9ZUeY3SPx
         enEA==
X-Forwarded-Encrypted: i=1; AHgh+Rp1Xjw5SyYZzLhT/7xpO7jMIWtAMShkcy5IX9RMY2tDIc9EwC+45/vorn/agpAu1+c6IhDKmX182Vk=@vger.kernel.org
X-Gm-Message-State: AOJu0YzR2YC73tj88ExckmWbE2YcROjTydk0F3qdt0Gb0wn2ZM7VxXh7
	a9leC8sOTtHWzpxqOmKQieTzxu11MWbyzdB5ROM8aJlEF1D7tf/rymSsK+G1f32/++DHEzxJgvi
	zuy/Bwoo1iQJgtMf7a2yJWOwOXyt2Vcq6cswCQiYKUxVMCPU0Z2wd/tIc/e0=
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:1310:b0:490:b586:1459 with SMTP id
 5614622812f47-4af5dffbcc3mr3162437b6e.2.1785543214978; Fri, 31 Jul 2026
 17:13:34 -0700 (PDT)
Date: Fri, 31 Jul 2026 17:13:34 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6a6d3a2e.6ce73036.24301b.0009.GAE@google.com>
Subject: [syzbot] [usb?] KASAN: slab-use-after-free Write in pn_bind
From: syzbot <syzbot+098999e05b6b877c01b3@syzkaller.appspotmail.com>
To: gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    3b5f4b83c4ab Merge tag 'for-7.2-rc5-tag' of git://git.kern..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=12c61449580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=4e38b15c29e6a1d9
dashboard link: https://syzkaller.appspot.com/bug?extid=098999e05b6b877c01b3
compiler:       Debian clang version 22.1.8 (++20260613092233+e80beda6e255-1~exp1~20260613092250.77), Debian LLD 22.1.8

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/a557d71460d3/disk-3b5f4b83.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/f8bb9a6c7241/vmlinux-3b5f4b83.xz
kernel image: https://storage.googleapis.com/syzbot-assets/e5afecc8ccd4/bzImage-3b5f4b83.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+098999e05b6b877c01b3@syzkaller.appspotmail.com

==================================================================
BUG: KASAN: slab-use-after-free in gphonet_set_gadget drivers/usb/gadget/function/f_phonet.c:720 [inline]
BUG: KASAN: slab-use-after-free in pn_bind+0x106/0xb20 drivers/usb/gadget/function/f_phonet.c:510
Write of size 8 at addr ffff8880573a8800 by task syz.8.2650/16742

CPU: 0 UID: 0 PID: 16742 Comm: syz.8.2650 Tainted: G             L      syzkaller #0 PREEMPT(full) 
Tainted: [L]=SOFTLOCKUP
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 07/16/2026
Call Trace:
 <TASK>
 dump_stack_lvl+0xe8/0x150 lib/dump_stack.c:120
 print_address_description+0x55/0x1e0 mm/kasan/report.c:378
 print_report+0x58/0x70 mm/kasan/report.c:482
 kasan_report+0x117/0x150 mm/kasan/report.c:595
 gphonet_set_gadget drivers/usb/gadget/function/f_phonet.c:720 [inline]
 pn_bind+0x106/0xb20 drivers/usb/gadget/function/f_phonet.c:510
 usb_add_function+0x2e1/0x9f0 drivers/usb/gadget/composite.c:333
 configfs_composite_bind+0xde0/0x1410 drivers/usb/gadget/configfs.c:1802
 gadget_bind_driver+0x2ca/0x9e0 drivers/usb/gadget/udc/core.c:1662
 call_driver_probe drivers/base/dd.c:-1 [inline]
 really_probe+0x254/0xae0 drivers/base/dd.c:706
 __driver_probe_device+0x1e8/0x360 drivers/base/dd.c:868
 driver_probe_device+0x4f/0x240 drivers/base/dd.c:898
 __driver_attach+0x339/0x600 drivers/base/dd.c:1292
 bus_for_each_dev+0x23b/0x2c0 drivers/base/bus.c:383
 bus_add_driver+0x345/0x670 drivers/base/bus.c:763
 driver_register+0x23a/0x320 drivers/base/driver.c:174
 usb_gadget_register_driver_owner+0xf9/0x270 drivers/usb/gadget/udc/core.c:1752
 gadget_dev_desc_UDC_store+0x1c9/0x2f0 drivers/usb/gadget/configfs.c:300
 flush_write_buffer fs/configfs/file.c:207 [inline]
 configfs_write_iter+0x337/0x430 fs/configfs/file.c:229
 new_sync_write fs/read_write.c:595 [inline]
 vfs_write+0x612/0xba0 fs/read_write.c:687
 ksys_write+0x150/0x270 fs/read_write.c:739
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0x174/0x580 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7ff018d9de99
Code: ff c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 44 00 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 e8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007ff019bd6028 EFLAGS: 00000246 ORIG_RAX: 0000000000000001
RAX: ffffffffffffffda RBX: 00007ff019025fa0 RCX: 00007ff018d9de99
RDX: 000000000000000b RSI: 0000200000000280 RDI: 0000000000000003
RBP: 00007ff018e33eaf R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000000
R13: 00007ff019026038 R14: 00007ff019025fa0 R15: 00007ffca6d651d8
 </TASK>

Allocated by task 16674:
 kasan_save_stack mm/kasan/common.c:57 [inline]
 kasan_save_track+0x3e/0x80 mm/kasan/common.c:78
 poison_kmalloc_redzone mm/kasan/common.c:398 [inline]
 __kasan_kmalloc+0x93/0xb0 mm/kasan/common.c:415
 kasan_kmalloc include/linux/kasan.h:263 [inline]
 __do_kmalloc_node mm/slub.c:5334 [inline]
 __kvmalloc_node_noprof+0x53f/0x860 mm/slub.c:6905
 alloc_netdev_mqs+0xa9/0x12b0 net/core/dev.c:12054
 gphonet_setup_default drivers/usb/gadget/function/f_phonet.c:706 [inline]
 phonet_alloc_inst+0xa4/0x180 drivers/usb/gadget/function/f_phonet.c:640
 try_get_usb_function_instance drivers/usb/gadget/functions.c:28 [inline]
 usb_get_function_instance+0xe3/0x2f0 drivers/usb/gadget/functions.c:44
 function_make+0x127/0x360 drivers/usb/gadget/configfs.c:626
 configfs_mkdir+0x4f6/0x9e0 fs/configfs/dir.c:1360
 vfs_mkdir+0x406/0x620 fs/namei.c:5276
 filename_mkdirat+0x285/0x510 fs/namei.c:5309
 __do_sys_mkdirat fs/namei.c:5330 [inline]
 __se_sys_mkdirat+0x35/0x150 fs/namei.c:5327
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0x174/0x580 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f

Freed by task 16674:
 kasan_save_stack mm/kasan/common.c:57 [inline]
 kasan_save_track+0x3e/0x80 mm/kasan/common.c:78
 kasan_save_free_info+0x40/0x50 mm/kasan/generic.c:584
 poison_slab_object mm/kasan/common.c:253 [inline]
 __kasan_slab_free+0x5c/0x80 mm/kasan/common.c:285
 kasan_slab_free include/linux/kasan.h:235 [inline]
 slab_free_hook mm/slub.c:2677 [inline]
 slab_free mm/slub.c:6377 [inline]
 kfree+0x1c5/0x640 mm/slub.c:6692
 gphonet_register_netdev drivers/usb/gadget/function/f_phonet.c:729 [inline]
 pn_bind+0x131/0xb20 drivers/usb/gadget/function/f_phonet.c:511
 usb_add_function+0x2e1/0x9f0 drivers/usb/gadget/composite.c:333
 configfs_composite_bind+0xde0/0x1410 drivers/usb/gadget/configfs.c:1802
 gadget_bind_driver+0x2ca/0x9e0 drivers/usb/gadget/udc/core.c:1662
 call_driver_probe drivers/base/dd.c:-1 [inline]
 really_probe+0x254/0xae0 drivers/base/dd.c:706
 __driver_probe_device+0x1e8/0x360 drivers/base/dd.c:868
 driver_probe_device+0x4f/0x240 drivers/base/dd.c:898
 __driver_attach+0x339/0x600 drivers/base/dd.c:1292
 bus_for_each_dev+0x23b/0x2c0 drivers/base/bus.c:383
 bus_add_driver+0x345/0x670 drivers/base/bus.c:763
 driver_register+0x23a/0x320 drivers/base/driver.c:174
 usb_gadget_register_driver_owner+0xf9/0x270 drivers/usb/gadget/udc/core.c:1752
 gadget_dev_desc_UDC_store+0x1c9/0x2f0 drivers/usb/gadget/configfs.c:300
 flush_write_buffer fs/configfs/file.c:207 [inline]
 configfs_write_iter+0x337/0x430 fs/configfs/file.c:229
 new_sync_write fs/read_write.c:595 [inline]
 vfs_write+0x612/0xba0 fs/read_write.c:687
 ksys_write+0x150/0x270 fs/read_write.c:739
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0x174/0x580 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f

The buggy address belongs to the object at ffff8880573a8000
 which belongs to the cache kmalloc-cg-4k of size 4096
The buggy address is located 2048 bytes inside of
 freed 4096-byte region [ffff8880573a8000, ffff8880573a9000)

The buggy address belongs to the physical page:
page: refcount:0 mapcount:0 mapping:0000000000000000 index:0x0 pfn:0x573a8
head: order:3 mapcount:0 entire_mapcount:0 nr_pages_mapped:0 pincount:0
memcg:ffff8880573a9011
flags: 0xfff00000000040(head|node=0|zone=1|lastcpupid=0x7ff)
page_type: f5(slab)
raw: 00fff00000000040 ffff88801b00a500 dead000000000100 dead000000000122
raw: 0000000000000000 0000200000040004 00000000f5000000 ffff8880573a9011
head: 00fff00000000040 ffff88801b00a500 dead000000000100 dead000000000122
head: 0000000000000000 0000200000040004 00000000f5000000 ffff8880573a9011
head: 00fff00000000003 fffffffffffffe01 00000000ffffffff 00000000ffffffff
head: ffffffffffffffff 0000000000000000 00000000ffffffff 0000000000000008
page dumped because: kasan: bad access detected
page_owner tracks the page as allocated
page last allocated via order 3, migratetype Unmovable, gfp_mask 0xd60c0(__GFP_IO|__GFP_FS|__GFP_NOWARN|__GFP_RETRY_MAYFAIL|__GFP_NORETRY|__GFP_COMP|__GFP_NOMEMALLOC), pid 16674, tgid 16673 (syz.8.2635), ts 627498088428, free_ts 627454547290
 set_page_owner include/linux/page_owner.h:32 [inline]
 post_alloc_hook+0x1f9/0x250 mm/page_alloc.c:1859
 prep_new_page mm/page_alloc.c:1867 [inline]
 get_page_from_freelist+0x21fa/0x2270 mm/page_alloc.c:3946
 __alloc_frozen_pages_noprof+0x18d/0x380 mm/page_alloc.c:5304
 alloc_slab_page mm/slub.c:3266 [inline]
 allocate_slab+0x79/0x5e0 mm/slub.c:3380
 new_slab mm/slub.c:3426 [inline]
 refill_objects+0x2d5/0x350 mm/slub.c:7310
 refill_sheaf mm/slub.c:2804 [inline]
 __pcs_replace_empty_main+0x2bf/0x6b0 mm/slub.c:4675
 alloc_from_pcs mm/slub.c:4773 [inline]
 slab_alloc_node mm/slub.c:4905 [inline]
 __do_kmalloc_node mm/slub.c:5333 [inline]
 __kvmalloc_node_noprof+0x66b/0x860 mm/slub.c:6905
 alloc_netdev_mqs+0xa9/0x12b0 net/core/dev.c:12054
 gphonet_setup_default drivers/usb/gadget/function/f_phonet.c:706 [inline]
 phonet_alloc_inst+0xa4/0x180 drivers/usb/gadget/function/f_phonet.c:640
 try_get_usb_function_instance drivers/usb/gadget/functions.c:28 [inline]
 usb_get_function_instance+0xe3/0x2f0 drivers/usb/gadget/functions.c:44
 function_make+0x127/0x360 drivers/usb/gadget/configfs.c:626
 configfs_mkdir+0x4f6/0x9e0 fs/configfs/dir.c:1360
 vfs_mkdir+0x406/0x620 fs/namei.c:5276
 filename_mkdirat+0x285/0x510 fs/namei.c:5309
 __do_sys_mkdirat fs/namei.c:5330 [inline]
 __se_sys_mkdirat+0x35/0x150 fs/namei.c:5327
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0x174/0x580 arch/x86/entry/syscall_64.c:94
page last free pid 16673 tgid 16673 stack trace:
 reset_page_owner include/linux/page_owner.h:25 [inline]
 __free_pages_prepare mm/page_alloc.c:1406 [inline]
 __free_frozen_pages+0xc1e/0xd10 mm/page_alloc.c:2950
 __slab_free+0x274/0x2c0 mm/slub.c:5741
 qlink_free mm/kasan/quarantine.c:163 [inline]
 qlist_free_all+0x99/0x100 mm/kasan/quarantine.c:179
 kasan_quarantine_reduce+0x148/0x160 mm/kasan/quarantine.c:286
 __kasan_slab_alloc+0x22/0x80 mm/kasan/common.c:350
 kasan_slab_alloc include/linux/kasan.h:253 [inline]
 slab_post_alloc_hook mm/slub.c:4584 [inline]
 slab_alloc_node mm/slub.c:4917 [inline]
 kmem_cache_alloc_noprof+0x2a0/0x5f0 mm/slub.c:4931
 ptlock_alloc+0x20/0x70 mm/memory.c:7531
 ptlock_init include/linux/mm.h:3775 [inline]
 pagetable_pte_ctor include/linux/mm.h:3824 [inline]
 __pte_alloc_one_noprof include/asm-generic/pgalloc.h:79 [inline]
 pte_alloc_one+0x7a/0x370 arch/x86/mm/pgtable.c:18
 do_fault_around mm/memory.c:5812 [inline]
 do_read_fault mm/memory.c:5851 [inline]
 do_fault mm/memory.c:5994 [inline]
 do_pte_missing+0x13c8/0x34b0 mm/memory.c:4566
 handle_pte_fault mm/memory.c:6379 [inline]
 __handle_mm_fault mm/memory.c:6517 [inline]
 handle_mm_fault+0x1b36/0x3080 mm/memory.c:6686
 do_user_addr_fault+0xa4d/0x1340 arch/x86/mm/fault.c:1343
 handle_page_fault arch/x86/mm/fault.c:1483 [inline]
 exc_page_fault+0x6a/0xc0 arch/x86/mm/fault.c:1536
 asm_exc_page_fault+0x26/0x30 arch/x86/include/asm/idtentry.h:595

Memory state around the buggy address:
 ffff8880573a8700: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
 ffff8880573a8780: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
>ffff8880573a8800: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
                   ^
 ffff8880573a8880: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
 ffff8880573a8900: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
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

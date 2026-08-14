Received: from mail-ot1-f79.google.com (mail-ot1-f79.google.com [209.85.210.79])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D46142BB17
	for <linux-usb@vger.kernel.org>; Fri, 14 Aug 2026 00:03:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.79
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786665822; cv=none; b=D5WNIc3XPXn+kzML/U4FU6ubnfBss+VS7j/54/VbC1qb1b851uPAS7zaSn+GFNnb46QNEUojCZpo+bBS+4MuMgihx8fYiCvae2j3WS+O+2dA6ftEmnTytrv5/FjJGjAhEE4tvPfTHn9gGYiUqBrN7ORFKmYGh++SCtPXe9f0IR8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786665822; c=relaxed/simple;
	bh=m0ofJaUJ0buufEwOeB3LHjsLMoz9f9JG0Ihua9nQ4Rw=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=ru40+KtsggEOPnc6eUlSK7Q/fyYHOC7uC8R5JRT1QHUBCvgLXzyiwWHoZrjSu/26kBtCl4RUEuAnzSjXygLT0eypmd52y07jEBslp289K3hQ48yofrD5muaqJ+Isz6saMxE7agL2HjxEv5YELbCMswgGI8b0D4qVYO0/ulBja8o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.210.79
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-ot1-f79.google.com with SMTP id 46e09a7af769-7e9fbcd3a0eso380577a34.1
        for <linux-usb@vger.kernel.org>; Thu, 13 Aug 2026 17:03:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786665820; x=1787270620;
        h=content-type:to:from:subject:message-id:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=puYc+nEcyMvHG6/fc9WVJhxGmfLSP9SnC9bAvRHmpw4=;
        b=HRJ4m2KT+lM34a+RE4MqOw0QBGnDTiydTFplGRgMiiJbghI+V+AkX/BLZXnad++d+L
         6/HY00mPh5dJsbzQHmoHGm0JSOKmo5PNcOvxUsPTDzEWFwq3PdZxDW8f5DF9xd3MirQK
         99GSz7PbB7eG9jUSR9Ees3zFPuRR2IcP5WqyHiwn6ntC5OYfsku/cDpVLfFoVCbl7ctp
         cQXMQMFFB70FVomuyTI6j2gR4yVUpT7WLESn9d3L/2gDunX+eUkcLoet6Osmdck3UmkC
         uRxPm9QzwBtN27LaGfLpyd8M8mucVaBhAkgiDYVQ7r0k4902tdF658yxBC+tw17gO1Ji
         iYHA==
X-Forwarded-Encrypted: i=1; AHgh+RrST4uXCC49t2VAiRoBQfHcR+4DR1Stgig/D+nBqTZiUGzzh2S/sumXmuwiducC+2Ry9EcIiKK2GP8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw3d9syDk3nghBEET7ce3lTt/lldA+VgVjUrou0Ghp/bn6qxU3Q
	zMMHV/9LZMavjR3D944rbLQxKOprQbTROnRuRn1UxdplA1No89m6Bsv5hC7sriy86CyDC6flRJO
	8rA2MuD71lD93Eafbvp7Xgv37dE4eYPHlqxoeAVrjqV60VKjEZ5ZB+R6VvYg=
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:4c11:b0:6ac:a539:bc41 with SMTP id
 006d021491bc7-6b0d613c77emr1906906eaf.12.1786665819928; Thu, 13 Aug 2026
 17:03:39 -0700 (PDT)
Date: Thu, 13 Aug 2026 17:03:39 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6a7e5b5b.f70deec7.2acc03.000f.GAE@google.com>
Subject: [syzbot] [usb?] KASAN: slab-use-after-free Read in f_midi2_opts_iface_name_show
From: syzbot <syzbot+2280f1cca5e6b0c353e4@syzkaller.appspotmail.com>
To: gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    db2ddb871435 Linux 7.2-rc7
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=12dcd132580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=dd70c0851d340092
dashboard link: https://syzkaller.appspot.com/bug?extid=2280f1cca5e6b0c353e4
compiler:       gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/026722464b44/disk-db2ddb87.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/0ab0dcb97f3e/vmlinux-db2ddb87.xz
kernel image: https://storage.googleapis.com/syzbot-assets/4889eea15f3a/bzImage-db2ddb87.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+2280f1cca5e6b0c353e4@syzkaller.appspotmail.com

==================================================================
BUG: KASAN: slab-use-after-free in string_nocheck lib/vsprintf.c:648 [inline]
BUG: KASAN: slab-use-after-free in string+0x471/0x4d0 lib/vsprintf.c:730
Read of size 1 at addr ffff88801db39d20 by task syz.3.345/7620

CPU: 0 UID: 0 PID: 7620 Comm: syz.3.345 Not tainted syzkaller #0 PREEMPT(full) 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 07/16/2026
Call Trace:
 <TASK>
 __dump_stack lib/dump_stack.c:94 [inline]
 dump_stack_lvl+0x100/0x190 lib/dump_stack.c:120
 print_address_description mm/kasan/report.c:378 [inline]
 print_report+0x13d/0x4b0 mm/kasan/report.c:482
 kasan_report+0xdf/0x1c0 mm/kasan/report.c:595
 string_nocheck lib/vsprintf.c:648 [inline]
 string+0x471/0x4d0 lib/vsprintf.c:730
 vsnprintf+0x422/0x1300 lib/vsprintf.c:2945
 vscnprintf lib/vsprintf.c:3014 [inline]
 scnprintf+0xdb/0x150 lib/vsprintf.c:3067
 f_midi2_opts_str_show drivers/usb/gadget/function/f_midi2.c:2187 [inline]
 f_midi2_opts_iface_name_show+0x6e/0xa0 drivers/usb/gadget/function/f_midi2.c:2592
 fill_read_buffer fs/configfs/file.c:68 [inline]
 configfs_read_iter+0x426/0x6f0 fs/configfs/file.c:88
 __kernel_read+0x397/0xad0 fs/read_write.c:532
 integrity_kernel_read+0x7e/0xb0 security/integrity/iint.c:28
 ima_calc_file_hash_tfm+0x25e/0x350 security/integrity/ima/ima_crypto.c:222
 ima_calc_file_hash+0x1e3/0x380 security/integrity/ima/ima_crypto.c:280
 ima_collect_measurement+0x94f/0xb30 security/integrity/ima/ima_api.c:300
 process_measurement+0xdfe/0x2350 security/integrity/ima/ima_main.c:425
 ima_file_check+0xcc/0x120 security/integrity/ima/ima_main.c:685
 security_file_post_open+0xc4/0x210 security/security.c:2755
 do_open fs/namei.c:4702 [inline]
 path_openat+0x985/0x4280 fs/namei.c:4863
 do_file_open+0x20e/0x430 fs/namei.c:4892
 do_sys_openat2+0x10f/0x1e0 fs/open.c:1368
 do_sys_open fs/open.c:1374 [inline]
 __do_sys_open fs/open.c:1382 [inline]
 __se_sys_open fs/open.c:1378 [inline]
 __x64_sys_open+0xfe/0x1d0 fs/open.c:1378
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0x115/0x870 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f84eff9e0d9
Code: ff c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 44 00 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 e8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007f84f0ea4028 EFLAGS: 00000246 ORIG_RAX: 0000000000000002
RAX: ffffffffffffffda RBX: 00007f84f0226090 RCX: 00007f84eff9e0d9
RDX: 0000000000000041 RSI: 0000000000040280 RDI: 00002000000003c0
RBP: 00007f84f0035024 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000000
R13: 00007f84f0226128 R14: 00007f84f0226090 R15: 00007ffc06c08488
 </TASK>

Allocated by task 7492:
 kasan_save_stack+0x30/0x50 mm/kasan/common.c:57
 kasan_save_track+0x14/0x30 mm/kasan/common.c:78
 poison_kmalloc_redzone mm/kasan/common.c:398 [inline]
 __kasan_kmalloc+0xaa/0xb0 mm/kasan/common.c:415
 kasan_kmalloc include/linux/kasan.h:263 [inline]
 __do_kmalloc_node mm/slub.c:5334 [inline]
 __kmalloc_node_track_caller_noprof+0x331/0x830 mm/slub.c:5471
 __kmemdup_nul mm/util.c:64 [inline]
 kstrndup+0x64/0x120 mm/util.c:120
 f_midi2_opts_str_store.constprop.0+0xbf/0x240 drivers/usb/gadget/function/f_midi2.c:2205
 flush_write_buffer fs/configfs/file.c:207 [inline]
 configfs_write_iter+0x302/0x4e0 fs/configfs/file.c:229
 new_sync_write fs/read_write.c:595 [inline]
 vfs_write+0x6ac/0x1050 fs/read_write.c:687
 ksys_write+0x12a/0x250 fs/read_write.c:739
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0x115/0x870 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f

Freed by task 7614:
 kasan_save_stack+0x30/0x50 mm/kasan/common.c:57
 kasan_save_track+0x14/0x30 mm/kasan/common.c:78
 kasan_save_free_info+0x3b/0x70 mm/kasan/generic.c:584
 poison_slab_object mm/kasan/common.c:253 [inline]
 __kasan_slab_free+0x5f/0x80 mm/kasan/common.c:285
 kasan_slab_free include/linux/kasan.h:235 [inline]
 slab_free_hook mm/slub.c:2677 [inline]
 slab_free mm/slub.c:6377 [inline]
 kfree+0x22b/0x6c0 mm/slub.c:6692
 f_midi2_opts_str_store.constprop.0+0xf0/0x240 drivers/usb/gadget/function/f_midi2.c:2211
 flush_write_buffer fs/configfs/file.c:207 [inline]
 configfs_write_iter+0x302/0x4e0 fs/configfs/file.c:229
 new_sync_write fs/read_write.c:595 [inline]
 vfs_write+0x6ac/0x1050 fs/read_write.c:687
 ksys_write+0x12a/0x250 fs/read_write.c:739
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0x115/0x870 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f

The buggy address belongs to the object at ffff88801db39d20
 which belongs to the cache kmalloc-8 of size 8
The buggy address is located 0 bytes inside of
 freed 8-byte region [ffff88801db39d20, ffff88801db39d28)

The buggy address belongs to the physical page:
page: refcount:0 mapcount:0 mapping:0000000000000000 index:0xffff88801db39d40 pfn:0x1db39
flags: 0xfff00000000200(workingset|node=0|zone=1|lastcpupid=0x7ff)
page_type: f5(slab)
raw: 00fff00000000200 ffff88813fe1f500 ffffea0000aa8350 ffffea0000dc08d0
raw: ffff88801db39d40 000000080080007e 00000000f5000000 0000000000000000
page dumped because: kasan: bad access detected
page_owner tracks the page as allocated
page last allocated via order 0, migratetype Unmovable, gfp_mask 0xd2cc0(GFP_KERNEL|__GFP_NOWARN|__GFP_NORETRY|__GFP_COMP|__GFP_NOMEMALLOC), pid 1, tgid 1 (swapper/0), ts 3614812637, free_ts 0
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
 shrinker_alloc+0x1f6/0xc90 mm/shrinker.c:735
 rpcauth_init_module+0x35/0xc0 net/sunrpc/auth.c:875
 init_sunrpc+0x2c/0x120 net/sunrpc/sunrpc_syms.c:96
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
 ffff88801db39c00: 00 fc fc fc 00 fc fc fc 00 fc fc fc fa fc fc fc
 ffff88801db39c80: 05 fc fc fc 05 fc fc fc fa fc fc fc fa fc fc fc
>ffff88801db39d00: fa fc fc fc fa fc fc fc fa fc fc fc 05 fc fc fc
                               ^
 ffff88801db39d80: 05 fc fc fc 00 fc fc fc 00 fc fc fc 00 fc fc fc
 ffff88801db39e00: 00 fc fc fc 00 fc fc fc 00 fc fc fc 00 fc fc fc
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

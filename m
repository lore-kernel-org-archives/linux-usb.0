Received: from mail-oi1-f207.google.com (mail-oi1-f207.google.com [209.85.167.207])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEE9247AF66
	for <linux-usb@vger.kernel.org>; Thu,  6 Aug 2026 15:27:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.207
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786030061; cv=none; b=S1BVmBn/eS8e2XuMRddNVnCFhdDS1E23b/PTA+UjPJ2H5ZDcsbS4y/8+Lp876bHUlKUCNW+AGxZkHzh7hSuw3xwzvimlthUl7iIU0soL52qguIvN5viqZg4PfZorGeG+qMysrygcKzGekbGpB/FnoIf/6Ev10LBB8dZeMkobx+Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786030061; c=relaxed/simple;
	bh=TLNtzi0beNnNqupIwhyuBN9Vv8zU9F7Fn7xciLxGe9c=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=EbzB71pmjd9MKVp9/hFTFd9darQhL/vNQex4y5GiZm5EGwqRhlP7sD0IyWAgc+npktOYrlPM2LGHDSIw4cAFxfyyBP243giYSbTd1dx4PMMjPXc8VQcGV7Ax9kjlDuqIGoP0i3gZNckmkaPeClT2kHbof9dPQaulkFG4Z/7XhRQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.207
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f207.google.com with SMTP id 5614622812f47-4af9bf0f53bso2481824b6e.1
        for <linux-usb@vger.kernel.org>; Thu, 06 Aug 2026 08:27:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786030058; x=1786634858;
        h=content-type:to:from:subject:message-id:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ol6ErYFCCNoJaQku5fxC4rrTezrEzpC4/VWFbSEPWx8=;
        b=KimW/lkl0xxDRPVt4IL/KKM4Jmw7RI0B5eQnblt6hdi5E3I9MGJyP3Sz7ISdySidC+
         C1RRwnmNr0wz8uxgj71T/Qlfw5HN8k2jG8txTdHSnGgUgirmziYCPdWBaKdop7YJYyjN
         HD25QeH4I8D0kfPkAg7q4xNFbGvHSwlwEYU9y6edVzIb2ZEYlCI7KHpf74UH/FzfnZQW
         HO09+tDzCjQdv1AHtRRt3xX7ukaVtdrjEbs4frANAkHVG8MIPgV0PWr3Rz4E8F4P26I1
         vz9j6rfVxs6jNLbYBS0VcAxG9+7oqQUiTfLdGXpp3f4O4VFSfUAjnoDf6y+VhcRnqO1y
         qsfg==
X-Forwarded-Encrypted: i=1; AHgh+Ro7YQZMHz379VqHBBGcpfGPg63i+nTPO1oExGaq/zUF3k6rzP0DRu76K6Djtd+sHNOfFE+lBSR/kE8=@vger.kernel.org
X-Gm-Message-State: AOJu0YzrGH1Llw9RFpAyZPNEp9zxWkkdW2T/tPcZecrxzVdcpngezqac
	6dE7qPbWJsI+ZoMHccgn9xRzRWAYK8nDqhA0pIcipZTwDHe2X/nJ8DFQiNtN56spZmOcY7jb7FS
	AvbzXF/2CKc8/CDnKfMBXLqjyCUBmafmvC5ZmgB3jxnHvGEIG6tcXSdEZWl0=
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:178f:b0:6ae:c68b:3a7 with SMTP id
 006d021491bc7-6b0213d0da9mr1305121eaf.16.1786030057871; Thu, 06 Aug 2026
 08:27:37 -0700 (PDT)
Date: Thu, 06 Aug 2026 08:27:37 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6a74a7e9.01d0871a.3a0d52.0023.GAE@google.com>
Subject: [syzbot] [usb?] KASAN: slab-use-after-free Read in trace_event_raw_event_udc_log_req
From: syzbot <syzbot+de553c19cb054f174a35@syzkaller.appspotmail.com>
To: gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    848acc8ffe1b Merge tag 'fsverity-for-linus' of git://git.k..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=122adc9e580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=f221a1b5d497ed15
dashboard link: https://syzkaller.appspot.com/bug?extid=de553c19cb054f174a35
compiler:       gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44
userspace arch: i386

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image (non-bootable): https://storage.googleapis.com/syzbot-assets/d900f083ada3/non_bootable_disk-848acc8f.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/31f94fe4d67f/vmlinux-848acc8f.xz
kernel image: https://storage.googleapis.com/syzbot-assets/391ba15cbf42/bzImage-848acc8f.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+de553c19cb054f174a35@syzkaller.appspotmail.com

configfs-gadget.g1 gadget.0: uvc: uvc_function_bind()
configfs-gadget.g1 gadget.0: uvc: Unable to allocate streaming EP
==================================================================
BUG: KASAN: slab-use-after-free in do_trace_event_raw_event_udc_log_req drivers/usb/gadget/udc/trace.h:223 [inline]
BUG: KASAN: slab-use-after-free in trace_event_raw_event_udc_log_req+0x665/0x6c0 drivers/usb/gadget/udc/trace.h:223
Read of size 4 at addr ffff88802614ee10 by task syz.4.3628/14808

CPU: 3 UID: 0 PID: 14808 Comm: syz.4.3628 Not tainted syzkaller #0 PREEMPT(full) 
Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.3-debian-1.16.3-2 04/01/2014
Call Trace:
 <TASK>
 __dump_stack lib/dump_stack.c:94 [inline]
 dump_stack_lvl+0x100/0x190 lib/dump_stack.c:120
 print_address_description mm/kasan/report.c:378 [inline]
 print_report+0x13d/0x4b0 mm/kasan/report.c:482
 kasan_report+0xdf/0x1c0 mm/kasan/report.c:595
 do_trace_event_raw_event_udc_log_req drivers/usb/gadget/udc/trace.h:223 [inline]
 trace_event_raw_event_udc_log_req+0x665/0x6c0 drivers/usb/gadget/udc/trace.h:223
 __do_trace_usb_ep_free_request drivers/usb/gadget/udc/trace.h:269 [inline]
 trace_usb_ep_free_request drivers/usb/gadget/udc/trace.h:269 [inline]
 usb_ep_free_request+0x1cc/0x280 drivers/usb/gadget/udc/core.c:220
 uvc_function_bind+0x181a/0x1939 drivers/usb/gadget/function/f_uvc.c:893
 usb_add_function+0x219/0x890 drivers/usb/gadget/composite.c:333
 configfs_composite_bind+0xd83/0x1960 drivers/usb/gadget/configfs.c:1802
 gadget_bind_driver+0x28c/0xbf0 drivers/usb/gadget/udc/core.c:1662
 call_driver_probe drivers/base/dd.c:628 [inline]
 really_probe+0x241/0xa60 drivers/base/dd.c:706
 __driver_probe_device+0x20e/0x450 drivers/base/dd.c:868
 driver_probe_device+0x4a/0x140 drivers/base/dd.c:898
 __driver_attach+0x21f/0x5b0 drivers/base/dd.c:1292
 bus_for_each_dev+0x13e/0x1d0 drivers/base/bus.c:383
 bus_add_driver+0x305/0x5b0 drivers/base/bus.c:763
 driver_register+0x1e2/0x360 drivers/base/driver.c:174
 usb_gadget_register_driver_owner+0x132/0x210 drivers/usb/gadget/udc/core.c:1752
 gadget_dev_desc_UDC_store+0x1b0/0x2e0 drivers/usb/gadget/configfs.c:300
 flush_write_buffer fs/configfs/file.c:207 [inline]
 configfs_write_iter+0x302/0x4e0 fs/configfs/file.c:229
 new_sync_write fs/read_write.c:595 [inline]
 vfs_write+0x6ac/0x1050 fs/read_write.c:687
 ksys_write+0x12a/0x250 fs/read_write.c:739
 do_syscall_32_irqs_on arch/x86/entry/syscall_32.c:83 [inline]
 __do_fast_syscall_32+0xe7/0x970 arch/x86/entry/syscall_32.c:307
 do_fast_syscall_32+0x32/0x70 arch/x86/entry/syscall_32.c:332
 entry_SYSENTER_compat_after_hwframe+0x84/0x8e
RIP: 0023:0xf709efec
Code: Unable to access opcode bytes at 0xf709efc2.
RSP: 002b:00000000f548d50c EFLAGS: 00000292 ORIG_RAX: 0000000000000004
RAX: ffffffffffffffda RBX: 0000000000000003 RCX: 00000000800001c0
RDX: 000000000000000b RSI: 0000000000000000 RDI: 0000000000000000
RBP: 0000000000000000 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000292 R12: 0000000000000000
R13: 0000000000000000 R14: 0000000000000000 R15: 0000000000000000
 </TASK>

Allocated by task 14351:
 kasan_save_stack+0x30/0x50 mm/kasan/common.c:57
 kasan_save_track+0x14/0x30 mm/kasan/common.c:78
 poison_kmalloc_redzone mm/kasan/common.c:398 [inline]
 __kasan_kmalloc+0xaa/0xb0 mm/kasan/common.c:415
 kasan_kmalloc include/linux/kasan.h:263 [inline]
 __kmalloc_cache_noprof+0x2e5/0x6c0 mm/slub.c:5489
 _kmalloc_noprof include/linux/slab.h:988 [inline]
 _kzalloc_noprof include/linux/slab.h:1309 [inline]
 __devl_resource_register+0x178/0x630 net/devlink/resource.c:500
 devl_port_resource_register+0x5f/0x90 net/devlink/resource.c:712
 __nsim_dev_port_add+0x35f/0x8f0 drivers/net/netdevsim/dev.c:1497
 nsim_dev_port_add_all drivers/net/netdevsim/dev.c:1570 [inline]
 nsim_drv_probe+0xdbd/0x13a0 drivers/net/netdevsim/dev.c:1731
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
 nsim_bus_dev_new drivers/net/netdevsim/bus.c:471 [inline]
 new_device_store+0x40b/0x700 drivers/net/netdevsim/bus.c:191
 bus_attr_store+0x74/0xb0 drivers/base/bus.c:172
 sysfs_kf_write+0xf2/0x150 fs/sysfs/file.c:145
 kernfs_fop_write_iter+0x3e0/0x5f0 fs/kernfs/file.c:345
 new_sync_write fs/read_write.c:595 [inline]
 vfs_write+0x6ac/0x1050 fs/read_write.c:687
 ksys_write+0x12a/0x250 fs/read_write.c:739
 do_syscall_32_irqs_on arch/x86/entry/syscall_32.c:83 [inline]
 do_int80_emulation+0x14b/0x720 arch/x86/entry/syscall_32.c:172
 asm_int80_emulation+0x1a/0x20 arch/x86/include/asm/idtentry.h:598

Freed by task 14628:
 kasan_save_stack+0x30/0x50 mm/kasan/common.c:57
 kasan_save_track+0x14/0x30 mm/kasan/common.c:78
 kasan_save_free_info+0x3b/0x70 mm/kasan/generic.c:584
 poison_slab_object mm/kasan/common.c:253 [inline]
 __kasan_slab_free+0x5f/0x80 mm/kasan/common.c:285
 kasan_slab_free include/linux/kasan.h:235 [inline]
 slab_free_hook mm/slub.c:2677 [inline]
 slab_free mm/slub.c:6377 [inline]
 kfree+0x22b/0x6c0 mm/slub.c:6692
 __devl_resources_unregister+0x179/0x2e0 net/devlink/resource.c:585
 __nsim_dev_port_del+0x225/0x2b0 drivers/net/netdevsim/dev.c:1550
 nsim_dev_port_del_all drivers/net/netdevsim/dev.c:1561 [inline]
 nsim_dev_reload_destroy+0x10a/0x4a0 drivers/net/netdevsim/dev.c:1785
 nsim_dev_reload_down+0x66/0xd0 drivers/net/netdevsim/dev.c:1038
 devlink_reload+0x1ae/0x7a0 net/devlink/dev.c:462
 devlink_pernet_pre_exit+0x247/0x370 net/devlink/core.c:560
 ops_pre_exit_list net/core/net_namespace.c:161 [inline]
 ops_undo_list+0x187/0xab0 net/core/net_namespace.c:234
 cleanup_net+0x499/0x920 net/core/net_namespace.c:702
 process_one_work+0xa23/0x1940 kernel/workqueue.c:3322
 process_scheduled_works kernel/workqueue.c:3405 [inline]
 worker_thread+0x5ef/0xe50 kernel/workqueue.c:3486
 kthread+0x370/0x450 kernel/kthread.c:436
 ret_from_fork+0x72b/0xd50 arch/x86/kernel/process.c:158
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245

The buggy address belongs to the object at ffff88802614ee00
 which belongs to the cache kmalloc-128 of size 128
The buggy address is located 16 bytes inside of
 freed 128-byte region [ffff88802614ee00, ffff88802614ee80)

The buggy address belongs to the physical page:
page: refcount:0 mapcount:0 mapping:0000000000000000 index:0xffff88802614e400 pfn:0x2614e
flags: 0xfff00000000200(workingset|node=0|zone=1|lastcpupid=0x7ff)
page_type: f5(slab)
raw: 00fff00000000200 ffff88801bc42a00 ffffea00008a09d0 ffffea000039f290
raw: ffff88802614e400 000000080010000d 00000000f5000000 0000000000000000
page dumped because: kasan: bad access detected
page_owner tracks the page as allocated
page last allocated via order 0, migratetype Unmovable, gfp_mask 0xd2cc0(GFP_KERNEL|__GFP_NOWARN|__GFP_NORETRY|__GFP_COMP|__GFP_NOMEMALLOC), pid 5171, tgid 5171 (udevd), ts 24372012460, free_ts 22742895399
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
 _kzalloc_noprof include/linux/slab.h:1309 [inline]
 kernfs_get_open_node fs/kernfs/file.c:536 [inline]
 kernfs_fop_open+0x9fa/0xd50 fs/kernfs/file.c:711
 do_dentry_open+0x6ab/0x14d0 fs/open.c:947
 vfs_open+0x82/0x3f0 fs/open.c:1052
 do_open fs/namei.c:4700 [inline]
 path_openat+0x2873/0x4280 fs/namei.c:4863
 do_file_open+0x20e/0x430 fs/namei.c:4892
 do_sys_openat2+0x10f/0x1e0 fs/open.c:1368
 do_sys_open fs/open.c:1374 [inline]
 __do_sys_openat fs/open.c:1390 [inline]
 __se_sys_openat fs/open.c:1385 [inline]
 __x64_sys_openat+0x12d/0x210 fs/open.c:1385
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0x115/0x840 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
page last free pid 5304 tgid 5304 stack trace:
 reset_page_owner include/linux/page_owner.h:25 [inline]
 __free_pages_prepare mm/page_alloc.c:1406 [inline]
 __free_frozen_pages+0x79f/0x1090 mm/page_alloc.c:2950
 qlink_free mm/kasan/quarantine.c:163 [inline]
 qlist_free_all+0x47/0xf0 mm/kasan/quarantine.c:179
 kasan_quarantine_reduce+0x1a0/0x1f0 mm/kasan/quarantine.c:286
 __kasan_slab_alloc+0x69/0x90 mm/kasan/common.c:350
 kasan_slab_alloc include/linux/kasan.h:253 [inline]
 slab_post_alloc_hook mm/slub.c:4584 [inline]
 slab_alloc_node mm/slub.c:4917 [inline]
 kmem_cache_alloc_noprof+0x26b/0x6a0 mm/slub.c:4931
 alloc_filename fs/namei.c:147 [inline]
 do_getname+0x35/0x390 fs/namei.c:187
 class_filename_flags_constructor include/linux/fs.h:2566 [inline]
 do_sys_openat2+0xc7/0x1e0 fs/open.c:1367
 do_sys_open fs/open.c:1374 [inline]
 __do_sys_openat fs/open.c:1390 [inline]
 __se_sys_openat fs/open.c:1385 [inline]
 __x64_sys_openat+0x12d/0x210 fs/open.c:1385
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0x115/0x840 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f

Memory state around the buggy address:
 ffff88802614ed00: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 fc fc
 ffff88802614ed80: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
>ffff88802614ee00: fa fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
                         ^
 ffff88802614ee80: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
 ffff88802614ef00: fa fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
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

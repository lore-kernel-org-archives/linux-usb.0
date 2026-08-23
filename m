Received: from mail-oa2-f1.google.com (mail-oa2-f1.google.com [74.125.231.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65F8E263F4A
	for <linux-usb@vger.kernel.org>; Sun, 23 Aug 2026 01:43:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787449418; cv=none; b=I+NGQSwxLtXVRopV1QrM3NARtsl/BNH6ENP0W4LAdRgODQDSlIlb8UyeyrX0DoBbyZnjSLzJZEv7Oyn+yPihvF7heKqMQIXd9A+/RUmHColDFqKZjaUcWrCzTHJGiNs/QNd1w0bCaNSYubHksl2vQGgW6u738h3rQrpSgd3lrpI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787449418; c=relaxed/simple;
	bh=KqlhfNW532a9LP3pkCSsNMN+0ODrQrMcolhgBRExKog=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=Pzrq18zNAEA2vY/dZ8lBVE6z6tp6E6cASyJzv2YNChBMUkb+YKLPRdy1a1Iw0PrQVItpiwJX9+kJDG9UytD/d0VeWEJTIPjNq/QFxWSaqqpZuVKVJ1+UfVVPVkSjpOt6yo4Yq0CFzc6sTGZ2XI/wbXKBHJUCTNwjSmpYbG6MSfw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=74.125.231.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oa2-f1.google.com with SMTP id 586e51a60fabf-4489b7aa0e7so564394fac.1
        for <linux-usb@vger.kernel.org>; Sat, 22 Aug 2026 18:43:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787449415; x=1788054215;
        h=content-type:to:from:subject:message-id:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=v86Mt6Pyeq9swYFtArO8cP1+HO5Yyqv65TdzCRH5ZHQ=;
        b=dWF8c99TxBa9l3FtK/ZvRkjh7ZUtC+MhRMq0OLdmi1db9OEUIUzUXzWqZx+T4zHf2c
         GSyEkmyuwtt0S1eGb/07F4T4IbuuvAf+O6Bgv1oEMjTf80oiW2QUoZio5eqVDnT+pVPL
         MHgkY8HtxDDD8qjcZ9zIV3tbpbzxZ5LCS7DLAQnp2n0ZURGBJAR3tDLQc128uDVUmEYL
         v7CxOJcmqIPMP7uKTO4Rje6HbhTljPMH69WAr/jieTSNra+LqeNWFXX61+q7BC4AiyJ3
         bLPgmva4bAu+EhdlwFeXIY805rFRbz52B/f4QtzHByoTrju6SJWhjYmEY6PlCuox0j2B
         saLA==
X-Forwarded-Encrypted: i=1; AHgh+RqXCaI+1BDTnZLel7yL00GeqcFFptU9jlua74EN2iJXMZ89Cm84eBFxaS0Oc7jVew142SPf6xCa47g=@vger.kernel.org
X-Gm-Message-State: AFuF++kwtvqAD30u3dmFm1FUat3D7qwdSXvD1OFgy4bCFbCsSdVIbZg0
	oCMWwFeidz6beTRcqTyXvRSqZovatY+0Bm85geefcuAFRFn1jfOVN03wq1gFEWMW8+rNOoUaUZQ
	22iyXv74BWJfE0WgFbC6XexozTscq8Azz1KeI5smuoZkCKQnwPVyU4msZJKU=
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:1c06:b0:4a4:ddde:5207 with SMTP id
 5614622812f47-4b3099f7b0cmr10532617b6e.8.1787449415352; Sat, 22 Aug 2026
 18:43:35 -0700 (PDT)
Date: Sat, 22 Aug 2026 18:43:35 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6a8a5047.dbb3a75c.13dd47.003e.GAE@google.com>
Subject: [syzbot] [usb?] KASAN: slab-use-after-free Write in usb_giveback_urb_bh
From: syzbot <syzbot+cade843a1e4af0651f5e@syzkaller.appspotmail.com>
To: gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    a4ff2be345d0 Merge tag 'v7.3-p1' of git://git.kernel.org/p..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=1723ee79580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=2823969bbc36a8c4
dashboard link: https://syzkaller.appspot.com/bug?extid=cade843a1e4af0651f5e
compiler:       Debian clang version 22.1.8 (++20260613092233+e80beda6e255-1~exp1~20260613092250.77), Debian LLD 22.1.8

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/058e33081021/disk-a4ff2be3.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/33ebad2a63ba/vmlinux-a4ff2be3.xz
kernel image: https://storage.googleapis.com/syzbot-assets/6e7b43fa415b/bzImage-a4ff2be3.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+cade843a1e4af0651f5e@syzkaller.appspotmail.com

==================================================================
BUG: KASAN: slab-use-after-free in usb_giveback_urb_bh+0x2b9/0x440 drivers/usb/core/hcd.c:1692
Write of size 8 at addr ffff888029ab0338 by task ksoftirqd/0/15

CPU: 0 UID: 0 PID: 15 Comm: ksoftirqd/0 Tainted: G             L      syzkaller #0 PREEMPT_{RT,(full)} 
Tainted: [L]=SOFTLOCKUP
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 07/24/2026
Call Trace:
 <TASK>
 dump_stack_lvl+0xe8/0x150 lib/dump_stack.c:120
 print_address_description+0x55/0x1e0 mm/kasan/report.c:378
 print_report+0x58/0x70 mm/kasan/report.c:482
 kasan_report+0x117/0x150 mm/kasan/report.c:595
 usb_giveback_urb_bh+0x2b9/0x440 drivers/usb/core/hcd.c:1692
 process_one_work kernel/workqueue.c:3322 [inline]
 process_scheduled_works+0xa88/0x14c0 kernel/workqueue.c:3405
 bh_worker+0x46a/0x880 kernel/workqueue.c:3708
 tasklet_hi_action+0xf/0x70 kernel/softirq.c:1003
 handle_softirqs+0x1da/0x6d0 kernel/softirq.c:645
 run_ksoftirqd+0x53/0x190 kernel/softirq.c:1108
 smpboot_thread_fn+0x565/0xa70 kernel/smpboot.c:160
 kthread+0x38b/0x470 kernel/kthread.c:436
 ret_from_fork+0x514/0xb70 arch/x86/kernel/process.c:158
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245
 </TASK>

Allocated by task 1:
 kasan_save_stack mm/kasan/common.c:57 [inline]
 kasan_save_track+0x3e/0x80 mm/kasan/common.c:78
 poison_kmalloc_redzone mm/kasan/common.c:398 [inline]
 __kasan_kmalloc+0x93/0xb0 mm/kasan/common.c:415
 kasan_kmalloc include/linux/kasan.h:263 [inline]
 __do_kmalloc_node mm/slub.c:5334 [inline]
 __kmalloc_noprof+0x422/0x780 mm/slub.c:5359
 _kmalloc_noprof include/linux/slab.h:992 [inline]
 _kzalloc_noprof include/linux/slab.h:1309 [inline]
 __usb_create_hcd+0x67/0x900 drivers/usb/core/hcd.c:2566
 dummy_hcd_probe+0xf6/0x270 drivers/usb/gadget/udc/dummy_hcd.c:2717
 platform_probe+0xf9/0x190 drivers/base/platform.c:1507
 call_driver_probe drivers/base/dd.c:-1 [inline]
 really_probe+0x254/0xae0 drivers/base/dd.c:706
 __driver_probe_device+0x1e8/0x360 drivers/base/dd.c:868
 driver_probe_device+0x4f/0x240 drivers/base/dd.c:898
 __device_attach_driver+0x270/0x410 drivers/base/dd.c:1026
 bus_for_each_drv+0x25b/0x2f0 drivers/base/bus.c:500
 __device_attach+0x2c7/0x450 drivers/base/dd.c:1098
 device_initial_probe+0xa1/0xd0 drivers/base/dd.c:1153
 bus_probe_device+0x12d/0x220 drivers/base/bus.c:620
 device_add+0x7d7/0xb80 drivers/base/core.c:3776
 platform_device_add+0x4bd/0x860 drivers/base/platform.c:833
 dummy_hcd_init+0x667/0xd00 drivers/usb/gadget/udc/dummy_hcd.c:2873
 do_one_initcall+0x250/0x870 init/main.c:1353
 do_initcall_level+0x10a/0x1a0 init/main.c:1415
 do_initcalls+0x59/0xa0 init/main.c:1431
 kernel_init_freeable+0x29d/0x3e0 init/main.c:1666
 kernel_init+0x22/0x1d0 init/main.c:1556
 ret_from_fork+0x514/0xb70 arch/x86/kernel/process.c:158
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245

Freed by task 8989:
 kasan_save_stack mm/kasan/common.c:57 [inline]
 kasan_save_track+0x3e/0x80 mm/kasan/common.c:78
 kasan_save_free_info+0x40/0x50 mm/kasan/generic.c:584
 poison_slab_object mm/kasan/common.c:253 [inline]
 __kasan_slab_free+0x5c/0x80 mm/kasan/common.c:285
 kasan_slab_free include/linux/kasan.h:235 [inline]
 slab_free_hook mm/slub.c:2677 [inline]
 slab_free mm/slub.c:6377 [inline]
 kfree+0x1c5/0x6d0 mm/slub.c:6692
 usb_release_dev+0x57/0xe0 drivers/usb/core/usb.c:497
 device_release+0xc4/0x1f0 drivers/base/core.c:-1
 kobject_cleanup lib/kobject.c:689 [inline]
 kobject_release lib/kobject.c:720 [inline]
 kref_put include/linux/kref.h:65 [inline]
 kobject_put+0x222/0x550 lib/kobject.c:737
 usbdev_open+0x1f0/0x790 drivers/usb/core/devio.c:1086
 chrdev_open+0x4dc/0x600 fs/char_dev.c:411
 do_dentry_open+0x849/0x1420 fs/open.c:996
 vfs_open+0x3b/0x350 fs/open.c:1101
 do_open fs/namei.c:4837 [inline]
 path_openat+0x1448/0x1d60 fs/namei.c:5000
 do_file_open+0x23e/0x4a0 fs/namei.c:5029
 do_sys_openat2+0x115/0x200 fs/open.c:1417
 do_sys_open fs/open.c:1423 [inline]
 __do_sys_openat fs/open.c:1439 [inline]
 __se_sys_openat fs/open.c:1434 [inline]
 __x64_sys_openat+0x138/0x170 fs/open.c:1434
 do_syscall_x64 arch/x86/entry/syscall_64.c:61 [inline]
 do_syscall_64+0x166/0x520 arch/x86/entry/syscall_64.c:84
 entry_SYSCALL_64_after_hwframe+0x77/0x7f

Last potentially related work creation:
 kasan_save_stack+0x3e/0x60 mm/kasan/common.c:57
 kasan_record_aux_stack+0xbd/0xd0 mm/kasan/generic.c:556
 insert_work+0x3d/0x330 kernel/workqueue.c:2226
 __queue_work+0xd1e/0x10f0 kernel/workqueue.c:2401
 queue_work_on+0x106/0x1d0 kernel/workqueue.c:2452
 usb_rh_urb_dequeue drivers/usb/core/hcd.c:845 [inline]
 unlink1+0x33d/0x3e0 drivers/usb/core/hcd.c:1580
 usb_hcd_flush_endpoint+0x167/0x440 drivers/usb/core/hcd.c:1794
 usb_disable_endpoint drivers/usb/core/message.c:1362 [inline]
 usb_disable_interface+0x279/0x350 drivers/usb/core/message.c:1408
 usb_unbind_interface+0x265/0x9f0 drivers/usb/core/driver.c:456
 device_remove drivers/base/dd.c:618 [inline]
 __device_release_driver drivers/base/dd.c:1349 [inline]
 device_release_driver_internal+0x4f5/0x880 drivers/base/dd.c:1372
 bus_remove_device+0x449/0x560 drivers/base/bus.c:664
 device_del+0x528/0x8f0 drivers/base/core.c:3965
 usb_disable_device+0x3d4/0x8d0 drivers/usb/core/message.c:1478
 usb_disconnect+0x32d/0x990 drivers/usb/core/hub.c:2345
 usb_remove_hcd+0x275/0x670 drivers/usb/core/hcd.c:3059
 dummy_hcd_remove+0xed/0x130 drivers/usb/gadget/udc/dummy_hcd.c:2761
 device_remove drivers/base/dd.c:616 [inline]
 __device_release_driver drivers/base/dd.c:1349 [inline]
 device_release_driver_internal+0x48b/0x880 drivers/base/dd.c:1372
 unbind_store+0x1a4/0x1d0 drivers/base/bus.c:244
 kernfs_fop_write_iter+0x3a5/0x540 fs/kernfs/file.c:345
 new_sync_write fs/read_write.c:595 [inline]
 vfs_write+0x61e/0xbb0 fs/read_write.c:687
 ksys_write+0x156/0x270 fs/read_write.c:739
 do_syscall_x64 arch/x86/entry/syscall_64.c:61 [inline]
 do_syscall_64+0x166/0x520 arch/x86/entry/syscall_64.c:84
 entry_SYSCALL_64_after_hwframe+0x77/0x7f

Second to last potentially related work creation:
 kasan_save_stack+0x3e/0x60 mm/kasan/common.c:57
 kasan_record_aux_stack+0xbd/0xd0 mm/kasan/generic.c:556
 insert_work+0x3d/0x330 kernel/workqueue.c:2226
 __queue_work+0xd1e/0x10f0 kernel/workqueue.c:2401
 queue_work_on+0x106/0x1d0 kernel/workqueue.c:2452
 rh_call_control drivers/usb/core/hcd.c:706 [inline]
 rh_urb_enqueue drivers/usb/core/hcd.c:817 [inline]
 usb_hcd_submit_urb+0xa2d/0x1b40 drivers/usb/core/hcd.c:1538
 usb_start_wait_urb+0x13f/0x5b0 drivers/usb/core/message.c:62
 usb_internal_control_msg drivers/usb/core/message.c:117 [inline]
 usb_control_msg+0x234/0x3e0 drivers/usb/core/message.c:167
 usb_clear_port_feature drivers/usb/core/hub.c:456 [inline]
 port_event drivers/usb/core/hub.c:5773 [inline]
 hub_event+0x832/0x4cf0 drivers/usb/core/hub.c:5961
 process_one_work kernel/workqueue.c:3322 [inline]
 process_scheduled_works+0xa88/0x14c0 kernel/workqueue.c:3405
 worker_thread+0xa47/0xfb0 kernel/workqueue.c:3486
 kthread+0x38b/0x470 kernel/kthread.c:436
 ret_from_fork+0x514/0xb70 arch/x86/kernel/process.c:158
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245

The buggy address belongs to the object at ffff888029ab0000
 which belongs to the cache kmalloc-2k of size 2048
The buggy address is located 824 bytes inside of
 freed 2048-byte region [ffff888029ab0000, ffff888029ab0800)

The buggy address belongs to the physical page:
page: refcount:0 mapcount:0 mapping:0000000000000000 index:0xffff888029ab6000 pfn:0x29ab0
head: order:3 mapcount:0 entire_mapcount:0 nr_pages_mapped:0 pincount:0
flags: 0x80000000000240(workingset|head|node=0|zone=1)
page_type: f5(slab)
raw: 0080000000000240 ffff88813ffb2000 ffffea0000a7ce10 ffffea0000a55a10
raw: ffff888029ab6000 0000000800080006 00000000f5000000 0000000000000000
head: 0080000000000240 ffff88813ffb2000 ffffea0000a7ce10 ffffea0000a55a10
head: ffff888029ab6000 0000000800080006 00000000f5000000 0000000000000000
head: 0080000000000003 fffffffffffffe01 00000000ffffffff 00000000ffffffff
head: 0000000000000000 0000000000000000 00000000ffffffff 0000000000000008
page dumped because: kasan: bad access detected
page_owner tracks the page as allocated
page last allocated via order 3, migratetype Unmovable, gfp_mask 0xd20c0(__GFP_IO|__GFP_FS|__GFP_NOWARN|__GFP_NORETRY|__GFP_COMP|__GFP_NOMEMALLOC), pid 1, tgid 1 (swapper/0), ts 12235747769, free_ts 11878976125
 set_page_owner include/linux/page_owner.h:32 [inline]
 post_alloc_hook+0x1f9/0x250 mm/page_alloc.c:1859
 prep_new_page mm/page_alloc.c:1867 [inline]
 get_page_from_freelist+0x2630/0x26a0 mm/page_alloc.c:3946
 __alloc_frozen_pages_noprof+0x18d/0x380 mm/page_alloc.c:5304
 alloc_slab_page mm/slub.c:3266 [inline]
 allocate_slab+0x79/0x5e0 mm/slub.c:3380
 new_slab mm/slub.c:3426 [inline]
 refill_objects+0x2d8/0x350 mm/slub.c:7310
 refill_sheaf mm/slub.c:2804 [inline]
 __pcs_replace_empty_main+0x334/0x690 mm/slub.c:4675
 alloc_from_pcs mm/slub.c:4773 [inline]
 slab_alloc_node mm/slub.c:4905 [inline]
 __do_kmalloc_node mm/slub.c:5333 [inline]
 __kmalloc_noprof+0x54c/0x780 mm/slub.c:5359
 _kmalloc_noprof include/linux/slab.h:992 [inline]
 _kzalloc_noprof include/linux/slab.h:1309 [inline]
 platform_device_alloc+0x39/0x260 drivers/base/platform.c:634
 dummy_hcd_init+0x2c9/0xd00 drivers/usb/gadget/udc/dummy_hcd.c:2841
 do_one_initcall+0x250/0x870 init/main.c:1353
 do_initcall_level+0x10a/0x1a0 init/main.c:1415
 do_initcalls+0x59/0xa0 init/main.c:1431
 kernel_init_freeable+0x29d/0x3e0 init/main.c:1666
 kernel_init+0x22/0x1d0 init/main.c:1556
 ret_from_fork+0x514/0xb70 arch/x86/kernel/process.c:158
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245
page last free pid 100 tgid 100 stack trace:
 reset_page_owner include/linux/page_owner.h:25 [inline]
 __free_pages_prepare mm/page_alloc.c:1406 [inline]
 free_pages_prepare+0x946/0xa40 mm/page_alloc.c:1451
 __free_contig_range_common+0x174/0x340 mm/page_alloc.c:6897
 __free_contig_range mm/page_alloc.c:6942 [inline]
 free_pages_bulk+0x48/0x120 mm/page_alloc.c:5257
 vm_area_free_pages mm/vmalloc.c:3461 [inline]
 vfree+0x26d/0x510 mm/vmalloc.c:3510
 delayed_vfree_work+0x55/0x80 mm/vmalloc.c:3414
 process_one_work kernel/workqueue.c:3322 [inline]
 process_scheduled_works+0xa88/0x14c0 kernel/workqueue.c:3405
 worker_thread+0xa47/0xfb0 kernel/workqueue.c:3486
 kthread+0x38b/0x470 kernel/kthread.c:436
 ret_from_fork+0x514/0xb70 arch/x86/kernel/process.c:158
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245

Memory state around the buggy address:
 ffff888029ab0200: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
 ffff888029ab0280: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
>ffff888029ab0300: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
                                        ^
 ffff888029ab0380: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
 ffff888029ab0400: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
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

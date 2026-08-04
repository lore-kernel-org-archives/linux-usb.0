Received: from mail-oi1-f205.google.com (mail-oi1-f205.google.com [209.85.167.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C68B4322F7
	for <linux-usb@vger.kernel.org>; Tue,  4 Aug 2026 07:58:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785830307; cv=none; b=f6VrXg8w2gfd4G7gA7a+TsyJDGjpO7sH/ZHd7KOlGtquQcK+SPezV7hN+yW5rB+miB/vFjTrXzFrzLg6W1n8x1jgSWieefyDjKa06zqgYBPq2w3jmLiNjp9tdTI2vtBWjKviC/i+EwibcU7BDQR4Q8Oi7YkEsuSAJW9pyVDAtCc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785830307; c=relaxed/simple;
	bh=nFAJlNwvWpSyM+O54QQv6/IEWGgAg8+mFeX/SXMVbGA=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=DrwRIYIgePMiB/9hpqTHcKdRI3HNE/9lM8oz5WgCnKVi9pqszT1NwoE7HaE+Vaj3NY5VLqBQHb0ngaBjOIP1nceCrG/JggXPN3wyYC/ZHxaGgBYUn3Q/jjTsQWJHKcHxEUoYMZxfQjXSK/X8+kzVDLcnPzziDDpe3+5vlBZVuvU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f205.google.com with SMTP id 5614622812f47-4ab4f78b9f4so6051965b6e.2
        for <linux-usb@vger.kernel.org>; Tue, 04 Aug 2026 00:58:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785830301; x=1786435101;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=niN0oSdOYYnND6Z8Z3eXEa6vxofx4zNPxe7xlHEChEs=;
        b=pFAv3LjhOKnr8JIrw3RT5sOU66ZehMhj60NgXZdAzxH/mCIlVSVAXYYLkd5O+mS0SU
         D+2IED/ECrwBMHRsJ9ZU6f8cEdBjD/NVOJFikjVqIJJ5kJhwa+qJAF3ah2qomecwygnA
         7nWe4hkRTUr9CNbwy2ZFTHIt2zoWxawz3U8NkEUbXffJQ/B8aMBlyyQPDcnAtnHK7ahe
         JCrw2b2QgojT4YS/ah8n/+shPZO+7je8s/lQEvUVUWkZxzMN/+9Zxvd2Z+67BS/BPZ8u
         iFobTnNYidznx3rE69C6AuU6zmphqA+fgvB8e+WaaMKfb8d2cPQo49TaPsBWiwHHIKsP
         mvXQ==
X-Forwarded-Encrypted: i=1; AHgh+RqfVLn5nCGxXcH/hq+06CWxQb6wKDO+qP2EShUXvt0kYtsMqH59r1XpbS9xtLIvJWFiK17CvIlaoZo=@vger.kernel.org
X-Gm-Message-State: AOJu0YzMpsSMQcU0zbGpku/jte/BcxaycqsPzT0Br8mgepxt1QCnwg3F
	YnZXYm8HRxX8glwvrzJ7ljktH5eg/GL2hth+usdQ4NX9dBGRrpURt3WMX1YiouG7ATYq3eb4sUj
	ftqdk0xskGkZDgCnKThPtYPgz3u+C/DrarI10g7SVmiwJx9nLimMiJF982qo=
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:ec2:b0:49b:dcb8:e2b5 with SMTP id
 5614622812f47-4af5e3a0a01mr19286422b6e.19.1785830301643; Tue, 04 Aug 2026
 00:58:21 -0700 (PDT)
Date: Tue, 04 Aug 2026 00:58:21 -0700
In-Reply-To: <6a6d375e.2d659fcc.1d46f5.01a4.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6a719b9d.13623e66.bdc14.000c.GAE@google.com>
Subject: Re: [syzbot] [usb?] KASAN: slab-use-after-free Read in vhci_shutdown_connection
From: syzbot <syzbot+31117fde582fe6a0cd62@syzkaller.appspotmail.com>
To: gregkh@linuxfoundation.org, i@zenithal.me, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org, shuah@kernel.org, syzkaller-bugs@googlegroups.com, 
	valentina.manea.m@gmail.com
Content-Type: text/plain; charset="UTF-8"

syzbot has found a reproducer for the following issue on:

HEAD commit:    848acc8ffe1b Merge tag 'fsverity-for-linus' of git://git.k..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=1170b649580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=145fa60d73086782
dashboard link: https://syzkaller.appspot.com/bug?extid=31117fde582fe6a0cd62
compiler:       gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=17f73e32580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=17348bb9580000

Downloadable assets:
disk image (non-bootable): https://storage.googleapis.com/syzbot-assets/d900f083ada3/non_bootable_disk-848acc8f.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/6fb497cc0c8d/vmlinux-848acc8f.xz
kernel image: https://storage.googleapis.com/syzbot-assets/663ccee34982/bzImage-848acc8f.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+31117fde582fe6a0cd62@syzkaller.appspotmail.com

==================================================================
BUG: KASAN: slab-use-after-free in vhci_shutdown_connection.cold+0x2f1/0x37c drivers/usb/usbip/vhci_hcd.c:1062
Read of size 8 at addr ffff8880264a0780 by task kworker/u32:4/5988

CPU: 0 UID: 0 PID: 5988 Comm: kworker/u32:4 Not tainted syzkaller #0 PREEMPT(full) 
Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.3-debian-1.16.3-2 04/01/2014
Workqueue: usbip_event event_handler
Call Trace:
 <TASK>
 __dump_stack lib/dump_stack.c:94 [inline]
 dump_stack_lvl+0x100/0x190 lib/dump_stack.c:120
 print_address_description mm/kasan/report.c:378 [inline]
 print_report+0x13d/0x4b0 mm/kasan/report.c:482
 kasan_report+0xdf/0x1c0 mm/kasan/report.c:595
 vhci_shutdown_connection.cold+0x2f1/0x37c drivers/usb/usbip/vhci_hcd.c:1062
 event_handler+0x216/0x570 drivers/usb/usbip/usbip_event.c:79
 process_one_work+0xa23/0x1940 kernel/workqueue.c:3322
 process_scheduled_works kernel/workqueue.c:3405 [inline]
 worker_thread+0x5ef/0xe50 kernel/workqueue.c:3486
 kthread+0x370/0x450 kernel/kthread.c:436
 ret_from_fork+0x72b/0xd50 arch/x86/kernel/process.c:158
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245
 </TASK>

Allocated by task 13576:
 kasan_save_stack+0x30/0x50 mm/kasan/common.c:57
 kasan_save_track+0x14/0x30 mm/kasan/common.c:78
 poison_kmalloc_redzone mm/kasan/common.c:398 [inline]
 __kasan_kmalloc+0xaa/0xb0 mm/kasan/common.c:415
 kasan_kmalloc include/linux/kasan.h:263 [inline]
 __do_kmalloc_node mm/slub.c:5334 [inline]
 __kmalloc_noprof+0x322/0x820 mm/slub.c:5359
 _kmalloc_noprof include/linux/slab.h:992 [inline]
 _kzalloc_noprof include/linux/slab.h:1309 [inline]
 __usb_create_hcd+0x5e/0xac0 drivers/usb/core/hcd.c:2566
 vhci_hcd_probe+0xf3/0x4e0 drivers/usb/usbip/vhci_hcd.c:1378
 platform_probe+0x106/0x1d0 drivers/base/platform.c:1439
 call_driver_probe drivers/base/dd.c:628 [inline]
 really_probe+0x241/0xa60 drivers/base/dd.c:706
 __driver_probe_device+0x20e/0x450 drivers/base/dd.c:868
 device_driver_attach+0xd1/0x220 drivers/base/dd.c:1203
 bind_store+0xf4/0x190 drivers/base/bus.c:267
 drv_attr_store+0x74/0xb0 drivers/base/bus.c:125
 sysfs_kf_write+0xf2/0x150 fs/sysfs/file.c:145
 kernfs_fop_write_iter+0x3e0/0x5f0 fs/kernfs/file.c:345
 new_sync_write fs/read_write.c:595 [inline]
 vfs_write+0x6ac/0x1050 fs/read_write.c:687
 ksys_write+0x12a/0x250 fs/read_write.c:739
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0x115/0x870 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f

Freed by task 13578:
 kasan_save_stack+0x30/0x50 mm/kasan/common.c:57
 kasan_save_track+0x14/0x30 mm/kasan/common.c:78
 kasan_save_free_info+0x3b/0x70 mm/kasan/generic.c:584
 poison_slab_object mm/kasan/common.c:253 [inline]
 __kasan_slab_free+0x5f/0x80 mm/kasan/common.c:285
 kasan_slab_free include/linux/kasan.h:235 [inline]
 slab_free_hook mm/slub.c:2677 [inline]
 slab_free mm/slub.c:6377 [inline]
 kfree+0x22b/0x6c0 mm/slub.c:6692
 hcd_release drivers/usb/core/hcd.c:2690 [inline]
 kref_put include/linux/kref.h:65 [inline]
 usb_put_hcd drivers/usb/core/hcd.c:2704 [inline]
 usb_put_hcd+0x149/0x1f0 drivers/usb/core/hcd.c:2701
 vhci_hcd_remove+0x107/0x1b0 drivers/usb/usbip/vhci_hcd.c:1434
 platform_remove+0x5f/0x80 drivers/base/platform.c:1456
 device_remove+0xcb/0x180 drivers/base/dd.c:616
 __device_release_driver drivers/base/dd.c:1349 [inline]
 device_release_driver_internal+0x44e/0x620 drivers/base/dd.c:1372
 unbind_store+0xf8/0x110 drivers/base/bus.c:244
 drv_attr_store+0x74/0xb0 drivers/base/bus.c:125
 sysfs_kf_write+0xf2/0x150 fs/sysfs/file.c:145
 kernfs_fop_write_iter+0x3e0/0x5f0 fs/kernfs/file.c:345
 new_sync_write fs/read_write.c:595 [inline]
 vfs_write+0x6ac/0x1050 fs/read_write.c:687
 ksys_write+0x12a/0x250 fs/read_write.c:739
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0x115/0x870 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f

Last potentially related work creation:
 kasan_save_stack+0x30/0x50 mm/kasan/common.c:57
 kasan_record_aux_stack+0xa7/0xc0 mm/kasan/generic.c:556
 insert_work+0x36/0x230 kernel/workqueue.c:2226
 __queue_work+0x9bc/0x12b0 kernel/workqueue.c:2401
 queue_work_on+0x1a9/0x1e0 kernel/workqueue.c:2452
 queue_work include/linux/workqueue.h:699 [inline]
 usb_hcd_giveback_urb+0x330/0x4a0 drivers/usb/core/hcd.c:1758
 usb_rh_urb_dequeue drivers/usb/core/hcd.c:845 [inline]
 unlink1+0x418/0x510 drivers/usb/core/hcd.c:1580
 usb_hcd_unlink_urb+0x131/0x210 drivers/usb/core/hcd.c:1617
 usb_kill_urb drivers/usb/core/urb.c:716 [inline]
 usb_kill_urb+0x121/0x320 drivers/usb/core/urb.c:703
 hub_quiesce+0x1e9/0x320 drivers/usb/core/hub.c:1412
 hub_suspend+0x4ab/0x9e0 drivers/usb/core/hub.c:4008
 usb_suspend_interface drivers/usb/core/driver.c:1323 [inline]
 usb_suspend_both+0x288/0x950 drivers/usb/core/driver.c:1446
 usb_runtime_suspend+0x49/0x120 drivers/usb/core/driver.c:2000
 __rpm_callback+0xc8/0x620 drivers/base/power/runtime.c:406
 rpm_callback+0x16a/0x1b0 drivers/base/power/runtime.c:460
 rpm_suspend+0x2f4/0x11a0 drivers/base/power/runtime.c:698
 __pm_runtime_suspend+0xba/0x1a0 drivers/base/power/runtime.c:1167
 pm_runtime_autosuspend include/linux/pm_runtime.h:415 [inline]
 usb_runtime_idle+0x7e/0x90 drivers/usb/core/driver.c:2037
 rpm_idle+0x322/0x790 drivers/base/power/runtime.c:550
 pm_runtime_work+0x120/0x150 drivers/base/power/runtime.c:995
 process_one_work+0xa23/0x1940 kernel/workqueue.c:3322
 process_scheduled_works kernel/workqueue.c:3405 [inline]
 worker_thread+0x5ef/0xe50 kernel/workqueue.c:3486
 kthread+0x370/0x450 kernel/kthread.c:436
 ret_from_fork+0x72b/0xd50 arch/x86/kernel/process.c:158
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245

Second to last potentially related work creation:
 kasan_save_stack+0x30/0x50 mm/kasan/common.c:57
 kasan_record_aux_stack+0xa7/0xc0 mm/kasan/generic.c:556
 insert_work+0x36/0x230 kernel/workqueue.c:2226
 __queue_work+0x9bc/0x12b0 kernel/workqueue.c:2401
 queue_work_on+0x1a9/0x1e0 kernel/workqueue.c:2452
 queue_work include/linux/workqueue.h:699 [inline]
 usb_hcd_giveback_urb+0x3b8/0x4a0 drivers/usb/core/hcd.c:1760
 rh_call_control drivers/usb/core/hcd.c:706 [inline]
 rh_urb_enqueue drivers/usb/core/hcd.c:817 [inline]
 usb_hcd_submit_urb+0xab7/0x2150 drivers/usb/core/hcd.c:1538
 usb_submit_urb+0x827/0x19b0 drivers/usb/core/urb.c:586
 usb_start_wait_urb+0x10e/0x580 drivers/usb/core/message.c:62
 usb_internal_control_msg drivers/usb/core/message.c:117 [inline]
 usb_control_msg+0x328/0x4b0 drivers/usb/core/message.c:167
 get_port_status drivers/usb/core/hub.c:607 [inline]
 hub_ext_port_status+0x152/0x600 drivers/usb/core/hub.c:624
 usb_hub_port_status drivers/usb/core/hub.c:674 [inline]
 hub_activate+0x6e5/0x1c40 drivers/usb/core/hub.c:1185
 process_one_work+0xa23/0x1940 kernel/workqueue.c:3322
 process_scheduled_works kernel/workqueue.c:3405 [inline]
 worker_thread+0x5ef/0xe50 kernel/workqueue.c:3486
 kthread+0x370/0x450 kernel/kthread.c:436
 ret_from_fork+0x72b/0xd50 arch/x86/kernel/process.c:158
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245

The buggy address belongs to the object at ffff8880264a0000
 which belongs to the cache kmalloc-8k of size 8192
The buggy address is located 1920 bytes inside of
 freed 8192-byte region [ffff8880264a0000, ffff8880264a2000)

The buggy address belongs to the physical page:
page: refcount:0 mapcount:0 mapping:0000000000000000 index:0x0 pfn:0x264a0
head: order:3 mapcount:0 entire_mapcount:0 nr_pages_mapped:0 pincount:0
flags: 0xfff00000000040(head|node=0|zone=1|lastcpupid=0x7ff)
page_type: f5(slab)
raw: 00fff00000000040 ffff88801bc43180 dead000000000100 dead000000000122
raw: 0000000000000000 0000000800020002 00000000f5000000 0000000000000000
head: 00fff00000000040 ffff88801bc43180 dead000000000100 dead000000000122
head: 0000000000000000 0000000800020002 00000000f5000000 0000000000000000
head: 00fff00000000003 fffffffffffffe01 00000000ffffffff 00000000ffffffff
head: ffffffffffffffff 0000000000000000 00000000ffffffff 0000000000000008
page dumped because: kasan: bad access detected
page_owner tracks the page as allocated
page last allocated via order 3, migratetype Unmovable, gfp_mask 0xd28c0(GFP_NOWAIT|__GFP_IO|__GFP_FS|__GFP_NORETRY|__GFP_COMP|__GFP_NOMEMALLOC), pid 5933, tgid 5933 (syz-executor), ts 367593112942, free_ts 367502524434
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
 __kvmalloc_node_noprof+0x793/0x970 mm/slub.c:6905
 _kvmalloc_array_node_noprof include/linux/slab.h:1371 [inline]
 __ptr_ring_init_queue_alloc_noprof include/linux/ptr_ring.h:481 [inline]
 ptr_ring_init_noprof include/linux/ptr_ring.h:499 [inline]
 skb_array_init_noprof include/linux/skb_array.h:182 [inline]
 pfifo_fast_init+0x177/0x3b0 net/sched/sch_generic.c:917
 qdisc_create_dflt+0x124/0x490 net/sched/sch_generic.c:1060
 attach_one_default_qdisc net/sched/sch_generic.c:1219 [inline]
 netdev_for_each_tx_queue include/linux/netdevice.h:2735 [inline]
 attach_default_qdiscs net/sched/sch_generic.c:1237 [inline]
 dev_activate+0x64f/0xce0 net/sched/sch_generic.c:1296
 __dev_open+0x490/0x8f0 net/core/dev.c:1711
 __dev_change_flags+0x596/0x850 net/core/dev.c:9760
 netif_change_flags+0x8d/0x160 net/core/dev.c:9823
 do_setlink.isra.0+0x1ac4/0x3e60 net/core/rtnetlink.c:3215
 rtnl_changelink net/core/rtnetlink.c:3849 [inline]
 __rtnl_newlink net/core/rtnetlink.c:4022 [inline]
 rtnl_newlink+0x11c2/0x2380 net/core/rtnetlink.c:4159
 rtnetlink_rcv_msg+0x95e/0xe90 net/core/rtnetlink.c:7076
page last free pid 5933 tgid 5933 stack trace:
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
 kmem_cache_alloc_lru_noprof+0x267/0x6a0 mm/slub.c:4950
 __d_alloc+0x35/0xa50 fs/dcache.c:1902
 d_alloc+0x4a/0x1e0 fs/dcache.c:1981
 lookup_one_qstr_excl+0x171/0x250 fs/namei.c:1806
 __start_dirop fs/namei.c:2920 [inline]
 start_dirop+0x59/0xb0 fs/namei.c:2942
 simple_start_creating+0xf9/0x110 fs/libfs.c:2305
 debugfs_start_creating.part.0+0x82/0x170 fs/debugfs/inode.c:394
 debugfs_start_creating fs/debugfs/inode.c:371 [inline]
 __debugfs_create_file+0xb3/0x4f0 fs/debugfs/inode.c:428
 debugfs_create_file_unsafe+0x3c/0x50 fs/debugfs/inode.c:509
 debugfs_create_mode_unsafe fs/debugfs/file.c:575 [inline]
 debugfs_create_bool+0x70/0xa0 fs/debugfs/file.c:1011
 nsim_bpf_init+0x168/0x2f0 drivers/net/netdevsim/bpf.c:632
 nsim_init_netdevsim drivers/net/netdevsim/netdev.c:1063 [inline]
 nsim_create+0xc3e/0x1420 drivers/net/netdevsim/netdev.c:1152

Memory state around the buggy address:
 ffff8880264a0680: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
 ffff8880264a0700: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
>ffff8880264a0780: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
                   ^
 ffff8880264a0800: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
 ffff8880264a0880: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
==================================================================


---
If you want syzbot to run the reproducer, reply with:
#syz test: git://repo/address.git branch-or-commit-hash
If you attach or paste a git patch, syzbot will apply it before testing.

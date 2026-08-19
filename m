Received: from mail-oi2-f4.google.com (mail-oi2-f4.google.com [74.125.231.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45FFF3793A9
	for <linux-usb@vger.kernel.org>; Wed, 19 Aug 2026 00:44:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787100280; cv=none; b=gIQzL5bKrwOqWXQhbbLuXLI81adql649mhyt5m4um8W05x1LTYH+rNOSaBrbYWNHlPvbRuwyzPnrkVkAm4Byq7N1f9gs9krpjgbYZwGapXNbu2JqEGa9b+3MxJMq/3kxKt1laEfPkBAZ1rOgx0nyFz/gEoOCgKh9Yt6LMXtERWY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787100280; c=relaxed/simple;
	bh=h+6Ar+54DCDoW5o3Nu1nTXvMi9z8n3iKXGvExwQ3Vb0=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=e5zn2N7gNOntaNVG+92jRpC2R8lcjtOuKBznT849JPSnLP7D6fCQj8B45H1OhJvbnraj9l6dw/gUM3PtZM/AT04/VJ5LZKfkGb9QDVJIQLLUBxUp6PotP6sQxaUEhNg3r4/DpmlZ3z4Z7HE8dTLTay7vy7QN2x1GW1to6i5p+tw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=74.125.231.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi2-f4.google.com with SMTP id 5614622812f47-4ab2d8e7e4cso176314b6e.1
        for <linux-usb@vger.kernel.org>; Tue, 18 Aug 2026 17:44:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787100274; x=1787705074;
        h=content-type:to:from:subject:message-id:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=d+RyVSRQ4B6NK+eFZQtfkpYdku0aNWigf6JQlXynx5g=;
        b=AF4nKVVhJbHZQCQni/2wPEd79erWxK2oVs35bEkMt2+8fgZeGXTQbQdnh/OgFonjmp
         Iof2m9xFq6P4U5RiiY0x4prH5/1EInfNQiHpoU/69WuqufGpIjezLs25nupeRPV3mthF
         dtBIO0XPRdk4a7gK5yPBzdTCGgXJE4ixppNTgrCf34VJ4J4rbyUSrnj4vsxQLi95vTss
         g3z2ArS9xfohNTovMVsKSFAw70yLtKZa/9xYQpghxG9w/JUdGRaHYPR4jzEr/x/kWlsO
         tPJWJq8aHeXIn6zRwfDjdU8k6wLLaAW7CQg6WVmv1Tr+dJNLOhmqmXDWVGymUIoeTCw/
         WwhQ==
X-Forwarded-Encrypted: i=1; AHgh+RrWyIm1QHgDHpg5mdLbL08ZtOm+4FfJh9Pp/VhidhPkE1lt+m4iIV5LGZjGVUTsmLpE8ykPmHmkrUs=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+oXgqQb42k/3RJ9farvZYrmqf8edWWglqp2maYnnyV0L+Yq26
	rEJPguhYgO4IBeaUnSiQ0vgnhT6k5Hi6yKTGWvvO4P8pCvXpUeGYFRPgTsIZBShC81zhdDybAQq
	Ltx3oDAlQcsFLWdeh3raMMQ9QKhQmHLEOHFIsi/U66ysi1bjRUFxBArh1yD0=
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:c1f3:b0:486:8a11:6e8b with SMTP id
 5614622812f47-4b2bc8b90eemr762383b6e.2.1787100274352; Tue, 18 Aug 2026
 17:44:34 -0700 (PDT)
Date: Tue, 18 Aug 2026 17:44:34 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6a84fc72.f7a79266.2f965f.0036.GAE@google.com>
Subject: [syzbot] [dri?] [usb?] KASAN: slab-out-of-bounds Read in drm_property_add_enum
From: syzbot <syzbot+9ae8e7884e451eaed5b4@syzkaller.appspotmail.com>
To: airlied@gmail.com, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
	maarten.lankhorst@linux.intel.com, mripard@kernel.org, rubenru09@aol.com, 
	simona@ffwll.ch, syzkaller-bugs@googlegroups.com, tzimmermann@suse.de
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    15ef2f78c49d Merge tag 'input-for-v7.2-rc7' of git://git.k..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=1128b279580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=65bd434865e8f85c
dashboard link: https://syzkaller.appspot.com/bug?extid=9ae8e7884e451eaed5b4
compiler:       gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44
userspace arch: i386
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=10342a25580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=13616949580000

Downloadable assets:
disk image (non-bootable): https://storage.googleapis.com/syzbot-assets/d900f083ada3/non_bootable_disk-15ef2f78.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/d8751b427e94/vmlinux-15ef2f78.xz
kernel image: https://storage.googleapis.com/syzbot-assets/42d53b06bdc7/bzImage-15ef2f78.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+9ae8e7884e451eaed5b4@syzkaller.appspotmail.com

usb 5-1: config 1 interface 0 altsetting 0 has 1 endpoint descriptor, different from the interface descriptor's value: 2
usb 5-1: New USB device strings: Mfr=0, Product=0, SerialNumber=0
==================================================================
BUG: KASAN: slab-out-of-bounds in strlen+0x93/0xa0 lib/string.c:402
Read of size 1 at addr ffff888051428900 by task kworker/3:3/5802

CPU: 3 UID: 0 PID: 5802 Comm: kworker/3:3 Not tainted syzkaller #0 PREEMPT(full) 
Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.3-debian-1.16.3-2 04/01/2014
Workqueue: usb_hub_wq hub_event
Call Trace:
 <TASK>
 __dump_stack lib/dump_stack.c:94 [inline]
 dump_stack_lvl+0x100/0x190 lib/dump_stack.c:120
 print_address_description mm/kasan/report.c:378 [inline]
 print_report+0x13d/0x4b0 mm/kasan/report.c:482
 kasan_report+0xdf/0x1c0 mm/kasan/report.c:595
 strlen+0x93/0xa0 lib/string.c:402
 __fortify_strlen include/linux/fortify-string.h:218 [inline]
 drm_property_add_enum+0x2d/0x590 drivers/gpu/drm/drm_property.c:396
 drm_mode_create_tv_properties_legacy+0x3e9/0x4c0 drivers/gpu/drm/drm_connector.c:2216
 gud_connector_add_tv_mode+0x1d7/0x2b0 drivers/gpu/drm/gud/gud_connector.c:402
 gud_connector_add_properties drivers/gpu/drm/gud/gud_connector.c:525 [inline]
 gud_connector_create drivers/gpu/drm/gud/gud_connector.c:680 [inline]
 gud_get_connectors+0xbd9/0x1700 drivers/gpu/drm/gud/gud_connector.c:717
 gud_probe+0x17aa/0x1c20 drivers/gpu/drm/gud/gud_drv.c:635
 usb_probe_interface+0x303/0x8f0 drivers/usb/core/driver.c:396
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
 usb_set_configuration+0xd97/0x1c60 drivers/usb/core/message.c:2268
 usb_generic_driver_probe+0xa1/0xe0 drivers/usb/core/generic.c:250
 usb_probe_device+0xef/0x400 drivers/usb/core/driver.c:291
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
 usb_new_device.part.0+0xcc2/0x1686 drivers/usb/core/hub.c:2703
 usb_new_device include/linux/workqueue.h:714 [inline]
 hub_port_connect drivers/usb/core/hub.c:5575 [inline]
 hub_port_connect_change drivers/usb/core/hub.c:5715 [inline]
 port_event drivers/usb/core/hub.c:5879 [inline]
 hub_event.cold+0x1e3/0xe90 drivers/usb/core/hub.c:5961
 process_one_work+0xa23/0x1940 kernel/workqueue.c:3322
 process_scheduled_works kernel/workqueue.c:3405 [inline]
 worker_thread+0x5ef/0xe50 kernel/workqueue.c:3486
 kthread+0x370/0x450 kernel/kthread.c:436
 ret_from_fork+0x72b/0xd50 arch/x86/kernel/process.c:158
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245
 </TASK>

Allocated by task 5802:
 kasan_save_stack+0x30/0x50 mm/kasan/common.c:57
 kasan_save_track+0x14/0x30 mm/kasan/common.c:78
 poison_kmalloc_redzone mm/kasan/common.c:398 [inline]
 __kasan_kmalloc+0xaa/0xb0 mm/kasan/common.c:415
 kasan_kmalloc include/linux/kasan.h:263 [inline]
 __kmalloc_cache_noprof+0x2e5/0x6c0 mm/slub.c:5489
 _kmalloc_noprof include/linux/slab.h:988 [inline]
 gud_connector_add_tv_mode+0xac/0x2b0 drivers/gpu/drm/gud/gud_connector.c:385
 gud_connector_add_properties drivers/gpu/drm/gud/gud_connector.c:525 [inline]
 gud_connector_create drivers/gpu/drm/gud/gud_connector.c:680 [inline]
 gud_get_connectors+0xbd9/0x1700 drivers/gpu/drm/gud/gud_connector.c:717
 gud_probe+0x17aa/0x1c20 drivers/gpu/drm/gud/gud_drv.c:635
 usb_probe_interface+0x303/0x8f0 drivers/usb/core/driver.c:396
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
 usb_set_configuration+0xd97/0x1c60 drivers/usb/core/message.c:2268
 usb_generic_driver_probe+0xa1/0xe0 drivers/usb/core/generic.c:250
 usb_probe_device+0xef/0x400 drivers/usb/core/driver.c:291
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
 usb_new_device.part.0+0xcc2/0x1686 drivers/usb/core/hub.c:2703
 usb_new_device include/linux/workqueue.h:714 [inline]
 hub_port_connect drivers/usb/core/hub.c:5575 [inline]
 hub_port_connect_change drivers/usb/core/hub.c:5715 [inline]
 port_event drivers/usb/core/hub.c:5879 [inline]
 hub_event.cold+0x1e3/0xe90 drivers/usb/core/hub.c:5961
 process_one_work+0xa23/0x1940 kernel/workqueue.c:3322
 process_scheduled_works kernel/workqueue.c:3405 [inline]
 worker_thread+0x5ef/0xe50 kernel/workqueue.c:3486
 kthread+0x370/0x450 kernel/kthread.c:436
 ret_from_fork+0x72b/0xd50 arch/x86/kernel/process.c:158
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245

The buggy address belongs to the object at ffff888051428800
 which belongs to the cache kmalloc-256 of size 256
The buggy address is located 0 bytes to the right of
 allocated 256-byte region [ffff888051428800, ffff888051428900)

The buggy address belongs to the physical page:
page: refcount:0 mapcount:0 mapping:0000000000000000 index:0xffff888051429600 pfn:0x51428
head: order:1 mapcount:0 entire_mapcount:0 nr_pages_mapped:0 pincount:0
flags: 0x4fff00000000240(workingset|head|node=1|zone=1|lastcpupid=0x7ff)
page_type: f5(slab)
raw: 04fff00000000240 ffff88801bc42b40 ffffea0001437110 ffffea0001434390
raw: ffff888051429600 000000080010000d 00000000f5000000 0000000000000000
head: 04fff00000000240 ffff88801bc42b40 ffffea0001437110 ffffea0001434390
head: ffff888051429600 000000080010000d 00000000f5000000 0000000000000000
head: 04fff00000000001 ffffffffffffff81 00000000ffffffff 00000000ffffffff
head: ffffffffffffffff 0000000000000000 00000000ffffffff 0000000000000002
page dumped because: kasan: bad access detected
page_owner tracks the page as allocated
page last allocated via order 1, migratetype Unmovable, gfp_mask 0xd20c0(__GFP_IO|__GFP_FS|__GFP_NOWARN|__GFP_NORETRY|__GFP_COMP|__GFP_NOMEMALLOC), pid 5782, tgid 5782 (syz-executor), ts 56761436248, free_ts 56269161284
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
 ____ip_mc_inc_group+0x40b/0x10d0 net/ipv4/igmp.c:1563
 __ip_mc_inc_group net/ipv4/igmp.c:1601 [inline]
 ip_mc_inc_group net/ipv4/igmp.c:1607 [inline]
 ip_mc_up+0x154/0x390 net/ipv4/igmp.c:1912
 inetdev_event+0x6c3/0x17f0 net/ipv4/devinet.c:1630
 notifier_call_chain+0x99/0x3f0 kernel/notifier.c:85
 call_netdevice_notifiers_info+0xbe/0x110 net/core/dev.c:2250
 call_netdevice_notifiers_extack net/core/dev.c:2288 [inline]
 call_netdevice_notifiers net/core/dev.c:2302 [inline]
 __dev_notify_flags+0x12c/0x2e0 net/core/dev.c:9803
 netif_change_flags+0x108/0x160 net/core/dev.c:9832
 do_setlink.isra.0+0x1ac4/0x3e60 net/core/rtnetlink.c:3215
 rtnl_changelink net/core/rtnetlink.c:3849 [inline]
 __rtnl_newlink net/core/rtnetlink.c:4022 [inline]
 rtnl_newlink+0x11c2/0x2380 net/core/rtnetlink.c:4159
page last free pid 5782 tgid 5782 stack trace:
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
 __kmalloc_cache_noprof+0x265/0x6c0 mm/slub.c:5485
 _kmalloc_noprof include/linux/slab.h:988 [inline]
 _kzalloc_noprof include/linux/slab.h:1309 [inline]
 ref_tracker_alloc+0x190/0x590 lib/ref_tracker.c:270
 __netdev_tracker_alloc include/linux/netdevice.h:4496 [inline]
 netdev_hold include/linux/netdevice.h:4525 [inline]
 netdev_hold include/linux/netdevice.h:4520 [inline]
 register_netdevice+0x17e7/0x25a0 net/core/dev.c:11474
 rtnl_newlink_create net/core/rtnetlink.c:3915 [inline]
 __rtnl_newlink net/core/rtnetlink.c:4044 [inline]
 rtnl_newlink+0x1df0/0x2380 net/core/rtnetlink.c:4159
 rtnetlink_rcv_msg+0x95e/0xe90 net/core/rtnetlink.c:7076
 netlink_rcv_skb+0x159/0x420 net/netlink/af_netlink.c:2556
 netlink_unicast_kernel net/netlink/af_netlink.c:1319 [inline]
 netlink_unicast+0x585/0x850 net/netlink/af_netlink.c:1345
 netlink_sendmsg+0x8b0/0xda0 net/netlink/af_netlink.c:1900
 sock_sendmsg_nosec net/socket.c:775 [inline]
 __sock_sendmsg net/socket.c:790 [inline]
 __sys_sendto+0x48b/0x4e0 net/socket.c:2252
 __do_compat_sys_socketcall net/compat.c:474 [inline]
 __se_compat_sys_socketcall net/compat.c:422 [inline]
 __ia32_compat_sys_socketcall+0x59a/0x770 net/compat.c:422
 do_syscall_32_irqs_on arch/x86/entry/syscall_32.c:83 [inline]
 __do_fast_syscall_32+0xe7/0x970 arch/x86/entry/syscall_32.c:307
 do_fast_syscall_32+0x32/0x70 arch/x86/entry/syscall_32.c:332

Memory state around the buggy address:
 ffff888051428800: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
 ffff888051428880: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
>ffff888051428900: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
                   ^
 ffff888051428980: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
 ffff888051428a00: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
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

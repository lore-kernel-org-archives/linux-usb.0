Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.71
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795320891;
	b=RCsI36Lfb5GP9ty0p6iEIuUEV5Z9J+Sfa9rSdc9a5l26/MJhh48IYI2Qt6Giz7GkihUD
	 NjJzPpYtbVrfomaunCYgMB/l+pyBkneKb7ADOCfnYJmO1Jyo4EezYKsxGgyEeZ6riDZiV
	 El7Bf4JMfc+9q3hWdzDfFV56lhAdBFIsA1d4P8cKiXLHj1zvrJRUGPf5P0gI3EPcj7Tzu
	 UcrjRvMjf1dE6ryN4vS6Rg3d3Q+GX84zAOOBGYf403MXG5MTY5tS7/z48gMjeGtPkKeTn
	 Uc7u/5txxe3TZ6cuqFDp+cGysKheqQXTIAK7XMBaBtGxdJOJX7cZu75F44B1xO3fIfw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795320891;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:MIME-Version:X-Received:Date:
	 X-Google-Appengine-App-Id:X-Google-Appengine-App-Id-Alias:Message-ID:
	 Subject:From:To:Content-Type;
	bh=5u1zw2xDfXlokUAYq4P7MlC9IU1TjOTlkmcuI5H9thc=;
	b=ytL8vCSBF9uqNF1w3zRW++8kpiNhyt1vIPS1QehIVv5y/aw0Es86KK0PsNHZVcUzO8da
	 8EQDolBJH+u8xGA+JsG5ln2g+Yym6aQGKQ42UTvy/5Qf9ceYKb8ggNQDUYnUA/yM6T3SM
	 Nx2hn0KqxLLFFSm+Edl8mFOzWKMm+/wexcfnXSRGH1R26hcmtvhi0Vjq7L1XzYECjfw8p
	 X861W5R9GuQQPzFeu2dXkJx34cg0I/AgC6tPZO2aRA0TrzZk+CPfV0SV1zAjow8k22jSW
	 dvtTRKV24qs0d2VK5b7YrNVjnYCMsIjwimx+CQmPe9OycrwE9B/sAzc01kzuZuzkRPg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=syzkaller.appspotmail.com;
	spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com;
	arc=none smtp.remote-ip=209.85.210.71
Received: from mail-ot1-f71.google.com (mail-ot1-f71.google.com [209.85.210.71])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 505F5606A32A
	for <linux-usb@vger.kernel.org>; Sun, 22 Nov 2026 04:14:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 505F5606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-ot1-f71.google.com with SMTP id 46e09a7af769-86285932977so2625177a34.0
        for <linux-usb@vger.kernel.org>; Sat, 21 Nov 2026 20:14:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795320890; x=1795925690;
        h=content-type:to:from:subject:message-id:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5u1zw2xDfXlokUAYq4P7MlC9IU1TjOTlkmcuI5H9thc=;
        b=VJLZCltAMjfPI6TVdvtV0NuMNy9V08wgAQdOGVY+u4z1w6P+0E/scFHjQ1VJqudvvv
         ygFxtI4GTo0ECoctIzHnSzypNNjuO/c/8iBo7ltIuBjAMOK9DddkzAlSzme2l7pDg1Y7
         4VYXWHFkNIe+Pc+7K8aiJ7c/GeUvGqeCvQjTuR3g20Xw6IYjJl+201y+B0csvl/gCDSy
         Rh1u4+5AzhQ6ZTpOeIBjXjoAJTzu8mLcqe6zOTsRcedRQxaokbexmCy1VpD5N2t1c2sq
         Z965Q0HQKTcCD5rCvofsdpvKnfj6FjdPf3i5axddzEPkTEBKO1Pja2ZMGxAkHvbwjFjf
         Zkbg==
X-Forwarded-Encrypted: i=1; AL+hErGJf9lMnVPxGbBVGSdIvlX6W3HfdE1GKQDP67cG/vYDJKK82wmmkM6Wvoy/mAcorvtVwMz2/zPyhLo=@vger.kernel.org
X-Gm-Message-State: APuU4Z+A8OqaJh1Kld4HIYw7FNhKHJCoo2dMTtKizNK+M2npeye+4xZj
	oF4OJuGq/NOtaIczEf+ubwcvHpglrf8PV3EVGdA6SwqIpVjcp1+ol76Ha2l9i6Hf5cuSX0slL30
	4fxkW6A5+cs5EDJXsIN6qOgPqbF3mcu9KPHdUzmOKfD7Dfan3fbPfdlhtjec=
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Received: by 2002:a05:6808:30a3:b0:572:d0fb:ae5a with SMTP id
 5614622812f47-57a09105d60mr9128801b6e.31.1795320890336; Sat, 21 Nov 2026
 20:14:50 -0800 (PST)
Date: Sat, 21 Nov 2026 20:14:50 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6b026c3a.91c4c7f9.2424d6.000b.GAE@google.com>
Subject: [syzbot] [usb?] [media?] KASAN: slab-use-after-free Read in __media_entity_remove_links
From: syzbot <syzbot+fb0d2df09b56117605fc@syzkaller.appspotmail.com>
To: hverkuil+cisco@kernel.org, laurent.pinchart@ideasonboard.com, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-usb@vger.kernel.org, mchehab+huawei@kernel.org, mchehab@kernel.org, 
	sakari.ailus@linux.intel.com, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    5f22fb20497f Merge tag 'fuse-fixes-7.4-rc4' of git://git.k..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=1066c2bc580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=5c210800cfc8f61e
dashboard link: https://syzkaller.appspot.com/bug?extid=fb0d2df09b56117605fc
compiler:       gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44
userspace arch: i386
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=171dbc03580000

Downloadable assets:
disk image (non-bootable): https://storage.googleapis.com/syzbot-assets/98fce4d0b21b/non_bootable_disk-5f22fb20.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/3026db345225/vmlinux-5f22fb20.xz
kernel image: https://storage.googleapis.com/syzbot-assets/af47b7c72f38/bzImage-5f22fb20.xz

The issue was bisected by AI to:

commit 288254383674be25b26cf137bc12bfe38fefbad6
Author: Hans Verkuil <hverkuil+cisco@kernel.org>
Date:   Tue May 19 10:07:59 2026 +0000

    media: em28xx: use v4l2_device release callback

AI reasoning:   https://syzkaller.appspot.com/ai_job?id=60f8dabf-5027-4072-8efa-b74f756d8088

AI-generated root cause summary:
In `em28xx_v4l2_init()`, if initialization fails (e.g.,
`v4l2_mc_create_media_graph()` returns `-EINVAL` when no decoder subdev is
found) after `video_register_device()` has exposed the device node and userspace
(such as `v4l_id`) has opened it, the `unregister_dev:` error path calls
`v4l2_device_put(&v4l2->v4l2_dev)` to drop the initial `v4l2_device` reference.
Because the open `video_device` still holds a reference to `v4l2_dev`, the
refcount only drops from 2 to 1, so `em28xx_free_v4l2()` is not called and
`dev->v4l2` remains non-NULL. On subsequent USB disconnect, `em28xx_v4l2_fini()`
checks `if (!v4l2)`, sees `dev->v4l2` is still set, and calls
`v4l2_device_put(&v4l2->v4l2_dev)` a second time for the initial reference,
dropping the refcount to 0 and freeing `v4l2` (including `v4l2->vdev`) while
userspace still holds an open file descriptor. When userspace later closes the
fd, `v4l2_release()` -> `v4l2_device_release()` ->
`media_device_unregister_entity()` -> `__media_entity_remove_links()` reads
`&v4l2->vdev.entity.links` inside the freed `em28xx_v4l2` object, causing a
slab-use-after-free.

full analysis:  https://syzkaller.appspot.com/x/ai_root_cause?x=fb0d2df09b56117605fc

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+fb0d2df09b56117605fc@syzkaller.appspotmail.com

The cause commit was identified by AI and may be wrong.
If you agree with it, please also add:
Fixes: 288254383674 ("media: em28xx: use v4l2_device release callback")

==================================================================
BUG: KASAN: slab-use-after-free in __media_entity_remove_links+0x156/0x160 drivers/media/mc/mc-entity.c:1274
Read of size 8 at addr ffff88806b0c8248 by task v4l_id/6472

CPU: 1 UID: 0 PID: 6472 Comm: v4l_id Not tainted syzkaller #0 PREEMPT(full) 
Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.3-debian-1.16.3-2 04/01/2014
Call Trace:
 <TASK>
 __dump_stack lib/dump_stack.c:94 [inline]
 dump_stack_lvl+0x100/0x190 lib/dump_stack.c:120
 print_address_description mm/kasan/report.c:378 [inline]
 print_report+0x13d/0x4b0 mm/kasan/report.c:482
 kasan_report+0xdf/0x1c0 mm/kasan/report.c:595
 __media_entity_remove_links+0x156/0x160 drivers/media/mc/mc-entity.c:1274
 __media_device_unregister_entity+0x188/0x2f0 drivers/media/mc/mc-device.c:593
 media_device_unregister_entity+0x4b/0x70 drivers/media/mc/mc-device.c:677
 v4l2_device_release+0x363/0x480 drivers/media/v4l2-core/v4l2-dev.c:208
 device_release+0xd2/0x270 drivers/base/core.c:2640
 kobject_cleanup lib/kobject.c:689 [inline]
 kobject_release lib/kobject.c:720 [inline]
 kref_put include/linux/kref.h:65 [inline]
 kobject_put+0x1f7/0x640 lib/kobject.c:737
 put_device+0x1f/0x30 drivers/base/core.c:3886
 video_put drivers/media/v4l2-core/v4l2-dev.c:173 [inline]
 v4l2_release+0x2da/0x390 drivers/media/v4l2-core/v4l2-dev.c:480
 __fput+0x3fb/0xb50 fs/file_table.c:512
 fput_close_sync+0x118/0x250 fs/file_table.c:618
 filp_close_sync+0x75/0xa0 fs/open.c:1574
 __do_sys_close fs/open.c:1597 [inline]
 __se_sys_close fs/open.c:1584 [inline]
 __x64_sys_close+0x81/0x110 fs/open.c:1584
 do_syscall_x64 arch/x86/entry/syscall_64.c:61 [inline]
 do_syscall_64+0x123/0x780 arch/x86/entry/syscall_64.c:89
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7efe06ca7407
Code: 48 89 fa 4c 89 df e8 38 aa 00 00 8b 93 08 03 00 00 59 5e 48 83 f8 fc 74 1a 5b c3 0f 1f 84 00 00 00 00 00 48 8b 44 24 10 0f 05 <5b> c3 0f 1f 80 00 00 00 00 83 e2 39 83 fa 08 75 de e8 23 ff ff ff
RSP: 002b:00007ffeede16410 EFLAGS: 00000202 ORIG_RAX: 0000000000000003
RAX: ffffffffffffffda RBX: 00007efe073fa880 RCX: 00007efe06ca7407
RDX: 0000000000000000 RSI: 0000000000000000 RDI: 0000000000000003
RBP: 00007efe073fa6e8 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000202 R12: 0000000000000013
R13: 00007ffeede16640 R14: 00007efe07561000 R15: 000055de6e7e84d8
 </TASK>

Allocated by task 5993:
 kasan_save_stack+0x30/0x50 mm/kasan/common.c:57
 kasan_save_track+0x14/0x40 mm/kasan/common.c:79
 poison_kmalloc_redzone mm/kasan/common.c:412 [inline]
 __kasan_kmalloc+0xaa/0xb0 mm/kasan/common.c:429
 kasan_kmalloc include/linux/kasan.h:267 [inline]
 __kmalloc_cache_noprof+0x2f8/0x6d0 mm/slub.c:5680
 _kmalloc_noprof include/linux/slab.h:991 [inline]
 _kzalloc_noprof include/linux/slab.h:1312 [inline]
 em28xx_v4l2_init.cold+0x94/0x3a7f drivers/media/usb/em28xx/em28xx-video.c:2751
 em28xx_init_extension+0x13a/0x200 drivers/media/usb/em28xx/em28xx-core.c:1245
 request_module_async+0x1e/0x30 drivers/media/usb/em28xx/em28xx-cards.c:3723
 process_one_work+0xac7/0x1b10 kernel/workqueue.c:3495
 process_scheduled_works kernel/workqueue.c:3578 [inline]
 worker_thread+0x5ef/0xe50 kernel/workqueue.c:3659
 kthread+0x373/0x450 kernel/kthread.c:436
 ret_from_fork+0x730/0xd60 arch/x86/kernel/process.c:158
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245

Freed by task 11:
 kasan_save_stack+0x30/0x50 mm/kasan/common.c:57
 kasan_save_track+0x14/0x40 mm/kasan/common.c:79
 kasan_save_free_info+0x3b/0x60 mm/kasan/generic.c:599
 poison_slab_object mm/kasan/common.c:267 [inline]
 __kasan_slab_free+0x73/0x90 mm/kasan/common.c:299
 kasan_slab_free include/linux/kasan.h:239 [inline]
 slab_free_hook mm/slub.c:2780 [inline]
 slab_free mm/slub.c:6637 [inline]
 kfree+0x22d/0x6d0 mm/slub.c:6930
 em28xx_free_v4l2+0x7b/0x110 drivers/media/usb/em28xx/em28xx-video.c:2337
 v4l2_device_release drivers/media/v4l2-core/v4l2-device.c:51 [inline]
 kref_put include/linux/kref.h:65 [inline]
 v4l2_device_put+0xa3/0xd0 drivers/media/v4l2-core/v4l2-device.c:56
 em28xx_v4l2_fini.cold+0x267/0x312 drivers/media/usb/em28xx/em28xx-video.c:2465
 em28xx_close_extension+0xd2/0x460 drivers/media/usb/em28xx/em28xx-core.c:1262
 em28xx_usb_disconnect.cold+0x13d/0x253 drivers/media/usb/em28xx/em28xx-cards.c:4488
 usb_unbind_interface+0x1dd/0x9b0 drivers/usb/core/driver.c:460
 device_remove drivers/base/dd.c:619 [inline]
 device_remove+0x12a/0x180 drivers/base/dd.c:611
 __device_release_driver drivers/base/dd.c:1357 [inline]
 device_release_driver_internal+0x441/0x610 drivers/base/dd.c:1380
 bus_remove_device+0x2bc/0x560 drivers/base/bus.c:678
 device_del+0x376/0x9b0 drivers/base/core.c:3967
 usb_disable_device+0x367/0x810 drivers/usb/core/message.c:1484
 usb_disconnect+0x2e2/0x9a0 drivers/usb/core/hub.c:2355
 hub_port_connect drivers/usb/core/hub.c:5425 [inline]
 hub_port_connect_change drivers/usb/core/hub.c:5725 [inline]
 port_event drivers/usb/core/hub.c:5889 [inline]
 hub_event+0x1bb1/0x4420 drivers/usb/core/hub.c:5971
 process_one_work+0xac7/0x1b10 kernel/workqueue.c:3495
 process_scheduled_works kernel/workqueue.c:3578 [inline]
 worker_thread+0x5ef/0xe50 kernel/workqueue.c:3659
 kthread+0x373/0x450 kernel/kthread.c:436
 ret_from_fork+0x730/0xd60 arch/x86/kernel/process.c:158
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245

The buggy address belongs to the object at ffff88806b0c8000
 which belongs to the cache kmalloc-8k of size 8192
The buggy address is located 584 bytes inside of
 freed 8192-byte region [ffff88806b0c8000, ffff88806b0ca000)

The buggy address belongs to the physical page:
page: refcount:0 mapcount:0 mapping:0000000000000000 index:0x0 pfn:0x6b0c8
head: order:3 mapcount:0 entire_mapcount:0 nr_pages_mapped:0 pincount:0
flags: 0x4fff00000000040(head|node=1|zone=1|lastcpupid=0x7ff)
page_type: f5(slab)
raw: 04fff00000000040 ffff88801d443180 dead000000000122 0000000000000000
raw: 0000000000000000 0000000000020002 00000000f5000000 0000000000000000
head: 04fff00000000040 ffff88801d443180 dead000000000122 0000000000000000
head: 0000000000000000 0000000000020002 00000000f5000000 0000000000000000
head: 04fff00000000003 fffffffffffffe01 00000000ffffffff 00000000ffffffff
head: ffffffffffffffff 0000000000000000 00000000ffffffff 0000000000000008
page dumped because: kasan: bad access detected
page_owner tracks the page as allocated
page last allocated via order 3, migratetype Unmovable, gfp_mask 0xd20c0(__GFP_IO|__GFP_FS|__GFP_NOWARN|__GFP_NORETRY|__GFP_COMP|__GFP_NOMEMALLOC), pid 859, tgid 859 (kworker/0:2), ts 138895551242
 set_page_owner include/linux/page_owner.h:33 [inline]
 post_alloc_hook+0xfd/0x120 mm/page_alloc.c:1873
 prep_new_page mm/page_alloc.c:1881 [inline]
 get_page_from_freelist+0xdae/0x2c80 mm/page_alloc.c:3963
 __alloc_frozen_pages_noprof+0x2ad/0x31e0 mm/page_alloc.c:5505
 alloc_slab_page mm/slub.c:3384 [inline]
 allocate_slab mm/slub.c:3499 [inline]
 new_slab+0xb1/0x6d0 mm/slub.c:3550
 refill_objects+0xe3/0x410 mm/slub.c:7546
 refill_sheaf mm/slub.c:2917 [inline]
 __pcs_replace_empty_main+0x35e/0x650 mm/slub.c:4811
 alloc_from_pcs mm/slub.c:4887 [inline]
 slab_alloc_node mm/slub.c:5021 [inline]
 __kmalloc_cache_noprof+0x4ef/0x6d0 mm/slub.c:5676
 _kmalloc_noprof include/linux/slab.h:991 [inline]
 _kzalloc_noprof include/linux/slab.h:1312 [inline]
 em28xx_v4l2_init.cold+0x94/0x3a7f drivers/media/usb/em28xx/em28xx-video.c:2751
 em28xx_init_extension+0x13a/0x200 drivers/media/usb/em28xx/em28xx-core.c:1245
 request_module_async+0x1e/0x30 drivers/media/usb/em28xx/em28xx-cards.c:3723
 process_one_work+0xac7/0x1b10 kernel/workqueue.c:3495
 process_scheduled_works kernel/workqueue.c:3578 [inline]
 worker_thread+0x5ef/0xe50 kernel/workqueue.c:3659
 kthread+0x373/0x450 kernel/kthread.c:436
 ret_from_fork+0x730/0xd60 arch/x86/kernel/process.c:158
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245
page last free pid 6118 tgid 6118 ts 138113338887 stack trace:
 reset_page_owner include/linux/page_owner.h:26 [inline]
 __free_pages_prepare mm/page_alloc.c:1415 [inline]
 __free_frozen_pages+0x7b1/0x10f0 mm/page_alloc.c:2971
 kasan_depopulate_vmalloc_pte+0x5d/0x80 mm/kasan/shadow.c:484
 apply_to_pte_range mm/memory.c:3555 [inline]
 apply_to_pmd_range mm/memory.c:3599 [inline]
 apply_to_pud_range mm/memory.c:3635 [inline]
 apply_to_p4d_range mm/memory.c:3671 [inline]
 __apply_to_page_range+0xb1d/0x1520 mm/memory.c:3707
 __kasan_release_vmalloc+0xd7/0xe0 mm/kasan/shadow.c:602
 kasan_release_vmalloc include/linux/kasan.h:600 [inline]
 kasan_release_vmalloc_node mm/vmalloc.c:2312 [inline]
 purge_vmap_node+0x210/0xb40 mm/vmalloc.c:2334
 __purge_vmap_area_lazy+0x90a/0xc00 mm/vmalloc.c:2424
 drain_vmap_area_work+0x27/0x40 mm/vmalloc.c:2458
 process_one_work+0xac7/0x1b10 kernel/workqueue.c:3495
 process_scheduled_works kernel/workqueue.c:3578 [inline]
 worker_thread+0x5ef/0xe50 kernel/workqueue.c:3659
 kthread+0x373/0x450 kernel/kthread.c:436
 ret_from_fork+0x730/0xd60 arch/x86/kernel/process.c:158
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245

Memory state around the buggy address:
 ffff88806b0c8100: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
 ffff88806b0c8180: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
>ffff88806b0c8200: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
                                              ^
 ffff88806b0c8280: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
 ffff88806b0c8300: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
==================================================================


---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this issue. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
For information about AI bisection see: https://goo.gl/tpsmEJ#ai-bisection

If the report is already addressed, let syzbot know by replying with:
#syz fix: exact-commit-title

If you want to overwrite report's subsystems, reply with:
#syz set subsystems: new-subsystem
(See the list of subsystem names on the web dashboard)

If the report is a duplicate of another one, reply with:
#syz dup: exact-subject-of-another-report

If you want to undo deduplication, reply with:
#syz undup

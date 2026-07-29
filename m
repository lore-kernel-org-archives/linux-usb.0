Received: from mail-oi1-f208.google.com (mail-oi1-f208.google.com [209.85.167.208])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98DC92264C0
	for <linux-usb@vger.kernel.org>; Wed, 29 Jul 2026 00:19:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.208
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785284374; cv=none; b=ln3geb9zlB1iIvoksBOyO8a4CezMD7siY1gu8EWW/IK3unofBtmq/6WToNbG3NZrccqWjkD9qWBW1EJp8FUYxZQ1a40PZbc6B/h4YRQo2dJth5+xcit0DmEgHJhJlMBuZ8ZjKgG9M+hJyXP8XsEUm7jKli6JdHrP4PGSQ1D6fT0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785284374; c=relaxed/simple;
	bh=goA6KH0gb0GCH2tepaowFCS9L4yknnU1rS8gtbVCoFc=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=SC8LUAiW5mN/0b3lAdWAwsO+hSlo0gOJwl1WtkyGDGla9baII6Zmz4iPa0ycmFG6TzSeGQWFUx4m4snYp5CpD2wAMgc9NDRlXv3p/HrGJasor6H1KwBhyxOthotfcIJc5J51WVe/eMQNgQ9lGD5bcQjWo6SGoPDsONGYCWHpCbA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.208
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f208.google.com with SMTP id 5614622812f47-4a485034d01so411294b6e.3
        for <linux-usb@vger.kernel.org>; Tue, 28 Jul 2026 17:19:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785284371; x=1785889171;
        h=content-type:to:from:subject:message-id:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HVYM5utsjBQdLZptAAOr82u0LnwsKduWVkk3IIKFoas=;
        b=brwlE19K/NAV3c30vcZ+SYVDs+REXiht/H+u3SnAYDIwwjozB4EpUM668HJps4W1h2
         oy2iZ16K8PjMSmDjpPikHcHYM0AgzWahX1RxZc584KYlh/Vem5VHsXNZ96/UxtXgGXCh
         sTFrQa8kZ7+cpJNd8FQiYevxGmA6ZYjDRhHbSwlFtmBJ6SWiWtyTs/YQMZsoKMZ7KM0s
         ulP+g4U+MlPmiYf1RXL0eze6cVOU2T1kDzMOpTzpcHC0jDQRGy2SGVOMvP/VZ0SDzUnY
         2LGY9jHpyi/+V4GJ25X5spCdxjRDu6DOqGIRf3exEbzLfFMQut0+4L1Q5cr5gdiVAth0
         17eg==
X-Forwarded-Encrypted: i=1; AHgh+RoAHTh8b1YE6HXw3E3p/wr77Yqy679wQKzyez+8QGZHA1hPT67eMnq7kNXeAT9HF90/Uspho2fDLqI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxuay+1F8yhKLFe52InOGoklPGhEdH1TpAAo3qBeWhQrSH7N9Tk
	rzO6sJSQ7th9Pu1S+dxT4/6JnxIfgQaTH4Kq6aKcj8HqrOZL9rw7sCBGUr6fZLPpPwVa2gNppJg
	zZby4PXEUeF0zqILA6jk1NUXf2MM85ytqjuRbIxEZmOw1HfS9F3JBgJCqEkQ=
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:2226:b0:4a4:80be:3ae9 with SMTP id
 5614622812f47-4ad5b9b7a52mr3266709b6e.28.1785284371704; Tue, 28 Jul 2026
 17:19:31 -0700 (PDT)
Date: Tue, 28 Jul 2026 17:19:31 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6a694713.6bd615f2.c0aa.0005.GAE@google.com>
Subject: [syzbot] [usb?] KASAN: slab-out-of-bounds Read in dummy_free_request
From: syzbot <syzbot+67d9d15423ddc0f15859@syzkaller.appspotmail.com>
To: gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    f5098b6bae76 Linux 7.2-rc5
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=12a57fde580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=145fa60d73086782
dashboard link: https://syzkaller.appspot.com/bug?extid=67d9d15423ddc0f15859
compiler:       gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/2113dcf433f6/disk-f5098b6b.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/413e673b7de4/vmlinux-f5098b6b.xz
kernel image: https://storage.googleapis.com/syzbot-assets/fc40c1b83e80/bzImage-f5098b6b.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+67d9d15423ddc0f15859@syzkaller.appspotmail.com

configfs-gadget.g1 gadget.0: uvc: uvc_function_bind()
configfs-gadget.g1 gadget.0: uvc: Unable to allocate streaming EP
==================================================================
BUG: KASAN: slab-out-of-bounds in list_empty include/linux/list.h:404 [inline]
BUG: KASAN: slab-out-of-bounds in dummy_free_request+0x8a/0x90 drivers/usb/gadget/udc/dummy_hcd.c:710
Read of size 8 at addr ffff888036e3b8f0 by task syz.4.1352/10334

CPU: 0 UID: 0 PID: 10334 Comm: syz.4.1352 Not tainted syzkaller #0 PREEMPT(full) 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 07/16/2026
Call Trace:
 <TASK>
 __dump_stack lib/dump_stack.c:94 [inline]
 dump_stack_lvl+0x100/0x190 lib/dump_stack.c:120
 print_address_description mm/kasan/report.c:378 [inline]
 print_report+0x13d/0x4b0 mm/kasan/report.c:482
 kasan_report+0xdf/0x1c0 mm/kasan/report.c:595
 list_empty include/linux/list.h:404 [inline]
 dummy_free_request+0x8a/0x90 drivers/usb/gadget/udc/dummy_hcd.c:710
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
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0x115/0x870 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f5f1ff9de99
Code: ff c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 44 00 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 e8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007f5f20ebb028 EFLAGS: 00000246 ORIG_RAX: 0000000000000001
RAX: ffffffffffffffda RBX: 00007f5f20225fa0 RCX: 00007f5f1ff9de99
RDX: 000000000000000b RSI: 0000200000000280 RDI: 0000000000000003
RBP: 00007f5f20033eaf R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000000
R13: 00007f5f20226038 R14: 00007f5f20225fa0 R15: 00007ffc17e5ad58
 </TASK>

Allocated by task 7091:
 kasan_save_stack+0x30/0x50 mm/kasan/common.c:57
 kasan_save_track+0x14/0x30 mm/kasan/common.c:78
 poison_kmalloc_redzone mm/kasan/common.c:398 [inline]
 __kasan_kmalloc+0xaa/0xb0 mm/kasan/common.c:415
 kasan_kmalloc include/linux/kasan.h:263 [inline]
 __kmalloc_cache_noprof+0x2e5/0x6c0 mm/slub.c:5489
 _kmalloc_noprof include/linux/slab.h:988 [inline]
 __hw_addr_create+0x57/0x220 net/core/dev_addr_lists.c:62
 __hw_addr_add_ex+0x32b/0x650 net/core/dev_addr_lists.c:120
 __hw_addr_add net/core/dev_addr_lists.c:137 [inline]
 dev_addr_init+0x161/0x250 net/core/dev_addr_lists.c:689
 alloc_netdev_mqs+0x363/0x15c0 net/core/dev.c:12071
 rtnl_create_link+0xc13/0xf80 net/core/rtnetlink.c:3721
 rtnl_newlink_create net/core/rtnetlink.c:3903 [inline]
 __rtnl_newlink net/core/rtnetlink.c:4044 [inline]
 rtnl_newlink+0x13bd/0x2380 net/core/rtnetlink.c:4159
 rtnetlink_rcv_msg+0x95e/0xe90 net/core/rtnetlink.c:7076
 netlink_rcv_skb+0x159/0x420 net/netlink/af_netlink.c:2556
 netlink_unicast_kernel net/netlink/af_netlink.c:1319 [inline]
 netlink_unicast+0x585/0x850 net/netlink/af_netlink.c:1345
 netlink_sendmsg+0x8b0/0xda0 net/netlink/af_netlink.c:1900
 sock_sendmsg_nosec net/socket.c:775 [inline]
 __sock_sendmsg net/socket.c:790 [inline]
 __sys_sendto+0x48b/0x4e0 net/socket.c:2252
 __do_sys_sendto net/socket.c:2259 [inline]
 __se_sys_sendto net/socket.c:2255 [inline]
 __x64_sys_sendto+0xe0/0x1c0 net/socket.c:2255
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0x115/0x870 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f

The buggy address belongs to the object at ffff888036e3b800
 which belongs to the cache kmalloc-128 of size 128
The buggy address is located 136 bytes to the right of
 allocated 104-byte region [ffff888036e3b800, ffff888036e3b868)

The buggy address belongs to the physical page:
page: refcount:0 mapcount:0 mapping:0000000000000000 index:0x0 pfn:0x36e3b
flags: 0xfff00000000000(node=0|zone=1|lastcpupid=0x7ff)
page_type: f5(slab)
raw: 00fff00000000000 ffff88813fe23a00 dead000000000100 dead000000000122
raw: 0000000000000000 0000000800100010 00000000f5000000 0000000000000000
page dumped because: kasan: bad access detected
page_owner tracks the page as allocated
page last allocated via order 0, migratetype Unmovable, gfp_mask 0xd2820(GFP_ATOMIC|__GFP_NOWARN|__GFP_NORETRY|__GFP_COMP|__GFP_NOMEMALLOC), pid 5623, tgid 5623 (syz-executor), ts 68307235957, free_ts 68280352608
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
 __hw_addr_create+0x57/0x220 net/core/dev_addr_lists.c:62
 __hw_addr_add_ex+0x32b/0x650 net/core/dev_addr_lists.c:120
 __dev_mc_add net/core/dev_addr_lists.c:998 [inline]
 dev_mc_add+0xb6/0x110 net/core/dev_addr_lists.c:1016
 ip_mc_filter_add net/ipv4/igmp.c:1186 [inline]
 igmp_group_added+0x83a/0x9a0 net/ipv4/igmp.c:1375
 ____ip_mc_inc_group+0x7e3/0x10d0 net/ipv4/igmp.c:1591
 br_ip4_multicast_join_snoopers.isra.0+0x152/0x400 net/bridge/br_multicast.c:4162
 br_multicast_join_snoopers+0x8b/0x120 net/bridge/br_multicast.c:4182
 br_dev_open+0x112/0x150 net/bridge/br_device.c:174
 __dev_open+0x3ad/0x8f0 net/core/dev.c:1702
page last free pid 23 tgid 23 stack trace:
 reset_page_owner include/linux/page_owner.h:25 [inline]
 __free_pages_prepare mm/page_alloc.c:1406 [inline]
 __free_frozen_pages+0x79f/0x1090 mm/page_alloc.c:2950
 rcu_do_batch kernel/rcu/tree.c:2645 [inline]
 rcu_core+0x5a2/0x10d0 kernel/rcu/tree.c:2897
 handle_softirqs+0x1ea/0x9b0 kernel/softirq.c:622
 run_ksoftirqd kernel/softirq.c:1076 [inline]
 run_ksoftirqd+0x38/0x60 kernel/softirq.c:1068
 smpboot_thread_fn+0x3d3/0xaa0 kernel/smpboot.c:160
 kthread+0x370/0x450 kernel/kthread.c:436
 ret_from_fork+0x72b/0xd50 arch/x86/kernel/process.c:158
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245

Memory state around the buggy address:
 ffff888036e3b780: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
 ffff888036e3b800: 00 00 00 00 00 00 00 00 00 00 00 00 00 fc fc fc
>ffff888036e3b880: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
                                                             ^
 ffff888036e3b900: fa fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
 ffff888036e3b980: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
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

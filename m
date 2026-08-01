Received: from mail-oi1-f208.google.com (mail-oi1-f208.google.com [209.85.167.208])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B38DB20FA81
	for <linux-usb@vger.kernel.org>; Sat,  1 Aug 2026 00:00:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.208
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785542437; cv=none; b=JWv0m6h/Aeb7KlSB1UVFz3P9Ae/gtsTDK2uhlvQpE3JO8KTBS8Hc/KePpp52RhSdZZxGJ22f0k6AKjpnDgoBmaqCsRyyWqI3dgo0M2otj1F3eItN3kKb69uK219NdijgFTULqZtp2Xqtgb+kal5kkj8c+0zJwtvpwri3d0h/jjw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785542437; c=relaxed/simple;
	bh=BqHLE+DNN2GSXsFKZ/f+4SS1fs5DJxPus8fxyP1geos=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=Y2BBMf6igyW5GbSkowfgAh2RHpatjst2XD5x1AXKI0BVVgyN15MwHEsHkhT3XENTFyrX7aJDZeFRDAqSgzgMBvEZjyAgdKBKtDs3YETqFU/XaeHDBrXWBycDxq5/2tzQioanuTl8Zvl+/rJRXhz5/6zFfB7uA8UdFAYuG8nKc/8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.208
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f208.google.com with SMTP id 5614622812f47-4a41e3d6fe9so1993130b6e.2
        for <linux-usb@vger.kernel.org>; Fri, 31 Jul 2026 17:00:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785542434; x=1786147234;
        h=content-type:to:from:subject:message-id:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=utZuLmwKUlA0NSpn3cALvwnLU355RXjT1r1HWzEqPvw=;
        b=V1YK11+fVKFshPq/5A/2Xi6fBLU1WeEdBEyMr+nBAsCW/Ja8pjKiMMt1WJdwcNd9Qe
         Kb4wXOfhNsZtFmWpM33fWgfYd2kQChnu+IVhoQOrt4XVNWtsDagJW6NQvmigVKAEaCVk
         JHvCI8elSEC9rG/NSj8QeY/W4QBr6L9EbqM1nwI2d9hC9XKmIOtSIh256WdpbHzZgdjN
         9ZBPyKBXeXvk1APUAOeJC9IJYNLdmHMb608er2n+6XwnokQ7kK53sPLtGr6Yf3gt3Iq+
         Irh0FtmZZJVbOG7sAol4zaDxvGuOm2fDQUyz7h6oN65riNMpMg6hB9LowLXiWNBHsRCZ
         w+1Q==
X-Forwarded-Encrypted: i=1; AHgh+RrkG/eI5dA2KlCZpQVRuepxqzIKji76FYoSD8kF2J3FhU/pbub0jLn5tZHVTAKeLX4kqp1clcUjsYM=@vger.kernel.org
X-Gm-Message-State: AOJu0YygLV5OQBtLQ3txjHJk9oYdua+3sTs2Y6/ERHmv1pOuTObjyurS
	Z4BW7Aro+e2/ol6n+ApcKv0YHlN3+hYLkQRFauYygC0z+vkgMXPTHz3kFzhnIskbsN4a1zdI7pm
	1wIIBkZ7tHlTDy53pY0XzJq0N6I03m0yCulTa3OuK/bYMZt/WCxHymfstCF8=
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:1b8f:b0:497:d1e7:5e90 with SMTP id
 5614622812f47-4af5e2927e6mr3917913b6e.18.1785542434227; Fri, 31 Jul 2026
 17:00:34 -0700 (PDT)
Date: Fri, 31 Jul 2026 17:00:34 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6a6d3722.13bfb6d0.1ecdd5.0251.GAE@google.com>
Subject: [syzbot] [usb?] KASAN: slab-use-after-free Write in put_dev
From: syzbot <syzbot+6aa97991da41499aa852@syzkaller.appspotmail.com>
To: gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    11028ab62899 Merge tag 'probes-fixes-v7.2-rc5' of git://gi..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=12774aea580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=145fa60d73086782
dashboard link: https://syzkaller.appspot.com/bug?extid=6aa97991da41499aa852
compiler:       gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=121e25b9580000

Downloadable assets:
disk image (non-bootable): https://storage.googleapis.com/syzbot-assets/d900f083ada3/non_bootable_disk-11028ab6.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/e2be78614a29/vmlinux-11028ab6.xz
kernel image: https://storage.googleapis.com/syzbot-assets/301a11d315af/bzImage-11028ab6.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+6aa97991da41499aa852@syzkaller.appspotmail.com

BUG: KASAN: slab-use-after-free in instrument_atomic_read_write include/linux/instrumented.h:112 [inline]
BUG: KASAN: slab-use-after-free in atomic_fetch_sub_release include/linux/atomic/atomic-instrumented.h:400 [inline]
BUG: KASAN: slab-use-after-free in __refcount_sub_and_test include/linux/refcount.h:389 [inline]
BUG: KASAN: slab-use-after-free in __refcount_dec_and_test include/linux/refcount.h:432 [inline]
BUG: KASAN: slab-use-after-free in refcount_dec_and_test include/linux/refcount.h:450 [inline]
BUG: KASAN: slab-use-after-free in put_dev+0x22/0xd0 drivers/usb/gadget/legacy/inode.c:165
Write of size 4 at addr ffff8880369fc040 by task syz-executor/5867

CPU: 1 UID: 0 PID: 5867 Comm: syz-executor Not tainted syzkaller #0 PREEMPT(full) 
Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.3-debian-1.16.3-2 04/01/2014
Call Trace:
 <TASK>
 __dump_stack lib/dump_stack.c:94 [inline]
 dump_stack_lvl+0x100/0x190 lib/dump_stack.c:120
 print_address_description mm/kasan/report.c:378 [inline]
 print_report+0x13d/0x4b0 mm/kasan/report.c:482
 kasan_report+0xdf/0x1c0 mm/kasan/report.c:595
 check_region_inline mm/kasan/generic.c:186 [inline]
 kasan_check_range+0x10f/0x1e0 mm/kasan/generic.c:200
 instrument_atomic_read_write include/linux/instrumented.h:112 [inline]
 atomic_fetch_sub_release include/linux/atomic/atomic-instrumented.h:400 [inline]
 __refcount_sub_and_test include/linux/refcount.h:389 [inline]
 __refcount_dec_and_test include/linux/refcount.h:432 [inline]
 refcount_dec_and_test include/linux/refcount.h:450 [inline]
 put_dev+0x22/0xd0 drivers/usb/gadget/legacy/inode.c:165
 gadgetfs_kill_sb+0x3c/0x70 drivers/usb/gadget/legacy/inode.c:2104
 deactivate_locked_super+0xc1/0x1b0 fs/super.c:477
 deactivate_super fs/super.c:510 [inline]
 deactivate_super+0xe7/0x110 fs/super.c:506
 cleanup_mnt+0x21f/0x450 fs/namespace.c:1317
 task_work_run+0x150/0x240 kernel/task_work.c:233
 exit_task_work include/linux/task_work.h:40 [inline]
 do_exit+0x951/0x2ae0 kernel/exit.c:1009
 do_group_exit+0xd5/0x2a0 kernel/exit.c:1152
 __do_sys_exit_group kernel/exit.c:1163 [inline]
 __se_sys_exit_group kernel/exit.c:1161 [inline]
 __x64_sys_exit_group+0x3e/0x50 kernel/exit.c:1161
 x64_sys_call+0x102c/0x1530 arch/x86/include/generated/asm/syscalls_64.h:232
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0x115/0x870 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f99cf19df99
Code: Unable to access opcode bytes at 0x7f99cf19df6f.
RSP: 002b:00007ffd7be009d8 EFLAGS: 00000246 ORIG_RAX: 00000000000000e7
RAX: ffffffffffffffda RBX: 00007f99cf234e6b RCX: 00007f99cf19df99
RDX: 0000000000000000 RSI: 0000000000000000 RDI: 0000000000000043
RBP: 00007f99cf209d20 R08: 0000000000000000 R09: 00007ffd7be00b0c
R10: 0000000000000000 R11: 0000000000000246 R12: 000000000000000c
R13: 00007ffd7be00b0c R14: 0000000000000000 R15: 00007f99cf3f1180
 </TASK>

Allocated by task 5867:
 kasan_save_stack+0x30/0x50 mm/kasan/common.c:57
 kasan_save_track+0x14/0x30 mm/kasan/common.c:78
 poison_kmalloc_redzone mm/kasan/common.c:398 [inline]
 __kasan_kmalloc+0xaa/0xb0 mm/kasan/common.c:415
 kasan_kmalloc include/linux/kasan.h:263 [inline]
 __kmalloc_cache_noprof+0x2e5/0x6c0 mm/slub.c:5489
 _kmalloc_noprof include/linux/slab.h:988 [inline]
 _kzalloc_noprof include/linux/slab.h:1309 [inline]
 dev_new drivers/usb/gadget/legacy/inode.c:176 [inline]
 gadgetfs_fill_super+0x1e2/0x440 drivers/usb/gadget/legacy/inode.c:2054
 vfs_get_super fs/super.c:1273 [inline]
 get_tree_single+0xe2/0x190 fs/super.c:1300
 vfs_get_tree+0x92/0x320 fs/super.c:1700
 fc_mount fs/namespace.c:1198 [inline]
 do_new_mount_fc fs/namespace.c:3765 [inline]
 do_new_mount fs/namespace.c:3841 [inline]
 path_mount+0x7d0/0x23d0 fs/namespace.c:4161
 do_mount fs/namespace.c:4174 [inline]
 __do_sys_mount fs/namespace.c:4390 [inline]
 __se_sys_mount fs/namespace.c:4367 [inline]
 __x64_sys_mount+0x293/0x310 fs/namespace.c:4367
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0x115/0x870 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f

Freed by task 5931:
 kasan_save_stack+0x30/0x50 mm/kasan/common.c:57
 kasan_save_track+0x14/0x30 mm/kasan/common.c:78
 kasan_save_free_info+0x3b/0x70 mm/kasan/generic.c:584
 poison_slab_object mm/kasan/common.c:253 [inline]
 __kasan_slab_free+0x5f/0x80 mm/kasan/common.c:285
 kasan_slab_free include/linux/kasan.h:235 [inline]
 slab_free_hook mm/slub.c:2677 [inline]
 slab_free mm/slub.c:6377 [inline]
 kfree+0x22b/0x6c0 mm/slub.c:6692
 put_dev+0xb4/0xd0 drivers/usb/gadget/legacy/inode.c:169
 dev_release+0x116/0x1b0 drivers/usb/gadget/legacy/inode.c:1215
 __fput+0x3ff/0xb50 fs/file_table.c:512
 task_work_run+0x150/0x240 kernel/task_work.c:233
 resume_user_mode_work include/linux/resume_user_mode.h:50 [inline]
 __exit_to_user_mode_loop kernel/entry/common.c:70 [inline]
 exit_to_user_mode_loop+0x1d8/0x6f0 kernel/entry/common.c:101
 __exit_to_user_mode_prepare include/linux/irq-entry-common.h:207 [inline]
 syscall_exit_to_user_mode_prepare include/linux/irq-entry-common.h:230 [inline]
 syscall_exit_to_user_mode include/linux/entry-common.h:318 [inline]
 do_syscall_64+0x666/0x870 arch/x86/entry/syscall_64.c:100
 entry_SYSCALL_64_after_hwframe+0x77/0x7f

The buggy address belongs to the object at ffff8880369fc000
 which belongs to the cache kmalloc-1k of size 1024
The buggy address is located 64 bytes inside of
 freed 1024-byte region [ffff8880369fc000, ffff8880369fc400)

The buggy address belongs to the physical page:
page: refcount:0 mapcount:0 mapping:0000000000000000 index:0x0 pfn:0x369f8
head: order:3 mapcount:0 entire_mapcount:0 nr_pages_mapped:0 pincount:0
flags: 0xfff00000000040(head|node=0|zone=1|lastcpupid=0x7ff)
page_type: f5(slab)
raw: 00fff00000000040 ffff88801bc42dc0 dead000000000100 dead000000000122
raw: 0000000000000000 0000000800100010 00000000f5000000 0000000000000000
head: 00fff00000000040 ffff88801bc42dc0 dead000000000100 dead000000000122
head: 0000000000000000 0000000800100010 00000000f5000000 0000000000000000
head: 00fff00000000003 fffffffffffffe01 00000000ffffffff 00000000ffffffff
head: ffffffffffffffff 0000000000000000 00000000ffffffff 0000000000000008
page dumped because: kasan: bad access detected
page_owner tracks the page as allocated
page last allocated via order 3, migratetype Unmovable, gfp_mask 0xd20c0(__GFP_IO|__GFP_FS|__GFP_NOWARN|__GFP_NORETRY|__GFP_COMP|__GFP_NOMEMALLOC), pid 5769, tgid 5769 (syz-executor), ts 59104075983, free_ts 57126630420
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
 afs_alloc_call+0x51/0x640 fs/afs/rxrpc.c:171
 afs_charge_preallocation+0x14e/0x360 fs/afs/rxrpc.c:755
 afs_open_socket+0x31e/0x3f0 fs/afs/rxrpc.c:112
 afs_net_init+0x825/0xb00 fs/afs/main.c:116
 ops_init+0x1e2/0x5f0 net/core/net_namespace.c:137
 setup_net+0x118/0x3a0 net/core/net_namespace.c:446
 copy_net_ns+0x46f/0x7c0 net/core/net_namespace.c:579
 create_new_namespaces+0x3ea/0xac0 kernel/nsproxy.c:132
 unshare_nsproxy_namespaces+0xf2/0x220 kernel/nsproxy.c:234
page last free pid 5741 tgid 5741 stack trace:
 reset_page_owner include/linux/page_owner.h:25 [inline]
 __free_pages_prepare mm/page_alloc.c:1406 [inline]
 __free_frozen_pages+0x79f/0x1090 mm/page_alloc.c:2950
 __folio_put+0x3b4/0x5f0 mm/swap.c:112
 folio_put include/linux/mm.h:2124 [inline]
 put_page include/linux/mm.h:2193 [inline]
 put_netmem include/net/netmem.h:394 [inline]
 skb_page_unref include/linux/skbuff_ref.h:43 [inline]
 __skb_frag_unref include/linux/skbuff_ref.h:56 [inline]
 skb_release_data+0x649/0x8e0 net/core/skbuff.c:1110
 skb_release_all net/core/skbuff.c:1191 [inline]
 napi_consume_skb+0x1a6/0x320 net/core/skbuff.c:1540
 skb_defer_free_flush+0x1f1/0x290 net/core/dev.c:6868
 net_rx_action+0x3ca/0xf20 net/core/dev.c:7936
 handle_softirqs+0x1ea/0x9b0 kernel/softirq.c:622
 do_softirq kernel/softirq.c:523 [inline]
 do_softirq+0xac/0xe0 kernel/softirq.c:510
 __local_bh_enable_ip+0xf8/0x120 kernel/softirq.c:450
 local_bh_enable include/linux/bottom_half.h:33 [inline]
 rcu_read_unlock_bh include/linux/rcupdate.h:914 [inline]
 __dev_queue_xmit+0xa27/0x4970 net/core/dev.c:4913
 dev_queue_xmit include/linux/netdevice.h:3446 [inline]
 neigh_hh_output include/net/neighbour.h:544 [inline]
 neigh_output include/net/neighbour.h:558 [inline]
 ip_finish_output2+0xf4a/0x2400 net/ipv4/ip_output.c:236
 __ip_finish_output.part.0+0x444/0x6f0 net/ipv4/ip_output.c:314
 __ip_finish_output net/ipv4/ip_output.c:302 [inline]
 ip_finish_output net/ipv4/ip_output.c:324 [inline]
 NF_HOOK_COND include/linux/netfilter.h:307 [inline]
 ip_output+0x39b/0xc10 net/ipv4/ip_output.c:437
 dst_output include/net/dst.h:470 [inline]
 ip_local_out+0x193/0x1f0 net/ipv4/ip_output.c:131
 __ip_queue_xmit+0x885/0x1e90 net/ipv4/ip_output.c:533
 __tcp_transmit_skb+0x3506/0x4f20 net/ipv4/tcp_output.c:1716

Memory state around the buggy address:
 ffff8880369fbf00: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
 ffff8880369fbf80: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
>ffff8880369fc000: fa fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
                                           ^
 ffff8880369fc080: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
 ffff8880369fc100: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
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

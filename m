Received: from mail-oa1-f78.google.com (mail-oa1-f78.google.com [209.85.160.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF3FB495048
	for <linux-usb@vger.kernel.org>; Wed, 12 Aug 2026 22:54:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.78
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786575265; cv=none; b=ljqZ3cPMJgl1O8NDlQxOvUP+DnV1DpZHn7TRG3Ex8v7LrRPjxo/EqX50QYjJEwvCDC3hVrrKiWTR7ph4BmCbShWaxKnrqMl+tfKZhxbv/Gy1xMDhWz6lmhGIri8GUfXAgMnn3ooAc/e550HWaASBs4fYvzc5QmcfkgoR1QGmfH0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786575265; c=relaxed/simple;
	bh=Z515dz8XQoMG7rXqXJKs8fZdZZaXoafFbUzwJcfYBUA=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=ck2ckf5t8vbAprMAsRL6av+Mq8QbMJicgRMES2fsHH/pVmQO2np4tcLrgMEVandAJolGx12CPn7uY4Zea86usB2Xh8ThMYZ+InOoyR+hKo4Mc+Va7sJNDbvBX3IxU/N7x3sTchPDjhYF6qQONC0qIwvtO73llJo/m5gSDLeR4b0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.160.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oa1-f78.google.com with SMTP id 586e51a60fabf-43cd2d12617so1913899fac.3
        for <linux-usb@vger.kernel.org>; Wed, 12 Aug 2026 15:54:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786575263; x=1787180063;
        h=content-type:to:from:subject:message-id:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RDZcZo0+EeBG3DHeV95T0UXPTqagtYDFivARu5zT2JU=;
        b=F0DaGXyRGEDU/JSQ+QvisBmgToe8Ew4CDOJmBkiC0nDo9+HFpS9bTqWiMPWEwCBnpM
         S48aQeVjgFC5wCzi0ozb3TUmRJ2xFyDybd9FEhaTlRyzsUTesQXKz1BjnNF0L74g52ko
         XuKbWafbk7CaNO1s2I14UYcBpyPubS02HwYVej29UpV5r1wAi1uD/7Dd+sx1hAV+mlpH
         aa+ICN7VNc0ZR8Kn63M8JUNTbR4cAFLKs4zMmlnufktBaUtjpr4h8x9Rx5d7dpJ6cnkF
         aySDDJVLsj0xF08AldwSGmUuXPS6l8CQPSKYS6fQtyib9sk5V3UmoqyYUF7s8Nxy9f+7
         fabA==
X-Forwarded-Encrypted: i=1; AHgh+RrbZkx4jUhQjZ07ESB3OC6JcrXtwe2VdveZIhGOW4obLESJhkRnWfbprYGOMDnhuwRFW1BCEg/0FnE=@vger.kernel.org
X-Gm-Message-State: AOJu0YyzH3KIIPoumYyakjeqJELSLlDwT9/9HuIxJpAvC6HJwaMdEz8z
	AV/bXxTJOoJpakON8x0YVSyoPlI9M/LIf/aaq2aT0HOM31rwgPOJ+vubH3HwMPbr7Gk0nFZm5yD
	2gYn+B9+sm9VwGSkp6Ja12KJSFNU7CCaZy8VuK5UyT8e40MEIf32Ll/cNbAk=
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:1f11:b0:6a1:82f5:b009 with SMTP id
 006d021491bc7-6b0c421eff7mr1984957eaf.13.1786575262707; Wed, 12 Aug 2026
 15:54:22 -0700 (PDT)
Date: Wed, 12 Aug 2026 15:54:22 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6a7cf99e.3668565d.e8814.0015.GAE@google.com>
Subject: [syzbot] [usb?] BUG: spinlock bad magic in gadget_dev_open
From: syzbot <syzbot+7659afffb6c3d2d12b83@syzkaller.appspotmail.com>
To: gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    3d6d817622b0 Merge tag 'scsi-fixes' of git://git.kernel.or..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=114ccc79580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=c44651ea7dd2f307
dashboard link: https://syzkaller.appspot.com/bug?extid=7659afffb6c3d2d12b83
compiler:       gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image (non-bootable): https://storage.googleapis.com/syzbot-assets/d900f083ada3/non_bootable_disk-3d6d8176.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/f486efba4dfc/vmlinux-3d6d8176.xz
kernel image: https://storage.googleapis.com/syzbot-assets/9b9dcf9ee9f3/bzImage-3d6d8176.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+7659afffb6c3d2d12b83@syzkaller.appspotmail.com

BUG: spinlock bad magic on CPU#3, syz.3.498/7450
==================================================================
BUG: KASAN: slab-out-of-bounds in task_pid_nr include/linux/pid.h:236 [inline]
BUG: KASAN: slab-out-of-bounds in spin_dump+0xe7/0x160 kernel/locking/spinlock_debug.c:64
Read of size 4 at addr ffff8880584fbe50 by task syz.3.498/7450

CPU: 3 UID: 0 PID: 7450 Comm: syz.3.498 Tainted: G             L      syzkaller #0 PREEMPT(full) 
Tainted: [L]=SOFTLOCKUP
Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.3-debian-1.16.3-2 04/01/2014
Call Trace:
 <TASK>
 __dump_stack lib/dump_stack.c:94 [inline]
 dump_stack_lvl+0x100/0x190 lib/dump_stack.c:120
 print_address_description mm/kasan/report.c:378 [inline]
 print_report+0x13d/0x4b0 mm/kasan/report.c:482
 kasan_report+0xdf/0x1c0 mm/kasan/report.c:595
 task_pid_nr include/linux/pid.h:236 [inline]
 spin_dump+0xe7/0x160 kernel/locking/spinlock_debug.c:64
 spin_bug kernel/locking/spinlock_debug.c:78 [inline]
 debug_spin_lock_before kernel/locking/spinlock_debug.c:86 [inline]
 do_raw_spin_lock.cold+0x37/0x3c kernel/locking/spinlock_debug.c:115
 spin_lock_irq include/linux/spinlock.h:372 [inline]
 gadget_dev_open+0x44/0x1b0 drivers/usb/gadget/legacy/inode.c:1919
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
 do_syscall_64+0x115/0x870 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7ff73279e0d9
Code: ff c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 44 00 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 e8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007ff7335f1028 EFLAGS: 00000246 ORIG_RAX: 0000000000000101
RAX: ffffffffffffffda RBX: 00007ff732a25fa0 RCX: 00007ff73279e0d9
RDX: 0000000000000002 RSI: 00002000000001c0 RDI: ffffffffffffff9c
RBP: 00007ff732835024 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000000
R13: 00007ff732a26038 R14: 00007ff732a25fa0 R15: 00007ffcdadf0c88
 </TASK>

Allocated by task 7177:
 kasan_save_stack+0x30/0x50 mm/kasan/common.c:57
 kasan_save_track+0x14/0x30 mm/kasan/common.c:78
 poison_kmalloc_redzone mm/kasan/common.c:398 [inline]
 __kasan_kmalloc+0xaa/0xb0 mm/kasan/common.c:415
 kasan_kmalloc include/linux/kasan.h:263 [inline]
 __do_kmalloc_node mm/slub.c:5334 [inline]
 __kvmalloc_node_noprof+0x34f/0x970 mm/slub.c:6905
 bucket_table_alloc.isra.0+0x88/0x460 lib/rhashtable.c:194
 __rhashtable_init_noprof+0x43a/0x890 lib/rhashtable.c:1212
 ioam6_net_init+0xb8/0x190 net/ipv6/ioam6.c:992
 ops_init+0x1e2/0x5f0 net/core/net_namespace.c:137
 setup_net+0x118/0x3a0 net/core/net_namespace.c:446
 copy_net_ns+0x46f/0x7c0 net/core/net_namespace.c:579
 create_new_namespaces+0x3ea/0xac0 kernel/nsproxy.c:132
 unshare_nsproxy_namespaces+0xf2/0x220 kernel/nsproxy.c:234
 ksys_unshare+0x438/0xab0 kernel/fork.c:3269
 __do_sys_unshare kernel/fork.c:3343 [inline]
 __se_sys_unshare kernel/fork.c:3341 [inline]
 __x64_sys_unshare+0x31/0x40 kernel/fork.c:3341
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0x115/0x870 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f

The buggy address belongs to the object at ffff8880584fb800
 which belongs to the cache kmalloc-1k of size 1024
The buggy address is located 976 bytes to the right of
 allocated 640-byte region [ffff8880584fb800, ffff8880584fba80)

The buggy address belongs to the physical page:
page: refcount:0 mapcount:0 mapping:0000000000000000 index:0xffff8880584fa800 pfn:0x584f8
head: order:3 mapcount:0 entire_mapcount:0 nr_pages_mapped:0 pincount:0
flags: 0xfff00000000240(workingset|head|node=0|zone=1|lastcpupid=0x7ff)
page_type: f5(slab)
raw: 00fff00000000240 ffff88801bc42dc0 ffffea0001620610 ffffea0000eade10
raw: ffff8880584fa800 000000080010000b 00000000f5000000 0000000000000000
head: 00fff00000000240 ffff88801bc42dc0 ffffea0001620610 ffffea0000eade10
head: ffff8880584fa800 000000080010000b 00000000f5000000 0000000000000000
head: 00fff00000000003 fffffffffffffe01 00000000ffffffff 00000000ffffffff
head: ffffffffffffffff 0000000000000000 00000000ffffffff 0000000000000008
page dumped because: kasan: bad access detected
page_owner tracks the page as allocated
page last allocated via order 3, migratetype Unmovable, gfp_mask 0xd2820(GFP_ATOMIC|__GFP_NOWARN|__GFP_NORETRY|__GFP_COMP|__GFP_NOMEMALLOC), pid 13, tgid 13 (kworker/u32:1), ts 56489698437, free_ts 0
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
 neigh_alloc net/core/neighbour.c:518 [inline]
 ___neigh_create+0x1532/0x2940 net/core/neighbour.c:652
 ip6_finish_output2+0xffa/0x1ce0 net/ipv6/ip6_output.c:128
 __ip6_finish_output+0x357/0xdf0 net/ipv6/ip6_output.c:208
 ip6_finish_output net/ipv6/ip6_output.c:219 [inline]
 NF_HOOK_COND include/linux/netfilter.h:307 [inline]
 ip6_output+0x2aa/0xa60 net/ipv6/ip6_output.c:246
 dst_output include/net/dst.h:470 [inline]
 NF_HOOK include/linux/netfilter.h:318 [inline]
 ndisc_send_skb+0xa85/0x1bf0 net/ipv6/ndisc.c:512
 ndisc_send_ns+0xc6/0x140 net/ipv6/ndisc.c:671
 addrconf_dad_work+0xca1/0x1360 net/ipv6/addrconf.c:4317
 process_one_work+0xa23/0x1940 kernel/workqueue.c:3322
 process_scheduled_works kernel/workqueue.c:3405 [inline]
 worker_thread+0x5ef/0xe50 kernel/workqueue.c:3486
page_owner free stack trace missing

Memory state around the buggy address:
 ffff8880584fbd00: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
 ffff8880584fbd80: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
>ffff8880584fbe00: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
                                                 ^
 ffff8880584fbe80: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
 ffff8880584fbf00: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
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

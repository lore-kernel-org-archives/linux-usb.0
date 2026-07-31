Received: from mail-oi1-f208.google.com (mail-oi1-f208.google.com [209.85.167.208])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1E0E19DF62
	for <linux-usb@vger.kernel.org>; Fri, 31 Jul 2026 17:16:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.208
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785518206; cv=none; b=JwWDWaC6jI0qEHOrpCaTbQ69UhL/i6UsUOIJ/0D6c1BLlTWtwp4cq8E4VJJN/jMOh3Qwto6hO2yNqZFI0N1NIB56x1f6GKTRYlh+xio9tuUuAyMz/UdpSHuv5Zfx8LHXuzBz41en7Ko6xC3uNzXsJwN10FjrZj1cLSyEq9OfVUE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785518206; c=relaxed/simple;
	bh=kuZi6vPS/n+NAQG4E/LaOgu1jq2oocyLOvbTDCeV+ho=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=BL+WqTl1jiXHY6c5eotmOH6iKUc/ASoiqd5qeJwJm4sBmUs8Lcc2IlZdL84Qwpv2KyMer8q+WAKPXkWTpgnCjPFCIYEdd5b9Gb4tVELdmKSFQvG4KpDD1PjJtlxCtD9akw+EtveeAhb+uEN2Ziap62R3FOECga30Trp+nemwuy4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.208
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f208.google.com with SMTP id 5614622812f47-4a5a66f375dso746778b6e.1
        for <linux-usb@vger.kernel.org>; Fri, 31 Jul 2026 10:16:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785518203; x=1786123003;
        h=content-type:to:from:subject:message-id:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ewONO4zV5Vn88leJjTyeug92PJkTixz/iRKOnEPkCig=;
        b=hw71GBVNf3zBvc+eeW3Dsq6Dsg6yUjxkZZdSBbzOYstWRwGaKNgwobO9V3bAwFf53K
         u3zRqazhJV6qDl7CMG0l+6qGEIce+YlYsmr1vwfa+EO2fuZf5VVflotVTmsLAEETRlK7
         N39rj7JpTPz7xRbjIP/jI7kb0Ht9ha8QmmmmcU79POH36SU/yr8cIau3xfIOdGCyBD6I
         ICaWrOfx14OOTdEYGbkUq5N7tWjkUZPQTG6lUjyzfKbiYBUurlapv+a263YSIZyG1AD4
         UVtRtUspwo5kc5z0dNeeUIOMTEKhBjiu8QuLre125jrQtGHw3Y3syzAxFNSRbn9vyuyK
         fLKA==
X-Forwarded-Encrypted: i=1; AHgh+RpwP2d4JILtQfXmOECOMkTA8AxM9oxf+inQb9JOpVVT6QAZlM0SC5Mbu+81lmSEiTsZD96BAAPvY5k=@vger.kernel.org
X-Gm-Message-State: AOJu0YygyAEanHym2a4VBIsUVKmsgYNMdzaKZFANRe5W0v+Y3QztDdNa
	tHWGq3dF4KSnbvbp+wC1/o0jfECRjuanT0PA+8mKHTTxO5cHh5msHAvP6gEFb9Vqixq5LBGoPEP
	OjUbZFs4h5ZVM5yb4LgzfNUEMiaHHr07+M0qm/cH5DvDs5sfYvzhp42Zqlmg=
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:4f11:b0:497:df42:1de8 with SMTP id
 5614622812f47-4af5dfee500mr1604781b6e.1.1785518203633; Fri, 31 Jul 2026
 10:16:43 -0700 (PDT)
Date: Fri, 31 Jul 2026 10:16:43 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6a6cd87b.2d659fcc.1d46f5.019d.GAE@google.com>
Subject: [syzbot] [usb?] KASAN: slab-use-after-free Write in gadgetfs_bind
From: syzbot <syzbot+f63ad1084fd77fab48e4@syzkaller.appspotmail.com>
To: gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    11028ab62899 Merge tag 'probes-fixes-v7.2-rc5' of git://gi..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=1080caea580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=145fa60d73086782
dashboard link: https://syzkaller.appspot.com/bug?extid=f63ad1084fd77fab48e4
compiler:       gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=109125b9580000

Downloadable assets:
disk image (non-bootable): https://storage.googleapis.com/syzbot-assets/d900f083ada3/non_bootable_disk-11028ab6.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/e2be78614a29/vmlinux-11028ab6.xz
kernel image: https://storage.googleapis.com/syzbot-assets/301a11d315af/bzImage-11028ab6.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+f63ad1084fd77fab48e4@syzkaller.appspotmail.com

gadgetfs gadget.1: probe with driver gadgetfs failed with error -12
==================================================================
BUG: KASAN: slab-use-after-free in gadgetfs_bind+0x82e/0x890 drivers/usb/gadget/legacy/inode.c:1682
Write of size 8 at addr ffff88802b40f8c0 by task syz.0.17/5926

CPU: 1 UID: 0 PID: 5926 Comm: syz.0.17 Not tainted syzkaller #0 PREEMPT(full) 
Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.3-debian-1.16.3-2 04/01/2014
Call Trace:
 <TASK>
 __dump_stack lib/dump_stack.c:94 [inline]
 dump_stack_lvl+0x100/0x190 lib/dump_stack.c:120
 print_address_description mm/kasan/report.c:378 [inline]
 print_report+0x13d/0x4b0 mm/kasan/report.c:482
 kasan_report+0xdf/0x1c0 mm/kasan/report.c:595
 gadgetfs_bind+0x82e/0x890 drivers/usb/gadget/legacy/inode.c:1682
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
 dev_config+0xdce/0x1610 drivers/usb/gadget/legacy/inode.c:1883
 vfs_write+0x2aa/0x1050 fs/read_write.c:685
 ksys_write+0x12a/0x250 fs/read_write.c:739
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0x115/0x870 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f0c23f9df99
Code: ff c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 44 00 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 e8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007f0c24ebc028 EFLAGS: 00000246 ORIG_RAX: 0000000000000001
RAX: ffffffffffffffda RBX: 00007f0c24225fa0 RCX: 00007f0c23f9df99
RDX: 000000000000001f RSI: 0000200000000400 RDI: 0000000000000005
RBP: 00007f0c24034ec4 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000000
R13: 00007f0c24226038 R14: 00007f0c24225fa0 R15: 00007ffe7016b5c8
 </TASK>

Allocated by task 5862:
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

Freed by task 5926:
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
 gadgetfs_bind+0x6bc/0x890 drivers/usb/gadget/legacy/inode.c:1703
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
 dev_config+0xdce/0x1610 drivers/usb/gadget/legacy/inode.c:1883
 vfs_write+0x2aa/0x1050 fs/read_write.c:685
 ksys_write+0x12a/0x250 fs/read_write.c:739
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0x115/0x870 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f

The buggy address belongs to the object at ffff88802b40f800
 which belongs to the cache kmalloc-1k of size 1024
The buggy address is located 192 bytes inside of
 freed 1024-byte region [ffff88802b40f800, ffff88802b40fc00)

The buggy address belongs to the physical page:
page: refcount:0 mapcount:0 mapping:0000000000000000 index:0x0 pfn:0x2b408
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
page last allocated via order 3, migratetype Unmovable, gfp_mask 0xd20c0(__GFP_IO|__GFP_FS|__GFP_NOWARN|__GFP_NORETRY|__GFP_COMP|__GFP_NOMEMALLOC), pid 5862, tgid 5862 (syz-executor), ts 58610271687, free_ts 58522358401
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
 __kmalloc_node_noprof+0x681/0x830 mm/slub.c:5346
 _kmalloc_node_noprof include/linux/slab.h:1197 [inline]
 qdisc_alloc+0xbb/0xb30 net/sched/sch_generic.c:998
 qdisc_create_dflt+0x93/0x490 net/sched/sch_generic.c:1053
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
page last free pid 5920 tgid 5920 stack trace:
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
 vm_area_dup+0x27/0x8e0 mm/vma_init.c:123
 __split_vma+0x18c/0xda0 mm/vma.c:516
 split_vma mm/vma.c:599 [inline]
 vma_modify+0x12ad/0x25c0 mm/vma.c:1699
 vma_modify_flags+0x257/0x3d0 mm/vma.c:1719
 mprotect_fixup+0x27a/0xe30 mm/mprotect.c:789
 do_mprotect_pkey+0xa4b/0xef0 mm/mprotect.c:967
 __do_sys_mprotect mm/mprotect.c:988 [inline]
 __se_sys_mprotect mm/mprotect.c:985 [inline]
 __x64_sys_mprotect+0x78/0xc0 mm/mprotect.c:985
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0x115/0x870 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f

Memory state around the buggy address:
 ffff88802b40f780: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
 ffff88802b40f800: fa fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
>ffff88802b40f880: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
                                           ^
 ffff88802b40f900: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
 ffff88802b40f980: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
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

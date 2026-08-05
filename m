Received: from mail-oo1-f79.google.com (mail-oo1-f79.google.com [209.85.161.79])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72F1D3AF656
	for <linux-usb@vger.kernel.org>; Wed,  5 Aug 2026 11:36:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.79
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785929803; cv=none; b=TYyQgtcqOIkqYfvO2s3rWrlaMSaMy8JkbwGX1ir2S4l0G9eGeQosVa38gLaW/eztYZFAP7zk9K2+5ZK//SOBSYFFT4WdtNGBQi8IeqJKlEwCyALY60jdIwiQrBMzHF/boGk68MVGizXf2AtO5th72i6MLXNF/tFP6q30oI5CQaU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785929803; c=relaxed/simple;
	bh=nF1QCgX5WfoJSjZeQdH1AHWr7LM2AuaR3K8jt4+2mFo=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=R17zxqq37HVrvYfK241DGREOFjyGu4/eBrV+p1puUGuwGWGfWIRpZEopm+JfKtxgqh2LegxsKcjg+EuvmOhxdAvti/Wa35LyFo3Qsf6RY/u1ntkIKfXCd5PCZEA4MlDE/Uu5/MBa0ZXjQjzQdZu6/FTk5l4ACErauWZyKZP2RXM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.161.79
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oo1-f79.google.com with SMTP id 006d021491bc7-6ae4622d842so833459eaf.3
        for <linux-usb@vger.kernel.org>; Wed, 05 Aug 2026 04:36:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785929799; x=1786534599;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=VinKqMIuodFDTumz2PvjMdlIeNFC1YF3ggEJK8oUmk8=;
        b=BOHGI0kfB4sjYOYXCAtNh5tIhIjJKBd1KE/h3b1TwOShaKZhrlDg7AKqOdMK/0o1hH
         iSGpb73oB57GPjVips/zgvGsKciV2ilaSuK2y8nXbVNZZxxYjC7C+oyN5DohBumpejF5
         aoQ0QW2TJkVBaq7p9EWuoSMtUBSTgmV1uJiuMtOQ4cegvyN1xhbIwJ26/MC7GabZHIst
         ffPoBq+kAsbxRFxdCMEUNleiIfm8owvC7NpV+TaIZvMCKpieSaj00AAHjHPcBkA+3ggG
         ZOCBLgQTALkEnHlWCWthYQiFf349v8wsc8nkuhgNLueeedlHw4kO2WtRFjHAi8Hl3NF5
         JCLw==
X-Forwarded-Encrypted: i=1; AHgh+Ro345xVmDY9OcXlyA8ff+wTw2niJakulLcMmDs4Osib9oGuqT57WTU4fBjTq4Hy5OBETMfAwkdt4p4=@vger.kernel.org
X-Gm-Message-State: AOJu0YzShWLVTD77q8RqQOZXSWqfkLMA5Dx/zdd8KRbpDJtRwXfbhHo2
	RfXzKflrjwR3joIlAgcO1zEellfdERcBW6NpGV1NWDBaSK/YE68urk/H6VhB/bfPnpxcJTq3W2M
	9GLqeoJKOpVqsLg1pLoCOparr6RKbFOHi+t7GIepSx57VKmyiQNp8S++TKSY=
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:a0b:b0:6ac:b80e:76b0 with SMTP id
 006d021491bc7-6ae96bc46b9mr3269332eaf.3.1785929799699; Wed, 05 Aug 2026
 04:36:39 -0700 (PDT)
Date: Wed, 05 Aug 2026 04:36:39 -0700
In-Reply-To: <6a6cd87b.2d659fcc.1d46f5.019d.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6a732047.9511d2ce.1fc5b9.0370.GAE@google.com>
Subject: Re: [syzbot] [usb?] KASAN: slab-use-after-free Write in gadgetfs_bind
From: syzbot <syzbot+f63ad1084fd77fab48e4@syzkaller.appspotmail.com>
To: dmantipov@yandex.ru, gregkh@linuxfoundation.org, 
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

syzbot has found a reproducer for the following issue on:

HEAD commit:    c21bb4193868 Merge tag 'for_linus' of git://git.kernel.org..
git tree:       upstream
console+strace: https://syzkaller.appspot.com/x/log.txt?x=16903bb9580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=cb17729fb04b1e3a
dashboard link: https://syzkaller.appspot.com/bug?extid=f63ad1084fd77fab48e4
compiler:       Debian clang version 22.1.8 (++20260613092233+e80beda6e255-1~exp1~20260613092250.77), Debian LLD 22.1.8
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=141bf649580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=13bcecc6580000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/c16af6f477ef/disk-c21bb419.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/8e14d9f5431d/vmlinux-c21bb419.xz
kernel image: https://storage.googleapis.com/syzbot-assets/6fd0c9afffcc/bzImage-c21bb419.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+f63ad1084fd77fab48e4@syzkaller.appspotmail.com

Memory cgroup out of memory: Killed process 5619 (syz-executor246) total-vm:17440kB, anon-rss:60kB, file-rss:376kB, shmem-rss:0kB, UID:0 pgtables:52kB oom_score_adj:1000
udc dummy_udc.0: failed to start USB Gadget filesystem: -12
gadgetfs gadget.0: probe with driver gadgetfs failed with error -12
udc dummy_udc.1: failed to start USB Gadget filesystem: -12
gadgetfs gadget.1: probe with driver gadgetfs failed with error -12
==================================================================
BUG: KASAN: slab-use-after-free in gadgetfs_bind+0xd8/0xae0 drivers/usb/gadget/legacy/inode.c:1682
Write of size 8 at addr ffff888038c6a900 by task syz-executor246/5619

CPU: 0 UID: 0 PID: 5619 Comm: syz-executor246 Not tainted syzkaller #0 PREEMPT_{RT,(full)} 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 07/24/2026
Call Trace:
 <TASK>
 dump_stack_lvl+0xe8/0x150 lib/dump_stack.c:120
 print_address_description+0x55/0x1e0 mm/kasan/report.c:378
 print_report+0x58/0x70 mm/kasan/report.c:482
 kasan_report+0x117/0x150 mm/kasan/report.c:595
 gadgetfs_bind+0xd8/0xae0 drivers/usb/gadget/legacy/inode.c:1682
 gadget_bind_driver+0x2ca/0x9e0 drivers/usb/gadget/udc/core.c:1662
 call_driver_probe drivers/base/dd.c:-1 [inline]
 really_probe+0x254/0xae0 drivers/base/dd.c:706
 __driver_probe_device+0x1e8/0x360 drivers/base/dd.c:868
 driver_probe_device+0x4f/0x240 drivers/base/dd.c:898
 __driver_attach+0x339/0x600 drivers/base/dd.c:1292
 bus_for_each_dev+0x23e/0x2c0 drivers/base/bus.c:383
 bus_add_driver+0x348/0x670 drivers/base/bus.c:763
 driver_register+0x23a/0x320 drivers/base/driver.c:174
 usb_gadget_register_driver_owner+0xf9/0x270 drivers/usb/gadget/udc/core.c:1752
 dev_config+0xe4e/0x12c0 drivers/usb/gadget/legacy/inode.c:1883
 vfs_write+0x29f/0xbb0 fs/read_write.c:685
 ksys_write+0x156/0x270 fs/read_write.c:739
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0x174/0x580 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f20a39768e9
Code: c0 79 93 eb d5 48 8d 7c 1d 00 eb 99 0f 1f 44 00 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 d8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007ffe1170d338 EFLAGS: 00000246 ORIG_RAX: 0000000000000001
RAX: ffffffffffffffda RBX: 0000000000000003 RCX: 00007f20a39768e9
RDX: 000000000000001f RSI: 0000200000000400 RDI: 0000000000000003
RBP: 0000000000000000 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 00007f20a39dd042
R13: 00007ffe1170d370 R14: 00007ffe1170d3b0 R15: 0000000000000000
 </TASK>

Allocated by task 5615:
 kasan_save_stack mm/kasan/common.c:57 [inline]
 kasan_save_track+0x3e/0x80 mm/kasan/common.c:78
 poison_kmalloc_redzone mm/kasan/common.c:398 [inline]
 __kasan_kmalloc+0x93/0xb0 mm/kasan/common.c:415
 kasan_kmalloc include/linux/kasan.h:263 [inline]
 __kmalloc_cache_noprof+0x3d2/0x6b0 mm/slub.c:5489
 _kmalloc_noprof include/linux/slab.h:988 [inline]
 _kzalloc_noprof include/linux/slab.h:1309 [inline]
 dev_new drivers/usb/gadget/legacy/inode.c:176 [inline]
 gadgetfs_fill_super+0x27b/0x7a0 drivers/usb/gadget/legacy/inode.c:2054
 vfs_get_super fs/super.c:1273 [inline]
 get_tree_single+0xc0/0x150 fs/super.c:1300
 vfs_get_tree+0x92/0x2a0 fs/super.c:1700
 fc_mount fs/namespace.c:1198 [inline]
 do_new_mount_fc fs/namespace.c:3765 [inline]
 do_new_mount+0x319/0xdc0 fs/namespace.c:3841
 do_mount fs/namespace.c:4174 [inline]
 __do_sys_mount fs/namespace.c:4390 [inline]
 __se_sys_mount+0x31d/0x420 fs/namespace.c:4367
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0x174/0x580 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f

Freed by task 5619:
 kasan_save_stack mm/kasan/common.c:57 [inline]
 kasan_save_track+0x3e/0x80 mm/kasan/common.c:78
 kasan_save_free_info+0x40/0x50 mm/kasan/generic.c:584
 poison_slab_object mm/kasan/common.c:253 [inline]
 __kasan_slab_free+0x5c/0x80 mm/kasan/common.c:285
 kasan_slab_free include/linux/kasan.h:235 [inline]
 slab_free_hook mm/slub.c:2677 [inline]
 slab_free mm/slub.c:6377 [inline]
 kfree+0x1c5/0x6c0 mm/slub.c:6692
 gadgetfs_bind+0x942/0xae0 drivers/usb/gadget/legacy/inode.c:1703
 gadget_bind_driver+0x2ca/0x9e0 drivers/usb/gadget/udc/core.c:1662
 call_driver_probe drivers/base/dd.c:-1 [inline]
 really_probe+0x254/0xae0 drivers/base/dd.c:706
 __driver_probe_device+0x1e8/0x360 drivers/base/dd.c:868
 driver_probe_device+0x4f/0x240 drivers/base/dd.c:898
 __driver_attach+0x339/0x600 drivers/base/dd.c:1292
 bus_for_each_dev+0x23e/0x2c0 drivers/base/bus.c:383
 bus_add_driver+0x348/0x670 drivers/base/bus.c:763
 driver_register+0x23a/0x320 drivers/base/driver.c:174
 usb_gadget_register_driver_owner+0xf9/0x270 drivers/usb/gadget/udc/core.c:1752
 dev_config+0xe4e/0x12c0 drivers/usb/gadget/legacy/inode.c:1883
 vfs_write+0x29f/0xbb0 fs/read_write.c:685
 ksys_write+0x156/0x270 fs/read_write.c:739
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0x174/0x580 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f

The buggy address belongs to the object at ffff888038c6a800
 which belongs to the cache kmalloc-1k of size 1024
The buggy address is located 256 bytes inside of
 freed 1024-byte region [ffff888038c6a800, ffff888038c6ac00)

The buggy address belongs to the physical page:
page: refcount:0 mapcount:0 mapping:0000000000000000 index:0xffff888038c6d000 pfn:0x38c68
head: order:3 mapcount:0 entire_mapcount:0 nr_pages_mapped:0 pincount:0
flags: 0x80000000000240(workingset|head|node=0|zone=1)
page_type: f5(slab)
raw: 0080000000000240 ffff88813ffb2dc0 ffff88813ffb1b88 ffff88813ffb1b88
raw: ffff888038c6d000 000000080010000a 00000000f5000000 0000000000000000
head: 0080000000000240 ffff88813ffb2dc0 ffff88813ffb1b88 ffff88813ffb1b88
head: ffff888038c6d000 000000080010000a 00000000f5000000 0000000000000000
head: 0080000000000003 fffffffffffffe01 00000000ffffffff 00000000ffffffff
head: 0000000000000000 0000000000000000 00000000ffffffff 0000000000000008
page dumped because: kasan: bad access detected
page_owner tracks the page as allocated
page last allocated via order 3, migratetype Unmovable, gfp_mask 0xd2040(__GFP_IO|__GFP_NOWARN|__GFP_NORETRY|__GFP_COMP|__GFP_NOMEMALLOC), pid 5615, tgid 5615 (syz-executor246), ts 101449671750, free_ts 101302084021
 set_page_owner include/linux/page_owner.h:32 [inline]
 post_alloc_hook+0x1f9/0x250 mm/page_alloc.c:1859
 prep_new_page mm/page_alloc.c:1867 [inline]
 get_page_from_freelist+0x262a/0x26a0 mm/page_alloc.c:3946
 __alloc_frozen_pages_noprof+0x18d/0x380 mm/page_alloc.c:5304
 alloc_slab_page mm/slub.c:3266 [inline]
 allocate_slab+0x79/0x5e0 mm/slub.c:3380
 new_slab mm/slub.c:3426 [inline]
 refill_objects+0x2d8/0x350 mm/slub.c:7310
 refill_sheaf mm/slub.c:2804 [inline]
 __pcs_replace_empty_main+0x330/0x690 mm/slub.c:4675
 alloc_from_pcs mm/slub.c:4773 [inline]
 slab_alloc_node mm/slub.c:4905 [inline]
 __do_kmalloc_node mm/slub.c:5333 [inline]
 __kmalloc_noprof+0x544/0x780 mm/slub.c:5359
 _kmalloc_noprof include/linux/slab.h:992 [inline]
 _kzalloc_noprof include/linux/slab.h:1309 [inline]
 tomoyo_init_log+0x1aaf/0x1fa0 security/tomoyo/audit.c:273
 tomoyo_supervisor+0x35f/0x1560 security/tomoyo/common.c:2232
 tomoyo_audit_path2_log security/tomoyo/file.c:184 [inline]
 tomoyo_path2_perm+0x567/0x760 security/tomoyo/file.c:948
 security_sb_pivotroot+0xb6/0x270 security/security.c:1117
 path_pivot_root+0x135/0xd90 fs/namespace.c:4680
 __do_sys_pivot_root fs/namespace.c:4784 [inline]
 __se_sys_pivot_root fs/namespace.c:4767 [inline]
 __x64_sys_pivot_root+0x15d/0x1d0 fs/namespace.c:4767
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0x174/0x580 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
page last free pid 2 tgid 2 stack trace:
 reset_page_owner include/linux/page_owner.h:25 [inline]
 __free_pages_prepare mm/page_alloc.c:1406 [inline]
 __free_frozen_pages+0x10e7/0x11c0 mm/page_alloc.c:2950
 __slab_free+0x252/0x2a0 mm/slub.c:5741
 qlink_free mm/kasan/quarantine.c:163 [inline]
 qlist_free_all+0x99/0x100 mm/kasan/quarantine.c:179
 kasan_quarantine_reduce+0x148/0x160 mm/kasan/quarantine.c:286
 __kasan_slab_alloc+0x22/0x80 mm/kasan/common.c:350
 kasan_slab_alloc include/linux/kasan.h:253 [inline]
 slab_post_alloc_hook mm/slub.c:4584 [inline]
 slab_alloc_node mm/slub.c:4917 [inline]
 kmem_cache_alloc_node_noprof+0x3eb/0x670 mm/slub.c:4989
 alloc_task_struct_node kernel/fork.c:188 [inline]
 dup_task_struct+0x52/0x8f0 kernel/fork.c:921
 copy_process+0x820/0x4390 kernel/fork.c:2115
 kernel_clone+0x2d2/0x8d0 kernel/fork.c:2748
 kernel_thread+0x13f/0x1b0 kernel/fork.c:2809
 create_kthread kernel/kthread.c:459 [inline]
 kthreadd+0x4ec/0x6e0 kernel/kthread.c:817
 ret_from_fork+0x514/0xb70 arch/x86/kernel/process.c:158
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245

Memory state around the buggy address:
 ffff888038c6a800: fa fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
 ffff888038c6a880: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
>ffff888038c6a900: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
                   ^
 ffff888038c6a980: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
 ffff888038c6aa00: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
==================================================================


---
If you want syzbot to run the reproducer, reply with:
#syz test: git://repo/address.git branch-or-commit-hash
If you attach or paste a git patch, syzbot will apply it before testing.

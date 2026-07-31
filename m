Received: from mail-oi1-f205.google.com (mail-oi1-f205.google.com [209.85.167.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDBBC360EE2
	for <linux-usb@vger.kernel.org>; Fri, 31 Jul 2026 06:03:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785477815; cv=none; b=qyYbi4/QwMVrkf2oVbM0nUQia8mIAecFP7caIWmj2MEdKyYliUvK9kMjmOpESII698rcM1nasZLHF6eHPRwhIWtOSmrIJsLu/+4DMLupQQ6KYuaJhroij4YjGN+ovVwBpGUeT9Ib4ctKYX1JKXWv63uO747ZGpWytVlhoy7yvLU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785477815; c=relaxed/simple;
	bh=4WCpueXJm5jHWI3P6c4YjDqaQb8boVwJlW2NCGqstJY=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=A2T8HVpU84ny6av72Mc0WPSvvc9IcItVPdf9Jv9JnYtlD3NAm1wK/rPEXchu+ZpKmx7r/D/eNJaduyT3GCoeN/kWfSwZ8J62iqZHZpHjWQmkBgUpUUkjm7bOQgRG7RiprDDH02h6drm0hv0DjqR41GeY3/U3AtyLO+cV5j2cDH0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f205.google.com with SMTP id 5614622812f47-485ebc5706cso2238773b6e.0
        for <linux-usb@vger.kernel.org>; Thu, 30 Jul 2026 23:03:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785477812; x=1786082612;
        h=content-type:to:from:subject:message-id:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ALwtGc7ew7jNwk5P5cL0v/79IRkS+dqZP9kVNomSbSg=;
        b=HPNKVL2RD1Nkz6+PAJQ1KkecQeFLnwLpb3SqLwUsXwRkfRaB65RU+mlDpRIoh0fRu4
         TUgQjgDtQY33zFxhNyJQXzs2bmtCBSy9Bb2WQmE4XWmZ3mZp/I+pzxPRaEb/P20iwXCa
         cDd1H65BzG6Pd74VQOqO9eBJtHJMg73rYDXDgr0pYGD6AvrODvqTpFu1bZ5Sjly5d8te
         IPurOsIn80oF2w1Ssw6SWVFmyja2Q/mva2XU4dFcrEdNxnGBc/e8JMXikB58XYEaqqmg
         CHnCQFKF7xA8d2PvGmVafEdJPHWiTw3fVhjEPrMFJ+TzcrOcWja7WlVuzmmd9A5kJftO
         qFyQ==
X-Forwarded-Encrypted: i=1; AHgh+Rqi3H1hjGv+Xt8YglCk8gHSYgeCHIyON8YuNyPIi0CPvqsY9g5RLKEQMISC/LodDgKAId8m11vEk3I=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw2dxylunw4wtaQ/qXx+TTaJCidQxo15oDTT9snshmLBEcMqpfb
	6fycMpIJ1yEbmbaQ+3tG3pyyCzbS+xhOcljaw45Im2ZfnPDKjUjzT3mKsFp9Pk1ojR31XHl93El
	ciARno2J+ZebDclmHCDkmCEm8lUQGNFWiTwaG2VQYMwmUOS1KZlVyTf7eAfU=
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:1994:b0:496:117b:1f04 with SMTP id
 5614622812f47-4ae3188b0d7mr710811b6e.2.1785477812681; Thu, 30 Jul 2026
 23:03:32 -0700 (PDT)
Date: Thu, 30 Jul 2026 23:03:32 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6a6c3ab4.1e301a77.2b0661.0003.GAE@google.com>
Subject: [syzbot] [usb?] KASAN: slab-use-after-free Read in gadget_dev_open
From: syzbot <syzbot+1459655b2bf1e798f9d0@syzkaller.appspotmail.com>
To: gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    365f9c7a6b81 Merge branches 'for-next/core' and 'for-next/..
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git for-kernelci
console output: https://syzkaller.appspot.com/x/log.txt?x=113d97b1580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=72c97575381cec47
dashboard link: https://syzkaller.appspot.com/bug?extid=1459655b2bf1e798f9d0
compiler:       Debian clang version 22.1.8 (++20260613092233+e80beda6e255-1~exp1~20260613092250.77), Debian LLD 22.1.8
userspace arch: arm64
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=13aa78c6580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=179fb03e580000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/eafe0adb7386/disk-365f9c7a.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/29422d607579/vmlinux-365f9c7a.xz
kernel image: https://storage.googleapis.com/syzbot-assets/98ca955a8b54/Image-365f9c7a.gz.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+1459655b2bf1e798f9d0@syzkaller.appspotmail.com

==================================================================
BUG: KASAN: slab-use-after-free in __raw_spin_lock_irq include/linux/spinlock_api_smp.h:142 [inline]
BUG: KASAN: slab-use-after-free in _raw_spin_lock_irq+0x58/0x70 kernel/locking/spinlock.c:174
Read of size 1 at addr ffff0000d0323818 by task syz.0.20/4932

CPU: 0 UID: 0 PID: 4932 Comm: syz.0.20 Not tainted syzkaller #0 PREEMPT 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 07/02/2026
Call trace:
 show_stack+0x2c/0x3c arch/arm64/kernel/stacktrace.c:499 (C)
 __dump_stack+0x30/0x40 lib/dump_stack.c:94
 dump_stack_lvl+0xd8/0x12c lib/dump_stack.c:120
 print_address_description+0xb0/0x238 mm/kasan/report.c:378
 print_report+0x68/0x84 mm/kasan/report.c:482
 kasan_report+0x8c/0xc4 mm/kasan/report.c:595
 __kasan_check_byte+0x3c/0x54 mm/kasan/common.c:574
 kasan_check_byte include/linux/kasan.h:402 [inline]
 lock_acquire+0xa4/0x364 kernel/locking/lockdep.c:5842
 __raw_spin_lock_irq include/linux/spinlock_api_smp.h:142 [inline]
 _raw_spin_lock_irq+0x58/0x70 kernel/locking/spinlock.c:174
 spin_lock_irq include/linux/spinlock.h:372 [inline]
 gadget_dev_open+0x50/0x1c4 drivers/usb/gadget/legacy/inode.c:1919
 do_dentry_open+0x5c4/0xfc0 fs/open.c:947
 vfs_open+0x44/0x2dc fs/open.c:1052
 do_open fs/namei.c:4700 [inline]
 path_openat+0x21fc/0x2a60 fs/namei.c:4863
 do_file_open+0x1c8/0x2e8 fs/namei.c:4892
 do_sys_openat2+0x114/0x1e8 fs/open.c:1368
 do_sys_open+0xb0/0xe0 fs/open.c:1374
 __do_sys_openat fs/open.c:1390 [inline]
 __se_sys_openat fs/open.c:1385 [inline]
 __arm64_sys_openat+0xa0/0xbc fs/open.c:1385
 __invoke_syscall arch/arm64/kernel/syscall.c:35 [inline]
 invoke_syscall+0x98/0x244 arch/arm64/kernel/syscall.c:49
 el0_svc_common+0xec/0x23c arch/arm64/kernel/syscall.c:121
 do_el0_svc+0x4c/0x5c arch/arm64/kernel/syscall.c:140
 el0_svc+0x64/0x260 arch/arm64/kernel/entry-common.c:736
 el0t_64_sync_handler+0x48/0x148 arch/arm64/kernel/entry-common.c:755
 el0t_64_sync+0x198/0x19c arch/arm64/kernel/entry.S:594

Allocated by task 4840:
 kasan_save_stack mm/kasan/common.c:57 [inline]
 kasan_save_track+0x40/0x78 mm/kasan/common.c:78
 kasan_save_alloc_info+0x44/0x54 mm/kasan/generic.c:570
 poison_kmalloc_redzone mm/kasan/common.c:398 [inline]
 __kasan_kmalloc+0x9c/0xb4 mm/kasan/common.c:415
 kasan_kmalloc include/linux/kasan.h:263 [inline]
 __kmalloc_cache_noprof+0x2e8/0x5ec mm/slub.c:5515
 _kmalloc_noprof include/linux/slab.h:969 [inline]
 _kzalloc_noprof include/linux/slab.h:1290 [inline]
 dev_new drivers/usb/gadget/legacy/inode.c:176 [inline]
 gadgetfs_fill_super+0x19c/0x370 drivers/usb/gadget/legacy/inode.c:2054
 vfs_get_super+0xb8/0x148 fs/super.c:1267
 get_tree_single+0x30/0x40 fs/super.c:1294
 gadgetfs_get_tree+0x28/0x38 drivers/usb/gadget/legacy/inode.c:2085
 vfs_get_tree+0x90/0x28c fs/super.c:1694
 fc_mount+0x24/0xac fs/namespace.c:1198
 do_new_mount_fc fs/namespace.c:3765 [inline]
 do_new_mount+0x2a4/0x538 fs/namespace.c:3841
 path_mount+0x5f0/0xa88 fs/namespace.c:4161
 do_mount+0xe8/0x148 fs/namespace.c:4174
 __do_sys_mount fs/namespace.c:4390 [inline]
 __se_sys_mount fs/namespace.c:4367 [inline]
 __arm64_sys_mount+0x334/0x380 fs/namespace.c:4367
 __invoke_syscall arch/arm64/kernel/syscall.c:35 [inline]
 invoke_syscall+0x98/0x244 arch/arm64/kernel/syscall.c:49
 el0_svc_common+0xec/0x23c arch/arm64/kernel/syscall.c:121
 do_el0_svc+0x4c/0x5c arch/arm64/kernel/syscall.c:140
 el0_svc+0x64/0x260 arch/arm64/kernel/entry-common.c:736
 el0t_64_sync_handler+0x48/0x148 arch/arm64/kernel/entry-common.c:755
 el0t_64_sync+0x198/0x19c arch/arm64/kernel/entry.S:594

Freed by task 4931:
 kasan_save_stack mm/kasan/common.c:57 [inline]
 kasan_save_track+0x40/0x78 mm/kasan/common.c:78
 kasan_save_free_info+0x58/0x70 mm/kasan/generic.c:584
 poison_slab_object mm/kasan/common.c:253 [inline]
 __kasan_slab_free+0x74/0xa4 mm/kasan/common.c:285
 kasan_slab_free include/linux/kasan.h:235 [inline]
 slab_free_hook mm/slub.c:2705 [inline]
 slab_free mm/slub.c:6405 [inline]
 kfree+0x188/0x690 mm/slub.c:6720
 put_dev+0x8c/0xf8 drivers/usb/gadget/legacy/inode.c:169
 dev_release+0x100/0x15c drivers/usb/gadget/legacy/inode.c:1215
 __fput+0x338/0x74c fs/file_table.c:512
 ____fput+0x20/0x30 fs/file_table.c:540
 task_work_run+0x1cc/0x25c kernel/task_work.c:233
 resume_user_mode_work include/linux/resume_user_mode.h:50 [inline]
 __exit_to_user_mode_loop kernel/entry/common.c:70 [inline]
 exit_to_user_mode_loop+0x10c/0x17c kernel/entry/common.c:101
 __exit_to_user_mode_prepare include/linux/irq-entry-common.h:207 [inline]
 syscall_exit_to_user_mode_prepare include/linux/irq-entry-common.h:230 [inline]
 arm64_syscall_exit_to_user_mode arch/arm64/kernel/entry-common.c:88 [inline]
 el0_svc+0x18c/0x260 arch/arm64/kernel/entry-common.c:737
 el0t_64_sync_handler+0x48/0x148 arch/arm64/kernel/entry-common.c:755
 el0t_64_sync+0x198/0x19c arch/arm64/kernel/entry.S:594

The buggy address belongs to the object at ffff0000d0323800
 which belongs to the cache kmalloc-1k of size 1024
The buggy address is located 24 bytes inside of
 freed 1024-byte region [ffff0000d0323800, ffff0000d0323c00)

The buggy address belongs to the physical page:
page: refcount:0 mapcount:0 mapping:0000000000000000 index:0x0 pfn:0x110320
head: order:3 mapcount:0 entire_mapcount:0 nr_pages_mapped:0 pincount:0
flags: 0x5ffc00000000040(head|node=0|zone=2|lastcpupid=0x7ff)
page_type: f5(slab)
raw: 05ffc00000000040 ffff0000c0001dc0 dead000000000100 dead000000000122
raw: 0000000000000000 0000000800100010 00000000f5000000 0000000000000000
head: 05ffc00000000040 ffff0000c0001dc0 dead000000000100 dead000000000122
head: 0000000000000000 0000000800100010 00000000f5000000 0000000000000000
head: 05ffc00000000003 fffffdffc340c801 00000000ffffffff 00000000ffffffff
head: ffffffffffffffff 0000000000000000 00000000ffffffff 0000000000000008
page dumped because: kasan: bad access detected

Memory state around the buggy address:
 ffff0000d0323700: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
 ffff0000d0323780: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
>ffff0000d0323800: fa fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
                            ^
 ffff0000d0323880: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
 ffff0000d0323900: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
==================================================================
------------[ cut here ]------------
UBSAN: array-index-out-of-bounds in kernel/locking/qspinlock.h:68:9
index 13411 is out of range for type 'unsigned long[8]'
CPU: 0 UID: 0 PID: 4932 Comm: syz.0.20 Tainted: G    B               syzkaller #0 PREEMPT 
Tainted: [B]=BAD_PAGE
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 07/02/2026
Call trace:
 show_stack+0x2c/0x3c arch/arm64/kernel/stacktrace.c:499 (C)
 __dump_stack+0x30/0x40 lib/dump_stack.c:94
 dump_stack_lvl+0xd8/0x12c lib/dump_stack.c:120
 dump_stack+0x1c/0x28 lib/dump_stack.c:129
 ubsan_epilogue+0x14/0x48 lib/ubsan.c:233
 __ubsan_handle_out_of_bounds+0xd0/0xf8 lib/ubsan.c:455
 decode_tail kernel/locking/qspinlock.h:68 [inline]
 queued_spin_lock_slowpath+0x834/0xd04 kernel/locking/qspinlock.c:285
 queued_spin_lock include/asm-generic/qspinlock.h:114 [inline]
 do_raw_spin_lock+0x21c/0x2d0 kernel/locking/spinlock_debug.c:116
 __raw_spin_lock_irq include/linux/spinlock_api_smp.h:143 [inline]
 _raw_spin_lock_irq+0x60/0x70 kernel/locking/spinlock.c:174
 spin_lock_irq include/linux/spinlock.h:372 [inline]
 gadget_dev_open+0x50/0x1c4 drivers/usb/gadget/legacy/inode.c:1919
 do_dentry_open+0x5c4/0xfc0 fs/open.c:947
 vfs_open+0x44/0x2dc fs/open.c:1052
 do_open fs/namei.c:4700 [inline]
 path_openat+0x21fc/0x2a60 fs/namei.c:4863
 do_file_open+0x1c8/0x2e8 fs/namei.c:4892
 do_sys_openat2+0x114/0x1e8 fs/open.c:1368
 do_sys_open+0xb0/0xe0 fs/open.c:1374
 __do_sys_openat fs/open.c:1390 [inline]
 __se_sys_openat fs/open.c:1385 [inline]
 __arm64_sys_openat+0xa0/0xbc fs/open.c:1385
 __invoke_syscall arch/arm64/kernel/syscall.c:35 [inline]
 invoke_syscall+0x98/0x244 arch/arm64/kernel/syscall.c:49
 el0_svc_common+0xec/0x23c arch/arm64/kernel/syscall.c:121
 do_el0_svc+0x4c/0x5c arch/arm64/kernel/syscall.c:140
 el0_svc+0x64/0x260 arch/arm64/kernel/entry-common.c:736
 el0t_64_sync_handler+0x48/0x148 arch/arm64/kernel/entry-common.c:755
 el0t_64_sync+0x198/0x19c arch/arm64/kernel/entry.S:594
---[ end trace ]---
Unable to handle kernel paging request at virtual address ffff7fbfe45e33d2
KASAN: probably wild-memory-access in range [0xfffffdff22f19e90-0xfffffdff22f19e97]
Mem abort info:
  ESR = 0x0000000096000006
  EC = 0x25: DABT (current EL), IL = 32 bits
  SET = 0, FnV = 0
  EA = 0, S1PTW = 0
  FSC = 0x06: level 2 translation fault
Data abort info:
  ISV = 0, ISS = 0x00000006, ISS2 = 0x00000000
  CM = 0, WnR = 0, TnD = 0, TagAccess = 0
  GCS = 0, Overlay = 0, DirtyBit = 0
swapper pgtable: 4k pages, 48-bit VAs, pgdp=000000021b01e000
[ffff7fbfe45e33d2] pgd=0000000000000000, p4d=100000023cc9f403, pud=100000023cc9e403, pmd=0000000000000000
Internal error: Oops: 0000000096000006 [#1]  SMP
Modules linked in:
CPU: 0 UID: 0 PID: 4932 Comm: syz.0.20 Tainted: G    B               syzkaller #0 PREEMPT 
Tainted: [B]=BAD_PAGE
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 07/02/2026
pstate: 834000c5 (Nzcv daIF +PAN -UAO +TCO +DIT -SSBS BTYPE=--)
pc : queued_spin_lock_slowpath+0x52c/0xd04 kernel/locking/qspinlock.c:288
lr : decode_tail kernel/locking/qspinlock.h:68 [inline]
lr : queued_spin_lock_slowpath+0x834/0xd04 kernel/locking/qspinlock.c:285
sp : ffff80009a787560
x29: ffff80009a787600 x28: fffffdff22f19e90 x27: 1fffe000188f6afa
x26: 1fffe0001a064700 x25: ffff0001ade40708 x24: dfff800000000000
x23: ffff7000134f0eb0 x22: ffff0001ade40700 x21: 1fffe00035bc80e0
x20: ffff0000c47b57d0 x19: ffff0000d0323800 x18: 0000000000000000
x17: 363a682e6b636f6c x16: 0000000000000001 x15: 0000000000000000
x14: 0000000000000000 x13: 0000000000000001 x12: 0000000000000004
x11: ffff70001145ec6c x10: ffff800088ac7700 x9 : ffff800088ac7710
x8 : 1fffffbfe45e33d2 x7 : 0000000000000001 x6 : ffff80008048de94
x5 : 0000000000000000 x4 : 0000000000000000 x3 : ffff8000802f7498
x2 : 0000000000000002 x1 : ffff0000c47b57c0 x0 : 0000000000000000
Call trace:
 queued_spin_lock_slowpath+0x52c/0xd04 kernel/locking/qspinlock.c:288 (P)
 queued_spin_lock include/asm-generic/qspinlock.h:114 [inline]
 do_raw_spin_lock+0x21c/0x2d0 kernel/locking/spinlock_debug.c:116
 __raw_spin_lock_irq include/linux/spinlock_api_smp.h:143 [inline]
 _raw_spin_lock_irq+0x60/0x70 kernel/locking/spinlock.c:174
 spin_lock_irq include/linux/spinlock.h:372 [inline]
 gadget_dev_open+0x50/0x1c4 drivers/usb/gadget/legacy/inode.c:1919
 do_dentry_open+0x5c4/0xfc0 fs/open.c:947
 vfs_open+0x44/0x2dc fs/open.c:1052
 do_open fs/namei.c:4700 [inline]
 path_openat+0x21fc/0x2a60 fs/namei.c:4863
 do_file_open+0x1c8/0x2e8 fs/namei.c:4892
 do_sys_openat2+0x114/0x1e8 fs/open.c:1368
 do_sys_open+0xb0/0xe0 fs/open.c:1374
 __do_sys_openat fs/open.c:1390 [inline]
 __se_sys_openat fs/open.c:1385 [inline]
 __arm64_sys_openat+0xa0/0xbc fs/open.c:1385
 __invoke_syscall arch/arm64/kernel/syscall.c:35 [inline]
 invoke_syscall+0x98/0x244 arch/arm64/kernel/syscall.c:49
 el0_svc_common+0xec/0x23c arch/arm64/kernel/syscall.c:121
 do_el0_svc+0x4c/0x5c arch/arm64/kernel/syscall.c:140
 el0_svc+0x64/0x260 arch/arm64/kernel/entry-common.c:736
 el0t_64_sync_handler+0x48/0x148 arch/arm64/kernel/entry-common.c:755
 el0t_64_sync+0x198/0x19c arch/arm64/kernel/entry.S:594
Code: f94007e9 f9400388 8b09011c d343ff88 (38786908) 
---[ end trace 0000000000000000 ]---
----------------
Code disassembly (best guess):
   0:	f94007e9 	ldr	x9, [sp, #8]
   4:	f9400388 	ldr	x8, [x28]
   8:	8b09011c 	add	x28, x8, x9
   c:	d343ff88 	lsr	x8, x28, #3
* 10:	38786908 	ldrb	w8, [x8, x24] <-- trapping instruction


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

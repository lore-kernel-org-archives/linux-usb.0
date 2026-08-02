Received: from mail-oi1-f208.google.com (mail-oi1-f208.google.com [209.85.167.208])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B29481DED49
	for <linux-usb@vger.kernel.org>; Sun,  2 Aug 2026 00:10:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.208
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785629443; cv=none; b=aXpmg6x898LBaL/G6o7Wx6tOojT/I4U4TWVfQr2jTu7KsWvp4HWAvs9JnyKa2t/xsNOEDKZ6yDQY6bET5eTmYN6Hc3EmMNLXwuffRsJQoLPtFfQurZR7pI+BaYsh9BAPqb+mOqRbn6IAu6X08BAYNpDiVg5W7ZUrXXmIG/uO62w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785629443; c=relaxed/simple;
	bh=hUSTlIvqoUoM2HtZQLrkGBHZsxOnyztlIG7i+6IdCUg=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=orL6qWTmPR05pnGvJQvpyvZ6EMhMX4NvPkGuZxHekGGBw5qv3zahJoFsg09NhROIdd2ONswV1TDiQXi+WLG+m6gCwdWaoaSIJ282HqpndqGd2c/ycHgGC2blLlWJSOxPRI7fQEEKfD3gFYY1+ucaeboIxFYhAlIO0QpbcfPpRb0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.208
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f208.google.com with SMTP id 5614622812f47-4a36606e230so3174421b6e.2
        for <linux-usb@vger.kernel.org>; Sat, 01 Aug 2026 17:10:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785629440; x=1786234240;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=gI8PlLenqlq1EJLKNVK4M4lhYYR652IB2j5GhEF6wNo=;
        b=MZ0zhYscNY1oU/7JdtpYaAp09Ws49urzkg6xaHrOsU7+0N5fTozSTAJdE2IX2FH/F9
         n7p3kw/R8qPwltZgXHXxr6zP4qK520He4GTLivfDjuyOqNQFusDXvxcC+tyU05LI+qTp
         czKe/FUAZ7CGOIE1RsN6ZhWVqi560g/5MRS1Dt4bTwEZQwne94I6DKI3nhwNH3em1p8j
         ygMfrE6ZwcOmP9vWzl/28a/HXTHnJ9akwBiX6+SDvb5F2AMU4J6Ppre+1Tll3Ah3OLsP
         PfcNgtkSCr/0rAfctP0s8uPPSgs3dTkZpz9AOoAWJczYz/aaiHFU9qL0B9qe3Tr90yAq
         rODg==
X-Forwarded-Encrypted: i=1; AHgh+RqX9+d60/yMwjNscWWI+xnQ8Vr9ydfudH8tqXXktrRf6H/tqYhfRmoZFIsKpPgWeU7zD8Uf/x6AWuE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/4PPySi0u9zM2aeVTfj20zB/m+vKTnMb2N9undnDAWEkAMa8U
	JpBVf6bBIvqXLy+mB3AEGxDv0bHjnmHCAY8gfccH8ogcAs4I0+4i6WC6qGA1GwW5B6Qxkcxhfkc
	ZRn+js4TyjqTxfM3+UUMfdaCeXk9w7/lchCVhnHz3GUmEToNkwDHmALlZCGM=
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:1301:b0:493:a850:d93a with SMTP id
 5614622812f47-4af5e160463mr10127214b6e.6.1785629440484; Sat, 01 Aug 2026
 17:10:40 -0700 (PDT)
Date: Sat, 01 Aug 2026 17:10:40 -0700
In-Reply-To: <6a6944f5.e3659fcc.2a40b8.0021.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6a6e8b00.2d659fcc.1d46f5.01c8.GAE@google.com>
Subject: Re: [syzbot] [usb?] WARNING in dummy_free_request (2)
From: syzbot <syzbot+c73e1942197af9f54ca3@syzkaller.appspotmail.com>
To: gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

syzbot has found a reproducer for the following issue on:

HEAD commit:    e2d5e23967d0 Merge branch 'for-next/core' into for-kernelci
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git for-kernelci
console output: https://syzkaller.appspot.com/x/log.txt?x=179d8649580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=72c97575381cec47
dashboard link: https://syzkaller.appspot.com/bug?extid=c73e1942197af9f54ca3
compiler:       Debian clang version 22.1.8 (++20260613092233+e80beda6e255-1~exp1~20260613092250.77), Debian LLD 22.1.8
userspace arch: arm64
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=13b62db9580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=17a12c9e580000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/294cdababe04/disk-e2d5e239.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/3e828c9fa51b/vmlinux-e2d5e239.xz
kernel image: https://storage.googleapis.com/syzbot-assets/ffd7614ad310/Image-e2d5e239.gz.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+c73e1942197af9f54ca3@syzkaller.appspotmail.com

gadgetfs: suspended from state 3
gadgetfs: disconnected
------------[ cut here ]------------
WARNING: drivers/usb/gadget/udc/dummy_hcd.c:710 at dummy_free_request+0x7c/0x84 drivers/usb/gadget/udc/dummy_hcd.c:710, CPU#0: syz.0.32/4939
Modules linked in:
CPU: 0 UID: 0 PID: 4939 Comm: syz.0.32 Not tainted syzkaller #0 PREEMPT 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 07/02/2026
pstate: 83400005 (Nzcv daif +PAN -UAO +TCO +DIT -SSBS BTYPE=--)
pc : dummy_free_request+0x7c/0x84 drivers/usb/gadget/udc/dummy_hcd.c:710
lr : dummy_free_request+0x7c/0x84 drivers/usb/gadget/udc/dummy_hcd.c:710
sp : ffff8000962579d0
x29: ffff8000962579d0 x28: 1fffe000195c4a01 x27: ffff0000cae25008
x26: 1fffe0001a0e2408 x25: 1fffe0001952998b x24: 1fffe000195299aa
x23: dfff800000000000 x22: ffff800088b07eb8 x21: ffff800087332200
x20: ffff0000ca94c068 x19: ffff0000d866f900 x18: 0000000000000000
x17: 0000000000000000 x16: 0000000000000000 x15: 0000000000000000
x14: 00000000868e5610 x13: 0000000000000001 x12: 0000000000000000
x11: ffff800080156ee8 x10: 0000000000000003 x9 : 0000000000000000
x8 : 0000000000000000 x7 : 0000000000000000 x6 : 0000000000000000
x5 : 0000000000000001 x4 : 0000000000000008 x3 : ffff8000835a7208
x2 : 0000000000000001 x1 : ffff0000c82cba80 x0 : 0000000000000000
Call trace:
 dummy_free_request+0x7c/0x84 drivers/usb/gadget/udc/dummy_hcd.c:710 (P)
 usb_ep_free_request+0x108/0x3fc drivers/usb/gadget/udc/core.c:221
 gadgetfs_unbind+0x19c/0x1f0 drivers/usb/gadget/legacy/inode.c:1661
 gadget_unbind_driver+0x188/0x790 drivers/usb/gadget/udc/core.c:1724
 device_remove+0xc4/0x134 drivers/base/dd.c:616
 __device_release_driver drivers/base/dd.c:1349 [inline]
 device_release_driver_internal+0x124/0x20c drivers/base/dd.c:1372
 driver_detach+0x124/0x1b4 drivers/base/dd.c:1435
 bus_remove_driver+0x124/0x22c drivers/base/bus.c:832
 driver_unregister+0x78/0xac drivers/base/driver.c:202
 usb_gadget_unregister_driver+0x50/0x78 drivers/usb/gadget/udc/core.c:1784
 dev_release+0x8c/0x15c drivers/usb/gadget/legacy/inode.c:1198
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
irq event stamp: 2192
hardirqs last  enabled at (2191): [<ffff80008690a7dc>] __raw_spin_unlock_irq include/linux/spinlock_api_smp.h:187 [inline]
hardirqs last  enabled at (2191): [<ffff80008690a7dc>] _raw_spin_unlock_irq+0x30/0x80 kernel/locking/spinlock.c:206
hardirqs last disabled at (2192): [<ffff8000868e5428>] el1_brk64+0x20/0x54 arch/arm64/kernel/entry-common.c:425
softirqs last  enabled at (1170): [<ffff80008030ff18>] softirq_handle_end kernel/softirq.c:468 [inline]
softirqs last  enabled at (1170): [<ffff80008030ff18>] handle_softirqs+0xc28/0xd98 kernel/softirq.c:650
softirqs last disabled at (1161): [<ffff8000800204c0>] __do_softirq+0x14/0x20 kernel/softirq.c:656
---[ end trace 0000000000000000 ]---
==================================================================
BUG: KASAN: slab-use-after-free in __list_del_entry_valid_or_report+0x3c/0x1b8 lib/list_debug.c:49
Read of size 8 at addr ffff0000d866f908 by task syz.0.32/4939

CPU: 1 UID: 0 PID: 4939 Comm: syz.0.32 Tainted: G        W           syzkaller #0 PREEMPT 
Tainted: [W]=WARN
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 07/02/2026
Call trace:
 show_stack+0x2c/0x3c arch/arm64/kernel/stacktrace.c:499 (C)
 __dump_stack+0x30/0x40 lib/dump_stack.c:94
 dump_stack_lvl+0xd8/0x12c lib/dump_stack.c:120
 print_address_description+0xb0/0x238 mm/kasan/report.c:378
 print_report+0x68/0x84 mm/kasan/report.c:482
 kasan_report+0x8c/0xc4 mm/kasan/report.c:595
 __asan_report_load8_noabort+0x20/0x2c mm/kasan/report_generic.c:381
 __list_del_entry_valid_or_report+0x3c/0x1b8 lib/list_debug.c:49
 __list_del_entry_valid include/linux/list.h:132 [inline]
 __list_del_entry include/linux/list.h:246 [inline]
 list_del_init include/linux/list.h:318 [inline]
 nuke+0x60/0x194 drivers/usb/gadget/udc/dummy_hcd.c:360
 stop_activity drivers/usb/gadget/udc/dummy_hcd.c:379 [inline]
 dummy_udc_stop+0xe4/0x180 drivers/usb/gadget/udc/dummy_hcd.c:1057
 usb_gadget_udc_stop_locked drivers/usb/gadget/udc/core.c:1265 [inline]
 gadget_unbind_driver+0x204/0x790 drivers/usb/gadget/udc/core.c:1727
 device_remove+0xc4/0x134 drivers/base/dd.c:616
 __device_release_driver drivers/base/dd.c:1349 [inline]
 device_release_driver_internal+0x124/0x20c drivers/base/dd.c:1372
 driver_detach+0x124/0x1b4 drivers/base/dd.c:1435
 bus_remove_driver+0x124/0x22c drivers/base/bus.c:832
 driver_unregister+0x78/0xac drivers/base/driver.c:202
 usb_gadget_unregister_driver+0x50/0x78 drivers/usb/gadget/udc/core.c:1784
 dev_release+0x8c/0x15c drivers/usb/gadget/legacy/inode.c:1198
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

Allocated by task 4939:
 kasan_save_stack mm/kasan/common.c:57 [inline]
 kasan_save_track+0x40/0x78 mm/kasan/common.c:78
 kasan_save_alloc_info+0x44/0x54 mm/kasan/generic.c:570
 poison_kmalloc_redzone mm/kasan/common.c:398 [inline]
 __kasan_kmalloc+0x9c/0xb4 mm/kasan/common.c:415
 kasan_kmalloc include/linux/kasan.h:263 [inline]
 __kmalloc_cache_noprof+0x2e8/0x5ec mm/slub.c:5489
 _kmalloc_noprof include/linux/slab.h:988 [inline]
 _kzalloc_noprof include/linux/slab.h:1309 [inline]
 dummy_alloc_request+0x88/0x128 drivers/usb/gadget/udc/dummy_hcd.c:693
 usb_ep_alloc_request+0x74/0x480 drivers/usb/gadget/udc/core.c:197
 gadgetfs_bind+0x104/0x75c drivers/usb/gadget/legacy/inode.c:1686
 gadget_bind_driver+0x274/0x834 drivers/usb/gadget/udc/core.c:1662
 call_driver_probe drivers/base/dd.c:-1 [inline]
 really_probe+0x29c/0x800 drivers/base/dd.c:706
 __driver_probe_device+0x1e0/0x350 drivers/base/dd.c:868
 driver_probe_device+0x6c/0x19c drivers/base/dd.c:898
 __driver_attach+0x168/0x384 drivers/base/dd.c:1292
 bus_for_each_dev+0x128/0x1b4 drivers/base/bus.c:383
 driver_attach+0x50/0x60 drivers/base/dd.c:1310
 bus_add_driver+0x208/0x500 drivers/base/bus.c:763
 driver_register+0x220/0x310 drivers/base/driver.c:174
 usb_gadget_register_driver_owner+0xf0/0x25c drivers/usb/gadget/udc/core.c:1752
 dev_config+0x91c/0xcc0 drivers/usb/gadget/legacy/inode.c:1883
 vfs_write+0x2a4/0xa0c fs/read_write.c:685
 ksys_write+0x12c/0x228 fs/read_write.c:739
 __do_sys_write fs/read_write.c:750 [inline]
 __se_sys_write fs/read_write.c:747 [inline]
 __arm64_sys_write+0x7c/0x90 fs/read_write.c:747
 __invoke_syscall arch/arm64/kernel/syscall.c:35 [inline]
 invoke_syscall+0x98/0x244 arch/arm64/kernel/syscall.c:49
 el0_svc_common+0xec/0x23c arch/arm64/kernel/syscall.c:121
 do_el0_svc+0x4c/0x5c arch/arm64/kernel/syscall.c:140
 el0_svc+0x64/0x260 arch/arm64/kernel/entry-common.c:736
 el0t_64_sync_handler+0x48/0x148 arch/arm64/kernel/entry-common.c:755
 el0t_64_sync+0x198/0x19c arch/arm64/kernel/entry.S:594

Freed by task 4939:
 kasan_save_stack mm/kasan/common.c:57 [inline]
 kasan_save_track+0x40/0x78 mm/kasan/common.c:78
 kasan_save_free_info+0x58/0x70 mm/kasan/generic.c:584
 poison_slab_object mm/kasan/common.c:253 [inline]
 __kasan_slab_free+0x74/0xa4 mm/kasan/common.c:285
 kasan_slab_free include/linux/kasan.h:235 [inline]
 slab_free_hook mm/slub.c:2677 [inline]
 slab_free mm/slub.c:6377 [inline]
 kfree+0x188/0x690 mm/slub.c:6692
 dummy_free_request+0x5c/0x84 drivers/usb/gadget/udc/dummy_hcd.c:711
 usb_ep_free_request+0x108/0x3fc drivers/usb/gadget/udc/core.c:221
 gadgetfs_unbind+0x19c/0x1f0 drivers/usb/gadget/legacy/inode.c:1661
 gadget_unbind_driver+0x188/0x790 drivers/usb/gadget/udc/core.c:1724
 device_remove+0xc4/0x134 drivers/base/dd.c:616
 __device_release_driver drivers/base/dd.c:1349 [inline]
 device_release_driver_internal+0x124/0x20c drivers/base/dd.c:1372
 driver_detach+0x124/0x1b4 drivers/base/dd.c:1435
 bus_remove_driver+0x124/0x22c drivers/base/bus.c:832
 driver_unregister+0x78/0xac drivers/base/driver.c:202
 usb_gadget_unregister_driver+0x50/0x78 drivers/usb/gadget/udc/core.c:1784
 dev_release+0x8c/0x15c drivers/usb/gadget/legacy/inode.c:1198
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

The buggy address belongs to the object at ffff0000d866f900
 which belongs to the cache kmalloc-128 of size 128
The buggy address is located 8 bytes inside of
 freed 128-byte region [ffff0000d866f900, ffff0000d866f980)

The buggy address belongs to the physical page:
page: refcount:0 mapcount:0 mapping:0000000000000000 index:0x0 pfn:0x11866f
flags: 0x5ffc00000000000(node=0|zone=2|lastcpupid=0x7ff)
page_type: f5(slab)
raw: 05ffc00000000000 ffff0000c0001a00 dead000000000100 dead000000000122
raw: 0000000000000000 0000000800100010 00000000f5000000 0000000000000000
page dumped because: kasan: bad access detected

Memory state around the buggy address:
 ffff0000d866f800: fa fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
 ffff0000d866f880: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
>ffff0000d866f900: fa fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
                      ^
 ffff0000d866f980: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
 ffff0000d866fa00: fa fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
==================================================================
list_del corruption, ffff0000d866f900->next is NULL
------------[ cut here ]------------
kernel BUG at lib/list_debug.c:53!
Internal error: Oops - BUG: 00000000f2000800 [#1]  SMP
Modules linked in:
CPU: 1 UID: 0 PID: 4939 Comm: syz.0.32 Tainted: G    B   W           syzkaller #0 PREEMPT 
Tainted: [B]=BAD_PAGE, [W]=WARN
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 07/02/2026
pstate: 634000c5 (nZCv daIF +PAN -UAO +TCO +DIT -SSBS BTYPE=--)
pc : __list_del_entry_valid_or_report+0xec/0x1b8 lib/list_debug.c:52
lr : __list_del_entry_valid_or_report+0xec/0x1b8 lib/list_debug.c:52
sp : ffff8000962579c0
x29: ffff8000962579c0 x28: 1fffe000195c4a01 x27: ffff0000cae25008
x26: 1fffe000195c4a00 x25: 00000000ffffff94 x24: 1fffe00019529808
x23: dfff800000000000 x22: dfff800000000000 x21: 0338032e0000134b
x20: 0000000000000000 x19: ffff0000d866f900 x18: 0000000000000000
x17: 3d3d3d3d3d3d3d3d x16: 3d3d3d3d3d3d3d3d x15: 3d3d3d3d3d3d3d3d
x14: 3d3d3d3d3d3d3d3d x13: 0000000000000001 x12: 0000000000000000
x11: 0000000000000000 x10: 0000000000000002 x9 : bfb6b4227df68700
x8 : bfb6b4227df68700 x7 : 0000000000000001 x6 : ffff80008048de94
x5 : 0000000000000000 x4 : 0000000000000000 x3 : ffff800080498bc8
x2 : 0000000100000001 x1 : ffff0000c82cba80 x0 : 0000000000000033
Call trace:
 __list_del_entry_valid_or_report+0xec/0x1b8 lib/list_debug.c:52 (P)
 __list_del_entry_valid include/linux/list.h:132 [inline]
 __list_del_entry include/linux/list.h:246 [inline]
 list_del_init include/linux/list.h:318 [inline]
 nuke+0x60/0x194 drivers/usb/gadget/udc/dummy_hcd.c:360
 stop_activity drivers/usb/gadget/udc/dummy_hcd.c:379 [inline]
 dummy_udc_stop+0xe4/0x180 drivers/usb/gadget/udc/dummy_hcd.c:1057
 usb_gadget_udc_stop_locked drivers/usb/gadget/udc/core.c:1265 [inline]
 gadget_unbind_driver+0x204/0x790 drivers/usb/gadget/udc/core.c:1727
 device_remove+0xc4/0x134 drivers/base/dd.c:616
 __device_release_driver drivers/base/dd.c:1349 [inline]
 device_release_driver_internal+0x124/0x20c drivers/base/dd.c:1372
 driver_detach+0x124/0x1b4 drivers/base/dd.c:1435
 bus_remove_driver+0x124/0x22c drivers/base/bus.c:832
 driver_unregister+0x78/0xac drivers/base/driver.c:202
 usb_gadget_unregister_driver+0x50/0x78 drivers/usb/gadget/udc/core.c:1784
 dev_release+0x8c/0x15c drivers/usb/gadget/legacy/inode.c:1198
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
Code: f0029ac0 91328000 aa1303e1 979c21eb (d4210000) 
---[ end trace 0000000000000000 ]---


---
If you want syzbot to run the reproducer, reply with:
#syz test: git://repo/address.git branch-or-commit-hash
If you attach or paste a git patch, syzbot will apply it before testing.

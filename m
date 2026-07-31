Received: from mail-oi1-f207.google.com (mail-oi1-f207.google.com [209.85.167.207])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D470F26A1CF
	for <linux-usb@vger.kernel.org>; Fri, 31 Jul 2026 01:28:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.207
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785461318; cv=none; b=kJaj+LRXGLa3ggRNxDDtZA5mTNFipQGjBzu/rEQ9Ldqefeq9/+7xictknbrVLj8gM74Gbw8xroyqXJNLGofYITyKmDIO7heRKebfniGA/AcMorPYrlAHhxiEo6pDnq8TiKVQMt4jRZm0rc+RaHFHZ88xeqaaMTMrnff/nikHWgc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785461318; c=relaxed/simple;
	bh=0mv8eNRIkksQsI/sfVjoc0FzFsfHJe4OCEyK4HJTtU4=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=omXWxpkrXfWMVOEkq//KnbMmZ+69U2sSPNQjfvVH34BPzFxYq2va2yNWC7twPx8Ei1W7lSqpBLHg25V/9CqSdpriQQ2izZQBDxg+ljWSlgn2Onod+2dyYxMJRgq2nf/3/GURKXQmc1rKy3xydVZXWDDIVmRz5S28OELY9vWAnWg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.207
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f207.google.com with SMTP id 5614622812f47-4a45997664aso641545b6e.1
        for <linux-usb@vger.kernel.org>; Thu, 30 Jul 2026 18:28:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785461316; x=1786066116;
        h=content-type:to:from:subject:message-id:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0K6LamyirqYrO2l5RRnwQpa+TEwGQnbQeQBrFCiLzbM=;
        b=gSTt3G7L1mHmviJU8vyNKCH6UBPeIBL14Xy2lS1t/H38YlzZ6ov7bNZ8YhFGkZJ6Tg
         5ritu6a5XOnSzPPQdDL2VFIkYQ2bUSbbwX81yTj44SelccHP2t65GFQFAFeNyzGiaZ6z
         zUEvFRWhtc74MWqJo94u3kHqzKWHxVY2tmDVihUHZc8OpFEK4KziEekGSWBg3KBFhiT6
         /6Gm0ZVGr0xfWPKH9+JjoCGfnFs+YjfNGLkA8QQHJuqejqwvm2p4kEl6S0ucJI5MZYAS
         yZU57rIfSPhv9vDlbSwy4QHmBAYOQjWqv7wTDpqy6zLo1Hj2YDaMs9mAFyifrczv93hH
         BkWw==
X-Forwarded-Encrypted: i=1; AHgh+RoksrV85AF/lB4IvrQchxX03qCnyx4G3rF25FrUap2QftYI8fzg8esJh7ooSTIMMSywZrUaaPJuSOw=@vger.kernel.org
X-Gm-Message-State: AOJu0YytSIdxOWrzJpFUnboYz4kL5jNXcAU3HzB9ELMgrwkijfh0g9xT
	mzOFCUS0gmT3NCbipHNDwEo9s229PQuVn2gHgs8rvjMivcmBP3oKbLqpO1Hvc2eR11Ec+c+IpZO
	BOZJ/PBIbTXH0pLwQUDpsVFWf0o22TPqCfYJ6omlDU9TxnuiT1iHieEnk9dQ=
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:1a03:b0:495:f519:70f0 with SMTP id
 5614622812f47-4ad9519a641mr2527619b6e.19.1785461315764; Thu, 30 Jul 2026
 18:28:35 -0700 (PDT)
Date: Thu, 30 Jul 2026 18:28:35 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6a6bfa43.1b55b669.19788.0016.GAE@google.com>
Subject: [syzbot] [usb?] KASAN: slab-use-after-free Read in ep_open
From: syzbot <syzbot+df9e891bf8ea586f846b@syzkaller.appspotmail.com>
To: gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    365f9c7a6b81 Merge branches 'for-next/core' and 'for-next/..
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git for-kernelci
console output: https://syzkaller.appspot.com/x/log.txt?x=13731632580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=72c97575381cec47
dashboard link: https://syzkaller.appspot.com/bug?extid=df9e891bf8ea586f846b
compiler:       Debian clang version 22.1.8 (++20260613092233+e80beda6e255-1~exp1~20260613092250.77), Debian LLD 22.1.8
userspace arch: arm64
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=136d6499580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=138d6449580000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/eafe0adb7386/disk-365f9c7a.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/29422d607579/vmlinux-365f9c7a.xz
kernel image: https://storage.googleapis.com/syzbot-assets/98ca955a8b54/Image-365f9c7a.gz.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+df9e891bf8ea586f846b@syzkaller.appspotmail.com

==================================================================
BUG: KASAN: slab-use-after-free in __mutex_lock_common kernel/locking/mutex.c:625 [inline]
BUG: KASAN: slab-use-after-free in __mutex_lock+0x130/0xf14 kernel/locking/mutex.c:821
Read of size 8 at addr ffff0000efe3d058 by task syz-executor/5909

CPU: 1 UID: 0 PID: 5909 Comm: syz-executor Not tainted syzkaller #0 PREEMPT 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 07/02/2026
Call trace:
 show_stack+0x2c/0x3c arch/arm64/kernel/stacktrace.c:499 (C)
 __dump_stack+0x30/0x40 lib/dump_stack.c:94
 dump_stack_lvl+0xd8/0x12c lib/dump_stack.c:120
 print_address_description+0xb0/0x238 mm/kasan/report.c:378
 print_report+0x68/0x84 mm/kasan/report.c:482
 kasan_report+0x8c/0xc4 mm/kasan/report.c:595
 __asan_report_load8_noabort+0x20/0x2c mm/kasan/report_generic.c:381
 __mutex_lock_common kernel/locking/mutex.c:625 [inline]
 __mutex_lock+0x130/0xf14 kernel/locking/mutex.c:821
 mutex_lock_interruptible_nested+0x24/0x30 kernel/locking/mutex.c:899
 ep_open+0x58/0x25c drivers/usb/gadget/legacy/inode.c:823
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

Allocated by task 6282:
 kasan_save_stack mm/kasan/common.c:57 [inline]
 kasan_save_track+0x40/0x78 mm/kasan/common.c:78
 kasan_save_alloc_info+0x44/0x54 mm/kasan/generic.c:570
 poison_kmalloc_redzone mm/kasan/common.c:398 [inline]
 __kasan_kmalloc+0x9c/0xb4 mm/kasan/common.c:415
 kasan_kmalloc include/linux/kasan.h:263 [inline]
 __kmalloc_cache_noprof+0x2e8/0x5ec mm/slub.c:5515
 _kmalloc_noprof include/linux/slab.h:969 [inline]
 _kzalloc_noprof include/linux/slab.h:1290 [inline]
 activate_ep_files drivers/usb/gadget/legacy/inode.c:1601 [inline]
 gadgetfs_bind+0x204/0x75c drivers/usb/gadget/legacy/inode.c:1692
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

Freed by task 6283:
 kasan_save_stack mm/kasan/common.c:57 [inline]
 kasan_save_track+0x40/0x78 mm/kasan/common.c:78
 kasan_save_free_info+0x58/0x70 mm/kasan/generic.c:584
 poison_slab_object mm/kasan/common.c:253 [inline]
 __kasan_slab_free+0x74/0xa4 mm/kasan/common.c:285
 kasan_slab_free include/linux/kasan.h:235 [inline]
 slab_free_hook mm/slub.c:2705 [inline]
 slab_free mm/slub.c:6405 [inline]
 kfree+0x188/0x690 mm/slub.c:6720
 put_ep+0xd0/0x144 drivers/usb/gadget/legacy/inode.c:225
 destroy_ep_files+0x244/0x2dc drivers/usb/gadget/legacy/inode.c:1582
 gadgetfs_unbind+0x114/0x1f0 drivers/usb/gadget/legacy/inode.c:1655
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
 exit_task_work include/linux/task_work.h:40 [inline]
 do_exit+0x58c/0x1a74 kernel/exit.c:1009
 __do_sys_exit kernel/exit.c:1119 [inline]
 __se_sys_exit kernel/exit.c:1117 [inline]
 do_group_exit+0x0/0x238 kernel/exit.c:1117
 __invoke_syscall arch/arm64/kernel/syscall.c:35 [inline]
 invoke_syscall+0x98/0x244 arch/arm64/kernel/syscall.c:49
 el0_svc_common+0xec/0x23c arch/arm64/kernel/syscall.c:121
 do_el0_svc+0x4c/0x5c arch/arm64/kernel/syscall.c:140
 el0_svc+0x64/0x260 arch/arm64/kernel/entry-common.c:736
 el0t_64_sync_handler+0x48/0x148 arch/arm64/kernel/entry-common.c:755
 el0t_64_sync+0x198/0x19c arch/arm64/kernel/entry.S:594

The buggy address belongs to the object at ffff0000efe3d000
 which belongs to the cache kmalloc-512 of size 512
The buggy address is located 88 bytes inside of
 freed 512-byte region [ffff0000efe3d000, ffff0000efe3d200)

The buggy address belongs to the physical page:
page: refcount:0 mapcount:0 mapping:0000000000000000 index:0xffff0000efe3dc00 pfn:0x12fe3c


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

Received: from mail-oi2-f11.google.com (mail-oi2-f11.google.com [74.125.231.203])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30B9D21B192
	for <linux-usb@vger.kernel.org>; Fri, 21 Aug 2026 07:30:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.203
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787297440; cv=none; b=fgYgPPTrT5/B2v7MrR93JtKAyka0AwkVKvmKl1ykDo7EogUJov93C+Dj4cJQULNNxTbYd8mqtSb1kuZYYuGJGhLKV2mQySyiDCSeHJ6kpYa4H/31UzWsW5Knkjcr1Qa4fVi9MeGg9q4VeAZvWXk9NPvNtT0/TOMRPaJ2P+AVe9Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787297440; c=relaxed/simple;
	bh=KYNcycBblOXiXt5eU5JMWcbtRPiEFtZJ27xLL3/n1ac=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=qs5h5k7KHVC7xN2dt4/D3YzKyhE0br4sGystJi+mAkUfpzgVP9EhsudjlLec0PGXr/dGvuKElYZ0brIPWYpTEOhh7HjV4x2s7Bv9neM5faCDsfEpyKwWVUB3uKUcS9UfqkbiLUKWsy8toefU3jKg1yJUUe9At2lAalKDGUiSyMc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=74.125.231.203
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi2-f11.google.com with SMTP id 5614622812f47-4af7193adb7so283434b6e.0
        for <linux-usb@vger.kernel.org>; Fri, 21 Aug 2026 00:30:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787297437; x=1787902237;
        h=content-type:to:from:subject:message-id:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hCn3DdhwMQCrZD8nPi4zq+Zk3ol7qRkifh9PXXbJLJw=;
        b=m9lhxRRVNuquatIfvy22HaGHF6efhV5Ua7beG+8k2+k423iXtxvtyASG18diXNd/55
         ITG+M92nFZ0AsdZRAlKkCklTaHSPmRAwVwTar8JkO5rgK7Kn0rEYN51hRX48aMjwtf4A
         FgLmrTuKH7IWDRvIMMFUec/H5vShGfuloPnRgG9TlNaLmMXEBkgWXeS0KSFBWJFpFN/B
         51Xj+/aMBfZPYxVs+RmQLEFlna3jX/ca29DbcW16MaDaTLLR+HVgrcrN582JbAbH0t+W
         M8ZthrhsKQevtQ+dlgwUYEoIPu8dJro4RdkElbTw771unG+jFUw20qVemGc1e2BzJcK7
         43gg==
X-Forwarded-Encrypted: i=1; AHgh+Rqcc9S4h/sR3jrMt+jbWvocJWY0Je0SXRAfi1toP0fRo0bw1BxqpqeDUEyw9d5z8j9WO7zFsNAHGi0=@vger.kernel.org
X-Gm-Message-State: AOJu0YydL7dmeleTF4RlxrYHJy00IMlebZS+q0GlAysYqaX4PCGwkHWI
	/mhVc8fxsAgX8bD7+VSBYZw9220R6MMNoDDdTv3Mx21Jydl+EWNnNTakX0rz08HX6yYcvMnh2R7
	dBPlHbxlzXm5EivI+QKUMTlulzQkmTnZ6uRdG2WzKgqqyOkmM7v2laz28fUc=
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:5086:b0:495:fecb:bf9c with SMTP id
 5614622812f47-4b2ef292b14mr4012253b6e.6.1787297437075; Fri, 21 Aug 2026
 00:30:37 -0700 (PDT)
Date: Fri, 21 Aug 2026 00:30:37 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6a87fe9d.ae6ddae5.3da009.0029.GAE@google.com>
Subject: [syzbot] [usb?] possible deadlock in mdc800_device_open
From: syzbot <syzbot+023b30ebfe0dc4bcfafe@syzkaller.appspotmail.com>
To: gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    dcb68831eac7 Merge tag 'block-7.2-20260815' of git://git.k..
git tree:       upstream
console+strace: https://syzkaller.appspot.com/x/log.txt?x=1667ea25580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=2ca5f2f2c4197664
dashboard link: https://syzkaller.appspot.com/bug?extid=023b30ebfe0dc4bcfafe
compiler:       Debian clang version 22.1.8 (++20260613092233+e80beda6e255-1~exp1~20260613092250.77), Debian LLD 22.1.8
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=15fe2679580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=167fda79580000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/2f9d6a54222e/disk-dcb68831.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/0b52c510b447/vmlinux-dcb68831.xz
kernel image: https://storage.googleapis.com/syzbot-assets/f8d408f8474e/bzImage-dcb68831.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+023b30ebfe0dc4bcfafe@syzkaller.appspotmail.com

======================================================
WARNING: possible circular locking dependency detected
syzkaller #0 Not tainted
------------------------------------------------------
syz-executor372/5624 is trying to acquire lock:
ffff888029dc0218 (&mdc800->io_lock){+.+.}-{4:4}, at: mdc800_device_open+0x2e/0x470 drivers/usb/image/mdc800.c:611

but task is already holding lock:
ffffffff8f8e0868 (minor_rwsem#2){++++}-{4:4}, at: usb_open+0x30/0x1e0 drivers/usb/core/file.c:38

which lock already depends on the new lock.


the existing dependency chain (in reverse order) is:

-> #1 (minor_rwsem#2){++++}-{4:4}:
       down_write+0x96/0x200 kernel/locking/rwsem.c:1631
       usb_register_dev+0x142/0x5e0 drivers/usb/core/file.c:134
       mdc800_usb_probe+0xf96/0x18c0 drivers/usb/image/mdc800.c:485
       usb_probe_interface+0x653/0xc60 drivers/usb/core/driver.c:396
       call_driver_probe drivers/base/dd.c:-1 [inline]
       really_probe+0x254/0xae0 drivers/base/dd.c:706
       __driver_probe_device+0x1e8/0x360 drivers/base/dd.c:868
       driver_probe_device+0x4f/0x240 drivers/base/dd.c:898
       __device_attach_driver+0x270/0x410 drivers/base/dd.c:1026
       bus_for_each_drv+0x258/0x2f0 drivers/base/bus.c:500
       __device_attach+0x2c4/0x450 drivers/base/dd.c:1098
       device_initial_probe+0xa1/0xd0 drivers/base/dd.c:1153
       bus_probe_device+0x12a/0x220 drivers/base/bus.c:620
       device_add+0x7d7/0xb80 drivers/base/core.c:3772
       usb_set_configuration+0x1ad8/0x2180 drivers/usb/core/message.c:2268
       usb_generic_driver_probe+0x8d/0x150 drivers/usb/core/generic.c:250
       usb_probe_device+0x1c3/0x3b0 drivers/usb/core/driver.c:291
       call_driver_probe drivers/base/dd.c:-1 [inline]
       really_probe+0x254/0xae0 drivers/base/dd.c:706
       __driver_probe_device+0x1e8/0x360 drivers/base/dd.c:868
       driver_probe_device+0x4f/0x240 drivers/base/dd.c:898
       __device_attach_driver+0x270/0x410 drivers/base/dd.c:1026
       bus_for_each_drv+0x258/0x2f0 drivers/base/bus.c:500
       __device_attach+0x2c4/0x450 drivers/base/dd.c:1098
       device_initial_probe+0xa1/0xd0 drivers/base/dd.c:1153
       bus_probe_device+0x12a/0x220 drivers/base/bus.c:620
       device_add+0x7d7/0xb80 drivers/base/core.c:3772
       usb_new_device+0x9aa/0x1690 drivers/usb/core/hub.c:2703
       hub_port_connect drivers/usb/core/hub.c:5575 [inline]
       hub_port_connect_change drivers/usb/core/hub.c:5715 [inline]
       port_event drivers/usb/core/hub.c:5879 [inline]
       hub_event+0x28e8/0x4d30 drivers/usb/core/hub.c:5961
       process_one_work kernel/workqueue.c:3322 [inline]
       process_scheduled_works+0xa8e/0x14e0 kernel/workqueue.c:3405
       worker_thread+0xa47/0xfb0 kernel/workqueue.c:3486
       kthread+0x388/0x470 kernel/kthread.c:436
       ret_from_fork+0x514/0xb70 arch/x86/kernel/process.c:158
       ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245

-> #0 (&mdc800->io_lock){+.+.}-{4:4}:
       check_prev_add kernel/locking/lockdep.c:3165 [inline]
       check_prevs_add kernel/locking/lockdep.c:3284 [inline]
       validate_chain kernel/locking/lockdep.c:3908 [inline]
       __lock_acquire+0x1520/0x2cf0 kernel/locking/lockdep.c:5237
       lock_acquire+0x106/0x350 kernel/locking/lockdep.c:5868
       __mutex_lock_common kernel/locking/mutex.c:646 [inline]
       __mutex_lock+0x19d/0x1550 kernel/locking/mutex.c:821
       mdc800_device_open+0x2e/0x470 drivers/usb/image/mdc800.c:611
       usb_open+0x156/0x1e0 drivers/usb/core/file.c:47
       chrdev_open+0x4d9/0x600 fs/char_dev.c:411
       do_dentry_open+0x816/0x1380 fs/open.c:947
       vfs_open+0x3b/0x340 fs/open.c:1052
       do_open fs/namei.c:4700 [inline]
       path_openat+0x2e44/0x3830 fs/namei.c:4863
       do_file_open+0x23e/0x4a0 fs/namei.c:4892
       do_sys_openat2+0x115/0x200 fs/open.c:1368
       do_sys_open fs/open.c:1374 [inline]
       __do_sys_openat fs/open.c:1390 [inline]
       __se_sys_openat fs/open.c:1385 [inline]
       __x64_sys_openat+0x138/0x170 fs/open.c:1385
       do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
       do_syscall_64+0x174/0x580 arch/x86/entry/syscall_64.c:94
       entry_SYSCALL_64_after_hwframe+0x77/0x7f

other info that might help us debug this:

 Possible unsafe locking scenario:

       CPU0                    CPU1
       ----                    ----
  rlock(minor_rwsem#2);
                               lock(&mdc800->io_lock);
                               lock(minor_rwsem#2);
  lock(&mdc800->io_lock);

 *** DEADLOCK ***

1 lock held by syz-executor372/5624:
 #0: ffffffff8f8e0868 (minor_rwsem#2){++++}-{4:4}, at: usb_open+0x30/0x1e0 drivers/usb/core/file.c:38

stack backtrace:
CPU: 0 UID: 0 PID: 5624 Comm: syz-executor372 Not tainted syzkaller #0 PREEMPT(full) 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 07/24/2026
Call Trace:
 <TASK>
 dump_stack_lvl+0xe8/0x150 lib/dump_stack.c:120
 print_circular_bug+0x2e1/0x300 kernel/locking/lockdep.c:2043
 check_noncircular+0x12e/0x150 kernel/locking/lockdep.c:2175
 check_prev_add kernel/locking/lockdep.c:3165 [inline]
 check_prevs_add kernel/locking/lockdep.c:3284 [inline]
 validate_chain kernel/locking/lockdep.c:3908 [inline]
 __lock_acquire+0x1520/0x2cf0 kernel/locking/lockdep.c:5237
 lock_acquire+0x106/0x350 kernel/locking/lockdep.c:5868
 __mutex_lock_common kernel/locking/mutex.c:646 [inline]
 __mutex_lock+0x19d/0x1550 kernel/locking/mutex.c:821
 mdc800_device_open+0x2e/0x470 drivers/usb/image/mdc800.c:611
 usb_open+0x156/0x1e0 drivers/usb/core/file.c:47
 chrdev_open+0x4d9/0x600 fs/char_dev.c:411
 do_dentry_open+0x816/0x1380 fs/open.c:947
 vfs_open+0x3b/0x340 fs/open.c:1052
 do_open fs/namei.c:4700 [inline]
 path_openat+0x2e44/0x3830 fs/namei.c:4863
 do_file_open+0x23e/0x4a0 fs/namei.c:4892
 do_sys_openat2+0x115/0x200 fs/open.c:1368
 do_sys_open fs/open.c:1374 [inline]
 __do_sys_openat fs/open.c:1390 [inline]
 __se_sys_openat fs/open.c:1385 [inline]
 __x64_sys_openat+0x138/0x170 fs/open.c:1385
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0x174/0x580 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f2ac746d097
Code: 48 89 fa 4c 89 df e8 48 1f 00 00 8b 93 08 03 00 00 59 5e 48 83 f8 fc 74 1a 5b c3 0f 1f 84 00 00 00 00 00 48 8b 44 24 10 0f 05 <5b> c3 0f 1f 80 00 00 00 00 83 e2 39 83 fa 08 75 de e8 23 ff ff ff
RSP: 002b:00007ffd29cf7470 EFLAGS: 00000202 ORIG_RAX: 0000000000000101
RAX: ffffffffffffffda RBX: 000055557962c400 RCX: 00007f2ac746d097
RDX: 0000000000000002 RSI: 00007ffd29cf7510 RDI: ffffffffffffff9c
RBP: 0000000000000001 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000202 R12: 00007ffd29cf7708
R13: 431bde82d7b634db R14: 00007f2ac74eec40 R15: 0000000000000002
 </TASK>


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

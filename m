Received: from mail-oi1-f208.google.com (mail-oi1-f208.google.com [209.85.167.208])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96D23449B0A
	for <linux-usb@vger.kernel.org>; Fri, 31 Jul 2026 17:15:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.208
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785518133; cv=none; b=Gwd31X9bCW2myjf8fvcX1ZS8InUiRYTWm5QismHkvYOSL8H6frYWwm97VVecqtVYt6OYS4mAjS+IGZnYh0sD93nUjx+OhNhYPnBqJ/5qNTiQYypU/dpW1bRM1F+rxvLNwZXzs8YFgo8BHOsoIlB4ehXDTeiUChkI1v07e5zV0xo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785518133; c=relaxed/simple;
	bh=z9GP+E7qoZhs8gQEzjLEsP4OQ5DeYUBO4IrD9MBF+O8=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=UK4OGNK1Q63PtAzoZrWfQYfWL59zwfElmj+EaAw8vkCg+1wm8izZ8olD1/rpP7rxLla7f9qhO3EKYBvOzqow303fXdXJQjgI3Fp1w4HnMjJzcoaqphCCoLrOzyBTbx7Pd1V+kEoFHpAkV1WPKaQTU90auwz3qmPqsSR2BfXpJZk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.208
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f208.google.com with SMTP id 5614622812f47-4a43d32fa9fso1535279b6e.2
        for <linux-usb@vger.kernel.org>; Fri, 31 Jul 2026 10:15:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785518130; x=1786122930;
        h=content-type:to:from:subject:message-id:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ol7zjpvN173glw0xJ7GtgJaEkn0gVgHBK4Bpr8zSbYs=;
        b=fAoHLmqE1OSNTCtbcKmTtLPR+uzJ6xw324OV9Xpmabi9pG27UTMvohv1ufpF5wQQaJ
         7WmONlW+b6YA32pAOoEs9BVFx+AwnyoKXst4kQD11FMGKc6PMRL2/lhO2pqql/seq/Ld
         cEqZdU3aDIOpG3p1GdPVFGI9rdzdrHJkHYe1KqD9HcIUu3wtB/76xEZYA2VNbIaQEQqo
         AVdXyZu5lQmVWoqocXnmNeJvNTBA1rR8ENTLMGklgFeQ/0G8jyyLjAiahDMgKhMALAgr
         cW8nteTJ3n3IrhGEZLtyi6u+08tU94Wz2UJVCapOYny0EgEK6fU9+KamxlsnLrgLwQpT
         /Azg==
X-Forwarded-Encrypted: i=1; AHgh+RqfK9/JKo04uLG5PjXbkqj5s/2BJ+ykdV2ihdErtmnLhH7lSEFLGjqd6stBsmr/q1iMFl6VOT7TLIA=@vger.kernel.org
X-Gm-Message-State: AOJu0YxDTBUUsd4cUqSqppCZ/dFtaAEEtyaN6LkvpVHIsay3fV+1pyfv
	pqjDMYY42jTkH/fUySanMFXdNuuggnQQjBrteDBHcJ1ArHD5+deWKwMfkwTZfzvHVsYOfb/16qC
	G2YbTaWWLJkHNt6JgDliFYxgEYRSM8IrVtt0FFnaV2CB4n7OC1CLzcysIShk=
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:4fe8:b0:4a4:adaf:5570 with SMTP id
 5614622812f47-4af5dfb3ddcmr1716623b6e.4.1785518130422; Fri, 31 Jul 2026
 10:15:30 -0700 (PDT)
Date: Fri, 31 Jul 2026 10:15:30 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6a6cd832.1aa927e4.17d4bf.0007.GAE@google.com>
Subject: [syzbot] [usb?] possible deadlock in digi_set_modem_signals
From: syzbot <syzbot+2051460e19471eeb42c3@syzkaller.appspotmail.com>
To: gregkh@linuxfoundation.org, johan@kernel.org, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    11028ab62899 Merge tag 'probes-fixes-v7.2-rc5' of git://gi..
git tree:       upstream
console+strace: https://syzkaller.appspot.com/x/log.txt?x=13574aea580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=cb17729fb04b1e3a
dashboard link: https://syzkaller.appspot.com/bug?extid=2051460e19471eeb42c3
compiler:       Debian clang version 22.1.8 (++20260613092233+e80beda6e255-1~exp1~20260613092250.77), Debian LLD 22.1.8
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=16643632580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=1535b03e580000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/0afad3dd27f4/disk-11028ab6.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/2e1441f9c31d/vmlinux-11028ab6.xz
kernel image: https://storage.googleapis.com/syzbot-assets/5f0b8bdf00cd/bzImage-11028ab6.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+2051460e19471eeb42c3@syzkaller.appspotmail.com

============================================
WARNING: possible recursive locking detected
syzkaller #0 Not tainted
--------------------------------------------
syz-executor164/5616 is trying to acquire lock:
ffff888037675858 (&priv->dp_port_lock){+.+.}-{3:3}, at: spin_lock include/linux/spinlock_rt.h:45 [inline]
ffff888037675858 (&priv->dp_port_lock){+.+.}-{3:3}, at: digi_set_modem_signals+0x19d/0x8c0 drivers/usb/serial/digi_acceleport.c:525

but task is already holding lock:
ffff888037676058 (&priv->dp_port_lock){+.+.}-{3:3}, at: spin_lock include/linux/spinlock_rt.h:45 [inline]
ffff888037676058 (&priv->dp_port_lock){+.+.}-{3:3}, at: digi_set_modem_signals+0x195/0x8c0 drivers/usb/serial/digi_acceleport.c:524

other info that might help us debug this:
 Possible unsafe locking scenario:

       CPU0
       ----
  lock(&priv->dp_port_lock);
  lock(&priv->dp_port_lock);

 *** DEADLOCK ***

 May be due to missing lock nesting notation

3 locks held by syz-executor164/5616:
 #0: ffff8880379d71a0 (&tty->legacy_mutex){+.+.}-{4:4}, at: tty_init_dev+0x74/0x4d0 drivers/tty/tty_io.c:1406
 #1: ffff888037676058 (&priv->dp_port_lock){+.+.}-{3:3}, at: spin_lock include/linux/spinlock_rt.h:45 [inline]
 #1: ffff888037676058 (&priv->dp_port_lock){+.+.}-{3:3}, at: digi_set_modem_signals+0x195/0x8c0 drivers/usb/serial/digi_acceleport.c:524
 #2: ffffffff8e1c3000 (rcu_read_lock){....}-{1:3}, at: rcu_lock_acquire include/linux/rcupdate.h:300 [inline]
 #2: ffffffff8e1c3000 (rcu_read_lock){....}-{1:3}, at: rcu_read_lock include/linux/rcupdate.h:840 [inline]
 #2: ffffffff8e1c3000 (rcu_read_lock){....}-{1:3}, at: __rt_spin_lock kernel/locking/spinlock_rt.c:50 [inline]
 #2: ffffffff8e1c3000 (rcu_read_lock){....}-{1:3}, at: rt_spin_lock+0x1e0/0x400 kernel/locking/spinlock_rt.c:57

stack backtrace:
CPU: 0 UID: 0 PID: 5616 Comm: syz-executor164 Not tainted syzkaller #0 PREEMPT_{RT,(full)} 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 07/24/2026
Call Trace:
 <TASK>
 dump_stack_lvl+0xe8/0x150 lib/dump_stack.c:120
 print_deadlock_bug+0x279/0x290 kernel/locking/lockdep.c:3041
 check_deadlock kernel/locking/lockdep.c:3093 [inline]
 validate_chain kernel/locking/lockdep.c:3895 [inline]
 __lock_acquire+0x24df/0x2ce0 kernel/locking/lockdep.c:5237
 lock_acquire+0x106/0x350 kernel/locking/lockdep.c:5868
 rt_spin_lock+0x83/0x400 kernel/locking/spinlock_rt.c:56
 spin_lock include/linux/spinlock_rt.h:45 [inline]
 digi_set_modem_signals+0x19d/0x8c0 drivers/usb/serial/digi_acceleport.c:525
 tty_port_raise_dtr_rts drivers/tty/tty_port.c:456 [inline]
 tty_port_block_til_ready+0x386/0x890 drivers/tty/tty_port.c:540
 tty_open+0x496/0xcd0 drivers/tty/tty_io.c:2137
 chrdev_open+0x4dc/0x600 fs/char_dev.c:411
 do_dentry_open+0x849/0x1420 fs/open.c:947
 vfs_open+0x3b/0x350 fs/open.c:1052
 do_open fs/namei.c:4700 [inline]
 path_openat+0x2e60/0x3850 fs/namei.c:4863
 do_file_open+0x23e/0x4a0 fs/namei.c:4892
 do_sys_openat2+0x115/0x200 fs/open.c:1368
 do_sys_open fs/open.c:1374 [inline]
 __do_sys_openat fs/open.c:1390 [inline]
 __se_sys_openat fs/open.c:1385 [inline]
 __x64_sys_openat+0x138/0x170 fs/open.c:1385
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0x174/0x580 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f2dafacdfc9
Code: c0 79 93 eb d5 48 8d 7c 1d 00 eb 99 0f 1f 44 00 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 d8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007ffe4d880a08 EFLAGS: 00000246 ORIG_RAX: 0000000000000101
RAX: ffffffffffffffda RBX: 0000200000000400 RCX: 00007f2dafacdfc9
RDX: 000000000000e002 RSI: 0000200000000400 RDI: 00000000ffffff9c
RBP: 0000200000000408 R08: 0000000000000006 R09: 0000000000000006
R10: 0000000000000000 R11: 0000000000000246 R12: 00007ffe4d880b78
R13: 431bde82d7b634db R14: 00007f2dafb61c40 R15: 0000000000000002
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

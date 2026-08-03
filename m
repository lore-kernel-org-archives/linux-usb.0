Received: from mail-oi1-f207.google.com (mail-oi1-f207.google.com [209.85.167.207])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C3153655F3
	for <linux-usb@vger.kernel.org>; Mon,  3 Aug 2026 10:48:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.207
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785754108; cv=none; b=iQzHsJHgG50J9QRf6wr4lBsVeJZKEWNcvBN4CmbLuEUNugAv68JslRH4+Ec7C2fVpE3q5/+B/VIwiSDITKBjT+WGG0pFH7H+MbxQMqnEUA3l6L4oj6c9gaQC/TWwYlkVIjcaeOVdG+eThoTQVcZAdJY9tSJjDQ0oWXbj4Ein5mg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785754108; c=relaxed/simple;
	bh=IQECFOSabs7iDNwI1oqMe3HiNyiXN4p0L+0bXP7yHEU=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=GmRxHoj29Rg6LfefQcAYpnTV9KaBBNYnu6VHmdcYnLKqzLmR1rxv+YTDYdL6zi/vs41pwEJkUKYZ4hrSyuGsxnM/1T9jH3r8lemOcyTI5C/5J3lS3uCLl/mn0/RjjGwZAc4k3jjTGzsuzRx+5n+5IcCeTqAwVIOoDhfcINjbtpI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.207
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f207.google.com with SMTP id 5614622812f47-4a36606e230so4608783b6e.2
        for <linux-usb@vger.kernel.org>; Mon, 03 Aug 2026 03:48:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785754105; x=1786358905;
        h=content-type:to:from:subject:message-id:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5XcHfcrqk1LciEtgM1fh03VkDbfVuXIi5D6H/T0h+d8=;
        b=A3+2A0HSJ4rLSqvRFiFC0oqxCfZZE1jHjgrXCxnvZl5/OY87eGaHeTMcsLofIYvYRL
         PhDWSMEHATUFnHKbC+OCsDDeEkqlxA2rMtvc48MAkOlVd4P2jlzg14wB4OvLJhpuJNEH
         36Yp6MA/9u18cnHae8SvbHNbwAr6TCYLjqyPGZTEvq0ws3R702Jy0vja3NNmcMI7pG+W
         6dGhuzo2js4hhViH9FnXWF9olb0q5LoSTOEPtXw4RSu0aaGaG5jHejhfnRHvBq7hA+V/
         CsKgiJoZwczD4d2dm43psh5v1jXKvc/uijA1+h+zeJ4Gqm/q1i1/IRzKgXi+evC2xnsQ
         tb5g==
X-Forwarded-Encrypted: i=1; AHgh+RoOQCOMHGxbMIjRd9e3GSv7m3CnMUjGeESqIMT9oMXcvBHkrcOARqR/HAUBX4XVaIaVxXrMFVk9s8U=@vger.kernel.org
X-Gm-Message-State: AOJu0YyonYvlSz2HZTHV4CrVBLI3t9yigLZ7uVZUxW/iYmDKrAfUTp/B
	/povwJAjgrNk+VG2Y77PQgc5iQjIQpFSOu/inZpCGssl8Amsd3WCdboiuBojGjbxrqYW3e+eea4
	3ZBkiQ3ScBYDZOXID7COyPMulgD+04vHyCYxHvXTbvchNJGqWo0dbYD8z9Kk=
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:14c6:b0:4a3:4598:f390 with SMTP id
 5614622812f47-4af5e3d7eabmr14546521b6e.17.1785754105395; Mon, 03 Aug 2026
 03:48:25 -0700 (PDT)
Date: Mon, 03 Aug 2026 03:48:25 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6a7071f9.f794c993.27aeb.002f.GAE@google.com>
Subject: [syzbot] [usb?] possible deadlock in tcm_alloc
From: syzbot <syzbot+2799146a53c356f8017d@syzkaller.appspotmail.com>
To: gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    11028ab62899 Merge tag 'probes-fixes-v7.2-rc5' of git://gi..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=10994aea580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=145fa60d73086782
dashboard link: https://syzkaller.appspot.com/bug?extid=2799146a53c356f8017d
compiler:       gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image (non-bootable): https://storage.googleapis.com/syzbot-assets/d900f083ada3/non_bootable_disk-11028ab6.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/e2be78614a29/vmlinux-11028ab6.xz
kernel image: https://storage.googleapis.com/syzbot-assets/301a11d315af/bzImage-11028ab6.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+2799146a53c356f8017d@syzkaller.appspotmail.com

======================================================
WARNING: possible circular locking dependency detected
syzkaller #0 Not tainted
------------------------------------------------------
syz.0.239/6703 is trying to acquire lock:
ffffffff90252b60 (tpg_instances_lock){+.+.}-{4:4}, at: tcm_alloc+0x20/0x440 drivers/usb/gadget/function/f_tcm.c:2733

but task is already holding lock:
ffff888058a66390 (&gi->lock){+.+.}-{4:4}, at: config_usb_cfg_link+0x57/0x3a0 drivers/usb/gadget/configfs.c:439

which lock already depends on the new lock.


the existing dependency chain (in reverse order) is:

-> #3 (&gi->lock){+.+.}-{4:4}:
       lock_acquire kernel/locking/lockdep.c:5868 [inline]
       lock_acquire+0x1b9/0x370 kernel/locking/lockdep.c:5825
       __mutex_lock_common kernel/locking/mutex.c:646 [inline]
       __mutex_lock+0x1a4/0x1bd0 kernel/locking/mutex.c:821
       config_usb_cfg_link+0x57/0x3a0 drivers/usb/gadget/configfs.c:439
       configfs_symlink+0x540/0x11f0 fs/configfs/symlink.c:196
       vfs_symlink fs/namei.c:5660 [inline]
       vfs_symlink+0x178/0x4d0 fs/namei.c:5639
       filename_symlinkat+0x2a6/0x560 fs/namei.c:5685
       __do_sys_symlinkat fs/namei.c:5705 [inline]
       __se_sys_symlinkat fs/namei.c:5700 [inline]
       __x64_sys_symlinkat+0x9c/0xe0 fs/namei.c:5700
       do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
       do_syscall_64+0x115/0x870 arch/x86/entry/syscall_64.c:94
       entry_SYSCALL_64_after_hwframe+0x77/0x7f

-> #2 (&sb->s_type->i_mutex_key#24){++++}-{4:4}:
       lock_acquire kernel/locking/lockdep.c:5868 [inline]
       lock_acquire+0x1b9/0x370 kernel/locking/lockdep.c:5825
       down_write+0x8b/0x1f0 kernel/locking/rwsem.c:1631
       inode_lock include/linux/fs.h:1024 [inline]
       configfs_depend_item_unlocked+0xf3/0x6a0 fs/configfs/dir.c:1259
       usbg_make_tpg+0x261/0x620 drivers/usb/gadget/function/f_tcm.c:1686
       target_fabric_make_tpg+0xab/0x8c0 drivers/target/target_core_fabric_configfs.c:939
       configfs_mkdir+0x51e/0xb70 fs/configfs/dir.c:1360
       vfs_mkdir+0x361/0x850 fs/namei.c:5276
       filename_mkdirat+0x48b/0x5e0 fs/namei.c:5309
       __do_sys_mkdir fs/namei.c:5336 [inline]
       __se_sys_mkdir fs/namei.c:5333 [inline]
       __x64_sys_mkdir+0x6b/0x90 fs/namei.c:5333
       do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
       do_syscall_64+0x115/0x870 arch/x86/entry/syscall_64.c:94
       entry_SYSCALL_64_after_hwframe+0x77/0x7f

-> #1 (&opts->dep_lock){+.+.}-{4:4}:
       lock_acquire kernel/locking/lockdep.c:5868 [inline]
       lock_acquire+0x1b9/0x370 kernel/locking/lockdep.c:5825
       __mutex_lock_common kernel/locking/mutex.c:646 [inline]
       __mutex_lock+0x1a4/0x1bd0 kernel/locking/mutex.c:821
       usbg_make_tpg+0x1a4/0x620 drivers/usb/gadget/function/f_tcm.c:1678
       target_fabric_make_tpg+0xab/0x8c0 drivers/target/target_core_fabric_configfs.c:939
       configfs_mkdir+0x51e/0xb70 fs/configfs/dir.c:1360
       vfs_mkdir+0x361/0x850 fs/namei.c:5276
       filename_mkdirat+0x48b/0x5e0 fs/namei.c:5309
       __do_sys_mkdir fs/namei.c:5336 [inline]
       __se_sys_mkdir fs/namei.c:5333 [inline]
       __x64_sys_mkdir+0x6b/0x90 fs/namei.c:5333
       do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
       do_syscall_64+0x115/0x870 arch/x86/entry/syscall_64.c:94
       entry_SYSCALL_64_after_hwframe+0x77/0x7f

-> #0 (tpg_instances_lock){+.+.}-{4:4}:
       check_prev_add+0xeb/0xe60 kernel/locking/lockdep.c:3165
       check_prevs_add kernel/locking/lockdep.c:3284 [inline]
       validate_chain kernel/locking/lockdep.c:3908 [inline]
       __lock_acquire+0x136c/0x1a40 kernel/locking/lockdep.c:5237
       lock_acquire kernel/locking/lockdep.c:5868 [inline]
       lock_acquire+0x1b9/0x370 kernel/locking/lockdep.c:5825
       __mutex_lock_common kernel/locking/mutex.c:646 [inline]
       __mutex_lock+0x1a4/0x1bd0 kernel/locking/mutex.c:821
       tcm_alloc+0x20/0x440 drivers/usb/gadget/function/f_tcm.c:2733
       usb_get_function+0x5e/0xd0 drivers/usb/gadget/functions.c:61
       config_usb_cfg_link+0x1ed/0x3a0 drivers/usb/gadget/configfs.c:469
       configfs_symlink+0x540/0x11f0 fs/configfs/symlink.c:196
       vfs_symlink fs/namei.c:5660 [inline]
       vfs_symlink+0x178/0x4d0 fs/namei.c:5639
       filename_symlinkat+0x2a6/0x560 fs/namei.c:5685
       __do_sys_symlinkat fs/namei.c:5705 [inline]
       __se_sys_symlinkat fs/namei.c:5700 [inline]
       __x64_sys_symlinkat+0x9c/0xe0 fs/namei.c:5700
       do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
       do_syscall_64+0x115/0x870 arch/x86/entry/syscall_64.c:94
       entry_SYSCALL_64_after_hwframe+0x77/0x7f

other info that might help us debug this:

Chain exists of:
  tpg_instances_lock --> &sb->s_type->i_mutex_key#24 --> &gi->lock

 Possible unsafe locking scenario:

       CPU0                    CPU1
       ----                    ----
  lock(&gi->lock);
                               lock(&sb->s_type->i_mutex_key#24);
                               lock(&gi->lock);
  lock(tpg_instances_lock);

 *** DEADLOCK ***

3 locks held by syz.0.239/6703:
 #0: ffff888024522450 (sb_writers#13){.+.+}-{0:0}, at: filename_create+0x10d/0x400 fs/namei.c:4948
 #1: ffff888057d20ac0 (&sb->s_type->i_mutex_key#24){++++}-{4:4}, at: inode_lock include/linux/fs.h:1024 [inline]
 #1: ffff888057d20ac0 (&sb->s_type->i_mutex_key#24){++++}-{4:4}, at: configfs_symlink+0x3c0/0x11f0 fs/configfs/symlink.c:186
 #2: ffff888058a66390 (&gi->lock){+.+.}-{4:4}, at: config_usb_cfg_link+0x57/0x3a0 drivers/usb/gadget/configfs.c:439

stack backtrace:
CPU: 2 UID: 0 PID: 6703 Comm: syz.0.239 Not tainted syzkaller #0 PREEMPT(full) 
Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.3-debian-1.16.3-2 04/01/2014
Call Trace:
 <TASK>
 __dump_stack lib/dump_stack.c:94 [inline]
 dump_stack_lvl+0x100/0x190 lib/dump_stack.c:120
 print_circular_bug.cold+0x178/0x1c7 kernel/locking/lockdep.c:2043
 check_noncircular+0x146/0x160 kernel/locking/lockdep.c:2175
 check_prev_add+0xeb/0xe60 kernel/locking/lockdep.c:3165
 check_prevs_add kernel/locking/lockdep.c:3284 [inline]
 validate_chain kernel/locking/lockdep.c:3908 [inline]
 __lock_acquire+0x136c/0x1a40 kernel/locking/lockdep.c:5237
 lock_acquire kernel/locking/lockdep.c:5868 [inline]
 lock_acquire+0x1b9/0x370 kernel/locking/lockdep.c:5825
 __mutex_lock_common kernel/locking/mutex.c:646 [inline]
 __mutex_lock+0x1a4/0x1bd0 kernel/locking/mutex.c:821
 tcm_alloc+0x20/0x440 drivers/usb/gadget/function/f_tcm.c:2733
 usb_get_function+0x5e/0xd0 drivers/usb/gadget/functions.c:61
 config_usb_cfg_link+0x1ed/0x3a0 drivers/usb/gadget/configfs.c:469
 configfs_symlink+0x540/0x11f0 fs/configfs/symlink.c:196
 vfs_symlink fs/namei.c:5660 [inline]
 vfs_symlink+0x178/0x4d0 fs/namei.c:5639
 filename_symlinkat+0x2a6/0x560 fs/namei.c:5685
 __do_sys_symlinkat fs/namei.c:5705 [inline]
 __se_sys_symlinkat fs/namei.c:5700 [inline]
 __x64_sys_symlinkat+0x9c/0xe0 fs/namei.c:5700
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0x115/0x870 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f358b59df99
Code: ff c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 44 00 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 e8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007f358c541028 EFLAGS: 00000246 ORIG_RAX: 000000000000010a
RAX: ffffffffffffffda RBX: 00007f358b825fa0 RCX: 00007f358b59df99
RDX: 0000200000000400 RSI: ffffffffffffff9c RDI: 0000200000000300
RBP: 00007f358b634ec4 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000000
R13: 00007f358b826038 R14: 00007f358b825fa0 R15: 00007ffdf9fc7e88
 </TASK>


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

Received: from mail-oi1-f205.google.com (mail-oi1-f205.google.com [209.85.167.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B479E3B14A5
	for <linux-usb@vger.kernel.org>; Tue, 28 Jul 2026 13:41:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785246084; cv=none; b=LbFcMusLfYfTc3BqrUA4Enxluh+qoZ+Bm4xc2VkOQiHH5swrvpm5K6iDHko/CWC8Zwh3qXFLtb3OQdd+Ja18YmnmiBw1hZ0EQ3oB9Rsb6haGf4tDqvE7mFHwaphAXrVCWdMuyjrbqlTyPxzC8kZWF1uzYHSyeailJI2wUV+dOA8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785246084; c=relaxed/simple;
	bh=s06UU73RC4GnGz0lMZZACM0d423Wv3b8pWNiqr8kF5Y=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=I0EHE1FzT/2n6tUkGzu3fJU34grHpsFdgJQb4hPJrg7dOrX2wA8iL8sQHEh1yb3OXGB7HzWGwOBANdfOh0fBKl3U+rCyFsljsyyXKc+yeINyYqDsg8hr5RcPNBFq1T/ULrXf8A2G9dMQSlv4DDsbNqLZYj23u3qIQKc8gwoZ/es=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f205.google.com with SMTP id 5614622812f47-4a7c64fbbc6so2455196b6e.2
        for <linux-usb@vger.kernel.org>; Tue, 28 Jul 2026 06:41:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785246082; x=1785850882;
        h=content-type:to:from:subject:message-id:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jxcGjZSC5x/I4Mfy8MkZBaefOA+FBnuShr/rsAirt1Q=;
        b=lxZsFaps4FoRg6PVfE3gl4zxDrerhJ6WE6Maw4sQG42+/C7czznhbuCeG98UpF202g
         AF6lbh9HOe5reoRRaVVjDT23AXDCoM//HDz01yECCNJ41w+vl04UEY8an0LmyYhCUWD3
         WxWsbeCGC4kriueOx1KLxzNbfehiViJpLqntMzWE8Q1QcARv2KLaGSugzZT870DGteM2
         5K6/jpISJ56XhqiwNOLH2vRI0aw7mxudhQUajVzCiLsgtMMsomPCRnKPLQ5hB60zAAMo
         8/ub9D/CPvLu8U5tHBpKbsqXcGm/RHLdNNxCJ06rt8KAxegql4nrtg433IrxV4NE6wKV
         1EGQ==
X-Forwarded-Encrypted: i=1; AHgh+Rr/AhNgK3ro24YwsVYk5TYgYsgO0iNRv8uXaQFPTT1FsydTkF7NJmuDpvMEOwgSyvAN2iKIrePvEgc=@vger.kernel.org
X-Gm-Message-State: AOJu0YzzdiP+VMSB1StZwDgUMVjRtcAkVAEDeCcK2bswQrDqgD7S/rhe
	fOT1ssMvQjTYNS/C13M2vmB+39MYPlBsL1CrMohekgkyEAWv6Qm+AMfGWiiCueMJPis1MCbs/X4
	9K5OGjHoDIR6YwP6EMPuvbef8EcYnNvEkLp8G51susdAScc9E8n2jNZlz7yg=
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:1527:b0:48f:a9f3:1c38 with SMTP id
 5614622812f47-4ad5b7fde6bmr1431437b6e.2.1785246081831; Tue, 28 Jul 2026
 06:41:21 -0700 (PDT)
Date: Tue, 28 Jul 2026 06:41:21 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6a68b181.4c659fcc.19cd90.001f.GAE@google.com>
Subject: [syzbot] [usb?] possible deadlock in uvcg_streaming_header_allow_link
From: syzbot <syzbot+ed4b9a6a61280b24d9c3@syzkaller.appspotmail.com>
To: gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    48a5a7ab8d6a Merge tag 'v7.2-rc4-smb3-client-fixes' of git..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=16bfd746580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=cb17729fb04b1e3a
dashboard link: https://syzkaller.appspot.com/bug?extid=ed4b9a6a61280b24d9c3
compiler:       Debian clang version 22.1.8 (++20260613092233+e80beda6e255-1~exp1~20260613092250.77), Debian LLD 22.1.8
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=101fe09e580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=100886b9580000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/d0d4e9604889/disk-48a5a7ab.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/d0017d0f35e6/vmlinux-48a5a7ab.xz
kernel image: https://storage.googleapis.com/syzbot-assets/81888db0a443/bzImage-48a5a7ab.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+ed4b9a6a61280b24d9c3@syzkaller.appspotmail.com

======================================================
WARNING: possible circular locking dependency detected
syzkaller #0 Not tainted
------------------------------------------------------
syz.0.18/5837 is trying to acquire lock:
ffffffff8ef6f000 (gadget_subsys.su_mutex){+.+.}-{4:4}, at: uvcg_streaming_header_allow_link+0x75/0x4d0 drivers/usb/gadget/function/uvc_configfs.c:1750

but task is already holding lock:
ffff88803cdb6830 (&sb->s_type->i_mutex_key#24){+.+.}-{4:4}, at: inode_lock include/linux/fs.h:1024 [inline]
ffff88803cdb6830 (&sb->s_type->i_mutex_key#24){+.+.}-{4:4}, at: configfs_symlink+0x3af/0x1030 fs/configfs/symlink.c:186

which lock already depends on the new lock.


the existing dependency chain (in reverse order) is:

-> #2 (&sb->s_type->i_mutex_key#24){+.+.}-{4:4}:
       down_write+0x3a/0x50 kernel/locking/rwsem.c:1631
       inode_lock include/linux/fs.h:1024 [inline]
       configfs_depend_item_unlocked+0x153/0x420 fs/configfs/dir.c:1259
       usbg_make_tpg+0x1f6/0x590 drivers/usb/gadget/function/f_tcm.c:1686
       target_fabric_make_tpg+0xa8/0x6d0 drivers/target/target_core_fabric_configfs.c:939
       configfs_mkdir+0x4f6/0x9e0 fs/configfs/dir.c:1360
       vfs_mkdir+0x402/0x620 fs/namei.c:5276
       filename_mkdirat+0x289/0x520 fs/namei.c:5309
       __do_sys_mkdir fs/namei.c:5336 [inline]
       __se_sys_mkdir+0x34/0x150 fs/namei.c:5333
       do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
       do_syscall_64+0x174/0x580 arch/x86/entry/syscall_64.c:94
       entry_SYSCALL_64_after_hwframe+0x77/0x7f

-> #1 (&opts->dep_lock){+.+.}-{4:4}:
       __mutex_lock_common kernel/locking/rtmutex_api.c:559 [inline]
       mutex_lock_nested+0x5a/0x1d0 kernel/locking/rtmutex_api.c:578
       tcm_set_name+0x2b/0xd0 drivers/usb/gadget/function/f_tcm.c:2540
       function_make+0x1a8/0x360 drivers/usb/gadget/configfs.c:636
       configfs_mkdir+0x4f6/0x9e0 fs/configfs/dir.c:1360
       vfs_mkdir+0x402/0x620 fs/namei.c:5276
       filename_mkdirat+0x289/0x520 fs/namei.c:5309
       __do_sys_mkdir fs/namei.c:5336 [inline]
       __se_sys_mkdir+0x34/0x150 fs/namei.c:5333
       do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
       do_syscall_64+0x174/0x580 arch/x86/entry/syscall_64.c:94
       entry_SYSCALL_64_after_hwframe+0x77/0x7f

-> #0 (gadget_subsys.su_mutex){+.+.}-{4:4}:
       check_prev_add kernel/locking/lockdep.c:3165 [inline]
       check_prevs_add kernel/locking/lockdep.c:3284 [inline]
       validate_chain kernel/locking/lockdep.c:3908 [inline]
       __lock_acquire+0x1520/0x2ce0 kernel/locking/lockdep.c:5237
       lock_acquire+0x106/0x350 kernel/locking/lockdep.c:5868
       __mutex_lock_common kernel/locking/rtmutex_api.c:559 [inline]
       mutex_lock_nested+0x5a/0x1d0 kernel/locking/rtmutex_api.c:578
       uvcg_streaming_header_allow_link+0x75/0x4d0 drivers/usb/gadget/function/uvc_configfs.c:1750
       configfs_symlink+0x59a/0x1030 fs/configfs/symlink.c:196
       vfs_symlink+0x18b/0x330 fs/namei.c:5660
       filename_symlinkat+0x1cd/0x420 fs/namei.c:5685
       __do_sys_symlink fs/namei.c:5712 [inline]
       __se_sys_symlink+0x4d/0x2b0 fs/namei.c:5708
       do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
       do_syscall_64+0x174/0x580 arch/x86/entry/syscall_64.c:94
       entry_SYSCALL_64_after_hwframe+0x77/0x7f

other info that might help us debug this:

Chain exists of:
  gadget_subsys.su_mutex --> &opts->dep_lock --> &sb->s_type->i_mutex_key#24

 Possible unsafe locking scenario:

       CPU0                    CPU1
       ----                    ----
  lock(&sb->s_type->i_mutex_key#24);
                               lock(&opts->dep_lock);
                               lock(&sb->s_type->i_mutex_key#24);
  lock(gadget_subsys.su_mutex);

 *** DEADLOCK ***

2 locks held by syz.0.18/5837:
 #0: ffff88801bf26500 (sb_writers#12){.+.+}-{0:0}, at: mnt_want_write+0x41/0x90 fs/namespace.c:494
 #1: ffff88803cdb6830 (&sb->s_type->i_mutex_key#24){+.+.}-{4:4}, at: inode_lock include/linux/fs.h:1024 [inline]
 #1: ffff88803cdb6830 (&sb->s_type->i_mutex_key#24){+.+.}-{4:4}, at: configfs_symlink+0x3af/0x1030 fs/configfs/symlink.c:186

stack backtrace:
CPU: 1 UID: 0 PID: 5837 Comm: syz.0.18 Not tainted syzkaller #0 PREEMPT_{RT,(full)} 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 07/16/2026
Call Trace:
 <TASK>
 dump_stack_lvl+0xe8/0x150 lib/dump_stack.c:120
 print_circular_bug+0x2e1/0x300 kernel/locking/lockdep.c:2043
 check_noncircular+0x12e/0x150 kernel/locking/lockdep.c:2175
 check_prev_add kernel/locking/lockdep.c:3165 [inline]
 check_prevs_add kernel/locking/lockdep.c:3284 [inline]
 validate_chain kernel/locking/lockdep.c:3908 [inline]
 __lock_acquire+0x1520/0x2ce0 kernel/locking/lockdep.c:5237
 lock_acquire+0x106/0x350 kernel/locking/lockdep.c:5868
 __mutex_lock_common kernel/locking/rtmutex_api.c:559 [inline]
 mutex_lock_nested+0x5a/0x1d0 kernel/locking/rtmutex_api.c:578
 uvcg_streaming_header_allow_link+0x75/0x4d0 drivers/usb/gadget/function/uvc_configfs.c:1750
 configfs_symlink+0x59a/0x1030 fs/configfs/symlink.c:196
 vfs_symlink+0x18b/0x330 fs/namei.c:5660
 filename_symlinkat+0x1cd/0x420 fs/namei.c:5685
 __do_sys_symlink fs/namei.c:5712 [inline]
 __se_sys_symlink+0x4d/0x2b0 fs/namei.c:5708
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0x174/0x580 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f02ea0fde99
Code: ff c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 44 00 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 e8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007ffed3700ec8 EFLAGS: 00000246 ORIG_RAX: 0000000000000058
RAX: ffffffffffffffda RBX: 00007f02ea385fa0 RCX: 00007f02ea0fde99
RDX: 0000000000000000 RSI: 0000200000001500 RDI: 0000200000001400
RBP: 00007f02ea193eaf R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000000
R13: 00007f02ea385fac R14: 00007f02ea385fa0 R15: 00007f02ea385fa0
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

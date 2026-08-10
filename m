Received: from mail-oi1-f208.google.com (mail-oi1-f208.google.com [209.85.167.208])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A743A49620
	for <linux-usb@vger.kernel.org>; Mon, 10 Aug 2026 00:13:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.208
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786320808; cv=none; b=VbJVh0G/YtfDU7Se4JAKiWPhBLtp8mp7c8OwY+krmNLHbB1Jzo3kwmvjxYG3kPCCU6KWzJXZTPR7KdA0ouwSH0W+2BzTKxHAVKwfFAQZQy7jpcp9rI3hWNvU3aul7alpcbqEAD2Cp/F48aLgJlN+2WQdkZ0ylPOjSfdViIRSdCE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786320808; c=relaxed/simple;
	bh=QWneyd1QSrXOGzQjw8f5EJNHhPN2t8GFQZtp3hBokwY=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=FiU3f4DyvQHIAYGfc6PlbrkAMg2/quz6yGlOLi2rCAaJnlZmBoqnWbP39CLhCBNaUfo4iiFJPmbAzP4IcCXBD2zjFROav5L6t6TDhw1i7QOom9HqK1v8125XhCgzOsXHov/Vhzq178VZAXUuYp7Xh556qUFF49kLtNAyY/kyXFg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.208
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f208.google.com with SMTP id 5614622812f47-4a416619e8dso2481806b6e.1
        for <linux-usb@vger.kernel.org>; Sun, 09 Aug 2026 17:13:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786320805; x=1786925605;
        h=content-type:to:from:subject:message-id:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZBpe7+1TmfU8yVIQXgvY0XQ76keO4y24JiIBhOaZl8o=;
        b=TeihwsJaQmODNXUjZnL8a3ke1QzZhGkJeseAuq+9erFXDwyc0qQnF66vLI1SIEeeif
         vXI+ntfT22rKuY3WfCPynycfwA44uhRT+BD3zDB/1U0qySwi2tdma4gWXD4jBjifvhf5
         dPa4Ttt/z6Hs0LylLgt3YVuk8cJIazpVF2u2knjAC0yXtR0U8J7vY3gBZyJpqP1aLSRt
         cM14pRcDtwBy47xzIf1I7swDmJMoLvEXComLggepuQDKcvBoEvjS/S/692nfiQi57C/g
         mdc29GYlSTTaR0uY6b43d9zpc3nRb10MQbXMFx+4uQ8MkwkNVjs++kXugJsk1cGBkHyJ
         UuSA==
X-Forwarded-Encrypted: i=1; AHgh+RrHIODOD4RlY5Jbwbl94lJXiKJSR4i/bgaBlWsJkVLNtGuZSiJklnXGLS1W/fbTKS3mBEniVfSECi0=@vger.kernel.org
X-Gm-Message-State: AOJu0YyVT2nutf2qcy4aZC1fcp63dQrKGKB1mGgvYygy7SLfhPTlNZMh
	tu6wR+m1rLt2PULmaBdS4OIKu8ZSwAp3LE50O9flNlHeAJR5a9j1fJxGUhrR2KYKATD0Iq2umqa
	+Q1KyMeS7I+VW7rf38Tv5A2CiRfqkzvIYhBuBYR1A38USRdEJtiR1caEqo4Y=
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:2381:b0:492:c9a4:2104 with SMTP id
 5614622812f47-4b1af83fae5mr7830635b6e.10.1786320805648; Sun, 09 Aug 2026
 17:13:25 -0700 (PDT)
Date: Sun, 09 Aug 2026 17:13:25 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6a7917a5.b50370da.49fe0.0047.GAE@google.com>
Subject: [syzbot] [usb?] possible deadlock in tcm_register_callback
From: syzbot <syzbot+642d0d809d2c72babdd2@syzkaller.appspotmail.com>
To: gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    848acc8ffe1b Merge tag 'fsverity-for-linus' of git://git.k..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=1113b649580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=145fa60d73086782
dashboard link: https://syzkaller.appspot.com/bug?extid=642d0d809d2c72babdd2
compiler:       gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/32c9dc084aaa/disk-848acc8f.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/b7604244b0a9/vmlinux-848acc8f.xz
kernel image: https://storage.googleapis.com/syzbot-assets/4cd321f6fe47/bzImage-848acc8f.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+642d0d809d2c72babdd2@syzkaller.appspotmail.com

======================================================
WARNING: possible circular locking dependency detected
syzkaller #0 Not tainted
------------------------------------------------------
syz.2.189/7749 is trying to acquire lock:
ffff8880550c4118 (&opts->dep_lock){+.+.}-{4:4}, at: tcm_register_callback+0x1f/0x70 drivers/usb/gadget/function/f_tcm.c:2625

but task is already holding lock:
ffff8880533c7070 (&p->frag_sem){++++}-{4:4}, at: flush_write_buffer fs/configfs/file.c:205 [inline]
ffff8880533c7070 (&p->frag_sem){++++}-{4:4}, at: configfs_write_iter+0x218/0x4e0 fs/configfs/file.c:229

which lock already depends on the new lock.


the existing dependency chain (in reverse order) is:

-> #2 (&p->frag_sem){++++}-{4:4}:
       lock_acquire kernel/locking/lockdep.c:5868 [inline]
       lock_acquire+0x1b9/0x370 kernel/locking/lockdep.c:5825
       down_write_killable+0x93/0x250 kernel/locking/rwsem.c:1643
       configfs_rmdir+0x3fa/0x950 fs/configfs/dir.c:1534
       vfs_rmdir fs/namei.c:5381 [inline]
       vfs_rmdir+0x328/0x8a0 fs/namei.c:5354
       filename_rmdir+0x31a/0x5c0 fs/namei.c:5438
       __do_sys_rmdir fs/namei.c:5461 [inline]
       __se_sys_rmdir fs/namei.c:5458 [inline]
       __x64_sys_rmdir+0x46/0x70 fs/namei.c:5458
       do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
       do_syscall_64+0x115/0x870 arch/x86/entry/syscall_64.c:94
       entry_SYSCALL_64_after_hwframe+0x77/0x7f

-> #1 (&sb->s_type->i_mutex_key#24){++++}-{4:4}:
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
       __do_sys_mkdirat fs/namei.c:5330 [inline]
       __se_sys_mkdirat fs/namei.c:5327 [inline]
       __x64_sys_mkdirat+0x89/0xc0 fs/namei.c:5327
       do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
       do_syscall_64+0x115/0x870 arch/x86/entry/syscall_64.c:94
       entry_SYSCALL_64_after_hwframe+0x77/0x7f

-> #0 (&opts->dep_lock){+.+.}-{4:4}:
       check_prev_add+0xeb/0xe60 kernel/locking/lockdep.c:3165
       check_prevs_add kernel/locking/lockdep.c:3284 [inline]
       validate_chain kernel/locking/lockdep.c:3908 [inline]
       __lock_acquire+0x136c/0x1a40 kernel/locking/lockdep.c:5237
       lock_acquire kernel/locking/lockdep.c:5868 [inline]
       lock_acquire+0x1b9/0x370 kernel/locking/lockdep.c:5825
       __mutex_lock_common kernel/locking/mutex.c:646 [inline]
       __mutex_lock+0x1a4/0x1bd0 kernel/locking/mutex.c:821
       tcm_register_callback+0x1f/0x70 drivers/usb/gadget/function/f_tcm.c:2625
       usbg_attach drivers/usb/gadget/function/f_tcm.c:2649 [inline]
       usbg_enable_tpg+0x95/0x160 drivers/usb/gadget/function/f_tcm.c:1825
       target_tpg_enable+0x1fc/0x5d0 drivers/target/target_core_tpg.c:481
       target_fabric_tpg_base_enable_store+0x162/0x190 drivers/target/target_core_fabric_configfs.c:840
       flush_write_buffer fs/configfs/file.c:207 [inline]
       configfs_write_iter+0x302/0x4e0 fs/configfs/file.c:229
       new_sync_write fs/read_write.c:595 [inline]
       vfs_write+0x6ac/0x1050 fs/read_write.c:687
       ksys_write+0x12a/0x250 fs/read_write.c:739
       do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
       do_syscall_64+0x115/0x870 arch/x86/entry/syscall_64.c:94
       entry_SYSCALL_64_after_hwframe+0x77/0x7f

other info that might help us debug this:

Chain exists of:
  &opts->dep_lock --> &sb->s_type->i_mutex_key#24 --> &p->frag_sem

 Possible unsafe locking scenario:

       CPU0                    CPU1
       ----                    ----
  rlock(&p->frag_sem);
                               lock(&sb->s_type->i_mutex_key#24);
                               lock(&p->frag_sem);
  lock(&opts->dep_lock);

 *** DEADLOCK ***

4 locks held by syz.2.189/7749:
 #0: ffff888021776ef0 (&f->f_pos_lock){+.+.}-{4:4}, at: fdget_pos+0x2aa/0x380 fs/file.c:1259
 #1: ffff88801e736450 (sb_writers#13){.+.+}-{0:0}, at: ksys_write+0x12a/0x250 fs/read_write.c:739
 #2: ffff88802bb2dc80 (&buffer->mutex){+.+.}-{4:4}, at: configfs_write_iter+0x76/0x4e0 fs/configfs/file.c:226
 #3: ffff8880533c7070 (&p->frag_sem){++++}-{4:4}, at: flush_write_buffer fs/configfs/file.c:205 [inline]
 #3: ffff8880533c7070 (&p->frag_sem){++++}-{4:4}, at: configfs_write_iter+0x218/0x4e0 fs/configfs/file.c:229

stack backtrace:
CPU: 0 UID: 0 PID: 7749 Comm: syz.2.189 Not tainted syzkaller #0 PREEMPT(full) 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 07/16/2026
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
 tcm_register_callback+0x1f/0x70 drivers/usb/gadget/function/f_tcm.c:2625
 usbg_attach drivers/usb/gadget/function/f_tcm.c:2649 [inline]
 usbg_enable_tpg+0x95/0x160 drivers/usb/gadget/function/f_tcm.c:1825
 target_tpg_enable+0x1fc/0x5d0 drivers/target/target_core_tpg.c:481
 target_fabric_tpg_base_enable_store+0x162/0x190 drivers/target/target_core_fabric_configfs.c:840
 flush_write_buffer fs/configfs/file.c:207 [inline]
 configfs_write_iter+0x302/0x4e0 fs/configfs/file.c:229
 new_sync_write fs/read_write.c:595 [inline]
 vfs_write+0x6ac/0x1050 fs/read_write.c:687
 ksys_write+0x12a/0x250 fs/read_write.c:739
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0x115/0x870 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f72db79e019
Code: ff c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 44 00 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 e8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007f72dc5e0028 EFLAGS: 00000246 ORIG_RAX: 0000000000000001
RAX: ffffffffffffffda RBX: 00007f72dba25fa0 RCX: 00007f72db79e019
RDX: 0000000000000001 RSI: 00002000000009c0 RDI: 0000000000000007
RBP: 00007f72db83500c R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000000
R13: 00007f72dba26038 R14: 00007f72dba25fa0 R15: 00007ffdfd368f88
 </TASK>
UDC core: g1: couldn't find an available UDC or it's busy


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

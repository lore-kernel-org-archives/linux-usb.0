Received: from mail-oi1-f206.google.com (mail-oi1-f206.google.com [209.85.167.206])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D10131E1A17
	for <linux-usb@vger.kernel.org>; Tue, 11 Aug 2026 00:14:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.206
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786407268; cv=none; b=tEGsB29a5p9X1ILfBZp35k3f6w8l3e+UfEDrwLXlP1SD7wccU51s+hnfEgGTjRN/Z51rCODTj01XEbfb61/ebclmr1OgFdwIAoYzVjbRCexSG8QJiq9/yweMuQM5qxvNC7dBJwkEEPY/uHbsUKhiN271eWzwyR2dhGHxe6rcnqM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786407268; c=relaxed/simple;
	bh=gz4RyILnulj9xPfL4OEuh7VKBE5cWIOF+2qlJL+T5d4=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=UTDFBlnN3eVwZs3gmP+4YhiCbTi1pleWAaocREcI+cvUvwuhA3XDifiYSofavnK/RPbzo+kXJ2FR8O+QJKRANQatGoOBYbgPxmRiYn0dr/9st6f6bJrOohGRLhfJOwnOwhunrELHCKw4pBHYQlZJZM6xdrx+R0cib7Ql+u6Q2Js=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.206
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f206.google.com with SMTP id 5614622812f47-49d4cb3ca23so319754b6e.3
        for <linux-usb@vger.kernel.org>; Mon, 10 Aug 2026 17:14:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786407266; x=1787012066;
        h=content-type:to:from:subject:message-id:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5bjezZNh48fB+8fPlZk9URIPiyG3q31cFfVALiVOB68=;
        b=I5009NY6s4Bh6Qubw+EuDptEhGUqEQKz2LUETEHjnIz1XyMop86f2HyIKKs82JUR1K
         Sgm9jnizUPuyV09Mr11zs17sxkwALxAvfgAadf0FEZe5UaNA2rH3jLQKfl0kLu7VX8zt
         FvcIsZZ2adHcqRNM1FQL2ZqYxgzPoB5e/RthYuxzMhj3xLUtBr7pnJnBS8MsfVtLOAcO
         Buu/QWiAnq3WZ9xWKQC/OL1qGmrfUu29sRDoiJIkL579ARE6wMO8o9GatF1R7+010UHH
         woQXAkbPhiRmsMU78DLohmug2WkMFLyD7ja1EnVVDR29vzS9EXq0YwFRmNBnQL3fO3mq
         M8WQ==
X-Forwarded-Encrypted: i=1; AHgh+Rq8dhWyChqWDgePsWagdMAw0LR9FPmau+pz57tuvEmdp4qM0SpLBZkl9gAQ0ri6/O2E+idwzMZddfw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy1OGQqz6W4W4yIVzt+KwEQzQJW435MzO4vbtkZTVxiFgViMZsk
	t7l3jQJFyBxkx6lhUGLiui0N0C+Ifclzx23nPGbi8IGp051xJjH5M1llr7uaySfp74m0AF6fYgU
	cmRaFAsWqjPY4717il5bmVxsvnmLnIY6+IVJHo7zhM0HG3TMMgNUWGkPCrSk=
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:c188:b0:4a4:a930:1f76 with SMTP id
 5614622812f47-4afadf3495bmr24750705b6e.11.1786407265802; Mon, 10 Aug 2026
 17:14:25 -0700 (PDT)
Date: Mon, 10 Aug 2026 17:14:25 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6a7a6961.9c11d2ce.289b96.00f7.GAE@google.com>
Subject: [syzbot] [usb?] possible deadlock in uvcg_extension_b_num_controls_store
From: syzbot <syzbot+b3b2d03ceb8dac0b1480@syzkaller.appspotmail.com>
To: gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    0d8395707651 Merge tag 'soc-fixes-7.2-2' of git://git.kern..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=126d729e580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=145fa60d73086782
dashboard link: https://syzkaller.appspot.com/bug?extid=b3b2d03ceb8dac0b1480
compiler:       gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image (non-bootable): https://storage.googleapis.com/syzbot-assets/d900f083ada3/non_bootable_disk-0d839570.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/0b7275b6c889/vmlinux-0d839570.xz
kernel image: https://storage.googleapis.com/syzbot-assets/b752a676c1dd/bzImage-0d839570.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+b3b2d03ceb8dac0b1480@syzkaller.appspotmail.com

WARNING: possible circular locking dependency detected
syzkaller #0 Tainted: G             L     
------------------------------------------------------
syz.0.470/7146 is trying to acquire lock:
ffffffff901d0fe8 (gadget_subsys.su_mutex){+.+.}-{4:4}, at: uvcg_extension_b_num_controls_store+0x12b/0x230 drivers/usb/gadget/function/uvc_configfs.c:833

but task is already holding lock:
ffff88805a80dd70 (&p->frag_sem){++++}-{4:4}, at: flush_write_buffer fs/configfs/file.c:205 [inline]
ffff88805a80dd70 (&p->frag_sem){++++}-{4:4}, at: configfs_write_iter+0x218/0x4e0 fs/configfs/file.c:229

which lock already depends on the new lock.


the existing dependency chain (in reverse order) is:

-> #3 (&p->frag_sem){++++}-{4:4}:
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
       __do_sys_mkdirat fs/namei.c:5330 [inline]
       __se_sys_mkdirat fs/namei.c:5327 [inline]
       __x64_sys_mkdirat+0x89/0xc0 fs/namei.c:5327
       do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
       do_syscall_64+0x115/0x870 arch/x86/entry/syscall_64.c:94
       entry_SYSCALL_64_after_hwframe+0x77/0x7f

-> #1 (&opts->dep_lock){+.+.}-{4:4}:
       lock_acquire kernel/locking/lockdep.c:5868 [inline]
       lock_acquire+0x1b9/0x370 kernel/locking/lockdep.c:5825
       __mutex_lock_common kernel/locking/mutex.c:646 [inline]
       __mutex_lock+0x1a4/0x1bd0 kernel/locking/mutex.c:821
       tcm_set_name+0x29/0xb0 drivers/usb/gadget/function/f_tcm.c:2669
       function_make+0x21c/0x3f0 drivers/usb/gadget/configfs.c:636
       configfs_mkdir+0x51e/0xb70 fs/configfs/dir.c:1360
       vfs_mkdir+0x361/0x850 fs/namei.c:5276
       filename_mkdirat+0x48b/0x5e0 fs/namei.c:5309
       __do_sys_mkdirat fs/namei.c:5330 [inline]
       __se_sys_mkdirat fs/namei.c:5327 [inline]
       __x64_sys_mkdirat+0x89/0xc0 fs/namei.c:5327
       do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
       do_syscall_64+0x115/0x870 arch/x86/entry/syscall_64.c:94
       entry_SYSCALL_64_after_hwframe+0x77/0x7f

-> #0 (gadget_subsys.su_mutex){+.+.}-{4:4}:
       check_prev_add+0xeb/0xe60 kernel/locking/lockdep.c:3165
       check_prevs_add kernel/locking/lockdep.c:3284 [inline]
       validate_chain kernel/locking/lockdep.c:3908 [inline]
       __lock_acquire+0x136c/0x1a40 kernel/locking/lockdep.c:5237
       lock_acquire kernel/locking/lockdep.c:5868 [inline]
       lock_acquire+0x1b9/0x370 kernel/locking/lockdep.c:5825
       __mutex_lock_common kernel/locking/mutex.c:646 [inline]
       __mutex_lock+0x1a4/0x1bd0 kernel/locking/mutex.c:821
       uvcg_extension_b_num_controls_store+0x12b/0x230 drivers/usb/gadget/function/uvc_configfs.c:833
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
  gadget_subsys.su_mutex --> &sb->s_type->i_mutex_key#24 --> &p->frag_sem

 Possible unsafe locking scenario:

       CPU0                    CPU1
       ----                    ----
  rlock(&p->frag_sem);
                               lock(&sb->s_type->i_mutex_key#24);
                               lock(&p->frag_sem);
  lock(gadget_subsys.su_mutex);

 *** DEADLOCK ***

4 locks held by syz.0.470/7146:
 #0: ffff88802c3c9270 (&f->f_pos_lock){+.+.}-{4:4}, at: fdget_pos+0x2aa/0x380 fs/file.c:1259
 #1: ffff8880237ce450 (sb_writers#13){.+.+}-{0:0}, at: ksys_write+0x12a/0x250 fs/read_write.c:739
 #2: ffff888048879080 (&buffer->mutex#2){+.+.}-{4:4}, at: configfs_write_iter+0x76/0x4e0 fs/configfs/file.c:226
 #3: ffff88805a80dd70 (&p->frag_sem){++++}-{4:4}, at: flush_write_buffer fs/configfs/file.c:205 [inline]
 #3: ffff88805a80dd70 (&p->frag_sem){++++}-{4:4}, at: configfs_write_iter+0x218/0x4e0 fs/configfs/file.c:229

stack backtrace:
CPU: 0 UID: 0 PID: 7146 Comm: syz.0.470 Tainted: G             L      syzkaller #0 PREEMPT(full) 
Tainted: [L]=SOFTLOCKUP
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
 uvcg_extension_b_num_controls_store+0x12b/0x230 drivers/usb/gadget/function/uvc_configfs.c:833
 flush_write_buffer fs/configfs/file.c:207 [inline]
 configfs_write_iter+0x302/0x4e0 fs/configfs/file.c:229
 new_sync_write fs/read_write.c:595 [inline]
 vfs_write+0x6ac/0x1050 fs/read_write.c:687
 ksys_write+0x12a/0x250 fs/read_write.c:739
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0x115/0x870 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7fab6139e0d9
Code: ff c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 44 00 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 e8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007fab621bd028 EFLAGS: 00000246 ORIG_RAX: 0000000000000001
RAX: ffffffffffffffda RBX: 00007fab61625fa0 RCX: 00007fab6139e0d9
RDX: 0000000000000002 RSI: 0000200000000280 RDI: 0000000000000005
RBP: 00007fab61435024 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000000
R13: 00007fab61626038 R14: 00007fab61625fa0 R15: 00007fff23ac2e08
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

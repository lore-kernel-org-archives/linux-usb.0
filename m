Received: from mail-oa1-f78.google.com (mail-oa1-f78.google.com [209.85.160.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC7C346A610
	for <linux-usb@vger.kernel.org>; Tue,  4 Aug 2026 14:57:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.78
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785855452; cv=none; b=RbrSyFjG1Rk+ZX1wwDl5zlDQ5JZfW6GfdqRHpZh+7ywfPpUuATo2WgugIvehH1/wkAi2KweLSTocVfH7BQLoSmDryF++kiiKnMXvGgjnyuR2f9L3lU45X7INmQng/fQngP2kjsXltfddE6hYrZqLQjkDzixSJCFUbG1WnBjvet0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785855452; c=relaxed/simple;
	bh=rMAF4XU07HFKncfc17A7M0Elt6/Pslo/OhRfEW+p9GM=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=Fkz7QA8GWD4VsVL3T63bzqwyJUE+3xwdQcTyIZ1PvAyd5o6FM9D9BiH+mPzUDKPgPpDcYiDS8o+zRJpvudCgB/fDQ+6/5mUlCHr37qxmYYOE5rQavwDmkgU2ejmy9jTnRfGy0dMtV8t5H4rCQM9IdymQ6EbYTtg0sP0GLO8XXfM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.160.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oa1-f78.google.com with SMTP id 586e51a60fabf-44aeefa1c36so2341226fac.3
        for <linux-usb@vger.kernel.org>; Tue, 04 Aug 2026 07:57:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785855443; x=1786460243;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=PsskWs2jCqD12KdY8/UEuILCIAav0xujzhiNwH++F4U=;
        b=p8IQkps6lI1vir1c+wb7gYmOV6WSnOgARYCrm+0mqzicSoklUzU++bX0yb2+ztnyrh
         m1ccO9hMtwlf19+KT/r55Vap68/o96p196Aw3VP+3Kt0D526BotHbFN7oYkSTJkJkOfh
         n/cd+bcx/DU6xNYCKZ6Ia5N280+SVZkZeyvjXFPYVCG8ZCGyfYRCcoFYwArRCVZbacCM
         ZvGWm/T+xLftFDyGLJcNGGGiacwiC7GVNyo9SOayNbjleIYYUEJoIKEFAArqa2G4jf5k
         zoKID5e2eocwKu9JaKKXuf3ktngyfPDM4/IXm17tuT62kUDMJej0IPNHSr0rqIufMKWW
         Dx1A==
X-Forwarded-Encrypted: i=1; AHgh+RqIm289lDs8FLjBKQW1Ds5Du8LmA+oZm0yaTC6vjXBrv2o1cVT2qcmyw8+eaqLD+QHONxREQyiv7yg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw20BgIJk2TfpGHYhhKnMPzXtN5lA6OtvCRre51JBF4N++c57Bp
	FjXrx50B+vwNJMSu+P4Lv6fX1LkcZiWuKfn4pK1u4aWUSBhwa1sPqY6bDqmiG3FIXbog48lOSEE
	VtM4I/2tZ7MemAbCo+Nqo9hsT57oeHmmxWzkLRhPmdmeXdyeoi96hVwLU/To=
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:8587:20b0:6a1:963d:a040 with SMTP id
 006d021491bc7-6ae4319060amr14332716eaf.2.1785855443228; Tue, 04 Aug 2026
 07:57:23 -0700 (PDT)
Date: Tue, 04 Aug 2026 07:57:23 -0700
In-Reply-To: <6a7071f9.f794c993.27aeb.002f.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6a71fdd3.13623e66.bdc14.0017.GAE@google.com>
Subject: Re: [syzbot] [usb?] possible deadlock in tcm_alloc
From: syzbot <syzbot+2799146a53c356f8017d@syzkaller.appspotmail.com>
To: gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

syzbot has found a reproducer for the following issue on:

HEAD commit:    848acc8ffe1b Merge tag 'fsverity-for-linus' of git://git.k..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=176213b9580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=145fa60d73086782
dashboard link: https://syzkaller.appspot.com/bug?extid=2799146a53c356f8017d
compiler:       gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=17e5be32580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=17639bb9580000

Downloadable assets:
disk image (non-bootable): https://storage.googleapis.com/syzbot-assets/d900f083ada3/non_bootable_disk-848acc8f.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/6fb497cc0c8d/vmlinux-848acc8f.xz
kernel image: https://storage.googleapis.com/syzbot-assets/663ccee34982/bzImage-848acc8f.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+2799146a53c356f8017d@syzkaller.appspotmail.com

======================================================
WARNING: possible circular locking dependency detected
syzkaller #0 Not tainted
------------------------------------------------------
syz.0.17/5925 is trying to acquire lock:
ffffffff90253240 (tpg_instances_lock){+.+.}-{4:4}, at: tcm_alloc+0x20/0x440 drivers/usb/gadget/function/f_tcm.c:2733

but task is already holding lock:
ffff88802e43c390 (&gi->lock){+.+.}-{4:4}, at: config_usb_cfg_link+0x57/0x3a0 drivers/usb/gadget/configfs.c:439

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

-> #2 (&sb->s_type->i_mutex_key#24){+.+.}-{4:4}:
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
       usbg_make_tpg+0x1a4/0x620 drivers/usb/gadget/function/f_tcm.c:1678
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

3 locks held by syz.0.17/5925:
 #0: ffff888023820450 (sb_writers#13){.+.+}-{0:0}, at: filename_create+0x10d/0x400 fs/namei.c:4948
 #1: ffff8880403dac00 (&sb->s_type->i_mutex_key#24){+.+.}-{4:4}, at: inode_lock include/linux/fs.h:1024 [inline]
 #1: ffff8880403dac00 (&sb->s_type->i_mutex_key#24){+.+.}-{4:4}, at: configfs_symlink+0x3c0/0x11f0 fs/configfs/symlink.c:186
 #2: ffff88802e43c390 (&gi->lock){+.+.}-{4:4}, at: config_usb_cfg_link+0x57/0x3a0 drivers/usb/gadget/configfs.c:439

stack backtrace:
CPU: 1 UID: 0 PID: 5925 Comm: syz.0.17 Not tainted syzkaller #0 PREEMPT(full) 
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
RIP: 0033:0x7f71ccb9e019
Code: ff c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 44 00 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 e8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007ffc4ccd6728 EFLAGS: 00000246 ORIG_RAX: 000000000000010a
RAX: ffffffffffffffda RBX: 00007f71cce25fa0 RCX: 00007f71ccb9e019
RDX: 00002000000009c0 RSI: ffffffffffffff9c RDI: 0000200000000980
RBP: 00007f71ccc3500c R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000000
R13: 00007f71cce25fac R14: 00007f71cce25fa0 R15: 00007f71cce25fa0
 </TASK>


---
If you want syzbot to run the reproducer, reply with:
#syz test: git://repo/address.git branch-or-commit-hash
If you attach or paste a git patch, syzbot will apply it before testing.

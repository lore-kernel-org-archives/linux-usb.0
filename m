Received: from mail-oi1-f205.google.com (mail-oi1-f205.google.com [209.85.167.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92CA73624B3
	for <linux-usb@vger.kernel.org>; Mon,  3 Aug 2026 09:41:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785750102; cv=none; b=ECnsU43gv0ED31sBsMMxzNuhxKQu5XybqADYHZd2r9xcJgyhjMsCCTB7BKku151ktXTsCcK7YKLMaRrL1Z5m/5LqDYgKuLtHsMQ4eJqyoV1CFD7YUakf9ODtGJdfiaJQqRs+qRmmJmVbU7UBepOA5PkQ0DY8ZhAmcu8xVRwnYxI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785750102; c=relaxed/simple;
	bh=GWoLS3JR2BjAtlYE9NF67+8KAuKp30MQFqQs0jMwl+U=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=uwYWrc+aBsel851X8UkEEp63BlEsbocTCJqv35FXFcDoSofgBP6wRXzBuGLzX1uGTccYK6GHo+MEbHWAitonyymAO9SfZcMtDG2Q+q5hGY3+dXbJ77tdWddT6fyfJDjJwHUJC8iRvHlwlmE8Dw1G8O8/8SPynkYdyPvwbJkr36I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f205.google.com with SMTP id 5614622812f47-4ab8b646492so5333896b6e.0
        for <linux-usb@vger.kernel.org>; Mon, 03 Aug 2026 02:41:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785750099; x=1786354899;
        h=content-type:to:from:subject:message-id:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Nwxzeh6S1z5V2JYWDkvreu3UktNKKoMubYOq8awqsZs=;
        b=bwsnhJamuIrwG/QZcY+Uj1gfxaQdqRniHyqJCgtm25t/FcFWAy3SusB4WXB0r6HHa1
         gTL8AWeN3+sQ9iM5JE16GVTqS65FURHVGZTBkJDyhKxvncOMhq5srgsazAZ1o1R9BgR6
         da3uKUFwouJVEL/LaikOqb4lNt5J1q3cJbL3j5gNWGt4+9nw4ld0reMZF/cWp/+HGFZO
         LA1rXjXanhSg3K+mdo4bVoKlkiO83c1PXrfdQdCAf+YppqT1fsH6+fWAAuxfXHrDuu3k
         /8+1wYtt1lIJUTltpY0PGtbGvjaRFxwhL4NwFocsRrIkRBUfOvmX2QJCxeBqg4EaH5NC
         szCQ==
X-Forwarded-Encrypted: i=1; AHgh+RrVKP+7YBfR44mQPCaC3EnNfNNagIQDBDm/w4/jO/HAIzKH7a0xGAn3iLAbBO5UDk+63zMVxggJ8F8=@vger.kernel.org
X-Gm-Message-State: AOJu0YyZNTYg4KDtnVLN1jv6Qqfi+vHBpBtg3kAmWRHXnsh+p+wmfjdq
	/mLqA2bDirUQS2SGIpLSphA136SiILWLUcv/ZDWwwyzfomCsD+sxXq7rPQOwVCLY7aRaiHrif1r
	DbpoxAmCpJiXtVZnwMCjP/UhPI/jqdplw8RI6mHaBa1JWjmxTn6BktNeSmHI=
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:528f:b0:497:da47:df4d with SMTP id
 5614622812f47-4af5e2c596cmr15023358b6e.16.1785750099497; Mon, 03 Aug 2026
 02:41:39 -0700 (PDT)
Date: Mon, 03 Aug 2026 02:41:39 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6a706253.6ce73036.24301b.0026.GAE@google.com>
Subject: [syzbot] [usb?] possible deadlock in uvcg_extension_allow_link
From: syzbot <syzbot+b3410eb576b568216ae5@syzkaller.appspotmail.com>
To: gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    365f9c7a6b81 Merge branches 'for-next/core' and 'for-next/..
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git for-kernelci
console output: https://syzkaller.appspot.com/x/log.txt?x=14f3649e580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=72c97575381cec47
dashboard link: https://syzkaller.appspot.com/bug?extid=b3410eb576b568216ae5
compiler:       Debian clang version 22.1.8 (++20260613092233+e80beda6e255-1~exp1~20260613092250.77), Debian LLD 22.1.8
userspace arch: arm64
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=10b83632580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=15874aea580000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/eafe0adb7386/disk-365f9c7a.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/29422d607579/vmlinux-365f9c7a.xz
kernel image: https://storage.googleapis.com/syzbot-assets/98ca955a8b54/Image-365f9c7a.gz.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+b3410eb576b568216ae5@syzkaller.appspotmail.com

======================================================
WARNING: possible circular locking dependency detected
syzkaller #0 Not tainted
------------------------------------------------------
syz.0.18/4919 is trying to acquire lock:
ffff80008970de48 (gadget_subsys.su_mutex){+.+.}-{4:4}, at: uvcg_extension_allow_link+0x70/0x1f8 drivers/usb/gadget/function/uvc_configfs.c:1195

but task is already holding lock:
ffff0000f06efa40 (&sb->s_type->i_mutex_key#23){+.+.}-{4:4}, at: inode_lock include/linux/fs.h:1024 [inline]
ffff0000f06efa40 (&sb->s_type->i_mutex_key#23){+.+.}-{4:4}, at: configfs_symlink+0x394/0xde0 fs/configfs/symlink.c:186

which lock already depends on the new lock.


the existing dependency chain (in reverse order) is:

-> #2 (&sb->s_type->i_mutex_key#23){+.+.}-{4:4}:
       down_write+0x50/0xc0 kernel/locking/rwsem.c:1631
       inode_lock include/linux/fs.h:1024 [inline]
       configfs_depend_item_unlocked+0x154/0x344 fs/configfs/dir.c:1259
       usbg_make_tpg+0x230/0x4b4 drivers/usb/gadget/function/f_tcm.c:1686
       target_fabric_make_tpg+0x98/0x518 drivers/target/target_core_fabric_configfs.c:939
       configfs_mkdir+0x374/0x7d4 fs/configfs/dir.c:1360
       vfs_mkdir+0x2dc/0x464 fs/namei.c:5276
       filename_mkdirat+0x228/0x3f4 fs/namei.c:5309
       __do_sys_mkdirat fs/namei.c:5330 [inline]
       __se_sys_mkdirat fs/namei.c:5327 [inline]
       __arm64_sys_mkdirat+0x94/0xb8 fs/namei.c:5327
       __invoke_syscall arch/arm64/kernel/syscall.c:35 [inline]
       invoke_syscall+0x98/0x244 arch/arm64/kernel/syscall.c:49
       el0_svc_common+0xec/0x23c arch/arm64/kernel/syscall.c:121
       do_el0_svc+0x4c/0x5c arch/arm64/kernel/syscall.c:140
       el0_svc+0x64/0x260 arch/arm64/kernel/entry-common.c:736
       el0t_64_sync_handler+0x48/0x148 arch/arm64/kernel/entry-common.c:755
       el0t_64_sync+0x198/0x19c arch/arm64/kernel/entry.S:594

-> #1 (&opts->dep_lock){+.+.}-{4:4}:
       __mutex_lock_common kernel/locking/mutex.c:646 [inline]
       __mutex_lock+0x164/0xf14 kernel/locking/mutex.c:821
       mutex_lock_nested+0x24/0x30 kernel/locking/mutex.c:874
       tcm_set_name+0x34/0xd0 drivers/usb/gadget/function/f_tcm.c:2540
       function_make+0x18c/0x300 drivers/usb/gadget/configfs.c:636
       configfs_mkdir+0x374/0x7d4 fs/configfs/dir.c:1360
       vfs_mkdir+0x2dc/0x464 fs/namei.c:5276
       filename_mkdirat+0x228/0x3f4 fs/namei.c:5309
       __do_sys_mkdirat fs/namei.c:5330 [inline]
       __se_sys_mkdirat fs/namei.c:5327 [inline]
       __arm64_sys_mkdirat+0x94/0xb8 fs/namei.c:5327
       __invoke_syscall arch/arm64/kernel/syscall.c:35 [inline]
       invoke_syscall+0x98/0x244 arch/arm64/kernel/syscall.c:49
       el0_svc_common+0xec/0x23c arch/arm64/kernel/syscall.c:121
       do_el0_svc+0x4c/0x5c arch/arm64/kernel/syscall.c:140
       el0_svc+0x64/0x260 arch/arm64/kernel/entry-common.c:736
       el0t_64_sync_handler+0x48/0x148 arch/arm64/kernel/entry-common.c:755
       el0t_64_sync+0x198/0x19c arch/arm64/kernel/entry.S:594

-> #0 (gadget_subsys.su_mutex){+.+.}-{4:4}:
       check_prev_add kernel/locking/lockdep.c:3165 [inline]
       check_prevs_add kernel/locking/lockdep.c:3284 [inline]
       validate_chain kernel/locking/lockdep.c:3908 [inline]
       __lock_acquire+0x17c0/0x2ebc kernel/locking/lockdep.c:5237
       lock_acquire+0x140/0x364 kernel/locking/lockdep.c:5868
       __mutex_lock_common kernel/locking/mutex.c:646 [inline]
       __mutex_lock+0x164/0xf14 kernel/locking/mutex.c:821
       mutex_lock_nested+0x24/0x30 kernel/locking/mutex.c:874
       uvcg_extension_allow_link+0x70/0x1f8 drivers/usb/gadget/function/uvc_configfs.c:1195
       configfs_symlink+0x478/0xde0 fs/configfs/symlink.c:196
       vfs_symlink+0x16c/0x290 fs/namei.c:5660
       filename_symlinkat+0x18c/0x328 fs/namei.c:5685
       __do_sys_symlinkat fs/namei.c:5705 [inline]
       __se_sys_symlinkat fs/namei.c:5700 [inline]
       __arm64_sys_symlinkat+0xa8/0xd4 fs/namei.c:5700
       __invoke_syscall arch/arm64/kernel/syscall.c:35 [inline]
       invoke_syscall+0x98/0x244 arch/arm64/kernel/syscall.c:49
       el0_svc_common+0xec/0x23c arch/arm64/kernel/syscall.c:121
       do_el0_svc+0x4c/0x5c arch/arm64/kernel/syscall.c:140
       el0_svc+0x64/0x260 arch/arm64/kernel/entry-common.c:736
       el0t_64_sync_handler+0x48/0x148 arch/arm64/kernel/entry-common.c:755
       el0t_64_sync+0x198/0x19c arch/arm64/kernel/entry.S:594

other info that might help us debug this:

Chain exists of:
  gadget_subsys.su_mutex --> &opts->dep_lock --> &sb->s_type->i_mutex_key#23

 Possible unsafe locking scenario:

       CPU0                    CPU1
       ----                    ----
  lock(&sb->s_type->i_mutex_key#23);
                               lock(&opts->dep_lock);
                               lock(&sb->s_type->i_mutex_key#23);
  lock(gadget_subsys.su_mutex);

 *** DEADLOCK ***

2 locks held by syz.0.18/4919:
 #0: ffff0000c38e0450 (sb_writers#11){.+.+}-{0:0}, at: mnt_want_write+0x44/0x9c fs/namespace.c:494
 #1: ffff0000f06efa40 (&sb->s_type->i_mutex_key#23){+.+.}-{4:4}, at: inode_lock include/linux/fs.h:1024 [inline]
 #1: ffff0000f06efa40 (&sb->s_type->i_mutex_key#23){+.+.}-{4:4}, at: configfs_symlink+0x394/0xde0 fs/configfs/symlink.c:186

stack backtrace:
CPU: 0 UID: 0 PID: 4919 Comm: syz.0.18 Not tainted syzkaller #0 PREEMPT 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 07/02/2026
Call trace:
 show_stack+0x2c/0x3c arch/arm64/kernel/stacktrace.c:499 (C)
 __dump_stack+0x30/0x40 lib/dump_stack.c:94
 dump_stack_lvl+0xd8/0x12c lib/dump_stack.c:120
 dump_stack+0x1c/0x28 lib/dump_stack.c:129
 print_circular_bug+0x328/0x330 kernel/locking/lockdep.c:2043
 check_noncircular+0x158/0x174 kernel/locking/lockdep.c:2175
 check_prev_add kernel/locking/lockdep.c:3165 [inline]
 check_prevs_add kernel/locking/lockdep.c:3284 [inline]
 validate_chain kernel/locking/lockdep.c:3908 [inline]
 __lock_acquire+0x17c0/0x2ebc kernel/locking/lockdep.c:5237
 lock_acquire+0x140/0x364 kernel/locking/lockdep.c:5868
 __mutex_lock_common kernel/locking/mutex.c:646 [inline]
 __mutex_lock+0x164/0xf14 kernel/locking/mutex.c:821
 mutex_lock_nested+0x24/0x30 kernel/locking/mutex.c:874
 uvcg_extension_allow_link+0x70/0x1f8 drivers/usb/gadget/function/uvc_configfs.c:1195
 configfs_symlink+0x478/0xde0 fs/configfs/symlink.c:196
 vfs_symlink+0x16c/0x290 fs/namei.c:5660
 filename_symlinkat+0x18c/0x328 fs/namei.c:5685
 __do_sys_symlinkat fs/namei.c:5705 [inline]
 __se_sys_symlinkat fs/namei.c:5700 [inline]
 __arm64_sys_symlinkat+0xa8/0xd4 fs/namei.c:5700
 __invoke_syscall arch/arm64/kernel/syscall.c:35 [inline]
 invoke_syscall+0x98/0x244 arch/arm64/kernel/syscall.c:49
 el0_svc_common+0xec/0x23c arch/arm64/kernel/syscall.c:121
 do_el0_svc+0x4c/0x5c arch/arm64/kernel/syscall.c:140
 el0_svc+0x64/0x260 arch/arm64/kernel/entry-common.c:736
 el0t_64_sync_handler+0x48/0x148 arch/arm64/kernel/entry-common.c:755
 el0t_64_sync+0x198/0x19c arch/arm64/kernel/entry.S:594


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

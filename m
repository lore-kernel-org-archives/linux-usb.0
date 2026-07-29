Received: from mail-oa1-f78.google.com (mail-oa1-f78.google.com [209.85.160.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4881D125A0
	for <linux-usb@vger.kernel.org>; Wed, 29 Jul 2026 00:09:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.78
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785283767; cv=none; b=PgaQA5w4TRdVubPhIbbpYhnvoU5ObjVXaIHt30i3zvr17nXjTbdkqFt/+vK2XSma7ZJ65Awl3GMRZw+P6ftmRxMOjaTo/tO4CdXaUT2dtyL9AZphTPpsyTLl+nEWSUjGa7vxKwdqNHM2G14wU6FGUjHWaZxq4ptVbQLHOjKutR0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785283767; c=relaxed/simple;
	bh=mymrFFmfdaNisZ/BQLYHeO2mC0e+bT+w9hjr96S2GtI=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=djtLYYPgWOoTznaBVV7L48wDXJF/itpMAIIKdA41QE3rHusui/RzEqAcvb6ADiJVRfZ5QtV7Qzn7ugezOLSXNMIpEyVCfwWBx7HhA1eiHrwxFRqFW9pb6cGvlWxBA21TpPR5Vgx2wyLqtHYqkgjhlfkqorJSTwSfVL99c5hDkLE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.160.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oa1-f78.google.com with SMTP id 586e51a60fabf-456b5122c7cso1901880fac.1
        for <linux-usb@vger.kernel.org>; Tue, 28 Jul 2026 17:09:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785283765; x=1785888565;
        h=content-type:to:from:subject:message-id:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BwGX7c7rJExJbY+17jI7JSnqUL/QGXoKbkbyLRIDlfM=;
        b=BojSOU5PD4aKjCs7AEuOrFLcz696FbLgXpg0WNTTuZ6lLnavEY47OJALkvdqwx1t1v
         x1KToUP4nSYAZgFGpZ2WUenibcl+t0VBHkthDVMp6fQFHumpXzaQc7IotZw4Zl/WU6Gv
         YQov14sHvFX4/pP9VRjxi8WTf6T5PeKS91cTCzZTN/g8F2P71U1n4NroLWatNG7jneCC
         8eIIa1IDwq4NdPxstDLpn+TbkzXhccEhM0ISwqZDiimJUv38LiTQVq4gFUutc7BlEWW+
         q9ZIL1JrykNZeplVvSDqaZ5GU077PbU4aRCGBtXT+Sfl8Df3tWYSM/HTNyvFIFjx+mjh
         1W+A==
X-Forwarded-Encrypted: i=1; AHgh+Rp4BDvykWhfMdTY3XjJQQoihvZu168ZUMY283RT2qkmq1RmLwLfqft0nZUiS+bNoWX70Ba7jbNQiGc=@vger.kernel.org
X-Gm-Message-State: AOJu0YzVh8rmWx3mA3k3LLHoHhLNwWzOUzs5rUf+SXYQXILfqtMR0Fs2
	5a01PU78m2XDix+GFT9TIfRbDm6dJlD7+i3m+cqaf+lLPIxM+TfI5IqfxJGlJMs+aZ/CZkMJh90
	OgFZuLMNoFGTu+YuJ2ChEKS2XDNmxlGz/rZXXHCZ6MRCakF5/dZJAP49VBOw=
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:f13:b0:495:fd92:841f with SMTP id
 5614622812f47-4ad733b8878mr55318b6e.23.1785283764929; Tue, 28 Jul 2026
 17:09:24 -0700 (PDT)
Date: Tue, 28 Jul 2026 17:09:24 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6a6944b4.d9e86bb5.297b12.003c.GAE@google.com>
Subject: [syzbot] [usb?] possible deadlock in uvc_func_allow_link
From: syzbot <syzbot+8c0a48f6c8357c9da819@syzkaller.appspotmail.com>
To: gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    48a5a7ab8d6a Merge tag 'v7.2-rc4-smb3-client-fixes' of git..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=1198109e580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=145fa60d73086782
dashboard link: https://syzkaller.appspot.com/bug?extid=8c0a48f6c8357c9da819
compiler:       gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/1eb5b7aa9ec5/disk-48a5a7ab.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/965506e050aa/vmlinux-48a5a7ab.xz
kernel image: https://storage.googleapis.com/syzbot-assets/662778208054/bzImage-48a5a7ab.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+8c0a48f6c8357c9da819@syzkaller.appspotmail.com

======================================================
WARNING: possible circular locking dependency detected
syzkaller #0 Tainted: G             L     
------------------------------------------------------
syz.9.4116/22505 is trying to acquire lock:
ffffffff901cfe68 (gadget_subsys.su_mutex){+.+.}-{4:4}, at: uvc_func_allow_link+0x76/0x3f0 drivers/usb/gadget/function/uvc_configfs.c:3651

but task is already holding lock:
ffff888057290f80 (&sb->s_type->i_mutex_key#28){++++}-{4:4}, at: inode_lock include/linux/fs.h:1024 [inline]
ffff888057290f80 (&sb->s_type->i_mutex_key#28){++++}-{4:4}, at: configfs_symlink+0x3c0/0x11f0 fs/configfs/symlink.c:186

which lock already depends on the new lock.


the existing dependency chain (in reverse order) is:

-> #2 (&sb->s_type->i_mutex_key#28){++++}-{4:4}:
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
       tcm_set_name+0x29/0xb0 drivers/usb/gadget/function/f_tcm.c:2540
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
       uvc_func_allow_link+0x76/0x3f0 drivers/usb/gadget/function/uvc_configfs.c:3651
       configfs_symlink+0x540/0x11f0 fs/configfs/symlink.c:196
       vfs_symlink fs/namei.c:5660 [inline]
       vfs_symlink+0x178/0x4d0 fs/namei.c:5639
       filename_symlinkat+0x2a6/0x560 fs/namei.c:5685
       __do_sys_symlink fs/namei.c:5712 [inline]
       __se_sys_symlink fs/namei.c:5708 [inline]
       __x64_sys_symlink+0x79/0xb0 fs/namei.c:5708
       do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
       do_syscall_64+0x115/0x870 arch/x86/entry/syscall_64.c:94
       entry_SYSCALL_64_after_hwframe+0x77/0x7f

other info that might help us debug this:

Chain exists of:
  gadget_subsys.su_mutex --> &opts->dep_lock --> &sb->s_type->i_mutex_key#28

 Possible unsafe locking scenario:

       CPU0                    CPU1
       ----                    ----
  lock(&sb->s_type->i_mutex_key#28);
                               lock(&opts->dep_lock);
                               lock(&sb->s_type->i_mutex_key#28);
  lock(gadget_subsys.su_mutex);

 *** DEADLOCK ***

2 locks held by syz.9.4116/22505:
 #0: ffff88801e3b0450 (sb_writers#17){.+.+}-{0:0}, at: filename_create+0x10d/0x400 fs/namei.c:4948
 #1: ffff888057290f80 (&sb->s_type->i_mutex_key#28){++++}-{4:4}, at: inode_lock include/linux/fs.h:1024 [inline]
 #1: ffff888057290f80 (&sb->s_type->i_mutex_key#28){++++}-{4:4}, at: configfs_symlink+0x3c0/0x11f0 fs/configfs/symlink.c:186

stack backtrace:
CPU: 0 UID: 0 PID: 22505 Comm: syz.9.4116 Tainted: G             L      syzkaller #0 PREEMPT(full) 
Tainted: [L]=SOFTLOCKUP
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
 uvc_func_allow_link+0x76/0x3f0 drivers/usb/gadget/function/uvc_configfs.c:3651
 configfs_symlink+0x540/0x11f0 fs/configfs/symlink.c:196
 vfs_symlink fs/namei.c:5660 [inline]
 vfs_symlink+0x178/0x4d0 fs/namei.c:5639
 filename_symlinkat+0x2a6/0x560 fs/namei.c:5685
 __do_sys_symlink fs/namei.c:5712 [inline]
 __se_sys_symlink fs/namei.c:5708 [inline]
 __x64_sys_symlink+0x79/0xb0 fs/namei.c:5708
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0x115/0x870 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7ff24159de99
Code: ff c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 44 00 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 e8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007ff2423d2028 EFLAGS: 00000246 ORIG_RAX: 0000000000000058
RAX: ffffffffffffffda RBX: 00007ff241825fa0 RCX: 00007ff24159de99
RDX: 0000000000000000 RSI: 00002000000000c0 RDI: 0000200000000040
RBP: 00007ff241633eaf R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000000
R13: 00007ff241826038 R14: 00007ff241825fa0 R15: 00007ffd6dfc08d8
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

Received: from mail-oo1-f77.google.com (mail-oo1-f77.google.com [209.85.161.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63A5E275B1A
	for <linux-usb@vger.kernel.org>; Wed, 12 Aug 2026 00:11:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.77
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786493493; cv=none; b=nBJjWEm+YRoN46G0USIUv7zBDCujyt35I30VGzcVIhkihV70MWY74az1zEGjK0KB4RoFM/vW14i1gWNqkS0gzpNKUs84W1CRwHBP6y/tUXT+7SlDZkXQ7md0XDBZuxoeKoi1tNcJaANJo56u9uaH0X+K5zx0EX8JZW1y643iojA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786493493; c=relaxed/simple;
	bh=iE4smU7w8ZMp79o3IKoUG+vMgLdtsNJKR1olLSbzBnU=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=mgkG7CRWCvLTcGeaQ97si3zB8gSoDbfJz4GnSwvW+XYuJkVp594bDskQrjrzn0jg6waMLpmHzmSNGMf5GJ5UpF/axGKk/zOC9r5ySwyDgeafZb8SUk0LKbA7S4cOFpGyoPXzFQKjpm/To+wL+n8k00SoIy+4VcJyYTy/hz5KGE0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.161.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oo1-f77.google.com with SMTP id 006d021491bc7-6a344ad5c7bso296582eaf.3
        for <linux-usb@vger.kernel.org>; Tue, 11 Aug 2026 17:11:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786493489; x=1787098289;
        h=content-type:to:from:subject:message-id:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uLYecftGARmyFozL7otbqPAmKGZn/xdNkjkmoD7mr4E=;
        b=CrZizsyna2l7jZ9mim+KrPwfZm0VkU5LbmPlUHAXcBU0ewdF1RQkjULsRACxKbwgsV
         pQJSz+iLOEcFcQAizqATnHAa7UyELzsStfGLCKddm/GQ2NfgR67wAf6kX78X+OjGUf/T
         5lqen2Azp/sg99yEGA1m9ZXmvKL0mO3zV61h/QCEpjcc+xp/3EJSyviQL5JauUGnfbEQ
         WPZjDY5n1fExoLL3wmU+1pECWLVPAO6M5tnA6fBd4JEokOQ6boVWPwJhLSKxMt/FgzC+
         h3E3K/g6BvS3IIxD3zkNFyn+ZO8fo69KNCgoBQHD8KukcIHk/Kjiuf30CetxiYqojr0r
         zyoA==
X-Forwarded-Encrypted: i=1; AHgh+RqH1khl3hs/DA7fNxCcpE0sYWe21D8iu32gUiplNuoZqYOBR4nKvp7l+7Oan9cGNlrIWQRGApHobyk=@vger.kernel.org
X-Gm-Message-State: AOJu0YyILX4t5A4Io1UsTsiMig30Lom7yvOMFQu78rEdTvT4JmkVp9dD
	Ei/N0HfSB/CmyFZEVZUHTGKo1Y2vZ+nEbbpVEoaXgLds2LZDMlb/yrWlXEP7NphVTyNFbFGzFqg
	L4BKbEFUHb54giz4SKxKbTctWNukqnfRITXtdFIvTp4RjLD9VR5mF++EozTs=
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:1895:b0:6b0:589e:42f4 with SMTP id
 006d021491bc7-6b0b2858cc4mr622186eaf.20.1786493489648; Tue, 11 Aug 2026
 17:11:29 -0700 (PDT)
Date: Tue, 11 Aug 2026 17:11:29 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6a7bba31.3668565d.e8814.0009.GAE@google.com>
Subject: [syzbot] [usb?] possible deadlock in uvcg_default_output_i_terminal_show
From: syzbot <syzbot+a5ab3e09c246a659fe9c@syzkaller.appspotmail.com>
To: gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    0d8395707651 Merge tag 'soc-fixes-7.2-2' of git://git.kern..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=10ec7cc6580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=145fa60d73086782
dashboard link: https://syzkaller.appspot.com/bug?extid=a5ab3e09c246a659fe9c
compiler:       gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image (non-bootable): https://storage.googleapis.com/syzbot-assets/d900f083ada3/non_bootable_disk-0d839570.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/0b7275b6c889/vmlinux-0d839570.xz
kernel image: https://storage.googleapis.com/syzbot-assets/b752a676c1dd/bzImage-0d839570.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+a5ab3e09c246a659fe9c@syzkaller.appspotmail.com

======================================================
WARNING: possible circular locking dependency detected
syzkaller #0 Tainted: G             L     
------------------------------------------------------
syz.5.3720/17064 is trying to acquire lock:
ffffffff901d0fe8 (gadget_subsys.su_mutex){+.+.}-{4:4}, at: uvcg_default_output_i_terminal_show+0x49/0x180 drivers/usb/gadget/function/uvc_configfs.c:671

but task is already holding lock:
ffff888025961970 (&p->frag_sem){++++}-{4:4}, at: fill_read_buffer fs/configfs/file.c:66 [inline]
ffff888025961970 (&p->frag_sem){++++}-{4:4}, at: configfs_read_iter+0x346/0x6f0 fs/configfs/file.c:88

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

-> #0
 (
gadget_subsys.su_mutex){+.+.}-{4:4}:
       check_prev_add+0xeb/0xe60 kernel/locking/lockdep.c:3165
       check_prevs_add kernel/locking/lockdep.c:3284 [inline]
       validate_chain kernel/locking/lockdep.c:3908 [inline]
       __lock_acquire+0x136c/0x1a40 kernel/locking/lockdep.c:5237
       lock_acquire kernel/locking/lockdep.c:5868 [inline]
       lock_acquire+0x1b9/0x370 kernel/locking/lockdep.c:5825
       __mutex_lock_common kernel/locking/mutex.c:646 [inline]
       __mutex_lock+0x1a4/0x1bd0 kernel/locking/mutex.c:821
       uvcg_default_output_i_terminal_show+0x49/0x180 drivers/usb/gadget/function/uvc_configfs.c:671
       fill_read_buffer fs/configfs/file.c:68 [inline]
       configfs_read_iter+0x426/0x6f0 fs/configfs/file.c:88
       __kernel_read+0x397/0xad0 fs/read_write.c:532
       integrity_kernel_read+0x7e/0xb0 security/integrity/iint.c:28
       ima_calc_file_hash_tfm+0x25e/0x350 security/integrity/ima/ima_crypto.c:222
       ima_calc_file_hash+0x1e3/0x380 security/integrity/ima/ima_crypto.c:280
       ima_collect_measurement+0x94f/0xb30 security/integrity/ima/ima_api.c:300
       process_measurement+0xdfe/0x2350 security/integrity/ima/ima_main.c:425
       ima_file_check+0xc3/0x110 security/integrity/ima/ima_main.c:685
       security_file_post_open+0xc4/0x210 security/security.c:2755
       do_open fs/namei.c:4702 [inline]
       path_openat+0x985/0x4280 fs/namei.c:4863
       do_file_open+0x20e/0x430 fs/namei.c:4892
       do_sys_openat2+0x10f/0x1e0 fs/open.c:1368
       do_sys_open fs/open.c:1374 [inline]
       __do_sys_openat fs/open.c:1390 [inline]
       __se_sys_openat fs/open.c:1385 [inline]
       __x64_sys_openat+0x12d/0x210 fs/open.c:1385
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

3 locks held by syz.5.3720/17064:
 #0: ffff88802bcb8ab0 (&ima_iint_mutex_key[depth]){+.+.}-{4:4}, at: process_measurement+0x5ab/0x2350 security/integrity/ima/ima_main.c:319
 #1: ffff888053449c80 (&buffer->mutex){+.+.}-{4:4}, at: configfs_read_iter+0x79/0x6f0 fs/configfs/file.c:86
 #2: ffff888025961970 (&p->frag_sem){++++}-{4:4}, at: fill_read_buffer fs/configfs/file.c:66 [inline]
 #2: ffff888025961970 (&p->frag_sem){++++}-{4:4}, at: configfs_read_iter+0x346/0x6f0 fs/configfs/file.c:88

stack backtrace:
CPU: 1 UID: 0 PID: 17064 Comm: syz.5.3720 Tainted: G             L      syzkaller #0 PREEMPT(full) 
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
 uvcg_default_output_i_terminal_show+0x49/0x180 drivers/usb/gadget/function/uvc_configfs.c:671
 fill_read_buffer fs/configfs/file.c:68 [inline]
 configfs_read_iter+0x426/0x6f0 fs/configfs/file.c:88
 __kernel_read+0x397/0xad0 fs/read_write.c:532
 integrity_kernel_read+0x7e/0xb0 security/integrity/iint.c:28
 ima_calc_file_hash_tfm+0x25e/0x350 security/integrity/ima/ima_crypto.c:222
 ima_calc_file_hash+0x1e3/0x380 security/integrity/ima/ima_crypto.c:280
 ima_collect_measurement+0x94f/0xb30 security/integrity/ima/ima_api.c:300
 process_measurement+0xdfe/0x2350 security/integrity/ima/ima_main.c:425
 ima_file_check+0xc3/0x110 security/integrity/ima/ima_main.c:685
 security_file_post_open+0xc4/0x210 security/security.c:2755
 do_open fs/namei.c:4702 [inline]
 path_openat+0x985/0x4280 fs/namei.c:4863
 do_file_open+0x20e/0x430 fs/namei.c:4892
 do_sys_openat2+0x10f/0x1e0 fs/open.c:1368
 do_sys_open fs/open.c:1374 [inline]
 __do_sys_openat fs/open.c:1390 [inline]
 __se_sys_openat fs/open.c:1385 [inline]
 __x64_sys_openat+0x12d/0x210 fs/open.c:1385
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0x115/0x870 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7fb58099e0d9
Code: ff c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 44 00 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 e8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007fb581891028 EFLAGS: 00000246 ORIG_RAX: 0000000000000101
RAX: ffffffffffffffda RBX: 00007fb580c25fa0 RCX: 00007fb58099e0d9
RDX: 0000000000000000 RSI: 0000200000000800 RDI: ffffffffffffff9c
RBP: 00007fb580a35024 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000000
R13: 00007fb580c26038 R14: 00007fb580c25fa0 R15: 00007ffec8a97b18
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

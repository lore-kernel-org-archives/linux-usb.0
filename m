Received: from mail-ot1-f77.google.com (mail-ot1-f77.google.com [209.85.210.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECB9B44C519
	for <linux-usb@vger.kernel.org>; Thu, 13 Aug 2026 11:09:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.77
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786619373; cv=none; b=hqQpy+6vkbzz7VkOuBNDUoUNMV8HD46GqocBL6V5feFY2FB0d1zL+l8NuqhBe9lV6ton0Ln4K+cUeP8T2JnyjSLbVgO1Xa8vwoJQrUh6qIDmxdICRCaP8UitCq6Mh6s7fNiTzMXkVB7v/ry+nkLYwIpKG/8cOxRskq4xQF4Qum0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786619373; c=relaxed/simple;
	bh=nklSGYzTFrEXRqDIC+vzeix++hNvYLxyahLpOEON5Xw=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=RdgBo/BMxG/KgzHu3oOWEALBLInmwwAGa7+5nCk+j+FUmECzLEIzHTM5CbOApMtV+WpAXuWw+W6+dSYdQkr7z2VpagYpoEeZwsTJZAkpG7cW0+EsSQ4zvV7lET1qjuTC8KOsk7SYtPzfq+IbzbyV+M/REpBSt74Ni/He2SsT8Kc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.210.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-ot1-f77.google.com with SMTP id 46e09a7af769-7e6b73b3920so525906a34.0
        for <linux-usb@vger.kernel.org>; Thu, 13 Aug 2026 04:09:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786619367; x=1787224167;
        h=content-type:to:from:subject:message-id:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vvy2QSHbhCXFzvruiaDhQ4QiWYHFV4jhCjoYcqQ0lcs=;
        b=gxs3TpSvF/iRR93PHHN6ceTmypRURrMjhEEFhUMA+Pubuu1MtooDnxxDOW8PK5u7sP
         tEALEeV/pw+ZP2H+sMSbWaSzCDKmpPBdo9mqk8dv1MrrbA3QJpsZXIlgS3lNpe2LBLh1
         oUP3nkdHYSMTsKp7R5rIinRPBq3ME7c0wlCXI0BlEdQ78SAHcUwGmcHBH0t0bzn00dS+
         hFY/wa45wOfV6FVuiw1QCIPFOV7ThxY3i1OlYcTNQUKCjo/CVFtR5KSyUXsSn6RYq4NF
         JZTtxjxCb+I+vMFHkiK6sP7UMoEy62mtSxgTm5ZJ+nzQOzBIm+x6HqDTd+d4pGPS6GIx
         4GfA==
X-Forwarded-Encrypted: i=1; AHgh+Rqe0YyM0Qa15kCxdG/naTsjQfHcgka9vkNz+yIpXkHX3cqHF6ct2XCRhVdgXhnNcemfpMMemdAiJAk=@vger.kernel.org
X-Gm-Message-State: AOJu0YzVSOp1djKRmS3Kfi+w5g9tg6LUZxHtqp11t6NWfvsXfRfLjOB2
	MLplXE4TcrWenrc2Hg3eJ9XJzOt1FVaxx3x3pvWUQIOyec504ZQC2c2yALaOmYSVXXUHgNVm+I9
	TlLSVUFax7Pd6JMdyKzp0XQ0KAAIgZkiDypSP77FL8XGYH1bzCDlny7i/vSY=
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:3104:b0:6ae:a950:9faa with SMTP id
 006d021491bc7-6b0c4226407mr4203951eaf.10.1786619367550; Thu, 13 Aug 2026
 04:09:27 -0700 (PDT)
Date: Thu, 13 Aug 2026 04:09:27 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6a7da5e7.a2bb2777.31c27d.0018.GAE@google.com>
Subject: [syzbot] [usb?] possible deadlock in uvcg_frame_dw_frame_interval_store
From: syzbot <syzbot+b37b42183fe588ceeb88@syzkaller.appspotmail.com>
To: gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    06cf61899d64 Merge tag 'x86-urgent-2026-08-08' of git://gi..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=13484149580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=8a233ed2ce9a8096
dashboard link: https://syzkaller.appspot.com/bug?extid=b37b42183fe588ceeb88
compiler:       gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44
userspace arch: i386

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image (non-bootable): https://storage.googleapis.com/syzbot-assets/d900f083ada3/non_bootable_disk-06cf6189.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/1a9de4812597/vmlinux-06cf6189.xz
kernel image: https://storage.googleapis.com/syzbot-assets/e873dfe980ea/bzImage-06cf6189.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+b37b42183fe588ceeb88@syzkaller.appspotmail.com

======================================================
WARNING: possible circular locking dependency detected
syzkaller #0 Tainted: G             L     
------------------------------------------------------
syz.0.2631/16146 is trying to acquire lock:
ffffffff901cc668 (gadget_subsys.su_mutex){+.+.}-{4:4}, at: uvcg_frame_dw_frame_interval_store+0xdf/0x4b0 drivers/usb/gadget/function/uvc_configfs.c:2076

but task is already holding lock:
ffff8880275d5170 (&p->frag_sem){++++}-{4:4}, at: flush_write_buffer fs/configfs/file.c:205 [inline]
ffff8880275d5170 (&p->frag_sem){++++}-{4:4}, at: configfs_write_iter+0x218/0x4e0 fs/configfs/file.c:229

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
       __do_sys_unlinkat fs/namei.c:5613 [inline]
       __se_sys_unlinkat fs/namei.c:5606 [inline]
       __ia32_sys_unlinkat+0xf5/0x130 fs/namei.c:5606
       do_syscall_32_irqs_on arch/x86/entry/syscall_32.c:83 [inline]
       __do_fast_syscall_32+0xe7/0x970 arch/x86/entry/syscall_32.c:307
       do_fast_syscall_32+0x32/0x70 arch/x86/entry/syscall_32.c:332
       entry_SYSENTER_compat_after_hwframe+0x84/0x8e

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
       __ia32_sys_mkdir+0x6a/0x90 fs/namei.c:5333
       do_syscall_32_irqs_on arch/x86/entry/syscall_32.c:83 [inline]
       __do_fast_syscall_32+0xe7/0x970 arch/x86/entry/syscall_32.c:307
       do_fast_syscall_32+0x32/0x70 arch/x86/entry/syscall_32.c:332
       entry_SYSENTER_compat_after_hwframe+0x84/0x8e

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
       __do_sys_mkdir fs/namei.c:5336 [inline]
       __se_sys_mkdir fs/namei.c:5333 [inline]
       __ia32_sys_mkdir+0x6a/0x90 fs/namei.c:5333
       do_syscall_32_irqs_on arch/x86/entry/syscall_32.c:83 [inline]
       __do_fast_syscall_32+0xe7/0x970 arch/x86/entry/syscall_32.c:307
       do_fast_syscall_32+0x32/0x70 arch/x86/entry/syscall_32.c:332
       entry_SYSENTER_compat_after_hwframe+0x84/0x8e

-> #0 (gadget_subsys.su_mutex){+.+.}-{4:4}:
       check_prev_add+0xeb/0xe60 kernel/locking/lockdep.c:3165
       check_prevs_add kernel/locking/lockdep.c:3284 [inline]
       validate_chain kernel/locking/lockdep.c:3908 [inline]
       __lock_acquire+0x136c/0x1a40 kernel/locking/lockdep.c:5237
       lock_acquire kernel/locking/lockdep.c:5868 [inline]
       lock_acquire+0x1b9/0x370 kernel/locking/lockdep.c:5825
       __mutex_lock_common kernel/locking/mutex.c:646 [inline]
       __mutex_lock+0x1a4/0x1bd0 kernel/locking/mutex.c:821
       uvcg_frame_dw_frame_interval_store+0xdf/0x4b0 drivers/usb/gadget/function/uvc_configfs.c:2076
       flush_write_buffer fs/configfs/file.c:207 [inline]
       configfs_write_iter+0x302/0x4e0 fs/configfs/file.c:229
       new_sync_write fs/read_write.c:595 [inline]
       vfs_write+0x6ac/0x1050 fs/read_write.c:687
       ksys_write+0x12a/0x250 fs/read_write.c:739
       do_syscall_32_irqs_on arch/x86/entry/syscall_32.c:83 [inline]
       __do_fast_syscall_32+0xe7/0x970 arch/x86/entry/syscall_32.c:307
       do_fast_syscall_32+0x32/0x70 arch/x86/entry/syscall_32.c:332
       entry_SYSENTER_compat_after_hwframe+0x84/0x8e

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

4 locks held by syz.0.2631/16146:
 #0: ffff8880211ceb70 (&f->f_pos_lock){+.+.}-{4:4}, at: fdget_pos+0x2aa/0x380 fs/file.c:1259
 #1: ffff888022078450 (sb_writers#12){.+.+}-{0:0}, at: ksys_write+0x12a/0x250 fs/read_write.c:739
 #2: ffff888075cc2e80 (&buffer->mutex#2){+.+.}-{4:4}, at: configfs_write_iter+0x76/0x4e0 fs/configfs/file.c:226
 #3: ffff8880275d5170 (&p->frag_sem){++++}-{4:4}, at: flush_write_buffer fs/configfs/file.c:205 [inline]
 #3: ffff8880275d5170 (&p->frag_sem){++++}-{4:4}, at: configfs_write_iter+0x218/0x4e0 fs/configfs/file.c:229

stack backtrace:
CPU: 1 UID: 0 PID: 16146 Comm: syz.0.2631 Tainted: G             L      syzkaller #0 PREEMPT(full) 
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
 uvcg_frame_dw_frame_interval_store+0xdf/0x4b0 drivers/usb/gadget/function/uvc_configfs.c:2076
 flush_write_buffer fs/configfs/file.c:207 [inline]
 configfs_write_iter+0x302/0x4e0 fs/configfs/file.c:229
 new_sync_write fs/read_write.c:595 [inline]
 vfs_write+0x6ac/0x1050 fs/read_write.c:687
 ksys_write+0x12a/0x250 fs/read_write.c:739
 do_syscall_32_irqs_on arch/x86/entry/syscall_32.c:83 [inline]
 __do_fast_syscall_32+0xe7/0x970 arch/x86/entry/syscall_32.c:307
 do_fast_syscall_32+0x32/0x70 arch/x86/entry/syscall_32.c:332
 entry_SYSENTER_compat_after_hwframe+0x84/0x8e
RIP: 0023:0xf7f93fec
Code: Unable to access opcode bytes at 0xf7f93fc2.
RSP: 002b:00000000f545650c EFLAGS: 00000292 ORIG_RAX: 0000000000000004
RAX: ffffffffffffffda RBX: 0000000000000004 RCX: 0000000080000080
RDX: 000000000000000b RSI: 0000000000000000 RDI: 0000000000000000
RBP: 0000000000000000 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000000
R13: 0000000000000000 R14: 0000000000000000 R15: 0000000000000000
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

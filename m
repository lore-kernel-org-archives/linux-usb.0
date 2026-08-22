Received: from mail-oi1-f206.google.com (mail-oi1-f206.google.com [209.85.167.206])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CFF1383985
	for <linux-usb@vger.kernel.org>; Sat, 22 Aug 2026 07:43:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.206
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787384615; cv=none; b=L4YnRYmYc9I5wZ4+pzpO0M3JVIqSB9dzh6+TwOKvKWWPWlCGp5Q/iK7+pMEuyYxAzlAo+0Q/V4PlBHTqsunm3aj0Yda4Y0PRZ/LwMx+I0gxKf6Ss+Ug5J/iL9hPdsZ+KhcVNiDQQITFcR9uzU8IU4E+JMnOoTjeRfgvbI6IKX0Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787384615; c=relaxed/simple;
	bh=a9mJvrq+HvR00CgNkLvtHyB6onX6OrS/QHjoS2BE6TE=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=NJxZz0R8C0/O4TiIr6lJg52b+qEVsS1KJUIKj/1FeRWtiL0zlZr+cZ+wh7Ejwf++xXiMXTmALNJzb4huelg5Loj5JmefbAiELojmHZIp7QuPkqkQpWFn9bprEwg3i9dHy3WBvItikjOzFpSE1vocmUULEfUhc7II6Lq61UYQ0H8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.206
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f206.google.com with SMTP id 5614622812f47-4b28d8d1b76so1792913b6e.3
        for <linux-usb@vger.kernel.org>; Sat, 22 Aug 2026 00:43:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787384612; x=1787989412;
        h=content-type:to:from:subject:message-id:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VBM8AwhA/+hFxd38vBiy5LxT/7XliIFqy2GqcGFV16M=;
        b=hS7jUIfzix7bNRjfoCnwogLf1HrvsowOb47d6xXzCR7+9IReUYYYO8UGVlpHopkD11
         PLHDQnhoy+mqgf0g36dNQX9qrRWVgrctY56sLsg00Wr1m1OJibHyO3KEWKQtuxCpiF3e
         crNDSpCfHKHJ1xCVPq+KH2vjL1+cCKmtgL6pt4Ep1GxSlnJYiyUHyogx5IiEICTvkXhf
         ecGRD/iqDwZTJX4xmYSSGHU265Rxpdf9Gh4CBsOvUJDCsWreMBOhKpMb+l6+ZcXDVPqO
         nJaIH04/EL22F+XXAwg7TmWFhjxqFwTIpvX6ciwVjf2TzBf+5hID6ftGK15s9pstkmiY
         zQSw==
X-Forwarded-Encrypted: i=1; AHgh+Rqb6dUqM1GcvvT2jMQoGwXxJWrz4udEoKVkXQrWcx5+W8rcHcRNvrSAAlc3Zi/AfwqqR7KTujCe8n4=@vger.kernel.org
X-Gm-Message-State: AFuF++na57i0PMbML5dury+nlzFN8FXQc8V5pvFzL9c06e32DgaWeOW4
	smnV5zW3MNLwx96W1QpLAPAsA+Ja2N29nGcAP49NPA1B+gzwfUFl95ln/di84egrCXBuUY3Nutq
	QFKxp8eFl1plWwpQPq/AdF5y2UPf7MWPrBa8hahQMCFyPjI9bWBGzdLdYtYc=
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6809:1db:10b0:4a0:cf55:3cf0 with SMTP id
 5614622812f47-4b3062b3157mr5451133b6e.9.1787384612537; Sat, 22 Aug 2026
 00:43:32 -0700 (PDT)
Date: Sat, 22 Aug 2026 00:43:32 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6a895324.ae6ddae5.3da009.0053.GAE@google.com>
Subject: [syzbot] [usb?] possible deadlock in lookup_open
From: syzbot <syzbot+c39ae720fb00e7e6f14b@syzkaller.appspotmail.com>
To: gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    531ed942bb0d Merge tag 'fbdev-for-7.3-rc1' of git://git.ke..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=14d98179580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=ac80ca7ed8b5e2fa
dashboard link: https://syzkaller.appspot.com/bug?extid=c39ae720fb00e7e6f14b
compiler:       gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/6416befe19e7/disk-531ed942.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/1c4b8543f98e/vmlinux-531ed942.xz
kernel image: https://storage.googleapis.com/syzbot-assets/db9600966ac4/bzImage-531ed942.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+c39ae720fb00e7e6f14b@syzkaller.appspotmail.com

======================================================
WARNING: possible circular locking dependency detected
syzkaller #0 Tainted: G             L     
------------------------------------------------------
syz.1.6874/28240 is trying to acquire lock:
ffff8880493ca460 (sb_writers#6){.+.+}-{0:0}, at: lookup_open+0x150/0x1990 fs/namei.c:4451

but task is already holding lock:
ffff88802b876920 (&common->filesem){++++}-{4:4}, at: fsg_store_file+0x193/0x450 drivers/usb/gadget/function/storage_common.c:452

which lock already depends on the new lock.


the existing dependency chain (in reverse order) is:

-> #4 (&common->filesem){++++}-{4:4}:
       lock_acquire kernel/locking/lockdep.c:5886 [inline]
       lock_acquire+0x1b9/0x370 kernel/locking/lockdep.c:5843
       down_read+0x99/0x4c0 kernel/locking/rwsem.c:1574
       fsg_show_file+0x20/0x180 drivers/usb/gadget/function/storage_common.c:339
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
       do_open fs/namei.c:4839 [inline]
       path_openat+0x5cd/0x2440 fs/namei.c:5000
       do_file_open+0x20e/0x430 fs/namei.c:5029
       do_sys_openat2+0x10f/0x1e0 fs/open.c:1417
       do_sys_open fs/open.c:1423 [inline]
       __do_sys_openat fs/open.c:1439 [inline]
       __se_sys_openat fs/open.c:1434 [inline]
       __x64_sys_openat+0x12d/0x210 fs/open.c:1434
       do_syscall_x64 arch/x86/entry/syscall_64.c:61 [inline]
       do_syscall_64+0x123/0x790 arch/x86/entry/syscall_64.c:84
       entry_SYSCALL_64_after_hwframe+0x77/0x7f

-> #3 (&p->frag_sem){++++}-{4:4}:
       lock_acquire kernel/locking/lockdep.c:5886 [inline]
       lock_acquire+0x1b9/0x370 kernel/locking/lockdep.c:5843
       down_read+0x99/0x4c0 kernel/locking/rwsem.c:1574
       fill_read_buffer fs/configfs/file.c:66 [inline]
       configfs_read_iter+0x346/0x6f0 fs/configfs/file.c:88
       __kernel_read+0x397/0xad0 fs/read_write.c:532
       integrity_kernel_read+0x7e/0xb0 security/integrity/iint.c:28
       ima_calc_file_hash_tfm+0x25e/0x350 security/integrity/ima/ima_crypto.c:222
       ima_calc_file_hash+0x1e3/0x380 security/integrity/ima/ima_crypto.c:280
       ima_collect_measurement+0x94f/0xb30 security/integrity/ima/ima_api.c:300
       process_measurement+0xdfe/0x2350 security/integrity/ima/ima_main.c:425
       ima_file_check+0xc3/0x110 security/integrity/ima/ima_main.c:685
       security_file_post_open+0xc4/0x210 security/security.c:2755
       do_open fs/namei.c:4839 [inline]
       path_openat+0x5cd/0x2440 fs/namei.c:5000
       do_file_open+0x20e/0x430 fs/namei.c:5029
       do_sys_openat2+0x10f/0x1e0 fs/open.c:1417
       do_sys_open fs/open.c:1423 [inline]
       __do_sys_openat fs/open.c:1439 [inline]
       __se_sys_openat fs/open.c:1434 [inline]
       __x64_sys_openat+0x12d/0x210 fs/open.c:1434
       do_syscall_x64 arch/x86/entry/syscall_64.c:61 [inline]
       do_syscall_64+0x123/0x790 arch/x86/entry/syscall_64.c:84
       entry_SYSCALL_64_after_hwframe+0x77/0x7f

-> #2 (&buffer->mutex){+.+.}-{4:4}:
       lock_acquire kernel/locking/lockdep.c:5886 [inline]
       lock_acquire+0x1b9/0x370 kernel/locking/lockdep.c:5843
       __mutex_lock_common kernel/locking/mutex.c:646 [inline]
       __mutex_lock+0x1a4/0x1bc0 kernel/locking/mutex.c:821
       configfs_read_iter+0x79/0x6f0 fs/configfs/file.c:86
       __kernel_read+0x397/0xad0 fs/read_write.c:532
       integrity_kernel_read+0x7e/0xb0 security/integrity/iint.c:28
       ima_calc_file_hash_tfm+0x25e/0x350 security/integrity/ima/ima_crypto.c:222
       ima_calc_file_hash+0x1e3/0x380 security/integrity/ima/ima_crypto.c:280
       ima_collect_measurement+0x94f/0xb30 security/integrity/ima/ima_api.c:300
       process_measurement+0xdfe/0x2350 security/integrity/ima/ima_main.c:425
       ima_file_check+0xc3/0x110 security/integrity/ima/ima_main.c:685
       security_file_post_open+0xc4/0x210 security/security.c:2755
       do_open fs/namei.c:4839 [inline]
       path_openat+0x5cd/0x2440 fs/namei.c:5000
       do_file_open+0x20e/0x430 fs/namei.c:5029
       do_sys_openat2+0x10f/0x1e0 fs/open.c:1417
       do_sys_open fs/open.c:1423 [inline]
       __do_sys_openat fs/open.c:1439 [inline]
       __se_sys_openat fs/open.c:1434 [inline]
       __x64_sys_openat+0x12d/0x210 fs/open.c:1434
       do_syscall_x64 arch/x86/entry/syscall_64.c:61 [inline]
       do_syscall_64+0x123/0x790 arch/x86/entry/syscall_64.c:84
       entry_SYSCALL_64_after_hwframe+0x77/0x7f

-> #1 (&ima_iint_mutex_key[depth]){+.+.}-{4:4}:
       lock_acquire kernel/locking/lockdep.c:5886 [inline]
       lock_acquire+0x1b9/0x370 kernel/locking/lockdep.c:5843
       __mutex_lock_common kernel/locking/mutex.c:646 [inline]
       __mutex_lock+0x1a4/0x1bc0 kernel/locking/mutex.c:821
       ima_reset_action_flags security/integrity/ima/ima_main.c:708 [inline]
       ima_reset_action_flags security/integrity/ima/ima_main.c:697 [inline]
       ima_file_truncate+0xe6/0x190 security/integrity/ima/ima_main.c:723
       security_file_truncate+0xf9/0x1e0 security/security.c:2771
       handle_truncate fs/namei.c:4298 [inline]
       do_open fs/namei.c:4841 [inline]
       path_openat+0x1d7e/0x2440 fs/namei.c:5000
       do_file_open+0x20e/0x430 fs/namei.c:5029
       do_sys_openat2+0x10f/0x1e0 fs/open.c:1417
       do_sys_open fs/open.c:1423 [inline]
       __do_sys_openat fs/open.c:1439 [inline]
       __se_sys_openat fs/open.c:1434 [inline]
       __x64_sys_openat+0x12d/0x210 fs/open.c:1434
       do_syscall_x64 arch/x86/entry/syscall_64.c:61 [inline]
       do_syscall_64+0x123/0x790 arch/x86/entry/syscall_64.c:84
       entry_SYSCALL_64_after_hwframe+0x77/0x7f

-> #0 (sb_writers#6){.+.+}-{0:0}:
       check_prev_add+0xeb/0xe60 kernel/locking/lockdep.c:3181
       check_prevs_add kernel/locking/lockdep.c:3300 [inline]
       validate_chain kernel/locking/lockdep.c:3924 [inline]
       __lock_acquire+0x1492/0x1ec0 kernel/locking/lockdep.c:5253
       lock_acquire kernel/locking/lockdep.c:5886 [inline]
       lock_acquire+0x1b9/0x370 kernel/locking/lockdep.c:5843
       percpu_down_read_internal include/linux/percpu-rwsem.h:53 [inline]
       percpu_down_read_freezable include/linux/percpu-rwsem.h:83 [inline]
       __sb_start_write include/linux/fs/super.h:19 [inline]
       sb_start_write include/linux/fs/super.h:125 [inline]
       mnt_want_write+0x6f/0x420 fs/namespace.c:494
       lookup_open+0x150/0x1990 fs/namei.c:4451
       open_last_lookups fs/namei.c:4767 [inline]
       path_openat+0xa2c/0x2440 fs/namei.c:4997
       do_file_open+0x20e/0x430 fs/namei.c:5029
       file_open_name+0x1c3/0x3e0 fs/open.c:1375
       filp_open+0x2e/0x50 fs/open.c:1392
       fsg_lun_open+0x6b/0x7b0 drivers/usb/gadget/function/storage_common.c:194
       fsg_store_file+0x1e7/0x450 drivers/usb/gadget/function/storage_common.c:455
       flush_write_buffer fs/configfs/file.c:207 [inline]
       configfs_write_iter+0x302/0x4e0 fs/configfs/file.c:229
       new_sync_write fs/read_write.c:595 [inline]
       vfs_write+0x6af/0x1050 fs/read_write.c:687
       ksys_write+0x12a/0x250 fs/read_write.c:739
       do_syscall_x64 arch/x86/entry/syscall_64.c:61 [inline]
       do_syscall_64+0x123/0x790 arch/x86/entry/syscall_64.c:84
       entry_SYSCALL_64_after_hwframe+0x77/0x7f

other info that might help us debug this:

Chain exists of:
  sb_writers#6 --> &p->frag_sem --> &common->filesem

 Possible unsafe locking scenario:

       CPU0                    CPU1
       ----                    ----
  lock(&common->filesem);
                               lock(&p->frag_sem);
                               lock(&common->filesem);
  rlock(sb_writers#6);

 *** DEADLOCK ***

locks held by syz.1.6874/28240: 5, last CPU#1:
 #0: ffff88807b5895f0 (&f->f_pos_lock){+.+.}-{4:4}, at: fdget_pos+0x2aa/0x380 fs/file.c:1259
 #1: ffff88801e7c6460 (sb_writers#15){.+.+}-{0:0}, at: ksys_write+0x12a/0x250 fs/read_write.c:739
 #2: ffff888057321a80 (&buffer->mutex){+.+.}-{4:4}, at: configfs_write_iter+0x76/0x4e0 fs/configfs/file.c:226
 #3: ffff888027e93070 (&p->frag_sem){++++}-{4:4}, at: flush_write_buffer fs/configfs/file.c:205 [inline]
 #3: ffff888027e93070 (&p->frag_sem){++++}-{4:4}, at: configfs_write_iter+0x218/0x4e0 fs/configfs/file.c:229
 #4: ffff88802b876920 (&common->filesem){++++}-{4:4}, at: fsg_store_file+0x193/0x450 drivers/usb/gadget/function/storage_common.c:452

stack backtrace:
CPU: 1 UID: 0 PID: 28240 Comm: syz.1.6874 Tainted: G             L      syzkaller #0 PREEMPT(full) 
Tainted: [L]=SOFTLOCKUP
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 07/16/2026
Call Trace:
 <TASK>
 __dump_stack lib/dump_stack.c:94 [inline]
 dump_stack_lvl+0x100/0x190 lib/dump_stack.c:120
 print_circular_bug.cold+0x178/0x1be kernel/locking/lockdep.c:2059
 check_noncircular+0x146/0x160 kernel/locking/lockdep.c:2191
 check_prev_add+0xeb/0xe60 kernel/locking/lockdep.c:3181
 check_prevs_add kernel/locking/lockdep.c:3300 [inline]
 validate_chain kernel/locking/lockdep.c:3924 [inline]
 __lock_acquire+0x1492/0x1ec0 kernel/locking/lockdep.c:5253
 lock_acquire kernel/locking/lockdep.c:5886 [inline]
 lock_acquire+0x1b9/0x370 kernel/locking/lockdep.c:5843
 percpu_down_read_internal include/linux/percpu-rwsem.h:53 [inline]
 percpu_down_read_freezable include/linux/percpu-rwsem.h:83 [inline]
 __sb_start_write include/linux/fs/super.h:19 [inline]
 sb_start_write include/linux/fs/super.h:125 [inline]
 mnt_want_write+0x6f/0x420 fs/namespace.c:494
 lookup_open+0x150/0x1990 fs/namei.c:4451
 open_last_lookups fs/namei.c:4767 [inline]
 path_openat+0xa2c/0x2440 fs/namei.c:4997
 do_file_open+0x20e/0x430 fs/namei.c:5029
 file_open_name+0x1c3/0x3e0 fs/open.c:1375
 filp_open+0x2e/0x50 fs/open.c:1392
 fsg_lun_open+0x6b/0x7b0 drivers/usb/gadget/function/storage_common.c:194
 fsg_store_file+0x1e7/0x450 drivers/usb/gadget/function/storage_common.c:455
 flush_write_buffer fs/configfs/file.c:207 [inline]
 configfs_write_iter+0x302/0x4e0 fs/configfs/file.c:229
 new_sync_write fs/read_write.c:595 [inline]
 vfs_write+0x6af/0x1050 fs/read_write.c:687
 ksys_write+0x12a/0x250 fs/read_write.c:739
 do_syscall_x64 arch/x86/entry/syscall_64.c:61 [inline]
 do_syscall_64+0x123/0x790 arch/x86/entry/syscall_64.c:84
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7fd1a199e0d9
Code: ff c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 44 00 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 e8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007fd1a28c8028 EFLAGS: 00000246 ORIG_RAX: 0000000000000001
RAX: ffffffffffffffda RBX: 00007fd1a1c25fa0 RCX: 00007fd1a199e0d9
RDX: 0000000000000005 RSI: 00002000000003c0 RDI: 0000000000000004
RBP: 00007fd1a1a35024 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000000
R13: 00007fd1a1c26038 R14: 00007fd1a1c25fa0 R15: 00007ffc4e5fb158
 </TASK>
mass_storage.0/lun.0: unable to open backing file: file0


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

Received: from mail-oo1-f79.google.com (mail-oo1-f79.google.com [209.85.161.79])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9935613D539
	for <linux-usb@vger.kernel.org>; Thu, 13 Aug 2026 00:08:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.79
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786579716; cv=none; b=hJE9riMtG9v65XPMARyounfOWgeYRH4AmcmlfN9xsgaujE2jS3aBam9xyzejkkD6OuXzrVHFV0zZMlWY0SlsLgaOLSEZ+7x3t2x0rL6juJol8t+YBGUeYsquVWR4RjFTOjRN2TkRTisDaVIt3bMAOAzghAD6YEKzlUUFYGMAb6w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786579716; c=relaxed/simple;
	bh=9EbMNFwz+jBywKTs3Umqf6kQXWaNN0/SedVsIrlsQOM=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=WM//KW6DqMdP6ffj+qicn/P4yk570eQOIk31HgotRGe8ziE406F0GIBq/4uCcLhopXlodpdBYvOwuNIpKr0VaD5Q6Py385xlsCjOzWMMelUOnfEL7i46bFZdACunDBl3y19IU3og1me59cgQAOjOrWGCnTt51MTbBkiNS+4i7ZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.161.79
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oo1-f79.google.com with SMTP id 006d021491bc7-6acbcb92d31so1126229eaf.1
        for <linux-usb@vger.kernel.org>; Wed, 12 Aug 2026 17:08:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786579713; x=1787184513;
        h=content-type:to:from:subject:message-id:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ilWwyx6+AJPN6SCJ+8pSs3Yxjxu0RGf98MaguQhjz8k=;
        b=EgaRhuzXEnwDhk2PFH6+68o6YTSA2j9PQj1/O318FG/goVspQ/mfy07XqABNOcrLrX
         YQNn6AFpI13fJi53YCi+wBvfRf2Rs47l1cNFvvjHmORmRh6HHq9cPim7ess2lt7WO3pK
         wqkytyCBVCft5prmG/LWuPUySUncNVFW8AQN1OpyEgA+ZTsWtGFqJgVaBvzU9YZ35C01
         axhk41fGLZZOFgU9yvOF0mCix3D0+aBRFHdMt0G+Vb/N1XzWslgU4u8i1/TdmKmKdy+S
         cZz09lKNlS6EKEOMP3XStf5VXz0+RX65KYRNPpk7Vlj5/fuTrzq9nn4JaUMJN50R0Dlk
         h2CQ==
X-Forwarded-Encrypted: i=1; AHgh+RpWYJUN8EuvJYQTruJ0m6nDYMcLOECnF1c+cPbjjzEizWt+0IySVNyS8soHyb1wr3M8aRdMThw7iSs=@vger.kernel.org
X-Gm-Message-State: AOJu0YxC6gClrMbNZ8b8BqvKZOsJ2bQ4OUf5DJWKCThVgOtt6QfJhCIA
	Gb0C7Gix1p6Lv4pP6/f/xnEjefybfulw1ccsBf8v5AUOeOxb023t+w/RlaEu+MMosXf4+kViqC2
	VtV96QdososixUcgNjEcu29d7Sok1VtrXtb6/6vYSJuv2woq05cBjUIDj36U=
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:4b84:b0:6b0:1b82:89a3 with SMTP id
 006d021491bc7-6b0c42166ccmr2190526eaf.9.1786579713529; Wed, 12 Aug 2026
 17:08:33 -0700 (PDT)
Date: Wed, 12 Aug 2026 17:08:33 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6a7d0b01.3668565d.e8814.0018.GAE@google.com>
Subject: [syzbot] [usb?] possible deadlock in uvcg_extension_ba_source_id_show
From: syzbot <syzbot+caf0e2bd08dda787005d@syzkaller.appspotmail.com>
To: gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    a59f57e2aa12 Merge tag 'watchdog-for-v7.2-rc7' of git://gi..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=17bd6132580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=c44651ea7dd2f307
dashboard link: https://syzkaller.appspot.com/bug?extid=caf0e2bd08dda787005d
compiler:       gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/6e78675a9575/disk-a59f57e2.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/8214e30981cd/vmlinux-a59f57e2.xz
kernel image: https://storage.googleapis.com/syzbot-assets/44559008ddee/bzImage-a59f57e2.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+caf0e2bd08dda787005d@syzkaller.appspotmail.com

======================================================
WARNING: possible circular locking dependency detected
syzkaller #0 Tainted: G             L     
------------------------------------------------------
syz.6.7608/806 is trying to acquire lock:
ffffffff901c9de8 (gadget_subsys.su_mutex){+.+.}-{4:4}, at: uvcg_extension_ba_source_id_show+0x7c/0x310 drivers/usb/gadget/function/uvc_configfs.c:1018

but task is already holding lock:
ffff888029758570 (&p->frag_sem){++++}-{4:4}, at: fill_read_buffer fs/configfs/file.c:66 [inline]
ffff888029758570 (&p->frag_sem){++++}-{4:4}, at: configfs_read_iter+0x346/0x6f0 fs/configfs/file.c:88

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
       __x64_sys_unlinkat+0xf5/0x130 fs/namei.c:5606
       do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
       do_syscall_64+0x115/0x870 arch/x86/entry/syscall_64.c:94
       entry_SYSCALL_64_after_hwframe+0x77/0x7f

-> #2 (&sb->s_type->i_mutex_key#26){++++}-{4:4}:
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
       tcm_set_name+0x29/0xb0 drivers/usb/gadget/function/f_tcm.c:2669
       function_make+0x21c/0x3f0 drivers/usb/gadget/configfs.c:636
       configfs_mkdir+0x51e/0xb70 fs/configfs/dir.c:1360
       vfs_mkdir+0x361/0x850 fs/namei.c:5276
       filename_mkdirat+0x48b/0x5e0 fs/namei.c:5309
       __do_sys_mkdir fs/namei.c:5336 [inline]
       __se_sys_mkdir fs/namei.c:5333 [inline]
       __x64_sys_mkdir+0x6b/0x90 fs/namei.c:5333
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
       uvcg_extension_ba_source_id_show+0x7c/0x310 drivers/usb/gadget/function/uvc_configfs.c:1018
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
  gadget_subsys.su_mutex --> &sb->s_type->i_mutex_key#26 --> &p->frag_sem

 Possible unsafe locking scenario:

       CPU0                    CPU1
       ----                    ----
  rlock(&p->frag_sem);
                               lock(&sb->s_type->i_mutex_key#26);
                               lock(&p->frag_sem);
  lock(gadget_subsys.su_mutex);

 *** DEADLOCK ***

3 locks held by syz.6.7608/806:
 #0: ffff888076b259a8 (&ima_iint_mutex_key[depth]){+.+.}-{4:4}, at: process_measurement+0x5ab/0x2350 security/integrity/ima/ima_main.c:319
 #1: ffff888053486480 (&buffer->mutex){+.+.}-{4:4}, at: configfs_read_iter+0x79/0x6f0 fs/configfs/file.c:86
 #2: ffff888029758570 (&p->frag_sem){++++}-{4:4}, at: fill_read_buffer fs/configfs/file.c:66 [inline]
 #2: ffff888029758570 (&p->frag_sem){++++}-{4:4}, at: configfs_read_iter+0x346/0x6f0 fs/configfs/file.c:88

stack backtrace:
CPU: 1 UID: 0 PID: 806 Comm: syz.6.7608 Tainted: G             L      syzkaller #0 PREEMPT(full) 
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
 uvcg_extension_ba_source_id_show+0x7c/0x310 drivers/usb/gadget/function/uvc_configfs.c:1018
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
RIP: 0033:0x7f5bde79e0d9
Code: ff c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 44 00 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 e8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007f5bdf692028 EFLAGS: 00000246 ORIG_RAX: 0000000000000101
RAX: ffffffffffffffda RBX: 00007f5bdea25fa0 RCX: 00007f5bde79e0d9
RDX: 0000000000000002 RSI: 0000200000000240 RDI: ffffffffffffff9c
RBP: 00007f5bde835024 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000000
R13: 00007f5bdea26038 R14: 00007f5bdea25fa0 R15: 00007ffedc4f6578
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

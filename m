Received: from mail-oo1-f80.google.com (mail-oo1-f80.google.com [209.85.161.80])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B2023DAACA
	for <linux-usb@vger.kernel.org>; Sun, 16 Aug 2026 22:55:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.80
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786920939; cv=none; b=AWSABCxC4iLMFtpYtHo4Z4opU7fR5u+eHPGa3wChFAaqSLbXHRxneD9EibCuaSjOWo/NV6CGcOAaxagMLTb73OHO3BweYe01s8GjmSxsWdcNzGBLJrhI06ckpRLVXeWMEsOQ05VU5XyoiI+Oh+4rInatRVJRlThhYl6JzSWTnf0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786920939; c=relaxed/simple;
	bh=y2H4SEeF/bKIKydcr23vgxWgm76r1P1faOiDVRGbSiw=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=KhCeEnkyiMjXhM+4I4XKzXl4hBGRjCiy3IhRRCK/rehn55vrSp+SFvwLKaOuEvplZiyvZg8NHA22eX1Kl4iCb8QTRexg1+qgOaZVCArYHsV5BXYQ+RC9GhenseaGHPj/mA0/fgz5BAHdwP3Ei3uzB1Eb9yhubyx5A0UzA6kTIgI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.161.80
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oo1-f80.google.com with SMTP id 006d021491bc7-6b0597e2448so2619418eaf.1
        for <linux-usb@vger.kernel.org>; Sun, 16 Aug 2026 15:55:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786920936; x=1787525736;
        h=content-type:to:from:subject:message-id:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=P6L3hKIMQV4U9Rer7JezzflN480P8gMHIInule45P1s=;
        b=GplWfi4ziGHY5qa8eP+3revrRg1dB3xbHpNd/aYhOcI7hCqYwZTtoyvTqczYZLwKrX
         Yq9ioM0p0FGFz3wrHzJ8igaLBRI1KYgt3LDhfE3yg9al22LiUHcozNys072hb1T9N3Yk
         Osjpl05AxOyfxbVQUdULZiP2HCwxU3ZHm5JQ8zdFDe+D8Isg1u/2xR21+VcyVuPHD+iS
         f7BE2U1JM9HAoav3gce6S7Eof6vDCMqs5YFubX2ceIQRxy3Vo3PQR9aGwv4AzPrLkVnh
         2LrcYHEtHeibkEiksu1eH7t2F0AyXU/TlubJX1yhq5nujKmEo2kZIoh8dLjVFnn8lVs7
         LBaQ==
X-Forwarded-Encrypted: i=1; AHgh+RoFBdQJ4c28bjyg7xsc/vDtJHIJmaLXPumiqYNBZrXFxqFeBd9BQWdQUxTDd+l+e/o+AML3+ogf0XA=@vger.kernel.org
X-Gm-Message-State: AOJu0YzEpXU8EKtzf02NhI7B7DgHi394L0tnZbtE78mUe6HswGtykz+O
	vDKWihsy/JM5l4RhBV5iF6SPttk2q1wrHHMQDoWAZInOneY7fOvvV3t5zxZfGZERbWekyhKxO1L
	9B0p0haY4totd/XE6hNxxAOUkF9jtqwZuqvya8R8s3d+T2t4KDKLW8s6c4n0=
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a4a:edc9:0:b0:6a3:7af2:90ef with SMTP id
 006d021491bc7-6b0d5fdc3a6mr20789253eaf.6.1786920936484; Sun, 16 Aug 2026
 15:55:36 -0700 (PDT)
Date: Sun, 16 Aug 2026 15:55:36 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6a823fe8.dbb3a75c.20434b.003a.GAE@google.com>
Subject: [syzbot] [usb?] INFO: trying to register non-static key in gadget_dev_open
From: syzbot <syzbot+36c086b1f7dd613facf2@syzkaller.appspotmail.com>
To: gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    3d6d817622b0 Merge tag 'scsi-fixes' of git://git.kernel.or..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=120ccc79580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=c44651ea7dd2f307
dashboard link: https://syzkaller.appspot.com/bug?extid=36c086b1f7dd613facf2
compiler:       gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image (non-bootable): https://storage.googleapis.com/syzbot-assets/d900f083ada3/non_bootable_disk-3d6d8176.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/f486efba4dfc/vmlinux-3d6d8176.xz
kernel image: https://storage.googleapis.com/syzbot-assets/9b9dcf9ee9f3/bzImage-3d6d8176.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+36c086b1f7dd613facf2@syzkaller.appspotmail.com

INFO: trying to register non-static key.
The code is fine but needs lockdep annotation, or maybe
you didn't initialize this object before use?
turning off the locking correctness validator.
CPU: 2 UID: 0 PID: 6814 Comm: syz.1.321 Not tainted syzkaller #0 PREEMPT(full) 
Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.3-debian-1.16.3-2 04/01/2014
Call Trace:
 <TASK>
 __dump_stack lib/dump_stack.c:94 [inline]
 dump_stack_lvl+0x100/0x190 lib/dump_stack.c:120
 assign_lock_key kernel/locking/lockdep.c:984 [inline]
 register_lock_class+0x549/0x560 kernel/locking/lockdep.c:1299
 __lock_acquire+0x3d7/0x1a40 kernel/locking/lockdep.c:5112
 lock_acquire kernel/locking/lockdep.c:5868 [inline]
 lock_acquire+0x1b9/0x370 kernel/locking/lockdep.c:5825
 __raw_spin_lock_irq include/linux/spinlock_api_smp.h:142 [inline]
 _raw_spin_lock_irq+0x36/0x50 kernel/locking/spinlock.c:174
 spin_lock_irq include/linux/spinlock.h:372 [inline]
 gadget_dev_open+0x44/0x1b0 drivers/usb/gadget/legacy/inode.c:1919
 do_dentry_open+0x6ab/0x14d0 fs/open.c:947
 vfs_open+0x82/0x3f0 fs/open.c:1052
 do_open fs/namei.c:4700 [inline]
 path_openat+0x2873/0x4280 fs/namei.c:4863
 do_file_open+0x20e/0x430 fs/namei.c:4892
 do_sys_openat2+0x10f/0x1e0 fs/open.c:1368
 do_sys_open fs/open.c:1374 [inline]
 __do_sys_openat fs/open.c:1390 [inline]
 __se_sys_openat fs/open.c:1385 [inline]
 __x64_sys_openat+0x12d/0x210 fs/open.c:1385
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0x115/0x870 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7fac6bd9e0d9
Code: ff c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 44 00 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 e8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007fac6cbdb028 EFLAGS: 00000246 ORIG_RAX: 0000000000000101
RAX: ffffffffffffffda RBX: 00007fac6c025fa0 RCX: 00007fac6bd9e0d9
RDX: 0000000000000002 RSI: 00002000000001c0 RDI: ffffffffffffff9c
RBP: 00007fac6be35024 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000000
R13: 00007fac6c026038 R14: 00007fac6c025fa0 R15: 00007fffa5b7a408
 </TASK>
------------[ cut here ]------------
refcount_t: addition on 0; use-after-free.
WARNING: lib/refcount.c:25 at refcount_warn_saturate+0x111/0x130 lib/refcount.c:25, CPU#2: syz.1.321/6814
Modules linked in:
CPU: 2 UID: 0 PID: 6814 Comm: syz.1.321 Not tainted syzkaller #0 PREEMPT(full) 
Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.3-debian-1.16.3-2 04/01/2014
RIP: 0010:refcount_warn_saturate+0x111/0x130 lib/refcount.c:25
Code: 06 e8 f3 92 ec fc 48 8d 3d fc bd 0e 0c 67 48 0f b9 3a e8 e2 92 ec fc 5b 5d c3 cc cc cc cc e8 d6 92 ec fc 48 8d 3d ef bd 0e 0c <67> 48 0f b9 3a e8 c5 92 ec fc 5b 5d c3 cc cc cc cc 48 89 df e8 36
RSP: 0018:ffffc9000c607980 EFLAGS: 00010087
RAX: 0000000000013641 RBX: ffff888057f44040 RCX: ffffc90007002000
RDX: 0000000000080000 RSI: ffffffff851de0aa RDI: ffffffff912c9ea0
RBP: 0000000000000002 R08: 0000000000000005 R09: 0000000000000004
R10: 0000000000000002 R11: ffff888057f44018 R12: ffff888057f44040
R13: ffff88803986aac0 R14: ffff88803986ab08 R15: ffff88803986aae8
FS:  00007fac6cbdb6c0(0000) GS:ffff8880d5fec000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 000000110c3ae428 CR3: 000000002b4e3000 CR4: 0000000000352ef0
Call Trace:
 <TASK>
 __refcount_add include/linux/refcount.h:289 [inline]
 __refcount_inc include/linux/refcount.h:366 [inline]
 refcount_inc include/linux/refcount.h:383 [inline]
 get_dev drivers/usb/gadget/legacy/inode.c:160 [inline]
 gadget_dev_open+0x170/0x1b0 drivers/usb/gadget/legacy/inode.c:1924
 do_dentry_open+0x6ab/0x14d0 fs/open.c:947
 vfs_open+0x82/0x3f0 fs/open.c:1052
 do_open fs/namei.c:4700 [inline]
 path_openat+0x2873/0x4280 fs/namei.c:4863
 do_file_open+0x20e/0x430 fs/namei.c:4892
 do_sys_openat2+0x10f/0x1e0 fs/open.c:1368
 do_sys_open fs/open.c:1374 [inline]
 __do_sys_openat fs/open.c:1390 [inline]
 __se_sys_openat fs/open.c:1385 [inline]
 __x64_sys_openat+0x12d/0x210 fs/open.c:1385
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0x115/0x870 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7fac6bd9e0d9
Code: ff c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 44 00 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 e8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007fac6cbdb028 EFLAGS: 00000246 ORIG_RAX: 0000000000000101
RAX: ffffffffffffffda RBX: 00007fac6c025fa0 RCX: 00007fac6bd9e0d9
RDX: 0000000000000002 RSI: 00002000000001c0 RDI: ffffffffffffff9c
RBP: 00007fac6be35024 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000000
R13: 00007fac6c026038 R14: 00007fac6c025fa0 R15: 00007fffa5b7a408
 </TASK>
----------------
Code disassembly (best guess), 1 bytes skipped:
   0:	e8 f3 92 ec fc       	call   0xfcec92f8
   5:	48 8d 3d fc bd 0e 0c 	lea    0xc0ebdfc(%rip),%rdi        # 0xc0ebe08
   c:	67 48 0f b9 3a       	ud1    (%edx),%rdi
  11:	e8 e2 92 ec fc       	call   0xfcec92f8
  16:	5b                   	pop    %rbx
  17:	5d                   	pop    %rbp
  18:	c3                   	ret
  19:	cc                   	int3
  1a:	cc                   	int3
  1b:	cc                   	int3
  1c:	cc                   	int3
  1d:	e8 d6 92 ec fc       	call   0xfcec92f8
  22:	48 8d 3d ef bd 0e 0c 	lea    0xc0ebdef(%rip),%rdi        # 0xc0ebe18
* 29:	67 48 0f b9 3a       	ud1    (%edx),%rdi <-- trapping instruction
  2e:	e8 c5 92 ec fc       	call   0xfcec92f8
  33:	5b                   	pop    %rbx
  34:	5d                   	pop    %rbp
  35:	c3                   	ret
  36:	cc                   	int3
  37:	cc                   	int3
  38:	cc                   	int3
  39:	cc                   	int3
  3a:	48 89 df             	mov    %rbx,%rdi
  3d:	e8                   	.byte 0xe8
  3e:	36                   	ss


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

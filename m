Received: from mail-ot1-f78.google.com (mail-ot1-f78.google.com [209.85.210.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D26AF32ED55
	for <linux-usb@vger.kernel.org>; Fri, 31 Jul 2026 06:47:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.78
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785480446; cv=none; b=gil2Ah24Uvqm47Rd86PuN7g+h0+MNqOSUxtS9nZpvo5Z5Sn+w962VnGQHzU0x4ZKbiJMtWQC/jbBpdk9/q1knK6k06rPXaTR3lEuRAlzsjPsgu3CSyoDNT5xSCrUrH44wPQCbG2BmUaEzRrp1mAWAcx9UtBrbMUiuu0lMfDOPE0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785480446; c=relaxed/simple;
	bh=DbaJXVirw1ro6qaZ25bD/oiuleJeA9nhwrVdrjG5iy4=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=BBY2bZeIGmxQL1C4Sr3f0hhcpBRjF6PSs9TJQRRL05gcXROj44dMYRzf85SOAmv0eSWNfFCDQ6NAqIyR+f90qQG+Pydik5yqwV61tWyPq5m+Ajif2KROpD241TlpgQqxQMmVGZOHomZzhzVEjvyDpsoDTQmxo9DxXsYKd41TJY8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.210.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-ot1-f78.google.com with SMTP id 46e09a7af769-7ebe970a21fso487080a34.2
        for <linux-usb@vger.kernel.org>; Thu, 30 Jul 2026 23:47:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785480443; x=1786085243;
        h=content-type:to:from:subject:message-id:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=afHo1Tsc+iGJ+cCnEFRuh7maCLZIkFKGBb05Qki1+O8=;
        b=ai1MQK2UD191sYEL6SXJCxpWTbSHd6z7FCg7vT+tHA7Wh0m7Aef7o6uEhBfreFTPvb
         0/0p6ygzScah3waAohfqLzJ6Acu44Q05W5PhqYOJPOAeWoloaO32iXc0bcxZ+M+LgxxX
         l2Y5yRWVfr+BB1PoCB80o87nt9YE0MUjyURMXXtAoP2dSLLwxrfoxLmLCpdOO1MueIuf
         V3pmLfVFexZLpOenSkAZKEppAKtQlLxHOsA/pdZt6DDWh4iF8oJBXPeOmUhklbedIx6o
         I+p3MwOd+GDCG18AFghwOZWiDpKgNbrtQOQWx3zYVWKbDbQT0nQNREXSBb3MDQPr/9U4
         KWKw==
X-Forwarded-Encrypted: i=1; AHgh+Rrzk2JQZWfgnS4jd8S3YLR3hW+cRouDR6fWTA/Bx9XnchQGh5tosca1k+E0165Ez4rh4DiyD3Ld40U=@vger.kernel.org
X-Gm-Message-State: AOJu0YxSpCa/tZ3Pri0QwpwnWY8IseA80tZv7a11OajGPnnkpzh9X4D9
	OlQibJ0A3o4uFbXO6Xlf+g9xQQjW973VAo1p8eeXUYp003HkEQtRi5f2Twq1lESFMC6W5evNtmZ
	MBdf0ha2FCIvqtaYsny3Wj6y7NfvCNta8E21WyEbmcW6hEbGhiSnPWjByLls=
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:f026:b0:6ac:b435:fb21 with SMTP id
 006d021491bc7-6ae37d98e74mr565761eaf.24.1785480443684; Thu, 30 Jul 2026
 23:47:23 -0700 (PDT)
Date: Thu, 30 Jul 2026 23:47:23 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6a6c44fb.77639fcc.3d4fd0.001e.GAE@google.com>
Subject: [syzbot] [usb?] WARNING: locking bug in gadget_dev_open
From: syzbot <syzbot+3dfcbe7ab191ca685ce7@syzkaller.appspotmail.com>
To: gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    4235cb24ec1e Merge tag 'vfs-7.2-rc5.fixes' of git://git.ke..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=1749bfde580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=f221a1b5d497ed15
dashboard link: https://syzkaller.appspot.com/bug?extid=3dfcbe7ab191ca685ce7
compiler:       gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44
userspace arch: i386

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image (non-bootable): https://storage.googleapis.com/syzbot-assets/d900f083ada3/non_bootable_disk-4235cb24.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/68eef4847f46/vmlinux-4235cb24.xz
kernel image: https://storage.googleapis.com/syzbot-assets/77e73df69f7f/bzImage-4235cb24.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+3dfcbe7ab191ca685ce7@syzkaller.appspotmail.com

------------[ cut here ]------------
DEBUG_LOCKS_WARN_ON(!test_bit(class_idx, lock_classes_in_use))
WARNING: kernel/locking/lockdep.c:5207 at __lock_acquire+0x1469/0x1a40 kernel/locking/lockdep.c:5207, CPU#0: syz.4.1249/10653
Modules linked in:
CPU: 0 UID: 0 PID: 10653 Comm: syz.4.1249 Tainted: G             L      syzkaller #0 PREEMPT(full) 
Tainted: [L]=SOFTLOCKUP
Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.3-debian-1.16.3-2 04/01/2014
RIP: 0010:__lock_acquire+0x1470/0x1a40 kernel/locking/lockdep.c:5207
Code: 33 03 85 c0 74 10 44 8b 15 bd 7b 3d 0f 45 85 d2 0f 84 f7 01 00 00 90 e9 7a fd ff ff 48 8d 3d 57 e6 40 0f 48 c7 c6 30 c1 2b 8e <67> 48 0f b9 3a e9 cd fb ff ff 89 c6 48 c7 c7 f0 1e 6f 9b e8 48 15
RSP: 0018:ffffc9000db3f828 EFLAGS: 00010046
RAX: 0000000000000001 RBX: ffff888024728ba0 RCX: ffffc900297c1000
RDX: 0000000000080000 RSI: ffffffff8e2bc130 RDI: ffffffff91263b30
RBP: ffff888024728000 R08: 0000000000000001 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000000 R12: ffffffff99926684
R13: 0000000000000000 R14: 0000000000000000 R15: 0000000000000000
FS:  0000000000000000(0000) GS:ffff888096be3000(0063) knlGS:00000000f54adb40
CS:  0010 DS: 002b ES: 002b CR0: 0000000080050033
CR2: 000000000c32c279 CR3: 000000004b285000 CR4: 0000000000352ef0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 00000000e08e000e DR6: 00000000ffff0ff0 DR7: 0000000000000400
Call Trace:
 <TASK>
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
 __do_compat_sys_openat fs/open.c:1436 [inline]
 __se_compat_sys_openat fs/open.c:1434 [inline]
 __ia32_compat_sys_openat+0x12d/0x210 fs/open.c:1434
 do_syscall_32_irqs_on arch/x86/entry/syscall_32.c:83 [inline]
 __do_fast_syscall_32+0xe7/0x970 arch/x86/entry/syscall_32.c:307
 do_fast_syscall_32+0x32/0x70 arch/x86/entry/syscall_32.c:332
 entry_SYSENTER_compat_after_hwframe+0x84/0x8e
RIP: 0023:0xf70befec
Code: Unable to access opcode bytes at 0xf70befc2.
RSP: 002b:00000000f54ad50c EFLAGS: 00000292 ORIG_RAX: 0000000000000127
RAX: ffffffffffffffda RBX: 00000000ffffff9c RCX: 0000000080000300
RDX: 0000000000000002 RSI: 0000000000000000 RDI: 0000000000000000
RBP: 0000000000000000 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000292 R12: 0000000000000000
R13: 0000000000000000 R14: 0000000000000000 R15: 0000000000000000
 </TASK>
----------------
Code disassembly (best guess):
   0:	33 03                	xor    (%rbx),%eax
   2:	85 c0                	test   %eax,%eax
   4:	74 10                	je     0x16
   6:	44 8b 15 bd 7b 3d 0f 	mov    0xf3d7bbd(%rip),%r10d        # 0xf3d7bca
   d:	45 85 d2             	test   %r10d,%r10d
  10:	0f 84 f7 01 00 00    	je     0x20d
  16:	90                   	nop
  17:	e9 7a fd ff ff       	jmp    0xfffffd96
  1c:	48 8d 3d 57 e6 40 0f 	lea    0xf40e657(%rip),%rdi        # 0xf40e67a
  23:	48 c7 c6 30 c1 2b 8e 	mov    $0xffffffff8e2bc130,%rsi
* 2a:	67 48 0f b9 3a       	ud1    (%edx),%rdi <-- trapping instruction
  2f:	e9 cd fb ff ff       	jmp    0xfffffc01
  34:	89 c6                	mov    %eax,%esi
  36:	48 c7 c7 f0 1e 6f 9b 	mov    $0xffffffff9b6f1ef0,%rdi
  3d:	e8                   	.byte 0xe8
  3e:	48                   	rex.W
  3f:	15                   	.byte 0x15


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

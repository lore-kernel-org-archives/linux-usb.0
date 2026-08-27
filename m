Received: from mail-oi2-f5.google.com (mail-oi2-f5.google.com [74.125.231.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A75834D98E1
	for <linux-usb@vger.kernel.org>; Thu, 27 Aug 2026 18:53:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787856810; cv=none; b=BPuKfffKxtX6PtLZ1eGvcoAb+SixE5k0LvZQ5NhTuSJPOypkKpVoIHio4ZTNiOYbmtWtbMFzvwSr8oeFOydPVcDvO9KpG2F9ptovUUEanw9AS1DuWsl3WcWB/XFHvPfx6iONhM6yHCWcOkC3/TZmKVBVuzpWrhwZVPjI0X3BO5s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787856810; c=relaxed/simple;
	bh=lW0uZW1hs0gCTIdN14XvqZsMYzXiPwXUKqvvDuIDG5E=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=GY0eDQft+aq/BFic0QexYrRUGX9+poWobnwlbhiQvIJzJ3+GvpFL5/wsKFtyJpfdsuY3WUIvscIy8iWlsVKkMAm+A1IBXsF7E/ikhGWfNHuCcq18zkvoV2d2rVrD2E0rsgf115F3VpJ6Nlk9fRPVKV+F6toxRoGWQ4diqMFsWeM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=74.125.231.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi2-f5.google.com with SMTP id 5614622812f47-4b3759b7ff0so11630b6e.1
        for <linux-usb@vger.kernel.org>; Thu, 27 Aug 2026 11:53:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787856804; x=1788461604;
        h=content-type:to:from:subject:message-id:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Obb0nIkdjPqUkcgRqMgrOHeQeGpgeZJfAJJy2D7pdSo=;
        b=j44MoY73srHhwmbj0gGC5DdmF7m3xmwCSl/MHLHNKdyfsOnoIAcltB7A9ZMlvKAroF
         BkizEFp5fB3kDko6rn/8e+nrjetN+L/AActq7UDTMpyEDpQ+qpyNsk0CETP0EBxFZDLN
         qm1JUr1T44hgfhRWLiQKQQXkOXOeWjG4TtI0KgqzVg4fRGhSDaG+ZIIRVIzxOi9RYvRn
         6QwMsTvteUV5GKgbBIbt+4eDXsqrJrD9Zfnvczlg4S3o/g74kp35ZDzJ6Yt1q845+g8j
         0LmFGYuPetCmwdoppM/sKM1sw/E/pmcGwRWvEM3N8bXvgigSwzrHINq9p0feXBoSqo7+
         vUqg==
X-Forwarded-Encrypted: i=1; AHgh+RoDaQooy6+k8AfqTQ6TxuTBDoFaJ54vdc0HfXJco5ltzywQ8o6KnpiuJw9yuhvqwlZ4zi+iDOsiGnw=@vger.kernel.org
X-Gm-Message-State: AFuF++l43f7eAb4QJYEAjYeGcL2ow7Mtc3GjkeD7MoLcWA+nnpb2gbB6
	lRRsexKLKxNlPv3k87EUq7gGzD0BO+qd5Lpd6p72ziM73e1QmfgVPp9oJmutYOFIFSMGRQI71/i
	3UtmIULd6GHDDNYhZMMt0wCrTyJhtaWD4ray7dnNEwFwWpEYEtlCxEezJWZw=
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:4fcb:b0:4a4:ed9a:e7ac with SMTP id
 5614622812f47-4b397f66748mr1562136b6e.1.1787856804185; Thu, 27 Aug 2026
 11:53:24 -0700 (PDT)
Date: Thu, 27 Aug 2026 11:53:24 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6a9087a4.4d659fcc.734b4.0013.GAE@google.com>
Subject: [syzbot] [usb?] general protection fault in keyspan_break_ctl
From: syzbot <syzbot+473d7477c523b41d4046@syzkaller.appspotmail.com>
To: gregkh@linuxfoundation.org, johan@kernel.org, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    818bebeb63dd drm/xe: Don't hand out the flat CCS storage a..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=16ba2979580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=ccca94d2c01b9e78
dashboard link: https://syzkaller.appspot.com/bug?extid=473d7477c523b41d4046
compiler:       gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=161f499e580000

Downloadable assets:
disk image (non-bootable): https://storage.googleapis.com/syzbot-assets/d900f083ada3/non_bootable_disk-818bebeb.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/6e4100526b12/vmlinux-818bebeb.xz
kernel image: https://storage.googleapis.com/syzbot-assets/723c4783ee96/bzImage-818bebeb.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+473d7477c523b41d4046@syzkaller.appspotmail.com

Oops: general protection fault, probably for non-canonical address 0xdffffc0000000013: 0000 [#1] SMP KASAN NOPTI
KASAN: null-ptr-deref in range [0x0000000000000098-0x000000000000009f]
CPU: 2 UID: 0 PID: 6029 Comm: syz.3.20 Not tainted syzkaller #0 PREEMPT(full) 
Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.3-debian-1.16.3-2 04/01/2014
RIP: 0010:keyspan_break_ctl+0x8e/0xe0 drivers/usb/serial/keyspan.c:608
Code: ff ff ff e8 54 ca 48 fa 83 fb ff 48 b8 00 00 00 00 00 fc ff df 49 8d bc 24 9c 00 00 00 0f 94 c3 48 89 fa 0f b6 db 48 c1 ea 03 <0f> b6 14 02 48 89 f8 83 e0 07 83 c0 03 38 d0 7c 04 84 d2 75 1d 41
RSP: 0018:ffffc900035b7cb0 EFLAGS: 00010203
RAX: dffffc0000000000 RBX: 0000000000000000 RCX: ffffffff87c231ec
RDX: 0000000000000013 RSI: 00000000ffffffff RDI: 000000000000009c
RBP: ffff88802f436000 R08: 0000000000000005 R09: 00000000ffffffff
R10: 0000000000000000 R11: 0000000000000000 R12: 0000000000000000
R13: ffff888034d39020 R14: ffff888034d390c8 R15: 0000000000000000
FS:  0000555589f16500(0000) GS:ffff8880d5da2000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007f5bac070000 CR3: 00000000584fe000 CR4: 0000000000352ef0
Call Trace:
 <TASK>
 serial_break+0xcb/0x160 drivers/usb/serial/usb-serial.c:538
 send_break drivers/tty/tty_io.c:2458 [inline]
 send_break+0x2ec/0x370 drivers/tty/tty_io.c:2441
 tty_ioctl+0xa2c/0x1640 drivers/tty/tty_io.c:2733
 vfs_ioctl fs/ioctl.c:51 [inline]
 __do_sys_ioctl fs/ioctl.c:597 [inline]
 __se_sys_ioctl fs/ioctl.c:583 [inline]
 __x64_sys_ioctl+0x18e/0x210 fs/ioctl.c:583
 do_syscall_x64 arch/x86/entry/syscall_64.c:61 [inline]
 do_syscall_64+0x123/0x790 arch/x86/entry/syscall_64.c:84
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f5bac19e0d9
Code: ff c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 44 00 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 e8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007ffd93db7608 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
RAX: ffffffffffffffda RBX: 00007f5bac425fa0 RCX: 00007f5bac19e0d9
RDX: 0000000000000000 RSI: 0000000000005425 RDI: 0000000000000004
RBP: 00007f5bac235024 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000000
R13: 00007f5bac425fac R14: 00007f5bac425fa0 R15: 00007f5bac425fa0
 </TASK>
Modules linked in:
---[ end trace 0000000000000000 ]---
RIP: 0010:keyspan_break_ctl+0x8e/0xe0 drivers/usb/serial/keyspan.c:608
Code: ff ff ff e8 54 ca 48 fa 83 fb ff 48 b8 00 00 00 00 00 fc ff df 49 8d bc 24 9c 00 00 00 0f 94 c3 48 89 fa 0f b6 db 48 c1 ea 03 <0f> b6 14 02 48 89 f8 83 e0 07 83 c0 03 38 d0 7c 04 84 d2 75 1d 41
RSP: 0018:ffffc900035b7cb0 EFLAGS: 00010203
RAX: dffffc0000000000 RBX: 0000000000000000 RCX: ffffffff87c231ec
RDX: 0000000000000013 RSI: 00000000ffffffff RDI: 000000000000009c
RBP: ffff88802f436000 R08: 0000000000000005 R09: 00000000ffffffff
R10: 0000000000000000 R11: 0000000000000000 R12: 0000000000000000
R13: ffff888034d39020 R14: ffff888034d390c8 R15: 0000000000000000
FS:  0000555589f16500(0000) GS:ffff8880d5da2000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007f5bac070000 CR3: 00000000584fe000 CR4: 0000000000352ef0
----------------
Code disassembly (best guess), 2 bytes skipped:
   0:	ff                   	ljmp   (bad)
   1:	e8 54 ca 48 fa       	call   0xfa48ca5a
   6:	83 fb ff             	cmp    $0xffffffff,%ebx
   9:	48 b8 00 00 00 00 00 	movabs $0xdffffc0000000000,%rax
  10:	fc ff df
  13:	49 8d bc 24 9c 00 00 	lea    0x9c(%r12),%rdi
  1a:	00
  1b:	0f 94 c3             	sete   %bl
  1e:	48 89 fa             	mov    %rdi,%rdx
  21:	0f b6 db             	movzbl %bl,%ebx
  24:	48 c1 ea 03          	shr    $0x3,%rdx
* 28:	0f b6 14 02          	movzbl (%rdx,%rax,1),%edx <-- trapping instruction
  2c:	48 89 f8             	mov    %rdi,%rax
  2f:	83 e0 07             	and    $0x7,%eax
  32:	83 c0 03             	add    $0x3,%eax
  35:	38 d0                	cmp    %dl,%al
  37:	7c 04                	jl     0x3d
  39:	84 d2                	test   %dl,%dl
  3b:	75 1d                	jne    0x5a
  3d:	41                   	rex.B


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

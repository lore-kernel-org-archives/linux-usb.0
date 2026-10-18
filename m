Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com [209.85.167.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EA903AE6EB
	for <linux-usb@vger.kernel.org>; Sun, 18 Oct 2026 16:18:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792340311; cv=none; b=jHJjaIyLRvabtgT21Pw/cqGCGupBNLIuF/rR/b0FFUQN4APGt+ZOa9/0D1s3hNdkGGkyNn4aSIl5+/jUkN2sLBliE0emhBXMTwp+y3yy0Eg8jkM936HNJKAUapfkoypn4ZjAPPo4vIvpt8yCrjYECysZUQAbp6D/n7MQOU9w4Tk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792340311; c=relaxed/simple;
	bh=C7L1XjnZf+bQFGK5gTa971rN1G20Yw7VuY/hecoGzlI=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=mEkEebb80LoQCI36O0OwEGnXB/zm1tQdbz07TUsRGMqAuGcVehKS2HFMma0955ET7QXN0ZLy75s/C0ELlOd0u23mSjgbwZzg8rFlKyUE6pM9+89bPqxgQ3BPC+pRzG3dLLiHMDUm64ovHlxUDv8f1CfDPz23jCVGA4eOD305F/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f199.google.com with SMTP id 5614622812f47-4b26d8d2498so2327218b6e.2
        for <linux-usb@vger.kernel.org>; Sun, 18 Oct 2026 09:18:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792340309; x=1792945109;
        h=content-type:to:from:subject:message-id:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6uTfwGzVCcKVkbxklflSZB/XIhVnL6yyzUcQzTnVezc=;
        b=REaaE9S7WQqe8/ytiupU9Icx6dW6ZR41MIyL6f5DTumbjqlFujpyOdLxuCC38OWkJi
         veEDAwWOZ2K1oARGOKZK8JKVKdUogxglepfulTO8D0ZschZq6aV3dZj2x9ftM//9Gma9
         +Gq4GmFfbEpIehKjIo4UD7acu3zaDnHLaYgRhLZH36BDZNC3amAZByCe9Os4wce/xKxK
         +sRaNObACDa4Pl3cR9jMf3At/mCJqHVuq2M9s/0DMwuVUuaxfohHozzgavtI3zEtrcY+
         PYlYB/BAUmANHHzwNEEpfexGJ+ilosn5hwA0TMgS4jISgoxn5dNhnmH9d1CFt95PQfXc
         GR6Q==
X-Forwarded-Encrypted: i=1; AKwUvBzEWz6vho4SBtUX6dIMW/TobaWiCeXQAIhCeN36oESfLnupPX4d6AgTGde0O/ttuR8byniMh9nrh84=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ3m66mRurLSosQ3QLYIcE7jSUrJdHuzdJWxOWQjjvxGoyC+dTi
	YXMzJXXWFyIXmV+5f1VOoNFw0y08hzfT20VBPf6Jsm0kXUZ6Lpt3suD/n3GY5TWbX6Q3VlsSO9J
	SyE6Kc4pvFAmt1IZBP2wobnws4rV3I177DgKsqCijvEu7yzF0q7Ozwv2NUyo=
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:124b:b0:4f8:4ec9:b170 with SMTP id
 5614622812f47-53cc6b00eb3mr4123719b6e.2.1792340308836; Sun, 18 Oct 2026
 09:18:28 -0700 (PDT)
Date: Sun, 18 Oct 2026 09:18:28 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6ad4f154.a6d1a155.34a93f.00b5.GAE@google.com>
Subject: [syzbot] [usb?] WARNING in ec168_ctrl_msg/usb_submit_urb
From: syzbot <syzbot+ed3ada41c4eb1c4ab78e@syzkaller.appspotmail.com>
To: gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    4056b3c9d3c9 Merge tag 'nios2_update_for_v7.4' of git://gi..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=11370ce1580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=7d1b274ca9837366
dashboard link: https://syzkaller.appspot.com/bug?extid=ed3ada41c4eb1c4ab78e
compiler:       Debian clang version 22.1.8 (++20260613092233+e80beda6e255-1~exp1~20260613092250.77), Debian LLD 22.1.8
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=114faaea580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=154faaea580000

Downloadable assets:
disk image (non-bootable): https://storage.googleapis.com/syzbot-assets/d900f083ada3/non_bootable_disk-4056b3c9.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/811a43c89106/vmlinux-4056b3c9.xz
kernel image: https://storage.googleapis.com/syzbot-assets/2bb4f3abea76/bzImage-4056b3c9.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+ed3ada41c4eb1c4ab78e@syzkaller.appspotmail.com

------------[ cut here ]------------
usb 5-1: BOGUS control dir, pipe 80000280 doesn't match bRequestType c0
WARNING: drivers/usb/core/urb.c:413 at usb_submit_urb+0x1057/0x18b0 drivers/usb/core/urb.c:411, CPU#0: syz.0.17/5521
Modules linked in:
CPU: 0 UID: 0 PID: 5521 Comm: syz.0.17 Not tainted syzkaller #0 PREEMPT(full) 
Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.3-debian-1.16.3-2 04/01/2014
RIP: 0010:usb_submit_urb+0x1100/0x18b0 drivers/usb/core/urb.c:411
Code: b8 00 00 00 00 00 fc ff df 41 0f b6 04 04 84 c0 0f 85 b2 05 00 00 45 0f b6 45 00 48 8b 3c 24 48 8b 74 24 18 4c 89 f2 44 89 f9 <67> 48 0f b9 3a 48 bd 00 00 00 00 00 fc ff df e9 ba f2 ff ff 44 89
RSP: 0000:ffffc9000228f8d8 EFLAGS: 00010246
RAX: 0000000000000000 RBX: ffff888044085800 RCX: 0000000080000280
RDX: ffff88801317fa20 RSI: ffffffff8cc57b40 RDI: ffffffff91885110
RBP: dffffc0000000000 R08: 00000000000000c0 R09: 0000000000000000
R10: ffffc9000228f9c0 R11: fffff52000451f44 R12: 1ffff11003c397d4
R13: ffff88801e1cbea0 R14: ffff88801317fa20 R15: 0000000080000280
FS:  0000555560660500(0000) GS:ffff88808b0b4000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007f1c3f68e000 CR3: 00000000440b1000 CR4: 0000000000352ef0
Call Trace:
 <TASK>
 usb_start_wait_urb+0x13f/0x5b0 drivers/usb/core/message.c:62
 usb_internal_control_msg drivers/usb/core/message.c:117 [inline]
 usb_control_msg+0x234/0x3e0 drivers/usb/core/message.c:167
 ec168_ctrl_msg+0x308/0x7c0 drivers/media/usb/dvb-usb-v2/ec168.c:73
 ec168_i2c_xfer+0x10e/0x630 drivers/media/usb/dvb-usb-v2/ec168.c:127
 __i2c_transfer+0x7bf/0x1fe0 drivers/i2c/i2c-core-base.c:-1
 i2c_transfer+0x1cb/0x2d0 drivers/i2c/i2c-core-base.c:2350
 i2cdev_ioctl_rdwr+0x460/0x740 drivers/i2c/i2c-dev.c:306
 i2cdev_ioctl+0x6a5/0x880 drivers/i2c/i2c-dev.c:467
 vfs_ioctl fs/ioctl.c:51 [inline]
 __do_sys_ioctl fs/ioctl.c:597 [inline]
 __se_sys_ioctl+0xfc/0x170 fs/ioctl.c:583
 do_syscall_x64 arch/x86/entry/syscall_64.c:61 [inline]
 do_syscall_64+0x166/0x520 arch/x86/entry/syscall_64.c:84
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7fa9f059e559
Code: ff c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 44 00 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 e8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007ffd4b173ed8 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
RAX: ffffffffffffffda RBX: 00007fa9f0825fa0 RCX: 00007fa9f059e559
RDX: 0000200000000200 RSI: 0000000000000707 RDI: 0000000000000004
RBP: 00007fa9f06358b0 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000000
R13: 00007fa9f0825fac R14: 00007fa9f0825fa0 R15: 00007fa9f0825fa0
 </TASK>
----------------
Code disassembly (best guess):
   0:	b8 00 00 00 00       	mov    $0x0,%eax
   5:	00 fc                	add    %bh,%ah
   7:	ff                   	lcall  (bad)
   8:	df 41 0f             	filds  0xf(%rcx)
   b:	b6 04                	mov    $0x4,%dh
   d:	04 84                	add    $0x84,%al
   f:	c0 0f 85             	rorb   $0x85,(%rdi)
  12:	b2 05                	mov    $0x5,%dl
  14:	00 00                	add    %al,(%rax)
  16:	45 0f b6 45 00       	movzbl 0x0(%r13),%r8d
  1b:	48 8b 3c 24          	mov    (%rsp),%rdi
  1f:	48 8b 74 24 18       	mov    0x18(%rsp),%rsi
  24:	4c 89 f2             	mov    %r14,%rdx
  27:	44 89 f9             	mov    %r15d,%ecx
* 2a:	67 48 0f b9 3a       	ud1    (%edx),%rdi <-- trapping instruction
  2f:	48 bd 00 00 00 00 00 	movabs $0xdffffc0000000000,%rbp
  36:	fc ff df
  39:	e9 ba f2 ff ff       	jmp    0xfffff2f8
  3e:	44                   	rex.R
  3f:	89                   	.byte 0x89


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

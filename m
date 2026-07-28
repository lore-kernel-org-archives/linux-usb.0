Received: from mail-oi1-f208.google.com (mail-oi1-f208.google.com [209.85.167.208])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FEC543785C
	for <linux-usb@vger.kernel.org>; Tue, 28 Jul 2026 13:42:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.208
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785246158; cv=none; b=qFjnCKwG15SAjLX3h9capi05wQgMeWBcPYRBvOh8hIA5TimRtP+FkOa/hc2v8f+0jVC5I1sSgiomFcY+33g1kPkQq9g3hHNyJXefEEetZiID2UZjvjT+KsDOFsV774L6s/Yb3fQV+jj/snT4YFbvmxZUdTZYbEzgRz4JVUwL4c0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785246158; c=relaxed/simple;
	bh=t+b6ycE7zuvLNG6DkyJf1sciBD3dPxTuLZylVp++BlA=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=qVcWcVX9AWssrpRAjcdZQccNqAnnlMc++oAs7Q6+mfEb5bDli9ZLiYU3DpGk4t3vFx64WQrYw7mFngIUaPLKmneVUwgvA5qePzYUctPjbuaf7AgY64h/6paqcxdobixaAILVYFmPCWFvjGlKkafUpuQk7r7K367g8QF6SvSIzLc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.208
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f208.google.com with SMTP id 5614622812f47-4959c49e054so2245079b6e.3
        for <linux-usb@vger.kernel.org>; Tue, 28 Jul 2026 06:42:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785246155; x=1785850955;
        h=content-type:to:from:subject:message-id:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7GOhQhzU3voDN+r7deAzqlfHVxPwJi4+baIE1HATtww=;
        b=JaI4ARiVqr02/z9uJJXRfFWUdKb1/8J7mS2t58ICQG4pbXzSRaMi/QaPzZUcVGOOq+
         +jgi2pvcf7B4L08tL6T+yF/WTdYmvncB+xiKxcOUYbYgRVOdV/sTVZKdL1amrfcJkhw0
         fFkoudn6ywzt7UVDgFdK8UBktd+636pr4g++SZHXNbt8sE3psgEGIZFL2h/NqkHArLk5
         iiepJHJzHilpiJcTDT3kID0rX9GQLsnzptXam+h73y+pOUpYntdx0l2lZOIxn+r98zT1
         JdH7qqcnj4znCC1q1h/7gJ4cix8+QeV5PPHMPBQ0uV7TkKCw32YSSwxV66RAL9xA+/A8
         gP+g==
X-Forwarded-Encrypted: i=1; AHgh+Rp6Bhjgie3/v0P/X1nv70aPKq5A4/x7h/QMWVg4lQvigeeq1Cti3bbjX26L7W9D/pM6AWfETdychTo=@vger.kernel.org
X-Gm-Message-State: AOJu0YxUl7jQ9E5miNp5hB52+AoMmVgtpo3YhL4GY8Okf9hu0FVXmKAd
	+EBNc+0M6hiCJYApe9HV6zDK/I4ERVAw3KslW+Ti6uryZQZSPUq5mZeG7Kz9v3myrbyzgANkJS3
	E0IcUl6aUDx1erJY/2ZSHjAyiyrzjJnB9gxdRv46ooo2xPsrdQFQNMRMTxks=
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:1452:b0:4a4:c12:49d9 with SMTP id
 5614622812f47-4ad5b949faemr1513711b6e.3.1785246155522; Tue, 28 Jul 2026
 06:42:35 -0700 (PDT)
Date: Tue, 28 Jul 2026 06:42:35 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6a68b1cb.b6659fcc.241ab8.00e6.GAE@google.com>
Subject: [syzbot] [usb?] general protection fault in dummy_queue
From: syzbot <syzbot+ccaeedf06fe422068ae0@syzkaller.appspotmail.com>
To: gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    62cc90241548 Merge tag 'mm-hotfixes-stable-2026-07-27-14-1..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=135b16b9580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=145fa60d73086782
dashboard link: https://syzkaller.appspot.com/bug?extid=ccaeedf06fe422068ae0
compiler:       gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/824c8ce85a0f/disk-62cc9024.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/a1e6cc0e8f11/vmlinux-62cc9024.xz
kernel image: https://storage.googleapis.com/syzbot-assets/807679f73b90/bzImage-62cc9024.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+ccaeedf06fe422068ae0@syzkaller.appspotmail.com

Oops: general protection fault, probably for non-canonical address 0xdffffc000000000c: 0000 [#1] SMP KASAN NOPTI
KASAN: null-ptr-deref in range [0x0000000000000060-0x0000000000000067]
CPU: 1 UID: 0 PID: 22936 Comm: kworker/1:2H Tainted: G             L      syzkaller #0 PREEMPT(full) 
Tainted: [L]=SOFTLOCKUP
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 07/16/2026
Workqueue: events_highpri f_midi_in_work
RIP: 0010:dummy_queue+0x1ba/0xb00 drivers/usb/gadget/udc/dummy_hcd.c:737
Code: 00 49 83 bc 24 c8 05 00 00 00 0f 84 a6 07 00 00 e8 6b 30 39 fa 49 8d 7f 60 48 b8 00 00 00 00 00 fc ff df 48 89 fa 48 c1 ea 03 <0f> b6 04 02 84 c0 74 08 3c 03 0f 8e 4f 07 00 00 45 8b 7f 60 31 ff
RSP: 0018:ffffc9000784fa28 EFLAGS: 00010006
RAX: dffffc0000000000 RBX: ffff888045374710 RCX: ffffffff87d12f5f
RDX: 000000000000000c RSI: ffffffff87d12fd5 RDI: 0000000000000060
RBP: ffff88802b1640e0 R08: 0000000000000005 R09: 0000000000000005
R10: 0000000000000003 R11: 0000000000000000 R12: ffff88802b164c00
R13: ffff888045374700 R14: ffff88802b1640d8 R15: 0000000000000000
FS:  0000000000000000(0000) GS:ffff888123edc000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 0000001b322fdff8 CR3: 0000000029d76000 CR4: 00000000003526f0
Call Trace:
 <TASK>
 usb_ep_queue+0xfa/0x3c0 drivers/usb/gadget/udc/core.c:305
 f_midi_do_transmit drivers/usb/gadget/function/f_midi.c:659 [inline]
 f_midi_transmit drivers/usb/gadget/function/f_midi.c:687 [inline]
 f_midi_in_work+0x9b0/0x1580 drivers/usb/gadget/function/f_midi.c:707
 process_one_work+0xa23/0x1940 kernel/workqueue.c:3322
 process_scheduled_works kernel/workqueue.c:3405 [inline]
 worker_thread+0x5ef/0xe50 kernel/workqueue.c:3486
 kthread+0x370/0x450 kernel/kthread.c:436
 ret_from_fork+0x72b/0xd50 arch/x86/kernel/process.c:158
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245
 </TASK>
Modules linked in:
---[ end trace 0000000000000000 ]---
RIP: 0010:dummy_queue+0x1ba/0xb00 drivers/usb/gadget/udc/dummy_hcd.c:737
Code: 00 49 83 bc 24 c8 05 00 00 00 0f 84 a6 07 00 00 e8 6b 30 39 fa 49 8d 7f 60 48 b8 00 00 00 00 00 fc ff df 48 89 fa 48 c1 ea 03 <0f> b6 04 02 84 c0 74 08 3c 03 0f 8e 4f 07 00 00 45 8b 7f 60 31 ff
RSP: 0018:ffffc9000784fa28 EFLAGS: 00010006
RAX: dffffc0000000000 RBX: ffff888045374710 RCX: ffffffff87d12f5f
RDX: 000000000000000c RSI: ffffffff87d12fd5 RDI: 0000000000000060
RBP: ffff88802b1640e0 R08: 0000000000000005 R09: 0000000000000005
R10: 0000000000000003 R11: 0000000000000000 R12: ffff88802b164c00
R13: ffff888045374700 R14: ffff88802b1640d8 R15: 0000000000000000
FS:  0000000000000000(0000) GS:ffff888123edc000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 0000001b322fdff8 CR3: 0000000029d76000 CR4: 00000000003526f0
----------------
Code disassembly (best guess):
   0:	00 49 83             	add    %cl,-0x7d(%rcx)
   3:	bc 24 c8 05 00       	mov    $0x5c824,%esp
   8:	00 00                	add    %al,(%rax)
   a:	0f 84 a6 07 00 00    	je     0x7b6
  10:	e8 6b 30 39 fa       	call   0xfa393080
  15:	49 8d 7f 60          	lea    0x60(%r15),%rdi
  19:	48 b8 00 00 00 00 00 	movabs $0xdffffc0000000000,%rax
  20:	fc ff df
  23:	48 89 fa             	mov    %rdi,%rdx
  26:	48 c1 ea 03          	shr    $0x3,%rdx
* 2a:	0f b6 04 02          	movzbl (%rdx,%rax,1),%eax <-- trapping instruction
  2e:	84 c0                	test   %al,%al
  30:	74 08                	je     0x3a
  32:	3c 03                	cmp    $0x3,%al
  34:	0f 8e 4f 07 00 00    	jle    0x789
  3a:	45 8b 7f 60          	mov    0x60(%r15),%r15d
  3e:	31 ff                	xor    %edi,%edi


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

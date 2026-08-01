Received: from mail-oi1-f208.google.com (mail-oi1-f208.google.com [209.85.167.208])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DAE136402D
	for <linux-usb@vger.kernel.org>; Sat,  1 Aug 2026 00:36:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.208
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785544605; cv=none; b=UNFZrjEuwrXI+EaEG4lrPAajtZg7czXRBuNnnn4MtGtVuwdtGHKwO+2IIGbi3i4yRRRWmXhcgOHscAT4R+KSuUpg3MW9v53H98qQWN2quOH9DTlEvpyLb3TCdNGKcI8k2oZvv8ttx4bvd7YRg7ycqQP2BkLbT2jCPLTfF2lurNY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785544605; c=relaxed/simple;
	bh=+5joMvKezhqeHsNspUuLUMGpXdq4IwItBd9lnnEBrI0=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=Cb6HRpbfMFyZIUJVsYhwQxN2bKPwd/bhEwQoQmbL/2nR5irn9fXwrdRlSy6HfEv0dPCx45cnG7EqJL+CFWoXbkxy6CNbGFOs6sa3EVnUsKdB9b8FmnHGbjF8kJs/IjyiZ+YHUSToX41DhFTreyRK4rKPyo43np1tKKL3rbfpckU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.208
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f208.google.com with SMTP id 5614622812f47-4a45997664aso1952399b6e.1
        for <linux-usb@vger.kernel.org>; Fri, 31 Jul 2026 17:36:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785544601; x=1786149401;
        h=content-type:to:from:subject:message-id:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8VlyWCYJT7TysYd10o2Lf3vsDxnxjCBejQio29tZ8lQ=;
        b=phwm28WdYrKHh/2MQUezc/qGDgbdpRgqFumASIhoXewC5/ST0TRsiF3wtuMtPMHrFp
         bcNZbUkKS4o0EE0oPrK6rvRJ4aWS+uxreV4wTMydTw6JBt6STFARW2VU8MalPfdjKda5
         WVxFFiDKR4KBITtpQ7a/E/n4XVZk6qD02eUBjKsVcgIbA44iYLJYcmvQ6Zjx7P4J8uX7
         1Qc2bFgo3qmFaHSWy1ccH9ZVggyzLathe/bgf3TlBMM97wFlWxXOS6vSA7dQRlN6X8dV
         oI06zSLvOfBhViw37RPrfiYXZuAvmpioB8Qe+x5Ruo5qZmJK/d+YktP5rd54UcR6heXv
         6LJg==
X-Forwarded-Encrypted: i=1; AHgh+Ro1w4pRR0x0HWM6SS2Scqg+xjPIwfoXrhfTpWguV0YDfzoAeXFjprgggE2WWM0IUCOBkA4tk3d66k4=@vger.kernel.org
X-Gm-Message-State: AOJu0YxVGqGbVfGPIXvAke+Hm25dwBDp3QGIKMgCGRYHaFtgiQUswSM8
	Lb8xb3YlNmaYPCAW7bXB/iQOoVNx8Y+xrhIZ+xso5EntF6zEekD8CDA4r/Aj4dPLKUEX/8cRJRn
	rXG1Yu6OnSFuxXQu4iIhpwXxzHhUWZuOofIyf+0tAA6VW4rAE7pOp5758s00=
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:1305:b0:4a3:95f3:68e with SMTP id
 5614622812f47-4af5e0a9efamr4372130b6e.9.1785544601074; Fri, 31 Jul 2026
 17:36:41 -0700 (PDT)
Date: Fri, 31 Jul 2026 17:36:41 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6a6d3f99.13bfb6d0.1ecdd5.0254.GAE@google.com>
Subject: [syzbot] [usb?] general protection fault in rebind_store
From: syzbot <syzbot+af76b01c9a0f0ab60fb0@syzkaller.appspotmail.com>
To: gregkh@linuxfoundation.org, i@zenithal.me, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org, shuah@kernel.org, syzkaller-bugs@googlegroups.com, 
	valentina.manea.m@gmail.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    11028ab62899 Merge tag 'probes-fixes-v7.2-rc5' of git://gi..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=10bdb1b9580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=145fa60d73086782
dashboard link: https://syzkaller.appspot.com/bug?extid=af76b01c9a0f0ab60fb0
compiler:       gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/dbf4cb7b4116/disk-11028ab6.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/77761f1559a8/vmlinux-11028ab6.xz
kernel image: https://storage.googleapis.com/syzbot-assets/bb1ed2bbff0e/bzImage-11028ab6.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+af76b01c9a0f0ab60fb0@syzkaller.appspotmail.com

Oops: general protection fault, probably for non-canonical address 0xdffffc000000001e: 0000 [#1] SMP KASAN NOPTI
KASAN: null-ptr-deref in range [0x00000000000000f0-0x00000000000000f7]
CPU: 1 UID: 0 PID: 20896 Comm: syz.4.10948 Tainted: G             L      syzkaller #0 PREEMPT(full) 
Tainted: [L]=SOFTLOCKUP
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 07/16/2026
RIP: 0010:do_rebind drivers/usb/usbip/stub_main.c:204 [inline]
RIP: 0010:rebind_store+0x147/0x2d0 drivers/usb/usbip/stub_main.c:264
Code: 53 01 00 00 48 89 d8 48 c1 e0 07 4c 8b b0 d0 4b a5 9b 48 b8 00 00 00 00 00 fc ff df 49 8d be f0 00 00 00 48 89 fa 48 c1 ea 03 <80> 3c 02 00 0f 85 30 01 00 00 4d 8b be f0 00 00 00 4d 85 ff 74 3c
RSP: 0018:ffffc9000315fc30 EFLAGS: 00010206
RAX: dffffc0000000000 RBX: 0000000000000001 RCX: 0000000000000000
RDX: 000000000000001e RSI: 0000000000000004 RDI: 00000000000000f0
RBP: ffffffff9ba54c50 R08: 0000000000000000 R09: fffffbfff374a98c
R10: ffffffff9ba54c63 R11: 0000000000000001 R12: 0000000000000001
R13: ffff888022ae03e0 R14: 0000000000000000 R15: ffff88802cb21600
FS:  00007fdc96e646c0(0000) GS:ffff888123edc000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 0000001b33f18ff8 CR3: 0000000055192000 CR4: 00000000003526f0
Call Trace:
 <TASK>
 drv_attr_store+0x74/0xb0 drivers/base/bus.c:125
 sysfs_kf_write+0xf2/0x150 fs/sysfs/file.c:145
 kernfs_fop_write_iter+0x3e0/0x5f0 fs/kernfs/file.c:345
 new_sync_write fs/read_write.c:595 [inline]
 vfs_write+0x6ac/0x1050 fs/read_write.c:687
 ksys_write+0x12a/0x250 fs/read_write.c:739
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0x115/0x870 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7fdc95f9df99
Code: ff c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 44 00 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 e8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007fdc96e64028 EFLAGS: 00000246 ORIG_RAX: 0000000000000001
RAX: ffffffffffffffda RBX: 00007fdc96225fa0 RCX: 00007fdc95f9df99
RDX: 0000000000000001 RSI: 0000200000000200 RDI: 0000000000000003
RBP: 00007fdc96034ec4 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000000
R13: 00007fdc96226038 R14: 00007fdc96225fa0 R15: 00007ffc4c3f1648
 </TASK>
Modules linked in:
---[ end trace 0000000000000000 ]---
RIP: 0010:do_rebind drivers/usb/usbip/stub_main.c:204 [inline]
RIP: 0010:rebind_store+0x147/0x2d0 drivers/usb/usbip/stub_main.c:264
Code: 53 01 00 00 48 89 d8 48 c1 e0 07 4c 8b b0 d0 4b a5 9b 48 b8 00 00 00 00 00 fc ff df 49 8d be f0 00 00 00 48 89 fa 48 c1 ea 03 <80> 3c 02 00 0f 85 30 01 00 00 4d 8b be f0 00 00 00 4d 85 ff 74 3c
RSP: 0018:ffffc9000315fc30 EFLAGS: 00010206
RAX: dffffc0000000000 RBX: 0000000000000001 RCX: 0000000000000000
RDX: 000000000000001e RSI: 0000000000000004 RDI: 00000000000000f0
RBP: ffffffff9ba54c50 R08: 0000000000000000 R09: fffffbfff374a98c
R10: ffffffff9ba54c63 R11: 0000000000000001 R12: 0000000000000001
R13: ffff888022ae03e0 R14: 0000000000000000 R15: ffff88802cb21600
FS:  00007fdc96e646c0(0000) GS:ffff888123edc000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 0000001b30f10ff8 CR3: 0000000055192000 CR4: 00000000003526f0
----------------
Code disassembly (best guess):
   0:	53                   	push   %rbx
   1:	01 00                	add    %eax,(%rax)
   3:	00 48 89             	add    %cl,-0x77(%rax)
   6:	d8 48 c1             	fmuls  -0x3f(%rax)
   9:	e0 07                	loopne 0x12
   b:	4c 8b b0 d0 4b a5 9b 	mov    -0x645ab430(%rax),%r14
  12:	48 b8 00 00 00 00 00 	movabs $0xdffffc0000000000,%rax
  19:	fc ff df
  1c:	49 8d be f0 00 00 00 	lea    0xf0(%r14),%rdi
  23:	48 89 fa             	mov    %rdi,%rdx
  26:	48 c1 ea 03          	shr    $0x3,%rdx
* 2a:	80 3c 02 00          	cmpb   $0x0,(%rdx,%rax,1) <-- trapping instruction
  2e:	0f 85 30 01 00 00    	jne    0x164
  34:	4d 8b be f0 00 00 00 	mov    0xf0(%r14),%r15
  3b:	4d 85 ff             	test   %r15,%r15
  3e:	74 3c                	je     0x7c


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

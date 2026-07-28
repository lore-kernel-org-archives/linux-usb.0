Received: from mail-oi1-f205.google.com (mail-oi1-f205.google.com [209.85.167.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25D39438461
	for <linux-usb@vger.kernel.org>; Tue, 28 Jul 2026 13:41:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785246085; cv=none; b=mHVABfZW33dQn41mJGhMJthAy0NS9Ml7RFD6XXs3cx626OR0VaX9qvnLAtjn3yJ/mRqKbFA0WhYtIVSXKH1fFBio1RNLVwPWho1AudA4amLokZqmW5t40mOL91m7fxpc6T13pwrArKrfI/Ve+qglz9sjhDZBixu7LpS/XieCgeg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785246085; c=relaxed/simple;
	bh=mQwMA4En6PenTY5EQEAu7aJIVxZ1Y6BlWgtu3HBxerY=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=TVma55Kpt/UpeY4JDrCTBtISM+swU9ighux8v0xIhgYt0fbIWUzct4+jLnmWaPAEWOyRRBqx7pOXh5nPAWQUy33PpnlNf6+oW8zYyx3+qEVw9Mv72ivuUdWg/X4XVncawtuCqUbdeB5jQMEveZHv2kQJsr/VgPhrkNN7tDPyQFY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f205.google.com with SMTP id 5614622812f47-4a49f09233fso609887b6e.0
        for <linux-usb@vger.kernel.org>; Tue, 28 Jul 2026 06:41:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785246082; x=1785850882;
        h=content-type:to:from:subject:message-id:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=F40bqAlYsUKMRnf5XPVzaVyM9J2iHn4z8Yq5DJHoK+A=;
        b=btOPBqFy8zA4sBbiIBnA3fH243XXbxF4gKsHwERdPTAJCUVe1K1RRmmlVK3pybSSEM
         /djmi97mB6ZI4I2JgcDaXsuht9eOph6TcYz5WffC0lD/g3C1vljUPG7tnFFraEwIGsgO
         vPPAMttS4Idp9LeErL4sXL6ia601Z89f/WcZYVxqzo10OHw7Bu5nMudqQiNL+B/uOf7J
         h84GquOot0wn49BJqb3dNJs5O6iidkcTiAP02jZRT3RxAjljOIusNceBf+5uxx8Yt1q9
         F+SxBNWyHlxxhW1k+cLoEXyhyCH5/JKcxHfJQPMArmvBMufUfgvsSZrNefiw1UpCCl9r
         NhVQ==
X-Forwarded-Encrypted: i=1; AHgh+RrbuiLqG6vWjjZdE3XFMfj0tKxat7CAWoRWNf9cT610Gp/lQU4slIeohM9xZ4eX5aPXKJXlu1V8Hoc=@vger.kernel.org
X-Gm-Message-State: AOJu0YyR9YGCfbIbFnzxuv7iRkEvSV3BN5DxHvWuw+CnP2PmF/b85ZFr
	KbqfZCatzBwcbbi4LUOOX8RBUgD8N6ZtpCe2yazi2uiL1eX6SgwR6qZWC3C37IRlO9wf80u1tAA
	DSDpt/43Q/qsBZfkhY8nR71AxWHHLM3Q27C5tW/TR8b/3gK0atat4OowNfE8=
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:ec5:b0:495:fd92:841f with SMTP id
 5614622812f47-4ad5ba04f84mr1157068b6e.23.1785246082090; Tue, 28 Jul 2026
 06:41:22 -0700 (PDT)
Date: Tue, 28 Jul 2026 06:41:22 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6a68b182.4c659fcc.19cd90.0020.GAE@google.com>
Subject: [syzbot] [usb?] general protection fault in f_midi2_stop_eps
From: syzbot <syzbot+bbb6dad313f4aaa8da6b@syzkaller.appspotmail.com>
To: gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    3dab139d4795 Merge tag 'rust-fixes-7.2-2' of git://git.ker..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=137366b9580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=cb17729fb04b1e3a
dashboard link: https://syzkaller.appspot.com/bug?extid=bbb6dad313f4aaa8da6b
compiler:       Debian clang version 22.1.8 (++20260613092233+e80beda6e255-1~exp1~20260613092250.77), Debian LLD 22.1.8
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=1369b746580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=134a72ea580000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/647c579a2eab/disk-3dab139d.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/8800001c8ee2/vmlinux-3dab139d.xz
kernel image: https://storage.googleapis.com/syzbot-assets/337d386facb0/bzImage-3dab139d.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+bbb6dad313f4aaa8da6b@syzkaller.appspotmail.com

Oops: general protection fault, probably for non-canonical address 0xdffffc00000000ee: 0000 [#1] SMP KASAN PTI
KASAN: null-ptr-deref in range [0x0000000000000770-0x0000000000000777]
CPU: 0 UID: 0 PID: 16 Comm: ktimers/0 Not tainted syzkaller #0 PREEMPT_{RT,(full)} 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 07/16/2026
RIP: 0010:f_midi2_free_ep_reqs drivers/usb/gadget/function/f_midi2.c:1166 [inline]
RIP: 0010:f_midi2_stop_eps+0x28e/0x4d0 drivers/usb/gadget/function/f_midi2.c:1246
Code: 89 f0 48 c1 e8 03 42 80 3c 28 00 74 08 4c 89 f7 e8 27 af e7 fa 41 bf 70 07 00 00 4d 03 3e 4c 89 f8 48 c1 e8 03 48 89 44 24 18 <42> 0f b6 04 28 84 c0 0f 85 12 02 00 00 41 8b 1f 31 ff 89 de e8 e9
RSP: 0018:ffffc900001576f8 EFLAGS: 00010206
RAX: 00000000000000ee RBX: ffff88802eae0120 RCX: ffff88801caa8000
RDX: 0000000000000100 RSI: 0000000000000000 RDI: 0000000000000100
RBP: ffff88802eae0100 R08: ffffffff8faf9337 R09: 1ffffffff1f5f266
R10: dffffc0000000000 R11: fffffbfff1f5f267 R12: ffff88802eae0770
R13: dffffc0000000000 R14: ffff88802eae0128 R15: 0000000000000770
FS:  0000000000000000(0000) GS:ffff888125c42000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 000055557b4714e8 CR3: 0000000035be2000 CR4: 00000000003526f0
Call Trace:
 <TASK>
 f_midi2_set_alt+0x11c/0xf00 drivers/usb/gadget/function/f_midi2.c:1296
 composite_setup+0x1ffd/0x3480 drivers/usb/gadget/composite.c:1933
 configfs_composite_setup+0xbd/0x100 drivers/usb/gadget/configfs.c:1877
 dummy_timer+0x2ea8/0x4b30 drivers/usb/gadget/udc/dummy_hcd.c:1937
 __run_hrtimer kernel/time/hrtimer.c:2032 [inline]
 __hrtimer_run_queues+0x3eb/0xaf0 kernel/time/hrtimer.c:2096
 hrtimer_run_softirq+0x18f/0x260 kernel/time/hrtimer.c:2113
 handle_softirqs+0x1d9/0x6c0 kernel/softirq.c:622
 __do_softirq kernel/softirq.c:656 [inline]
 run_ktimerd+0x69/0x100 kernel/softirq.c:1151
 smpboot_thread_fn+0x57c/0xa80 kernel/smpboot.c:160
 kthread+0x388/0x470 kernel/kthread.c:436
 ret_from_fork+0x514/0xb70 arch/x86/kernel/process.c:158
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245
 </TASK>
Modules linked in:
---[ end trace 0000000000000000 ]---
RIP: 0010:f_midi2_free_ep_reqs drivers/usb/gadget/function/f_midi2.c:1166 [inline]
RIP: 0010:f_midi2_stop_eps+0x28e/0x4d0 drivers/usb/gadget/function/f_midi2.c:1246
Code: 89 f0 48 c1 e8 03 42 80 3c 28 00 74 08 4c 89 f7 e8 27 af e7 fa 41 bf 70 07 00 00 4d 03 3e 4c 89 f8 48 c1 e8 03 48 89 44 24 18 <42> 0f b6 04 28 84 c0 0f 85 12 02 00 00 41 8b 1f 31 ff 89 de e8 e9
RSP: 0018:ffffc900001576f8 EFLAGS: 00010206
RAX: 00000000000000ee RBX: ffff88802eae0120 RCX: ffff88801caa8000
RDX: 0000000000000100 RSI: 0000000000000000 RDI: 0000000000000100
RBP: ffff88802eae0100 R08: ffffffff8faf9337 R09: 1ffffffff1f5f266
R10: dffffc0000000000 R11: fffffbfff1f5f267 R12: ffff88802eae0770
R13: dffffc0000000000 R14: ffff88802eae0128 R15: 0000000000000770
FS:  0000000000000000(0000) GS:ffff888125c42000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 000055557b4714e8 CR3: 0000000035be2000 CR4: 00000000003526f0
----------------
Code disassembly (best guess):
   0:	89 f0                	mov    %esi,%eax
   2:	48 c1 e8 03          	shr    $0x3,%rax
   6:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
   b:	74 08                	je     0x15
   d:	4c 89 f7             	mov    %r14,%rdi
  10:	e8 27 af e7 fa       	call   0xfae7af3c
  15:	41 bf 70 07 00 00    	mov    $0x770,%r15d
  1b:	4d 03 3e             	add    (%r14),%r15
  1e:	4c 89 f8             	mov    %r15,%rax
  21:	48 c1 e8 03          	shr    $0x3,%rax
  25:	48 89 44 24 18       	mov    %rax,0x18(%rsp)
* 2a:	42 0f b6 04 28       	movzbl (%rax,%r13,1),%eax <-- trapping instruction
  2f:	84 c0                	test   %al,%al
  31:	0f 85 12 02 00 00    	jne    0x249
  37:	41 8b 1f             	mov    (%r15),%ebx
  3a:	31 ff                	xor    %edi,%edi
  3c:	89 de                	mov    %ebx,%esi
  3e:	e8                   	.byte 0xe8
  3f:	e9                   	.byte 0xe9


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

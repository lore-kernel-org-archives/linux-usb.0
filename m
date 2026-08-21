Received: from mail-oi2-f0.google.com (mail-oi2-f0.google.com [74.125.231.192])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F6B141F5C4
	for <linux-usb@vger.kernel.org>; Fri, 21 Aug 2026 08:03:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.192
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787299438; cv=none; b=fPd5PwHf8+v7YXLzfbHWj+vRSYO3Gg4hBFnTOoK0W0hriNz0N5KKsdNzxgbCtJLe55ddz/Ft6ntw/px3WmJTi8wZ7fNH+S4wqRlhAmmKjmSobRlkI5bHSxSHBMdLo5qyBlIUen0awMnXMCM/gpyh6hNYALssH2FS0cDpo2UbmKk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787299438; c=relaxed/simple;
	bh=SC1V826d5rQ5UNHdYXdBUIidaS9ihlZ/agq6g+E5dsI=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=oyMkgD717i7XLgvTjU68lXaGP6QsTMUka0fBZs41/wHMpXhn3EvdbzdgnWYC5gOZpXmbPbYwW+W/LmBY805BGUmudKWjTFZvDYu90ymZ9qRZuWxxZf3jr/adqRbieeZ+I33nD+ORZ+xvr0QJuhk7v/fZ00RZzbrZtoGKfcAkJnU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=74.125.231.192
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi2-f0.google.com with SMTP id 5614622812f47-4a41b6fb855so267134b6e.1
        for <linux-usb@vger.kernel.org>; Fri, 21 Aug 2026 01:03:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787299435; x=1787904235;
        h=content-type:to:from:subject:message-id:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AEYb6PmEIPOKrFbk1dO8B9Ev6hLrYRC4qxRczRoQl/s=;
        b=bsncMswK5UIMwI2QWexJ+9BgJadlHj/vQkf0xasIUmbOawieh4TqjtDDw8eJEdUyQi
         PNj9kbktw9TeNvn+AimDibSKrowOzheHHL5qPjmL1EPSNg4bj9dfZmLy1UfpXw6wPKD7
         f0Z639IpdckHFzjpAeaLjqEBh3M6kr9LftfHbA1e4XDIea6vs5Fo2PC2KoFaHnHJQk3H
         sQukiJNhwY/Tf7lvfnZR91v5lEnQ1JcfJevzv2vDfY4QIE31C8ULX7bESMhS8UjRAix/
         FwSzMRL04SvzplQObJUQc2nP3SwrlfCcN5fjC5YDlwCfxusFcISB1l5jNEMwkXuTPN5j
         djBg==
X-Forwarded-Encrypted: i=1; AHgh+Rq/ki8TMlWP60Uxzkgq5RLyv1HAMZ9+yus2kelrx9OIXHPSzi2mTDDdXTquQHnaJd0hQR+weC+0HBM=@vger.kernel.org
X-Gm-Message-State: AOJu0YwgHRpbQaQSBl6U2S8DTIhpPF9Q5INdCgAsxjkIk3caAa7AZ4v5
	2M40Bj8cl2Ww4pfJoMcS+mxT+ocRNPIWgI1v02wv0rzrA6BPwmBshmk3N5BOTHdnnvP70MqGgj0
	Pwe8To9CO7hzQFWN5+mvXRdAwxzcg7kVpYID92RTiI4ycLv4EtsyvELd7hIM=
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:2f08:b0:4b2:8d89:6a40 with SMTP id
 5614622812f47-4b2ef2c9cf7mr4717931b6e.7.1787299435386; Fri, 21 Aug 2026
 01:03:55 -0700 (PDT)
Date: Fri, 21 Aug 2026 01:03:55 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6a88066b.ae6ddae5.3da009.002d.GAE@google.com>
Subject: [syzbot] [usb?] general protection fault in vhci_hcd_probe
From: syzbot <syzbot+7300affe388249d66dfe@syzkaller.appspotmail.com>
To: gregkh@linuxfoundation.org, i@zenithal.me, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org, shuah@kernel.org, syzkaller-bugs@googlegroups.com, 
	valentina.manea.m@gmail.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    4477a78374a5 Add linux-next specific files for 20260814
git tree:       linux-next
console output: https://syzkaller.appspot.com/x/log.txt?x=12bed6c6580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=9b32a36dd637b06f
dashboard link: https://syzkaller.appspot.com/bug?extid=7300affe388249d66dfe
compiler:       Debian clang version 22.1.8 (++20260613092233+e80beda6e255-1~exp1~20260613092250.77), Debian LLD 22.1.8
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=11e03a79580000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/994c1c8c560e/disk-4477a783.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/cd54543d69ae/vmlinux-4477a783.xz
kernel image: https://storage.googleapis.com/syzbot-assets/407cdf8f3fc2/bzImage-4477a783.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+7300affe388249d66dfe@syzkaller.appspotmail.com

Oops: general protection fault, probably for non-canonical address 0xdffffc0000000000: 0000 [#1] SMP KASAN PTI
KASAN: null-ptr-deref in range [0x0000000000000000-0x0000000000000007]
CPU: 1 UID: 0 PID: 5839 Comm: syz.0.17 Not tainted syzkaller #0 PREEMPT(full) 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 07/24/2026
RIP: 0010:vhci_hcd_probe+0x47/0x3e0 drivers/usb/usbip/vhci_hcd.c:1367
Code: ff 0b eb f9 49 8d 9e 80 00 00 00 48 89 d8 48 c1 e8 03 80 3c 28 00 74 08 48 89 df e8 33 86 59 fa 48 8b 1b 48 89 d8 48 c1 e8 03 <80> 3c 28 00 74 08 48 89 df e8 1b 86 59 fa 4c 8b 23 48 c7 c0 20 e5
RSP: 0018:ffffc9000397fac0 EFLAGS: 00010246
RAX: 0000000000000000 RBX: 0000000000000000 RCX: ffff88802a031f40
RDX: 0000000000000000 RSI: 0000000000000000 RDI: ffff88801c76c000
RBP: dffffc0000000000 R08: ffff88802a6f9873 R09: 1ffff110054df30e
R10: dffffc0000000000 R11: ffffffff87dcb110 R12: ffff88801c76c000
R13: ffffffff8fc690a0 R14: ffff88801c76c000 R15: ffffffff87dcb110
FS:  000055556104d500(0000) GS:ffff888124df8000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007fe52c870000 CR3: 0000000075d5a000 CR4: 00000000003526f0
Call Trace:
 <TASK>
 platform_probe+0xf9/0x190 drivers/base/platform.c:1507
 call_driver_probe drivers/base/dd.c:-1 [inline]
 really_probe+0x254/0xae0 drivers/base/dd.c:706
 __driver_probe_device+0x1e8/0x360 drivers/base/dd.c:868
 device_driver_attach+0xe0/0x1d0 drivers/base/dd.c:1203
 bind_store+0x1d0/0x220 drivers/base/bus.c:267
 kernfs_fop_write_iter+0x3a4/0x540 fs/kernfs/file.c:345
 new_sync_write fs/read_write.c:595 [inline]
 vfs_write+0x612/0xba0 fs/read_write.c:687
 ksys_write+0x150/0x270 fs/read_write.c:739
 do_syscall_x64 arch/x86/entry/syscall_64.c:61 [inline]
 do_syscall_64+0x166/0x520 arch/x86/entry/syscall_64.c:84
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7fe52c99e0d9
Code: ff c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 44 00 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 e8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007ffc9f637838 EFLAGS: 00000246 ORIG_RAX: 0000000000000001
RAX: ffffffffffffffda RBX: 00007fe52cc25fa0 RCX: 00007fe52c99e0d9
RDX: 0000000000000006 RSI: 00002000000000c0 RDI: 0000000000000004
RBP: 00007fe52ca35024 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000000
R13: 00007fe52cc25fac R14: 00007fe52cc25fa0 R15: 00007fe52cc25fa0
 </TASK>
Modules linked in:
---[ end trace 0000000000000000 ]---
RIP: 0010:vhci_hcd_probe+0x47/0x3e0 drivers/usb/usbip/vhci_hcd.c:1367
Code: ff 0b eb f9 49 8d 9e 80 00 00 00 48 89 d8 48 c1 e8 03 80 3c 28 00 74 08 48 89 df e8 33 86 59 fa 48 8b 1b 48 89 d8 48 c1 e8 03 <80> 3c 28 00 74 08 48 89 df e8 1b 86 59 fa 4c 8b 23 48 c7 c0 20 e5
RSP: 0018:ffffc9000397fac0 EFLAGS: 00010246
RAX: 0000000000000000 RBX: 0000000000000000 RCX: ffff88802a031f40
RDX: 0000000000000000 RSI: 0000000000000000 RDI: ffff88801c76c000
RBP: dffffc0000000000 R08: ffff88802a6f9873 R09: 1ffff110054df30e
R10: dffffc0000000000 R11: ffffffff87dcb110 R12: ffff88801c76c000
R13: ffffffff8fc690a0 R14: ffff88801c76c000 R15: ffffffff87dcb110
FS:  000055556104d500(0000) GS:ffff888124df8000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007fe52c870000 CR3: 0000000075d5a000 CR4: 00000000003526f0
----------------
Code disassembly (best guess):
   0:	ff 0b                	decl   (%rbx)
   2:	eb f9                	jmp    0xfffffffd
   4:	49 8d 9e 80 00 00 00 	lea    0x80(%r14),%rbx
   b:	48 89 d8             	mov    %rbx,%rax
   e:	48 c1 e8 03          	shr    $0x3,%rax
  12:	80 3c 28 00          	cmpb   $0x0,(%rax,%rbp,1)
  16:	74 08                	je     0x20
  18:	48 89 df             	mov    %rbx,%rdi
  1b:	e8 33 86 59 fa       	call   0xfa598653
  20:	48 8b 1b             	mov    (%rbx),%rbx
  23:	48 89 d8             	mov    %rbx,%rax
  26:	48 c1 e8 03          	shr    $0x3,%rax
* 2a:	80 3c 28 00          	cmpb   $0x0,(%rax,%rbp,1) <-- trapping instruction
  2e:	74 08                	je     0x38
  30:	48 89 df             	mov    %rbx,%rdi
  33:	e8 1b 86 59 fa       	call   0xfa598653
  38:	4c 8b 23             	mov    (%rbx),%r12
  3b:	48                   	rex.W
  3c:	c7                   	.byte 0xc7
  3d:	c0 20 e5             	shlb   $0xe5,(%rax)


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

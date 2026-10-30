Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793327804;
	b=rYQ0z9VLNpexUyInRbXya0EWBxbqsKXG5XlNWrC1HV5fD6eh02AeJhQhx1YdY+fSA9+K
	 Ytosl7T0IUpa4bnfFtJcQnJ7YOMOHxmY1OFiCN8gtKs/6y8zPwC3IcKxaptnLAJoCjuaR
	 buMSrZQwRAin2685Z/2W5lg6pNsi1Vw7iJk/xWQ6SGjLILj/HpQNxiP6FmprC+ONVk9FE
	 ThSR9yetE5fewAKYbrdTnAio4/xSN+2UGHxnbXa0XHhR+sdrxvGDadJMknPwxbgQvWjNc
	 78q8N1dTYaXZbUqVcLVz0IGiVJG8ZM8UvBHrtiOMWWkSZ7gZD6qW+C/2AuvsvBEAKhA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793327804;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:MIME-Version:X-Received:Date:
	 X-Google-Appengine-App-Id:X-Google-Appengine-App-Id-Alias:Message-ID:
	 Subject:From:To:Content-Type;
	bh=V/lnB9MH/HLYg6xkfRQbx6bEKxiHrzo85vIOCGxcRf0=;
	b=gDG9Blx2EOH3d0l+U4rhVwWMldWsrEr3TQFyKiu/YMozI6pZkl063BulNk2yLRH/8esC
	 Z6dKa+heeXYwloZDFPaQ6qJ8Qq33U7zJhLfB3wL3ujYCMqN9/t2cOPWriO7qkas2c8z01
	 XEYOoYxzjR0vIKbNkyoUtFCeQQ0fCeDm5cR/9mFtNOO8wdZGljnksCBB06qWf1BD84pWM
	 xpJl2zVLQGBsNmHqBn4DBTAj4gV5pt4MoDrkoilF1iqEg2nTYKP+jqFFrMJQmX1PBmTEd
	 DXM8MyggYwv4ys3gBwQXWLnXBfIUpbSJnHqlRioYIkeD6li4YkWEWQz+5zJXil3rBCQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=syzkaller.appspotmail.com;
	spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com;
	arc=none smtp.remote-ip=209.85.167.199
Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com [209.85.167.199])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D94E4606A31A
	for <linux-usb@vger.kernel.org>; Fri, 30 Oct 2026 02:36:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D94E4606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f199.google.com with SMTP id 5614622812f47-55bf11583d9so398524b6e.1
        for <linux-usb@vger.kernel.org>; Thu, 29 Oct 2026 19:36:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793327803; x=1793932603;
        h=content-type:to:from:subject:message-id:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=V/lnB9MH/HLYg6xkfRQbx6bEKxiHrzo85vIOCGxcRf0=;
        b=GtlzgWHWijt5B70ckbW9UfQ8c/YyHijsSGH+lmerM2roVGgGXpfF47MBJoyWtEf7Ey
         x5OKGJJsY0tquoleNq5fQBdowwf8/zc1Mr6STwPh7FkC+FokGth9dDrWQyHU/gJw+ok7
         qeIT/qvVDf+4/2t8Y2vWU3SOl1H8H292u4G7dwln0dQiZMkDs4XVNjXt5xnlVWkBGS8I
         HTmke6ThCgV+3cqX+j6CBNVVMw7+zoCF7LUK2KHCQnz3lLuGguYhvgGgY0vSdJHdL227
         ZmL8F+n+shkNEUSMDX3Zg/IkgVjRg7wLXJBODKcENmTZtuiOfQYFGrgMeAviWqYxD6GM
         fTKg==
X-Forwarded-Encrypted: i=1; AKwUvBzbvYKp+NWteXWOh2ID+Zy4CsEKfuSzLS3YecqsjPT1e2xYxpUGylhv+29fS1/b7HGXdTa1/XQa0Vs=@vger.kernel.org
X-Gm-Message-State: AFq9FYIJh5Yp8pGeQrgii0ktKyCE0TH5eeSNkpC5ziLJmJdQubpk7Tni
	oifsxSCsZ5vi/LxWf/k8CsCOY+q0QGRbbWHbE3PFT9+iBz/wEr76wiPj4xsc73pQ2zjVUtb5jyH
	zfCBDmhNcUIeutRnOKg5dnc5TDR+wmJVPaBFnXfdfM7kReytVbyC0rXnQAGo=
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Received: by 2002:a05:6808:1687:b0:4f1:5068:b93b with SMTP id
 5614622812f47-563ef93de1cmr2489055b6e.14.1793327802984; Thu, 29 Oct 2026
 19:36:42 -0700 (PDT)
Date: Thu, 29 Oct 2026 19:36:42 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6ae402ba.0c1d3ab6.e3d48.006b.GAE@google.com>
Subject: [syzbot] [spi?] [usb?] WARNING in spi_register_controller (2)
From: syzbot <syzbot+41172204e7323356ecdb@syzkaller.appspotmail.com>
To: broonie@kernel.org, linux-kernel@vger.kernel.org, 
	linux-spi@vger.kernel.org, linux-usb@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    c339f4010dea Merge tag 'platform-drivers-x86-v7.4-1' of gi..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=17d07259580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=4a49f7c2815c8df7
dashboard link: https://syzkaller.appspot.com/bug?extid=41172204e7323356ecdb
compiler:       Debian clang version 22.1.8 (1~deb13u4), Debian LLD 22.1.8
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=1420a1a5580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=1271cef1580000

Downloadable assets:
disk image (non-bootable): https://storage.googleapis.com/syzbot-assets/d900f083ada3/non_bootable_disk-c339f401.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/2aba9a3fc60c/vmlinux-c339f401.xz
kernel image: https://storage.googleapis.com/syzbot-assets/a3c085a78213/bzImage-c339f401.xz

AI-generated root cause summary:
In spi_controller_id_alloc() (drivers/spi/spi.c), idr_alloc() can return -ENOMEM
when radix tree memory allocation fails under memory pressure or fault
injection. The function inappropriately invokes WARN(id < 0, "couldn't get idr")
on any failure rather than handling expected runtime allocation errors silently.
In production builds without panic_on_warn, execution continues, locks are
properly released, and the error is cleanly propagated and handled by callers
without causing denial of service or memory corruption.

full analysis:  https://syzkaller.appspot.com/x/ai_root_cause?x=41172204e7323356ecdb

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+41172204e7323356ecdb@syzkaller.appspotmail.com

R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000002
R13: 00007fe4d0225fac R14: 00007fe4d0225fa0 R15: 00007fe4d0225fa0
 </TASK>
------------[ cut here ]------------
couldn't get idr
WARNING: drivers/spi/spi.c:3634 at spi_controller_id_alloc drivers/spi/spi.c:3634 [inline], CPU#0: syz.0.17/5588
WARNING: drivers/spi/spi.c:3634 at spi_register_controller+0x1261/0x1670 drivers/spi/spi.c:3697, CPU#0: syz.0.17/5588
Modules linked in:
CPU: 0 UID: 0 PID: 5588 Comm: syz.0.17 Not tainted syzkaller #0 PREEMPT(full) 
Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.3-debian-1.16.3-2 04/01/2014
RIP: 0010:spi_controller_id_alloc drivers/spi/spi.c:3634 [inline]
RIP: 0010:spi_register_controller+0x1261/0x1670 drivers/spi/spi.c:3697
Code: 8c e8 33 d5 79 fa e9 1e ff ff ff e8 a9 a6 16 fb 48 8d 3d 72 3f 18 0b 67 48 0f b9 3a eb 11 e8 96 a6 16 fb 48 8d 3d 6f 3f 18 0b <67> 48 0f b9 3a bf e4 ff ff ff 44 89 f6 e8 8d ab 16 fb 41 83 fe e4
RSP: 0018:ffffc90004de7878 EFLAGS: 00010293
RAX: ffffffff86b27e5a RBX: ffff888050e4a000 RCX: ffff888034fc4b00
RDX: 0000000000000000 RSI: 00000000fffffff4 RDI: ffffffff91cabdd0
RBP: 0000000000000000 R08: ffffc90004de7807 R09: 1ffff920009bcf00
R10: dffffc0000000000 R11: fffff520009bcf01 R12: 1ffff1100a1c9408
R13: dffffc0000000000 R14: 00000000fffffff4 R15: ffff888050e4a4d8
FS:  000055558743d500(0000) GS:ffff88808aa10000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007fbfc3e0ca90 CR3: 0000000040ab8000 CR4: 0000000000352ef0
Call Trace:
 <TASK>
 msi2500_probe+0x4c6/0x9e0 drivers/media/usb/msi2500/msi2500.c:1249
 usb_probe_interface+0x751/0xe00 drivers/usb/core/driver.c:399
 call_driver_probe drivers/base/dd.c:-1 [inline]
 really_probe+0x254/0xae0 drivers/base/dd.c:707
 __driver_probe_device+0x1e8/0x360 drivers/base/dd.c:869
 driver_probe_device+0x4f/0x240 drivers/base/dd.c:899
 __device_attach_driver+0x270/0x410 drivers/base/dd.c:1027
 bus_for_each_drv+0x258/0x2f0 drivers/base/bus.c:503
 __device_attach+0x2bd/0x430 drivers/base/dd.c:1131
 proc_ioctl+0x409/0x660 drivers/usb/core/devio.c:2370
 proc_ioctl_default+0xc4/0x110 drivers/usb/core/devio.c:2405
 usbdev_do_ioctl drivers/usb/core/devio.c:2769 [inline]
 usbdev_ioctl+0x139d/0x21a0 drivers/usb/core/devio.c:2829
 vfs_ioctl fs/ioctl.c:51 [inline]
 __do_sys_ioctl fs/ioctl.c:597 [inline]
 __se_sys_ioctl+0xfc/0x170 fs/ioctl.c:583
 do_syscall_x64 arch/x86/entry/syscall_64.c:61 [inline]
 do_syscall_64+0x166/0x520 arch/x86/entry/syscall_64.c:84
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7fe4cff9f559
Code: ff c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 44 00 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 e8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007ffc6b706298 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
RAX: ffffffffffffffda RBX: 00007fe4d0225fa0 RCX: 00007fe4cff9f559
RDX: 0000200000000900 RSI: 00000000c0105512 RDI: 0000000000000004
RBP: 00007ffc6b706300 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000002
R13: 00007fe4d0225fac R14: 00007fe4d0225fa0 R15: 00007fe4d0225fa0
 </TASK>
----------------
Code disassembly (best guess):
   0:	8c e8                	mov    %gs,%eax
   2:	33 d5                	xor    %ebp,%edx
   4:	79 fa                	jns    0x0
   6:	e9 1e ff ff ff       	jmp    0xffffff29
   b:	e8 a9 a6 16 fb       	call   0xfb16a6b9
  10:	48 8d 3d 72 3f 18 0b 	lea    0xb183f72(%rip),%rdi        # 0xb183f89
  17:	67 48 0f b9 3a       	ud1    (%edx),%rdi
  1c:	eb 11                	jmp    0x2f
  1e:	e8 96 a6 16 fb       	call   0xfb16a6b9
  23:	48 8d 3d 6f 3f 18 0b 	lea    0xb183f6f(%rip),%rdi        # 0xb183f99
* 2a:	67 48 0f b9 3a       	ud1    (%edx),%rdi <-- trapping instruction
  2f:	bf e4 ff ff ff       	mov    $0xffffffe4,%edi
  34:	44 89 f6             	mov    %r14d,%esi
  37:	e8 8d ab 16 fb       	call   0xfb16abc9
  3c:	41 83 fe e4          	cmp    $0xffffffe4,%r14d


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

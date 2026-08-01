Received: from mail-oi1-f206.google.com (mail-oi1-f206.google.com [209.85.167.206])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C95EA2DF128
	for <linux-usb@vger.kernel.org>; Sat,  1 Aug 2026 00:12:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.206
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785543145; cv=none; b=DmLRWBM42Zl7STdHNrwhpW7P15IvUmhGIdvF8uuigilzP8A3cLFe11AKmlKmDcQKLmyqN7cn/9w37X+g9zbET9N8PTKcXRY7efZ0u2g8/Rt/gQkKjtzBSU6LcNiX5psKf/zRbTLLTA5iddm7Nlfo9PCGwVTFowWAVNE1v7U+gSU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785543145; c=relaxed/simple;
	bh=qzQ1gXmrOvGorHas1558iBN5GH6CbQwolGzLA4IcEYQ=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=qIHASfipIwEnfpX0T9nOC5BECLl5G17piMc7pD79u7z/RUcs9HT/rj0gdPSYlhaCh+ntmE4lkJETuyCTUGffwz3FP4yW9xOSfZEU2ieg9na7ImFxYXHrRI2fQMGXVrWRMaAsngCGLHM954PAYpKxt81u7awCZ8BVV6QwxuBz8nQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.206
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f206.google.com with SMTP id 5614622812f47-4a41f46d629so2050619b6e.3
        for <linux-usb@vger.kernel.org>; Fri, 31 Jul 2026 17:12:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785543143; x=1786147943;
        h=content-type:to:from:subject:message-id:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TKXpbGVDZvyCcLxvoLhJD9bOkM/aUBZI0eom7XuvxU8=;
        b=q+LkvjgArMxHxD1xvimc992r43f9y46WYkzbU2hF2JgUisFmNvlWxxN07bhM9blDZk
         cKqt7wgIq17NeU72lZE3OVIdRV8465w8RGiBRHJEfUxZm+JFLgvCsWC1mJjCyKtqyvf1
         EkzaQ6kLJezaFWeC9YdDS2X3OvQzeh0/A+n6Hd2K48YtCb7IHkcR654YKEv7a4E9Ct1c
         nwRMy8SlGVkvou5LKR4xD6J2IN5zEIRLBQLb2hMIXN2RAH27w1CnV0pfRa02c5R4dzE0
         HS6t8d23jMVvbx8tf+/i5mnHm4UjI5KMFsmJ9NzomJ3syqMv1fNzXwPEQVzo2vekirSc
         Tg3Q==
X-Forwarded-Encrypted: i=1; AHgh+RoYi7fekSaNzUhOB7Bex6BNz80Kd54I8nb9Db9bPByyo048h5s1nAi18IbIoozECCR5+J1DeFoB7Yo=@vger.kernel.org
X-Gm-Message-State: AOJu0YxkTmx11l2iIasH5gfVxYn9iTyE+gC/o4TDBQD5PiTk8UVdmNlt
	RqE1K1YSFzAbzp3PhOgyWyhyKsTaRFvQzNM6/x9rNXGQgNuZO1PT3AMgl+hDHT7m6u05br3d2nh
	QvJqFmD09n4OE8AyqPYEKelo0uD8fYYYrfZ1qZjKoBHtUp0WT+XDxJ+AG30A=
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:1301:b0:493:a850:d93a with SMTP id
 5614622812f47-4af5e160463mr4259173b6e.6.1785543142728; Fri, 31 Jul 2026
 17:12:22 -0700 (PDT)
Date: Fri, 31 Jul 2026 17:12:22 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6a6d39e6.f794c993.27aeb.0007.GAE@google.com>
Subject: [syzbot] [usb?] general protection fault in request_ihex_firmware
From: syzbot <syzbot+cb67625c47fe4d6dd7c8@syzkaller.appspotmail.com>
To: gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    3b5f4b83c4ab Merge tag 'for-7.2-rc5-tag' of git://git.kern..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=154005c1580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=145fa60d73086782
dashboard link: https://syzkaller.appspot.com/bug?extid=cb67625c47fe4d6dd7c8
compiler:       gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=104192a9580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=113df8c6580000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/f99ca00b02a2/disk-3b5f4b83.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/5caff5208bfc/vmlinux-3b5f4b83.xz
kernel image: https://storage.googleapis.com/syzbot-assets/c0e941f5f816/bzImage-3b5f4b83.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+cb67625c47fe4d6dd7c8@syzkaller.appspotmail.com

usb 1-1: New USB device found, idVendor=086a, idProduct=0100, bcdDevice= 0.01
usb 1-1: New USB device strings: Mfr=0, Product=0, SerialNumber=0
emi26 - firmware loader 1-1:1.0: emi26_probe start
Oops: general protection fault, probably for non-canonical address 0xdffffc0000000000: 0000 [#1] SMP KASAN NOPTI
KASAN: null-ptr-deref in range [0x0000000000000000-0x0000000000000007]
CPU: 1 UID: 0 PID: 24 Comm: kworker/1:0 Not tainted syzkaller #0 PREEMPT(full) 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 07/16/2026
Workqueue: usb_hub_wq hub_event
RIP: 0010:ihex_validate_fw include/linux/ihex.h:56 [inline]
RIP: 0010:request_ihex_firmware.constprop.0+0x11e/0x250 include/linux/ihex.h:74
Code: 48 89 04 24 e8 13 11 b8 00 4c 39 24 24 0f 82 94 00 00 00 e8 04 11 b8 00 49 8d 7c 24 04 48 89 f8 48 89 fe 48 c1 e8 03 83 e6 07 <42> 8a 0c 38 49 8d 44 24 05 48 89 c2 48 c1 ea 03 40 38 f1 40 0f 9e
RSP: 0018:ffffc900001e6ec8 EFLAGS: 00010202
RAX: 0000000000000000 RBX: dffffc0000000000 RCX: ffffffff81524ec7
RDX: ffff88801f2a0000 RSI: 0000000000000004 RDI: 0000000000000004
RBP: 0000000000000000 R08: 0000000000000005 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000000 R12: 0000000000000000
R13: ffff88802be73980 R14: ffffc900001e6fe8 R15: dffffc0000000000
FS:  0000000000000000(0000) GS:ffff888123edc000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007fbca99eb580 CR3: 0000000072d5e000 CR4: 00000000003526f0
Call Trace:
 <TASK>
 emi26_load_firmware drivers/usb/misc/emi26.c:86 [inline]
 emi26_probe+0x13c/0xe30 drivers/usb/misc/emi26.c:232
 usb_probe_interface+0x303/0x8f0 drivers/usb/core/driver.c:396
 call_driver_probe drivers/base/dd.c:628 [inline]
 really_probe+0x241/0xa60 drivers/base/dd.c:706
 __driver_probe_device+0x20e/0x450 drivers/base/dd.c:868
 driver_probe_device+0x4a/0x140 drivers/base/dd.c:898
 __device_attach_driver+0x1df/0x320 drivers/base/dd.c:1026
 bus_for_each_drv+0x159/0x1e0 drivers/base/bus.c:500
 __device_attach+0x1e4/0x4d0 drivers/base/dd.c:1098
 device_initial_probe+0xaf/0xd0 drivers/base/dd.c:1153
 bus_probe_device+0x64/0x160 drivers/base/bus.c:620
 device_add+0x121d/0x1970 drivers/base/core.c:3772
 usb_set_configuration+0xd97/0x1c60 drivers/usb/core/message.c:2268
 usb_generic_driver_probe+0xa1/0xe0 drivers/usb/core/generic.c:250
 usb_probe_device+0xef/0x400 drivers/usb/core/driver.c:291
 call_driver_probe drivers/base/dd.c:628 [inline]
 really_probe+0x241/0xa60 drivers/base/dd.c:706
 __driver_probe_device+0x20e/0x450 drivers/base/dd.c:868
 driver_probe_device+0x4a/0x140 drivers/base/dd.c:898
 __device_attach_driver+0x1df/0x320 drivers/base/dd.c:1026
 bus_for_each_drv+0x159/0x1e0 drivers/base/bus.c:500
 __device_attach+0x1e4/0x4d0 drivers/base/dd.c:1098
 device_initial_probe+0xaf/0xd0 drivers/base/dd.c:1153
 bus_probe_device+0x64/0x160 drivers/base/bus.c:620
 device_add+0x121d/0x1970 drivers/base/core.c:3772
 usb_new_device.cold+0x685/0x115c drivers/usb/core/hub.c:2695
 hub_port_connect drivers/usb/core/hub.c:5567 [inline]
 hub_port_connect_change drivers/usb/core/hub.c:5707 [inline]
 port_event drivers/usb/core/hub.c:5871 [inline]
 hub_event+0x30a3/0x4a60 drivers/usb/core/hub.c:5953
 process_one_work+0xa23/0x1940 kernel/workqueue.c:3322
 process_scheduled_works kernel/workqueue.c:3405 [inline]
 worker_thread+0x5ef/0xe50 kernel/workqueue.c:3486
 kthread+0x370/0x450 kernel/kthread.c:436
 ret_from_fork+0x72b/0xd50 arch/x86/kernel/process.c:158
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245
 </TASK>
Modules linked in:
---[ end trace 0000000000000000 ]---
RIP: 0010:ihex_validate_fw include/linux/ihex.h:56 [inline]
RIP: 0010:request_ihex_firmware.constprop.0+0x11e/0x250 include/linux/ihex.h:74
Code: 48 89 04 24 e8 13 11 b8 00 4c 39 24 24 0f 82 94 00 00 00 e8 04 11 b8 00 49 8d 7c 24 04 48 89 f8 48 89 fe 48 c1 e8 03 83 e6 07 <42> 8a 0c 38 49 8d 44 24 05 48 89 c2 48 c1 ea 03 40 38 f1 40 0f 9e
RSP: 0018:ffffc900001e6ec8 EFLAGS: 00010202
RAX: 0000000000000000 RBX: dffffc0000000000 RCX: ffffffff81524ec7
RDX: ffff88801f2a0000 RSI: 0000000000000004 RDI: 0000000000000004
RBP: 0000000000000000 R08: 0000000000000005 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000000 R12: 0000000000000000
R13: ffff88802be73980 R14: ffffc900001e6fe8 R15: dffffc0000000000
FS:  0000000000000000(0000) GS:ffff888123edc000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007fbca99eb580 CR3: 000000007e506000 CR4: 00000000003526f0
----------------
Code disassembly (best guess):
   0:	48 89 04 24          	mov    %rax,(%rsp)
   4:	e8 13 11 b8 00       	call   0xb8111c
   9:	4c 39 24 24          	cmp    %r12,(%rsp)
   d:	0f 82 94 00 00 00    	jb     0xa7
  13:	e8 04 11 b8 00       	call   0xb8111c
  18:	49 8d 7c 24 04       	lea    0x4(%r12),%rdi
  1d:	48 89 f8             	mov    %rdi,%rax
  20:	48 89 fe             	mov    %rdi,%rsi
  23:	48 c1 e8 03          	shr    $0x3,%rax
  27:	83 e6 07             	and    $0x7,%esi
* 2a:	42 8a 0c 38          	mov    (%rax,%r15,1),%cl <-- trapping instruction
  2e:	49 8d 44 24 05       	lea    0x5(%r12),%rax
  33:	48 89 c2             	mov    %rax,%rdx
  36:	48 c1 ea 03          	shr    $0x3,%rdx
  3a:	40 38 f1             	cmp    %sil,%cl
  3d:	40                   	rex
  3e:	0f                   	.byte 0xf
  3f:	9e                   	sahf


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

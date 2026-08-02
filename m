Received: from mail-oi1-f207.google.com (mail-oi1-f207.google.com [209.85.167.207])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74D1C26B755
	for <linux-usb@vger.kernel.org>; Sun,  2 Aug 2026 00:00:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.207
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785628837; cv=none; b=oZL5FhO9lXFwfbNKyZcm/r+8JMJcpvgFfdhyjcie3qEx1K9VVre42Ezi9CABPuWZUve1n5hYbwMYfLZ42ARdJwB4T6Xq4X2p0Qz7zGfLffr8cNqeb+r0GPkBgU9S27olfRnR4AE/0jYbx87EagBFHyOX6VshZsneLZ7C5VRCllw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785628837; c=relaxed/simple;
	bh=ks6gcrOCzGEbLjwPSycMfAiXtoSvCn2EHdGjsoJ6CwE=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=H2XlbFhl5fQ4oX0wO0JifZ1C30sh0uNvXvMoFvE448+3QpweTXr4tUk2iE+A6GvWGSZyixXmlYqZ+g9+T+BuGvqRNgVZeLmCezNgwymEFpq0ZlF2MVtcd3dWNt6Yc1czcgLrqoZQqgXJNSiC1s2j/1d14j9zlmEXeEjVztDy4DA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.207
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f207.google.com with SMTP id 5614622812f47-4a41f46d629so3256081b6e.3
        for <linux-usb@vger.kernel.org>; Sat, 01 Aug 2026 17:00:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785628834; x=1786233634;
        h=content-type:to:from:subject:message-id:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Mt3Mk6075yffTYdkx+TP1YX32OctoNGwduY8tDf1C1s=;
        b=DcTx/4Z2Mh3cHTTrP/0caLye456JTxsr3D175yq4oWnOszSRAXdbHgYUYGoWERGhD7
         6NtHVZoxEcbcjK8KSNQto4C8NKzT9Z8xjKTBMaELTgGal1LVEKfpJJujKOShSerre4ny
         JTdpXAaxeKQZ2qGlCqK0RVtUcqWDW1/QHYXr8VPrOnlbuXhqbC3YRuNxwGFGPbZ6J//S
         BA2BzXBLuuQsKpuu+Wj0Rfh1CUVBJMiErkBErcKw7obBBOiSbv4jzsMXJrlhNgPI7/gk
         IEPV12uJENrL55StJhNo/+QSW0ptiZrfWtFa+iYBu024HbjAnGAvbDwSINcquoqfkvHO
         hYSg==
X-Forwarded-Encrypted: i=1; AHgh+RpaBUOcCkFqXAZkif0vAjaQF7CWeyF3wIiG7YtoEBtuqCuDHxbsaQskRkA3Ok874/bp4uhfjqwtCoc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzuft6/wAHb1sfx+HHLdt3THRuPbceNS/VG/hrmZBlpMDEy8y5w
	KjxbHlS1pMHexX3XNedssWGXQoIMw5bBrXn4yU75BFq5cofUmcudPmxiWsVDH2fVT3YEQXO3DsD
	hOGCorfzFjlgqOFJKLUjMj9MNMpKZXrNhohQAD9l11W5UZJ5FjtjS522nffU=
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:f8f:b0:4a4:c623:4c0b with SMTP id
 5614622812f47-4af5e0cdd9fmr9061859b6e.4.1785628834280; Sat, 01 Aug 2026
 17:00:34 -0700 (PDT)
Date: Sat, 01 Aug 2026 17:00:34 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6a6e88a2.13bfb6d0.1ecdd5.0262.GAE@google.com>
Subject: [syzbot] [usb?] general protection fault in emi26_probe
From: syzbot <syzbot+baf3cbba7dd980984f0d@syzkaller.appspotmail.com>
To: gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    fc02acf6ac0c Merge tag 'platform-drivers-x86-v7.2-4' of gi..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=139b59b9580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=4e38b15c29e6a1d9
dashboard link: https://syzkaller.appspot.com/bug?extid=baf3cbba7dd980984f0d
compiler:       Debian clang version 22.1.8 (++20260613092233+e80beda6e255-1~exp1~20260613092250.77), Debian LLD 22.1.8

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/957761aebfb4/disk-fc02acf6.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/fb6aa2e6120f/vmlinux-fc02acf6.xz
kernel image: https://storage.googleapis.com/syzbot-assets/f6ccc88e735d/bzImage-fc02acf6.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+baf3cbba7dd980984f0d@syzkaller.appspotmail.com

emi26 - firmware loader 9-1:1.0: emi26_probe start
Oops: general protection fault, probably for non-canonical address 0xdffffc0000000000: 0000 [#1] SMP KASAN NOPTI
KASAN: null-ptr-deref in range [0x0000000000000000-0x0000000000000007]
CPU: 1 UID: 0 PID: 5776 Comm: kworker/1:5 Not tainted syzkaller #0 PREEMPT(full) 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 07/16/2026
Workqueue: usb_hub_wq hub_event
RIP: 0010:ihex_binrec_size include/linux/ihex.h:26 [inline]
RIP: 0010:__ihex_next_binrec include/linux/ihex.h:35 [inline]
RIP: 0010:ihex_validate_fw include/linux/ihex.h:54 [inline]
RIP: 0010:request_ihex_firmware include/linux/ihex.h:74 [inline]
RIP: 0010:emi26_load_firmware drivers/usb/misc/emi26.c:86 [inline]
RIP: 0010:emi26_probe+0x283/0x1690 drivers/usb/misc/emi26.c:232
Code: ff 89 de e8 ef 8c 98 00 85 db 0f 84 d9 01 00 00 e8 42 89 98 00 48 bb 00 00 00 00 00 fc ff df 49 8d 7e 04 48 89 f8 48 c1 e8 03 <0f> b6 04 18 84 c0 75 47 49 8d 7e 05 48 89 f8 48 c1 e8 03 0f b6 04
RSP: 0018:ffffc900041eed60 EFLAGS: 00010257
RAX: 0000000000000000 RBX: dffffc0000000000 RCX: 0000000000100000
RDX: ffffc9001de82000 RSI: 000000000001a590 RDI: 0000000000000004
RBP: ffffc900041eee90 R08: ffffffff90579237 R09: 1ffffffff20af246
R10: dffffc0000000000 R11: fffffbfff20af247 R12: fffffffffffffffa
R13: 1fffffffffffffff R14: 0000000000000000 R15: 1fffffffffffffff
FS:  0000000000000000(0000) GS:ffff88812504e000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 000000110c3f2e7f CR3: 000000006020d000 CR4: 0000000000350ef0
Call Trace:
 <TASK>
 usb_probe_interface+0x653/0xc60 drivers/usb/core/driver.c:396
 call_driver_probe drivers/base/dd.c:-1 [inline]
 really_probe+0x254/0xae0 drivers/base/dd.c:706
 __driver_probe_device+0x1e8/0x360 drivers/base/dd.c:868
 driver_probe_device+0x4f/0x240 drivers/base/dd.c:898
 __device_attach_driver+0x270/0x410 drivers/base/dd.c:1026
 bus_for_each_drv+0x258/0x2f0 drivers/base/bus.c:500
 __device_attach+0x2c4/0x450 drivers/base/dd.c:1098
 device_initial_probe+0xa1/0xd0 drivers/base/dd.c:1153
 bus_probe_device+0x12a/0x220 drivers/base/bus.c:620
 device_add+0x7d7/0xb80 drivers/base/core.c:3772
 usb_set_configuration+0x1ad8/0x2180 drivers/usb/core/message.c:2268
 usb_generic_driver_probe+0x8d/0x150 drivers/usb/core/generic.c:250
 usb_probe_device+0x1c3/0x3b0 drivers/usb/core/driver.c:291
 call_driver_probe drivers/base/dd.c:-1 [inline]
 really_probe+0x254/0xae0 drivers/base/dd.c:706
 __driver_probe_device+0x1e8/0x360 drivers/base/dd.c:868
 driver_probe_device+0x4f/0x240 drivers/base/dd.c:898
 __device_attach_driver+0x270/0x410 drivers/base/dd.c:1026
 bus_for_each_drv+0x258/0x2f0 drivers/base/bus.c:500
 __device_attach+0x2c4/0x450 drivers/base/dd.c:1098
 device_initial_probe+0xa1/0xd0 drivers/base/dd.c:1153
 bus_probe_device+0x12a/0x220 drivers/base/bus.c:620
 device_add+0x7d7/0xb80 drivers/base/core.c:3772
 usb_new_device+0x99d/0x1620 drivers/usb/core/hub.c:2695
 hub_port_connect drivers/usb/core/hub.c:5567 [inline]
 hub_port_connect_change drivers/usb/core/hub.c:5707 [inline]
 port_event drivers/usb/core/hub.c:5871 [inline]
 hub_event+0x28e8/0x4d30 drivers/usb/core/hub.c:5953
 process_one_work kernel/workqueue.c:3322 [inline]
 process_scheduled_works+0xa8e/0x14e0 kernel/workqueue.c:3405
 worker_thread+0xa47/0xfb0 kernel/workqueue.c:3486
 kthread+0x388/0x470 kernel/kthread.c:436
 ret_from_fork+0x514/0xb70 arch/x86/kernel/process.c:158
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245
 </TASK>
Modules linked in:
---[ end trace 0000000000000000 ]---
RIP: 0010:ihex_binrec_size include/linux/ihex.h:26 [inline]
RIP: 0010:__ihex_next_binrec include/linux/ihex.h:35 [inline]
RIP: 0010:ihex_validate_fw include/linux/ihex.h:54 [inline]
RIP: 0010:request_ihex_firmware include/linux/ihex.h:74 [inline]
RIP: 0010:emi26_load_firmware drivers/usb/misc/emi26.c:86 [inline]
RIP: 0010:emi26_probe+0x283/0x1690 drivers/usb/misc/emi26.c:232
Code: ff 89 de e8 ef 8c 98 00 85 db 0f 84 d9 01 00 00 e8 42 89 98 00 48 bb 00 00 00 00 00 fc ff df 49 8d 7e 04 48 89 f8 48 c1 e8 03 <0f> b6 04 18 84 c0 75 47 49 8d 7e 05 48 89 f8 48 c1 e8 03 0f b6 04
RSP: 0018:ffffc900041eed60 EFLAGS: 00010257
RAX: 0000000000000000 RBX: dffffc0000000000 RCX: 0000000000100000
RDX: ffffc9001de82000 RSI: 000000000001a590 RDI: 0000000000000004
RBP: ffffc900041eee90 R08: ffffffff90579237 R09: 1ffffffff20af246
R10: dffffc0000000000 R11: fffffbfff20af247 R12: fffffffffffffffa
R13: 1fffffffffffffff R14: 0000000000000000 R15: 1fffffffffffffff
FS:  0000000000000000(0000) GS:ffff88812504e000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007f3a5f5ed2f8 CR3: 0000000062c1e000 CR4: 0000000000350ef0
----------------
Code disassembly (best guess):
   0:	ff 89 de e8 ef 8c    	decl   -0x73101722(%rcx)
   6:	98                   	cwtl
   7:	00 85 db 0f 84 d9    	add    %al,-0x267bf025(%rbp)
   d:	01 00                	add    %eax,(%rax)
   f:	00 e8                	add    %ch,%al
  11:	42 89 98 00 48 bb 00 	rex.X mov %ebx,0xbb4800(%rax)
  18:	00 00                	add    %al,(%rax)
  1a:	00 00                	add    %al,(%rax)
  1c:	fc                   	cld
  1d:	ff                   	lcall  (bad)
  1e:	df 49 8d             	fisttps -0x73(%rcx)
  21:	7e 04                	jle    0x27
  23:	48 89 f8             	mov    %rdi,%rax
  26:	48 c1 e8 03          	shr    $0x3,%rax
* 2a:	0f b6 04 18          	movzbl (%rax,%rbx,1),%eax <-- trapping instruction
  2e:	84 c0                	test   %al,%al
  30:	75 47                	jne    0x79
  32:	49 8d 7e 05          	lea    0x5(%r14),%rdi
  36:	48 89 f8             	mov    %rdi,%rax
  39:	48 c1 e8 03          	shr    $0x3,%rax
  3d:	0f                   	.byte 0xf
  3e:	b6 04                	mov    $0x4,%dh


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

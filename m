Received: from mail-oi1-f207.google.com (mail-oi1-f207.google.com [209.85.167.207])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECE713806CA
	for <linux-usb@vger.kernel.org>; Sat,  1 Aug 2026 00:45:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.207
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785545128; cv=none; b=nCUWKTVCXu4dA+lrIqMWCwy02ZLZl90Wt5h0bCwYRoftUupPQUxH8qP1bpo171/I683gfF+eXRjz4Y8zX3Ga5QHiOjj6YtXutZrD4Hx+ZQNW3zmSFAVZPGlsNZA/OYnO2J5IE3FvEIXtYlfvnE0M5QEUOM3O++YkU1+JE7YPx3E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785545128; c=relaxed/simple;
	bh=LNfq9aoJgtwPj36TAg+ZRPDUWnkFHdi8z1vkuUHoFbE=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=JcpIzfwcSuO2xUHE3tPdjXkjv3ceZlOYom1zVSqpvKvu3smBD91zEFc0xQwpuqE1HZmkWgwa+AcE2Mv4xWUZotjpKNcbbV7+g7aB9K7QuqHh6Unp5GRi4jnOe0FHMfutw0u1RiBowy9CZqFBNlW2QFup3REq70DfjNliUl7b/sY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.207
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f207.google.com with SMTP id 5614622812f47-48576b535b6so886607b6e.2
        for <linux-usb@vger.kernel.org>; Fri, 31 Jul 2026 17:45:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785545123; x=1786149923;
        h=content-type:to:from:subject:message-id:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Q8vmeMP/RpI8sx/Cn/QAEYbKX3MZkH0hFRUyB+kPLME=;
        b=XU+sTeyvJZNNhMU3naPEsmKe1JjAAtMIxDXT5BcDqxHcEFtr/kw+NHoGcY6/+w24hB
         wFdtHhZID0qOlHzW7Ec+VvGafVNTi/NvEVQ8rULp5QLMQy2ffF2TH4ubI4rA3kg6pUSw
         snHVA5qFAIe6aCiDcn5N1T25Pq1YHZIaH08orT04sr0QfHBkcpG8xucyNxvOK2mSYnh0
         bcoJ0j8buHcVGzRrGT75OqGZGO6JrHkGFLkE7v0DgEqLVpVNS5vA+ShJyG3DrkJtuJhX
         jTxZ6nAMzPvw0Mmr/PaKhPAiZz8F44U8ScHakwcTi78S1th2Q2JeBAtXtUAtBdIh3IkG
         spTQ==
X-Forwarded-Encrypted: i=1; AHgh+RqcZrBwNVYerxIzZ9whnc97F0DimF+RTWo/GkYhAW1lQcqAjPoCING8JLS68ZtKbd+eIf1RSDHv+l8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy2eZ1fxTXV3rgC0xHJh0CmwEsTozVKjFyuGImfzw1gNQEj456w
	R21sD+TDnQHEDqNWEHNmbr4GYz/A22g46R4Dv0tnkNJV/ueRQDGd2tq8Se3KcrQiuw0fZ9UgrXN
	fvTJXcqj8NgYE/1UZPc/c2uSjAGTfuU3A4zCWR6mNptTAmpS6LvT2y9SMR/0=
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:c1e8:b0:497:d371:21c8 with SMTP id
 5614622812f47-4af5e2cd936mr3876312b6e.19.1785545123221; Fri, 31 Jul 2026
 17:45:23 -0700 (PDT)
Date: Fri, 31 Jul 2026 17:45:23 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6a6d41a3.f794c993.27aeb.000e.GAE@google.com>
Subject: [syzbot] [media?] [usb?] WARNING in ttusb_dec_send_command
From: syzbot <syzbot+ac9880be0b0b1a5f54d6@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-usb@vger.kernel.org, mchehab@kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    5d5fd841c346 Merge 7.2-rc5 into usb-next
git tree:       https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
console output: https://syzkaller.appspot.com/x/log.txt?x=14114e32580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=6ec4d592e55f7960
dashboard link: https://syzkaller.appspot.com/bug?extid=ac9880be0b0b1a5f54d6
compiler:       gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=127da5b9580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=16c6f8c6580000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/2ed536ae4daf/disk-5d5fd841.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/ab40098ccbf1/vmlinux-5d5fd841.xz
kernel image: https://storage.googleapis.com/syzbot-assets/66d5c395f47c/bzImage-5d5fd841.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+ac9880be0b0b1a5f54d6@syzkaller.appspotmail.com

usb 4-1: config 1 interface 0 altsetting 0 has 2 endpoint descriptors, different from the interface descriptor's value: 5
usb 4-1: New USB device found, idVendor=0b48, idProduct=1008, bcdDevice= 1.00
usb 4-1: New USB device strings: Mfr=0, Product=0, SerialNumber=0
------------[ cut here ]------------
memcpy: detected buffer overflow: 75 byte read of buffer size 60
WARNING: lib/string_helpers.c:1036 at __fortify_report+0x8d/0xd0 lib/string_helpers.c:1036, CPU#0: kworker/0:1/11
Modules linked in:
CPU: 0 UID: 0 PID: 11 Comm: kworker/0:1 Not tainted syzkaller #0 PREEMPT(lazy) 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 07/24/2026
Workqueue: usb_hub_wq hub_event
RIP: 0010:__fortify_report+0x99/0xd0 lib/string_helpers.c:1036
Code: ad 31 dc fe 45 84 f6 48 c7 c0 20 ec b0 87 48 0f 44 e8 e8 8a 37 dc fe 48 8d 3d 93 b9 20 08 4d 89 e8 48 89 e9 4c 89 e2 48 89 de <67> 48 0f b9 3a 5b 5d 41 5c 41 5d 41 5e e9 85 3a a7 04 48 89 de 48
RSP: 0018:ffffc900000bece8 EFLAGS: 00010293
RAX: 0000000000000000 RBX: ffffffff87b0f7c0 RCX: ffffffff87b0ec20
RDX: 000000000000004b RSI: ffffffff87b0f7c0 RDI: ffffffff8af88650
RBP: ffffffff87b0ec20 R08: 000000000000003c R09: 0000000000000000
R10: 0000000000000000 R11: ffffffff81595b4a R12: 000000000000004b
R13: 000000000000003c R14: 0000000000000000 R15: 1ffff92000017dac
FS:  0000000000000000(0000) GS:ffff888268636000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 000055d73a1cbc10 CR3: 0000000118014000 CR4: 00000000003506f0
Call Trace:
 <TASK>
 __fortify_panic+0x23/0x26 lib/string_helpers.c:1043
 fortify_memcpy_chk include/linux/fortify-string.h:549 [inline]
 ttusb_dec_send_command.cold+0x75/0xf8 drivers/media/usb/ttusb-dec/ttusb_dec.c:372
 ttusb_dec_get_stb_state drivers/media/usb/ttusb-dec/ttusb_dec.c:392 [inline]
 ttusb_dec_init_stb drivers/media/usb/ttusb-dec/ttusb_dec.c:1413 [inline]
 ttusb_dec_probe+0x8b4/0x2110 drivers/media/usb/ttusb-dec/ttusb_dec.c:1671
 usb_probe_interface+0x386/0x9b0 drivers/usb/core/driver.c:399
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
 usb_probe_device+0xef/0x400 drivers/usb/core/driver.c:293
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
 usb_new_device.cold+0x685/0x115c drivers/usb/core/hub.c:2700
 hub_port_connect drivers/usb/core/hub.c:5572 [inline]
 hub_port_connect_change drivers/usb/core/hub.c:5712 [inline]
 port_event drivers/usb/core/hub.c:5876 [inline]
 hub_event+0x314d/0x4af0 drivers/usb/core/hub.c:5958
 process_one_work+0xa23/0x1940 kernel/workqueue.c:3322
 process_scheduled_works kernel/workqueue.c:3405 [inline]
 worker_thread+0x5ef/0xe50 kernel/workqueue.c:3486
 kthread+0x370/0x450 kernel/kthread.c:436
 ret_from_fork+0x69a/0xc80 arch/x86/kernel/process.c:158
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245
 </TASK>
----------------
Code disassembly (best guess):
   0:	ad                   	lods   %ds:(%rsi),%eax
   1:	31 dc                	xor    %ebx,%esp
   3:	fe 45 84             	incb   -0x7c(%rbp)
   6:	f6 48 c7 c0          	testb  $0xc0,-0x39(%rax)
   a:	20 ec                	and    %ch,%ah
   c:	b0 87                	mov    $0x87,%al
   e:	48 0f 44 e8          	cmove  %rax,%rbp
  12:	e8 8a 37 dc fe       	call   0xfedc37a1
  17:	48 8d 3d 93 b9 20 08 	lea    0x820b993(%rip),%rdi        # 0x820b9b1
  1e:	4d 89 e8             	mov    %r13,%r8
  21:	48 89 e9             	mov    %rbp,%rcx
  24:	4c 89 e2             	mov    %r12,%rdx
  27:	48 89 de             	mov    %rbx,%rsi
* 2a:	67 48 0f b9 3a       	ud1    (%edx),%rdi <-- trapping instruction
  2f:	5b                   	pop    %rbx
  30:	5d                   	pop    %rbp
  31:	41 5c                	pop    %r12
  33:	41 5d                	pop    %r13
  35:	41 5e                	pop    %r14
  37:	e9 85 3a a7 04       	jmp    0x4a73ac1
  3c:	48 89 de             	mov    %rbx,%rsi
  3f:	48                   	rex.W


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

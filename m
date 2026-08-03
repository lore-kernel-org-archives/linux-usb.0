Received: from mail-oi1-f208.google.com (mail-oi1-f208.google.com [209.85.167.208])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B49803358C6
	for <linux-usb@vger.kernel.org>; Mon,  3 Aug 2026 03:11:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.208
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785726692; cv=none; b=f5tKuZFHyGY2lZ1FXuvyiAcI2F1cQuPrqdmrcMrvlv/ryNXmDauDV8NwaEPXxQveYljillgiZhzy+S+Q8IiRPft++g53BXFjYNaqHf0yU1V1YKJ8XWATEk6bJwkelGlmGd4GpD9Ry8CBWR/X+c+PXjFzbrgGrKa070d67wcMsM4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785726692; c=relaxed/simple;
	bh=CHAY35X6oh2wqUxn+Nvd15whsU+L91L0ebevdKtYFxA=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=VASUaCSQopiWYrgdY+u4jvCI+tVwB7gezUL4EwmA3xN9FFVkUkmTTrDnG5QCCqSn9T842cSS+US6yi6XW79tlcXX6TILj1XQiAM84RUvkLKONbq9WJmv6MLeyW0A2J0XCAV9vLyYh4GpdQkOykXjnXUeKlAMDy7tgS6h1rnFzHg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.208
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f208.google.com with SMTP id 5614622812f47-4a5a66f375dso1532775b6e.1
        for <linux-usb@vger.kernel.org>; Sun, 02 Aug 2026 20:11:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785726689; x=1786331489;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=PiHRhBg3uJiybjT7WPqDWiw+vAhqPFWIEKaCvcclEhw=;
        b=SV4z5ijikayRCxcyuTc3UP6rx3/qKsi/sjSXiynLQsXU8Nv7zyniNcqtwDsicSffgD
         MyMLZB7AvSWiFtSVyynKgVIxnERzL8Ui1jRzl1Yl6Wsiw8/ZjJZjfDq5px68En8Y+TaZ
         tpmB+E5pYTi2Cgpu0viP0Age18ZW5thtHSPPHHDlEYrMtX+A+RCN5rGmRXbWe0vZMXzd
         aYY2wiBwTAr6d7cxJX62yC4cjvP8/Se+CIqVwvSXw60YtIzfJTVUD7fllBzAfLEGpsIy
         vWQjvbxOhp9HBb93Ap14CtMrC3SBJVciDvedXzsUJvt4/d8UhklgIwKBlYZFNMTyyDM9
         Udmg==
X-Forwarded-Encrypted: i=1; AHgh+RpnnZAQ1001wuZTJgY0UmvhaKCOv91/X2RkOk8G25ivphPTmFkG9k2Y0Yel6lQVMGqtFQAWHo8McSA=@vger.kernel.org
X-Gm-Message-State: AOJu0YycW0GNL3gRxEniXp6s2eeD7K3asqmLEdy/xFCWYDOd21WNyQtP
	aYh2Uh0wohw8ocuRgTIrqCwlNNvphLatNxLnzblmgI8gLfUECkH167wcl6nKwt/NmjpEX68QcXa
	Jw7icbzxC4E232ubwwOgCOjHTuCemBgimpc7jclFtiqmEwnxiKAWQLrmHYYw=
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:23c5:b0:4a4:a693:9d87 with SMTP id
 5614622812f47-4af5e03c598mr13957473b6e.5.1785726689459; Sun, 02 Aug 2026
 20:11:29 -0700 (PDT)
Date: Sun, 02 Aug 2026 20:11:29 -0700
In-Reply-To: <6a6e88a2.13bfb6d0.1ecdd5.0262.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6a7006e1.2d659fcc.1d46f5.01e2.GAE@google.com>
Subject: Re: [syzbot] [usb?] general protection fault in emi26_probe
From: syzbot <syzbot+baf3cbba7dd980984f0d@syzkaller.appspotmail.com>
To: gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

syzbot has found a reproducer for the following issue on:

HEAD commit:    bd1dde877520 Merge tag 'vfs-7.2-rc6.fixes' of git://git.ke..
git tree:       upstream
console+strace: https://syzkaller.appspot.com/x/log.txt?x=16dc9db9580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=4e38b15c29e6a1d9
dashboard link: https://syzkaller.appspot.com/bug?extid=baf3cbba7dd980984f0d
compiler:       Debian clang version 22.1.8 (++20260613092233+e80beda6e255-1~exp1~20260613092250.77), Debian LLD 22.1.8
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=1586bdb9580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=135fc649580000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/20f437bd50f0/disk-bd1dde87.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/9db904668b53/vmlinux-bd1dde87.xz
kernel image: https://storage.googleapis.com/syzbot-assets/1d7a8c9447b0/bzImage-bd1dde87.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+baf3cbba7dd980984f0d@syzkaller.appspotmail.com

Oops: general protection fault, probably for non-canonical address 0xdffffc0000000000: 0000 [#1] SMP KASAN NOPTI
KASAN: null-ptr-deref in range [0x0000000000000000-0x0000000000000007]
CPU: 1 UID: 0 PID: 24 Comm: kworker/1:0 Not tainted syzkaller #0 PREEMPT(full) 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 07/16/2026
Workqueue: usb_hub_wq hub_event
RIP: 0010:ihex_binrec_size include/linux/ihex.h:26 [inline]
RIP: 0010:__ihex_next_binrec include/linux/ihex.h:35 [inline]
RIP: 0010:ihex_validate_fw include/linux/ihex.h:54 [inline]
RIP: 0010:request_ihex_firmware include/linux/ihex.h:74 [inline]
RIP: 0010:emi26_load_firmware drivers/usb/misc/emi26.c:86 [inline]
RIP: 0010:emi26_probe+0x283/0x1690 drivers/usb/misc/emi26.c:232
Code: ff 89 de e8 bf 9d 98 00 85 db 0f 84 d9 01 00 00 e8 12 9a 98 00 48 bb 00 00 00 00 00 fc ff df 49 8d 7e 04 48 89 f8 48 c1 e8 03 <0f> b6 04 18 84 c0 75 47 49 8d 7e 05 48 89 f8 48 c1 e8 03 0f b6 04
RSP: 0018:ffffc900001e6d60 EFLAGS: 00010257
RAX: 0000000000000000 RBX: dffffc0000000000 RCX: ffff88801e685d00
RDX: 0000000000000000 RSI: 0000000000000000 RDI: 0000000000000004
RBP: ffffc900001e6e90 R08: ffffffff90579d37 R09: 1ffffffff20af3a6
R10: dffffc0000000000 R11: fffffbfff20af3a7 R12: fffffffffffffffa
R13: 1fffffffffffffff R14: 0000000000000000 R15: 1fffffffffffffff
FS:  0000000000000000(0000) GS:ffff88812504b000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007fb3098d0a60 CR3: 0000000028671000 CR4: 0000000000350ef0
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
Code: ff 89 de e8 bf 9d 98 00 85 db 0f 84 d9 01 00 00 e8 12 9a 98 00 48 bb 00 00 00 00 00 fc ff df 49 8d 7e 04 48 89 f8 48 c1 e8 03 <0f> b6 04 18 84 c0 75 47 49 8d 7e 05 48 89 f8 48 c1 e8 03 0f b6 04
RSP: 0018:ffffc900001e6d60 EFLAGS: 00010257
RAX: 0000000000000000 RBX: dffffc0000000000 RCX: ffff88801e685d00
RDX: 0000000000000000 RSI: 0000000000000000 RDI: 0000000000000004
RBP: ffffc900001e6e90 R08: ffffffff90579d37 R09: 1ffffffff20af3a6
R10: dffffc0000000000 R11: fffffbfff20af3a7 R12: fffffffffffffffa
R13: 1fffffffffffffff R14: 0000000000000000 R15: 1fffffffffffffff
FS:  0000000000000000(0000) GS:ffff88812504b000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 000055f773fefbf0 CR3: 00000000351a6000 CR4: 0000000000350ef0
----------------
Code disassembly (best guess):
   0:	ff 89 de e8 bf 9d    	decl   -0x62401722(%rcx)
   6:	98                   	cwtl
   7:	00 85 db 0f 84 d9    	add    %al,-0x267bf025(%rbp)
   d:	01 00                	add    %eax,(%rax)
   f:	00 e8                	add    %ch,%al
  11:	12 9a 98 00 48 bb    	adc    -0x44b7ff68(%rdx),%bl
  17:	00 00                	add    %al,(%rax)
  19:	00 00                	add    %al,(%rax)
  1b:	00 fc                	add    %bh,%ah
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
If you want syzbot to run the reproducer, reply with:
#syz test: git://repo/address.git branch-or-commit-hash
If you attach or paste a git patch, syzbot will apply it before testing.

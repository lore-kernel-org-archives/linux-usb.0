Received: from mail-oi1-f208.google.com (mail-oi1-f208.google.com [209.85.167.208])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 132A21F418F
	for <linux-usb@vger.kernel.org>; Wed, 29 Jul 2026 00:19:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.208
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785284373; cv=none; b=TxheHK8NZyv1uSQn40s3YYZZOI2tkRDFSzkq1SltkFonER2YIoYUNCPWmgox/k+NAUZj2IR5OyvE6vgyK3QIBNdU63imyLaP3KLRRItkWr84PkzRVpn3AuvczHkD9AzPu0gFgcKDpGewXjmTmZXXMwyjmJ66WWbEiCt0MSbS/BE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785284373; c=relaxed/simple;
	bh=Vo5v3A1u0m1NWkTdoWM7gCYARf4Ym3AVIymRgPanvfA=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=CnZ7k3pDDNIRF5gUfv5tvRDQIcpWvggWsj2ZchuDFYiztEEI3/7kfSDygqxicIKR3MYbpTFhtKWWtHkusU9WtwuK7zIHN0WKguGqQuHZkNZONONw9Sk/ewwqRrrOIy7XGQx8BVeIhu624PklZ+XNM9dyX7eCO7puHEyOwJW6if0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.208
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f208.google.com with SMTP id 5614622812f47-4ab4f78b9f4so500371b6e.2
        for <linux-usb@vger.kernel.org>; Tue, 28 Jul 2026 17:19:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785284371; x=1785889171;
        h=content-type:to:from:subject:message-id:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/KQD06HTLeZ4Aqo8hQp8829qygx+FjuUbxOQO2cF8I8=;
        b=hlKlrv3Q/asKapIfDZN9YG6kVfdozlshORkPu5tkpKMNt/5+OwS3Lk0gmVB2Wc2epw
         hGDBLVxDGTDAGnVNorOXOKyO85lb8Uz68SeKd/xq5oDHOoruPvMPvts3+PGWC7jfaDed
         Aa1B9UqEU2XuPKNlNwDGSUXg9kmkLetjlbrf0NLScIlHQndd0cnsQ02xdSFmazPGxZoc
         g3lM+EdvMJ6OsxHRYhDs8DxMGE42Ylk9HYkgicCNn1HVBhT3cOVsKjN0MIQmglhWb6cO
         x1B2Xsp4vhSCIJ9jP5BFpsG2IWrCrWYf5qHDACgrqy2mFBd90yCzdBnrSNcaIbY/nzg9
         F1TQ==
X-Forwarded-Encrypted: i=1; AHgh+RqwgZLaLoK8mFnQi1T3jiOIsTGJRcAk7YAmI2GAi9e6CJcsRyxhipW8/fOCwmmc+MhvA1Sms9iTFZ8=@vger.kernel.org
X-Gm-Message-State: AOJu0YxRsj+HCoVm+DZxcgK+BPYZmcre+35o8p6/1x3o29nnhqtXpKJH
	qiMf/pxyevMqufjx1cRq6T6/mc/SKqa8ozRQIHj/KbBoIiXbZIMmpZW/zju59ut3ijDvBr3QmA0
	kzQscPstZdK+6ARHIEa1MctUREZxbWSBqiyfortyhVb4Lkwh4FgFQlyqi1I4=
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:c1a7:b0:49b:9a35:f72d with SMTP id
 5614622812f47-4ad5b87b3acmr2782016b6e.29.1785284370992; Tue, 28 Jul 2026
 17:19:30 -0700 (PDT)
Date: Tue, 28 Jul 2026 17:19:30 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6a694712.6bd615f2.c0aa.0003.GAE@google.com>
Subject: [syzbot] [usb?] general protection fault in usbtest_probe
From: syzbot <syzbot+7e1e5911f9eac50bedc7@syzkaller.appspotmail.com>
To: gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    3b5f4b83c4ab Merge tag 'for-7.2-rc5-tag' of git://git.kern..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=12eee7b1580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=145fa60d73086782
dashboard link: https://syzkaller.appspot.com/bug?extid=7e1e5911f9eac50bedc7
compiler:       gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=12f41449580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=1797249e580000

Downloadable assets:
disk image (non-bootable): https://storage.googleapis.com/syzbot-assets/d900f083ada3/non_bootable_disk-3b5f4b83.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/ed6d6b480fd7/vmlinux-3b5f4b83.xz
kernel image: https://storage.googleapis.com/syzbot-assets/d5a591a74024/bzImage-3b5f4b83.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+7e1e5911f9eac50bedc7@syzkaller.appspotmail.com

usb 5-1: New USB device found, idVendor=0547, idProduct=2235, bcdDevice= 0.00
usb 5-1: New USB device strings: Mfr=1, Product=2, SerialNumber=3
usb 5-1: Product: syz
usb 5-1: Manufacturer: syz
usb 5-1: SerialNumber: syz
Oops: general protection fault, probably for non-canonical address 0xdffffc0000000001: 0000 [#1] SMP KASAN NOPTI
KASAN: null-ptr-deref in range [0x0000000000000008-0x000000000000000f]
CPU: 1 UID: 0 PID: 29 Comm: kworker/1:0 Not tainted syzkaller #0 PREEMPT(full) 
Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.3-debian-1.16.3-2 04/01/2014
Workqueue: usb_hub_wq hub_event
RIP: 0010:usbtest_probe+0x3b9/0x1280 drivers/usb/misc/usbtest.c:2822
Code: e9 46 fa 45 85 ff 79 5e e8 34 ef 46 fa 48 8b 84 24 80 00 00 00 48 8d 58 0a 48 b8 00 00 00 00 00 fc ff df 48 89 da 48 c1 ea 03 <0f> b6 04 02 48 89 da 83 e2 07 38 d0 7f 08 84 c0 0f 85 58 0d 00 00
RSP: 0018:ffffc90000686fc8 EFLAGS: 00010202
RAX: dffffc0000000000 RBX: 000000000000000a RCX: ffffffff87c37102
RDX: 0000000000000001 RSI: ffffffff87c3710c RDI: ffff88801f69a540
RBP: ffff88802bf65910 R08: 0000000000000005 R09: 0000000000000000
R10: 00000000ffffffff R11: 000000000000758b R12: ffff88816db048b0
R13: ffff88803724fed0 R14: ffff88803724fe00 R15: 00000000ffffffff
FS:  0000000000000000(0000) GS:ffff8880d5edc000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007f87747eb580 CR3: 000000002ad51000 CR4: 0000000000352ef0
Call Trace:
 <TASK>
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
RIP: 0010:usbtest_probe+0x3b9/0x1280 drivers/usb/misc/usbtest.c:2822
Code: e9 46 fa 45 85 ff 79 5e e8 34 ef 46 fa 48 8b 84 24 80 00 00 00 48 8d 58 0a 48 b8 00 00 00 00 00 fc ff df 48 89 da 48 c1 ea 03 <0f> b6 04 02 48 89 da 83 e2 07 38 d0 7f 08 84 c0 0f 85 58 0d 00 00
RSP: 0018:ffffc90000686fc8 EFLAGS: 00010202
RAX: dffffc0000000000 RBX: 000000000000000a RCX: ffffffff87c37102
RDX: 0000000000000001 RSI: ffffffff87c3710c RDI: ffff88801f69a540
RBP: ffff88802bf65910 R08: 0000000000000005 R09: 0000000000000000
R10: 00000000ffffffff R11: 000000000000758b R12: ffff88816db048b0
R13: ffff88803724fed0 R14: ffff88803724fe00 R15: 00000000ffffffff
FS:  0000000000000000(0000) GS:ffff8880d5edc000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007f87747eb580 CR3: 000000002a8fe000 CR4: 0000000000352ef0
----------------
Code disassembly (best guess), 1 bytes skipped:
   0:	46 fa                	rex.RX cli
   2:	45 85 ff             	test   %r15d,%r15d
   5:	79 5e                	jns    0x65
   7:	e8 34 ef 46 fa       	call   0xfa46ef40
   c:	48 8b 84 24 80 00 00 	mov    0x80(%rsp),%rax
  13:	00
  14:	48 8d 58 0a          	lea    0xa(%rax),%rbx
  18:	48 b8 00 00 00 00 00 	movabs $0xdffffc0000000000,%rax
  1f:	fc ff df
  22:	48 89 da             	mov    %rbx,%rdx
  25:	48 c1 ea 03          	shr    $0x3,%rdx
* 29:	0f b6 04 02          	movzbl (%rdx,%rax,1),%eax <-- trapping instruction
  2d:	48 89 da             	mov    %rbx,%rdx
  30:	83 e2 07             	and    $0x7,%edx
  33:	38 d0                	cmp    %dl,%al
  35:	7f 08                	jg     0x3f
  37:	84 c0                	test   %al,%al
  39:	0f 85 58 0d 00 00    	jne    0xd97


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

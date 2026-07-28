Received: from mail-oo1-f77.google.com (mail-oo1-f77.google.com [209.85.161.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D1513655D8
	for <linux-usb@vger.kernel.org>; Tue, 28 Jul 2026 14:15:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.77
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785248140; cv=none; b=jIrc5pxjjOZhUM5o7qB0ahMTqhsmTSgbwFE63VWOcT7UQ8JhS4pVxKmKCRi9yG6R3HuzENEcAOPDEtwDqS2+7I53ywO/WYzFUlRV9vG0L9S8j7RunzAXH4k3bY+kFnLxgB8eFHLbq46fonmyCZ6HBpZ9wJQdb1a33LsCPVYHMXM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785248140; c=relaxed/simple;
	bh=++/kH3j0T7O8JwXTId8bfE1NZKTdU+Nt20c8eenpF8E=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=Nc/QampbTVEQYOnBpIjcQ1RbJq45vY0pT4ehpfK8a94TZtpXo17Rdarj6lhpg1zT7ah3pCc7/tlJUKG704Gy+MPtSNqUUWcsOq5TitM7/UO0eEod0/ozzKVUH+YRYylyNMx/W4T7U3NF2XJxT1DEBLZ4Xkx1ihcna7hTmPs0lnM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.161.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oo1-f77.google.com with SMTP id 006d021491bc7-6a18bd9c3caso3508265eaf.1
        for <linux-usb@vger.kernel.org>; Tue, 28 Jul 2026 07:15:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785248138; x=1785852938;
        h=content-type:to:from:subject:message-id:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Xkxg+qDI7XUW/B+7+5GW3jp6cIlCwA23cieOudNQBDI=;
        b=Qlk7yUgZCs9evVA2a84xWPCaTYKkXgyUV6kkU5cK9d1EYSHfD8P4zEMM2kxqrnkEhi
         pZDJHCmhinlOB64yPiVKRWdhIkZ74JiPwwkgJ+5cGohpGwrPH2urdK962ObTevLHWXFR
         7h3vV6K2m5yN4jGTrmnBo+6jxwDrKgGDvcFHFCfr5V/7kPKDI22Uu2u/CORYQ/IgOZRE
         KAR37hYCMNTN2yzmiQqtm9J3e+97u+TA56Vlu9RZf7NgQHxhC1i4SKNxuITmqCDOh6V9
         Uj9O8ywnaVt2V33uC0IhZaRB5ulsC28dUC4J/BFBSqpNQOvFsuYb/vu8VMaVPGyeA4Vy
         WKLA==
X-Forwarded-Encrypted: i=1; AHgh+RrSQM9DE6nB7guMdT0f1OqKZPu1AQRKi1bBNlMJMz3+KBuy9sKEzxXHBzFos6nxo/oo0f0BEubOoTk=@vger.kernel.org
X-Gm-Message-State: AOJu0YzzZ8gi64o+Ef8zFcD1DogJlE0VveY+eaX29UdNRdzKlKl9df5m
	3FzKd9U/1jpV7Qa4rdybnClR730bETqaqsbv3x0qc4YWEZK7fztokBO6BePUqOAwc2IB4kvYlm7
	uajAm/mdD052KsHZ15rsMb+92Dl3157hPQ65nW8m20SLEsZVhzG/Q0O3cGhE=
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:55d6:10b0:6ac:a175:fe66 with SMTP id
 006d021491bc7-6aca17600bamr154012eaf.21.1785248138298; Tue, 28 Jul 2026
 07:15:38 -0700 (PDT)
Date: Tue, 28 Jul 2026 07:15:38 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6a68b98a.4c659fcc.19cd90.0025.GAE@google.com>
Subject: [syzbot] [usb?] general protection fault in set_link_state (2)
From: syzbot <syzbot+70d28f5ea6d18a5e60fe@syzkaller.appspotmail.com>
To: gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    3dab139d4795 Merge tag 'rust-fixes-7.2-2' of git://git.ker..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=127327b1580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=145fa60d73086782
dashboard link: https://syzkaller.appspot.com/bug?extid=70d28f5ea6d18a5e60fe
compiler:       gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=1131a499580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=14063fde580000

Downloadable assets:
disk image (non-bootable): https://storage.googleapis.com/syzbot-assets/d900f083ada3/non_bootable_disk-3dab139d.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/2b5a401a9dc7/vmlinux-3dab139d.xz
kernel image: https://storage.googleapis.com/syzbot-assets/7ed2d255bd44/bzImage-3dab139d.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+70d28f5ea6d18a5e60fe@syzkaller.appspotmail.com

dummy_hcd dummy_hcd.0: remove, state 1
usb usb5: USB disconnect, device number 1
usb 5-1: USB disconnect, device number 2
dummy_hcd dummy_hcd.0: stopped
dummy_hcd dummy_hcd.0: USB bus 5 deregistered
Oops: general protection fault, probably for non-canonical address 0xdffffc0000000000: 0000 [#1] SMP KASAN NOPTI
KASAN: null-ptr-deref in range [0x0000000000000000-0x0000000000000007]
CPU: 0 UID: 0 PID: 5923 Comm: syz.0.17 Not tainted syzkaller #0 PREEMPT(full) 
Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.3-debian-1.16.3-2 04/01/2014
RIP: 0010:set_link_state+0x2c/0xf20 drivers/usb/gadget/udc/dummy_hcd.c:436
Code: 41 56 41 55 41 54 55 53 48 89 fb 48 83 ec 50 48 89 7c 24 10 e8 55 86 39 fa 48 89 da 48 b8 00 00 00 00 00 fc ff df 48 c1 ea 03 <80> 3c 02 00 0f 85 a2 0e 00 00 48 8b 44 24 10 4c 8d b0 a3 00 00 00
RSP: 0018:ffffc90003d37b50 EFLAGS: 00010046
RAX: dffffc0000000000 RBX: 0000000000000000 RCX: ffffffff87d0e7d3
RDX: 0000000000000000 RSI: ffffffff87d0d64b RDI: 0000000000000000
RBP: 0000000000000000 R08: 0000000000000005 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000000 R12: 0000000000000293
R13: ffff88802c04c000 R14: 0000000000000000 R15: ffff88802c04cc00
FS:  000055557fbdd500(0000) GS:ffff8880d5dde000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007f2c9b3a1796 CR3: 0000000047fb9000 CR4: 0000000000352ef0
Call Trace:
 <TASK>
 dummy_pullup+0xf3/0x170 drivers/usb/gadget/udc/dummy_hcd.c:915
 usb_gadget_disconnect_locked+0x142/0x4e0 drivers/usb/gadget/udc/core.c:785
 gadget_unbind_driver+0xd8/0x4f0 drivers/usb/gadget/udc/core.c:1718
 device_remove+0xcb/0x180 drivers/base/dd.c:616
 __device_release_driver drivers/base/dd.c:1349 [inline]
 device_release_driver_internal+0x44e/0x620 drivers/base/dd.c:1372
 driver_detach+0xd8/0x1b0 drivers/base/dd.c:1435
 bus_remove_driver+0x13b/0x2e0 drivers/base/bus.c:832
 driver_unregister+0x76/0xb0 drivers/base/driver.c:202
 usb_gadget_unregister_driver+0x49/0x70 drivers/usb/gadget/udc/core.c:1784
 raw_release+0x19b/0x260 drivers/usb/gadget/legacy/raw_gadget.c:463
 __fput+0x3ff/0xb50 fs/file_table.c:512
 task_work_run+0x150/0x240 kernel/task_work.c:233
 resume_user_mode_work include/linux/resume_user_mode.h:50 [inline]
 __exit_to_user_mode_loop kernel/entry/common.c:70 [inline]
 exit_to_user_mode_loop+0x1d8/0x6f0 kernel/entry/common.c:101
 __exit_to_user_mode_prepare include/linux/irq-entry-common.h:207 [inline]
 syscall_exit_to_user_mode_prepare include/linux/irq-entry-common.h:230 [inline]
 syscall_exit_to_user_mode include/linux/entry-common.h:318 [inline]
 do_syscall_64+0x666/0x870 arch/x86/entry/syscall_64.c:100
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f153619de99
Code: ff c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 44 00 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 e8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007ffe765355e8 EFLAGS: 00000246 ORIG_RAX: 00000000000001b4
RAX: 0000000000000000 RBX: 00007ffe765356d0 RCX: 00007f153619de99
RDX: 0000000000000000 RSI: 000000000000001e RDI: 0000000000000003
RBP: 000000000000d9ef R08: 0000000000000001 R09: 0000000000000000
R10: 0000001b32920000 R11: 0000000000000246 R12: 0000000000000000
R13: 00007f1536425fac R14: 00007f1536425fa8 R15: 00007f1536425fa0
 </TASK>
Modules linked in:
---[ end trace 0000000000000000 ]---
RIP: 0010:set_link_state+0x2c/0xf20 drivers/usb/gadget/udc/dummy_hcd.c:436
Code: 41 56 41 55 41 54 55 53 48 89 fb 48 83 ec 50 48 89 7c 24 10 e8 55 86 39 fa 48 89 da 48 b8 00 00 00 00 00 fc ff df 48 c1 ea 03 <80> 3c 02 00 0f 85 a2 0e 00 00 48 8b 44 24 10 4c 8d b0 a3 00 00 00
RSP: 0018:ffffc90003d37b50 EFLAGS: 00010046
RAX: dffffc0000000000 RBX: 0000000000000000 RCX: ffffffff87d0e7d3
RDX: 0000000000000000 RSI: ffffffff87d0d64b RDI: 0000000000000000
RBP: 0000000000000000 R08: 0000000000000005 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000000 R12: 0000000000000293
R13: ffff88802c04c000 R14: 0000000000000000 R15: ffff88802c04cc00
FS:  000055557fbdd500(0000) GS:ffff8880d5dde000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007f2c9b3a1796 CR3: 0000000047fb9000 CR4: 0000000000352ef0
----------------
Code disassembly (best guess):
   0:	41 56                	push   %r14
   2:	41 55                	push   %r13
   4:	41 54                	push   %r12
   6:	55                   	push   %rbp
   7:	53                   	push   %rbx
   8:	48 89 fb             	mov    %rdi,%rbx
   b:	48 83 ec 50          	sub    $0x50,%rsp
   f:	48 89 7c 24 10       	mov    %rdi,0x10(%rsp)
  14:	e8 55 86 39 fa       	call   0xfa39866e
  19:	48 89 da             	mov    %rbx,%rdx
  1c:	48 b8 00 00 00 00 00 	movabs $0xdffffc0000000000,%rax
  23:	fc ff df
  26:	48 c1 ea 03          	shr    $0x3,%rdx
* 2a:	80 3c 02 00          	cmpb   $0x0,(%rdx,%rax,1) <-- trapping instruction
  2e:	0f 85 a2 0e 00 00    	jne    0xed6
  34:	48 8b 44 24 10       	mov    0x10(%rsp),%rax
  39:	4c 8d b0 a3 00 00 00 	lea    0xa3(%rax),%r14


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

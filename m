Received: from mail-oo1-f77.google.com (mail-oo1-f77.google.com [209.85.161.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2CBA448392
	for <linux-usb@vger.kernel.org>; Tue, 28 Jul 2026 13:53:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.77
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785246811; cv=none; b=DTU0XeRtmGyD0Q5DXfYLppwbuYpCeSmPr2VNzjd7HgOqye1PrJPbWLV8OCxqUAa9UsJ6VSDE2iZpLNU218beXA2qbmO53Krduu6xbgTr/22aIxkDyrlpGE45ze2vPZwCY9Ju51b2I5lgw3Y/5bDBHgdXrKhDk5K37q2xVaDKRBM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785246811; c=relaxed/simple;
	bh=+Ip+lJ1eAVbdLUX3Bk2e9rUpffjB2ipt2l1i1GIKHqE=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=Bd8UxBpV6jEJlX/iKp7j6zHITAuT31wfPfvfIBuOkq22PYnIJavwHS+F0T47JnBMX9XxLwt7b+s93IAv1rXeTwjUrKB/6x5WqmHEVUM1q4AoWNCzIDB2TWw5j4/Bpq3uDIfCg0n1YutMnNn/RYIabvckM3iOs8csij549/ZsNc0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.161.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oo1-f77.google.com with SMTP id 006d021491bc7-6a3856a293fso3755648eaf.3
        for <linux-usb@vger.kernel.org>; Tue, 28 Jul 2026 06:53:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785246808; x=1785851608;
        h=content-type:to:from:subject:message-id:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=W3P8Z9hUFoF2OzUP/lyBgZsBLImsu6jtz1XzpT1r4ew=;
        b=lCZDunVON09dJb5vTviQLq1ZMtH87vnl7hpw894rjqm/WGH/nKpBBpnfSJ5PgP7wtZ
         klU+cTK2cadReYiIOcjQW3qRfbSx5SklzhB27lA/m2l+QmDwnnUlnIhDgaCxEc2rraae
         /CLsffgyuHS0ewBV6lLKpDVAtuR1FP0u0SiAarhm4Fretdm90m7Q++A7ipqCysFNUAP1
         FSwSYnma804zwIWWMF2CZZ+L2lPeZTKvjckblUcZ2KRco1W1FdwSAVLRSI1E/Zc1rTHz
         m84nE92bWhyJA6lUrFWSlnwUIuP7PfC0RsV/coOYs8qAyRKZ4Gumk3sE+9TNNpdI+3aT
         hBCw==
X-Forwarded-Encrypted: i=1; AHgh+RrG1pvw7TSEn0dogQsD6AQpxkU/P2h8wOLS4om+akcS+wtUg+UFg718XABweWe1V0mqvzzFLLB4SSA=@vger.kernel.org
X-Gm-Message-State: AOJu0YxmOPbmOhuyHcu8uiOIrU56bU1wuDURPsOKc7V3Q03xBo5f8EBg
	iDMi9jg7O666YDZEWTCtfw0QAU0kpAfIlHqZVsjw0BojjvHFHfYSZKS3dY5b/TzGj8INl+t52Go
	cdqjzsp2e1saKqDtVUIXzg1soBMALUdjtvzT4upGmcfvDNFP5tslgc8AR3zU=
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:1899:b0:6a3:77b0:f765 with SMTP id
 006d021491bc7-6ac969be136mr1361644eaf.8.1785246808725; Tue, 28 Jul 2026
 06:53:28 -0700 (PDT)
Date: Tue, 28 Jul 2026 06:53:28 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6a68b458.4c659fcc.19cd90.0022.GAE@google.com>
Subject: [syzbot] [usb?] general protection fault in dummy_set_selfpowered
From: syzbot <syzbot+5c0303816c30d2e621df@syzkaller.appspotmail.com>
To: gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    f5098b6bae76 Linux 7.2-rc5
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=101426b9580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=cb17729fb04b1e3a
dashboard link: https://syzkaller.appspot.com/bug?extid=5c0303816c30d2e621df
compiler:       Debian clang version 22.1.8 (++20260613092233+e80beda6e255-1~exp1~20260613092250.77), Debian LLD 22.1.8
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=14dc67b1580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=11b89632580000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/af1f735fe999/disk-f5098b6b.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/a9ba72031565/vmlinux-f5098b6b.xz
kernel image: https://storage.googleapis.com/syzbot-assets/5bfbc9338ea7/bzImage-f5098b6b.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+5c0303816c30d2e621df@syzkaller.appspotmail.com

Oops: general protection fault, probably for non-canonical address 0xdffffc0000000000: 0000 [#1] SMP KASAN PTI
KASAN: null-ptr-deref in range [0x0000000000000000-0x0000000000000007]
CPU: 1 UID: 0 PID: 5939 Comm: syz.0.18 Not tainted syzkaller #0 PREEMPT_{RT,(full)} 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 07/16/2026
RIP: 0010:dummy_set_selfpowered+0xbe/0x160 drivers/usb/gadget/udc/dummy_hcd.c:906
Code: 8d 34 c6 49 81 c6 c8 07 00 00 4c 89 f0 48 c1 e8 03 42 80 3c 20 00 74 08 4c 89 f7 e8 fc 22 01 fb 4d 8b 3e 4c 89 f8 48 c1 e8 03 <42> 80 3c 20 00 74 08 4c 89 ff e8 e3 22 01 fb 41 be 00 14 00 00 4d
RSP: 0018:ffffc90003aaf780 EFLAGS: 00010246
RAX: 0000000000000000 RBX: 0000000000000001 RCX: ffff88803c6e0000
RDX: 0000000000000000 RSI: 0000000000000003 RDI: 0000000000000005
RBP: 0000000000000003 R08: 0000000000000000 R09: 0000000000000000
R10: dffffc0000000000 R11: ffffffff872e19b0 R12: dffffc0000000000
R13: ffff88803ab92528 R14: ffff88802a2fd408 R15: 0000000000000000
FS:  00005555757b0500(0000) GS:ffff888125d41000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 0000200000001000 CR3: 000000004417e000 CR4: 00000000003526f0
Call Trace:
 <TASK>
 usb_gadget_set_selfpowered+0x75/0x260 drivers/usb/gadget/udc/core.c:578
 composite_dev_prepare+0x2fa/0x320 drivers/usb/gadget/composite.c:2440
 configfs_composite_bind+0xa5/0x1410 drivers/usb/gadget/configfs.c:1701
 gadget_bind_driver+0x2ca/0x9e0 drivers/usb/gadget/udc/core.c:1662
 call_driver_probe drivers/base/dd.c:-1 [inline]
 really_probe+0x254/0xae0 drivers/base/dd.c:706
 __driver_probe_device+0x1e8/0x360 drivers/base/dd.c:868
 driver_probe_device+0x4f/0x240 drivers/base/dd.c:898
 __driver_attach+0x339/0x600 drivers/base/dd.c:1292
 bus_for_each_dev+0x23e/0x2c0 drivers/base/bus.c:383
 bus_add_driver+0x348/0x670 drivers/base/bus.c:763
 driver_register+0x23a/0x320 drivers/base/driver.c:174
 usb_gadget_register_driver_owner+0xf9/0x270 drivers/usb/gadget/udc/core.c:1752
 gadget_dev_desc_UDC_store+0x1c9/0x2f0 drivers/usb/gadget/configfs.c:300
 flush_write_buffer fs/configfs/file.c:207 [inline]
 configfs_write_iter+0x33a/0x430 fs/configfs/file.c:229
 new_sync_write fs/read_write.c:595 [inline]
 vfs_write+0x61e/0xbb0 fs/read_write.c:687
 ksys_write+0x156/0x270 fs/read_write.c:739
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0x174/0x580 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f5cd9f1de99
Code: ff c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 44 00 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 e8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007ffc750c2c68 EFLAGS: 00000246 ORIG_RAX: 0000000000000001
RAX: ffffffffffffffda RBX: 00007f5cda1a5fa0 RCX: 00007f5cd9f1de99
RDX: 000000000000000c RSI: 0000200000001100 RDI: 0000000000000003
RBP: 00007f5cd9fb3eaf R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000000
R13: 00007f5cda1a5fac R14: 00007f5cda1a5fa0 R15: 00007f5cda1a5fa0
 </TASK>
Modules linked in:
---[ end trace 0000000000000000 ]---
RIP: 0010:dummy_set_selfpowered+0xbe/0x160 drivers/usb/gadget/udc/dummy_hcd.c:906
Code: 8d 34 c6 49 81 c6 c8 07 00 00 4c 89 f0 48 c1 e8 03 42 80 3c 20 00 74 08 4c 89 f7 e8 fc 22 01 fb 4d 8b 3e 4c 89 f8 48 c1 e8 03 <42> 80 3c 20 00 74 08 4c 89 ff e8 e3 22 01 fb 41 be 00 14 00 00 4d
RSP: 0018:ffffc90003aaf780 EFLAGS: 00010246
RAX: 0000000000000000 RBX: 0000000000000001 RCX: ffff88803c6e0000
RDX: 0000000000000000 RSI: 0000000000000003 RDI: 0000000000000005
RBP: 0000000000000003 R08: 0000000000000000 R09: 0000000000000000
R10: dffffc0000000000 R11: ffffffff872e19b0 R12: dffffc0000000000
R13: ffff88803ab92528 R14: ffff88802a2fd408 R15: 0000000000000000
FS:  00005555757b0500(0000) GS:ffff888125d41000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 0000200000001000 CR3: 000000004417e000 CR4: 00000000003526f0
----------------
Code disassembly (best guess):
   0:	8d 34 c6             	lea    (%rsi,%rax,8),%esi
   3:	49 81 c6 c8 07 00 00 	add    $0x7c8,%r14
   a:	4c 89 f0             	mov    %r14,%rax
   d:	48 c1 e8 03          	shr    $0x3,%rax
  11:	42 80 3c 20 00       	cmpb   $0x0,(%rax,%r12,1)
  16:	74 08                	je     0x20
  18:	4c 89 f7             	mov    %r14,%rdi
  1b:	e8 fc 22 01 fb       	call   0xfb01231c
  20:	4d 8b 3e             	mov    (%r14),%r15
  23:	4c 89 f8             	mov    %r15,%rax
  26:	48 c1 e8 03          	shr    $0x3,%rax
* 2a:	42 80 3c 20 00       	cmpb   $0x0,(%rax,%r12,1) <-- trapping instruction
  2f:	74 08                	je     0x39
  31:	4c 89 ff             	mov    %r15,%rdi
  34:	e8 e3 22 01 fb       	call   0xfb01231c
  39:	41 be 00 14 00 00    	mov    $0x1400,%r14d
  3f:	4d                   	rex.WRB


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

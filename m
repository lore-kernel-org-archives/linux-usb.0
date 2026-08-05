Received: from mail-ot1-f80.google.com (mail-ot1-f80.google.com [209.85.210.80])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA8F841A781
	for <linux-usb@vger.kernel.org>; Wed,  5 Aug 2026 22:43:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.80
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785969810; cv=none; b=KpfC8zYlL4Q3ALbNWAYP5Dtp3feS6SHkd6T9BU08HZZXBrMZcTqfczbuw4mNcBCAmzwLgfzXvKuElptBzBBMouhxlwA9375HZeuXrFOZhWmVdqR3b2Xwr0dsDzXebliDe1XuifHeCKHpGPEk4GuJW4txAuoQS/lX4OQNGZgwKA8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785969810; c=relaxed/simple;
	bh=CCqHGcWTrElOniPrdwAZd2rTB3ZJDF/4seGz8lpqdnI=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=Kgc1OfJrTqBnZIg6bM/0mxETk7qS8deFnGA30jHVJvFRZpWMFwH+Q9n69ERMWDn+ycjfY8Qn5a3eHN+6znxHZIDcjXgVsxrX2SrilvuNcG6cH7JGMs1i0m5iZILHLoYKXdFg04mWTaJkIWlPIiQJC5dOPBE0Lids5n92SQB6m0w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.210.80
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-ot1-f80.google.com with SMTP id 46e09a7af769-7f1da5e5b06so1833092a34.2
        for <linux-usb@vger.kernel.org>; Wed, 05 Aug 2026 15:43:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785969807; x=1786574607;
        h=content-type:to:from:subject:message-id:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ulgkTuRsYz1MvAm/nQRIwHTPfs+a91ZykIsUVmgnq98=;
        b=EiKYRPJlwpA9nMRStbRnfMTavcz3h/WN2vUH0pjoLLHx7U7Mor1PNEZeNfPM661405
         0csVUMRsykLmawd/fGZS4sCD8lbxR0Atds+X1WGpkda3XBfXnhAG2vLsd/lVESvYKVKT
         T+og4roKkmQMXAM7iMOHjIvxviojwMlP3JsPnijayrNJIJbmMX4k6roNrXy96dEbVhG2
         fi3X3WyFAFpD8H4MMcIvi6ni0ht/w14UECLe2EjYu2c8qCjYB8kbZSbppo2SdApm/Y7A
         aN6DxoU09W3FRFSiY++ikISW4s3bVd9wLQBKp3B6WqftOAguXNpc2xtqIiljx81j4mlj
         b1tg==
X-Forwarded-Encrypted: i=1; AHgh+RrHatf+tKgwPzaZP5aRn7wYsQY4OHSXQCVCK4KnFOYTlvS3YlYU+87VWmOnXxVo8M/wKR1xetVgDII=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz2SV7m5VgahRWfabRqmtd7ZCDdDqKKh6HdgtL2Mtd57L0a+SKO
	ScS7/VUUT/+dldCTp4O30yTL82u06AgsExZGzZ+sUMNTiVeoOIE7nbJxWgMFVHJdpXALZsV8jSr
	gZg/EdIoJUi9yW3rlJkQ0L10PgFHsvH6UMqVrCmueBVOCMdgoIEvh9cLjAVA=
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:2916:b0:69d:9dfb:7928 with SMTP id
 006d021491bc7-6ae96c1002fmr5484910eaf.3.1785969807558; Wed, 05 Aug 2026
 15:43:27 -0700 (PDT)
Date: Wed, 05 Aug 2026 15:43:27 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6a73bc8f.5aeeccc9.207e63.0003.GAE@google.com>
Subject: [syzbot] [usb?] BUG: unable to handle kernel paging request in ioread32
From: syzbot <syzbot+97999b836ee62ddb0181@syzkaller.appspotmail.com>
To: YehezkelShB@gmail.com, andreas.noever@gmail.com, 
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com, westeri@kernel.org
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    848acc8ffe1b Merge tag 'fsverity-for-linus' of git://git.k..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=1209b649580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=145fa60d73086782
dashboard link: https://syzkaller.appspot.com/bug?extid=97999b836ee62ddb0181
compiler:       gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=15febe32580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=145813b9580000

Downloadable assets:
disk image (non-bootable): https://storage.googleapis.com/syzbot-assets/d900f083ada3/non_bootable_disk-848acc8f.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/6fb497cc0c8d/vmlinux-848acc8f.xz
kernel image: https://storage.googleapis.com/syzbot-assets/663ccee34982/bzImage-848acc8f.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+97999b836ee62ddb0181@syzkaller.appspotmail.com

BUG: unable to handle page fault for address: 00000000000556e0
#PF: supervisor read access in kernel mode
#PF: error_code(0x0000) - not-present page
PGD 275ae067 P4D 275ae067 PUD 0 
Oops: Oops: 0000 [#1] SMP KASAN NOPTI
CPU: 2 UID: 0 PID: 5940 Comm: syz.0.17 Not tainted syzkaller #0 PREEMPT(full) 
Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.3-debian-1.16.3-2 04/01/2014
RIP: 0010:readl arch/x86/include/asm/io.h:59 [inline]
RIP: 0010:ioread32+0x87/0xc0 lib/iomap.c:99
Code: 2d 0e 3b 5a 0a 31 ff 89 ee e8 55 f0 e3 fc 85 ed 75 28 e8 dc f5 e3 fc bb ff ff ff ff 89 d8 5b 5d e9 ce 03 98 06 e8 c9 f5 e3 fc <8b> 1b e8 c2 f5 e3 fc 89 d8 5b 5d c3 cc cc cc cc e8 b4 f5 e3 fc 83
RSP: 0018:ffffc90004c878d0 EFLAGS: 00010293
RAX: 0000000000000000 RBX: 00000000000556e0 RCX: ffffffff85266eab
RDX: ffff88803214a540 RSI: ffffffff85266f17 RDI: ffff88803214a540
RBP: ffff888055c95c38 R08: 0000000000000007 R09: 000000000003ffff
R10: 00000000000556e0 R11: 0000000000000000 R12: 1ffff92000990f29
R13: ffff88802323a0d0 R14: ffff888055c95c80 R15: ffffc90004c87968
FS:  000055557cf64500(0000) GS:ffff8880d5fd8000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00000000000556e0 CR3: 0000000058784000 CR4: 0000000000352ef0
Call Trace:
 <TASK>
 nhi_probe+0xdc/0x8f0 drivers/thunderbolt/nhi.c:1198
 nhi_pci_probe+0x322/0x5a0 drivers/thunderbolt/pci.c:479
 local_pci_probe+0xdd/0x1b0 drivers/pci/pci-driver.c:332
 pci_call_probe+0x176/0x800 drivers/pci/pci-driver.c:394
 __pci_device_probe drivers/pci/pci-driver.c:455 [inline]
 pci_device_probe+0x1cd/0x370 drivers/pci/pci-driver.c:489
 call_driver_probe drivers/base/dd.c:628 [inline]
 really_probe+0x241/0xa60 drivers/base/dd.c:706
 __driver_probe_device+0x20e/0x450 drivers/base/dd.c:868
 device_driver_attach+0xd1/0x220 drivers/base/dd.c:1203
 bind_store+0xf4/0x190 drivers/base/bus.c:267
 drv_attr_store+0x74/0xb0 drivers/base/bus.c:125
 sysfs_kf_write+0xf2/0x150 fs/sysfs/file.c:145
 kernfs_fop_write_iter+0x3e0/0x5f0 fs/kernfs/file.c:345
 new_sync_write fs/read_write.c:595 [inline]
 vfs_write+0x6ac/0x1050 fs/read_write.c:687
 ksys_write+0x12a/0x250 fs/read_write.c:739
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0x115/0x870 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7fb04af9e019
Code: ff c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 44 00 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 e8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007fff5f802b58 EFLAGS: 00000246 ORIG_RAX: 0000000000000001
RAX: ffffffffffffffda RBX: 00007fb04b225fa0 RCX: 00007fb04af9e019
RDX: 000000000000000d RSI: 0000200000000240 RDI: 0000000000000005
RBP: 00007fb04b03500c R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000000
R13: 00007fb04b225fac R14: 00007fb04b225fa0 R15: 00007fb04b225fa0
 </TASK>
Modules linked in:
CR2: 00000000000556e0
---[ end trace 0000000000000000 ]---
RIP: 0010:readl arch/x86/include/asm/io.h:59 [inline]
RIP: 0010:ioread32+0x87/0xc0 lib/iomap.c:99
Code: 2d 0e 3b 5a 0a 31 ff 89 ee e8 55 f0 e3 fc 85 ed 75 28 e8 dc f5 e3 fc bb ff ff ff ff 89 d8 5b 5d e9 ce 03 98 06 e8 c9 f5 e3 fc <8b> 1b e8 c2 f5 e3 fc 89 d8 5b 5d c3 cc cc cc cc e8 b4 f5 e3 fc 83
RSP: 0018:ffffc90004c878d0 EFLAGS: 00010293
RAX: 0000000000000000 RBX: 00000000000556e0 RCX: ffffffff85266eab
RDX: ffff88803214a540 RSI: ffffffff85266f17 RDI: ffff88803214a540
RBP: ffff888055c95c38 R08: 0000000000000007 R09: 000000000003ffff
R10: 00000000000556e0 R11: 0000000000000000 R12: 1ffff92000990f29
R13: ffff88802323a0d0 R14: ffff888055c95c80 R15: ffffc90004c87968
FS:  000055557cf64500(0000) GS:ffff8880d5fd8000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00000000000556e0 CR3: 0000000058784000 CR4: 0000000000352ef0
----------------
Code disassembly (best guess):
   0:	2d 0e 3b 5a 0a       	sub    $0xa5a3b0e,%eax
   5:	31 ff                	xor    %edi,%edi
   7:	89 ee                	mov    %ebp,%esi
   9:	e8 55 f0 e3 fc       	call   0xfce3f063
   e:	85 ed                	test   %ebp,%ebp
  10:	75 28                	jne    0x3a
  12:	e8 dc f5 e3 fc       	call   0xfce3f5f3
  17:	bb ff ff ff ff       	mov    $0xffffffff,%ebx
  1c:	89 d8                	mov    %ebx,%eax
  1e:	5b                   	pop    %rbx
  1f:	5d                   	pop    %rbp
  20:	e9 ce 03 98 06       	jmp    0x69803f3
  25:	e8 c9 f5 e3 fc       	call   0xfce3f5f3
* 2a:	8b 1b                	mov    (%rbx),%ebx <-- trapping instruction
  2c:	e8 c2 f5 e3 fc       	call   0xfce3f5f3
  31:	89 d8                	mov    %ebx,%eax
  33:	5b                   	pop    %rbx
  34:	5d                   	pop    %rbp
  35:	c3                   	ret
  36:	cc                   	int3
  37:	cc                   	int3
  38:	cc                   	int3
  39:	cc                   	int3
  3a:	e8 b4 f5 e3 fc       	call   0xfce3f5f3
  3f:	83                   	.byte 0x83


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

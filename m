Received: from mail-oi2-f1.google.com (mail-oi2-f1.google.com [74.125.231.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99DD93C585C
	for <linux-usb@vger.kernel.org>; Fri, 21 Aug 2026 09:22:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787304164; cv=none; b=EpiCq9sWmPrdE7vAV5QiD5ZXZGcnfcALhehkPMEodOnd+BvOB1XkjL/VdomL7wrE6sBpM3mDKAIJ2OqEaWNOo4TP9aclSMaOD4aX2Pvk0m8Cu66n2Mw0mV9Zumi4YIuO4vcC+IqYphmwZdXMzPf8fwGgi/lzBv2Hzfh2i6GX59k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787304164; c=relaxed/simple;
	bh=R+Falvb7aeh3+wZfKYk5GYqgEeVUVSPc27M2lUs84RM=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=q7ZLxRg1HtuNauF9LU6lJQUpob+E5NGlwhx4GUvCF2NOQY4ToJzhKhaNrUNxAR0Fk6XxpvU+J4Di3xWCA31DEF8dxeaLO61bBsfqi2TczrB5NR0rdwKo5ELcnF4NEhSeSqctzyMZoR/OMfCkrUt/S+pQkaucTvtW8c5SAw7/gac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=74.125.231.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi2-f1.google.com with SMTP id 5614622812f47-4960b753d6fso296853b6e.0
        for <linux-usb@vger.kernel.org>; Fri, 21 Aug 2026 02:22:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787304152; x=1787908952;
        h=content-type:to:from:subject:message-id:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6xwR6XCWe++xBJomhdq8XEB5t+E2N04ze3+6U8ntcwY=;
        b=D/kuAMlNrRJvqaLO0YmiwYpStqxl7PnfR8Ci3ev4SnGAY6iT8rz5Chi2dBYZMIXVLI
         NxP2dCL7GRugIy2nk1oP0a3eeoo157WeqIvgbnCYeoHE+HFg05/WS2xT4MJTrUn6AHhC
         WunpOrMGdyIjTt96/A+v1C1VlRQPoW5q4EpxynHy5MpWcOdOG0jhuVbXMEUA+RzEdmEt
         pcGQ4nHRjRrPidoHJ/sgRxOOi9qpIZ7pFKTgyNE+aQc9c/ZarhVe7fHlPp+7jep63b/G
         EoPGTugDf18j8Q/GXeyoGGrGV/GMCWYe5OLkssd4Oi/ZvwVBXwu5uyY5w6qGiFWtrilk
         wEwQ==
X-Forwarded-Encrypted: i=1; AHgh+RoGbNMAdphC9CmpvqrJv+tRxjGsCWUlOeh/zFX2SCPVe2xpUWE+XAbsa/WzKw5A0noX2S7E8Mru7fQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YzqU5E61QAxxJCzP49nWDet6KBUqRITLycukgnxmmteBURVJTza
	V7p6GiW+Pznl09gy02loPpkEdHwtHWt14rhBzwg9dCZAMmo+2KIbNMjcMiOD4B0dUpaLQj+mhZF
	DnHgF/CvfWz4mteKdtZzPswcPdWRMr/iN5EChBkKt/iPLJPP1derNt1xfsW0=
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:308a:b0:497:df42:1e04 with SMTP id
 5614622812f47-4b2ef4d45f6mr4569223b6e.18.1787304152203; Fri, 21 Aug 2026
 02:22:32 -0700 (PDT)
Date: Fri, 21 Aug 2026 02:22:32 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6a8818d8.ae6ddae5.3da009.0030.GAE@google.com>
Subject: [syzbot] [usb?] general protection fault in ucsi_acpi_probe
From: syzbot <syzbot+23cf45a9fce78e4e0dc1@syzkaller.appspotmail.com>
To: gregkh@linuxfoundation.org, heikki.krogerus@linux.intel.com, 
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    4477a78374a5 Add linux-next specific files for 20260814
git tree:       linux-next
console output: https://syzkaller.appspot.com/x/log.txt?x=114036c6580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=9b32a36dd637b06f
dashboard link: https://syzkaller.appspot.com/bug?extid=23cf45a9fce78e4e0dc1
compiler:       Debian clang version 22.1.8 (++20260613092233+e80beda6e255-1~exp1~20260613092250.77), Debian LLD 22.1.8
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=13c60679580000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/994c1c8c560e/disk-4477a783.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/cd54543d69ae/vmlinux-4477a783.xz
kernel image: https://storage.googleapis.com/syzbot-assets/407cdf8f3fc2/bzImage-4477a783.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+23cf45a9fce78e4e0dc1@syzkaller.appspotmail.com

Oops: general protection fault, probably for non-canonical address 0xdffffc00000000e5: 0000 [#1] SMP KASAN PTI
KASAN: null-ptr-deref in range [0x0000000000000728-0x000000000000072f]
CPU: 1 UID: 0 PID: 5814 Comm: syz.0.17 Not tainted syzkaller #0 PREEMPT(full) 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 07/24/2026
RIP: 0010:ucsi_acpi_probe+0x6c/0x4b0 drivers/usb/typec/ucsi/ucsi_acpi.c:199
Code: 89 74 24 08 4c 8b 23 4c 89 e7 e8 ef df 54 fd 49 83 c4 f0 45 31 f6 84 c0 4d 0f 45 f4 49 81 c6 2c 07 00 00 4c 89 f0 48 c1 e8 03 <42> 0f b6 04 28 84 c0 0f 85 16 04 00 00 41 8b 2e 31 ff 89 ee e8 cb
RSP: 0018:ffffc9000272fab8 EFLAGS: 00010203
RAX: 00000000000000e5 RBX: ffff88801db68430 RCX: ffff88807f249f40
RDX: 0000000000000000 RSI: 0000000000000000 RDI: 0000000000000000
RBP: 0000000000000000 R08: ffff88802b52e5a3 R09: 1ffff110056a5cb4
R10: dffffc0000000000 R11: ffffffff87e620e0 R12: fffffffffffffff0
R13: dffffc0000000000 R14: 000000000000072c R15: 1ffff11003b6d086
FS:  000055555ee6f500(0000) GS:ffff888124df8000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007fb722c70000 CR3: 0000000075912000 CR4: 00000000003526f0
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
RIP: 0033:0x7fb722d9e0d9
Code: ff c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 44 00 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 e8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007fff7bf8acb8 EFLAGS: 00000246 ORIG_RAX: 0000000000000001
RAX: ffffffffffffffda RBX: 00007fb723025fa0 RCX: 00007fb722d9e0d9
RDX: 0000000000000007 RSI: 0000200000000180 RDI: 0000000000000004
RBP: 00007fb722e35024 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000000
R13: 00007fb723025fac R14: 00007fb723025fa0 R15: 00007fb723025fa0
 </TASK>
Modules linked in:
---[ end trace 0000000000000000 ]---
RIP: 0010:ucsi_acpi_probe+0x6c/0x4b0 drivers/usb/typec/ucsi/ucsi_acpi.c:199
Code: 89 74 24 08 4c 8b 23 4c 89 e7 e8 ef df 54 fd 49 83 c4 f0 45 31 f6 84 c0 4d 0f 45 f4 49 81 c6 2c 07 00 00 4c 89 f0 48 c1 e8 03 <42> 0f b6 04 28 84 c0 0f 85 16 04 00 00 41 8b 2e 31 ff 89 ee e8 cb
RSP: 0018:ffffc9000272fab8 EFLAGS: 00010203
RAX: 00000000000000e5 RBX: ffff88801db68430 RCX: ffff88807f249f40
RDX: 0000000000000000 RSI: 0000000000000000 RDI: 0000000000000000
RBP: 0000000000000000 R08: ffff88802b52e5a3 R09: 1ffff110056a5cb4
R10: dffffc0000000000 R11: ffffffff87e620e0 R12: fffffffffffffff0
R13: dffffc0000000000 R14: 000000000000072c R15: 1ffff11003b6d086
FS:  000055555ee6f500(0000) GS:ffff888124cf8000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007fb722fee000 CR3: 0000000075912000 CR4: 00000000003526f0
----------------
Code disassembly (best guess):
   0:	89 74 24 08          	mov    %esi,0x8(%rsp)
   4:	4c 8b 23             	mov    (%rbx),%r12
   7:	4c 89 e7             	mov    %r12,%rdi
   a:	e8 ef df 54 fd       	call   0xfd54dffe
   f:	49 83 c4 f0          	add    $0xfffffffffffffff0,%r12
  13:	45 31 f6             	xor    %r14d,%r14d
  16:	84 c0                	test   %al,%al
  18:	4d 0f 45 f4          	cmovne %r12,%r14
  1c:	49 81 c6 2c 07 00 00 	add    $0x72c,%r14
  23:	4c 89 f0             	mov    %r14,%rax
  26:	48 c1 e8 03          	shr    $0x3,%rax
* 2a:	42 0f b6 04 28       	movzbl (%rax,%r13,1),%eax <-- trapping instruction
  2f:	84 c0                	test   %al,%al
  31:	0f 85 16 04 00 00    	jne    0x44d
  37:	41 8b 2e             	mov    (%r14),%ebp
  3a:	31 ff                	xor    %edi,%edi
  3c:	89 ee                	mov    %ebp,%esi
  3e:	e8                   	.byte 0xe8
  3f:	cb                   	lret


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

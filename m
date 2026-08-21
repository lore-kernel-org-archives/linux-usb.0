Received: from mail-oi1-f205.google.com (mail-oi1-f205.google.com [209.85.167.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1879326D44
	for <linux-usb@vger.kernel.org>; Fri, 21 Aug 2026 07:30:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787297440; cv=none; b=S5m9d/dvnLZULuIxBe4la7s9AxaT8R9NoX5UJpl4x+g3IJdyGeRmmn+OAs8udWHc1XFBEnSHRldCTFdC8QTBOADKVVj5scj4ONs6cEjQMD+sxYFqJXxg2d5tuRmBXQt8te6LTyTl5KwnGyt6+ldeSZ+oyhPHLJ6DYTLETSn+GR4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787297440; c=relaxed/simple;
	bh=oveuC+Sm4W5ZEENddqCF5jo5/SjjFu9cUqPyt3zve44=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=O5pxKjOcKhFg9Id5gwvsjoaIudpvdJiFn/2ZxEsVAQ04oCxtmmla0AcTNrxBt7mlsYm1DK/Hs8NipnNFTKQtohbhI69RSxJVRPgesbEqpKz/LYCsjWwKlG9G+CUbCEkQLPZ6KZEKTxAZ3bqKtOeaqJZ7ftJLSILYgKX6f8MCfmA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f205.google.com with SMTP id 5614622812f47-4a41f46d629so1228361b6e.3
        for <linux-usb@vger.kernel.org>; Fri, 21 Aug 2026 00:30:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787297437; x=1787902237;
        h=content-type:to:from:subject:message-id:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1h3ZHsvsc0Sm1B01IFhuco7MueztSnaLQBuAWE2FBPI=;
        b=c24Nn9gGflJTLxv/WqS2Iu315PLomN5cWfGEMkYQnGBBBsI1FtsCocDre2zk3rmTQ4
         WedLL55rghZMcSSFW4Q/0oRjNV9SIoA8s3FWfZ2SthS2t4I3/ZVHBFFS/2Z6YD9TjHjh
         fdHN6IJHgWkwbugyqmxjwKyqSvnjGijXrT5CfkGq3ML+EySoLDWiVM0AmH6VG+wUokEQ
         oQeZ9VIRSMUnp3KweGjTu5eokelxFzZo5qe72Q09zSX6b/tEWLKquZ19z9T1sDdkAN3q
         WbBlF9ZsCQD4XJeTzyjwT47+x44ixttvO2BoUP7DuWimP/D7yhKi40tY7dojqQ2WLK6x
         7clg==
X-Forwarded-Encrypted: i=1; AHgh+RorRzoLiyxMrL7zEYZ1lKDzbspgcQk/5LyYRtfys6U/cMLE9nDqg+rSjyFNoU8xyJXrSan84912cVA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx8AlQ+8IaEsoTdzRKJhEqQwa0H4bk3PSWpPPZ+LNODR9xy2p0B
	klce96+7sz6uA/2nvJ12EhUFqUDek0Aww2yMQcf+auIv/IerZcN3+snZfHU0YAH9+gRayobUiVa
	gY4q5t3IFhwumkmhyrbRYZxerXfoU0bp4mlB7FVh3FUe8bxKW1nDzvkyaFLY=
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:13ca:b0:4aa:cad:cb4d with SMTP id
 5614622812f47-4b2ef40c7e8mr4198506b6e.19.1787297437505; Fri, 21 Aug 2026
 00:30:37 -0700 (PDT)
Date: Fri, 21 Aug 2026 00:30:37 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6a87fe9d.ae6ddae5.3da009.002b.GAE@google.com>
Subject: [syzbot] [usb-storage?] general protection fault in alauda_transport
From: syzbot <syzbot+ccc9a7cb39fa1af827ea@syzkaller.appspotmail.com>
To: gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org, stern@rowland.harvard.edu, 
	syzkaller-bugs@googlegroups.com, usb-storage@lists.one-eyed-alien.net
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    bdab5605259b usb: gadget: uvc: fix dangling pointers in uv..
git tree:       https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
console output: https://syzkaller.appspot.com/x/log.txt?x=122ed6c6580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=8bdeea7ee6735f91
dashboard link: https://syzkaller.appspot.com/bug?extid=ccc9a7cb39fa1af827ea
compiler:       gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=12012679580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=162ed6c6580000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/2cb2fdbdd7b7/disk-bdab5605.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/f801d31c2001/vmlinux-bdab5605.xz
kernel image: https://storage.googleapis.com/syzbot-assets/9002a6e0ae14/bzImage-bdab5605.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+ccc9a7cb39fa1af827ea@syzkaller.appspotmail.com

Oops: general protection fault, probably for non-canonical address 0xdffffc0000000000: 0000 [#1] SMP KASAN PTI
KASAN: null-ptr-deref in range [0x0000000000000000-0x0000000000000007]
CPU: 0 UID: 0 PID: 6317 Comm: usb-storage Not tainted syzkaller #0 PREEMPT(lazy) 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 07/24/2026
RIP: 0010:alauda_read_data drivers/usb/storage/alauda.c:972 [inline]
RIP: 0010:alauda_transport+0xfd6/0x35c0 drivers/usb/storage/alauda.c:1187
Code: 48 c1 e9 03 80 3c 31 00 0f 85 ee 1d 00 00 48 8b 0b 8b 54 24 10 48 be 00 00 00 00 00 fc ff df 48 8d 1c 51 48 89 d9 48 c1 e9 03 <0f> b6 34 31 48 89 d9 83 e1 07 83 c1 01 40 38 f1 7c 09 40 84 f6 0f
RSP: 0018:ffffc90002dcf9e0 EFLAGS: 00010246
RAX: 0000000000000000 RBX: 0000000000000000 RCX: 0000000000000000
RDX: 0000000000000000 RSI: dffffc0000000000 RDI: ffff888118ad0920
RBP: 0000000000000240 R08: 0000000000000005 R09: 000000000000001f
R10: 0000000000000009 R11: ffffffff81596b4a R12: 0000000000000001
R13: 0000000000000001 R14: ffff888118ad0900 R15: 0000000000000000
FS:  0000000000000000(0000) GS:ffff888268633000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007f7516ee1254 CR3: 0000000109f36000 CR4: 00000000003506f0
Call Trace:
 <TASK>
 usb_stor_invoke_transport+0xee/0x15d0 drivers/usb/storage/transport.c:611
 usb_stor_control_thread+0x5e4/0xae0 drivers/usb/storage/usb.c:462
 kthread+0x370/0x450 kernel/kthread.c:436
 ret_from_fork+0x69a/0xc80 arch/x86/kernel/process.c:158
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245
 </TASK>
Modules linked in:
---[ end trace 0000000000000000 ]---
RIP: 0010:alauda_read_data drivers/usb/storage/alauda.c:972 [inline]
RIP: 0010:alauda_transport+0xfd6/0x35c0 drivers/usb/storage/alauda.c:1187
Code: 48 c1 e9 03 80 3c 31 00 0f 85 ee 1d 00 00 48 8b 0b 8b 54 24 10 48 be 00 00 00 00 00 fc ff df 48 8d 1c 51 48 89 d9 48 c1 e9 03 <0f> b6 34 31 48 89 d9 83 e1 07 83 c1 01 40 38 f1 7c 09 40 84 f6 0f
RSP: 0018:ffffc90002dcf9e0 EFLAGS: 00010246
RAX: 0000000000000000 RBX: 0000000000000000 RCX: 0000000000000000
RDX: 0000000000000000 RSI: dffffc0000000000 RDI: ffff888118ad0920
RBP: 0000000000000240 R08: 0000000000000005 R09: 000000000000001f
R10: 0000000000000009 R11: ffffffff81596b4a R12: 0000000000000001
R13: 0000000000000001 R14: ffff888118ad0900 R15: 0000000000000000
FS:  0000000000000000(0000) GS:ffff888268733000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007fb6f8698060 CR3: 0000000125ff4000 CR4: 00000000003506f0
----------------
Code disassembly (best guess):
   0:	48 c1 e9 03          	shr    $0x3,%rcx
   4:	80 3c 31 00          	cmpb   $0x0,(%rcx,%rsi,1)
   8:	0f 85 ee 1d 00 00    	jne    0x1dfc
   e:	48 8b 0b             	mov    (%rbx),%rcx
  11:	8b 54 24 10          	mov    0x10(%rsp),%edx
  15:	48 be 00 00 00 00 00 	movabs $0xdffffc0000000000,%rsi
  1c:	fc ff df
  1f:	48 8d 1c 51          	lea    (%rcx,%rdx,2),%rbx
  23:	48 89 d9             	mov    %rbx,%rcx
  26:	48 c1 e9 03          	shr    $0x3,%rcx
* 2a:	0f b6 34 31          	movzbl (%rcx,%rsi,1),%esi <-- trapping instruction
  2e:	48 89 d9             	mov    %rbx,%rcx
  31:	83 e1 07             	and    $0x7,%ecx
  34:	83 c1 01             	add    $0x1,%ecx
  37:	40 38 f1             	cmp    %sil,%cl
  3a:	7c 09                	jl     0x45
  3c:	40 84 f6             	test   %sil,%sil
  3f:	0f                   	.byte 0xf


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

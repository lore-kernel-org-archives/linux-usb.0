Received: from mail-oi2-f4.google.com (mail-oi2-f4.google.com [74.125.231.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF8521E0DE8
	for <linux-usb@vger.kernel.org>; Tue, 25 Aug 2026 05:13:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787634811; cv=none; b=dQmMdu9La+GMlu9GJG0Q1A3D6NwZbrl3bZLZIobBqQSHxAXpJeYNgO7eRxG/2Ku8AHu5deXIj4jQEC9QGe4z91PdiPKZ/OoaxM8FfNoM7zU1m3OLeAHo7h3fONBNTtJGp6nZAIjNtnKQPfiZEdb2zX9R7swukraWFKI3PBEnE8g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787634811; c=relaxed/simple;
	bh=kd4raqozJlF8oJwm/9iR6Iz+KK4sFDkFgm3aPOtZ4Hs=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=M3hxArolY1kUYeSW0fUkriuO2qC+CsOmQX3CNulXM4K1TMQOhQS8uxAAb2gCz/H9nKFVP27D5yNhA0BDmsS+EwxFVP5AmOUpBcaLCWsuhyXne3visWqtmZZE0dO9o/Gfe4VwysMn2nh7uDyjs4zJYN6srRy7zc5vhMO8LYmcpj8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=74.125.231.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi2-f4.google.com with SMTP id 5614622812f47-4ab2d72ff13so1610764b6e.0
        for <linux-usb@vger.kernel.org>; Mon, 24 Aug 2026 22:13:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787634808; x=1788239608;
        h=content-type:to:from:subject:message-id:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Dxj/XHg//d6B5CRWxpPSb7UrRCmb/zUQgh32C4WER+M=;
        b=K+jkxew4Ksdp6MykmVsscjQEzYK0I1N/dYEhwABhWiFZtfg3fGhWuAINK+Yi6G4gwY
         HZgNbJBtGUxbcGdTDPeOUkX9To/iOypSR4hX1TkcY9E32fviO8Fdxqfref2544PuYY4v
         d44lt8r5eXGOk7hPHKD1Ntzi1E8StayPFjA9NabSYlhT1ZFN1et7B+tsZPR4KnMKfvUf
         QCB3M92sw8xF0nM46VbEI+5PxyrX3xyeoIL9exu7v30xtsELP1ROLM20uCqxbahne7Ic
         DsOFG7IlZeJg1bv5QJMmms4bV8ncw3Bb+IcDz7RxqSvzwXQBmsdMZ+5as6hVZK+MNawG
         +NjQ==
X-Forwarded-Encrypted: i=1; AHgh+RokcXKeNnReMAezjyCs3b4zl1AhkoIE+L6dmgfgwc6rj4SkXtcRTG/gaebfnoD5D13FNSLI/DVxXvU=@vger.kernel.org
X-Gm-Message-State: AFuF++nYT0BOukibXVthW5kEANNg64ADWAsEdnp1zbPdYuT82QK1oFTf
	D/aRZy01D/dVExBHLK4r6tkHOKpUJXE1Ta/vyyzNtdmOxwTAtjKNeTPt+ilhzXrUbxOzg490ELg
	HUE7tCrUTi2Z3uwyrFtI0E59QqUEH1Nx7IL4MOx0KIDH0TwnIoQgfq9x5LsY=
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:f92:b0:4b1:540a:df99 with SMTP id
 5614622812f47-4b35078eac6mr3792930b6e.21.1787634808491; Mon, 24 Aug 2026
 22:13:28 -0700 (PDT)
Date: Mon, 24 Aug 2026 22:13:28 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6a8d2478.a5a502ce.31d34.001f.GAE@google.com>
Subject: [syzbot] [usb-storage?] WARNING in usb_stor_scan_dwork/usb_submit_urb
From: syzbot <syzbot+50c258b43e6a020d124f@syzkaller.appspotmail.com>
To: gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org, stern@rowland.harvard.edu, 
	syzkaller-bugs@googlegroups.com, usb-storage@lists.one-eyed-alien.net
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    e1e6e541c5c9 Merge tag 'thunderbolt-for-v7.3-rc1' of ssh:/..
git tree:       https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
console output: https://syzkaller.appspot.com/x/log.txt?x=168c0179580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=8bdeea7ee6735f91
dashboard link: https://syzkaller.appspot.com/bug?extid=50c258b43e6a020d124f
compiler:       gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/3b0a1f8e6a1f/disk-e1e6e541.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/f98d855e85e8/vmlinux-e1e6e541.xz
kernel image: https://storage.googleapis.com/syzbot-assets/db2c3a41df6d/bzImage-e1e6e541.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+50c258b43e6a020d124f@syzkaller.appspotmail.com

------------[ cut here ]------------
URB ffff888103ab5d00 submitted while active
WARNING: drivers/usb/core/urb.c:379 at usb_submit_urb+0x1689/0x19b0 drivers/usb/core/urb.c:379, CPU#0: kworker/0:4/5231
Modules linked in:
CPU: 0 UID: 0 PID: 5231 Comm: kworker/0:4 Not tainted syzkaller #0 PREEMPT(lazy) 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 07/24/2026
Workqueue: events_freezable usb_stor_scan_dwork
RIP: 0010:usb_submit_urb+0x168c/0x19b0 drivers/usb/core/urb.c:379
Code: 00 48 8b 04 24 48 8b 90 b0 00 00 00 e9 70 ff ff ff bb ed ff ff ff e9 ac f1 ff ff e8 ce 9a ba fc 48 8d 3d 67 f4 00 06 48 89 de <67> 48 0f b9 3a bb f0 ff ff ff e9 8e f1 ff ff c7 44 24 30 00 00 00
RSP: 0018:ffffc90002dafa48 EFLAGS: 00010293
RAX: 0000000000000000 RBX: ffff888103ab5d00 RCX: dffffc0000000000
RDX: ffff888119261e00 RSI: ffff888103ab5d00 RDI: ffffffff8afa6e20
RBP: 1ffff920005b5f5c R08: 0000000000000002 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000000 R12: ffff88813cc60fb0
R13: ffff88813cc60f28 R14: ffffc90002dafb00 R15: ffff888103ab5d00
FS:  0000000000000000(0000) GS:ffff888268633000(0000) knlGS:0000000000000000
Call Trace:
 <TASK>
 usb_stor_scan_dwork+0x1e6/0x2c0 drivers/usb/storage/usb.c:988
 process_one_work+0xa23/0x1940 kernel/workqueue.c:3322
 process_scheduled_works kernel/workqueue.c:3405 [inline]
 worker_thread+0x5ef/0xe50 kernel/workqueue.c:3486
 kthread+0x370/0x450 kernel/kthread.c:436
 ret_from_fork+0x69a/0xc80 arch/x86/kernel/process.c:158
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245
 </TASK>
----------------
Code disassembly (best guess):
   0:	00 48 8b             	add    %cl,-0x75(%rax)
   3:	04 24                	add    $0x24,%al
   5:	48 8b 90 b0 00 00 00 	mov    0xb0(%rax),%rdx
   c:	e9 70 ff ff ff       	jmp    0xffffff81
  11:	bb ed ff ff ff       	mov    $0xffffffed,%ebx
  16:	e9 ac f1 ff ff       	jmp    0xfffff1c7
  1b:	e8 ce 9a ba fc       	call   0xfcba9aee
  20:	48 8d 3d 67 f4 00 06 	lea    0x600f467(%rip),%rdi        # 0x600f48e
  27:	48 89 de             	mov    %rbx,%rsi
* 2a:	67 48 0f b9 3a       	ud1    (%edx),%rdi <-- trapping instruction
  2f:	bb f0 ff ff ff       	mov    $0xfffffff0,%ebx
  34:	e9 8e f1 ff ff       	jmp    0xfffff1c7
  39:	c7                   	.byte 0xc7
  3a:	44 24 30             	rex.R and $0x30,%al
  3d:	00 00                	add    %al,(%rax)


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

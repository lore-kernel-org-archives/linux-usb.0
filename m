Received: from mail-oa1-f77.google.com (mail-oa1-f77.google.com [209.85.160.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3138944BCB8
	for <linux-usb@vger.kernel.org>; Fri, 31 Jul 2026 17:13:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.77
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785518019; cv=none; b=kU5DFFBlB09K5pj1LUgG6/KRcO5BaeEb++EsLw7HUMA1TvkYNMm0o1On1FFn741FbJ5XeWYO3A2NzwNrDg01perSgxIEBncV70nA0NxZ6NHpcUtvm1mRY1CDZOkYgV3KW4NI2qUVRmVI9zCfT2L74Z5xcntr7U2d0NKZl2KQwGU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785518019; c=relaxed/simple;
	bh=96PNsj1/Hnew5zbsnXedf9JB5xT9/AZJthw1LhWZ3Ug=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=BdhTCRyJ/LKPrrxjoJIOixqeat1PfhIdnuPsE9at3388/8XA5hRtNui4GbWrQxuAQ4FdpiVcK8dtSAF9sl4Z51PfX9gv5GidCpx7tWNN8f+xt1n27ChVh0K/ckNy9plfgWDWV6gizj9iyz6MN1Jg/EBv3W3mGXG9eS/5AzoeOk0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.160.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oa1-f77.google.com with SMTP id 586e51a60fabf-44d0960fb5bso947518fac.2
        for <linux-usb@vger.kernel.org>; Fri, 31 Jul 2026 10:13:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785518014; x=1786122814;
        h=content-type:to:from:subject:message-id:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YsSTy9xzX8uiUelmYUyQXwhjgy1boltKLtOgh/tyd2g=;
        b=meiKTOZV+m/eUlSa0CndKaz7RILXaVwscvA3MVfDUprj4nuNSE4YKVJHbMmf2fHZOv
         SUSyB2QZ6YaXlGcZs8m8/pTxPac5xqTGKF8Xtci3VffXRQKszHAHg2tQT7NwlDdOO+NM
         qogrYXOHOAa18kpg2q1H3PoLRhWi6owNIdaGEXRNQkzoCKj83VZXQNjT9zMnmcMGohuG
         o6T0267QURSdkLT8j9AMKMNUv42lF4rU4YEEUxAe5qISNv4LkHXywLGoap5RuTdBFOi4
         oeqQJnDbPP9nbVPd+28ilYvroVy/1GjVLBcQPIs5PfBsbekUaWQLOoVOahDsDG0sbSYI
         WHaA==
X-Forwarded-Encrypted: i=1; AHgh+RqmJCN9xnRjtfLRyVkARaLgFezLErITCS8dJOn5wbDU4fq07GEAc9x5nif+fOL3vquCyppnRieow0o=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyka9o0ClaHYAf+TENimMMeGRuAHtL+yqcpyVNZdmoTsArbGv5t
	xbq2WLm16KIBmBbwDlOrMJI7+koPJg9VHed2aNhbXxLkccahuvzspqt9ONMffJ3R1cqtmHnWGqC
	PJuvyduPKXUDC4gpZULtIYzSe8+JbYbN9Ydb5nbCCAsz6G/aAKIX8eSIRNqY=
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:17a9:b0:48f:c907:7a40 with SMTP id
 5614622812f47-4af5e1b5806mr1418049b6e.11.1785518013890; Fri, 31 Jul 2026
 10:13:33 -0700 (PDT)
Date: Fri, 31 Jul 2026 10:13:33 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6a6cd7bd.1aa927e4.17d4bf.0004.GAE@google.com>
Subject: [syzbot] [usb?] WARNING in usb_ep_enable
From: syzbot <syzbot+7b70c4a6021fd49c4151@syzkaller.appspotmail.com>
To: gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    11028ab62899 Merge tag 'probes-fixes-v7.2-rc5' of git://gi..
git tree:       upstream
console+strace: https://syzkaller.appspot.com/x/log.txt?x=1673649e580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=cb17729fb04b1e3a
dashboard link: https://syzkaller.appspot.com/bug?extid=7b70c4a6021fd49c4151
compiler:       Debian clang version 22.1.8 (++20260613092233+e80beda6e255-1~exp1~20260613092250.77), Debian LLD 22.1.8
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=13074aea580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=161271b9580000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/bc967be819a3/disk-11028ab6.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/6e9f003c9cc8/vmlinux-11028ab6.xz
kernel image: https://storage.googleapis.com/syzbot-assets/5c292926486f/bzImage-11028ab6.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+7b70c4a6021fd49c4151@syzkaller.appspotmail.com

------------[ cut here ]------------
usb_ep_enable: ep129 (ep1in-bulk) has maxpacket 0
WARNING: drivers/usb/gadget/udc/core.c:125 at usb_ep_enable+0x148/0x480 drivers/usb/gadget/udc/core.c:124, CPU#1: ktimers/1/29
Modules linked in:
CPU: 1 UID: 0 PID: 29 Comm: ktimers/1 Not tainted syzkaller #0 PREEMPT_{RT,(full)} 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 07/24/2026
RIP: 0010:usb_ep_enable+0x1bc/0x480 drivers/usb/gadget/udc/core.c:124
Code: 4a 17 02 fb 49 83 3f 00 48 c7 c0 60 b3 1f 8c 49 c7 c0 80 b3 1f 8c 4c 0f 44 c0 4c 89 f7 48 c7 c6 8b 42 b0 8d 44 89 ea 4c 89 e1 <67> 48 0f b9 3a bd ea ff ff ff 0f 1f 44 00 00 e8 40 a4 98 fa 65 8b
RSP: 0018:ffffc90000a3f6b8 EFLAGS: 00010282
RAX: ffffffff8c1fb360 RBX: ffff88802a08c120 RCX: ffffffff8c1fd1e0
RDX: 0000000000000081 RSI: ffffffff8db0428b RDI: ffffffff8fbc9d40
RBP: dffffc0000000000 R08: ffffffff8c1fb380 R09: 0000000000000100
R10: 0000000000000100 R11: 0000000000000003 R12: ffffffff8c1fd1e0
R13: 0000000000000081 R14: ffffffff8fbc9d40 R15: ffff88802a08c138
FS:  0000000000000000(0000) GS:ffff888125d41000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 0000563af0aa84a0 CR3: 00000000382cc000 CR4: 00000000003526f0
Call Trace:
 <TASK>
 hidg_set_alt+0x12a/0xa50 drivers/usb/gadget/function/f_hid.c:1042
 set_config+0x749/0x1160 drivers/usb/gadget/composite.c:1018
 composite_setup+0x1de7/0x3480 drivers/usb/gadget/composite.c:1901
 configfs_composite_setup+0xbd/0x100 drivers/usb/gadget/configfs.c:1877
 dummy_timer+0x2f77/0x4d50 drivers/usb/gadget/udc/dummy_hcd.c:1951
 __run_hrtimer kernel/time/hrtimer.c:2032 [inline]
 __hrtimer_run_queues+0x3eb/0xaf0 kernel/time/hrtimer.c:2096
 hrtimer_run_softirq+0x18f/0x260 kernel/time/hrtimer.c:2113
 handle_softirqs+0x1d9/0x6c0 kernel/softirq.c:622
 __do_softirq kernel/softirq.c:656 [inline]
 run_ktimerd+0x69/0x100 kernel/softirq.c:1151
 smpboot_thread_fn+0x57c/0xa80 kernel/smpboot.c:160
 kthread+0x388/0x470 kernel/kthread.c:436
 ret_from_fork+0x514/0xb70 arch/x86/kernel/process.c:158
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245
 </TASK>
----------------
Code disassembly (best guess):
   0:	4a 17                	rex.WX (bad)
   2:	02 fb                	add    %bl,%bh
   4:	49 83 3f 00          	cmpq   $0x0,(%r15)
   8:	48 c7 c0 60 b3 1f 8c 	mov    $0xffffffff8c1fb360,%rax
   f:	49 c7 c0 80 b3 1f 8c 	mov    $0xffffffff8c1fb380,%r8
  16:	4c 0f 44 c0          	cmove  %rax,%r8
  1a:	4c 89 f7             	mov    %r14,%rdi
  1d:	48 c7 c6 8b 42 b0 8d 	mov    $0xffffffff8db0428b,%rsi
  24:	44 89 ea             	mov    %r13d,%edx
  27:	4c 89 e1             	mov    %r12,%rcx
* 2a:	67 48 0f b9 3a       	ud1    (%edx),%rdi <-- trapping instruction
  2f:	bd ea ff ff ff       	mov    $0xffffffea,%ebp
  34:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
  39:	e8 40 a4 98 fa       	call   0xfa98a47e
  3e:	65                   	gs
  3f:	8b                   	.byte 0x8b


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

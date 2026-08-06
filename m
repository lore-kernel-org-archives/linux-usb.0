Received: from mail-oo1-f78.google.com (mail-oo1-f78.google.com [209.85.161.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 732BF3AFAE2
	for <linux-usb@vger.kernel.org>; Thu,  6 Aug 2026 00:00:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.78
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785974438; cv=none; b=CJt99Rm7gaKHbQrbAIVQ1LbqoZQqMhewm5eOG36c5RgwtLUi2mxfulCxNUNdkFpXylTdDWOxg9GUtCwptGFTXMaPdlpI8RUfdU9HcVBw788L24Io2Uq2KKLD+PRrr+KYVzZ6rLaP0uc6fRsathql4bAXkV28j136RpJuZm35xBk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785974438; c=relaxed/simple;
	bh=icn/aDAYCXpAWhAQTmTumnDdxIQcrzC5ybMVYb9LNxE=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=ArOuOsFrZZO6+3HLahcAeitADacBa/LRyGS5RzwSg4wlRO4lwP2HzDfENaAMmhOGskmRCQxeSjHwIjpd1qea7LeTsIiT/5Q2s2lFhgPP4qat/ZAxgYldqwrGlfBGkv1jXJGF0lvyAtJTKoYJIbi8fD/2+8mzmjPIa0CQpQaJ9Ts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.161.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oo1-f78.google.com with SMTP id 006d021491bc7-6aea69817d1so607137eaf.2
        for <linux-usb@vger.kernel.org>; Wed, 05 Aug 2026 17:00:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785974435; x=1786579235;
        h=content-type:to:from:subject:message-id:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2OeZiOjowoYkWbw23nVm9ViEHp38RwbXMZRN2rnQJXI=;
        b=TqkIuDjLtsfSul5y19z8Z3txqN2/E3TYmAqTcXqOnWt9ECVhEMLZUzwsv5v/1aXTw7
         MsL6eZmsuXz1VML0TZeLziNsxsvllktFe/J98L9VR6+uOEzOOVuChqP4CBuF8GZR7MeC
         d8+M9akQGHdIJDHy5UhXzSKvfSZTuIevkiAy4dQCHFnQu4bp6FgibaVCY2+WGuKrgW9c
         c2WX2BJ3Ctpl9D9aGSHQ059JNSC4RZ181Q+ImhWgiWr0qWluy8qoapTkXl9kC2p1bIOU
         VhQqeYPHmDXm+aglme1ZLKQKa4XrNdsVSE7lQk4fuYkkJlCSImAY6uj+y4Fg+TwpApdx
         HAkg==
X-Forwarded-Encrypted: i=1; AHgh+Rp9uFtrtVGW/8IkD84J+pcA70KxYxJpdhTw+0V6CwrI871hoyiJ7CAw9isXsEsYqaip/JfsQjYv9b4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzo6Jl8wSAlLrv6vBASoR8JqcVPiTFQGOUGmYCHeqI09Zc01hiQ
	XtrwDSLu/ts7jn6qEotLzdIqjSXqRy8fQpp07RNejTvnabdOIYecieVJBn0ZGe+f4csIULv4E/y
	YnA3w6aY0I7jTSH8FJ/AAYkx0nH7R6JVaLvveaZ/mmhmeddTtoWpJXHNnm9E=
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:1796:b0:6aa:ec6a:21a5 with SMTP id
 006d021491bc7-6ae96fd90d8mr5639088eaf.31.1785974434961; Wed, 05 Aug 2026
 17:00:34 -0700 (PDT)
Date: Wed, 05 Aug 2026 17:00:34 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6a73cea2.01d0871a.3a0d52.000d.GAE@google.com>
Subject: [syzbot] [usb?] WARNING in spcp8x5_get_msr
From: syzbot <syzbot+3b514b87202742f22c44@syzkaller.appspotmail.com>
To: gregkh@linuxfoundation.org, johan@kernel.org, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    848acc8ffe1b Merge tag 'fsverity-for-linus' of git://git.k..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=17602cc6580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=145fa60d73086782
dashboard link: https://syzkaller.appspot.com/bug?extid=3b514b87202742f22c44
compiler:       gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=12193e32580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=1224e3b9580000

Downloadable assets:
disk image (non-bootable): https://storage.googleapis.com/syzbot-assets/d900f083ada3/non_bootable_disk-848acc8f.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/6fb497cc0c8d/vmlinux-848acc8f.xz
kernel image: https://storage.googleapis.com/syzbot-assets/663ccee34982/bzImage-848acc8f.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+3b514b87202742f22c44@syzkaller.appspotmail.com

SPCP8x5 ttyUSB0: failed to set control lines: -32
------------[ cut here ]------------
do not call blocking ops when !TASK_RUNNING; state=1 set at [<ffffffff81e258b8>] prepare_to_wait+0x98/0x380 kernel/sched/wait.c:256
WARNING: kernel/sched/core.c:9120 at __might_sleep+0x94/0xc0 kernel/sched/core.c:9120, CPU#0: syz.0.17/5924
Modules linked in:
CPU: 0 UID: 0 PID: 5924 Comm: syz.0.17 Not tainted syzkaller #0 PREEMPT(full) 
Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.3-debian-1.16.3-2 04/01/2014
RIP: 0010:__might_sleep+0x97/0xc0 kernel/sched/core.c:9120
Code: 8b 94 24 70 18 00 00 48 85 d2 75 14 48 83 c4 08 89 ee 48 89 df 31 d2 5b 5d 41 5c e9 33 fc ff ff 48 8d 3d 0c 27 50 0f 48 89 d1 <67> 48 0f b9 3a eb db e8 9d 3a a5 00 eb 9f 89 74 24 04 e8 c2 3a a5
RSP: 0018:ffffc90003a27558 EFLAGS: 00010286
RAX: dffffc0000000000 RBX: ffffffff8e193c49 RCX: ffffffff81e258b8
RDX: ffffffff81e258b8 RSI: 0000000000000001 RDI: ffffffff9125db30
RBP: 0000000000000143 R08: 0000000000000001 R09: 000000000000015a
R10: 0000000000000200 R11: 0000000000000000 R12: ffff8880255fa540
R13: 0000000000000001 R14: ffffffff87b453a0 R15: dffffc0000000000
FS:  00007fcdef59c6c0(0000) GS:ffff8880d5dd8000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007fcdeddfed58 CR3: 000000002b0b3000 CR4: 0000000000352ef0
Call Trace:
 <TASK>
 might_alloc include/linux/sched/mm.h:323 [inline]
 slab_pre_alloc_hook mm/slub.c:4537 [inline]
 slab_alloc_node mm/slub.c:4897 [inline]
 __kmalloc_cache_noprof+0x3fd/0x6c0 mm/slub.c:5485
 _kmalloc_noprof include/linux/slab.h:988 [inline]
 _kzalloc_noprof include/linux/slab.h:1309 [inline]
 spcp8x5_get_msr+0xe9/0x2d0 drivers/usb/serial/spcp8x5.c:197
 spcp8x5_carrier_raised+0x75/0xe0 drivers/usb/serial/spcp8x5.c:243
 serial_port_carrier_raised+0x8f/0xd0 drivers/usb/serial/usb-serial.c:757
 tty_port_carrier_raised drivers/tty/tty_port.c:441 [inline]
 tty_port_block_til_ready+0x43f/0x910 drivers/tty/tty_port.c:559
 tty_port_open+0x19c/0x1f0 drivers/tty/tty_port.c:775
 tty_open+0x3dd/0xfa0 drivers/tty/tty_io.c:2137
 chrdev_open+0x234/0x6a0 fs/char_dev.c:411
 do_dentry_open+0x6ab/0x14d0 fs/open.c:947
 vfs_open+0x82/0x3f0 fs/open.c:1052
 do_open fs/namei.c:4700 [inline]
 path_openat+0x2873/0x4280 fs/namei.c:4863
 do_file_open+0x20e/0x430 fs/namei.c:4892
 do_sys_openat2+0x10f/0x1e0 fs/open.c:1368
 do_sys_open fs/open.c:1374 [inline]
 __do_sys_openat fs/open.c:1390 [inline]
 __se_sys_openat fs/open.c:1385 [inline]
 __x64_sys_openat+0x12d/0x210 fs/open.c:1385
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0x115/0x870 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7fcdee79e019
Code: ff c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 44 00 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 e8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007fcdef59c028 EFLAGS: 00000246 ORIG_RAX: 0000000000000101
RAX: ffffffffffffffda RBX: 00007fcdeea25fa0 RCX: 00007fcdee79e019
RDX: 0000000000000002 RSI: 0000200000000600 RDI: ffffffffffffff9c
RBP: 00007fcdee83500c R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000000
R13: 00007fcdeea26038 R14: 00007fcdeea25fa0 R15: 00007ffe970dc8b8
 </TASK>
----------------
Code disassembly (best guess):
   0:	8b 94 24 70 18 00 00 	mov    0x1870(%rsp),%edx
   7:	48 85 d2             	test   %rdx,%rdx
   a:	75 14                	jne    0x20
   c:	48 83 c4 08          	add    $0x8,%rsp
  10:	89 ee                	mov    %ebp,%esi
  12:	48 89 df             	mov    %rbx,%rdi
  15:	31 d2                	xor    %edx,%edx
  17:	5b                   	pop    %rbx
  18:	5d                   	pop    %rbp
  19:	41 5c                	pop    %r12
  1b:	e9 33 fc ff ff       	jmp    0xfffffc53
  20:	48 8d 3d 0c 27 50 0f 	lea    0xf50270c(%rip),%rdi        # 0xf502733
  27:	48 89 d1             	mov    %rdx,%rcx
* 2a:	67 48 0f b9 3a       	ud1    (%edx),%rdi <-- trapping instruction
  2f:	eb db                	jmp    0xc
  31:	e8 9d 3a a5 00       	call   0xa53ad3
  36:	eb 9f                	jmp    0xffffffd7
  38:	89 74 24 04          	mov    %esi,0x4(%rsp)
  3c:	e8                   	.byte 0xe8
  3d:	c2 3a a5             	ret    $0xa53a


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

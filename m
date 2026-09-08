Received: from mail-oo2-f11.google.com (mail-oo2-f11.google.com [74.125.231.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1752548F026
	for <linux-usb@vger.kernel.org>; Tue,  8 Sep 2026 22:08:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788905328; cv=none; b=SeBSDhc0Nzo7CVeM1rQ4UoECtEK8Wo6EfjR2LCDmaeGdhPS0JZcWCyb8pVareNPEAhaI1VC5Zm3DM/fpskUuAZVklc8zefwYhg2AsNEwGAxrQXJGk0rMEacwwz0tHDx6cMB9Ytt8NFoggAY4dJIVVDnHDqZoLtY4SW6LGKQ3aec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788905328; c=relaxed/simple;
	bh=OnKvCHQQWpy21sOx08SAt6H+1UlBFhVgYfLX4fnd6kw=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=JtAmOvhBHBk8TCoWAcKvh2OtOiuJPypNF+ys5YZxf69CICbfizb6GWzY3wwiUJMx/SCVljQ9utPgij0stD57SMWkeoidomX8VjFYadAkW+GVEENu0LvCpZG43NYBvtfaszMDJatwiwoAlf5sgvH84fBul8QozIWvujf8w6vpZXA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=74.125.231.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oo2-f11.google.com with SMTP id 46e09a7af769-7edccf768b0so1453462a34.0
        for <linux-usb@vger.kernel.org>; Tue, 08 Sep 2026 15:08:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788905326; x=1789510126;
        h=content-type:to:from:subject:message-id:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=A4MhYi0B0IRTLYdNfba+OaC5J49MdhkPU0xHMnjFvmA=;
        b=p3VEGzdsBAUGaP1J9Jm2MW9qrcWPGnXsuBR1DSDm+J16nrXSJwnEqIoVKAadP19+uw
         5IhFWpZvgLIeqLAavYaaI2Mn8Gfzyh7on98YthKdt5MzBbadCZg4XDLwOcrYvtGI0wFD
         nRBI/xtj2D+KfEY4RQJVwjjozgBLUnDdQXqO6rx6m8tFa3yUKmtghZcTAEoBjdVzcRo3
         Df/uL7gmT5UMNvp/MxdxKjQdBFlvjGIKzLJgrPtrLWWuNkSz1n+QSzpVaojl0OthiqHQ
         bCVedOwopGj6XJLHZ2tpFg+h9WagQPwX0mYbgzcvSNcNWwP3eSzg1nxGnDwDcHDvqMai
         Y8rg==
X-Forwarded-Encrypted: i=1; AKwUvBzkhJO4zPhQYkWiO4IiuI+F1CfM9yVqSCi6v4wYSj3Ns8fexHXs8uaYNoRJE31TuXyii1x7gK5iFnM=@vger.kernel.org
X-Gm-Message-State: AFuF++m3QG8do9BYdTc+hOMFCrcgVvMO0NhKX/lw8uGwcqxBBlakgpSL
	hZiKlZqo+AkKpAUQ+OMum0jdFdQbbusv2Rbfwvx65EQZZpbBbNW3q4VBGYG/vg9N6A+5H0vK7dQ
	ejUuJar0XNocpXzkFvAdDT3nbRgvkaAisaEiFTl7ogS9q390HjIQlNrxoS+8=
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:f036:b0:6b1:b68e:5109 with SMTP id
 006d021491bc7-6b6fe59cdf5mr17762393eaf.33.1788905325930; Tue, 08 Sep 2026
 15:08:45 -0700 (PDT)
Date: Tue, 08 Sep 2026 15:08:45 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6aa0876d.f81106d8.285f0a.0003.GAE@google.com>
Subject: [syzbot] [usb-storage?] BUG: unable to handle kernel NULL pointer
 dereference in usb_stor_invoke_transport (2)
From: syzbot <syzbot+356ae236154297f0d60d@syzkaller.appspotmail.com>
To: gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org, stern@rowland.harvard.edu, 
	syzkaller-bugs@googlegroups.com, usb-storage@lists.one-eyed-alien.net
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    28924df2a08f Merge tag 'perf-tools-fixes-for-v7.3-2026-09-..
git tree:       upstream
console+strace: https://syzkaller.appspot.com/x/log.txt?x=16145749580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=5e4e3a0e188a497e
dashboard link: https://syzkaller.appspot.com/bug?extid=356ae236154297f0d60d
compiler:       Debian clang version 22.1.8 (++20260613092233+e80beda6e255-1~exp1~20260613092250.77), Debian LLD 22.1.8
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=14bf2a15580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=15023b9e580000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/dbb658780e3f/disk-28924df2.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/ed954d86e83d/vmlinux-28924df2.xz
kernel image: https://storage.googleapis.com/syzbot-assets/56cc5fdb5ce4/bzImage-28924df2.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+356ae236154297f0d60d@syzkaller.appspotmail.com

BUG: kernel NULL pointer dereference, address: 0000000000000000
#PF: supervisor instruction fetch in kernel mode
#PF: error_code(0x0010) - not-present page
PGD 80000000733dc067 P4D 80000000733dc067 PUD 7324b067 PMD 0 
Oops: Oops: 0010 [#1] SMP KASAN PTI
CPU: 0 UID: 0 PID: 5644 Comm: usb-storage Not tainted syzkaller #0 PREEMPT(full) 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 07/24/2026
RIP: 0010:0x0
Code: Unable to access opcode bytes at 0xffffffffffffffd6.
RSP: 0018:ffffc90003997af8 EFLAGS: 00010246
RAX: 1ffff1100f2c69f0 RBX: ffff888073cbd110 RCX: ffffffff9a9de501
RDX: 0000000000000001 RSI: ffffffff8e474d50 RDI: ffff888079634e90
RBP: ffffc90003997cd0 R08: ffffffff907a1e7f R09: 1ffffffff20f43cf
R10: dffffc0000000000 R11: 0000000000000000 R12: 1ffff1100f2c680e
R13: 1ffff92000732f74 R14: ffff888079634e90 R15: dffffc0000000000
FS:  0000000000000000(0000) GS:ffff888124cd6000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: ffffffffffffffd6 CR3: 00000000729a6000 CR4: 00000000003526f0
Call Trace:
 <TASK>
 usb_stor_invoke_transport+0x55a/0x1a40 drivers/usb/storage/transport.c:926
 usb_stor_control_thread+0x44c/0x8f0 drivers/usb/storage/usb.c:462
 kthread+0x38b/0x480 kernel/kthread.c:436
 ret_from_fork+0x514/0xb70 arch/x86/kernel/process.c:158
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245
 </TASK>
Modules linked in:
CR2: 0000000000000000
---[ end trace 0000000000000000 ]---
RIP: 0010:0x0
Code: Unable to access opcode bytes at 0xffffffffffffffd6.
RSP: 0018:ffffc90003997af8 EFLAGS: 00010246
RAX: 1ffff1100f2c69f0 RBX: ffff888073cbd110 RCX: ffffffff9a9de501
RDX: 0000000000000001 RSI: ffffffff8e474d50 RDI: ffff888079634e90
RBP: ffffc90003997cd0 R08: ffffffff907a1e7f R09: 1ffffffff20f43cf
R10: dffffc0000000000 R11: 0000000000000000 R12: 1ffff1100f2c680e
R13: 1ffff92000732f74 R14: ffff888079634e90 R15: dffffc0000000000
FS:  0000000000000000(0000) GS:ffff888124cd6000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: ffffffffffffffd6 CR3: 00000000729a6000 CR4: 00000000003526f0


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

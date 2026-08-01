Received: from mail-oi1-f207.google.com (mail-oi1-f207.google.com [209.85.167.207])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2603B29408
	for <linux-usb@vger.kernel.org>; Sat,  1 Aug 2026 00:02:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.207
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785542556; cv=none; b=hvBR5+9YjP2piA65VOZtoMYCJcRLIkCA3TQYU9EGqpiXIS598zxpIptmz4N2UM5stM2WXR2rF7/aNQyAdSh9YHL54Ozw6txJ+edZrPtEWHbKaMJPrbjVR01AgGDIWoCu1IhYFVOPOr8LmD57EKbdJ3PR0h6C989dCfpGmrKs5u8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785542556; c=relaxed/simple;
	bh=fe5XFd+qHdqkzY5AFZhGlR1q6jg9NcD1xgKWHVULIgk=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=Pu72QOMKUcHqhrn3rFE1nwNeAuQ8c7aB5yqG/4RY6wmntKZ/6twuuITR+V38cQ8mOoWFTZ5OyE0UtxM60VwNM/Zow3FwFKIfhhja+QswQKXfbqdKtxD45nZLVKqj5L8TkuqtynTzOoSPx8fL1Rp5Ws8r+WNso79QrEIMg37u40Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.207
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f207.google.com with SMTP id 5614622812f47-48576b535b6so876710b6e.2
        for <linux-usb@vger.kernel.org>; Fri, 31 Jul 2026 17:02:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785542554; x=1786147354;
        h=content-type:to:from:subject:message-id:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=22xEdYp0IhTJfIohErHug+XY4reeZ15KdR/1ejkAlW4=;
        b=OvXkJArWWy0r+7RWPuSrlzd8sabgFq2FEAbq2Z+FvNuP7BlqYh8kkN5WJUbyFWCHpa
         VzvGPsXBFrTr0nccyqokliqH3Aa5V8exWadCDVdJi4KGHm92Ll6D6XT7DL/1muPwz5P6
         1n9V3mXWYBpTr9sQ85xvXw0k27QghDJ+Wh0QqqhOCEnJQfzxp4cCVA3Wm7U9hRRS0N8s
         d8EUzQfIQFC31OWI/GfCQ+nLFDUsYckiGGYosLTOthG2NMMa6B1Y8acIzh0l7XMzfy+l
         byFNDJSo6OjXT8lPUuIXSlCla4Ap7LzykPubCy+qDDjOqoRjqZLF4u0/Ua6HRXlE3jBD
         p1MA==
X-Forwarded-Encrypted: i=1; AHgh+RoStOSZf3nxOwxdb5/37zOlwXyMfRQpzl04uw+aqBIKsU+CZ6yPdM3DHTy9jf+3Tbfxin1g6D0KZOQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YwPSj2EK76PwbeAtmzTDwzyRwG2xjxV20aN/JnPSc5TJGzg6fY7
	DTCBCwlGFXN2+E3xP+wnPV7+VQMG6I2aJwSvhn5Q/TpqGyfPSEghDz92/JS9CsFn3ps2Uv+jEI2
	VVlQ/+b5clTAwoisEr+FbXCS/RcvzmszSSDg9pun9eF2Bqg7yAf5OhXM1ZVE=
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:1910:b0:479:f7e7:4a81 with SMTP id
 5614622812f47-4af5dce2990mr4228902b6e.0.1785542553914; Fri, 31 Jul 2026
 17:02:33 -0700 (PDT)
Date: Fri, 31 Jul 2026 17:02:33 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6a6d3799.2d659fcc.1d46f5.01a7.GAE@google.com>
Subject: [syzbot] [usb?] WARNING in f_midi_free
From: syzbot <syzbot+d5fa3d224505c8610702@syzkaller.appspotmail.com>
To: gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    11028ab62899 Merge tag 'probes-fixes-v7.2-rc5' of git://gi..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=17a425b9580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=cb17729fb04b1e3a
dashboard link: https://syzkaller.appspot.com/bug?extid=d5fa3d224505c8610702
compiler:       Debian clang version 22.1.8 (++20260613092233+e80beda6e255-1~exp1~20260613092250.77), Debian LLD 22.1.8

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/bc967be819a3/disk-11028ab6.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/6e9f003c9cc8/vmlinux-11028ab6.xz
kernel image: https://storage.googleapis.com/syzbot-assets/5c292926486f/bzImage-11028ab6.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+d5fa3d224505c8610702@syzkaller.appspotmail.com

------------[ cut here ]------------
!work->func
WARNING: kernel/workqueue.c:4335 at __flush_work+0xc68/0xd70 kernel/workqueue.c:4335, CPU#0: syz.0.7/5816
Modules linked in:
CPU: 0 UID: 0 PID: 5816 Comm: syz.0.7 Not tainted syzkaller #0 PREEMPT_{RT,(full)} 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 07/24/2026
RIP: 0010:__flush_work+0xc68/0xd70 kernel/workqueue.c:4335
Code: 6b 8b e8 0b 7c 13 00 48 c7 c7 00 30 1c 8e 48 89 de e9 49 ff ff ff e8 c7 a5 37 00 90 0f 0b 90 e9 45 ff ff ff e8 b9 a5 37 00 90 <0f> 0b 90 31 c0 49 bd f8 f8 f8 f8 f8 f8 f8 f8 e9 2d ff ff ff e8 9f
RSP: 0018:ffffc9000595fa20 EFLAGS: 00010283
RAX: ffffffff818e3537 RBX: ffff888034a369b0 RCX: 0000000000080000
RDX: ffffc90013a3c000 RSI: 0000000000000a3c RDI: 0000000000000a3d
RBP: ffffc9000595fbd0 R08: 0000000000000000 R09: 0000000000000000
R10: dffffc0000000000 R11: fffffbfff1f5f307 R12: dffffc0000000000
R13: 1ffff11006946d36 R14: 1ffff92000b2bf4c R15: ffff888034a36998
FS:  00007f759d9f16c0(0000) GS:ffff888125c41000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007f6dfa95b680 CR3: 000000003ccda000 CR4: 00000000003526f0
Call Trace:
 <TASK>
 __cancel_work_sync+0xbe/0x110 kernel/workqueue.c:4494
 f_midi_free+0xac/0x1f0 drivers/usb/gadget/function/f_midi.c:1312
 config_usb_cfg_unlink+0x236/0x260 drivers/usb/gadget/configfs.c:508
 configfs_symlink+0xde9/0x1030 fs/configfs/symlink.c:202
 vfs_symlink+0x18b/0x330 fs/namei.c:5660
 filename_symlinkat+0x1cd/0x420 fs/namei.c:5685
 __do_sys_symlinkat fs/namei.c:5705 [inline]
 __se_sys_symlinkat+0x4e/0x2b0 fs/namei.c:5700
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0x174/0x580 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f759fbfdf99
Code: ff c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 44 00 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 e8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007f759d9f1028 EFLAGS: 00000246 ORIG_RAX: 000000000000010a
RAX: ffffffffffffffda RBX: 00007f759fe86270 RCX: 00007f759fbfdf99
RDX: 0000200000000240 RSI: ffffffffffffff9c RDI: 0000200000000100
RBP: 00007f759fc94ec4 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000000
R13: 00007f759fe86308 R14: 00007f759fe86270 R15: 00007ffd5bc1f068
 </TASK>


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

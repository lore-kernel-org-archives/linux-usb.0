Received: from mail-oi1-f205.google.com (mail-oi1-f205.google.com [209.85.167.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60A6F64AA4
	for <linux-usb@vger.kernel.org>; Sat, 15 Aug 2026 03:17:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786763860; cv=none; b=PaX/ay586cIa7fGDIXnmVnwVO152CVE938xvimr92xXTB7EiafWgkglcTM2T0MMQfStTk7WbisO1uEIgXh0rzEkPTMCt44t8YaJzb8IFTm1QQqzhG4pOKOUGBSVaiWKKulKkbWmF01SQshCLqmqv0d5LguG2TUqF0zr3OlEC+14=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786763860; c=relaxed/simple;
	bh=Vr3265QkvDmHa19G/OZcGJOKv+IyjiXDQPmTXu6wNbY=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=YfDpjnjM29A+cSqn29O2PYrQyEA6mFG5rn9ZRkyf27MTGMXFNCNbIjWM9pDIHER9GvZ3XErWSFmJ4y6HJyIcXJ7u+rCKse737E7drb3tlJkhRuoNVk57sMzgA/H2qhgHzJP4k/E3WjZirPFQtAj1aa1rW3f1uy+ptpHI9tYwF0w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f205.google.com with SMTP id 5614622812f47-4b1a69b1188so1992570b6e.1
        for <linux-usb@vger.kernel.org>; Fri, 14 Aug 2026 20:17:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786763858; x=1787368658;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=pWwdcs/fmExSbOc6n7QsYUwmk2EXu5SiNFV8elih4VU=;
        b=Ja7JJJU2t1KAWbbfMXM5oxdqNTcRIvswqc5SnhezOmg9Io39CYXv9xRbsc0yG4VV2D
         wFy6Hq6RD+nJJTBwNBfO8MSrGWl+q8ezy/IAqP7MuVdPZntdCSLzfokPMGTNFl9ntpzu
         ZFMDSCqXmgBG8f4TZwf/XpRSY9Roc/d1PbeSK2KUCVgXaKEpCiMZZ+yNrx0z1TyVwd94
         bUfMfdwpNOhCu8jLcHTj59unp9h1aso/KuzCKBo7Yk+yBGviV/N1hQN5cb5WgyxdqlFB
         rIWeGT/abn3kXIfADkSnuz+lFgZ9iPIWwKkExkW5fVjxKr/8mu+2gLjwl6mafHSkBL0U
         knKw==
X-Forwarded-Encrypted: i=1; AHgh+RpGxGIxt+8HpBKJYsLgjxVwGcsbzwH9eIJQ7ESdZGyTc7pmp19Lh2ua1eYoj3TvnWTc2t+3FPvyOVA=@vger.kernel.org
X-Gm-Message-State: AOJu0YyI8SeoVvddPYHHPt6VgKFONzjiO3aJ6/IOtfAJ0Q0JWk1jXHd1
	31TwDYIxzK+RA4Y1YcPY+0fTU7+La6h8sVy3EEYNczyHXAzh56gVtRaNiP34by2Q7ajJPyD5Amx
	8Qfj3ZMoXAdYWKN28+LanWIyUpum8t0AGmHo7My9ko44B/FpHxY3ec0UwTNY=
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:4b07:b0:6b0:abaa:bd3 with SMTP id
 006d021491bc7-6b0d614726cmr9007988eaf.9.1786763858235; Fri, 14 Aug 2026
 20:17:38 -0700 (PDT)
Date: Fri, 14 Aug 2026 20:17:38 -0700
In-Reply-To: <6a6a966c.86abc875.e5c3d.0053.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6a7fda52.dbb3a75c.20434b.0010.GAE@google.com>
Subject: Re: [syzbot] [usb?] kernel BUG in register_netdevice
From: syzbot <syzbot+85ede281798faf736677@syzkaller.appspotmail.com>
To: gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

syzbot has found a reproducer for the following issue on:

HEAD commit:    a5161661ae99 Merge tag 'sound-7.2' of git://git.kernel.org..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=1628e279580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=65bd434865e8f85c
dashboard link: https://syzkaller.appspot.com/bug?extid=85ede281798faf736677
compiler:       gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44
userspace arch: i386
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=10df2949580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=129886c6580000

Downloadable assets:
disk image (non-bootable): https://storage.googleapis.com/syzbot-assets/d900f083ada3/non_bootable_disk-a5161661.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/f6b1c02aa089/vmlinux-a5161661.xz
kernel image: https://storage.googleapis.com/syzbot-assets/4f64faaa14c5/bzImage-a5161661.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+85ede281798faf736677@syzkaller.appspotmail.com

------------[ cut here ]------------
kernel BUG at net/core/dev.c:11344!
Oops: invalid opcode: 0000 [#1] SMP KASAN NOPTI
CPU: 2 UID: 0 PID: 5914 Comm: syz.0.18 Not tainted syzkaller #0 PREEMPT(full) 
Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.3-debian-1.16.3-2 04/01/2014
RIP: 0010:register_netdevice+0x1233/0x25a0 net/core/dev.c:11344
Code: 0f 0b e8 70 4c 7d f8 48 8d 3d d9 89 a4 07 ba 4b 2c 00 00 48 c7 c6 00 0d 16 8d 67 48 0f b9 3a e9 a5 ee ff ff e8 4e 4c 7d f8 90 <0f> 0b e8 46 4c 7d f8 90 0f 0b 48 8b 5c 24 18 48 8b 6c 24 20 e8 34
RSP: 0018:ffffc900047cf770 EFLAGS: 00010293
RAX: 0000000000000000 RBX: 1ffff920008f9ef7 RCX: ffffffff898c728a
RDX: ffff888029578000 RSI: ffffffff898c8392 RDI: ffff888029578000
RBP: ffff88804d3c0000 R08: 0000000000000001 R09: 0000000000000000
R10: 0000000000000003 R11: 0000000000000000 R12: 0000000000000003
R13: ffff88804d3c0f10 R14: ffff88804d3c1049 R15: 0000000000000000
FS:  0000000000000000(0000) GS:ffff888096de7000(0063) knlGS:0000000057fb4480
CS:  0010 DS: 002b ES: 002b CR0: 0000000080050033
CR2: 00007fc6ffb06fb3 CR3: 0000000026f01000 CR4: 0000000000352ef0
Call Trace:
 <TASK>
 register_netdev+0x34/0x50 net/core/dev.c:11567
 gether_register_netdev+0x93/0x130 drivers/usb/gadget/function/u_ether.c:873
 ncm_bind+0x2cf/0xee0 drivers/usb/gadget/function/f_ncm.c:1470
 usb_add_function+0x219/0x890 drivers/usb/gadget/composite.c:333
 configfs_composite_bind+0xd83/0x1960 drivers/usb/gadget/configfs.c:1802
 gadget_bind_driver+0x28c/0xbf0 drivers/usb/gadget/udc/core.c:1662
 call_driver_probe drivers/base/dd.c:628 [inline]
 really_probe+0x241/0xa60 drivers/base/dd.c:706
 __driver_probe_device+0x20e/0x450 drivers/base/dd.c:868
 driver_probe_device+0x4a/0x140 drivers/base/dd.c:898
 __driver_attach+0x21f/0x5b0 drivers/base/dd.c:1292
 bus_for_each_dev+0x13e/0x1d0 drivers/base/bus.c:383
 bus_add_driver+0x305/0x5b0 drivers/base/bus.c:763
 driver_register+0x1e2/0x360 drivers/base/driver.c:174
 usb_gadget_register_driver_owner+0x132/0x210 drivers/usb/gadget/udc/core.c:1752
 gadget_dev_desc_UDC_store+0x1b0/0x2e0 drivers/usb/gadget/configfs.c:300
 flush_write_buffer fs/configfs/file.c:207 [inline]
 configfs_write_iter+0x302/0x4e0 fs/configfs/file.c:229
 new_sync_write fs/read_write.c:595 [inline]
 vfs_write+0x6ac/0x1050 fs/read_write.c:687
 ksys_write+0x12a/0x250 fs/read_write.c:739
 do_syscall_32_irqs_on arch/x86/entry/syscall_32.c:83 [inline]
 __do_fast_syscall_32+0xe7/0x970 arch/x86/entry/syscall_32.c:307
 do_fast_syscall_32+0x32/0x70 arch/x86/entry/syscall_32.c:332
 entry_SYSENTER_compat_after_hwframe+0x84/0x8e
RIP: 0023:0xf705efec
Code: Unable to access opcode bytes at 0xf705efc2.
RSP: 002b:00000000fffb142c EFLAGS: 00000296 ORIG_RAX: 0000000000000004
RAX: ffffffffffffffda RBX: 0000000000000003 RCX: 0000000080001400
RDX: 000000000000000b RSI: 0000000000000000 RDI: 0000000000000000
RBP: 0000000000000000 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000000
R13: 0000000000000000 R14: 0000000000000000 R15: 0000000000000000
 </TASK>
Modules linked in:
---[ end trace 0000000000000000 ]---
RIP: 0010:register_netdevice+0x1233/0x25a0 net/core/dev.c:11344
Code: 0f 0b e8 70 4c 7d f8 48 8d 3d d9 89 a4 07 ba 4b 2c 00 00 48 c7 c6 00 0d 16 8d 67 48 0f b9 3a e9 a5 ee ff ff e8 4e 4c 7d f8 90 <0f> 0b e8 46 4c 7d f8 90 0f 0b 48 8b 5c 24 18 48 8b 6c 24 20 e8 34
RSP: 0018:ffffc900047cf770 EFLAGS: 00010293
RAX: 0000000000000000 RBX: 1ffff920008f9ef7 RCX: ffffffff898c728a
RDX: ffff888029578000 RSI: ffffffff898c8392 RDI: ffff888029578000
RBP: ffff88804d3c0000 R08: 0000000000000001 R09: 0000000000000000
R10: 0000000000000003 R11: 0000000000000000 R12: 0000000000000003
R13: ffff88804d3c0f10 R14: ffff88804d3c1049 R15: 0000000000000000
FS:  0000000000000000(0000) GS:ffff888096ee7000(0063) knlGS:0000000057fb4480
CS:  0010 DS: 002b ES: 002b CR0: 0000000080050033
CR2: 00007ffdb20bb010 CR3: 0000000026f01000 CR4: 0000000000352ef0


---
If you want syzbot to run the reproducer, reply with:
#syz test: git://repo/address.git branch-or-commit-hash
If you attach or paste a git patch, syzbot will apply it before testing.

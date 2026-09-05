Received: from mail-oo1-f69.google.com (mail-oo1-f69.google.com [209.85.161.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E8BF43BDB8
	for <linux-usb@vger.kernel.org>; Sat,  5 Sep 2026 08:12:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.69
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788595957; cv=none; b=uUqcBP/HsR+wKLFEh+JDeuhqsfHgbIWXvoPH2KlLHM1GUSK1qzo2WwewHEgD/mikOOwqYkFxkq7GhQaBGsma1D4hVNVxVaGQLCbaP5mZn8CI0gc/Uigc4dASXMuvT5+ZqTugorLzl4ocewncWmSia7g2LDR1KDLF1uG4cmDekq8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788595957; c=relaxed/simple;
	bh=kOh3RlvR58SOn81IH2188W5WlGHYYOhgaynC0pejL18=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=TMmQXI1CDkbG4WgBYK0YLJiWpVKtVM5VnobqkKYjHipFW6vMjNB0w1V+/Iels3xsr+BG8SiS8bOW9xgcennUcC/ZxI+tBVcsJctsgdZHL2wy+9as6BnP5ld1T3ZMiLBQu/ym4ztOGqafLdg7bu7xVYZfXkXH0SzKv/XsslFAmBg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.161.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oo1-f69.google.com with SMTP id 006d021491bc7-6b1b7932ec2so1803387eaf.3
        for <linux-usb@vger.kernel.org>; Sat, 05 Sep 2026 01:12:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788595947; x=1789200747;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=EtskN3sVu7XSCfQvHoOLI2T9O4RcOenc4U/g01pACQI=;
        b=MuoeXphCDYW4drci12LJJzAOnFnPyLJgNigx0XMMLrcIAR9seTeOxNhqtt6XkbbbXg
         nByiEdSzDJRWbB6MTpFZK4YWVZ9fbJyO+laPem0YNHToj4xtSiXeKLQsbOVGAYTcWPIl
         KMv0OdipkhSirSVqwXFhULukROfZG08rfA2A67x/YEXfXUqUIs3hm+RYR/WQ0CgU7D8a
         cMH60oOGiWmTyITWuv0Cc7zJIk9oK2ajB2O31QrZOYJQEIY9Qk9jx38KfjZfsPjhShFi
         RXlNlRALNAZOl2d8jPOaCiGMBsEf7TD6JFNJludfYdCHoWY6d9ZWWGnCVAs8Qh7SghSA
         u4jA==
X-Forwarded-Encrypted: i=1; AKwUvBxWaUXKdGVkDGw0H2Soc0Hl63ZD8NjMzibcE9s0D2Ka0Czv39lz121xxq5uHs32nuwgQ0Pnv9j6l9o=@vger.kernel.org
X-Gm-Message-State: AFuF++nebRoLRo25RFAO0PPmiIGQgpNzaUozQWzo1rarrriKwvecu6No
	DJmriDH4hBMoi7pNyih489DQLRbVd4gbGq3UkKhvQcAO5zJcwhRQYvnjSjQ+xr3eIZ2jUvNpbIl
	+EMGDCBZtyfe85lBiHmnY7D2Mxo9zp80JkwQH17Phtz9vvt1rTk/2NKvw5l4=
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:810a:b0:6b1:bdd9:453 with SMTP id
 006d021491bc7-6b6faee1fa2mr8281763eaf.12.1788595947205; Sat, 05 Sep 2026
 01:12:27 -0700 (PDT)
Date: Sat, 05 Sep 2026 01:12:27 -0700
In-Reply-To: <6a88066b.ae6ddae5.3da009.002d.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6a9bceeb.a5e650b3.26d8a.0008.GAE@google.com>
Subject: Re: [syzbot] [usb?] general protection fault in vhci_hcd_probe
From: syzbot <syzbot+7300affe388249d66dfe@syzkaller.appspotmail.com>
To: gregkh@linuxfoundation.org, i@zenithal.me, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org, shuah@kernel.org, syzkaller-bugs@googlegroups.com, 
	valentina.manea.m@gmail.com
Content-Type: text/plain; charset="UTF-8"

syzbot has found a reproducer for the following issue on:

HEAD commit:    9d80aa4617b3 Add linux-next specific files for 20260903
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
console output: https://syzkaller.appspot.com/x/log.txt?x=10adf4f9580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=bb4a32c282cc2ec7
dashboard link: https://syzkaller.appspot.com/bug?extid=7300affe388249d66dfe
compiler:       Debian clang version 22.1.8 (++20260613092233+e80beda6e255-1~exp1~20260613092250.77), Debian LLD 22.1.8
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=121c7215580000

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+7300affe388249d66dfe@syzkaller.appspotmail.com

Oops: general protection fault, probably for non-canonical address 0xdffffc0000000000: 0000 [#1] SMP KASAN PTI
KASAN: null-ptr-deref in range [0x0000000000000000-0x0000000000000007]
CPU: 1 UID: 0 PID: 6482 Comm: syz.0.17 Not tainted syzkaller #0 PREEMPT(full) 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 07/24/2026
RIP: 0010:vhci_hcd_probe+0x47/0x3e0 drivers/usb/usbip/vhci_hcd.c:1367
Code: 0f ee e4 f9 49 8d 9e 80 00 00 00 48 89 d8 48 c1 e8 03 80 3c 28 00 74 08 48 89 df e8 13 17 55 fa 48 8b 1b 48 89 d8 48 c1 e8 03 <80> 3c 28 00 74 08 48 89 df e8 fb 16 55 fa 4c 8b 23 48 c7 c0 80 6c
RSP: 0018:ffffc900033c7ac0 EFLAGS: 00010246
RAX: 0000000000000000 RBX: 0000000000000000 RCX: ffff888076a89f40
RDX: 0000000000000000 RSI: 0000000000000000 RDI: ffff88801c7a6000
RBP: dffffc0000000000 R08: ffff88802af3ba53 R09: 1ffff110055e774a
R10: dffffc0000000000 R11: ffffffff87e2e6c0 R12: ffff88801c7a6000
R13: ffffffff8fc7ad20 R14: ffff88801c7a6000 R15: ffffffff87e2e6c0
FS:  00007f21f99fe6c0(0000) GS:ffff888124dc0000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007f21fa270000 CR3: 000000007f704000 CR4: 00000000003526f0
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
RIP: 0033:0x7f21fa39e0d9
Code: ff c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 44 00 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 e8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007f21f99fe028 EFLAGS: 00000246 ORIG_RAX: 0000000000000001
RAX: ffffffffffffffda RBX: 00007f21fa625fa0 RCX: 00007f21fa39e0d9
RDX: 0000000000000006 RSI: 00002000000000c0 RDI: 0000000000000004
RBP: 00007f21fa435024 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000000
R13: 00007f21fa626038 R14: 00007f21fa625fa0 R15: 00007fff742f7888
 </TASK>
Modules linked in:
---[ end trace 0000000000000000 ]---
RIP: 0010:vhci_hcd_probe+0x47/0x3e0 drivers/usb/usbip/vhci_hcd.c:1367
Code: 0f ee e4 f9 49 8d 9e 80 00 00 00 48 89 d8 48 c1 e8 03 80 3c 28 00 74 08 48 89 df e8 13 17 55 fa 48 8b 1b 48 89 d8 48 c1 e8 03 <80> 3c 28 00 74 08 48 89 df e8 fb 16 55 fa 4c 8b 23 48 c7 c0 80 6c
RSP: 0018:ffffc900033c7ac0 EFLAGS: 00010246
RAX: 0000000000000000 RBX: 0000000000000000 RCX: ffff888076a89f40
RDX: 0000000000000000 RSI: 0000000000000000 RDI: ffff88801c7a6000
RBP: dffffc0000000000 R08: ffff88802af3ba53 R09: 1ffff110055e774a
R10: dffffc0000000000 R11: ffffffff87e2e6c0 R12: ffff88801c7a6000
R13: ffffffff8fc7ad20 R14: ffff88801c7a6000 R15: ffffffff87e2e6c0
FS:  00007f21f99fe6c0(0000) GS:ffff888124cc0000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 0000001b34124008 CR3: 000000007f704000 CR4: 00000000003526f0
----------------
Code disassembly (best guess):
   0:	0f ee e4             	pmaxsw %mm4,%mm4
   3:	f9                   	stc
   4:	49 8d 9e 80 00 00 00 	lea    0x80(%r14),%rbx
   b:	48 89 d8             	mov    %rbx,%rax
   e:	48 c1 e8 03          	shr    $0x3,%rax
  12:	80 3c 28 00          	cmpb   $0x0,(%rax,%rbp,1)
  16:	74 08                	je     0x20
  18:	48 89 df             	mov    %rbx,%rdi
  1b:	e8 13 17 55 fa       	call   0xfa551733
  20:	48 8b 1b             	mov    (%rbx),%rbx
  23:	48 89 d8             	mov    %rbx,%rax
  26:	48 c1 e8 03          	shr    $0x3,%rax
* 2a:	80 3c 28 00          	cmpb   $0x0,(%rax,%rbp,1) <-- trapping instruction
  2e:	74 08                	je     0x38
  30:	48 89 df             	mov    %rbx,%rdi
  33:	e8 fb 16 55 fa       	call   0xfa551733
  38:	4c 8b 23             	mov    (%rbx),%r12
  3b:	48                   	rex.W
  3c:	c7                   	.byte 0xc7
  3d:	c0                   	.byte 0xc0
  3e:	80                   	.byte 0x80
  3f:	6c                   	insb   (%dx),%es:(%rdi)


---
If you want syzbot to run the reproducer, reply with:
#syz test: git://repo/address.git branch-or-commit-hash
If you attach or paste a git patch, syzbot will apply it before testing.

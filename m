Received: from mail-oi1-f208.google.com (mail-oi1-f208.google.com [209.85.167.208])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 619D3386C12
	for <linux-usb@vger.kernel.org>; Sat,  1 Aug 2026 00:45:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.208
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785545136; cv=none; b=DjvWvKD9d6YmsX5imL4KCHcQxmWtyevPfUXC6bdquowgtj+V7+XE7/0ZCICk2U/b9tjcecHNlGvJb7vXzUQV9IgSIyPzu02S5fdoJUycxVY1bU4pNdHzbcoKssCPKlSEyi+LCQ+ZgfOxd3faaXMo5yEfFFSW0MSRnOG0SOWkVaA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785545136; c=relaxed/simple;
	bh=lphQu3W7JxjmKK9hXjI1pugw+ze0PaQgIYJ+aRkWa8g=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=QSL+0B+zICehzAfeSGZqZj5GVtrYF9cV+U0+ZMu6oakriWRh6bcNw3b10o0sD+G1KBxi8xi7xy60pO614VzisGyhhTtAxKczkv0u2drzEsVWaTLczlDiKs2LX8MXTq0cEXRHi85+KNOtzjiuQVAVKifDkDMwWwtmSdxpHhMQu2Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.208
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f208.google.com with SMTP id 5614622812f47-4a5a66f375dso925386b6e.1
        for <linux-usb@vger.kernel.org>; Fri, 31 Jul 2026 17:45:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785545122; x=1786149922;
        h=content-type:to:from:subject:message-id:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rSbZjwhqdvxYkfcjQwoUaOoeT1LNaY4mVoWYFztccXA=;
        b=d5F7nwpDYI4mMcNG3EfMcFr/fpolRC7YlVyHo1u4jDnOJijMutAMbXZZmDAUAKgurq
         jwq/XyRHWFHx4ZzXxSdMPBUc9XbL4qUbGTEBE8kQmJa0sJQNoJ5IULnFq4XGEWWufEPq
         WCfeSYFY1L0FAWjngL76/zSjxr8X6NfCpaiY+UXIfczw1UdCxCPz4eNXWUSFkkgH+XCZ
         b5+aUvllttsR+SV/wURqkeSHJBGZkANx7brr9sPs5M/VxueMOfpEsGoN82POZ1ERjRT4
         iqMzG1JEzFCa8Ui6pYGOYun30vGYbrzkMKo986eiqLpgvZxqg6LXVJiG41InmcWIEEqN
         aPUQ==
X-Forwarded-Encrypted: i=1; AHgh+RprAEvSDB6OmuJIkhupomAyC7BWWMBodVjl4Zj+d7NolIINDnUSDEM7RsgC2BDn6l8wEalyVrH27I0=@vger.kernel.org
X-Gm-Message-State: AOJu0YxXbycjZ2se5WcyU284kYhgHHI9jmMfCCwwgcDHLxLcle0TTVXD
	+xVISm3foAFLmsmLbFYvFg3HEfKcXmAZS/XrbXenHMjEE9xMwheOWAc08OgE5HDaoGfYJeDxZ+v
	Ye3vEM29q2G3R5L+NR5gCS5wxTpx5d0odJs2i7u8/2v+eYdiQ/TgGlHIabUM=
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:319b:b0:495:d7ec:b6b5 with SMTP id
 5614622812f47-4af5e1d3954mr3572758b6e.10.1785545122542; Fri, 31 Jul 2026
 17:45:22 -0700 (PDT)
Date: Fri, 31 Jul 2026 17:45:22 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6a6d41a2.f794c993.27aeb.000c.GAE@google.com>
Subject: [syzbot] [usb?] general protection fault in mon_notify
From: syzbot <syzbot+5f4b29d9fe710a964482@syzkaller.appspotmail.com>
To: gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    62cc90241548 Merge tag 'mm-hotfixes-stable-2026-07-27-14-1..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=156affde580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=145fa60d73086782
dashboard link: https://syzkaller.appspot.com/bug?extid=5f4b29d9fe710a964482
compiler:       gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=131be449580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=1467e499580000

Downloadable assets:
disk image (non-bootable): https://storage.googleapis.com/syzbot-assets/d900f083ada3/non_bootable_disk-62cc9024.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/b10a9ae7e3d1/vmlinux-62cc9024.xz
kernel image: https://storage.googleapis.com/syzbot-assets/b89124d39495/bzImage-62cc9024.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+5f4b29d9fe710a964482@syzkaller.appspotmail.com

dummy_hcd dummy_hcd.0: remove, state 4
usb usb5: USB disconnect, device number 1
dummy_hcd dummy_hcd.0: stopped
dummy_hcd dummy_hcd.0: USB bus 5 deregistered
Oops: general protection fault, probably for non-canonical address 0xdffffc0000000001: 0000 [#1] SMP KASAN NOPTI
KASAN: null-ptr-deref in range [0x0000000000000008-0x000000000000000f]
CPU: 0 UID: 0 PID: 5954 Comm: syz.0.42 Not tainted syzkaller #0 PREEMPT(full) 
Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.3-debian-1.16.3-2 04/01/2014
RIP: 0010:__list_del_entry_valid_or_report+0x20/0x1d0 lib/list_debug.c:49
Code: 90 90 90 90 90 90 90 90 90 90 f3 0f 1e fa 48 b8 00 00 00 00 00 fc ff df 41 54 55 53 48 89 fb 48 83 c7 08 48 89 fa 48 c1 ea 03 <80> 3c 02 00 0f 85 5b 01 00 00 48 89 da 48 8b 6b 08 48 b8 00 00 00
RSP: 0018:ffffc9000374fa20 EFLAGS: 00010202
RAX: dffffc0000000000 RBX: 0000000000000000 RCX: fffff520006e9f22
RDX: 0000000000000001 RSI: ffffffff8c401500 RDI: 0000000000000008
RBP: ffff88802ff87000 R08: 0000000000000000 R09: fffffbfff2244efa
R10: ffffc9000374fa40 R11: 0000000000000000 R12: 00000000fffffffe
R13: ffff88802ff870e8 R14: 0000000000000008 R15: 0000000000000000
FS:  000055556cf07500(0000) GS:ffff8880d5ddc000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007fc48295da08 CR3: 000000003cd5d000 CR4: 0000000000352ef0
Call Trace:
 <TASK>
 __list_del_entry_valid include/linux/list.h:132 [inline]
 __list_del_entry include/linux/list.h:246 [inline]
 list_del include/linux/list.h:260 [inline]
 mon_bus_remove drivers/usb/mon/mon_main.c:203 [inline]
 mon_notify+0x84/0x480 drivers/usb/mon/mon_main.c:222
 notifier_call_chain+0x99/0x3f0 kernel/notifier.c:85
 blocking_notifier_call_chain kernel/notifier.c:380 [inline]
 blocking_notifier_call_chain+0x69/0xa0 kernel/notifier.c:368
 usb_remove_hcd.cold+0x25f/0x401 drivers/usb/core/hcd.c:3084
 dummy_hcd_remove+0x109/0x1e0 drivers/usb/gadget/udc/dummy_hcd.c:2761
 platform_remove+0x5f/0x80 drivers/base/platform.c:1456
 device_remove+0xcb/0x180 drivers/base/dd.c:616
 __device_release_driver drivers/base/dd.c:1349 [inline]
 device_release_driver_internal+0x44e/0x620 drivers/base/dd.c:1372
 unbind_store+0xf8/0x110 drivers/base/bus.c:244
 drv_attr_store+0x74/0xb0 drivers/base/bus.c:125
 sysfs_kf_write+0xf2/0x150 fs/sysfs/file.c:145
 kernfs_fop_write_iter+0x3e0/0x5f0 fs/kernfs/file.c:345
 new_sync_write fs/read_write.c:595 [inline]
 vfs_write+0x6ac/0x1050 fs/read_write.c:687
 ksys_write+0x12a/0x250 fs/read_write.c:739
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0x115/0x870 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7fc481b9de99
Code: ff c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 44 00 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 e8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007ffd993809e8 EFLAGS: 00000246 ORIG_RAX: 0000000000000001
RAX: ffffffffffffffda RBX: 00007fc481e25fa0 RCX: 00007fc481b9de99
RDX: 000000000000000b RSI: 0000200000000200 RDI: 0000000000000003
RBP: 00007fc481c33eaf R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000000
R13: 00007fc481e25fac R14: 00007fc481e25fa0 R15: 00007fc481e25fa0
 </TASK>
Modules linked in:
---[ end trace 0000000000000000 ]---
RIP: 0010:__list_del_entry_valid_or_report+0x20/0x1d0 lib/list_debug.c:49
Code: 90 90 90 90 90 90 90 90 90 90 f3 0f 1e fa 48 b8 00 00 00 00 00 fc ff df 41 54 55 53 48 89 fb 48 83 c7 08 48 89 fa 48 c1 ea 03 <80> 3c 02 00 0f 85 5b 01 00 00 48 89 da 48 8b 6b 08 48 b8 00 00 00
RSP: 0018:ffffc9000374fa20 EFLAGS: 00010202
RAX: dffffc0000000000 RBX: 0000000000000000 RCX: fffff520006e9f22
RDX: 0000000000000001 RSI: ffffffff8c401500 RDI: 0000000000000008
RBP: ffff88802ff87000 R08: 0000000000000000 R09: fffffbfff2244efa
R10: ffffc9000374fa40 R11: 0000000000000000 R12: 00000000fffffffe
R13: ffff88802ff870e8 R14: 0000000000000008 R15: 0000000000000000
FS:  000055556cf07500(0000) GS:ffff8880d5ddc000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007fc48295da08 CR3: 000000003cd5d000 CR4: 0000000000352ef0
----------------
Code disassembly (best guess):
   0:	90                   	nop
   1:	90                   	nop
   2:	90                   	nop
   3:	90                   	nop
   4:	90                   	nop
   5:	90                   	nop
   6:	90                   	nop
   7:	90                   	nop
   8:	90                   	nop
   9:	90                   	nop
   a:	f3 0f 1e fa          	endbr64
   e:	48 b8 00 00 00 00 00 	movabs $0xdffffc0000000000,%rax
  15:	fc ff df
  18:	41 54                	push   %r12
  1a:	55                   	push   %rbp
  1b:	53                   	push   %rbx
  1c:	48 89 fb             	mov    %rdi,%rbx
  1f:	48 83 c7 08          	add    $0x8,%rdi
  23:	48 89 fa             	mov    %rdi,%rdx
  26:	48 c1 ea 03          	shr    $0x3,%rdx
* 2a:	80 3c 02 00          	cmpb   $0x0,(%rdx,%rax,1) <-- trapping instruction
  2e:	0f 85 5b 01 00 00    	jne    0x18f
  34:	48 89 da             	mov    %rbx,%rdx
  37:	48 8b 6b 08          	mov    0x8(%rbx),%rbp
  3b:	48                   	rex.W
  3c:	b8                   	.byte 0xb8
  3d:	00 00                	add    %al,(%rax)


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

Received: from mail-oi1-f206.google.com (mail-oi1-f206.google.com [209.85.167.206])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2749C23909F
	for <linux-usb@vger.kernel.org>; Tue, 28 Jul 2026 14:15:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.206
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785248140; cv=none; b=PqS6xQ42BlJQZC8flXDRH9r312vEQ7IFBb+nXrc1DIJidTd2EsESbuPQhyV8SCMYU8KrgdQHDcZd+/ODNz3vZwq+pmmMX5tZYDnp65cEW1PUYadykuk1/EA+Koe42OfmAUzxGpF2heoXW4gyIioKjLRAx3RcV5/xourxYBKcqsE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785248140; c=relaxed/simple;
	bh=RvGi62sRDxpMjmXtllJZknxl6IhUoyl7+/PtcybBM4k=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=tcEoBZl+iWUnXZU1A5yevwP+hMApbQeNyOaeVVbgFaqdRlJ9KBh3EC2XqKmyocos9ks9zzl81T/DYiqxBGr5GYVjpmQ303jMeAmtu24I/vuxfx9eETKTgvm0xaSDHNayYGJow586gUHcSBY4Rez22Q8cvZb2U6vOIAq3vFPOo+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.206
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f206.google.com with SMTP id 5614622812f47-495f637105eso5761042b6e.2
        for <linux-usb@vger.kernel.org>; Tue, 28 Jul 2026 07:15:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785248138; x=1785852938;
        h=content-type:to:from:subject:message-id:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AtyKvDcm0to1gpywcvAt6OoVuv28lk8MPP7neVIlup0=;
        b=GscvPwcoBR7323l5iv/XLggJjlnTMhHub3ZcCF9YQp5vl5/rLAoxqO4mjMki0S/Pqg
         pWMHPF6EXlR8qZwathZbTpX/AfL0Y9Ayo7AZM6SUQn8pMAex1N5RGFEs6OG0j1nH25jS
         ATWB0BKFTXpa5et2Q4QrKEdDdZuZqMh0ZN5HXT+oEjD2QiFn5DOgMeFXqdKZ9Ep1UzjN
         rzfQ1qSnkePxMqtvB2GJmRs3Q619x+CrYl/s1LGABFLdXTewzZguO9TA1mnxbPIPgbUf
         sn/ntygbAZyh8MPnKMXB8xXxkuKCivbAClP9h/NsLZNfUihtI7JOVYqZIJHmPXYRCgtp
         knhg==
X-Forwarded-Encrypted: i=1; AHgh+Rpdb2PxLz0Rph6gqT5xjl9TwkdCpfkZCTgV9O0sISrnkObggZXpgM24AcwWlvlvl//Nj+QhlmPcyXY=@vger.kernel.org
X-Gm-Message-State: AOJu0YzxyvedArixGpWTdI+nJFncRixcDDSCbx6jeWXiZnE0N8TyBIhh
	LQuX4cARuxm/vdSmgTd6RL3zdGdSga/SQc30GK5GUBQgDURG6n0t/h37p3h1kwo22KEqaSkAvtf
	rMxDeDOU6aFRAD+4xEhCmRLY+YpY86rErW9NKpeEklaUAGOW8cj40b2Xm2i0=
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:4f10:b0:4a4:a930:1f76 with SMTP id
 5614622812f47-4ad5b9bb70emr2022508b6e.11.1785248138066; Tue, 28 Jul 2026
 07:15:38 -0700 (PDT)
Date: Tue, 28 Jul 2026 07:15:38 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6a68b98a.4c659fcc.19cd90.0024.GAE@google.com>
Subject: [syzbot] [usb?] general protection fault in dummy_udc_start
From: syzbot <syzbot+d270af829aca04e783fc@syzkaller.appspotmail.com>
To: gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    62cc90241548 Merge tag 'mm-hotfixes-stable-2026-07-27-14-1..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=1400788e580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=145fa60d73086782
dashboard link: https://syzkaller.appspot.com/bug?extid=d270af829aca04e783fc
compiler:       gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=1000ffde580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=164f91b9580000

Downloadable assets:
disk image (non-bootable): https://storage.googleapis.com/syzbot-assets/d900f083ada3/non_bootable_disk-62cc9024.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/b10a9ae7e3d1/vmlinux-62cc9024.xz
kernel image: https://storage.googleapis.com/syzbot-assets/b89124d39495/bzImage-62cc9024.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+d270af829aca04e783fc@syzkaller.appspotmail.com

dummy_hcd dummy_hcd.0: remove, state 4
usb usb5: USB disconnect, device number 1
dummy_hcd dummy_hcd.0: stopped
dummy_hcd dummy_hcd.0: USB bus 5 deregistered
Oops: general protection fault, probably for non-canonical address 0xdffffc0000000000: 0000 [#1] SMP KASAN NOPTI
KASAN: null-ptr-deref in range [0x0000000000000000-0x0000000000000007]
CPU: 2 UID: 0 PID: 5931 Comm: syz.0.17 Not tainted syzkaller #0 PREEMPT(full) 
Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.3-debian-1.16.3-2 04/01/2014
RIP: 0010:dummy_udc_start+0x91/0x1d0 drivers/usb/gadget/udc/dummy_hcd.c:1022
Code: df 48 89 fa 48 c1 ea 03 80 3c 02 00 0f 85 28 01 00 00 4c 8b ab 90 06 00 00 48 b8 00 00 00 00 00 fc ff df 4c 89 ea 48 c1 ea 03 <80> 3c 02 00 0f 85 10 01 00 00 83 ed 01 bf 02 00 00 00 49 8b 5d 00
RSP: 0018:ffffc90003997b48 EFLAGS: 00010246
RAX: dffffc0000000000 RBX: ffff88802c4e0c00 RCX: ffffffff87d0c8f9
RDX: 0000000000000000 RSI: ffffffff87d0c907 RDI: ffff88802c4e1290
RBP: 0000000000000003 R08: 0000000000000005 R09: 0000000000000005
R10: 0000000000000003 R11: 0000000000000000 R12: ffff88802e7c2050
R13: 0000000000000000 R14: ffff88802d49c4f1 R15: ffff88802d49c008
FS:  0000555566288500(0000) GS:ffff8880d5fdc000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007f24ccd874c0 CR3: 000000003c5d9000 CR4: 0000000000352ef0
Call Trace:
 <TASK>
 usb_gadget_udc_start_locked drivers/usb/gadget/udc/core.c:1237 [inline]
 gadget_bind_driver+0x4ac/0xbf0 drivers/usb/gadget/udc/core.c:1667
 call_driver_probe drivers/base/dd.c:628 [inline]
 really_probe+0x241/0xa60 drivers/base/dd.c:706
 __driver_probe_device+0x20e/0x450 drivers/base/dd.c:868
 driver_probe_device+0x4a/0x140 drivers/base/dd.c:898
 __driver_attach+0x21f/0x5b0 drivers/base/dd.c:1292
 bus_for_each_dev+0x13e/0x1d0 drivers/base/bus.c:383
 bus_add_driver+0x305/0x5b0 drivers/base/bus.c:763
 driver_register+0x1e2/0x360 drivers/base/driver.c:174
 usb_gadget_register_driver_owner+0x132/0x210 drivers/usb/gadget/udc/core.c:1752
 raw_ioctl_run drivers/usb/gadget/legacy/raw_gadget.c:596 [inline]
 raw_ioctl+0x1a85/0x2b80 drivers/usb/gadget/legacy/raw_gadget.c:1307
 vfs_ioctl fs/ioctl.c:51 [inline]
 __do_sys_ioctl fs/ioctl.c:597 [inline]
 __se_sys_ioctl fs/ioctl.c:583 [inline]
 __x64_sys_ioctl+0x18e/0x210 fs/ioctl.c:583
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0x115/0x870 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f24ccd9db2b
Code: 00 48 89 44 24 18 31 c0 48 8d 44 24 60 c7 04 24 10 00 00 00 48 89 44 24 08 48 8d 44 24 20 48 89 44 24 10 b8 10 00 00 00 0f 05 <89> c2 3d 00 f0 ff ff 77 1c 48 8b 44 24 18 64 48 2b 04 25 28 00 00
RSP: 002b:00007ffd9eb276f0 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
RAX: ffffffffffffffda RBX: 0000000000000004 RCX: 00007f24ccd9db2b
RDX: 0000000000000000 RSI: 0000000000005501 RDI: 0000000000000004
RBP: 00007ffd9eb287c0 R08: 0000000000000001 R09: 00000000ffffffff
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000000
R13: 00002000000001c0 R14: 0000000000000000 R15: 0000000000000000
 </TASK>
Modules linked in:
---[ end trace 0000000000000000 ]---
RIP: 0010:dummy_udc_start+0x91/0x1d0 drivers/usb/gadget/udc/dummy_hcd.c:1022
Code: df 48 89 fa 48 c1 ea 03 80 3c 02 00 0f 85 28 01 00 00 4c 8b ab 90 06 00 00 48 b8 00 00 00 00 00 fc ff df 4c 89 ea 48 c1 ea 03 <80> 3c 02 00 0f 85 10 01 00 00 83 ed 01 bf 02 00 00 00 49 8b 5d 00
RSP: 0018:ffffc90003997b48 EFLAGS: 00010246
RAX: dffffc0000000000 RBX: ffff88802c4e0c00 RCX: ffffffff87d0c8f9
RDX: 0000000000000000 RSI: ffffffff87d0c907 RDI: ffff88802c4e1290
RBP: 0000000000000003 R08: 0000000000000005 R09: 0000000000000005
R10: 0000000000000003 R11: 0000000000000000 R12: ffff88802e7c2050
R13: 0000000000000000 R14: ffff88802d49c4f1 R15: ffff88802d49c008
FS:  0000555566288500(0000) GS:ffff8880d60dc000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007f24ccfec000 CR3: 000000003c5d9000 CR4: 0000000000352ef0
----------------
Code disassembly (best guess):
   0:	df 48 89             	fisttps -0x77(%rax)
   3:	fa                   	cli
   4:	48 c1 ea 03          	shr    $0x3,%rdx
   8:	80 3c 02 00          	cmpb   $0x0,(%rdx,%rax,1)
   c:	0f 85 28 01 00 00    	jne    0x13a
  12:	4c 8b ab 90 06 00 00 	mov    0x690(%rbx),%r13
  19:	48 b8 00 00 00 00 00 	movabs $0xdffffc0000000000,%rax
  20:	fc ff df
  23:	4c 89 ea             	mov    %r13,%rdx
  26:	48 c1 ea 03          	shr    $0x3,%rdx
* 2a:	80 3c 02 00          	cmpb   $0x0,(%rdx,%rax,1) <-- trapping instruction
  2e:	0f 85 10 01 00 00    	jne    0x144
  34:	83 ed 01             	sub    $0x1,%ebp
  37:	bf 02 00 00 00       	mov    $0x2,%edi
  3c:	49 8b 5d 00          	mov    0x0(%r13),%rbx


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

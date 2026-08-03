Received: from mail-oi1-f208.google.com (mail-oi1-f208.google.com [209.85.167.208])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C79DF363C60
	for <linux-usb@vger.kernel.org>; Mon,  3 Aug 2026 09:52:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.208
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785750747; cv=none; b=SPx+hWLaVPr0VfdVwv70/QACdOFmXm7lPFqVt4L0ncpQt6CLIT4pihFJ8GanlPuvi7X2OHSpFhs+NfwR8WngylvHlRl99833bo6+hqH9EmfgKbMrTFem4fgWQovl4oj3YkHb+lWeJ9PL9YF3AToHh6oP5CNYpSZANv3xnn5UIeY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785750747; c=relaxed/simple;
	bh=riU7LlcqJ+yfFgnQD2n4Ik/pF8T5p8gkK75whjYIWF8=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=j0b2WSGUiN2PM0CmMPD5eXn4/QdhCMkUpqqUtgiDKYZCth65t58xvgs6KLS+qOSaYOp39BQtUHOMhuu2WstNCVPUeHsz0klQUCMTQyCjQkEKsII3on8mvoVJfv5LNLQbSD1Ujm0TQ5UiMXjD0M7ltS9DTg7SeOvc91ZL0mgWEUI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.208
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f208.google.com with SMTP id 5614622812f47-4a4a7d0362eso4017214b6e.0
        for <linux-usb@vger.kernel.org>; Mon, 03 Aug 2026 02:52:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785750744; x=1786355544;
        h=content-type:to:from:subject:message-id:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vqmNKH9yaqIK55a7lsmnaIRSZ0U8Bf5RjKMLrhujemM=;
        b=iGX+MV9YNB2RUZ/pawIqW10vPKdKTe2EY4lR2GW5sHtToeEF1urhbDUfkL0N4rheS0
         loNafCd/5J7Cg9p4JDK5iy2/XZCsC1h4GKNMabk2w6adgRIKoP683DyBcqXuqRLAn2nt
         WMYep2tX3HVO8HfTHfMzX5rT2mjOiP/a+C29UntmLCva1Mh7Pzy1+9DNqB7Nk8UrLuIq
         UVkx7z5axgtoDsYsWDnhrZBPlDZjirmClUOOhEum0MfSPU3mXk+Ljax680InUGC6q/0I
         WbkxsYn8ihCLK4w+6y8ttlPYYNW2nI2MGO9DOFWQykKH3UJeSrDjD+ZPlezQra3IhjnZ
         f4+w==
X-Forwarded-Encrypted: i=1; AHgh+Ro3p0vBAXJqM42BlhCediH3slgxICFrtiyCr1oBthDC5JlQ3OnOGDr5qxB+PGvdVI+pyghDpf5OdFw=@vger.kernel.org
X-Gm-Message-State: AOJu0YzRAwIY+RE5xoW7EbZswRfVW2gb72fiPTxUUp8I8+BrN9GR+UKp
	9/s/P0SxsylQ8D4Ki7vmsTb5d3v6Kpw+OnrB8dpmBpjBmy5U0ux3YucDbC3G1E688WH0KSBIWtj
	aoTNCqARHEaurB+wAEhHMllQDshNHznlsgOCgpcJ25I3pAnfZzY/Gt9aDIys=
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:1247:b0:496:9b3:486 with SMTP id
 5614622812f47-4af5e2fc1b2mr13870553b6e.14.1785750744736; Mon, 03 Aug 2026
 02:52:24 -0700 (PDT)
Date: Mon, 03 Aug 2026 02:52:24 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6a7064d8.f794c993.27aeb.002c.GAE@google.com>
Subject: [syzbot] [usb?] general protection fault in usb_put_function_instance
From: syzbot <syzbot+fd6ef980cf1c722be639@syzkaller.appspotmail.com>
To: gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    11028ab62899 Merge tag 'probes-fixes-v7.2-rc5' of git://gi..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=14759499580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=145fa60d73086782
dashboard link: https://syzkaller.appspot.com/bug?extid=fd6ef980cf1c722be639
compiler:       gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/dbf4cb7b4116/disk-11028ab6.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/77761f1559a8/vmlinux-11028ab6.xz
kernel image: https://storage.googleapis.com/syzbot-assets/bb1ed2bbff0e/bzImage-11028ab6.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+fd6ef980cf1c722be639@syzkaller.appspotmail.com

RSP: 002b:00007fe4435bb028 EFLAGS: 00000246 ORIG_RAX: 0000000000000102
RAX: ffffffffffffffda RBX: 00007fe442a25fa0 RCX: 00007fe44279df99
RDX: 00000000000001ff RSI: 0000200000000280 RDI: ffffffffffffff9c
RBP: 00007fe442834ec4 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000000
R13: 00007fe442a26038 R14: 00007fe442a25fa0 R15: 00007ffeb0abd888
 </TASK>
Oops: general protection fault, probably for non-canonical address 0xdffffc0000000001: 0000 [#1] SMP KASAN NOPTI
KASAN: null-ptr-deref in range [0x0000000000000008-0x000000000000000f]
CPU: 0 UID: 0 PID: 7285 Comm: syz.5.98 Tainted: G             L      syzkaller #0 PREEMPT(full) 
Tainted: [L]=SOFTLOCKUP
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 07/16/2026
RIP: 0010:usb_put_function_instance+0x52/0xc0 drivers/usb/gadget/functions.c:76
Code: df 48 89 fa 48 c1 ea 03 80 3c 02 00 75 67 48 8b ab 98 00 00 00 48 b8 00 00 00 00 00 fc ff df 48 8d 7d 08 48 89 fa 48 c1 ea 03 <80> 3c 02 00 75 53 48 8d bb a8 00 00 00 48 8b 6d 08 48 b8 00 00 00
RSP: 0018:ffffc9000466fa98 EFLAGS: 00010202
RAX: dffffc0000000000 RBX: ffff88802a5b5000 RCX: ffffc90005fc9000
RDX: 0000000000000001 RSI: ffffffff87cf0f08 RDI: 0000000000000008
RBP: 0000000000000000 R08: 0000000000000001 R09: 0000000000000000
R10: 0000000000000001 R11: 0000000000000000 R12: 0000000000000000
R13: 0000000000000000 R14: ffff88802a5b5008 R15: dffffc0000000000
FS:  00007fe4435bb6c0(0000) GS:ffff888123ddc000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007fe4427eb680 CR3: 0000000031bb9000 CR4: 00000000003526f0
Call Trace:
 <TASK>
 config_item_cleanup+0x146/0x240 fs/configfs/item.c:128
 config_item_release fs/configfs/item.c:137 [inline]
 kref_put include/linux/kref.h:65 [inline]
 config_item_put fs/configfs/item.c:149 [inline]
 config_item_put+0x93/0xb0 fs/configfs/item.c:146
 config_group_put include/linux/configfs.h:102 [inline]
 uvcg_attach_configfs+0x5d/0x70 drivers/usb/gadget/function/uvc_configfs.c:3832
 uvc_alloc_inst+0xaba/0xd30 drivers/usb/gadget/function/f_uvc.c:999
 try_get_usb_function_instance+0x136/0x1f0 drivers/usb/gadget/functions.c:28
 usb_get_function_instance+0x16/0x70 drivers/usb/gadget/functions.c:44
 function_make+0x18c/0x3f0 drivers/usb/gadget/configfs.c:626
 configfs_mkdir+0x51e/0xb70 fs/configfs/dir.c:1360
 vfs_mkdir+0x361/0x850 fs/namei.c:5276
 filename_mkdirat+0x48b/0x5e0 fs/namei.c:5309
 __do_sys_mkdirat fs/namei.c:5330 [inline]
 __se_sys_mkdirat fs/namei.c:5327 [inline]
 __x64_sys_mkdirat+0x89/0xc0 fs/namei.c:5327
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0x115/0x870 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7fe44279df99
Code: ff c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 44 00 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 e8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007fe4435bb028 EFLAGS: 00000246 ORIG_RAX: 0000000000000102
RAX: ffffffffffffffda RBX: 00007fe442a25fa0 RCX: 00007fe44279df99
RDX: 00000000000001ff RSI: 0000200000000280 RDI: ffffffffffffff9c
RBP: 00007fe442834ec4 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000000
R13: 00007fe442a26038 R14: 00007fe442a25fa0 R15: 00007ffeb0abd888
 </TASK>
Modules linked in:
---[ end trace 0000000000000000 ]---
RIP: 0010:usb_put_function_instance+0x52/0xc0 drivers/usb/gadget/functions.c:76
Code: df 48 89 fa 48 c1 ea 03 80 3c 02 00 75 67 48 8b ab 98 00 00 00 48 b8 00 00 00 00 00 fc ff df 48 8d 7d 08 48 89 fa 48 c1 ea 03 <80> 3c 02 00 75 53 48 8d bb a8 00 00 00 48 8b 6d 08 48 b8 00 00 00
RSP: 0018:ffffc9000466fa98 EFLAGS: 00010202

RAX: dffffc0000000000 RBX: ffff88802a5b5000 RCX: ffffc90005fc9000
RDX: 0000000000000001 RSI: ffffffff87cf0f08 RDI: 0000000000000008
----------------
Code disassembly (best guess):
   0:	df 48 89             	fisttps -0x77(%rax)
   3:	fa                   	cli
   4:	48 c1 ea 03          	shr    $0x3,%rdx
   8:	80 3c 02 00          	cmpb   $0x0,(%rdx,%rax,1)
   c:	75 67                	jne    0x75
   e:	48 8b ab 98 00 00 00 	mov    0x98(%rbx),%rbp
  15:	48 b8 00 00 00 00 00 	movabs $0xdffffc0000000000,%rax
  1c:	fc ff df
  1f:	48 8d 7d 08          	lea    0x8(%rbp),%rdi
  23:	48 89 fa             	mov    %rdi,%rdx
  26:	48 c1 ea 03          	shr    $0x3,%rdx
* 2a:	80 3c 02 00          	cmpb   $0x0,(%rdx,%rax,1) <-- trapping instruction
  2e:	75 53                	jne    0x83
  30:	48 8d bb a8 00 00 00 	lea    0xa8(%rbx),%rdi
  37:	48 8b 6d 08          	mov    0x8(%rbp),%rbp
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

If you want to overwrite report's subsystems, reply with:
#syz set subsystems: new-subsystem
(See the list of subsystem names on the web dashboard)

If the report is a duplicate of another one, reply with:
#syz dup: exact-subject-of-another-report

If you want to undo deduplication, reply with:
#syz undup

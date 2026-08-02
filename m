Received: from mail-oi1-f206.google.com (mail-oi1-f206.google.com [209.85.167.206])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32257E56A
	for <linux-usb@vger.kernel.org>; Sun,  2 Aug 2026 00:01:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.206
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785628892; cv=none; b=QGnmR7ONcRxsn9y3f1jLHLPD7PRthWObrr64Sd7Qpi9KByNhePBtp41hfepl889xdW+jzRhxV67S4or3KbzpqeY7fWKFo5pfs0Sz+u4pTmKCQ4OsDDW5fHgWG8H2Ldf06bU1DWyHT+UvtXozPTjpCu6YDc//pplpVwRPJ8eWefE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785628892; c=relaxed/simple;
	bh=NAlkJTudrLZwGNmzFqmZnWGv+foHmaS64jirWct96HQ=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=Avbkq7cnYJ/Ux3gahznb/AY7yhp2iY7Am3g27OHgHqM5226B/tH2rAvw4gL0urdexO5ZLvnaEoYOgA+n5powJwQmp0q2CgdSreopVFGP36RNCFu1VD3Pt4K4y7EpVhq9T7pxCCwHQ8C0QXdadKVY7sLCYow7CJseUUu2G8VwJ1A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.206
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f206.google.com with SMTP id 5614622812f47-4a45b3f0bdfso2765476b6e.1
        for <linux-usb@vger.kernel.org>; Sat, 01 Aug 2026 17:01:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785628890; x=1786233690;
        h=content-type:to:from:subject:message-id:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=obaBbdwQOTPGq5oO8I7zmX6YNpGFQMgr16pxSKpEU1c=;
        b=hrwTVg7WYsf0gfY3coPu5zD/0C4BkxMNnA+MKH0g9mT5GvLGi1DvjQa3XKQzP9ziM0
         pVutFTvLCZUPk96YMUmE7RMRQx3+xpAMuPocC3MVzJNHSDJ1RyQjI8YOCAfhn+Ak/9Mo
         PBPMI8sDzdk9tOVivKCCxVzOJheoLy1WxI/5TOvBqQ/rvdvs5Dyi7TCv5MYcLrOf9oxJ
         G4Xsiux11Z0SoU8aAKX8mEMB4pWyg5xGQUzoQJBrlgGTXeHPcsSQi8OHiRXrTyKeB+nd
         Y0vf83jT3BQzfoooAsFpdzCDVI7XyfKlFP9NQdIum1ZCfjxdp8qF/9M0w5fpGBOJQY9e
         Oqlw==
X-Forwarded-Encrypted: i=1; AHgh+RobLP1XhhQao1xqghbemoslFfXzpd9KGV1Sho+OspiRR2TTh7PHL7X38yFphOOYjSoIQNE90z8Nw4w=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9kvdjEhZQnUZkVy8RvOZKoeHXZM/aZpSwGOAJHapyxpbHjsjF
	x7QLoZ0vsMX9oq+0WS2IyppMFcLzVbMmZ+9eGUAjLbJd4P7ZU4qhY5PGuef79iG554Yz+yvjTqx
	78uq1Xb9J4GnlEMHIJd01eQ1KWKIsZhPLkoBbyl4ZX8PR4WMzijvvS7AzNF8=
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:c1fa:b0:48b:1e49:24a8 with SMTP id
 5614622812f47-4af5e337ed2mr9422805b6e.11.1785628890179; Sat, 01 Aug 2026
 17:01:30 -0700 (PDT)
Date: Sat, 01 Aug 2026 17:01:30 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6a6e88da.13bfb6d0.1ecdd5.0268.GAE@google.com>
Subject: [syzbot] [usb?] general protection fault in dummy_udc_stop
From: syzbot <syzbot+366177ceada8026bb3a6@syzkaller.appspotmail.com>
To: gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    48a5a7ab8d6a Merge tag 'v7.2-rc4-smb3-client-fixes' of git..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=138cdca9580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=145fa60d73086782
dashboard link: https://syzkaller.appspot.com/bug?extid=366177ceada8026bb3a6
compiler:       gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/1eb5b7aa9ec5/disk-48a5a7ab.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/965506e050aa/vmlinux-48a5a7ab.xz
kernel image: https://storage.googleapis.com/syzbot-assets/662778208054/bzImage-48a5a7ab.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+366177ceada8026bb3a6@syzkaller.appspotmail.com

Oops: general protection fault, probably for non-canonical address 0xdffffc0000000000: 0000 [#1] SMP KASAN NOPTI
KASAN: null-ptr-deref in range [0x0000000000000000-0x0000000000000007]
CPU: 0 UID: 0 PID: 14439 Comm: syz.7.1882 Tainted: G             L      syzkaller #0 PREEMPT(full) 
Tainted: [L]=SOFTLOCKUP
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 07/16/2026
RIP: 0010:dummy_udc_stop+0x9b/0x450 drivers/usb/gadget/udc/dummy_hcd.c:1035
Code: c1 ea 03 80 3c 02 00 0f 85 b8 03 00 00 48 8b 9b 90 06 00 00 e8 86 62 39 fa 48 89 da 48 b8 00 00 00 00 00 fc ff df 48 c1 ea 03 <80> 3c 02 00 0f 85 84 03 00 00 4c 8b 2b 4c 89 ef e8 70 c9 ec 03 49
RSP: 0018:ffffc900037bfad0 EFLAGS: 00010246
RAX: dffffc0000000000 RBX: 0000000000000000 RCX: ffffffff87d0f9de
RDX: 0000000000000000 RSI: ffffffff87d0fa1a RDI: ffff8880288ad290
RBP: 0000000000000003 R08: 0000000000000005 R09: 0000000000000005
R10: 0000000000000003 R11: 0000000000002260 R12: ffff888038dba438
R13: ffff88802b8d5540 R14: ffff8880288acc00 R15: ffffffff8cb7c8e0
FS:  00007fe5286926c0(0000) GS:ffff888123dde000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 0000001b3480afe8 CR3: 000000004c226000 CR4: 00000000003526f0
Call Trace:
 <TASK>
 usb_gadget_udc_stop_locked drivers/usb/gadget/udc/core.c:1265 [inline]
 gadget_unbind_driver+0x2ca/0x4f0 drivers/usb/gadget/udc/core.c:1727
 device_remove+0xcb/0x180 drivers/base/dd.c:616
 __device_release_driver drivers/base/dd.c:1349 [inline]
 device_release_driver_internal+0x44e/0x620 drivers/base/dd.c:1372
 driver_detach+0xd8/0x1b0 drivers/base/dd.c:1435
 bus_remove_driver+0x13b/0x2e0 drivers/base/bus.c:832
 driver_unregister+0x76/0xb0 drivers/base/driver.c:202
 usb_gadget_unregister_driver+0x49/0x70 drivers/usb/gadget/udc/core.c:1784
 unregister_gadget drivers/usb/gadget/configfs.c:263 [inline]
 gadget_dev_desc_UDC_store+0x170/0x2e0 drivers/usb/gadget/configfs.c:290
 flush_write_buffer fs/configfs/file.c:207 [inline]
 configfs_write_iter+0x302/0x4e0 fs/configfs/file.c:229
 new_sync_write fs/read_write.c:595 [inline]
 vfs_write+0x6ac/0x1050 fs/read_write.c:687
 ksys_write+0x12a/0x250 fs/read_write.c:739
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0x115/0x870 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7fe52779de99
Code: ff c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 44 00 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 e8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007fe528692028 EFLAGS: 00000246 ORIG_RAX: 0000000000000001
RAX: ffffffffffffffda RBX: 00007fe527a25fa0 RCX: 00007fe52779de99
RDX: 0000000000000001 RSI: 00002000000004c0 RDI: 0000000000000004
RBP: 00007fe527833eaf R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000000
R13: 00007fe527a26038 R14: 00007fe527a25fa0 R15: 00007ffc5d1d0288
 </TASK>
Modules linked in:
---[ end trace 0000000000000000 ]---
RIP: 0010:dummy_udc_stop+0x9b/0x450 drivers/usb/gadget/udc/dummy_hcd.c:1035
Code: c1 ea 03 80 3c 02 00 0f 85 b8 03 00 00 48 8b 9b 90 06 00 00 e8 86 62 39 fa 48 89 da 48 b8 00 00 00 00 00 fc ff df 48 c1 ea 03 <80> 3c 02 00 0f 85 84 03 00 00 4c 8b 2b 4c 89 ef e8 70 c9 ec 03 49
RSP: 0018:ffffc900037bfad0 EFLAGS: 00010246
RAX: dffffc0000000000 RBX: 0000000000000000 RCX: ffffffff87d0f9de
RDX: 0000000000000000 RSI: ffffffff87d0fa1a RDI: ffff8880288ad290
RBP: 0000000000000003 R08: 0000000000000005 R09: 0000000000000005
R10: 0000000000000003 R11: 0000000000002260 R12: ffff888038dba438
R13: ffff88802b8d5540 R14: ffff8880288acc00 R15: ffffffff8cb7c8e0
FS:  00007fe5286926c0(0000) GS:ffff888123ede000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 000020000035a030 CR3: 000000004c226000 CR4: 00000000003526f0
----------------
Code disassembly (best guess):
   0:	c1 ea 03             	shr    $0x3,%edx
   3:	80 3c 02 00          	cmpb   $0x0,(%rdx,%rax,1)
   7:	0f 85 b8 03 00 00    	jne    0x3c5
   d:	48 8b 9b 90 06 00 00 	mov    0x690(%rbx),%rbx
  14:	e8 86 62 39 fa       	call   0xfa39629f
  19:	48 89 da             	mov    %rbx,%rdx
  1c:	48 b8 00 00 00 00 00 	movabs $0xdffffc0000000000,%rax
  23:	fc ff df
  26:	48 c1 ea 03          	shr    $0x3,%rdx
* 2a:	80 3c 02 00          	cmpb   $0x0,(%rdx,%rax,1) <-- trapping instruction
  2e:	0f 85 84 03 00 00    	jne    0x3b8
  34:	4c 8b 2b             	mov    (%rbx),%r13
  37:	4c 89 ef             	mov    %r13,%rdi
  3a:	e8 70 c9 ec 03       	call   0x3ecc9af
  3f:	49                   	rex.WB


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

Received: from mail-oi1-f206.google.com (mail-oi1-f206.google.com [209.85.167.206])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84F213A1B5
	for <linux-usb@vger.kernel.org>; Thu, 30 Jul 2026 00:10:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.206
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785370223; cv=none; b=mcrwglAHm7LMCyJgUO06H3IMQJ6rRqA5YgAwrzni+VJM0etZj0egX2KI2zUj9OCUqb7ed8PxKC1TKspot7ul6xUKGXlys3I/VwLrniqQfHUJg+Y7ScDYX7ewKcOTVQEv8kkuH11uBP3ghybChgl4YMMe/c8tLIASuafgjmrJB0s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785370223; c=relaxed/simple;
	bh=4tlfrGt2iLHcAhKGVmMFmj7l7u4TM6tT+JK4ahqx8Ys=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=EsPzM1CY3W1/+1Khh8tPGK4GeNCMAt5yT5mbZhnoxvuWbdNZWU3xu2YAr7vIrSnImhNULV0JvkXQr1ZNZZhRQMoD05HumzcTb9gej6a6tNZJHb8cCjJau3T7JHCRSneGpOAsJgIiXe2CE5kPSXXnnlaMuONEQE120KRYyPaBBkg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.206
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f206.google.com with SMTP id 5614622812f47-495b8b30310so1674814b6e.1
        for <linux-usb@vger.kernel.org>; Wed, 29 Jul 2026 17:10:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785370220; x=1785975020;
        h=content-type:to:from:subject:message-id:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Cn+zJJN8X/WieJugWfTMjbkGs5s5LXhloRJo3vPLYNA=;
        b=cyoYod5qZxQ9+tdt64OV2r2eEiNBNnAp9YVZrdrHpjcA3zN+9wsVDyAouYWsa5zMTX
         dfr88/57jRECI+KptBvk2CpnHSIhgm8PVjFX68Sq4WB63gpC2xh3rzFQHB7quMrKZVna
         kREbU7yRUAfl2Z6OF4POtEJoMCLvJMFWsG6UFqPpo4aRnDocOk/66jEagnKFKBHtG/PS
         6xzgokN66oPPM06SyEGXwZAtI+7ZG3AoWG5znZgj2HY05jsXDfeJXvaOUnWFTq+2dVa3
         ND3SkAbBXAqw64dP9kf7AvWPjmA9BO4MMyOXWDDy/8fHaioUKaeGsMbcDtaG3bzblVWQ
         HGAA==
X-Forwarded-Encrypted: i=1; AHgh+RqVkVvx8nlCLeDNKGL6VEoihfDarVLpkk84IUwa+dVnuapr0gcNx4RUGG4YmynmV+ThK8g97RdzK1A=@vger.kernel.org
X-Gm-Message-State: AOJu0YwimhxlYnOI2nJVBWd3WKoUrK3f4MXpECQnoqcSYsdZsfb+zwIR
	R2Cnfm0huOI3Th8Zjh0AN6AIDSO8qIDaQruI0ZKg5nkOj3H48peWDbECh1lKIPfuLdi2MszUjgg
	jMJUbW935YV5OpOYRaARUqHw5wXF02SXgfh+hsiu0G5NGXgwfhBZCX9DAu8k=
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:159a:b0:494:18ad:8a5b with SMTP id
 5614622812f47-4ad878bbcc7mr328836b6e.17.1785370220454; Wed, 29 Jul 2026
 17:10:20 -0700 (PDT)
Date: Wed, 29 Jul 2026 17:10:20 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6a6a966c.86abc875.e5c3d.0053.GAE@google.com>
Subject: [syzbot] [usb?] kernel BUG in register_netdevice
From: syzbot <syzbot+85ede281798faf736677@syzkaller.appspotmail.com>
To: gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    f5098b6bae76 Linux 7.2-rc5
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=126ae499580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=b7079b368dcec295
dashboard link: https://syzkaller.appspot.com/bug?extid=85ede281798faf736677
compiler:       gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/b18067cdf26c/disk-f5098b6b.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/2b364c33a0f2/vmlinux-f5098b6b.xz
kernel image: https://storage.googleapis.com/syzbot-assets/2dfce6f90a4d/bzImage-f5098b6b.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+85ede281798faf736677@syzkaller.appspotmail.com

------------[ cut here ]------------
kernel BUG at net/core/dev.c:11340!
Oops: invalid opcode: 0000 [#1] SMP KASAN NOPTI
CPU: 0 UID: 0 PID: 7785 Comm: syz.5.435 Tainted: G             L      syzkaller #0 PREEMPT(full) 
Tainted: [L]=SOFTLOCKUP
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 07/16/2026
RIP: 0010:register_netdevice+0x1233/0x25a0 net/core/dev.c:11340
Code: 0f 0b e8 60 ff 7a f8 48 8d 3d 69 50 a2 07 ba 47 2c 00 00 48 c7 c6 80 59 16 8d 67 48 0f b9 3a e9 a5 ee ff ff e8 3e ff 7a f8 90 <0f> 0b e8 36 ff 7a f8 90 0f 0b 48 8b 5c 24 18 48 8b 6c 24 20 e8 24
RSP: 0018:ffffc9000271f7c8 EFLAGS: 00010283
RAX: 0000000000027807 RBX: 1ffff920004e3f02 RCX: ffffc9000fd95000
RDX: 0000000000080000 RSI: ffffffff898f3fe2 RDI: ffff888044ca8000
RBP: ffff888067696000 R08: 0000000000000001 R09: 0000000000000000
R10: 0000000000000001 R11: 0000000000000000 R12: 0000000000000001
R13: ffff8880223b6000 R14: ffff888075d439b0 R15: ffff888067696000
FS:  00007f0b786416c0(0000) GS:ffff888123dde000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007ffd3d259f88 CR3: 0000000074345000 CR4: 0000000000350ef0
Call Trace:
 <TASK>
 register_netdev+0x34/0x50 net/core/dev.c:11562
 gphonet_register_netdev drivers/usb/gadget/function/f_phonet.c:727 [inline]
 pn_bind+0x149/0x5b0 drivers/usb/gadget/function/f_phonet.c:511
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
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0x115/0x870 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f0b7779de99
Code: ff c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 44 00 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 e8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007f0b78641028 EFLAGS: 00000246 ORIG_RAX: 0000000000000001
RAX: ffffffffffffffda RBX: 00007f0b77a25fa0 RCX: 00007f0b7779de99
RDX: 000000000000000b RSI: 0000200000000380 RDI: 0000000000000003
RBP: 00007f0b77833eaf R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000000
R13: 00007f0b77a26038 R14: 00007f0b77a25fa0 R15: 00007ffceb9c2f78
 </TASK>
Modules linked in:
---[ end trace 0000000000000000 ]---
RIP: 0010:register_netdevice+0x1233/0x25a0 net/core/dev.c:11340
Code: 0f 0b e8 60 ff 7a f8 48 8d 3d 69 50 a2 07 ba 47 2c 00 00 48 c7 c6 80 59 16 8d 67 48 0f b9 3a e9 a5 ee ff ff e8 3e ff 7a f8 90 <0f> 0b e8 36 ff 7a f8 90 0f 0b 48 8b 5c 24 18 48 8b 6c 24 20 e8 24
RSP: 0018:ffffc9000271f7c8 EFLAGS: 00010283
RAX: 0000000000027807 RBX: 1ffff920004e3f02 RCX: ffffc9000fd95000
RDX: 0000000000080000 RSI: ffffffff898f3fe2 RDI: ffff888044ca8000
RBP: ffff888067696000 R08: 0000000000000001 R09: 0000000000000000
R10: 0000000000000001 R11: 0000000000000000 R12: 0000000000000001
R13: ffff8880223b6000 R14: ffff888075d439b0 R15: ffff888067696000
FS:  00007f0b786416c0(0000) GS:ffff888123dde000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007ffd1eb92fcc CR3: 0000000074345000 CR4: 0000000000350ef0


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

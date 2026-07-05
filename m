Received: from mail-oi1-f208.google.com (mail-oi1-f208.google.com [209.85.167.208])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DCEF35BDAA
	for <linux-usb@vger.kernel.org>; Sun,  5 Jul 2026 10:23:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.208
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783247011; cv=none; b=mkjqQTUhltsGOm9QsBF9EutalZ4XYhhAMGtwHGBi3EyYSL/xR+OHKPxH5KwHZgid58+JQYy8RPMlVmWnkBH6VwJxpBaWvyX8ToJam+KOPyINwZazMc03kIS9oEbPbunNEt1OQDEKrlFQw1pfilVAxYEu1XblzJquvDoNzH4Irho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783247011; c=relaxed/simple;
	bh=hNFmTnngxLSLsxsXNFj3jUEtk+Q5LmPPobqraYiAiUQ=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=souLVwP1psT647kgi2E/Aq4EyPMofm9HoR3kVykanqH5eHM4Sxo4sNza0WpT2caJAuTfaFE4YUrV7eQJmh3gT81PGdGqlAtWgK3lIRUA2jD5M7Go1p0W0mCq2GnOoNzExHGEleD+cGt7l1gw70tsm2Lm1PymIrPq8MI+rbMIEx8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.208
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f208.google.com with SMTP id 5614622812f47-495b8b30310so2312974b6e.1
        for <linux-usb@vger.kernel.org>; Sun, 05 Jul 2026 03:23:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783247009; x=1783851809;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=d1f8miQPu5ASvBPSW17QlfKdLB3S/5ugH6lDJOVghNk=;
        b=oVjgMeV7pyYQeRs0ZsWWmVS2AgJPcDRnDNO8afQ0UNmBnGJTnG18KuIEixKXptuLl6
         FH8MYSARB4lO1kW1HHjP/suHRdOy29sBZAfqUu5xoy6Etk91cXNZt7zIXfblq4q1q0Dl
         NavGR1F5AzfToS8MxamZtAnb6FtuOg44Tam3V8R9GsB2DRQjOUaZK5zdOpW49kMF3fk7
         njD3PDGiBjzkClt6uP4PzOeDRQSn8JmfjwaNy6amGHcm478j6OHf04o4IX7SEnxH6dhb
         XEeaXNIRDgHw96qifH0lDmXZBfQZzM68KEzBWeIhDdPiYdJSJKSQHvb9o3YMQF4smgcy
         yraw==
X-Forwarded-Encrypted: i=1; AFNElJ8spY0CVZIEGfyacbSvz80iR/bqpAANd804nUk2DyqC4mdoxsxEyQR/+6aGHhYxDMVyQqZ9o80FjWc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz0b/eOzVjGb+qiy9hNkuwgiJn1VWV6xQ7671bvq9zj2i+HwkCE
	m6Il1Jg7WakqxxZhD56hz+QxBqcpLK4OW2XWCNCZGqIoCXxFM5PC5BgIs+9k9sMAjRj+V0APVI0
	yl3wX1xhwCbsJLbGSjZsI9Nsf47KaJFoVss6USYnbwuH4lSZATY3+/DkWoso=
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:c413:b0:496:c5a:e11d with SMTP id
 5614622812f47-499b79f806amr4814279b6e.15.1783247009201; Sun, 05 Jul 2026
 03:23:29 -0700 (PDT)
Date: Sun, 05 Jul 2026 03:23:29 -0700
In-Reply-To: <69038243.a70a0220.5b2ed.0048.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6a4a30a1.7b9523b0.16a4a.000b.GAE@google.com>
Subject: Re: [syzbot] [usb?] BUG: corrupted list in usb_hcd_link_urb_to_ep (5)
From: syzbot <syzbot+e69c25cf38a53d0cf64c@syzkaller.appspotmail.com>
To: gregkh@linuxfoundation.org, hdanton@sina.com, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

syzbot has found a reproducer for the following issue on:

HEAD commit:    2b763db0c276 Add linux-next specific files for 20260703
git tree:       linux-next
console output: https://syzkaller.appspot.com/x/log.txt?x=11f96ffe580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=bc069df559a09463
dashboard link: https://syzkaller.appspot.com/bug?extid=e69c25cf38a53d0cf64c
compiler:       Debian clang version 22.1.8 (++20260613092233+e80beda6e255-1~exp1~20260613092250.77), Debian LLD 22.1.8
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=14a9dffe580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=103d8b1c580000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/48dad133dd60/disk-2b763db0.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/df274fd385d1/vmlinux-2b763db0.xz
kernel image: https://storage.googleapis.com/syzbot-assets/f3a54c0c16ec/bzImage-2b763db0.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+e69c25cf38a53d0cf64c@syzkaller.appspotmail.com

list_add double add: new=ffff88801bf49818, prev=ffff88801bf49818, next=ffff888040cc4078.
------------[ cut here ]------------
kernel BUG at lib/list_debug.c:37!
Oops: invalid opcode: 0000 [#1] SMP KASAN PTI
CPU: 1 UID: 0 PID: 7510 Comm: syz.2.757 Not tainted syzkaller #0 PREEMPT_{RT,(full)} 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 05/09/2026
RIP: 0010:__list_add_valid_or_report+0xa5/0x130 lib/list_debug.c:35
Code: 74 12 b0 01 5b 41 5c 41 5d 41 5e 41 5f 5d e9 02 d7 79 06 cc 48 c7 c7 60 9c cb 8b 4c 89 fe 4c 89 f2 48 89 d9 e8 6c a0 50 fc 90 <0f> 0b 48 c7 c7 40 9a cb 8b e8 5d a0 50 fc 90 0f 0b 48 c7 c7 00 9b
RSP: 0018:ffffc90005a3f320 EFLAGS: 00010246
RAX: 0000000000000058 RBX: ffff888040cc4078 RCX: aa19a771139add00
RDX: 0000000000000000 RSI: 0000000000000000 RDI: 0000000000000000
RBP: 1ffff11008198810 R08: 0000000000000000 R09: 0000000000000000
R10: dffffc0000000000 R11: fffff52000b47e15 R12: 1ffff110037e9303
R13: dffffc0000000000 R14: ffff88801bf49818 R15: ffff88801bf49818
FS:  00007fadf887e6c0(0000) GS:ffff888125b00000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007f0f79a3b540 CR3: 000000003c4c0000 CR4: 00000000003526f0
Call Trace:
 <TASK>
 __list_add_valid include/linux/list.h:96 [inline]
 __list_add include/linux/list.h:158 [inline]
 list_add_tail include/linux/list.h:191 [inline]
 usb_hcd_link_urb_to_ep+0x1d2/0x330 drivers/usb/core/hcd.c:1154
 dummy_urb_enqueue+0x299/0x760 drivers/usb/gadget/udc/dummy_hcd.c:1292
 usb_hcd_submit_urb+0x322/0x1b40 drivers/usb/core/hcd.c:1542
 cm109_submit_buzz_toggle drivers/input/misc/cm109.c:351 [inline]
 cm109_toggle_buzzer_async drivers/input/misc/cm109.c:484 [inline]
 cm109_input_ev+0x1d1/0x3b0 drivers/input/misc/cm109.c:615
 input_event_dispose+0x80/0x6b0 drivers/input/input.c:322
 input_inject_event+0x1fa/0x310 drivers/input/input.c:424
 kd_sound_helper+0x101/0x210 drivers/tty/vt/keyboard.c:257
 input_handler_for_each_handle+0x101/0x1c0 drivers/input/input.c:2540
 kd_mksound+0x96/0x130 drivers/tty/vt/keyboard.c:281
 handle_ascii drivers/tty/vt/vt.c:2382 [inline]
 do_con_trol drivers/tty/vt/vt.c:2699 [inline]
 do_con_write+0x2f5a/0x5540 drivers/tty/vt/vt.c:3325
 con_write+0x31/0x2e0 drivers/tty/vt/vt.c:3661
 process_output_block drivers/tty/n_tty.c:557 [inline]
 n_tty_write+0xd4f/0x11e0 drivers/tty/n_tty.c:2366
 iterate_tty_write drivers/tty/tty_io.c:1006 [inline]
 file_tty_write+0x50b/0x980 drivers/tty/tty_io.c:1081
 new_sync_write fs/read_write.c:595 [inline]
 vfs_write+0x61e/0xbb0 fs/read_write.c:687
 ksys_write+0x156/0x270 fs/read_write.c:739
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0x174/0x580 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7fadf921de59
Code: ff c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 44 00 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 e8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007fadf887e028 EFLAGS: 00000246 ORIG_RAX: 0000000000000001
RAX: ffffffffffffffda RBX: 00007fadf94a5fa0 RCX: 00007fadf921de59
RDX: 000000000000045c RSI: 00002000000004c0 RDI: 0000000000000005
RBP: 00007fadf92b3e6f R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000000
R13: 00007fadf94a6038 R14: 00007fadf94a5fa0 R15: 00007ffcbb190028
 </TASK>
Modules linked in:
---[ end trace 0000000000000000 ]---
RIP: 0010:__list_add_valid_or_report+0xa5/0x130 lib/list_debug.c:35
Code: 74 12 b0 01 5b 41 5c 41 5d 41 5e 41 5f 5d e9 02 d7 79 06 cc 48 c7 c7 60 9c cb 8b 4c 89 fe 4c 89 f2 48 89 d9 e8 6c a0 50 fc 90 <0f> 0b 48 c7 c7 40 9a cb 8b e8 5d a0 50 fc 90 0f 0b 48 c7 c7 00 9b
RSP: 0018:ffffc90005a3f320 EFLAGS: 00010246
RAX: 0000000000000058 RBX: ffff888040cc4078 RCX: aa19a771139add00
RDX: 0000000000000000 RSI: 0000000000000000 RDI: 0000000000000000
RBP: 1ffff11008198810 R08: 0000000000000000 R09: 0000000000000000
R10: dffffc0000000000 R11: fffff52000b47e15 R12: 1ffff110037e9303
R13: dffffc0000000000 R14: ffff88801bf49818 R15: ffff88801bf49818
FS:  00007fadf887e6c0(0000) GS:ffff888125b00000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007f0f79a3b540 CR3: 000000003c4c0000 CR4: 00000000003526f0


---
If you want syzbot to run the reproducer, reply with:
#syz test: git://repo/address.git branch-or-commit-hash
If you attach or paste a git patch, syzbot will apply it before testing.

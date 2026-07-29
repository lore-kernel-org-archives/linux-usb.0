Received: from mail-oa1-f77.google.com (mail-oa1-f77.google.com [209.85.160.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72A5815B971
	for <linux-usb@vger.kernel.org>; Wed, 29 Jul 2026 00:10:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.77
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785283832; cv=none; b=K1ezXWGBYDc7QMbVLO1NXCpPvDqt5h1HyppDA2e3IYa9y9iarEbyxPElQcHFSTbWBAr1MAOmrjQh3q0KWbJYNwwvjL00RYbo9AXNRpCmQePMpeClUzaqdzQAv1yiseTB9v9tS5oULSbTZHHqtQotqtuIMGHTGyleoaahFOtmjxo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785283832; c=relaxed/simple;
	bh=QmnRubNtFQg2/MaA5JJQVh29izwaxFY8PheA1dEQtzg=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=ZeOllDGxSCTIJA6UnPBmNl9NZAB+BJqQlTQf7YTGz0V3V35qtVOg146V+DGVCpX+UCZrz5kWrsJDh1fgXOM/UqXmUj6fRv3fi6P6Dc8rN7Qr034sGPfD+m9C55crjc0K843zawMxsUVBr1EAeUjB20bc8C1ZxuLPO1QOd9hSXYE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.160.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oa1-f77.google.com with SMTP id 586e51a60fabf-43cd2d12617so428902fac.3
        for <linux-usb@vger.kernel.org>; Tue, 28 Jul 2026 17:10:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785283829; x=1785888629;
        h=content-type:to:from:subject:message-id:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HywYFIIXRq4VW6PasEwPpZhfIQTx4oj8/5BY9Nnrnt0=;
        b=n7IVjkbbsuA2x86nPeTZuxpUkzEzIYxGr6vOrVPAb/qo4v4e00PaawPeRowKO3k/4J
         0Z7+DKQqvZP2gnzRMUNz+wSsMSwIqY+XmLETOHW234kPaJw15nCvo93ptGOPoZtHFwG5
         OwXbf/AXE5CQp2kOaKF6VLMYiInVw9a+9f43jXo3WPubBrwUmjcPn+KtObNMQIsiMRSV
         u+WJFkncEsqv7m3I3zPLq1Ow3JaSzN2I/HMiRbiBvczy7wu06r9V4nSIsk/bobHzqghJ
         7xjoDBOTlwu3U1A2CnxlNfcSiQdPyiyWcS9I9FBCZC/TyRVrwNkU/GVYnltMcOnU7xmS
         9JeQ==
X-Forwarded-Encrypted: i=1; AHgh+RoroYSH5XVAjbeSpen0iIpPX70oEfbzqEkygzA42o+8KR89bjTQ4rSfLoaszCm5bSqodPdq/1Wc2fs=@vger.kernel.org
X-Gm-Message-State: AOJu0YwZRuiM9PCDnq3wEIGsxEN1HUH1TW7REZVPORb39UbXGxlyDcrR
	QNCNvRTIQ6lhOO3ojbvFgMj2aG50Q5LR+w0wRnDUU8C53RyZbtdwHTUvjMkf3elZyRM1g4mJCz0
	pzGu9YPW3hQW12cd0uRp9gGWlbsm8Y890wHRMypgkVus5wXarvFrFz8CI4dY=
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:1527:b0:4a3:2bd1:5216 with SMTP id
 5614622812f47-4ad5ba77288mr2566079b6e.43.1785283829229; Tue, 28 Jul 2026
 17:10:29 -0700 (PDT)
Date: Tue, 28 Jul 2026 17:10:29 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6a6944f5.e3659fcc.2a40b8.0021.GAE@google.com>
Subject: [syzbot] [usb?] WARNING in dummy_free_request (2)
From: syzbot <syzbot+c73e1942197af9f54ca3@syzkaller.appspotmail.com>
To: gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    cc2b5f627e8c Add linux-next specific files for 20260714
git tree:       linux-next
console output: https://syzkaller.appspot.com/x/log.txt?x=159922a9580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=2290ccbf984c524f
dashboard link: https://syzkaller.appspot.com/bug?extid=c73e1942197af9f54ca3
compiler:       Debian clang version 22.1.8 (++20260613092233+e80beda6e255-1~exp1~20260613092250.77), Debian LLD 22.1.8

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/6836f8efb1da/disk-cc2b5f62.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/0109d3477cc7/vmlinux-cc2b5f62.xz
kernel image: https://storage.googleapis.com/syzbot-assets/c2e49e350bbf/bzImage-cc2b5f62.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+c73e1942197af9f54ca3@syzkaller.appspotmail.com

configfs-gadget.g1 gadget.0: uvc: uvc_function_bind()
configfs-gadget.g1 gadget.0: uvc: Unable to allocate streaming EP
------------[ cut here ]------------
!list_empty(&req->queue)
WARNING: drivers/usb/gadget/udc/dummy_hcd.c:691 at dummy_free_request+0x6f/0x80 drivers/usb/gadget/udc/dummy_hcd.c:691, CPU#1: syz.3.795/7609
Modules linked in:
CPU: 1 UID: 0 PID: 7609 Comm: syz.3.795 Tainted: G             L      syzkaller #0 PREEMPT_{RT,(full)} 
Tainted: [L]=SOFTLOCKUP
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 07/16/2026
RIP: 0010:dummy_free_request+0x6f/0x80 drivers/usb/gadget/udc/dummy_hcd.c:691
Code: 75 22 e8 14 e0 8b fa 48 89 df 5b 41 5e e9 89 5c ec fa e8 04 e0 8b fa 90 0f 0b 90 5b 41 5e c3 cc cc cc cc cc e8 f2 df 8b fa 90 <0f> 0b 90 eb d8 66 66 66 2e 0f 1f 84 00 00 00 00 00 90 90 90 90 90
RSP: 0018:ffffc900087cf730 EFLAGS: 00010287
RAX: ffffffff8739c3be RBX: ffff88803a585ff0 RCX: 0000000000080000
RDX: ffffc9000759a000 RSI: 00000000000009d6 RDI: 00000000000009d7
RBP: 00000000ffffffea R08: 0000000000000000 R09: 0000000000000000
R10: dffffc0000000000 R11: ffffffff8739c350 R12: ffff88805f2f0520
R13: ffff888021b808d8 R14: ffff8880295e00a8 R15: ffff8880295e0c98
FS:  00007f8a2e8b66c0(0000) GS:ffff888125af2000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007fc44f5ab050 CR3: 0000000024f34000 CR4: 00000000003526f0
Call Trace:
 <TASK>
 uvc_function_bind+0xe5d/0x15a0 drivers/usb/gadget/function/f_uvc.c:893
 usb_add_function+0x290/0x930 drivers/usb/gadget/composite.c:333
 configfs_composite_bind+0xde0/0x1410 drivers/usb/gadget/configfs.c:1802
 gadget_bind_driver+0x2ca/0x9e0 drivers/usb/gadget/udc/core.c:1662
 call_driver_probe drivers/base/dd.c:-1 [inline]
 really_probe+0x254/0xae0 drivers/base/dd.c:706
 __driver_probe_device+0x1e8/0x360 drivers/base/dd.c:868
 driver_probe_device+0x4f/0x240 drivers/base/dd.c:898
 __driver_attach+0x339/0x600 drivers/base/dd.c:1292
 bus_for_each_dev+0x23e/0x2c0 drivers/base/bus.c:383
 bus_add_driver+0x348/0x670 drivers/base/bus.c:763
 driver_register+0x23a/0x320 drivers/base/driver.c:174
 usb_gadget_register_driver_owner+0xf9/0x270 drivers/usb/gadget/udc/core.c:1752
 gadget_dev_desc_UDC_store+0x1c9/0x2f0 drivers/usb/gadget/configfs.c:300
 flush_write_buffer fs/configfs/file.c:207 [inline]
 configfs_write_iter+0x33a/0x430 fs/configfs/file.c:229
 new_sync_write fs/read_write.c:595 [inline]
 vfs_write+0x61e/0xbb0 fs/read_write.c:687
 ksys_write+0x156/0x270 fs/read_write.c:739
 do_syscall_x64 arch/x86/entry/syscall_64.c:61 [inline]
 do_syscall_64+0x17b/0x530 arch/x86/entry/syscall_64.c:85
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f8a3065de99
Code: ff c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 44 00 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 e8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007f8a2e8b6028 EFLAGS: 00000246 ORIG_RAX: 0000000000000001
RAX: ffffffffffffffda RBX: 00007f8a308e5fa0 RCX: 00007f8a3065de99
RDX: 000000000000000b RSI: 0000200000000880 RDI: 0000000000000003
RBP: 00007f8a306f3eaf R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000000
R13: 00007f8a308e6038 R14: 00007f8a308e5fa0 R15: 00007ffcfa6f54e8
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

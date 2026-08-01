Received: from mail-oi1-f206.google.com (mail-oi1-f206.google.com [209.85.167.206])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBDCD37F323
	for <linux-usb@vger.kernel.org>; Sat,  1 Aug 2026 00:44:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.206
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785545084; cv=none; b=R3aKh31jK1BD5l08nbKFLgGauX1pgrKTHsFyvgFhqvTA3kMe3/+i41Xms4Sovn71tKlhNWfO9TcToj2E0DBBHtuIxac2vdqKh7/1Ec7/D3CYnWMYI/vNGwHzrSWWtDDk2H7bhrUT4aHdhLFchigBHKK6Rb0Q9CdhfopljZ4MNqE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785545084; c=relaxed/simple;
	bh=5oaD68Ll0z65kLg/8s7cyrtvJaWmHwKg9bkzwAu6w3I=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=Ey18HuMo/KGDy3mkA3SsCVq4UGQ4eUsPt7fumU42bpIQu6/bbGdqhmyUZQOrf2XayftbpGdfykt9FPNDm3LwMMryqKplgwDtbIWHIjQ2amd/HXPTg8b7dr3exCQECzyTeqpw+8unBUMqUrWqaM7c/ZgG8uAzW4vyHbdMYpGTO1c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.206
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f206.google.com with SMTP id 5614622812f47-4a41e3d6fe9so2031645b6e.2
        for <linux-usb@vger.kernel.org>; Fri, 31 Jul 2026 17:44:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785545080; x=1786149880;
        h=content-type:to:from:subject:message-id:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xTh98wbGF2N5n4nc7qOj6jSVQhzkMR5+UHhLoSPYTWk=;
        b=N+MdaGAl54QaAXCNKPbA+U5HVtMKFQHPxekz/5UrVUMOsuEMkAo7FkAlg5FvFtEXNd
         ce09xrA83mODUauIHxvDoN8drVWxTZfYaT9xmCb9HPbko4+yrIMrJ4pLkMus2ZUniILc
         bUXD79ph8TQu8a1sCi/FAKlN0vVzdXOXs2EgMqUx9pAEa5Bv2XmMhI0ip6nq0+YxFV2x
         FcGsTr+nw8mMImzfGRn960j/Pa9/PbTxAmHl6MMu8oeEeO2TmACjeyrpqphhZFcnkVSZ
         6cms/p7b4kXbvOKUd9AkKQMh7AKqS6lNxrrLawBZt+rimy1f255CPeeuWUXTGRm8+4Fl
         1myQ==
X-Forwarded-Encrypted: i=1; AHgh+Rpy8nlE8awJGxTv+RQ/XmfrO/gLIgVlTrEW9CEWQ8XbxATRxVfQSOvbG6777GOdI6lmVeZglLwEKAg=@vger.kernel.org
X-Gm-Message-State: AOJu0YxdGU7Ob1cJKDqLzfUGGdeYj/8DqZ51YoOhhYGBBzswY/1Hd+xn
	y3B/eFRY3+X7d57CP19qT6ZUdbxutTcgAlDLV0kilRBs4hKnSaGlhSPH0RcIjYlvGJU6Y9ZH9O5
	PMbrjKUAvHQV2+ivXaMyYSlWY6+i5vPAI0QqcOkdYdCUgRpMWoqRE9flcI30=
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:19aa:b0:4a4:c12:ee68 with SMTP id
 5614622812f47-4af5e1b213fmr3899023b6e.10.1785545080361; Fri, 31 Jul 2026
 17:44:40 -0700 (PDT)
Date: Fri, 31 Jul 2026 17:44:40 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6a6d4178.13bfb6d0.1ecdd5.0256.GAE@google.com>
Subject: [syzbot] [usb?] UBSAN: array-index-out-of-bounds in uea_bind
From: syzbot <syzbot+92f5bf49bf4ac75223ca@syzkaller.appspotmail.com>
To: 3chas3@gmail.com, castet.matthieu@free.fr, gregkh@linuxfoundation.org, 
	linux-atm-general@lists.sourceforge.net, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org, netdev@vger.kernel.org, stf_xl@wp.pl, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    3708dd948844 Merge tag 'pm-7.2-rc6' of git://git.kernel.or..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=14ff71b9580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=145fa60d73086782
dashboard link: https://syzkaller.appspot.com/bug?extid=92f5bf49bf4ac75223ca
compiler:       gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=11a0a5b9580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=12ff71b9580000

Downloadable assets:
disk image (non-bootable): https://storage.googleapis.com/syzbot-assets/d900f083ada3/non_bootable_disk-3708dd94.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/57f69e2a6e3b/vmlinux-3708dd94.xz
kernel image: https://storage.googleapis.com/syzbot-assets/3511d4246fb6/bzImage-3708dd94.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+92f5bf49bf4ac75223ca@syzkaller.appspotmail.com

usb 5-1: reset high-speed USB device number 6 using dummy_hcd
usb 5-1: device descriptor read/64, error -71
usb 5-1: reset high-speed USB device number 6 using dummy_hcd
------------[ cut here ]------------
UBSAN: array-index-out-of-bounds in drivers/usb/atm/ueagle-atm.c:2466:28
index 4 is out of range for type 'bool [4]'
CPU: 2 UID: 0 PID: 847 Comm: kworker/2:2 Not tainted syzkaller #0 PREEMPT(full) 
Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.3-debian-1.16.3-2 04/01/2014
Workqueue: usb_hub_wq hub_event
Call Trace:
 <TASK>
 __dump_stack lib/dump_stack.c:94 [inline]
 dump_stack_lvl+0x100/0x190 lib/dump_stack.c:120
 ubsan_epilogue+0xa/0x30 lib/ubsan.c:233
 __ubsan_handle_out_of_bounds+0xcc/0xf0 lib/ubsan.c:455
 uea_bind+0x1014/0x1380 drivers/usb/atm/ueagle-atm.c:2466
 usbatm_usb_probe+0x378/0x1b50 drivers/usb/atm/usbatm.c:1058
 uea_probe+0x194/0x570 drivers/usb/atm/ueagle-atm.c:2597
 usb_probe_interface+0x303/0x8f0 drivers/usb/core/driver.c:396
 call_driver_probe drivers/base/dd.c:628 [inline]
 really_probe+0x241/0xa60 drivers/base/dd.c:706
 __driver_probe_device+0x20e/0x450 drivers/base/dd.c:868
 driver_probe_device+0x4a/0x140 drivers/base/dd.c:898
 __device_attach_driver+0x1df/0x320 drivers/base/dd.c:1026
 bus_for_each_drv+0x159/0x1e0 drivers/base/bus.c:500
 __device_attach+0x1e4/0x4d0 drivers/base/dd.c:1098
 device_initial_probe+0xaf/0xd0 drivers/base/dd.c:1153
 bus_probe_device+0x64/0x160 drivers/base/bus.c:620
 device_add+0x121d/0x1970 drivers/base/core.c:3772
 usb_set_configuration+0xd97/0x1c60 drivers/usb/core/message.c:2268
 usb_generic_driver_probe+0xa1/0xe0 drivers/usb/core/generic.c:250
 usb_probe_device+0xef/0x400 drivers/usb/core/driver.c:291
 call_driver_probe drivers/base/dd.c:628 [inline]
 really_probe+0x241/0xa60 drivers/base/dd.c:706
 __driver_probe_device+0x20e/0x450 drivers/base/dd.c:868
 driver_probe_device+0x4a/0x140 drivers/base/dd.c:898
 __device_attach_driver+0x1df/0x320 drivers/base/dd.c:1026
 bus_for_each_drv+0x159/0x1e0 drivers/base/bus.c:500
 __device_attach+0x1e4/0x4d0 drivers/base/dd.c:1098
 device_initial_probe+0xaf/0xd0 drivers/base/dd.c:1153
 bus_probe_device+0x64/0x160 drivers/base/bus.c:620
 device_add+0x121d/0x1970 drivers/base/core.c:3772
 usb_new_device.cold+0x685/0x115c drivers/usb/core/hub.c:2695
 hub_port_connect drivers/usb/core/hub.c:5567 [inline]
 hub_port_connect_change drivers/usb/core/hub.c:5707 [inline]
 port_event drivers/usb/core/hub.c:5871 [inline]
 hub_event+0x30a3/0x4a60 drivers/usb/core/hub.c:5953
 process_one_work+0xa23/0x1940 kernel/workqueue.c:3322
 process_scheduled_works kernel/workqueue.c:3405 [inline]
 worker_thread+0x5ef/0xe50 kernel/workqueue.c:3486
 kthread+0x370/0x450 kernel/kthread.c:436
 ret_from_fork+0x72b/0xd50 arch/x86/kernel/process.c:158
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245
 </TASK>
---[ end trace ]---


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

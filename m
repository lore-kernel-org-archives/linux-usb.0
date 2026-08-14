Received: from mail-oa1-f77.google.com (mail-oa1-f77.google.com [209.85.160.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDB043A1C9
	for <linux-usb@vger.kernel.org>; Fri, 14 Aug 2026 00:04:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.77
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786665882; cv=none; b=r5k50c8FgAKprjfwu7FIWbx2obDH7zXZ3FwLeL52ukK71a6l49enXyBCkStMJBiv9vCpmTeUiC0lifvFQSPGDvw25uOv7waYaqVBrlpd90fJY8iDysYpH9VlgBBV4+WL9ZygGQe4B5eYNMPk3yJIke2bGTf//uZIHfBh/RTtwBc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786665882; c=relaxed/simple;
	bh=AWgJlzuaNqYabE+LZLuTCOJXI4CVBdw969o5zKtx7M8=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=UERXoOJMxGBIAvrL7z43WOO/Jz3SEvHQaENmxMkytkry9Bn3gb9DdCe/JgFaWc5BWQxg3Mj/BnPYWRkh45xWiLAZtSf6K8pqZc2JnU4zag3eEcFucbA/ufPUwYyCPBoXYDGrAf9ouFCuu5Q9gYS1bTqSELzy8qyYK2eeBvhPuM8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.160.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oa1-f77.google.com with SMTP id 586e51a60fabf-458326d2d9aso458376fac.2
        for <linux-usb@vger.kernel.org>; Thu, 13 Aug 2026 17:04:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786665879; x=1787270679;
        h=content-type:to:from:subject:message-id:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DIM10pDYGpRf05PSZc9mcWslW14q0ON9s+otNjWiSFk=;
        b=G9Xq7Ji3uk89nj71r4I5XJDUhHnnsnvbu05+ayGJ/JicNmvrhcBBSrBYO++r0+92hb
         bgQUy+f3CN0sjtl6Hkf8EcLL1t4VgKKBk9q6Fw6l3ZoIM/OA/2GdBnJOuFS4yu/jN5ms
         VQeJO5v+2cLZRXaCtkFPY1iTKBY9WQQyilUrWQdeqmL6KIT2f7XteHOaLo+yMlXZtxF/
         4SaRHoA43x6pDj0qbasjbzG2nlUCPF/B6tcZd+i1PkASZJ28vXQ7BW+tgN3+iZ4yCqT8
         g0KtqFeMUUdqbFeH11w9fltTIW+UCIoia5Z4Lssk0DChZESvksDLcQZaH7Ut76B9otxv
         5x9A==
X-Forwarded-Encrypted: i=1; AHgh+RpvFrIJeGBO1vhDe9qQ+sHxTP9iUcQuXKOSAuwqUfSxym5L9938bJilC36TfqchFDFpjYyaKk2ochc=@vger.kernel.org
X-Gm-Message-State: AOJu0YwLvNAHoG41s/sT0IyETTqCNFH8JdRNekjTg9dXX8gIA9CaSvY1
	Uuavs0rtjH7Wdxdw9wr31GtIKsineHi3mWA9loTU+qHncDuZWXyJpPPgnWVGf00v3VtqAAxGIDk
	ETPKjxY5BBG+Y0AYquWDlfBPy/JPndE1vyc/vV0w+k4oM7QHiJLeYfmKulLI=
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:1f07:b0:6b0:b187:d16d with SMTP id
 006d021491bc7-6b0d62583b1mr1978235eaf.20.1786665878851; Thu, 13 Aug 2026
 17:04:38 -0700 (PDT)
Date: Thu, 13 Aug 2026 17:04:38 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6a7e5b96.c15719c5.d558b.0117.GAE@google.com>
Subject: [syzbot] [kernel?] WARNING in device_remove
From: syzbot <syzbot+7371a1a749c42016f046@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    5d5fd841c346 Merge 7.2-rc5 into usb-next
git tree:       https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
console output: https://syzkaller.appspot.com/x/log.txt?x=12d922c6580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=6ec4d592e55f7960
dashboard link: https://syzkaller.appspot.com/bug?extid=7371a1a749c42016f046
compiler:       gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/2ed536ae4daf/disk-5d5fd841.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/ab40098ccbf1/vmlinux-5d5fd841.xz
kernel image: https://storage.googleapis.com/syzbot-assets/66d5c395f47c/bzImage-5d5fd841.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+7371a1a749c42016f046@syzkaller.appspotmail.com

usb 7-1: USB disconnect, device number 4
------------[ cut here ]------------
!work->func
WARNING: kernel/workqueue.c:4335 at __flush_work+0xa5d/0xcb0 kernel/workqueue.c:4335, CPU#0: kworker/0:6/5370
Modules linked in:
CPU: 0 UID: 0 PID: 5370 Comm: kworker/0:6 Not tainted syzkaller #0 PREEMPT(lazy) 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 07/24/2026
Workqueue: usb_hub_wq hub_event

RIP: 0010:__flush_work+0xa5d/0xcb0 kernel/workqueue.c:4335
Code: 35 00 00 00 00 e8 13 2c 12 00 e8 6e 8d 1b 00 c6 44 24 0f 00 e9 91 fd ff ff e8 0f 00 36 00 90 0f 0b 90 eb eb e8 04 00 36 00 90 <0f> 0b 90 eb e0 e8 f9 ff 35 00 e8 f4 ff 35 00 48 8b 3c 24 e8 6b b8
RSP: 0018:ffffc90004097228 EFLAGS: 00010287
RAX: 0000000000021e96 RBX: dffffc0000000000 RCX: ffffc90011b77000
RDX: 0000000000100000 RSI: ffffffff817e043c RDI: ffff888118583c00
R10: 0000000000000001 R11: 0000000000000000 R12: 0000000000000000
R13: ffff88811a5c88f0 R14: 0000000000000001 R15: 0000000000000001
FS:  0000000000000000(0000) GS:ffff888268636000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 000000110c322071 CR3: 000000013af66000 CR4: 00000000003506f0
Call Trace:
 <TASK>
 __cancel_work_sync kernel/workqueue.c:4494 [inline]
 cancel_work_sync+0xd1/0xf0 kernel/workqueue.c:4531
 device_remove+0xcb/0x180 drivers/base/dd.c:616
 __device_release_driver drivers/base/dd.c:1349 [inline]
 device_release_driver_internal+0x44e/0x620 drivers/base/dd.c:1372
 bus_remove_device+0x2bc/0x560 drivers/base/bus.c:664
 device_del+0x376/0x9b0 drivers/base/core.c:3961
 hid_remove_device drivers/hid/hid-core.c:3071 [inline]
 hid_destroy_device+0x19c/0x240 drivers/hid/hid-core.c:3093
 usbhid_disconnect+0xa0/0xe0 drivers/hid/usbhid/hid-core.c:1479
 device_remove drivers/base/dd.c:618 [inline]
 device_remove+0x12a/0x180 drivers/base/dd.c:610
 __device_release_driver drivers/base/dd.c:1349 [inline]
 device_release_driver_internal+0x44e/0x620 drivers/base/dd.c:1372
 bus_remove_device+0x2bc/0x560 drivers/base/bus.c:664
 device_del+0x376/0x9b0 drivers/base/core.c:3961
 usb_disable_device+0x367/0x810 drivers/usb/core/message.c:1478
 hub_port_connect drivers/usb/core/hub.c:5412 [inline]
 hub_port_connect_change drivers/usb/core/hub.c:5712 [inline]
 port_event drivers/usb/core/hub.c:5876 [inline]
 hub_event+0x1d0c/0x4af0 drivers/usb/core/hub.c:5958
 process_one_work+0xa23/0x1940 kernel/workqueue.c:3322
 process_scheduled_works kernel/workqueue.c:3405 [inline]
 worker_thread+0x5ef/0xe50 kernel/workqueue.c:3486
 kthread+0x370/0x450 kernel/kthread.c:436
 ret_from_fork+0x69a/0xc80 arch/x86/kernel/process.c:158
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245
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

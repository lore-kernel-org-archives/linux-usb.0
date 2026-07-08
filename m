Received: from mail-oi1-f206.google.com (mail-oi1-f206.google.com [209.85.167.206])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A595540BCDE
	for <linux-usb@vger.kernel.org>; Wed,  8 Jul 2026 14:11:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.206
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783519891; cv=none; b=rg0SK8jzp+VeuC3wxy8EBQ8D3c7JbKrVPQhPMzqqomOEgdesnYd//HBWAhZxD7N+Bzbj7LRM8X7xOgywNt+ghsY8DxEU7ooImaxjgpDaW27TSeEz+YPoKGC1aFiYmU1oHEn4VvGUFVflT+KaKS7NNQTxWOMiqx9Jd6xzv0SRnVE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783519891; c=relaxed/simple;
	bh=+7C7np2bvzfHKHSBoOdMNA3KvnuEmxCpForLSNF0Jqo=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=gXeJnw+N27+rRVLGQgiXi/981bTP4a0u+rM1iBoFuOWNxKl+qGU6awCDZCsVna7MtZAuJuxbar0r+bDFzoX7iiWaRDRKl03dSeWd1Y/35bRR+i8/QxmAs8aObej9+rJy4iwSf7lGrQNUrieoIXUJIs2FXfZG6W6K8Y8a9zfo1nc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.206
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f206.google.com with SMTP id 5614622812f47-49226201eb8so544523b6e.1
        for <linux-usb@vger.kernel.org>; Wed, 08 Jul 2026 07:11:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783519888; x=1784124688;
        h=content-type:to:from:subject:message-id:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=U9Xofox6Gj+24irZTw3dgn6Pa41AaL0ee+c7iWLXraI=;
        b=F1PL5SIRIrII5zcxOPnDkxBi3pvq0MZOq7DKEcFnF02XKGgLn7IR1V9Ah4pNO3IVzO
         xcDVbFDp7t2/7W+JkTO4EoqI6DfLmNynWAMkS9Agef/Oc49cABZ40H7RzI/mWfZ22qmp
         4adOkJIX+xOdlpqN+Yi50EEybiJPnpqROAd6lfbveD06CNydlK/28HP8OnmXZPRGbinZ
         zV8UEkrCWlzP2nJZqvLxmdUGqrqD1tszQieZ8K9tv1hRwS4Kn+EFCaUSlu39YgoiaBv+
         zEELDEXoXuxMbV4DyjTiX4cTAzGcHSFj2hYbPTjpMyjVd92utI0lsEAbIGtd+575SgLs
         8CQQ==
X-Forwarded-Encrypted: i=1; AFNElJ8Nei4OrLQNz8+VFDFU+f/NX0ZEWu2d1OEmP+yahD2D8qJBMbDfSNDIu1UXo2+HsNmdB12uqdsPD04=@vger.kernel.org
X-Gm-Message-State: AOJu0YyG4BETaQ/unMY1QRYapXPQlwQ8UH2bZNBa0X551HOA+tgw7X+P
	trkrokOTSJif0JW1PPHXONOWB2nKOU6B2xLsKiaQ86k1VnZgxR3NUXzHipuZHf93ZaPbaZ9CjxM
	gN/YLRVmkc32WH4hCmbDfm0rAtBATwtTWwI9F2KUunXaCgSTF1K76uNJiCDQ=
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:3384:b0:495:ebd3:ea52 with SMTP id
 5614622812f47-4a201cf888emr2227805b6e.2.1783519888490; Wed, 08 Jul 2026
 07:11:28 -0700 (PDT)
Date: Wed, 08 Jul 2026 07:11:28 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6a4e5a90.57639fcc.86d58.0015.GAE@google.com>
Subject: [syzbot] [media?] WARNING in smsusb_stop_streaming (2)
From: syzbot <syzbot+0927fcf047387215ed98@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-usb@vger.kernel.org, mchehab@kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    dc59e4fea9d8 Linux 7.2-rc1
git tree:       https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
console output: https://syzkaller.appspot.com/x/log.txt?x=142f6e6e580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=6ec4d592e55f7960
dashboard link: https://syzkaller.appspot.com/bug?extid=0927fcf047387215ed98
compiler:       gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/8540695a33d7/disk-dc59e4fe.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/e144bb9cdc33/vmlinux-dc59e4fe.xz
kernel image: https://storage.googleapis.com/syzbot-assets/6e3051bf9301/bzImage-dc59e4fe.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+0927fcf047387215ed98@syzkaller.appspotmail.com

------------[ cut here ]------------
data & WORK_STRUCT_PWQ
WARNING: kernel/workqueue.c:4351 at __flush_work+0xb75/0xcb0 kernel/workqueue.c:4351, CPU#0: kworker/0:0/9
Modules linked in:
CPU: 0 UID: 0 PID: 9 Comm: kworker/0:0 Not tainted syzkaller #0 PREEMPT(lazy) 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 05/09/2026
Workqueue: usb_hub_wq hub_event
RIP: 0010:__flush_work+0xb75/0xcb0 kernel/workqueue.c:4351
Code: 01 e8 bf d3 11 00 e9 bf fd ff ff 48 8b 7c 24 18 e8 00 5f 9e 00 e9 f7 f6 ff ff e8 f6 5e 9e 00 e9 09 fa ff ff e8 fc 03 36 00 90 <0f> 0b 90 e9 38 fc ff ff e8 0e 5f 9e 00 e9 2d fb ff ff 48 89 df e8
RSP: 0018:ffffc9000009ebd0 EFLAGS: 00010246
RAX: 0000000000100000 RBX: ffff8881000ba405 RCX: ffffc9000fb4e000
RDX: 0000000000100000 RSI: ffffffff817e05c4 RDI: ffff888101afda00
RBP: 0000000000000004 R08: 0000000000000007 R09: 0000000000000000
R10: 0000000000000004 R11: 0000000000000000 R12: ffffffff817dff1a
R13: ffff88810006b000 R14: 0000000000000001 R15: 0000000000000000
FS:  0000000000000000(0000) GS:ffff888268640000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007f57d5145d58 CR3: 000000011669a000 CR4: 00000000003506f0
Call Trace:
 <TASK>
 __cancel_work_sync kernel/workqueue.c:4494 [inline]
 cancel_work_sync+0xd1/0xf0 kernel/workqueue.c:4531
 smsusb_stop_streaming+0xaa/0x210 drivers/media/usb/siano/smsusb.c:183
 smsusb_term_device+0x8f/0x200 drivers/media/usb/siano/smsusb.c:345
 smsusb_init_device+0xb4e/0xbb0 drivers/media/usb/siano/smsusb.c:497
 smsusb_probe+0xd7f/0xe1f drivers/media/usb/siano/smsusb.c:575
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
 hub_event+0x314d/0x4af0 drivers/usb/core/hub.c:5953
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

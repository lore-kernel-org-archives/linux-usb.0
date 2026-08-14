Received: from mail-ot1-f79.google.com (mail-ot1-f79.google.com [209.85.210.79])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BD4620ED
	for <linux-usb@vger.kernel.org>; Fri, 14 Aug 2026 00:03:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.79
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786665822; cv=none; b=pSdZRslJHFt2jg6Gr00/82SML4j13WRLKn9mGNFxVepgPQ+UUyG0JNy1VcM32r64ckpWaWEjSv8cIb3q0x13sm0RS5cuvmgPs6QWLYdlz/ACcWRvqx4fdDyHp4TY3cTodSZsIJrjsWiNk4jmNTkAodzncfeV8vtrk4F7taNjcBg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786665822; c=relaxed/simple;
	bh=N7GZ/d0JVUkA3gL7PSSKfNYe4ADsA4tZBQOxQu/lZFE=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=NKoR4Hs9SfZem9JW2BGKS7qX4mC9T5c9eabVcwJtf9wE2rI4qxxo1wylK0fjKOVMTtdf30jsdtp7uCPnI2poIijoKeCfdJGivmWZivBFdntEB1L6zhAR+bW6H1ZEwiSpbbP7RW39x9SJhMUOsPzPA87kCHVR8cm/PcvXju2H7lY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.210.79
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-ot1-f79.google.com with SMTP id 46e09a7af769-7e9dc0f5900so2611768a34.0
        for <linux-usb@vger.kernel.org>; Thu, 13 Aug 2026 17:03:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786665819; x=1787270619;
        h=content-type:to:from:subject:message-id:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xrZP8vXpT9dgebwfsMo7OAhyTMvUrsn22b/K6KCcLC8=;
        b=PhHapQp35dRpXTLzhliqrUH0ty/15JltoNwJVoczgO2JUVagUOnFdzV6blCaaph9Tj
         b1coe0+pjFTBE8uXlGNx96tKKmjbAcBJNIeJqNfP55vYBWV8GxuPhvWbIaIjf+YNNnec
         sEoPcMCO+9O6ABCYyzFLC7Jnen4O1HcC7BON+YKPkGSvEzL84kW69/z3uj4IX9mOWk3T
         xopR2p38Kivmp0ItK72Rew1dPcdzUZVccc5d6YIWAPro8nAzstZPlqvWMMHwPbeJHKbg
         sNVvyyiOhpOoNTIL80o50AoegyqpBVro6anqVwWx+v9nThNDQkk6qkUL514OI8wPqbPr
         doaw==
X-Forwarded-Encrypted: i=1; AHgh+RpbLQOjFcGKBVC3SLFAps9Gqco/K0gu4nEqUGmVn13EG+5GBUMiW8DH97eV//rxV+XJcTBbI7zSJJM=@vger.kernel.org
X-Gm-Message-State: AOJu0YzgK9CWQs9t7weucN4E2atZRizo7iomHku5LzkmGEXkVugIjpKU
	96hM8gOugWvKBIiB2y1YJcngVXmQG9y2AbmzJhOKyTswl37LHNTUzB/OU8rzg8S/f9CMGbeU22Q
	gZlU2/4p32uO3HeZp/jNGhy9nWSw02u5vVz8ICMj5tpJQDQL0WrsmnW51DlI=
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:1a10:b0:495:f697:92d9 with SMTP id
 5614622812f47-4b228093583mr6841152b6e.7.1786665819412; Thu, 13 Aug 2026
 17:03:39 -0700 (PDT)
Date: Thu, 13 Aug 2026 17:03:39 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6a7e5b5b.f70deec7.2acc03.000d.GAE@google.com>
Subject: [syzbot] [usb?] memory leak in gadget_bind (2)
From: syzbot <syzbot+d83b3c49738aea97c0e5@syzkaller.appspotmail.com>
To: gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    06cf61899d64 Merge tag 'x86-urgent-2026-08-08' of git://gi..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=16254079580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=6843f8fd2336602d
dashboard link: https://syzkaller.appspot.com/bug?extid=d83b3c49738aea97c0e5
compiler:       gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=11254079580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=1048ffb9580000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/e023ff6ad9bc/disk-06cf6189.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/ea49527ba5df/vmlinux-06cf6189.xz
kernel image: https://storage.googleapis.com/syzbot-assets/e3d6468d0490/bzImage-06cf6189.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+d83b3c49738aea97c0e5@syzkaller.appspotmail.com

BUG: memory leak
unreferenced object 0xffff88812a3ea300 (size 128):
  comm "syz.0.17", pid 6069, jiffies 4294943967
  hex dump (first 32 bytes):
    00 a3 3e 2a 81 88 ff ff 00 a3 3e 2a 81 88 ff ff  ..>*......>*....
    30 40 49 03 81 88 ff ff 00 00 00 00 00 00 00 00  0@I.............
  backtrace (crc a802af15):
    kmemleak_alloc_recursive include/linux/kmemleak.h:44 [inline]
    slab_post_alloc_hook mm/slub.c:4597 [inline]
    slab_alloc_node mm/slub.c:4917 [inline]
    __kmalloc_cache_noprof+0x356/0x440 mm/slub.c:5485
    _kmalloc_noprof include/linux/slab.h:988 [inline]
    _kzalloc_noprof include/linux/slab.h:1309 [inline]
    dummy_alloc_request+0x65/0xf0 drivers/usb/gadget/udc/dummy_hcd.c:693
    usb_ep_alloc_request+0x2e/0xd0 drivers/usb/gadget/udc/core.c:197
    gadget_bind+0x67/0x230 drivers/usb/gadget/legacy/raw_gadget.c:294
    gadget_bind_driver+0xed/0x390 drivers/usb/gadget/udc/core.c:1662
    call_driver_probe drivers/base/dd.c:628 [inline]
    really_probe+0x12f/0x3a0 drivers/base/dd.c:706
    __driver_probe_device+0xe9/0x1a0 drivers/base/dd.c:868
    driver_probe_device+0x28/0xf0 drivers/base/dd.c:898
    __driver_attach drivers/base/dd.c:1292 [inline]
    __driver_attach+0x10a/0x200 drivers/base/dd.c:1232
    bus_for_each_dev+0xb8/0x120 drivers/base/bus.c:383
    bus_add_driver+0x122/0x280 drivers/base/bus.c:763
    driver_register+0xb1/0x140 drivers/base/driver.c:174
    usb_gadget_register_driver_owner+0x69/0xe0 drivers/usb/gadget/udc/core.c:1752
    raw_ioctl_run drivers/usb/gadget/legacy/raw_gadget.c:596 [inline]
    raw_ioctl+0xad7/0x10c0 drivers/usb/gadget/legacy/raw_gadget.c:1307
    vfs_ioctl fs/ioctl.c:51 [inline]
    __do_sys_ioctl fs/ioctl.c:597 [inline]
    __se_sys_ioctl fs/ioctl.c:583 [inline]
    __x64_sys_ioctl+0xf4/0x140 fs/ioctl.c:583
    do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
    do_syscall_64+0xf8/0x610 arch/x86/entry/syscall_64.c:94

BUG: memory leak
unreferenced object 0xffff888127815480 (size 128):
  comm "syz.6.23", pid 6074, jiffies 4294944011
  hex dump (first 32 bytes):
    80 54 81 27 81 88 ff ff 80 54 81 27 81 88 ff ff  .T.'.....T.'....
    30 40 49 03 81 88 ff ff 00 00 00 00 00 00 00 00  0@I.............
  backtrace (crc fd9d10f8):
    kmemleak_alloc_recursive include/linux/kmemleak.h:44 [inline]
    slab_post_alloc_hook mm/slub.c:4597 [inline]
    slab_alloc_node mm/slub.c:4917 [inline]
    __kmalloc_cache_noprof+0x356/0x440 mm/slub.c:5485
    _kmalloc_noprof include/linux/slab.h:988 [inline]
    _kzalloc_noprof include/linux/slab.h:1309 [inline]
    dummy_alloc_request+0x65/0xf0 drivers/usb/gadget/udc/dummy_hcd.c:693
    usb_ep_alloc_request+0x2e/0xd0 drivers/usb/gadget/udc/core.c:197
    gadget_bind+0x67/0x230 drivers/usb/gadget/legacy/raw_gadget.c:294
    gadget_bind_driver+0xed/0x390 drivers/usb/gadget/udc/core.c:1662
    call_driver_probe drivers/base/dd.c:628 [inline]
    really_probe+0x12f/0x3a0 drivers/base/dd.c:706
    __driver_probe_device+0xe9/0x1a0 drivers/base/dd.c:868
    driver_probe_device+0x28/0xf0 drivers/base/dd.c:898
    __device_attach_driver+0x10f/0x170 drivers/base/dd.c:1026
    bus_for_each_drv+0xd2/0x130 drivers/base/bus.c:500
    __device_attach+0xf9/0x290 drivers/base/dd.c:1098
    device_initial_probe+0x6f/0x80 drivers/base/dd.c:1153
    bus_probe_device+0x3e/0xb0 drivers/base/bus.c:620
    device_add+0x99f/0xc80 drivers/base/core.c:3772
    usb_add_gadget+0x221/0x330 drivers/usb/gadget/udc/core.c:1461
    usb_add_gadget_udc_release drivers/usb/gadget/udc/core.c:1517 [inline]
    usb_add_gadget_udc+0x6e/0xb0 drivers/usb/gadget/udc/core.c:1564

BUG: memory leak
unreferenced object 0xffff88812a6d5600 (size 128):
  comm "syz.5.22", pid 6077, jiffies 4294944018
  hex dump (first 32 bytes):
    00 56 6d 2a 81 88 ff ff 00 56 6d 2a 81 88 ff ff  .Vm*.....Vm*....
    30 40 49 03 81 88 ff ff b8 4c 34 12 81 88 ff ff  0@I......L4.....
  backtrace (crc e492b8c):
    kmemleak_alloc_recursive include/linux/kmemleak.h:44 [inline]
    slab_post_alloc_hook mm/slub.c:4597 [inline]
    slab_alloc_node mm/slub.c:4917 [inline]
    __kmalloc_cache_noprof+0x356/0x440 mm/slub.c:5485
    _kmalloc_noprof include/linux/slab.h:988 [inline]
    _kzalloc_noprof include/linux/slab.h:1309 [inline]
    dummy_alloc_request+0x65/0xf0 drivers/usb/gadget/udc/dummy_hcd.c:693
    usb_ep_alloc_request+0x2e/0xd0 drivers/usb/gadget/udc/core.c:197
    gadget_bind+0x67/0x230 drivers/usb/gadget/legacy/raw_gadget.c:294
    gadget_bind_driver+0xed/0x390 drivers/usb/gadget/udc/core.c:1662
    call_driver_probe drivers/base/dd.c:628 [inline]
    really_probe+0x12f/0x3a0 drivers/base/dd.c:706
    __driver_probe_device+0xe9/0x1a0 drivers/base/dd.c:868
    driver_probe_device+0x28/0xf0 drivers/base/dd.c:898
    __device_attach_driver+0x10f/0x170 drivers/base/dd.c:1026
    bus_for_each_drv+0xd2/0x130 drivers/base/bus.c:500
    __device_attach+0xf9/0x290 drivers/base/dd.c:1098
    device_initial_probe+0x6f/0x80 drivers/base/dd.c:1153
    bus_probe_device+0x3e/0xb0 drivers/base/bus.c:620
    device_add+0x99f/0xc80 drivers/base/core.c:3772
    usb_add_gadget+0x221/0x330 drivers/usb/gadget/udc/core.c:1461
    usb_add_gadget_udc_release drivers/usb/gadget/udc/core.c:1517 [inline]
    usb_add_gadget_udc+0x6e/0xb0 drivers/usb/gadget/udc/core.c:1564

BUG: memory leak
unreferenced object 0xffff88812a6d5080 (size 128):
  comm "syz.0.26", pid 6083, jiffies 4294944267
  hex dump (first 32 bytes):
    80 50 6d 2a 81 88 ff ff 80 50 6d 2a 81 88 ff ff  .Pm*.....Pm*....
    30 40 49 03 81 88 ff ff 00 00 00 00 00 00 00 00  0@I.............
  backtrace (crc b6755c66):
    kmemleak_alloc_recursive include/linux/kmemleak.h:44 [inline]
    slab_post_alloc_hook mm/slub.c:4597 [inline]
    slab_alloc_node mm/slub.c:4917 [inline]
    __kmalloc_cache_noprof+0x356/0x440 mm/slub.c:5485
    _kmalloc_noprof include/linux/slab.h:988 [inline]
    _kzalloc_noprof include/linux/slab.h:1309 [inline]
    dummy_alloc_request+0x65/0xf0 drivers/usb/gadget/udc/dummy_hcd.c:693
    usb_ep_alloc_request+0x2e/0xd0 drivers/usb/gadget/udc/core.c:197
    gadget_bind+0x67/0x230 drivers/usb/gadget/legacy/raw_gadget.c:294
    gadget_bind_driver+0xed/0x390 drivers/usb/gadget/udc/core.c:1662
    call_driver_probe drivers/base/dd.c:628 [inline]
    really_probe+0x12f/0x3a0 drivers/base/dd.c:706
    __driver_probe_device+0xe9/0x1a0 drivers/base/dd.c:868
    driver_probe_device+0x28/0xf0 drivers/base/dd.c:898
    __driver_attach drivers/base/dd.c:1292 [inline]
    __driver_attach+0x10a/0x200 drivers/base/dd.c:1232
    bus_for_each_dev+0xb8/0x120 drivers/base/bus.c:383
    bus_add_driver+0x122/0x280 drivers/base/bus.c:763
    driver_register+0xb1/0x140 drivers/base/driver.c:174
    usb_gadget_register_driver_owner+0x69/0xe0 drivers/usb/gadget/udc/core.c:1752
    raw_ioctl_run drivers/usb/gadget/legacy/raw_gadget.c:596 [inline]
    raw_ioctl+0xad7/0x10c0 drivers/usb/gadget/legacy/raw_gadget.c:1307
    vfs_ioctl fs/ioctl.c:51 [inline]
    __do_sys_ioctl fs/ioctl.c:597 [inline]
    __se_sys_ioctl fs/ioctl.c:583 [inline]
    __x64_sys_ioctl+0xf4/0x140 fs/ioctl.c:583
    do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
    do_syscall_64+0xf8/0x610 arch/x86/entry/syscall_64.c:94

connection error: failed to recv *flatrpc.ExecutorMessageRawT: EOF


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

Received: from mail-ot1-f79.google.com (mail-ot1-f79.google.com [209.85.210.79])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B64F342FCCA
	for <linux-usb@vger.kernel.org>; Fri,  7 Aug 2026 10:48:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.79
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786099714; cv=none; b=J5ANklJP7l+GPbQGMf9DBraQAs8F/uATDzdgi/H61gf6U+mNSsYoaHUnsAon9ds85L0yovfKSzfrUnD5CK9QLCaNLeTHlJqWz54Ec/6/ChxaIW8mP9o8mQT/GaoSc5xDhDLX0CMXWv4YRzK3OcT+swahNO2trdMIoVmH8VB3vYQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786099714; c=relaxed/simple;
	bh=HWy752J4ad7k2FqTKlzLaZ2PSiyT3r5tMefKOmo2fZs=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=jyvIwb5dnbzN3+VwzOC2hHuUn6kw4bpxWmwY4d3xqbyWZrdR3NadbPxffwQMxu9fVQBEHgF/bxGQd+U3THA+bRdct7ilxCcQ1lhW6mtnGe6kRHhclqho0G8eWFNeaYy4/0N+MfC391cuossJKFEHoAd9CnO0/xsUIagU7p5arbU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.210.79
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-ot1-f79.google.com with SMTP id 46e09a7af769-7e9fdc2870fso1762475a34.2
        for <linux-usb@vger.kernel.org>; Fri, 07 Aug 2026 03:48:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786099711; x=1786704511;
        h=content-type:to:from:subject:message-id:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yhywoAlJK3U3MZ8bBIW0KbqG6PC7fKDY2XOTLDU1uK8=;
        b=oKCXjZUYLL18VD6mczA+VW1pR3TwJPtFvqkQ5eZ44QZmR/iCZKMrwAYqDRpT18H6Xb
         TvnjEmR521D37abeCT8gLUDq3A9YWBACL3a2DYc56z40YRjoBcxE8sN548SdeidHHxcD
         304y7KIAU7RY+hupJyCslxy8zK4OefYYnDSIwGG/B38sBvRzMzDZdQ3zGi+7LYB0Nbwz
         +6sUFEit4UqlNqM77pOeKP7cdOudboAmeRwdcMX2rd4RpaUgJgvStbnLDL2yjcLyGAh1
         eCL6xUeNTjLPW3MuIomA5uDmygDmKOaviqa/YNE9Hy2Aan2P3lyghfKfYhpT17ZiVcbx
         tYJw==
X-Forwarded-Encrypted: i=1; AHgh+RpV1/qFeqUS5nsdqrgZd8ITp55IEJxMWvFaC+A0p9fCjKeOyTAcR9FWlTM0sPSCz7mQCqshIl5Hnp0=@vger.kernel.org
X-Gm-Message-State: AOJu0YwM8BKWwVEcTfhD3DX+fb9NhDwoM58kps1Ex+DpoCjmpQhg2e75
	1YCdT0ij9u7oRwwp0S8jgNkF9B0CYOpilbdWjpT8KlrZeaVBQ/jUdF6cF47hl7voKOUiyeEsAL+
	+VCh0hin0IAbIs0xVOPv61yEBJxEztcB7tvc+uhexjbBfK8McKhXSM90v5Rs=
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:205:b0:6ae:ab01:9199 with SMTP id
 006d021491bc7-6aeab0194afmr7601996eaf.34.1786099711500; Fri, 07 Aug 2026
 03:48:31 -0700 (PDT)
Date: Fri, 07 Aug 2026 03:48:31 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6a75b7ff.01d0871a.3a0d52.0043.GAE@google.com>
Subject: [syzbot] [usb?] memory leak in usb_copy_descriptors
From: syzbot <syzbot+28cf08dec5895bd562e6@syzkaller.appspotmail.com>
To: gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    bd1dde877520 Merge tag 'vfs-7.2-rc6.fixes' of git://git.ke..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=1319ec9e580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=ba7c2d1679fb08a2
dashboard link: https://syzkaller.appspot.com/bug?extid=28cf08dec5895bd562e6
compiler:       gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=11da8cc6580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=10f92649580000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/67c1dd5573b6/disk-bd1dde87.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/e5d8989642ed/vmlinux-bd1dde87.xz
kernel image: https://storage.googleapis.com/syzbot-assets/5864bcc5777f/bzImage-bd1dde87.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+28cf08dec5895bd562e6@syzkaller.appspotmail.com

2026/08/03 10:38:22 executed programs: 5
BUG: memory leak
unreferenced object 0xffff8881154d0900 (size 64):
  comm "syz.0.18", pid 5914, jiffies 4294944269
  hex dump (first 32 bytes):
    20 09 4d 15 81 88 ff ff 29 09 4d 15 81 88 ff ff   .M.....).M.....
    30 09 4d 15 81 88 ff ff 00 00 00 00 00 00 00 00  0.M.............
  backtrace (crc f8bef12):
    kmemleak_alloc_recursive include/linux/kmemleak.h:44 [inline]
    slab_post_alloc_hook mm/slub.c:4597 [inline]
    slab_alloc_node mm/slub.c:4917 [inline]
    __do_kmalloc_node mm/slub.c:5333 [inline]
    __kmalloc_noprof+0x3bf/0x550 mm/slub.c:5359
    _kmalloc_noprof include/linux/slab.h:992 [inline]
    usb_copy_descriptors+0x6c/0x160 drivers/usb/gadget/config.c:82
    usb_assign_descriptors+0x48/0x180 drivers/usb/gadget/config.c:121
    loopback_bind+0xff/0x120 drivers/usb/gadget/function/f_loopback.c:209
    usb_add_function+0xca/0x270 drivers/usb/gadget/composite.c:333
    configfs_composite_bind+0x667/0x9b0 drivers/usb/gadget/configfs.c:1802
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
    gadget_dev_desc_UDC_store+0x153/0x1e0 drivers/usb/gadget/configfs.c:300

BUG: memory leak
unreferenced object 0xffff8881154d0580 (size 64):
  comm "syz.0.18", pid 5914, jiffies 4294944269
  hex dump (first 32 bytes):
    a0 05 4d 15 81 88 ff ff a9 05 4d 15 81 88 ff ff  ..M.......M.....
    b0 05 4d 15 81 88 ff ff 00 00 00 00 00 00 00 00  ..M.............
  backtrace (crc cfada151):
    kmemleak_alloc_recursive include/linux/kmemleak.h:44 [inline]
    slab_post_alloc_hook mm/slub.c:4597 [inline]
    slab_alloc_node mm/slub.c:4917 [inline]
    __do_kmalloc_node mm/slub.c:5333 [inline]
    __kmalloc_noprof+0x3bf/0x550 mm/slub.c:5359
    _kmalloc_noprof include/linux/slab.h:992 [inline]
    usb_copy_descriptors+0x6c/0x160 drivers/usb/gadget/config.c:82
    usb_assign_descriptors+0x6c/0x180 drivers/usb/gadget/config.c:126
    loopback_bind+0xff/0x120 drivers/usb/gadget/function/f_loopback.c:209
    usb_add_function+0xca/0x270 drivers/usb/gadget/composite.c:333
    configfs_composite_bind+0x667/0x9b0 drivers/usb/gadget/configfs.c:1802
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
    gadget_dev_desc_UDC_store+0x153/0x1e0 drivers/usb/gadget/configfs.c:300

BUG: memory leak
unreferenced object 0xffff888115497f60 (size 96):
  comm "syz.0.18", pid 5914, jiffies 4294944269
  hex dump (first 32 bytes):
    90 7f 49 15 81 88 ff ff 99 7f 49 15 81 88 ff ff  ..I.......I.....
    a0 7f 49 15 81 88 ff ff a6 7f 49 15 81 88 ff ff  ..I.......I.....
  backtrace (crc c70322d9):
    kmemleak_alloc_recursive include/linux/kmemleak.h:44 [inline]
    slab_post_alloc_hook mm/slub.c:4597 [inline]
    slab_alloc_node mm/slub.c:4917 [inline]
    __do_kmalloc_node mm/slub.c:5333 [inline]
    __kmalloc_noprof+0x3bf/0x550 mm/slub.c:5359
    _kmalloc_noprof include/linux/slab.h:992 [inline]
    usb_copy_descriptors+0x6c/0x160 drivers/usb/gadget/config.c:82
    usb_assign_descriptors+0xf9/0x180 drivers/usb/gadget/config.c:136
    loopback_bind+0xff/0x120 drivers/usb/gadget/function/f_loopback.c:209
    usb_add_function+0xca/0x270 drivers/usb/gadget/composite.c:333
    configfs_composite_bind+0x667/0x9b0 drivers/usb/gadget/configfs.c:1802
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
    gadget_dev_desc_UDC_store+0x153/0x1e0 drivers/usb/gadget/configfs.c:300

BUG: memory leak
unreferenced object 0xffff888110edd300 (size 64):
  comm "syz.0.19", pid 5917, jiffies 4294944271
  hex dump (first 32 bytes):
    20 d3 ed 10 81 88 ff ff 29 d3 ed 10 81 88 ff ff   .......).......
    30 d3 ed 10 81 88 ff ff 00 00 00 00 00 00 00 00  0...............
  backtrace (crc 316a7640):
    kmemleak_alloc_recursive include/linux/kmemleak.h:44 [inline]
    slab_post_alloc_hook mm/slub.c:4597 [inline]
    slab_alloc_node mm/slub.c:4917 [inline]
    __do_kmalloc_node mm/slub.c:5333 [inline]
    __kmalloc_noprof+0x3bf/0x550 mm/slub.c:5359
    _kmalloc_noprof include/linux/slab.h:992 [inline]
    usb_copy_descriptors+0x6c/0x160 drivers/usb/gadget/config.c:82
    usb_assign_descriptors+0x48/0x180 drivers/usb/gadget/config.c:121
    loopback_bind+0xff/0x120 drivers/usb/gadget/function/f_loopback.c:209
    usb_add_function+0xca/0x270 drivers/usb/gadget/composite.c:333
    configfs_composite_bind+0x667/0x9b0 drivers/usb/gadget/configfs.c:1802
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
    gadget_dev_desc_UDC_store+0x153/0x1e0 drivers/usb/gadget/configfs.c:300

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

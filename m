Received: from mail-oi1-f205.google.com (mail-oi1-f205.google.com [209.85.167.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CEB833C1B4
	for <linux-usb@vger.kernel.org>; Thu, 16 Jul 2026 07:50:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784188231; cv=none; b=tcoCmeF+Wolz1qM9R26tniCA7gAZw3hKuHUJqMcyWqKEs6nNbQdhFSTTAhV8ewYJdpcFhNDwhrrSyORf96CWXKuUh8ctaeHOjou0q32O8snLd9/N/+8lcM/SiUWwF8g7tSR4mVg9ZKofzF9bQEV78X2KEp9YqpPy4PuYqmSydzw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784188231; c=relaxed/simple;
	bh=yrSRGhXYcj+QtquVh/N4b0PDa8b8KSOHhJ/9XIfK+So=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=DcsZyV8lgAy/J42/xRdVe/TQPUjvPHhfyxrNY7BrSCh+COejutcla5qjjJv3YwiOuxUoAm7kBOZGQxz36TKIk/aqOw85uLUaJ3KVoXNh3pS4u9X+Sbl2H4SlWxB7Y3Ouv4lkbivles3FTs9kE718NQX51vkDMUhPjmmMS8wQ1tg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f205.google.com with SMTP id 5614622812f47-486cc29e03bso8704619b6e.3
        for <linux-usb@vger.kernel.org>; Thu, 16 Jul 2026 00:50:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784188228; x=1784793028;
        h=content-type:to:from:subject:message-id:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iEo96ftJOD3C9dQlI5Yypu9ftwMuoqhfkqf4g2cZASQ=;
        b=c5x8w+oqzDrbUFF+IZN3KoCYQM5kuIq4TDDKVBp6rLT8lfmSKtIKZQQ4IMRLfFlaoE
         2tmfV48k9HqNrlZwje403/AFVBPCrEVfOBPleuHLk0vJ7b2komSFzTJlb2RjwnVH8pwV
         p4pJYJjbj4bfZuI6GfmSLcO7cmu5wgw+ovdC2q4TW9uhk/C89g6GCNQWYurvhIYOlCs6
         PGQ5Ff/oXzh2NEs2N4klQq29lhGpNUyKFGKtS39CsM5OqyG33TDsv1uHTqw3I48/4cyA
         0WMoBl+wmm+9Gl0fyZ1oAoA389hXpnAVWrr99tlpbyi7ON6DRJiNzD/76kLCHp5Rx3K0
         QWGA==
X-Forwarded-Encrypted: i=1; AHgh+Rr7UXH2XXscgXi1Z7BX9ir5KdNSx74/oJdSFBb0G9Nx0gyVtuFj7K5v0GPxzAa89y876tHCs5jDJjo=@vger.kernel.org
X-Gm-Message-State: AOJu0YzD0LCRJ8jcG4McOx+3NcQPCHLbv5wx/Ai6WFVulYvHSlAik8ZO
	PKN0Bhp18b7apz5ZQxhcchphsxlS4ecdooG8rbUaX4xIzTTFkXnXsYm2ge8Z5q/vF2JjwTv6eoj
	bNZJ/TeY55s2GDNe61LFw2pkLs7SaaE7HSwC4/Mvtst4RuWr2XEHBm1qFlZ8=
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:813:b0:6a1:7f97:6e5a with SMTP id
 006d021491bc7-6a3da09ff87mr3946694eaf.62.1784188228124; Thu, 16 Jul 2026
 00:50:28 -0700 (PDT)
Date: Thu, 16 Jul 2026 00:50:28 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6a588d44.c96faac9.59e0.0011.GAE@google.com>
Subject: [syzbot] [usb?] memory leak in uss720_probe
From: syzbot <syzbot+56962eb32ba0136cd330@syzkaller.appspotmail.com>
To: gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    58717b2a1365 Merge tag 'sound-7.2-rc4' of git://git.kernel..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=15a344b9580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=b80376788da8bcda
dashboard link: https://syzkaller.appspot.com/bug?extid=56962eb32ba0136cd330
compiler:       gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=10f70b46580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=162454b9580000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/dac88573d763/disk-58717b2a.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/29447c97aeb1/vmlinux-58717b2a.xz
kernel image: https://storage.googleapis.com/syzbot-assets/076ab0265b89/bzImage-58717b2a.xz
mounted in repro: https://storage.googleapis.com/syzbot-assets/cbc20556ddac/mount_1.gz
  fsck result: failed (log: https://syzkaller.appspot.com/x/fsck.log?x=17770b46580000)

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+56962eb32ba0136cd330@syzkaller.appspotmail.com

BUG: memory leak
unreferenced object 0xffff88812c0e34c0 (size 64):
  comm "kworker/0:0", pid 9, jiffies 4294942439
  hex dump (first 32 bytes):
    00 b8 b6 05 81 88 ff ff 00 00 00 00 00 00 00 00  ................
    01 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
  backtrace (crc 7291ab94):
    kmemleak_alloc_recursive include/linux/kmemleak.h:44 [inline]
    slab_post_alloc_hook mm/slub.c:4625 [inline]
    slab_alloc_node mm/slub.c:4945 [inline]
    __kmalloc_cache_noprof+0x356/0x440 mm/slub.c:5511
    _kmalloc_noprof include/linux/slab.h:969 [inline]
    _kzalloc_noprof include/linux/slab.h:1290 [inline]
    uss720_probe+0xf6/0x330 drivers/usb/misc/uss720.c:702
    usb_probe_interface+0x210/0x480 drivers/usb/core/driver.c:396
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
    usb_set_configuration+0x8f5/0xb80 drivers/usb/core/message.c:2268
    usb_generic_driver_probe+0x73/0xb0 drivers/usb/core/generic.c:250
    usb_probe_device+0x78/0x1f0 drivers/usb/core/driver.c:291
    call_driver_probe drivers/base/dd.c:628 [inline]
    really_probe+0x12f/0x3a0 drivers/base/dd.c:706

BUG: memory leak
unreferenced object 0xffff88812d350b40 (size 96):
  comm "kworker/0:0", pid 9, jiffies 4294942439
  hex dump (first 32 bytes):
    c0 34 0e 2c 81 88 ff ff 01 00 00 00 00 00 00 00  .4.,............
    e0 34 0e 2c 81 88 ff ff e0 34 0e 2c 81 88 ff ff  .4.,.....4.,....
  backtrace (crc 519c4231):
    kmemleak_alloc_recursive include/linux/kmemleak.h:44 [inline]
    slab_post_alloc_hook mm/slub.c:4625 [inline]
    slab_alloc_node mm/slub.c:4945 [inline]
    __kmalloc_cache_noprof+0x356/0x440 mm/slub.c:5511
    _kmalloc_noprof include/linux/slab.h:969 [inline]
    _kzalloc_noprof include/linux/slab.h:1290 [inline]
    submit_async_request.constprop.0+0x6b/0x440 drivers/usb/misc/uss720.c:137
    get_1284_register+0x4a/0x1a0 drivers/usb/misc/uss720.c:205
    uss720_probe+0x205/0x330 drivers/usb/misc/uss720.c:733
    usb_probe_interface+0x210/0x480 drivers/usb/core/driver.c:396
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
    usb_set_configuration+0x8f5/0xb80 drivers/usb/core/message.c:2268
    usb_generic_driver_probe+0x73/0xb0 drivers/usb/core/generic.c:250

BUG: memory leak
unreferenced object 0xffff88812d277180 (size 192):
  comm "kworker/0:0", pid 9, jiffies 4294942439
  hex dump (first 32 bytes):
    01 00 00 00 98 ff ff ff 00 00 00 00 00 00 00 00  ................
    00 00 00 00 00 00 00 00 98 71 27 2d 81 88 ff ff  .........q'-....
  backtrace (crc 26b7be33):
    kmemleak_alloc_recursive include/linux/kmemleak.h:44 [inline]
    slab_post_alloc_hook mm/slub.c:4625 [inline]
    slab_alloc_node mm/slub.c:4945 [inline]
    __do_kmalloc_node mm/slub.c:5361 [inline]
    __kmalloc_noprof+0x3bf/0x550 mm/slub.c:5387
    _kmalloc_noprof include/linux/slab.h:973 [inline]
    usb_alloc_urb+0x66/0xa0 drivers/usb/core/urb.c:75
    submit_async_request.constprop.0+0x11c/0x440 drivers/usb/misc/uss720.c:145
    get_1284_register+0x4a/0x1a0 drivers/usb/misc/uss720.c:205
    uss720_probe+0x205/0x330 drivers/usb/misc/uss720.c:733
    usb_probe_interface+0x210/0x480 drivers/usb/core/driver.c:396
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
    usb_set_configuration+0x8f5/0xb80 drivers/usb/core/message.c:2268

BUG: memory leak
unreferenced object 0xffff888111cfec80 (size 8):
  comm "kworker/0:0", pid 9, jiffies 4294942439
  hex dump (first 8 bytes):
    c0 03 00 00 00 00 07 00                          ........
  backtrace (crc 40fcb6d):
    kmemleak_alloc_recursive include/linux/kmemleak.h:44 [inline]
    slab_post_alloc_hook mm/slub.c:4625 [inline]
    slab_alloc_node mm/slub.c:4945 [inline]
    __kmalloc_cache_noprof+0x356/0x440 mm/slub.c:5511
    _kmalloc_noprof include/linux/slab.h:969 [inline]
    submit_async_request.constprop.0+0x143/0x440 drivers/usb/misc/uss720.c:150
    get_1284_register+0x4a/0x1a0 drivers/usb/misc/uss720.c:205
    uss720_probe+0x205/0x330 drivers/usb/misc/uss720.c:733
    usb_probe_interface+0x210/0x480 drivers/usb/core/driver.c:396
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
    usb_set_configuration+0x8f5/0xb80 drivers/usb/core/message.c:2268
    usb_generic_driver_probe+0x73/0xb0 drivers/usb/core/generic.c:250

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

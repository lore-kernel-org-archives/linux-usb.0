Received: from mail-oo1-f80.google.com (mail-oo1-f80.google.com [209.85.161.80])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D4133BD63C
	for <linux-usb@vger.kernel.org>; Sun,  9 Aug 2026 19:13:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.80
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786302820; cv=none; b=e45uUYVB7jPbFb9PnCeQ4pTcLUauN7PeTv4NAn2LVUOxjUFRayZ2H+xQnIqA2caG1np1mPcbXc2SfNjEMwWS7mIYtwnqE+VjSc3X0v3VEBJPxcI+WDv0sbKtg/Uyc+RVCX7fiexXN4Lj2z3IJ5BgjD/D7DShiK9clSmZb8ZQOko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786302820; c=relaxed/simple;
	bh=ULnjhk1q/DXdLvKaws97bJJnv5OEu4EARgSogokhj9s=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=E6DQQZzd8gvhb+G3Mz71+MQ1VOtSO88JenvpoMeMCVWqR7mmpSu6c7YVQATAubwGkJ5wKnpNyYdzNQWfbUK5QSqbyKZOTtWDXXm/FAj3MQ6OjPpF2eQ/f7kEHcScSxHwXD17qzOkcqkgCyoHCJBoUIgdkHlY20TycfL35e7ENPc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.161.80
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oo1-f80.google.com with SMTP id 006d021491bc7-6ae7c37604aso1007441eaf.0
        for <linux-usb@vger.kernel.org>; Sun, 09 Aug 2026 12:13:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786302816; x=1786907616;
        h=content-type:to:from:subject:message-id:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=f2R6sd8NFICSpwZAP9zSy8wA89p64sXxGsH5JCp6mJE=;
        b=iz+C6d48B3MywmyTHbYlUqlkT4vSrjPsf6Y+nzYRgU9alZhIxBCR395a7dLyL6YXbg
         ezNgQuRrlnIxehge91WMJYmL1yHsgVhjCXebdywKADfs4UMAov8e8j6t8GvQg9DqxdeI
         0Kw8vGwyzT83MLr6xYujPLZQIJxXx5ZzPxZxRZYmL8b8jBb1CobeHzoR5YP3iztgFayY
         x+Yh3t+/4f7+az1KiQ23C0T7PEuDmj1TEZy8C2Ew1l8BqLG/ckXcnMH4qYkStETAMRKI
         R4S+j9HQtaAL635HuWadBfvb6ZbXfzFqPt/Qvj8mA2J7ARl0voJ1tC3PEhA8fzVyFlq5
         IDmg==
X-Forwarded-Encrypted: i=1; AHgh+Ro4ydsdlfkuL/+iT/8ubF8xC1sbTjeHc6F5W74WHV7dttQAiEM0XwaE8KmmJ897Of2rkItLO1n7ano=@vger.kernel.org
X-Gm-Message-State: AOJu0YxnGIt53f6A7fUBFXOWUtzav2xR6pgIiALre+qCiBpWays6lfPj
	wtnAXu5ZGXsW/7FFweDwbftkPrfV0xQI7qlLCcCQa8M58gQBJjk/qAk2R+uPjh16gpQSwYfY4iD
	tiHzUP1ThfYrBDMR6DWZxs8fzhaJ0/XpD125uesUQ+ESQ+jYXU4WIRX8Z3vs=
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:1c85:b0:6ac:a5a3:460e with SMTP id
 006d021491bc7-6b0352ab430mr8460203eaf.19.1786302816372; Sun, 09 Aug 2026
 12:13:36 -0700 (PDT)
Date: Sun, 09 Aug 2026 12:13:36 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6a78d160.01d0871a.3a0d52.0091.GAE@google.com>
Subject: [syzbot] [usb?] memory leak in hidg_bind
From: syzbot <syzbot+60740c6a17a5b5eb1f5a@syzkaller.appspotmail.com>
To: gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    9a143525f62b Merge tag 'ata-7.2-rc7' of git://git.kernel.o..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=17edefb9580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=6843f8fd2336602d
dashboard link: https://syzkaller.appspot.com/bug?extid=60740c6a17a5b5eb1f5a
compiler:       gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=1061fe49580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=10c06fb9580000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/689093bae5bf/disk-9a143525.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/a57b87e6032d/vmlinux-9a143525.xz
kernel image: https://storage.googleapis.com/syzbot-assets/508c649c8b0f/bzImage-9a143525.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+60740c6a17a5b5eb1f5a@syzkaller.appspotmail.com

2026/08/08 09:35:22 executed programs: 5
BUG: memory leak
unreferenced object 0xffff888112450300 (size 128):
  comm "syz.0.18", pid 5923, jiffies 4294943868
  hex dump (first 32 bytes):
    00 03 45 12 81 88 ff ff 00 03 45 12 81 88 ff ff  ..E.......E.....
    30 00 b2 03 81 88 ff ff 00 00 00 00 00 00 00 00  0...............
  backtrace (crc 18381426):
    kmemleak_alloc_recursive include/linux/kmemleak.h:44 [inline]
    slab_post_alloc_hook mm/slub.c:4597 [inline]
    slab_alloc_node mm/slub.c:4917 [inline]
    __kmalloc_cache_noprof+0x356/0x440 mm/slub.c:5485
    _kmalloc_noprof include/linux/slab.h:988 [inline]
    _kzalloc_noprof include/linux/slab.h:1309 [inline]
    dummy_alloc_request+0x65/0xf0 drivers/usb/gadget/udc/dummy_hcd.c:693
    usb_ep_alloc_request+0x2e/0xd0 drivers/usb/gadget/udc/core.c:197
    hidg_bind+0x2b/0x490 drivers/usb/gadget/function/f_hid.c:1154
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
unreferenced object 0xffff888112c7bf00 (size 128):
  comm "syz.0.20", pid 5967, jiffies 4294944502
  hex dump (first 32 bytes):
    00 bf c7 12 81 88 ff ff 00 bf c7 12 81 88 ff ff  ................
    30 00 b2 03 81 88 ff ff 00 00 00 00 00 00 00 00  0...............
  backtrace (crc cd50bb2e):
    kmemleak_alloc_recursive include/linux/kmemleak.h:44 [inline]
    slab_post_alloc_hook mm/slub.c:4597 [inline]
    slab_alloc_node mm/slub.c:4917 [inline]
    __kmalloc_cache_noprof+0x356/0x440 mm/slub.c:5485
    _kmalloc_noprof include/linux/slab.h:988 [inline]
    _kzalloc_noprof include/linux/slab.h:1309 [inline]
    dummy_alloc_request+0x65/0xf0 drivers/usb/gadget/udc/dummy_hcd.c:693
    usb_ep_alloc_request+0x2e/0xd0 drivers/usb/gadget/udc/core.c:197
    hidg_bind+0x2b/0x490 drivers/usb/gadget/function/f_hid.c:1154
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

Received: from mail-oi1-f205.google.com (mail-oi1-f205.google.com [209.85.167.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3EC942B728
	for <linux-usb@vger.kernel.org>; Thu, 30 Jul 2026 12:26:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785414387; cv=none; b=M1yLMBqpvC4eYBPzeRMixa4+F/cgJXQ0lecAjfgvvJ7U0YXDV8GmS4MFlvWJHOD1q1s5YW3dlPxpVQeMc2757ELEjriYNIfpznp5MWAYX1em8OO6ZCswEsztALMgRzLLmJ/+YQaaUWVBXFsIAibEfYL2+lJaK+cmvHLTifM95TQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785414387; c=relaxed/simple;
	bh=3eX/wD/Y2vIGFeWBUssBD/O8VVwMxSDpbGhLJJd7dIY=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=gyAjfPBeF+t3n6eZdd4wTE+bLqSVpJoZWAl8AJTw9A7y1UsdCQyHSxoCKDeSsRtnnuDn4X+phrnKyrVio4Cov50eLOqWO1c4l1/MnlfPqgR/ml2R63CvBbA9wGOJVXi9wnNNuevf3N5G2LDYpRDc/rUOttlY4Dw3S0PNuIqMSpA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f205.google.com with SMTP id 5614622812f47-48576b535b6so926086b6e.2
        for <linux-usb@vger.kernel.org>; Thu, 30 Jul 2026 05:26:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785414381; x=1786019181;
        h=content-type:to:from:subject:message-id:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XFJV9HxGuHkSPqosS0cOCUqhDVqL3XcR6UL2UDe7Vsw=;
        b=ChSakF/vWcOwY/Ey/i4QoTRSEsizRC6WmnUT+Vx0y7QjM1rJjvYB/ni4wxNQHca+cn
         3IEaBeX7B4XuJEE9xb1SQSfjspCYj+2EeXUrcgbixMfrKukniDMjaezgaJJS+MN4/x2F
         SufqlFKScT9Oy5BADn99jePXI8gTsXSJVsQ0GWUPtKnQwyDrUvkU5euGkf9d49oDhwER
         KvVeOJIm676BXQoqbOjhW/E8BQAUB/tWSlW7zUFDY3dqU0itIGiwlhgqp9lszUA3Y+J0
         a7xm2w0Ttw8n8/vz+PRXZab608AOI2kY1hv+ISQ+UPaIgWSc8warteSIZFidCzFP82i/
         5Bgg==
X-Forwarded-Encrypted: i=1; AHgh+RrkKX5jTvdClZ7IB9HsNwoyFvctnFWT3rllgklLvNv8gGhw7F366TthKxhBoKi+9yOfTSr2RtKL558=@vger.kernel.org
X-Gm-Message-State: AOJu0YxQaaOKpUpkyVDL8L7NvVPnqTmTRvIQ/b7Wxo4sqE4Y8vomFm/1
	TEYtET6gQIKU8yl+V1sZPlXA9IASzoBnfd+LHdmKyQVK4Ima7q0cVq8QNCMX/mVoINwzxhypQvI
	LKczqc1raRwWGMiTczG14/+qT23VrWN1aGBlgDnllbC4AQ9+0LtJT3T+ysJw=
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:3507:b0:496:3a1:e44f with SMTP id
 5614622812f47-4ad8773d02emr1429632b6e.6.1785414381730; Thu, 30 Jul 2026
 05:26:21 -0700 (PDT)
Date: Thu, 30 Jul 2026 05:26:21 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6a6b42ed.86abc875.e5c3d.006a.GAE@google.com>
Subject: [syzbot] [usb?] memory leak in try_get_usb_function_instance
From: syzbot <syzbot+eaa106d192c9daf37f95@syzkaller.appspotmail.com>
To: gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    3dab139d4795 Merge tag 'rust-fixes-7.2-2' of git://git.ker..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=163a388e580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=ba7c2d1679fb08a2
dashboard link: https://syzkaller.appspot.com/bug?extid=eaa106d192c9daf37f95
compiler:       gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=111c11b9580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=12b5909e580000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/8c49d395f8d0/disk-3dab139d.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/deff2ace5e6a/vmlinux-3dab139d.xz
kernel image: https://storage.googleapis.com/syzbot-assets/2c90a783f940/bzImage-3dab139d.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+eaa106d192c9daf37f95@syzkaller.appspotmail.com

2026/07/26 12:12:48 executed programs: 5
BUG: memory leak
unreferenced object 0xffff888112a69c00 (size 512):
  comm "syz.0.19", pid 5954, jiffies 4294946869
  hex dump (first 32 bytes):
    08 9c a6 12 81 88 ff ff 65 70 2e 30 00 00 00 00  ........ep.0....
    00 00 00 00 00 00 00 00 00 00 00 00 01 00 00 00  ................
  backtrace (crc 56e62c00):
    kmemleak_alloc_recursive include/linux/kmemleak.h:44 [inline]
    slab_post_alloc_hook mm/slub.c:4597 [inline]
    slab_alloc_node mm/slub.c:4917 [inline]
    __kmalloc_cache_noprof+0x356/0x440 mm/slub.c:5485
    _kmalloc_noprof include/linux/slab.h:988 [inline]
    _kzalloc_noprof include/linux/slab.h:1309 [inline]
    f_midi2_ep_opts_create drivers/usb/gadget/function/f_midi2.c:2504 [inline]
    f_midi2_alloc_inst+0xa0/0x250 drivers/usb/gadget/function/f_midi2.c:2666
    try_get_usb_function_instance+0xb8/0x100 drivers/usb/gadget/functions.c:28
    usb_get_function_instance+0x16/0x70 drivers/usb/gadget/functions.c:44
    function_make+0xf5/0x240 drivers/usb/gadget/configfs.c:626
    configfs_mkdir+0x2e9/0x6f0 fs/configfs/dir.c:1360
    vfs_mkdir+0x16c/0x3a0 fs/namei.c:5276
    filename_mkdirat+0x27c/0x300 fs/namei.c:5309
    __do_sys_mkdirat fs/namei.c:5330 [inline]
    __se_sys_mkdirat fs/namei.c:5327 [inline]
    __x64_sys_mkdirat+0x39/0x60 fs/namei.c:5327
    do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
    do_syscall_64+0xf8/0x610 arch/x86/entry/syscall_64.c:94
    entry_SYSCALL_64_after_hwframe+0x77/0x7f

BUG: memory leak
unreferenced object 0xffff8881105a3f00 (size 256):
  comm "syz.0.19", pid 5954, jiffies 4294946869
  hex dump (first 32 bytes):
    08 3f 5a 10 81 88 ff ff 62 6c 6f 63 6b 2e 30 00  .?Z.....block.0.
    00 00 00 00 00 00 00 00 00 00 00 00 01 00 00 00  ................
  backtrace (crc f7f284e3):
    kmemleak_alloc_recursive include/linux/kmemleak.h:44 [inline]
    slab_post_alloc_hook mm/slub.c:4597 [inline]
    slab_alloc_node mm/slub.c:4917 [inline]
    __kmalloc_cache_noprof+0x356/0x440 mm/slub.c:5485
    _kmalloc_noprof include/linux/slab.h:988 [inline]
    _kzalloc_noprof include/linux/slab.h:1309 [inline]
    f_midi2_block_opts_create+0x82/0x120 drivers/usb/gadget/function/f_midi2.c:2342
    f_midi2_alloc_inst+0xe9/0x250 drivers/usb/gadget/function/f_midi2.c:2673
    try_get_usb_function_instance+0xb8/0x100 drivers/usb/gadget/functions.c:28
    usb_get_function_instance+0x16/0x70 drivers/usb/gadget/functions.c:44
    function_make+0xf5/0x240 drivers/usb/gadget/configfs.c:626
    configfs_mkdir+0x2e9/0x6f0 fs/configfs/dir.c:1360
    vfs_mkdir+0x16c/0x3a0 fs/namei.c:5276
    filename_mkdirat+0x27c/0x300 fs/namei.c:5309
    __do_sys_mkdirat fs/namei.c:5330 [inline]
    __se_sys_mkdirat fs/namei.c:5327 [inline]
    __x64_sys_mkdirat+0x39/0x60 fs/namei.c:5327
    do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
    do_syscall_64+0xf8/0x610 arch/x86/entry/syscall_64.c:94
    entry_SYSCALL_64_after_hwframe+0x77/0x7f

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

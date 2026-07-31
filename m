Received: from mail-oi1-f207.google.com (mail-oi1-f207.google.com [209.85.167.207])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 179C4199EAD
	for <linux-usb@vger.kernel.org>; Fri, 31 Jul 2026 00:11:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.207
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785456685; cv=none; b=jecbs3OIHoBVWrn6EEK29sgqgJPy4Di8w6wzFtcnt+TftuCEp7mKs9d623pyCuwuOF3ZOO7oOlrJhLvw2g02dQmoVmVkNXA9TyXhEeHZNWWBV4+XSdAAYqXRUdr/y7UJZzS8/OF16u4uu/zejAT5GSXndtP5l0bxEEEhhxx/E+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785456685; c=relaxed/simple;
	bh=awVONjlblYBJul9wlmAT9RPB6Gxo+QryATNxZ/IOUoI=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=ZSFn5kAZnCpUPbHuotAqsf/IvqUQPgL/0FllfzpYV76pW0lQfwdINbMlQT2G35MFXRiuIlld/GNhGWJbyODvcaKdDhsKoGnNe9YMIfjNfW7U+JdF9vnQ+BI8hNXddVof4Urek6IuLQP9/KvKkRW23BkySbjGdiYXYZPMwxCeBn0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.207
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f207.google.com with SMTP id 5614622812f47-4a45b3f0bdfso541698b6e.1
        for <linux-usb@vger.kernel.org>; Thu, 30 Jul 2026 17:11:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785456683; x=1786061483;
        h=content-type:to:from:subject:message-id:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mDYD4WQI9KGkxRP2qwpbfEVXuWbPQXqZtU9n9JGGN5A=;
        b=ppKvaEwAmPhd0nR5Jn9bJxE3ro7Mgt6WFmUvzYb2w5Okn7jtrZKrRSfgwNQZ6zwWeT
         nOd1lkJ1RNz3+0Va5HFtASUcnMRqDN7R9kDEN3/UtocyLXmCe7XEWrrLOCyMP28uQvM0
         X6Al1LqI475McBGCPZ28JuO086gvnB1MZ6ZmFBWSS6NRYYEkQo6DZ0141VsOZmwzAT6O
         iDpOwuyHhi4l5Zo3wN/6L85TDekDRvyDTU7OWrunv8Jwo1GCwC/kmeah/FLB52qDDr9l
         I9GsTdvqg2DKkndWcfEtFtMrmJTBMPGnnd+uJB0NQSR1Vlh5bYbIOQ1zp5Hw6Ob3l+t/
         /5+A==
X-Forwarded-Encrypted: i=1; AHgh+RpjuSCBjqHT0NtOvG3cz9niwyumUx4bsjL+VE9KU4N4hMcXH031XzuBxo1GC40HwEcpZTF1sx8igIg=@vger.kernel.org
X-Gm-Message-State: AOJu0YwvD504uGY0utaOfrKWiS71+bx3xlUYK/lCqgLrHyZC3r756ctB
	yan8J5GzprRwr9+WL9oYTD83VIQouH1582dPM78Wi6AsRzHRlR4ilMs56jickKprcq2Qr/xlGLT
	kLLlvpe6UQ2OmOn+waua49mKjjlTzUJHo4VHqdy83MavA17Dyn0Xt1Cmtehc=
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:168a:b0:489:6bef:326a with SMTP id
 5614622812f47-4ad879cbc10mr3620445b6e.38.1785456683008; Thu, 30 Jul 2026
 17:11:23 -0700 (PDT)
Date: Thu, 30 Jul 2026 17:11:22 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6a6be82a.77639fcc.3d4fd0.0012.GAE@google.com>
Subject: [syzbot] [usb?] memory leak in f_uac2_opts_c_srate_store
From: syzbot <syzbot+ebd045a6645cfb713c95@syzkaller.appspotmail.com>
To: gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    3dab139d4795 Merge tag 'rust-fixes-7.2-2' of git://git.ker..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=16e611b9580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=ba7c2d1679fb08a2
dashboard link: https://syzkaller.appspot.com/bug?extid=ebd045a6645cfb713c95
compiler:       gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=166ba499580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=11e611b9580000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/8c49d395f8d0/disk-3dab139d.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/deff2ace5e6a/vmlinux-3dab139d.xz
kernel image: https://storage.googleapis.com/syzbot-assets/2c90a783f940/bzImage-3dab139d.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+ebd045a6645cfb713c95@syzkaller.appspotmail.com

2026/07/26 16:23:20 executed programs: 5
BUG: memory leak
unreferenced object 0xffff888112a01e00 (size 64):
  comm "syz.0.17", pid 5945, jiffies 4294942115
  hex dump (first 32 bytes):
    34 34 31 30 30 00 34 38 30 30 30 00 38 38 32 30  44100.48000.8820
    30 00 39 36 30 30 30 00 31 37 36 34 30 30 00 31  0.96000.176400.1
  backtrace (crc 9bbd8bc9):
    kmemleak_alloc_recursive include/linux/kmemleak.h:44 [inline]
    slab_post_alloc_hook mm/slub.c:4597 [inline]
    slab_alloc_node mm/slub.c:4917 [inline]
    __do_kmalloc_node mm/slub.c:5333 [inline]
    __kmalloc_node_track_caller_noprof+0x3d3/0x570 mm/slub.c:5471
    __kmemdup_nul mm/util.c:64 [inline]
    kstrdup+0x3c/0x80 mm/util.c:84
    f_uac2_opts_c_srate_store+0xbb/0x170 drivers/usb/gadget/function/f_uac2.c:2091
    flush_write_buffer fs/configfs/file.c:207 [inline]
    configfs_write_iter+0x10d/0x1a0 fs/configfs/file.c:229
    new_sync_write fs/read_write.c:595 [inline]
    vfs_write+0x3ac/0x720 fs/read_write.c:687
    ksys_write+0xa5/0x170 fs/read_write.c:739
    do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
    do_syscall_64+0xf8/0x610 arch/x86/entry/syscall_64.c:94
    entry_SYSCALL_64_after_hwframe+0x77/0x7f

BUG: memory leak
unreferenced object 0xffff8881128d2d80 (size 64):
  comm "syz.0.18", pid 5946, jiffies 4294942116
  hex dump (first 32 bytes):
    34 34 31 30 30 00 34 38 30 30 30 00 38 38 32 30  44100.48000.8820
    30 00 39 36 30 30 30 00 31 37 36 34 30 30 00 31  0.96000.176400.1
  backtrace (crc 9bbd8bc9):
    kmemleak_alloc_recursive include/linux/kmemleak.h:44 [inline]
    slab_post_alloc_hook mm/slub.c:4597 [inline]
    slab_alloc_node mm/slub.c:4917 [inline]
    __do_kmalloc_node mm/slub.c:5333 [inline]
    __kmalloc_node_track_caller_noprof+0x3d3/0x570 mm/slub.c:5471
    __kmemdup_nul mm/util.c:64 [inline]
    kstrdup+0x3c/0x80 mm/util.c:84
    f_uac2_opts_c_srate_store+0xbb/0x170 drivers/usb/gadget/function/f_uac2.c:2091
    flush_write_buffer fs/configfs/file.c:207 [inline]
    configfs_write_iter+0x10d/0x1a0 fs/configfs/file.c:229
    new_sync_write fs/read_write.c:595 [inline]
    vfs_write+0x3ac/0x720 fs/read_write.c:687
    ksys_write+0xa5/0x170 fs/read_write.c:739
    do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
    do_syscall_64+0xf8/0x610 arch/x86/entry/syscall_64.c:94
    entry_SYSCALL_64_after_hwframe+0x77/0x7f

BUG: memory leak
unreferenced object 0xffff88811193ee80 (size 64):
  comm "syz.0.21", pid 5964, jiffies 4294942644
  hex dump (first 32 bytes):
    34 34 31 30 30 00 34 38 30 30 30 00 38 38 32 30  44100.48000.8820
    30 00 39 36 30 30 30 00 31 37 36 34 30 30 00 31  0.96000.176400.1
  backtrace (crc 9bbd8bc9):
    kmemleak_alloc_recursive include/linux/kmemleak.h:44 [inline]
    slab_post_alloc_hook mm/slub.c:4597 [inline]
    slab_alloc_node mm/slub.c:4917 [inline]
    __do_kmalloc_node mm/slub.c:5333 [inline]
    __kmalloc_node_track_caller_noprof+0x3d3/0x570 mm/slub.c:5471
    __kmemdup_nul mm/util.c:64 [inline]
    kstrdup+0x3c/0x80 mm/util.c:84
    f_uac2_opts_c_srate_store+0xbb/0x170 drivers/usb/gadget/function/f_uac2.c:2091
    flush_write_buffer fs/configfs/file.c:207 [inline]
    configfs_write_iter+0x10d/0x1a0 fs/configfs/file.c:229
    new_sync_write fs/read_write.c:595 [inline]
    vfs_write+0x3ac/0x720 fs/read_write.c:687
    ksys_write+0xa5/0x170 fs/read_write.c:739
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

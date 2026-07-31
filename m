Received: from mail-oi1-f206.google.com (mail-oi1-f206.google.com [209.85.167.206])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E646E44AB65
	for <linux-usb@vger.kernel.org>; Fri, 31 Jul 2026 17:15:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.206
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785518133; cv=none; b=oX+t0nx9aqobxcIfkZNeS6V5LdsHR3+bwmyCivqTzbJ/8073q/RLQjutqtB6YKXPlDqcSnYnFkzeH6RcTL0pNkxfpnz+xPBigH8Kvb2lC9lEeC9pRb8VKYbcBQhkP/uFZbVO5q6qC5bE6wflC8nB0JMbYbtJayX7swwuX/GwxPE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785518133; c=relaxed/simple;
	bh=R2DsbeiPKDXx9v3XOU0VrwnkEJMpCx5VyAGqxlp7M4I=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=TrUnsU+Ou8F8kBoRbn1zzCUBQGEZ2i3QI8X+XKLZ6fGx0Eq0459WIxenEeiZcUve2P0yoictF55qyTnmOyZ57HiTXHw6+aK9T8SM16MlceobKD8BaPOrcK0f+IpTiFPo/xQdPDjzPsls0VdhmgjaCQewPkOMkrTU3RzyLwEJfo8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.206
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f206.google.com with SMTP id 5614622812f47-4ab4f652f9bso814033b6e.0
        for <linux-usb@vger.kernel.org>; Fri, 31 Jul 2026 10:15:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785518131; x=1786122931;
        h=content-type:to:from:subject:message-id:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=K3tTcwFtL4Bfxt++R0Th07j9RVuNpTe8H1LgsE/u8GQ=;
        b=M8J+3jvPJw8VGo8sZUwx76YpMcSEf+hw3Y1mqpQRkVHJVxFKsoqbvhcDkpliBnvicv
         QDQJNbtJXYhyX8fWakOl4BF054OJO/eRnn4B7pB22yRUn011JmMoYroB/DbeZ2MZHEoy
         yHcITM3cMaM06rIV3YFGiAEJbN+OwNMl5e/kk9KJ7MMKSgKD3VTJG7a/gUMVozrkqZeA
         Av7dyAavz8FsGkR4NU14iV9qxQHdjQkjkQWWhGMok8eIvJGLkKdpeGi9bhxn44Cebg8d
         b6Zs+LcftWKm17WNzn+4+ka953sFVqDEX7mAGQy9FHRGxoAXaWJEQp6GQpnk83lluha1
         heSg==
X-Forwarded-Encrypted: i=1; AHgh+RrJiJ36F0DYiTzBovkoMjqq5y0EnGWIs3U3wKxheknYoxr0SdIG8bsbME0mFtYiY78p409Kee1pOF0=@vger.kernel.org
X-Gm-Message-State: AOJu0YxVmEmB4AZoVxVC77XamclgyeWAvJLixhTZcU4ZOYAQpy6H7kEh
	UtGYdm5HoYLgPlnaqLld+RoxxONZ74DRFKl5JOG0RbQOLMkyNCRl7trKr2SejCXT77/13ncQw6K
	Jz4TdSdHJ8y2M3mr7zS13YLAKh+sOdFU8oY5lSfXkkaqrTK3jIHZl50oxzgk=
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:15a9:b0:4ae:f5be:fe29 with SMTP id
 5614622812f47-4af5e0519c0mr1571762b6e.5.1785518130873; Fri, 31 Jul 2026
 10:15:30 -0700 (PDT)
Date: Fri, 31 Jul 2026 10:15:30 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6a6cd832.1aa927e4.17d4bf.0009.GAE@google.com>
Subject: [syzbot] [usb?] memory leak in uvcg_extension_ba_source_id_store
From: syzbot <syzbot+54927260acba030187a6@syzkaller.appspotmail.com>
To: gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    11028ab62899 Merge tag 'probes-fixes-v7.2-rc5' of git://gi..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=13b5b03e580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=ba7c2d1679fb08a2
dashboard link: https://syzkaller.appspot.com/bug?extid=54927260acba030187a6
compiler:       gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=12985499580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=16ab649e580000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/b677b453b580/disk-11028ab6.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/eec6e520d498/vmlinux-11028ab6.xz
kernel image: https://storage.googleapis.com/syzbot-assets/03c59bb4309c/bzImage-11028ab6.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+54927260acba030187a6@syzkaller.appspotmail.com

BUG: memory leak
unreferenced object 0xffff88810ddbd588 (size 8):
  comm "syz.1.37", pid 6113, jiffies 4294948281
  hex dump (first 8 bytes):
    01 00 00 00 00 00 00 00                          ........
  backtrace (crc ccaa009e):
    kmemleak_alloc_recursive include/linux/kmemleak.h:44 [inline]
    slab_post_alloc_hook mm/slub.c:4597 [inline]
    slab_alloc_node mm/slub.c:4917 [inline]
    __do_kmalloc_node mm/slub.c:5333 [inline]
    __kmalloc_noprof+0x3bf/0x550 mm/slub.c:5359
    _kmalloc_noprof include/linux/slab.h:992 [inline]
    _kmalloc_array_noprof include/linux/slab.h:1208 [inline]
    uvcg_extension_ba_source_id_store+0xee/0x180 drivers/usb/gadget/function/uvc_configfs.c:1058
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

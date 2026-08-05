Received: from mail-oo1-f79.google.com (mail-oo1-f79.google.com [209.85.161.79])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 198B01D9A5F
	for <linux-usb@vger.kernel.org>; Wed,  5 Aug 2026 03:13:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.79
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785899605; cv=none; b=d4wVc7E4BbMF4Emef6miCAF4Bj/2R4ve/bxNw5ZrtZR5CJTTYcxc1D9DfhXwRDEKRzb3gH5vxZ7nwaTcKNWVM5mvk0RElILE9Prlqs5R0KtVaeVv/E2eYh+kbLfvtrP/Metzyr9tQxYS8D012BDHjbJ3KoK4JBUBC9buRSWBOhw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785899605; c=relaxed/simple;
	bh=clTICIsFy7PUiTG4RtZ3LYbmXKSV4GiO8/hLkimCVLk=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=r8YCA3zGZkWWTe7fgl03ZGJpUW9PR2o0X9QBHgxH6AYSLHLG2ETaThDiIM/wWYY0/pBjWNeJL2EWvunZeV8WWb4oK/ddDNOEdeJtP1+oTJQhSaEWUbxJUF4LsLsrGoztCKLIn6cbEoj57g2ZLgiqST4S4OaAYpbyHw05O+NqsKY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.161.79
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oo1-f79.google.com with SMTP id 006d021491bc7-6a0f261aeb6so587181eaf.3
        for <linux-usb@vger.kernel.org>; Tue, 04 Aug 2026 20:13:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785899603; x=1786504403;
        h=content-type:to:from:subject:message-id:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sEinLgk6nKBfrSgVLGRRHa/JVOnk19HNYug5SV+RYcE=;
        b=CDqopoiaOFoDBxLmQIcGDExiiEGFtPN2ytUfqxaA2rqxH39TnCKEKWKAHsWDEZHXBb
         d6+/7R+UleGYmLG+Z4gykHFYMbzjsym3jusGMVLX8/Lnivdq+Pt5R9mh6pcpvA2qyS5I
         7dNpswvySU+W4dPAzInGp4siqhslIdftOaskJuKhn5evmlfo6SCOMnsvFs8UKKPIYH7I
         j0qAcrsurPXq/WqEHa2KMNHZNb1CqDj7ZRFh1yyE1Ok9x2m0UDULeelHptD3XNf6dqp5
         O1n8Jr6F52bG5KD0aDYVXPo3e4YG7w3uz5ZNN6+sXvTZJX2xXb4GYqLrp32wVePjkHbb
         hTMw==
X-Forwarded-Encrypted: i=1; AHgh+Rpj518UDiL9aQJ2trQJWR+YdqOL0mZ72ZIheVuxxZSg1MSkwbec/j7MOCC6khvagaiP3LqvgQYV5kg=@vger.kernel.org
X-Gm-Message-State: AOJu0YxjrVYZv1/+VzUi8gIKwEXI1gxXaFAIZeyPgIVAEH0b0i7rYOmj
	TvLiVv3oW2HYZTavZ7GX6ekdij8I+76ygfkw0mH5hkVYvsr9xmV6U5GrOGhdPsp6e0/dKzKQC7X
	aMAp53WTshnp45GeQqaQWc1OmE2+wKa+QJk3xE/K8v5LCDCJPhw4BiS+22B0=
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:c91:b0:6aa:f45a:68cc with SMTP id
 006d021491bc7-6ae96bb305cmr2316035eaf.5.1785899602973; Tue, 04 Aug 2026
 20:13:22 -0700 (PDT)
Date: Tue, 04 Aug 2026 20:13:22 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6a72aa52.13623e66.bdc14.004a.GAE@google.com>
Subject: [syzbot] [usb?] memory leak in f_uac1_opts_c_srate_store
From: syzbot <syzbot+7cc26dd73231714cecd4@syzkaller.appspotmail.com>
To: gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    8ba098e6b6ff Merge tag 'v7.2-rc5-smb3-client-fixes' of git..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=120e09b9580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=ba7c2d1679fb08a2
dashboard link: https://syzkaller.appspot.com/bug?extid=7cc26dd73231714cecd4
compiler:       gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=101d4c9e580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=12000649580000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/7704922b2ff1/disk-8ba098e6.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/15910c78a77e/vmlinux-8ba098e6.xz
kernel image: https://storage.googleapis.com/syzbot-assets/c70f2f8f4678/bzImage-8ba098e6.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+7cc26dd73231714cecd4@syzkaller.appspotmail.com

2026/08/01 03:11:31 executed programs: 5
BUG: memory leak
unreferenced object 0xffff8881116a9c10 (size 8):
  comm "syz.0.19", pid 5937, jiffies 4294943638
  hex dump (first 8 bytes):
    34 00 00 00 00 00 00 00                          4.......
  backtrace (crc 1875d87):
    kmemleak_alloc_recursive include/linux/kmemleak.h:44 [inline]
    slab_post_alloc_hook mm/slub.c:4597 [inline]
    slab_alloc_node mm/slub.c:4917 [inline]
    __do_kmalloc_node mm/slub.c:5333 [inline]
    __kmalloc_node_track_caller_noprof+0x3d3/0x570 mm/slub.c:5471
    __kmemdup_nul mm/util.c:64 [inline]
    kstrdup+0x3c/0x80 mm/util.c:84
    f_uac1_opts_c_srate_store+0xbb/0x170 drivers/usb/gadget/function/f_uac1.c:1666
    flush_write_buffer fs/configfs/file.c:207 [inline]
    configfs_write_iter+0x10d/0x1a0 fs/configfs/file.c:229
    new_sync_write fs/read_write.c:595 [inline]
    vfs_write+0x3ac/0x720 fs/read_write.c:687
    ksys_write+0xa5/0x170 fs/read_write.c:739
    do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
    do_syscall_64+0xf8/0x610 arch/x86/entry/syscall_64.c:94
    entry_SYSCALL_64_after_hwframe+0x77/0x7f

BUG: memory leak
unreferenced object 0xffff888109bd5f20 (size 8):
  comm "syz.0.20", pid 5965, jiffies 4294944214
  hex dump (first 8 bytes):
    34 00 00 00 00 00 00 00                          4.......
  backtrace (crc 1875d87):
    kmemleak_alloc_recursive include/linux/kmemleak.h:44 [inline]
    slab_post_alloc_hook mm/slub.c:4597 [inline]
    slab_alloc_node mm/slub.c:4917 [inline]
    __do_kmalloc_node mm/slub.c:5333 [inline]
    __kmalloc_node_track_caller_noprof+0x3d3/0x570 mm/slub.c:5471
    __kmemdup_nul mm/util.c:64 [inline]
    kstrdup+0x3c/0x80 mm/util.c:84
    f_uac1_opts_c_srate_store+0xbb/0x170 drivers/usb/gadget/function/f_uac1.c:1666
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

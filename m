Received: from mail-oi1-f208.google.com (mail-oi1-f208.google.com [209.85.167.208])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29D5F2F361E
	for <linux-usb@vger.kernel.org>; Sun,  2 Aug 2026 19:33:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.208
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785699209; cv=none; b=F/c/QiTjGgUeMZj/rnZK6Sw9Xah7GFrlahGr2BCZ3hf70FpkCN7mAVUK39ITOcxLVHMWblyfgrkxyNcw8+XQnzSaOSSWLTsQhALzvCZOJRD5MP7JWF487CxN/Yjz6l8vsOFjXOtYzwK27KfoWSzj5q5fBdQs3oCDilYkfdlaGrk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785699209; c=relaxed/simple;
	bh=Tmf95eU38h67RlSOc5/IDaKvWlDyJML3H49atAbxLJs=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=AYUmig5rdNsvYmzsSUzCWSw/vroTj8Yz3eFNZmuOfdmXjV34vbCIfEQgj0sIV8yX2ExGME2gsL6AnirJ8vCQdoYljok1PQSM22BfLCR8oNp77d6ZogTfnIyhNBtekPkDsi/zaivjFZOpgQnIh7njugdmEidCpIpJP013Z//BxwQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.208
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f208.google.com with SMTP id 5614622812f47-4a43d32fa9fso3718051b6e.2
        for <linux-usb@vger.kernel.org>; Sun, 02 Aug 2026 12:33:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785699207; x=1786304007;
        h=content-type:to:from:subject:message-id:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Fl/swWjuypY8j0ebyjkVOUqoL8JWr+sB4G5Jys7JFeM=;
        b=jJyVADk7U9NJcLx3y3FVgJFlptGHa0tZD8oVTqGVoQvFCli8O7jMS9l7wWKkDR8/Q8
         1zGY0iP9yMrRz65Czu1KO+cWgSwXXjBlrkoldt6nXLpSn/BuvHMctX3pruGISFNIy5Os
         dC/vnj07m3Ow+EROkMclj6Fv/s4pgoSL/xeyM8BA5Eu2D57C/ojERurxP71zOSQaF/Zw
         hKfioTasqHvMnPxxp+sSQHgonq4HPXZX3meEXg/xUeNXxfuQ1fnq/PdW8T4nD8/PPGgT
         oVBSctOz9ummSoGNG3D8v1Obaxws3qBHDkpXqOGR/1GUzNToWIbYWODHjfkgpR9pshDR
         MgPQ==
X-Forwarded-Encrypted: i=1; AHgh+Rr1l4Bqnc5Xznbn6VjiasC+plON7Do/26GQpDs2x4S1InCosm8jag7CLEKdH90m5Sq5mmbkxZKKsZc=@vger.kernel.org
X-Gm-Message-State: AOJu0YzEwrKtD4jf4crXfL6BFlfcYUe12SD/2aWiMIFcVLZ23N0Hk7oG
	R+Zd/5cfakAUJJLkGHLDxU8beYRnCIdb375+BxGTH3XS6gQNB+jUdTbh6bVXaBXaT8esfum7R25
	TtRoJoQXt86DFcKFPImP2vtqjkuF1oXgMAqVg8WpnJ5ULZNr5iFky8SbwcS8=
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:19a9:b0:4a4:ed9a:e793 with SMTP id
 5614622812f47-4af5e25c8c8mr13990855b6e.16.1785699207107; Sun, 02 Aug 2026
 12:33:27 -0700 (PDT)
Date: Sun, 02 Aug 2026 12:33:27 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6a6f9b87.13bfb6d0.1ecdd5.0275.GAE@google.com>
Subject: [syzbot] [usb?] memory leak in f_uac2_opts_p_srate_store
From: syzbot <syzbot+87c10526d2cfa8d14ff6@syzkaller.appspotmail.com>
To: gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    fc02acf6ac0c Merge tag 'platform-drivers-x86-v7.2-4' of gi..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=11b3a49e580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=ba7c2d1679fb08a2
dashboard link: https://syzkaller.appspot.com/bug?extid=87c10526d2cfa8d14ff6
compiler:       gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=148cd1b9580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=141f38c6580000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/b9d1b7c8f45c/disk-fc02acf6.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/a68eafefb074/vmlinux-fc02acf6.xz
kernel image: https://storage.googleapis.com/syzbot-assets/89c624fcb62b/bzImage-fc02acf6.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+87c10526d2cfa8d14ff6@syzkaller.appspotmail.com

2026/07/29 19:24:36 executed programs: 7
BUG: memory leak
unreferenced object 0xffff888112f1fd80 (size 64):
  comm "syz.0.21", pid 5964, jiffies 4294942888
  hex dump (first 32 bytes):
    34 34 31 30 30 00 34 38 30 30 30 00 38 38 32 30  44100.48000.8820
    30 00 39 36 30 30 30 00 31 37 36 34 30 30 00 31  0.96000.176400.1
  backtrace (crc 6cdecf20):
    kmemleak_alloc_recursive include/linux/kmemleak.h:44 [inline]
    slab_post_alloc_hook mm/slub.c:4597 [inline]
    slab_alloc_node mm/slub.c:4917 [inline]
    __do_kmalloc_node mm/slub.c:5333 [inline]
    __kmalloc_node_track_caller_noprof+0x3d3/0x570 mm/slub.c:5471
    __kmemdup_nul mm/util.c:64 [inline]
    kstrdup+0x3c/0x80 mm/util.c:84
    f_uac2_opts_p_srate_store+0xbb/0x170 drivers/usb/gadget/function/f_uac2.c:2087
    flush_write_buffer fs/configfs/file.c:207 [inline]
    configfs_write_iter+0x10d/0x1a0 fs/configfs/file.c:229
    new_sync_write fs/read_write.c:595 [inline]
    vfs_write+0x3ac/0x720 fs/read_write.c:687
    ksys_write+0xa5/0x170 fs/read_write.c:739
    do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
    do_syscall_64+0xf8/0x610 arch/x86/entry/syscall_64.c:94
    entry_SYSCALL_64_after_hwframe+0x77/0x7f

BUG: memory leak
unreferenced object 0xffff888113454dc0 (size 64):
  comm "syz.0.23", pid 5967, jiffies 4294943452
  hex dump (first 32 bytes):
    34 34 31 30 30 00 34 38 30 30 30 00 38 38 32 30  44100.48000.8820
    30 00 39 36 30 30 30 00 31 37 36 34 30 30 00 31  0.96000.176400.1
  backtrace (crc 6cdecf20):
    kmemleak_alloc_recursive include/linux/kmemleak.h:44 [inline]
    slab_post_alloc_hook mm/slub.c:4597 [inline]
    slab_alloc_node mm/slub.c:4917 [inline]
    __do_kmalloc_node mm/slub.c:5333 [inline]
    __kmalloc_node_track_caller_noprof+0x3d3/0x570 mm/slub.c:5471
    __kmemdup_nul mm/util.c:64 [inline]
    kstrdup+0x3c/0x80 mm/util.c:84
    f_uac2_opts_p_srate_store+0xbb/0x170 drivers/usb/gadget/function/f_uac2.c:2087
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

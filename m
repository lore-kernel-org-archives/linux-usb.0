Received: from mail-oa1-f77.google.com (mail-oa1-f77.google.com [209.85.160.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B48FD4137BD
	for <linux-usb@vger.kernel.org>; Fri, 21 Aug 2026 07:52:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.77
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787298754; cv=none; b=Pa8xRtbyvzJWrm1zGHw+g3zo4UnvfhaA/5ARaQxb8K1Z0RaRUPMkPKyb6n+j1as3NTjHYlwEuELtb0O/PXrvmO4ooUkgMjwNIzZyuDMfkbeqYIyQ81ZHDXvcQd///fe5eRntAz63zH8doBhAQgb8gQxWlw4OiwnCQHNInALFb40=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787298754; c=relaxed/simple;
	bh=G6TaS8W0XnUj1TOB5YQb6XF4pTiLNAI/JeKpzTEAOUg=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=PvlyPz6w7YR22PfzpKpKVwbz14gtKddQ2FAiNMu0nQiXWzXVZxibtWamRPDs5W01t3E8DrtXGfruFOYNFBXh7QsDQ3ZHhike7VAkGwd4IqFec7nmWFrCaDRiQjGmPhdNjrsMi8cb/gVZ1hz0PUcD8QXv7WzZZiCB0tQi+wMkiio=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.160.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oa1-f77.google.com with SMTP id 586e51a60fabf-448d51840c4so569619fac.1
        for <linux-usb@vger.kernel.org>; Fri, 21 Aug 2026 00:52:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787298751; x=1787903551;
        h=content-type:to:from:subject:message-id:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qIFdAOXNWbl7qU8Unj3S4xkXuSK6NjwXSTAAixwd9kQ=;
        b=es4FvfAxZgR7sec+5Rs07HaLLs5Yt5GNJlrKXg179g42eS3zk+0P4tRFX8WeSEReZp
         2ER31FuJSiS+pcz9FIRXywY3SQIkzs5d3ttIcBVyj+WmKrLPz57oRifCfO2rf+2sBGab
         zB4TqIobjTsnD61qkNtso++Scrj8HA18hNWaWWZaDH6eAvU95Zwn7CUwtV2fWn6dve+6
         eidbMEQo1wKp9FJLRWgHc+5VrJL9RVAmqaFFjFYryRHMnsMabBhqWoKD+dHjfS77IXZc
         peWW4KJSI0CLuZIqusNe8+Y0Avr7who8QtseMlU2Of3swRYtlvugvviyflVK5DZliK4S
         ukcw==
X-Forwarded-Encrypted: i=1; AHgh+RrhvOTyriSTdp4z0jcvoBV/ix7JLiE6Tdx4otR5isos9V9jLQo4VwsjFYWx9OH32MZ+fXixYQRLurw=@vger.kernel.org
X-Gm-Message-State: AOJu0YyJ6u+WxrSqXeMn59YqpGJmXi++GKjrs17JFHcUYRT0Vm2OspCx
	yde7foyv+x2qhMEapB+HR6xRHxWsec+/MZOKDjnmpxCyGPz5xSkI/MFt4djUGh5M8xJSKz2j5F2
	wyElZzNJdJhLLB8XnID1pOUuKju9m4Zb3E1J0kTAcMLWzHvDkVSKLTK1937o=
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:83c6:10b0:6b1:4b76:1c18 with SMTP id
 006d021491bc7-6b159461f6emr3510570eaf.24.1787298751690; Fri, 21 Aug 2026
 00:52:31 -0700 (PDT)
Date: Fri, 21 Aug 2026 00:52:31 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6a8803bf.dbb3a75c.13dd47.0009.GAE@google.com>
Subject: [syzbot] [usb?] KASAN: slab-out-of-bounds Read in gether_get_ifname
From: syzbot <syzbot+3a0d6aa450317f25e501@syzkaller.appspotmail.com>
To: gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    21d6ac051080 Merge branch 'for-next/core' into for-kernelci
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git for-kernelci
console output: https://syzkaller.appspot.com/x/log.txt?x=163ad6c6580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=d1128bc53f2ef7f3
dashboard link: https://syzkaller.appspot.com/bug?extid=3a0d6aa450317f25e501
compiler:       Debian clang version 22.1.8 (++20260613092233+e80beda6e255-1~exp1~20260613092250.77), Debian LLD 22.1.8
userspace arch: arm64
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=10cbfa79580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=1182d949580000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/88380e2ddcb9/disk-21d6ac05.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/5dba5c2896b7/vmlinux-21d6ac05.xz
kernel image: https://storage.googleapis.com/syzbot-assets/52ac739e37e0/Image-21d6ac05.gz.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+3a0d6aa450317f25e501@syzkaller.appspotmail.com

==================================================================
BUG: KASAN: slab-out-of-bounds in gether_get_ifname+0x104/0x124 drivers/usb/gadget/function/u_ether.c:1033
Read of size 1 at addr ffff0000d09b5042 by task syz.0.17/4928

CPU: 1 UID: 0 PID: 4928 Comm: syz.0.17 Not tainted syzkaller #0 PREEMPT 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 08/07/2026
Call trace:
 show_stack+0x2c/0x3c arch/arm64/kernel/stacktrace.c:499 (C)
 __dump_stack+0x30/0x40 lib/dump_stack.c:94
 dump_stack_lvl+0xd8/0x12c lib/dump_stack.c:120
 print_address_description+0xb0/0x238 mm/kasan/report.c:378
 print_report+0x68/0x84 mm/kasan/report.c:482
 kasan_report+0x8c/0xc4 mm/kasan/report.c:595
 __asan_report_load1_noabort+0x20/0x2c mm/kasan/report_generic.c:378
 gether_get_ifname+0x104/0x124 drivers/usb/gadget/function/u_ether.c:1033
 f_phonet_ifname_show+0x4c/0x60 drivers/usb/gadget/function/f_phonet.c:603
 fill_read_buffer fs/configfs/file.c:68 [inline]
 configfs_read_iter+0x234/0x508 fs/configfs/file.c:88
 new_sync_read fs/read_write.c:493 [inline]
 vfs_read+0x498/0x8c8 fs/read_write.c:574
 ksys_read+0x12c/0x228 fs/read_write.c:716
 __do_sys_read fs/read_write.c:725 [inline]
 __se_sys_read fs/read_write.c:723 [inline]
 __arm64_sys_read+0x84/0x98 fs/read_write.c:723
 __invoke_syscall arch/arm64/kernel/syscall.c:35 [inline]
 invoke_syscall+0x98/0x244 arch/arm64/kernel/syscall.c:49
 el0_svc_common+0xec/0x23c arch/arm64/kernel/syscall.c:121
 do_el0_svc+0x4c/0x5c arch/arm64/kernel/syscall.c:140
 el0_svc+0x64/0x260 arch/arm64/kernel/entry-common.c:758
 el0t_64_sync_handler+0x44/0x104 arch/arm64/kernel/entry-common.c:777
 el0t_64_sync+0x198/0x19c arch/arm64/kernel/entry.S:590

Allocated by task 4928:
 kasan_save_stack mm/kasan/common.c:57 [inline]
 kasan_save_track+0x40/0x78 mm/kasan/common.c:78
 kasan_save_alloc_info+0x40/0x50 mm/kasan/generic.c:570
 poison_kmalloc_redzone mm/kasan/common.c:398 [inline]
 __kasan_kmalloc+0x9c/0xb4 mm/kasan/common.c:415
 kasan_kmalloc include/linux/kasan.h:263 [inline]
 __do_kmalloc_node mm/slub.c:5334 [inline]
 __kvmalloc_node_noprof+0x460/0x7d8 mm/slub.c:6905
 alloc_netdev_mqs+0xac/0xf2c net/core/dev.c:12055
 gphonet_setup_default+0x38/0x88 drivers/usb/gadget/function/f_phonet.c:706
 phonet_alloc_inst+0x84/0x100 drivers/usb/gadget/function/f_phonet.c:640
 try_get_usb_function_instance+0xe4/0x164 drivers/usb/gadget/functions.c:28
 usb_get_function_instance+0x24/0xb0 drivers/usb/gadget/functions.c:44
 function_make+0x110/0x300 drivers/usb/gadget/configfs.c:626
 configfs_mkdir+0x374/0x7d4 fs/configfs/dir.c:1360
 vfs_mkdir+0x2dc/0x464 fs/namei.c:5276
 filename_mkdirat+0x228/0x3f4 fs/namei.c:5309
 __do_sys_mkdirat fs/namei.c:5330 [inline]
 __se_sys_mkdirat fs/namei.c:5327 [inline]
 __arm64_sys_mkdirat+0x9c/0xc0 fs/namei.c:5327
 __invoke_syscall arch/arm64/kernel/syscall.c:35 [inline]
 invoke_syscall+0x98/0x244 arch/arm64/kernel/syscall.c:49
 el0_svc_common+0xec/0x23c arch/arm64/kernel/syscall.c:121
 do_el0_svc+0x4c/0x5c arch/arm64/kernel/syscall.c:140
 el0_svc+0x64/0x260 arch/arm64/kernel/entry-common.c:758
 el0t_64_sync_handler+0x44/0x104 arch/arm64/kernel/entry-common.c:777
 el0t_64_sync+0x198/0x19c arch/arm64/kernel/entry.S:590

The buggy address belongs to the object at ffff0000d09b4000
 which belongs to the cache kmalloc-cg-4k of size 4096
The buggy address is located 314 bytes to the right of
 allocated 3848-byte region [ffff0000d09b4000, ffff0000d09b4f08)

The buggy address belongs to the physical page:
page: refcount:0 mapcount:0 mapping:0000000000000000 index:0x0 pfn:0x1109b0
head: order:3 mapcount:0 entire_mapcount:0 nr_pages_mapped:0 pincount:0
memcg:ffff0000cb462741
flags: 0x5ffc00000000040(head|node=0|zone=2|lastcpupid=0x7ff)
page_type: f5(slab)
raw: 05ffc00000000040 ffff0000c000b500 dead000000000100 dead000000000122
raw: 0000000000000000 0000000800040004 00000000f5000000 ffff0000cb462741
head: 05ffc00000000040 ffff0000c000b500 dead000000000100 dead000000000122
head: 0000000000000000 0000000800040004 00000000f5000000 ffff0000cb462741
head: 05ffc00000000003 fffffdffc3426c01 00000000ffffffff 00000000ffffffff
head: ffffffffffffffff 0000000000000000 00000000ffffffff 0000000000000008
page dumped because: kasan: bad access detected

Memory state around the buggy address:
 ffff0000d09b4f00: 00 fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
 ffff0000d09b4f80: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
>ffff0000d09b5000: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
                                           ^
 ffff0000d09b5080: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
 ffff0000d09b5100: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
==================================================================


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

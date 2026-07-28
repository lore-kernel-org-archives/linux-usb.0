Received: from mail-oo1-f77.google.com (mail-oo1-f77.google.com [209.85.161.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87F234483A5
	for <linux-usb@vger.kernel.org>; Tue, 28 Jul 2026 14:25:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.77
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785248728; cv=none; b=CIAr/ilapIl061ap33UiE3C8VJCUd4z6c+rIctPgvAHEf82ouVCjdrDW7ELorIgk6n9LCeY2EDLRzJUIfe155HPTB9ZFlKr1IapK5I6l41YYkrHwauMYnnCCYcCCxfN0BL1fMcG2qYD9M5u4fPReALsK8S+796aV5hhw7wIl1Es=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785248728; c=relaxed/simple;
	bh=LMGRSM/oX8RqJL+i7DXWwvpCdqq+g8XgGPkDNjX4gF4=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=BG5+/JdbQnWayQ4MM0U6MBBpWun/iGQ+AjgF3QVn57MQztJ7sRngO4JHRw2ZjUonS56Qb0kzAny45rBcP4HbTOrcLNA3/wTEQTEdDPFDLcjm5rq0gyj9Y+MN3AcZuYMSSpB8u9Inv8gjo6ZLbxb9Jwu+ohTYig2ADGuCrfxdnOE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.161.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oo1-f77.google.com with SMTP id 006d021491bc7-6aae0178901so2644078eaf.3
        for <linux-usb@vger.kernel.org>; Tue, 28 Jul 2026 07:25:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785248725; x=1785853525;
        h=content-type:to:from:subject:message-id:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WlkWaiug1P5hgMVpnJAyNJhfgMpe19wHtymrYSDRC3Q=;
        b=fG6BmR948M3KiIudqWJpO0ZKIVuhLoJOsh05akZU2QtqdZsDJn1lQuX4IfYTDd5kuc
         7sJlhBaOEfpAzkm7/GCGsa43GdTr39ywCVQvd+JNVzKxoXrXu2dSxGhg8o0GBNqD7iqu
         cE2Wt20xGJlTNP1UIHdtY9SmjgZQRQQSyVG0MZsI8ER4H9iVCU2afgPC6YX9sCseb3l/
         aBdow/Ig0zWU1tJPQRfcXhjuXHOodnhK8BBSif4M1gtCEJV/t6OvnCTK8Td2pqBCYuGP
         thpd9v4puIv6gPKzxEj5cwVSkBRpmsjZsrqRQMFousTYHREYy6LAay9/wl78IReYOFHR
         Ui3A==
X-Forwarded-Encrypted: i=1; AHgh+RoVNg2LF0nSf1p1TTRBMrNm4Ar9vTZXvzmGpiEnM+pwzDcB7gJ1GuRTvHQ4fYTDXQ+YB7/Fhnm3frQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YxvEQ0fL7aDDatBjEBLFcTQEl3YSh7dqXm8CAh81ODZX2uxuNkx
	kLRD5jJg1fO7Q5qPbft/wCpcrVo/AN7X9EIjxeAljj6EpNgU0DjbhnfZ1vkLxzsSafu299VobbY
	V9nr7MeX/5f8SdLCxYZBA6ZIpWUqh/YhqE1SA1xiTBtz8RTT+VnyEv0MkO9Y=
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a4a:e84b:0:b0:6aa:d792:e078 with SMTP id
 006d021491bc7-6ac96a5bdf0mr901770eaf.27.1785248725339; Tue, 28 Jul 2026
 07:25:25 -0700 (PDT)
Date: Tue, 28 Jul 2026 07:25:25 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6a68bbd5.073198cf.94f0f.004a.GAE@google.com>
Subject: [syzbot] [usb?] KASAN: slab-use-after-free Read in stub_rx_loop
From: syzbot <syzbot+06fa667a0931a3430026@syzkaller.appspotmail.com>
To: gregkh@linuxfoundation.org, i@zenithal.me, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org, shuah@kernel.org, syzkaller-bugs@googlegroups.com, 
	valentina.manea.m@gmail.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    48a5a7ab8d6a Merge tag 'v7.2-rc4-smb3-client-fixes' of git..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=113c32ea580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=20c9876b0f77b546
dashboard link: https://syzkaller.appspot.com/bug?extid=06fa667a0931a3430026
compiler:       Debian clang version 22.1.8 (++20260613092233+e80beda6e255-1~exp1~20260613092250.77), Debian LLD 22.1.8

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image (non-bootable): https://storage.googleapis.com/syzbot-assets/d900f083ada3/non_bootable_disk-48a5a7ab.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/cca5551ec121/vmlinux-48a5a7ab.xz
kernel image: https://storage.googleapis.com/syzbot-assets/30b6e710a3ae/bzImage-48a5a7ab.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+06fa667a0931a3430026@syzkaller.appspotmail.com

==================================================================
BUG: KASAN: slab-use-after-free in stub_recv_cmd_submit drivers/usb/usbip/stub_rx.c:609 [inline]
BUG: KASAN: slab-use-after-free in stub_rx_pdu drivers/usb/usbip/stub_rx.c:688 [inline]
BUG: KASAN: slab-use-after-free in stub_rx_loop+0x2965/0x2ee0 drivers/usb/usbip/stub_rx.c:707
Read of size 4 at addr ffff888012cacdb0 by task stub_rx/5324

CPU: 0 UID: 0 PID: 5324 Comm: stub_rx Not tainted syzkaller #0 PREEMPT(full) 
Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.3-debian-1.16.3-2 04/01/2014
Call Trace:
 <TASK>
 dump_stack_lvl+0xe8/0x150 lib/dump_stack.c:120
 print_address_description+0x55/0x1e0 mm/kasan/report.c:378
 print_report+0x58/0x70 mm/kasan/report.c:482
 kasan_report+0x117/0x150 mm/kasan/report.c:595
 stub_recv_cmd_submit drivers/usb/usbip/stub_rx.c:609 [inline]
 stub_rx_pdu drivers/usb/usbip/stub_rx.c:688 [inline]
 stub_rx_loop+0x2965/0x2ee0 drivers/usb/usbip/stub_rx.c:707
 kthread+0x388/0x470 kernel/kthread.c:436
 ret_from_fork+0x514/0xb70 arch/x86/kernel/process.c:158
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245
 </TASK>

Allocated by task 5324:
 kasan_save_stack mm/kasan/common.c:57 [inline]
 kasan_save_track+0x3e/0x80 mm/kasan/common.c:78
 unpoison_slab_object mm/kasan/common.c:340 [inline]
 __kasan_slab_alloc+0x6c/0x80 mm/kasan/common.c:366
 kasan_slab_alloc include/linux/kasan.h:253 [inline]
 slab_post_alloc_hook mm/slub.c:4612 [inline]
 slab_alloc_node mm/slub.c:4945 [inline]
 kmem_cache_alloc_noprof+0x2a0/0x5f0 mm/slub.c:4959
 stub_priv_alloc drivers/usb/usbip/stub_rx.c:314 [inline]
 stub_recv_cmd_submit drivers/usb/usbip/stub_rx.c:490 [inline]
 stub_rx_pdu drivers/usb/usbip/stub_rx.c:688 [inline]
 stub_rx_loop+0xad9/0x2ee0 drivers/usb/usbip/stub_rx.c:707
 kthread+0x388/0x470 kernel/kthread.c:436
 ret_from_fork+0x514/0xb70 arch/x86/kernel/process.c:158
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245

Freed by task 5325:
 kasan_save_stack mm/kasan/common.c:57 [inline]
 kasan_save_track+0x3e/0x80 mm/kasan/common.c:78
 kasan_save_free_info+0x40/0x50 mm/kasan/generic.c:584
 poison_slab_object mm/kasan/common.c:253 [inline]
 __kasan_slab_free+0x5c/0x80 mm/kasan/common.c:285
 kasan_slab_free include/linux/kasan.h:235 [inline]
 slab_free_hook mm/slub.c:2705 [inline]
 slab_free mm/slub.c:6405 [inline]
 kmem_cache_free+0x182/0x650 mm/slub.c:6532
 stub_send_ret_submit drivers/usb/usbip/stub_tx.c:333 [inline]
 stub_tx_loop+0x1b16/0x2800 drivers/usb/usbip/stub_tx.c:437
 kthread+0x388/0x470 kernel/kthread.c:436
 ret_from_fork+0x514/0xb70 arch/x86/kernel/process.c:158
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245

The buggy address belongs to the object at ffff888012cacd80
 which belongs to the cache stub_priv of size 64
The buggy address is located 48 bytes inside of
 freed 64-byte region [ffff888012cacd80, ffff888012cacdc0)

The buggy address belongs to the physical page:
page: refcount:0 mapcount:0 mapping:0000000000000000 index:0xffff888012cace00 pfn:0x12cac
flags: 0xfff00000000200(workingset|node=0|zone=1|lastcpupid=0x7ff)
page_type: f5(slab)
raw: 00fff00000000200 ffff888033fd4280 ffff8880340e27c8 ffff8880340e27c8
raw: ffff888012cace00 000000080020001c 00000000f5000000 0000000000000000
page dumped because: kasan: bad access detected
page_owner tracks the page as allocated
page last allocated via order 0, migratetype Unmovable, gfp_mask 0xd2820(GFP_ATOMIC|__GFP_NOWARN|__GFP_NORETRY|__GFP_COMP|__GFP_NOMEMALLOC), pid 5324, tgid 5324 (stub_rx), ts 94362120884, free_ts 93984048542
 set_page_owner include/linux/page_owner.h:32 [inline]
 post_alloc_hook+0x1f9/0x250 mm/page_alloc.c:1859
 prep_new_page mm/page_alloc.c:1867 [inline]
 get_page_from_freelist+0x21fa/0x2270 mm/page_alloc.c:3946
 __alloc_frozen_pages_noprof+0x18d/0x380 mm/page_alloc.c:5304
 alloc_slab_page mm/slub.c:3294 [inline]
 allocate_slab+0x79/0x5e0 mm/slub.c:3408
 new_slab mm/slub.c:3454 [inline]
 refill_objects+0x2d5/0x350 mm/slub.c:7338
 refill_sheaf mm/slub.c:2832 [inline]
 __pcs_replace_empty_main+0x2bf/0x6b0 mm/slub.c:4703
 alloc_from_pcs mm/slub.c:4801 [inline]
 slab_alloc_node mm/slub.c:4933 [inline]
 kmem_cache_alloc_noprof+0x382/0x5f0 mm/slub.c:4959
 stub_priv_alloc drivers/usb/usbip/stub_rx.c:314 [inline]
 stub_recv_cmd_submit drivers/usb/usbip/stub_rx.c:490 [inline]
 stub_rx_pdu drivers/usb/usbip/stub_rx.c:688 [inline]
 stub_rx_loop+0xad9/0x2ee0 drivers/usb/usbip/stub_rx.c:707
 kthread+0x388/0x470 kernel/kthread.c:436
 ret_from_fork+0x514/0xb70 arch/x86/kernel/process.c:158
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245
page last free pid 4993 tgid 4993 stack trace:
 reset_page_owner include/linux/page_owner.h:25 [inline]
 __free_pages_prepare mm/page_alloc.c:1406 [inline]
 __free_frozen_pages+0xc1e/0xd10 mm/page_alloc.c:2950
 __slab_free+0x274/0x2c0 mm/slub.c:5767
 qlink_free mm/kasan/quarantine.c:163 [inline]
 qlist_free_all+0x99/0x100 mm/kasan/quarantine.c:179
 kasan_quarantine_reduce+0x148/0x160 mm/kasan/quarantine.c:286
 __kasan_slab_alloc+0x22/0x80 mm/kasan/common.c:350
 kasan_slab_alloc include/linux/kasan.h:253 [inline]
 slab_post_alloc_hook mm/slub.c:4612 [inline]
 slab_alloc_node mm/slub.c:4945 [inline]
 kmem_cache_alloc_node_noprof+0x355/0x610 mm/slub.c:5017
 __alloc_skb+0x1d7/0x7a0 net/core/skbuff.c:704
 alloc_skb include/linux/skbuff.h:1384 [inline]
 alloc_skb_with_frags+0xc6/0x760 net/core/skbuff.c:6769
 sock_alloc_send_pskb+0x878/0x990 net/core/sock.c:3013
 unix_dgram_sendmsg+0x4fe/0x1870 net/unix/af_unix.c:2136
 sock_sendmsg_nosec+0x13a/0x180 net/socket.c:775
 __sock_sendmsg net/socket.c:790 [inline]
 sock_write_iter+0x2de/0x3e0 net/socket.c:1241
 do_iter_readv_writev+0x612/0x8c0 fs/read_write.c:-1
 vfs_writev+0x343/0x990 fs/read_write.c:1058
 do_writev+0x154/0x2e0 fs/read_write.c:1104
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0x174/0x580 arch/x86/entry/syscall_64.c:94

Memory state around the buggy address:
 ffff888012cacc80: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
 ffff888012cacd00: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
>ffff888012cacd80: fa fb fb fb fb fb fb fb fc fc fc fc fc fc fc fc
                                     ^
 ffff888012cace00: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
 ffff888012cace80: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
==================================================================


---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this issue. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.

If the report is already addressed, let syzbot know by replying with:
#syz fix: exact-commit-title

If you want to overwrite report's subsystems, reply with:
#syz set subsystems: new-subsystem
(See the list of subsystem names on the web dashboard)

If the report is a duplicate of another one, reply with:
#syz dup: exact-subject-of-another-report

If you want to undo deduplication, reply with:
#syz undup

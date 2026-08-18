Received: from mail-oo1-f80.google.com (mail-oo1-f80.google.com [209.85.161.80])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0F02372B3C
	for <linux-usb@vger.kernel.org>; Tue, 18 Aug 2026 07:33:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.80
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787038424; cv=none; b=BDDqUJSvzvfikslu+4lVKVNo7z6JIl1Mxn/NgmNPNTLd5oSGQf3hPoqnI5JEt7aptiCc0fPDIRfUNeNaJIzVHUyC5nztLbwBNxLJ1br4YFdOiDT0GqMmlK/bOzY35x3mcjhlBc04ZJBOVDmjWI36Tz2hQ+Nz5AqBVZ07eUgNpxw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787038424; c=relaxed/simple;
	bh=cJ8mq7LRVYBRUSgar/Dx6kV2o3ToiSD/j+tH9PUDf/8=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=szaj2r73RHV5g/K0q9kOIJabO+t2b3f6jmh1+9bZwHh3XQl+klzaP5Wxln2xoLI7upoSU/+zPD+j1sQVkyaVynCoFYJMDKH1+2wPUIxXtVppWIEscE0nwQNa85dMtzPLk4L/m5wg6Vjhr9R0FUM/z9HVmMhn+JdfW/mk9oUOjHw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.161.80
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oo1-f80.google.com with SMTP id 006d021491bc7-6aaefd6909fso1829782eaf.2
        for <linux-usb@vger.kernel.org>; Tue, 18 Aug 2026 00:33:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787038421; x=1787643221;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=D/Pu0tUT0jDTCBAL9xVL4bqD/SUtFzp7N+PghEyKeH4=;
        b=e98ZjEPwHdFcDoEberKnYaWY8nG8eW2QxYseIOnZR/s4RKhltPIY6yBHqmDbtFj9bg
         EWAwnrtZ9RfdKxZ8II9ANlzjjLhcUsJJ2hBcVXvJxtJAqqI+KdRmzOhMVz7VgfXDE+Hs
         KmQ6C4cxynx38mJ8MVp4hTFJGK+sIvuitACRh9m0FVB9easJ11rCYEGO/1S7skGiO1Li
         RWwU8p8tuKY9e8cvHMwNMOVLHCYzXD0G6OfjB2n3x/+Tp5olRD0enYkTInKGDZu/bdR0
         kkICFlz+9nBCO/jsiWFCb5KNv3tx1cxZAYNAGOrl7UdsBeNm13tyQBICywVUl5iqEjma
         eabg==
X-Forwarded-Encrypted: i=1; AHgh+Ro7odHqZNjnBJcaT53meHgvhqlIot6XWSWScqDPLKsA+gWNuL/2v/Ro6x0L8y9ibrLTpcKOY0A55NM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw2CzHvw7WC67GajcKcJiz0lNfJ4dDKrpL0jytIK7m7KWqDwlF4
	1rXuHREz6n1bbK5lmtxWbTV2KMFUMdyYZeCO09MKw4OD7yyO+wUtgXfPV5QA5RPwlXIy7WZ4TMr
	MtFN5A0X+JGZtW3UTbCfMNhNGFNzV5Ku31I1im1/vjsXbPnUZ8hRjAGf9CFc=
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:812:b0:6aa:cf21:17f1 with SMTP id
 006d021491bc7-6b0d5fb5ec1mr23455740eaf.6.1787038421686; Tue, 18 Aug 2026
 00:33:41 -0700 (PDT)
Date: Tue, 18 Aug 2026 00:33:41 -0700
In-Reply-To: <6a6d3a2e.6ce73036.24301b.0009.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6a840ad5.dcb60774.13163.0000.GAE@google.com>
Subject: Re: [syzbot] [usb?] KASAN: slab-use-after-free Write in pn_bind
From: syzbot <syzbot+098999e05b6b877c01b3@syzkaller.appspotmail.com>
To: gregkh@linuxfoundation.org, khiemtranzo532001@gmail.com, 
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

syzbot has found a reproducer for the following issue on:

HEAD commit:    ff68e5f557f6 Merge tag 'vfs-7.3-rc1.sync' of git://git.ker..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=17efb949580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=4d46975f8386d57
dashboard link: https://syzkaller.appspot.com/bug?extid=098999e05b6b877c01b3
compiler:       gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=14696679580000

Downloadable assets:
disk image (non-bootable): https://storage.googleapis.com/syzbot-assets/d900f083ada3/non_bootable_disk-ff68e5f5.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/fefd3643adde/vmlinux-ff68e5f5.xz
kernel image: https://storage.googleapis.com/syzbot-assets/be748602ff8b/bzImage-ff68e5f5.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+098999e05b6b877c01b3@syzkaller.appspotmail.com

==================================================================
BUG: KASAN: slab-use-after-free in gphonet_set_gadget drivers/usb/gadget/function/f_phonet.c:720 [inline]
BUG: KASAN: slab-use-after-free in pn_bind+0x550/0x5b0 drivers/usb/gadget/function/f_phonet.c:510
Write of size 8 at addr ffff8880361f6800 by task syz.0.19/5910

CPU: 0 UID: 0 PID: 5910 Comm: syz.0.19 Not tainted syzkaller #0 PREEMPT(full) 
Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.3-debian-1.16.3-2 04/01/2014
Call Trace:
 <TASK>
 __dump_stack lib/dump_stack.c:94 [inline]
 dump_stack_lvl+0x100/0x190 lib/dump_stack.c:120
 print_address_description mm/kasan/report.c:378 [inline]
 print_report+0x13d/0x4b0 mm/kasan/report.c:482
 kasan_report+0xdf/0x1c0 mm/kasan/report.c:595
 gphonet_set_gadget drivers/usb/gadget/function/f_phonet.c:720 [inline]
 pn_bind+0x550/0x5b0 drivers/usb/gadget/function/f_phonet.c:510
 usb_add_function+0x219/0x890 drivers/usb/gadget/composite.c:333
 configfs_composite_bind+0xd83/0x1960 drivers/usb/gadget/configfs.c:1802
 gadget_bind_driver+0x28c/0xbf0 drivers/usb/gadget/udc/core.c:1662
 call_driver_probe drivers/base/dd.c:628 [inline]
 really_probe+0x241/0xa60 drivers/base/dd.c:706
 __driver_probe_device+0x20e/0x450 drivers/base/dd.c:868
 driver_probe_device+0x4a/0x140 drivers/base/dd.c:898
 __driver_attach+0x21f/0x5b0 drivers/base/dd.c:1292
 bus_for_each_dev+0x13e/0x1d0 drivers/base/bus.c:383
 bus_add_driver+0x305/0x5b0 drivers/base/bus.c:763
 driver_register+0x1e2/0x360 drivers/base/driver.c:174
 usb_gadget_register_driver_owner+0x132/0x210 drivers/usb/gadget/udc/core.c:1752
 gadget_dev_desc_UDC_store+0x1b0/0x2e0 drivers/usb/gadget/configfs.c:300
 flush_write_buffer fs/configfs/file.c:207 [inline]
 configfs_write_iter+0x302/0x4e0 fs/configfs/file.c:229
 new_sync_write fs/read_write.c:595 [inline]
 vfs_write+0x6ac/0x1050 fs/read_write.c:687
 ksys_write+0x12a/0x250 fs/read_write.c:739
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0x115/0x870 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f810df9e0d9
Code: ff c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 44 00 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 e8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007ffcfd065e28 EFLAGS: 00000246 ORIG_RAX: 0000000000000001
RAX: ffffffffffffffda RBX: 00007f810e225fa0 RCX: 00007f810df9e0d9
RDX: 000000000000000b RSI: 0000200000000280 RDI: 0000000000000003
RBP: 00007ffcfd065e90 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000002
R13: 00007f810e225fac R14: 00007f810e225fa0 R15: 00007f810e225fa0
 </TASK>

Allocated by task 5908:
 kasan_save_stack+0x30/0x50 mm/kasan/common.c:57
 kasan_save_track+0x14/0x30 mm/kasan/common.c:78
 poison_kmalloc_redzone mm/kasan/common.c:398 [inline]
 __kasan_kmalloc+0xaa/0xb0 mm/kasan/common.c:415
 kasan_kmalloc include/linux/kasan.h:263 [inline]
 __do_kmalloc_node mm/slub.c:5334 [inline]
 __kvmalloc_node_noprof+0x34f/0x970 mm/slub.c:6905
 alloc_netdev_mqs+0xd7/0x15c0 net/core/dev.c:12059
 gphonet_setup_default+0x37/0x80 drivers/usb/gadget/function/f_phonet.c:706
 phonet_alloc_inst+0x83/0x130 drivers/usb/gadget/function/f_phonet.c:640
 try_get_usb_function_instance+0x136/0x1f0 drivers/usb/gadget/functions.c:28
 usb_get_function_instance+0x16/0x70 drivers/usb/gadget/functions.c:44
 function_make+0x18c/0x3f0 drivers/usb/gadget/configfs.c:626
 configfs_mkdir+0x51e/0xb70 fs/configfs/dir.c:1360
 vfs_mkdir+0x364/0x850 fs/namei.c:5410
 filename_mkdirat+0x48b/0x5e0 fs/namei.c:5443
 __do_sys_mkdirat fs/namei.c:5464 [inline]
 __se_sys_mkdirat fs/namei.c:5461 [inline]
 __x64_sys_mkdirat+0x89/0xc0 fs/namei.c:5461
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0x115/0x870 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f

Freed by task 5909:
 kasan_save_stack+0x30/0x50 mm/kasan/common.c:57
 kasan_save_track+0x14/0x30 mm/kasan/common.c:78
 kasan_save_free_info+0x3b/0x70 mm/kasan/generic.c:584
 poison_slab_object mm/kasan/common.c:253 [inline]
 __kasan_slab_free+0x5f/0x80 mm/kasan/common.c:285
 kasan_slab_free include/linux/kasan.h:235 [inline]
 slab_free_hook mm/slub.c:2677 [inline]
 slab_free mm/slub.c:6377 [inline]
 kfree+0x22b/0x6c0 mm/slub.c:6692
 device_release+0xd2/0x270 drivers/base/core.c:2636
 kobject_cleanup lib/kobject.c:689 [inline]
 kobject_release lib/kobject.c:720 [inline]
 kref_put include/linux/kref.h:65 [inline]
 kobject_put+0x1f7/0x640 lib/kobject.c:737
 put_device+0x1f/0x30 drivers/base/core.c:3880
 free_netdev+0x5ef/0x8c0 net/core/dev.c:12253
 gphonet_register_netdev drivers/usb/gadget/function/f_phonet.c:729 [inline]
 pn_bind+0x3a7/0x5b0 drivers/usb/gadget/function/f_phonet.c:511
 usb_add_function+0x219/0x890 drivers/usb/gadget/composite.c:333
 configfs_composite_bind+0xd83/0x1960 drivers/usb/gadget/configfs.c:1802
 gadget_bind_driver+0x28c/0xbf0 drivers/usb/gadget/udc/core.c:1662
 call_driver_probe drivers/base/dd.c:628 [inline]
 really_probe+0x241/0xa60 drivers/base/dd.c:706
 __driver_probe_device+0x20e/0x450 drivers/base/dd.c:868
 driver_probe_device+0x4a/0x140 drivers/base/dd.c:898
 __driver_attach+0x21f/0x5b0 drivers/base/dd.c:1292
 bus_for_each_dev+0x13e/0x1d0 drivers/base/bus.c:383
 bus_add_driver+0x305/0x5b0 drivers/base/bus.c:763
 driver_register+0x1e2/0x360 drivers/base/driver.c:174
 usb_gadget_register_driver_owner+0x132/0x210 drivers/usb/gadget/udc/core.c:1752
 gadget_dev_desc_UDC_store+0x1b0/0x2e0 drivers/usb/gadget/configfs.c:300
 flush_write_buffer fs/configfs/file.c:207 [inline]
 configfs_write_iter+0x302/0x4e0 fs/configfs/file.c:229
 new_sync_write fs/read_write.c:595 [inline]
 vfs_write+0x6ac/0x1050 fs/read_write.c:687
 ksys_write+0x12a/0x250 fs/read_write.c:739
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0x115/0x870 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f

The buggy address belongs to the object at ffff8880361f6000
 which belongs to the cache kmalloc-cg-4k of size 4096
The buggy address is located 2048 bytes inside of
 freed 4096-byte region [ffff8880361f6000, ffff8880361f7000)

The buggy address belongs to the physical page:
page: refcount:0 mapcount:0 mapping:0000000000000000 index:0x0 pfn:0x361f0
head: order:3 mapcount:0 entire_mapcount:0 nr_pages_mapped:0 pincount:0
memcg:ffff8880361f1011
flags: 0xfff00000000040(head|node=0|zone=1|lastcpupid=0x7ff)
page_type: f5(slab)
raw: 00fff00000000040 ffff88801c04c280 dead000000000100 dead000000000122
raw: 0000000000000000 0000200000040004 00000000f5000000 ffff8880361f1011
head: 00fff00000000040 ffff88801c04c280 dead000000000100 dead000000000122
head: 0000000000000000 0000200000040004 00000000f5000000 ffff8880361f1011
head: 00fff00000000003 fffffffffffffe01 00000000ffffffff 00000000ffffffff
head: ffffffffffffffff 0000000000000000 00000000ffffffff 0000000000000008
page dumped because: kasan: bad access detected
page_owner tracks the page as allocated
page last allocated via order 3, migratetype Unmovable, gfp_mask 0xd20c0(__GFP_IO|__GFP_FS|__GFP_NOWARN|__GFP_NORETRY|__GFP_COMP|__GFP_NOMEMALLOC), pid 5742, tgid 5742 (syz-executor), ts 50951208937, free_ts 48980735478
 set_page_owner include/linux/page_owner.h:32 [inline]
 post_alloc_hook+0xfd/0x120 mm/page_alloc.c:1859
 prep_new_page mm/page_alloc.c:1867 [inline]
 get_page_from_freelist+0xf48/0x3530 mm/page_alloc.c:3946
 __alloc_frozen_pages_noprof+0x299/0x2dc0 mm/page_alloc.c:5304
 alloc_slab_page mm/slub.c:3266 [inline]
 allocate_slab mm/slub.c:3380 [inline]
 new_slab+0xa2/0x640 mm/slub.c:3426
 refill_objects+0xe3/0x410 mm/slub.c:7310
 refill_sheaf mm/slub.c:2804 [inline]
 __pcs_replace_empty_main+0x376/0x680 mm/slub.c:4675
 alloc_from_pcs mm/slub.c:4773 [inline]
 slab_alloc_node mm/slub.c:4905 [inline]
 __kmalloc_cache_noprof+0x479/0x6c0 mm/slub.c:5485
 _kmalloc_noprof include/linux/slab.h:988 [inline]
 _kzalloc_noprof include/linux/slab.h:1309 [inline]
 snmp6_alloc_dev net/ipv6/addrconf.c:362 [inline]
 ipv6_add_dev+0x670/0x1520 net/ipv6/addrconf.c:413
 addrconf_notify+0x5db/0x1ba0 net/ipv6/addrconf.c:3685
 notifier_call_chain+0x99/0x3f0 kernel/notifier.c:85
 call_netdevice_notifiers_info+0xbe/0x110 net/core/dev.c:2250
 call_netdevice_notifiers_extack net/core/dev.c:2288 [inline]
 call_netdevice_notifiers net/core/dev.c:2302 [inline]
 register_netdevice+0x1998/0x25a0 net/core/dev.c:11488
 __ip_tunnel_create+0x52b/0x670 net/ipv4/ip_tunnel.c:268
 ip_tunnel_init_net+0x230/0x780 net/ipv4/ip_tunnel.c:1150
 ops_init+0x1e2/0x5f0 net/core/net_namespace.c:137
 setup_net+0x118/0x3a0 net/core/net_namespace.c:446
page last free pid 5727 tgid 5727 stack trace:
 reset_page_owner include/linux/page_owner.h:25 [inline]
 __free_pages_prepare mm/page_alloc.c:1406 [inline]
 __free_frozen_pages+0x79f/0x1090 mm/page_alloc.c:2950
 __folio_put+0x3b4/0x5f0 mm/swap.c:112
 folio_put include/linux/mm.h:2124 [inline]
 put_page include/linux/mm.h:2193 [inline]
 put_netmem include/net/netmem.h:394 [inline]
 skb_page_unref include/linux/skbuff_ref.h:43 [inline]
 __skb_frag_unref include/linux/skbuff_ref.h:56 [inline]
 skb_release_data+0x649/0x8e0 net/core/skbuff.c:1116
 skb_release_all net/core/skbuff.c:1197 [inline]
 __kfree_skb+0x4f/0x70 net/core/skbuff.c:1211
 tcp_wmem_free_skb include/net/tcp.h:334 [inline]
 tcp_rtx_queue_unlink_and_free include/net/tcp.h:2321 [inline]
 tcp_clean_rtx_queue net/ipv4/tcp_input.c:3698 [inline]
 tcp_ack+0x2079/0x7650 net/ipv4/tcp_input.c:4400
 tcp_rcv_established+0x116d/0x3990 net/ipv4/tcp_input.c:6589
 tcp_v4_do_rcv+0xbb6/0x1260 net/ipv4/tcp_ipv4.c:1854
 sk_backlog_rcv include/net/sock.h:1190 [inline]
 __release_sock+0x35a/0x440 net/core/sock.c:3260
 release_sock+0x1e5/0x280 net/core/sock.c:3859
 tcp_sendmsg+0x38/0x50 net/ipv4/tcp.c:1452
 inet_sendmsg+0xb9/0x140 net/ipv4/af_inet.c:865
 sock_sendmsg_nosec net/socket.c:800 [inline]
 __sock_sendmsg net/socket.c:815 [inline]
 sock_write_iter+0x4ea/0x5b0 net/socket.c:1266
 new_sync_write fs/read_write.c:595 [inline]
 vfs_write+0x6ac/0x1050 fs/read_write.c:687
 ksys_write+0x1f8/0x250 fs/read_write.c:739
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0x115/0x870 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f

Memory state around the buggy address:
 ffff8880361f6700: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
 ffff8880361f6780: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
>ffff8880361f6800: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
                   ^
 ffff8880361f6880: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
 ffff8880361f6900: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
==================================================================


---
If you want syzbot to run the reproducer, reply with:
#syz test: git://repo/address.git branch-or-commit-hash
If you attach or paste a git patch, syzbot will apply it before testing.

Received: from mail-oi2-f1.google.com (mail-oi2-f1.google.com [74.125.231.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15F932D7DD7
	for <linux-usb@vger.kernel.org>; Sat, 22 Aug 2026 02:22:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787365368; cv=none; b=f5NJ7jJID/qeCEO3LdOiVzHzJU48UC1U31xIhx/6kvqhnbqCH6pOAyMryqq0b3YsxHJduIjrG5uXspZ/cbo6XCtCC6Q11W4ua3eIPCNqHJknjitt3Fzlx77j8qGzzt8TpErem6N79+k2bUDOwjht7r3Qs8tEiCtCJOszXRrVOlY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787365368; c=relaxed/simple;
	bh=8VIVV5Gwtk6AiJPYuHMiGkztl8kPFGQCbd/uFeQHOPw=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=UHxkUksIcOGqyexvUz8XcymlzyA9c/vRJsgTJBEwdTdz88forwsBHu4bhnRjHhWZuf1KmX/2fQS4GzEvGbhk1yrRPLUBBK22V8KPsmvIRhCsiXlEBeSZiccgzlvh5uh1AhMdEoKKfxfXKjRoNHSWDCKHT/EVKEDIGky3OIBZh7A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=74.125.231.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi2-f1.google.com with SMTP id 5614622812f47-495f936d5ecso545948b6e.0
        for <linux-usb@vger.kernel.org>; Fri, 21 Aug 2026 19:22:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787365366; x=1787970166;
        h=content-type:to:from:subject:message-id:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LfjivAHT6jmvjSHIEKQAC5+k/gRivMHBG8qkHdI+2Cs=;
        b=ah0igkGVYgfrhlk3qaJN2BaQzvS+PlCJff1+L1j7epn+K/VmGS/BsTaTRsaUN7Y/fa
         EXVbtRhMXnKZfXfKpkkdadl32HfBEUrrjZUHFvAiJBiRPhSDsw5QFLi3/PbXQztvCM2T
         5CQniyofCtloY+XrM70jz3gpVjRZSsfJZegXvxlmFZi1mBILIil2LgV+6dBZxjzaAi9b
         /X20Vsfes3KiIgq4asX5NLK7LmXPh4BT3qtS1VW4gYErIq+t7lzBgByh/DfXkKjheD7A
         fnbTLl+822fZ8XJ91zi0No6Ml2rHrjSEqiUdV+hTudsH94NPN8K199i2E74uiN87dd4b
         ovpA==
X-Forwarded-Encrypted: i=1; AHgh+RpsY8UvLONjuWzjvPg3gq9utIMIRI8ToUcLME7QCM4DohnbP/+VYWvrmhLp6D9rqRDRdHQ4i6cm8uk=@vger.kernel.org
X-Gm-Message-State: AFuF++n2XmhvYO3eF+4EFFx+2xO8ssc1HhsqMqCe0e1jDmgG6WQXRH27
	17z9awaejj5gsRLbgpn4YxF90hBfIWbjrwg3sILH2vkwDi/Az7TLMROJazFEYflNv4vA61IzqUd
	mtGqcLctsP7metvxzflHPmrpPwgIIsp+R9TCA4egTYFW27lRnXKn8WrnFMws=
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:c14a:b0:4aa:d5f:123e with SMTP id
 5614622812f47-4b309a47942mr4642882b6e.9.1787365365895; Fri, 21 Aug 2026
 19:22:45 -0700 (PDT)
Date: Fri, 21 Aug 2026 19:22:45 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6a8907f5.dbb3a75c.13dd47.0027.GAE@google.com>
Subject: [syzbot] [usb?] KASAN: slab-use-after-free Read in dummy_timer
From: syzbot <syzbot+ba7702afee9d7d1375f0@syzkaller.appspotmail.com>
To: gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    7079a12d7506 Add linux-next specific files for 20260820
git tree:       linux-next
console output: https://syzkaller.appspot.com/x/log.txt?x=16defa25580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=61cbaf6d30cb97db
dashboard link: https://syzkaller.appspot.com/bug?extid=ba7702afee9d7d1375f0
compiler:       Debian clang version 22.1.8 (++20260613092233+e80beda6e255-1~exp1~20260613092250.77), Debian LLD 22.1.8

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/37f483d86dfc/disk-7079a12d.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/2b2d02ae6b4b/vmlinux-7079a12d.xz
kernel image: https://storage.googleapis.com/syzbot-assets/ae5e9209582e/bzImage-7079a12d.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+ba7702afee9d7d1375f0@syzkaller.appspotmail.com

==================================================================
BUG: KASAN: slab-use-after-free in find_endpoint drivers/usb/gadget/udc/dummy_hcd.c:1618 [inline]
BUG: KASAN: slab-use-after-free in dummy_timer+0xcdb/0x4cf0 drivers/usb/gadget/udc/dummy_hcd.c:1890
Read of size 1 at addr ffff8880279f9127 by task syz.0.380/6887

CPU: 0 UID: 0 PID: 6887 Comm: syz.0.380 Tainted: G             L      syzkaller #0 PREEMPT(full) 
Tainted: [L]=SOFTLOCKUP
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 07/24/2026
Call Trace:
 <IRQ>
 dump_stack_lvl+0xe8/0x150 lib/dump_stack.c:120
 print_address_description+0x55/0x1e0 mm/kasan/report.c:378
 print_report+0x58/0x70 mm/kasan/report.c:482
 kasan_report+0x117/0x150 mm/kasan/report.c:595
 find_endpoint drivers/usb/gadget/udc/dummy_hcd.c:1618 [inline]
 dummy_timer+0xcdb/0x4cf0 drivers/usb/gadget/udc/dummy_hcd.c:1890
 __run_hrtimer kernel/time/hrtimer.c:2068 [inline]
 __hrtimer_run_queues+0x3bc/0xa10 kernel/time/hrtimer.c:2125
 hrtimer_run_softirq+0x1e3/0x2e0 kernel/time/hrtimer.c:2142
 handle_softirqs+0x226/0x860 kernel/softirq.c:645
 __do_softirq kernel/softirq.c:679 [inline]
 invoke_softirq kernel/softirq.c:519 [inline]
 __irq_exit_rcu+0xcb/0x220 kernel/softirq.c:767
 irq_exit_rcu+0x9/0x30 kernel/softirq.c:784
 instr_sysvec_apic_timer_interrupt arch/x86/kernel/apic/apic.c:1062 [inline]
 sysvec_apic_timer_interrupt+0xa6/0xc0 arch/x86/kernel/apic/apic.c:1062
 </IRQ>
 <TASK>
 asm_sysvec_apic_timer_interrupt+0x1a/0x20 arch/x86/include/asm/idtentry.h:674
RIP: 0010:__raw_spin_unlock_irqrestore include/linux/spinlock_api_smp.h:211 [inline]
RIP: 0010:_raw_spin_unlock_irqrestore+0x47/0x80 kernel/locking/spinlock.c:221
Code: f7 e8 5d 6a b3 f5 f7 c3 00 02 00 00 74 05 e8 c0 a2 df f5 9c 58 a9 00 02 00 00 75 29 f7 c3 00 02 00 00 74 01 fb bf 01 00 00 00 <e8> 14 86 a4 f5 65 48 8b 05 bc ce c8 07 48 85 c0 74 18 5b 41 5e e9
RSP: 0018:ffffc9000398fd08 EFLAGS: 00000206
RAX: 0000000000000006 RBX: 0000000000000282 RCX: 8000000000000001
RDX: 0000000000000006 RSI: ffffffff8e586ce4 RDI: 0000000000000001
RBP: ffffc9000398fea8 R08: ffffffff909ba57f R09: 1ffffffff21374af
R10: dffffc0000000000 R11: fffffbfff21374b0 R12: dffffc0000000000
R13: 1ffff92000731fac R14: ffff888069752910 R15: ffffc9000398fda0
 hiddev_ioctl+0x1097/0x16f0 drivers/hid/usbhid/hiddev.c:726
 vfs_ioctl fs/ioctl.c:51 [inline]
 __do_sys_ioctl fs/ioctl.c:597 [inline]
 __se_sys_ioctl+0xfc/0x170 fs/ioctl.c:583
 do_syscall_x64 arch/x86/entry/syscall_64.c:61 [inline]
 do_syscall_64+0x166/0x520 arch/x86/entry/syscall_64.c:84
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f32ba19e0d9
Code: ff c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 44 00 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 e8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007f32bafd6028 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
RAX: ffffffffffffffda RBX: 00007f32ba425fa0 RCX: 00007f32ba19e0d9
RDX: 0000200000000400 RSI: 00000000400c4808 RDI: 0000000000000008
RBP: 00007f32ba235024 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000000
R13: 00007f32ba426038 R14: 00007f32ba425fa0 R15: 00007ffdf6daec98
 </TASK>

Allocated by task 6607:
 kasan_save_stack mm/kasan/common.c:57 [inline]
 kasan_save_track+0x3e/0x80 mm/kasan/common.c:78
 poison_kmalloc_redzone mm/kasan/common.c:398 [inline]
 __kasan_kmalloc+0x93/0xb0 mm/kasan/common.c:415
 kasan_kmalloc include/linux/kasan.h:263 [inline]
 __do_kmalloc_node mm/slub.c:5414 [inline]
 __kmalloc_noprof+0x36b/0x720 mm/slub.c:5439
 _kmalloc_noprof include/linux/slab.h:995 [inline]
 usb_copy_descriptors+0xf7/0x320 drivers/usb/gadget/config.c:82
 f_midi2_bind+0x2736/0x2c40 drivers/usb/gadget/function/f_midi2.c:2026
 usb_add_function+0x2e1/0x9f0 drivers/usb/gadget/composite.c:333
 configfs_composite_bind+0xde0/0x1410 drivers/usb/gadget/configfs.c:1802
 gadget_bind_driver+0x2ca/0x9e0 drivers/usb/gadget/udc/core.c:1662
 call_driver_probe drivers/base/dd.c:-1 [inline]
 really_probe+0x254/0xae0 drivers/base/dd.c:706
 __driver_probe_device+0x1e8/0x360 drivers/base/dd.c:868
 driver_probe_device+0x4f/0x240 drivers/base/dd.c:898
 __driver_attach+0x339/0x600 drivers/base/dd.c:1292
 bus_for_each_dev+0x23b/0x2c0 drivers/base/bus.c:383
 bus_add_driver+0x345/0x670 drivers/base/bus.c:763
 driver_register+0x23a/0x320 drivers/base/driver.c:174
 usb_gadget_register_driver_owner+0xf9/0x270 drivers/usb/gadget/udc/core.c:1752
 gadget_dev_desc_UDC_store+0x1c9/0x2f0 drivers/usb/gadget/configfs.c:300
 flush_write_buffer fs/configfs/file.c:207 [inline]
 configfs_write_iter+0x337/0x430 fs/configfs/file.c:229
 new_sync_write fs/read_write.c:595 [inline]
 vfs_write+0x612/0xba0 fs/read_write.c:687
 ksys_write+0x150/0x270 fs/read_write.c:739
 do_syscall_x64 arch/x86/entry/syscall_64.c:61 [inline]
 do_syscall_64+0x166/0x520 arch/x86/entry/syscall_64.c:84
 entry_SYSCALL_64_after_hwframe+0x77/0x7f

Freed by task 6759:
 kasan_save_stack mm/kasan/common.c:57 [inline]
 kasan_save_track+0x3e/0x80 mm/kasan/common.c:78
 kasan_save_free_info+0x40/0x50 mm/kasan/generic.c:584
 poison_slab_object mm/kasan/common.c:253 [inline]
 __kasan_slab_free+0x5c/0x80 mm/kasan/common.c:285
 kasan_slab_free include/linux/kasan.h:235 [inline]
 slab_free_hook mm/slub.c:2748 [inline]
 slab_free mm/slub.c:6499 [inline]
 kfree+0x1c5/0x650 mm/slub.c:6792
 usb_free_descriptors include/linux/usb/gadget.h:903 [inline]
 usb_free_all_descriptors+0x78/0x110 drivers/usb/gadget/config.c:151
 purge_configs_funcs+0x248/0x3d0 drivers/usb/gadget/configfs.c:1600
 configfs_composite_unbind+0xa4/0x1c0 drivers/usb/gadget/configfs.c:1846
 gadget_unbind_driver+0x1cb/0x410 drivers/usb/gadget/udc/core.c:1724
 device_remove drivers/base/dd.c:616 [inline]
 __device_release_driver drivers/base/dd.c:1349 [inline]
 device_release_driver_internal+0x48b/0x880 drivers/base/dd.c:1372
 driver_detach+0x1f3/0x2d0 drivers/base/dd.c:1435
 bus_remove_driver+0x226/0x320 drivers/base/bus.c:832
 usb_gadget_unregister_driver+0x4e/0x70 drivers/usb/gadget/udc/core.c:1784
 unregister_gadget drivers/usb/gadget/configfs.c:263 [inline]
 gadget_dev_desc_UDC_store+0x17a/0x2f0 drivers/usb/gadget/configfs.c:290
 flush_write_buffer fs/configfs/file.c:207 [inline]
 configfs_write_iter+0x337/0x430 fs/configfs/file.c:229
 new_sync_write fs/read_write.c:595 [inline]
 vfs_write+0x612/0xba0 fs/read_write.c:687
 ksys_write+0x150/0x270 fs/read_write.c:739
 do_syscall_x64 arch/x86/entry/syscall_64.c:61 [inline]
 do_syscall_64+0x166/0x520 arch/x86/entry/syscall_64.c:84
 entry_SYSCALL_64_after_hwframe+0x77/0x7f

The buggy address belongs to the object at ffff8880279f9000
 which belongs to the cache kmalloc-512 of size 512
The buggy address is located 295 bytes inside of
 freed 512-byte region [ffff8880279f9000, ffff8880279f9200)

The buggy address belongs to the physical page:
page: refcount:0 mapcount:0 mapping:0000000000000000 index:0x0 pfn:0x279f8
head: order:2 mapcount:0 entire_mapcount:0 nr_pages_mapped:0 pincount:0
flags: 0xfff00000000040(head|node=0|zone=1|lastcpupid=0x7ff)
page_type: f5(slab)
raw: 00fff00000000040 ffff88813ff15c80 dead000000000100 dead000000000122
raw: 0000000000000000 0000000000100010 00000000f5000000 0000000000000000
head: 00fff00000000040 ffff88813ff15c80 dead000000000100 dead000000000122
head: 0000000000000000 0000000000100010 00000000f5000000 0000000000000000
head: 00fff00000000002 ffffffffffffff01 00000000ffffffff 00000000ffffffff
head: ffffffffffffffff 0000000000000000 00000000ffffffff 0000000000000004
page dumped because: kasan: bad access detected
page_owner tracks the page as allocated
page last allocated via order 2, migratetype Unmovable, gfp_mask 0xd20c0(__GFP_IO|__GFP_FS|__GFP_NOWARN|__GFP_NORETRY|__GFP_COMP|__GFP_NOMEMALLOC), pid 5615, tgid 5615 (syz-executor), ts 90656481770
 set_page_owner include/linux/page_owner.h:33 [inline]
 post_alloc_hook+0x1f9/0x250 mm/page_alloc.c:1871
 prep_new_page mm/page_alloc.c:1879 [inline]
 get_page_from_freelist+0x2209/0x2280 mm/page_alloc.c:3943
 __alloc_frozen_pages_noprof+0x217/0x5a0 mm/page_alloc.c:5436
 alloc_slab_page mm/slub.c:3347 [inline]
 allocate_slab+0x7d/0x620 mm/slub.c:3462
 new_slab mm/slub.c:3513 [inline]
 refill_objects+0x2d5/0x350 mm/slub.c:7410
 refill_sheaf mm/slub.c:2885 [inline]
 __pcs_replace_empty_main+0x2c8/0x6c0 mm/slub.c:4774
 alloc_from_pcs mm/slub.c:4850 [inline]
 slab_alloc_node mm/slub.c:4984 [inline]
 __do_kmalloc_node mm/slub.c:5413 [inline]
 __kmalloc_noprof+0x47b/0x720 mm/slub.c:5439
 _kmalloc_noprof include/linux/slab.h:995 [inline]
 _kzalloc_noprof include/linux/slab.h:1312 [inline]
 fib6_info_alloc+0x30/0xf0 net/ipv6/ip6_fib.c:155
 ip6_route_info_create+0x149/0x890 net/ipv6/route.c:3833
 ip6_route_add+0x49/0x1b0 net/ipv6/route.c:3962
 addrconf_add_mroute+0x2d1/0x370 net/ipv6/addrconf.c:2568
 addrconf_add_dev net/ipv6/addrconf.c:2586 [inline]
 inet6_addr_add+0x2b8/0xb50 net/ipv6/addrconf.c:3056
 inet6_rtm_newaddr+0x9fc/0xe00 net/ipv6/addrconf.c:5095
 rtnetlink_rcv_msg+0x802/0xc00 net/core/rtnetlink.c:7132
 netlink_rcv_skb+0x226/0x4a0 net/netlink/af_netlink.c:2556
 netlink_unicast_kernel net/netlink/af_netlink.c:1319 [inline]
 netlink_unicast+0x7bd/0x940 net/netlink/af_netlink.c:1345
page last free pid 5327 tgid 5327 ts 55156601657 stack trace:
 reset_page_owner include/linux/page_owner.h:26 [inline]
 __free_pages_prepare mm/page_alloc.c:1418 [inline]
 __free_frozen_pages+0xc93/0xd90 mm/page_alloc.c:2962
 __slab_free+0x274/0x2c0 mm/slub.c:5815
 qlink_free mm/kasan/quarantine.c:163 [inline]
 qlist_free_all+0x99/0x100 mm/kasan/quarantine.c:179
 kasan_quarantine_reduce+0x148/0x160 mm/kasan/quarantine.c:286
 __kasan_slab_alloc+0x22/0x80 mm/kasan/common.c:350
 kasan_slab_alloc include/linux/kasan.h:253 [inline]
 slab_post_alloc_hook mm/slub.c:4683 [inline]
 slab_alloc_node mm/slub.c:4996 [inline]
 __do_kmalloc_node mm/slub.c:5413 [inline]
 __kmalloc_noprof+0x307/0x720 mm/slub.c:5439
 _kmalloc_noprof include/linux/slab.h:995 [inline]
 tomoyo_realpath_from_path+0xef/0x640 security/tomoyo/realpath.c:251
 tomoyo_get_realpath security/tomoyo/file.c:151 [inline]
 tomoyo_path_perm+0x283/0x560 security/tomoyo/file.c:827
 security_inode_getattr+0x12b/0x310 security/security.c:1895
 vfs_getattr fs/stat.c:259 [inline]
 vfs_fstat fs/stat.c:281 [inline]
 __do_sys_newfstat fs/stat.c:551 [inline]
 __se_sys_newfstat fs/stat.c:546 [inline]
 __x64_sys_newfstat+0x133/0x270 fs/stat.c:546
 do_syscall_x64 arch/x86/entry/syscall_64.c:61 [inline]
 do_syscall_64+0x166/0x520 arch/x86/entry/syscall_64.c:84
 entry_SYSCALL_64_after_hwframe+0x77/0x7f

Memory state around the buggy address:
 ffff8880279f9000: fa fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
 ffff8880279f9080: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
>ffff8880279f9100: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
                               ^
 ffff8880279f9180: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
 ffff8880279f9200: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
==================================================================
----------------
Code disassembly (best guess):
   0:	f7 e8                	imul   %eax
   2:	5d                   	pop    %rbp
   3:	6a b3                	push   $0xffffffffffffffb3
   5:	f5                   	cmc
   6:	f7 c3 00 02 00 00    	test   $0x200,%ebx
   c:	74 05                	je     0x13
   e:	e8 c0 a2 df f5       	call   0xf5dfa2d3
  13:	9c                   	pushf
  14:	58                   	pop    %rax
  15:	a9 00 02 00 00       	test   $0x200,%eax
  1a:	75 29                	jne    0x45
  1c:	f7 c3 00 02 00 00    	test   $0x200,%ebx
  22:	74 01                	je     0x25
  24:	fb                   	sti
  25:	bf 01 00 00 00       	mov    $0x1,%edi
* 2a:	e8 14 86 a4 f5       	call   0xf5a48643 <-- trapping instruction
  2f:	65 48 8b 05 bc ce c8 	mov    %gs:0x7c8cebc(%rip),%rax        # 0x7c8cef3
  36:	07
  37:	48 85 c0             	test   %rax,%rax
  3a:	74 18                	je     0x54
  3c:	5b                   	pop    %rbx
  3d:	41 5e                	pop    %r14
  3f:	e9                   	.byte 0xe9


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

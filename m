Received: from mail-oi1-f205.google.com (mail-oi1-f205.google.com [209.85.167.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEBA223BD06
	for <linux-usb@vger.kernel.org>; Sun, 26 Jul 2026 16:18:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785082714; cv=none; b=bxOXcb9duzT+/rXylq7my/GVvB2URx4w1U/SBAPTrfZFin1UQapt443ZVgiAzQVXPu+/4FIx4LrMxiL6ZcUbMMgfvwcPqZRMIYRed8vVWgWPpqKD08EpefypfQC+XRJiuY4j7nKzmC/IdL6PG5gTihm9kSXtcOC9oq0x7Jmf3VQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785082714; c=relaxed/simple;
	bh=nxBSH+bTsxK02mepW3/7Uw9afuJvjS7+HAGukzoAaUA=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=fh4hh087TU4lSOc2l6SLnUayRQvGKVC/rWapExlsX6kxGw7QDGuOFoYGpyiICF6xboGI5Z2tX67OH99RpQeuP2Zv/yUPDsbxVdjoqxSC+m78KR40l2UrnMd2zJhhfwFn/3g5OYfVMDXTscjpp8DTxOjOlg/QJSPjQGiIND/Wqx8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f205.google.com with SMTP id 5614622812f47-49ce04870f8so2509990b6e.0
        for <linux-usb@vger.kernel.org>; Sun, 26 Jul 2026 09:18:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785082712; x=1785687512;
        h=content-type:to:from:subject:message-id:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xTVTBRABYS9ty2150DcyecBkK9Kui60TX0qGfQNDwV0=;
        b=PuJjh67N/RI4JTId8h4d2ERtpVkShSos0Q5hJDMkndzMSmMrtrx4Z7Jwvi6ZOypWXa
         /YGdeyvy7F+yp0zVB+eFmSdGh46Q0NG0hCUb2IUINt1BHpw0BcZ6OKxclLEPkxQxB+ZT
         Wrqn1JRts33JI7Id4Ph8W4o3PQ6HH+CJiluLUgM2JNSaBWmM5RBqVH4R1cQ/DNdzkGZ4
         bYR8EM+8Vs9Lq14cZZsL55E3gP+lLy4zXs/VlQywbuD1Tt8hoJzAGpWES+L5Wrsrhd+X
         7VsEeqYPoBwCfzvJCqipDtzCRpRiYrUp1WXdFyVUogCKox6xTLPOpv33iWy+VUKawU0D
         6CiQ==
X-Forwarded-Encrypted: i=1; AHgh+Rqh46o3p9fm22AedYC2VGrjC5WEgMia2H7rGSDihlaBnm1iHLxbP6r60HZ+UgVPWvHZ/3S4+Xnlo+Q=@vger.kernel.org
X-Gm-Message-State: AOJu0YxSzaLfjk8et3cATU4/exjr7mD1o4zxAP2kpB3eFaSiG7Sjpoxs
	3i+AApmafuyzl2RHt82QBIpdX8jDVC6hj2OJMPJp9GWBcCX6tRDkstXkDXimxvb4PUIOZaeUkac
	W1KA/J9UocKA7+E/g47mppLVgkkOucyyptEudaRTfxwJeVbvZO5yMqMV8KFk=
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:3190:b0:4a2:ca6b:4214 with SMTP id
 5614622812f47-4ab6a298532mr4952566b6e.29.1785082711888; Sun, 26 Jul 2026
 09:18:31 -0700 (PDT)
Date: Sun, 26 Jul 2026 09:18:31 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6a663357.a2ea2cc8.fbad6.002b.GAE@google.com>
Subject: [syzbot] [usb?] KASAN: invalid-free in dev_free (4)
From: syzbot <syzbot+95b9b8670fa88368360e@syzkaller.appspotmail.com>
To: andreyknvl@gmail.com, gregkh@linuxfoundation.org, 
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    248951ddc14d Merge tag 'hwmon-for-v7.2-rc5' of git://git.k..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=13c62ab9580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=5c4196ba0e33631d
dashboard link: https://syzkaller.appspot.com/bug?extid=95b9b8670fa88368360e
compiler:       Debian clang version 22.1.8 (++20260613092233+e80beda6e255-1~exp1~20260613092250.77), Debian LLD 22.1.8

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/517bea0258cd/disk-248951dd.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/ec55bd8fe529/vmlinux-248951dd.xz
kernel image: https://storage.googleapis.com/syzbot-assets/498450a9704a/bzImage-248951dd.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+95b9b8670fa88368360e@syzkaller.appspotmail.com

==================================================================
BUG: KASAN: double-free in dev_free+0x43f/0x750 drivers/usb/gadget/legacy/raw_gadget.c:226
Free of addr ffff88803706c020 by task syz.5.4224/22979

CPU: 0 UID: 0 PID: 22979 Comm: syz.5.4224 Tainted: G             L      syzkaller #0 PREEMPT(full) 
Tainted: [L]=SOFTLOCKUP
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 06/25/2026
Call Trace:
 <TASK>
 dump_stack_lvl+0xe8/0x150 lib/dump_stack.c:120
 print_address_description+0x55/0x1e0 mm/kasan/report.c:378
 print_report+0x58/0x70 mm/kasan/report.c:482
 kasan_report_invalid_free+0xea/0x110 mm/kasan/report.c:557
 check_slab_allocation mm/kasan/common.c:-1 [inline]
 __kasan_slab_pre_free+0x104/0x120 mm/kasan/common.c:261
 kasan_slab_pre_free include/linux/kasan.h:199 [inline]
 slab_free_hook mm/slub.c:2650 [inline]
 slab_free mm/slub.c:6405 [inline]
 kfree+0x173/0x640 mm/slub.c:6720
 dev_free+0x43f/0x750 drivers/usb/gadget/legacy/raw_gadget.c:226
 kref_put include/linux/kref.h:65 [inline]
 raw_release+0x199/0x260 drivers/usb/gadget/legacy/raw_gadget.c:474
 __fput+0x418/0xa50 fs/file_table.c:512
 task_work_run+0x1d9/0x270 kernel/task_work.c:233
 exit_task_work include/linux/task_work.h:40 [inline]
 do_exit+0x73a/0x2360 kernel/exit.c:1009
 do_group_exit+0x22d/0x2f0 kernel/exit.c:1152
 get_signal+0x121b/0x12c0 kernel/signal.c:3046
 arch_do_signal_or_restart+0xbb/0x860 arch/x86/kernel/signal.c:337
 __exit_to_user_mode_loop kernel/entry/common.c:66 [inline]
 exit_to_user_mode_loop+0x104/0x730 kernel/entry/common.c:101
 __exit_to_user_mode_prepare include/linux/irq-entry-common.h:207 [inline]
 syscall_exit_to_user_mode_prepare include/linux/irq-entry-common.h:230 [inline]
 syscall_exit_to_user_mode include/linux/entry-common.h:318 [inline]
 do_syscall_64+0x353/0x580 arch/x86/entry/syscall_64.c:100
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7fc8b1f5e6ce
Code: Unable to access opcode bytes at 0x7fc8b1f5e6a4.
RSP: 002b:00007fc8b2ea5f98 EFLAGS: 00000246 ORIG_RAX: 0000000000000003
RAX: 0000000000000000 RBX: 00007fc8b2ea66c0 RCX: 00007fc8b1f5e6ce
RDX: 0000000000000000 RSI: 0000000000000000 RDI: 0000000000000003
RBP: 00007fc8b2033eaf R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000000
R13: 00007fc8b2226038 R14: 00007fc8b2225fa0 R15: 00007fc8b234fa48
 </TASK>

Allocated by task 22980:
 kasan_save_stack mm/kasan/common.c:57 [inline]
 kasan_save_track+0x3e/0x80 mm/kasan/common.c:78
 poison_kmalloc_redzone mm/kasan/common.c:398 [inline]
 __kasan_kmalloc+0x93/0xb0 mm/kasan/common.c:415
 kasan_kmalloc include/linux/kasan.h:263 [inline]
 __do_kmalloc_node mm/slub.c:5362 [inline]
 __kmalloc_node_track_caller_noprof+0x4c3/0x730 mm/slub.c:5497
 memdup_user+0x2b/0xd0 mm/util.c:221
 raw_ioctl_ep_enable drivers/usb/gadget/legacy/raw_gadget.c:848 [inline]
 raw_ioctl+0xdbc/0x41c0 drivers/usb/gadget/legacy/raw_gadget.c:1319
 vfs_ioctl fs/ioctl.c:51 [inline]
 __do_sys_ioctl fs/ioctl.c:597 [inline]
 __se_sys_ioctl+0xfc/0x170 fs/ioctl.c:583
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0x174/0x580 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f

Freed by task 22979:
 kasan_save_stack mm/kasan/common.c:57 [inline]
 kasan_save_track+0x3e/0x80 mm/kasan/common.c:78
 kasan_save_free_info+0x40/0x50 mm/kasan/generic.c:584
 poison_slab_object mm/kasan/common.c:253 [inline]
 __kasan_slab_free+0x5c/0x80 mm/kasan/common.c:285
 kasan_slab_free include/linux/kasan.h:235 [inline]
 slab_free_hook mm/slub.c:2705 [inline]
 slab_free mm/slub.c:6405 [inline]
 kfree+0x1c5/0x640 mm/slub.c:6720
 dev_free+0x43f/0x750 drivers/usb/gadget/legacy/raw_gadget.c:226
 kref_put include/linux/kref.h:65 [inline]
 raw_release+0x199/0x260 drivers/usb/gadget/legacy/raw_gadget.c:474
 __fput+0x418/0xa50 fs/file_table.c:512
 fput_close_sync+0x11f/0x240 fs/file_table.c:617
 __do_sys_close fs/open.c:1511 [inline]
 __se_sys_close fs/open.c:1496 [inline]
 __x64_sys_close+0x7e/0x110 fs/open.c:1496
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0x174/0x580 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f

The buggy address belongs to the object at ffff88803706c020
 which belongs to the cache kmalloc-16 of size 16
The buggy address is located 0 bytes inside of
 16-byte region [ffff88803706c020, ffff88803706c030)

The buggy address belongs to the physical page:
page: refcount:0 mapcount:0 mapping:0000000000000000 index:0xffff88803706c300 pfn:0x3706c
flags: 0xfff00000000200(workingset|node=0|zone=1|lastcpupid=0x7ff)
page_type: f5(slab)
raw: 00fff00000000200 ffff88801b004640 ffffea0000d32790 ffffea0001db5950
raw: ffff88803706c300 0000000800800050 00000000f5000000 0000000000000000
page dumped because: kasan: bad access detected
page_owner tracks the page as allocated
page last allocated via order 0, migratetype Unmovable, gfp_mask 0xd2cc0(GFP_KERNEL|__GFP_NOWARN|__GFP_NORETRY|__GFP_COMP|__GFP_NOMEMALLOC), pid 5768, tgid 5768 (kworker/0:9), ts 885089792261, free_ts 885088005196
 create_dummy_stack mm/page_owner.c:103 [inline]
 register_dummy_stack+0x98/0x100 mm/page_owner.c:109
 init_page_owner+0x2e/0x5f0 mm/page_owner.c:127
 invoke_init_callbacks mm/page_ext.c:152 [inline]
 page_ext_init+0x509/0x550 mm/page_ext.c:490
 mm_core_init+0x97/0xb0 mm/mm_init.c:2741
page last free pid 5768 tgid 5768 stack trace:
 reset_page_owner include/linux/page_owner.h:25 [inline]
 __free_pages_prepare mm/page_alloc.c:1406 [inline]
 __free_frozen_pages+0xc1e/0xd10 mm/page_alloc.c:2950
 rcu_do_batch kernel/rcu/tree.c:2645 [inline]
 rcu_core+0x78b/0x10a0 kernel/rcu/tree.c:2897
 handle_softirqs+0x225/0x840 kernel/softirq.c:622
 do_softirq+0x76/0xd0 kernel/softirq.c:523
 __local_bh_enable_ip+0xf8/0x130 kernel/softirq.c:450
 local_bh_enable include/linux/bottom_half.h:33 [inline]
 __alloc_skb+0x1ad/0x7a0 net/core/skbuff.c:699
 alloc_skb include/linux/skbuff.h:1384 [inline]
 alloc_uevent_skb+0x7d/0x230 lib/kobject_uevent.c:289
 uevent_net_broadcast_untagged lib/kobject_uevent.c:326 [inline]
 kobject_uevent_net_broadcast+0x2fa/0x560 lib/kobject_uevent.c:410
 kobject_uevent_env+0x566/0x9e0 lib/kobject_uevent.c:611
 device_add+0x544/0xb80 drivers/base/core.c:3738
 device_create_groups_vargs drivers/base/core.c:4454 [inline]
 device_create+0x269/0x300 drivers/base/core.c:4493
 dvb_register_device+0x116d/0x1dd0 drivers/media/dvb-core/dvbdev.c:567
 dvb_dmxdev_init+0x2d4/0x430 drivers/media/dvb-core/dmxdev.c:1427
 dvb_usb_adapter_dvb_init+0x905/0xdb0 drivers/media/usb/dvb-usb/dvb-usb-dvb.c:192
 dvb_usb_adapter_init drivers/media/usb/dvb-usb/dvb-usb-init.c:86 [inline]
 dvb_usb_init drivers/media/usb/dvb-usb/dvb-usb-init.c:186 [inline]
 dvb_usb_device_init+0x1c05/0x2570 drivers/media/usb/dvb-usb/dvb-usb-init.c:310
 usb_probe_interface+0x653/0xc60 drivers/usb/core/driver.c:396

Memory state around the buggy address:
 ffff88803706bf00: 00 00 00 00 fc fc fc fc 00 00 00 00 fc fc fc fc
 ffff88803706bf80: fa fb fb fb fc fc fc fc 00 00 00 00 fc fc fc fc
>ffff88803706c000: 00 03 fc fc fa fb fc fc fa fb fc fc 00 05 fc fc
                               ^
 ffff88803706c080: 00 05 fc fc 00 04 fc fc fa fb fc fc fa fb fc fc
 ffff88803706c100: 00 03 fc fc 00 00 fc fc fa fb fc fc 00 05 fc fc
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

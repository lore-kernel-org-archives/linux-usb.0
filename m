Received: from mail-oa2-f0.google.com (mail-oa2-f0.google.com [74.125.231.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A6E144780F
	for <linux-usb@vger.kernel.org>; Fri, 21 Aug 2026 09:22:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787304164; cv=none; b=Iwq3pc8uVY54GU5hWR3F29n3Io59oWmD5IsDqubLfy+ueqKNeCTf+SgaNOZObdaHNkreJ/pJxf9oQzqkaCm0Dg5qnLXebB1Sce20QWW3X7WOHwXJ00SySC/L4a1zRmoO2fzAWV80YcT+r2nwTMHlOTr/NGjKW0YIeBGlZpP4kv8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787304164; c=relaxed/simple;
	bh=R5Rw5uf8IBrEGuvOhi/19emRYQvLA01kgo7j3m3rfMo=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=aXFjERYZ58ylYqypE3toy+wFB2DKuuTsQhtjxSH7YhSac2v47v1MmHSl6mdQ/+sixqQFJ7m9C2VqlVrH+GPxdNCZ0ZujFZPDfe5tVv327HHpXNJWy/XF+osGYV4k/b9tKUeAfNmynIlVRDG4GQ9+TruiA/Xv0rZ063sOxUtPefs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=74.125.231.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oa2-f0.google.com with SMTP id 586e51a60fabf-451e8472960so371720fac.1
        for <linux-usb@vger.kernel.org>; Fri, 21 Aug 2026 02:22:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787304152; x=1787908952;
        h=content-type:to:from:subject:message-id:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TRbj6Ao0AvB/wY388fSPnuMVW6hQ1b+Wdby5TiMnbLI=;
        b=dKvx/GhxUhqieVF215C0A+uOEdaSf+5F/sN5J2CPMZvNpPxxjqR5i556vH4CVovNxq
         69PP4z3145+v7RcWQeanGvLpzj2N/lshJvIZdldGqduyhWCpW2y0uqmBzIZxTypwmB69
         yp1ZFaoG1Ge++9KNomWYT0M5qY/QFmt5vicD+xC0TLxgHHNZnLFW8OGJSir1d5apOzM8
         zkYF90aqg2J0oFf5c7f/vdk/IpOBmdb7kcFCBsuWRWD/vqHQKFPHsJHalkLkKRlD1KTE
         AtlK2WwzjY51ZWmUF2yufuWmFpba+83+QPt6l3+4mOwJx3pS314N0O9NxVI5wwW4n2ro
         33IA==
X-Forwarded-Encrypted: i=1; AHgh+RoNN4AoCJaOIDeenDhltf7VTQXxQIHokaPaY2ccQDCf1RZPCePf3EDHUjYHVH5FaFe7slGMwkuLRMY=@vger.kernel.org
X-Gm-Message-State: AOJu0YxLDv6psvf63PniEY/WzEiK8JJ8o/KCpq/P1RjIYIu2zYBiK3qO
	pf95NGokU/QQ15UCn4DJB6W2KBUD3WrFb/A8OWJkxyiWQ3R4r1juJDg/B6OkhmBoiXPTgjeTsmV
	iNhuH1UbSsk9DhMwQx5vurkzDmBuAoK7qqMKcA4Uf0k6Lf9jPnWia8Z+LH9w=
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:c2c7:10b0:6b1:858:28a9 with SMTP id
 006d021491bc7-6b159217ad4mr4029847eaf.9.1787304152442; Fri, 21 Aug 2026
 02:22:32 -0700 (PDT)
Date: Fri, 21 Aug 2026 02:22:32 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6a8818d8.ae6ddae5.3da009.0031.GAE@google.com>
Subject: [syzbot] [usb?] INFO: trying to register non-static key in edge_bulk_in_callback
From: syzbot <syzbot+763813d65c7e18c1b6d5@syzkaller.appspotmail.com>
To: gregkh@linuxfoundation.org, johan@kernel.org, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    dcb68831eac7 Merge tag 'block-7.2-20260815' of git://git.k..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=13c12679580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=2ca5f2f2c4197664
dashboard link: https://syzkaller.appspot.com/bug?extid=763813d65c7e18c1b6d5
compiler:       Debian clang version 22.1.8 (++20260613092233+e80beda6e255-1~exp1~20260613092250.77), Debian LLD 22.1.8

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/2f9d6a54222e/disk-dcb68831.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/0b52c510b447/vmlinux-dcb68831.xz
kernel image: https://storage.googleapis.com/syzbot-assets/f8d408f8474e/bzImage-dcb68831.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+763813d65c7e18c1b6d5@syzkaller.appspotmail.com

INFO: trying to register non-static key.
The code is fine but needs lockdep annotation, or maybe
you didn't initialize this object before use?
turning off the locking correctness validator.
CPU: 1 UID: 0 PID: 6693 Comm: kworker/u8:9 Not tainted syzkaller #0 PREEMPT(full) 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 07/24/2026
Workqueue: events_unbound nsim_dev_trap_report_work
Call Trace:
 <IRQ>
 dump_stack_lvl+0xe8/0x150 lib/dump_stack.c:120
 assign_lock_key+0x133/0x150 kernel/locking/lockdep.c:984
 register_lock_class+0xcc/0x2e0 kernel/locking/lockdep.c:1299
 __lock_acquire+0xab/0x2cf0 kernel/locking/lockdep.c:5112
 lock_acquire+0x106/0x350 kernel/locking/lockdep.c:5868
 __raw_spin_lock_irqsave include/linux/spinlock_api_smp.h:132 [inline]
 _raw_spin_lock_irqsave+0x40/0x60 kernel/locking/spinlock.c:166
 __wake_up_common_lock+0x30/0x1f0 kernel/sched/wait.c:124
 process_rcvd_data drivers/usb/serial/io_edgeport.c:1735 [inline]
 edge_bulk_in_callback+0x84d/0x1570 drivers/usb/serial/io_edgeport.c:721
 __usb_hcd_giveback_urb+0x374/0x530 drivers/usb/core/hcd.c:1657
 dummy_timer+0xa91/0x4cf0 drivers/usb/gadget/udc/dummy_hcd.c:2019
 __run_hrtimer kernel/time/hrtimer.c:2032 [inline]
 __hrtimer_run_queues+0x3bc/0xa10 kernel/time/hrtimer.c:2096
 hrtimer_run_softirq+0x17a/0x240 kernel/time/hrtimer.c:2113
 handle_softirqs+0x225/0x840 kernel/softirq.c:622
 do_softirq+0x76/0xd0 kernel/softirq.c:523
 </IRQ>
 <TASK>
 __local_bh_enable_ip+0xf8/0x130 kernel/softirq.c:450
 local_bh_enable include/linux/bottom_half.h:33 [inline]
 __alloc_skb+0x1ad/0x7a0 net/core/skbuff.c:699
 alloc_skb include/linux/skbuff.h:1384 [inline]
 nsim_dev_trap_skb_build drivers/net/netdevsim/dev.c:819 [inline]
 nsim_dev_trap_report drivers/net/netdevsim/dev.c:876 [inline]
 nsim_dev_trap_report_work+0x25f/0xb40 drivers/net/netdevsim/dev.c:922
 process_one_work kernel/workqueue.c:3322 [inline]
 process_scheduled_works+0xa8e/0x14e0 kernel/workqueue.c:3405
 worker_thread+0xa47/0xfb0 kernel/workqueue.c:3486
 kthread+0x388/0x470 kernel/kthread.c:436
 ret_from_fork+0x514/0xb70 arch/x86/kernel/process.c:158
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245
 </TASK>
Oops: general protection fault, probably for non-canonical address 0xdffffc0000000000: 0000 [#1] SMP KASAN PTI
KASAN: null-ptr-deref in range [0x0000000000000000-0x0000000000000007]
CPU: 1 UID: 0 PID: 6693 Comm: kworker/u8:9 Not tainted syzkaller #0 PREEMPT(full) 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 07/24/2026
Workqueue: events_unbound nsim_dev_trap_report_work
RIP: 0010:__wake_up_common kernel/sched/wait.c:104 [inline]
RIP: 0010:__wake_up_common_lock+0xd6/0x1f0 kernel/sched/wait.c:125
Code: 0f 84 d4 00 00 00 44 8b 64 24 04 eb 13 48 ba 00 00 00 00 00 fc ff df 4c 39 fd 0f 84 ba 00 00 00 49 89 ee 48 89 e8 48 c1 e8 03 <80> 3c 10 00 74 12 4c 89 f7 e8 6c e0 94 00 48 ba 00 00 00 00 00 fc
RSP: 0018:ffffc90000a08920 EFLAGS: 00010046
RAX: 0000000000000000 RBX: 000000000000000f RCX: 0000000000000001
RDX: dffffc0000000000 RSI: 0000000000000004 RDI: ffffc90000a08880
RBP: 0000000000000000 R08: 0000000000000003 R09: 0000000000000004
R10: dffffc0000000000 R11: fffff52000141110 R12: 0000000000000001
R13: dffffc0000000000 R14: 0000000000000000 R15: ffff888053875518
FS:  0000000000000000(0000) GS:ffff888125049000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007fab789ad000 CR3: 0000000075f26000 CR4: 00000000003526f0
Call Trace:
 <IRQ>
 process_rcvd_data drivers/usb/serial/io_edgeport.c:1735 [inline]
 edge_bulk_in_callback+0x84d/0x1570 drivers/usb/serial/io_edgeport.c:721
 __usb_hcd_giveback_urb+0x374/0x530 drivers/usb/core/hcd.c:1657
 dummy_timer+0xa91/0x4cf0 drivers/usb/gadget/udc/dummy_hcd.c:2019
 __run_hrtimer kernel/time/hrtimer.c:2032 [inline]
 __hrtimer_run_queues+0x3bc/0xa10 kernel/time/hrtimer.c:2096
 hrtimer_run_softirq+0x17a/0x240 kernel/time/hrtimer.c:2113
 handle_softirqs+0x225/0x840 kernel/softirq.c:622
 do_softirq+0x76/0xd0 kernel/softirq.c:523
 </IRQ>
 <TASK>
 __local_bh_enable_ip+0xf8/0x130 kernel/softirq.c:450
 local_bh_enable include/linux/bottom_half.h:33 [inline]
 __alloc_skb+0x1ad/0x7a0 net/core/skbuff.c:699
 alloc_skb include/linux/skbuff.h:1384 [inline]
 nsim_dev_trap_skb_build drivers/net/netdevsim/dev.c:819 [inline]
 nsim_dev_trap_report drivers/net/netdevsim/dev.c:876 [inline]
 nsim_dev_trap_report_work+0x25f/0xb40 drivers/net/netdevsim/dev.c:922
 process_one_work kernel/workqueue.c:3322 [inline]
 process_scheduled_works+0xa8e/0x14e0 kernel/workqueue.c:3405
 worker_thread+0xa47/0xfb0 kernel/workqueue.c:3486
 kthread+0x388/0x470 kernel/kthread.c:436
 ret_from_fork+0x514/0xb70 arch/x86/kernel/process.c:158
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245
 </TASK>
Modules linked in:
---[ end trace 0000000000000000 ]---
RIP: 0010:__wake_up_common kernel/sched/wait.c:104 [inline]
RIP: 0010:__wake_up_common_lock+0xd6/0x1f0 kernel/sched/wait.c:125
Code: 0f 84 d4 00 00 00 44 8b 64 24 04 eb 13 48 ba 00 00 00 00 00 fc ff df 4c 39 fd 0f 84 ba 00 00 00 49 89 ee 48 89 e8 48 c1 e8 03 <80> 3c 10 00 74 12 4c 89 f7 e8 6c e0 94 00 48 ba 00 00 00 00 00 fc
RSP: 0018:ffffc90000a08920 EFLAGS: 00010046
RAX: 0000000000000000 RBX: 000000000000000f RCX: 0000000000000001
RDX: dffffc0000000000 RSI: 0000000000000004 RDI: ffffc90000a08880
RBP: 0000000000000000 R08: 0000000000000003 R09: 0000000000000004
R10: dffffc0000000000 R11: fffff52000141110 R12: 0000000000000001
R13: dffffc0000000000 R14: 0000000000000000 R15: ffff888053875518
FS:  0000000000000000(0000) GS:ffff888125049000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007fab789ad000 CR3: 0000000075f26000 CR4: 00000000003526f0
----------------
Code disassembly (best guess):
   0:	0f 84 d4 00 00 00    	je     0xda
   6:	44 8b 64 24 04       	mov    0x4(%rsp),%r12d
   b:	eb 13                	jmp    0x20
   d:	48 ba 00 00 00 00 00 	movabs $0xdffffc0000000000,%rdx
  14:	fc ff df
  17:	4c 39 fd             	cmp    %r15,%rbp
  1a:	0f 84 ba 00 00 00    	je     0xda
  20:	49 89 ee             	mov    %rbp,%r14
  23:	48 89 e8             	mov    %rbp,%rax
  26:	48 c1 e8 03          	shr    $0x3,%rax
* 2a:	80 3c 10 00          	cmpb   $0x0,(%rax,%rdx,1) <-- trapping instruction
  2e:	74 12                	je     0x42
  30:	4c 89 f7             	mov    %r14,%rdi
  33:	e8 6c e0 94 00       	call   0x94e0a4
  38:	48                   	rex.W
  39:	ba 00 00 00 00       	mov    $0x0,%edx
  3e:	00 fc                	add    %bh,%ah


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

Received: from mail-oi1-f208.google.com (mail-oi1-f208.google.com [209.85.167.208])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 648021A6811
	for <linux-usb@vger.kernel.org>; Tue, 28 Jul 2026 13:52:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.208
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785246761; cv=none; b=A9zS0dTdPQkDeRppLoKUaoNdTrW8Td/af5xjby7nb/7o4yu1Y0Sqg8evdhPbuhf7O8iRnZb+cDRuNDL/NlAMnvY8AjyP/MCAt4gRP9m/6fJzSXvwfmH9H17gEF/0drPL7V9Ltyz3cUpIj2pic2zBsJMpHdSxaOnYXUfmHuOkhEM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785246761; c=relaxed/simple;
	bh=gNQBf0Bq1O1ppF8DS1vr5zUXLPEJdDcY0BVXmWg36qw=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=CTxfjBm+quAWeWxwBZh6Nr6feJsLAmMOq9qVLf4kIXEGGddt8iiQKBxez2cU89OVPziRjG162wP//bgTjbtTjvAMGtLoqL5tB95obFrETDNPK+rUgY+R0XLt8deMJ5aik9ZY0Ks0f6MJ4ui/ycOk4e1ZMBAD2XBX5nBGkC9DlyI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.208
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f208.google.com with SMTP id 5614622812f47-4a46e8eec4bso885676b6e.1
        for <linux-usb@vger.kernel.org>; Tue, 28 Jul 2026 06:52:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785246758; x=1785851558;
        h=content-type:to:from:subject:message-id:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QaSiw8puFPeBu1SI31F7bxptPEcCvdayre4NGJcNTDE=;
        b=a4jy7v1jih4BABqVz8wT2BTgYxZyCtN8xHrpp4aVD29j273N9eJpZ3pjeEOqjgqXfu
         JI5sCudre6D3oxaoL9AmZOX8t57eZ6e10HHhrWly4OKuTJz/utzkAlsSjtIg1H+ft0A5
         pWP8ICry1aov7H6umPmfNT0sjzNF1WCHlFHGL1IdzDAKjdGqq+7GtgosScCn3YwHw//s
         e3nD7vm/jd03qCvepmxi8rzetqphQS3f0tEihV+dfmpJyRWISdyVhPlMVFBTeiMwUMN4
         3PO6PyugJ/9kuwqLx6mK2I7CRWMVf+8XlVVdAXX+kn1+fVgDWiu58sKYXbnwNKmMaJXV
         rcjQ==
X-Forwarded-Encrypted: i=1; AHgh+Rr72lR+rv7+nS1qXVWd+ajMxvfl0NP2N1R0+EZPYofyj4DpUyd2OzAFn8ivZdZr0GteUCuolU5ZqzA=@vger.kernel.org
X-Gm-Message-State: AOJu0YxR1mCxZvGjFF80BlXlan8E6CvzEXI37Z0B1lRNY81Q42ctzfLy
	j/R1CK9+GpktFU8sFqLA5RMhNBRfycYAc9N98YLw83Sa797tdwFn4HfON0Jb47EMZ1ue4zSXiL8
	5adXWNisTqip1x4OVacHJ46cGk1BUP2EGD8z5uPbHX5mpi//+hazfIUXSxYA=
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:250e:b0:4a4:744:a4ff with SMTP id
 5614622812f47-4ad5b94bbc8mr1603167b6e.4.1785246758353; Tue, 28 Jul 2026
 06:52:38 -0700 (PDT)
Date: Tue, 28 Jul 2026 06:52:38 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6a68b426.b6659fcc.241ab8.00e9.GAE@google.com>
Subject: [syzbot] [usb?] general protection fault in f_midi2_free_ep_reqs
From: syzbot <syzbot+01a17afb30637396955e@syzkaller.appspotmail.com>
To: gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    4235cb24ec1e Merge tag 'vfs-7.2-rc5.fixes' of git://git.ke..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=13b86449580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=145fa60d73086782
dashboard link: https://syzkaller.appspot.com/bug?extid=01a17afb30637396955e
compiler:       gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=17aaa7b1580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=16341632580000

Downloadable assets:
disk image (non-bootable): https://storage.googleapis.com/syzbot-assets/d900f083ada3/non_bootable_disk-4235cb24.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/0220bd6b47b0/vmlinux-4235cb24.xz
kernel image: https://storage.googleapis.com/syzbot-assets/b7fcbec12504/bzImage-4235cb24.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+01a17afb30637396955e@syzkaller.appspotmail.com

Oops: general protection fault, probably for non-canonical address 0xdffffc00000000e6: 0000 [#1] SMP KASAN NOPTI
KASAN: null-ptr-deref in range [0x0000000000000730-0x0000000000000737]
CPU: 2 UID: 0 PID: 56 Comm: kworker/2:1 Not tainted syzkaller #0 PREEMPT(full) 
Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.3-debian-1.16.3-2 04/01/2014
Workqueue: usb_hub_wq hub_event
RIP: 0010:f_midi2_free_ep_reqs+0x56/0x2b0 drivers/usb/gadget/function/f_midi2.c:1166
Code: 85 6a 02 00 00 49 8b 45 00 48 89 44 24 18 48 05 30 07 00 00 48 89 c2 48 89 44 24 20 48 b8 00 00 00 00 00 fc ff df 48 c1 ea 03 <0f> b6 04 02 84 c0 74 08 3c 03 0f 8e b5 01 00 00 48 8b 44 24 18 31
RSP: 0018:ffffc900006489e8 EFLAGS: 00010002
RAX: dffffc0000000000 RBX: ffff8880559b0000 RCX: ffffffff87e7a829
RDX: 00000000000000e6 RSI: ffffffff87e7a666 RDI: ffff8880559b0128
RBP: ffff8880559b0128 R08: 0000000000000004 R09: 0000000000000020
R10: 0000000000000020 R11: 000000000000758b R12: ffff8880559b00f0
R13: ffff8880559b0128 R14: ffff8880559b0740 R15: 0000000000000001
FS:  0000000000000000(0000) GS:ffff8880d5fdc000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00000000033e4100 CR3: 0000000030cc7000 CR4: 0000000000352ef0
Call Trace:
 <IRQ>
 f_midi2_stop_eps drivers/usb/gadget/function/f_midi2.c:1246 [inline]
 f_midi2_set_alt+0x444/0x5f0 drivers/usb/gadget/function/f_midi2.c:1296
 composite_setup+0x16f8/0x9290 drivers/usb/gadget/composite.c:1933
 configfs_composite_setup+0xfb/0x130 drivers/usb/gadget/configfs.c:1877
 dummy_timer+0x2045/0x36f0 drivers/usb/gadget/udc/dummy_hcd.c:1951
 __run_hrtimer kernel/time/hrtimer.c:2032 [inline]
 __hrtimer_run_queues+0x462/0x9c0 kernel/time/hrtimer.c:2096
 hrtimer_run_softirq+0x17d/0x2c0 kernel/time/hrtimer.c:2113
 handle_softirqs+0x1ea/0x9b0 kernel/softirq.c:622
 __do_softirq kernel/softirq.c:656 [inline]
 invoke_softirq kernel/softirq.c:496 [inline]
 __irq_exit_rcu+0x162/0x210 kernel/softirq.c:735
 irq_exit_rcu+0x9/0x30 kernel/softirq.c:752
 instr_sysvec_apic_timer_interrupt arch/x86/kernel/apic/apic.c:1062 [inline]
 sysvec_apic_timer_interrupt+0xa3/0xc0 arch/x86/kernel/apic/apic.c:1062
 </IRQ>
 <TASK>
 asm_sysvec_apic_timer_interrupt+0x1a/0x20 arch/x86/include/asm/idtentry.h:674
RIP: 0010:__raw_spin_unlock_irqrestore include/linux/spinlock_api_smp.h:179 [inline]
RIP: 0010:_raw_spin_unlock_irqrestore+0x31/0x80 kernel/locking/spinlock.c:198
Code: f5 53 48 8b 74 24 10 48 89 fb 48 83 c7 18 e8 56 f0 27 f6 48 89 df e8 de 3f 28 f6 f7 c5 00 02 00 00 75 23 9c 58 f6 c4 02 75 37 <bf> 01 00 00 00 e8 a5 4f 17 f6 65 8b 05 ee 38 a6 08 85 c0 74 16 5b
RSP: 0018:ffffc90000a9e778 EFLAGS: 00000246
RAX: 0000000000000006 RBX: ffff88806a626280 RCX: 0000000000000040
RDX: 0000000000000000 RSI: ffffffff8e1a5b18 RDI: ffffffff8c401580
RBP: 0000000000000283 R08: 0000000000000001 R09: 0000000000000000
R10: 0000000000000001 R11: 0000000000000000 R12: ffff88806a626280
R13: 0000000000000000 R14: 00000000ffffffff R15: ffff88806a6262c8
 __mod_timer+0x409/0xca0 kernel/time/timer.c:1139
 add_timer+0x62/0x90 kernel/time/timer.c:1249
 schedule_timeout+0x122/0x280 kernel/time/sleep_timeout.c:98
 do_wait_for_common kernel/sched/completion.c:100 [inline]
 __wait_for_common+0x2e7/0x4c0 kernel/sched/completion.c:121
 usb_start_wait_urb+0x2ae/0x580 drivers/usb/core/message.c:72
 usb_internal_control_msg drivers/usb/core/message.c:117 [inline]
 usb_control_msg+0x328/0x4b0 drivers/usb/core/message.c:167
 usb_control_msg_send+0xca/0x130 drivers/usb/core/message.c:226
 usb_set_interface+0x9b6/0xe20 drivers/usb/core/message.c:1649
 snd_usb_midi_v2_create+0x629/0x4070 sound/usb/midi2.c:1120
 snd_usb_create_stream.isra.0+0x386/0x4d0 sound/usb/card.c:290
 snd_usb_create_streams sound/usb/card.c:392 [inline]
 usb_audio_probe+0xf05/0x3b10 sound/usb/card.c:1031
 usb_probe_interface+0x303/0x8f0 drivers/usb/core/driver.c:396
 call_driver_probe drivers/base/dd.c:628 [inline]
 really_probe+0x241/0xa60 drivers/base/dd.c:706
 __driver_probe_device+0x20e/0x450 drivers/base/dd.c:868
 driver_probe_device+0x4a/0x140 drivers/base/dd.c:898
 __device_attach_driver+0x1df/0x320 drivers/base/dd.c:1026
 bus_for_each_drv+0x159/0x1e0 drivers/base/bus.c:500
 __device_attach+0x1e4/0x4d0 drivers/base/dd.c:1098
 device_initial_probe+0xaf/0xd0 drivers/base/dd.c:1153
 bus_probe_device+0x64/0x160 drivers/base/bus.c:620
 device_add+0x121d/0x1970 drivers/base/core.c:3772
 usb_set_configuration+0xd97/0x1c60 drivers/usb/core/message.c:2268
 usb_generic_driver_probe+0xa1/0xe0 drivers/usb/core/generic.c:250
 usb_probe_device+0xef/0x400 drivers/usb/core/driver.c:291
 call_driver_probe drivers/base/dd.c:628 [inline]
 really_probe+0x241/0xa60 drivers/base/dd.c:706
 __driver_probe_device+0x20e/0x450 drivers/base/dd.c:868
 driver_probe_device+0x4a/0x140 drivers/base/dd.c:898
 __device_attach_driver+0x1df/0x320 drivers/base/dd.c:1026
 bus_for_each_drv+0x159/0x1e0 drivers/base/bus.c:500
 __device_attach+0x1e4/0x4d0 drivers/base/dd.c:1098
 device_initial_probe+0xaf/0xd0 drivers/base/dd.c:1153
 bus_probe_device+0x64/0x160 drivers/base/bus.c:620
 device_add+0x121d/0x1970 drivers/base/core.c:3772
 usb_new_device.cold+0x685/0x115c drivers/usb/core/hub.c:2695
 hub_port_connect drivers/usb/core/hub.c:5567 [inline]
 hub_port_connect_change drivers/usb/core/hub.c:5707 [inline]
 port_event drivers/usb/core/hub.c:5871 [inline]
 hub_event+0x30a3/0x4a60 drivers/usb/core/hub.c:5953
 process_one_work+0xa23/0x1940 kernel/workqueue.c:3322
 process_scheduled_works kernel/workqueue.c:3405 [inline]
 worker_thread+0x5ef/0xe50 kernel/workqueue.c:3486
 kthread+0x370/0x450 kernel/kthread.c:436
 ret_from_fork+0x72b/0xd50 arch/x86/kernel/process.c:158
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245
 </TASK>
Modules linked in:
---[ end trace 0000000000000000 ]---
RIP: 0010:f_midi2_free_ep_reqs+0x56/0x2b0 drivers/usb/gadget/function/f_midi2.c:1166
Code: 85 6a 02 00 00 49 8b 45 00 48 89 44 24 18 48 05 30 07 00 00 48 89 c2 48 89 44 24 20 48 b8 00 00 00 00 00 fc ff df 48 c1 ea 03 <0f> b6 04 02 84 c0 74 08 3c 03 0f 8e b5 01 00 00 48 8b 44 24 18 31
RSP: 0018:ffffc900006489e8 EFLAGS: 00010002
RAX: dffffc0000000000 RBX: ffff8880559b0000 RCX: ffffffff87e7a829
RDX: 00000000000000e6 RSI: ffffffff87e7a666 RDI: ffff8880559b0128
RBP: ffff8880559b0128 R08: 0000000000000004 R09: 0000000000000020
R10: 0000000000000020 R11: 000000000000758b R12: ffff8880559b00f0
R13: ffff8880559b0128 R14: ffff8880559b0740 R15: 0000000000000001
FS:  0000000000000000(0000) GS:ffff8880d5fdc000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00000000033e4100 CR3: 0000000030cc7000 CR4: 0000000000352ef0
----------------
Code disassembly (best guess):
   0:	85 6a 02             	test   %ebp,0x2(%rdx)
   3:	00 00                	add    %al,(%rax)
   5:	49 8b 45 00          	mov    0x0(%r13),%rax
   9:	48 89 44 24 18       	mov    %rax,0x18(%rsp)
   e:	48 05 30 07 00 00    	add    $0x730,%rax
  14:	48 89 c2             	mov    %rax,%rdx
  17:	48 89 44 24 20       	mov    %rax,0x20(%rsp)
  1c:	48 b8 00 00 00 00 00 	movabs $0xdffffc0000000000,%rax
  23:	fc ff df
  26:	48 c1 ea 03          	shr    $0x3,%rdx
* 2a:	0f b6 04 02          	movzbl (%rdx,%rax,1),%eax <-- trapping instruction
  2e:	84 c0                	test   %al,%al
  30:	74 08                	je     0x3a
  32:	3c 03                	cmp    $0x3,%al
  34:	0f 8e b5 01 00 00    	jle    0x1ef
  3a:	48 8b 44 24 18       	mov    0x18(%rsp),%rax
  3f:	31                   	.byte 0x31


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

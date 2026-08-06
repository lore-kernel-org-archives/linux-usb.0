Received: from mail-ot1-f71.google.com (mail-ot1-f71.google.com [209.85.210.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08FBA418A5E
	for <linux-usb@vger.kernel.org>; Thu,  6 Aug 2026 08:36:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.71
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786005409; cv=none; b=Bez+v4OgCHzsk+dRT/BTkczgBjNpchAy7i2VV1n/OUjfsCxADjmIaWLWVeYV/52v+4aD+wx2kkiMKOGkKCyO+dAdBAB7iu4watN++w63aB0UKh5Cn6Bcawte1jRhsS3WUgq6CEate4zKk3Eyw1pzkPcVpsPIgFioW6AJxFOjP5U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786005409; c=relaxed/simple;
	bh=WpVtJ339N6C28nQdbjSbjgOl4eiblx8BfZSsRVn8kWQ=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=KI0RTZEXFC+W6bVQxWt8I1zZoGq3ATy384+EW5Dwtw6e06dlAPBByq61Q5uLiSdL7OI5X93d26u/JpjKh9XDvBLPDsogILh+uw5ig9TwVdfUf+fOAt6rzuhBCs3JaSHzldnjR2qCjxMlk+XtPVh6DpXEmLsZodHYt+th60XBN/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.210.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-ot1-f71.google.com with SMTP id 46e09a7af769-7e9f6f0240eso2032334a34.3
        for <linux-usb@vger.kernel.org>; Thu, 06 Aug 2026 01:36:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786005399; x=1786610199;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=hww6/OFre4yJNB1Vi3vH1X6KYpeQNDVIXBuv4iLpMaA=;
        b=dn+gCYFKm86dypeGG/mHMNvq2LHPk8fR3H8CQb5HuVEjUR4GwltXSck3D8UyG8RR1M
         LxeC1i+OKLsppL2wZDQedNI1ACUqxtMEQiMwnXgYS08DbPSnwYISyrhURVHm6Pp0wir4
         McbYBB8G2d2MAiUbSCUwuRe+vBYRihN2cTLlaWVErnLk8lLT+vIXbguqXRcunbnxLnvG
         ny3QndrOjWjeKcWoUcvo6KupGOosnnm/J7XKYGRbKL0meYGVLhO4Z9ZxK+2LsrrvTXBU
         zOQ9AU1yQ9QPbFv2YweHxVhdXdk3w1bnYDWk6DMZSR62bm6VgjeFRD5CVDF1j6KAVbKv
         fj3Q==
X-Forwarded-Encrypted: i=1; AHgh+RrEbksweA09c/WITk8ErrWVLG4GEZo48hsIKlW/M1xNjb1j6XylC3Em8Y5YSV7KwdhXxqCykl5Ijp4=@vger.kernel.org
X-Gm-Message-State: AOJu0YzeEdWGwZW/RHwBQzmfWkHzBkHb3f/L9ZMNJQPxOOfZCjPNNrEF
	DB+t46klHTHb6HsltBzmAYl7uSCBhfqC+0V5BHrvqi09WY8HbU53z0yMnHtQMIvC20McCiOl6du
	x8+9Vlvz43VUJdC5ac1A17NPjcnkWtsMOHUC/Z2EijxLAxsg7RB7Kyy3wrqw=
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:2909:b0:6ae:4be6:64ee with SMTP id
 006d021491bc7-6ae970bfd15mr6759717eaf.34.1786005399228; Thu, 06 Aug 2026
 01:36:39 -0700 (PDT)
Date: Thu, 06 Aug 2026 01:36:39 -0700
In-Reply-To: <000000000000b6701405f23f1243@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6a744797.01d0871a.3a0d52.0014.GAE@google.com>
Subject: Re: [syzbot] [usb?] INFO: task hung in hub_event (3)
From: syzbot <syzbot+a7edecbf389d11a369d4@syzkaller.appspotmail.com>
To: gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org, m.grzeschik@pengutronix.de, 
	mathias.nyman@linux.intel.com, raychi@google.com, stern@rowland.harvard.edu, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

syzbot has found a reproducer for the following issue on:

HEAD commit:    0d8395707651 Merge tag 'soc-fixes-7.2-2' of git://git.kern..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=12b3bcc6580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=66aad665ba86f060
dashboard link: https://syzkaller.appspot.com/bug?extid=a7edecbf389d11a369d4
compiler:       Debian clang version 22.1.8 (++20260613092233+e80beda6e255-1~exp1~20260613092250.77), Debian LLD 22.1.8
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=17d477b9580000

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+a7edecbf389d11a369d4@syzkaller.appspotmail.com

INFO: task kworker/1:2:30 blocked for more than 15 seconds.
      Not tainted syzkaller #0
"echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
task:kworker/1:2     state:D stack:25208 pid:30    tgid:30    ppid:2      task_flags:0x4208060 flags:0x00080000
Workqueue: usb_hub_wq hub_event
Call Trace:
 <TASK>
 context_switch kernel/sched/core.c:5510 [inline]
 __schedule+0x17e7/0x5630 kernel/sched/core.c:7234
 __schedule_loop kernel/sched/core.c:7311 [inline]
 schedule+0x164/0x2b0 kernel/sched/core.c:7326
 schedule_preempt_disabled+0x13/0x30 kernel/sched/core.c:7383
 __mutex_lock_common kernel/locking/mutex.c:726 [inline]
 __mutex_lock+0x7bf/0x1550 kernel/locking/mutex.c:821
 hub_port_connect drivers/usb/core/hub.c:5465 [inline]
 hub_port_connect_change drivers/usb/core/hub.c:5707 [inline]
 port_event drivers/usb/core/hub.c:5871 [inline]
 hub_event+0x20c9/0x4d30 drivers/usb/core/hub.c:5953
 process_one_work kernel/workqueue.c:3322 [inline]
 process_scheduled_works+0xa8e/0x14e0 kernel/workqueue.c:3405
 worker_thread+0x92d/0xe10 kernel/workqueue.c:3486
 kthread+0x388/0x470 kernel/kthread.c:436
 ret_from_fork+0x514/0xb70 arch/x86/kernel/process.c:158
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245
 </TASK>

Showing all locks held in the system:
5 locks held by kworker/1:2/30:
 #0: ffff88801fa98140 ((wq_completion)usb_hub_wq){+.+.}-{0:0}, at: process_one_work kernel/workqueue.c:3297 [inline]
 #0: ffff88801fa98140 ((wq_completion)usb_hub_wq){+.+.}-{0:0}, at: process_scheduled_works+0xa20/0x14e0 kernel/workqueue.c:3405
 #1: ffffc90000a67c40 ((work_completion)(&hub->events)){+.+.}-{0:0}, at: process_one_work kernel/workqueue.c:3297 [inline]
 #1: ffffc90000a67c40 ((work_completion)(&hub->events)){+.+.}-{0:0}, at: process_scheduled_works+0xa20/0x14e0 kernel/workqueue.c:3405
 #2: ffff88802ab031d8 (&dev->mutex){....}-{4:4}, at: device_lock include/linux/device.h:1102 [inline]
 #2: ffff88802ab031d8 (&dev->mutex){....}-{4:4}, at: hub_event+0x184/0x4d30 drivers/usb/core/hub.c:5899
 #3: ffff88802ab00568 (&port_dev->status_lock){+.+.}-{4:4}, at: usb_lock_port drivers/usb/core/hub.c:3252 [inline]
 #3: ffff88802ab00568 (&port_dev->status_lock){+.+.}-{4:4}, at: hub_port_connect drivers/usb/core/hub.c:5464 [inline]
 #3: ffff88802ab00568 (&port_dev->status_lock){+.+.}-{4:4}, at: hub_port_connect_change drivers/usb/core/hub.c:5707 [inline]
 #3: ffff88802ab00568 (&port_dev->status_lock){+.+.}-{4:4}, at: port_event drivers/usb/core/hub.c:5871 [inline]
 #3: ffff88802ab00568 (&port_dev->status_lock){+.+.}-{4:4}, at: hub_event+0x20a1/0x4d30 drivers/usb/core/hub.c:5953
 #4: ffff88802a929260 (hcd->address0_mutex){+.+.}-{4:4}, at: hub_port_connect drivers/usb/core/hub.c:5465 [inline]
 #4: ffff88802a929260 (hcd->address0_mutex){+.+.}-{4:4}, at: hub_port_connect_change drivers/usb/core/hub.c:5707 [inline]
 #4: ffff88802a929260 (hcd->address0_mutex){+.+.}-{4:4}, at: port_event drivers/usb/core/hub.c:5871 [inline]
 #4: ffff88802a929260 (hcd->address0_mutex){+.+.}-{4:4}, at: hub_event+0x20c9/0x4d30 drivers/usb/core/hub.c:5953
1 lock held by khungtaskd/32:
 #0: ffffffff8e959c20 (rcu_read_lock){....}-{1:3}, at: rcu_lock_acquire include/linux/rcupdate.h:300 [inline]
 #0: ffffffff8e959c20 (rcu_read_lock){....}-{1:3}, at: rcu_read_lock include/linux/rcupdate.h:840 [inline]
 #0: ffffffff8e959c20 (rcu_read_lock){....}-{1:3}, at: debug_show_all_locks+0x2e/0x180 kernel/locking/lockdep.c:6775
1 lock held by klogd/4964:
2 locks held by getty/5365:
 #0: ffff888035fc90a0 (&tty->ldisc_sem){++++}-{0:0}, at: tty_ldisc_ref_wait+0x25/0x70 drivers/tty/tty_ldisc.c:243
 #1: ffffc900032332e8 (&ldata->atomic_read_lock){+.+.}-{4:4}, at: n_tty_read+0x45a/0x1360 drivers/tty/n_tty.c:2211
5 locks held by kworker/1:3/5730:
 #0: ffff88801fa98140 ((wq_completion)usb_hub_wq){+.+.}-{0:0}, at: process_one_work kernel/workqueue.c:3297 [inline]
 #0: ffff88801fa98140 ((wq_completion)usb_hub_wq){+.+.}-{0:0}, at: process_scheduled_works+0xa20/0x14e0 kernel/workqueue.c:3405
 #1: ffffc9000362fc40 ((work_completion)(&hub->events)){+.+.}-{0:0}, at: process_one_work kernel/workqueue.c:3297 [inline]
 #1: ffffc9000362fc40 ((work_completion)(&hub->events)){+.+.}-{0:0}, at: process_scheduled_works+0xa20/0x14e0 kernel/workqueue.c:3405
 #2: ffff88802aaa91d8 (&dev->mutex){....}-{4:4}, at: device_lock include/linux/device.h:1102 [inline]
 #2: ffff88802aaa91d8 (&dev->mutex){....}-{4:4}, at: hub_event+0x184/0x4d30 drivers/usb/core/hub.c:5899
 #3: ffff88802aaaf568 (&port_dev->status_lock){+.+.}-{4:4}, at: usb_lock_port drivers/usb/core/hub.c:3252 [inline]
 #3: ffff88802aaaf568 (&port_dev->status_lock){+.+.}-{4:4}, at: hub_port_connect drivers/usb/core/hub.c:5464 [inline]
 #3: ffff88802aaaf568 (&port_dev->status_lock){+.+.}-{4:4}, at: hub_port_connect_change drivers/usb/core/hub.c:5707 [inline]
 #3: ffff88802aaaf568 (&port_dev->status_lock){+.+.}-{4:4}, at: port_event drivers/usb/core/hub.c:5871 [inline]
 #3: ffff88802aaaf568 (&port_dev->status_lock){+.+.}-{4:4}, at: hub_event+0x20a1/0x4d30 drivers/usb/core/hub.c:5953
 #4: ffff88802a929260 (hcd->address0_mutex){+.+.}-{4:4}, at: hub_port_connect drivers/usb/core/hub.c:5465 [inline]
 #4: ffff88802a929260 (hcd->address0_mutex){+.+.}-{4:4}, at: hub_port_connect_change drivers/usb/core/hub.c:5707 [inline]
 #4: ffff88802a929260 (hcd->address0_mutex){+.+.}-{4:4}, at: port_event drivers/usb/core/hub.c:5871 [inline]
 #4: ffff88802a929260 (hcd->address0_mutex){+.+.}-{4:4}, at: hub_event+0x20c9/0x4d30 drivers/usb/core/hub.c:5953

=============================================

NMI backtrace for cpu 1
CPU: 1 UID: 0 PID: 32 Comm: khungtaskd Not tainted syzkaller #0 PREEMPT(full) 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 07/16/2026
Call Trace:
 <TASK>
 dump_stack_lvl+0xe8/0x150 lib/dump_stack.c:120
 nmi_cpu_backtrace+0x274/0x2d0 lib/nmi_backtrace.c:122
 nmi_trigger_cpumask_backtrace+0x17a/0x380 lib/nmi_backtrace.c:65
 trigger_all_cpu_backtrace include/linux/nmi.h:162 [inline]
 __sys_info lib/sys_info.c:157 [inline]
 sys_info+0x135/0x170 lib/sys_info.c:165
 check_hung_uninterruptible_tasks kernel/hung_task.c:353 [inline]
 watchdog+0xfd7/0x1030 kernel/hung_task.c:561
 kthread+0x388/0x470 kernel/kthread.c:436
 ret_from_fork+0x514/0xb70 arch/x86/kernel/process.c:158
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245
 </TASK>
Sending NMI from CPU 1 to CPUs 0:
NMI backtrace for cpu 0
CPU: 0 UID: 0 PID: 0 Comm: swapper/0 Not tainted syzkaller #0 PREEMPT(full) 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 07/16/2026
RIP: 0010:pv_native_safe_halt+0xf/0x20 arch/x86/kernel/paravirt.c:64
Code: fc 7c 02 e9 fe df 5c f5 cc cc cc 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 f3 0f 1e fa 66 90 0f 00 2d d3 0e 16 00 fb f4 <e9> d7 df 5c f5 cc cc cc cc cc cc cc cc cc cc cc cc 90 90 90 90 90
RSP: 0018:ffffffff8e607de0 EFLAGS: 00000242
RAX: 00000000000b648f RBX: ffffffff819a152c RCX: 0000000080000001
RDX: 0000000000000001 RSI: ffffffff8e03ecd2 RDI: ffffffff8c2c1c80
RBP: ffffffff8e607eb8 R08: ffff8880b86338db R09: 1ffff110170c671b
R10: dffffc0000000000 R11: ffffed10170c671c R12: 0000000000000000
R13: 1ffffffff1cd1de8 R14: 1ffffffff1cc0fc4 R15: dffffc0000000000
FS:  0000000000000000(0000) GS:ffff888125182000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 000055e85c1d0b11 CR3: 000000000e746000 CR4: 0000000000350ef0
Call Trace:
 <TASK>
 arch_safe_halt arch/x86/kernel/process.c:767 [inline]
 default_idle+0x9/0x20 arch/x86/kernel/process.c:768
 default_idle_call+0x72/0xb0 kernel/sched/idle.c:122
 cpuidle_idle_call kernel/sched/idle.c:199 [inline]
 do_idle+0x1cc/0x540 kernel/sched/idle.c:355
 cpu_startup_entry+0x43/0x60 kernel/sched/idle.c:454
 rest_init+0x2de/0x300 init/main.c:717
 start_kernel+0x392/0x3e0 init/main.c:1175
 x86_64_start_reservations+0x24/0x30 arch/x86/kernel/head64.c:310
 x86_64_start_kernel+0x137/0x1b0 arch/x86/kernel/head64.c:291
 common_startup_64+0x13e/0x157
 </TASK>


---
If you want syzbot to run the reproducer, reply with:
#syz test: git://repo/address.git branch-or-commit-hash
If you attach or paste a git patch, syzbot will apply it before testing.

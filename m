Received: from mail-ot1-f77.google.com (mail-ot1-f77.google.com [209.85.210.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADF1D40D57A
	for <linux-usb@vger.kernel.org>; Sat, 20 Jun 2026 05:37:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.77
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781933841; cv=none; b=UC+7QmVXnNyigIOM28cdz2vdwKXCYzB5DGHrkRriga1QWLp6kdh0e4kFUUY1cC6tzujClTtwpqGVioqJlbNAGHI+dIJUhoFD9riBYCC5IKenwxoW74ADWtLqNWMR8LEuGaSnyPVFyipBc4o+vtSVmbOHNaxm0W4EUym3TgnubOA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781933841; c=relaxed/simple;
	bh=Il1Iz/eTZVr2yLFj/4/2LUrg3PyI2BM5Xp5bOtyyVbM=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=W82GsSqBksmcMuv3hSoZmc1A6g0gZnoSPNq1tNVwLyNiXVmEl73Ij9fbVHUEB6aPRH7FV1CNWXGMMWaQJuCBgHy51yflGd4gcUW8ki+988K3+p1HpG8EtxkGXjJ3cdg9bUMT3zMu4ZCB/GbGdWV9PKYSg6c9eWJRfWxz8twm4qM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.210.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-ot1-f77.google.com with SMTP id 46e09a7af769-7e93b1b8b52so1567710a34.2
        for <linux-usb@vger.kernel.org>; Fri, 19 Jun 2026 22:37:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781933839; x=1782538639;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gBYL4+BiaYUdgvlO7IQKf6T1MU6NBC/KTPIzUfq5Tcc=;
        b=jSh0oZYtZaDNwo3Cp0PDi2dATCMVc5Ip5nREFCbblaosrieExfy3+BHEjIzjhLSiXq
         3OW0viDMPirRydVJF2z7dZfa4N5mWco/U+fbT2XBm0m/TjoURUAmF/i1awSSCAN/rI98
         gPVKzg65M45kEAKO+CNawi2+xj0YIEhISXH4zOPS4ggguu0zAuiQz1Nxsn5aY28HsAwf
         +VfZjnSU8gP593/g0d0LdBBL127wj2psy7+dOT22ihST8mYN7n22S5MlpWO0K5BSlCN9
         P2LvycDSI79ETfC/3s/byj0NJcx0m6notHYrsS+VtFrgigmmHiB9EdxUAp/sFLuWDZVb
         DIlQ==
X-Forwarded-Encrypted: i=1; AFNElJ/d0ClIHx6uq7fZllCtZPlDaP46q4CGWFKwQ1pVKaHZ0tNU/nto88JJmu9YL1+C7se7FU4vEs9geN8=@vger.kernel.org
X-Gm-Message-State: AOJu0YyJY1A1mL+q0g7mv1e0+6Ikj6BkbUwWJagKON68QNKZ8agfo5XD
	m6vAxUmK9CSEkrE4YoBA32O+kBi42DYtYWYOgeMhQ1An+z5aGMc1S1OQJEeNbEkclcg4xUJy947
	sssPXI6oTJV9TcXLNCD7wCM6LAEEgcSqRZxP9foomzV+jtUStX+kHrNfg2pU=
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:1717:b0:485:3a28:a83f with SMTP id
 5614622812f47-48ac0d5c327mr1942641b6e.32.1781933838801; Fri, 19 Jun 2026
 22:37:18 -0700 (PDT)
Date: Fri, 19 Jun 2026 22:37:18 -0700
In-Reply-To: <6742b399.050a0220.1cc393.0033.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6a36270e.bf7b9415.58413.0000.GAE@google.com>
Subject: Re: [syzbot] [usb?] general protection fault in dummy_timer (2)
From: syzbot <syzbot+faf3a6cf579fc65591ca@syzkaller.appspotmail.com>
To: gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

syzbot has found a reproducer for the following issue on:

HEAD commit:    a975094bf98c Merge tag 'exfat-for-7.2-rc1' of git://git.ke..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=125ea50e580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=26c7945305cfa3b1
dashboard link: https://syzkaller.appspot.com/bug?extid=faf3a6cf579fc65591ca
compiler:       gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=16750356580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=132d4586580000

Downloadable assets:
disk image (non-bootable): https://storage.googleapis.com/syzbot-assets/d900f083ada3/non_bootable_disk-a975094b.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/e4435d766294/vmlinux-a975094b.xz
kernel image: https://storage.googleapis.com/syzbot-assets/c6c16f744e16/bzImage-a975094b.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+faf3a6cf579fc65591ca@syzkaller.appspotmail.com

------------[ cut here ]------------
UBSAN: array-index-out-of-bounds in kernel/locking/qspinlock.h:68:9
index 16382 is out of range for type 'long unsigned int [8]'
CPU: 1 UID: 0 PID: 0 Comm: swapper/1 Not tainted syzkaller #0 PREEMPT(full) 
Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.3-debian-1.16.3-2 04/01/2014
Call Trace:
 <IRQ>
 __dump_stack lib/dump_stack.c:94 [inline]
 dump_stack_lvl+0x100/0x190 lib/dump_stack.c:120
 ubsan_epilogue+0xa/0x30 lib/ubsan.c:233
 __ubsan_handle_out_of_bounds+0xcc/0xf0 lib/ubsan.c:455
 decode_tail kernel/locking/qspinlock.h:68 [inline]
 __pv_queued_spin_lock_slowpath+0xbd7/0xc00 kernel/locking/qspinlock.c:285
 pv_queued_spin_lock_slowpath arch/x86/include/asm/paravirt-spinlock.h:35 [inline]
 queued_spin_lock_slowpath arch/x86/include/asm/paravirt-spinlock.h:66 [inline]
 queued_spin_lock include/asm-generic/qspinlock.h:114 [inline]
 do_raw_spin_lock+0x1e0/0x260 kernel/locking/spinlock_debug.c:116
 __raw_spin_lock_irqsave include/linux/spinlock_api_smp.h:133 [inline]
 _raw_spin_lock_irqsave+0x42/0x60 kernel/locking/spinlock.c:166
 complete_with_flags kernel/sched/completion.c:25 [inline]
 complete+0x1d/0x200 kernel/sched/completion.c:52
 transfer drivers/usb/gadget/udc/dummy_hcd.c:1527 [inline]
 dummy_timer+0x121c/0x36c0 drivers/usb/gadget/udc/dummy_hcd.c:1989
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
RIP: 0010:pv_native_safe_halt+0xf/0x20 arch/x86/kernel/paravirt.c:64
Code: 96 88 02 c3 cc cc cc cc 0f 1f 00 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 f3 0f 1e fa eb 07 0f 00 2d 23 d8 14 00 fb f4 <e9> fc 48 03 00 66 2e 0f 1f 84 00 00 00 00 00 66 90 90 90 90 90 90
RSP: 0018:ffffc90000177e00 EFLAGS: 00000246
RAX: 0000000000400dbc RBX: ffff88801e6c2540 RCX: ffffffff8b96c2d5
RDX: 0000000000000001 RSI: ffffffff8c1d2700 RDI: ffffffff81de3aa7
RBP: ffffed1003cd84a8 R08: 0000000000000000 R09: ffffed100d4a678d
R10: ffff88806a533c6b R11: ffffffff81d50f9c R12: 0000000000000000
R13: 0000000000000000 R14: 1ffff9200002efc4 R15: dffffc0000000000
 arch_safe_halt arch/x86/include/asm/paravirt.h:62 [inline]
 default_idle+0x9/0x10 arch/x86/kernel/process.c:767
 default_idle_call+0x6c/0xb0 kernel/sched/idle.c:122
 cpuidle_idle_call kernel/sched/idle.c:199 [inline]
 do_idle+0x3a7/0x5b0 kernel/sched/idle.c:355
 cpu_startup_entry+0x4f/0x60 kernel/sched/idle.c:454
 start_secondary+0x21d/0x2d0 arch/x86/kernel/smpboot.c:312
 common_startup_64+0x13e/0x158
 </TASK>
---[ end trace ]---
----------------
Code disassembly (best guess):
   0:	96                   	xchg   %eax,%esi
   1:	88 02                	mov    %al,(%rdx)
   3:	c3                   	ret
   4:	cc                   	int3
   5:	cc                   	int3
   6:	cc                   	int3
   7:	cc                   	int3
   8:	0f 1f 00             	nopl   (%rax)
   b:	90                   	nop
   c:	90                   	nop
   d:	90                   	nop
   e:	90                   	nop
   f:	90                   	nop
  10:	90                   	nop
  11:	90                   	nop
  12:	90                   	nop
  13:	90                   	nop
  14:	90                   	nop
  15:	90                   	nop
  16:	90                   	nop
  17:	90                   	nop
  18:	90                   	nop
  19:	90                   	nop
  1a:	90                   	nop
  1b:	f3 0f 1e fa          	endbr64
  1f:	eb 07                	jmp    0x28
  21:	0f 00 2d 23 d8 14 00 	verw   0x14d823(%rip)        # 0x14d84b
  28:	fb                   	sti
  29:	f4                   	hlt
* 2a:	e9 fc 48 03 00       	jmp    0x3492b <-- trapping instruction
  2f:	66 2e 0f 1f 84 00 00 	cs nopw 0x0(%rax,%rax,1)
  36:	00 00 00
  39:	66 90                	xchg   %ax,%ax
  3b:	90                   	nop
  3c:	90                   	nop
  3d:	90                   	nop
  3e:	90                   	nop
  3f:	90                   	nop


---
If you want syzbot to run the reproducer, reply with:
#syz test: git://repo/address.git branch-or-commit-hash
If you attach or paste a git patch, syzbot will apply it before testing.

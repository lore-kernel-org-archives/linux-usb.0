Received: from mail-oi1-f207.google.com (mail-oi1-f207.google.com [209.85.167.207])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F9D63D5674
	for <linux-usb@vger.kernel.org>; Tue,  4 Aug 2026 00:54:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.207
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785804863; cv=none; b=Ae0DpSJvZkEiwqaJIohk1LWbQ5f51GA/QvJtmaVWir6h0zqwOd/SirXruAOBSnzW2KwXlQJ1sxv1UlC/TUWCToFAbdVsgER0CtbpaP3MrHESEewZuIpQuVypGPN7MMxYa89Nion28BgkCqecWj9garDC4LZbo6SyGoNmzmzpu+0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785804863; c=relaxed/simple;
	bh=GOm7hNA1SDTFWEXlyNk+KrY+NMgVFg6/NxYVQ5JfG4I=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=hnCrV5SZ69qVtMFmWk+SdHYkxhnLSHsJqwhRWGy3qhwP18/jAoqrylOXmI59bO4BmgYu7cuHiR+jyuz4EkHzkkuLboAPQ4RZJXjKVPklz2cGh8O5OpIwGWsZ3f0lqOcNvt6KX9+FMwEddaQ3zs0irLASbT0alym0IVt8wImwPUg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.207
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f207.google.com with SMTP id 5614622812f47-48e5de5a23cso2367328b6e.0
        for <linux-usb@vger.kernel.org>; Mon, 03 Aug 2026 17:54:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785804861; x=1786409661;
        h=content-type:to:from:subject:message-id:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=u5UCRU8bhI6JU/9gONm1CNlxMA4ZYw4dAZxma0LCOWY=;
        b=cna7hiuKNyUZ1wF7+7cL1i+5aomWhdI/y62tKXvtRoP1bH7i7iIkafNTcc2QBzifwQ
         C00NSUy8V3lm7jdgQsqY3dJlMzcsCYpSK1qg9f3jHzHsQoTwCHV2I/NmU2VXI5cEUCkg
         ciGvMNHR+BPvGVDNDc6tjRXmFmLWC4hHvs/fg3s543n4ERpbwJfNgT5JogXf/YSLCEek
         eXQSTbvN+qtbzhlTnAvgw67hONYF3XPuU4VKAmNuxDnN9bbpPVT63z9OMM0OFD/F/aY7
         J6mgPshbcVtSGLRdLXL33YuVwrKSwKUxQFya0jr1jfVGvodS51kOeDpWnwqL6RDaAlnl
         A1Mg==
X-Forwarded-Encrypted: i=1; AHgh+RovRAYuzpKOztQ9qXecpu8N4Ya7kCtvV8xERd38aaP0CxXMcR27NntIN33wY3w0Mo4i74dyszhi2pw=@vger.kernel.org
X-Gm-Message-State: AOJu0YzQaqsjmAhwl1P3gbbSY4WGkqtox0PtI0SaqQt9yRkVSqO+V1xN
	Ycr05SJhIYtSFkq0erB3lkJWUZ8LvIxS8YPzwTBuHD0AGtUHsba/x2llmzn5kDyc97bde4Z+RrZ
	5gqt7/WOwKsr3X6sbGGSk6K8xbBF557hPc9W4Lnqgxhdv238rlKvjxyf5PpM=
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:17aa:b0:487:530f:5754 with SMTP id
 5614622812f47-4af5e2f59b4mr22289774b6e.20.1785804860946; Mon, 03 Aug 2026
 17:54:20 -0700 (PDT)
Date: Mon, 03 Aug 2026 17:54:20 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6a71383c.d35e88fd.de8b.0005.GAE@google.com>
Subject: [syzbot] [usb?] WARNING in __fsg_is_set
From: syzbot <syzbot+d31109047baed8f3b590@syzkaller.appspotmail.com>
To: gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    3708dd948844 Merge tag 'pm-7.2-rc6' of git://git.kernel.or..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=14e278c6580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=145fa60d73086782
dashboard link: https://syzkaller.appspot.com/bug?extid=d31109047baed8f3b590
compiler:       gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/aa997b3eeef4/disk-3708dd94.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/1ab7e579d11e/vmlinux-3708dd94.xz
kernel image: https://storage.googleapis.com/syzbot-assets/7038f45d2e15/bzImage-3708dd94.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+d31109047baed8f3b590@syzkaller.appspotmail.com

configfs-gadget.g1 gadget.0: common->fsg is NULL in fsg_setup at 467
------------[ cut here ]------------
1
WARNING: drivers/usb/gadget/function/f_mass_storage.c:316 at __fsg_is_set.part.0.isra.0+0x2c/0x3a drivers/usb/gadget/function/f_mass_storage.c:316, CPU#0: syz-executor/7045
Modules linked in:
CPU: 0 UID: 0 PID: 7045 Comm: syz-executor Tainted: G             L      syzkaller #0 PREEMPT(full) 
Tainted: [L]=SOFTLOCKUP
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 07/16/2026
RIP: 0010:__fsg_is_set.part.0.isra.0+0x2c/0x3a drivers/usb/gadget/function/f_mass_storage.c:316
Code: 41 89 d4 55 48 89 f5 53 48 89 fb e8 ce c9 b5 00 48 8d bb d8 00 00 00 44 89 e1 48 89 ea 48 c7 c6 80 48 ba 8c e8 75 87 eb ff 90 <0f> 0b 90 31 c0 5b 5d 41 5c e9 86 5b 6a 0a e8 a1 c9 b5 00 4c 89 e2
RSP: 0018:ffffc90000007a50 EFLAGS: 00010082
RAX: 0000000000000000 RBX: ffff888028710c00 RCX: 0000000000000000
RDX: ffff888096b22540 RSI: ffffffff81401999 RDI: fffff52000000f3a
RBP: ffffffff8cba6580 R08: 0000000000000005 R09: 0000000000000000
R10: 0000000080000102 R11: 0000000000000000 R12: 00000000000001d3
R13: ffff88802b94fce8 R14: 0000000000000000 R15: ffffc90000007de8
FS:  0000000000000000(0000) GS:ffff888123dda000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007f3c94bf84c0 CR3: 000000008125d000 CR4: 00000000003526f0
Call Trace:
 <IRQ>
 __fsg_is_set drivers/usb/gadget/function/f_mass_storage.c:865 [inline]
 fsg_setup.cold+0x38/0x4c drivers/usb/gadget/function/f_mass_storage.c:467
 composite_setup+0xad8/0x9290 drivers/usb/gadget/composite.c:2239
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
RIP: 0010:finish_task_switch.isra.0+0x2cd/0x10c0 kernel/sched/core.c:5361
Code: ab 0a 00 00 41 c7 87 20 0e 00 00 00 00 00 00 0f 1f 44 00 00 49 8d 7f 48 e8 d0 a5 e8 09 e8 6b ad 3c 00 fb 48 8d bb f8 16 00 00 <48> b8 00 00 00 00 00 fc ff df 48 89 fa 48 c1 ea 03 0f b6 04 02 84
RSP: 0018:ffffc90005317308 EFLAGS: 00000202
RAX: 00000000000d9725 RBX: ffff888096b22540 RCX: 0000000000000080
RDX: 0000000000000000 RSI: ffffffff8e1a7695 RDI: ffff888096b23c38
RBP: ffffc90005317360 R08: 0000000000000001 R09: 0000000000000000
R10: 0000000000000001 R11: 0000000000000000 R12: ffff888054164a80
R13: 0000000000000000 R14: ffffffff9122b4a4 R15: ffff8880b843b4c0
 context_switch kernel/sched/core.c:5513 [inline]
 __schedule+0x1264/0x6730 kernel/sched/core.c:7234
 preempt_schedule_common+0x42/0xc0 kernel/sched/core.c:7413
 preempt_schedule_thunk+0x16/0x40 arch/x86/entry/thunk.S:12
 __raw_spin_unlock include/linux/spinlock_api_smp.h:169 [inline]
 _raw_spin_unlock+0x3e/0x50 kernel/locking/spinlock.c:190
 spin_unlock include/linux/spinlock.h:390 [inline]
 zap_pte_range mm/memory.c:1964 [inline]
 zap_pmd_range mm/memory.c:2020 [inline]
 zap_pud_range mm/memory.c:2048 [inline]
 zap_p4d_range mm/memory.c:2069 [inline]
 __zap_vma_range+0x16f7/0x4a30 mm/memory.c:2109
 unmap_vmas+0x299/0x5f0 mm/memory.c:2178
 exit_mmap+0x1ef/0xa00 mm/mmap.c:1300
 __mmput+0x12a/0x410 kernel/fork.c:1187
 mmput+0x67/0x80 kernel/fork.c:1210
 exit_mm kernel/exit.c:615 [inline]
 do_exit+0x8b1/0x2ae0 kernel/exit.c:997
 do_group_exit+0xd5/0x2a0 kernel/exit.c:1152
 get_signal+0x1ec7/0x21e0 kernel/signal.c:3046
 arch_do_signal_or_restart+0x91/0x7e0 arch/x86/kernel/signal.c:337
 __exit_to_user_mode_loop kernel/entry/common.c:66 [inline]
 exit_to_user_mode_loop+0x139/0x6f0 kernel/entry/common.c:101
 __exit_to_user_mode_prepare include/linux/irq-entry-common.h:207 [inline]
 syscall_exit_to_user_mode_prepare include/linux/irq-entry-common.h:230 [inline]
 syscall_exit_to_user_mode include/linux/entry-common.h:318 [inline]
 do_syscall_64+0x666/0x870 arch/x86/entry/syscall_64.c:100
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7fb7f835e84e
Code: Unable to access opcode bytes at 0x7fb7f835e824.
RSP: 002b:00007ffc9019ebb8 EFLAGS: 00000246 ORIG_RAX: 00000000000000e6
RAX: fffffffffffffdfc RBX: 0000555587db6500 RCX: 00007fb7f835e84e
RDX: 00007ffc9019ec10 RSI: 0000000000000000 RDI: 0000000000000000
RBP: 00007ffc9019ec7c R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000001388
R13: 00000000000927c0 R14: 0000000000208ec2 R15: 00007ffc9019ecd0
 </TASK>
----------------
Code disassembly (best guess), 2 bytes skipped:
   0:	00 00                	add    %al,(%rax)
   2:	41 c7 87 20 0e 00 00 	movl   $0x0,0xe20(%r15)
   9:	00 00 00 00
   d:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
  12:	49 8d 7f 48          	lea    0x48(%r15),%rdi
  16:	e8 d0 a5 e8 09       	call   0x9e8a5eb
  1b:	e8 6b ad 3c 00       	call   0x3cad8b
  20:	fb                   	sti
  21:	48 8d bb f8 16 00 00 	lea    0x16f8(%rbx),%rdi
* 28:	48 b8 00 00 00 00 00 	movabs $0xdffffc0000000000,%rax <-- trapping instruction
  2f:	fc ff df
  32:	48 89 fa             	mov    %rdi,%rdx
  35:	48 c1 ea 03          	shr    $0x3,%rdx
  39:	0f b6 04 02          	movzbl (%rdx,%rax,1),%eax
  3d:	84                   	.byte 0x84


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

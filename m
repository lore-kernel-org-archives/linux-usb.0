Received: from mail-oo1-f78.google.com (mail-oo1-f78.google.com [209.85.161.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FDA8265623
	for <linux-usb@vger.kernel.org>; Mon, 17 Aug 2026 07:39:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.78
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786952367; cv=none; b=mvH/pirkUAIMJF1+K6jIwm/4Yg21yOtjKRuyfT8DkWLlDvr2FJhFcHvTpt+CYLuNwerGEe7MV0mT3vRrEzDM4hD0xGsoLqp9PpHJoKYW9UClUCBGQs+yhtS8TibibZx28LArFDYdIYRqdruDCc8Z0C1YkOyHwF8hgarr3QKxi7I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786952367; c=relaxed/simple;
	bh=62Dkt1OuN4cYLFqXOaQzG8gxAN9Yna61e7/ZlJnPTD8=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=b0b/Q6ruELVcHBgsGnWJUyCzNjc9i1qfBjJBcij/C5XUWSmvRsqpKM4ZqF2EWK+AG9MIIa168a8aXDVFL7w/8nTGdapa7dowc9nu1ov2vAPVsmTQQBdjj5asWhAcWHmz6utrITl9VAoYd9ldRfGVHNNq+3OPVjZqO7YOpbWpXgw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.161.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oo1-f78.google.com with SMTP id 006d021491bc7-6b0e7370be1so3049765eaf.0
        for <linux-usb@vger.kernel.org>; Mon, 17 Aug 2026 00:39:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786952364; x=1787557164;
        h=content-type:to:from:subject:message-id:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PODaGi6JLVfOOgQvlPTT7QyNO2H21lSE4OjITdt1k6A=;
        b=fzuoIDHLm8i1fQrkE7TZk1XXvJeT2vFZih3gzHRJ40vMBQduETeBi/RoHekT8vB4Pw
         r9EAfX3Du/QpJc/9YVs5XXWPXzkekliBxXDR8LDi3kEveFUnfv37lK3km8v1ZotK0XMD
         ysenBNr51HGTZX3+2/u2rsU8qJb9ny4ZPFPenH5gAQzxdlCbb5xyrAsstYvG8N/riDCL
         4E8bz//FtWLZNY7/E7T1N0nY7boBrFcru21J0KoTvPVdFEMvSaNKbrsh0uYIEDcnzw0f
         zUY+1+tXi9GrsD8TBkU2VnPJk/KBmuXO+qEe413xjeKtlaq4wrrF0n+mm6LYE6Ex90fa
         ro0A==
X-Forwarded-Encrypted: i=1; AHgh+Rqd3bNw4BPyLa0UlLXV8kt9qRebDFQD8j6V+8H0NDyhXeIxk2krgJL57huayPT4Vy2/GUWqS49Qgwg=@vger.kernel.org
X-Gm-Message-State: AOJu0YyD1XJOZAuGm+3R0V3hJOctmjZSx4DN3ZLwmaSXHSk3JL/HP4kA
	M5kybWffhnLCqsCbVJVzQg4LxnRlpCSYtcnahsZEXrJxuJSQgvb+KCopua00VE9LRGegmeSnQ1I
	f+9EODA4VMZUooeeqlAefadqDe/4N6QEkF/Cjn0y2V59YRFcQPqtc3A1fWZc=
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:4de4:b0:6ae:960e:d285 with SMTP id
 006d021491bc7-6b0c5bf53f1mr20939303eaf.15.1786952364097; Mon, 17 Aug 2026
 00:39:24 -0700 (PDT)
Date: Mon, 17 Aug 2026 00:39:24 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6a82baac.10853dc7.22f513.001a.GAE@google.com>
Subject: [syzbot] [usb?] general protection fault in fsg_common_set_num_buffers
From: syzbot <syzbot+791be35f1fbcc85d06d7@syzkaller.appspotmail.com>
To: gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    dcb68831eac7 Merge tag 'block-7.2-20260815' of git://git.k..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=13dbda79580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=1d67342c314f228d
dashboard link: https://syzkaller.appspot.com/bug?extid=791be35f1fbcc85d06d7
compiler:       gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/616b82a1afb9/disk-dcb68831.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/4b1958ef02ef/vmlinux-dcb68831.xz
kernel image: https://storage.googleapis.com/syzbot-assets/8138e3edc5b6/bzImage-dcb68831.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+791be35f1fbcc85d06d7@syzkaller.appspotmail.com

Mass Storage Function, version: 2009/09/11
LUN: removable file: (no medium)
Oops: general protection fault, probably for non-canonical address 0xdffffc0000000002: 0000 [#1] SMP KASAN NOPTI
KASAN: null-ptr-deref in range [0x0000000000000010-0x0000000000000017]
CPU: 1 UID: 0 PID: 7793 Comm: syz.6.613 Not tainted syzkaller #0 PREEMPT(full) 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 07/16/2026
RIP: 0010:fsg_common_set_num_buffers+0xad/0x340 drivers/usb/gadget/function/f_mass_storage.c:2763
Code: 42 80 3c 30 00 0f 85 52 02 00 00 48 89 6d e0 e8 99 48 2c fa be c0 0c 00 00 bf 00 40 00 00 e8 ca 6c 90 fa 48 89 ea 48 c1 ea 03 <42> 80 3c 32 00 0f 85 04 02 00 00 48 89 45 00 48 85 c0 75 95 e8 6a
RSP: 0018:ffffc90004637bc0 EFLAGS: 00010202
RAX: ffff88805b230000 RBX: 0000000000000000 RCX: 0000000000004000
RDX: 0000000000000002 RSI: ffffffff8c600300 RDI: ffffffff8e674928
RBP: 0000000000000010 R08: 0000000000000cc0 R09: 00000000ffffffff
R10: ffffed100b646800 R11: 0000000000000000 R12: 0000000000000000
R13: 0000000000000010 R14: dffffc0000000000 R15: ffff88807824c000
FS:  00007fe3849546c0(0000) GS:ffff888123cde000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 000000110c40497d CR3: 000000005b094000 CR4: 00000000003526f0
Call Trace:
 <TASK>
 fsg_opts_num_buffers_store+0x168/0x1b0 drivers/usb/gadget/function/f_mass_storage.c:3452
 flush_write_buffer fs/configfs/file.c:207 [inline]
 configfs_write_iter+0x302/0x4e0 fs/configfs/file.c:229
 new_sync_write fs/read_write.c:595 [inline]
 vfs_write+0x6ac/0x1050 fs/read_write.c:687
 ksys_write+0x12a/0x250 fs/read_write.c:739
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0x115/0x870 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7fe38399e0d9
Code: ff c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 44 00 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 e8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007fe384954028 EFLAGS: 00000246 ORIG_RAX: 0000000000000001
RAX: ffffffffffffffda RBX: 00007fe383c25fa0 RCX: 00007fe38399e0d9
RDX: 0000000000000002 RSI: 0000200000000000 RDI: 0000000000000003
RBP: 00007fe383a35024 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000000
R13: 00007fe383c26038 R14: 00007fe383c25fa0 R15: 00007ffcf60b29f8
 </TASK>
Modules linked in:
---[ end trace 0000000000000000 ]---
RIP: 0010:fsg_common_set_num_buffers+0xad/0x340 drivers/usb/gadget/function/f_mass_storage.c:2763
Code: 42 80 3c 30 00 0f 85 52 02 00 00 48 89 6d e0 e8 99 48 2c fa be c0 0c 00 00 bf 00 40 00 00 e8 ca 6c 90 fa 48 89 ea 48 c1 ea 03 <42> 80 3c 32 00 0f 85 04 02 00 00 48 89 45 00 48 85 c0 75 95 e8 6a
RSP: 0018:ffffc90004637bc0 EFLAGS: 00010202
RAX: ffff88805b230000 RBX: 0000000000000000 RCX: 0000000000004000
RDX: 0000000000000002 RSI: ffffffff8c600300 RDI: ffffffff8e674928
RBP: 0000000000000010 R08: 0000000000000cc0 R09: 00000000ffffffff
R10: ffffed100b646800 R11: 0000000000000000 R12: 0000000000000000
R13: 0000000000000010 R14: dffffc0000000000 R15: ffff88807824c000
FS:  00007fe3849546c0(0000) GS:ffff888123cde000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 000055d6ba9dece8 CR3: 000000005b094000 CR4: 00000000003526f0
----------------
Code disassembly (best guess):
   0:	42 80 3c 30 00       	cmpb   $0x0,(%rax,%r14,1)
   5:	0f 85 52 02 00 00    	jne    0x25d
   b:	48 89 6d e0          	mov    %rbp,-0x20(%rbp)
   f:	e8 99 48 2c fa       	call   0xfa2c48ad
  14:	be c0 0c 00 00       	mov    $0xcc0,%esi
  19:	bf 00 40 00 00       	mov    $0x4000,%edi
  1e:	e8 ca 6c 90 fa       	call   0xfa906ced
  23:	48 89 ea             	mov    %rbp,%rdx
  26:	48 c1 ea 03          	shr    $0x3,%rdx
* 2a:	42 80 3c 32 00       	cmpb   $0x0,(%rdx,%r14,1) <-- trapping instruction
  2f:	0f 85 04 02 00 00    	jne    0x239
  35:	48 89 45 00          	mov    %rax,0x0(%rbp)
  39:	48 85 c0             	test   %rax,%rax
  3c:	75 95                	jne    0xffffffd3
  3e:	e8                   	.byte 0xe8
  3f:	6a                   	.byte 0x6a


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

Received: from mail-oi1-f208.google.com (mail-oi1-f208.google.com [209.85.167.208])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F405D3B42D0
	for <linux-usb@vger.kernel.org>; Mon, 24 Aug 2026 05:35:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.208
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787549746; cv=none; b=OESEKeFPOblDTiSrzDcuOOw7KAbZQRxXyi1wkC5JrV3lCFjKfp6jpD7j2QfmAZy/SXVznEKAjDR4ZH1dSec2/lJ09zKeEiHovi4VkTx0KzASWaP1sTWTfBjpmuzc2j99wenYnqMWrHXAMhZB3MD2aBtFLRvtuCny7zRtNP1Vub8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787549746; c=relaxed/simple;
	bh=EOm+OYxGYNowhOyH3xaCdsiIaa8ybc56mhdSK26/EVo=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=LjsO4Fu/v8ys1JnQiB89l7Fa8UXhh3S8dztnJu+ZZJiX8fP4pXuHroJ5SR27AN6DJAwezGXKujqfTuklLML6nLh2BD4WZ8+q9pn5gynHAFVx1C3v33RehHGV3ETBwfrMDSf362pypPoa3LGzhi3z7mPZKsbQ3ZiXkIOt/N1t6Ng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.208
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f208.google.com with SMTP id 5614622812f47-4b3319233c2so1601206b6e.0
        for <linux-usb@vger.kernel.org>; Sun, 23 Aug 2026 22:35:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787549738; x=1788154538;
        h=content-type:to:from:subject:message-id:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8pm6VawU1AQmmc4WJVwY3FhKHPDA30TbER0YlV1VDWw=;
        b=eNfY+QFyaBnZ7+Aohh9pGm1gj3xAVkeG/5IvthufLcMXIFQvSua4ORcEZCp/sGzpn/
         CunAujuupsIRC+VQ1k0xkPQm6G9/bTG+ksbdwWravf751n16wnFryqVThgzX0r1yAMJ6
         qCF8k47waUnV035X4PpzgJy8urg51SPubIF7WrlVYAQ3j3zIeWusI4ZXBcYEtQudqeQV
         S9g94Q208opGZUiF9VvsmIh2QgPaWkjJUGZrDsJ6SZhVBz6ECS5UXTTlNtkrEWwOEMV7
         Pry2nCSpY47EYnAXE7DFj2eFr2vKnwrnw6ZM6eywCjFnhMlsYQzOOhVD+EF9APXq7Vhd
         I9EQ==
X-Forwarded-Encrypted: i=1; AHgh+RpEWwnrRwp8R3ED+CazVlsxVXNVF5FwQ/gqhT8xZ7PwfFwyw8qTiuHw2V5JbrIXRrKiPNuMv905zyY=@vger.kernel.org
X-Gm-Message-State: AFuF++kh3SEjvkl7nSf6R/S7r1WIosw6kLDf4mOzpqp12GaTD/+MbB89
	IbOw4uxS9efJ2eNAnL2gexMUczBxAIktpUS8L6KadLZtQxafOUWHJin2qNqY3OHV5LC26BdcbUu
	//Ks2uEWMzAB+Oi2VlSL2Pdmjt/+ZaG9UJNblSBM0/eqDtm0KFhXYPThyM1w=
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:6c82:b0:4b2:9d0d:ffa with SMTP id
 5614622812f47-4b2eef530c3mr25232470b6e.0.1787549738532; Sun, 23 Aug 2026
 22:35:38 -0700 (PDT)
Date: Sun, 23 Aug 2026 22:35:38 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6a8bd82a.dbb3a75c.13dd47.0061.GAE@google.com>
Subject: [syzbot] [usb-storage?] divide error in alauda_transport
From: syzbot <syzbot+dc208a8cf8d37cf3e5ac@syzkaller.appspotmail.com>
To: gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org, stern@rowland.harvard.edu, 
	syzkaller-bugs@googlegroups.com, usb-storage@lists.one-eyed-alien.net
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    7f063b2f17ea Merge tag 'for_linus' of git://git.kernel.org..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=13d23e79580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=202110c0ee6856a6
dashboard link: https://syzkaller.appspot.com/bug?extid=dc208a8cf8d37cf3e5ac
compiler:       Debian clang version 22.1.8 (++20260613092233+e80beda6e255-1~exp1~20260613092250.77), Debian LLD 22.1.8
userspace arch: i386
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=16c3e549580000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/8ee85add2a67/disk-7f063b2f.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/2d02bce810bb/vmlinux-7f063b2f.xz
kernel image: https://storage.googleapis.com/syzbot-assets/12151938fa51/bzImage-7f063b2f.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+dc208a8cf8d37cf3e5ac@syzkaller.appspotmail.com

Oops: divide error: 0000 [#1] SMP KASAN PTI
CPU: 1 UID: 0 PID: 5915 Comm: usb-storage Not tainted syzkaller #0 PREEMPT(full) 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 07/24/2026
RIP: 0010:alauda_read_data drivers/usb/storage/alauda.c:954 [inline]
RIP: 0010:alauda_transport+0xbd6/0x43a0 drivers/usb/storage/alauda.c:1187
Code: 24 70 e8 2d e9 2e fa 41 0f b7 c4 0f b7 cb 89 8c 24 e0 00 00 00 48 8b 5c 24 40 4c 8b 74 24 28 45 89 fc 41 89 c7 44 89 f8 31 d2 <f7> b4 24 e8 00 00 00 89 54 24 50 41 89 c5 48 89 df 89 c6 e8 52 61
RSP: 0018:ffffc9000249f860 EFLAGS: 00010246
RAX: 0000000000000000 RBX: ffff88807ff3ce90 RCX: 0000000000000000
RDX: 0000000000000000 RSI: 0000000000000000 RDI: 0000000000000020
RBP: ffffc9000249faf0 R08: ffff888026289f40 R09: 0000000000000004
R10: 00000000ffffffe0 R11: 0000000000000000 R12: 0000000000000001
R13: 0000000000000000 R14: ffff88807ff3d258 R15: 0000000000000000
FS:  0000000000000000(0000) GS:ffff888125014000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00000000f67dcda4 CR3: 0000000070670000 CR4: 00000000003526f0
Call Trace:
 <TASK>
 usb_stor_invoke_transport+0x115/0x1a40 drivers/usb/storage/transport.c:611
 usb_stor_control_thread+0x44c/0x8f0 drivers/usb/storage/usb.c:462
 kthread+0x38b/0x480 kernel/kthread.c:436
 ret_from_fork+0x514/0xb70 arch/x86/kernel/process.c:158
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245
 </TASK>
Modules linked in:
---[ end trace 0000000000000000 ]---
RIP: 0010:alauda_read_data drivers/usb/storage/alauda.c:954 [inline]
RIP: 0010:alauda_transport+0xbd6/0x43a0 drivers/usb/storage/alauda.c:1187
Code: 24 70 e8 2d e9 2e fa 41 0f b7 c4 0f b7 cb 89 8c 24 e0 00 00 00 48 8b 5c 24 40 4c 8b 74 24 28 45 89 fc 41 89 c7 44 89 f8 31 d2 <f7> b4 24 e8 00 00 00 89 54 24 50 41 89 c5 48 89 df 89 c6 e8 52 61
RSP: 0018:ffffc9000249f860 EFLAGS: 00010246
RAX: 0000000000000000 RBX: ffff88807ff3ce90 RCX: 0000000000000000
RDX: 0000000000000000 RSI: 0000000000000000 RDI: 0000000000000020
RBP: ffffc9000249faf0 R08: ffff888026289f40 R09: 0000000000000004
R10: 00000000ffffffe0 R11: 0000000000000000 R12: 0000000000000001
R13: 0000000000000000 R14: ffff88807ff3d258 R15: 0000000000000000
FS:  0000000000000000(0000) GS:ffff888124f14000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007f1b845212c0 CR3: 0000000072220000 CR4: 00000000003526f0
----------------
Code disassembly (best guess):
   0:	24 70                	and    $0x70,%al
   2:	e8 2d e9 2e fa       	call   0xfa2ee934
   7:	41 0f b7 c4          	movzwl %r12w,%eax
   b:	0f b7 cb             	movzwl %bx,%ecx
   e:	89 8c 24 e0 00 00 00 	mov    %ecx,0xe0(%rsp)
  15:	48 8b 5c 24 40       	mov    0x40(%rsp),%rbx
  1a:	4c 8b 74 24 28       	mov    0x28(%rsp),%r14
  1f:	45 89 fc             	mov    %r15d,%r12d
  22:	41 89 c7             	mov    %eax,%r15d
  25:	44 89 f8             	mov    %r15d,%eax
  28:	31 d2                	xor    %edx,%edx
* 2a:	f7 b4 24 e8 00 00 00 	divl   0xe8(%rsp) <-- trapping instruction
  31:	89 54 24 50          	mov    %edx,0x50(%rsp)
  35:	41 89 c5             	mov    %eax,%r13d
  38:	48 89 df             	mov    %rbx,%rdi
  3b:	89 c6                	mov    %eax,%esi
  3d:	e8                   	.byte 0xe8
  3e:	52                   	push   %rdx
  3f:	61                   	(bad)


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

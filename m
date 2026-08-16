Received: from mail-ot1-f69.google.com (mail-ot1-f69.google.com [209.85.210.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0374346766
	for <linux-usb@vger.kernel.org>; Sun, 16 Aug 2026 15:50:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.69
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786895437; cv=none; b=Ti6U1ftCrNNbjkSWKiETQVkHPRz3VtEHYcE7PPOe8wvSMXsmU9gUvJ+YcsyTCi2v+03msOJMLdHufTVYfIBB5i/ZFRi5kRcvl8EH+1t6hngMdJnxS5aM3VJz9LZAIgvaqK6K74VTJr33xe2G0gIQdevV9w3Mg5Mkmhhunr8tzR4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786895437; c=relaxed/simple;
	bh=/SnFRFWZ+e2MT0MdERjDdfGocHFBwEI3oS9OvKJuxDM=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=pJCLkhanHFnL6kCAV2xNGrFLhMc/nxrsza5fs9b4zCqA1tFgzYyUSdT0Hypj24fgXLU/uYOxt3Ch/M37pnlZlSIA20lEVx4QCcUmfgGopyy3Z4I+QYJiNIl6PElwRcngxMAlihEeLpjDCSNdTQAdbkNf6i2kuKPKkP3NJRlF8PA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.210.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-ot1-f69.google.com with SMTP id 46e09a7af769-7e6b59d85dcso5303463a34.3
        for <linux-usb@vger.kernel.org>; Sun, 16 Aug 2026 08:50:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786895433; x=1787500233;
        h=content-type:to:from:subject:message-id:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4F/qYOLfXsZiQ5CWsAPa/yqxgrqMFi8Q2t/jWge6hqw=;
        b=swbOtzDaRQIOK5ZIzKXSi/4I8fS8fbY4VYlK3UoFqU/8hGUn6OClOqy67kuQbfocnN
         UhCdvF5h+Fjb75U58f3pMjLK7bnIlrlOZoIUz5bRxXNCtLmshaWlTUzCJ8KMkheHa1Ub
         JmaK97ft8PJDyiOzA+CnhLTgN9tmWhhM98EkmBrOTRWXTuO49JDNm78nXPAXRadpUqM9
         c/B561Zq5CnAZ8IX4qkXdqZe12E0sxG3oouJTglG3wH3rYv/Uw23mk9fEQQMANJn5W1w
         xi4+IHixlacmEq9vsCYNQFSLpYk4xKjfYkf3czhUrI8LuKNcVJfmLUHXfRTqjRwiO88v
         RBzw==
X-Forwarded-Encrypted: i=1; AHgh+RoBnVtF7HDQpcMZkCqm6I8tqqe0zmd1O2NjYj81y08FWGSNh2cgDXMdzV8AElg7Iw1b3ZNQKmTxu+g=@vger.kernel.org
X-Gm-Message-State: AOJu0YyovFi3MUGD2520VuUpTlb++hn9mopt5+yQ1Ecg/5Fs+DW6nu4r
	AcbE25riCohnNn62jhqIKkqKyu3hRN8TP6Br5ZMw5C351ValtuKf/5H1Zc65/RuGoo4wAq9YX89
	33g9BazXXIlto5Cufe7g1j68RO9WefhigYJ2mks58K45Lral45hyyr+7Cu3U=
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:824:b0:694:9c71:2772 with SMTP id
 006d021491bc7-6b0d617c8d9mr15377627eaf.16.1786895433437; Sun, 16 Aug 2026
 08:50:33 -0700 (PDT)
Date: Sun, 16 Aug 2026 08:50:33 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6a81dc49.dbb3a75c.20434b.0037.GAE@google.com>
Subject: [syzbot] [usb?] general protection fault in adsl_state_store
From: syzbot <syzbot+9b195c4f412ea5c4e56a@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    3eb40771c00a Merge tag 'soc-fixes-7.2-3' of git://git.kern..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=12fc9949580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=1d67342c314f228d
dashboard link: https://syzkaller.appspot.com/bug?extid=9b195c4f412ea5c4e56a
compiler:       gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=17334679580000

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+9b195c4f412ea5c4e56a@syzkaller.appspotmail.com

cxacru_cm: 3 callbacks suppressed
cxacru 5-1:1.0: send of cm 0x85 failed (-104)
Oops: general protection fault, probably for non-canonical address 0xdffffc0000000002: 0000 [#1] SMP KASAN NOPTI
KASAN: null-ptr-deref in range [0x0000000000000010-0x0000000000000017]
CPU: 0 UID: 0 PID: 6032 Comm: syz-executor219 Not tainted syzkaller #0 PREEMPT(full) 
Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.3-debian-1.16.3-2 04/01/2014
RIP: 0010:adsl_state_store.cold+0x5d/0x15d drivers/usb/atm/cxacru.c:359
Code: 48 89 fa 48 c1 ea 03 80 3c 02 00 74 05 e8 a3 89 27 01 48 8b 6d 78 b8 ff ff 37 00 48 c1 e0 2a 48 8d 7d 10 48 89 fa 48 c1 ea 03 <0f> b6 04 02 84 c0 74 08 3c 03 0f 8e d5 00 00 00 8b 75 10 89 da 48
RSP: 0018:ffffc900038e7bb0 EFLAGS: 00010202
RAX: dffffc0000000000 RBX: 00000000ffffff98 RCX: ffffffff87c43ce9
RDX: 0000000000000002 RSI: ffffffff8153789d RDI: 0000000000000010
RBP: 0000000000000000 R08: 0000000000000005 R09: 0000000000000000
R10: 00000000ffffff98 R11: ffffffff81d6107c R12: ffffc900038e7be8
R13: 0000000000000004 R14: ffff8880478ad800 R15: 1ffff9200071cf79
FS:  000055558821b400(0000) GS:ffff8880d5bde000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 0000560168e483b8 CR3: 00000000361a1000 CR4: 0000000000352ef0
Call Trace:
 <TASK>
 dev_attr_store+0x58/0x80 drivers/base/core.c:2505
 sysfs_kf_write+0xf2/0x150 fs/sysfs/file.c:145
 kernfs_fop_write_iter+0x3e0/0x5f0 fs/kernfs/file.c:345
 new_sync_write fs/read_write.c:595 [inline]
 vfs_write+0x6ac/0x1050 fs/read_write.c:687
 ksys_write+0x12a/0x250 fs/read_write.c:739
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0x115/0x870 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7ff46eca73de
Code: 08 0f 85 f5 e2 ff ff 49 89 fb 48 89 f0 48 89 d7 48 89 ce 4c 89 c2 4d 89 ca 4c 8b 44 24 08 4c 8b 4c 24 10 4c 89 5c 24 08 0f 05 <c3> 90 41 57 41 56 4d 89 c6 41 55 4d 89 cd 41 54 55 53 48 83 ec 08
RSP: 002b:00007fffbb5e0ef8 EFLAGS: 00000246 ORIG_RAX: 0000000000000001
RAX: ffffffffffffffda RBX: 000055558821b400 RCX: 00007ff46eca73de
RDX: 0000000000000004 RSI: 00007ff46ecf2074 RDI: 0000000000000005
RBP: 000055558821d890 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 00007ff46ecf4540
R13: 0000000000000000 R14: 0000000000000005 R15: 00007ff46ecf4590
 </TASK>
Modules linked in:
---[ end trace 0000000000000000 ]---
RIP: 0010:adsl_state_store.cold+0x5d/0x15d drivers/usb/atm/cxacru.c:359
Code: 48 89 fa 48 c1 ea 03 80 3c 02 00 74 05 e8 a3 89 27 01 48 8b 6d 78 b8 ff ff 37 00 48 c1 e0 2a 48 8d 7d 10 48 89 fa 48 c1 ea 03 <0f> b6 04 02 84 c0 74 08 3c 03 0f 8e d5 00 00 00 8b 75 10 89 da 48
RSP: 0018:ffffc900038e7bb0 EFLAGS: 00010202

RAX: dffffc0000000000 RBX: 00000000ffffff98 RCX: ffffffff87c43ce9
RDX: 0000000000000002 RSI: ffffffff8153789d RDI: 0000000000000010
RBP: 0000000000000000 R08: 0000000000000005 R09: 0000000000000000
R10: 00000000ffffff98 R11: ffffffff81d6107c R12: ffffc900038e7be8
R13: 0000000000000004 R14: ffff8880478ad800 R15: 1ffff9200071cf79
FS:  000055558821b400(0000) GS:ffff8880d5cde000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007fb3d476b0f5 CR3: 00000000361a1000 CR4: 0000000000352ef0
----------------
Code disassembly (best guess):
   0:	48 89 fa             	mov    %rdi,%rdx
   3:	48 c1 ea 03          	shr    $0x3,%rdx
   7:	80 3c 02 00          	cmpb   $0x0,(%rdx,%rax,1)
   b:	74 05                	je     0x12
   d:	e8 a3 89 27 01       	call   0x12789b5
  12:	48 8b 6d 78          	mov    0x78(%rbp),%rbp
  16:	b8 ff ff 37 00       	mov    $0x37ffff,%eax
  1b:	48 c1 e0 2a          	shl    $0x2a,%rax
  1f:	48 8d 7d 10          	lea    0x10(%rbp),%rdi
  23:	48 89 fa             	mov    %rdi,%rdx
  26:	48 c1 ea 03          	shr    $0x3,%rdx
* 2a:	0f b6 04 02          	movzbl (%rdx,%rax,1),%eax <-- trapping instruction
  2e:	84 c0                	test   %al,%al
  30:	74 08                	je     0x3a
  32:	3c 03                	cmp    $0x3,%al
  34:	0f 8e d5 00 00 00    	jle    0x10f
  3a:	8b 75 10             	mov    0x10(%rbp),%esi
  3d:	89 da                	mov    %ebx,%edx
  3f:	48                   	rex.W


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

Received: from mail-oa1-f77.google.com (mail-oa1-f77.google.com [209.85.160.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2911553E0B
	for <linux-usb@vger.kernel.org>; Fri, 31 Jul 2026 00:12:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.77
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785456745; cv=none; b=DyMsX56NqwwCaFESjNFHJhWLGYEfB+hIS7RLKkvNys1nIUZqnDDI7oPUBeirdn1MFL/x0qsRHB0lfYgIeZocRh07Wxbh3KB1SdjkFNWvFey2QeLE96XPVQrSHHqS0M5e24F4svHHdRssCI3jieIoCo2yqLD016uelfEjTVeoggc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785456745; c=relaxed/simple;
	bh=KDq/LQpEVS2BHdj/0mB3etabY03A+q0vpIqHg665zSY=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=j07sZifcCihbaktv8oLP5yDCCv5MnLpScjx4D7dEiabElgeTVop7YWjTYIHBb5WzG4NPPmc6Cm+RKFViXyRiBvquqf/AlXgGiYjQZU5UVDMfjtBTzWoRLGQ5NhY77K6wBOX19pVhz59WHeMJpcvTIJBNhqAV1n+7g0qg3O4MB4k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.160.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oa1-f77.google.com with SMTP id 586e51a60fabf-448d5182870so566749fac.1
        for <linux-usb@vger.kernel.org>; Thu, 30 Jul 2026 17:12:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785456743; x=1786061543;
        h=content-type:to:from:subject:message-id:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RDq6JYa2ofZsKzAfF3NcFAEtrlIkbZCnT/5jRnzQ/98=;
        b=aYsrjqE6SvTuTlJYx3zOJD+R1q4xLrS6lEzjQHINdsEryzMolz5c7Dx0BsNYSY0AJR
         rTa29Y5frG7szFwIxQ/Tw6V9RNslryFlhbKcp0+1G9APFib+v+cTG58tA3lLiqR+w5JV
         9zqg4K0AFtwbKx2C8TLwxFTC+17er1zjrBiA2D2BWF8/zrUhmMMHkxlzEoZIY9RKhwF3
         sPqDmQiJMh1++f5V5u+e7UhUtLauHuHravN17BBrSNEay3Lemrxvq6SfptLJDGgkMjZt
         5GkbrhO1/inK+njVwnchx4B9t1xXln57qn28x2kMeQkvHM3I+i4cmEO1UfTA5ovYPbeS
         PyAg==
X-Forwarded-Encrypted: i=1; AHgh+RplLNfU/ya1HCmtr5zOikpZH9jcGlcHDRDfJmfmioslHNxzoqg3uy3cMNmg8kIIxrvBn6BXZ3igB70=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+HduUFbgoMZWfglZpg3hlF6iOFa6lKCwTqrVgC2IZWm2pb6Xi
	f+40Wbya1wL5YPl1H3hSSgB83GgQCd7bwTqM+twxvTQI0zmPjewiCNN2PtGlyjsKYpAvxXIddVk
	WTP+zIiGoyBiYQrHlS1eDTe/yNo1lO78rmhX4gdiqWB0G4kqtFzeeXnjW1hs=
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:3089:b0:497:d0ea:7dad with SMTP id
 5614622812f47-4ad952c5da0mr2373910b6e.22.1785456743063; Thu, 30 Jul 2026
 17:12:23 -0700 (PDT)
Date: Thu, 30 Jul 2026 17:12:23 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6a6be867.77639fcc.3d4fd0.0015.GAE@google.com>
Subject: [syzbot] [usb?] WARNING in usbg_make_tpg
From: syzbot <syzbot+2f343b3fdaa0a1c5d9c8@syzkaller.appspotmail.com>
To: gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    11028ab62899 Merge tag 'probes-fixes-v7.2-rc5' of git://gi..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=1013b8c6580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=c05be6c9b0d36cb9
dashboard link: https://syzkaller.appspot.com/bug?extid=2f343b3fdaa0a1c5d9c8
compiler:       Debian clang version 22.1.8 (++20260613092233+e80beda6e255-1~exp1~20260613092250.77), Debian LLD 22.1.8

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image (non-bootable): https://storage.googleapis.com/syzbot-assets/d900f083ada3/non_bootable_disk-11028ab6.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/511647651d7f/vmlinux-11028ab6.xz
kernel image: https://storage.googleapis.com/syzbot-assets/1c76180d0109/bzImage-11028ab6.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+2f343b3fdaa0a1c5d9c8@syzkaller.appspotmail.com

------------[ cut here ]------------
DEBUG_LOCKS_WARN_ON(lock->magic != lock)
WARNING: kernel/locking/mutex.c:625 at __mutex_lock_common kernel/locking/mutex.c:625 [inline], CPU#0: syz.0.0/5324
WARNING: kernel/locking/mutex.c:625 at __mutex_lock+0x12d8/0x1550 kernel/locking/mutex.c:821, CPU#0: syz.0.0/5324
Modules linked in:
CPU: 0 UID: 0 PID: 5324 Comm: syz.0.0 Not tainted syzkaller #0 PREEMPT(full) 
Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.3-debian-1.16.3-2 04/01/2014
RIP: 0010:__mutex_lock_common kernel/locking/mutex.c:625 [inline]
RIP: 0010:__mutex_lock+0x12df/0x1550 kernel/locking/mutex.c:821
Code: ea 57 90 48 c1 e8 03 0f b6 04 18 84 c0 0f 85 47 02 00 00 83 3d a5 58 83 04 00 75 13 48 8d 3d 08 a8 86 04 48 c7 c6 40 f7 ec 8b <67> 48 0f b9 3a 90 e9 75 ee ff ff 90 0f 0b 90 e9 48 f2 ff ff 90 0f
RSP: 0018:ffffc9000dc97980 EFLAGS: 00010246
RAX: 0000000000000000 RBX: dffffc0000000000 RCX: 0000000000100000
RDX: ffffc90020001000 RSI: ffffffff8becf740 RDI: ffffffff905b39b0
RBP: ffffc9000dc97b10 R08: ffffffff9057ea43 R09: 1ffffffff20afd48
R10: dffffc0000000000 R11: fffffbfff20afd49 R12: ffff88803fd8e0b8
R13: 0000000000000000 R14: 1ffff92001b92f44 R15: 0000000000000000
FS:  00007f84c61dd6c0(0000) GS:ffff88808c543000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007f84c55f26b8 CR3: 000000001fa0b000 CR4: 0000000000352ef0
Call Trace:
 <TASK>
 usbg_make_tpg+0x147/0x590 drivers/usb/gadget/function/f_tcm.c:1678
 target_fabric_make_tpg+0xa8/0x6d0 drivers/target/target_core_fabric_configfs.c:939
 configfs_mkdir+0x4f6/0x9e0 fs/configfs/dir.c:1360
 vfs_mkdir+0x406/0x620 fs/namei.c:5276
 filename_mkdirat+0x285/0x510 fs/namei.c:5309
 __do_sys_mkdir fs/namei.c:5336 [inline]
 __se_sys_mkdir+0x34/0x150 fs/namei.c:5333
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0x174/0x580 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f84c539df99
Code: ff c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 44 00 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 e8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007f84c61dcfe8 EFLAGS: 00000246 ORIG_RAX: 0000000000000053
RAX: ffffffffffffffda RBX: 00007f84c5626090 RCX: 00007f84c539df99
RDX: 0000000000000000 RSI: 00000000000001ff RDI: 0000200000000600
RBP: 00007f84c5434ec4 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000000
R13: 00007f84c5626128 R14: 00007f84c5626090 R15: 00007ffe8ee4d1e8
 </TASK>
----------------
Code disassembly (best guess), 1 bytes skipped:
   0:	57                   	push   %rdi
   1:	90                   	nop
   2:	48 c1 e8 03          	shr    $0x3,%rax
   6:	0f b6 04 18          	movzbl (%rax,%rbx,1),%eax
   a:	84 c0                	test   %al,%al
   c:	0f 85 47 02 00 00    	jne    0x259
  12:	83 3d a5 58 83 04 00 	cmpl   $0x0,0x48358a5(%rip)        # 0x48358be
  19:	75 13                	jne    0x2e
  1b:	48 8d 3d 08 a8 86 04 	lea    0x486a808(%rip),%rdi        # 0x486a82a
  22:	48 c7 c6 40 f7 ec 8b 	mov    $0xffffffff8becf740,%rsi
* 29:	67 48 0f b9 3a       	ud1    (%edx),%rdi <-- trapping instruction
  2e:	90                   	nop
  2f:	e9 75 ee ff ff       	jmp    0xffffeea9
  34:	90                   	nop
  35:	0f 0b                	ud2
  37:	90                   	nop
  38:	e9 48 f2 ff ff       	jmp    0xfffff285
  3d:	90                   	nop
  3e:	0f                   	.byte 0xf


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

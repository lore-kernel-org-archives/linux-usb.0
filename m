Received: from mail-oi1-f206.google.com (mail-oi1-f206.google.com [209.85.167.206])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C619947AF5C
	for <linux-usb@vger.kernel.org>; Thu,  6 Aug 2026 15:27:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.206
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786030061; cv=none; b=KTAi3QM7FGC5ozMjYZY+mMnf7PWUO9pSxbhkrb6jYGl05yYNVotM/0myI393of+Q/ay+QyEG7esHTecROfD8VpmQ/Ss61OarFQcmWuNVvbs8NcOhAqSWppTPrYu7JUkJ+WaSSlXLOWPz31i9qRkVBZSvtz5B3w5QAhSj5qi6WJA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786030061; c=relaxed/simple;
	bh=T6EWmND9VBV/DEF3ElV3AvvOJ1/4nb6of/f1kNfnHcs=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=BaxLFwVctfregxWIh7xWkBs0MxVWaTxIbTXcSl/626G2+k95OZEH2lsGJsMAkY+HsldV7aLg364VQb6u6XFhffxahGuX8QFustW91pifG4U4e0KlNVqNPBX1Wp3o1OsF8kxWDBZRcey/R//zcdNlKQRJNvvstulICPvMjDfG84I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.206
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f206.google.com with SMTP id 5614622812f47-4ab4f78b9f4so2854994b6e.2
        for <linux-usb@vger.kernel.org>; Thu, 06 Aug 2026 08:27:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786030057; x=1786634857;
        h=content-type:to:from:subject:message-id:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Z1t2wgaOF3OaygCY77SWnGetQVPE83EEegnaU4h4YlY=;
        b=kLKm6nFGEfEtBBAI7EiIU4P7FsCWMZxfVplJUC7NtTcNL8qFweDaoVJpsFOphcAgvM
         9oOFi8mcwvkyXkQeGo5wXB57yrqP1BbeCDkrQZqpq8/pcgZomBb88YvsDGszUcHBYSdy
         S3XRHiyGhYcCnSc1bPh6mIKIst/HiMPsDDoY14B/1TCBF4Y9Wh7vny65Mnnbscfga6sp
         zigF8Z1hCmnw/XURfeGZF+KG8I44IOhT0WB+0VUN4jRWKh3Gx0Maq88oE0rANjW5+dgL
         5SQd9mQPUgus6mU2GU+nKyQZk5xmlPAo0VtIP8uxOyGLcpmYbG/09UoH7HwUjuMJpl6s
         iYjg==
X-Forwarded-Encrypted: i=1; AHgh+Ro6RWQ9XnWqmHZAeHf2yJ8iTXhBp5bIWJyD6eFXLnJIjJ1LjFK9LPXSTltdiw5j1XbAmekoOE2zm+w=@vger.kernel.org
X-Gm-Message-State: AOJu0YzaqObqb1zU0ugtamUSNBbja3tado9HIfLF17zy5NuDMGIRWan9
	T593DWaY+IyzWV6tBOtbKlI/1ivjvZXaak3Dejx89VL1ov7avC3+EiVV98unmJfTHMPMD2VhWyQ
	+a3t0dg2oJUAOGfgycrGU6Ngc6R/w1u7c07W9Y3rNQPB6J7+PTZIYmpiEYrg=
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:3108:b0:6ae:7e3d:b9c8 with SMTP id
 006d021491bc7-6b02124f177mr1299583eaf.9.1786030057617; Thu, 06 Aug 2026
 08:27:37 -0700 (PDT)
Date: Thu, 06 Aug 2026 08:27:37 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6a74a7e9.01d0871a.3a0d52.0022.GAE@google.com>
Subject: [syzbot] [usb?] INFO: trying to register non-static key in usbg_make_tpg
From: syzbot <syzbot+e55293acfa7cc1eb8fd4@syzkaller.appspotmail.com>
To: gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    848acc8ffe1b Merge tag 'fsverity-for-linus' of git://git.k..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=14c3be32580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=cb17729fb04b1e3a
dashboard link: https://syzkaller.appspot.com/bug?extid=e55293acfa7cc1eb8fd4
compiler:       Debian clang version 22.1.8 (++20260613092233+e80beda6e255-1~exp1~20260613092250.77), Debian LLD 22.1.8

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/375d27e96ecb/disk-848acc8f.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/4ba19a656b9d/vmlinux-848acc8f.xz
kernel image: https://storage.googleapis.com/syzbot-assets/7c2a17aaee7c/bzImage-848acc8f.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+e55293acfa7cc1eb8fd4@syzkaller.appspotmail.com

INFO: trying to register non-static key.
The code is fine but needs lockdep annotation, or maybe
you didn't initialize this object before use?
turning off the locking correctness validator.
CPU: 0 UID: 0 PID: 5961 Comm: syz.3.42 Not tainted syzkaller #0 PREEMPT_{RT,(full)} 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 07/24/2026
Call Trace:
 <TASK>
 dump_stack_lvl+0xe8/0x150 lib/dump_stack.c:120
 assign_lock_key+0x133/0x150 kernel/locking/lockdep.c:984
 register_lock_class+0xcc/0x2e0 kernel/locking/lockdep.c:1299
 __lock_acquire+0xab/0x2ce0 kernel/locking/lockdep.c:5112
 lock_acquire+0x106/0x350 kernel/locking/lockdep.c:5868
 __mutex_lock_common kernel/locking/rtmutex_api.c:559 [inline]
 mutex_lock_nested+0x5a/0x1d0 kernel/locking/rtmutex_api.c:578
 usbg_make_tpg+0x147/0x590 drivers/usb/gadget/function/f_tcm.c:1678
 target_fabric_make_tpg+0xa8/0x6d0 drivers/target/target_core_fabric_configfs.c:939
 configfs_mkdir+0x4f6/0x9e0 fs/configfs/dir.c:1360
 vfs_mkdir+0x402/0x620 fs/namei.c:5276
 filename_mkdirat+0x289/0x520 fs/namei.c:5309
 __do_sys_mkdirat fs/namei.c:5330 [inline]
 __se_sys_mkdirat+0x35/0x150 fs/namei.c:5327
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0x174/0x580 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f0ea03ae019
Code: ff c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 44 00 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 e8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007f0e9e5c4028 EFLAGS: 00000246 ORIG_RAX: 0000000000000102
RAX: ffffffffffffffda RBX: 00007f0ea0636180 RCX: 00007f0ea03ae019
RDX: 00000000000001ff RSI: 00002000000005c0 RDI: ffffffffffffff9c
RBP: 00007f0ea044500c R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000000
R13: 00007f0ea0636218 R14: 00007f0ea0636180 R15: 00007ffdd6e20e28
 </TASK>


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

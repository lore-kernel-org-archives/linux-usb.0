Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com [209.85.167.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1B2E3B1ED1
	for <linux-usb@vger.kernel.org>; Sun, 16 Aug 2026 14:28:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786890521; cv=none; b=KNAs0tlIXIbjSVem90XQDxHO4eSFh0dC+p4SZUwdEf3ZX+wB6ZheAVCcwoOw3n+IxLz7C2SYbSFBv6yG9FPj4dnLDCjvCi+BpXMUaVPxjphqFLpZiP4W9yV0oWI1aE0MEsKuVif3v/YxY0btdSqxK2ZsTB5r1V2rv8jjVSfQOCQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786890521; c=relaxed/simple;
	bh=j72RhOn3MeA/2xth6cJKgCVY+C9TFlSOv2KONdzDgr8=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=n4oH3KJAQm/Ll/dCvyfdi6FzxO600C87U3nERKfdGYKOWdEY8VOJQIKZa1/udGEzR6tTDa/2T1wTQQ2d3RQ+HcKlBwb5XIf9Rv8AlPqR/XFhFVxEzleNMQq8M85CToI2T5GmHJhEL6wek9CX0s/QWyInZuFKlDAajyuM7pRmLN8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f200.google.com with SMTP id 5614622812f47-49aa4525b82so3008242b6e.1
        for <linux-usb@vger.kernel.org>; Sun, 16 Aug 2026 07:28:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786890519; x=1787495319;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=X+onTZ/s8z07SkRFZkAk4ZLG5VDuk+A3dJWb+cL7bZY=;
        b=DcEiYnB+ZiYENqgrF51HW43k+m5DRK5kphOjxgjUduC7TZot5nVXtHY8MtwGJ59KqK
         SUZ0WUpyIk5fDNZoIwF3ChRDQnuwMRVMwL1nZx+wGCC5fVgDJeVHkx2UJCqpnfeUSbcE
         K1Fm15ohH3N4WZHenVABRzne+qemLWSTpeypawUMFRagObv+c5GI9+U+EyB0iwImwLsK
         yhianTJw4TAsYVqSxCBur4mgJ60W8Cf+85xdzhuoTZRQczO89PnRVZc+3TCRrKUnVIy/
         yHQwcWFHU/ilnVmEoQ48HRnKx4YSbiGTtYdRHcb6udQsV3MHKv6b5qUi9if9/HMZq9Iz
         E7PA==
X-Forwarded-Encrypted: i=1; AHgh+Rptgvf51NdPEegiShrf7vDcc/EgWSh85j/2vlH8A+VMUBavVxxTFr7YR2QkL0miXZMmANEH2RxjXf8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyn3vkUBXwgI06wXsQqOuxjGmCqoM1Djmd2iR+gx/8egZzzH572
	mqJLqSTDjrd7uinxD9J3Yxyre7puqJSTfCfHfSE3+qPtiIDvMO9RY8jEXVISR7W5pkzWUATRs1P
	aofcZxpPQkPCyLEn9Ic14P0yNy5xxNfoG5Jgh6fuvGsEscwLNcE9vAaOxWWE=
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:c183:b0:4b1:9f12:e2f6 with SMTP id
 5614622812f47-4b241f24ef7mr17954506b6e.19.1786890518918; Sun, 16 Aug 2026
 07:28:38 -0700 (PDT)
Date: Sun, 16 Aug 2026 07:28:38 -0700
In-Reply-To: <67710fe1.050a0220.226966.00be.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6a81c916.f7a79266.2f965f.0014.GAE@google.com>
Subject: Re: [syzbot] [usb?] [usb-storage?] WARNING in usb_stor_msg_common/usb_submit_urb
From: syzbot <syzbot+73c662df6e55838c6ac6@syzkaller.appspotmail.com>
To: gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org, stern@rowland.harvard.edu, 
	syzkaller-bugs@googlegroups.com, usb-storage@lists.one-eyed-alien.net
Content-Type: text/plain; charset="UTF-8"

syzbot has found a reproducer for the following issue on:

HEAD commit:    3eb40771c00a Merge tag 'soc-fixes-7.2-3' of git://git.kern..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=16c45a79580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=1d67342c314f228d
dashboard link: https://syzkaller.appspot.com/bug?extid=73c662df6e55838c6ac6
compiler:       gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=10489949580000

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+73c662df6e55838c6ac6@syzkaller.appspotmail.com

------------[ cut here ]------------
URB ffff8880225fbd00 submitted while active
WARNING: drivers/usb/core/urb.c:379 at usb_submit_urb+0x1689/0x19b0 drivers/usb/core/urb.c:379, CPU#2: usb-storage/6296
Modules linked in:
CPU: 2 UID: 0 PID: 6296 Comm: usb-storage Not tainted syzkaller #0 PREEMPT(full) 
Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.3-debian-1.16.3-2 04/01/2014
RIP: 0010:usb_submit_urb+0x168c/0x19b0 drivers/usb/core/urb.c:379
Code: 00 48 8b 04 24 48 8b 90 b0 00 00 00 e9 70 ff ff ff bb ed ff ff ff e9 ac f1 ff ff e8 7e 43 8b fa 48 8d 3d c7 22 d0 09 48 89 de <67> 48 0f b9 3a bb f0 ff ff ff e9 8e f1 ff ff c7 44 24 30 00 00 00
RSP: 0018:ffffc900032e76d8 EFLAGS: 00010293
RAX: 0000000000000000 RBX: ffff8880225fbd00 RCX: dffffc0000000000
RDX: ffff88802ac88000 RSI: ffff8880225fbd00 RDI: ffffffff914f52d0
RBP: 1ffff9200065ceee R08: 0000000000000002 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000000 R12: ffff888026bc4fc0
R13: ffff888026bc4f38 R14: ffffc900032e7790 R15: ffff8880225fbd00
FS:  0000000000000000(0000) GS:ffff8880d5dde000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 0000557553ca7660 CR3: 0000000013fa9000 CR4: 0000000000352ef0
Call Trace:
 <TASK>
 usb_stor_msg_common+0x241/0x560 drivers/usb/storage/transport.c:143
 usb_stor_bulk_transfer_buf+0x17c/0x420 drivers/usb/storage/transport.c:395
 ene_send_scsi_cmd+0x12b/0x610 drivers/usb/storage/ene_ub6250.c:502
 ene_init drivers/usb/storage/ene_ub6250.c:2196 [inline]
 ene_transport+0x2f00/0x3860 drivers/usb/storage/ene_ub6250.c:2310
 usb_stor_invoke_transport+0xe7/0x15c0 drivers/usb/storage/transport.c:611
 usb_stor_control_thread+0x5e4/0xae0 drivers/usb/storage/usb.c:462
 kthread+0x370/0x450 kernel/kthread.c:436
 ret_from_fork+0x72b/0xd50 arch/x86/kernel/process.c:158
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245
 </TASK>
----------------
Code disassembly (best guess):
   0:	00 48 8b             	add    %cl,-0x75(%rax)
   3:	04 24                	add    $0x24,%al
   5:	48 8b 90 b0 00 00 00 	mov    0xb0(%rax),%rdx
   c:	e9 70 ff ff ff       	jmp    0xffffff81
  11:	bb ed ff ff ff       	mov    $0xffffffed,%ebx
  16:	e9 ac f1 ff ff       	jmp    0xfffff1c7
  1b:	e8 7e 43 8b fa       	call   0xfa8b439e
  20:	48 8d 3d c7 22 d0 09 	lea    0x9d022c7(%rip),%rdi        # 0x9d022ee
  27:	48 89 de             	mov    %rbx,%rsi
* 2a:	67 48 0f b9 3a       	ud1    (%edx),%rdi <-- trapping instruction
  2f:	bb f0 ff ff ff       	mov    $0xfffffff0,%ebx
  34:	e9 8e f1 ff ff       	jmp    0xfffff1c7
  39:	c7                   	.byte 0xc7
  3a:	44 24 30             	rex.R and $0x30,%al
  3d:	00 00                	add    %al,(%rax)


---
If you want syzbot to run the reproducer, reply with:
#syz test: git://repo/address.git branch-or-commit-hash
If you attach or paste a git patch, syzbot will apply it before testing.

Received: from mail-ot1-f70.google.com (mail-ot1-f70.google.com [209.85.210.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 495CC3BF69E
	for <linux-usb@vger.kernel.org>; Wed, 26 Aug 2026 10:17:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787739460; cv=none; b=F3DEB2sJU1WqFbMMNC0s1pkhXD6aNVW44PyLbstwHkmKAzUEmrkGnNLfVxwFcHElgqSzcorqc1W2qyfipzp4Ggb6UF3ObEFrhLGLYAcyJulUUNgDN7YC87RtOZY9sxWxtXmbPngZr+xatt4a0kXPjDfVkaRQ/oj2myKn8E/U3O0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787739460; c=relaxed/simple;
	bh=b5/EL/mHtu3qeleMe299vNgnWOCw9nGEO9e9XGskR5I=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=kMgF/exLxAgwuk/IGswblSkJosy5ST0i+bCBBW5voxwzU712HmXYMrf3xbl5T9cogu0Vfgfl2T2U2FILn3F6I5bKdDlVFkpdm7rirm2bjCWxgQ94ORcnyMs0j+JvkCXPF0bMBx3VHdIjF66vv1so1UkA/pRK/yJn0TjSg0yX3/I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.210.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-ot1-f70.google.com with SMTP id 46e09a7af769-7eb89852728so687708a34.3
        for <linux-usb@vger.kernel.org>; Wed, 26 Aug 2026 03:17:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787739455; x=1788344255;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=gFqaRy4Bjk1vuPxqFZ3Gdbuj8Cb96oTFN9nMoCuyyNM=;
        b=KzTVHbQq1bUL0Tb7YbkS3Ukhu0gV7xDE/jRzgMZzfH9xrktu4fcxdiKRwfEdWkYlks
         Xj7pJuBYW+Mx7p7hn0lQURw25uojk6FPASpkQDg8j1VyhnCVap8NFXZSEx3pZzk3vjn5
         8xE8CjZ/ohiDc8yKkacpFMSehnqdRFfJiaCj0vaId0GM+u/a3do5mOWT/ZCU+5XZAE/Y
         udHGQlmPHpzdBsfRGTTaTsJvam2pxU3zkmZfjwfWhceFAKcUI/3W2xRM6pSgjeGVGI50
         UEGDYLIxLWzX57VNrJfEM4H55V/vG87xt31M8vuuJAD/pNDBIn/ePx076wL1YcnCk5GK
         DrLw==
X-Forwarded-Encrypted: i=1; AHgh+RqfM3MpzvfaPAN0ulSz3dBYaw7P1IxlSdtZBs2x4FlV6Vr7/vCnM+fCDu+9F2b7VPg/AH4xWq3oSDc=@vger.kernel.org
X-Gm-Message-State: AFuF++m9aQ5nXiDPdbyCaj0SSMzig7h0yIl4iWJVCUpKcAo1YsuHk+wP
	c6VF+AYDPhD6blQenkYlFA8kwpYLwHznEwPMWKw8qP1I+gyX4+z00K6VYSw3+Na8WI2WXl7tfMJ
	Ar8UnRyUG37t5mG9yXbMMb011S+LPIXNWCgBTZZdHdgN2yhWcSxyQKZ/3hXE=
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a4a:e84b:0:b0:6ae:8ee4:e01f with SMTP id
 006d021491bc7-6b1a036fadcmr4938203eaf.4.1787739454870; Wed, 26 Aug 2026
 03:17:34 -0700 (PDT)
Date: Wed, 26 Aug 2026 03:17:34 -0700
In-Reply-To: <6a8bd82a.dbb3a75c.13dd47.0061.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6a8ebd3e.1d9ded08.62e62.00a3.GAE@google.com>
Subject: Re: [syzbot] [usb-storage?] divide error in alauda_transport
From: syzbot <syzbot+dc208a8cf8d37cf3e5ac@syzkaller.appspotmail.com>
To: gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org, stern@rowland.harvard.edu, 
	syzkaller-bugs@googlegroups.com, usb-storage@lists.one-eyed-alien.net
Content-Type: text/plain; charset="UTF-8"

syzbot has found a reproducer for the following issue on:

HEAD commit:    818bebeb63dd drm/xe: Don't hand out the flat CCS storage a..
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
console output: https://syzkaller.appspot.com/x/log.txt?x=157ff979580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=ccca94d2c01b9e78
dashboard link: https://syzkaller.appspot.com/bug?extid=dc208a8cf8d37cf3e5ac
compiler:       gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=113d1625580000

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+dc208a8cf8d37cf3e5ac@syzkaller.appspotmail.com

Oops: divide error: 0000 [#1] SMP KASAN NOPTI
CPU: 1 UID: 0 PID: 6620 Comm: usb-storage Not tainted syzkaller #0 PREEMPT(full) 
Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.3-debian-1.16.3-2 04/01/2014
RIP: 0010:alauda_read_data drivers/usb/storage/alauda.c:953 [inline]
RIP: 0010:alauda_transport+0xe5a/0x35c0 drivers/usb/storage/alauda.c:1187
Code: 01 45 85 ed 0f 84 6d 1c 00 00 c7 04 24 00 00 00 00 8b 5c 24 20 e8 46 38 53 fa 31 d2 48 8b 7c 24 08 89 d8 89 5c 24 20 41 89 df <f7> 74 24 70 89 c3 89 54 24 10 89 de e8 05 c1 ff ff 44 0f b7 74 24
RSP: 0018:ffffc900044ff9d0 EFLAGS: 00010246
RAX: 0000000000000000 RBX: 0000000000000000 RCX: 0000000000000000
RDX: 0000000000000000 RSI: ffffffff87b7c98a RDI: ffff8880578f8e90
RBP: 0000000000000000 R08: 0000000000000005 R09: 0000000000000000
R10: 0000000000000001 R11: 0000000000000000 R12: 0000000000000001
R13: 0000000000000001 R14: 0000000000000000 R15: 0000000000000000
FS:  0000000000000000(0000) GS:ffff8880d5ca2000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007f741d1ca6e4 CR3: 0000000054fb4000 CR4: 0000000000352ef0
Call Trace:
 <TASK>
 usb_stor_invoke_transport+0xe7/0x15c0 drivers/usb/storage/transport.c:611
 usb_stor_control_thread+0x5e4/0xae0 drivers/usb/storage/usb.c:462
 kthread+0x373/0x450 kernel/kthread.c:436
 ret_from_fork+0x730/0xd60 arch/x86/kernel/process.c:158
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245
 </TASK>
Modules linked in:
---[ end trace 0000000000000000 ]---
RIP: 0010:alauda_read_data drivers/usb/storage/alauda.c:953 [inline]
RIP: 0010:alauda_transport+0xe5a/0x35c0 drivers/usb/storage/alauda.c:1187
Code: 01 45 85 ed 0f 84 6d 1c 00 00 c7 04 24 00 00 00 00 8b 5c 24 20 e8 46 38 53 fa 31 d2 48 8b 7c 24 08 89 d8 89 5c 24 20 41 89 df <f7> 74 24 70 89 c3 89 54 24 10 89 de e8 05 c1 ff ff 44 0f b7 74 24
RSP: 0018:ffffc900044ff9d0 EFLAGS: 00010246
RAX: 0000000000000000 RBX: 0000000000000000 RCX: 0000000000000000
RDX: 0000000000000000 RSI: ffffffff87b7c98a RDI: ffff8880578f8e90
RBP: 0000000000000000 R08: 0000000000000005 R09: 0000000000000000
R10: 0000000000000001 R11: 0000000000000000 R12: 0000000000000001
R13: 0000000000000001 R14: 0000000000000000 R15: 0000000000000000
FS:  0000000000000000(0000) GS:ffff8880d5ca2000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007f741d1ca6e4 CR3: 0000000054fb4000 CR4: 0000000000352ef0
----------------
Code disassembly (best guess):
   0:	01 45 85             	add    %eax,-0x7b(%rbp)
   3:	ed                   	in     (%dx),%eax
   4:	0f 84 6d 1c 00 00    	je     0x1c77
   a:	c7 04 24 00 00 00 00 	movl   $0x0,(%rsp)
  11:	8b 5c 24 20          	mov    0x20(%rsp),%ebx
  15:	e8 46 38 53 fa       	call   0xfa533860
  1a:	31 d2                	xor    %edx,%edx
  1c:	48 8b 7c 24 08       	mov    0x8(%rsp),%rdi
  21:	89 d8                	mov    %ebx,%eax
  23:	89 5c 24 20          	mov    %ebx,0x20(%rsp)
  27:	41 89 df             	mov    %ebx,%r15d
* 2a:	f7 74 24 70          	divl   0x70(%rsp) <-- trapping instruction
  2e:	89 c3                	mov    %eax,%ebx
  30:	89 54 24 10          	mov    %edx,0x10(%rsp)
  34:	89 de                	mov    %ebx,%esi
  36:	e8 05 c1 ff ff       	call   0xffffc140
  3b:	44                   	rex.R
  3c:	0f                   	.byte 0xf
  3d:	b7 74                	mov    $0x74,%bh
  3f:	24                   	.byte 0x24


---
If you want syzbot to run the reproducer, reply with:
#syz test: git://repo/address.git branch-or-commit-hash
If you attach or paste a git patch, syzbot will apply it before testing.

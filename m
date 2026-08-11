Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com [209.85.167.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E877432E93
	for <linux-usb@vger.kernel.org>; Tue, 11 Aug 2026 10:19:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786443585; cv=none; b=gzO+X3fbO9oX8S7bUHpebxJX+e7yvFD1gfrtMiWwx/rSWBw2r9M/sKOVr4sFX80gsNkbW+fBWvk0Azitmu24QDfdVmu5KMOSqQVOrdCGbhtxKvB7oCm71OqSms+KoB1AVqL35xZjxlT0HrZdoAjsEo4y8LLshwiqPLL2tnEjRp0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786443585; c=relaxed/simple;
	bh=s+vQTpgMPfFZNzcrlhf94If9JU9zfxJn7knX69cBwpA=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=ocvg8b91tv3YCcRWktzQdZr3Uu6MaeY7JqPezWj/5FAxx8wMr6lE8OjciwFXSSTN/es+kv8mV4T24fMLKZsSK//Uwlaq70XvvBKKUUeIIa8YCOTXOZKCri7tY1DESGjm2EqoyxbquJGUksBo3Jk8a/YVVcNx3eIzgn24oqeIZwQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f198.google.com with SMTP id 5614622812f47-4959c49e054so1349909b6e.3
        for <linux-usb@vger.kernel.org>; Tue, 11 Aug 2026 03:19:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786443567; x=1787048367;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=VYA258uA+eAatbOgpT1gCcJEyJG5lwfSmvj7tVbWtq0=;
        b=JQeNxH7x1HC6vl+VjgBMlYHK0c/mn3MkHrLXBpeq5eEqgZsp1iGz21w++oQWghj30x
         cUMn6FCSOMNcbyUl5mqqOYeSM99TYhhW9WPprHlXd1oD9Eqeguce+5/nA36urFds8PMY
         aQx5JvsBIx1C8lfKiw3ijnrp5vgID2ADKiO2Blwl0N2VNAsfJMpCNCzlXkcyi3Aairke
         u7bItSGawakdY54o5vaA21xPuzL5DR0Q4akXDOsSwUQK0j5UmRWiOnEJ3/v9GIeLt9Fw
         7VPYHo+jsF5ZUM5MvoG1J/bPp9batTu5nYT2exkGXocIMqiTssMWSdFlPNOIFEe15ShV
         AMGQ==
X-Forwarded-Encrypted: i=1; AHgh+RrVtu/K5qPIlrWxiGVcWJPbI30FmCH/L9ICTiyXoYb3+dhxGaKWNRo6+vIFCufvzYg8sSBoXP/ob10=@vger.kernel.org
X-Gm-Message-State: AOJu0YzybZcUnFsbgM2WSy98svefkvNaUZzJ3mqKOASkRnxHER+2ET1b
	sqIoTYraldl6iGwYsagE0yezIhS0amN7QW/Y7KXzpZlOW/CQGNj4SdLXFVPQqj46HrwGbRRI6Ss
	5a1tE1iWWrrXN3gCTyJ0UzyWXy0Okv8yWvRZrldbRiP0/oSgPwx8d/ZhG4co=
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:3081:b0:492:9e13:d5a7 with SMTP id
 5614622812f47-4b1fd7706c4mr1384875b6e.6.1786443567425; Tue, 11 Aug 2026
 03:19:27 -0700 (PDT)
Date: Tue, 11 Aug 2026 03:19:27 -0700
In-Reply-To: <6a7a6961.9c11d2ce.289b96.00f6.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6a7af72f.5aeeccc9.207e63.0014.GAE@google.com>
Subject: Re: [syzbot] [usb?] general protection fault in uvcg_video_enable
From: syzbot <syzbot+44835f0858f11e3e923c@syzkaller.appspotmail.com>
To: gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

syzbot has found a reproducer for the following issue on:

HEAD commit:    d58772d8520c Merge tag 'regmap-fix-v7.2-rc7' of git://git...
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=1434a879580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=d07fbc6821d72a61
dashboard link: https://syzkaller.appspot.com/bug?extid=44835f0858f11e3e923c
compiler:       gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=17d69879580000

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+44835f0858f11e3e923c@syzkaller.appspotmail.com

audit: backlog limit exceeded
configfs-gadget.g1 gadget.32: uvc: uvc_function_bind()
use of bytesused == 0 is deprecated and will be removed in the future,
use the actual size instead.
Oops: general protection fault, probably for non-canonical address 0xdffffc0000000000: 0000 [#1] SMP KASAN NOPTI
KASAN: null-ptr-deref in range [0x0000000000000000-0x0000000000000007]
CPU: 2 UID: 0 PID: 6048 Comm: syz-executor268 Not tainted syzkaller #0 PREEMPT(full) 
Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.3-debian-1.16.3-2 04/01/2014
RIP: 0010:usb_endpoint_xfer_isoc include/uapi/linux/usb/ch9.h:571 [inline]
RIP: 0010:uvc_video_prep_requests drivers/usb/gadget/function/uvc_video.c:508 [inline]
RIP: 0010:uvc_video_alloc_requests drivers/usb/gadget/function/uvc_video.c:559 [inline]
RIP: 0010:uvcg_video_enable+0x12d/0xf80 drivers/usb/gadget/function/uvc_video.c:784
Code: 48 89 fa 48 c1 ea 03 80 3c 02 00 0f 85 b7 0d 00 00 48 b8 00 00 00 00 00 fc ff df 48 8b 6b 18 48 8d 7d 03 48 89 fa 48 c1 ea 03 <0f> b6 04 02 48 89 fa 83 e2 07 38 d0 7f 08 84 c0 0f 85 e5 0d 00 00
RSP: 0018:ffffc900033a7b58 EFLAGS: 00010246
RAX: dffffc0000000000 RBX: ffff88802e74c100 RCX: ffffffff87e608b8
RDX: 0000000000000000 RSI: ffffffff87e608c5 RDI: 0000000000000003
RBP: 0000000000000000 R08: 0000000000000005 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000000 R12: 0000000000000002
R13: 0000000000000000 R14: ffff88802c31e8f0 R15: ffff88802c31e840
FS:  000055555baac400(0000) GS:ffff8880d5dd7000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 000055555bab0000 CR3: 000000003df62000 CR4: 0000000000352ef0
Call Trace:
 <TASK>
 uvc_v4l2_streamon+0x9f/0x130 drivers/usb/gadget/function/uvc_v4l2.c:531
 __video_do_ioctl+0xb2a/0xdf0 drivers/media/v4l2-core/v4l2-ioctl.c:3133
 video_usercopy+0x47a/0x1730 drivers/media/v4l2-core/v4l2-ioctl.c:3475
 v4l2_ioctl+0x1bd/0x250 drivers/media/v4l2-core/v4l2-dev.c:366
 vfs_ioctl fs/ioctl.c:51 [inline]
 __do_sys_ioctl fs/ioctl.c:597 [inline]
 __se_sys_ioctl fs/ioctl.c:583 [inline]
 __x64_sys_ioctl+0x18e/0x210 fs/ioctl.c:583
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0x115/0x870 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7fc0f28ab40b
Code: 00 48 89 44 24 18 31 c0 48 8d 44 24 60 c7 04 24 10 00 00 00 48 89 44 24 08 48 8d 44 24 20 48 89 44 24 10 b8 10 00 00 00 0f 05 <89> c2 3d 00 f0 ff ff 77 1c 48 8b 44 24 18 64 48 2b 04 25 28 00 00
RSP: 002b:00007fffe9a50160 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
RAX: ffffffffffffffda RBX: 00007fffe9a501e8 RCX: 00007fc0f28ab40b
RDX: 00007fffe9a501e0 RSI: 0000000040045612 RDI: 0000000000000003
RBP: 0000000000000002 R08: 0000000000000003 R09: 0000000000008000
R10: 0000000000000001 R11: 0000000000000246 R12: 0000000000000003
R13: 00007fffe9a501e0 R14: 00000000c0585609 R15: 00000000c058560f
 </TASK>
Modules linked in:
---[ end trace 0000000000000000 ]---
RIP: 0010:usb_endpoint_xfer_isoc include/uapi/linux/usb/ch9.h:571 [inline]
RIP: 0010:uvc_video_prep_requests drivers/usb/gadget/function/uvc_video.c:508 [inline]
RIP: 0010:uvc_video_alloc_requests drivers/usb/gadget/function/uvc_video.c:559 [inline]
RIP: 0010:uvcg_video_enable+0x12d/0xf80 drivers/usb/gadget/function/uvc_video.c:784
Code: 48 89 fa 48 c1 ea 03 80 3c 02 00 0f 85 b7 0d 00 00 48 b8 00 00 00 00 00 fc ff df 48 8b 6b 18 48 8d 7d 03 48 89 fa 48 c1 ea 03 <0f> b6 04 02 48 89 fa 83 e2 07 38 d0 7f 08 84 c0 0f 85 e5 0d 00 00
RSP: 0018:ffffc900033a7b58 EFLAGS: 00010246
RAX: dffffc0000000000 RBX: ffff88802e74c100 RCX: ffffffff87e608b8
RDX: 0000000000000000 RSI: ffffffff87e608c5 RDI: 0000000000000003
RBP: 0000000000000000 R08: 0000000000000005 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000000 R12: 0000000000000002
R13: 0000000000000000 R14: ffff88802c31e8f0 R15: ffff88802c31e840
FS:  000055555baac400(0000) GS:ffff8880d5cd7000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 000055703341ef30 CR3: 000000003df62000 CR4: 0000000000352ef0
----------------
Code disassembly (best guess):
   0:	48 89 fa             	mov    %rdi,%rdx
   3:	48 c1 ea 03          	shr    $0x3,%rdx
   7:	80 3c 02 00          	cmpb   $0x0,(%rdx,%rax,1)
   b:	0f 85 b7 0d 00 00    	jne    0xdc8
  11:	48 b8 00 00 00 00 00 	movabs $0xdffffc0000000000,%rax
  18:	fc ff df
  1b:	48 8b 6b 18          	mov    0x18(%rbx),%rbp
  1f:	48 8d 7d 03          	lea    0x3(%rbp),%rdi
  23:	48 89 fa             	mov    %rdi,%rdx
  26:	48 c1 ea 03          	shr    $0x3,%rdx
* 2a:	0f b6 04 02          	movzbl (%rdx,%rax,1),%eax <-- trapping instruction
  2e:	48 89 fa             	mov    %rdi,%rdx
  31:	83 e2 07             	and    $0x7,%edx
  34:	38 d0                	cmp    %dl,%al
  36:	7f 08                	jg     0x40
  38:	84 c0                	test   %al,%al
  3a:	0f 85 e5 0d 00 00    	jne    0xe25


---
If you want syzbot to run the reproducer, reply with:
#syz test: git://repo/address.git branch-or-commit-hash
If you attach or paste a git patch, syzbot will apply it before testing.

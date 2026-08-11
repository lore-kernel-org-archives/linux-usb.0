Received: from mail-oo1-f77.google.com (mail-oo1-f77.google.com [209.85.161.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A75613B5B3
	for <linux-usb@vger.kernel.org>; Tue, 11 Aug 2026 00:14:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.77
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786407268; cv=none; b=ZrU5zd9I0ZxF27UIzKdfbo16tRoXIeQBE2V4H63kn7IMVAV5EAr3bfYL2BXkyJC5aZw9DwCYzmBW44onm58DIAmzH6cYY+bbEhZrcs8tPqUOK8XHOvK9gT6Vr6ZuMLPUDjwyi5O7xtfYvkidMafAbFFsT+wtVrwBFc9510z2ZZc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786407268; c=relaxed/simple;
	bh=NopSSdSXacMyH9L8Usk5wxf52ocpgUzK5xfgaKEUW7c=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=d6AYw1O0+U59YQy7FI5iTbuGTvq1LePDMMxRz/EBBSTqJWYXEu2z5zmnxwqRNyRVbr7VeyvykwtEQJZUdFxwP1qKz36xcvjWKzt9RdXAGCJNH0PfKTF558upzTpU1LusXaMFFGwNGkQvYJlmy8drEr3sC0BXUgLZ5lqPfcYSwcM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.161.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oo1-f77.google.com with SMTP id 006d021491bc7-6acbcb92d31so1770517eaf.1
        for <linux-usb@vger.kernel.org>; Mon, 10 Aug 2026 17:14:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786407265; x=1787012065;
        h=content-type:to:from:subject:message-id:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sKwXcj10/YHs7Im7lfwUAw1ogq2xnSHa3UhD2m9sl/A=;
        b=fXIqcFm/LpKvinDMTMKH1B+h8y6Oq3J1lQbIpI/+nhloSPhKOFfjLcUsmURdBmUROA
         FZED4GGp//h8FI96SDTCvzdueoaWUlQvPLaAysg0FNa2dRkjXoZi7+RQRImJkmC2NRbO
         +SwGNBOfDnjsmkgFd1ijOAjrTPW00BikuL+923o/114aNj21X/EK8hPF176cXCSf8t1Q
         a6Ci+DS4Y+4lZsArLcXv7VKCEBW6bPU22beNPR040Y/bbWo7K7G55vOi8iQNk9zkJu06
         /Se5vmXTNLnJNrmq5fREpDfM77O+0+T13P+9pQ0kdRcGsOAZNb6N2QHQm6b+84h1g5u7
         ucyw==
X-Forwarded-Encrypted: i=1; AHgh+Rr32+VtT1qfXHYmEb1+ciBHVjqYpo1kPu/Z28nsc2BzF5c5utgG8ckWKUYn7RVbwAMyJ07u24dV7ms=@vger.kernel.org
X-Gm-Message-State: AOJu0YynPjBv73HH9VTE1dQUo3EheJcQMzCC6o2v5j7od3pSJbu5LyV+
	EHpnDCGN/0fXTuEyRAAfGs3f4OA8JifGDO4mvt+w6l9NDC1Cr8QMlCvAeLwHUkAGOHHf8oj8DH5
	/5xvB1iVy0xN/L9/OHFcl2hH37hwxWRpoNg0TnoRQAEm2lA8oCcNyiUf0CmM=
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:8c9:b0:6ae:410f:c745 with SMTP id
 006d021491bc7-6b0421754femr12888028eaf.30.1786407265526; Mon, 10 Aug 2026
 17:14:25 -0700 (PDT)
Date: Mon, 10 Aug 2026 17:14:25 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6a7a6961.9c11d2ce.289b96.00f6.GAE@google.com>
Subject: [syzbot] [usb?] general protection fault in uvcg_video_enable
From: syzbot <syzbot+44835f0858f11e3e923c@syzkaller.appspotmail.com>
To: gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    562bfb501c54 Merge tag 'integrity-v7.2-rc7' of git://git.k..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=14467649580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=145fa60d73086782
dashboard link: https://syzkaller.appspot.com/bug?extid=44835f0858f11e3e923c
compiler:       gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image (non-bootable): https://storage.googleapis.com/syzbot-assets/d900f083ada3/non_bootable_disk-562bfb50.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/9cbf6ef0490e/vmlinux-562bfb50.xz
kernel image: https://storage.googleapis.com/syzbot-assets/7ee52864c79a/bzImage-562bfb50.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+44835f0858f11e3e923c@syzkaller.appspotmail.com

Oops: general protection fault, probably for non-canonical address 0xdffffc0000000000: 0000 [#1] SMP KASAN NOPTI
KASAN: null-ptr-deref in range [0x0000000000000000-0x0000000000000007]
CPU: 3 UID: 0 PID: 28280 Comm: syz.9.8123 Tainted: G             L      syzkaller #0 PREEMPT(full) 
Tainted: [L]=SOFTLOCKUP
Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.3-debian-1.16.3-2 04/01/2014
RIP: 0010:usb_endpoint_xfer_isoc include/uapi/linux/usb/ch9.h:571 [inline]
RIP: 0010:uvc_video_prep_requests drivers/usb/gadget/function/uvc_video.c:508 [inline]
RIP: 0010:uvc_video_alloc_requests drivers/usb/gadget/function/uvc_video.c:559 [inline]
RIP: 0010:uvcg_video_enable+0x12d/0xf80 drivers/usb/gadget/function/uvc_video.c:784
Code: 48 89 fa 48 c1 ea 03 80 3c 02 00 0f 85 b7 0d 00 00 48 b8 00 00 00 00 00 fc ff df 48 8b 6b 18 48 8d 7d 03 48 89 fa 48 c1 ea 03 <0f> b6 04 02 48 89 fa 83 e2 07 38 d0 7f 08 84 c0 0f 85 e5 0d 00 00
RSP: 0018:ffffc900049bfb58 EFLAGS: 00010246
RAX: dffffc0000000000 RBX: ffff88802e370100 RCX: ffffc900269c2000
RDX: 0000000000000000 RSI: ffffffff87e536f5 RDI: 0000000000000003
RBP: 0000000000000000 R08: 0000000000000005 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000000 R12: 0000000000000002
R13: 0000000000000000 R14: ffff888038c6a8f0 R15: ffff888038c6a840
FS:  00007f57b8fed6c0(0000) GS:ffff8880d60d8000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007f57b8187640 CR3: 0000000057c2a000 CR4: 0000000000352ef0
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
RIP: 0033:0x7f57b819e019
Code: ff c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 44 00 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 e8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007f57b8fed028 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
RAX: ffffffffffffffda RBX: 00007f57b8425fa0 RCX: 00007f57b819e019
RDX: 0000200000000080 RSI: 0000000040045612 RDI: 0000000000000003
RBP: 00007f57b823500c R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000000
R13: 00007f57b8426038 R14: 00007f57b8425fa0 R15: 00007ffc338da308
 </TASK>
Modules linked in:
---[ end trace 0000000000000000 ]---
RIP: 0010:usb_endpoint_xfer_isoc include/uapi/linux/usb/ch9.h:571 [inline]
RIP: 0010:uvc_video_prep_requests drivers/usb/gadget/function/uvc_video.c:508 [inline]
RIP: 0010:uvc_video_alloc_requests drivers/usb/gadget/function/uvc_video.c:559 [inline]
RIP: 0010:uvcg_video_enable+0x12d/0xf80 drivers/usb/gadget/function/uvc_video.c:784
Code: 48 89 fa 48 c1 ea 03 80 3c 02 00 0f 85 b7 0d 00 00 48 b8 00 00 00 00 00 fc ff df 48 8b 6b 18 48 8d 7d 03 48 89 fa 48 c1 ea 03 <0f> b6 04 02 48 89 fa 83 e2 07 38 d0 7f 08 84 c0 0f 85 e5 0d 00 00
RSP: 0018:ffffc900049bfb58 EFLAGS: 00010246
RAX: dffffc0000000000 RBX: ffff88802e370100 RCX: ffffc900269c2000
RDX: 0000000000000000 RSI: ffffffff87e536f5 RDI: 0000000000000003
RBP: 0000000000000000 R08: 0000000000000005 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000000 R12: 0000000000000002
R13: 0000000000000000 R14: ffff888038c6a8f0 R15: ffff888038c6a840
FS:  00007f57b8fed6c0(0000) GS:ffff8880d5fd8000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007f57b81eb700 CR3: 0000000057c2a000 CR4: 0000000000352ef0
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

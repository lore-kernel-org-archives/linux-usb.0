Received: from mail-oo1-f45.google.com (mail-oo1-f45.google.com [209.85.161.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20476424D58
	for <linux-usb@vger.kernel.org>; Mon,  7 Sep 2026 09:32:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.161.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788773526; cv=pass; b=AmAjSytcQ5fPaYZNXbQnos9U1g5h6bql75COU/TOoBc8/5gnxutdEEisptqFnzooUizsQ7dCMgwfUfRH9ndisTjVcU8/zYkYDbbz1CzxpcX6PoXWZ5miDFAw/HnSEychvI7Oup6Wqtk20jbHG2dnAZbuoMqS5NLqshPMhbnG7So=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788773526; c=relaxed/simple;
	bh=v9I5r1JUhE+zLYACJbml7p6rzWAbiD1yZbROLmPgMtc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DlzIbaQG/bCcgCmf9xcqogP8YmiZ45pwrrNw1cUTC7rpPY0WRRvhMgtjUvRW/SLqqCgPMkXmAQHeMZBXsIBfvCttMtt8P8tOqnj02QleICGaDxAu4SWjp4/rNDDdYAuaJSeUJc+F3vq2PcACiBtAf827asji7bn50RTuXUfXiuc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=va0JYC2e; arc=pass smtp.client-ip=209.85.161.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="va0JYC2e"
Received: by mail-oo1-f45.google.com with SMTP id 006d021491bc7-6b1497f0453so2488118eaf.3
        for <linux-usb@vger.kernel.org>; Mon, 07 Sep 2026 02:32:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788773524; cv=none;
        d=google.com; s=arc-20260327;
        b=Lo+4LzC9E369TVaxgywc9LfcQUtM1Ws+6qgxJqYpAOifCxcRpZ0YDrOFI/wCLzAq+k
         11DQScYBF45xzPrYKQKMLhfmtV46Iqh7qt7MFvmbMkWFLNjvkV2GentZoCFyTghgqgv1
         0mnndflve4A4vsrWmAqR0jjISSqHUKk+7ZWlNb/yT3yAljmFWhzesq3ud4vhgy+JfTPy
         AlhJ2h8v/ZYtGk4Q31djrVsXufpOlnD76ocGSJRT83SCG7fcllxjrl2kw+vw0cC6CAj0
         QZdG1wE8wK4sK6cgV/s3R8dBBFxDvhj0wZdncUH7rHe3Djm8KDgY4Q72khJ8Yq8UzgeE
         VKJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=d+4ALPI3dZvmLR4k43Y5R+49LnwK51lTHoswuYvlvrA=;
        fh=GobfTOwm6PT6Def199rsByW8K8OMQ51tdZigIOteUWM=;
        b=LLkgQRGgOKSD1JvMqamzwKhaTFBGHwdMa9pSeJP3V6REaG5KDPYkYgwyGJs8nqAUH8
         76gQchSrDjzU0AhkShuhM8wHxaWaG6jBoeB3PiPpxAKcsRKrtTVmj3v8zEsRQM6iyKRV
         MGHz780ZT+OL5O3uZC4oZ6HvLyql9Yf+7ARiUHmBhsvmGRpZEIbmY60Wy0BD8rOM2dqd
         nm5SDsH+hMVeuuCZCsCSwwoqRL6XMHR01rknggn5At3RAqv4zXVYs/cITi6m+mP0z9j8
         G3W0sn1ZJ0oAldQ1ySqOZ8ljDFGzXgkbjnve690dTjeh1RjakDDSL7DCF6kIvNtHVakJ
         IGJg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788773524; x=1789378324; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=d+4ALPI3dZvmLR4k43Y5R+49LnwK51lTHoswuYvlvrA=;
        b=va0JYC2eDkyB6Ahd51fSHajlODkHU/AQZX1ePxl1pxgtUEJgOk6CIVvDdi/yysYQ7q
         hnVF8HWk0XV+js6k3g619PXwy1IoY3Wu8XMHkdjw/DGy0py+9CM16w+P1VSQ30Xk7s0X
         R5k4cngWEr/4r2RzT5mpS1Dsm9FdY49kLCyBMnZZbSx3wW5sVUsoXQZOYYFhWuFAZz88
         7TIAqvEKP56bj22Q8mFgO8DHpJp8EZ9GEgsCTvBcYns5TJaC7jf/k1Z0rj31RvVtfdh0
         RVYQ5sHUyWomtXdhs/cUEhRABlaRw/MEYui/BxNnMk2DgOOgius5+us/gTX6BFmT10bR
         Hg4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788773524; x=1789378324;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=d+4ALPI3dZvmLR4k43Y5R+49LnwK51lTHoswuYvlvrA=;
        b=PwBz/f5GhnYSOeZDPlJ7oIrm56q4zSAZwu1zmILjxXSOAxDfUKJfTHy4GqtgzlBJtx
         R2OJOveLCU+epIYajuiFrG9mTYsz5CX391rXxKG9ot4iA2MNvtSVddkXO6SLEVlq+54T
         4DWuSts3naviX6COBs9PegpveuCAEr17NxlkHvr0SVFbEIFN+QEXqAVYdkUY2SuSLKau
         k4fIXuXyn06Ej4ndcHIOFgamOOSK0LJck9jcnLynG2Hwzf9ojzfCMO1ieJp+JB2xUjaR
         eRjQvLGrm78CKv5+JKw/y2j66ouluqfz7mY51LTgH08iHnGERivu46Gew5HoilDYZBLB
         +PTQ==
X-Forwarded-Encrypted: i=1; AKwUvBx4s2V01KHYqIZQ93A8t6paMn6WFqHNTk6sNhlUyd8xi5k4MfLBITDlVhasictNQJ5IrpTj6eErj6U=@vger.kernel.org
X-Gm-Message-State: AFuF++m3eb8yJmhKi1dXZXZ71yvXjLtHfw+zmswHHJFi39uz/O6znpBz
	Ddta3WI4W8Fsem+eeQv7CmI+2lO1hAKLucJcn6k0E/Tu4QY1oss1nsJjTyC3pLwaz3NA1Z3JD4D
	dDV7XtU3J4UjuHfvGdo7sX7XRSaiZSONeWG7A2XTiByYKsVA/XSJkOqrM21o=
X-Gm-Gg: AYBFou29JRTeh5KHY76f5cditzP5O6cuoxImtBwYB7V4W76OU7CoslTUKFp6sW4OLma
	HbNEKAD3zNrOJzX9TArqCqo6sEjo0BIdraEaCoj8QA4P5EO4Zjt0DnLOuzpgRoJvPuazqGeFO1s
	bi0MUc/l/FwH0TsfmolDVgpnW063TYttxrUgR64kZVSJF7jmeF6Hjz+LW5YTWM7YheZ6JER6pp7
	EXg6wGVY/HkcaDAwNl34NfHAllLuXZiSZKlFciEGElzff7SaU2JL0YGPZ+LoqTtRnq5iaDG5B7Y
	uO289xg7ETdfEw0TcZBkTgKe7g38oi1Gmlzln6oX4r+xvAhBKdysBwX/qa/LJeLpHvAcE0QMah3
	FTauXNgVpq9vpr/ZXgOqu6UPIVfnUNtqt0VeVS7grMd1H820uYUDfT0AHm13U+rnTCZX47mnMRy
	KBOEn5VRVLxDL9
X-Received: by 2002:a05:6820:6ac3:b0:6a3:c6f8:4caa with SMTP id
 006d021491bc7-6b6fa5e80f5mr13924837eaf.2.1788773523433; Mon, 07 Sep 2026
 02:32:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <6a8818d8.ae6ddae5.3da009.0030.GAE@google.com>
In-Reply-To: <6a8818d8.ae6ddae5.3da009.0030.GAE@google.com>
From: Aleksandr Nogikh <nogikh@google.com>
Date: Mon, 7 Sep 2026 11:31:51 +0200
X-Gm-Features: AcwNN1WalyxdtxU8WUJkBGh9rNmHmOVy00uAqjZDoZ0EibkWoWclmqubwefGIrw
Message-ID: <CANp29Y6sk+JYQXFJpuefjXL9W6h9s2rtBd035+JDO_WBJQZuOQ@mail.gmail.com>
Subject: Re: [syzbot] [usb?] general protection fault in ucsi_acpi_probe
To: syzbot <syzbot+23cf45a9fce78e4e0dc1@syzkaller.appspotmail.com>
Cc: linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

#syz invalid

See the discussion at
https://lore.kernel.org/all/6a88012e.dbb3a75c.13dd47.0007.GAE@google.com/T/

On Fri, Aug 21, 2026 at 11:22=E2=80=AFAM syzbot
<syzbot+23cf45a9fce78e4e0dc1@syzkaller.appspotmail.com> wrote:
>
> Hello,
>
> syzbot found the following issue on:
>
> HEAD commit:    4477a78374a5 Add linux-next specific files for 20260814
> git tree:       linux-next
> console output: https://syzkaller.appspot.com/x/log.txt?x=3D114036c658000=
0
> kernel config:  https://syzkaller.appspot.com/x/.config?x=3D9b32a36dd637b=
06f
> dashboard link: https://syzkaller.appspot.com/bug?extid=3D23cf45a9fce78e4=
e0dc1
> compiler:       Debian clang version 22.1.8 (++20260613092233+e80beda6e25=
5-1~exp1~20260613092250.77), Debian LLD 22.1.8
> syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=3D13c60679580=
000
>
> Downloadable assets:
> disk image: https://storage.googleapis.com/syzbot-assets/994c1c8c560e/dis=
k-4477a783.raw.xz
> vmlinux: https://storage.googleapis.com/syzbot-assets/cd54543d69ae/vmlinu=
x-4477a783.xz
> kernel image: https://storage.googleapis.com/syzbot-assets/407cdf8f3fc2/b=
zImage-4477a783.xz
>
> IMPORTANT: if you fix the issue, please add the following tag to the comm=
it:
> Reported-by: syzbot+23cf45a9fce78e4e0dc1@syzkaller.appspotmail.com
>
> Oops: general protection fault, probably for non-canonical address 0xdfff=
fc00000000e5: 0000 [#1] SMP KASAN PTI
> KASAN: null-ptr-deref in range [0x0000000000000728-0x000000000000072f]
> CPU: 1 UID: 0 PID: 5814 Comm: syz.0.17 Not tainted syzkaller #0 PREEMPT(f=
ull)
> Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS G=
oogle 07/24/2026
> RIP: 0010:ucsi_acpi_probe+0x6c/0x4b0 drivers/usb/typec/ucsi/ucsi_acpi.c:1=
99
> Code: 89 74 24 08 4c 8b 23 4c 89 e7 e8 ef df 54 fd 49 83 c4 f0 45 31 f6 8=
4 c0 4d 0f 45 f4 49 81 c6 2c 07 00 00 4c 89 f0 48 c1 e8 03 <42> 0f b6 04 28=
 84 c0 0f 85 16 04 00 00 41 8b 2e 31 ff 89 ee e8 cb
> RSP: 0018:ffffc9000272fab8 EFLAGS: 00010203
> RAX: 00000000000000e5 RBX: ffff88801db68430 RCX: ffff88807f249f40
> RDX: 0000000000000000 RSI: 0000000000000000 RDI: 0000000000000000
> RBP: 0000000000000000 R08: ffff88802b52e5a3 R09: 1ffff110056a5cb4
> R10: dffffc0000000000 R11: ffffffff87e620e0 R12: fffffffffffffff0
> R13: dffffc0000000000 R14: 000000000000072c R15: 1ffff11003b6d086
> FS:  000055555ee6f500(0000) GS:ffff888124df8000(0000) knlGS:0000000000000=
000
> CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> CR2: 00007fb722c70000 CR3: 0000000075912000 CR4: 00000000003526f0
> Call Trace:
>  <TASK>
>  platform_probe+0xf9/0x190 drivers/base/platform.c:1507
>  call_driver_probe drivers/base/dd.c:-1 [inline]
>  really_probe+0x254/0xae0 drivers/base/dd.c:706
>  __driver_probe_device+0x1e8/0x360 drivers/base/dd.c:868
>  device_driver_attach+0xe0/0x1d0 drivers/base/dd.c:1203
>  bind_store+0x1d0/0x220 drivers/base/bus.c:267
>  kernfs_fop_write_iter+0x3a4/0x540 fs/kernfs/file.c:345
>  new_sync_write fs/read_write.c:595 [inline]
>  vfs_write+0x612/0xba0 fs/read_write.c:687
>  ksys_write+0x150/0x270 fs/read_write.c:739
>  do_syscall_x64 arch/x86/entry/syscall_64.c:61 [inline]
>  do_syscall_64+0x166/0x520 arch/x86/entry/syscall_64.c:84
>  entry_SYSCALL_64_after_hwframe+0x77/0x7f
> RIP: 0033:0x7fb722d9e0d9
> Code: ff c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 44 00 00 48 89 f8 48 89 f=
7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff=
 ff 73 01 c3 48 c7 c1 e8 ff ff ff f7 d8 64 89 01 48
> RSP: 002b:00007fff7bf8acb8 EFLAGS: 00000246 ORIG_RAX: 0000000000000001
> RAX: ffffffffffffffda RBX: 00007fb723025fa0 RCX: 00007fb722d9e0d9
> RDX: 0000000000000007 RSI: 0000200000000180 RDI: 0000000000000004
> RBP: 00007fb722e35024 R08: 0000000000000000 R09: 0000000000000000
> R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000000
> R13: 00007fb723025fac R14: 00007fb723025fa0 R15: 00007fb723025fa0
>  </TASK>
> Modules linked in:
> ---[ end trace 0000000000000000 ]---
> RIP: 0010:ucsi_acpi_probe+0x6c/0x4b0 drivers/usb/typec/ucsi/ucsi_acpi.c:1=
99
> Code: 89 74 24 08 4c 8b 23 4c 89 e7 e8 ef df 54 fd 49 83 c4 f0 45 31 f6 8=
4 c0 4d 0f 45 f4 49 81 c6 2c 07 00 00 4c 89 f0 48 c1 e8 03 <42> 0f b6 04 28=
 84 c0 0f 85 16 04 00 00 41 8b 2e 31 ff 89 ee e8 cb
> RSP: 0018:ffffc9000272fab8 EFLAGS: 00010203
> RAX: 00000000000000e5 RBX: ffff88801db68430 RCX: ffff88807f249f40
> RDX: 0000000000000000 RSI: 0000000000000000 RDI: 0000000000000000
> RBP: 0000000000000000 R08: ffff88802b52e5a3 R09: 1ffff110056a5cb4
> R10: dffffc0000000000 R11: ffffffff87e620e0 R12: fffffffffffffff0
> R13: dffffc0000000000 R14: 000000000000072c R15: 1ffff11003b6d086
> FS:  000055555ee6f500(0000) GS:ffff888124cf8000(0000) knlGS:0000000000000=
000
> CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> CR2: 00007fb722fee000 CR3: 0000000075912000 CR4: 00000000003526f0
> ----------------
> Code disassembly (best guess):
>    0:   89 74 24 08             mov    %esi,0x8(%rsp)
>    4:   4c 8b 23                mov    (%rbx),%r12
>    7:   4c 89 e7                mov    %r12,%rdi
>    a:   e8 ef df 54 fd          call   0xfd54dffe
>    f:   49 83 c4 f0             add    $0xfffffffffffffff0,%r12
>   13:   45 31 f6                xor    %r14d,%r14d
>   16:   84 c0                   test   %al,%al
>   18:   4d 0f 45 f4             cmovne %r12,%r14
>   1c:   49 81 c6 2c 07 00 00    add    $0x72c,%r14
>   23:   4c 89 f0                mov    %r14,%rax
>   26:   48 c1 e8 03             shr    $0x3,%rax
> * 2a:   42 0f b6 04 28          movzbl (%rax,%r13,1),%eax <-- trapping in=
struction
>   2f:   84 c0                   test   %al,%al
>   31:   0f 85 16 04 00 00       jne    0x44d
>   37:   41 8b 2e                mov    (%r14),%ebp
>   3a:   31 ff                   xor    %edi,%edi
>   3c:   89 ee                   mov    %ebp,%esi
>   3e:   e8                      .byte 0xe8
>   3f:   cb                      lret
>
>
> ---
> This report is generated by a bot. It may contain errors.
> See https://goo.gl/tpsmEJ for more information about syzbot.
> syzbot engineers can be reached at syzkaller@googlegroups.com.
>
> syzbot will keep track of this issue. See:
> https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
>
> If the report is already addressed, let syzbot know by replying with:
> #syz fix: exact-commit-title
>
> If you want syzbot to run the reproducer, reply with:
> #syz test: git://repo/address.git branch-or-commit-hash
> If you attach or paste a git patch, syzbot will apply it before testing.
>
> If you want to overwrite report's subsystems, reply with:
> #syz set subsystems: new-subsystem
> (See the list of subsystem names on the web dashboard)
>
> If the report is a duplicate of another one, reply with:
> #syz dup: exact-subject-of-another-report
>
> If you want to undo deduplication, reply with:
> #syz undup
>
> --
> You received this message because you are subscribed to the Google Groups=
 "syzkaller-bugs" group.
> To unsubscribe from this group and stop receiving emails from it, send an=
 email to syzkaller-bugs+unsubscribe@googlegroups.com.
> To view this discussion visit https://groups.google.com/d/msgid/syzkaller=
-bugs/6a8818d8.ae6ddae5.3da009.0030.GAE%40google.com.

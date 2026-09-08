Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com [209.85.210.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96169519927
	for <linux-usb@vger.kernel.org>; Tue,  8 Sep 2026 09:26:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788859602; cv=pass; b=Z494LljOEikTKQyPW6FkR6Po4Cg20n8ha+e4d3Q29C/C01rxGVSbRy+rEU1YQExV3nznzbQJuenpAAQ68ppy+VU9KJDVkzego6sVKn2oWSJrhQ+BIJb+Hz+gcbNIF38ucgrBRgv7qIowKrLERAoy68X5vxOn83bmF6zBw9cA46g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788859602; c=relaxed/simple;
	bh=Ae7aE3w9ElpwDoyrrk/J8C8xHZYpzCWknGCyQsMf6Z8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LF+fek4rvnGHPUWm3zitsJN/sZJPXrj0sXydcUkCcYvrJscaTheK3U7460B9BeVYlLB/pRKZHbQX1wqEN20ZArAWCJjupuli0DAvzOQtsdrTykKSoo7tnLn03b0yPmA0l4cAQOUQ6MrTpide2KxNHm7WipX/Qj4q7st5TJdXzaU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Hp7UWU9a; arc=pass smtp.client-ip=209.85.210.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Hp7UWU9a"
Received: by mail-ot1-f45.google.com with SMTP id 46e09a7af769-7f6617c7536so1877642a34.1
        for <linux-usb@vger.kernel.org>; Tue, 08 Sep 2026 02:26:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788859598; cv=none;
        d=google.com; s=arc-20260327;
        b=SU/OR19S0iEHbZqrsNuz1VZ71xfB0H4jyhK8/VitH/6HtZX3gVefB28eqzfgjF+zjE
         bnleDui8753duuN9liwMn+1YI1/GTa2sXA+2Vk4I6ZtQBXgGdkwWDpQ7wb8VpCyDJwOh
         xK/xdr5bcERG5Yhyx7ObgBltTiIfVbEmN8ljjmawOAqJLrZ9R2FSOTk/AIwqvOzVKR0Q
         OUHbKVQ6iy83NxBOAphnFy7A6UVFAt3jrJyEHx6LXZyzkvDXvHFG9tI4HcUrlgXwrbkS
         KZoBrm5fyDvsgDwIBISOO4EKazZYx6bjMs9NlOZXkvU5KDMzYJPCC0c6jwUT7e174/4O
         sGOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=kgOik5y7LFj9ZQZ/pX5D2pVxvxaiKxgUAEkYOc+hyro=;
        fh=me9MBK5sUCa8P7kpubYjeGN8vpXlOutgjnGUIhVLD5Q=;
        b=KHWBUI2zTNK4zdxSWwbph4k0DSBpLoYl3Zl9NCe8U34JdNiePOksQiU4daaafTT+jM
         3rkEjwx+HNtz4ob5wbFx+4I22c/WRlQwDcA3AFCfMW0mtyod/DgC78xd43VuNLpCV75M
         wZKeyZB4dgayhxWaHQSlGrOl4/Gyn2HuZkkU/o4Rh7xmwkXZAU/qRpngrn4FvD1FClOh
         2Lg/f9VezEjGvYLjkE88YTkFgJh0WK3uTxxNO/aUjS65pD3FvoU7ujtk5iKmFDaBGMQ0
         C95GtyYney6D5lrV//GsCV94N5rRorT0lE+EfpvKi4dcuQKtilXiX/MKdK02LP3wyQ7o
         szCA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788859598; x=1789464398; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=kgOik5y7LFj9ZQZ/pX5D2pVxvxaiKxgUAEkYOc+hyro=;
        b=Hp7UWU9ai+mNarad7L5bX45s5KbWLkV6nu9dMtBeXOF0SAuHFcluSQYINzM0jMM+WL
         PszF2JklFZ/EIB68QeFkvlcZq5mlPz1FT3OLde8YH0R2I6Dg8V28U3/4ecOfcUl5vauX
         GXRKIBdC2ciRH/uDPWn/rH+3CiA2MCeKjxkJgyX8/V9Amyd7VOzJkUTjx7OpvC/j5kGK
         PXx0kaD/oDGEQ0i+sK9FFAwnUQkv7h7oUn37ZT4gFgpA6+AZyguQK3g1spxgIscnNyG6
         JBwTDc/hmZDk2GhyOu4svkwnuNKa/1Klooid5r6POidT67Y/TcqnviC3heEui2jA1yCC
         Mvcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788859598; x=1789464398;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kgOik5y7LFj9ZQZ/pX5D2pVxvxaiKxgUAEkYOc+hyro=;
        b=A72qsjbp5Ys+jixEhhjHeeu6IPsq66d5fZxd7fTroGN+I+bPSYCLBLKSNZIU3aytIr
         PB5uGmuAhx4VjI77m8QHkyG63mTKmxH2OPvN2150pelsfrcOteqAA2c2k016G3SsOq/e
         njvND5Cw9aLxfmIBxa9MXu8jsSGPyM5LJpRLk7adXj0irsSu6IxZnPaF78CYxa7WijQR
         024lhXGZ+rJG3h3N1jEQPkZTlO4b0jkxOetYXS/tgLupxAVCKNAlWjt0JpieYuZN+tGZ
         KWkz+Cj4WEufZcsd3I2NnNimjoqyj3/9Kb5N0NOSDYO5cV4UESjfi08fY5lYtLAPDcXw
         EJQQ==
X-Forwarded-Encrypted: i=1; AKwUvBztebA7WPFx7fAgMsYYqp7o2AjGEN00c+hK6djPgXY3BL25BQZB8ZaW3Js5kqSGY2cCHYqRQ2X3/SM=@vger.kernel.org
X-Gm-Message-State: AFuF++lSKfp69ZIRszK0e8BCL3XYip2qCzf1oQmZANyxuFvKuk5z6+lA
	loPedXM1EQXnEhMMzTLLwC3K6THhXoxMYb11mm4Rujzq5TqQ0826jB0DBDFFwDdjP9jufF1MBFD
	UBxqn4NBQJ2jyWUqISoRGCLEBNdWheRNiTZ1u53Hu
X-Gm-Gg: AYBFou0xHXoX2dpirdZIAYn+sNwb2n91h8/mIJuKwfbeqp+A1G499eh+E7c/1rGOcBq
	nVpncfLm5YDDbk4DGDbJRPSzWhpk+Ehr7F9IxTEedwlPgDkDfK0R4H4A1rLUAuk5EoAO6mcS++P
	OSwY0LgTyYvit1yPUhHLL4cnwdyeV/nhivfC/bojRRR1ubince14RFhRfM7KHy9Z29c8mhTyQk8
	aHqIKIQtHN8hgUK3bcZx/Os0I35dp93JGh1LwU4Hn75jUQCISzXul4//YmTFCW7BvWvIsdlSVQ2
	YKRHBZfWQBG5RWrpst2qNQYz0oU1VXuTACsbgQPDncDMiqkLU8Q1e1uw/bno0IkxkbgDnkFg8jU
	rYi43cSPspvNsRgUY62cBYxQ4w1G+RAf4TRnv8t/hha5NWp9zixqQBbs7TvBMxpaZu/2zdND8ci
	MaNywwlCTMeEGu
X-Received: by 2002:a05:6830:82e2:b0:7f4:f1f3:da3b with SMTP id
 46e09a7af769-7fa1ecfbafamr18532965a34.4.1788859597883; Tue, 08 Sep 2026
 02:26:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <6a88066b.ae6ddae5.3da009.002c.GAE@google.com>
In-Reply-To: <6a88066b.ae6ddae5.3da009.002c.GAE@google.com>
From: Aleksandr Nogikh <nogikh@google.com>
Date: Tue, 8 Sep 2026 11:26:26 +0200
X-Gm-Features: AcwNN1UJ7rcXYTWOFdSIvNgREHxYySn2E0N9ht-yK2EWq4ODdVPNz8tx5CcCE4E
Message-ID: <CANp29Y7rr-SLDmOZqUY843TCbLnZqXNhKF5ELZQXfNNMeeoDWw@mail.gmail.com>
Subject: Re: [syzbot] [usb?] BUG: unable to handle kernel NULL pointer
 dereference in usb_reinit
To: syzbot <syzbot+2ec7fc1793a63864d9d6@syzkaller.appspotmail.com>
Cc: linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

#syz invalid

See the discussion at
https://lore.kernel.org/all/6a88012e.dbb3a75c.13dd47.0007.GAE@google.com/T/

On Fri, Aug 21, 2026 at 10:03=E2=80=AFAM syzbot
<syzbot+2ec7fc1793a63864d9d6@syzkaller.appspotmail.com> wrote:
>
> Hello,
>
> syzbot found the following issue on:
>
> HEAD commit:    21d6ac051080 Merge branch 'for-next/core' into for-kernel=
ci
> git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux=
.git for-kernelci
> console output: https://syzkaller.appspot.com/x/log.txt?x=3D17603a7958000=
0
> kernel config:  https://syzkaller.appspot.com/x/.config?x=3Dd1128bc53f2ef=
7f3
> dashboard link: https://syzkaller.appspot.com/bug?extid=3D2ec7fc1793a6386=
4d9d6
> compiler:       Debian clang version 22.1.8 (++20260613092233+e80beda6e25=
5-1~exp1~20260613092250.77), Debian LLD 22.1.8
> userspace arch: arm64
> syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=3D1177ea25580=
000
> C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=3D10e03a7958000=
0
>
> Downloadable assets:
> disk image: https://storage.googleapis.com/syzbot-assets/88380e2ddcb9/dis=
k-21d6ac05.raw.xz
> vmlinux: https://storage.googleapis.com/syzbot-assets/5dba5c2896b7/vmlinu=
x-21d6ac05.xz
> kernel image: https://storage.googleapis.com/syzbot-assets/52ac739e37e0/I=
mage-21d6ac05.gz.xz
>
> IMPORTANT: if you fix the issue, please add the following tag to the comm=
it:
> Reported-by: syzbot+2ec7fc1793a63864d9d6@syzkaller.appspotmail.com
>
> EXT4-fs (nvme0n1p2): shut down requested (2)
> Aborting journal on device nvme0n1p2-8.
> Unable to handle kernel NULL poin
> Unable to handle kernel NULL pointer dereference at virtual address 00000=
00000000048
> Mem abort info:
>   ESR =3D 0x0000000096000006
>   EC =3D 0x25: DABT (current EL), IL =3D 32 bits
>   SET =3D 0, FnV =3D 0
>   EA =3D 0, S1PTW =3D 0
>   FSC =3D 0x06: level 2 translation fault
> Data abort info:
>   ISV =3D 0, ISS =3D 0x00000006, ISS2 =3D 0x00000000
>   CM =3D 0, WnR =3D 0, TnD =3D 0, TagAccess =3D 0
>   GCS =3D 0, Overlay =3D 0, DirtyBit =3D 0
> user pgtable: 4k pages, 48-bit VAs, pgdp=3D00000001166e6000
> [0000000000000048] pgd=3D080000011da38403, p4d=3D080000011da38403, pud=3D=
080000011da3a403, pmd=3D0000000000000000
> Internal error: Oops: 0000000096000006 [#1]  SMP
> Modules linked in:
> CPU: 0 UID: 0 PID: 4939 Comm: syz.0.17 Not tainted syzkaller #0 PREEMPT
> Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS G=
oogle 08/07/2026
> pstate: 83400005 (Nzcv daif +PAN -UAO +TCO +DIT -SSBS BTYPE=3D--)
> pc : __raw_readl arch/arm64/include/asm/io.h:84 [inline]
> pc : readl include/asm-generic/io.h:231 [inline]
> pc : usb_reinit_338x drivers/usb/gadget/udc/net2280.c:2243 [inline]
> pc : usb_reinit+0xbf4/0xfa0 drivers/usb/gadget/udc/net2280.c:2305
> lr : usb_reinit_338x drivers/usb/gadget/udc/net2280.c:2236 [inline]
> lr : usb_reinit+0xb6c/0xfa0 drivers/usb/gadget/udc/net2280.c:2305
> sp : ffff800096ac75a0
> x29: ffff800096ac75e0 x28: dfff800000000000 x27: ffff800087354e38
> x26: ffff800087354e80 x25: 0000000000000060 x24: 1fffe0001a4fd183
> x23: ffff0000d27e8c18 x22: 1fffe0001a4fd00b x21: 0000000000000011
> x20: ffff0000d27e8058 x19: ffff0000d27e8000 x18: 00000000ffffffff
> x17: ffff80008a7d6000 x16: 0000000000000004 x15: ffff80008a35fda0
> x14: ffff80008a5d5e28 x13: 0000000000000001 x12: 0000000000000000
> x11: 1fffe0001a4fd178 x10: 0000000000000003 x9 : 0000000000000000
> x8 : 0000000000000048 x7 : ffff800080aa1cb8 x6 : 0000000000000000
> x5 : 0000000000000000 x4 : 0000000000000001 x3 : ffff8000835bf6bc
> x2 : 0000000000000000 x1 : ffff0000cd3d1d40 x0 : 0000000000000000
> Call trace:
>  __raw_readl arch/arm64/include/asm/io.h:84 [inline] (P)
>  readl include/asm-generic/io.h:231 [inline] (P)
>  usb_reinit_338x drivers/usb/gadget/udc/net2280.c:2243 [inline] (P)
>  usb_reinit+0xbf4/0xfa0 drivers/usb/gadget/udc/net2280.c:2305 (P)
>  net2280_probe+0x5f4/0xef0 drivers/usb/gadget/udc/net2280.c:3712
>  local_pci_probe+0xc8/0x158 drivers/pci/pci-driver.c:332
>  pci_call_probe drivers/pci/pci-driver.c:394 [inline]
>  __pci_device_probe drivers/pci/pci-driver.c:455 [inline]
>  pci_device_probe+0x460/0x8d4 drivers/pci/pci-driver.c:489
>  call_driver_probe drivers/base/dd.c:-1 [inline]
>  really_probe+0x29c/0x800 drivers/base/dd.c:706
>  __driver_probe_device+0x1e0/0x350 drivers/base/dd.c:868
>  device_driver_attach+0x58/0xac drivers/base/dd.c:1203
>  bind_store+0xf4/0x14c drivers/base/bus.c:267
>  drv_attr_store+0x80/0xa4 drivers/base/bus.c:125
>  sysfs_kf_write+0xe0/0x108 fs/sysfs/file.c:145
>  kernfs_fop_write_iter+0x260/0x3b8 fs/kernfs/file.c:345
>  new_sync_write fs/read_write.c:595 [inline]
>  vfs_write+0x51c/0xa0c fs/read_write.c:687
>  ksys_write+0x12c/0x228 fs/read_write.c:739
>  __do_sys_write fs/read_write.c:750 [inline]
>  __se_sys_write fs/read_write.c:747 [inline]
>  __arm64_sys_write+0x84/0x98 fs/read_write.c:747
>  __invoke_syscall arch/arm64/kernel/syscall.c:35 [inline]
>  invoke_syscall+0x98/0x244 arch/arm64/kernel/syscall.c:49
>  el0_svc_common+0xec/0x23c arch/arm64/kernel/syscall.c:121
>  do_el0_svc+0x4c/0x5c arch/arm64/kernel/syscall.c:140
>  el0_svc+0x64/0x260 arch/arm64/kernel/entry-common.c:758
>  el0t_64_sync_handler+0x44/0x104 arch/arm64/kernel/entry-common.c:777
>  el0t_64_sync+0x198/0x19c arch/arm64/kernel/entry.S:590
> Code: 9757676c f94002e8 91012108 d503201f (b9400115)
> ---[ end trace 0000000000000000 ]---
> ----------------
> Code disassembly (best guess):
>    0:   9757676c        bl      0xfffffffffd5d9db0
>    4:   f94002e8        ldr     x8, [x23]
>    8:   91012108        add     x8, x8, #0x48
>    c:   d503201f        nop
> * 10:   b9400115        ldr     w21, [x8] <-- trapping instruction
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
-bugs/6a88066b.ae6ddae5.3da009.002c.GAE%40google.com.
